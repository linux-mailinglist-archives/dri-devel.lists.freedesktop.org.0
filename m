Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0447786FAA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE87510E077;
	Thu, 24 Aug 2023 12:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DE110E077
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692881589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKQ9WOE2Aragce0+o/m7aVIS5d41CLufSWNbA4ImA4I=;
 b=WRt5zKUTGlcojPdLnACz3yPSCroIzUfEXO9JpFxVVofqHSmDzrr8s843YmvRf/IM3d0vnv
 lOJ6xTKFBBpGL461Ne9ADT5NFOi7m5LF6I4PZXeOk2bXKZ/FhWJtYQw0MzH2DMXelnRhYP
 mweOQfuHmtxaQMxLtppZbuHI1LFEWfk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-DSpPkNtfNaChZpQLtkcqTw-1; Thu, 24 Aug 2023 08:53:07 -0400
X-MC-Unique: DSpPkNtfNaChZpQLtkcqTw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso506528266b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 05:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692881584; x=1693486384;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKQ9WOE2Aragce0+o/m7aVIS5d41CLufSWNbA4ImA4I=;
 b=W8NeVYNhHshN+Jnshg57ZUkh1A626l4Ke/YUm8lJB67JsfJVTuQhqqUhr9m9jn+qRS
 Sh4YMr2mv5h0KTfBlN8ttFFlQnek40CNc2igZMo9BzsP0VbtQqit/2KEkbjV2T+pWtKd
 hupWuuD+jvpliv24r2zAsNAft50JGcwGisPiHvJgKmp12/iFN9x8n82gZ+zeWQ9dTRwK
 Q/yPB3s5roE/AA3fw0pA4l2Zrfdp0QGXTUYLGaHBFfe1GoRUFLftY3gdrvRVos9enLcJ
 YFNn6j+B00VeDdVfrCAP/GN1mSIBW+RRK88H+BTVl/npnn6Ieb0VI4FEjC4V5dysknSP
 eRfg==
X-Gm-Message-State: AOJu0YwR44W4MXXH9sZv+GRaenzVIOBdVpaGWKHRSMa3mNq1ty5gBgj/
 RE79e+QUAaApihmcskskGLPaxh03nc/Mcsj7T3dlkf1hfihT1IQaM6O4vFxZwbmAQ9SE0fCGIOB
 phJTGD0+Whow9ne88WDfU+h+7pOR3
X-Received: by 2002:a17:907:778d:b0:9a1:d7cd:603a with SMTP id
 ky13-20020a170907778d00b009a1d7cd603amr4013268ejc.58.1692881584346; 
 Thu, 24 Aug 2023 05:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX6wkHtTAdCUwl5KxmFYb257JKgY0QOHqKG5XpgYEz7M1IInC82odlL1o5XG742djsg7RGlA==
X-Received: by 2002:a17:907:778d:b0:9a1:d7cd:603a with SMTP id
 ky13-20020a170907778d00b009a1d7cd603amr4013249ejc.58.1692881584054; 
 Thu, 24 Aug 2023 05:53:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 lv27-20020a170906bc9b00b0099cb349d570sm10915871ejb.185.2023.08.24.05.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 05:53:03 -0700 (PDT)
Message-ID: <03804681-51f1-0840-6583-1753bd0a18d3@redhat.com>
Date: Thu, 24 Aug 2023 14:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/20] drm/drm_gpuva_mgr: Remove set but unused variable
 'prev'
To: Lee Jones <lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-19-lee@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230824073710.2677348-19-lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee,

On 8/24/23 09:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/drm_gpuva_mgr.c: In function ‘__drm_gpuva_sm_map’:
>   drivers/gpu/drm/drm_gpuva_mgr.c:1079:39: warning: variable ‘prev’ set but not used [-Wunused-but-set-variable]

Thanks for fixing this up.

However, I already had a patch in the queue addressing the warning,
which I already applied to drm-misc/drm-misc-next-fixes.

- Danilo

> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index f86bfad74ff8a..ad99c9cfedac7 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -1076,7 +1076,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   		   u64 req_addr, u64 req_range,
>   		   struct drm_gem_object *req_obj, u64 req_offset)
>   {
> -	struct drm_gpuva *va, *next, *prev = NULL;
> +	struct drm_gpuva *va, *next;
>   	u64 req_end = req_addr + req_range;
>   	int ret;
>   
> @@ -1106,7 +1106,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_unmap_cb(ops, priv, va, merge);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1151,7 +1151,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1184,7 +1184,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				ret = op_unmap_cb(ops, priv, va, merge);
>   				if (ret)
>   					return ret;
> -				goto next;
> +				continue;
>   			}
>   
>   			if (end > req_end) {
> @@ -1205,8 +1205,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>   				break;
>   			}
>   		}
> -next:
> -		prev = va;
>   	}
>   
>   	return op_map_cb(ops, priv,

