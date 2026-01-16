Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549DBD2CE99
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEA110E068;
	Fri, 16 Jan 2026 07:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="itC5Xok5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZWfkNx81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A1E10E068
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547280; bh=1+Nc+UlNBUSqpHc8UrUeHOV
 5dyDboqFv6FLQnf7eeC0=; b=itC5Xok5h4ZAPGb9wi9Bs9toCmtMmh0NDhdnqXbTP16/bsuiDj
 HZjDyEFYtQ1f2NU9zDAipPx6eyXbaVkqLRfsQ6TmOeS/2GX7wb0gEvytXA1mDumUrr1HT2v7bYn
 S7gADmsnLmDKp2ksfG6t6A0Bh94VJw95mqcZIhlpqrX+7i6O/eip46VBjIVLhj2eTUveIVjezZ5
 kqacwRh3i+n7hcsyrJqvTfdaWrxJMotX4vRbVBDZePfMyAhAffEmvuCXV8T1+3J1VDnInMcc3mW
 VdU89POHjS2A0QnBzetCoOAGKqHdN38Vywe0DBpBZi8zz4d2CtqjNvQgOKI7+b9S/cg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547280; bh=1+Nc+UlNBUSqpHc8UrUeHOV
 5dyDboqFv6FLQnf7eeC0=; b=ZWfkNx81qAIKYauLmR0gxSf7sTlRuTrzjMbjstxWOkA8teWF1k
 cILs9fuVZ6xGDLBzhSifQl4D56zup/S7vFDg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:36 +0100
Subject: [PATCH v3 4/7] backlight: qcom-wled: Change PM8950 WLED configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-4-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=984;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=LptOWX/xBS3j3shX3xaZHEAMr54QB3qLk0LvPIXpZGo=;
 b=lNNY+N8wKNaNv3u1A0+rvjMIlYkEHbt5Fbe+PmOOGFHkppB5I+qvfAx/nGcwMIOlzp+AnXX+S
 b1pGvE7M+sYCArMr2t4t61BhrB7YU1bIal7Vakq7v/+6YOOxdSsnf2C
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

PMI8950 WLED needs same configurations as PMI8994 WLED.

Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/video/backlight/qcom-wled.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 5decbd39b789..8054e4787725 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1455,7 +1455,8 @@ static int wled_configure(struct wled *wled)
 		break;
 
 	case 4:
-		if (of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
+		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled") ||
+		    of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
 			u32_opts = pmi8994_wled_opts;
 			size = ARRAY_SIZE(pmi8994_wled_opts);
 		} else {

-- 
2.52.0
