Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3B802309
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129E410E299;
	Sun,  3 Dec 2023 11:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82D10E296
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:31:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9b956c68cso37375981fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701603093; x=1702207893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=66Aoa/dxI47/obkV1zabVPwJ1McMDn3dKlFH06pxzrQ=;
 b=SiFMy91WIR59PultJpoO57EYZw1078c8+jvHTFnszl0BkKEp82lqJSf6PbbmjPYd5L
 cSRQ9kLpT+p4qujJQVkhKctLyHrXOddgwkIvZsgTa5uYFfXHIym6btKAEdrTutYZNKQd
 8EaQAlTIpjiC5m7woKGPBFoBriqlkDM0U2V923K96IBUmH6aiDckHuahFwg3heC+BH2r
 bokMtUkgpBGJw1nmIuAU3a2Hkz2r6K9aYEt04UfqK9nO754EuIU/BoEo7uJzCZ+82wRm
 pU3rrWOU0xiYOqe0DmooGy6gN1P8GhVWgOiLhqi+ce8WfYFnRHbCitcdvmZ1A8XORQZg
 pEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701603093; x=1702207893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66Aoa/dxI47/obkV1zabVPwJ1McMDn3dKlFH06pxzrQ=;
 b=RB7QdpFtph17IqipJFS6wUbOjAkrc4VE/vm0ft5zqQmZmMQllL0Fj7HXOxWaxAIm+r
 KIZSi81XhwndUMNNz5VwjyRneWK1X1hd3gSqW7AwxZxJuy4v0Z+i/JPn6KqYSuVqlvFS
 LhMBtQrQlKkzlB9fpkRSUBYEUrcaey2w+7BwjNuy4Abb1AY4JVEEcGCOt8wfT6S9FSYl
 kGNxAu0C9dvfuXwRUKCpH39IBT1aS2p10NyaiZTyA/UeyHKbNLBWZLQmYynhDJXyWlXx
 5Cs/pLIp9X9CPbhqfZEVw8XGWNwF2Q/6ugZy8LUp5wLy81+Ze9AikgoJXV568jJsJDTd
 Gxtw==
X-Gm-Message-State: AOJu0YwjQjqTixTXVM2pGoFCgV406qiBD0tXlhN6OacOapZsOC3RjqkS
 09iUYBrgPlz+/MjpyVsp8QgGxA==
X-Google-Smtp-Source: AGHT+IFJF2uIQw16LPEWXGCcDiQFvQy273U89PuyeeiGEbrQ5BJZQUdHrcIEp5fGZblxU+A3YEYqsQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id
 v20-20020a2e7a14000000b002ca01352204mr194590ljc.16.1701603093057; 
 Sun, 03 Dec 2023 03:31:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a39-20020a2ebea7000000b002c9f70a0419sm274718ljr.140.2023.12.03.03.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 03:31:32 -0800 (PST)
Message-ID: <ae97ebc2-83d6-4f37-9b69-6a52303b0084@linaro.org>
Date: Sun, 3 Dec 2023 13:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/gem: Split out submit_unpin_objects()
 helper
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231121003935.5868-1-robdclark@gmail.com>
 <20231121003935.5868-5-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231121003935.5868-5-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/11/2023 02:38, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Untangle unpinning from unlock/unref loop.  The unpin only happens in
> error paths so it is easier to decouple from the normal unlock path.
> 
> Since we never have an intermediate state where a subset of buffers
> are pinned (ie. we never bail out of the pin or unpin loops) we can
> replace the bo state flag bit with a global flag in the submit.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem.h        |  6 +++---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 22 +++++++++++++++++-----
>   drivers/gpu/drm/msm/msm_ringbuffer.c |  3 ++-
>   3 files changed, 22 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

