Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BD138267
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 17:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA1B6E228;
	Sat, 11 Jan 2020 16:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B553F6E228
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 16:29:59 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DF0F2072E;
 Sat, 11 Jan 2020 16:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578760198;
 bh=/wlKCThrzNJPzZekL3yESpjJlP5RxW4MwHyG6+SnY1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fmhf/bzIdrvM3mWAMr0lt5BRE0JT4yQNn34Yqr5VNyOHa0cHOHoClVhmddExtTFak
 0Vuq/UahvfhT8PUf50VWKT5hIY6tjvsbEbzM5iglCRVDxF3BK7L3XfDToEyurfPNyM
 B0yF3W4MCZSgbjR5a7DEL0XZ/h9Vdgb6Yz1/n9UI=
Date: Sat, 11 Jan 2020 11:29:57 -0500
From: Sasha Levin <sashal@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH][RESEND] video: hyperv_fb: Fix hibernation for the
 deferred IO feature
Message-ID: <20200111162957.GK1706@sasha-vm>
References: <1578350511-130150-1-git-send-email-decui@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578350511-130150-1-git-send-email-decui@microsoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com,
 b.zolnierkie@samsung.com, haiyangz@microsoft.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 weh@microsoft.com, kys@microsoft.com, Alexander.Levin@microsoft.co,
 mikelley@microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 06, 2020 at 02:41:51PM -0800, Dexuan Cui wrote:
>fb_deferred_io_work() can access the vmbus ringbuffer by calling
>fbdefio->deferred_io() -> synthvid_deferred_io() -> synthvid_update().
>
>Because the vmbus ringbuffer is inaccessible between hvfb_suspend()
>and hvfb_resume(), we must cancel info->deferred_work before calling
>vmbus_close() and then reschedule it after we reopen the channel
>in hvfb_resume().
>
>Fixes: a4ddb11d297e ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
>Fixes: 824946a8b6fb ("video: hyperv_fb: Add the support of hibernation")
>Signed-off-by: Dexuan Cui <decui@microsoft.com>
>Reviewed-by: Wei Hu <weh@microsoft.com>
>---
>
>This is a RESEND of https://lkml.org/lkml/2019/11/20/73 .
>
>The only change is the addition of Wei's Review-ed-by.
>
>Please review.
>
>If it looks good, Sasha Levin, can you please pick it up via the
>hyperv/linux.git tree, as you did last time for this driver?

Like with the input driver, if the relevant maintainers here are okay
with this type of patches going through the hyperv tree I'll be happy to
do it, otherwise I need an explicit ack from them on this patch.

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
