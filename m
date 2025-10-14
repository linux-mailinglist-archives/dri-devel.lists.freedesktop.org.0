Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78EBD84B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271DC10E57F;
	Tue, 14 Oct 2025 08:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SOSdCEFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889810E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760432069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAy88YMnGtIP/uqwpz5GQHTqHQIlvLAglo0Pv+LXXqc=;
 b=SOSdCEFN3QajJOqwlvggNPfUIlnd8j9fknf8OMRbDdIQpUrQBXEXwL0ZE4Ad0AhaBHkdYO
 RRbaOcf8xfSaA9XPbBSWIAY39OLIbr7XmqVrunqQi+CslHz7fqf6ss2rCQleQRX/x43wOV
 W02+D2cVtdwqrfWHqVz2YAUa2AmaLyE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-62DyzaVHM0e756IlHWceTw-1; Tue, 14 Oct 2025 04:54:28 -0400
X-MC-Unique: 62DyzaVHM0e756IlHWceTw-1
X-Mimecast-MFC-AGG-ID: 62DyzaVHM0e756IlHWceTw_1760432067
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-426ce339084so3752393f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 01:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760432067; x=1761036867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAy88YMnGtIP/uqwpz5GQHTqHQIlvLAglo0Pv+LXXqc=;
 b=LAKD9meE6ox6KqY4byzYMTpBjwzxXFNZo53Pv3ku77r9GbflCi/LC2O5Se7HNXELoa
 nGaidzekcIc7wsY5hrtvESj54oGGOgCvUDR3pXsNNDhu5YqLuf2k73RurEjN0SIAAdbX
 ayKkRb3lxef4AG+ygQHni9tGcmzU77q8oHkcBSTU7/LtQw0/CzMmWGXBrUanlL+AX70l
 Yye3QUmNp98sZoI6VRgW6hdDGsD1pPz4Rm7cskGSPYJ6PbpYA44Qw1qeP6IjOJwrDE//
 ZKUyNc9MJWi0TKP4i+/YyI8sYkN36YtvqAiFjxz4iODwuMvqrs34iRzJ3WineV2IaeNC
 +GVA==
X-Gm-Message-State: AOJu0YzUzak0Tpi1lm1XST3FHDOBln/0broSWmPA3MKNzFlg/SMhUOjd
 EcH0A/SIoU6VCWucmbryE/qHhw5+BbeZWkb/LwZAk4cO3iKVu2ne7GOy7c3cId+W6fEacql1mZE
 mBJSK2ofT4Po3zpf8lsrhe7egDO0h76Qq9j9oAZyfyd6zsvI8qAeEKXM44WRQ0t0ZAx4oTw==
X-Gm-Gg: ASbGncvfWSWGmYJDdDGqj99SU/buK9iclm8/4Ji6BTrui9KtV5UCS+he5OWBpyCXiv4
 heHrX9vSSUWlcjOCoW/Un+e+VBu6sBQiuotPhjDtOHi20tafiPoZnph2eRoOQ1tfgP8COh66tuv
 3Q+F//H8qWPVLZ1Lx/AiJz9BtrsP967UnfnuExMUG8mesGillQTvmtN+OPO1wos7XhfwCwa9hNJ
 B/AINJ4hO6pFvNjumBHnqpRgEKpsKM3A1V4mJjMHE38vIsHEZDMuee9f78cwoxai/JdXT4ISaFp
 eQm63qSdALhcD7blfWT2+p0Q5LgBUGOReTBaPuvW0lhBZzehMDvB8nXPauCUGCBowWjt9JGzs6O
 OgUwz
X-Received: by 2002:a05:6000:240d:b0:425:7c3c:82cf with SMTP id
 ffacd0b85a97d-4266e7cdc8fmr17010193f8f.11.1760432066928; 
 Tue, 14 Oct 2025 01:54:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsn0T1UJGNN+DMCPRU7lJk5Itt5x7z0YHqju+V9yATaC5KHWal8J0l4vDY6qI1Yqyz0I9Uyg==
X-Received: by 2002:a05:6000:240d:b0:425:7c3c:82cf with SMTP id
 ffacd0b85a97d-4266e7cdc8fmr17010170f8f.11.1760432066481; 
 Tue, 14 Oct 2025 01:54:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e833dsm22538021f8f.53.2025.10.14.01.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 01:54:26 -0700 (PDT)
Message-ID: <34466c59-cea5-4a09-9dfa-83e25dbc49eb@redhat.com>
Date: Tue, 14 Oct 2025 10:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ast: Blank with VGACR17 sync enable, always clear
 VGACRB6 sync off
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dianders@chromium.org, nbowler@draconx.ca
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20251014084743.18242-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251014084743.18242-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pyki8P3h5szuwU8cDaX_NnNbf_yAeJG8mrGSR58i-zw_1760432067
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

On 14/10/2025 10:46, Thomas Zimmermann wrote:
> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> by reenabling them. This VGA setting should be supported by all Aspeed
> hardware.
> 
> Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
> VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
> not reenable it after the soft reset. The display output remains dark.
> When the display is off during boot, some BMCs set the sync-off bits in
> VGACRB6, so the display remains dark. Observed with  Blackbird AST2500
> BMCs. Clearing the sync-off bits unconditionally fixes these issues.
> 
> Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
> access to video memory.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> v2:
> - init vgacrb6 correctly (Jocelyn)
> 
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
> index 6b9d510c509d..9b6a7c54fbb5 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>   static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
>   	struct ast_device *ast = to_ast_device(crtc->dev);
> +	u8 vgacr17 = 0x00;
> +	u8 vgacrb6 = 0xff;
>   
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
> +	vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;
> +	vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
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

