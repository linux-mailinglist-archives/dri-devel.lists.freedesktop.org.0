Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE64B23F7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C589210EABA;
	Fri, 11 Feb 2022 11:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5365E10EA70;
 Fri, 11 Feb 2022 11:09:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7418761702;
 Fri, 11 Feb 2022 11:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1D5C340E9;
 Fri, 11 Feb 2022 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644577781;
 bh=fnV1JTSj7tqGi4Eic+pZ2ccHQtO2wG65Y0Fp6p/nPm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wLgUCTd9qga4DEj1Uyx+cjGgDG2HkGvRysMby6Jyn8DHEIJQrsFW7gShEMemqd+IE
 jzwPBAbT/CS2LEwLfdN6ZDZ8pZwDOSps+yW/8jaiZq3UUcNyHgHsWAW28C0iD/1UHb
 Z8tr1+ULXhHqsdwEhUBtHG56v/NpTDPwDRIFXvJ0=
Date: Fri, 11 Feb 2022 12:09:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Message-ID: <YgZD8vPqB7ISpRpZ@kroah.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 11:44:32AM -0800, Abhinav Kumar wrote:
> There are cases where depending on the size of the devcoredump and the speed
> at which the usermode reads the dump, it can take longer than the current 5 mins
> timeout.
> 
> This can lead to incomplete dumps as the device is deleted once the timeout expires.
> 
> One example is below where it took 6 mins for the devcoredump to be completely read.
> 
> 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
> 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node

What makes this so slow?  Reading from the kernel shouldn't be the
limit, is it where the data is being sent to?

> Increase the timeout to 10 mins to accommodate system delays and large coredump
> sizes.

Nit, please wrap your changelog texts at 72 columns.

And what is "large"?

thanks,

greg k-h
