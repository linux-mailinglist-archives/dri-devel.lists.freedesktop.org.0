Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C338FB6F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FD56E0E9;
	Tue, 25 May 2021 07:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3D66E8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:47:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so11319231wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5LsshN/w/EqtVlYdH8CJ7303gxJoUC0MUKp67S3Rw4=;
 b=iFGf6zvLx7Wm86r70xf7tvo4wfqJ81GcbHImsEfOKd8ThuKUtFK2MuK+MKcdyoZYLB
 8yzeZeFYoOVEFt7hDVcaY0QwHVuP8mvtFBs+8l4ICs7lOwhipIjmA3EYhafZyaTjnitV
 57ikrIAFvICuaRPDzGKiS+RTyg0nCeN0dROIdbK65cdvD95pvKYVEIhaiQZ8A3fdkFiJ
 7D/l0yhGreo45tDS+S21pFOcOv7c3WYObDWSuiAq69NJex7HPsjwsgoeHWjzu3bisqPC
 cFcsaFQg62i+eIP5W1XHecorBxua8dO0gPtlTkZmr6lPU8GJrzuu0de5o+X9vRFwgujs
 3VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q5LsshN/w/EqtVlYdH8CJ7303gxJoUC0MUKp67S3Rw4=;
 b=UjM9ynsO6W6/dpKbne5YuMTc19uFdkdAYR5hqVbW4TDc3ilRJ9WT4Sps258DV42MwC
 VKmmPQYKvP9zjevs5eyDj18vcfIT6mFrKqiKdnuIXvVP+SqfXDDcSyvVwb6jtUhXC9f7
 clrNY8cQsn6SJk8s5ZtpH3AY9nffI79Xl4YA7FLqb7VezVDRl54ji+iCLWPDcLWsyiGH
 Kry2+4ZQOv+Ji3P0lj+8ANXoHzpuJlKCk8KJTYZT2ernKct30WrJHfg4GB5ZuqpwvM6h
 EPomQA9GiWbtsDImlSbl9FJaD+3r18KGxwMbljPqWG6MH+V3UcgnBnQAxqe2TssaocVa
 iQVg==
X-Gm-Message-State: AOAM532v8TrJc07B2jp7aopBIv368QdoknZyFnpdWdxXLm7NKZ3ycqEL
 TEqfnmsy7a3vPC0uZRd60PDPeQ==
X-Google-Smtp-Source: ABdhPJxjdBMeRIGOWaA7Niea7ZuRC1ReYE+sftPeyd7t8T1co+5i5R/r8hHOJuSKccpoIXTfWXx4gw==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr20971wmh.83.1621874871648;
 Mon, 24 May 2021 09:47:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 b10sm15226358wrr.27.2021.05.24.09.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:47:51 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: Add orientation quirk for GPD Win Max
Date: Mon, 24 May 2021 18:47:19 +0200
Message-Id: <20210524164719.6588-4-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164719.6588-1-anisse@astier.eu>
References: <20210524164719.6588-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 May 2021 07:09:22 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel is 800x1280, but mounted on a laptop form factor, sideways.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..3c3f4ed89173 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -148,6 +148,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Max */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
 		 * GPD Pocket, note that the the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
-- 
2.31.1

