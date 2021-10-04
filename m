Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F9421771
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 21:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662436E201;
	Mon,  4 Oct 2021 19:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06D46E201
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 19:27:46 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 126E51F673;
 Mon,  4 Oct 2021 21:27:43 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] backlight: qcom-wled: fix and solidify handling of
 enabled-strings
Date: Mon,  4 Oct 2021 21:27:31 +0200
Message-Id: <20211004192741.621870-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes WLED's handling of enabled-strings: besides some
cleanup it is now actually possible to specify a non-contiguous array of
enabled strings (not necessarily starting at zero) and the values from
DT are now validated to prevent possible unexpected out-of-bounds
register and array element accesses.
Off-by-one mistakes in the maximum number of strings, also causing
out-of-bounds access, have been addressed as well.

Marijn Suijten (10):
  backlight: qcom-wled: Pass number of elements to read to
    read_u32_array
  backlight: qcom-wled: Use cpu_to_le16 macro to perform conversion
  backlight: qcom-wled: Override num-strings when enabled-strings is set
  backlight: qcom-wled: Validate enabled string indices in DT
  backlight: qcom-wled: Fix off-by-one maximum with default num_strings
  backlight: qcom-wled: Remove unnecessary 4th default string in wled3
  backlight: qcom-wled: Provide enabled_strings default for wled 4 and 5
  backlight: qcom-wled: Remove unnecessary double whitespace
  backlight: qcom-wled: Consistently use enabled-strings in
    set_brightness
  backlight: qcom-wled: Consider enabled_strings in autodetection

 drivers/video/backlight/qcom-wled.c | 88 ++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 33 deletions(-)

-- 
2.33.0

