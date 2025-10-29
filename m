Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E0C1F0F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CD510E8DF;
	Thu, 30 Oct 2025 08:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="O5oQxgA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB1B10E201
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 16:56:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47710acf715so219675e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761757016; x=1762361816; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neCo6rMsbUGdDP4ruNQ7u/VFFSh1B/BavlHefo52vBY=;
 b=O5oQxgA5GHSgbDCk/YiwOSd6VHTnPFiFGsZlZh4FMPAA0qtSZQk27GIY/Fdb3DdtEA
 8lDnllPfUODgiNjrNj3kj4WQIwLpbML+vLMYv5DeBXFFj2jc6LqurolsJISvbjfrZbX2
 8V8XhfbdSPGfPCf1CYC2zWkd3equCDZgDk9WU906oH9ru4IHEymVeH2gbNxRfXfC5GfP
 0BnBrFL9pEdvaogGjNZ7if3Jqx+zvezpETTgiNJtIWwzIWQICaYHjK4Vv2V6IlrcZOei
 r0ct1IEr0EgB2aunyVL98Pluvm9kXL/J1rKUCs2Ui67mEedIWivY3bh+aIi+BhLmt4JL
 dbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761757016; x=1762361816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=neCo6rMsbUGdDP4ruNQ7u/VFFSh1B/BavlHefo52vBY=;
 b=U2stM2C1tgrQxtfdB1hwca6r+D0Vl2FX4mvhEHk6Zagsua4KGOqa+UZfy1MQx4VJO7
 Bxw/PS+2uRY0GKaXqCzaERl1mSw9NSF4u/YG+JPQQ2mYTZ5xjyU92mczghhIv/4DYrR8
 fSmqiH80ugVqfMU15Rd7z+Y4fxDRMzArCMHEBp5zc5YP2N66KaW9HvahSJIs4qd/CF1M
 7fdH0vQcCRxi4GxAWTm1Lt0rgHYZ+OzQzPnT+yuo/u4H+FbS4me81u6gNH/5ZpLtziQS
 DHHeT+0M8cMJDTAOXNCMcIQxXICOjvkCpoxvoNfar3M8CYp9AweA0ixrfiQlHIky1n2F
 Mncg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCgLw9VM4VOXDzj6XMiWO6Sv9KvNVC7RRxfiX4oa7WuzjAeRekCCGUc+2znRNmzP8HKsI5AaeVc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBPp2+mRiUjSdR5IRNHMW279M0LI40XwZSGsVNEn2NoUE5asug
 NT1CmOWQC/30RW2UHinItkCjkk15okVWH4LNHKekh7pjONXf1UWlCYYPVoP1vpUsjqA=
X-Gm-Gg: ASbGncsuvedevunV4MDzG29NudSxsIuloGTx46NU6Z1mQI2BUy4FcHaatqu+d0tg5i3
 0wKBROoADSka7wBALq17wmA5adkcEmMLJkL9vCy1wJEb4+Ej6i+D3MgWEFdbXjgyNXl6vl7isac
 0FAE8vJiBAjo3NXnr7jY6oaIBiKM0vXDSuhEnPLaIFKIqCaN6AdUPh8wg4t6fVImEV8OVUex4lC
 Qj5gb68iRSpumo3Ea9TNoOcDKvxky/K9bf+FARl5w6UevdeqJGS1RZkTUdyoCKeQtswKmU5ffdP
 SaRqn9I7vxK4UFWZ8a+9ZFAgj0oTTh7N53UydSe/Om9SQTPYrI6FDO0qm7TLDQyRczFrLFASFmN
 65QMC91QhY0hiEz5yqbqz6f3zQDfKofaTs80ULmTL1DKQHqqMYPskAMG4FPBVwHqtZxLyPp4Zzp
 5pkxzU7pIlXBd/Y14=
X-Google-Smtp-Source: AGHT+IF2r7j5C2WwoHsesRE+SkzybACCWjnWaK3VR5ks8BG4MDELDNt49EH7s+dQi8bNKqiuYyGAwA==
X-Received: by 2002:a05:600c:1d23:b0:471:734:53c3 with SMTP id
 5b1f17b1804b1-4772686f18cmr50925e9.24.1761757015818; 
 Wed, 29 Oct 2025 09:56:55 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fc0335sm48393845e9.2.2025.10.29.09.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 09:56:55 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v2 1/2] accel/ivpu: replace use of system_unbound_wq with
 system_dfl_wq
Date: Wed, 29 Oct 2025 17:56:41 +0100
Message-ID: <20251029165642.364488-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029165642.364488-1-marco.crivellari@suse.com>
References: <20251029165642.364488-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 475ddc94f1cf..ffa2ba7cafe2 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -186,7 +186,7 @@ void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
 		ivpu_hw_diagnose_failure(vdev);
 		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
-		queue_work(system_unbound_wq, &vdev->pm->recovery_work);
+		queue_work(system_dfl_wq, &vdev->pm->recovery_work);
 	}
 }
 
-- 
2.51.0

