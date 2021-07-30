Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B773DBDD6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 19:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042DD6E24D;
	Fri, 30 Jul 2021 17:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E686E24D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627666667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCAX2Kmv6swjeLPb8XTOG5P1FiP7p6CkcukVbAna/IY=;
 b=FheBuScoPZwAcozpOcOOkFdxhmWFtMcU/3nQ8BnWr/u6GJMGHaWn2s/Cqiw3hYLTXjLn07
 xN9rkzckwSnkKT1x+rk9jDhE0JgDEz24G3ZKISp21maR5M8FwmV8um2rWqWGnPMApG4QLX
 25hMY52TYMz68EhI1Ua8myBBe+pT3CM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-OcPSNpxzMdiv6ukDlRG9PA-1; Fri, 30 Jul 2021 13:37:44 -0400
X-MC-Unique: OcPSNpxzMdiv6ukDlRG9PA-1
Received: by mail-qk1-f198.google.com with SMTP id
 x12-20020a05620a14acb02903b8f9d28c19so6129548qkj.23
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vCAX2Kmv6swjeLPb8XTOG5P1FiP7p6CkcukVbAna/IY=;
 b=hNivn7NFPTtZFM/IO9QgYB7pi9g+hPIYV5B4yZLYXT939ZUbgFWEI4DfsjrdOylQu8
 yikNs/li3l+rkWFZFtA1xzTbvQ6BuQxPMwE/AiTdcZakP9S8tIh3OphnrS0xvqYyM4ZD
 pPSmI+4jCKBEfrKPtBP8ecpm1Nphltq5VkA/0MgtneUwQZCe0ezZRU9fhphh9seGeVGF
 F+d8clbf7Lp5Zm+Jxxo8OLmunupl6KQ8zGJuAkysLvyBu0/bBddjc3CBAe1sGbhzbXtV
 dpWyo8CzkIHH9N2XtcRqrl3H3Y20BknH5QhIVgDQc/4WlbcmG2rnZ/qJhOWr9bloHxDA
 AsFw==
X-Gm-Message-State: AOAM5307/4kYOKD2/LTaHRdc/r3cbx5R3kjvpRJmMJtuYApGcupEFroW
 hPE+cZ/k8bkr6dWlab4vPWmF+ld8lvPlu/Zt/cNRRaB0ckJ4W2mFKXw39oQ45UJNyEzjDxFnGo8
 QricjMqpMXTzlTDURZ9IZr40tBai9
X-Received: by 2002:ac8:548a:: with SMTP id h10mr3208425qtq.89.1627666663763; 
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaE99KUbpDYu6wEAU0dWSDkIcZGkRC7mBhIpMTdzhBiTASsmfcotVAkvrC5BAu6v76Y1uh6Q==
X-Received: by 2002:ac8:548a:: with SMTP id h10mr3208401qtq.89.1627666663488; 
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
 by smtp.gmail.com with ESMTPSA id a20sm896826qtp.19.2021.07.30.10.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 10:37:43 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
Message-ID: <ac36ec31-df97-b2ce-39f1-182e6859a1a0@redhat.com>
Date: Fri, 30 Jul 2021 13:37:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=llong@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/30/21 12:15 AM, Desmond Cheong Zhi Xi wrote:
> Hi,
>
> Following a discussion on the patch ("drm: use the lookup lock in
> drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
> helpers to make it convenient to compose lockdep checks together.
>
> This series includes the patch that introduces the new lockdep helpers,
> then utilizes these helpers in drm_is_current_master_locked in the
> following patch.
>
> Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]
>
> Best wishes,
> Desmond
>
> Desmond Cheong Zhi Xi (1):
>    drm: add lockdep assert to drm_is_current_master_locked
>
> Peter Zijlstra (1):
>    locking/lockdep: Provide lockdep_assert{,_once}() helpers
>
>   drivers/gpu/drm/drm_auth.c |  6 +++---
>   include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
>   2 files changed, 24 insertions(+), 23 deletions(-)
>
This patch series looks good to me.

Acked-by: Waiman Long <longman@redhat.com>

Thanks!

