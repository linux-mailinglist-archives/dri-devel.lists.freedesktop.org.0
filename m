Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC29F2D37
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F233510E570;
	Mon, 16 Dec 2024 09:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QM3Vol3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C993D10E56A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734342329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mUEqVhqEm411y2btyANp0nQYhhxxqt+IdHIRX6Fy7yA=;
 b=QM3Vol3GXTJ7BNjcP+KwoJhydUdIpmJ2UB6dA1/xZBrnPxDEguuG7cx3+AMd6KhXh0C9Jm
 3XDL2elXlu4qSKfGBib8csQXg5yzOsmjzkytQecgpg4CKQwWg2goK/yDKbTYq1snsx1Xlt
 sHkrZ6sR6bFsbNIbPYRUUtsrPHr5w7o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-rrfgzZqMP3e02Tm0oErYyQ-1; Mon, 16 Dec 2024 04:45:27 -0500
X-MC-Unique: rrfgzZqMP3e02Tm0oErYyQ-1
X-Mimecast-MFC-AGG-ID: rrfgzZqMP3e02Tm0oErYyQ
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-aa683e90dd3so115175266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734342326; x=1734947126;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUEqVhqEm411y2btyANp0nQYhhxxqt+IdHIRX6Fy7yA=;
 b=Ymr9Ng5HCWFHviLmDp27NURQmY4FHy8MsKLEZkWFIhE/feDfNpkqqcFNHUssHnAQ0Q
 GbxdEt5pBHkhfhx4lubpLbpjzyoMqnll0VxRxlJobCHo5VreWYNdQZMWnFOJB6SjsyEm
 o+FgVz3+Y/ijCRilljQcBj6nRalaW+7V+vn1o+4TlIsEZgWlLp+yh7CJBq8y0rg3oIPE
 WGqrWONc7Uinuy9tb7MuPSl2jk5PcGEDFb7Up8q4mIySHocLEFiRRjs1+/TkI2yurlVf
 nx/9bIEPoLAXIkiMUtwOq6pA4Q2Nz5hOpgNc74Xuh3hCb+NZ2SLpbA7opeBNywI1PvGC
 eK9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUV801eF48e2Suuwd3IC4O7MXURQRMiZNujmi/uluKntjpQ3jV1+OoqfsRNbI+3w5StoWyE2mDA2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk7czxPJrBCyGlgF7dM3ubi9k+POBK6ZLJY2t8SW/aeVqojy6n
 gEndoZ1zjMBYSuTGohNNYiAA33JoRA7oew43xGgG8sqVlZSIAhcUWKfsaYkWGPFoiscVfBRKiXk
 CQRnt4VEpGi6atqjfsFcGU7VF5XzYDx7JxbszMMS6xVr1wWxO18iT2LZnTORiBT9q5w==
X-Gm-Gg: ASbGncvip33UaVLXx80NV0tF1a8xtf72t6DZAJBfAApl8ZN7a++QpED9VyZHhtcoj5x
 P68iUVvMcyvekRr4Y4MNvC/v8CCaAcmWIofiFFfSDuNOhK/cu75gH5QQF0EQwfMSsFQcYHl33/T
 amA9AqGGomxJAn8pFCArfrTfdnsMET+010qzQA+iYqLKpNQ5TKgb8kHE91pIjkwMnYyrHJazALe
 5IY3jXqlo0Ue/N/VXt/4l4z/QKdABSgK8t/I3F6Sh78iC8d0upA
X-Received: by 2002:a17:906:3289:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aab77907930mr922252666b.13.1734342326534; 
 Mon, 16 Dec 2024 01:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ1z2lzdh2iwu9u26o1qjT8nMT8Dfj1jXT3HMa99NlV9SwaueXBmTZhsa9d+oTc6bnLe3cWQ==
X-Received: by 2002:a17:906:3289:b0:aa6:7470:8efe with SMTP id
 a640c23a62f3a-aab77907930mr922251066b.13.1734342326159; 
 Mon, 16 Dec 2024 01:45:26 -0800 (PST)
Received: from cassiopeiae ([2a00:79c0:644:6900:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f35365sm3093068a12.80.2024.12.16.01.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:45:25 -0800 (PST)
Date: Mon, 16 Dec 2024 10:45:22 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Zhanxin Qi <zhanxin@nfschina.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Fix memory leak in nvbios_iccsense_parse
Message-ID: <Z1_2sugsla44LgIz@cassiopeiae>
References: <20241216015246.141006-1-zhanxin@nfschina.com>
MIME-Version: 1.0
In-Reply-To: <20241216015246.141006-1-zhanxin@nfschina.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FsZ7lq9cpXhQo-iHPc7LEVDWs2kpKC78D0vEORt0kGc_1734342327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Thanks for the patch, some notes below.

On Mon, Dec 16, 2024 at 09:52:46AM +0800, Zhanxin Qi wrote:
> The nvbios_iccsense_parse function allocates memory for sensor data
> but fails to free it when the function exits, leading to a memory
> leak. Add proper cleanup to free the allocated memory.
> 
> Signed-off-by: Zhanxin Qi <zhanxin@nfschina.com>

Please also add a "Fixes:" tag and "Cc: stable@vger.kernel.org" for this.

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index 8f0ccd3664eb..502608d575f7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>  			list_add_tail(&rail->head, &iccsense->rails);
>  		}
>  	}
> +
> +	kfree(stbl.rail);

I think it's a bit subtile why this is needed here; better add a new inline
function (nvbios_iccsense_cleanup()) to include/nvkm/subdev/bios/iccsense.h that
frees the memory and call this one instead.

While at it, you may also want to send a separate patch, adding a brief comment
to nvbios_iccsense_parse() which notes, that after a successful call to
nvbios_iccsense_parse() it must be cleaned up with nvbios_iccsense_cleanup().

> +
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 

