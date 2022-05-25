Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6B533FB2
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9954310FA9A;
	Wed, 25 May 2022 14:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6D310FA92
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id BF61B1F450F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490699;
 bh=5/q/VGsjElGEhYhnxXg0G7I4bXivQFpLYLt/EA9+bfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8zYvYeS5IFbvVOR6K68eH/w0KatIXNchsXHaGX9mNZPuk1VTpjGEQyObBccM38rc
 AZKxRB01IQiLAzsr9/rFdfYBHCssOllm9V5EtTz4rSCqyHG+V3zvRyEdfDUWNcq+HW
 1J6TqdD2NCiMOYN1RT9kXBc3BBk5vyITZXLUcwEAMNtAgYGk5at042BCF8Yt+dLzKM
 kyhtmU7xm0euT63ye5GMsHEhxoC6xWtc5tvjspbQrKkf9TBBq2rZCKljlnX/+lByLR
 6UAisS2exJ4COxTEFKzOPy9vWHU0pb2SjxKLU1C7k4OUjKn3SPrjqvMt/uVbH1UbHD
 zh0L2Fm9p7cXg==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
Date: Wed, 25 May 2022 10:57:50 -0400
Message-Id: <20220525145754.25866-6-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTRX_3485 requires the infamous "dummy job" workaround. I have this
workaround implemented in a local branch, but I have not yet hit a case
that requires it so I cannot test whether the implementation is correct.
In the mean time, add the quirk bit so we can document which platforms
may need it in the future.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index e35807e4b743..4d41e0a13867 100644
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
2.35.1

