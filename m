Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF03CFDAA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C9089B20;
	Tue, 20 Jul 2021 15:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jul 2021 15:38:56 UTC
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98089B20
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:38:56 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4GTjRX237nz4xZhF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:44 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="H6UaAWJa"
Date: Tue, 20 Jul 2021 15:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795219;
 bh=szBIPFUr6CqEljCYQ32/qAOWp1c+Iy40CcFm212YhCQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=H6UaAWJa1yDEuy4fEFsuMMrwULeQsJvzjkHM39TS1VGBNg1IGfwxZLwPGKt3kM57X
 RUZW9JFHMX0BJvSqVMJ8eH8hCo9I4nFmwT3pjZHa9qTStCk0WnmC4S94N2WdYLPo6u
 jHfrJ9CUCPGx5GDanRO8561RS1UACOKRKjzt/2wQ=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 0/5] OnePlus 6 fixes
Message-ID: <20210720153125.43389-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is another collection of small fixes for the OnePlus 6 and 6T.
Notably we finally have finally tracked down and fixed the reserved memory
related crashes!
We also enable UART as well as take Bjorns approach to working around the p=
anel
reset GPIO issue making the reset GPIO optional in the panel driver. Lastly=
 we
fix up the ipa firmware path now that firmware-names is supported for it in
5.14.

The patch ("drm/panel/samsung-sofef00: make gpio optional") is a reworked
version of a patch from a previous series which was not accepted: ("drm: pa=
nel:
sofef00: remove reset GPIO handling")
https://lore.kernel.org/linux-arm-msm/20210502014146.85642-3-caleb@connolly=
.tech/

Caleb Connolly (5):
  arm64: dts: qcom: sdm845-oneplus: fix reserved-mem
  dts: arm64: sdm845-oneplus-common: enable debug UART
  drm/panel/samsung-sofef00: make gpio optional
  arm64: dts: qcom: sdm845-oneplus-fajita: remove panel reset gpio
  arm64: dts: qcom: sdm845-oneplus: add ipa firmware names

 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 19 ++++++++++++++-----
 .../dts/qcom/sdm845-oneplus-enchilada.dts     |  2 ++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  7 +++++--
 3 files changed, 21 insertions(+), 7 deletions(-)

--
2.32.0


