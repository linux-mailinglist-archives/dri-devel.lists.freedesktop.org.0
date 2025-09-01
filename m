Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E71B3DD24
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8FF10E3B2;
	Mon,  1 Sep 2025 08:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3810E3B2;
 Mon,  1 Sep 2025 08:58:11 +0000 (UTC)
X-UUID: c4d74aac871111f0b29709d653e92f7d-20250901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:f1e2aab6-178f-4d82-b846-3ad535999412, IP:0,
 U
 RL:0,TC:0,Content:26,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:26
X-CID-META: VersionHash:6493067, CLOUDID:16a24fa6142617347b8ddbaac62faf64,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:4|50,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c4d74aac871111f0b29709d653e92f7d-20250901
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 920024082; Mon, 01 Sep 2025 16:58:03 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id CD288E008FA7;
 Mon,  1 Sep 2025 16:58:02 +0800 (CST)
X-ns-mid: postfix-68B5601A-630246734
Received: from localhost.localdomain (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 23964E008FA6;
 Mon,  1 Sep 2025 16:57:54 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v3 00/12] cpufreq: use __free() for all cpufreq_cpu_get()
 references
Date: Mon,  1 Sep 2025 16:57:36 +0800
Message-Id: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

This patchset converts all remaining cpufreq users to rely on the
__free(put_cpufreq_policy) annotation for policy references, instead of
calling cpufreq_cpu_put() manually.

Motivation:
- Reduce the chance of reference counting mistakes
- Make the code more consistent with the latest kernel style
- behavior remains the same, but reference counting is now safer=20
  and easier to maintain.

The changes are split into 12 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V3:
 - drop patch 'KVM: x86: Use __free(put_cpufreq_policy) for policy refere=
nce'
 - removed 5 patches which has been applied
 - Consolidate CPUFreq policy assignments and allocations into one line,
   suggested by Ben Horgan
 - Change cpu_has_cpufreq() return type to bool, following Rafael's sugge=
stion
 - Change the title to 'Use scope-based cleanup helper'

V2:
 - Fix compile error in powernv-cpufreq.c
 - Split patch to separate logical changes

Zihuan Zhang (12):
  arm64: topology: Use scope-based cleanup helper
  ACPI: processor: thermal: Use scope-based cleanup helper
  cpufreq: intel_pstate: Use scope-based cleanup helper
  cpufreq: longhaul: Use scope-based cleanup helper
  cpufreq: powernv: Use scope-based cleanup helper
  PM / devfreq: Use scope-based cleanup helper
  drm/i915: Use scope-based cleanup helper
  cpufreq: powerpc: macintosh: Use scope-based cleanup helper
  powercap: dtpm_cpu: Use scope-based cleanup helper
  thermal: imx: Use scope-based cleanup helper
  thermal/drivers/ti-soc-thermal: Use scope-based cleanup helper
  PM: EM: Use scope-based cleanup helper

 arch/arm64/kernel/topology.c                  |  9 +++----
 drivers/acpi/processor_thermal.c              | 18 +++++--------
 drivers/cpufreq/intel_pstate.c                |  8 +++---
 drivers/cpufreq/longhaul.c                    |  3 +--
 drivers/cpufreq/powernv-cpufreq.c             | 11 ++++----
 drivers/devfreq/governor_passive.c            | 25 +++++++-----------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  4 +--
 drivers/macintosh/windfarm_cpufreq_clamp.c    |  5 +---
 drivers/powercap/dtpm_cpu.c                   | 26 +++++--------------
 drivers/thermal/imx_thermal.c                 | 12 +++------
 .../ti-soc-thermal/ti-thermal-common.c        | 11 +++-----
 kernel/power/energy_model.c                   |  9 +++----
 12 files changed, 46 insertions(+), 95 deletions(-)

--=20
2.25.1

