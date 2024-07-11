Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB392EADA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 16:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9FB10E250;
	Thu, 11 Jul 2024 14:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0UeI02DQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZmSTSYT0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qDOi9rzC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y5TrOh64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2510E250
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 14:36:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA39721A80;
 Thu, 11 Jul 2024 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720708576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KXDCAXMbp8Z27jOllL1RgSgDjvwny6xi4Uto6eW8uCI=;
 b=0UeI02DQuM78sfrsT5BGf7QhkZ0gt80N9cJ+jjIqYFX+0W5flCi2+7Sg/gpWRwJTNrboWe
 HFNJ4PdDIi9U8Rn/6MFOiWKiOuwLhkPy7uMhJqY/BfBlU90zhpGAK1yUm2exaW4WDBKbpB
 Ldmh7yA+G0wzpZCywPBzENT8AQwX0lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720708576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KXDCAXMbp8Z27jOllL1RgSgDjvwny6xi4Uto6eW8uCI=;
 b=ZmSTSYT0C/q7BTKQolfY0jOOFIKSsUbWfl1etqw6hu/G1ikZtHVC7tE3n7xb5K9t/DXtEs
 7yyv4OPl0tSuubAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720708575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KXDCAXMbp8Z27jOllL1RgSgDjvwny6xi4Uto6eW8uCI=;
 b=qDOi9rzCahzIjaAOw3WzzUsJGGRGKYBiLFBJ/iOeE97/xG5Ark1KcxBCJRzUE+p8rvXpzK
 qa47p+Bxp226cL22HKEKs/zNWD2eGFRFC9Q7tBvcyjloDcafuq8Aja01aDPvFWJhQJORKq
 e083VxX7tM+EYVaebO4JbkpGyAMDD+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720708575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KXDCAXMbp8Z27jOllL1RgSgDjvwny6xi4Uto6eW8uCI=;
 b=Y5TrOh64a4/GMvHFah/g5gj9e7x0aoKaDFW3V6LcPPy7qnq1wlCbOyTqHIzV3lCz6agMb8
 PqPGfcGUWhL5BQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95B3F136AF;
 Thu, 11 Jul 2024 14:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VuRNI9/tj2aMEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Jul 2024 14:36:15 +0000
Message-ID: <3e77a398-2e10-4fc1-95a4-c35681002d4c@suse.de>
Date: Thu, 11 Jul 2024 16:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: add multiple connectors support
To: oushixiong1025@163.com, Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20240711090102.352213-1-oushixiong1025@163.com>
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
In-Reply-To: <20240711090102.352213-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 FREEMAIL_TO(0.00)[163.com,redhat.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Hi

Am 11.07.24 um 11:01 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
> The AST2600 tx_chip_types will be detected as AST_TX_DP, but some BMC
> boards that use AST2600 use the VGA interface instead of the DP interface.
> In this case, it will use Virtual connector as the DP is disconnected.
>
> [HOW]
> Allows multiple physical connectors to exist at the same time.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/ast/ast_drv.h  |  6 ++++-
>   drivers/gpu/drm/ast/ast_main.c |  8 +++----
>   drivers/gpu/drm/ast/ast_mode.c | 40 ++++++++++++++++++++--------------
>   3 files changed, 33 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ba3d86973995..e326124b3fec 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -150,9 +150,13 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
>    * BMC
>    */
>   
> +#define MAX_CONNECTORS 2
> +
>   struct ast_bmc_connector {
>   	struct drm_connector base;
> -	struct drm_connector *physical_connector;
> +
> +	struct drm_connector *physical_connectors[MAX_CONNECTORS];
> +	int count;

It won't work like that. Due to userspace limitations, only one 
connector can be reported as connected as at a time. So we have to build 
a chain of connectors. I had this on my TODO list anyway, so I can also 
prioritize.

Best regards
Thomas

>   };
>   
>   static inline struct ast_bmc_connector *
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 0637abb70361..428529749ae6 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -85,7 +85,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	if (!need_post) {
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
>   		if (jreg & 0x80)
> -			ast->tx_chip_types = AST_TX_SIL164_BIT;
> +			ast->tx_chip_types |= AST_TX_SIL164_BIT;
>   	}
>   
>   	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
> @@ -97,7 +97,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
>   		switch (jreg) {
>   		case 0x04:
> -			ast->tx_chip_types = AST_TX_SIL164_BIT;
> +			ast->tx_chip_types |= AST_TX_SIL164_BIT;
>   			break;
>   		case 0x08:
>   			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
> @@ -110,12 +110,12 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   			}
>   			fallthrough;
>   		case 0x0c:
> -			ast->tx_chip_types = AST_TX_DP501_BIT;
> +			ast->tx_chip_types |= AST_TX_DP501_BIT;
>   		}
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
>   		    ASTDP_DPMCU_TX) {
> -			ast->tx_chip_types = AST_TX_ASTDP_BIT;
> +			ast->tx_chip_types |= AST_TX_ASTDP_BIT;
>   			ast_dp_launch(&ast->base);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6695af70768f..31a49d32e506 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1717,7 +1717,8 @@ static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
>   					       bool force)
>   {
>   	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
> -	struct drm_connector *physical_connector = bmc_connector->physical_connector;
> +	struct drm_connector *physical_connector;
> +	int i, count = bmc_connector->count;
>   
>   	/*
>   	 * Most user-space compositors cannot handle more than one connected
> @@ -1730,10 +1731,13 @@ static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
>   	 *        than one connector per CRTC. The BMC should always be connected.
>   	 */
>   
> -	if (physical_connector && physical_connector->status == connector_status_disconnected)
> -		return connector_status_connected;
> +	for (i = 0; i < count; i++) {
> +		physical_connector = bmc_connector->physical_connectors[i];
> +		if (physical_connector && physical_connector->status == connector_status_connected)
> +			return connector_status_disconnected;
> +	}
>   
> -	return connector_status_disconnected;
> +	return connector_status_connected;
>   }
>   
>   static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
> @@ -1756,10 +1760,11 @@ static const struct drm_connector_funcs ast_bmc_connector_funcs = {
>   
>   static int ast_bmc_connector_init(struct drm_device *dev,
>   				  struct ast_bmc_connector *bmc_connector,
> -				  struct drm_connector *physical_connector)
> +				  struct drm_connector **physical_connector,
> +				  int count)
>   {
>   	struct drm_connector *connector = &bmc_connector->base;
> -	int ret;
> +	int i, ret;
>   
>   	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
>   				 DRM_MODE_CONNECTOR_VIRTUAL);
> @@ -1768,13 +1773,16 @@ static int ast_bmc_connector_init(struct drm_device *dev,
>   
>   	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
>   
> -	bmc_connector->physical_connector = physical_connector;
> +	for (i = 0; i < count; i++)
> +		bmc_connector->physical_connectors[i] = physical_connector[i];
> +	bmc_connector->count = count;
>   
>   	return 0;
>   }
>   
>   static int ast_bmc_output_init(struct ast_device *ast,
> -			       struct drm_connector *physical_connector)
> +			       struct drm_connector **physical_connector,
> +			       int count)
>   {
>   	struct drm_device *dev = &ast->base;
>   	struct drm_crtc *crtc = &ast->crtc;
> @@ -1790,7 +1798,7 @@ static int ast_bmc_output_init(struct ast_device *ast,
>   		return ret;
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
> -	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
> +	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector, count);
>   	if (ret)
>   		return ret;
>   
> @@ -1852,8 +1860,8 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
>   int ast_mode_config_init(struct ast_device *ast)
>   {
>   	struct drm_device *dev = &ast->base;
> -	struct drm_connector *physical_connector = NULL;
> -	int ret;
> +	struct drm_connector *physical_connector[MAX_CONNECTORS] = {NULL};
> +	int count, ret;
>   
>   	ret = drmm_mutex_init(dev, &ast->modeset_lock);
>   	if (ret)
> @@ -1897,27 +1905,27 @@ int ast_mode_config_init(struct ast_device *ast)
>   		ret = ast_vga_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.vga.connector;
> +		physical_connector[count++] = &ast->output.vga.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
>   		ret = ast_sil164_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.sil164.connector;
> +		physical_connector[count++] = &ast->output.sil164.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
>   		ret = ast_dp501_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.dp501.connector;
> +		physical_connector[count++] = &ast->output.dp501.connector;
>   	}
>   	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
>   		ret = ast_astdp_output_init(ast);
>   		if (ret)
>   			return ret;
> -		physical_connector = &ast->output.astdp.connector;
> +		physical_connector[count++] = &ast->output.astdp.connector;
>   	}
> -	ret = ast_bmc_output_init(ast, physical_connector);
> +	ret = ast_bmc_output_init(ast, physical_connector, count);
>   	if (ret)
>   		return ret;
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

