Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3232451560
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 21:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9366A6E049;
	Mon, 15 Nov 2021 20:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010E89F53
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 20:35:07 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 11F431F8E5;
 Mon, 15 Nov 2021 21:35:05 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v3 0/9] backlight: qcom-wled: fix and solidify handling of
 enabled-strings
Date: Mon, 15 Nov 2021 21:34:50 +0100
Message-Id: <20211115203459.1634079-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes WLED's handling of enabled-strings: besides some
cleanup it is now actually possible to specify a non-contiguous array of
enabled strings (not necessarily starting at zero) and the values from
DT are now validated to prevent possible unexpected out-of-bounds
register and array element accesses.
Off-by-one mistakes in the maximum number of strings, also causing
out-of-bounds access, have been addressed as well.

Changes in v3:
- Use __le16 type for cpu_to_le16 result;
- Reword ambiguity warning between qcom,num-strings and
  qcom,enabled-strings to explain that only one should/needs to be set;
- Move this warning from patch 4 patch 5, where the length of
  qcom,enabled-strings starts to be taken into account;
- Drop DT patches that have been picked up in the qcom tree.

v2: https://lore.kernel.org/lkml/20211112002706.453289-1-marijn.suijten@somainline.org/T

Changes in v2:
- Reordered patch 4/10 (Validate enabled string indices in DT) to sit
  before patch 1/10 (Pass number of elements to read to read_u32_array);
- Pulled qcom,num-strings out of the DT enumeration parser, and moved it
  after qcom,enabled-strings parser to always have final sign-off over
  the number of strings;
- Extra validation for this number of strings against
  qcom,enabled-strings;
- Recombined patch 9 (Consistently use enabled-strings in
  set_brightness) and patch 10 (Consider enabled_strings in
  autodetection), which both solve the same problem in two different
  functions.  In addition the autodetection code uses set_brightness as
  helper already;
- Improved DT configurations for pmi8994 and pm660l, currently in 5.15
  rc's.

v1: https://lore.kernel.org/dri-devel/20211004192741.621870-1-marijn.suijten@somainline.org/T

Marijn Suijten (9):
  backlight: qcom-wled: Validate enabled string indices in DT
  backlight: qcom-wled: Pass number of elements to read to
    read_u32_array
  backlight: qcom-wled: Use cpu_to_le16 macro to perform conversion
  backlight: qcom-wled: Fix off-by-one maximum with default num_strings
  backlight: qcom-wled: Override default length with
    qcom,enabled-strings
  backlight: qcom-wled: Remove unnecessary 4th default string in WLED3
  backlight: qcom-wled: Provide enabled_strings default for WLED 4 and 5
  backlight: qcom-wled: Remove unnecessary double whitespace
  backlight: qcom-wled: Respect enabled-strings in set_brightness

 drivers/video/backlight/qcom-wled.c | 130 +++++++++++++++-------------
 1 file changed, 72 insertions(+), 58 deletions(-)


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
--
2.33.1

