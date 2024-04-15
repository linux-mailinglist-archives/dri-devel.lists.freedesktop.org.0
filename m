Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DBE8A56E5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D65410FA69;
	Mon, 15 Apr 2024 16:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OmKcG4dg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1220910EA45
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 16:00:43 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A86F3236;
 Mon, 15 Apr 2024 17:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713196796;
 bh=XXYkynSlpns6FCIw5K8POJf6ylOyzR5MRrPWHDWhWPs=;
 h=From:Subject:Date:To:Cc:From;
 b=OmKcG4dgtuC2YSQhfoYOaHJtzKVxtfjBLx0iXRl3GS1l1eFSer1e9l+DLGfLkRlSA
 cgVHqLq1vUa3MhgmSPyDrYifEMzo8rBINo830YJOEg8rI67yws/DpQePHte91caGRn
 Fhj84ucnviCHSsiAG/z7+PaXuSOnn0kXHzKe5rN8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH RFC 0/2] pmdomain: ti-sci: Handling DSS boot splash
Date: Mon, 15 Apr 2024 19:00:22 +0300
Message-Id: <20240415-ti-sci-pd-v1-0-a0e56b8ad897@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZPHWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0NT3ZJM3eLkTN2CFF1j4yRjyzSzJANTCzMloPqCotS0zAqwWdFKQW7
 OSrG1tQCSeumuYAAAAA==
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Dave Gerlach <d-gerlach@ti.com>, 
 J Keerthy <j-keerthy@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=XXYkynSlpns6FCIw5K8POJf6ylOyzR5MRrPWHDWhWPs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmHU8jXYvyFkydY6j4wnjsDgD047U5uJepH06I5
 MQU8P5P9vWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZh1PIwAKCRD6PaqMvJYe
 9c33D/4hz7AJ/3Cn/hJWF1ozhGGV9sy8rLw6eKAO5vBBDlh6PvHVrkr1VZFph6FTV8xKlI0c1hC
 roqSuKYLfFFKbiyNjV/0WwxpYal3tQMG+OpYia+7T4tDP+DPkGfyRBSi39svhZTBycaNU9ZZoom
 YubT6LY74YWLKrv/MBy1s6epJvMU0eNWII5qtHTNHKyjZOcRNWz3jsFs6sikpKugylqJ32f6oP0
 uE6e1dgzlu/EAJpepm0afAPXDSzHyK6WDP39UJshlrEJeetkRPgeb1ioY8uizfx4KH8HXFz6csG
 JYOsqZUmhC+0PId5VZc/PxKhB98BSLyCu6LZCZ9fVCuNwcuYymDJsoce/oEUdI0862Yd39EBWoq
 3WW1w0uoafQuisD/f2CT/UKvgxeh0OR7IxiW9YlEAXuyWh06bE+s4Q7IffHe5TgZ0R2ulzx5g+2
 hzzjQT9pi75UjLJqKnUgJMsx/ZltnI8N/Zl4qSxcTrqOPDX1Qx0nes1dalrQ777hvjN/fgyXNLK
 wT+7lqHhN4fXGe3B07nXa7HIgCGgOf37xoZI4OLxdQF70XKS1BnrrsAiebXw7xyr5pOEHLD3VBF
 UN7mznNpobJO3ANokFsgXtBMsVMGrgjSJ3n59tCnarlSl4KRGplWqRs5xFjaXN0odvlABvljL3i
 a/y6TQMe19rBnhw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The first patch here is a fix for ti_sci_pm_domains to handle the case
where the dts has two nodes which refer to the same PD.

The second is the interesting one, and very much an RFC.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      pmdomain: ti-sci: Fix duplicate PD referrals
      pmdomain: ti-sci: Support retaining PD boot time state

 drivers/pmdomain/ti/ti_sci_pm_domains.c    | 47 ++++++++++++++++++++++++++++--
 include/dt-bindings/soc/ti,sci_pm_domain.h |  1 +
 2 files changed, 45 insertions(+), 3 deletions(-)
---
base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
change-id: 20240415-ti-sci-pd-33b39f6b0586

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

