Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798291BC33
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAC210E1F0;
	Fri, 28 Jun 2024 10:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gGVE3Wy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0373810E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719569376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RtiMgBTAHAWuIm/KKZtZpd22RlatO8dryujS/hU52Y=;
 b=gGVE3Wy3K6zu9Vb+c3F/fKyG2+gh4yR2lqQZSy1+TwzGajp19hiJad5etEEe52fex13Pv7
 QPysBFDm+WeMAJWVEdB1uKJ9Qbv6d7xxlITbmV1UNOoxsAIE+PWCR/zbnd8F//pwx/ach8
 fpB5T6ZuEY0+1LRcVlvYF7EaVWHuh0I=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-z4jpTQazMG64FZtwzSfr3Q-1; Fri, 28 Jun 2024 06:09:34 -0400
X-MC-Unique: z4jpTQazMG64FZtwzSfr3Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52cda76173dso346929e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 03:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719569373; x=1720174173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+RtiMgBTAHAWuIm/KKZtZpd22RlatO8dryujS/hU52Y=;
 b=IXp2OMd8F07Jy7qCy1WVBwjYHlRxYXtYRUy1a/ASjIU2CfInGQrH+Ne+V3no+qP/GH
 bY9ytzfa7beGH0LWVunF2fhWY6X//2RiuqOtHkOABs1P0J6PWo/YY1YsDgCQ6MzHy/tL
 oFk/R0CVHZyWpD3noT+Q9G/K8TOLTnILL0qUfXZ2NL/PR6z9x5tEOqy0cGghoToz3mlD
 pHsGn2/MseOIplWgau5ftmTrt/Ve26w54IQARekFm12SU+T1UzddC8FyO4UadPetVn6m
 XrUSUly+O9i5AmhnKeDTIr2jMk5vukECluhdCFFde6u6aTtTzmXlp9ddj4Jcmb7e2RP/
 JwXg==
X-Gm-Message-State: AOJu0YxySquWPPAgaqphFyJ3bTgouRj38F1crG+zEDXrvoLltj7b4ov0
 rEpcYUkFWjZqPNnZBW94LFvcZJYcw382ddtvFFJPMNX9E2FaoqT241QOkZdc9vvT9dwz2BOJK9i
 evAKgiWgl0/FpH44EIb7Kp781rm1MLcdrHdxfuVFu7FVnNhti2KBp/ZwhShMyA0R/Cg==
X-Received: by 2002:a05:6512:3605:b0:52c:d8cf:d4f4 with SMTP id
 2adb3069b0e04-52ce18321cemr8643540e87.11.1719569373141; 
 Fri, 28 Jun 2024 03:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFNeDpfmJhi7rm70HhwBPuuwoEdP6rkpRNLON2dvXzQL4QEwthHI3QHuZfaXbVDZlPhapBUQ==
X-Received: by 2002:a05:6512:3605:b0:52c:d8cf:d4f4 with SMTP id
 2adb3069b0e04-52ce18321cemr8643524e87.11.1719569372739; 
 Fri, 28 Jun 2024 03:09:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e0661sm1774520f8f.47.2024.06.28.03.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 03:09:32 -0700 (PDT)
Message-ID: <c2431d20-187b-45ad-9829-4da33cbd23bb@redhat.com>
Date: Fri, 28 Jun 2024 12:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] drm/ast: Untangle the chaos in mode setting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 27/06/2024 17:27, Thomas Zimmermann wrote:
> The CRTC's mode-setting code contains quite a bit of code that
> belongs to the planes or various encoder chips. This patchset
> refactors these bits and moves things to the correct places.
> 
> With the patches applied, the remaining DPMS function will be
> gone and its content be moved. Several code duplications will
> be removed. There was also a bugfix wrt the VGA SCREEN_DISABLE
> bit, but it's unclear if the bug had any effect in practice.
> 
> Tested with AST2100 and AST2600 with VGA and DP outputs.

Thanks,

I've tested the patch series, on a remote ampere (aarch64) system with 
AST 2500, and it works. I wasn't able to test with a real monitor attached.

-- 

Jocelyn

> 
> Thomas Zimmermann (8):
>    drm/ast: Implement atomic enable/disable for encoders
>    drm/ast: Program mode for AST DP in atomic_mode_set
>    drm/ast: Move mode-setting code into mode_set_nofb CRTC helper
>    drm/ast: Handle primary-plane format setup in atomic_update
>    drm/ast: Remove gamma LUT updates from DPMS code
>    drm/ast: Only set VGA SCREEN_DISABLE bit in CRTC code
>    drm/ast: Inline ast_crtc_dpms() into callers
>    drm/ast: Use drm_atomic_helper_commit_tail() helper
> 
>   drivers/gpu/drm/ast/ast_mode.c | 204 ++++++++++++++++++---------------
>   drivers/gpu/drm/ast/ast_reg.h  |  10 +-
>   2 files changed, 112 insertions(+), 102 deletions(-)
> 

