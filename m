Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE82C1801
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B566E0DD;
	Mon, 23 Nov 2020 21:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B456E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:59:08 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 203A920060;
 Mon, 23 Nov 2020 22:59:06 +0100 (CET)
Date: Mon, 23 Nov 2020 22:59:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/mcde: Fix RGB/BGR bug
Message-ID: <20201123215904.GA676783@ravnborg.org>
References: <20201117175413.869871-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117175413.869871-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8
 a=7gkXJVJtAAAA:8 a=sngfz7gVtQOnW0fYQYUA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=A2jcf3dkIZPIRbEE90CI:22
 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Stephan Gerhold <stephan@gerhold.net>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Tue, Nov 17, 2020 at 06:54:13PM +0100, Linus Walleij wrote:
> I was confused when the graphics came out with blue
> penguins on the DPI panel.
> 
> It turns out that the so-called "packed RGB666" mode
> on the DSI formatter is incorrect: this mode is the
> actual RGB888 mode, and the mode called RGB888 is
> BGR888.
> 
> The claims that the MCDE had inverse RGB/BGR buffer
> formats was wrong, so correct this and the buggy
> register and everything is much more consistent, and
> graphics look good on all targets, both DPI and
> DSI.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks fine and seems to do what you write it should do.

I do not understand why this part:
>       case DRM_FORMAT_BGR888:
>               val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
>                       MCDE_EXTSRCXCONF_BPP_SHIFT;
> +             val |= MCDE_EXTSRCXCONF_BGR;
>               break;

does not use MCDE_EXTSRCXCONF_BPP_BGR888
But maybe there is no counterpart to MCDE_DSICONF0_PACKING_BGR888?

Assuming all is good despite my confusion:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
