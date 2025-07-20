Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB5B0B782
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 19:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC63C10E22B;
	Sun, 20 Jul 2025 17:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRwVZ7HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7310E21C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 15:25:06 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-87f26496daeso1969021241.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753025105; x=1753629905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlwld6FdGzx+gNpdq9uPUdbnoNu6WgBQ31n27jU5G6E=;
 b=fRwVZ7HOZL2G/Q8suAuQFx9pV/CyuvXNsXS39j2/MBeuD2PwfJgUVmG0eGuIOxJZIH
 YYf89sk4xnYyq/qi9JTnLkHwSoUOW3GJqDWSAVdnAWaE5E7fHlqKHIBxn9uzzoiic4xB
 Vhgc5gappGhK6tPxAM18lqPnJbo2AaqEIkG6jjq+AJkkefUjLt1jjzpVvPvDYeHDolXE
 brnyFinNkVgmjC2dKqkolxHoD8qhLgS/ZULCgfc5EoEfDYdeINyjryDOpNgkkI3XQyJ0
 o28hz5MYRzFLRxJyFEd59AxEf6nkfxrmfEMN1S3IXxNWP9fzgcazRj3eGJxZxWgiPgfo
 RzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753025105; x=1753629905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rlwld6FdGzx+gNpdq9uPUdbnoNu6WgBQ31n27jU5G6E=;
 b=buepfurhVe8MRDvVmNs0lR2ln3VwZGafhIaE4Ut9RzZ76sSfRHi9UIqq/tzk5nciZP
 qcZIfTr8DlDM830eryq7HnPRqxeNgMzw7NMNwe33Eq5hcfNyvh13V+7oPy5XH6Mb3ulQ
 0Ecpc+fumxu3s2hbv57pCtyU8o7KqS7VPMDqYSUdGV+NFYqUZ6LbZ8GZr1FazAfTt/Xj
 jvzxRs6ulva9HCZ+c8Q3QVDzpm/ao2js2d0HiVgYGwXcylFfTrBK2AxSUax23uFfjiYN
 5PgHptzZCrUM2JCNnG2V7OO3KYXo+Wiv9Evae7jicrkV4LPcnPdqUneEdNCTSb/0mU4f
 15qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuW1YHtt1qcVd3g756/kveSrQ7wbYHY8R3EwiPviDAD+Y16Q003327QFOdc83D2S3dLyjCvolhrnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBrs8GvrXq2oL93siWWfAUnmyW6AUMm8rLiA8U4LtdCwofMgA2
 v7YBgVU4ykS71wuHPUOnNfFYE0BYAKQOkm49/jIeJdME7SPbO6FH9Nrs
X-Gm-Gg: ASbGnctVzRwOP84oH7/ydZjdzL2R2WeH8Ar57hOEtKZ0eFUbRjAEy6oL52T1kh81cYa
 oyRqlvMcnIld3Q8EFSeWdLhsmco/EzP8jE/+d3Ce1IguXedG8aGlgQucBuarJuBzCXnKFNlY9P2
 LdTAuf/cf6ZTIW/W65wKGCT9ZjvC4pFN61KbGXfn9tRh9JBvaQd22bT08ArrjodltLrCd1FOcjs
 x8Qomi1bmtPNha+c2S6k+gBn6NIbMWn4IsOL+IWnDaEQlhZH0z8GkY5jVIEs2hIh5Etb5qiYzeW
 PQJaC/Vvk/c3742unVHjBbKLP8JFTDr4+aovMAvcm9HAAl6CRx7KRyzsyZRvqtfs/kOyPP4QS6V
 A7pkfkuKoXZTflalk0IzwtMJbQS/LTDJNrnJXnrY9BiNCeiFHpkAtJIHX7PVf6EmW5+YfqxikAD
 8b5xM8zw==
X-Google-Smtp-Source: AGHT+IG92NRkx8ltYfrcXZ5eevHEHXa70/Jp/PIid1of657KfjI7EX1GOTtiKanjN1S6eknrX4Nt5w==
X-Received: by 2002:a05:6122:1acc:b0:530:7ab8:49ab with SMTP id
 71dfb90a1353d-5373fa6909amr7613401e0c.0.1753025104945; 
 Sun, 20 Jul 2025 08:25:04 -0700 (PDT)
Received: from 9950X.localdomain (syn-142-197-132-170.res.spectrum.com.
 [142.197.132.170]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53764eedd3bsm2157582e0c.5.2025.07.20.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 08:25:03 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Ondrej Ille <ondrej.ille@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Frank Li <Frank.Li@nxp.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-i3c@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
Date: Sun, 20 Jul 2025 11:24:01 -0400
Message-ID: <20250720152401.70720-2-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250720152401.70720-1-luis.hernandez093@gmail.com>
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Jul 2025 17:54:34 +0000
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

Fix kernel-doc issues that reported Unexpected indentation errors
durring documentation build (make htmldocs) in CAN, I3C and GPU drivers.

Convert formatting to proper ReST list syntax to resolve warning.

Changes since v1:
- Convert return value descriptions to proper ReST format
- Fix code block introduction with :: syntax  
- Add GPU driver fixes
- Remove SCSI driver (already fixed)

Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
 drivers/i3c/device.c                     | 13 ++++++++-----
 drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..982a3476a988 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2430,7 +2430,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
  * will be newly mapped.
  *
- * The expected usage is:
+ * The expected usage is::
  *
  *    vm_bind {
  *        struct drm_exec exec;
@@ -2464,14 +2464,14 @@ static const struct drm_gpuvm_ops lock_ops = {
  * op, because the later altered step will involve the same GEM object(s)
  * already seen in the earlier locking step.  For example:
  *
- * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
- *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
- *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ * * An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *   DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *   locked the GEM object in the earlier DRIVER_OP_UNMAP op.
  *
- * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
- *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
- *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
- *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ * * An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *   op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *   required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *   already locked the GEM object in the earlier DRIVER_OP_MAP step.
  *
  * Returns: 0 on success or a negative error codec
  */
diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e48756914..48b49757a90b 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,14 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return:
+ * * 0 in case of success
+ * * a negative error core otherwise.
+ * * -EAGAIN: controller lost address arbitration. Target
+ *   (IBI, HJ or controller role request) win the bus. Client
+ *   driver needs to resend the 'xfers' some time later.
+ *   See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ *
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can/ctucanfd/ctucanfd_base.c
index bf6398772960..f910422188c3 100644
--- a/drivers/net/can/ctucanfd/ctucanfd_base.c
+++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
@@ -506,11 +506,13 @@ static bool ctucan_is_txt_buf_writable(struct ctucan_priv *priv, u8 buf)
  * @buf:	TXT Buffer index to which frame is inserted (0-based)
  * @isfdf:	True - CAN FD Frame, False - CAN 2.0 Frame
  *
- * Return: True - Frame inserted successfully
- *	   False - Frame was not inserted due to one of:
- *			1. TXT Buffer is not writable (it is in wrong state)
- *			2. Invalid TXT buffer index
- *			3. Invalid frame length
+ * Return:
+ * * True - Frame inserted successfully
+ * * False - Frame was not inserted due to one of:
+ *
+ *   * TXT Buffer is not writable (it is in wrong state)
+ *   * Invalid TXT buffer index
+ *   * Invalid frame length
  */
 static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct canfd_frame *cf, u8 buf,
 				bool isfdf)
-- 
2.43.0

