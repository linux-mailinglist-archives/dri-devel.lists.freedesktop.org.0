Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CC82A32A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 22:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A20B10E06F;
	Wed, 10 Jan 2024 21:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85A10E656
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 20:51:39 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d9b1589a75so2258351b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704919899; x=1705524699;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dOBazkvMgX805NND/Uz9nsNSYNAIdmzax0775Z5ILnQ=;
 b=WDAonMs95eWpQJ7m5lyjPjIoELTCvJic3FLiCBWwvF76yWmwug0gh0SG1dx+bur2E0
 7gfsOoYikP3kAc7t9WnTsRvDhEW7BPh2AqkIask9kiZmWS91dYeeODR7xQryToNbS2W4
 P33GfVQRDqK5Pm1bAdSTPhDUnYRgEfWzVy0QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704919899; x=1705524699;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dOBazkvMgX805NND/Uz9nsNSYNAIdmzax0775Z5ILnQ=;
 b=s4bl6uiaehoWecjgFlIk8X5jDo1LUDHj4sN31CHfaZ4jUHPk+e/MmKBKPgsAhuKigs
 smCiqcXQueVcmen9TbEKVa0Jp+002WKVqBzgWUDHEj7xkKuxKlGu+DvZJpTvTTqv15/b
 VG9RZuZ1XrLlAumO+qODDBMWr5QBLJll+E2xXZNxUv2ac9jMXKdbLQnuIaiItGAz0JN5
 KcpFsshcBdKUrk9VO4lS2qy6D1AybzBZkNZh4tq2hJ3xYT65vF5M1QOVStAcNDQjpkGD
 4i1jRLOWYuR9E6O2xv/+M5wZFYjm1VS6CbpU/wLDeR9+7GhMf/V8Rzkomp38FtETSm9J
 YhIA==
X-Gm-Message-State: AOJu0YwRFum1te7e8plgA0IST3+dPHgFzoLq68FXLCeDsHk6GHz+TDiA
 k6782FWO8m4wbPQqR2MUR0rr6smeFQs1
X-Google-Smtp-Source: AGHT+IGrznJ6BRQfiWRF3XgwyFwgLMHvH7dK72c50SFsH9eK6+i9kQ932AMv+JS4DP3HOvoPRz7iKg==
X-Received: by 2002:a17:902:6ac4:b0:1d5:73b6:e1df with SMTP id
 i4-20020a1709026ac400b001d573b6e1dfmr151930plt.19.1704919899068; 
 Wed, 10 Jan 2024 12:51:39 -0800 (PST)
Received: from [10.20.136.39] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e80200b001d4e058284esm4094902plg.89.2024.01.10.12.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 12:51:38 -0800 (PST)
Message-ID: <91232aa9-84ce-4417-97aa-449cafdc7d08@broadcom.com>
Date: Wed, 10 Jan 2024 12:51:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix possible null pointer derefence with
 invalid contexts
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
References: <20240110200305.94086-1-zack.rusin@broadcom.com>
Content-Language: en-US
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
In-Reply-To: <20240110200305.94086-1-zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 Jan 2024 21:17:07 +0000
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Niels De Graef <ndegraef@redhat.com>,
 Martin Krastev <martin.krastev@broadcom.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 12:03, Zack Rusin wrote:
> vmw_context_cotable can return either an error or a null pointer and its
> usage sometimes went unchecked. Subsequent code would then try to access
> either a null pointer or an error value.
> 
> The invalid dereferences were only possible with malformed userspace
> apps which never properly initialized the rendering contexts.
> 
> Check the results of vmw_context_cotable to fix the invalid derefs.
> 
> Thanks:
> ziming zhang(@ezrak1e) from Ant Group Light-Year Security Lab
> who was the first person to discover it.
> Niels De Graef who reported it and helped to track down the poc.
> 
> Fixes: 9c079b8ce8bf ("drm/vmwgfx: Adapt execbuf to the new validation api")
> Cc: <stable@vger.kernel.org> # v4.20+
> Reported-by: Niels De Graef  <ndegraef@redhat.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 272141b6164c..4f09959d27ba 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -447,7 +447,7 @@ static int vmw_resource_context_res_add(struct vmw_private *dev_priv,
>  	    vmw_res_type(ctx) == vmw_res_dx_context) {
>  		for (i = 0; i < cotable_max; ++i) {
>  			res = vmw_context_cotable(ctx, i);
> -			if (IS_ERR(res))
> +			if (IS_ERR_OR_NULL(res))
>  				continue;
>  
>  			ret = vmw_execbuf_res_val_add(sw_context, res,
> @@ -1266,6 +1266,8 @@ static int vmw_cmd_dx_define_query(struct vmw_private *dev_priv,
>  		return -EINVAL;
>  
>  	cotable_res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXQUERY);
> +	if (IS_ERR_OR_NULL(cotable_res))
> +		return cotable_res ? PTR_ERR(cotable_res) : -EINVAL;
>  	ret = vmw_cotable_notify(cotable_res, cmd->body.queryId);
>  
>  	return ret;
> @@ -2484,6 +2486,8 @@ static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
>  		return ret;
>  
>  	res = vmw_context_cotable(ctx_node->ctx, vmw_view_cotables[view_type]);
> +	if (IS_ERR_OR_NULL(res))
> +		return res ? PTR_ERR(res) : -EINVAL;
>  	ret = vmw_cotable_notify(res, cmd->defined_id);
>  	if (unlikely(ret != 0))
>  		return ret;
> @@ -2569,8 +2573,8 @@ static int vmw_cmd_dx_so_define(struct vmw_private *dev_priv,
>  
>  	so_type = vmw_so_cmd_to_type(header->id);
>  	res = vmw_context_cotable(ctx_node->ctx, vmw_so_cotables[so_type]);
> -	if (IS_ERR(res))
> -		return PTR_ERR(res);
> +	if (IS_ERR_OR_NULL(res))
> +		return res ? PTR_ERR(res) : -EINVAL;
>  	cmd = container_of(header, typeof(*cmd), header);
>  	ret = vmw_cotable_notify(res, cmd->defined_id);
>  
> @@ -2689,6 +2693,8 @@ static int vmw_cmd_dx_define_shader(struct vmw_private *dev_priv,
>  		return -EINVAL;
>  
>  	res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXSHADER);
> +	if (IS_ERR_OR_NULL(res))
> +		return res ? PTR_ERR(res) : -EINVAL;
>  	ret = vmw_cotable_notify(res, cmd->body.shaderId);
>  	if (ret)
>  		return ret;
> @@ -3010,6 +3016,8 @@ static int vmw_cmd_dx_define_streamoutput(struct vmw_private *dev_priv,
>  	}
>  
>  	res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_STREAMOUTPUT);
> +	if (IS_ERR_OR_NULL(res))
> +		return res ? PTR_ERR(res) : -EINVAL;
>  	ret = vmw_cotable_notify(res, cmd->body.soid);
>  	if (ret)
>  		return ret;

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>

