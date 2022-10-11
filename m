Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E58A5FB8FF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 19:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D39410E8A9;
	Tue, 11 Oct 2022 17:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C12610E8A9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665508414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPa6skpw+HR/XZWI2MvLpCGSoFPnjMvvsoBLNia0jKA=;
 b=INnN+dFpbnOoc9f+GLDitp+UMq0vIFsilq0AHSkN11E4iingWxXFXolwO3rZMvgTYv+7FN
 2BGeBwdZ6mWGLMAiKYpybQMJnhG2CP+RFss94e5s4lpOMX4znNPkYeBTlteCWVA3mROqwr
 +SXEP1Zk9nRVYGMHfcYre/yIUHvcx7w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-4A1HXIyZOu2kSN-ykPdksA-1; Tue, 11 Oct 2022 13:13:25 -0400
X-MC-Unique: 4A1HXIyZOu2kSN-ykPdksA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so8732836wmq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 10:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPa6skpw+HR/XZWI2MvLpCGSoFPnjMvvsoBLNia0jKA=;
 b=UE76H0XBlmAwuelXCMIiu3BiVFhGkYNtiEJdPLgAWgI8V+2LtZeR494G7W6xgoNmWk
 V8pW7WAFtnmjPj/YuYc1nVSzNN4FxHKQOoMVrQIODlEKe+Q9J7dIq4mzRHKg0XNkXCsT
 qP+/++tvPsap+g9LTV6un4KqpT0HuW0OTOnNK+xesRkVL66wXRtDPshmkmVWDLG0Tbki
 twhWYQZY/zlt4yqmD43OSePo21jbxFU9IjV7bFOYohNQvrBoR6brMi4ZOlcgS5dxcYLH
 7I4ScD4O7tyyIumdBpVRULD0216DVz/FCqh5bneE3LXTaQvuzZ8a+w2bmQvYlDLkoH+L
 Rzfw==
X-Gm-Message-State: ACrzQf11Eg2kMfxDljziENGDZDW1cHBim3VD7GH5MIFDGoBL1f4J24xz
 jJ4pZfbb7sTwpiBxmOxPAttg2Wdj4M4JQNslco+0Ey5VS6dQxdNkrnopNqiHAshJUr1ku2qU8i5
 9yAjey+B2xHq0s6SCCrEfUve+qIG0
X-Received: by 2002:a1c:1983:0:b0:3be:e4ee:10d9 with SMTP id
 125-20020a1c1983000000b003bee4ee10d9mr104937wmz.44.1665508404262; 
 Tue, 11 Oct 2022 10:13:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Zf3cew/xc2a5Ney6CNJIBo7jJ2GnbHNtS8yjnSVU2FKzEMLiV5VQiEa5FvNtaVKVNkCluUQ==
X-Received: by 2002:a1c:1983:0:b0:3be:e4ee:10d9 with SMTP id
 125-20020a1c1983000000b003bee4ee10d9mr104923wmz.44.1665508404010; 
 Tue, 11 Oct 2022 10:13:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 bt7-20020a056000080700b0022e62529888sm12183305wrb.67.2022.10.11.10.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 10:13:23 -0700 (PDT)
Message-ID: <2e80d7f8-a12f-5e19-ba3f-753de6c7a604@redhat.com>
Date: Tue, 11 Oct 2022 19:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/8] drm/ast: Acquire I/O-register lock in
 atomic_commit_tail function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20221010103625.19958-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 12:36, Thomas Zimmermann wrote:
> Hold I/O-register lock in atomic_commit_tail to protect all pipeline
> updates at once. Protects modesetting against concurrent EDID reads.
> 
> Complex modesetting operations involve mode changes and plane updates.
> These steps used to be protected individually against concurrent I/O.
> Make all this atomic wrt to reading display modes via EDID. The EDID
> code in the conenctor's get_modes helper already acquires the necessary
small typo:  connector's

> lock.
> 
> A similar issue was fixed in commit 2d70b9a1482e ("drm/mgag200: Acquire
> I/O-register lock in atomic_commit_tail function") for mgag200.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 34 ++++++++++++++++------------------
>   1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index d5ee3ad538a8..e1e07928906e 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1200,20 +1200,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>   	return drm_atomic_add_affected_planes(state, crtc);
>   }
>   
> -static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	struct ast_private *ast = to_ast_private(dev);
> -
> -	/*
> -	 * Concurrent operations could possibly trigger a call to
> -	 * drm_connector_helper_funcs.get_modes by trying to read the
> -	 * display modes. Protect access to I/O registers by acquiring
> -	 * the I/O-register lock. Released in atomic_flush().
> -	 */
> -	mutex_lock(&ast->ioregs_lock);
> -}
> -
>   static void
>   ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   			     struct drm_atomic_state *state)
> @@ -1241,8 +1227,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   	//Set Aspeed Display-Port
>   	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>   		ast_dp_set_mode(crtc, vbios_mode_info);
> -
> -	mutex_unlock(&ast->ioregs_lock);
>   }
>   
>   static void
> @@ -1301,7 +1285,6 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>   static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
>   	.mode_valid = ast_crtc_helper_mode_valid,
>   	.atomic_check = ast_crtc_helper_atomic_check,
> -	.atomic_begin = ast_crtc_helper_atomic_begin,
>   	.atomic_flush = ast_crtc_helper_atomic_flush,
>   	.atomic_enable = ast_crtc_helper_atomic_enable,
>   	.atomic_disable = ast_crtc_helper_atomic_disable,
> @@ -1771,8 +1754,23 @@ static int ast_astdp_output_init(struct ast_private *ast)
>    * Mode config
>    */
>   
> +static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *state)
> +{
> +	struct ast_private *ast = to_ast_private(state->dev);
> +
> +	/*
> +	 * Concurrent operations could possibly trigger a call to
> +	 * drm_connector_helper_funcs.get_modes by trying to read the
> +	 * display modes. Protect access to I/O registers by acquiring
> +	 * the I/O-register lock. Released in atomic_flush().
> +	 */
> +	mutex_lock(&ast->ioregs_lock);
> +	drm_atomic_helper_commit_tail_rpm(state);
> +	mutex_unlock(&ast->ioregs_lock);
> +}
> +
>   static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs = {
> -	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +	.atomic_commit_tail = ast_mode_config_helper_atomic_commit_tail,
>   };
>   
>   static const struct drm_mode_config_funcs ast_mode_config_funcs = {

Best regards,

-- 

Jocelyn

