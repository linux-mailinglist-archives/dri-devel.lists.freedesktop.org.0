Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F537CF70D2
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 08:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974C710E49B;
	Tue,  6 Jan 2026 07:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0QgzpOF4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KF9Ai33J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EMp+T4YW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3A+HAK7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C310E49B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:35:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44A1A338B8;
 Tue,  6 Jan 2026 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hfhhcVef8fH31OaVLzVbFzPACjHCBADmltloGy/SoPw=;
 b=0QgzpOF4yFKtavoK/Z+LkRqljtjBi26k29OZT0KUyMpBxuVlZ4XoUSbEumW82goJuXZ/rl
 OBqUEwTE3l+nMx9UfvTPFKoIsJP1J2xi4B8FVa0pgN1ZNGJbPIY5+HQ6Sc6bow5P8UPZo4
 mZVnoPmesXNWob2SIOUynGe8uLAjIiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hfhhcVef8fH31OaVLzVbFzPACjHCBADmltloGy/SoPw=;
 b=KF9Ai33Jy9i8hXxTBLeBXS5Fg8w7aUK/Bc092jcivQB/KGKv3vYwt16IB7ftPammBHhd5Y
 3f+beu8nlaxzwHCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hfhhcVef8fH31OaVLzVbFzPACjHCBADmltloGy/SoPw=;
 b=EMp+T4YWT1MZh5FeGFELjS5i+dg7kWxYOYUkCEhWoMjsCuq5O9L+acNzSz+5bXEMS39b6P
 3RjdiMqqWhyz+lagKtO0h2GuBA6fW2xDBfk+4Ud8UPHEgfNjmPvOO7Jlul6NF7N3hTZCBN
 lNcfl5UP2BSzmyi3oyW8+I56JSEPwBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hfhhcVef8fH31OaVLzVbFzPACjHCBADmltloGy/SoPw=;
 b=3A+HAK7wahLMGLujuKSkdNtmjFxP5bOXvBwu8uSSBWKyCFdxwuPCLc2ZjdrA/nxiv+4JXV
 G1tSrWp/ndcEi1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF1F13EA63;
 Tue,  6 Jan 2026 07:35:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NZk3NVC7XGm6BgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jan 2026 07:35:44 +0000
Message-ID: <523b801b-8747-4e17-a4e3-50fd81cad3a0@suse.de>
Date: Tue, 6 Jan 2026 08:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
To: Mikko Rapeli <mikko.rapeli@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, stable@vger.kernel.org
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <20251205123751.2257694-2-mikko.rapeli@linaro.org>
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
In-Reply-To: <20251205123751.2257694-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.995]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[15];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,linaro.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email, suse.com:url,
 imap1.dmz-prg2.suse.org:helo, amd.com:email, suse.de:mid, suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 05.12.25 um 13:37 schrieb Mikko Rapeli:
> From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
>
> Use RG16 buffer format for fbdev emulation. Fbdev backend is being used
> by Mali 400 userspace driver which expects 16 bit RGB pixel color format.
> This change should not affect console or other fbdev applications as we
> still have plenty of colors left.
>
> Cc: Bill Mills <bill.mills@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

although with patch 2 applied, you can simply call 
'drm_client_setup(drm, NULL)' and it should do the right thing.

Best regards
Thomas

> ---
>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index 2bee0a2275ede..ccc35cacd10cb 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -525,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>   		goto err_poll_fini;
>   
>   	/* Initialize fbdev generic emulation. */
> -	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
> +	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
>   
>   	return 0;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


