Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B9C12CB5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 04:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17210E1C8;
	Tue, 28 Oct 2025 03:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D065HO0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C101E10E1C8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 03:44:24 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7a28226dd13so4209140b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761623064; x=1762227864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0JrnIhlm/tyRktTDJR6cB/aVJVLzjS3bo23HpgjFIA=;
 b=D065HO0CmP5FhtF2Kz9yiShtMRBqk04eaiuJmWijCLIPOGfBFOUFrz1hWF3x+/MZQY
 gahyEnuebL9S33rtg1N++9sh+KNTLzgVwwC3vLmRJ5cWkYQPLkwk4kpfhCT5KhYp/amn
 Vak+IWnCSRGek5c+DM3AzygDMoB9vW5UcfYcsRZ+Q2L9LgU+W2wXJ5fC6jeSUtO5LgYy
 ES6KQqBPYTXnjfYsB+ONIkLvLZKbcTK4hkqWOt/9pv8JzFQ/6+Mii3QAyKbjIK+SkR94
 W6o05lKRPVWP5hfMQgSpXeeqfjDVUYRmOpQjqipxP/N2xNbmq/EryPm9DtJTwMl1tMJY
 Y0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761623064; x=1762227864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0JrnIhlm/tyRktTDJR6cB/aVJVLzjS3bo23HpgjFIA=;
 b=CvsBue+i9WMZI8QxAqXDaBmqy8GFI99Ff/tGblOV3NblK7WgEutdUb2wCsc5Yse6rM
 sjVIF67vG64XoiymRoqzNPI5mN9XGT/dBty5ddeBaQBmk+t75Wxcy2FiAg0b6eZ80d8d
 8qA1u0hA8N6I1oGBFD75SXOSCvKhdyMpSEdIDh6W8l19l3H0ErSvwxYYmG1cSmZ4vnRd
 p7LvStwK5SK7OEMVUcVlOmPC+CTnC5QXNXAiNmaiIajJHDtlR85DL7xknlic0cVqSZMX
 LYp5qrgCP6vev7nDHGJagsJztQAuf3UW1yE/DPXppQCb9Rxlqaoq17ijoqtz4Mxyv4+f
 dO2A==
X-Gm-Message-State: AOJu0YxEgaDeqG4K8D0Fc/UjArF6fbgQoairYtk+b3bNX+XVq9Fwv3GM
 N3mDnCM0Hj/P7N4IRdPD01IsySgiRdzsl5SCNTeem2lkj+QXVRwrPBEX
X-Gm-Gg: ASbGncu7BMlGuaDbBU96en2fyhzD1wycYZhZsOxjJQ0yYZFz2azNRyic4012FnH6XSU
 UPW8+5mo6Ey/7CJZ+pHNIp+j7xU9jAJ9B85JzaiXSBIPzbd9RlInKtUno3sScfxbrc8j9jhXgoA
 1gp4AGM38IrSYVSd97SnVs8ID/tmPmkklVVI4+h9mCTaoTnnb+bkmp98PoXZ+3KHeh+K6n6koub
 CbOKLVKfp1nHRa6bnEhgPOo20yI+eq+fHVtvUpBCvMgQmjp1OOMEhDFGdGcJxlEgH8ScDf5yPdE
 a0c3dx1JSt9yCJ3EbSVAZNfcZIcYu4jy/j3MIe+2ZGHfpJwMDc+QsZcp7G66xo6ypdbmKn899z+
 ojOF6MmqH23cC2RL0mZco3EyL8hPCTc5GXFR3JEVRX5SP1Y+tNiyPc2VPEry/3geMuQI0330xHW
 Eto17UmQNEuVVUXYkEl3XitUzMngHlpPtV
X-Google-Smtp-Source: AGHT+IEt1om1kfGFI7LBBAzYyTXzZGznvpM+rLoorZyrqYnofQVBvIAI1Vb9MVfEwmR1vGMeyTbZqg==
X-Received: by 2002:a05:6a20:7343:b0:341:3b91:69d1 with SMTP id
 adf61e73a8af0-344d1da82demr2405551637.5.1761623064155; 
 Mon, 27 Oct 2025 20:44:24 -0700 (PDT)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:7eda:5d15:414e:cb9e])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b712f0c0b1asm8946849a12.32.2025.10.27.20.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 20:44:23 -0700 (PDT)
From: Chintan Patel <chintanlike@gmail.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4] drm/vblank: Increase timeout in drm_wait_one_vblank()
Date: Mon, 27 Oct 2025 20:43:37 -0700
Message-ID: <20251028034337.6341-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Currently, wait_event_timeout() in drm_wait_one_vblank() uses a 100ms
timeout. Under heavy scheduling pressure or rare delayed vblank
handling, this can trigger WARNs unnecessarily.

Increase the timeout to 1000ms to reduce spurious WARNs, while still
catching genuine issues.

Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

v2:
 - Dropped unnecessary in-code comment (suggested by Thomas Zimmermann)
 - Removed else branch, only log timeout case

v3:
 - Replaced drm_dbg_kms()/manual logging with drm_err() (suggested by Ville Syrjälä)
 - Removed unnecessary curr = drm_vblank_count() (suggested by Thomas Zimmermann)
 - Fixed commit message wording ("invalid userspace calls" → "delayed vblank handling")

v4:
 - Keep the original drm_WARN() to catch genuine kernel issues
 - Increased timeout from 100ms → 1000ms to reduce spurious WARNs (suggested by Thomas Zimmermann)
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..f779103b261b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1303,7 +1303,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 
 	ret = wait_event_timeout(vblank->queue,
 				 last != drm_vblank_count(dev, pipe),
-				 msecs_to_jiffies(100));
+				 msecs_to_jiffies(1000));
 
 	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
 
-- 
2.43.0

