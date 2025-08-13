Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08091B24A4D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7910E725;
	Wed, 13 Aug 2025 13:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eo+O9yti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D48310E71E;
 Wed, 13 Aug 2025 13:13:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-615622ed70fso10588381a12.3; 
 Wed, 13 Aug 2025 06:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755090791; x=1755695591; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zFdLFCkq6BKJvmfth9X/kq+wVTjql7oBUHjNEfqADVY=;
 b=eo+O9ytiLD9FrUIIWU1/x1LEtymg2yC+tcXnSXAdJGXDnvmT5SzvWNxDiEPH+oMrx1
 5vtI+JEgefaSQKarSu78yWXNJ2UlNjLiX7K8rTkOURLsKK2Bs4+4e70gGUcovcVExkAz
 vRju9mkq/6fH2UUtjvu9Am8zLBHeU3mFPv/9WgYJ5mfd5oxZGbehjZzQERqq4tnQiIx5
 O9rTqom+zwPBluo6qY5I2tEInDIkKV2V07prk3WT9K49x3CSWOSUUPjAJQcrU48CVIAs
 MbY1XdFwZxTPxggL8KJcWlgm1xUqRTfDlu54SOGBHYztON+KKQa68LLhypBUBq4duaAI
 UPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755090791; x=1755695591;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFdLFCkq6BKJvmfth9X/kq+wVTjql7oBUHjNEfqADVY=;
 b=gjPrhA2aFotm3sNCUNndhtsCtZOOriB/i7wRoC49AQdZLc4pdpG0etR1G6EtFfo5ni
 e6x8cFm6zHXToNV70lz/MDy1TIIOXMATzmHKPQLZ/4L0SjntFg/HrzL+Ahc9RYBOE21o
 VwCgcCMA6vOiO2kCz64EdFQVHyKkVWCHfaJW+fmXmXH6UY4pI8RUEQbD/Q57JWMfy1xC
 LGg+R1Oi+jMYklOQoF9cnOR9jTHHFgOFu/MCXb/m+2NaMOjz2knLzKn8zZ1UwJk6vkqB
 lxn+QPkyQhh2RyxmJnFfCDafGQ2vC27UW354rcK1RIQ6ODLLLWKZVzgCD5RR+bOZa5uq
 VpGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3D5yKRgPZCWZqahGH6Yia2PYOQA0rZxSR7Z7oVbJdH7QKz2EHAMpAJm5xIaRfrYGmKvFH4uAxNKjx@lists.freedesktop.org,
 AJvYcCXaEjqA/nbRFBoD/mdvdBkDh2YSXTK/qf7MmEf9kBnFsyNMcLjqm5HuskHxJj5Duws9JfWWc/RTvyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV4fVpQopGBhokVQQsm9L8juw6kxoRbI90gaRpY65/wanzNqGE
 2gS5bpj0iGcpp8bH7m5KxCpWNTbuHp67yTJzrYL6fD2DrSyXpWEUQwgA
X-Gm-Gg: ASbGnct0WKy7VBOcxUwVlqKvVmBmgBoXuc+CP+qQJGkR2pOLxju8HvvchS5LBwyvtP/
 Jh5e/tWMftB7rPYcaDp5BFDBboCmOdDHyEUPYZoSTuqxFQ1mk8vTs4ZLRcem1RlX1mLwjS7TI36
 yskltD5Ev9OSJHOaXu6aLL4h27b6RCmBo4ALV+Qn6KbyndpiDj4try2qYQISyXjXwdgC6g2evN4
 Z44OhD1iGWz9NnznOuEZMQ+U+fGXKpT/ujb3pSXRgiT77MxuO2dmwKr891PT2J7lZ8rk1uDTlgf
 4/ZLaPo++nNovbM9dEBplkPsB9NcEWb2yiRFeJZ7SEb0kF8FGtgbCt/kgq41FTCdaGTLLyoirHP
 VZQsVuAq+eceJYWyos8HMBz/b8MRsnIqA47QDQD+qV2spXEw2OiEFIkOC6JAuA4der+KR+p+mMZ
 U=
X-Google-Smtp-Source: AGHT+IFbOKjKDZzd6E4UUe1XMBuIL0ISjeH8uTqctsugShVQgQI4ZEs3ZUukQzl02z7akc9cs6hJXQ==
X-Received: by 2002:a05:6402:1e8f:b0:618:1f67:ae62 with SMTP id
 4fb4d7f45d1cf-6186b78c09emr2732398a12.7.1755090790546; 
 Wed, 13 Aug 2025 06:13:10 -0700 (PDT)
Received: from [192.168.1.17] (host-79-36-162-144.retail.telecomitalia.it.
 [79.36.162.144]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15d9fsm21681132a12.17.2025.08.13.06.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:13:10 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Wed, 13 Aug 2025 15:04:44 +0200
Subject: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGuNnGgC/x2MWwqAIBAAryL7neAjK7pKhGhttRAWihFEd0/6H
 IaZBxJGwgQ9eyDiRYmOUEBWDKbNhRU5zYVBCWVEJzXPISfnd7QL3dbXXAo/Y7No35oGSnVGLOY
 /DuP7fiTyvVphAAAA
X-Change-ID: 20250813-unusable_fix_b4-10bde6f3b756
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755090789; l=1446;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xQsf6dXU9C0LhRZCky8V9fz3sqI9Jm9JjLobbEzFe3c=;
 b=LAy/fzSqsj0WmX2lkecW7V/9WveJcaE+t5N6j5SppkV9Ia3LRzHbmGnBG/o8CgGdj7YjYiZbc
 VckHvI/kO1tDzpbSGTryP9xcfWank44ijGoXsmzszWpnjK5ls1Ku//7
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

When a VM is marked as an usuable we disallow new submissions from it,
however submissions that where already scheduled on the ring would still
be re-sent.

Since this can lead to further hangs, avoid emitting the actual IBs.

Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
 			unsigned long flags;
 
 			spin_lock_irqsave(&ring->submit_lock, flags);
-			list_for_each_entry(submit, &ring->submits, node)
+			list_for_each_entry(submit, &ring->submits, node) {
+				/*
+				 * If the submit uses an unusable vm make sure
+				 * we don't actually run it
+				 */
+				if (to_msm_vm(submit->vm)->unusable)
+					submit->nr_cmds = 0;
 				gpu->funcs->submit(gpu, submit);
+			}
 			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
 	}

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250813-unusable_fix_b4-10bde6f3b756

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

