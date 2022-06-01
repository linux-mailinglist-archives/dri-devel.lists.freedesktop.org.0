Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CAE53A68B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 15:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6B610EC34;
	Wed,  1 Jun 2022 13:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731C710EC34
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 13:55:09 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 187so2044997pfu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=PsjGVD7Reui31MSU63J1iKeBMkxXWeZ9AfTgcc/uvGU=;
 b=EofRlN3aikEIZe7XJgJdxUetgONlsRYqQ+CdJWrpshBMKh/5Sd7EQYaHQWlUsqvvsR
 MMKRKp3aJwZegCTkrdOaHxbghtM5sMsnw5aIJ+B9per/10MowIfH1O4zr7I1hhmujMai
 az5Xdd0o5izj69JoVEeRPg5CEVdgr2krgefWbjthsccc1oeHG/zZEE5Lr+VIc3+WkBvZ
 puocbIQTPL6k1rp7jmEJ8OhdyvEW/xXMYZoecAJ1tn3ALAnfwR4OWukKHEmHmA2mkNfY
 DxTniy+hqsgtJedVQM4wipaBS+4WnD9c2+HG9CWacHoyiT6hediVsnlA8qcyjL+uZIm0
 7LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=PsjGVD7Reui31MSU63J1iKeBMkxXWeZ9AfTgcc/uvGU=;
 b=HpZKQWHXnQWWKiZYOwcsqGQ/pt/dnV6eGJXLwhmbZ+Y1OUfln96o60EJXDtc2WHaLB
 ANfev7E4hEvQfxRD9EVu9Fj/J+dmuROO/47bv9vtPfU9BqKFagNGre/HsbN0Wzq3vb6/
 MFxatr22cWat3lH6zq7NMYBJm8pDioMVse2RCWLCYZXz+Nyn4GzMPE5dax4fVm0PvjRt
 4Zht+/rrv/6XRxiiEWPVP3IPYG+CabTxgM70GP5YHFTPteo3fA+qr1Fc0dVwcJvkOLgM
 8JgCFjzfdRUMQDm9AN2vsS04PKLfwCDXXly1XKjY0k+ocRs2Xd7grD5fJnHj6i2tBVPM
 Zc+w==
X-Gm-Message-State: AOAM5322ZYT3N3TuCj1LPqs90aq0j8O0sVaeWKcVcltZjwoecHBJf6+o
 asGSSA7frjfW//k/jQ60koY=
X-Google-Smtp-Source: ABdhPJx2kdH3EDLTWxxIZsf/SsRb2I8+HWu52bGvOlOTcxSZcRVI+7y/n58AnL2/Lz/6jyUB9+xjYA==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id
 k16-20020a056a00169000b00517cc9e3e2dmr46548pfc.0.1654091709025; 
 Wed, 01 Jun 2022 06:55:09 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.146.177])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a631c49000000b003fc600628a7sm1378030pgm.31.2022.06.01.06.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:55:08 -0700 (PDT)
Message-ID: <55d99105-8492-e020-bed6-82e52b5fc8a1@gmail.com>
Date: Wed, 1 Jun 2022 21:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Content-Language: en-US
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220601122050.1822-1-linmq006@gmail.com>
 <YpdpCWW9+igsVydr@phenom.ffwll.local>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <YpdpCWW9+igsVydr@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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
Cc: Miaoqian Lin <linmq006@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel

On 2022/6/1 21:26, Daniel Vetter wrote:
> On Wed, Jun 01, 2022 at 04:20:50PM +0400, Miaoqian Lin wrote:
>> The pm_runtime_enable will increase power disable depth.
>> If the probe fails, we should use pm_runtime_disable() to balance
>> pm_runtime_enable().
>> Also call disable function in remove function.
>>
>> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>> ---
>> Changes in v3:
>> - call pm_runtime_disable() in v3d_platform_drm_remove
>> - update commit message
>>
>> Changes in v2
>> - put pm_runtime_disable before dma_free_wc
>> - rename dma_free to pm_disable
>>
>> v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
>> v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com
> Maybe a bit late since we're at v3 already, but are there no devm_
> functions here that would dtrt automatically? 

Sorry I don't see one, or we can use devm_add_action_or_reset() to add handling

action. something like disp_cc_sm8250_probe() in drivers/clk/qcom/dispcc-sm8250.c

How do you think?

> Or is there another reason
> we can't use them?
> -Daniel
>> ---
>>  drivers/gpu/drm/v3d/v3d_drv.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
>> index 1afcd54fbbd5..f3380399fe17 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -286,7 +286,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>>  
>>  	ret = v3d_gem_init(drm);
>>  	if (ret)
>> -		goto dma_free;
>> +		goto pm_disable;
>>  
>>  	ret = v3d_irq_init(v3d);
>>  	if (ret)
>> @@ -302,7 +302,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>>  	v3d_irq_disable(v3d);
>>  gem_destroy:
>>  	v3d_gem_destroy(drm);
>> -dma_free:
>> +pm_disable:
>> +	pm_runtime_disable(dev);
>>  	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>>  	return ret;
>>  }
>> @@ -316,6 +317,7 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
>>  
>>  	v3d_gem_destroy(drm);
>>  
>> +	pm_runtime_disable(&pdev->dev);
>>  	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
>>  		    v3d->mmu_scratch_paddr);
>>  
>> -- 
>> 2.25.1
>>
