Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB2BD7FE1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B475010E573;
	Tue, 14 Oct 2025 07:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G0O6e+dN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139E010E570
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuL2StPvoHqfPKlji0n6gMA9cQYlL86+raj4IYDsJ3U=;
 b=G0O6e+dNDYG8ig3Nyoa2C6YdPVlhulE6AtJcqSBcRgKBvWo6Api4yvn1A7/AJ+sWPx/zhU
 ZF5E4/tmf6HQRcezACYzjrqmEo6nWxnYSiztyOJYLa3XoyzKHF3M18I1UUzhbn+gKB+A7e
 /wynywUAI/jr3bRHvfvpTZPERh/R0wg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-cVdj_nypMKeYqbGrtW7hWA-1; Tue, 14 Oct 2025 03:46:07 -0400
X-MC-Unique: cVdj_nypMKeYqbGrtW7hWA-1
X-Mimecast-MFC-AGG-ID: cVdj_nypMKeYqbGrtW7hWA_1760427962
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-426d3ee72f5so2326363f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427962; x=1761032762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuL2StPvoHqfPKlji0n6gMA9cQYlL86+raj4IYDsJ3U=;
 b=HLlEjyRuRobaYihe1iy4GCURSsXRQjVGxwNnHmVoRsGEjgEc/EErFy5gzFjGpyoXp2
 StqkU0itU9UySdKm1rJ43ZwRZpvw39rRaV+soRJp/BtreITvCctL/eDpLJomTwwlIun+
 NJqR2GUnqlBea4WE61zGQIk4FRP5fPUnLryVlJrqoFHkfj7Zg4gvGdTOzlLxYd+EPY3q
 meyncXtav0XXkXCA+P6tXlMxYkCRf1TCC1VSIycvz5VSAN29I/vqrH1BCBGwiiJhL558
 D8iT46g0L5ID0iwtJ6deE8+0pgt/rHdQqrmmmU/HGOUV1tfJJGefiPWz7Okx+gYq0hel
 oqYw==
X-Gm-Message-State: AOJu0YzI2K1Ow36zXLJD+R6VXTHOpG3nzgdl9KBcq+ZogsT8XQrVebNf
 fFzsHHUn0zCmbQkbvnKPpHJqbVGGkI0RIiox8XfJaimsp0JYOR0Biq3iJC63p/24Fia/nv0OsYt
 JeA4mFJOcfgzkeZxQgx/Hw8Qp05FdeTnkVG3sk8Zk7/MLejBs0mXTLJq2A7E1W/hZwG/ZLQ==
X-Gm-Gg: ASbGncuCLOPOFP8gvh8Ug4FtzQSAIGvO42xo9SVrrwTLNzzXaBRNrY6nEibs7eNW4HF
 S+oduAyQlUqqg93zSILthT803qGpFgrXZypvio4UT3DY7nOL55pMY6aDBqSOdlfPRxLpfP7qS0g
 zU0G3UcGTB8FwfcLLxYbt33m0/r5LeXCDh/4m5gclVrK3mAZq1uqVw2fumTASdDIVaGL8tieIg8
 0lQrxEOrH8ebNReM9Y3YInKDppnVNsojZgH+wjcSKxCoNFr29hgPl37qqSYxTsweagiu78DA6Sk
 uy7fz1Az60/8A7YcF/C+EtqxEVNlAyEAOS3rP/CVKlWOPMbAA7oIQiXStwLt+GdI/+VZKAdrvlz
 P+PJ/
X-Received: by 2002:a05:6000:18a9:b0:3f7:ce62:ce17 with SMTP id
 ffacd0b85a97d-4266e7d4406mr16641436f8f.38.1760427961669; 
 Tue, 14 Oct 2025 00:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNM2xo5ZLQVou/pRRKjxY8bstP/7kfFBfLgBcA4Pk8KnQSXsywIOTGa19BsGCsqd8RxGUA8g==
X-Received: by 2002:a05:6000:18a9:b0:3f7:ce62:ce17 with SMTP id
 ffacd0b85a97d-4266e7d4406mr16641422f8f.38.1760427961280; 
 Tue, 14 Oct 2025 00:46:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf71dsm21480168f8f.29.2025.10.14.00.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:46:00 -0700 (PDT)
Message-ID: <9ad17cb1-3e09-4082-b52b-0b218812f114@redhat.com>
Date: Tue, 14 Oct 2025 09:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Blank with VGACR17 sync enable, always clear
 VGACRB6 sync off
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dianders@chromium.org, nbowler@draconx.ca
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20251010080233.21771-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251010080233.21771-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGe1xVjLSyzwWIMqkWeBT9msKu-pBSDsWW97B9mXTr0_1760427962
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

On 10/10/2025 10:02, Thomas Zimmermann wrote:
> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> by reenabling them. This VGA setting should be supported by all Aspeed
> hardware.
> 
> Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
> VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
> not reenable it after the soft reset. The display output remains dark.
> When the display is off during boot, some BMCs set the sync-off bits in
> VGACRB6, so the display remains dark. Observed with Blackbird AST2500
> BMC. Clearing the sync-off bits unconditionally fixes these issues.
> 
> Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
> access to video memory.

One comment below:>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: ce3d99c83495 ("drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers")
> Tested-by: Nick Bowler <nbowler@draconx.ca>
> Reported-by: Nick Bowler <nbowler@draconx.ca>
> Closes: https://lore.kernel.org/dri-devel/wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi/
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.7+
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 18 ++++++++++--------
>   drivers/gpu/drm/ast/ast_reg.h  |  1 +
>   2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6b9d510c509d..fe8089266db5 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
> +	u8 vgacr17 = 0x00;
> +	u8 vgacrb6 = 0x00;
>   
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
> +	vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;
> +	vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
As vgacrb6 is 0, then this "&=" shouldn't do anything?

> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>   }
>   
>   static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
>   	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>   	struct ast_device *ast = to_ast_device(crtc->dev);
> -	u8 vgacrb6;
> +	u8 vgacr17 = 0xff;
>   
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
> -
> -	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
> -		  AST_IO_VGACRB6_HSYNC_OFF;
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
> +	vgacr17 &= ~AST_IO_VGACR17_SYNC_ENABLE;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
>   
>   	/*
>   	 * HW cursors require the underlying primary plane and CRTC to
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index e15adaf3a80e..30578e3b07e4 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -29,6 +29,7 @@
>   #define AST_IO_VGAGRI			(0x4E)
>   
>   #define AST_IO_VGACRI			(0x54)
> +#define AST_IO_VGACR17_SYNC_ENABLE	BIT(7) /* called "Hardware reset" in docs */
>   #define AST_IO_VGACR80_PASSWORD		(0xa8)
>   #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)

