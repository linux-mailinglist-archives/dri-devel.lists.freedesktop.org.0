Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6F940A21
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210110E4D5;
	Tue, 30 Jul 2024 07:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aXtsESQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF910E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722325445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvD0LM0jZNh44gWgcKKwhYbQE9f64EyaroAgXAPRcUU=;
 b=aXtsESQPvpataYrEXkA23vDdricTIj+6NWXRR2VIWs1Uj7ct4L+QdTOYJsa+mXjql45R3S
 emSkWzP+LUQaB3xNwHx8xRxDh5l0ORw93a6DkkU8/PXO+Dj991Dkqdt6Bui5LbLjnCcLok
 opo7lyzHdBxxPm1jxhKUh2BaDHVoQe4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-xEzno-nzNyCBZQB5_52U2g-1; Tue, 30 Jul 2024 03:43:59 -0400
X-MC-Unique: xEzno-nzNyCBZQB5_52U2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36b356a73fcso2044861f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722325438; x=1722930238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TvD0LM0jZNh44gWgcKKwhYbQE9f64EyaroAgXAPRcUU=;
 b=KlCMOaxiffVrf57QQ3c07hZnwEeIMrzKJNP31a0mQkNQqCp9pTA4kwUHKy09jeeH9l
 zKEeirJC659MC65xIDV4IArKiU4r8Fv0/pDix3VPwpeHe7CRHQC4UseIuTiGUapRdT3E
 IyjcxZLZOwtalpyW+JHmqVbGuDEwNUxt1FeWn/UaiBK+bO/IvOpDOaCIPUatLg+V0C9W
 OBoOwnAysQmI72ON92zQ7gpjPeSyN0JZLerOsJYezp+javFUUoyhpRZ2AvI0J0GDyEqO
 LjhJdBK0FZy3rfCwMQADDVPVszKrtE+nBiaDm/JzKOS5FceOQFeMhSz0Vans7wHW/JDE
 WmFQ==
X-Gm-Message-State: AOJu0YzIl236YCpzRFFdExM0XARJRFuEFmzfB7eOcdOAz96ZSpr9t+Ds
 3dW1P/ojdmUhqui4Kg2gLixIEh4WO3osXayJY2+ACL/QIkteguOS6zkpY3ou7+Dj6cdqzxDp+nq
 YPbRG8kJvZIGfTRgmU/5h/owRR6AA7On3afhLwuCgTGI7U1vivUQTc2wy9uLgxnkmXA==
X-Received: by 2002:a5d:42d0:0:b0:367:8a2e:b550 with SMTP id
 ffacd0b85a97d-36b5d0cd9a7mr5957922f8f.60.1722325438439; 
 Tue, 30 Jul 2024 00:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxtQntXWuJdGH1MxsWrB41fF2lMxnftGGE6iypzTpZvZq+ojxDkr4wu2NFxxjgMpFbwlb7yQ==
X-Received: by 2002:a5d:42d0:0:b0:367:8a2e:b550 with SMTP id
 ffacd0b85a97d-36b5d0cd9a7mr5957907f8f.60.1722325437873; 
 Tue, 30 Jul 2024 00:43:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36857dcesm13907161f8f.85.2024.07.30.00.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:43:57 -0700 (PDT)
Message-ID: <eabc8bb2-cf0b-4e42-aa1c-1608a0d6e84c@redhat.com>
Date: Tue, 30 Jul 2024 09:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/ast: astdp: Clean up EDID reading
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717143319.104012-6-tzimmermann@suse.de>
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



On 17/07/2024 16:24, Thomas Zimmermann wrote:
> Simplify ast_astdp_read_edid(). Rename register constants. Drop
> unnecessary error handling. On success, the helper returns 0; an
> error code otherwise.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c  | 93 ++++++++++++++++-------------------
>   drivers/gpu/drm/ast/ast_reg.h | 12 +----
>   2 files changed, 44 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 6cbde46f24dc..5d07678b502c 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -17,54 +17,55 @@ bool ast_astdp_is_connected(struct ast_device *ast)
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   {
>   	struct ast_device *ast = to_ast_device(dev);
> -	u8 i = 0, j = 0;
> +	int ret = 0;
> +	u8 i;
>   
> -	/*
> -	 * CRE5[b0]: Host reading EDID process is done
> -	 */
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
> -		goto err_astdp_edid_not_ready;
> -
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
> -							0x00);
> +	/* Start reading EDID data */
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
>   
>   	for (i = 0; i < 32; i++) {
> +		unsigned int j;
> +
>   		/*
>   		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
>   		 */
> -		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE4,
> -				       ASTDP_AND_CLEAR_MASK, (u8)i);
> -		j = 0;
> +		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, i);
>   
>   		/*
>   		 * CRD7[b0]: valid flag for EDID
>   		 * CRD6[b0]: mirror read pointer for EDID
>   		 */
> -		while ((ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD7,
> -				ASTDP_EDID_VALID_FLAG_MASK) != 0x01) ||
> -			(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD6,
> -						ASTDP_EDID_READ_POINTER_MASK) != i)) {
> +		for (j = 0; j < 200; ++j) {
> +			u8 vgacrd7, vgacrd6;
> +
>   			/*
>   			 * Delay are getting longer with each retry.
> -			 * 1. The Delays are often 2 loops when users request "Display Settings"
> +			 *
> +			 * 1. No delay on first try
> +			 * 2. The Delays are often 2 loops when users request "Display Settings"
>   			 *	  of right-click of mouse.
> -			 * 2. The Delays are often longer a lot when system resume from S3/S4.
> +			 * 3. The Delays are often longer a lot when system resume from S3/S4.
>   			 */
> -			mdelay(j+1);
> -
> -			j++;
> -			if (j > 200)
> -				goto err_astdp_jump_out_loop_of_edid;
> +			if (j)
> +				mdelay(j + 1);
> +
> +			/* Wait for EDID offset to show up in mirror register */
> +			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
> +			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
> +				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
> +				if (vgacrd6 == i)
> +					break;
> +			}
> +		}
> +		if (j == 200) {
> +			ret = -EBUSY;
> +			goto out;
>   		}
>   
> -		*(ediddata) = ast_get_index_reg_mask(ast, AST_IO_VGACRI,
> -							0xD8, ASTDP_EDID_READ_DATA_MASK);
> -		*(ediddata + 1) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD9,
> -								ASTDP_EDID_READ_DATA_MASK);
> -		*(ediddata + 2) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDA,
> -								ASTDP_EDID_READ_DATA_MASK);
> -		*(ediddata + 3) = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDB,
> -								ASTDP_EDID_READ_DATA_MASK);
> +		ediddata[0] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd8);
> +		ediddata[1] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd9);
> +		ediddata[2] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xda);
> +		ediddata[3] = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdb);
>   
>   		if (i == 31) {
>   			/*
> @@ -76,29 +77,19 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			 *		The Bytes-126 indicates the Number of extensions to
>   			 *		follow. 0 represents noextensions.
>   			 */
> -			*(ediddata + 3) = *(ediddata + 3) + *(ediddata + 2);
> -			*(ediddata + 2) = 0;
> +			ediddata[3] = ediddata[3] + ediddata[2];
> +			ediddata[2] = 0;
>   		}
>   
>   		ediddata += 4;
>   	}
>   
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
> -							ASTDP_HOST_EDID_READ_DONE);
> -
> -	return 0;
> -
> -err_astdp_jump_out_loop_of_edid:
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
> -							(u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
> -							ASTDP_HOST_EDID_READ_DONE);
> -	return (~(j+256) + 1);
> -
> -err_astdp_edid_not_ready:
> -	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
> -		return (~0xE5 + 1);
> +out:
> +	/* Signal end of reading */
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE,
> +			       AST_IO_VGACRE5_EDID_READ_DONE);
>   
> -	return	0;
> +	return ret;
>   }
>   
>   /*
> @@ -122,9 +113,9 @@ int ast_dp_launch(struct ast_device *ast)
>   		return -ENODEV;
>   	}
>   
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
> -			       (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
> -			       ASTDP_HOST_EDID_READ_DONE);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5,
> +			       (u8) ~AST_IO_VGACRE5_EDID_READ_DONE,
> +			       AST_IO_VGACRE5_EDID_READ_DONE);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 28bb43f6795b..040961cc1a19 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -38,8 +38,10 @@
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
>   #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
> +#define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
>   #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
>   #define AST_IO_VGACRDF_HPD		BIT(0)
> +#define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
>   
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
> @@ -70,12 +72,6 @@
>   #define AST_DP_PHY_SLEEP		BIT(4)
>   #define AST_DP_VIDEO_ENABLE		BIT(0)
>   
> -/*
> - * CRE5[b0]: Host reading EDID process is done
> - */
> -#define ASTDP_HOST_EDID_READ_DONE	BIT(0)
> -#define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
> -
>   /*
>    * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
>    * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
> @@ -84,10 +80,6 @@
>    */
>   #define ASTDP_MIRROR_VIDEO_ENABLE	BIT(4)
>   
> -#define ASTDP_EDID_READ_POINTER_MASK	GENMASK(7, 0)
> -#define ASTDP_EDID_VALID_FLAG_MASK	GENMASK(0, 0)
> -#define ASTDP_EDID_READ_DATA_MASK	GENMASK(7, 0)
> -
>   /*
>    * ASTDP setmode registers:
>    * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)

