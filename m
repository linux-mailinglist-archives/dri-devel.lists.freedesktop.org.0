Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD5693944
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C5610E411;
	Sun, 12 Feb 2023 18:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1125 seconds by postgrey-1.36 at gabe;
 Sun, 12 Feb 2023 17:12:27 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C754710E1DF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=e3QIGkPYOypBTQQmE9saiNs12hwhbdowV8aUrohay2Q=; b=kG+y7CGc+2oevUYz8TVScNnTyS
 IDEfP0PJeHpnLR0zBg2rbd2i3NeHUSI02DSNjCpDQAXqFEnlLas9Kw86v0MvXhNypk2/BoDFCiW7W
 guE3qmjD0z0RTmyOk6n70oPNRXxlJS3rSpfZfMbHtix0kiLqM+YiOoLokI2t588dKM/7S733xNQa2
 lv/W0P9mdBRFAZkfcIl5CjYjMm0yPRPzV3yTRumKCxEZra8fll+w0denCUFWT5f7VkjWehNRjFN39
 jLFKPr/1bTRAFAEqfrE6Cod3xovw/n0TbSWA02GdmarsHmYCSAe6x1OsxlVAag8Jdx6kKObUnQ73s
 NUdy41Ew==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56]
 helo=[192.168.1.80])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pRFbI-004zkP-Ng; Sun, 12 Feb 2023 16:53:17 +0000
Message-ID: <06917dd0-c4f1-c80a-16a7-f2baac47027d@infradead.org>
Date: Sun, 12 Feb 2023 08:53:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with fb_get_option()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230209135509.7786-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 2/9/23 05:55, Thomas Zimmermann wrote:
> Get the kernel's global video= parameter with fb_get_option(). Done
> to unexport the internal fbdev state fb_mode_config. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/ps3/ps3av.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

I wanted to test these changes on the PS3, but got this
error when trying to apply this patch set to Linux-6.2-rc7:

  Applying: fbdev: Handle video= parameter in video/cmdline.c
  error: patch failed: drivers/gpu/drm/Kconfig:10
  error: drivers/gpu/drm/Kconfig: patch does not apply

Is there a Linux kernel revision that these will apply to,
or is there a git repository I can pull them from?

-Geoff
