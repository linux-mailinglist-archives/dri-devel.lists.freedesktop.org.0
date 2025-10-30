Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A3C21CD9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0680D10EA00;
	Thu, 30 Oct 2025 18:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="DDvkpPNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4E010E292
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:20:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so1490130f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761841255; x=1762446055; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NY69lTN7Ud7Wl3FDNsKkunmZ3YSYqX1JZIpAlME2vc=;
 b=DDvkpPNxybEi3L6aWvext/W+gB2qmDC4q+iD0yT07adtrnzkgJ+p6RGQXf6Y94Z6WU
 pQ6MC9fQTreFhLmGDzMFRE7UkW0C1EiIkhjHOAcb07G3SyzYA1YXQdS8o+BiCraeuBaT
 1fEjdrhXsLJoIC2WRK/fE2hl9Mvw59jsLga9g92ejczgU41yeRKPhWRiUorEGvrFitDj
 Gt3Tk9blZZFZ/d4nZg0z6TUfLfIse6KKIJB9VX1FrXf0an33Lcjg1G6YJMWi0cZh1+VI
 /+cuGPC5vNV3EneRIC01OS8Hl2AwMagx8YsthMZvsq8wRx/wAx66fhZrfie9J8zu/aC4
 2x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841255; x=1762446055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NY69lTN7Ud7Wl3FDNsKkunmZ3YSYqX1JZIpAlME2vc=;
 b=ntJ+kX0kXtz0zfyShGewfcnAoBCIBUh4d5sxsSpq3jaEvEWM8nNYKMgugY6k0vwY/P
 Vjcy9myJP4mQnoNBIMrdfG3DAu8UPC5NwpfXv5dhfYrFj6L+NexDF009s6TCPOmzF5hq
 Cd8N+t4W6iwRVjCaz+T7/2itxsRM2IxwSt1fbVMFLvWuO1G9HNolLXPDydhpXfNyBhXG
 MFj2e6VQQFtKEE4JNoFoYd3CFpyDMwQwWOOveD+6TF8Gbn/lOtga+pNqhlfG/1OwYCsQ
 WwVxdbj05DhrwSnCq1xiYqav+Rax9bJVBpYnY/B0ei9eC6K7HQtJ3zzNGTnUkh/7h1z/
 kluA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdh8/EnDMZ2RNTN5DQ9VyHfYXZTa6q4E78kyQ9yfOXA45Ct4c7detGFszc0vXoMAgEDDFhAy93bHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRmFBhnWsL7iFTDZGhK+I91u1R3XDX0X9O+GDHhbftVOqBS1Ug
 FzCk+XVOB2FHzhzKm+A0lZ1rllw5+g1Ty7T/ZbbhWX7MvHAbcf3QsDBSaFop2YiklC4=
X-Gm-Gg: ASbGncvCQrsOim4SlLC8zrHWurvtk0FtbHOH71nRsDpAilYjBNei+yjgeYLExYOtf0O
 E9k2NSfKopjBPFgjUzAu1xxo9vpfnVbMBJA7ZW4OaAxjsSaxgZg6hS4Y0EeVE9j2EowTouzVeCD
 0GDPfV9XeiiFjT+5xSzcMGA2Wel68t0wvI0K5mYwjAp4iypr0pF7CtQRvU1WlLJts5FbRdWiQ/u
 qimI/EF1ug+kQoBFyetObt/WUF8ophH2uDHkv4hLXXbg6IqiVhweO19VtKvcIvZ+4r3FGAXFLDn
 tsYZC3cpabtEjLTh0eujCLu13BBnbO5bpGvKmFtzAybSPC7BqjGFDopWt6hcj2NWdaS1WqBg9Hx
 Rn+UI4pK+t32PNOjhNBkLFUGAB4piGsyrHON/On6j19xqDAimN++9oxLUgRbsqszBEhU8dCw81+
 5zrl5KlPReFD6KWWA=
X-Google-Smtp-Source: AGHT+IFXfPh9yW0jtVttu/qwKjincPyDWS6IM7gy5X4TYXb5a6D/RDGVc/OgitNN+ao8ksUaeqYamg==
X-Received: by 2002:a05:6000:178d:b0:3e7:428f:d33 with SMTP id
 ffacd0b85a97d-429bcd51231mr502674f8f.16.1761841254774; 
 Thu, 30 Oct 2025 09:20:54 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df473sm32758678f8f.42.2025.10.30.09.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:20:54 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 3/3] drm/self_refresh: replace use of system_wq with
 system_percpu_wq
Date: Thu, 30 Oct 2025 17:20:43 +0100
Message-ID: <20251030162043.292468-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030162043.292468-1-marco.crivellari@suse.com>
References: <20251030162043.292468-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:35 +0000
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

system_wq should be the per-cpu workqueue, yet in this name nothing makes
that clear, so replace system_wq with system_percpu_wq.

The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/drm_self_refresh_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index c0948586b7fd..36f4237efd4d 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -218,7 +218,7 @@ void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
 			 ewma_psr_time_read(&sr_data->exit_avg_ms)) * 2;
 		mutex_unlock(&sr_data->avg_mutex);
 
-		mod_delayed_work(system_wq, &sr_data->entry_work,
+		mod_delayed_work(system_percpu_wq, &sr_data->entry_work,
 				 msecs_to_jiffies(delay));
 	}
 }
-- 
2.51.0

