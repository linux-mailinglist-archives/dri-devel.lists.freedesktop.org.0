Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25544E39B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14936EB56;
	Fri, 12 Nov 2021 09:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142C6E133
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 17:27:03 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id l8so6555457ilv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aXLTRBYI13KZIO+dfsEzstJMnF2RCHP2vfbXWKYn5mc=;
 b=Y6uLcEYJHJeBK4ccBUp+MEuFdX/9DKrSAoQHajAyWJda+2QNQESC5GXiYtQlqTssRL
 fElMFFNGJnU/dgfl7FVrv986rbK6zijwlU/8syNNafUSyckQXprEtdj1CtIS1dR4jj1b
 ON8nT/NQIC6U3owagvNAiAbfTy1Dv8AHscQUl2mnQmnSuWbz7Bbl2a9mXqDaA94FWbBV
 B3gjTzQ2McE57pwMlcu9rLm6uxbQP5R8LTqE3casbqONyNVzd4iBnXDZNsf0hiHHvd9h
 h5fE1rCVQ2baEjk2x6ZueRGHvqz49bgkyp24QTwkiniQFVWPF49JTENISX4bD+pbz/wB
 q7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aXLTRBYI13KZIO+dfsEzstJMnF2RCHP2vfbXWKYn5mc=;
 b=YcotDcN7OXtAwtMEX+znJxPPOU4KChs6TA1RXkkP+SAvFuvAgIy4gRXAPH6t/bgTZL
 fud7rH1ujoBvIOrD1xaO5NqfkCC6WSl/qpj68tCwJBewpG2w5eCEBu2JAlDSDPH9cIdt
 ZWezybrcK0uvgW5CIB2ad072hPTJkaOA/ixECPSc4GqB/AOWsFTV7Nu/cV2d8MMjf4fb
 zJiiMLDSivtFwjqct4rl3c8pW6LqLk6VL0Atv+MmwehbSfKlD9cLYn/Fekvrnec9hAJM
 POTusAkg6EglvLiG14UIWkzkCa7YE+/HY0RWUyiRpTb6RC18ceALOB3EE+Hz2C8jt+vd
 xncQ==
X-Gm-Message-State: AOAM531ZLQ+/BI/IDaUNFHEec7VWWuC2ZbVdopl5/6+ah3CD4uNP/VyC
 I3UVkQop4WVVgVeYWnsCtprg6Q==
X-Google-Smtp-Source: ABdhPJwxEk4fywkXqq80kmRZqPGAGeQVzlO7dK8j3AbPBjNVmn39bvExC3YmD97V853PntJExnTnBg==
X-Received: by 2002:a05:6e02:174d:: with SMTP id
 y13mr4982545ill.183.1636651622464; 
 Thu, 11 Nov 2021 09:27:02 -0800 (PST)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id y12sm2549196ill.71.2021.11.11.09.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 09:27:02 -0800 (PST)
Subject: Re: ____i915_gem_object_get_pages() -> shmem_get_pages() crash in -git
To: Ajay Garg <ajaygargnsit@gmail.com>
References: <c19e9907-4651-7503-915e-60f4df530e95@kernel.dk>
 <CAHP4M8WdJUH4UY5s0La=Xq9sMnqDQzk=zSaFTZ9G321KYVmx0A@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6bb8c25c-cdcf-8bca-3db2-9871a90d518f@kernel.dk>
Date: Thu, 11 Nov 2021 10:27:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHP4M8WdJUH4UY5s0La=Xq9sMnqDQzk=zSaFTZ9G321KYVmx0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/21 10:03 AM, Ajay Garg wrote:
> Hi Jens.
> 
> Same issue at my side.
> 
> Have posted a patch at
> https://lore.kernel.org/linux-mm/CAMZfGtUp6dkT4OWzLhL8whqNnXAbfVw5c6AQogHzY3bbM_k2Qw@mail.gmail.com/T/#m2189d135b9293de9b4a11362f0179c17b254d5ab
> 
> Will be great to hear back if it fixes things at your side too.

Yep, looks like that'd fix it indeed.

-- 
Jens Axboe

