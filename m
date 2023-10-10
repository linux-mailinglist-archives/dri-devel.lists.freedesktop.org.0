Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698AC7C01A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400810E3AB;
	Tue, 10 Oct 2023 16:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11DB10E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696955511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cf2g84KWZibabOg5Y0fsYiGgR+PAP2xFlziRJuiWttw=;
 b=bGoCmfrXwNWssMHpBpsG19rvmL7/DSD/xhxD2HKEnFFTdBlgHBWcBQ8VtqMvv9xENoRTxp
 QeBUU7/b++hb2D5xvBzbdSkgUafLw4jaTUpW5rW4O+lNpQcBpUC6wcvNNpguGqMPVJJD9u
 NAsSsEs1hcxoXawoBRgSqzEEBOMZ6UU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-zadosbYHOA-H4PkCA9O4ig-1; Tue, 10 Oct 2023 12:31:50 -0400
X-MC-Unique: zadosbYHOA-H4PkCA9O4ig-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9b822f5c156so473461466b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696955507; x=1697560307;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cf2g84KWZibabOg5Y0fsYiGgR+PAP2xFlziRJuiWttw=;
 b=tKHGlSMh7SrOj77qek8YEC7YWphBUwoGlx85sjOAKwXVMkHsHJDMgGJVJXM+UFPSIg
 CrQYZQoXXWYru/Y3rrt338C3L/FEWghUwBHE2DlomhyByFfEJ3crrtEKHbzeGjdkuVCH
 fYIu4mbxOAZ8qCgVU8kiUweA3dSxvtoLdWiLYdCoF+bKyt0DrlvyXZw3DUdEkJh4S6UE
 9F2dqy/lRXbifUU5/bewijWUdLDhMh/KgmmlNJv5s+QOMi/LUt731cQ2OgyRFfEAA0Ra
 gwnBVqo58Qd0BE36NNgiaj61eNHr4rdOwuCnb3ZCpRZUVuGM19Pre9af9DV2zFswGLI6
 verA==
X-Gm-Message-State: AOJu0YwfI4MD69bciaa2XPK08zf9BHDxjBNAtUwvEBM8nxObq2ZH4+XY
 CI4lg2ky7pQyIdD1FyDoH68V+A9hgaf7S5LZ24meCbjZtXeRqIFN70wIib+vbgSvMnukKmybzxL
 ye6gWf8lE02GguPi0H2Zej4Rt0fSg
X-Received: by 2002:a17:906:8a64:b0:9a1:d29c:6aa9 with SMTP id
 hy4-20020a1709068a6400b009a1d29c6aa9mr16069484ejc.11.1696955506896; 
 Tue, 10 Oct 2023 09:31:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGClLYRPDFww0sBjKrvTM/Spzqz91u3d3y4ItD8/C3zVG0gj1Uw0FLAJtwnyE66uijuqOQM/w==
X-Received: by 2002:a17:906:8a64:b0:9a1:d29c:6aa9 with SMTP id
 hy4-20020a1709068a6400b009a1d29c6aa9mr16069454ejc.11.1696955506572; 
 Tue, 10 Oct 2023 09:31:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a17090613d400b009b96e88759bsm8905722ejc.13.2023.10.10.09.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 09:31:46 -0700 (PDT)
Message-ID: <3205eb86-f875-e597-9df6-628d5799cb12@redhat.com>
Date: Tue, 10 Oct 2023 18:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 02/20] drm/gpuvm: Helper to get range of unmap from a
 remap op.
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
 <20231010133738.35274-3-sarah.walker@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231010133738.35274-3-sarah.walker@imgtec.com>
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

On 10/10/23 15:37, Sarah Walker wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Determining the start and range of the unmap stage of a remap op is a
> common piece of code currently implemented by multiple drivers. Add a
> helper for this.
> 
> Changes since v6:
> - Remove use of __always_inline
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>   include/drm/drm_gpuvm.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index c7ed6bf441d4..932e942da921 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -702,4 +702,31 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
>   
>   void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
>   
> +/**
> + * drm_gpuva_op_remap_get_unmap_range() - Helper to get the start and range of

Not a strong opinion on that, but maybe drm_gpuva_op_remap_to_unmap_range() would
be a bit better.

> + * the unmap stage of a remap op.
> + * @op: Remap op.
> + * @start_addr: Output pointer for the start of the required unmap.
> + * @range: Output pointer for the length of the required unmap.
> + *
> + * These parameters can then be used by the caller to unmap memory pages that
> + * are no longer required.

I think we should be a bit more precise on what this is good for. Maybe something
like: "The given start address and range will be set such that they represent the
range of the address space that was previously covered by the mapping getting
re-mapped, but is empty now."

> + */
> +static inline void
> +drm_gpuva_op_remap_get_unmap_range(const struct drm_gpuva_op_remap *op,
> +				   u64 *start_addr, u64 *range)
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

