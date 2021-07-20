Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517553CFDA0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECD689C17;
	Tue, 20 Jul 2021 15:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E08B89C17
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:49 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4GTjRb4Sh9z50W7L
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:33:47 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="e5PSRNYV"
Date: Tue, 20 Jul 2021 15:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1626795223;
 bh=a/cXIJple0tXhCo8wBmyM+liGV06lwy6xissR4KIOBE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=e5PSRNYVIfDTCyWKFDdtWRV/a1CHmQ6s52JrLyxXS9rbHzfboI5GOSvtNzvZnBWcV
 VCtwbsy8K5xipPFOva8gx7eiSn8BNhQ5xQQq5zzs6BlYwOF35MdXmrIdQsjpEhxOkH
 KUCJjs5/nplTVb5VpmyJpLmCUZSvkNe21BMEdoYo=
To: Caleb Connolly <caleb@connolly.tech>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/5] arm64: dts: qcom: sdm845-oneplus: fix reserved-mem
Message-ID: <20210720153125.43389-2-caleb@connolly.tech>
In-Reply-To: <20210720153125.43389-1-caleb@connolly.tech>
References: <20210720153125.43389-1-caleb@connolly.tech>
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

Fix the upper guard and the "removed_region", this fixes the random
crashes which used to occur in memory intensive loads. I'm not sure WHY
the upper guard being 0x2000 instead of 0x1000 doesn't fix this, but it
HAS to be 0x1000.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Fixes: e60fd5ac1f68 ("arm64: dts: qcom: sdm845-oneplus-common: guard
rmtfs-mem")
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 4d052e39b348..eb6b1d15293d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -69,7 +69,7 @@ rmtfs_mem: memory@f5b01000 {
 =09=09};
 =09=09rmtfs_upper_guard: memory@f5d01000 {
 =09=09=09no-map;
-=09=09=09reg =3D <0 0xf5d01000 0 0x2000>;
+=09=09=09reg =3D <0 0xf5d01000 0 0x1000>;
 =09=09};

 =09=09/*
@@ -78,7 +78,7 @@ rmtfs_upper_guard: memory@f5d01000 {
 =09=09 */
 =09=09removed_region: memory@88f00000 {
 =09=09=09no-map;
-=09=09=09reg =3D <0 0x88f00000 0 0x200000>;
+=09=09=09reg =3D <0 0x88f00000 0 0x1c00000>;
 =09=09};

 =09=09ramoops: ramoops@ac300000 {
--
2.32.0


