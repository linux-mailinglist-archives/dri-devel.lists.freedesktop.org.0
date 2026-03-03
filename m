Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OUHGd/wpmmSagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:31:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368141F182A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F4C10E847;
	Tue,  3 Mar 2026 14:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="rScFUBQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACCE10E828
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772548305; x=1773153105; i=deller@gmx.de;
 bh=B70SOfBW8X4KJa8gKZtoxz16YoSgLXF8Oh4612kJ7Rs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rScFUBQvjRlM8AN1ngDjrBzwigIHiURVSilRQn6sKqLgaGgiOFSGKh++UFKxkugH
 t1zH1wPKyyLrTSQ2rf/sFIVJ8n/G16Z4BjESL8GyEGUzkLdoLxRSF6Fty+GDOBHXk
 bfFu651Mw72Kph7SZ36Ps9W0VFah1Q8P70n/njs2br2QUeX5JyDl3sm/gnLH6fKne
 pcGwCZHUoQeg1qwYTSchXMySYK/c8KEFL0tvLYqqBqSozRqnrzyuD1jAKogFG6uB2
 mT7QPYxYB7bXKwKG/R18arWdim9RuA7OI7hu/mPB1z7T3hBvrmQmJcEfx/Dy+Y8VG
 UfXstwrf56iG634+rA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9G2-1vI06J0tBm-00cvis; Tue, 03
 Mar 2026 15:31:45 +0100
Message-ID: <7e17139f-47bf-4fec-b13f-d4a1b3a7a62d@gmx.de>
Date: Tue, 3 Mar 2026 15:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] vt: Store font in struct vc_font
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-4-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260302141255.518657-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v5ZtyHuUfC57L6fLXcgS8ULnuYJsstjsUcfVQpGe39k8jw11iTJ
 IocLBlS60E+fPZGfyou+2WyGYeXkMWlpPNELvZBoFJ+CIGf/DLo/rAfYI+c/16SlgCCO2m7
 zKbO4CkRbZe7wQaFC9JMk+j8535qYtQV+YnUwW4/3C5Ga4R5JcEePzusk6kO6XAh9Ha8pT1
 J67SBCed6wajnSFSLdIGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Xs3aYNxB0ac=;Sco3P5fZfC1IHtjhg7eG0OFQJ8f
 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
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
X-Rspamd-Queue-Id: 368141F182A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

On 3/2/26 15:08, Thomas Zimmermann wrote:
> Replace struct console_font with struct vc_font for the type of the
> vc_font field of struct vc_data. Struct console_font is UAPI, which
> prevents further changes. Hence a new data type is required.
>=20
> Struct console_font has a documented vertical pitch of 32 bytes. This
> is not the case after the font data has been loaded into the kernel.
> Changing the type of vc_font addresses this inconsistency.
>=20
> The font data is now declared as constant, as it might come from the
> kernel's read-only section. There's some fallout throughout the console
> code where non-const variables refer to it. Fix them. A later update
> will declare the font data to a dedicated data type.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/core/bitblit.c | 11 +++++------
>   drivers/video/fbdev/core/fbcon.c   |  4 ++--
>   drivers/video/fbdev/core/fbcon.h   |  4 ++--
>   include/linux/console_struct.h     | 29 +++++++++++++++++++++++++++--
>   4 files changed, 36 insertions(+), 12 deletions(-)
>=20
....
> diff --git a/include/linux/console_struct.h b/include/linux/console_stru=
ct.h
> index ebdb9750d348..7fdcae6ed49c 100644
> --- a/include/linux/console_struct.h
> +++ b/include/linux/console_struct.h
> @@ -13,8 +13,9 @@
>   #ifndef _LINUX_CONSOLE_STRUCT_H
>   #define _LINUX_CONSOLE_STRUCT_H
>  =20
> -#include <linux/wait.h>
> +#include <linux/math.h>
>   #include <linux/vt.h>
> +#include <linux/wait.h>
>   #include <linux/workqueue.h>
>  =20
>   struct uni_pagedict;
> @@ -58,6 +59,30 @@ struct vc_state {
>   	bool		reverse;
>   };
>  =20
> +/**
> + * struct vc_font - Describes a font
> + * @width: The width of a single glyph in bits
> + * @height: The height of a single glyph in scanlines
> + * @charcount: The number of glyphs in the font
> + * @data: The raw font data
> + *
> + * Font data is organized as an array of glyphs. Each glyph is a bitmap=
 with
> + * set bits indicating the foreground color. Unset bits indicate backgr=
ound
> + * color. The fields @width and @height store a single glyph's number o=
f
> + * horizontal bits and vertical scanlines. If width is not a multiple o=
f 8,
> + * there are trailing bits to fill up the byte. These bits should not b=
e drawn.
> + *
> + * The field @data points to the first glphy's first byte. The value @c=
harcount
> + * gives the number of glyphs in the font. There are no empty scanlines=
 between
> + * two adjacent glyphs.
> + */
> +struct vc_font {
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int charcount;

I wonder if we shouldn't declare width and height as "u8" or "short int" t=
ype?
And charcount as u16 or "short int" ?
Makes later calculations shorter & easier.

Helge
