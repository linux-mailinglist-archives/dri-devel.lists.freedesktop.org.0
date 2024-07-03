Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D69261BD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 15:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AE010E036;
	Wed,  3 Jul 2024 13:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OqDN//yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3D10E013
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 13:26:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-424acf3226fso41701625e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720013165; x=1720617965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0rWeHO3BsGm6akvC+EgQ9xHnvFwapyoYVQZdRmU9M0=;
 b=OqDN//yEIuRroQ/1tBlTvi0XB5FE/Z6bYFEMzjb7HPd3TFC1bz3zOU1LmLAZX96DMs
 7DM2EOdcLRQGW0ln8ru/Avc/TnE2mGN8zpmH/12FSEIBOCtgOCwgoTfuRmBj0RWm114P
 VzIbhx/PL87sfi3EXHhFqt1drCzu93ZCdx5DFeYMA7SNasfm/Ru8vmK6hPVpwJvQI1wj
 0ybv0JVj1t/EuzPoSHEQTqEZg1k3iCMPDsDrW24nK4586Rxcp4Yt3ik3RnA1ffWN2mRy
 G35fEGldjezbKOpVUyCgGIu9lSP4LV3rCTQLgnsgoXBoCu3cF5P6azxpVsLXUDHyKPqa
 LRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720013165; x=1720617965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z0rWeHO3BsGm6akvC+EgQ9xHnvFwapyoYVQZdRmU9M0=;
 b=uIwTPkqiVVeEs4KJOrt0khy2VMtPaV64MIYN9nnv6iw2i/4FV1hHq5MModfCQK2EU4
 E+oP1DWQLEm9Ls6tNAhmluDcewhhYmjf5cjfbfHgEAlwB/fY010C34TE1pqs+KjYadhu
 jdvgiPKvMTJKr7tx3CFl7sWroxLAiOzzDXuJRqKLDQ53xnDXhj4vOOSP006l9w1biirZ
 /pOOGwgGqRIwqwy4iq8nJRIBLI9ECdsKOMBYf1EcaU6YT/CDuH42tYWpdlhNBaiwpOxI
 gWka9ZFfwSOMWMeiVkp+ySgFRrTS2qeSdCp3jC+4KaX8obGP5qo85TLW1SPg6F903yq+
 yvLg==
X-Gm-Message-State: AOJu0Yxmrtn74I4do9U7sdwjKUybI4UBGSkBfpojT00XqK9gmdvJngjs
 0ITD+QgZb1Mp7ierOy7/jqGqQY6n0jz44gN0zJkvlDb+U65OGIO5
X-Google-Smtp-Source: AGHT+IE4GzvMhD0N/7NOZNMJyAZrW9TYyNiHkxqC5KB8UGOXAPG6Z5Fw2HfxtHxF97MrpvDjVIIu8A==
X-Received: by 2002:a05:600c:474d:b0:425:670f:7d14 with SMTP id
 5b1f17b1804b1-4257a02f2f9mr79692185e9.20.1720013164516; 
 Wed, 03 Jul 2024 06:26:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1559:9300:5f5d:6303:9414:d3d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5ba51sm237197665e9.12.2024.07.03.06.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:26:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: Using drm_exec for TTMs BO eviction
Date: Wed,  3 Jul 2024 15:25:57 +0200
Message-Id: <20240703132602.4756-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi guys,

We recently ran into a problem with deadlocks during eviction and while back Thomas worked on a patch set which was going into the direction of solving this.

So I simplified it to just the functionality needed to resolve this issue at. The resulting patch set is just the initial first step of using drm_exec in TTM for locking BOs during eviction.

Should a deadlock happen the drm_exec object is now used to resolve it and prelock the contended object. This approach solves this the ENOMEM issue on contending evictions quite nicely.

Please review and comment,
Christian.


