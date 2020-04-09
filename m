Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7CA1A2D5F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 03:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD786EB2D;
	Thu,  9 Apr 2020 01:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A146EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:39:50 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z12so689607ilb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewtCInM8nEmpSAWUn/DBqIFeJ4ym9ptgX8O4ZJLIHVQ=;
 b=uaBSjpfPM2kOUDpJh01JmryoRjCzUNNnoiIy6XjeOgMLRHVsT++PUzDFoEXy10nCvb
 D7GRf9KSLJrF//KpxU5lgWUk6VVFE7JPKDdxxnMxZviWkrV4LNVRNXDbD+MZIyUDq+Wk
 qm1Aqt064y8Y8qmHkyg6QrW96s8Z5FgDN6nEUjEl29PdH5nOS8rrpupP4LWCQ10lLkyW
 Do3adncOtA4jGNn6xqyh+tTu0Y0agexjKzIDWXxhV1HvoLuHZ2zSaPqJ5fP2+P0CKPj/
 h8uEtfQdGIlFlcTNxjdxWwCwIRy2GpX7AwxmuVLdYxXk2HT62wd1iGbG33pTEpdhU2dA
 cdsw==
X-Gm-Message-State: AGi0PubYq0VAYdF0KqmOnBB7uNZOZ0LhmnHrGCuxXOkKcvxfi+n+sQnU
 JWRRR6WAAG2vv0NZlirNkUp+wak=
X-Google-Smtp-Source: APiQypKR0YMwJyuExe/Sh5V0CyqboiDCKQmvfWo8ABSu6tyJC6F2R56d50RjeC+lCnc7SS28BjaYYw==
X-Received: by 2002:a92:c00c:: with SMTP id q12mr10752599ild.125.1586396390238; 
 Wed, 08 Apr 2020 18:39:50 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id b5sm2353026ilf.23.2020.04.08.18.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:39:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/3] drm: pl111: Fix module autoloading
Date: Wed,  8 Apr 2020 19:39:45 -0600
Message-Id: <20200409013947.12667-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409013947.12667-1-robh@kernel.org>
References: <20200409013947.12667-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a missing MODULE_DEVICE_TABLE entry to fix module autoloading.

Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index aa8aa8d9e405..7f405b1374c2 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -444,6 +444,7 @@ static const struct amba_id pl111_id_table[] = {
 	},
 	{0, 0},
 };
+MODULE_DEVICE_TABLE(amba, pl111_id_table);
 
 static struct amba_driver pl111_amba_driver __maybe_unused = {
 	.drv = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
