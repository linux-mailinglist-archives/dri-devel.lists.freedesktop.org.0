Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95BD39958A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DEB6E550;
	Wed,  2 Jun 2021 21:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771516E550
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 21:43:19 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a4so4448736ljq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jnPY1pt1CgNVj9PHS8NaVsGMTsGCa0ihLg63QJ27o1s=;
 b=HWhnVADKB1Pa1nLafwi/kPCiZc09zYHG4ul5lOzNEJHtssICR3s1uHXQEUFDpaWcHF
 Il1IAH/4AXL/bVP4wEe6XGBeZ7RjkqZv9hfxYdQV9kSMhDIkyX1oXiey0W6wj6JQESui
 1MckQihKJZrSTT7vGGe0eiqdS3qBpjwiWRwNDpEfaYM0bzSO0ot/HifBslM0pOP6YeeI
 XJl/Jmu8/hw06QZ+dbcD7dJ7Ni5KxoJ9aZskeEIaRPpKmalJ/lbRJTeSbqZCBBYuDfTW
 xk9yfkLthogHJe2zVRa+Ct20/h80nXcUDIeRRCRxjfqh+smwW5ecYqGjL5xkFqjXyFqc
 f5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jnPY1pt1CgNVj9PHS8NaVsGMTsGCa0ihLg63QJ27o1s=;
 b=PC0BzGw5AgHdg4av3Z1cRtcSYAvokzaVAuoZ6A1vwYAnW6JBShl7989sU90NWETk6y
 cbVkupz3aqrhaoTxMXBjhNr3d587FgPFsqD93lDEur/y1xIudU5NHKF4+zHecReKd7E5
 WtJijKFDVpt6DL1E7t4K8lFRvXRFpCWAQQcjRDdzoWHNo3JU0BEcMfwZ1wBm2rG8diea
 3fjvoedZRauT0i17wqcKDXUw0/x7bQkofxYZBXWZSNhsOM5ZvQIaIWJZWe+u1byW0Xq1
 PGQ2r449YZqiVtuM4Dv4NAG/0JF6JMwFHEJB2zy/fhae1cnf2RQeXJL81qgZIUxySiPS
 FGkA==
X-Gm-Message-State: AOAM531OJlAMw9P7gOAVOXvfSkDbMDis4PWlpsx0Kg8hBWKxsp/9f13k
 v7XSw/rQhOIWlEeeoBUi9qOeLw==
X-Google-Smtp-Source: ABdhPJybrPL/Qle4O52B7nNgGKzPGehWW28EcsMwP2xZBhedx7NYAhhmtiY2R1JLmJIaXcHvWDbIhQ==
X-Received: by 2002:a2e:7a15:: with SMTP id v21mr27480128ljc.283.1622670197721; 
 Wed, 02 Jun 2021 14:43:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g30sm105083lfj.262.2021.06.02.14.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 14:43:17 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
Message-ID: <704f9d13-db79-cd9e-06d9-5822c9b137c7@linaro.org>
Date: Thu, 3 Jun 2021 00:43:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2021 22:09, Dmitry Baryshkov wrote:
> Drop most of "extra" features of dpu_hw_blk.
> 
> Changes since v2:
>   - Include a patch to fix compilation issue with merge3d id handling
> 
> Changes since v1:
>   - Make dpu_hw_blk an empty structure
>   - Split this into separate patchset

Gracious ping for this patchset.

> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>        drm/msm/dpu: remove unused dpu_hw_blk features
>        drm/msm/dpu: drop dpu_hw_blk_destroy function
>        drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong
>        drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure
> 
>   drivers/gpu/drm/msm/Makefile                       |   1 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  11 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         | 139 ---------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |  22 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   7 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   6 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   4 +-
>   14 files changed, 10 insertions(+), 220 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> 
> 


-- 
With best wishes
Dmitry
