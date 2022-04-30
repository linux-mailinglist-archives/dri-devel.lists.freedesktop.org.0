Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48644515DC4
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 15:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3C10E59D;
	Sat, 30 Apr 2022 13:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC8710E4F6;
 Sat, 30 Apr 2022 13:41:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A497E60EBC;
 Sat, 30 Apr 2022 13:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8E6C385A7;
 Sat, 30 Apr 2022 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651326114;
 bh=tqVXu6g9oh/W80TNZwCI08nLQ3wJ9C50shdsYteF9Wk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cb3YOJLytublE7wGW2KxxKiBXvgND1jxCpgihm/fRJWShxCwNNy8GbV5pg0ZWUz1F
 usDbmllk91NQ1SDqP+Wg+5aaj7u0qE4gneSvSFmgNoLl5bFdHv+GUAWfit0rS2BzJB
 cTs9YnMu4x9ZowvhBvm3fZW58SWTG1P+bW7T4pEfkVTGpCLVwg8fdtvOykn4uYO8ej
 PHnQFjFdRZ+FyellvBvwi+DrArmU5sQbIJc1weosrPL7HFDuV+SJ7qJbY6qLDZJxyl
 gYWYpTSlcFbWKxXYdQjfSWXGLRIZHI1qOtfPll3BC1vzREj89ROC9AsbnHbB6hy1f6
 y4Vlu/Tc2bP9A==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nknM6-001nsj-Ji; Sat, 30 Apr 2022 14:41:50 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 2/2] ALSA: hda - identify when audio is provided by a video
 driver
Date: Sat, 30 Apr 2022 14:41:48 +0100
Message-Id: <6b5f1e2cec0137d5aab089a7e7497972ff5addb1.1651326000.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651326000.git.mchehab@kernel.org>
References: <cover.1651326000.git.mchehab@kernel.org>
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
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 linux-modules@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices, the hda driver needs to hook into a video driver,
in order to be able to properly access the audio hardware and/or
the power management function.

That's the case of several snd_hda_intel devices that depends on
i915 driver.

Ensure that a proper reference between the snd-hda driver needing
such binding is shown at /proc/modules, in order to allow userspace
to know about such binding.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v3 0/2] at: https://lore.kernel.org/all/cover.1651326000.git.mchehab@kernel.org/

 sound/hda/hdac_component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..30e130457272 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -199,7 +199,7 @@ static int hdac_component_master_bind(struct device *dev)
 	}
 
 	/* pin the module to avoid dynamic unbinding, but only if given */
-	if (!try_module_get(acomp->ops->owner)) {
+	if (!__try_module_get(acomp->ops->owner, dev->driver->owner)) {
 		ret = -ENODEV;
 		goto out_unbind;
 	}
-- 
2.35.1

