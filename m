Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0FB3B41C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE3410EB5E;
	Fri, 29 Aug 2025 07:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Buvlu/J1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2051610EB4C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:36:13 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e973f268b07so134309276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756449372; x=1757054172; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIYcdGfd/N0Y7hEFXW14y1n0UaZQpTNZtxJVAnkglXc=;
 b=Buvlu/J1nrZ+DDgi5KAISjzzx0u7v5Y9UTTO/sr4RpRKSQuxr6hZRi6keb6yNndpVI
 fJ1N49LFGZAtf5qaKVtcq4WwKiBTwc80nrOxl3SQMzIXZNuGxo2jC8Kr4cu43OmY0RLm
 Llz0liyLZubQsGRQFJL1q9G6cQPttnwqpw+ZQf482PAnFKgFhYifTIJDuONG0UrkPctA
 Hr541/7HCarJsFe95mzgkujDidmaluXpR+XyIjwQVfJlw9SLdgrV6i3WEY0KOWwRyuka
 z7DBiW2PQzOsQOdnqtFtwFufPDM5f0iOuInuQclP8Z/q1W9Z3C0lWu4qRT30e2KpJDcN
 Bsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756449372; x=1757054172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIYcdGfd/N0Y7hEFXW14y1n0UaZQpTNZtxJVAnkglXc=;
 b=sv4Ot+UFvrT4BtKlwqMMooYxx9xnuiftnGi72d821b+EeT3hYptFdfELMo6RNq141x
 KI8feByRd9dY1QXCvLL9txOgCWkM57mR1k+Dz3GcO0YvDioUTSsvIKJR5M9R1uXnx2/j
 BmclkA9rdElt8OggIeiS9eOPvFLT8MRFN0YwK/rDLo/TQdOejlTeSNCdh3dMPMVgmS+4
 UluN2ZkwclICcK+16qeKKhYvMd7H/I4tOOqkAi+eKPgcYm1FyXXYL6awNHWbf5Sc7Rkk
 8TiblDV5jN1WY1PbCTrRui4NhtFKwwHAWIJHnNF1Y6dsZmNqSRcrza0smguiRmcWpypr
 rszQ==
X-Gm-Message-State: AOJu0Yx1ZTma110hDWznKyq//XYUOzJyt9JpJQz++wVkXOWlMssru3C3
 jyxix7tRo/SiAO9BvQgH6AU6L1qBY4i87inBPl9Xtkx8HeRH45XY3iyL
X-Gm-Gg: ASbGnctCWb0c/ctxCObeuSqxOYK6uvaqIjfXCV7tjKGB0mKOkg7zSwk7F8QPzO1QWCL
 SkDmLg+N/tbIFxuBiqRqh5nO2fI0KG7X3M66N38DqF2qCTSBrjUPoeu04IOLiUr4oJxGvFD8ghf
 opEPMNMV4Oqv2LlswuvwQZdhkJ9YcwnbkQXiiaDwxjyhuQ13WfHuQHHTk1uup322fwfoYyr5Ygi
 2m2GYeNIZRlBTXXtA4Oi6/qBQHYU+hv1aT770EfGMeM+ZuZofk+RWxXIDnMY91SAv0AsyG0y8EH
 eb7kRoCxYnP7Jx5ZTZSbHujtO/mKxtFV3gB5BDWdZPGwdqr+9LMyvi2LmfRLUNU+kl/jd9YoOzg
 C2BJQ2hm9JeTvqWpbi7JCx4VOTc0tSV9RtCuL1nwIZjuHapFEHrzSOPKHseH02VBXip4G9RkHsq
 Jtlq8IFelahIck3vs27Be++s2aU5dS6QH4WJOag1mlmOax5g==
X-Google-Smtp-Source: AGHT+IH+lR+hABKYAFxx7DdPXWQevTkb0HrCtdsfZ37CvrqzSheWlkul+8CbBDZRN9eqKZ7fKHsSGQ==
X-Received: by 2002:a05:690c:d8d:b0:721:22ca:695d with SMTP id
 00721157ae682-7226a181ca2mr1421607b3.0.1756449372100; 
 Thu, 28 Aug 2025 23:36:12 -0700 (PDT)
Received: from mamin506-9800x3d.attlocal.net
 (162-197-212-189.lightspeed.sntcca.sbcglobal.net. [162.197.212.189])
 by smtp.googlemail.com with ESMTPSA id
 00721157ae682-721c634e68fsm5093557b3.23.2025.08.28.23.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 23:36:11 -0700 (PDT)
From: Min Ma <mamin506@gmail.com>
To: lizhi.hou@amd.com
Cc: dri-devel@lists.freedesktop.org, jacek.lawrynowicz@linux.intel.com,
 linux-kernel@vger.kernel.org, mamin506@gmail.com, ogabbay@kernel.org,
 quic_jhugo@quicinc.com
Subject: [PATCH v2] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
Date: Thu, 28 Aug 2025 23:36:07 -0700
Message-ID: <20250829063607.789-1-mamin506@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <09906ca7-62c7-2ca7-5436-662a6c4b19f5@amd.com>
References: <09906ca7-62c7-2ca7-5436-662a6c4b19f5@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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

I recently left AMD and would like to continue participating in
the review and maintenance of the XDNA driver using my personal email address.
This commit updates my contact information accordingly.

Signed-off-by: Min Ma <mamin506@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..6eefa494000c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1231,7 +1231,7 @@ F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
 AMD XDNA DRIVER
-M:	Min Ma <min.ma@amd.com>
+M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.43.0

