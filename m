Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB056CE93
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 12:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3FA12B14B;
	Sun, 10 Jul 2022 10:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4EA12B14A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=M4RlWqWDuwk9sM7sFEHMUHw8Zpra2FhTnGoxysac9sY=;
 b=hABdA3ZhR06yc98FssFHU1X0ZkbTpvXX6hqaHtHFeVogLG4WE6sMA/Hv2Dh1xm0qWYa8VEziP9mts
 GNeUetPzQ9i5DhVxMRQ+VY0TK5gTJRnspkwcAegcB7BrQXPdaDIAIIZwrCjxb8chDbPFLNJ1Jw8gyI
 K4Gb4bX49rL/EHYqd2M+wzt0t0hEYTAtG3ehLsgN4nZnstJR5N6x68TzwpTske1BCfyg7InIWfGNco
 i9NtedSHtOK7Fao2iPk1U1do8TFeospm318FRPskVVY9D6yIgRDmEe2xYOdeh7c6Qm8aZWRetiCr+h
 LxVcqsMKyKs1acsSt5yi93umnwTmNvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=M4RlWqWDuwk9sM7sFEHMUHw8Zpra2FhTnGoxysac9sY=;
 b=A6oeZR9IntDl+h8NzJg830dUW5oG3yRlE0h1L4Smuz9t9ioUF0piHD9V0OY5MVYQwjBu0rNRzS0cy
 c8nCSGFAg==
X-HalOne-Cookie: ac788cc6930858b71aaa5e38d224e14d6c86ddb4
X-HalOne-ID: 7aa2a445-003b-11ed-a917-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7aa2a445-003b-11ed-a917-d0431ea8a290;
 Sun, 10 Jul 2022 10:31:38 +0000 (UTC)
Date: Sun, 10 Jul 2022 12:31:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm v2 01/10] util: Improve SMPTE color LUT accuracy
Message-ID: <YsqqiMAikaBP/3vt@ravnborg.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
 <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Fri, Jul 08, 2022 at 08:21:31PM +0200, Geert Uytterhoeven wrote:
> Fill in the LSB when converting color components from 8-bit to 16-bit.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - New.
> ---
>  tests/util/pattern.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 178aee8341a38920..3753ebc1eeae6c9a 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -646,9 +646,9 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
>  	memset(lut, 0, size * sizeof(struct drm_color_lut));
>  
>  #define FILL_COLOR(idx, r, g, b) \
> -	lut[idx].red = (r) << 8; \
> -	lut[idx].green = (g) << 8; \
> -	lut[idx].blue = (b) << 8
> +	lut[idx].red = (r) * 0x101; \

	(lut[idx].red = (r) << 8) | 1;

had IMO been easier to read.

Patch is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

for both ways to do it.


> +	lut[idx].green = (g) * 0x101; \
> +	lut[idx].blue = (b) * 0x101
>  
>  	FILL_COLOR( 0, 192, 192, 192);	/* grey */
>  	FILL_COLOR( 1, 192, 192, 0  );	/* yellow */
> -- 
> 2.25.1
