Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748F75605B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 12:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE5110E223;
	Mon, 17 Jul 2023 10:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1D610E223
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689589547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZxqwFcIYi400ycUN1jF1UBiOV7Go/IiKqR9OlilEKQ=;
 b=SfykH/ii3gUCTwlyPuuCth+cz001fCWo95eWHJiSUOn65rniv0I8nUqum9T2TOTs9h0f/8
 YGi6pYFViNM1FtuYbUvoywXkP25N53QuE15VHpDDSb8eO792EaoINwhwjmRGMQ47lVVkCQ
 c+j9coZwgS0ZIcR7yWBv3h+UhR4T6rg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-_B-34mWwOF2qYwAf8Qo-4w-1; Mon, 17 Jul 2023 06:25:46 -0400
X-MC-Unique: _B-34mWwOF2qYwAf8Qo-4w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso2376149f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 03:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689589545; x=1692181545;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZxqwFcIYi400ycUN1jF1UBiOV7Go/IiKqR9OlilEKQ=;
 b=EE1CSZZy6fdRW2YbLbWbSpWbfTTmtdt3Uh9fwJUwJVwEJVSFWbJuzdtI8Cyf7GfQkr
 DZp7UD4sbDcipoFZLHR92U2rThH6aswfc0icVi+iaa0+CzIBBe8+F14vP3w32NgVUT75
 KKFmcFOm/wez1EevEpUOlf4AxkPsuhwJXRsjAvpdAjM5aYXaaMx2fp0NfavBT3A3au8b
 Vq4PFVNjCje03YSKKMqT1eQ4AzuIl238nRGsTk2DopiQ1UWfk+Q370/BvGiBbcRW5YWA
 nchS5TnH2hXdb04sLPFHDWtppcyOZhy2uHLVz4TY5FuLSEiDebemPLLSaTJImVu571N+
 33QA==
X-Gm-Message-State: ABy/qLY7QItcmh/Eqe0rvD36sq8hMFisgmMflCmXbgcKvLfdXftyG+Qi
 MyCDsBS1Aho1kvrwHVD+QYBLVOqiE22mpyo31SlJq+HYzNXdkKP8h6FzzBo3TMj0FcHW7sWJVms
 pHw9hyRQlpL3o9iamMRBzfOAlgK/F
X-Received: by 2002:a5d:6301:0:b0:313:f548:25b9 with SMTP id
 i1-20020a5d6301000000b00313f54825b9mr10182304wru.40.1689589545445; 
 Mon, 17 Jul 2023 03:25:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEWwgj2gvrTcZVcFzDTLfBjRjMXpKrSXg5bhLw4PXADJbZO+n+htRPdtsID+emCjARx8zYmVw==
X-Received: by 2002:a5d:6301:0:b0:313:f548:25b9 with SMTP id
 i1-20020a5d6301000000b00313f54825b9mr10182288wru.40.1689589545080; 
 Mon, 17 Jul 2023 03:25:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c735:400:2501:5a2e:13c6:88da?
 (p200300cbc735040025015a2e13c688da.dip0.t-ipconnect.de.
 [2003:cb:c735:400:2501:5a2e:13c6:88da])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4641000000b0031434936f0dsm18732085wrs.68.2023.07.17.03.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 03:25:44 -0700 (PDT)
Message-ID: <2000511c-d551-5b3d-a9a9-adb4ba3be1f1@redhat.com>
Date: Mon, 17 Jul 2023 12:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] mm: use vma_is_stack() and vma_is_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-3-wangkefeng.wang@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230712143831.120701-3-wangkefeng.wang@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.07.23 16:38, Kefeng Wang wrote:
> Use the helpers to simplify code.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   fs/proc/task_mmu.c   | 24 ++++--------------------
>   fs/proc/task_nommu.c | 15 +--------------
>   2 files changed, 5 insertions(+), 34 deletions(-)
> 

Please squash patch #1 and this patch and call it something like

"mm: factor out VMA stack and heap checks"

And then, maybe also keep the comments in these functions, they sound 
reasonable to have.

-- 
Cheers,

David / dhildenb

