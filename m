Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180803EFB8A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9213C6E418;
	Wed, 18 Aug 2021 06:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66746E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so8203561pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcRMFUHVF6QqGnr97K+ATth5rLyNBKP5psUqyaewiPQ=;
 b=a6bTyF6xsvXmJVaSI8AKs77+P0oFTI1gTPlsYa6mh59pACM92P1VFzFqvqU9+X+jNr
 vTM9CS3vOAuRCBsVzn6N7KgVHI6W6ooLD8DmaYQuGxrolCI4Xru2kAG7C7jmtZ5uZ8PR
 VDy1iToF9Tpap2g7DTRp0rqJ6lJwmpqW0wJjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcRMFUHVF6QqGnr97K+ATth5rLyNBKP5psUqyaewiPQ=;
 b=EKlWVEEm5bE6s8LeguRQQYeoA//cwjWH9t8eqDoUU8UTpPQD8rP8ucj6yNFbYdFOSX
 US0jddaircmaIqJur3O+4R1x/D/rFM+WrjadWK3hOenwefful8xOEsiPesQi0Dru+vgr
 9pxwJpIXugt8CLZ0CcyWjTebdPBIEcLPuWdTXg2wshhdfT4m71zka8oQuqfBSQmWylhs
 ItmUTBn8IBFlc1/WZYxcO98RsYa5pE+Lp76cSCus5RKnaCiVxQAYhTcRVOIxgj89SljA
 xTM0s0iHmEXgXdBKyHq5fiolZ4l6WrgU04g2Hc1hOn+OixVgp3Sw57g4Z+Lb3vU8waiy
 ruJQ==
X-Gm-Message-State: AOAM530t7OvYXIOi/rrGal9OzfSYq/qaoIXMa35fZaUjbymC1lKd3WIE
 LPEZfPbNRm2DUv67RgOm2qPNUA==
X-Google-Smtp-Source: ABdhPJxYy9uajyke8AmxVdXcCpVPxEVIqn6teRhyhxiibQmTAmVANSe3Um2YhA94u6j4OQrmXZTUYg==
X-Received: by 2002:a17:902:e9c6:b029:12d:4cb3:3985 with SMTP id
 6-20020a170902e9c6b029012d4cb33985mr5959378plk.56.1629267253269; 
 Tue, 17 Aug 2021 23:14:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l12sm5631661pgc.41.2021.08.17.23.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Hulk Robot <hulkci@huawei.com>, Wang Wensheng <wangwensheng4@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 61/63] powerpc: Split memset() to avoid multi-field overflow
Date: Tue, 17 Aug 2021 23:05:31 -0700
Message-Id: <20210818060533.3569517-62-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; h=from:subject;
 bh=JCECg/Hewr4d9JO4WQR5kDd0IjByC1o9V4GNPJaYPKM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMrEHk87hiQVCzgI18EL/HOEsDc4MJhIkHkaVTZ
 DZKWkUOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKwAKCRCJcvTf3G3AJjKnD/
 9vO5rK1NcyiJFD1V1xX5Q3QwJPN1EMRWYcJsr5dTRrhYDef2VBoAd3vGVJhv5tPWCziVR95zI+LgIL
 d02IU4Ow0Hf/RnPFBOD9Lk1pR4bdZqy2udFH1tE06S0wBxz6HBgDxKiHg0hd49XAZs+xsJCSVXM+ks
 ZJe+gXBJkwU0QQlyx97a3srOeF6TBCIwRbfsc1ny8kqeq7rHXhuez2Nl/jEpDrSY7P6MGZ0RS9pwGp
 BG8XE5jwyatTqBbwztRYJO6EDxF1oljeN+vw6wXSMzHTs0P0jZF+xhBsDePue4SrU1uYVK4eI314VF
 ytJTqzumiq1LoMoetRo7XbnZL9HC+8KQkD7iex+cbwbl0vBuTQNERQCXbWiuHcR7WbrVndhdzqr/qr
 7kpYWqqHhGYN42VOTCoEV+CxxyGt6O1oEwupEs9JwlhAHT0ET/3m5v95ln9sj4q/idsJQyugW9w9wS
 B+pdNyiwZvnrIR6r8PjnSHwflJuJYyRkP28Ci+HZxNLOE9WlE6UmnuDmdrcVKpWz+nctnlPQ9JHhAq
 vpfGhXMnm0qF1zx5IYh+d69+ZRtUQbUKz2k4hFKSxvSse3CvWfi63pBT3m1O556umLnQD6zZbq4vQZ
 p0vLhJOR+anh57gwE1CG5ilwh9jU07xLpPrNzUQkHrIgJsiMsfqPJrC73E9g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Instead of writing across a field boundary with memset(), move the call
to just the array, and an explicit zeroing of the prior field.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Wang Wensheng <wangwensheng4@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/lkml/87czqsnmw9.fsf@mpe.ellerman.id.au
---
 drivers/macintosh/smu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 94fb63a7b357..59ce431da7ef 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -848,7 +848,8 @@ int smu_queue_i2c(struct smu_i2c_cmd *cmd)
 	cmd->read = cmd->info.devaddr & 0x01;
 	switch(cmd->info.type) {
 	case SMU_I2C_TRANSFER_SIMPLE:
-		memset(&cmd->info.sublen, 0, 4);
+		cmd->info.sublen = 0;
+		memset(&cmd->info.subaddr, 0, 3);
 		break;
 	case SMU_I2C_TRANSFER_COMBINED:
 		cmd->info.devaddr &= 0xfe;
-- 
2.30.2

