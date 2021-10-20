Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51EA4351E2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA12E6E3A0;
	Wed, 20 Oct 2021 17:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAC66E3A0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:47:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m22so89693wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2FvItE+RkKw9ELyT7wIdKJnHW1MVq2aleCDTnzv8VZg=;
 b=Q+lfUHDWa2GlbKBQvmKNO7e39jQlSrAYpk4t0ujDYLkvWou1hDO6sF2ZYh9AvspNue
 9gLibmdiqOxKRPirgUIqlt8OfOB9de+p+VXU1eAUVtSAOHopT4sRhvKszqN4yDMFqLA1
 J84LSoDo7jeVGMtx1nosxhxYKozyRyfJLFgCCejwVH9iC2ryZo0nbqAiFIDOdGk4dnze
 EXxh13PncKWRF1QHsrg0So6p2oNcnMQFnwDVAvOkZSh8cqC6snDhF07lNrB8Bc24XBln
 Mo3j8bZ2AvN0bC+8wYfVu4/xNMrYlyH4gLnF6X9N/+nigSiKQ7GXdXCVedMXho309FUX
 oWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2FvItE+RkKw9ELyT7wIdKJnHW1MVq2aleCDTnzv8VZg=;
 b=yHngNPyDtm0RZCUUqX3DV8N18OuQCnL7PsIZWeCGPzi4u7GHqz6KDQIFjFfLy/fT3E
 C8eTcSOSHp5DaMrlJWNgWVE7hVmAU6xY41Jdoz8XY+/dslPP1YCtM4cITefR7F7IGNYL
 XieDm2IcbGudIYb09rvqQNUvGLlMPJTI0XydDVaHvn8efMUkHLj+oGX629uW0YlRegoA
 ORbXuU4Xgx79vj9mK5DnhOEFK8bI9H8AmoUc24DilrW5qr8tfaPyeDGexBGfQyCxVeP/
 Bw2G41q57IAXajPcOqrHJQ1MXN77gSUekhH2E9+gVbl2p/uLeAJeI2S7lZn3aIeEOGyD
 NgqQ==
X-Gm-Message-State: AOAM530ADHf2qropaHi4KVqe/xyfUMmxx/gAsk+Hp56XFxr7QKZdIYA2
 Xf6TZ+eLx0SNAEuJ0NlIVSc4oS3PtkE=
X-Google-Smtp-Source: ABdhPJyKzrlJKhs9FESI5+dq+mt9b3BCaB05CzfKJk16odCS3t1SjEyuqk4XWfs9YIXs0bGr6RSFYw==
X-Received: by 2002:adf:a18f:: with SMTP id u15mr752891wru.183.1634752056138; 
 Wed, 20 Oct 2021 10:47:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ecff:e28c:313b:5162?
 ([2a02:908:1252:fb60:ecff:e28c:313b:5162])
 by smtp.gmail.com with ESMTPSA id o6sm3738251wri.49.2021.10.20.10.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:47:35 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <20211020173211.2247-1-christian.koenig@amd.com>
 <CADnq5_M7Yb3Yq-NeOTtwyN=XKQKHLoJ3FSFPi+qyigqxfrzsMA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4dec11b0-a503-62d2-0d4b-5acc511f7492@gmail.com>
Date: Wed, 20 Oct 2021 19:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_M7Yb3Yq-NeOTtwyN=XKQKHLoJ3FSFPi+qyigqxfrzsMA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.10.21 um 19:43 schrieb Alex Deucher:
> On Wed, Oct 20, 2021 at 1:32 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> We need to cleanup the fences for ghost objects as well.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: <stable@vger.kernel.org>
> Does this fix this bug?
> https://bugzilla.kernel.org/show_bug.cgi?id=214029

Yeah, I was already adding that patch to the bug report as potential fix.

Christian.

>
> Alex
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 82af095f6b81..f37a8c53b35f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -190,6 +190,7 @@ static void ttm_transfered_destroy(struct ttm_buffer_object *bo)
>>          struct ttm_transfer_obj *fbo;
>>
>>          fbo = container_of(bo, struct ttm_transfer_obj, base);
>> +       dma_resv_fini(&fbo->base.base._resv);
>>          ttm_bo_put(fbo->bo);
>>          kfree(fbo);
>>   }
>> --
>> 2.25.1
>>

