Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DA5EB773
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 04:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D86E10E0CA;
	Tue, 27 Sep 2022 02:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03F310E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 02:18:40 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u59-20020a17090a51c100b00205d3c44162so1082187pjh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 19:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dZD2Q3sJnT7LtqyYnQOsH2aHhEx3TviV9Oc+ahsq2us=;
 b=GhCkuBE/fHzYH5gF0AE6yQROWfKQZpwIzbVd/3JlWvKeILaZfA2vAIE5mSMY2eo+Vy
 0quWl57+5MjcqRup+fn6FNfOEuqEOFiHMh1vB+WdKzi5azE7u/pkPXpeDiroIoFLBcYD
 qpBeOOkemLQH7vQcL1k3s6yS3sScqQpTlIpS4cF870MbbXflIufLnjKhDi9s2Y9qqlpy
 UE+cRTLvCM6X3zenCUOq12fsjgouNtFF/FglVwRVN5J3utjGJ5rSzViBohLTfK/02Tkr
 XRvrxWzuu4EnR3aDJiwhz5jXI4OE/9YOGZWMDKTZ2T3wtfEGexg2LsvmrF0xeehOKpGk
 kCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dZD2Q3sJnT7LtqyYnQOsH2aHhEx3TviV9Oc+ahsq2us=;
 b=jgy4RazDFSaNbazr2CUCPkLiauIMBP8XPfzw253YCctAHFLz3NTo3O6vGhzjK7NRXJ
 OwJjct7KHdrNKx3+Op9B1hTpTRIskooG3Mvg+8I8JRkFKYwLfJ7WSbIoY1M7c4rMJcgu
 PPLrPn2sfufvuhkapoPHX+1dcf/0v5SDc929oEgDRyOrtpw7m0d04KXSuc+AxJS+SX52
 soXLaVFkLcKMUkzc5+Cc4Zg9ghzyt77osyMRwB5N8get747sEmI5hfzLQ4OzsoJxVXuH
 hut5/KxEq+ba5H3MgfVdZV6ll18loz40CdYZwfaKUSNCJGMm1cXXMySDH3LQStSDF78p
 8Y2A==
X-Gm-Message-State: ACrzQf0HpCHl/Ism8RSlroPlhSQNt0ktSr+skTdG52Q5o3a2aCIEjYAb
 mdrGmmNlZJUD0JxjoI8BtxP/2A==
X-Google-Smtp-Source: AMsMyM593Juk1zH98oEDl8t13zXBDlUN69CYGKGRf6UzGixRbC0Zp3bCpxxMatnnfxJ6+L2oxJ8ALQ==
X-Received: by 2002:a17:90b:38c3:b0:205:d6b5:582d with SMTP id
 nn3-20020a17090b38c300b00205d6b5582dmr1275417pjb.229.1664245120262; 
 Mon, 26 Sep 2022 19:18:40 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a17090341d100b00172a670607asm101844ple.300.2022.09.26.19.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 19:18:39 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panel-edp: Fix delays for INX N116BCA-EA2 (HW: C1)
Date: Tue, 27 Sep 2022 10:18:35 +0800
Message-Id: <20220927021835.488803-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel has the same delay timing as N116BCA-EA1. So, fix the
delay timing from delay_200_500_p2e80 to delay_200_500_e80_d50.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 102ab9f5d40a..e25851de7954 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1893,7 +1893,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_p2e80, "N116BCN-EA1"),
-	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_p2e80, "N116BCA-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
-- 
2.25.1

