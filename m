Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29340AE1B14
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 14:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565110E231;
	Fri, 20 Jun 2025 12:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="knhDQnpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521E010EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 12:40:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so19709455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1750423252; x=1751028052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWHsGUBFEN1KUfzCF8rv1/QvjATm1qfhGurlRc+Xo8w=;
 b=knhDQnpe2vzou/WJvA4D2Wj8eluMt8AH9axGPoy91pP1qim8sz5kfh+/ywiDDYnycF
 fzQxVe+LP9DF1EQUyS81v2i/1PBvUIEffZHR5XqcXylqMND0Q2OF+ZgbfFusoVzOII5R
 TKmUgWZTwsOiFiHhMZ4aiJ1Hqzy5r84c7UScWxzhTu+Z0wggNDNYh8kLSPNgcXDKNAyd
 prL4rhn/uPt+c6ALNXvySpDKuYmKFQNS6nVyhCmYq3mlsEzUhMsWwayShpAVnK+g0ReK
 fzNTKL6MnmDUR0e/6NmRoYveybzpVjeW8oKvd5wroP+yoosjz0ZTKCxEU5WeX39EhrlZ
 0mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750423252; x=1751028052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWHsGUBFEN1KUfzCF8rv1/QvjATm1qfhGurlRc+Xo8w=;
 b=eO3pAI5mjL3tJljzC70jQww0sk4wE6qgf0QWFJdFUFy+EDoliOmlwozjdLaH40Wyf9
 wss5gwqT9DRz8BtiR6tllPy+JuJ/UoYaX+evSNFEKvL5yM7NduGEkHg2OcuYm54YQ5wc
 8VhGjzKqWiCDmyM0EucveuIvjiXHYEaYIJEHOofsNm8ztItauJMUeA4jn7p0yl/NStv8
 FQdynYGsYuPRNAvn2HVYxgxR4o1JdiX+b+nVAVDb/zeGXpplWvDHEAPNJy14B/ujHVhn
 NvVHcRJlC5eDWcO4zD9pY6HRsJ4HIGeO3Z+yAlNfYu+cU/xu/DYpkfY6NUIp/mD8pTjx
 mVBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZi7uwoJN1nPgwo50KpBl1pHVnXC/s41d6ztXB6uf6VD+D7fr29ZxL0H+MxggFlG2rF/uwiXJxXZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYfggev5vyXYUdCU5mhkze62GlCp+Ru/NTig6DZ5JmcMChLVpr
 jnBzY1TWwJX5svPk0owkHxQzD0WHs1SvRwncGSorHEmTx/bNeR3MGrDnKEYn027uTyE=
X-Gm-Gg: ASbGnctlhpEppBJmELKpCZ74KzAR6Dm3KMy19Fl9Trf17NB1pRHzayGy0GFIkKcs7WX
 BkP1qA7FNKxqwErnVCSHjlDzwlLe/zjfcra1bg/27Y4zaFdEk7mpE5x/yJmtyDskKAv33ECB0ur
 h9HdlBj0Da3W5dh+HLbvwY+k+T9HvxjuXaTlLISWxsmDTCr+50KlMYtoOy7XfznCn9oDltNsKIp
 rIUTU1J84Nfg/PkzUvGBPt4ghNH56MiuR7Apa74tWy1AMG0HemE2DvgMq7owdceu5x4w1INvKNx
 G9RhSXUctypiYGACFQXl1O4GoiQ4/3QBh64SHzUtSzFxcOyLu2Fk5LDqQgxFByLxXnwJEd/kedj
 c
X-Google-Smtp-Source: AGHT+IElOXijoyB+KGBKjJKjycZ49XMmKLEe2pa6xDkJBW3yU7xU50uT5NxqB7o/cFFnTHdxgNoR/A==
X-Received: by 2002:a05:600c:1392:b0:43c:ed61:2c26 with SMTP id
 5b1f17b1804b1-453658ba515mr26170355e9.17.1750423251386; 
 Fri, 20 Jun 2025 05:40:51 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d0f1d1bbsm1982491f8f.41.2025.06.20.05.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 05:40:50 -0700 (PDT)
Message-ID: <2e76cb27-ef90-4da5-a10d-5c1ac20a3d67@ursulin.net>
Date: Fri, 20 Jun 2025 13:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] debugfs support for pt base for each vm
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250613071537.701563-1-sunil.khatri@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250613071537.701563-1-sunil.khatri@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/06/2025 08:15, Sunil Khatri wrote:
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/clients
>               command  tgid dev master a   uid      magic                                                             name client-id
>        systemd-logind  1056   0   y    y     0          0                                                          <unset>     5
>              Xwayland  1733 128   n    n   120          0                                                          <unset>     8
>       mutter-x11-fram  2048 128   n    n   120          0                                                          <unset>     9
>              ibus-x11  2071 128   n    n   120          0                                                          <unset>    10
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client
> client-1/  client-10/ client-2/  client-5/  client-8/  client-9/  clients

How about making clients a directory? Ie. in your example:

# ls -1 /sys/kernel/debug/dri/0/clients/
1
5
8
9
10

# cat /sys/kernel/debug/dri/0/clients/1/pt_base
81febf3000

Regards,

Tvrtko

> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
> client-1/  client-10/
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
> client-1/  client-10/
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1/pt_base
> 81febf3000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-5/pt_base
> 81febe9000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-8/pt_base
> 81febdc000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-9/pt_base
> 81febb2000
> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-10/pt_base
> 81febaf000
> 
> 
> Sunil Khatri (2):
>    drm: add debugfs support per client-id
>    amdgpu: add debugfs file for pt-base per client-id
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 14 +++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +++-
>   drivers/gpu/drm/drm_file.c              | 13 +++++++++++++
>   include/drm/drm_file.h                  |  7 +++++++
>   5 files changed, 37 insertions(+), 3 deletions(-)
> 

