Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14569AECE2E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4CA10E35D;
	Sun, 29 Jun 2025 14:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HeIoxax3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3E510E35D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751209009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
 b=HeIoxax3f+d5CiTMvbUc8qQ6xuafvkkJqaortcWrQYcapKuakG62tcKFak5s7g7V4zi/Uo
 W2e/vMBN8n7b6zEBAaXF0GxQb3I5PoQHHozR4thlKUWH1tmi/B+/mIHp0jF9mBiVwuTbB+
 lQ2K4rP75cbbdqCEIVWxwajnkLelUas=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-B0k7mQwtNYOi3uBaJVOJhA-1; Sun, 29 Jun 2025 10:56:47 -0400
X-MC-Unique: B0k7mQwtNYOi3uBaJVOJhA-1
X-Mimecast-MFC-AGG-ID: B0k7mQwtNYOi3uBaJVOJhA_1751209006
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-453817323afso20458195e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751209006; x=1751813806;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
 b=dLJnJAJn3LXZ78IhznXwtUtz73YBocST2U8uGyqDT5TH92aEYLIjLmyE1BjBSSOo3U
 vjh0yGpF94J/u+rYSqUT5KtmO1fdpqnW2L9kwsLuewGZDPciE2BjFwyD1QU5X/eVhMHF
 7GlcEp/Rg1dz2QyTDrE/KD6Nhb+jjGtJbHsCO+gSUTCqNm739QQiUZ+My76efB/nccKd
 TN4S4KzZa5S9gJZ25g0vyw6VXN+oCF8CQBqeRcPaNGAI0Uu9pe1jODxQrupqCSQZcjnF
 6CnadCD/8BQYvYwmlgYS7JRqcMqcCLF26VmqtMIwEl6DZTcQAdnOM8ebr9HIgVkOYqhn
 /JEg==
X-Gm-Message-State: AOJu0Yz8RQM8ecHFGn1cJem9ecc+6UkTPKmHxSkRaQQWGpTtEaPS51ei
 kR+wvDBmsSIKbuZYybb6xbom9A914rYz6ggrKPpSUI0ynmMbYMsw1LxLsrKqcJrmabE35iGj0Ud
 vbiT4SrWgfv54dSvcBd87n9sIB3RE0CiYclc+6XPjzWCdaH/XRUBYiNXeTnio06ndHGZYUg==
X-Gm-Gg: ASbGncu1fgcepXF/msjHjO0nKbKQqsJlbLGqKlTn8GX3lml+qxTn5gfCYyGif3EDaxe
 d+4CKLtV4uogboXgwbDzzv2WS+98EwVhPRapKDlE5VylEoW94YbSonN7axHtgstKVAESe7dxAld
 DCcQ43bD9T5l2V7XkDEZvVrNfgAwOWmpYGZHq0ucSC1rQRXbuK4DURiRZm2QjYYJ9kba9BUxhX2
 DETaOX/at+RPFgS8ywdw5C8Txm2CnPy2kTrjInsin8W+mQfzEcjVwmVED5/oH4FUfu4ZG4Ei3Jw
 CTVmyfCvC3yF0aT58Nd3jg16U0wLzfewcumaBdj9/CpV4zQLvKMm8ADWd9rkhg==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-45390bfd05fmr100454005e9.15.1751209005846; 
 Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzwxSKog3DMgujlctJnFDZzoxRMzCEAFRJd/Z3o45oYA0FJvn/qBy7zWWf7etH266Pm4C3Zw==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-45390bfd05fmr100453805e9.15.1751209005387; 
 Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b?
 ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a6716sm107501365e9.11.2025.06.29.07.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:56:44 -0700 (PDT)
Message-ID: <da066412-9514-4475-9602-0317efa458e3@redhat.com>
Date: Sun, 29 Jun 2025 16:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
 <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
 <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zqv-ewuIw1RSXFJ44KO9uT7Vp87HHC3oAaA-EPZeJh4_1751209006
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 6/27/25 3:04 PM, Rob Clark wrote:
> On Fri, Jun 20, 2025 at 8:45 AM Rob Clark <robin.clark@oss.qualcomm.com> wrote:
>>
>> For UNMAP/REMAP steps we could be needing to lock objects that are not
>> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
>> VAs.  These helpers handle locking/preparing the needed objects.
>>
>> Note that these functions do not strictly require the VM changes to be
>> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
>> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
>> call result in a differing sequence of steps when the VM changes are
>> actually applied, it will be the same set of GEM objects involved, so
>> the locking is still correct.
>>
>> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
>> v3: Expand comments to show expected usage, and explain how the usage
>>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Danilo, did you have any remaining comments on this?

I replied to this in your MSM VM_BIND series.

