Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29421950658
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9850410E34C;
	Tue, 13 Aug 2024 13:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fqdyMfh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BC710E349
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+CQt8szw9fIEhw6Xf71jH6VfDxTCDrv/qyonpdqsTY=;
 b=fqdyMfh8HeD4FGGy/5E/CMpQzjyD3mAIATdRJEqn0c1X2xO36uYThxdpN7si5T3ZYf3pKv
 9VJZFisysBcGPuoZWnvlq7aF7o6Ri3lLPpP3Swl239n2sT1n97JBLXOJtFOUcs4dfTYzeS
 Fla1EYTM8QgYNVVFxMfsnlgMW9bibLM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-SoNpFJCBOlKReaXUztm_vA-1; Tue, 13 Aug 2024 09:20:05 -0400
X-MC-Unique: SoNpFJCBOlKReaXUztm_vA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-426624f4ce3so39278245e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555204; x=1724160004;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+CQt8szw9fIEhw6Xf71jH6VfDxTCDrv/qyonpdqsTY=;
 b=W7A1jl4eMCJ6jQhDiPzVPV5lQmmJcMPpbRPbfz6gYlmTrLQpGyw6TjpwyY6+eSCgXv
 nWoYgBKKa7d/Jg6F92NrKHs7eaEuDj8dOUWlZ2Dv98KCeZHk0XoRl26Ps/sPgjvEVG+r
 A3MgjDPSFyG+LfEGOjQdJ3lxnkx8TxhWdfMW0aAkGicgDSiOCNMAYTriP+FtHjKqCZdt
 GusRgtKK2qG4Du7fd2SSn1d2JO7qaJGqTpFix35ZgQNR7KWlOGjQxiwON1a4hcH8pbXz
 j6CIsUkXbLiI7dSN+A9ODoVCO+SO7P4b/75v/i4C4r3bEPgv4kRsjr6IkF7sxTaf+fy8
 j8Xw==
X-Gm-Message-State: AOJu0YzyimW1LoKCkmWKZBjshPJOG4NvuuLeLnHybMA1y/mtM/lgeBm2
 nocSF+HAxl3zr77fmmIviE+ptqBOPSJRK76hm0OdZJrvQ9pWjwZMLY5JVYqOGVVOGRcupVNnsDv
 8bNsnU48trF09Aqdj69qtWv676SpXxcvhveez6cdz9yJlhE9R/R4oylSgkwSTmrnjWA==
X-Received: by 2002:a05:600c:3547:b0:426:6773:17 with SMTP id
 5b1f17b1804b1-429d486fe90mr24015785e9.30.1723555204414; 
 Tue, 13 Aug 2024 06:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3sqY+EtSrPjGmB9N5MjiN8A/7rUQ1YM7FJscAwJ52GfiUyLKKNV58BB+IF8XwVW09QbUTg==
X-Received: by 2002:a05:600c:3547:b0:426:6773:17 with SMTP id
 5b1f17b1804b1-429d486fe90mr24015485e9.30.1723555203844; 
 Tue, 13 Aug 2024 06:20:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d781047asm21214815e9.0.2024.08.13.06.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:20:03 -0700 (PDT)
Message-ID: <458cebe8-73d8-4f1f-8ca0-bc6dcaa58c12@redhat.com>
Date: Tue, 13 Aug 2024 15:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/ast: dp501: Use struct drm_edid and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 12/08/2024 11:30, Thomas Zimmermann wrote:
> Convert DP501 support to struct drm_edid and its helpers. Simplifies
> and modernizes the EDID handling.
> 
> The driver reads 4 bytes at once, but the overall read length is now
> variable. Therefore update the EDID read loop to never return more than
> the requested bytes.
> 
> v2:
> - fix reading EDID data

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 59 ++++++++++++---------------------
>   1 file changed, 22 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 478efa226170..0dc37b65e1d7 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -318,32 +318,30 @@ static bool ast_dp501_is_connected(struct ast_device *ast)
>   	return true;
>   }
>   
> -static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
> +static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> -	u32 i, boot_address, offset, data;
> -	u32 *pEDIDidx;
> +	struct ast_device *ast = data;
> +	size_t rdlen = round_up(len, 4);
> +	u32 i, boot_address, offset, ediddata;
>   
> -	if (!ast_dp501_is_connected(ast))
> -		return false;
> +	if (block > (512 / EDID_LENGTH))
> +		return -EIO;
> +
> +	offset = AST_DP501_EDID_DATA + block * EDID_LENGTH;
>   
>   	if (ast->config_mode == ast_use_p2a) {
>   		boot_address = get_fw_base(ast);
>   
> -		/* Read EDID */
> -		offset = AST_DP501_EDID_DATA;
> -		for (i = 0; i < 128; i += 4) {
> -			data = ast_mindwm(ast, boot_address + offset + i);
> -			pEDIDidx = (u32 *)(ediddata + i);
> -			*pEDIDidx = data;
> +		for (i = 0; i < rdlen; i += 4) {
> +			ediddata = ast_mindwm(ast, boot_address + offset + i);
> +			memcpy(buf, &ediddata, min((len - i), 4));
> +			buf += 4;
>   		}
>   	} else {
> -		/* Read EDID */
> -		offset = AST_DP501_EDID_DATA;
> -		for (i = 0; i < 128; i += 4) {
> -			data = readl(ast->dp501_fw_buf + offset + i);
> -			pEDIDidx = (u32 *)(ediddata + i);
> -			*pEDIDidx = data;
> +		for (i = 0; i < rdlen; i += 4) {
> +			ediddata = readl(ast->dp501_fw_buf + offset + i);
> +			memcpy(buf, &ediddata, min((len - i), 4));
> +			buf += 4;
>   		}
>   	}
>   
> @@ -511,29 +509,16 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
>   
>   static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>   {
> -	void *edid;
> -	bool succ;
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +	const struct drm_edid *drm_edid;
>   	int count;
>   
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid)
> -		goto err_drm_connector_update_edid_property;
> -
> -	succ = ast_dp501_read_edid(connector->dev, edid);
> -	if (!succ)
> -		goto err_kfree;
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> +	drm_edid = drm_edid_read_custom(connector, ast_dp512_read_edid_block, ast);
> +	drm_edid_connector_update(connector, drm_edid);
> +	count = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
>   
>   	return count;
> -
> -err_kfree:
> -	kfree(edid);
> -err_drm_connector_update_edid_property:
> -	drm_connector_update_edid_property(connector, NULL);
> -	return 0;
>   }
>   
>   static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,

