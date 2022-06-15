Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E754D484
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ADE113926;
	Wed, 15 Jun 2022 22:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345E911391C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:25:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id s12so25932891ejx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OPpdUjGRZZkJcBOgKvfJS/uuetRCNbFJlRDAPw4R+Yk=;
 b=kSsI9SMqHAQ1CDKJbcb3BpS5M8YGxijeJP/J5mMfyxoebkxevCW5/dqT+Vbq7+QhSC
 Ts2SFYywtP0SqCV4d12ODyi44me1JaplsF/6eTMNzuJ1jasothkrun2lnpxYkARUf35w
 YiP9vxT2AObIEM5y7KD12/+ef+ROn+gapoS21WqKTPEExvUKtCklqNu8dpHX8ONTdnum
 sMzzjgEvrXOOR/CsqfgnQ6wgBjiOHHFlZywo0Rlk/0iWhwmMzrLKelefffBEmnA+IXoA
 kqYODG0IcP9tFxeEFXf3BAOFuoaB96wax/oMv58PvVdn1AxDIEPKB4AyH8wnEDPZszTu
 HZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OPpdUjGRZZkJcBOgKvfJS/uuetRCNbFJlRDAPw4R+Yk=;
 b=FFEMBTbc4b68bidqNgXaZ57aOgtAA/sWYJV2dTjjIUmMFzcDDwoX4IT6TobgsM49fw
 rN9VCIlJeAFDhPkzvBZctItY12VCHr3sPMJ3d6ROYxQiHa15ZhklDYYbxFkO0v1yAgNY
 uLyi29n8MSZsAej1z53vugm3TRZOo7hUTGgUxir1n4WXMxOGWz3kclP1ECSt8iDJG7fg
 rC8qY5JlPU5vHBGBcgqOL7vV7iYmQIWSEUDCuN5p7k+Kq3Hm7YwlBNKgdbBbclTCF3r4
 sX1gpMLkkzufvlDemBzoLncPiRjwB1jeznrRHa8Cbqb5+txi17kYtkBhJ64uyD1sV9Yk
 rVSg==
X-Gm-Message-State: AJIora9iYF7hoLiFJYiaMy6vWCqABO7WhcdQolJBLBfYuUWTDcX+ukQE
 bvWr0wTTzjyLZROWqJr2BcA=
X-Google-Smtp-Source: AGRyM1vI/D+O4LZ4ySsC2+t6KUGm2z97f1pkIxRNL4gT7CNUTTTXahnM/pWVAC43Oc7OnBhS3MbFNA==
X-Received: by 2002:a17:906:73d4:b0:715:701c:ae96 with SMTP id
 n20-20020a17090673d400b00715701cae96mr1829346ejl.50.1655331909687; 
 Wed, 15 Jun 2022 15:25:09 -0700 (PDT)
Received: from debian.home (90-180-208-18.rcn.o2.cz. [90.180.208.18])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056402358300b0042dc25fdf5bsm350427edc.29.2022.06.15.15.25.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jun 2022 15:25:09 -0700 (PDT)
From: Jiri Vanek <jirivanek1@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 1/2] drm/bridge/tc358775: Return before displaying
 inappropriate error message
Date: Thu, 16 Jun 2022 00:22:20 +0200
Message-Id: <20220615222221.1501-2-jirivanek1@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220615222221.1501-1-jirivanek1@gmail.com>
References: <20220615222221.1501-1-jirivanek1@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jiri Vanek <jirivanek1@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function for reading from i2c device register displays error message even
if reading ends correctly. Add return to avoid falling through into
the fail label.

Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 62a7ef352daa..cd2721ab02a9 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -339,6 +339,7 @@ static void d2l_read(struct i2c_client *i2c, u16 addr, u32 *val)
 		goto fail;
 
 	pr_debug("d2l: I2C : addr:%04x value:%08x\n", addr, *val);
+	return;
 
 fail:
 	dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
-- 
2.30.2

