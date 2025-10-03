Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C8BB7286
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC94010E930;
	Fri,  3 Oct 2025 14:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DN5l/irQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D78310E0D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:19:20 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3352018e050so1901082a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759483160; x=1760087960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AIBqP6X1xglTFsBX0c4o1XVrrIxw8qDeWC1k8/vRDWY=;
 b=DN5l/irQb3Z4Ao3wCVbmbCA9ZDTPdSbd8rB+2bVZqRhQ/XXBy+indrGwqUeu2oxGB5
 QJKQWE1/zj0le4Qu+2OVkn8F5MV1pXsjB1OyxJevAKdFDyBal5Au7LATZS5eTgY5bpUV
 jjqHEzyKGsrMWONnKjcrHXWN5bLcxxtldCrN8SuuXg1fchi1U/wq08QhEy2kGcqjRnyy
 Y1qD6qVPv6zWQLqK3dJJsyDAqdhdivTJuyKPZ1u5zyXblUoJ5ETA0ZPL/Zy8qnkbSkit
 4DJpocuXAC+rLVPmkqFJQGDc7ZkK7eIM/I+69cCjSdghqssE2NubxBc24E3/32uJ707/
 NbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759483160; x=1760087960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AIBqP6X1xglTFsBX0c4o1XVrrIxw8qDeWC1k8/vRDWY=;
 b=WSvCou4smnNmJzeBM/SFBARENJeJ7UTT0dryOYVHVvBv8NLqC3UQj/cv2Z9+5mpbm3
 SWYcmyvVvBPK6Z5d4hhK2vC28DL/XrzHhwXPajNtZui96wiwPLMfxxUukyktVpaudrkM
 Vbsw46K8QKb2ezUT+xDICndChU4VQ/0YnD3DFl4UEi5hOTdlMWq/0uOgN/OC1Tr5hTsd
 Lob1E8mjSlrqVIFO/yTgXp9jo2oJRV1Pk0eTrYUb/72pElpPuJxATVu7h/2YUTP1g16Q
 iRT+xmqxOmKkDHFS+O7gcVEQT7L+JTjnFt3rDfnVnGn+fDdQTEcG5dP3hykY7IlcgaiR
 YDfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgS4PUqTqpK4PxLKYYuZOsxMVNdGXu+YfZG4Ex0CMWyE/WuCRbSdSbCnS8tkHjVoOFTLQ5aAR2DBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLRdYb1Yhn79tfGmydWgWomLP3aHaHwgrrldY03ps4moMWZ4Hp
 1VyxOIUVw3iDLSugl2YPsTPREHGziTJBIDKl/MFMTiRj6c96awbO9gej
X-Gm-Gg: ASbGncsMUMzlp91o2iF7lgor/vGZjIP8Y5/UNnhhh9/WaRy9hyvDJJDvO/g4m9rqgb9
 onXy949JqB7+GQ1pa+rhl2F4Ap1CC1kzGUBsF2R2wCZl+yzAn3d5JlgNDP0JpBEMMAvpdv+TqGN
 ej9M6FBHvn/BHgAlpfTd8yvKLvAFfRUBQJA+ureW7OqpK47yvcqk82ZMRjWY7M3BrrqYFl7U4Th
 0OifipvQio6omvb0J+lpIO0FP8s7RmCtQiL3iDeUD5RIuT+bvakl2CJInLaPmserhu3HlJygrvw
 4jZNEiBQAiZh4Siw5bM6Xby6xs1MjBKbfwAP+3LHd8iHLdoR+GiaKt+8vJEFiLktoQfgunhTyyN
 Id9dAvEH4CQ1UYkt/Kn2b7OIZvcCPOLubONCc+KUpVKtVvHs8/scAn6ykj7M0MeqAd+PbXU/hS1
 xFgf7+vzQ=
X-Google-Smtp-Source: AGHT+IHtCdR9ObWT7xWuCfZv7ZujUkZQPdWsZ04gKurgyaQnPlwUI4E2VfFo3orsXRVGmSM+5twmsg==
X-Received: by 2002:a17:90b:4b49:b0:336:b604:78be with SMTP id
 98e67ed59e1d1-339c2784862mr2680566a91.25.1759483159749; 
 Fri, 03 Oct 2025 02:19:19 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3399bc02e5bsm4164019a91.0.2025.10.03.02.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 02:19:19 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org
Cc: rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 tessolveupstream@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: ti-sn65dsi83: Fix LVDS output configuration
Date: Fri,  3 Oct 2025 14:49:10 +0530
Message-Id: <20251003091911.3269073-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 03 Oct 2025 14:16:42 +0000
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

Hi all,

This patch series fixes dual-link LVDS support in the SN65DSI83
DSI-to-LVDS bridge driver.

Currently the driver programs the same horizontal timing values for
both single-link and dual-link modes. According to TI, when operating
in dual-link mode the horizontal timing parameters must be divided by
two before being written to the device. Without this adjustment, panels
do not light up or show corrupted output.

TI has provided recommended register settings for dual-link operation.
I have hardcoded those into the driver as I am not driver expert,
With these changes applied, dual-link LVDS panels work reliably
on our hardware.

Summary:
- Adjust horizontal timing parameters by 2 in dual-link mode
- Apply TI dual-link register settings

Thanks,
Sudarshan
