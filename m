Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3B464DBA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0285B6E897;
	Wed,  1 Dec 2021 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EF96E870
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:13:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z8so47728541ljz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rn2GcnJWYG6N/6B+6c9uNF9P+OpEp/vxjAjKeyHyOMY=;
 b=ZjuZ9wEf1KnNKYWLpDcpLdinTZcWMuMKfc0DzZLALA3t4jnljmaSXZfabLbdp9LTmZ
 rlJwdpoYQ2DrMebE0fblWRuYjycuKiKEUBH/bqJiUkcUNY5lLDExubn+TCKGUweRFwhM
 IroU7TU5WKZMoii092qJTmsRddiQI/MvKdbRl1jUWK+wwnMeNLEJhj3RZU/Q6DyOHX3u
 tAKsTdEF/lXJZaAJudfExikHm4WrZE/GoKyG8M5FifO/yrGWY00kdsqCVkibzvTvuY0P
 R3OyJXyx80E1MEiTDquwlhRLnwbtarS7vzDluHsWiz2hUhvGc4ApDg0eFunb8O1USvHK
 pUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rn2GcnJWYG6N/6B+6c9uNF9P+OpEp/vxjAjKeyHyOMY=;
 b=7T/0G1A/jwam6CFjp7YSP1wlKetTlLSA6lDoAUBIhP3dmyDtK1IzJavGapjG7D6zYg
 9kMaq4zP892dayxhQmiTZRivb5QrovTJFFWJonYZb8iBM3kNHmOPHs02YuzW3fVpQdty
 e33xZ/b4RbxkRv+FIx3Vang/WXm+Hp6iyL1KrGcKUP8DngLPO/tYPbGIoFlS9FBai66w
 Jt6o0aavkZvKmubUjTsKomVmZKELcX6QLdNyQ1TVhmi/xytNJrFLhr/l01thHTEC8r26
 nLBJthdm3dqvLkA5i50hADUsy/p/xOLxLNgopz/rixES3+edGh4SNHslKdQrAFLdF6Ai
 pOEw==
X-Gm-Message-State: AOAM532A2nFUY/5vzCo2A3lGk47lIgqa77Yw+51GkxZGtq5v1CWreV+M
 7YD7DWA7K/zqhoF1uUQwXh1bQw==
X-Google-Smtp-Source: ABdhPJzmZCm30Wy2X++Apslesp0dRIBcxTHXeT1lGkFQHM7ZY5s4xetkFSVQoi5dZUz4+/Uj8pmNCQ==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr5114729ljk.291.1638360817768; 
 Wed, 01 Dec 2021 04:13:37 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p13sm2347049lfu.130.2021.12.01.04.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 04:13:37 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dpu: fix exception in error path
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211125180123.561305-1-dmitry.baryshkov@linaro.org>
 <Yabjv2pnC1KlQGhS@builder.lan>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <01e5c31b-a0e2-01fe-9669-a98ceed3b77e@linaro.org>
Date: Wed, 1 Dec 2021 15:13:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yabjv2pnC1KlQGhS@builder.lan>
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
Cc: freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2021 05:53, Bjorn Andersson wrote:
> On Thu 25 Nov 12:01 CST 2021, Dmitry Baryshkov wrote:
> 
>> In case of DPU probe failure, prevent the following NULL pointer
>> exception:
>>
>> [    3.976112] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
>> [    3.984983] Mem abort info:
>> [    3.987800]   ESR = 0x96000004
>> [    3.990891]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    3.996251]   SET = 0, FnV = 0
>> [    3.996254]   EA = 0, S1PTW = 0
>> [    3.996257]   FSC = 0x04: level 0 translation fault
>> [    3.996260] Data abort info:
>> [    3.996262]   ISV = 0, ISS = 0x00000004
>> [    4.005229]   CM = 0, WnR = 0
>> [    4.028893] [0000000000000030] user address but active_mm is swapper
>> [    4.035305] Internal error: Oops: 96000004 [#1] SMP
>> [    4.040223] Modules linked in:
>> [    4.043317] CPU: 1 PID: 50 Comm: kworker/u16:2 Not tainted 5.16.0-rc1-00036-g6d4bafcbb015-dirty #166
>> [    4.052518] Hardware name: Thundercomm Dragonboard 845c (DT)
>> [    4.058224] Workqueue: events_unbound deferred_probe_work_func
>> [    4.064105] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    4.071124] pc : dpu_core_irq_uninstall+0x28/0x100
>> [    4.075960] lr : dpu_core_irq_uninstall+0x24/0x100
>> [    4.080793] sp : ffff80001057b990
>> [    4.084138] x29: ffff80001057b990 x28: ffff7653c0a41c00 x27: ffff7653c0926480
>> [    4.091330] x26: ffffb90d5d262ad0 x25: ffff7653c4b2e980 x24: ffff7653c0046080
>> [    4.098520] x23: ffff7653c099a810 x22: ffff7653c5a65800 x21: ffff7653c5a65080
>> [    4.105711] x20: ffff7653c5a65800 x19: ffff7653c0046080 x18: 0000000000000034
>> [    4.112902] x17: 0000000000000038 x16: 0000000000000005 x15: 000000000000000c
>> [    4.120095] x14: 000000000000024c x13: ffff7653c2f90358 x12: 0000000000000000
>> [    4.127287] x11: ffff7653c2f903b0 x10: 00000000000009c0 x9 : ffff80001057b180
>> [    4.134477] x8 : ffff80001057b404 x7 : 0000000000000000 x6 : ffff7653c5a5f190
>> [    4.141669] x5 : ffff80001057b890 x4 : 0000000000000000 x3 : ffff7653c5a5f0f4
>> [    4.148859] x2 : ffff7653c2f50000 x1 : 0000000000000000 x0 : 0000000000000000
>> [    4.156052] Call trace:
>> [    4.158525]  dpu_core_irq_uninstall+0x28/0x100
>> [    4.163004]  dpu_irq_uninstall+0x10/0x20
>> [    4.166963]  msm_drm_uninit.isra.0+0xe0/0x1b0
>> [    4.171353]  msm_drm_bind+0x278/0x5f0
>> [    4.175043]  try_to_bring_up_master+0x164/0x1d0
>> [    4.179610]  __component_add+0xa0/0x170
>> [    4.183482]  component_add+0x14/0x20
>> [    4.187086]  dsi_dev_probe+0x1c/0x30
>> [    4.190691]  platform_probe+0x68/0xe0
>> [    4.194382]  really_probe.part.0+0x9c/0x30c
>> [    4.198601]  __driver_probe_device+0x98/0x144
>> [    4.202990]  driver_probe_device+0x44/0x15c
>> [    4.207208]  __device_attach_driver+0xb4/0x120
>> [    4.211685]  bus_for_each_drv+0x78/0xd0
>> [    4.215549]  __device_attach+0xdc/0x184
>> [    4.219412]  device_initial_probe+0x14/0x20
>> [    4.223630]  bus_probe_device+0x9c/0xa4
>> [    4.227503]  deferred_probe_work_func+0x88/0xc0
>> [    4.232075]  process_one_work+0x1e8/0x380
>> [    4.236126]  worker_thread+0x280/0x520
>> [    4.239902]  kthread+0x168/0x174
>> [    4.243166]  ret_from_fork+0x10/0x20
>> [    4.246778] Code: f9442400 91004000 940188b9 f9430660 (b9403001)
>> [    4.252925] ---[ end trace b470a50cd7b5e606 ]---
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index d2b6dca487e3..fc1b6c47c93d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -575,6 +575,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>>   {
>>   	int i;
>>   
>> +	if (!dpu_kms->hw_intr)
>> +		return;
> 
> I would rather see that we fix msm_drm_init() to nicely unroll things in
> a more granular fashion instead of handle all types of errors with the
> big hammer that msm_drm_uninit() provides.

It well might be that this issue happened because of earlier version of 
Angelo's patch (which had other issues too). So I'm dropping this for now.

> 
> Regards,
> Bjorn
> 
>> +
>>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>   	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>>   		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry
