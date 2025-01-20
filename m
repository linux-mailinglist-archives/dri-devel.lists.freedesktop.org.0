Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86BA16AE1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8C10E3A9;
	Mon, 20 Jan 2025 10:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I3boEMYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B5210E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFBd7xCFUgFBxjTm9s+cRP4KUg7C27uvmKyc8RpRxQM=;
 b=I3boEMYrIJtQZ2qhH6Cd2WeII0tvwe/nN1xsg15XmbBAJOTw+gJe/BonSXiT22b1YNm5zh
 7+7htTdG92AQFNLKRTFkohdGUdsM0ZMXuWEEshSetwEAvNJbgbFoTWUTanokqTOOal9Z8K
 69FTBjRw1lwSN64G3NuHeB/ey0YQ5U8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-4QZYrCwUOCiNoYf9o_doEw-1; Mon, 20 Jan 2025 05:37:20 -0500
X-MC-Unique: 4QZYrCwUOCiNoYf9o_doEw-1
X-Mimecast-MFC-AGG-ID: 4QZYrCwUOCiNoYf9o_doEw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43626224274so23196355e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369439; x=1737974239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fFBd7xCFUgFBxjTm9s+cRP4KUg7C27uvmKyc8RpRxQM=;
 b=XLpc7mPmtQpFw9zckBLusDye0NePvnITrZpUhEYsBz9ig/3sX41DR9AVDf9NZ8Gebt
 /d/MDqsv0EKAyb9q+7Ay0T3IOV+8FPJy7PKBzdsmFnvaNHjSQIRbuSdpoGWKZVFaGwpm
 xfRe/U/KImuvbun3z9JIo3CiPI/wR30fKI0QUgPYSMm52uIU7pYUWmcd4khL1szgTVwX
 qfS9gZsdaoCSVyZTCOU9LfVe3rZEtSVwCusBuazyYW/P61iNi3z9sCjH8TzO4JPGUKUW
 bY+H/DUWiTRwzrju+Me/zudGNYGX9kVlxAQ+7UcqlJ5ic0Qik7ut/n73JX1qWD9MoZ7+
 4dPA==
X-Gm-Message-State: AOJu0YzJ1B4KWGDnOcfHz+jY/hP1N3eFpGIGfdfltPokmz3IPW2RJ+jt
 uHL9NfwCfF74nifo0An2lQUYas4+W/0WhJ0GTRudyqIr1em2/VjLRvBgGz4pmU21uQ2hRYX9zej
 gCWDKqC/M3fyv1q/F2aN+X3rniKAJ2psYUf/qniy/me4sPKUGfT6c1veFRFjEuy3Lkg==
X-Gm-Gg: ASbGncum7d2yoZr/2GXHJZel6UVVYag2H/qtl8wvInuytQnRVRzRzUsho3omuEmkCe8
 R4Je6eyQ1UpoJ/Xetscntp1qzvSmtZo+/+1JIsMb4kr782jcfCvkDRiItaibMJM8FyASyIq5VEW
 350IIcDRoLbdYLhfLTctqc2hMuBi3A3CMX+zNprQKIm/iMvbegyDR/GJrVoVxfDwpTE5eiCc4KW
 fvzXdMcFnE9mZrEE56hwybo0NzhLOFmLWU5oA5edSNr9GML0zvih4l7fyBydi8BW9L4sKN/N2WK
 y+yC7+I9bv3SxsGn35s6fNtr9pXDJlxFhw==
X-Received: by 2002:a7b:cc8f:0:b0:438:a214:52f4 with SMTP id
 5b1f17b1804b1-438a2145332mr57918055e9.25.1737369439207; 
 Mon, 20 Jan 2025 02:37:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXlFS044a4QKkY1/6dG3/XjiTIfaB9ZjvIiZ0aHeGuBDp85phz4fAOh44WCw4ZfpPJNBFJZA==
X-Received: by 2002:a7b:cc8f:0:b0:438:a214:52f4 with SMTP id
 5b1f17b1804b1-438a2145332mr57917825e9.25.1737369438848; 
 Mon, 20 Jan 2025 02:37:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890461fc6sm136098005e9.29.2025.01.20.02.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:37:18 -0800 (PST)
Message-ID: <0fc51a94-fdf1-43cf-82aa-d0b0a673f1ca@redhat.com>
Date: Mon, 20 Jan 2025 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/ast: Hide Gens 1 to 3 TX detection in branch
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-6-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: orVE0j9sXcq6kioPUNPvkfHudsLwyBPPOKYgO5t496Y_1737369439
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

On 17/01/2025 11:29, Thomas Zimmermann wrote:
> Gen7 only supports ASTDP. Gens 4 to 6 support various TX chips,
> except ASTDP. These boards detect the TX chips by reading the SoC
> scratch register as VGACRD1.
> 
> Gens 1 to 3 only support SIL164. These boards read the DVO bit from
> VGACRA3. Hence move this test behind a branch, so that it does not
> run on later generations.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 474eb255b325b..50b57bc15d53c 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -96,21 +96,21 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
>   	/* Check 3rd Tx option (digital output afaik) */
>   	ast->tx_chip = AST_TX_NONE;
>   
> -	/*
> -	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> -	 * enabled, in that case, assume we have a SIL164 TMDS transmitter
> -	 *
> -	 * Don't make that assumption if we the chip wasn't enabled and
> -	 * is at power-on reset, otherwise we'll incorrectly "detect" a
> -	 * SIL164 when there is none.
> -	 */
> -	if (!need_post) {
> -		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> -		if (jreg & 0x80)
> -			ast->tx_chip = AST_TX_SIL164;
> -	}
> -
> -	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
> +	if (AST_GEN(ast) <= 3) {
> +		/*
> +		 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
> +		 * enabled, in that case, assume we have a SIL164 TMDS transmitter
> +		 *
> +		 * Don't make that assumption if we the chip wasn't enabled and
> +		 * is at power-on reset, otherwise we'll incorrectly "detect" a
> +		 * SIL164 when there is none.
> +		 */
> +		if (!need_post) {
> +			jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
> +			if (jreg & 0x80)
> +				ast->tx_chip = AST_TX_SIL164;
> +		}
> +	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
>   		/*
>   		 * On AST GEN4+, look the configuration set by the SoC in
>   		 * the SOC scratch register #1 bits 11:8 (interestingly marked

