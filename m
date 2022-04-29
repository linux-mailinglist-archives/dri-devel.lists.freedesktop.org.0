Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD651425E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 08:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53AF10FB9F;
	Fri, 29 Apr 2022 06:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8073E10FB92;
 Fri, 29 Apr 2022 06:31:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1CBF61D94;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21056C385AF;
 Fri, 29 Apr 2022 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651213887;
 bh=gGK7/gBcj48QlxuUQ6aLxtWNQgyWkYr7fybLKh0KD5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MbmY5wfpkIXYzVOY7GrWXGECIEPh4shZM0RuPaXg/0Pj3b62Ok4OxUHJfO1disdc6
 v/aNccc7zhdMTWUjzv5GKqeWAEITIiynZ6Aq6cIGLE+EBCAx5+L476WZThSPpLXa6t
 93I/1eyw5mATjnSM7HXiPsJTeYs7BRTIDy+YKdEK0lfz70yTYjYuZudGITkfd12rPj
 4lgICGJ6SnFQQabh9SmD4Y5XX1+q+ES4gWn9BshAcmn1NlMVOiDEhdEBaY1ksWxClF
 c+WWMHte6ENzDZX0deLkyoqvooI1c0bqPgRHYQWbVS/NqRZTJerGzZEl3CfpyzrvSW
 g26ODSGzqn1EA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkK9z-001Qml-NN; Fri, 29 Apr 2022 07:31:23 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 2/2] ALSA: hda - identify when audio is provided by a video
 driver
Date: Fri, 29 Apr 2022 07:31:16 +0100
Message-Id: <5c3a968858a05c27e299eadf2a925d4aa91ac17a.1651212016.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651212016.git.mchehab@kernel.org>
References: <cover.1651212016.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 David Airlie <airlied@linux.ie>, mauro.chehab@intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices, the hda driver needs to hook into a video driver,
in order to be able to properly access the audio hardware and/or
the power management function.

That's the case of several snd_hda_intel devices that depends on
i915 driver.

Currently, this dependency is hidden from /proc/modules and
from lsmod, making harder to identify the need to unbind the
audio driver before being able to unbind the i915 driver.

Add a reference for it at the module dependency, in order to
allow userspace to identify it, and print a message on such
cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 0/2] at: https://lore.kernel.org/all/cover.1651212016.git.mchehab@kernel.org/

 sound/hda/hdac_component.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..103c6be8be1e 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -211,6 +211,14 @@ static int hdac_component_master_bind(struct device *dev)
 	}
 
 	complete_all(&acomp->master_bind_complete);
+
+	if (acomp->ops->owner && acomp->ops->owner->name) {
+		dev_info(dev, "audio component provided by %s driver\n",
+			 acomp->ops->owner->name);
+		module_add_named_dependency(acomp->ops->owner->name,
+					    dev->driver->owner);
+	}
+
 	return 0;
 
  module_put:
-- 
2.35.1

