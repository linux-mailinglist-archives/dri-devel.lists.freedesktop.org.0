Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EC4D11FA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9D10ED12;
	Tue,  8 Mar 2022 08:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832B010E00D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 01:56:26 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 6so10572479pgg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 17:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2E8yu0dx7WwOCxdxcyi0NQqYJT6dBXDVWvwU57lz8KQ=;
 b=W4Vvp4Om53sRLaPMGoPv5Lw3SKc1neqXL4ODSGoSFaBNP4IX+aOSiXUdqKNhBI1OLU
 0+beRrK3uYfg8BWDrympGzCfIi66zeCPkX0fLoNA19CS/iCRkHKA+uk2vKPPxmEzNRg4
 ZM3ycFOrv6n6KdLAoJieK+TsbBUTPC4hSjCgUsCF/L8P3cmush/4rcPuiuonl0whQhyS
 RrozoUF0mcg0tb9JSS453Z5DAzB7TacoKp/s+nN6LuSvH76qiIA4wP0CKbCIMf4/5Y06
 qbmnQIzm3JdWCFW4yi5GJwB/AoB2og/tQCSEpoApP4QAURHorqMd5zAi3SEjUurw2urR
 AgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2E8yu0dx7WwOCxdxcyi0NQqYJT6dBXDVWvwU57lz8KQ=;
 b=tQR9V7O3nM8WQS1VLRBF8xjT+YSDYMJbLAE7lly3SqIicJPAlB3SFWG/J3YRvVUbJ6
 FX/e80xcHHBR6LATjpRnA1T3xG8Glzj2A5o5iJ0z37gKaR4YE87lHERv/DNH+qOQE35O
 6KtxlPkZf7rNNFMdP6A9UPNJeg64nsDWQIzSR06yfGqghWLgxdodeETKTAc4ZiM60pVE
 femoeTW3Cjyj6w/lYiaEZdRq76QWO1hxAv+Tt4eyqVnkGqMwgq2Mn+8wxFl9gyvC9nMo
 6je/+j513fFdNW1Rl5ybZM9o80u6hfjqB0UnLCNpDNDckSzjzUDWYciMEMT+ZSV6FZEJ
 diWw==
X-Gm-Message-State: AOAM532VQPOMwXltsiSefAiieG+jpq2Ywkz8Y6EMOvhb8DPc3vg1/mEF
 7RNxskZbaNrY3CU8Ya3rdik=
X-Google-Smtp-Source: ABdhPJyc8tex3nzmMFhV2LyL3qoBzinohm5njUfxL/3uqEMMkFBn6X+k9KVvHtUHpCN1RBuTP/4w4Q==
X-Received: by 2002:a05:6a00:a23:b0:4f6:72a8:20c7 with SMTP id
 p35-20020a056a000a2300b004f672a820c7mr15968222pfh.12.1646704585971; 
 Mon, 07 Mar 2022 17:56:25 -0800 (PST)
Received: from lxb-server.lan ([2605:52c0:2:32c::])
 by smtp.gmail.com with ESMTPSA id
 mm17-20020a17090b359100b001bef7e5bdffsm619629pjb.20.2022.03.07.17.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:56:25 -0800 (PST)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH] drm/mipi-dbi: Fix max_chunk calculation in spi_transfer
Date: Tue,  8 Mar 2022 09:56:11 +0800
Message-Id: <20220308015611.3007395-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Mar 2022 08:19:36 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yunhao Tian <t123yh.xyz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In __spi_validate, there's a validation that no partial transfers
are accepted (xfer->len % w_size must be zero). When
max_chunk is not a multiple of bpw (e.g.max_chunk = 65535,
bpw = 16), the transfer will be rejected.

This patch clamps max_chunk to the word size, preventing
the transfer from being rejected.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..440dc9fec6cc 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1182,6 +1182,15 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 	struct spi_message m;
 	size_t chunk;
 	int ret;
+	int w_size;
+
+	if (bpw <= 8)
+		w_size = 1;
+	else if (bpw <= 16)
+		w_size = 2;
+	else
+		w_size = 4;
+	max_chunk -= (max_chunk % w_size);
 
 	spi_message_init_with_transfers(&m, &tr, 1);
 
-- 
2.25.1

