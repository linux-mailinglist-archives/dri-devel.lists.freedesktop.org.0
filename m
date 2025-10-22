Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F6CBF9EA5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 06:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2122410E496;
	Wed, 22 Oct 2025 04:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PGCi073F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B58910E496
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:13:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57a960fe78fso8191605e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 21:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761106386; x=1761711186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HTarvr5NQrK1UQUHCo4kav4SXNLG6y74vPoWa3KRT+Q=;
 b=PGCi073F10KQkXcS5OfBXAijqviY0QpTEmjwbpaubuKUWnhbMSo7q0Q/H12zte5ttL
 EpwF8cj4vvjWAeJxRejnOdJ5qD4M7fHK234LKlHX6cK2rhs+kv8rkqfbT087/Myy5XX5
 y5g1DEhiF/0h0OPjeHRQnzSUSFmPfumsYyvUzpOrhtloHzZgJATc+W+u3UQboU9sGoGC
 upZdki9vV1GAKgiiWWxM+V8vUSqy/INA66QSqujf8KVwrRMp2ChjMGfhmn3aSSwGRIux
 +QrQ9BDMsBIpnJETNA4h9SbQDxoD9mXx3+wJ9mFSZYJXlK6m2RqCBtb/16gtLoojpxMC
 /Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761106386; x=1761711186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTarvr5NQrK1UQUHCo4kav4SXNLG6y74vPoWa3KRT+Q=;
 b=Sjb7iYYeMl2S9oMZzFUZPnviSo0pTjOtgIg6iT3SzlO1/YgleNf4ml3m9FvzBtds8F
 cBu+E21LuFXo2sbfvWQpWVKI9rvRsadZ1xPMz/mj2JyWDnPe0Im9ddrN0o91ppksc8YQ
 CdIyV7Lz7O54Ik2Tr3DeCiOhX6ZXD74qHhzfWd6cjWm8qUm4MBpfHketMD1zKgRuq5bq
 ZQnkNwmHOrllNZKahFLHDC41WebuZ+5yVSpBOCIx5xtYAbFpa/oZP0maqcZ/aKix6zDO
 lgry99pPapvbq2P/in1NuEt/2CQzfAGvVgWKT+iRsfjKVcyIn1PaR7/ZiRsIgWCbrmvX
 X5ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK40XltpERFl4eZebHuVSx0vLIQX7k5ON0xmAsCGNI8iCkrPcSamOX7Ofa/AnoFlB473HqdgPX1kU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMjLHL+jtjr0sD5iddA01VFBaqy9D4r48Hpws9VNw6v1mA/0VM
 8/amNGXa2zcvTfqqUYUa0f/KVdUYS0P6w0NcuwUuc1Sb9HmfznS+PGJ0
X-Gm-Gg: ASbGncvXX277+tyvek/mRxFkH+8dnia7mh3YxKqmgh1Mtu33Yl7PaQXt+cI6zhsKNQt
 2A+rmGqbvLotPsO69/tGZJ0cEJ5DLb36NeiMactb1VWnILBahX4idE+Jeytkg2oBxKqFqhT828l
 zJQiDP4tm8tjKBEe9NY29SIUr3/NjHyJ+Wnaa40Us2SIHFvmppI8kDTu5dbooP0QEHLASPJebu9
 ThqC1NIWVW7sxMIadZCpMNkuTygN5/UT6ko0QF1hN/R9ewjDzNsLxqHNqj59PTx4pGH5DX1lNUi
 Q/uir6k3yNtO2RHAJhpMOnRc5lg+9TRJuVCAS+TpDC9rXZeF6RBWtz0atmDs5aDXysMH83LZZZy
 jdsaWib8F3PGj8K+otQw+Z9e1rOOUUJthKYkDpepbsgFmxl5xoFSwhn+rZ2c021KjSM8V1+onsj
 rpuGQubsklmfU2NEF3lmEBAh65POg3bJXxqxWaZ35M0HhH7IyLVCJhWtNINT15bz7/6N+WlzHWW
 OpuVY8W
X-Google-Smtp-Source: AGHT+IHY7I4DBmj7a1FpDVM7msh9gcYm7KPVmZxtgTaCyBA4vmSmAHD2ToTDDsFBgGtcjxwcP6lO+w==
X-Received: by 2002:a05:6512:220f:b0:567:ef90:f519 with SMTP id
 2adb3069b0e04-591d850d08fmr6278217e87.12.1761106385519; 
 Tue, 21 Oct 2025 21:13:05 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deeaf6e2sm4252192e87.32.2025.10.21.21.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 21:13:05 -0700 (PDT)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH] drm/nouveau: handle division by zero and overflow in
 nouveau_bo_fixup_align()
Date: Wed, 22 Oct 2025 07:12:59 +0300
Message-ID: <20251022041302.13-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The expression 64 * nvbo->mode can evaluate to 0 when 
nvbo->mode = U32_MAX/64, which results in division by zero 
in the do_div() function. A value greater than U32_MAX/64 
causes a u32 overflow, and the division result may be 
incorrect. The nvbo->mode value depends on the data 
passed from the user via ioctl. Generally, the kernel 
should distrust userspace data (an attacker could operate 
from there, and there's no guarantee that mesa and similar 
software are bug-free) and validate it to avoid crashing.

Found by Linux Verification Center (linuxtesting.org) with svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7daa12eec01b..afe4e73b6190 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -168,7 +168,7 @@ nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int *align, u64 *size)
 	struct nvif_device *device = &drm->client.device;
 
 	if (device->info.family < NV_DEVICE_INFO_V0_TESLA) {
-		if (nvbo->mode) {
+		if (nvbo->mode && nvbo->mode < U32_MAX / 64) {
 			if (device->info.chipset >= 0x40) {
 				*align = 65536;
 				*size = roundup_64(*size, 64 * nvbo->mode);
-- 
2.43.0

