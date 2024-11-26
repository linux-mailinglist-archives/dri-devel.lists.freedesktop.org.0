Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E19D932F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436FE10E1A2;
	Tue, 26 Nov 2024 08:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cR/n3fK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0EF10E08A;
 Tue, 26 Nov 2024 08:19:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-382610c7116so2786839f8f.0; 
 Tue, 26 Nov 2024 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732609191; x=1733213991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R3Ie+40mqHQQBBnS7k5Ii1Z4QZYCeOb9hQb1G+1bDYY=;
 b=cR/n3fK5HaqRJ+tKDCoPAzGBX8ag9NMeVsyaM2fIzn6HFrCCWXDbya9xChNObZsSMW
 2o8Gcfw7fc+PHCD3KL8PSX2ihKtmfJGjiO2muklP7UuWQq73IY6mvSxgRA1qCry3PH/8
 Wa6/eQ4H+UdUTVdl4RjVOhHKU1Tms7ZctV/h/SRC42zBm5nuIv2qQLqWDuh41pKBMOxg
 EjsaIbEK4Ehp5qi/bRoGUXynBWDPW+1Z3nHqBhS6LJxyfqQoVE6906OqMp3Hrqk5KLHj
 i0xEspk/RNoKzZk4OZxOwWpz1q8IjC070H7ktepwvb7Ou/jwrwx7DrXefsuw2u81JfpH
 Ge1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732609191; x=1733213991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R3Ie+40mqHQQBBnS7k5Ii1Z4QZYCeOb9hQb1G+1bDYY=;
 b=WKUeHt3rDYpIcfCsTxwnMmWLw5cmaxeXOD2KfMQoMkx6RRMLGkzwJBqZalbx6XXu7n
 EzncCWAEqZiTr5weD1FHn52Nizf89BCSNyDbadIhp64lDz6urQJjkc/7K1qEyLCYTkfx
 8UNNA2k/8jXMjN5xJxocG6KKxDmyoexnIOfp0xY6u14g1Hc2ksf9C1RLLp2lfKpAGXrq
 yf9CWaMbgMKvrV+kO9mH0+eWbJWlmJ+uMy/xLMQRN4naO67GW2EZUvtFFUVsiw1G8/c+
 qcEQDxpQjU75PvhFj9L92I6CO8Ch/NN9NH4dQPamOZ3FBOlAeDNGQB818zGiVNs1dcre
 t38w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuBCYKl/ceTbfoNxr06Dk3eUnjXRT6HPWmDx2RnG23E14ccQQD9ieMV1Fp9WDeSkI+JqpMFW7kEjM=@lists.freedesktop.org,
 AJvYcCWNxvIi9FvhlQRbVLo8WQCBRo2UDrVsgl6fBCmmUPoPpEb1dTV6jNDPBskx6cjWqphLOUvI5Bu0eik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkF5tJv5Wp2D1a6PEDVlzy3cW6d8uOpm1cwMLMuHutYUOUkZE+
 W/vGOW1hJanKhGDtRAwUAx4NwjK+dUphc78iSv8GRfjlhF2NNSkj
X-Gm-Gg: ASbGncu+rbOg1lnd38NmgM10YFGk6OOclvIqUIqs07QNzby4+zz3RjJl7/tWtmxW/cx
 +FCEY+TPa7K/hzKbwEJI463jCUgfqgUHs1DdNhtLI6eIStlf/YtZydLh5OfKCZZRv++V8E2yCS1
 XBwxAiER6KPsmFINUemLmtQ8uGiHQyIySgko3QjQ6Ua6dAnOGemYgdkjV2QxlGP+NDOEGkdUpKD
 1heUDjYWumXPLBiWFe0eIUJ6gxUhguKYLCDlC5kqErELNeso/0QjBuBhHORRxAKhz4k3U14M9Pk
 9jY=
X-Google-Smtp-Source: AGHT+IEp09Zzkozv4uyWJYKnb/dYy17i28ANN+aKb20gXMa26cyhUUmJLQAPOXV+mkbtnqc4DUOoww==
X-Received: by 2002:a05:6000:98b:b0:382:4aeb:91ac with SMTP id
 ffacd0b85a97d-38260b830e2mr13840691f8f.31.1732609191409; 
 Tue, 26 Nov 2024 00:19:51 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad62fasm12535702f8f.15.2024.11.26.00.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 00:19:50 -0800 (PST)
Message-ID: <18681d07-beb4-41c5-a935-11b8ec231c27@gmail.com>
Date: Tue, 26 Nov 2024 09:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
 <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
 <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
 <Z0SzddLDzR8NDWmV@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Z0SzddLDzR8NDWmV@lstrano-desk.jf.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.24 um 18:27 schrieb Matthew Brost:
> On Mon, Nov 25, 2024 at 05:19:54PM +0100, Christian König wrote:
>> Am 25.11.24 um 16:29 schrieb Matthew Brost:
>>> On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
>>>> [SNIP]
>>>> We use this interface to read a BO marked with a dumpable flag during a
>>>> GPU hang in our error capture code. This is an internal KMD feature, not
>>>> directly exposed to user space. Would adding this helper be acceptable
>>>> for this use case? I can add kernel indicating the current restrictions
>>>> of the helper (do not directly expose to user space) too if that would
>>>> help.
>>>>
>>> Christian - ping on above.
>> Sorry, I will try to give those mailing list tasks a bit more time in before
>> the xmas holidays.
>>
>> That is an acceptable use case, but the problem is that this helper won't
>> work for that.
>>
>> See during a GPU hang you can't lock BOs, so how do you want to look into
>> their content with the peek helper?
>>
> Agree we cannot lock BO directly in GPU hang path (TDR). Our error
> capture code takes a snapshot of some the GPU state which is small and
> safe to capture in TDR and kicks a worker which opportunistically
> captures the VM state which has been marked to be captured. This is
> where the helper is called and it is safe to lock the BO.

Yeah that sounds like it should work.

No objections from my side for that use case, but I would rather like to 
keep the code inside ttm_bo_vm.c.

Crash dumping is usually something associated with the VMA even if it's 
a bit special here for the VM state.

Regards,
Christian.

>
> Matt
>
>> The only thing you could potentially do is to trylock the BO and then dump,
>> but that would most likely be a bit unreliable.
>>
>> Regards,
>> Christian.
>>
>>>> Matt

