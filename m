Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525F91C0C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780110EC5F;
	Fri, 28 Jun 2024 14:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jtF5JXf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DDB10E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 14:21:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DABDFCE3BA6;
 Fri, 28 Jun 2024 14:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00C3C116B1;
 Fri, 28 Jun 2024 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1719584495;
 bh=Q2TVU0ghZYFPna87bELQcodlt7oMAF8q8qvMmGtmQTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jtF5JXf9FlcICSN6dyPv0qF5arcbNQ5/TuvTR5NDxC1INy7boCCwhQvn+6LAxGsq1
 O/k1ZXs4f9SbcvgJWjFRia62dcLOYVW5MAh4iiKPvqog6J0rG6D7equylpAj/FZKZ0
 TDK54lBypPUn3biEnt4rbEcWa7bFxMBlRWniP+JU=
Date: Fri, 28 Jun 2024 16:21:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <2024062849-brunt-humvee-d338@gregkh>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >
> > On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>> For user PD initialization, initmem is allocated and sent to DSP for
> >>> initial memory requirements like shell loading. This size is passed
> >>> by user space and is checked against a max size. For unsigned PD
> >>> offloading, more than 2MB size could be passed by user which would
> >>> result in PD initialization failure. Remove the user PD initmem size
> >>> check and allow buffer allocation for user passed size. Any additional
> >>> memory sent to DSP during PD init is used as the PD heap.
> >> Would it allow malicious userspace to allocate big enough buffers and
> >> reduce the amount of memory available to the system? To other DSP
> >> programs?
> > The allocation here is happening from SMMU context bank which is uniquely assigned
> > to processes going to DSP. As per my understanding process can allocate maximum
> > 4GB of memory from the context bank and the memory availability will be taken care
> > by kernel memory management. Please correct me if my understanding is incorrect.
> Just wanted to add 1 question here:
> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> allocated huge memory?

No, because any userspace program that takes up too much memory will be
killed by the kernel.

You can not have userspace tell the kernel to allocate 100Gb of memory,
as then the kernel is the one that just took it all up, and then
userspace applications will start to be killed off.

You MUST bounds check your userspace-supplied memory requests.  Remember
the 4 words of kernel development:

	All input is evil.

thanks,

greg k-h
