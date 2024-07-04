Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3E926FBB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 08:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292C10E32A;
	Thu,  4 Jul 2024 06:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0Hl6A63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2888210E32A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 06:40:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E639CE32FD;
 Thu,  4 Jul 2024 06:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5402BC3277B;
 Thu,  4 Jul 2024 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720075203;
 bh=lKbMaNJkLUVocG1e6FxVa282qh0hksbV3LzEAbQM4hM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0Hl6A63TDTsrQG3QlAxNO5fqljBBOKeD9DwBBZKxz+JcqTNicDzE6Toc8fJFIMmJ
 Yxfa7CxDUAnvbodwQAVh8W98UDtzF9kvNwTvfEaN5YsSGoVIYHkrPfzDH7R+TYj8Lr
 55Kmj+uzWfzRiy+tqTijjTqCqN4IDix+xuS0pwTk=
Date: Thu, 4 Jul 2024 08:40:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <2024070427-squash-antiviral-8c81@gregkh>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
 <2024070353-giggly-stardom-7b6d@gregkh>
 <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a184cb-46d5-49cc-ad42-3d5d7828f06b@quicinc.com>
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

On Thu, Jul 04, 2024 at 11:47:22AM +0530, Ekansh Gupta wrote:
> 
> 
> On 7/3/2024 4:09 PM, Greg KH wrote:
> > On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
> >> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
> >>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> >>  	spinlock_t lock;
> >>  	struct idr ctx_idr;
> >> +	struct ida dsp_pgid_ida;
> > You have an idr and an ida?  Why two different types for the same
> > driver?
> Using ida for this because for this I just need to allocate and manage unique IDs
> without any associated data. So this looks more space efficient that idr.
> Should I keep it uniform for a driver?

Be consistant, it will make your life easier over the next 10+ years
that you have to maintain it.

> >>  	struct list_head users;
> >>  	struct kref refcount;
> >>  	/* Flag if dsp attributes are cached */
> >> @@ -299,6 +304,7 @@ struct fastrpc_user {
> >>  	struct fastrpc_buf *init_mem;
> >>  
> >>  	int tgid;
> >> +	int dsp_pgid;
> > Are you sure this fits in an int?
> I think this should be fine for IDs in rage of 1000-1064.

Where is that range specified anywhere?  I don't see it documented here
for us to know that :(

And if that's all you care about, then use a u16.

thanks,

greg k-h
