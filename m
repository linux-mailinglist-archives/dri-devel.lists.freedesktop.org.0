Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FA5608DF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DAA10E544;
	Wed, 29 Jun 2022 18:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7023C10E544
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:17:07 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id p6H42700X4C55Sk066H48z; Wed, 29 Jun 2022 20:17:05 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o6cFL-001LDH-W6; Wed, 29 Jun 2022 20:17:04 +0200
Date: Wed, 29 Jun 2022 20:17:03 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Fix out-of-bounds access
In-Reply-To: <20220621104617.8817-1-tzimmermann@suse.de>
Message-ID: <alpine.DEB.2.22.394.2206292006230.319606@ramsan.of.borg>
References: <20220621104617.8817-1-tzimmermann@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1133880722-1656526623=:319606"
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
Cc: airlied@linux.ie, =?ISO-8859-15?Q?Nuno_Gon=E7alves?= <nunojpg@gmail.com>,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1133880722-1656526623=:319606
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

 	Hi Thomas,

On Tue, 21 Jun 2022, Thomas Zimmermann wrote:
> Clip memory range to screen-buffer size to avoid out-of-bounds access
> in fbdev deferred I/O's damage handling.
>
> Fbdev's deferred I/O can only track pages. From the range of pages, the
> damage handler computes the clipping rectangle for the display update.
> If the fbdev screen buffer ends near the beginning of a page, that page
> could contain more scanlines. The damage handler would then track these
> non-existing scanlines as dirty and provoke an out-of-bounds access
> during the screen update. Hence, clip the maximum memory range to the
> size of the screen buffer.
>
> While at it, rename the variables min/max to min_off/max_off in
> drm_fb_helper_deferred_io(). This avoids confusion with the macros of
> the same name.
>
> Reported-by: Nuno Gonçalves <nunojpg@gmail.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Nuno Gonçalves <nunojpg@gmail.com>
> Fixes: 67b723f5b742 ("drm/fb-helper: Calculate damaged area in separate helper")

Thanks for your patch, which is now commit ae25885bdf59fde4
("drm/fb-helper: Fix out-of-bounds access") in drm-misc/for-linux-next.

I had seen the crash before, but thought it was a bug in my wip
atari-drm driver.  When diving deeper today, and consequently looking
for recent changes to the damage helper, I found this commit in
linux-next.

With your patch instead of my own workaround I used this morning, [1]
still works fine, so:
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>.
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>.

[1] [PATCH] drm/fb-helper: Remove helpers to change frame buffer config
     https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k.org

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-1133880722-1656526623=:319606--
