Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61B491096
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 20:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B774810FA1C;
	Mon, 17 Jan 2022 19:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0C10FA1C;
 Mon, 17 Jan 2022 19:17:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c2so17155023wml.1;
 Mon, 17 Jan 2022 11:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=1uv8E4JsHo+5hRqyfVHNLbOC6MRnm3IFtgR89GglQsU=;
 b=h3e/jqmIs06rFNZIxuU7VlO13wcuetiuCMRn7pLDRsN65joOGl7vAaQBCK8Jc1qUo5
 U/RBlQhUj+kR+lcofrmlc1HqpA9kkkq9RxUSY0iH4xJAharsN/sNuc+P6aFpCmvuvBxO
 4unBpdif30vNV4Uj44cMrrisRWrI+dtsiZSbESmsg6kJvQDu2pEwspTDqqgkxd2Fqh86
 mViZI0zAbAALUo0WRkg7oKI7Az4fDXBhOSyHm+IZccMV3/wlSkuRotQxdxD9k2t96e4o
 Sg+Kp+9xh9yFZitwCfnI62TvdcaIT2j1+wbxu0y6WfcFs02+CLGtYfZMqDBSWcKwqhBi
 n0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=1uv8E4JsHo+5hRqyfVHNLbOC6MRnm3IFtgR89GglQsU=;
 b=lWtllTMgQ70vlkxZWRh8ino+J0arsfoOSuyDf+lfGlH+iJ8pow9vKt1G1QDAz5nRpr
 tW/271J773olY4MvUYJysgcxb7z5RoOavQcFUBprJwGa2tqBmfsmlyiBVOdHmjejCE7p
 kQKzlCjQjZJLQN4+34LhaEci5M1+syZ1MWC1LD5J6CC03ghiXEDr1UI+VFVy/FgCPqLT
 NyIDHNWuyRMseymyDK0unhi50r9U2Mdj/32rdBQ2YakgAP52Qn+ViR1io6eTpEAQ001t
 8prO0LZARsNHDSzKP9FRhxQJe/QC4j4RD6Em1pjZU3qQUULCXg7Xuz0yO85Ce+E1mKzE
 iisw==
X-Gm-Message-State: AOAM532gH9uAu2WLnJbWe4RpeLe4GSFd8HcDMdBNuBhQU5pllCbEel38
 AJtOnRJdFY7XaWi4cei3OVmlvkQQwXk=
X-Google-Smtp-Source: ABdhPJwAB9PydQE71r9P4UTj7YkEKvEQI73D8xYWUByJ19WUXKb/y+ZqRU2Q87Erx3Te07FzPBzWLg==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr21457144wmi.181.1642447051314; 
 Mon, 17 Jan 2022 11:17:31 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:ce81:e07f:7254:c8cf?
 ([2a02:908:1252:fb60:ce81:e07f:7254:c8cf])
 by smtp.gmail.com with ESMTPSA id n7sm236433wms.46.2022.01.17.11.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 11:17:30 -0800 (PST)
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
Date: Mon, 17 Jan 2022 20:17:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
Content-Type: multipart/alternative;
 boundary="------------9BB22B375D5FD98A85487286"
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------9BB22B375D5FD98A85487286
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:
>
> Ping on the question
>

Oh, my! That was already more than a week ago and is completely swapped 
out of my head again.

> Andrey
>
> On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
>>>> Also, what about having the reset_active or in_reset flag in the 
>>>> reset_domain itself?
>>>
>>> Of hand that sounds like a good idea.
>>
>>
>> What then about the adev->reset_sem semaphore ? Should we also move 
>> this to reset_domain ?  Both of the moves have functional
>> implications only for XGMI case because there will be contention over 
>> accessing those single instance variables from multiple devices
>> while now each device has it's own copy.

Since this is a rw semaphore that should be unproblematic I think. It 
could just be that the cache line of the lock then plays ping/pong 
between the CPU cores.

>>
>> What benefit the centralization into reset_domain gives - is it for 
>> example to prevent one device in a hive trying to access through MMIO 
>> another one's
>> VRAM (shared FB memory) while the other one goes through reset ?

I think that this is the killer argument for a centralized lock, yes.

Christian.

>>
>> Andrey 


--------------9BB22B375D5FD98A85487286
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:<br>
    <blockquote type="cite"
      cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Ping on the question</p>
    </blockquote>
    <br>
    Oh, my! That was already more than a week ago and is completely
    swapped out of my head again.<br>
    <br>
    <blockquote type="cite"
      cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
      <p>Andrey<br>
      </p>
      <div class="moz-cite-prefix">On 2022-01-05 1:11 p.m., Andrey
        Grodzovsky wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com">
        <blockquote type="cite" style="color: #007cff;">
          <blockquote type="cite" style="color: #007cff;">Also, what
            about having the reset_active or in_reset flag in the
            reset_domain itself? <br>
          </blockquote>
          <br>
          Of hand that sounds like a good idea. <br>
        </blockquote>
        <br>
        <br>
        What then about the adev-&gt;reset_sem semaphore ? Should we
        also move this to reset_domain ?  Both of the moves have
        functional <br>
        implications only for XGMI case because there will be contention
        over accessing those single instance variables from multiple
        devices <br>
        while now each device has it's own copy. <br>
      </blockquote>
    </blockquote>
    <br>
    Since this is a rw semaphore that should be unproblematic I think.
    It could just be that the cache line of the lock then plays
    ping/pong between the CPU cores.<br>
    <br>
    <blockquote type="cite"
      cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
      <blockquote type="cite"
        cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
        What benefit the centralization into reset_domain gives - is it
        for example to prevent one device in a hive trying to access
        through MMIO another one's <br>
        VRAM (shared FB memory) while the other one goes through reset ?
        <br>
      </blockquote>
    </blockquote>
    <br>
    I think that this is the killer argument for a centralized lock,
    yes.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:62f9f1c2-312b-760e-75f7-e86421333be3@amd.com">
      <blockquote type="cite"
        cite="mid:c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com"> <br>
        Andrey </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------9BB22B375D5FD98A85487286--
