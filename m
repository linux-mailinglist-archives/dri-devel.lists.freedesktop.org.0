Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9EB85C19D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7F710E331;
	Tue, 20 Feb 2024 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IVtSqZoN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5hncdGKr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ifzrb3IN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/4/DzGS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821610E331
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:45:23 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EAF7B21D70;
 Tue, 20 Feb 2024 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708447522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fu1xrzGccsgI+prYSrD/agZT+lLlxnGFnbUfsQRS0Jc=;
 b=IVtSqZoN3mE8JTE5rq15DIXcFENsUWmFhqK0ta1bzqddX8nkuOtNK8Rr/+0PtZpPhQxbGU
 xHWL8EOGEXxKSbCDfr85AhiRrU5UCtzsZnGQNMKABSDt0q+lURfhAEYdhx57voH6JBF5I9
 4PezPU4Fr7S7VCOkWnPEfVZ4mMcYTHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708447522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fu1xrzGccsgI+prYSrD/agZT+lLlxnGFnbUfsQRS0Jc=;
 b=5hncdGKre9/EACk63xv4Oq7qbaOxtfMlITfe16aZlxnZRB4FVzHnSc89FKqmuVNeKNLUKn
 /6Wr4tUnkwNM/TBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708447521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fu1xrzGccsgI+prYSrD/agZT+lLlxnGFnbUfsQRS0Jc=;
 b=Ifzrb3INu4n/R8tFnJUU+g/l0nyeWOYrRSe60WmrlWlCD56SjhoStKkXuuKVohgDxn9XIZ
 aig5mcaIJXE9Hts24/FxWTjU8D0YF7QKofHzcODXqT9M0TJZ27qLEV2yWQ5bCJ2DDN0yqu
 Z5ujK/vuJrql1I7/W43ntetQzwrylhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708447521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fu1xrzGccsgI+prYSrD/agZT+lLlxnGFnbUfsQRS0Jc=;
 b=/4/DzGS6IstN70mP3h56zTOqnpc05KoYjwvN5j3QalUxeF9bepzRlcqinrjN4i6+IP5f34
 bvX78gfkrhlhhZDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B32FD1358A;
 Tue, 20 Feb 2024 16:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vSt1KiHX1GVUTQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Feb 2024 16:45:21 +0000
Message-ID: <17c083b3-81ab-458a-893c-ea0fb164a607@suse.de>
Date: Tue, 20 Feb 2024 17:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid/firmware: Remove built-in EDIDs
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240220161017.562241-1-mripard@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20240220161017.562241-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [5.01 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_SPAM(5.10)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,gmail.com,linux.intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: *****
X-Spam-Score: 5.01
X-Spam-Flag: NO
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



Am 20.02.24 um 17:10 schrieb Maxime Ripard:
> The EDID firmware loading mechanism introduced a few built-in EDIDs that
> could be forced on any connector, bypassing the EDIDs it exposes.
>
> While convenient, this limited set of EDIDs doesn't take into account
> the connector type, and we can end up with an EDID that is completely
> invalid for a given connector.
>
> For example, the edid/800x600.bin file matches the following EDID:
>
>    edid-decode (hex):
>
>    00 ff ff ff ff ff ff 00 31 d8 00 00 00 00 00 00
>    05 16 01 03 6d 1b 14 78 ea 5e c0 a4 59 4a 98 25
>    20 50 54 01 00 00 45 40 01 01 01 01 01 01 01 01
>    01 01 01 01 01 01 a0 0f 20 00 31 58 1c 20 28 80
>    14 00 15 d0 10 00 00 1e 00 00 00 ff 00 4c 69 6e
>    75 78 20 23 30 0a 20 20 20 20 00 00 00 fd 00 3b
>    3d 24 26 05 00 0a 20 20 20 20 20 20 00 00 00 fc
>    00 4c 69 6e 75 78 20 53 56 47 41 0a 20 20 00 c2
>
>    ----------------
>
>    Block 0, Base EDID:
>      EDID Structure Version & Revision: 1.3
>      Vendor & Product Identification:
>        Manufacturer: LNX
>        Model: 0
>        Made in: week 5 of 2012
>      Basic Display Parameters & Features:
>        Analog display
>        Signal Level Standard: 0.700 : 0.000 : 0.700 V p-p
>        Blank level equals black level
>        Sync: Separate Composite Serration
>        Maximum image size: 27 cm x 20 cm
>        Gamma: 2.20
>        DPMS levels: Standby Suspend Off
>        RGB color display
>        First detailed timing is the preferred timing
>      Color Characteristics:
>        Red  : 0.6416, 0.3486
>        Green: 0.2919, 0.5957
>        Blue : 0.1474, 0.1250
>        White: 0.3125, 0.3281
>      Established Timings I & II:
>        DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
>      Standard Timings:
>        DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
>      Detailed Timing Descriptors:
>        DTD 1:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz (277 mm x 208 mm)
>                     Hfront   40 Hsync 128 Hback   88 Hpol P
>                     Vfront    1 Vsync   4 Vback   23 Vpol P
>        Display Product Serial Number: 'Linux #0'
>        Display Range Limits:
>          Monitor ranges (GTF): 59-61 Hz V, 36-38 kHz H, max dotclock 50 MHz
>        Display Product Name: 'Linux SVGA'
>    Checksum: 0xc2
>
> So, an analog monitor EDID. However, if the connector was an HDMI
> monitor for example, it breaks the HDMI specification that requires,
> among other things, a digital display, the VIC 1 mode and an HDMI Forum
> Vendor Specific Data Block in an CTA-861 extension.
>
> We thus end up with a completely invalid EDID, which thus might confuse
> HDMI-related code that could parse it.
>
> After some discussions on IRC, we identified mainly two ways to fix
> this:
>
>    - We can either create more EDIDs for each connector type to provide
>      a built-in EDID that matches the resolution passed in the name, and
>      still be a sensible EDID for that connector type;
>
>    - Or we can just prevent the EDID to be exposed to userspace if it's
>      built-in.
>
> Or possibly both.
>
> However, the conclusion was that maybe we just don't need the built-in
> EDIDs at all and we should just get rid of them. So here we are.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_edid_load.c | 160 +++-----------------------------
>   1 file changed, 13 insertions(+), 147 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 60fcb80bce61..d1c7e8298702 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -20,162 +20,28 @@
>   
>   static char edid_firmware[PATH_MAX];
>   module_param_string(edid_firmware, edid_firmware, sizeof(edid_firmware), 0644);
> -MODULE_PARM_DESC(edid_firmware, "Do not probe monitor, use specified EDID blob "
> -	"from built-in data or /lib/firmware instead. ");
> -
> -#define GENERIC_EDIDS 6
> -static const char * const generic_edid_name[GENERIC_EDIDS] = {
> -	"edid/800x600.bin",
> -	"edid/1024x768.bin",
> -	"edid/1280x1024.bin",
> -	"edid/1600x1200.bin",
> -	"edid/1680x1050.bin",
> -	"edid/1920x1080.bin",
> -};
> -
> -static const u8 generic_edid[GENERIC_EDIDS][128] = {
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x1b, 0x14, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x01, 0x00, 0x00, 0x45, 0x40,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xa0, 0x0f,
> -	0x20, 0x00, 0x31, 0x58, 0x1c, 0x20, 0x28, 0x80,
> -	0x14, 0x00, 0x15, 0xd0, 0x10, 0x00, 0x00, 0x1e,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x24, 0x26, 0x05, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x53,
> -	0x56, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0xc2,
> -	},
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x23, 0x1a, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x00, 0x08, 0x00, 0x61, 0x40,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x64, 0x19,
> -	0x00, 0x40, 0x41, 0x00, 0x26, 0x30, 0x08, 0x90,
> -	0x36, 0x00, 0x63, 0x0a, 0x11, 0x00, 0x00, 0x18,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x2f, 0x31, 0x07, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x58,
> -	0x47, 0x41, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x55,
> -	},
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x2c, 0x23, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0x81, 0x80,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x30, 0x2a,
> -	0x00, 0x98, 0x51, 0x00, 0x2a, 0x40, 0x30, 0x70,
> -	0x13, 0x00, 0xbc, 0x63, 0x11, 0x00, 0x00, 0x1e,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x3e, 0x40, 0x0b, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x53,
> -	0x58, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0xa0,
> -	},
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x37, 0x29, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xa9, 0x40,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x48, 0x3f,
> -	0x40, 0x30, 0x62, 0xb0, 0x32, 0x40, 0x40, 0xc0,
> -	0x13, 0x00, 0x2b, 0xa0, 0x21, 0x00, 0x00, 0x1e,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x4a, 0x4c, 0x11, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x55,
> -	0x58, 0x47, 0x41, 0x0a, 0x20, 0x20, 0x00, 0x9d,
> -	},
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x2b, 0x1b, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xb3, 0x00,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x21, 0x39,
> -	0x90, 0x30, 0x62, 0x1a, 0x27, 0x40, 0x68, 0xb0,
> -	0x36, 0x00, 0xb5, 0x11, 0x11, 0x00, 0x00, 0x1e,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x40, 0x42, 0x0f, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x57,
> -	0x53, 0x58, 0x47, 0x41, 0x0a, 0x20, 0x00, 0x26,
> -	},
> -	{
> -	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -	0x31, 0xd8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x05, 0x16, 0x01, 0x03, 0x6d, 0x32, 0x1c, 0x78,
> -	0xea, 0x5e, 0xc0, 0xa4, 0x59, 0x4a, 0x98, 0x25,
> -	0x20, 0x50, 0x54, 0x00, 0x00, 0x00, 0xd1, 0xc0,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> -	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a,
> -	0x80, 0x18, 0x71, 0x38, 0x2d, 0x40, 0x58, 0x2c,
> -	0x45, 0x00, 0xf4, 0x19, 0x11, 0x00, 0x00, 0x1e,
> -	0x00, 0x00, 0x00, 0xff, 0x00, 0x4c, 0x69, 0x6e,
> -	0x75, 0x78, 0x20, 0x23, 0x30, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x3b,
> -	0x3d, 0x42, 0x44, 0x0f, 0x00, 0x0a, 0x20, 0x20,
> -	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -	0x00, 0x4c, 0x69, 0x6e, 0x75, 0x78, 0x20, 0x46,
> -	0x48, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x05,
> -	},
> -};
> +MODULE_PARM_DESC(edid_firmware,
> +		 "Do not probe monitor, use specified EDID blob from /lib/firmware instead.");
>   
>   static const struct drm_edid *edid_load(struct drm_connector *connector, const char *name)
>   {
>   	const struct firmware *fw = NULL;
> -	const u8 *fwdata;
>   	const struct drm_edid *drm_edid;
> -	int fwsize, builtin;
> +	int err;
>   
> -	builtin = match_string(generic_edid_name, GENERIC_EDIDS, name);
> -	if (builtin >= 0) {
> -		fwdata = generic_edid[builtin];
> -		fwsize = sizeof(generic_edid[builtin]);
> -	} else {
> -		int err;
> -
> -		err = request_firmware(&fw, name, connector->dev->dev);
> -		if (err) {
> -			drm_err(connector->dev,
> -				"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
> -				connector->base.id, connector->name,
> -				name, err);
> -			return ERR_PTR(err);
> -		}
> -
> -		fwdata = fw->data;
> -		fwsize = fw->size;
> +	err = request_firmware(&fw, name, connector->dev->dev);
> +	if (err) {
> +		drm_err(connector->dev,
> +			"[CONNECTOR:%d:%s] Requesting EDID firmware \"%s\" failed (err=%d)\n",
> +			connector->base.id, connector->name,
> +			name, err);
> +		return ERR_PTR(err);
>   	}
>   
> -	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded %s firmware EDID \"%s\"\n",
> -		    connector->base.id, connector->name,
> -		    builtin >= 0 ? "built-in" : "external", name);
> +	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded external firmware EDID \"%s\"\n",
> +		    connector->base.id, connector->name, name);
>   
> -	drm_edid = drm_edid_alloc(fwdata, fwsize);
> +	drm_edid = drm_edid_alloc(fw->data, fw->size);
>   	if (!drm_edid_valid(drm_edid)) {
>   		drm_err(connector->dev, "Invalid firmware EDID \"%s\"\n", name);
>   		drm_edid_free(drm_edid);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

