Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425C9300FA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 21:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9554B10E166;
	Fri, 12 Jul 2024 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nACjXj7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306710ED87;
 Fri, 12 Jul 2024 17:45:41 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5c47c41eb84so1247749eaf.0; 
 Fri, 12 Jul 2024 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720806340; x=1721411140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tNXQMXtVVY9UI6zu3BBCUXELAve7Ltcp0DjuWc3krBw=;
 b=nACjXj7OSPi0tKXhO+lZ/mpkpNHCygHB7333/1JvL9lMCQjJyW0Jbba77JLO93ekrs
 WgeeCeiFy6OcAjSSbq5gw9FJBtpXE/zOF+nZgxu2Ua/ETTc5aC4pqJEi6L8QJwjU6l/W
 drinPFmAHFoJjxOaVaIW1ntaJMNl+34dYTnK79vFt7P7MnVxsd3pIfTI2kG5kBSGWSe0
 6ciwli8RBM/sz1pV6d5v1Sn9MIm7O2AnnFGyFS9uGkU9zd15p+10FkG5AVNO8ZAjJFpr
 g+1/ew/39QEjo3Fwl2sdNWy2HOKLJp92Y00wozjw0M/q5nunTPTlPugKTTrpDwXGCwcy
 kTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720806340; x=1721411140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNXQMXtVVY9UI6zu3BBCUXELAve7Ltcp0DjuWc3krBw=;
 b=GQvthXCgT+o9gzumKkd9IfFHsQuBHl0IhLJ+33VYfepBXDeuUMsogFae/HSCwZ2fc9
 9Jg9tM34e9p7X+yXZa0uS/Xdy0vkcYOi8FAIlfiosktwQ86AbD1RBu+rtjQsnMMZV4kK
 /ZFmSQaRj+afOQ9OpxFeLRig8aafM3ZxzlB4TOSTNkHTxFkMTaPNib/gnw04xOzalElh
 /paCxEYDYfda70yayinbiiBF3bYaytIHgmM+DUu0E8wnvboMaFrwYjyiJvrtL6B1ggb7
 7X4zlg5EtBCi+nqKipN2HRcwuwen+JEPZqPeOA4ud/HqmD+FH/QvHavPjgXQvzIQWXd0
 JdLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnC7CmtGSbSZnPtfz8vmgFjPgIsAM860mREHy5XQ5YwJ1um5fU/G+wbmcuSY/gVcFQGTrN20OJy7WgVGf6NphVbJ93RZfIUAJYE9ISltst
X-Gm-Message-State: AOJu0YywwTXzH/g2FVkbJwMTNeeCnJZq6uA9NoQn1Gkj3Bh04qUX6Mkk
 fBi5d9EjqeZ38xExKzBkj5pznQX1NnFxl55PnU4VeO0WcDDDCeyN
X-Google-Smtp-Source: AGHT+IF9PKjomOSMUJmoLDlemBt+PLgMux6m5VCf86phTvzU1z2v2Giz3TyPGWhJB2bd25AAHSvm3Q==
X-Received: by 2002:a05:6359:5d25:b0:1aa:c73d:5a83 with SMTP id
 e5c5f4694b2df-1aade04191amr928556155d.1.1720806340226; 
 Fri, 12 Jul 2024 10:45:40 -0700 (PDT)
Received: from embed-PC.. ([122.183.46.111]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d669d5282sm5097810a12.67.2024.07.12.10.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 10:45:39 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drm: Fix documentation warning for read_mpcc_state in mpc.h
Date: Fri, 12 Jul 2024 23:15:10 +0530
Message-Id: <20240712174510.70467-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jul 2024 19:30:38 +0000
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

Add detail description for the read_mpcc_state function in the
mpc_funcs struct to resolve the documentation warning.

A kernel-doc warning was addressed:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
Function parameter or struct member 'read_mpcc_state' not
described in 'mpc_funcs'.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 34a398f23fc6..9e65ecf1d3b0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -282,6 +282,22 @@ struct mpcc_state {
  * struct mpc_funcs - funcs
  */
 struct mpc_funcs {
+	/**
+	 * @read_mpcc_state:
+	 *
+	 * Reads the state of a given MPCC instance.
+	 *
+	 * Parameters:
+	 *
+	 * - [in/out] mpc - MPC context.
+	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
+	 * - [out] mpcc_state - MPCC state structure where the state
+	 *                    of the MPCC instance will be stored.
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
-- 
2.34.1

