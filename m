Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULVgIdPdrmm/JQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:48:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FA23AD8F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1493B10E512;
	Mon,  9 Mar 2026 14:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="kUlivjJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0022310E512
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1773067725; x=1773672525; i=deller@gmx.de;
 bh=A63ZvSBxO/GDoAZedfYLHSEU40rKdo4lIlgKNVgVAOY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kUlivjJ0Y5+sBlLaJ9Yn9uGYA6GJ8dXqaqDwPK9PHSlf5F3ZaPtbEA2EzrdtuLlM
 yW3jp05Ag4uCzKHem++4JOmx7l1hz2ICPMGN2K9z07hKBNAC+iu7McSYf+gqrQIwR
 GXQs5LfwxdsvWV6nHIfF3w4rIS9zQ8ubBMAkv5PNlznI+NfISm841aYVVH1rCMI/Z
 rFmOw2d7VVUSnDiCpZf+nC0hGgefIkiQOUlvy1PDpeHtpTaNmOT0zlrayPEYk0OlJ
 UQO/Lz2+qk2iZg3bn+Iwihw7QWx+SSnEICqGURnx4Zf+H2aJciOF+ixBsMLkgyAtv
 6+mSOI/lGUexSjGOvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1vXf4c17v5-00yhdN; Mon, 09
 Mar 2026 15:48:45 +0100
Message-ID: <a90221f6-4c5f-4223-a594-c2d67f0524b8@gmx.de>
Date: Mon, 9 Mar 2026 15:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] vc,fbcon,fonts: Proper handling of font data
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260309141723.137364-1-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260309141723.137364-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rqbX5OIrJRtOzRszwI9kd3b9pq7dhBgUtL1UjM1dg8tscfcvfeQ
 H+X9/b8oLv4VQPQrbEH8fLwx/6iifTOKxrcp/vWhRwB6DQi9ZOPPjuJcOe6pqJHLrW0c/rp
 Hbmxi8EtjvupPHkM2kGyj/HxCggyDOBx5yx+kj07ItHgk/e4x7UFHSuZZIgeyUMZOM/sp3I
 ZCuTxyNeklg0kPovM+f3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mIyUTP7kSoM=;Os3KftWKb7vhfNZaMDXQaoNuJAF
 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
 X6qXq9ImMlbv7Dp/QJOh/nQkV9B/ETeAQfpjPJ
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
X-Rspamd-Queue-Id: E87FA23AD8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Action: no action

On 3/9/26 15:14, Thomas Zimmermann wrote:
> Provide helpers for handling console font data. Update consoles and VT.
>=20
> VT's vc_state stores font data as a plain byte array of glphys. Fbcon,
> newport_con and the kernel's internal fonts store the glyph data as an
> array of plain bytes plus a hidden header for reference counting, check
> sums and buffer sizes. The reference counting only works for user-space
> fonts but not for internal fonts. Font-data handling is duplicated in
> several places. Most of the font handling is open-coded and mixed up wit=
h
> VT's plain glyph arrays.
>=20
> To address these issues, add proper handling of font data to all involve=
d
> components: struct vc_font for font state in VC; a font data type for th=
e
> consoles. Then implement interfaces for handling font data one by one.
>=20
> Patch 1 prepares the fbdev interface.
>=20
> Patches 2 to 4 prepare VT's font handling.
>=20
> Patches 5 to 13 refactor fbcon and newport_con to use clean interfaces f=
or
> their fonts.
>=20
> Fbcon has long been a source of problems and bug reports. [1] With its
> confusing implementation, it is hard to find the cause of these bugs.
> Cleaning up the fbcon code will hopefully help with resolving bug report=
s
> in the future.
>=20
> The series has been tested with fbcon under DRM's bochs driver by changi=
ng
> fonts at runtime using the setfont utility. [2] The changes to newport_c=
on
> have only been tested to compile.
>=20
> v3:
> - fix module font linking (Nathan, Arnd)
> - fix typos (Helge)
> - clarify return value of font_data_put()
> v2:
> - keep declaring the internal fonts in the public header file (Helge)
> - rebase and clean up
>=20
> [1] https://lore.kernel.org/all/6992c84c.a70a0220.2c38d7.00e8.GAE@google=
.com/
> [2] https://www.man7.org/linux/man-pages/man8/setfont.8.html
>=20
> Thomas Zimmermann (13):
>    fbdev: Declare src parameter of fb_pad_ helpers as constant
>    vt: Remove trailing whitespaces
>    vt: Store font in struct vc_font
>    vt: Calculate font-buffer size with vc_font_size()
>    lib/fonts: Remove trailing whitespaces
>    lib/fonts: Remove FNTCHARCNT()
>    lib/fonts: Store font data as font_data_t; update consoles
>    lib/fonts: Read font size with font_data_size()
>    lib/fonts: Manage font-data lifetime with font_data_get/_put()
>    lib/fonts: Compare font data for equality with font_data_is_equal()
>    lib/fonts: Create font_data_t from struct console_font with
>      font_data_import()
>    lib/fonts: Store font data for user space with font_data_export()
>    lib/fonts: Remove internal symbols and macros from public header file
>=20
>   drivers/video/console/newport_con.c |  61 +++-----
>   drivers/video/fbdev/core/bitblit.c  |  11 +-
>   drivers/video/fbdev/core/fbcon.c    | 194 +++++++----------------
>   drivers/video/fbdev/core/fbcon.h    |   8 +-
>   drivers/video/fbdev/core/fbmem.c    |   6 +-
>   include/linux/console_struct.h      |  59 ++++++-
>   include/linux/fb.h                  |  10 +-
>   include/linux/font.h                | 115 +++++++++-----
>   lib/fonts/font.h                    |  38 +++++
>   lib/fonts/font_10x18.c              |   2 +-
>   lib/fonts/font_6x10.c               |   3 +-
>   lib/fonts/font_6x11.c               |   2 +-
>   lib/fonts/font_6x8.c                |   3 +-
>   lib/fonts/font_7x14.c               |   2 +-
>   lib/fonts/font_8x16.c               |   3 +-
>   lib/fonts/font_8x8.c                |   2 +-
>   lib/fonts/font_acorn_8x8.c          |   4 +-
>   lib/fonts/font_mini_4x6.c           |  10 +-
>   lib/fonts/font_pearl_8x8.c          |   2 +-
>   lib/fonts/font_sun12x22.c           |   3 +-
>   lib/fonts/font_sun8x16.c            |   3 +-
>   lib/fonts/font_ter10x18.c           |   4 +-
>   lib/fonts/font_ter16x32.c           |   4 +-
>   lib/fonts/fonts.c                   | 232 +++++++++++++++++++++++++++-
>   24 files changed, 514 insertions(+), 267 deletions(-)
>   create mode 100644 lib/fonts/font.h

series applied to fbdev git tree.

Thanks!
Helge
