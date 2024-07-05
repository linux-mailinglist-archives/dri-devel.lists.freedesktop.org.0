Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE80929826
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 15:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289F10E035;
	Sun,  7 Jul 2024 13:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="AyuCiSXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B68610E8FB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:38:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so9681185e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1720172326; x=1720777126;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to
 :reply-to:from:subject:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Si7lKvkL3/rRvUKBQJf++lXuz9T94RjR26RNcqf2OuM=;
 b=AyuCiSXLrZj+Gh6+K9S6prqq8dsX3cQWzEG0Q7D/WaXcjTcutwjhM4oN413gCgCNE9
 0TQU5JQZAtQG+6kxlK+uTYgPySgAJ+8elDdx2DH19c6yVTc4XHtMUdwnE52HDHnm66gP
 gpaW40idW4GprSnFCposchi/tO4SQZt0kcpqxxH0PIa4wkGh/KXZVPjA7fYCPOrQ5fi0
 aMuYCoZiwoPxlj1I+OZP0f0CWfHAzLdG48Pn1eth2YfslcHAgH59nILxsbecXsRhuoco
 0ZSBeKKesGydtc/N8UGWNCbqQWjirYXSsq53YwvHEtx6Cp59PpgIPsDfcJfdFoxbsjvQ
 vXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720172326; x=1720777126;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to
 :reply-to:from:subject:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Si7lKvkL3/rRvUKBQJf++lXuz9T94RjR26RNcqf2OuM=;
 b=vTA5OA8mMR3UhEpzKIhOHikj39/QzMENStRyRYidx5Eu9OPkpxj5AADn52Jj9gm5rj
 L1a0v1gsotV4LUKrfa8IvJseXTTyMCIi5Cp+i6StF6p9eY1gvvQbT0J/T5HFicvKVTXI
 /fffNx7H5cXjS+uLIs9DV2UmJ1uL3w71uphBKe0XaQjKUNVObkerQdC5wbHP3ZLPqpXs
 w9v2ykGWF0lfzJ/m/JF50Q4QuR2cjA5x4CLwsoHKQ/6OmtNLL6/8HeiEr7evbTZZ78gD
 NOOMeixmLSkBZ++1WzJg2N6VsCk+6NGSHWaRoqUtsc+ZiQ9VzyZ0cyOGoUQrqXntnOEl
 SrFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxGhkgFVeXYlXmCWHl7uMwtQNwNNgIDff7l++SJERa3LsrDOqjOWqDKmDetR8JrVkB5nsW+wGDnWgeCMbIzT5EuxbekvXWQR7v4Qj4T22o
X-Gm-Message-State: AOJu0Yzwo5IKWTP9y5CbRK+ad82b4y0pHcRSCPKy7Hs+Hfi2idm9cgk2
 Fu557RvYo3k3mlN/Hg08hSgmmaNXWU70cG9XRYQxhq7z+6AiD0ux
X-Google-Smtp-Source: AGHT+IEVQ2yzqJ4bfKosA62iERG+Zje0okNgh7+Zr98qYlyunlopaHJcgBqpEKXmPcrRss14dpqkFw==
X-Received: by 2002:a05:600c:364d:b0:425:5f6d:b4a with SMTP id
 5b1f17b1804b1-4264a3e3182mr27181835e9.9.1720172326193; 
 Fri, 05 Jul 2024 02:38:46 -0700 (PDT)
Received: from mars.fritz.box ([2a02:8071:7130:82c0:da34:bd1d:ae27:5be6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a21cbc6sm54721515e9.24.2024.07.05.02.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:38:45 -0700 (PDT)
Message-ID: <6a7293bd06942131161c5a7b7878c51cfbbb807e.camel@googlemail.com>
Subject: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Liu Ying
 <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 NeilArmstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Nicolas Boichat
 <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>
Date: Fri, 05 Jul 2024 11:38:44 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jul 2024 13:45:08 +0000
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
Reply-To: chf.fritz@googlemail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the transmission of an EoTp (end of transmission packet) by
default. EoTp should be enabled anyway because it is a Linux necessity
that can be disabled by a dsi mod_flag if needed.

EoTp signals the end of an HS transmission, this adds overall robustness
at protocol level at the expense of an increased overhead.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-mipi-dsi.c
index c4e9d96933dce..0fb02e4e7f4e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -722,7 +722,12 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi =
*dsi,
=20
 static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
 {
-	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
+	u32 val =3D CRC_RX_EN | ECC_RX_EN | BTA_EN | EOTP_TX_EN;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
+		val &=3D ~EOTP_TX_EN;
+
+	dsi_write(dsi, DSI_PCKHDL_CFG, val);
 }
=20
 static void dw_mipi_dsi_video_packet_config(struct dw_mipi_dsi *dsi,
--=20
2.39.2



