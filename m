Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24609F2EAA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F87010E5A0;
	Mon, 16 Dec 2024 10:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O1OjG/Ia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FACD10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734346795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lkpo1WbWSh48AVx54wAJmJO7g1QHhOlv/ZWr/VtszTw=;
 b=O1OjG/Iaq7sud5W1xaow5peb/tDSw89L5Q4hrmZy4rWzK6Z/3rG4XO8ec2KU3bvmCHwAP9
 +/rT5fAlFLhupD4d3fMYIsPEibNhnZ/dBMA6uKxvm8FlLNrp9/pf8UuduBPTNEW4ycvzmD
 D1A+qLR+qjY02LpuUpv+MMbn6mw/nbI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-FixCJip1NTW0lxoZB9TiCw-1; Mon, 16 Dec 2024 05:59:52 -0500
X-MC-Unique: FixCJip1NTW0lxoZB9TiCw-1
X-Mimecast-MFC-AGG-ID: FixCJip1NTW0lxoZB9TiCw
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa622312962so411183166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 02:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734346791; x=1734951591;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lkpo1WbWSh48AVx54wAJmJO7g1QHhOlv/ZWr/VtszTw=;
 b=bIn2RkZP2MdqUd8EVPSpHZs7xmFtNqnoZXdROG1rgMUM7ZN0mrbymqZEphtITJDmOa
 5WosLQqUH7Fz62l889hO8A5n4KEjZfCsXV9J/gO7tpLLPK8XCvirCSwYbcpCS4ucjpar
 DLMr0/MaPC1MqyCAIV6kMVyMJsglClT3YWyNK+XKrJTmJZzbu4qpt8N5Eqq5areVEGLD
 B3wpLAbVdX/eu0tkGSvn/2prWmPGOjIhVfusWbDZsiC8MJaqHhMzkYSaI7lIcBZSWLI2
 9Sy2BYl+W0qUMkIeL0B3o/xGVnnmn0Tb7yfBmViuLFo3FDkLLlpe1L9W1IY8e1xBLFnd
 HnYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6zsGCayKuXyCCvK5SvX1qAM2VIEhYCJSAR2pZOmCcEHgmk6t4NPP+QXCH5BMsRW5C/wgJ2aI3Txs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbEN14QkH1NUehgzatsq66W6R7YEF2BOCOuw2nkHVAVWGDAOED
 3mHv6W+1Ve7wSjx5K99xUfrHsixZt4syEyH1UX7mzyG9w9ZT6VrMnW0EbXg5RjKNj2ZArFFUimv
 HKersc7bboJXQtVYmHPg63xL/+1iFaLG6s/hFXVsQp9EtPHuobLEGQjJmKgaeaFvrHQ==
X-Gm-Gg: ASbGncsEetLAVxY2E0GF3CA0xXlVsuDuTYZfG0I7fWtWXqOJ2dCP4Teup4zN0bTnrg1
 3vvQ0cY4HLqgoNlGd0yi2R9AIvon5Dm3gVciJRTQVgHDg8r5ILBe0xwKz/OpbVivxd6mC1isfqx
 W4mjKcHTjN3aQhW0AdS6aSIi/v+jKC42gBEO/WiU8CMQv0ADMKExpdnjA6Ek30a2a/u/b1DLPsp
 q9+bbIGTnrkrpFTGVmz9itkpuMcTAuOqcCTBnBUkvrPHKYR/Mcu9F0XmWAoanwVEuNbsEI7QJ0J
 9B3K8Je2QcZmKl570uXExRQDDd1diacu43fE2VBlbHBgBKsN29hV6rG2q+H5d2G5dDEnOpaKE2R
 AtlFq/ysjOpspApBrqTD/R2ME0G0DZtc=
X-Received: by 2002:a17:906:6d0d:b0:aab:8a24:d5a5 with SMTP id
 a640c23a62f3a-aab8a24d827mr951284566b.30.1734346790858; 
 Mon, 16 Dec 2024 02:59:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+h1sNFs/8Xo5nQoGNANlv3qvetEY/2jgpTfhAT6zKt7fDhepc2lAMagxKx/TVYIH3kB2ShQ==
X-Received: by 2002:a17:906:6d0d:b0:aab:8a24:d5a5 with SMTP id
 a640c23a62f3a-aab8a24d827mr951281966b.30.1734346790529; 
 Mon, 16 Dec 2024 02:59:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9638a12dsm315155966b.134.2024.12.16.02.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 02:59:50 -0800 (PST)
Message-ID: <2513e942-6391-4a96-b487-1e4ba19b7aeb@redhat.com>
Date: Mon, 16 Dec 2024 11:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vboxvideo: Remove unused hgsmi_cursor_position
To: linux@treblig.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241215220014.452537-1-linux@treblig.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241215220014.452537-1-linux@treblig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IXVY6RCIfCtORhPwxDXt9lsPkX3c7JyxkoA7xoUZe88_1734346791
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 15-Dec-24 11:00 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> hgsmi_cursor_position() has been unused since 2018's
> commit 35f3288c453e ("staging: vboxvideo: Atomic phase 1: convert cursor to
> universal plane")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/gpu/drm/vboxvideo/hgsmi_base.c      | 37 ---------------------
>  drivers/gpu/drm/vboxvideo/vboxvideo_guest.h |  2 --
>  2 files changed, 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> index 87dccaecc3e5..db994aeaa0f9 100644
> --- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> +++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> @@ -181,40 +181,3 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
>  
>  	return rc;
>  }
> -
> -/**
> - * hgsmi_cursor_position - Report the guest cursor position.  The host may
> - *                         wish to use this information to re-position its
> - *                         own cursor (though this is currently unlikely).
> - *                         The current host cursor position is returned.
> - * Return: 0 or negative errno value.
> - * @ctx:              The context containing the heap used.
> - * @report_position:  Are we reporting a position?
> - * @x:                Guest cursor X position.
> - * @y:                Guest cursor Y position.
> - * @x_host:           Host cursor X position is stored here.  Optional.
> - * @y_host:           Host cursor Y position is stored here.  Optional.
> - */
> -int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
> -			  u32 x, u32 y, u32 *x_host, u32 *y_host)
> -{
> -	struct vbva_cursor_position *p;
> -
> -	p = hgsmi_buffer_alloc(ctx, sizeof(*p), HGSMI_CH_VBVA,
> -			       VBVA_CURSOR_POSITION);
> -	if (!p)
> -		return -ENOMEM;
> -
> -	p->report_position = report_position;
> -	p->x = x;
> -	p->y = y;
> -
> -	hgsmi_buffer_submit(ctx, p);
> -
> -	*x_host = p->x;
> -	*y_host = p->y;
> -
> -	hgsmi_buffer_free(ctx, p);
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> index 55fcee3a6470..643c4448bdcb 100644
> --- a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> @@ -34,8 +34,6 @@ int hgsmi_query_conf(struct gen_pool *ctx, u32 index, u32 *value_ret);
>  int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
>  			       u32 hot_x, u32 hot_y, u32 width, u32 height,
>  			       u8 *pixels, u32 len);
> -int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
> -			  u32 x, u32 y, u32 *x_host, u32 *y_host);
>  
>  bool vbva_enable(struct vbva_buf_ctx *vbva_ctx, struct gen_pool *ctx,
>  		 struct vbva_buffer *vbva, s32 screen);

