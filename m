Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6A5B7C64
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9874010E24B;
	Tue, 13 Sep 2022 20:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB0010E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:56:04 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id
 w6-20020a1f9406000000b00388997b8d31so2874366vkd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=pCfRO3751PIceEFZobkVS7s+2QyKwW6/+h1LD3cCIeQ=;
 b=ZeVfR8Tnh5hBzCUV1+CS8+Iy1lLHRA/k5WbydQvejPxhARt8JYQuZEKNPKlx0P6GVg
 yS3MHFnOdeg2h6R2IoY/R5kf5QFzevs7rUHzS+y/eTO2MFlEPFSZAPH0d6AiPWeEEbkG
 P8yv/iZAbdsPOPomC15hdY9X8Cdkt9oBG8dVJYoUQd/wQYrVjWRYCDu9hUlrAbSWb8sI
 4MkZuUL4ANwsnuUqTzJVq6CA5qkgBDyKNfPRJHNlV+OJp8RbhrrgpNXkwdr3YRqhsqz9
 Npjq1zQ67uMxgk6qwpGWxv5ASBroZ28r1RSSts4jAHaN32pCKG+osEKJzn2sy9Tir86b
 pzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=pCfRO3751PIceEFZobkVS7s+2QyKwW6/+h1LD3cCIeQ=;
 b=K19K7WFP8JFBqEI7uR9gfrvlRVr3sKnANDxXGW9oLfGDdTx0DiMLQ1F2TZJgFonPOh
 uoxOuK8NCyFODspKABA3csdvzhntKUCR25CSBsw0ZbMIQfPQ3H+l61i2h5RqDwnZJNgZ
 7XMU4rB+iXiYppmYReylogeZG/Hoqu3NdXQxY4bBCj8rx8mA04MUFK3se9y3eaWgsM5Z
 Ps5mRN15Fyk5f2wSMr5GE+V+evHn0LEbbM84HBBdw8xL8tNXUa340ErQwxnneHTiqUi9
 O+qiIII1rALC8EvYhatw8xoB63pI4ZeIhmuiC5r1kojclpyoOfZ4ezK1osqi01Sk2fIO
 Glfw==
X-Gm-Message-State: ACgBeo2FwJTgQ9QJ4Vonsj65CfZnRJEpiCu0AA7scQos+GMpXDWFi41G
 M6v6ryduCLTAGia63WdB9G68/OUuDw==
X-Google-Smtp-Source: AA6agR56+CRX4Jw5oLwN56hGQ9u1QOvQ42gdvdnD0+27lrgrALWWvOvWch3l4gfgBdyZy9SYZgradcpnhQ==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2ed8:0:b0:3a2:a7f:3e9e with
 SMTP id
 u207-20020a1f2ed8000000b003a20a7f3e9emr6201265vku.7.1663102563103; Tue, 13
 Sep 2022 13:56:03 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:56:00 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205600.155172-1-nhuck@google.com>
Subject: [PATCH] drm: xlnx: Fix return type of zynqmp_dp_connector_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_valid field in drm_connector_helper_funcs is expected to be of
type
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of zynqmp_dp_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index d14612b34796..f571b08d23d3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1352,8 +1352,9 @@ zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
 	return &dp->encoder;
 }
 
-static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
-					  struct drm_display_mode *mode)
+static enum drm_mode_status
+zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct zynqmp_dp *dp = connector_to_dp(connector);
 	u8 max_lanes = dp->link_config.max_lanes;
-- 
2.37.2.789.g6183377224-goog

