Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FF98565E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 11:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9A210E2DD;
	Wed, 25 Sep 2024 09:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T2Wn1nK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3C10E2DD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727256658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5LwA+sUnv3xEzt/QHFb4V074yiYq+4+ShIQRxPd2A8=;
 b=T2Wn1nK/LzQkWEvGXHoFlD230fD26caY/Hy5B4Wbcr6BwdkxfyD3eLcug4lHY9j1MgmFTV
 WsXj9Uifwtu2j0orneBhw4JhPJ0lAE4I9OJRvR1Cq+yJT7dVt+/J0RTj0nPsOlBdx0XCDY
 4l627jg/swYcU+uEvi3vaHDDSSd3eoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-HUgMYswEPWqyI_zziXjQBQ-1; Wed, 25 Sep 2024 05:30:57 -0400
X-MC-Unique: HUgMYswEPWqyI_zziXjQBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb6ed7f9dso60101485e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727256655; x=1727861455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U5LwA+sUnv3xEzt/QHFb4V074yiYq+4+ShIQRxPd2A8=;
 b=O6HjfEOKPlOSZ8rRH5FXu3xCCI5VDmHDRzHfCduwGPmRmNUiTc3+zXdMb/0AmaNfS1
 XuPkBY/Hrr8rgoddlEfhkq19+8zXNroL04YdpHjplqTQoA3UKWCaB1AB2weErP32d8lV
 4Btb8ENC0FgoGK5O5k5g/HT+4Rxsy58lMajfzLPDyVpER0XQ+PnPsP6MVFvVrS+qyl44
 eqWFXfezbQXNS4/GuY4Regtbo9qHro80RNLlEcjBZ138v0ya1hDcrtmy+JRcRxOLbRqS
 vxBNXUNq1wk+vIPeAZ4HAiZndnfUnZUgNFeTw4e0RV5tBLnq3F1wq7bI6rmTsQjySdsd
 on4g==
X-Gm-Message-State: AOJu0Yzaf/eMzBXtlklKRadFGtZjFcXBSCD6toKUHBvfOsnJTrL4m5gk
 nbRfk/rjT8ZxMNfLNKe3y0SlVC6Lt1/uewy7IxRfftDWRBrke1ItEQKiQf7kL80WCK8VtnNuu/8
 cHKRqi2rxmpi96yiJL44B5WQbC46BnPyGIrU/PjVczGuaF4wJRQM4KP9wHhhYxwSMSyDeSheUjd
 mFpnCA+I7RoCJACtpEv0cA1N/Gx0FTEebGTiW5Jv33lkeVCzc2sg==
X-Received: by 2002:a05:600c:548c:b0:42c:b187:bdd5 with SMTP id
 5b1f17b1804b1-42e961414ffmr16862585e9.22.1727256655413; 
 Wed, 25 Sep 2024 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyJbKwUUfuNfa0eiMjC2S7DkrNl/yXWbKL0hnA5JdXkMsNEsA3obQXsBijA8LWfTsrqLQreQ==
X-Received: by 2002:a05:600c:548c:b0:42c:b187:bdd5 with SMTP id
 5b1f17b1804b1-42e961414ffmr16862295e9.22.1727256654887; 
 Wed, 25 Sep 2024 02:30:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cca11c20asm456631f8f.41.2024.09.25.02.30.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:30:54 -0700 (PDT)
Message-ID: <8db3f79c-a90d-4db4-82ef-9dab15e1e30b@redhat.com>
Date: Wed, 25 Sep 2024 11:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
To: dri-devel@lists.freedesktop.org
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
 <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
 <16352ae0-7e61-440d-8c04-7ec912f9bf9a@redhat.com>
 <CADnq5_O7njHcvu0ejvVPPKF7szsbEQ8oFfHr9GTyD+zAe2EJ8g@mail.gmail.com>
 <00d08df9-346c-4710-8c08-615ba78b1bfc@mailbox.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <00d08df9-346c-4710-8c08-615ba78b1bfc@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 25/09/2024 09:55, Michel Dänzer wrote:
> On 2024-09-24 16:02, Alex Deucher wrote:
>> On Fri, Sep 20, 2024 at 11:36 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> On 17/09/2024 15:21, Alex Deucher wrote:
>>>> On Mon, Aug 12, 2024 at 2:10 AM Lu Yao <yaolu@kylinos.cn> wrote:
>>>>>
>>>>> Add support for the drm_panic module, which displays a pretty user
>>>>> friendly message on the screen when a Linux kernel panic occurs.
>>>>>
>>>>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>>>>
>>>> Patch looks good to me.  Any chance you want to convert the other
>>>> non-DC dce files (dce_v8_0.c, dce_v10_0.c, dce_v11_0.c) while you are
>>>> at it?
>>>
>>> I've made a similar patch in amdgpu_dm_plane.c, and it works on a Radeon
>>> pro w6400.
>>> But it only works when I'm in a VT terminal (so the framebuffer is
>>> linear and CPU accessible).
>>> When under Gnome/Wayland, the flag AMDGPU_GEM_CREATE_NO_CPU_ACCESS is
>>> set, so that means I can't vmap it ?
>>
>> It just means that the application does not need CPU access.  Whether
>> or not the CPU can access the buffer or not depends on the size of the
>> PCI BAR.  E.g., if the driver or bios has resized the PCI BAR, then
>> the CPU can access the entire BAR, but if not you are generally
>> limited to the first 256M of framebuffer.
> 
> FWIW, it's also possible to access all of VRAM via MMIO indirect registers. That'll be slower than a direct CPU map, it might be acceptable for drm_panic though, at least as a fallback.
> 
> 
Thanks, I will try that too. For panic, we only need to write the 
framebuffer once, so performances doesn't really matter.

I will try to use amdgpu_device_mm_access() for that.

-- 

Jocelyn

