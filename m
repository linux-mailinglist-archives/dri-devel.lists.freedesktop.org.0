Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119AA35842
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 08:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252110EBE0;
	Fri, 14 Feb 2025 07:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IFFwaYxe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7S2rrWQE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IFFwaYxe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7S2rrWQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F13F10EBE0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:55:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE97821D9C;
 Fri, 14 Feb 2025 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739519727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fyDttw15PU0HUrcTKbIAMTy/BqbOtIX3AmP1wbwDKnw=;
 b=IFFwaYxeSue9uPD2yvJvmO0M7vdRFJSliRTXgGYhd81AZUYsvEYioIoOSLMC1e9xo8sbcc
 TdyS3yP+I042weOA1lBcxr+VpQNyQTMrBFNwitT4zs4mztu7Yt9h8E2LDLcLHcvoZ+Midp
 k6yJC84YEOsvc8IQf+7KQNZIEbxQ1OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739519727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fyDttw15PU0HUrcTKbIAMTy/BqbOtIX3AmP1wbwDKnw=;
 b=7S2rrWQE8apvHTij4BuTtcMF2GzNLesUMksFs47Ke+gabqJLtUdhCgML3ihreYNljOui6C
 mphvag5Zz99qISCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739519727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fyDttw15PU0HUrcTKbIAMTy/BqbOtIX3AmP1wbwDKnw=;
 b=IFFwaYxeSue9uPD2yvJvmO0M7vdRFJSliRTXgGYhd81AZUYsvEYioIoOSLMC1e9xo8sbcc
 TdyS3yP+I042weOA1lBcxr+VpQNyQTMrBFNwitT4zs4mztu7Yt9h8E2LDLcLHcvoZ+Midp
 k6yJC84YEOsvc8IQf+7KQNZIEbxQ1OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739519727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fyDttw15PU0HUrcTKbIAMTy/BqbOtIX3AmP1wbwDKnw=;
 b=7S2rrWQE8apvHTij4BuTtcMF2GzNLesUMksFs47Ke+gabqJLtUdhCgML3ihreYNljOui6C
 mphvag5Zz99qISCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70B3F13285;
 Fri, 14 Feb 2025 07:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L5hCGu/2rme+GgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Feb 2025 07:55:27 +0000
Message-ID: <59811676-52d1-4432-b6ae-2f519dc95f83@suse.de>
Date: Fri, 14 Feb 2025 08:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Handheld gaming PC panel orientation quirks
To: John Edwards <uejji@uejji.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250213222455.93533-1-uejji@uejji.net>
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
In-Reply-To: <20250213222455.93533-1-uejji@uejji.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[uejji.net,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -4.30
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

Hi

Am 13.02.25 um 23:24 schrieb John Edwards:
> Hello.
>
> I am submitting a small number of patches to add panel rotation quirks for
> a few handheld gaming PCs.  These patches were created by the SteamFork
> team and are in daily use by us and/or members of our community.
>
> The following devices are covered by these patches:
> 1: AYANEO 2S
> 2: AYANEO Flip DS, AYANEO Flip KB
> 3: AYANEO Slide, Antec Core HS
> 4: GPD Win 2 (with correct DMI strings)
> 5: OneXPlayer Mini (Intel)
>
> Thank you for your consideration and for taking the time to review these
> patches.
>
> John Edwards
>
> v3:
> - Correct indentation errors in Flip DS/KB and Slide patches
> - Include Reviewed-by tags for Thomas Zimmermann and Hans de Goede

Thanks a lot for the patches. If no further comments come in, I'll merge 
the series next week.

Best regards
Thomas

>
> v2:
> - Minor rewording of commit messages
> - Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
> - Add OneXPlayer Mini (Intel) patch
> https://lore.kernel.org/dri-devel/20250124204648.56989-2-uejji@uejji.net/
>
> v1:
> https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/
>
> Andrew Wyatt (5):
>    drm: panel-orientation-quirks: Add support for AYANEO 2S
>    drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
>    drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
>    drm: panel-orientation-quirks: Add new quirk for GPD Win 2
>    drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
>
>   .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
>   1 file changed, 38 insertions(+), 2 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

