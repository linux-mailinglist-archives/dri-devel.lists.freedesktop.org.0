Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C76950642
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B21E10E343;
	Tue, 13 Aug 2024 13:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KExI0w/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F327610E343
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+n0lEFXQiakic5mICLW3nKNJkjEJrb7yW+gL0DpIp4=;
 b=KExI0w/Cshg37jFypQ/g2td0yLLDgF5jXOIp8wt5YQoyUFk1HGRcZ44tAScfNbuIW/T4I+
 X4Ml5hyC8IMpM6j6PADcx86YdymQUP/O9QSfPh6P9SBbMl2N5IizVZXsvESbLZjtyLy7ga
 1taIvp+n4iPMHe+Th6SbOfLDcPwotlg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-Dla9-ahtOLeTeaspnw_7ag-1; Tue, 13 Aug 2024 09:18:47 -0400
X-MC-Unique: Dla9-ahtOLeTeaspnw_7ag-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ef3157ae4cso60649831fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555126; x=1724159926;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p+n0lEFXQiakic5mICLW3nKNJkjEJrb7yW+gL0DpIp4=;
 b=lGKx+U+2q0t9XwNAAspfDTYfKSGeft6H5ML07iGqaCmYD7DlukEYicOk5dPJ9pVWkT
 zI8XpPll5JpnPZfZhLZp8axdWHQ2BRCDeZpXaxL5tH+5fScPGJXMeKkDvqnerN/0aK6E
 OC6MDz5Mz6JfWgR58cbRMoLSt6Vt1auOVqJkXeWyx+hteyk/O3R0HzTLH3tX/LVgAvS/
 sSZB6K49M5uuVNdBX2RdcCQO4btIJ23evTpoo+xGkMNPcaZ65evy/9IReELiSTiVUYrV
 ZI/iyQXYyy4p8IXXB9OXthCWvV/0wLswHECkJgjAjewgFJjpwxS3F3ZT6Z0PBdGG4qpa
 3qsw==
X-Gm-Message-State: AOJu0YwJ37oOlkVE8zpFgrE4HHk8LEDqI6fpwEyRwp/qmfjp7S5utMW3
 O92Ntm5/SfC3i00gSQgpBMpZzhx5vZ+m4c5jut6zxSG+O7CmqDCYhrfK7hfxV9ZIl0qgacyZWde
 XTFs/ws0D8sJ0/y0uycOgUnYu2lwmmqyYEcHco+ipIo7jUn244wZqa+UT2Nqw5ZEd/A==
X-Received: by 2002:a05:651c:b2b:b0:2ef:2e3f:35d9 with SMTP id
 38308e7fff4ca-2f2b717f3e9mr36051371fa.33.1723555126127; 
 Tue, 13 Aug 2024 06:18:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkybhiZF/xDNIPVNLOTHJunDzf6OI6zVhndAN+ciDxzokpf2I6N4aZl1TwvksuDWw9znu7BQ==
X-Received: by 2002:a05:651c:b2b:b0:2ef:2e3f:35d9 with SMTP id
 38308e7fff4ca-2f2b717f3e9mr36051001fa.33.1723555125454; 
 Tue, 13 Aug 2024 06:18:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e18csm70053466b.177.2024.08.13.06.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:18:44 -0700 (PDT)
Message-ID: <dfe28c0e-20ab-4d9e-9f7b-8a4fad5ecc34@redhat.com>
Date: Tue, 13 Aug 2024 15:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/ast: astdp: Use struct drm_edid and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-4-tzimmermann@suse.de>
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
> Convert ASTDP support to struct drm_edid and its helpers. Simplifies
> and modernizes the EDID handling.
> 
> The driver reads 4 bytes at once, but the overall read length is now
> variable. Therefore update the EDID read loop to never return more than
> the requested bytes.
> 
> The device does not seem to support EDID extensions, as the driver
> actively clears any such information from the main EDID header. As
> the new interface allows for reading extension blocks for EDID, make
> sure that the block is always 0 (i.e., the main header). A later
> update might fix that.
> 
> v2:
> - fix reading if len is not a multiple of 4

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 55 +++++++++++++++++++-----------------
>   1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 217c155f0874..22c4f2a126e9 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -20,11 +20,15 @@ static bool ast_astdp_is_connected(struct ast_device *ast)
>   	return true;
>   }
>   
> -static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
> +static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct ast_device *ast = data;
> +	size_t rdlen = round_up(len, 4);
>   	int ret = 0;
> -	u8 i;
> +	unsigned int i;
> +
> +	if (block > 0)
> +		return -EIO; /* extension headers not supported */
>   
>   	/*
>   	 * Protect access to I/O registers from concurrent modesetting
> @@ -35,13 +39,23 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	/* Start reading EDID data */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
>   
> -	for (i = 0; i < 32; i++) {
> +	for (i = 0; i < rdlen; i += 4) {
> +		unsigned int offset;
>   		unsigned int j;
> +		u8 ediddata[4];
> +		u8 vgacre4;
> +
> +		offset = (i + block * EDID_LENGTH) / 4;
> +		if (offset >= 64) {
> +			ret = -EIO;
> +			goto out;
> +		}
> +		vgacre4 = offset;
>   
>   		/*
>   		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
>   		 */
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, i);
> +		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, vgacre4);
>   
>   		/*
>   		 * CRD7[b0]: valid flag for EDID
> @@ -65,7 +79,7 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
>   			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
>   				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
> -				if (vgacrd6 == i)
> +				if (vgacrd6 == offset)
>   					break;
>   			}
>   		}
> @@ -93,7 +107,8 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			ediddata[2] = 0;
>   		}
>   
> -		ediddata += 4;
> +		memcpy(buf, ediddata, min((len - i), 4));
> +		buf += 4;
>   	}
>   
>   out:
> @@ -330,29 +345,17 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>   
>   static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   {
> -	void *edid;
> -	int succ;
> +	struct drm_device *dev = connector->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +	const struct drm_edid *drm_edid;
>   	int count;
>   
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid)
> -		goto err_drm_connector_update_edid_property;
> -
> -	succ = ast_astdp_read_edid(connector->dev, edid);
> -	if (succ < 0)
> -		goto err_kfree;
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> +	drm_edid = drm_edid_read_custom(connector, ast_astdp_read_edid_block, ast);
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
>   static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,

