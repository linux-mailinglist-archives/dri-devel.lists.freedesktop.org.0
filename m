Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399F7515F72
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 19:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10110E7DD;
	Sat, 30 Apr 2022 17:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AC10E728;
 Sat, 30 Apr 2022 17:10:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2229CB800E2;
 Sat, 30 Apr 2022 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82E2C385AC;
 Sat, 30 Apr 2022 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651338651;
 bh=7Q7phQTT380eAyC4pna502Skfk1vzTEtTNmA1K869r0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lmhHSkgN6SJu7W4wB+ucUrBjvZo8z0l460AEAQjsgfNd5JfX2DEAsTn3S6Uvo0yAq
 0zn9heKMP4uN52wwlOMVgMS+pfaWDa52qGhz4X/UQIFoRv/uWtLMPNlcVI/oM5pwDu
 gFqP84DWRdqCWqWZ9qRcTvL3nXuC7RU61QBlmL7SsaSr8rUkVtLuFccLFuDfXg4Px3
 /X0tCjMBYgIFeDBrIrlELcr/CScCik3+ha5rPRf4nBnX+v5vjjs08w4LIe28IA7GgV
 zz8Xqo3X+OTqjh4Jv9ZNNNjCzMNYjV0ie6/NkGGP8tpWTpeIGtrGkAopcmZadVKO9z
 UaIdwvKJ/y8RQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nkqcJ-001tIM-D5; Sat, 30 Apr 2022 18:10:47 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v4 2/2] ALSA: hda - identify when audio is provided by a video
 driver
Date: Sat, 30 Apr 2022 18:10:46 +0100
Message-Id: <d0b23b803e4a1e748b09c5b94f84231ef96f66ec.1651338466.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651338466.git.mchehab@kernel.org>
References: <cover.1651338466.git.mchehab@kernel.org>
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

See [PATCH v4 0/2] at: https://lore.kernel.org/all/cover.1651338466.git.mchehab@kernel.org/

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

