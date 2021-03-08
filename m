Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D6A330A41
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C196E842;
	Mon,  8 Mar 2021 09:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223386E842;
 Mon,  8 Mar 2021 09:26:23 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id s16so4563727plr.9;
 Mon, 08 Mar 2021 01:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Mw3YhMxze+L33OOW35Ho/s9cEaxtf/agG+UY/pcXArs=;
 b=hvV1hCXVhbql3sIE2x5KITH12j1TCohVZgr541DF/zxzZs2XPgdAnRxc1thDIHgSZe
 qceBGfqVr+ZsnSdEZ86dXUHxCuQDbEkO48qvc0su5Gbh/clbE+H7nacjp1B/9A2WoYxI
 kw4c7sMRYnTG6M+NmT8Ede+uMewZm+3JWNrX3RbQBVNhDMCGX2Cg5M0bZH4jUuDHIidw
 6Vm8xT/Rz966POOGXHJtVx0LPi1o+9ARnIL0PvPvzNy/LSy8qfZgW8jnpdte51XWxBwj
 VUv5NxzXNBeC6lVx6N0mAnKIO9/Vui7BTPJVVuJ3o8j7KCpD7R/k+LNfdEEY6rgRuGGr
 vgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Mw3YhMxze+L33OOW35Ho/s9cEaxtf/agG+UY/pcXArs=;
 b=F0AAeDPlxegxGF2tdo+IB8JDCW4tbWxH1yV/FlPEb3ho5WcSmBuH19p0NqePMR2gJ6
 Dbjq6kodnn+TtluOq5o+86w0ACPnZ6u4H/N5uQ0xqZNL2l8xwkuIhJAEx8XDrZNv9WKK
 mti4nhNNvwgGGyyQ4o1QbYeorhQ9K8J/S6WtjhxMjCbCUiwwqNraMkV48EogdrU0IMzq
 C3NYqIy4uQJCVAsiHxmuULrZa3mlKJNen0yyrM6wwUuMta7aiv0QKsA2WfvbEXEfXjCB
 yAbTb6KioJOfRwQW/o8BCoSI9Jf4pMxoj/YVafE5KXGheb2vB8pKN56cmLBRXXIJZ71E
 xBKA==
X-Gm-Message-State: AOAM530C8nDOH0QqUeIGAQy06/FnQkY4QaOEGJXXDBqDSSIAHaGkPu91
 DJyDZtSqe/SN+/tLowD0+e0=
X-Google-Smtp-Source: ABdhPJxlPBadOVC2V3yLEF0pVBVAi7/notfNs+wqE4D5BV1pj3tj1U1TpfdDJMHmyTZN9iHH8zrjVg==
X-Received: by 2002:a17:90a:8408:: with SMTP id
 j8mr22411294pjn.1.1615195582670; 
 Mon, 08 Mar 2021 01:26:22 -0800 (PST)
Received: from [10.187.0.14] ([45.135.186.66])
 by smtp.gmail.com with ESMTPSA id k13sm10095045pfg.3.2021.03.08.01.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 01:26:22 -0800 (PST)
Subject: Re: [PATCH] gpu: drm: i915: fix error return code of
 igt_buddy_alloc_smoke()
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, lkml@SDF.ORG, matthew.auld@intel.com,
 rodrigo.vivi@intel.com
References: <20210308085952.8153-1-baijiaju1990@gmail.com>
 <161519509650.8241.14778072091965189208@build.alporthouse.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <d01ccf05-abbf-7f65-396d-31735d9b31f1@gmail.com>
Date: Mon, 8 Mar 2021 17:26:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <161519509650.8241.14778072091965189208@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021/3/8 17:18, Chris Wilson wrote:
> Quoting Jia-Ju Bai (2021-03-08 08:59:52)
>> When i915_random_order() returns NULL to order, no error return code of
>> igt_buddy_alloc_smoke() is assigned.
>> To fix this bug, err is assigned with -EINVAL in this case.
> It would not be EINVAL since that is used for a reference failure, but
> in this case the idea was to return 0 as no testing was done and the
> ENOMEM was raised before testing began i.e. not an internal and
> unexpected driver allocation failure.
> -Chris

Okay, thanks for your reply :)


Best wishes,
Jia-Ju Bai
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
