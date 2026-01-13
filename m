Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011ED1B73A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72910E551;
	Tue, 13 Jan 2026 21:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKZt5Des";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5710E551
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:41:08 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-64c72418c6eso1061327a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768340467; x=1768945267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DhpWWz12kb7UClBCF/HJbq7vlz6MpTKNGbMO3aq4gGE=;
 b=EKZt5DesCtfz6Ie4vC5IIneb+h/3X9MQIk7GvfexJqQJqhf6ZMhNEQzdRdPXiXUWip
 lE8Q4NulxSNIsFEmJ7xF8dLsmv7Njbc1llhA2PwQ4zZKMq5BE+XhAb5GIittIRF9qW+f
 uJ8dWFJvbnhbsYXU/QSSNx1IOypcLX+wdHYkwHcWRSnmZRIWE/X4PMPqs8vYYka8m/yF
 YHwks5zBIVDB0gGT32ZdeRvmfe5iJstTaPlxLYTH74RZjKGTVYz29ODSe0HnKj6C+Z7w
 l3wyaJWspA+FMk8Ra0+iV7J41HuHofvsa2mP6k/12M1/IEcSyHpYRn6GIwGT2KNJ9tsh
 KV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768340467; x=1768945267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhpWWz12kb7UClBCF/HJbq7vlz6MpTKNGbMO3aq4gGE=;
 b=eYWlOsL4wphBz71sh6Jh07hs5efQCiGdsyNabrlEAVkX8+Uf116pyhADY4UmODHqlz
 1OcQcAbB8PLsTY0pixqhy1KG/CwEAnzUw7GVUoaA3AiLgXLeDwOPkHudXEN1xFbGUnOr
 UeXzuKHO4hp7OGPAVhN6aHWnXMvbrYymxLgmz2M6xx42YCk4IX3rOdofIJXOuMJRxqMz
 pFxNdeg5ReETQLyanxNUzdWJ5Wd14A1Af9Q2EturkhfUwMdLDVPMLaIfzt+M1wqR72gW
 qq+feyCNBiRjwWyD/9EoLt3X6VTjzpBNmFl4ecDRUkwa6d3Mb3lSEQZ93zr9SS33TH0G
 MkqA==
X-Gm-Message-State: AOJu0YxbsciLGM4cINi2/h1seY2JUdpI+Y8yPYiURh2zxKx5FoCq4k6e
 1090McUClhcmg/MuR5SC2TMFr/hCJzfcBt+Rb69kcMTgpFlguhqIPPW9
X-Gm-Gg: AY/fxX71PoJ9VJTN0KSefoSu6QcUphz5hSOO4IWqGYAs+jQeH3t1k/hM+gnqkT8488I
 vNAd1dgfbwvdlNfY5QeV+GNvQ5d/NSMFgwx1c3fXVJoIlzOMzVWhqfmqMEkHN1l5N5KZPtuzy22
 SMyoxMO9PhTzFbcyVyNtPlGMSwXzcFkaWrfcgO/IYsMXi2rBer0B/PtEpztdL2Mr3/xFn7lvzFO
 h/SQ/8+MKtfXuhnodlDuM1ioN8PuXF8xAVZ19QnBruPs3G3sJb1ivDhV4ft9WZCG2JFSNU+HhvT
 31SCpAMj/WlhJwaql2GfeyAedhFZtWZlzOjfJxJugyiHXy7QmM+nf5VEGbmTz3+bme6Lyb6IhCH
 2IGVu3j5Sd4fL1leTwAOvM+pIxTsm2NQE2ruhJ9f0HqWR+hI00PK8/5rlLShPe3stqQ49hQKItm
 h3BQBQzZsRSogLbisAHLnF3QxLIhg4dCTspfea8jcCzpnc9SO59OfW4gUrtWZO7zCQ
X-Received: by 2002:a05:6402:40ca:b0:64d:521e:161a with SMTP id
 4fb4d7f45d1cf-653ec466877mr183722a12.5.1768340466966; 
 Tue, 13 Jan 2026 13:41:06 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5e0sm20858052a12.31.2026.01.13.13.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:41:06 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] amdgpu: Enable Adaptive Sync over PCON with HDMI VRR
Date: Tue, 13 Jan 2026 22:41:01 +0100
Message-ID: <20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs which do
not support FreeSync, do not have working VRR with DP -> HDMI 2.1 adapters even
though adapters will take care of HDMI VRR info packets.

Since HDMI VRR relies on FRL modes, this will only be enabled for PCONs in the
VRR whitelist. HDMI VRR for native HDMI connector will still not be
possible/attempted.

I myself validated these changes with my Samsung S95B + Bernhard validated on
LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that only
has HDMI 2.0 to check that FreeSync still triggers properly for "older" hardware

For missing VRRmax or VRRmax == 0, the upper boundary is the currently selected
video mode refresh rate. I wasn't sure how best to implement it but 10000
works since the driver already limits VRR range to the currently selected
video mode and 10000 Hz should be good enough for years to come.

Changes in v2:
- More info parsed from HDMI Forum vsdb
- EDID parsing squashed into one commit
- Support for VRRmax == 0

Tomasz Pakuła (3):
  drm/edid: parse more info from HDMI Forum vsdb
  drm/amd/display: rename PCON adaptive sync types
  drm/amd/display: enable HDMI VRR over PCON

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 27 +++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 .../amd/display/modules/inc/mod_info_packet.h |  4 +-
 .../display/modules/info_packet/info_packet.c |  4 +-
 drivers/gpu/drm/drm_edid.c                    | 41 +++++++++++++++-
 include/drm/drm_connector.h                   | 47 +++++++++++++++++++
 6 files changed, 114 insertions(+), 11 deletions(-)

-- 
2.52.0

