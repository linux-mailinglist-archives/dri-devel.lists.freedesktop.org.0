Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885E93E521
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 14:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9EB10E164;
	Sun, 28 Jul 2024 12:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EkDaSWlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373A510E164
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 12:47:48 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a2a90243c9so3614579a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 05:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722170866; x=1722775666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7rTe6IbeoM1Sj9LYDiw9wEqY7/bJWvFvBhTNPVxZYKw=;
 b=EkDaSWlzBvfYMiUwt3W+5n//bPLpkq7HjbCKubwJ/O8wfRC3WQakIu3/dpGOsTg54b
 Q3H+hTymsks+kcEuNwcYlT2rHuYv2dpDv7GOaUgIjNnCMJ/1TO03TJXtrmknCA+B4cK3
 JUtkpYo6+BmsYZJPen+f1nXqon3792ksWmh/XsGa/bgGCS6w2CU4ENPID9pgrEY8tuxk
 7kI8HfpBgRvxLnnmXwLFCXSwraDFjuOcEiQhRMt2UKWw6X9lJ+KxlQTS5TycxeAaH4Tu
 m4lZrnIMnUBwocqmBBxT3hH5k7ENQvo598rSTMGHKmBvJl1U51RkoGYHCCM1BDCin87i
 Z7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722170866; x=1722775666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rTe6IbeoM1Sj9LYDiw9wEqY7/bJWvFvBhTNPVxZYKw=;
 b=Fa9eX/IXR/KvDVKpRxn5STPoTrVpFtrz4A9APxy/JjltnLH201iWuwBY7AjZkdJfoO
 YnH5XqQqMXbwzbP5W2vmITdqiI/uVq9DDg4KBdB4muCEnqr3bRavOatBjSLymLCuPMf8
 t4gNJTkmIgdGUpB/y7UekqT+hg2ZfvGqyvTSgxJDksMTbkVyRkEk2vicvW05Gtg8i5gX
 Dit3CXvi3ESUSXN4g/1tS1bJ2GUHzyxC949yHkkIzrOymXNnIvxs/qfAyiAyZ3VBTiiD
 RJ1w63cf4JLRDpwCmxA26Z7A01Fg0xcycRpC950IxUAR1s40wYxEFxF59bqL5xlJlHEQ
 dzEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVR/FXjSel2V45CIGse1sZfg/+HwAPUWwm3jq1v9wCCSmCFh3W6Hlk0gIRk4k4alv7HHq9E2yvzv5vVk9Mtl/ZHB5YPaS3mJbvavWBa8HB
X-Gm-Message-State: AOJu0YzpUq1K1aSdcq4THBEpjcWI17ut6CPLP/iiNXlbysb7pUtubuHG
 grGUH4Q9kQeqXACEnzMUmiMamxMz0T6bD/AFALuhxAApJZhE1h4u
X-Google-Smtp-Source: AGHT+IFUjiSzp8/lFhIVP7/rcKcmnBPnJsRtdp8cT700sScn7ZMzY8JZZVX4IE2+b4NoGEpyaWtKeA==
X-Received: by 2002:a17:907:7244:b0:a7a:b839:8583 with SMTP id
 a640c23a62f3a-a7d4013de15mr362438666b.66.1722170866492; 
 Sun, 28 Jul 2024 05:47:46 -0700 (PDT)
Received: from Slimbook.lan (134-248-201-31.ftth.glasoperator.nl.
 [31.201.248.134]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9d3cbsm381125166b.182.2024.07.28.05.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 05:47:46 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	hdegoede@redhat.com
Cc: mripard@kernel.org, luke@ljones.dev, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
Subject: [PATCH RESEND 0/2] drm: panel-orientation-quirks: Add quirks for AYN
 loki zero/max
Date: Sun, 28 Jul 2024 14:47:29 +0200
Message-ID: <20240728124731.168452-1-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Add orientation quirks for AYN loki devices:
- Ayn Loki Zero
- Ayn Loki Max

The quirks have been tested by the JELOS team and ChimeraOS
who have been patching their own kernel. This has been
confirmed working by users in the ChimeraOS discord
servers.

Since there are additional Ayn Loki devices I have
made separate matches for the devices.

Bouke Sybren Haarsma (2):
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
  drm: panel-orientation-quirks: Add quirk for Ayn Loki Max

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)


base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
-- 
2.45.2

