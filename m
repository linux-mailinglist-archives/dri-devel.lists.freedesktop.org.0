Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CBC1DA456
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 00:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEFD6E397;
	Tue, 19 May 2020 22:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AF46E393
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:16:28 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c24so1015999qtw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+n48J7SDOms/3rVbtXkJDi+uLvipTi88uEak3gJc6kM=;
 b=bhmoUryvBO1VMVpVzg2PLJj0wW9UGDRt1OKv7xTOpkGjoCao5jyBYrwuRQ4RlRoxgw
 nZuQI6vDc2e1iHyVa4FJBueECZhixEPbFs0RVwjjTnH5lnDqcpWWiBRTEW4C9Z1KhZhA
 Hnu9evsk7lx5PyRuqUGdJmGf6nd4OWtAg8tLDCGM1W/Xf2w5mNSmBdrwcwZkD16zJm69
 nvEJn5vqf9SArAqa2xxQcUv+/3CXRXdusmPrV38RdtRFjo/HNMXfkFiz0XYlGz3/wwOi
 FU37/5t52bRzsBa4GtZpuS9ffxvolNY+KR4adzzjMZWqq9PCG7ISHxvk6mfTHoBR9BjE
 dLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+n48J7SDOms/3rVbtXkJDi+uLvipTi88uEak3gJc6kM=;
 b=NUo2D/S5CmG3jm+c+RWLddfqmINCMgHSCZ3vT8YqIFqrk5Ez8ukOghylIma9b0zKNw
 UBzmz6zHVOtAH5iuezEpIXrDxjaavp022nu4ZfTW/9IUTu/Yavr1vegchtONamE8tuOK
 CKYmI2G2ky8ggSOd3DR8Tn0hCvps+yjPcwyU7H7HUQDUEVcbp4KUMNq0WbmZYskBnCdg
 YVZUUamWWJJ+yQnzAcO0wUL0VEAmKdOKy7lEiiUCnYrBaphZ/vYf9sM4L6NqznWOFk/D
 1BgS53Mhnp6cJJEjMgSen7yM79/YrKqoOGNX8zr4AmCwu3KzcowpUbwBOowXQjulMFLe
 m2MQ==
X-Gm-Message-State: AOAM532Mv+c1VOvrV2HdHT9a9t3zihPuYth8fFlpKMGgjqfLDMcPkb5+
 6udFEuf/8zOzYZ7UOpPtzCDiAaFvCcQ=
X-Google-Smtp-Source: ABdhPJywcJMJM0yunf7bLLO2E4Uc6nzMFQul6gfD7aBELFK7EtVclUjIUqpcXiLwuC08XRonZWNhcw==
X-Received: by 2002:ac8:3664:: with SMTP id n33mr2323760qtb.363.1589926587578; 
 Tue, 19 May 2020 15:16:27 -0700 (PDT)
Received: from localhost (mobile-166-177-185-175.mycingular.net.
 [166.177.185.175])
 by smtp.gmail.com with ESMTPSA id f16sm913445qtc.69.2020.05.19.15.16.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 15:16:26 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hdcp: Add additional R0' wait
Date: Tue, 19 May 2020 18:16:21 -0400
Message-Id: <20200519221621.19931-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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
Cc: seanpaul@chromium.org, rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

We're seeing some R0' mismatches in the field, particularly with
repeaters. I'm guessing the (already lenient) 300ms wait time isn't
enough for some setups. So add an additional wait when R0' is
mismatched.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 2cbc4619b4ce..924a717a4fa4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -592,6 +592,9 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 						  bstatus);
 		if (!ret)
 			break;
+
+		/* Maybe the sink is lazy, give it some more time */
+		usleep_range(10000, 50000);
 	}
 
 	if (i == tries) {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
