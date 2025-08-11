Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334AB21787
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA510E31A;
	Mon, 11 Aug 2025 21:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0ge01JLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7EC10E54E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 21:39:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-70740598a9dso44665946d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1754948339;
 x=1755553139; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=0ge01JLYe81ur3eC5I/G4HFR04uRna9QNtP1D81os+e/igQVgR1KTPPbTzJUEQARb/
 0EjjZRkwfbdthtOFa5YnuAUI5s32gIwFCUSvYozG/7jqRLLQz+VRO63AwBhTd0nVA0A8
 3ZaAF/DvsYN7ay7AozRxrF4v7KOUaDChKajFA8dZhM2x1KDRvF7lUxZwDN0joJFa115T
 LzZga8KOkd7MgCcFqydqe/ErmzLKx9P5Cna0oztln41or6kFHEL/V8uaNjpvvd8IVair
 x5XoZn7s6/ClYbAuDIcuvrwqbDIePT0DjF3XKm7BKvljTH6fhKnyj6veWdnXNdZzs/i0
 pAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754948339; x=1755553139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=kRAadBQHKi7c/xkfHRt+jxjLYcQt5z2iW4fPJc78HWlcx1ovLl/u/Gynn943Hb8ecX
 od5mCjhqxXGtAgxpcVUDPqXWtQQjFntrMPjQhqn+JPmsNHtrGLEOcCk+a/Z/dwhtNM/r
 PwrliK+4Zv9Ah9eesuxZ6LfQrmWwvGkUbd9UPEE2E7v1mrmZxQmzSdkga57uF/pJdcaj
 soIDKXeMWAVoMrlV2wPGYaDF37jhMgXW2Acea/xG5qZXKNDezCqDLnVd4zpZd0RyBBQx
 qCL3NjLedlY/5h+yi6ud/9SxcZR7D++cnXdwx3S6B6DIJj0T9J5WAcizpfcrSmmV2G8O
 j5eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqcrvfh675QDe7LmmH90JKmDag7FF175feD4JuvXt8SAlR7AA+qoeRYAY0EKy+I3IXGm2/G1HLlCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6M+zMkg+f+e7HkFaJIurC7qFwOgqTq2thRefVLFerFA8xWcF4
 aSTw7ERrlcObt3zWKPNaTMiKRMGRE0HYT/5TW2st/HinxFfGRTm1RuElKDp5xT40FEA=
X-Gm-Gg: ASbGncsjG7fmacspHVhf4E27vjJs4Mmy+QA+PgFDTQi64mehGQi7s+t6cM3Tx2puuMF
 Cd+r+CE6a93u4O1WaIPulQTyYwekwTcySet4QAQSLXiQhpN8kxhdTe8YQUMQFLPPBtEtPKOXeD0
 aXnZGHppwO9Gxd/smzFUrTa8qoAYdfYiGWXG4kEEGSIy/HPYqFK6ynaMgltfWXVZ/rdL1GCczAP
 Zer+nySi3e8l3u5CnK6d7qJ9hdK2Us8TkVm6FxhD+4KJ7uSDoUu+1Bu/n/ZscwDmzQUwoZyqFEJ
 kHT6rKFwRLQs0/b5YIgLEno/cMxlijRBi8AczK3X4yhj5VQ1g679cbwh0O1uo8YBE+nSwjoyWPh
 XPKbFsjKZMOUiXdtrzQUoIZ8/81aYGHqPUxWAteYGF4zxQq9iuYCbazpiD7sLjbgXfxslxhGFGg
 BR958R7i8rI6Qdffc=
X-Google-Smtp-Source: AGHT+IFx3WwAo4wc6OCIN5rnA0B2oh9bKzz63paRZX4SRApohfirp7X3wj4EXnZDsoVIIcqhXp8FtQ==
X-Received: by 2002:a05:6214:224e:b0:707:4023:6b8f with SMTP id
 6a1803df08f44-7099a33243cmr193134136d6.28.1754948339172; 
 Mon, 11 Aug 2025 14:38:59 -0700 (PDT)
Received: from m-kiwi.verizon.net
 (pool-108-18-253-193.washdc.fios.verizon.net. [108.18.253.193])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca1d5ecsm163097136d6.26.2025.08.11.14.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 14:38:58 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 RESEND 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT
 config
Date: Mon, 11 Aug 2025 17:32:30 -0400
Message-ID: <20250811213843.4294-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

The first two patches are the same as they were in V1. V2 adds a third
commit that improves an error message in response to feedback from V1.

Mel Henning (3):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable
  drm/nouveau: Improve message for missing firmware

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c  | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 8 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.50.1

