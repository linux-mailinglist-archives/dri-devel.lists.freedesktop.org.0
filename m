Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VORACvOarmkjGwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:03:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9B236B4A
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EC110E4C8;
	Mon,  9 Mar 2026 10:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MIeoiIUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1CB10E4C5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 10:03:26 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-829afe24fb5so1515156b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773050606; x=1773655406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
 b=MIeoiIUSPNJ9I17uczqWq93HQkEllrE6gQD/cj8tyKcayiPaAAzD0vhEdB+kIPi9HI
 PHuzqOn7r4pQGJ7WnM18e4+ajw7eo1Rw9k2sfzLS6dkMzqp8jygHH5n+jMSnhCgrLSRl
 wxumFca7ZdWHHS7AwVZT2fb4ia/JfuJvkJ8FHeSl395Rj3sTtVetIpSzyc8P8CKTCrJ7
 9c/M/p9UfO2cwLN0GLcnQWDos98PMRt6k8zEKVUo759syqAQ2Kmti7ER+kmwFI1W6Cyy
 bFScAByeVBe6XIbLK7HJIPnZLfv2DAJoo0L4On//SNDmKmmFWvLvcvYI1NFvzlg2HnBK
 jbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773050606; x=1773655406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
 b=HW0UhPQ6NgHZR5WNkB1YFVn4emvFLtFk+ZiKye/0r+cFRkyXdnFoSI8kqWPTjaaV52
 fWRwK3OnpfnpuVgrCeuIqWejTmLXTPfXcoGpSGzGKqR4jLrmFF40JBfPvlOT4yrJuFzX
 fd5G3oWEP3TFbAvNumz8/b/hPNVh1FYVqR9o9SNm3rWLa650bTAKyrcSnKObPHsw5+yi
 UG7TQ+9ufNxGs3pHhEIqmL4hwGKk9SEjTT4lwWOLyMkuiukM/udcuEzk9zpFd2D4cVsn
 QLlHOW2GkraeL7bfgCku8kBi9FEE+ymOa9ZkatThivS835Sc/v52ScczVDu7JKCeG/PY
 DrSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwNqlV9VgPa8lZKCIJl97jqFgBypidHmMa7bUER0dcl3noMQRbqG05lBICG5v9agkn3FPd9s/qMFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL+qO4C0jZl2y5XYeI4EODLhYOauTZ+s3oClwuEo463FLc9Xow
 +hvnpenph0ZmNZIS8SfZS8F6Da4i4by3dnOS43cjZbaQrWj9WOUjAAab
X-Gm-Gg: ATEYQzxoA8CL+BZJ/59rQ8Pv2358F3C0Fs5DySDLU0h3t35951rylcLa6+5Ob+Ei27C
 Uvqli/mljSGCEGkjp7uHtiBRYRrmi1jEKUDRx7mPF4vVQWHrNpa+cZCocgJ2MTfS2WX23zxd15l
 J1XFHpKudh8jo25p7SJJ5oFLM/70hZFf01V4fDlV+eNtAxdEC1MAPcNuadfntXAH/N+9JOaOFoq
 0IK+A4ShWeOhKk6xyMVw/nW8sqUUzPI/zjx+yOacuVS+kp46T/epsvEhYvD3ZZ1vsmup15iCDaS
 y/kkTRbfau7puiOsa0iH2ih84MND2ICwQUvcN4PiEuWay9Eqol1qplP9KtRpK+NrgDsQ8TkvMaC
 7fs5CvIXwlCtZ1HLio7/APIY9r9F0UhN5D/RhceagCDvYZw88lNxTqFxb7nagWX5eETJa8RGoHv
 FPc/hDGpDOzlfBj1uaVw==
X-Received: by 2002:a05:6a00:7487:b0:829:82f1:8bf7 with SMTP id
 d2e1a72fcca58-829a2d6e341mr7386135b3a.11.1773050605584; 
 Mon, 09 Mar 2026 03:03:25 -0700 (PDT)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829af8695cesm8147353b3a.12.2026.03.09.03.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 03:03:24 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: add the missing parameter description
Date: Mon,  9 Mar 2026 18:02:53 +0800
Message-ID: <20260309100254.877801-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: C7E9B236B4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:lkp@intel.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add a description for is_bonded_dsi in dsi_adjust_pclk_for_compression
to match the existing kernel-doc comment.

Fixes: e4eb11b34d6c ("drm/msm/dsi: fix pclk rate calculation for bonded dsi")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index db6da99375..6cb634590e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,6 +569,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
  * @mode: The selected mode for the DSI output
  * @dsc: DRM DSC configuration for this DSI output
+ * @is_bonded_dsi: True if two DSI controllers are bonded
  *
  * Adjust the pclk rate by calculating a new hdisplay proportional to
  * the compression ratio such that:
-- 
2.53.0

