Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC34B2E68
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B279510EB85;
	Fri, 11 Feb 2022 20:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF0410EB84
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 599DF1F46DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611267;
 bh=bqg6OrZegdvOXpzjMbq6t9G29v4DHS6ngCEjDNDMJrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xr8lD2Fc5ElX9yLBViX6zYFJ9S/PSwoV0DNR9T9ySq2wcxr8V2K7/vkELgEetFKvp
 VqVMG1ETYv3VW3gqfM/ETeU33bBGJnniJUjNkErXiqd0o1SRzS8abnpa+C8dtkboAb
 INZBiwZbqXAo3ajJLLStt34ApuuiijvV9wCsMJ0HOODY9I+sXW9Bt30PJaA8NBwELK
 uuK4AhYyyxlYAYCfaaHMlGl7LTlHUhbvQRKg7XrDjL0s3Bjh4nL4v6eg/weqhrRSAd
 YJho7SpMMS0HB0MKY9QKRtYBo8tcCiSyOw9DdX8NNH5Z9Aia9gzY+XcENIJsSrkWrU
 +Qq51QV7Bc3Sw==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
Date: Fri, 11 Feb 2022 15:27:24 -0500
Message-Id: <20220211202728.6146-6-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

TTRX_3485 requires the infamous "dummy job" workaround. I have this
workaround implemented in a local branch, but I have not yet hit a case
that requires it so I cannot test whether the implementation is correct.
In the mean time, add the quirk bit so we can document which platforms
may need it in the future.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 058f6a4c8435..b8865fc9efce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -132,6 +132,9 @@ enum panfrost_hw_issue {
 	 * to hang */
 	HW_ISSUE_TTRX_3076,
 
+	/* Must issue a dummy job before starting real work to prevent hangs */
+	HW_ISSUE_TTRX_3485,
+
 	HW_ISSUE_END
 };
 
-- 
2.34.1

