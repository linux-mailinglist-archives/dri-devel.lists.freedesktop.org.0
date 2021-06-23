Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297353B15DD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41146E882;
	Wed, 23 Jun 2021 08:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CB16E87B;
 Wed, 23 Jun 2021 08:30:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a13so1606906wrf.10;
 Wed, 23 Jun 2021 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+DQ+0ACXfu3QGCRaHMkp2n6Xdtecrv2vBUk0jSTI9t0=;
 b=SwjaUdtkaX7HIiCjHwHbCWsEZ6ULepfoWGcKdlQVEo4i9OtBDs39npxbmTjFb1F9At
 zZ4i6oOo1G6Z5D7U9b2c0YxSpdQvHHF4rf1XzOFJUqJBtS3+5PSrO+OPB4ryWFEFntUs
 gcKZYyVXL4YwQxnVYTBMHfSlZZgmSSQZz3Au1DihCE0ifnhhZ4hVaUgv+pSX51Y4rTbw
 qPq2O5c5F664UAiZJZmqiXG10KPJVJEAC17dez9OJrymBh3OhJ/IOkpKL0toCkOXY2II
 rjfFVoUKjzEFZnLmKYCx7maJuCSr/gVjDYNhYQfA8osVGc3U8YeAcRVC7PDzKkg5poSa
 HnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+DQ+0ACXfu3QGCRaHMkp2n6Xdtecrv2vBUk0jSTI9t0=;
 b=bX82WO3mhnjGQ3BelQ7bNtqGMoj04X74IGTLJzJvLDQfHT/MWLJNmtWVaO6UuBrvLe
 1d4DvF1u+6mji51ePRnqwpz4QU1w89XJNZLEUEab+dcg7moTUP2+Q9d4/Nv/MutQUhuE
 dg0mGqKRQogw+OOnTUnWlKuw24Vje5J/5jrDbKHIfn56X52jwkg/kWIdGOrneQ1IgFiJ
 4mMZ3+xMMb1OR1bOKINt4rVUq7NAPZwMsqAxEaCvtDPCTN9egGUvzBHfL6T1psLLHIeM
 b+IgA9m3d1dE4U7oj0YQmnLEhpGdE0708cwdWGjdB0mS1GyYo1vUsAaq86fffUU/uG9o
 9Usg==
X-Gm-Message-State: AOAM530yC7rnokzKidE+xkwcgMkgj1yiv4oY73LpSb8hkOSxB4UlQUhU
 09xZyP787Qg60w9Nu4GA/z4=
X-Google-Smtp-Source: ABdhPJxwWD3nqtQ+x1BmNzk2hTUx4nXZRPEufelxi8DtaVU7mGgpA/MbYlTDV3hl1MEoORc7DXXfxg==
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr10280416wrh.102.1624437027375; 
 Wed, 23 Jun 2021 01:30:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c?
 ([2a02:908:1252:fb60:69e4:a619:aa86:4e9c])
 by smtp.gmail.com with ESMTPSA id d15sm2115444wrb.42.2021.06.23.01.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:30:27 -0700 (PDT)
Subject: Re: [PATCH 5/6] drm/amdgpu: Fix BUG_ON assert
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
 <20210622162339.761651-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7f59fd45-b122-63be-5ef3-fe48b31d674d@gmail.com>
Date: Wed, 23 Jun 2021 10:30:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622162339.761651-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 22.06.21 um 18:23 schrieb Andrey Grodzovsky:
> With added CPU domain to placement you can have
> now 3 placemnts at once.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

And please add CC: stable@kernel.org since this is trigger able from 
userspace and actually a rather nasty bug.

Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index b7a2070d90af..81268eded073 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -180,7 +180,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>   		c++;
>   	}
>   
> -	BUG_ON(c >= AMDGPU_BO_MAX_PLACEMENTS);
> +	BUG_ON(c > AMDGPU_BO_MAX_PLACEMENTS);
>   
>   	placement->num_placement = c;
>   	placement->placement = places;

