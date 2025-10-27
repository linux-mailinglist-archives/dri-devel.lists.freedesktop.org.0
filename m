Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893BC0C1A5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 08:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DFE10E0B0;
	Mon, 27 Oct 2025 07:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="O6t3yN7H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2SBiat1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O6t3yN7H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2SBiat1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027D210E0B0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:24:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A20EB21A70;
 Mon, 27 Oct 2025 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761549855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iMe8dRWv3FNYb5B9g/tXMzwkBNkIkqzHS237Oj8Eliw=;
 b=O6t3yN7H2+lSQlGx4Wrs9KeFAtz/Gs5U7ps7mraNimP+iFahedVCdy7zevEHpB6rEqqWxE
 XYyCkm7T9CNpxYb1F7LRvbrYVTD2WcL8cmnzoF0+c7AEmjTS3z4s77YK+wWKanFoGkM1hK
 3i+wvHY0sZNsfIBdsfMkhrx0KqZkap8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761549855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iMe8dRWv3FNYb5B9g/tXMzwkBNkIkqzHS237Oj8Eliw=;
 b=f2SBiat1S9g5jhqEsFvu6U4v9SC0lsgh3z8Jf8f0m/ReSnA13VzNlHlC4pDItWa1MPZOCA
 tT749p7iGmEAbfBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761549855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iMe8dRWv3FNYb5B9g/tXMzwkBNkIkqzHS237Oj8Eliw=;
 b=O6t3yN7H2+lSQlGx4Wrs9KeFAtz/Gs5U7ps7mraNimP+iFahedVCdy7zevEHpB6rEqqWxE
 XYyCkm7T9CNpxYb1F7LRvbrYVTD2WcL8cmnzoF0+c7AEmjTS3z4s77YK+wWKanFoGkM1hK
 3i+wvHY0sZNsfIBdsfMkhrx0KqZkap8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761549855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iMe8dRWv3FNYb5B9g/tXMzwkBNkIkqzHS237Oj8Eliw=;
 b=f2SBiat1S9g5jhqEsFvu6U4v9SC0lsgh3z8Jf8f0m/ReSnA13VzNlHlC4pDItWa1MPZOCA
 tT749p7iGmEAbfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57825136CF;
 Mon, 27 Oct 2025 07:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id U+/xEh8e/2hRXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 07:24:15 +0000
Message-ID: <305e7ccf-82bc-43dd-8fac-1c39ffe183d3@suse.de>
Date: Mon, 27 Oct 2025 08:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Resolve the issue of VGA not detecting
 disconnection
To: 2564278112@qq.com, lyude@redhat.com, dakr@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlie@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jiangwang@kylinos.cn
References: <tencent_7EF61E8ABB90946288975CE501E2D9673C06@qq.com>
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
In-Reply-To: <tencent_7EF61E8ABB90946288975CE501E2D9673C06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_TO(0.00)[qq.com,redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,qq.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, qq.com:email,
 suse.de:email, suse.de:mid, kylinos.cn:email]
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



Am 27.10.25 um 04:16 schrieb 2564278112@qq.com:
> From: Wang Jiang <jiangwang@kylinos.cn>
>
> When using the GT730, I found that the VGA could recognize when it was plugged in,
> but could not detect when it was disconnected.
> The reason is that the polled flag for the connector is missing DRM_CONNECTOR_POLL_DISCONNECT.
>
> Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 63621b1510f6..dfff01edf65a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1421,7 +1421,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
>   	connector->doublescan_allowed = false;
>   
>   	drm_connector_helper_add(connector, &nouveau_connector_helper_funcs);
> -	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
>   
>   	if (nvif_object_constructed(&nv_connector->conn.object)) {
>   		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


