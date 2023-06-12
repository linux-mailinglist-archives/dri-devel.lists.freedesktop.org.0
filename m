Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D851272CA84
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE6710E09B;
	Mon, 12 Jun 2023 15:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F3610E09B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7bu+0WMycvl+xw/+UyWKXzBeoyi+ITWwP8OmM2m6w3U=;
 b=J+MAAjazh0cqG8FTxXFAYorKfEJAfsolz5nI559Jg1dYWl+zBGxsqkJ6L6BZ/ycEKGG0o5rYcqZCD
 kcppxqP96zS8pZRaW0AlxvZQddFQJ4FGG8xh7nLabP5jmbEiTmFPIxHZwE66kmSW9gc21kidZ3Sw6Q
 kSVUE8Jr9ytkg1ujf3zUjU3RDlwieTz5o2Yaq49RAUoHl1oR4/a72L8kbTgORoVdZxXVv+FHfJyCyU
 HBI5Dd92Attjse05uyKed0VvezEULHVIIhucSdj9Ses6OcByYncWv07UpbFe13TuZlfWCmJSGiQHmp
 Cu6rXjFgT0n7g5Qrp36lNE7Xhnc7BgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7bu+0WMycvl+xw/+UyWKXzBeoyi+ITWwP8OmM2m6w3U=;
 b=IC1PPDdgBDKI7zq8IJwwQGlbYUO3D4efEtYXAJFdx3LdaekNytlsyGPtFvhCi4WXxtdmi0mW6gEQ9
 tHIWDuxDw==
X-HalOne-ID: ef9b6055-0937-11ee-91ee-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id ef9b6055-0937-11ee-91ee-b90637070a9d;
 Mon, 12 Jun 2023 15:43:56 +0000 (UTC)
Date: Mon, 12 Jun 2023 17:43:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 34/38] fbdev/core: Add fb_device_{create,destroy}()
Message-ID: <20230612154354.GA1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-35-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-35-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, michael.j.ruhl@intel.com,
 linux-omap@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:08:12PM +0200, Thomas Zimmermann wrote:
> Move the logic to create and destroy fbdev devices into the new
> helpers fb_device_create() and fb_device_destroy().
> 
> There was a call to fb_cleanup_device() in do_unregister_framebuffer()
> that was too late. The device had already been removed at this point.
> Move the call into fb_device_destroy().
> 
> Declare the helpers in the new internal header file  fb_internal.h, as
> they are only used within the fbdev core module.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
