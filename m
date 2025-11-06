Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD677C39F1C
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1919B89262;
	Thu,  6 Nov 2025 09:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="NtvfKHtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B810E030
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 09:56:54 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-592ee9a16adso1056305e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 01:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762423013; x=1763027813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ah9B3sBKtJMQ90NKotd1CpXpyuKbVPGroKqtGBrjaj0=;
 b=NtvfKHtZ6IlDoD9uR2knoXPAnT3NXubx2ajtnd0QZ5qb2Ul+B+IT5nythgVqCDalqo
 8KttgHApF7bqt1qxsd8IIqW0sGsOhHl2XAm90VQj5Coc4N3/cEGOCNETBlf6Rvu+hFf+
 sdo3pR/x5qDSZmavBvUhdM1yimhK9Nz8aNj/676bNdNl6vnsI4SR/OaMtPa7A7hW12WJ
 bCf8lVQEjld35w+nTvYe5P5htZgo7u2kTB6Ddyim1WfAOpb2rtfeTgLzEB36HX03jLVY
 1ZND/zT/MaDtpoF+51PnZCcge2SHCXU/aZSSqPhVXskccdqbDeE9bqkazMftCceXp9Dd
 Eqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762423013; x=1763027813;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ah9B3sBKtJMQ90NKotd1CpXpyuKbVPGroKqtGBrjaj0=;
 b=crLBRiLVhVIEADlOFfknjq0/QJAHNudZ+NY/4KgKMJMOEYs+YRlCkOFPb7iooeflW2
 unXWDNiqF6PsAbuyWJNc5V0sZ4VZIybPjZblnC9Pj3ZMLBMgr9QGnf5xmfGfawUW+GMW
 B7tydriT93C23y1zJ6TKKXZrNs7HlRtbcs7wtFNFzpZF2prVdxqvWhYLkFh7bqRSkplT
 V4X33c+pgTacZ9SCAUxR96CEhl7T9BzNp7gPv7EyjOhzPVbCZxxLChzjU2mwOAlHiB4z
 fVLsOr8xzogCKiwipLHXDpoLtpKVFEqxaVqKVkqpIhA9NQTvKfzLzxBHOKJPg+Jq43pW
 oTLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtcH0rANqrL3aWagixhuWjdiAXs7Itd5TZ+4CPuzScgzGYNOGqf8I5R6XscuLlBgVjyNCB36F7C1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKR8vi6DpA4nVz5/nF8r053jnUulJqhqmEYVVxhH1aycuj9gV6
 v3SpoWUqcvGBKLfBN3bvVCeQk54IbCbSQEM2csLZWhmXzcw8OTflOPbykt50u0tHC8M=
X-Gm-Gg: ASbGncvArBe1oXnLpm2zaj+2LrHM/dISTgOK3WyPVHMt7VF4bBe+p4i0DDM33iTc4pP
 0gMuqGtvwMWpWFa8LEwBHRvvwUN7JDnXvq7pQun61gTcJyY4Xgudw7IoYno18NIC8b+qhqNSleb
 cc/xmIc4VsCqBK1BuBtu6cEgCB1UqfKUSxze9ACxiDzB5fodI9oK+C3NyzL/HSb8Z78QJA/WFro
 6ARRm3TRvC9BwrnRlxkQa6BL4bf5Wc6FQmVK2mlRIy225/BU4wtj9RTZ3Zrs+T386ExcWE60qI1
 hrHSy+p2tUtbITd2t1ny+1NjuZ2SlztuHZC74qFyLFtzHaIroqNOn6snJvXYffB/Gv7NOK1PCGO
 yEGcjfDJYAenPMuji3rA6i3C2lpZFHVb+u1XsajqIjDkuYKkFh8yZ2eVoGi5utgKUw9a1IF+zvF
 S/EUrzckCe3OCb+3Uab67BX6aCOhg=
X-Google-Smtp-Source: AGHT+IH87qGloTPs2IJda89ZYDWYxle19K2T13CnSFSXTtTGmwBkX5fIkNyS4ZGBOcmSluALoZwAiw==
X-Received: by 2002:a05:6512:3988:b0:57d:6fca:f208 with SMTP id
 2adb3069b0e04-5943d7d5ed4mr1507581e87.45.1762423012315; 
 Thu, 06 Nov 2025 01:56:52 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a019ef3sm594914e87.32.2025.11.06.01.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 01:56:51 -0800 (PST)
Message-ID: <63ce6781-439d-4425-a3e9-f1d233a5abea@ursulin.net>
Date: Thu, 6 Nov 2025 09:56:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/amdgpu: jump to the correct label on failure
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
 <20251106093933.18859-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251106093933.18859-2-pierre-eric.pelloux-prayer@amd.com>
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


On 06/11/2025 09:39, Pierre-Eric Pelloux-Prayer wrote:
> drm_sched_entity_init wasn't called yet, so the only thing to
> do is to release allocated memory.
> This doesn't fix any bug since entity is zero allocated and
> drm_sched_entity_fini does nothing in this case.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index f5d5c45ddc0d..afedea02188d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -236,7 +236,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   		r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
>   						&num_scheds, &scheds);
>   		if (r)
> -			goto cleanup_entity;
> +			goto error_free_entity;
>   	}
>   
>   	/* disable load balance if the hw engine retains context among dependent jobs */

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

