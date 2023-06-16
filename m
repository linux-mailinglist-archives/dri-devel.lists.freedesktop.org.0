Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B57330F4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026D10E608;
	Fri, 16 Jun 2023 12:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234F610E608
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:15:08 +0000 (UTC)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 15BD33F04C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686917139;
 bh=m7ySH3JrcTV8+yw7ueBFG47cxZsJ9e+MajPgheIKd1w=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=sgvBiES5LemzjKmE5arXKRcu7Tc5bUYOste+4GM84XMboqjj399vY+XAcF+GxVqLr
 J+YhN/FibZAZUhdkseItgGZNB74pE+o9t5A1zcfycYX693rh1/o3FEUO3vtohA+2gj
 nR/MiSi480xNUKe0zUl6e7TJ5aOFeKJAIpDpn1y4khNo17oF0GhXVeSP4rcQ8J5Dfx
 fO4p2VvrUTT0GA966CJ5h8efNMnbqq6hlWRABd+W42PBKcrmRU3P+0oQttw8UhZHkU
 CQLIuLC0SCH4EqQ/BMgCwPjJOxJYswOuti07KghoNB3bUZxCUaBCJxhZAGRLxryCdD
 F/h6C/LSKDUQw==
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b45e987207so523161fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917138; x=1689509138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7ySH3JrcTV8+yw7ueBFG47cxZsJ9e+MajPgheIKd1w=;
 b=LRDyEo3xCMUjErGc3cCBOrqjVovxzm38dHVX/jf0D0TC/MZ3s9dDB4HBRv80Jew/5M
 SC8oqnJtUa95H+JuccFaXfPT5Q9uY79Rm4Xtg2e6tCcHKze9eMXGQKjis2htpCgwNFxj
 MVbTu2zJti37rvto48yKbyg9HA5dkR6Sds02ptcXmgVzkqxEmo074257PI/+eVkXfBsd
 1kmDHbrD01huP/phEbdYUiS+Dx9VHHMoqQdmteR2JsNI2u9U2hKqwbBFsmInWfwCmDvt
 g7Ub1EKIzN8YVTYFeaM/MplYjSNKaNDxFfQKNtYPp3w0V8r0AUk9mbSpvRfV28bfGF5v
 8WsQ==
X-Gm-Message-State: AC+VfDyZyycGAtpJUbiA/JtNYNDNzOqix4R3WzwiAg4VIHkakxF2Pr1Z
 TMoUkzW7h2s54zKm3ILvBxmmAv1+jhYPtSGObOTyDa3aWkkt5VwKhEhS2Y9zBDqwHXtPAjpkvmw
 LWZVe2nXP/tgeJK9wZ4t6sMCplK1BO1wmGo5HtOdEd6gfYQ==
X-Received: by 2002:ac2:5f9b:0:b0:4f3:78c2:2a6d with SMTP id
 r27-20020ac25f9b000000b004f378c22a6dmr1288644lfe.3.1686917138628; 
 Fri, 16 Jun 2023 05:05:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75fXyeKCuznl3pidwrqckduT+X32ZYDJY7P5oHI98szTnf3jjwPSD9DqOJGAXHWnqzY1XyWA==
X-Received: by 2002:ac2:5f9b:0:b0:4f3:78c2:2a6d with SMTP id
 r27-20020ac25f9b000000b004f378c22a6dmr1288629lfe.3.1686917138336; 
 Fri, 16 Jun 2023 05:05:38 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 c25-20020a05600c0ad900b003f18b942338sm2068082wmr.3.2023.06.16.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:05:37 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: deller@gmx.de, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: metronomefb: Add MODULE_FIRMWARE macro
Date: Fri, 16 Jun 2023 14:05:29 +0200
Message-Id: <20230616120529.1028798-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
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
Cc: juerg.haefliger@canonical.com, linux-kernel@vger.kernel.org,
 u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module loads firmware so add a MODULE_FIRMWARE macro to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/video/fbdev/metronomefb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index bbdbf463f0c8..4e50882d080c 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -778,3 +778,5 @@ MODULE_PARM_DESC(user_wfm_size, "Set custom waveform size");
 MODULE_DESCRIPTION("fbdev driver for Metronome controller");
 MODULE_AUTHOR("Jaya Kumar");
 MODULE_LICENSE("GPL");
+
+MODULE_FIRMWARE("metronome.wbf");
-- 
2.37.2

