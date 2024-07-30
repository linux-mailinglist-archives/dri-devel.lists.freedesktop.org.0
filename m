Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D99408C6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FEE10E49D;
	Tue, 30 Jul 2024 06:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EsrwHspe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6OmSCNxq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EsrwHspe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6OmSCNxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848210E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:45:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4018421B4E;
 Tue, 30 Jul 2024 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722321933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XkyQs3gesCZhnhJJ0HcO8p52nej3PFEYm8DhMUlEkNw=;
 b=EsrwHspeo/ezj77zTJkVfFyZYUFZ7EuhMa0QhUEM2jjeNTErNNd4Mn2ZLRQYEePTxe1hJI
 7+3zqKj4wzINx5NiF1EqA7P8O5UjXefeRUS+t6i7PPyolVhK9OwuC1wZAojEMViHqBHA1Z
 KMkLoLmYlKUS4bcORCRFzBnakB+FCdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722321933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XkyQs3gesCZhnhJJ0HcO8p52nej3PFEYm8DhMUlEkNw=;
 b=6OmSCNxqgXC93iSSuN7jz5li3ducPI9XI+hypXxN/xWxwIA8nKjZLcg7bzSaxNq4ahuC+F
 Y+m6do8ZlzO1IXAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722321933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XkyQs3gesCZhnhJJ0HcO8p52nej3PFEYm8DhMUlEkNw=;
 b=EsrwHspeo/ezj77zTJkVfFyZYUFZ7EuhMa0QhUEM2jjeNTErNNd4Mn2ZLRQYEePTxe1hJI
 7+3zqKj4wzINx5NiF1EqA7P8O5UjXefeRUS+t6i7PPyolVhK9OwuC1wZAojEMViHqBHA1Z
 KMkLoLmYlKUS4bcORCRFzBnakB+FCdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722321933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XkyQs3gesCZhnhJJ0HcO8p52nej3PFEYm8DhMUlEkNw=;
 b=6OmSCNxqgXC93iSSuN7jz5li3ducPI9XI+hypXxN/xWxwIA8nKjZLcg7bzSaxNq4ahuC+F
 Y+m6do8ZlzO1IXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 090DD13983;
 Tue, 30 Jul 2024 06:45:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KRaXAA2MqGZ/YwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jul 2024 06:45:33 +0000
Message-ID: <edc5bf0f-3a33-4f77-943f-2309b3fdbee3@suse.de>
Date: Tue, 30 Jul 2024 08:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/ast: astdp: Test firmware status once during
 probing
To: airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-3-tzimmermann@suse.de>
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
In-Reply-To: <20240717143319.104012-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.09 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MID_RHS_MATCH_FROM(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -1.09
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



Am 17.07.24 um 16:24 schrieb Thomas Zimmermann:
> Test for running ASTDP firmware during probe. Do not bother testing
> this later. We cannot do much anyway if the firmware fails. Do not
> initialize the ASTDP conenctor if the test fails during device probing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reported-by: Shixiong Ou <oushixiong@kylinos.cn>
Closes: 
https://lore.kernel.org/dri-devel/20240711090102.352213-1-oushixiong1025@163.com/
Tested-by: Shixiong Ou <oushixiong@kylinos.cn>

See 
https://lore.kernel.org/dri-devel/14fa96ad-4abd-4754-a622-d9f04429d759@suse.de/T/#m09539bfbdad6c65a1b0bc50620025477fd8dc9d2

> ---
>   drivers/gpu/drm/ast/ast_dp.c   | 41 +++++++++++++---------------------
>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c |  6 +++--
>   drivers/gpu/drm/ast/ast_post.c |  2 +-
>   drivers/gpu/drm/ast/ast_reg.h  |  4 ++--
>   5 files changed, 23 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index e6c7f0d64e99..59885d10d308 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -9,8 +9,6 @@
>   
>   bool ast_astdp_is_connected(struct ast_device *ast)
>   {
> -	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING))
> -		return false;
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))
>   		return false;
>   	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
> @@ -24,13 +22,11 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	u8 i = 0, j = 0;
>   
>   	/*
> -	 * CRD1[b5]: DP MCU FW is executing
>   	 * CRDC[b0]: DP link success
>   	 * CRDF[b0]: DP HPD
>   	 * CRE5[b0]: Host reading EDID process is done
>   	 */
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) &&
> -		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
> +	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
>   		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD) &&
>   		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
>   								ASTDP_HOST_EDID_READ_DONE_MASK))) {
> @@ -64,9 +60,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			 */
>   			mdelay(j+1);
>   
> -			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1,
> -							ASTDP_MCU_FW_EXECUTING) &&
> -				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
> +			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
>   							ASTDP_LINK_SUCCESS) &&
>   				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))) {
>   				goto err_astdp_jump_out_loop_of_edid;
> @@ -115,8 +109,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	return (~(j+256) + 1);
>   
>   err_astdp_edid_not_ready:
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING)))
> -		return (~0xD1 + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
>   		return (~0xDC + 1);
>   	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)))
> @@ -130,32 +122,29 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   /*
>    * Launch Aspeed DP
>    */
> -void ast_dp_launch(struct drm_device *dev)
> +int ast_dp_launch(struct ast_device *ast)
>   {
> -	u32 i = 0;
> -	u8 bDPExecute = 1;
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct drm_device *dev = &ast->base;
> +	unsigned int i = 10;
>   
> -	// Wait one second then timeout.
> -	while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, ASTDP_MCU_FW_EXECUTING) !=
> -		ASTDP_MCU_FW_EXECUTING) {
> -		i++;
> -		// wait 100 ms
> -		msleep(100);
> +	while (i) {
> +		u8 vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
>   
> -		if (i >= 10) {
> -			// DP would not be ready.
> -			bDPExecute = 0;
> +		if (vgacrd1 & AST_IO_VGACRD1_MCU_FW_EXECUTING)
>   			break;
> -		}
> +		--i;
> +		msleep(100);
>   	}
> -
> -	if (!bDPExecute)
> +	if (!i) {
>   		drm_err(dev, "Wait DPMCU executing timeout\n");
> +		return -ENODEV;
> +	}
>   
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
>   			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>   			       ASTDP_HOST_EDID_READ_DONE);
> +
> +	return 0;
>   }
>   
>   bool ast_dp_power_is_on(struct ast_device *ast)
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 47bab5596c16..02476eb78119 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -471,7 +471,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>   /* aspeed DP */
>   bool ast_astdp_is_connected(struct ast_device *ast);
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
> -void ast_dp_launch(struct drm_device *dev);
> +int ast_dp_launch(struct ast_device *ast);
>   bool ast_dp_power_is_on(struct ast_device *ast);
>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>   void ast_dp_set_on_off(struct drm_device *dev, bool no);
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 0637abb70361..d836f2a4f9f3 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -115,8 +115,10 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
>   		    ASTDP_DPMCU_TX) {
> -			ast->tx_chip_types = AST_TX_ASTDP_BIT;
> -			ast_dp_launch(&ast->base);
> +			int ret = ast_dp_launch(ast);
> +
> +			if (!ret)
> +				ast->tx_chip_types = AST_TX_ASTDP_BIT;
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 22f548805dfb..65755798ab94 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -351,7 +351,7 @@ void ast_post_gpu(struct drm_device *dev)
>   
>   	if (IS_AST_GEN7(ast)) {
>   		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
> -			ast_dp_launch(dev);
> +			ast_dp_launch(ast);
>   	} else if (ast->config_mode == ast_use_p2a) {
>   		if (IS_AST_GEN6(ast))
>   			ast_post_chip_2500(dev);
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 75671d345057..569de3188191 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -37,6 +37,8 @@
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
> +#define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> @@ -67,12 +69,10 @@
>   #define AST_DP_VIDEO_ENABLE		BIT(0)
>   
>   /*
> - * CRD1[b5]: DP MCU FW is executing
>    * CRDC[b0]: DP link success
>    * CRDF[b0]: DP HPD
>    * CRE5[b0]: Host reading EDID process is done
>    */
> -#define ASTDP_MCU_FW_EXECUTING		BIT(5)
>   #define ASTDP_LINK_SUCCESS		BIT(0)
>   #define ASTDP_HPD			BIT(0)
>   #define ASTDP_HOST_EDID_READ_DONE	BIT(0)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

