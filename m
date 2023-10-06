Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4B7BBDD2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 19:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B9E10E555;
	Fri,  6 Oct 2023 17:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F73210E555
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 17:32:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690b7cb71aeso1894913b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696613529; x=1697218329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uht+32O1H7tS91EbXmyBFBF49QB3RXcTs2kBCgDMo1c=;
 b=Dr3py/5AoMhAdNiKfJ4g0jztL0JlXwSzLWt0StXESBU7v2Bsnxf1by80kuzqPhn7BR
 mQJUP4y/30mDmYYq+48qgrRnSrCq5LA3/JKlYuXzb92iPOdRJQPb+EYBLPs6r3uH51q9
 99QzLLKlM8uxcga6fP7WcLucagDQaouAKLf9wWgQLpj0O+VntdIJGZB4T/LK1/uJcqE2
 s/o9r2DrfjoGWt5KvKEwGpdF/p8AA0CmLuMSqukoQ3s7ExfsKoJUbSk5XlxnJ3i6pKi3
 ghSkIG6h8G/zs+xWQQpu+pIioR2Y5CVYFM3vfw2yPSxbZOuqWfu4+DySJrpKphX7478Y
 LIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696613529; x=1697218329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uht+32O1H7tS91EbXmyBFBF49QB3RXcTs2kBCgDMo1c=;
 b=RuNnkUTOSq7N33hIF+KPVHUb7psUg3lbKDYQNNuidSNY50CfoZ4nluL0l49dffri5a
 sEFt6AzCborlDPGFras1hbU14m6xxaM7JN4q+c43I+l9uoz68GhUg3L+WbbJ23+oT5F0
 jmpmPg5/rt0G923Zr846SXvXBrRITIbCm/orPQdEdjxcxS6oqNjZkztJ+88NX92e0qSx
 snD6Bc5ieTFVkO2/C5jpk8OFLBP4sZaLCbE+KsrvGYX3A1fwAtei/emneeWyeO4NOMJU
 s+wXOPf8JfrNyLjR3H/T9G1xCcrQUoxlDQlbxxet/7FzRV5IrSzXlV4GU6lMTATwdYNo
 EcOQ==
X-Gm-Message-State: AOJu0YxRPkj6mizZiiIea1KUToIi2GzuqUH/tfHaWukZHVoZUWNxSqFl
 8AkZ3Ee7RDyR0vx+I/Xr0kOaJBtfYhg=
X-Google-Smtp-Source: AGHT+IF03+UeFYlMbGjpNfhcVQTy2jzlGLfhtzouZi5hnhM3IqftqKCIAYKKX1oupjvWcd0yojLG1Q==
X-Received: by 2002:a05:6a00:b82:b0:68b:a137:373d with SMTP id
 g2-20020a056a000b8200b0068ba137373dmr9853667pfj.17.1696613529169; 
 Fri, 06 Oct 2023 10:32:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a632402000000b005898e4acf2dsm1577574pgk.49.2023.10.06.10.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 10:32:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ci: Default to UART for logging
Date: Fri,  6 Oct 2023 10:32:04 -0700
Message-ID: <20231006173205.371205-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 open list <linux-kernel@vger.kernel.org>,
 Helen Koike <helen.koike@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

ssh logging is the default for mesa, as it is generally more reliable.
But if there are kernel issues, especially at boot, UART logging is
infinitely more useful.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 2c4df53f5dfe..7c55f02f7313 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -27,6 +27,12 @@ variables:
 
   LAVA_JOB_PRIORITY: 30
 
+  # Default to UART logging.  Mesa uses ssh by default, as that is more
+  # reliable if you have a stable kernel.  But kernel CI is more likely
+  # to encounter unstable kernels (and has lower volume of CI jobs so is
+  # less likely to be troubled by occasional UART flakes)
+  LAVA_FORCE_UART: 1
+
 default:
   before_script:
     - export SCRIPTS_DIR=$(mktemp -d)
-- 
2.41.0

