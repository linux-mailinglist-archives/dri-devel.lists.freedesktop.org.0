Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26C2D319D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 19:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2D66E989;
	Tue,  8 Dec 2020 18:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255166E989
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:02:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4EDE380670;
 Tue,  8 Dec 2020 19:02:30 +0100 (CET)
Date: Tue, 8 Dec 2020 19:02:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 0/13] drivers/video: W=1 warning fixes
Message-ID: <20201208180123.GA76613@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=bexM8UI-dkrNMHotJ4MA:9 a=CjuIK1q_8ugA:10
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
Cc: Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 06, 2020 at 08:02:34PM +0100, Sam Ravnborg wrote:
> Following the great work of Lee Jones in other subsystems
> here is a set of patches that address all remaining W=1
> warnings in drivers/video/.
> Lee Jones already fixed all warnings in video/backlight/ so
> this is mostly fbdev related fixes.
> 
> The general approach used were:
> - Fix kernel-doc, this is often very trivial
> - Drop unused local variables
> 
> Build tested on a set of architectures with various configs.
> 
> The patches do not depend on each other and fixes for one driver
> are kept in a single patch.
> 
> v2:
>   - Updated subject of the patches to tell what was fixed (Lee)
>   - Fixed build error in one patch (kernel test robot)
>   - A few editorials updates to the changelog messages
> 
> v3:
>   - Applied patches that was acked - thanks Thomas!
>   - Updated patches after feedback from Randy and Thomas
>   - Added several new patches to cover warnings that triggers
>     with other architectures than the one I used for v1 + v2
>   - Included one sh specific fix that handle a corner-case,
>     let's see what the sh people say to that
>   - One fix to previous set of patches to fix an issue
>     reported by Coverity (By Colin)
> 
> 	Sam
> 
> Sam Ravnborg (13):
>       video: fbdev: hgafb: Fix kernel-doc warnings
>       video: fbdev: core: Fix kernel-doc warnings in fbmon + fb_notify
>       video: fbdev: omapfb: Fix set but not used warnings in hdmi*_core
>       video: fbdev: uvesafb: Fix set but not used warning
>       sh: Fix set but not used warnings with !CONFIG_MMU
>       video: fbdev: sparc drivers: fix kernel-doc warnings for blank_mode
>       video: fbdev: mmp: Fix kernel-doc warning for lcd_spi_write
>       video: fbdev: wmt_ge_rops: Fix function not declared warnings
>       video: fbdev: goldfishfb: Fix defined but not used warning
>       video: fbdev: gbefb: Fix set but not used warning
>       video: fbdev: efifb: Fix set but not used warning for screen_pitch
>       video: fbdev: controlfb: Fix set but not used warnings
>       video: fbdev: sis: Drop useless call to SiS_GetResInfo()

Thanks for the feedback!
All applied to drm-misc-next except the sh patch.

The sh patch will be resend to the sh people as it should go in via the
sh tree.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
