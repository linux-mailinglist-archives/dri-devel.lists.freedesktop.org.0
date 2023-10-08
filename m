Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02AB7BD123
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 01:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872E310E09F;
	Sun,  8 Oct 2023 23:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDD210E09E;
 Sun,  8 Oct 2023 23:21:18 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F5AB660708F;
 Mon,  9 Oct 2023 00:21:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696807277;
 bh=n6FyZS8CpZQUQ33bu6wL3AYnS1Dftji3soEkyzZ0Od8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GSjmJuCEEU/d63ysqmYNF+ppD8PPHjhJmgIZCbe/H2M9L+kqYc1HsZB+5ouw1YaDF
 tgvM4WojDp1WpdjG+iCtOQpQphyhycBHXKhR23lmFys6vSioZxfjnAuezCLXVl3YB3
 Qz9BH2x80q5aU19QDIWGVXUIGxbuIBuKel1eeS+oVmEk/qlji5E7Pf14retQP7WY2X
 a2LBo3FgO6cvptP3lJfZ0wID7eyIB9FcnvV2P/c3Si+KM7Cuzi4U48YrQ6AigPSM82
 7dXbSSR8kAE3jw4DqAauqNJFlBKxMNKQttu8LyKAFRXvg2R4Ih2N2qE5MqTe2H4c6+
 /jEgajdueChEQ==
Message-ID: <526457dd-37f2-467d-b583-b710a5e84b97@collabora.com>
Date: Sun, 8 Oct 2023 20:21:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Use the encoder for default CRC source
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
References: <20231008175615.413497-1-robdclark@gmail.com>
 <CAA8EJppgUmkLrhTw779tq5wkgXfu4sypGrQbJFYtrnCrbwa3=Q@mail.gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJppgUmkLrhTw779tq5wkgXfu4sypGrQbJFYtrnCrbwa3=Q@mail.gmail.com>
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
 Daniel Stone <daniels@collabora.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/10/2023 16:59, Dmitry Baryshkov wrote:
> On Sun, 8 Oct 2023 at 20:56, Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> i-g-t expects the CRC to reflect any applied CTM.  But the layer mixer
>> source is upstream of the DSPP, so it is before the CTM is applied.
>>
>> Switch the default source to 'encoder' instead so that the CRC is
>> captured downstream of the DSPP.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt |  4 ----
>>   drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt |  5 -----
>>   drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt | 11 +----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  6 +++---
> 
> I'm not sure, if updating the CI skip list together with the
> functional changs is a good idea, my preference would be towards two
> separate patches.

On the other hand, having both together in the same patch documents 
which tests this PATCH is fixing.

Regards,
Helen

> 
> Nevertheless:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>   4 files changed, 4 insertions(+), 22 deletions(-)
> 
> 
