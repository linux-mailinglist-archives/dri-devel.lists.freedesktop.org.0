Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E84477367
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 14:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929B610FEEE;
	Thu, 16 Dec 2021 13:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7110FEEE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:44:07 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by michel.telenet-ops.be with bizsmtp
 id X1js2600j250X30061jsU6; Thu, 16 Dec 2021 14:44:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr32-005QIJ-3M; Thu, 16 Dec 2021 14:43:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr31-009y7j-H5; Thu, 16 Dec 2021 14:43:51 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
Date: Thu, 16 Dec 2021 14:43:49 +0100
Message-Id: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639662093.git.geert@linux-m68k.org>
References: <cover.1639662093.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, tomeu.vizoso@collabora.com,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, linux-renesas-soc@vger.kernel.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-riscv@lists.infradead.org,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L SoC embeds Mali-G31 bifrost GPU.
This patch series aims to add support for the same

It is tested with latest drm-misc-next + mesa 21.3.0 + 
out of tree patch for (du + DSI) + 
platform specific mesa configuration for RZ/G2L.

Tested the kmscube application.

test logs:-
root@smarc-rzg2l:~# kmscube
Using display 0xaaaadb6e7d30 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
.....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ....
===================================
^C

root@smarc-rzg2l:~# cat /proc/interrupts | grep panfrost
 82:     587287          0     GICv3 186 Level     panfrost-job
 83:          2          0     GICv3 187 Level     panfrost-mmu
 84:          8          0     GICv3 185 Level     panfrost-gpu

root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         0        72
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         0         0
  125000000:         0         0         0         0         0         0         0         1        68
  200000000:         0         0         0         0         0         0         0         1        68
  250000000:         1         0         0         0         0         0         0         0        84
  400000000:         0         0         0         0         0         0         0         0         0
  500000000:         0         0         0         1         1         1         0         0       736
Total transition : 6
root@smarc-rzg2l:~# kmscube
Using display 0xaaaaf7a421b0 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  .....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ......
===================================

root@smarc-rzg2l:~#
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         1       144
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         9       524
  125000000:         0         0         9         0         0         0         0         3      2544
  200000000:         0         0         0        11         0         0         0        46      3304
  250000000:         1         0         0         0        33         0         0         0      7496
  400000000:         0         0         0         0        16        19         0         0      2024
  500000000:         1         0         0         1         8        15        35         0      4032
Total transition : 208

Platform specific mesa configuration patch for RZ/G2L
---------------------
src/gallium/targets/dri/meson.build
+               'rcar-du_dri.so',
src/gallium/targets/dri/target.c
+DEFINE_LOADER_DRM_ENTRYPOINT(rcar_du)

V2->V3:
 * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
 * minimum number of reset for the generic GPU is set to 1.
 * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
   SoC-specific conditional schemas.
 * Updated commit description for patch#3
V1->V2:
 * Removed clock patches from this seies, as it is accepted for 5.17
 * Added Rb tag from Geert
 * Added reset-names required property for RZ/G2L and updated the board dtsi.

Biju Das (3):
  dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
  arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
  arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

 .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 65 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 13 ++++
 3 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.17.1


