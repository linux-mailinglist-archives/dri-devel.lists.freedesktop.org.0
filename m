Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E709A8C3F43
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC110E632;
	Mon, 13 May 2024 10:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Yd1EKUVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE11010E632
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:45:14 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e09138a2b1so59020381fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715597113; x=1716201913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+KuzpIxahVwlaIoyyL8S0U8FbokXWKxsp3dQ7RLKms=;
 b=Yd1EKUVzwICTYx0wA0FSS+NglPXebdFlDfPneSN8LsgzZqNW1HytLk0LITOyPEvPcB
 hWaE6VwWLTufHsKkrU9/ig5er3ndCrlXgXXEOztx0czyRpi3WCceLgHan4HJPb3O8JyC
 C5RkoUtAz+epqA0l96BV5IRdAhIw1MLEU4j66Ow3e8aLXNgz0pIK921oRP6bVCm4Cr8W
 IgI5gwX2v0vl9W80u8wyVXhPHzVg28rmAOBg4kO2TnEufXLcUzoOGCzIFvEcCxS3S2LO
 pipJWLgeI6bb0fpkcAz+QD2yIW2pAhDtdzuINDCJNmPJxUoG/na/hJVQwQ0rUPNPtOri
 Jq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715597113; x=1716201913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+KuzpIxahVwlaIoyyL8S0U8FbokXWKxsp3dQ7RLKms=;
 b=XOduABjxDde1bkRoaJ9aERQW8Suv1r81s4RwLDCx7X5o5WBDKaYeCpKdZ1AWVuD/tl
 m9gQfQK9UqdcztlTZoStvkaO4b115gx0jOoDXBeKCgruEx0wkTUGGsl6G3FnD6a3Hn+X
 a1d31qpLTIYTvHHLnl/RMynNvdBcqIVSIYgBQohRpV+zSE+lYHQCB0VLOZum88786pox
 sEvAXTsW7+pBCWhi/EwUmIIC9lp+ByeoZVzOlU6FhtXPDAp063g6sSCCfMV571isqv9H
 8HSId0Ki5y4g+A6NiYclhjsEjytyX/UisF+ofl69kD/+Dx6lJOyslyyJBXa4Cfpfdjal
 wiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg0SG2O2YWdi63mZw6nzDeqW0gHeq4dlR55DSulPLVr3SSDeHBjPyQZRCVLkhp6cEodcqTrHWhVKUp9CARq88TAi7HzS9FKWPpjpVnDl/k
X-Gm-Message-State: AOJu0YwjVAqojTNsUfSqplK/rIFWG9cZGeuYE6R8cq5CQHR5uIMI4b7q
 mPZJQygY/D28XK30KTFBZnBhJfD0g0Fl4fN3nGqN0O7kVz2Y0jBBiuQRFYT4sNE=
X-Google-Smtp-Source: AGHT+IHYzurzse+025FuQzHFnKR2Ym+mZDdOoKJWRqbpkTgrS/CO9sLKKkY7CAIIMjniPZbpJafr6Q==
X-Received: by 2002:a2e:701:0:b0:2e5:87c1:e845 with SMTP id
 38308e7fff4ca-2e587c1f13amr27532451fa.48.1715597112614; 
 Mon, 13 May 2024 03:45:12 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420113d808bsm66166215e9.12.2024.05.13.03.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 03:45:12 -0700 (PDT)
Message-ID: <66cde8ee-b174-4061-bcfd-a6b6811af6ef@ursulin.net>
Date: Mon, 13 May 2024 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] accel/ivpu: Share NPU busy time in sysfs
Content-Language: en-GB
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
 <aad0fac7-279a-0b40-569e-73acf8b77db2@quicinc.com>
 <dbd2e32c-a75e-4d8a-9653-6f23cc494924@linux.intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <dbd2e32c-a75e-4d8a-9653-6f23cc494924@linux.intel.com>
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


On 13/05/2024 11:22, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 10.05.2024 18:55, Jeffrey Hugo wrote:
>> On 5/8/2024 7:29 AM, Jacek Lawrynowicz wrote:
>>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>>
>>> The driver tracks the time spent by NPU executing jobs
>>> and shares it through sysfs `npu_busy_time_us` file.
>>> It can be then used by user space applications to monitor device
>>> utilization.
>>>
>>> NPU is considered 'busy' starting with a first job submitted
>>> to firmware and ending when there is no more jobs pending/executing.
>>>
>>> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> This feels like something that would normally be handled by perf. Why not use that mechanism?
> 
> Yeah, probably but we had several request to provide easy to use interface for this metric that
> could be integrated in various user space apps/tools that do not use ftrace.

Probably more Perf/PMU aka performance counters? Which would be 
scriptable via $kernel/tools/perf or directly via perf_event_open(2) and 
read(2).

Note it is not easy to get right and in the i915 implementation (see 
i915_pmu.c) we have a known issue with PCI hot unplug and use after free 
which needs input from perf core folks.

Regards,

Tvrtko
