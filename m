Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA158BB51
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2FD8D267;
	Sun,  7 Aug 2022 14:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B7F18AD12
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 14:08:03 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so6915799pjf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=XLqwqki/k3C7u8+512qwgIHUnUs9SX352ijc2YXNmyo=;
 b=Q6xwZS1QliChNp80WlGV80Ap4InNEJovH7Jy6o6SyJqeKRTZRjMzkQ3IaPqKN2/oiZ
 NtIAzyBUPcur0U6Xz4C9RG4n0q8AJqXw/cF/QfxjZHZoGBd9SgdQA5Iw8lhzSntBZqrP
 trc8/tdrb9kWrd5SUOg1jIRAjwr6eqEp1/cygeAXtANwXaFIvfkmRrCR7qgsQmfMB9xH
 G9vstMwrj5hlGa82r3NTggYwm/lDsATHEeoI5tsXVuKEC/I38L+Kba2mf7+EC4gg+eKc
 ugdIX4n+oVUzK0ikxT2vKpwzX8EzglcNFVeQimDSL8nlmN9qXSFFrOlOhGRBZ5XSBTRg
 9DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=XLqwqki/k3C7u8+512qwgIHUnUs9SX352ijc2YXNmyo=;
 b=B3FgD0Nb6YhJ0MYG4/SjX7lZzPtO++SNuIEpbq+S5jCEkEZxyZ4kOy8w8eCO4iNp8I
 AXe8Gkq/oXuRyDN3ruv0qpiAWLidilqvne5p3WHuo2DM/SJLLGvGznYMAKF7cduydVKG
 IPMgKP2IH9BUtcA6BGDTNLGnpCPwkpEPjKIqd7H3ZjXStoekMwKYEKR0RQOT5ZQjCs/z
 hWXJex4WxeyAMqoQEPKqvW/qhCd+spY1RmIP311Z7/fj9WTGQ2ehXMRxr26CdftLYhGi
 LgaWmgadDqD6+la8u0VVeNTckw5VLq6vEDCxKt7zZtXs7LdwJE1pJ721RRuTtYb/pTmb
 /j3A==
X-Gm-Message-State: ACgBeo1mz+1tWxqF25wIv1JwVaa857k3TVxGN31mAq/zU8EPPSJQg1W9
 8aMi19g0KwYXZ5WNxr2KBuE=
X-Google-Smtp-Source: AA6agR74Eu/frAH1DDF2DIi5PzdZPd93fll6q/Qkq8cKR83I4ccQyUB0Hz/ey+pGN/+akI8HnQZPDg==
X-Received: by 2002:a17:902:c406:b0:16e:df76:5267 with SMTP id
 k6-20020a170902c40600b0016edf765267mr14922969plk.8.1659881281763; 
 Sun, 07 Aug 2022 07:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2409:11:2360:3e00:d7d3:6cf6:2642:4646])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a635d4e000000b0041d322b3bf6sm2761133pgm.77.2022.08.07.07.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 07:08:01 -0700 (PDT)
From: Robin Reckmann <robin.reckmann@googlemail.com>
X-Google-Original-From: Robin Reckmann <robin.reckmann@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Date: Sun,  7 Aug 2022 23:04:54 +0900
Message-Id: <20220807140455.409417-1-robin.reckmann@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 07 Aug 2022 14:47:23 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, Robin Reckmann <robin.reckmann@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix i2c transfers using GPI DMA mode for all message types that do not set
the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").

In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
and it has to synced back to the message after the transfer is done.

Add missing assignment of dma buffer in geni_i2c_gpi().

Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
ensure the sync-back of this dma buffer to the message.

Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6ac402ea58fb..d3541e94794e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	if (tx_buf) {
 		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
-		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
 	}
 
 	if (rx_buf) {
 		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
-		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
 	}
 }
 
@@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	desc->callback_param = gi2c;
 
 	dmaengine_submit(desc);
+	*buf = dma_buf;
 	*dma_addr_p = addr;
 
 	return 0;
-- 
2.25.1

