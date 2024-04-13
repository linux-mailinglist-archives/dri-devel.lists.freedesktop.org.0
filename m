Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE438A3BDA
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 11:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FBF10FB67;
	Sat, 13 Apr 2024 09:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="KCom0BRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C0E10F033
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Apr 2024 00:57:22 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3442f4e098bso1398003f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1712969840; x=1713574640; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wc6szgZjNNFyh/LwTAWMUZNCmALq+FNR/Ebns3AOlpc=;
 b=KCom0BRznf/K/525XXPoalGFHeT0vHU30I9I73YLVXSbH2ygWp5N5DVbGsSs+c1i9a
 7f/1wNQB9S/IKPExyiZpr1t+AuiQOrl69g5B5hnwKy1uq92CoCz13+g5j7l1c5lEM986
 rDFPbc0STYMzLsxr/QXoRAflQA7uDe5y/otv/g8O++kd9G9w2CzRSzc+7zb/DrZrRUEA
 FqTJTykQR01OBPXGvyz7aAlleySTKL20bM1bEViY7NxodENjw8x/Zkvoo44QKK4UJCMR
 0lBTGm9g6l1v9GLO0u5HUA5ilsomZhMO50xsSN/zaHDQXezeN3/hulzFBqOT4h8St5DH
 iMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712969840; x=1713574640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wc6szgZjNNFyh/LwTAWMUZNCmALq+FNR/Ebns3AOlpc=;
 b=C/zbBIYOL7UWdmPqTB+cUXQTMwby6HwVkaEBqvEUYsKxnfWcRhcB3moDDHEEnoCK+8
 qxNqrsa5Gh4tEn5OouL0gPn8xU2GwDmmxkiJbQPWNxOKhPMyZi3dqcGetTxbmwDg+nvy
 sUiVpUMdHlZ8Ev8A4QYoBEZl3PT1xUUWwPJysWJT10KlS5fVTio8Zrwv3ckBfO8nGc2V
 aX0idSBNkGJWeuR9RJaEqXRsNXMJ2hsN0HLvYZAWJ+0ygh7VSG2wMlVZ8bUdehbdW4MZ
 bvXBCm3L/gVAsFEMiyB/rhCybvBBRcjp3c1hC3XgJAYHO9YaDiDLq7Y2dUyvTZVR0mU+
 Vu/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5A2iiN7hzccNusybd6mPAhnBs/PBl57PWholEtbQcSfFd98XuOCxOjbuSmUg9OkhbjOIw2jneeslFrQFvKhRolqjsQlMoRE1mJuLY2e/x
X-Gm-Message-State: AOJu0YzBe/9vmQ5G639uKwekFtjsiHi9BAOtO6BuM5ZyRiCXI2OmPACy
 d38e0+vnpcrdpy0CsAXWM2o/7nGPtp/lqn1vSEXNsSzso1mH56qscdkVWXOmGCo=
X-Google-Smtp-Source: AGHT+IG5KyNZ5UA78drYL10vGyqyFOO3ZKeVjROMtVCq0nW7TCGzkkBZy2nnAMrb7RUrG6yqAasTfA==
X-Received: by 2002:adf:fc49:0:b0:345:6cec:4e02 with SMTP id
 e9-20020adffc49000000b003456cec4e02mr5032792wrs.12.1712969840341; 
 Fri, 12 Apr 2024 17:57:20 -0700 (PDT)
Received: from ?IPV6:2001:559:57b:111::ffff:d600?
 ([2001:559:57b:111::ffff:d600]) by smtp.gmail.com with ESMTPSA id
 z5-20020ae9c105000000b0078ed33d55f2sm837987qki.121.2024.04.12.17.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 17:57:19 -0700 (PDT)
Message-ID: <c55d8329-6d59-4821-89f2-6b50fa9dc6a7@suse.com>
Date: Fri, 12 Apr 2024 20:57:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference in
 drm_dp_add_payload_part2 (again)
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
References: <20240413002252.30780-1-jeffm@suse.com>
Content-Language: en-US
From: Jeff Mahoney <jeffm@suse.com>
In-Reply-To: <20240413002252.30780-1-jeffm@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Apr 2024 09:09:34 +0000
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

As a follow up, I read through the original thread before sending this 
and my understanding is that this message probably shouldn't be getting 
printed in the first place.  I've turned on KMS, ATOMIC, STATE, and DP 
debugging to see what shakes out.  I have a KVM on my desk that I use to 
switch between systems fairly frequently.  I'm speculating that the 
connecting and disconnecting is related, so I'm hopeful I can trigger it 
quickly.

-Jeff

On 4/12/24 20:22, Jeff Mahoney wrote:
> Commit 54d217406afe (drm: use mgr->dev in drm_dbg_kms in
> drm_dp_add_payload_part2) appears to have been accidentially reverted as
> part of commit 5aa1dfcdf0a42 (drm/mst: Refactor the flow for payload
> allocation/removement).
> 
> I've been seeing NULL pointer dereferences in drm_dp_add_payload_part2
> due to state->dev being NULL in the debug message printed if the payload
> allocation has failed.
> 
> This commit restores mgr->dev to avoid the Oops.
> 
> Fixes: 5aa1dfcdf0a42 ("drm/mst: Refactor the flow for payload allocation/removement")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
> ---
>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 03d528209426..3dc966f25c0c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3437,7 +3437,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>   
>   	/* Skip failed payloads */
>   	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>   			    payload->port->connector->name);
>   		return -EIO;
>   	}

-- 
Jeff Mahoney
VP Engineering, Linux Systems
