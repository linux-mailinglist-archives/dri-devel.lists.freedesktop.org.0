Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3D73B16D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6CA10E613;
	Fri, 23 Jun 2023 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160B10E4FC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:02:21 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-668842bc50dso867513b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424541; x=1690016541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKVeIBLjGDnMEk399X22nqGU5gR+IkjsspTDpWJPksU=;
 b=HjY0DB39Dcl5lSGLQjq20skrYCeeFmph379iAYLH+Ge7wfAKg53bPqsk6H2fP7EYBS
 t5DpaPmOpMe9PHj27s46dMLM2Bj/1z5x+ZEL5MvZJuXhJY2H/Zc1d9fn+QrQnej+vVdY
 vzCZGIIlTPo2rLaoGoYpJ1L3vbMVEY3NdkrXdCuf8JyzXegOrVS1Vjiyr+OQJLWRHhKk
 EYYaud7eSqVUu6DRfGnsjIklhfOOGSE9DMnkFqVVNxWwjgF6B/w1c5xtOvh0H76XPlTG
 hJ3GGBNx4/T/av8JLo7MkeEFcvm+/A4v85iddIKGKlUHLAO6ueBAEAbEtaFjl/PvtvxB
 9ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424541; x=1690016541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKVeIBLjGDnMEk399X22nqGU5gR+IkjsspTDpWJPksU=;
 b=jtm5bcnIh4HEM+X25mEf74L5jukmMByR2vWuukMaSWDfThfkg8kFVsppuhEyXXPv3/
 yL4lWjfwE/LfetM5/WwwMW1CQhxD8WS3ox1Qw73qUQ1swpfBxC76Ec+FZ1EcEpNiBj2g
 b5K61ASg143Zqne/XND/4WV40sLB+8Df5eRpgZAK0a/raMCZ5Z/QsksPMcdwMRr4LNO5
 oIK73iF+7cgKbtNSItvp2myYCrBtGX/WJ0rzbaCV3Kru+zMdlwXKighZRBKdT/tE5UFd
 ztThl94P74Q+gR++YLUIXp0W7SOGLbl9RIX4ojnu2nf/nDHdU+JOyUSW6+dV9Qsb704h
 Uzlw==
X-Gm-Message-State: AC+VfDyGABcR7eyKtyoY0astr4qMCHvTnKX+RHvTNGjMpC7QJS8v8MIj
 M7eqQVeme5wEGdgd+yXabqbUWQ==
X-Google-Smtp-Source: ACHHUZ7vbwmhYAYkPUIyhZunGrGDutPqIs+afT9QzkvrLydl1MlC9S7gSKJ8cU+dWHpEZBjCPLu5gw==
X-Received: by 2002:aa7:8556:0:b0:668:728e:64d8 with SMTP id
 y22-20020aa78556000000b00668728e64d8mr12967640pfn.1.1687424541033; 
 Thu, 22 Jun 2023 02:02:21 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0063f2a5a59d1sm4124268pfr.190.2023.06.22.02.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 02:02:20 -0700 (PDT)
Message-ID: <ab40cfba-94c3-bcea-10b0-c2cc20809f3d@bytedance.com>
Date: Thu, 22 Jun 2023 17:02:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 00/29] use refcount+RCU method to implement lockless slab
 shrink
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Well, this one was sent successfully.

Since I always get the following error message, I deleted the original
cc people and only kept the mailing lists.

	4.7.1 Error: too many recipients from 49.7.199.173

Thanks,
Qi
