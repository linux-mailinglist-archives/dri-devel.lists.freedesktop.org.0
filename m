Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E23B71EF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC936E886;
	Tue, 29 Jun 2021 12:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C556E886
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624969051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lkR0c3+f759b1MBukw4/QJ32vsAA4j16pgDMpxfOoYw=;
 b=KVch8IkTcumULFaX/ji3JqQ2rgmpiV3mene/gys5iNktB2aHqtMjFT12sBxRfJw7S0Db5O
 GOesuxMQVcWrO2299vhCzKBbf4xEqdBU0nbkac5bU1X/xMFVCNXKAa9p2c5Ca5bCTgqG4A
 Km2j5SvFRlM23M4J4lOQ6Us/ffRlO5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-6hmcYV3mMkeLMidu3keaCQ-1; Tue, 29 Jun 2021 08:17:30 -0400
X-MC-Unique: 6hmcYV3mMkeLMidu3keaCQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso1225438wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 05:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkR0c3+f759b1MBukw4/QJ32vsAA4j16pgDMpxfOoYw=;
 b=HS+5ThPUecJEERtfXx640As6+Vhr7IMgitaRyvQJZUkIhrhMwLwECLR3x4xqh8XlKc
 j7hkfRSLncpb1c3U1oRb4eVz2RuNO5srYvcK69cMyv/I2Nx8HVkhYi9sRC7GMP5KKycM
 8ufwggegwgN5v2+pSRi9BtSUBQwQPiZYLRl53vq1ER2zZfBE8RFXKVA8Hw9MBzV3ria7
 HEfPqyqmSZfsLxAkGlNFSFufOQ8lNn2oQBmXoI3KbM5S8cVFOY4pU1Ce0YjRd3CfS96L
 yAlYNMp5CVCn+bfuZSwPoJwq1UdQi5xHlS8ESMI03Lj9ygSlgfIjDuCNk8hmCPAxGVP6
 3Q3Q==
X-Gm-Message-State: AOAM532uQNJptAEkxhUjbs+pFPAx8DMoUHQ2R5oFNX/Tl6xzMGFyUe9G
 sr+fwbWoDBSjNBs4dAljWTBUaWq3/lBEyaLB/wxG0vVvMs0b6yXOR3N5AEIpGAhti0X1Svfk37y
 AArMvup9PO9JHgiE0+i+bACn/YoDJ
X-Received: by 2002:adf:e449:: with SMTP id t9mr34362155wrm.40.1624969049201; 
 Tue, 29 Jun 2021 05:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2WLVKTxMcFRD6jMJdil31aytKHfmkR8Pg4EuSGDVn0CCstL4X5a+bn1K/4I3JTHdAqKPP6A==
X-Received: by 2002:adf:e449:: with SMTP id t9mr34362048wrm.40.1624969048091; 
 Tue, 29 Jun 2021 05:17:28 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:3d14:2800:933d:abfc:d8e4:637f])
 by smtp.gmail.com with ESMTPSA id t9sm17032631wmq.14.2021.06.29.05.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:17:27 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: mripard@kernel.org
Subject: [PATCH] drm/vc4: hdmi: Limit noise when deferring snd card
 registration
Date: Tue, 29 Jun 2021 14:17:23 +0200
Message-Id: <20210629121723.11523-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want to print an error message each time
devm_snd_soc_register_card() returns -EPROBE_DEFER, the function will
most likely succeed some time in the future, once the missing resources
are available. So use dev_err_probe(), which will redirect the messages
to the debug log level in such case.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 04936cd6db8c..32da45821d3a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1575,7 +1575,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	snd_soc_card_set_drvdata(card, vc4_hdmi);
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret)
-		dev_err(dev, "Could not register sound card: %d\n", ret);
+		dev_err_probe(dev, ret, "Could not register sound card\n");
 
 	return ret;
 
-- 
2.31.1

