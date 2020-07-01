Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947342104B8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E776F6E84E;
	Wed,  1 Jul 2020 07:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B358B6E5B0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 03:11:29 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c139so20840372qkg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPKcsn1Zg7byMoVV6H8vhXEqRTFirUJz5P7vuG1x+2o=;
 b=SawHkKa/kuqLOkRUBkvd8HoYa9gml32y4fAI3rpF/uzqhtlUwhUqBi8NemMpM7NfiG
 rU2R+qjmF65r98Xkm7raD2/qmh71x5R+vkhQuv/a296LccDmG6MWwEMVYnukMiAKin/3
 Pd+N1xuniy/hXXCqxxrUr75pEABwzRr6u+ar/0OkaDQhAi1o1ddZe+h8wlwENpJmkbCf
 kNLbYzC6KzVwPPIvBR1oqXT0T6k6o4Ls8/JRRcxyFKKO6KCTaN4qp7dK7QGonljLmyqQ
 Lui1NDOyvqZ0G3agm+1Bwc5AVU89OKTbcBiDRCH9Wwev5Raa4rKXNCED80HjVLE4esv/
 +8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lPKcsn1Zg7byMoVV6H8vhXEqRTFirUJz5P7vuG1x+2o=;
 b=K2LLigP2t6VWHvgMbD/vZyyN8/F+0/bUoWamkdQwCmvyRAZmAhXPr3H1RmSW65p6il
 XbNTSVcdG48xWRHBGXM/KzB+wT5Byf8SPX4aBtJxiMKkYmyK84JT9LpeutrVEF3VAOAR
 f6YyBU1XzPgzkNU0SdrssYbBnD47lfEx2sIc3HdzYRQBIuOYqKXGrfkyrytYL9uxqF8j
 9K3hN/+IAusAnS+8sv8jhpfnuaoS8lC3P4J/P45c/921Vy5qYp/uzcR0OMZK8HeYFQ5h
 65gwff3KSsKjPfkxPagviwV1O+kQpeWfhgfplJpl+sRrtYK6jVjCmNFaBgpq1sTmZn2X
 81Ng==
X-Gm-Message-State: AOAM532malMbjMl6LPHjxUjNML02DMJ7EDW6vApzJNQn/wUlXxQ4AeJ5
 ybATcwk6a8BnCc+YckS+Zf02kw==
X-Google-Smtp-Source: ABdhPJxWhEMsOmrKUaIJxfYdW3ssU1UbLHlNNxkCQp8/6PkQ9tPWrmggcT57mh7M1RuZuG/g7eOfDg==
X-Received: by 2002:a37:b83:: with SMTP id 125mr22257396qkl.96.1593573088847; 
 Tue, 30 Jun 2020 20:11:28 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id d14sm4728530qti.41.2020.06.30.20.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 20:11:28 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: add build_bw_table for A640/A650
Date: Tue, 30 Jun 2020 23:09:57 -0400
Message-Id: <20200701030958.24466-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This sets up bw tables for A640/A650 similar to A618/A630, 0 DDR bandwidth
vote, and the CNOC vote. A640 has the same CNOC addresses as A630 and was
working, but this is required for A650 to work.

Eventually the bw table should be filled by querying the interconnect
driver for each BW in the dts, but use these dummy tables for now.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 74 +++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 9921e632f1ca..ccd44d0418f8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -281,6 +281,76 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
+static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	/*
+	 * Send a single "off" entry just to get things running
+	 * TODO: bus scaling
+	 */
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x01;
+
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x5003c;
+	msg->ddr_cmds_addrs[2] = 0x5000c;
+
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
+
+	/*
+	 * These are the CX (CNOC) votes - these are used by the GMU but the
+	 * votes are known and fixed for the target
+	 */
+	msg->cnoc_cmds_num = 3;
+	msg->cnoc_wait_bitmask = 0x01;
+
+	msg->cnoc_cmds_addrs[0] = 0x50034;
+	msg->cnoc_cmds_addrs[1] = 0x5007c;
+	msg->cnoc_cmds_addrs[2] = 0x5004c;
+
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[0][1] =  0x00000000;
+	msg->cnoc_cmds_data[0][2] =  0x40000000;
+
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+	msg->cnoc_cmds_data[1][1] =  0x20000001;
+	msg->cnoc_cmds_data[1][2] =  0x60000001;
+}
+
+static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	/*
+	 * Send a single "off" entry just to get things running
+	 * TODO: bus scaling
+	 */
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x01;
+
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x50004;
+	msg->ddr_cmds_addrs[2] = 0x5007c;
+
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
+
+	/*
+	 * These are the CX (CNOC) votes - these are used by the GMU but the
+	 * votes are known and fixed for the target
+	 */
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x01;
+
+	msg->cnoc_cmds_addrs[0] = 0x500a4;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+}
+
 static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
@@ -327,6 +397,10 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(&msg);
+	else if (adreno_is_a640(adreno_gpu))
+		a640_build_bw_table(&msg);
+	else if (adreno_is_a650(adreno_gpu))
+		a650_build_bw_table(&msg);
 	else
 		a6xx_build_bw_table(&msg);
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
