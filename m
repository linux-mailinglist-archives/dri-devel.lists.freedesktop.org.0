Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27F7A9520
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757A310E5B0;
	Thu, 21 Sep 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48F810E137
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:15:28 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1695305725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQNP4qnayxb8k0G9c9g8gb+q5OeXVIV16Tw418a50N0=;
 b=R1e2ZUboVrm1yLGexIoE7faY8XdhJ19BfrSYjPAWiIRFQOLkWNxMcfW9XmVilqgg2FrFYb
 1ZEhc4pSVXT24om0L5YH7l7/uLNWlDhr9Djae/phlQUQL/9SGKFzMeyLyMVc3M6TRbrokX
 WryG7D43QXGitxnMYbCOkYvJOqLc66mppzoTzubvW0q4Hr3FWOe9x7P4U4PL0nLASaiy2i
 XA9IAOHEEkGy1yrxp+7N7UqE5gH9MTnV2KVz6ARq1iqIkZszh0jqPH6CbjwOa9egPVhPOP
 JwZOZYr8PQ1O5oTk7I+lRjeopRQ8cqhkPJtK1uOXf39codTf2yYh9oDi8iMvWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1695305725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQNP4qnayxb8k0G9c9g8gb+q5OeXVIV16Tw418a50N0=;
 b=ITLG7Vr8nA2Acv93CdsFEZspA29eBMF5N9dgjI2frMX6U341lbdKyZqjTl26y24Y8XcIyr
 PAOk7arYcvyD+2Cw==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amd/display: Add a warning if the FPU is used outside
 from task context.
Date: Thu, 21 Sep 2023 16:15:14 +0200
Message-Id: <20230921141516.520471-4-bigeasy@linutronix.de>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a warning if the FPU is used from any context other than task
context. This is only precaution since the code is not able to be used
from softirq while the API allows it on x86 for instance.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/d=
rm/amd/display/amdgpu_dm/dc_fpu.c
index 8bd5926b47e06..4ae4720535a56 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -84,6 +84,7 @@ void dc_fpu_begin(const char *function_name, const int li=
ne)
 {
 	int depth;
=20
+	WARN_ON_ONCE(!in_task());
 	preempt_disable();
 	depth =3D __this_cpu_inc_return(fpu_recursion_depth);
=20
--=20
2.40.1

