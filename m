Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383B6EA922
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1168010E2D7;
	Fri, 21 Apr 2023 11:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB010E2D7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:32:28 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1ppp05-000755-84; Fri, 21 Apr 2023 13:32:25 +0200
Message-ID: <c4c09a67-6897-751c-c091-6e33f48542cc@leemhuis.info>
Date: Fri, 21 Apr 2023 13:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
Content-Language: en-US, de-DE
To: Pierre Asselin <pa@panix.com>, dri-devel@lists.freedesktop.org
References: <20230420155705.21463-1-pa@panix.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230420155705.21463-1-pa@panix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1682076749;
 938652e7; 
X-HE-SMSGID: 1ppp05-000755-84
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.04.23 17:57, Pierre Asselin wrote:
> Some legacy BIOSes report no reserved bits in their 32-bit rgb mode,
> breaking the calculation of bits_per_pixel in commit f35cd3fa7729
> ("firmware/sysfb: Fix EFI/VESA format selection").  However they report
> lfb_depth correctly for those modes.  Keep the computation but
> set bits_per_pixel to lfb_depth if the latter is larger.
> 
> v2 fixes the warnings from a max3() macro with arguments of different
> types;  split the bits_per_pixel assignment to avoid uglyfing the code
> with too many casts.
> 
> v3 fixes space and formatting blips pointed out by Javier, and change
> the bit_per_pixel assignment back to a single statement using two casts.
> 
> Link: https://lore.kernel.org/r/4Psm6B6Lqkz1QXM@panix3.panix.com
> Link: https://lore.kernel.org/r/20230412150225.3757223-1-javierm@redhat.com
> Link: https://lore.kernel.org/dri-devel/20230418183325.2327-1-pa@panix.com/T/#u
> Link: https://lore.kernel.org/dri-devel/20230419044834.10816-1-pa@panix.com/T/#u
> Fixes: f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
> Signed-off-by: Pierre Asselin <pa@panix.com>

Linus might release the final this weekend and this is among the last
few 6.3 regressions I track. Hence please allow me to ask:

Pierre, Tomas, Javier, et. al: how many "legacy BIOSes" do we suspect
are affected by this? So many that it might be worth delaying the
release by one week? And in case everybody involved might agree that
this patch is ready by today or tomorrow: might it be worth asking Linus
to merge this patch directly[1]?

[FWIW, I highly suspect the answer to the last two questions is "no,
that's definitely not worth is", just wanted to confirm]

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] yes, that's a thing we do:
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
