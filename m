Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1482A95EA4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 08:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2599510E0C7;
	Tue, 22 Apr 2025 06:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fsc5uC73";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1tAwA+rC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fsc5uC73";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1tAwA+rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DD910E0C7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:49:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B57B71F7C1;
 Tue, 22 Apr 2025 06:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745304583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=63O4idyDvcGMeeE4NHoqdqjJj06hbMU7oCyIkqOgfGA=;
 b=fsc5uC73HrShRe/2T/3i/fyV9A4X53/snHFO9bTbThyelVa2DU1aAGA4/Qk/z32eQ3eLCc
 95fsNZK42DcMN3iyDG0N4kIUVYEoaQS+jCouOCkI9x40QWfVPgs1m8lU7bqnY1x6IsKwvt
 AXz3CwGmlMro3pKaKS1o5rLZKOfS1BQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745304583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=63O4idyDvcGMeeE4NHoqdqjJj06hbMU7oCyIkqOgfGA=;
 b=1tAwA+rC9i+AbIj/c0S25wxVO941Y/h7PBPddWiy+kmev7r0mIe4ONxnborLQK98CfoPzE
 ZsEX9ufd+/53otAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745304583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=63O4idyDvcGMeeE4NHoqdqjJj06hbMU7oCyIkqOgfGA=;
 b=fsc5uC73HrShRe/2T/3i/fyV9A4X53/snHFO9bTbThyelVa2DU1aAGA4/Qk/z32eQ3eLCc
 95fsNZK42DcMN3iyDG0N4kIUVYEoaQS+jCouOCkI9x40QWfVPgs1m8lU7bqnY1x6IsKwvt
 AXz3CwGmlMro3pKaKS1o5rLZKOfS1BQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745304583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=63O4idyDvcGMeeE4NHoqdqjJj06hbMU7oCyIkqOgfGA=;
 b=1tAwA+rC9i+AbIj/c0S25wxVO941Y/h7PBPddWiy+kmev7r0mIe4ONxnborLQK98CfoPzE
 ZsEX9ufd+/53otAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CA46137CF;
 Tue, 22 Apr 2025 06:49:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id X1b/IAc8B2htLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Apr 2025 06:49:43 +0000
Message-ID: <527b7ebd-0a34-4fe0-82fb-9cdd6126e38e@suse.de>
Date: Tue, 22 Apr 2025 08:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: screen_info: Update framebuffers behind PCI bridges
To: javierm@redhat.com, iivanov@suse.de
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>
References: <20250417072751.10125-1-tzimmermann@suse.de>
Content-Language: en-US
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
In-Reply-To: <20250417072751.10125-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:url,
 suse.de:mid, suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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

cc'ing PCI devs

Am 17.04.25 um 09:27 schrieb Thomas Zimmermann:
> Apply bridge window offsets to screen_info framebuffers during
> relocation. Fixes invalid access to I/O memory.
>
> Resources behind a PCI bridge can be located at a certain offset
> in the kernel's I/O range. The framebuffer memory range stored in
> screen_info refers to the offset as seen during boot (essentialy 0).
> During boot up, the kernel may assign a different memory offset to
> the bridge device and thereby relocating the framebuffer address of
> the PCI graphics device as seen by the kernel. The information in
> screen_info must be updated as well.
>
> The helper pcibios_bus_to_resource() performs the relocation of
> the screen_info resource. The result now matches the I/O-memory
> resource of the PCI graphics device. As before, we store away the
> information necessary to update the information in screen_info.
>
> Commit 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated
> EFI framebuffers") added the code for updating screen_info. It is
> based on similar functionality that pre-existed in efifb. But efifb
> did not handle bridges correctly, so the problem presumably exists
> only on newer systems.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696
> Tested-by: Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
> Fixes: 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated EFI framebuffers")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.9+
> ---
>   drivers/video/screen_info_pci.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
> index 6c5833517141..c46c75dc3fae 100644
> --- a/drivers/video/screen_info_pci.c
> +++ b/drivers/video/screen_info_pci.c
> @@ -8,7 +8,7 @@
>   static struct pci_dev *screen_info_lfb_pdev;
>   static size_t screen_info_lfb_bar;
>   static resource_size_t screen_info_lfb_offset;
> -static struct resource screen_info_lfb_res = DEFINE_RES_MEM(0, 0);
> +static struct pci_bus_region screen_info_lfb_region;
>   
>   static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
>   {
> @@ -31,7 +31,7 @@ void screen_info_apply_fixups(void)
>   	if (screen_info_lfb_pdev) {
>   		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
>   
> -		if (pr->start != screen_info_lfb_res.start) {
> +		if (pr->start != screen_info_lfb_region.start) {
>   			if (__screen_info_relocation_is_valid(si, pr)) {
>   				/*
>   				 * Only update base if we have an actual
> @@ -69,10 +69,21 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>   
>   	for (i = 0; i < numres; ++i) {
>   		struct resource *r = &res[i];
> +		struct pci_bus_region bus_region = {
> +			.start = r->start,
> +			.end = r->end,
> +		};
>   		const struct resource *pr;
>   
>   		if (!(r->flags & IORESOURCE_MEM))
>   			continue;
> +
> +		/*
> +		 * Translate the address to resource if the framebuffer
> +		 * is behind a PCI bridge.
> +		 */
> +		pcibios_bus_to_resource(pdev->bus, r, &bus_region);
> +
>   		pr = pci_find_resource(pdev, r);
>   		if (!pr)
>   			continue;
> @@ -85,7 +96,7 @@ static void screen_info_fixup_lfb(struct pci_dev *pdev)
>   		screen_info_lfb_pdev = pdev;
>   		screen_info_lfb_bar = pr - pdev->resource;
>   		screen_info_lfb_offset = r->start - pr->start;
> -		memcpy(&screen_info_lfb_res, r, sizeof(screen_info_lfb_res));
> +		memcpy(&screen_info_lfb_region, &bus_region, sizeof(screen_info_lfb_region));
>   	}
>   }
>   DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY, 16,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

