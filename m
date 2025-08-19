Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416BEB2CBB5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 20:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070910E647;
	Tue, 19 Aug 2025 18:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 597 seconds by postgrey-1.36 at gabe;
 Tue, 19 Aug 2025 18:15:14 UTC
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net
 [46.105.58.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4710E643
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 18:15:14 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.37.31])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4c5y1H6LRkzBFVh
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 17:55:47 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-h8tfc (unknown [10.110.178.151])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 96BE180297;
 Tue, 19 Aug 2025 17:55:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-h8tfc with ESMTPSA
 id M6QSDaC6pGiiVAEAkBvNlg
 (envelope-from <andi@etezian.org>); Tue, 19 Aug 2025 17:55:44 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007573bb996-046c-4375-b63b-012b3ce9b7b4,
 FE8A1FE06F486F3E0341172D55CF136EA59FD884) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 102.207.152.198
From: Andi Shyti <andi.shyti@kernel.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Date: Tue, 19 Aug 2025 16:55:29 -0100
Message-ID: <20250819175529.3722716-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13448592915103615559
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddutddvrddvtdejrdduhedvrdduleekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
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

From: Andi Shyti <andi.shyti@linux.intel.com>

Coverity warns that 'cap' may be used uninitialised. If pcode
is disabled there is no need to go through the hassle of a
pcode read or taking a PM reference.

Check skip_pcode early in the function and return if it is set.

No change for platforms where pcode is enabled.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index bd9015761aa0..3a083c215891 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
 	u32 cap;
 	int ret;
 
+	if (xe->info.skip_pcode)
+		return 0;
+
 	xe_pm_runtime_get(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-- 
2.50.0

