Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DC94CF66
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C316B10E8C8;
	Fri,  9 Aug 2024 11:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LLQU+Wtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367B710E8C8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723203389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSyqcSB5KDuAvbySARP6kYv+pQ6Yfq7xWsIokKrsD8o=;
 b=LLQU+WtcIcig3y9099CQopTJN7ACOhmjriVxZ/zGoZ/LXuRruRi5KUC573lRQ2wpCMzI8Z
 krakTij2e9Znv/XN5HgbMpLNwxdf6gCwmjWAsyKfDhtYBQzBGrvJIfS1yyvfrBuVpYo536
 KMyHUjplUopeOkJfEpImIRI4dpGZHH8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-lBncq9bIOuG53qNAiYlrDA-1; Fri, 09 Aug 2024 07:36:27 -0400
X-MC-Unique: lBncq9bIOuG53qNAiYlrDA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3684ea1537fso880515f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 04:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723203386; x=1723808186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fSyqcSB5KDuAvbySARP6kYv+pQ6Yfq7xWsIokKrsD8o=;
 b=S+jVVSCIxVuQabdI+dDhsK6WeVsFUKug10HL2+sEF4asRb8FkoC/IdDvLN0eZ4Eep8
 K2XS04vNjr2pn1wYsFoa/PMzO8Tp3Y/4LxKLmEQw3LzScFc5QpLFv616BB9zbHucFOpa
 GAKKRV+uibgoF5+MIi4qNCTPehmMOqL3nsnLI8CF/aqDEYuwYmGE4JvpC9I1Sn1K3AVp
 B/+nhpqkpbhrG+oA3GJkF3cFw0FqhTwOcEUni4jt10S+EwU71sX4aq0bl2LuJMJJo+dT
 ZlBoyI3QyclVR8F/6ljbHmulgZiXW+RvMLaij6cglN+U+sWDJpy0BLW1RRYfSwlxGaL6
 YTkQ==
X-Gm-Message-State: AOJu0YwxWkpLIbT6+84SjKFsZGU/TBYMHocXIzoe3hJMwkIVp/hdA8Xo
 RK97FGDkkarQJNzuplidp8KDZTETfYK8XfBtCJjPXzjaA0D/ITAGhQVtyk9TKUqrjX7zNVjWdsD
 uYJIGLnItk1lrf1nMAV7MlCD7KZdUiwMuko+ZRlpqmnqXMyLp58GOPrVcdvE4oV0BKw==
X-Received: by 2002:adf:b197:0:b0:367:4ddf:385c with SMTP id
 ffacd0b85a97d-36d5f3c8638mr1064606f8f.6.1723203386572; 
 Fri, 09 Aug 2024 04:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlxogHCFQLi+fN5tgbeh/uDs/AF1//xck4JNY+hzalcqYtyQhD581aqrYNvdxg1TH8Z6AWhw==
X-Received: by 2002:adf:b197:0:b0:367:4ddf:385c with SMTP id
 ffacd0b85a97d-36d5f3c8638mr1064581f8f.6.1723203386027; 
 Fri, 09 Aug 2024 04:36:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d2718c020sm5042984f8f.55.2024.08.09.04.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 04:36:25 -0700 (PDT)
Message-ID: <99d85d28-75bd-4042-9036-f4b111405ca4@redhat.com>
Date: Fri, 9 Aug 2024 13:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/ast: dp501: Use struct drm_edid and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240806125601.78650-1-tzimmermann@suse.de>
 <20240806125601.78650-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240806125601.78650-6-tzimmermann@suse.de>
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



On 06/08/2024 14:52, Thomas Zimmermann wrote:
> Convert DP501 support to struct drm_edid and its helpers. Simplifies
> and modernizes the EDID handling.
> 
> The driver reads 4 bytes at once, but the overall read length is now
> variable. Therefore update the EDID read loop to never return more than
> the requested bytes.

Thanks for this patch.
I don't have a hardware to test, but I think it may break the EDID reading.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 92 ++++++++++++++++++++-------------
>   1 file changed, 55 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 478efa226170..1c5a4902d4c2 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -318,32 +318,63 @@ static bool ast_dp501_is_connected(struct ast_device *ast)
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
> +		for (i = 0; i < len; i += 4) {
> +			ediddata = ast_mindwm(ast, boot_address + offset + i);

I think "i" is always a multiple of 4, so the switch case is broken, and 
will always go to case 0, so reading only 1 byte every 4 bytes ?

> +
> +			switch (i % 4) {
> +			case 3:
> +				*buf = (ediddata >> 24) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 2:
> +				*buf = (ediddata >> 16) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 1:
> +				*buf = (ediddata >> 8) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 0:
> +				*buf = (ediddata) & 0xff;
> +				++buf;
> +				break;
> +			}
>   		}
>   	} else {
> -		/* Read EDID */
> -		offset = AST_DP501_EDID_DATA;
> -		for (i = 0; i < 128; i += 4) {
> -			data = readl(ast->dp501_fw_buf + offset + i);
> -			pEDIDidx = (u32 *)(ediddata + i);
> -			*pEDIDidx = data;
> +		for (i = 0; i < len; i += 4) {
> +			ediddata = readl(ast->dp501_fw_buf + offset + i);
> +
> +			switch (i % 4) {
> +			case 3:
> +				*buf = (ediddata >> 24) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 2:
> +				*buf = (ediddata >> 16) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 1:
> +				*buf = (ediddata >> 8) & 0xff;
> +				++buf;
> +				fallthrough;
> +			case 0:
> +				*buf = (ediddata) & 0xff;
> +				++buf;
> +				break;
> +			}
>   		}
>   	}
>   
> @@ -511,29 +542,16 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
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

