Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B657EB510
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E8710E47A;
	Tue, 14 Nov 2023 16:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4484D10E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699980157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0c77MRIfmEGYCNMMqVyI2qPOnHUBgvpZCQHCynNgK8=;
 b=GERmnqXCS6btgTnkvNuXwSapr4qSlrZNXnedtzpItu6Alli8MhEmNFIZ1B2bfAhuVLH6FH
 PmjrjMpyRn5mvrsWxxQWmmHGvzkG3XCeJiUGL4YCkefKnwA52PQVDGTIV3pfQMzyHU1A/h
 xx01W3rsJ3vqk7XbDym1ycEAvVshJSM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-h7jOwYEyOROWUDhD-Lb_rw-1; Tue, 14 Nov 2023 11:42:36 -0500
X-MC-Unique: h7jOwYEyOROWUDhD-Lb_rw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9e31708ad72so401918066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699980155; x=1700584955;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0c77MRIfmEGYCNMMqVyI2qPOnHUBgvpZCQHCynNgK8=;
 b=uIVCq2h/QmZ7BHNWvq8/349hGcnyLN4fXAldk9dr1/pEJXMzkd+A8T+JiYt9jW1ORZ
 hUSL+yNwwdiKPnnNl2hvPQDx2EzUpmRUIaa1Pae/TOghVzYkLONemG7ODF8OhLC1hoQU
 pW39UE1VraNI/nRLCgEcvumGacDY8OHwDoGs8CLQVU79yD0rNBiaMk5vnuejFvKYMTPl
 O1zL2pWayp78dQAbKQJ0GoLunNVVTBbyBKGl2QufUbSVt0run6pzIN2vRsyh/KJndL3A
 v7VjqFdxAA8+aDB9mr5Gw/nIUcJVsMIr2p/b1546QEk2ZZbgR/LFCAbHKqficmOK1xcS
 8b+A==
X-Gm-Message-State: AOJu0YwiTN5kZWQLZhkiQ1X6z7uPSQi0JLtiDcic6+FXPGrt3R8NPiZm
 YvRb0kZ0V++8UeY9kafSXmwfJ7CH72BpUa7jFVZRhiQaYhbO5ett8bVftMEbpp2hNz740YOXmhj
 zhiVW/3ikPfPEotRWLT5sOOKoZhF/
X-Received: by 2002:a17:906:4f13:b0:9df:bc50:2513 with SMTP id
 t19-20020a1709064f1300b009dfbc502513mr7274342eju.65.1699980154879; 
 Tue, 14 Nov 2023 08:42:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfn4c24R5W4bd+EVwrMNaRwBMuNVIsC9zYOUo2FKiKsCdAOBsvD6dioe9WjEOnxb9D3QGFVw==
X-Received: by 2002:a17:906:4f13:b0:9df:bc50:2513 with SMTP id
 t19-20020a1709064f1300b009dfbc502513mr7274298eju.65.1699980154501; 
 Tue, 14 Nov 2023 08:42:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a170906525300b009a13fdc139fsm5766753ejm.183.2023.11.14.08.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 08:42:34 -0800 (PST)
Message-ID: <e517d560-3a1f-4e79-9bec-acdc77784bcd@redhat.com>
Date: Tue, 14 Nov 2023 17:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] drm/gpuvm: Helper to get range of unmap from a
 remap op.
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
 <20231031151257.90350-3-sarah.walker@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231031151257.90350-3-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, conor+dt@kernel.org,
 linux-doc@vger.kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 robh+dt@kernel.org, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/23 16:12, Sarah Walker wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Determining the start and range of the unmap stage of a remap op is a
> common piece of code currently implemented by multiple drivers. Add a
> helper for this.
> 
> Changes since v7:
> - Renamed helper to drm_gpuva_op_remap_to_unmap_range()
> - Improved documentation
> 
> Changes since v6:
> - Remove use of __always_inline
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

Want me to apply the patch?

> ---
>   include/drm/drm_gpuvm.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index c7ed6bf441d4..c64585dc4e8e 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -702,4 +702,32 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
>   
>   void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
>   
> +/**
> + * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of
> + * the unmap stage of a remap op.
> + * @op: Remap op.
> + * @start_addr: Output pointer for the start of the required unmap.
> + * @range: Output pointer for the length of the required unmap.
> + *
> + * The given start address and range will be set such that they represent the
> + * range of the address space that was previously covered by the mapping being
> + * re-mapped, but is now empty.
> + */
> +static inline void
> +drm_gpuva_op_remap_to_unmap_range(const struct drm_gpuva_op_remap *op,
> +				  u64 *start_addr, u64 *range)
> +{
> +	const u64 va_start = op->prev ?
> +			     op->prev->va.addr + op->prev->va.range :
> +			     op->unmap->va->va.addr;
> +	const u64 va_end = op->next ?
> +			   op->next->va.addr :
> +			   op->unmap->va->va.addr + op->unmap->va->va.range;
> +
> +	if (start_addr)
> +		*start_addr = va_start;
> +	if (range)
> +		*range = va_end - va_start;
> +}
> +
>   #endif /* __DRM_GPUVM_H__ */

