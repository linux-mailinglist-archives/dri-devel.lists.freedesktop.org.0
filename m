Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CA65CB42
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 02:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D9810E41F;
	Wed,  4 Jan 2023 01:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F8910E41F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 01:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SPSXQVSfWqE2xWDKvHukoTKDPe5mvbGfaDj5kVQPphU=; b=m4pHT7jGxFh4BZz0e1OEyICjrQ
 UjAfQyP6SfEYCpxXcky8vQgHmRCh3/LyvIYW8EvEHcOGuMLGAR2YUWG6Sps19lsY9c1O39S5K9urW
 L9zPmAPBQNSHA43IO50DcVjfDQh+oKt7dtILxUWV91UB+/a8rt/RW+l220gpKA9IL798TXCTRh1bg
 +e1GQoU9Sb2fToDQYHRZ0j3QIFmeycnKzDATYg/Aru2sIl4Y3NUuIRufWES9avy/FlGksXOpaKbkm
 nI3L8EOsVygqJChYlgus1/+/0I+NNWBBp2pJDe6d6+oeHm9MtQS+h4RpRAqOSA5ip4ItLKo/nT0JG
 /4xcfQrw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pCsJl-00GcZ9-LV; Wed, 04 Jan 2023 02:11:45 +0100
Message-ID: <8d5deb15-e412-180f-585d-f57d193ae658@igalia.com>
Date: Tue, 3 Jan 2023 22:11:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: Rob Clark <robdclark@gmail.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <CAF6AEGt5g6+z3=LmTuP27pvbKYrL0YdLpDJCQmV=VHE6FeJ+Kg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/3/23 19:46, Rob Clark wrote:
> drive-by thought/concern, what are the odds that there is some wayland
> compositor out there that creates an fb for every window surface, even
> if it later decides to composite on the GPU because the display does
> not support the format?  It seems like there is a non-zero chance of
> breaking userspace..
>

As Simon pointed out, drivers like i915 and AMDGPU already reject IOCTLs
with invalid parameters, as you can see on [1] and [2], so this patch
would make the behavior more consistent between the drivers. That said,
I don't believe that this patch would break userspace, as userspace
already needs to handle with the existing drivers.

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/i915/display/intel_fb.c#n1917
[2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c#n1124

Best Regards,
- Maíra Canal
  
> BR,
> -R
> 

