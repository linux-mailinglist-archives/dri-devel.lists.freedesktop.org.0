Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE76A3F2E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5F10E3AA;
	Mon, 27 Feb 2023 10:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687EF10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:08:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k37so3894665wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
 b=MKohpDIz/S4Xg0x+X2KcU6t+pMtWw7x7aaCBC2MuziRcvdD9XfqUHYeXhiW+W43YBB
 WZMmSFC8bnLjoEf2XKmsxlNiDJa12aaZjQLXxytckvlazf30HKg1+peTtlqEUkieTxkH
 7RmP0u7MOT/LMhQr5ob35MvXuwnWeHc2KpK5k9Y1w9qDyCjrQE6e/ad6uk4r9od+9jvk
 meRFo3eLsviVdrZhy1gPgxUFhYVVyKitnLYOpBqxNQsQ9KMBew27BcURLOZtsccvOvaj
 CiOxQ/86WpcsJ3MUUK2xAMzmKNChDfPGgcCZZT1YN6VXbFeYyi2HOscibi1xsPfBo5+Y
 S1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
 b=TdG3KHgmF6/ymcSzTX5on8IT05aIR0OJdjBWusBnhK/+n0JcEUBlqG0F+kww25Uroa
 reIxliLAteftDL7GdKsLhebnd1EH2LF0zfvtDJLaN/Ad77kkJ4KJy4smD/uKLMu8WCMB
 1s9jParoVM7rMtwm73Q84KqBzQjmWP/H1v2MywK/gUGtf7fp1dpTMM7rdjndNBRxbd10
 fbfGnmLr7OfBIJYqNDa5ZwYLvcgR/aCFJBkmc9amxVhYBgDR/CLTq9Hph9/p6QjR2NsR
 tK6Fm53eqPryaKh/lsyHss+nTWxkacdHG4bSSZhq2LXOYPY4Ok6jTym+UThoe+uvtxo9
 8mxA==
X-Gm-Message-State: AO0yUKVTmGXBxQ2kiYv7ortEgq0Cl9ItGgXIQnZpeCuLJ7wjIdz/OtgV
 IPxmL9TaBVgo9nFS3/PJXbU=
X-Google-Smtp-Source: AK7set+NctmgblTUNjstaclh3h5TNdE8Cl1slDZhTW3edmpcS7hONvoasgmxBKplOMlZjM/KqCQXDQ==
X-Received: by 2002:a05:600c:34cb:b0:3eb:a4e:a2b2 with SMTP id
 d11-20020a05600c34cb00b003eb0a4ea2b2mr8854763wmq.4.1677492495859; 
 Mon, 27 Feb 2023 02:08:15 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm6734921wrm.16.2023.02.27.02.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:08:14 -0800 (PST)
Date: Mon, 27 Feb 2023 13:08:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julien STEPHAN <jstephan@baylibre.com>
Subject: [PATCH] drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
Message-ID: <Y/yBC4yxTs+Po0TG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a type bug because the return statement:

	return ret < 0 ? ret : recv_cnt;

will not return negatives on 64bit systems.  The problem is that the
function returns ssize_t types, while "ret" is int and "recv_cnt" is a
u32.  The negative values are type promoted to u32 and returned as
positive values instead of negative error codes.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..8e99981ca0e1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
-	u32 recv_cnt, i;
+	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
 	u32 dsi_mode;
-	int ret;
+	int ret, i;
 
 	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
 	if (dsi_mode & MODE) {
@@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.39.1

