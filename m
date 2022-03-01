Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBA4C8574
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E05010E571;
	Tue,  1 Mar 2022 07:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9488A10E527;
 Tue,  1 Mar 2022 07:48:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h15so20819066edv.7;
 Mon, 28 Feb 2022 23:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MnJLyK92wo1ianqqQrVmdLoec7cz9whmMUPEVRDu+oA=;
 b=CVaydF1H4XMdJDb1BVhWeAbLrkhb9uB/9ed31/P7uXF7fh/h34wU1g/MGHbhXoqq/x
 PlAA6ghBwhXkZz0+3VrZ5uw8cR7wUALpb3C1CE2aTbH7ymko5+P3tfVdexz15pSjAe8l
 47p28EUON+tDvymCauYnqyXsxHAAZpOOtW8m+9sos3qbT0ZULSdl3B2T0VP2mojFGfJP
 annWU+NbHk+NTBi5VKQ+btY6oC2k6BUdsouzaNAwklrdOGy7DM3k2xiDHropzjZFGyzj
 lJagdy3GeyFFJSAOggSBegP3gf/wrRzBZPpB1KdALfoSnYN8CAESli6mBQgCF+Uq482n
 iQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MnJLyK92wo1ianqqQrVmdLoec7cz9whmMUPEVRDu+oA=;
 b=S9LT9/GW93E049pJzEpkJZt8Cn4uEGd56TV9b3nYQ0t+95JOdBgeRE4u8Uu+Jh4YTp
 CQ5nyscb0EQV6tqqCgGaTGw+KPith1az8MNDcT1Pmkwu81ljMbAqs95gsn0Dp2YdaoQE
 CH+Y/9VjMx5Gwu89X4qSJg3S9s/hIJiL98uyue6GAsyOYnmVu8Hsm/lo4AZzxnAud0i5
 pltxHxRK5yRLiMuryJMw7sfyqBaP7AkFop6Jq76yVUrC/e7NMKjB85j9EJHjrNl1Lv/D
 mAf4amh7d26gEh20Nbn+EbnmScfrYKBSte0SwE82GkWas0vHBafv3ndHE8mt65qxDJHT
 O+xQ==
X-Gm-Message-State: AOAM530DWWA1YvxiLWWrbpMiCvX68LSEICVOrYLs6zU+Sssy3lm5MUNG
 ZzKiM8Sln8pkoFDLGl491qQ=
X-Google-Smtp-Source: ABdhPJxSZWuYz9uwbnnp09wf9QrW8XIJMOh8VgkpQ43KaO8e9NlZYPo3jPs4kTe8Z1mnpOegt8/XsA==
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id
 bd5-20020a056402206500b00407eb070740mr22917504edb.406.1646120897282; 
 Mon, 28 Feb 2022 23:48:17 -0800 (PST)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 eo8-20020a1709069b0800b006ce6eef6836sm5045690ejc.131.2022.02.28.23.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:48:16 -0800 (PST)
Message-ID: <b87fb8ff-a427-491b-5a5e-3b401e1de462@gmail.com>
Date: Tue, 1 Mar 2022 08:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: fix suspend/resume hang regression
Content-Language: en-US
To: Qiang Yu <qiang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220301062655.232955-1-qiang.yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220301062655.232955-1-qiang.yu@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.03.22 um 07:26 schrieb Qiang Yu:
> Regression has been reported that suspend/resume may hang with
> the previous vm ready check commit:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1915#note_1278198
>
> So bring back the evicted list check as a temp fix.
>
> Fixes: cc8dd2cc1a97 ("drm/amdgpu: check vm ready by amdgpu_vm->evicting flag")
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 2cd9f1a2e5fa..fc4563cf2828 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -779,7 +779,8 @@ bool amdgpu_vm_ready(struct amdgpu_vm *vm)
>   	amdgpu_vm_eviction_lock(vm);
>   	ret = !vm->evicting;
>   	amdgpu_vm_eviction_unlock(vm);
> -	return ret;
> +
> +	return ret && list_empty(&vm->evicted);
>   }
>   
>   /**

