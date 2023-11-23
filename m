Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA467F5DED
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F2F10E720;
	Thu, 23 Nov 2023 11:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F8B10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:37:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so987230e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739457; x=1701344257; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
 b=BXNeSYyJYbosjI0lnPzUYw58D0hTukHZDUMkF/oRmfRjOJWq9AYFoSSt2pEreWXpM3
 LSk/BEIhWVr6B/RMbELBxtqhGNrFir++ktlXSHazXCrdFU5rfbMvf1+LKYWM3DYzOKNE
 BRHx5G6b7EwO6+msNJhjCl+EMKDOTDWzmPHJJuFr2uwgm4SGbSXCbRK9RTTd6Z0+EAbX
 biHzfJreik3UmhVHnPdQ5jGvTEYlcdnD7FaWYpwIFx0MdIs6Z/Ikvwta4v7OWoHLz6CB
 arQKP60VLQNh78Syj0DaGfuwA0XR/VENUAWmhSfUdCG09V9mJi08rXlfAv9OTo3E0oxF
 s35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739457; x=1701344257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
 b=P0cJjXFcjh1OFvkXTJeWXXPzY3TZkLg9L5XLEY5PzbyrPE0Se81XKLUFEz83Rt75Zx
 +d1FkRfge6YQ9DbbMtxARwEeZcT15qewIETVqESrahpiR1fuigGxFc4s1TZso8ITeJVG
 n15kdGSrfISnj+QAaZns0GypjYujId0vTDFIkmGz6smD1hNyUIYvb4QMkTAHuwKfiOnM
 3cAQ1ue+n47Gg/mLxHA0svrKYRSrjkS2LganjxA1mYvtU2m3wHyjpl3nr6o/bosyDYyN
 qeAsbJiryR9tEC7+EEV2RVmGhma9E2QrQgFoPl8ewgPkOLaCkIQBSbIPyA4rhEOGeMlg
 CqLQ==
X-Gm-Message-State: AOJu0Yz1NaNxpRdfZ1K/pfUBzJBHLsempa35XJVWSVp2doZrD48Ao5tX
 3RLOx9ZF7P+xv/2Fw77ME2wGyg==
X-Google-Smtp-Source: AGHT+IGVn/cRKB4SR5kspsiZK5lcGwtL1/UJAwGrszDITZYjaYkgwg7kZEfFdYmBBnxpyjbBVu+e8A==
X-Received: by 2002:ac2:43a5:0:b0:500:daec:2817 with SMTP id
 t5-20020ac243a5000000b00500daec2817mr3796344lfl.54.1700739457263; 
 Thu, 23 Nov 2023 03:37:37 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x15-20020a056512078f00b00507a96d17b3sm167232lfr.237.2023.11.23.03.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:37:36 -0800 (PST)
Message-ID: <70836806-5228-4b32-be97-f00a476bbe47@linaro.org>
Date: Thu, 23 Nov 2023 12:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Fix null-pointer dereference in
 zap_shader_load_mdt
To: Kunwu Chan <chentao@kylinos.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 jordan@cosmicpenguin.net
References: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231123033329.27477-1-chentao@kylinos.cn>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/23/23 04:33, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
