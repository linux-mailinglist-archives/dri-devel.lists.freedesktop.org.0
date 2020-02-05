Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF01528DA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 11:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164716F51D;
	Wed,  5 Feb 2020 10:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA46F51D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 10:07:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u6so1952877wrt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 02:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kmN+kD4FSA2ah1VtoMNYp6bLpdHdftqa8imfp5qvFQQ=;
 b=uxf/4cY/d5W+AsY1/8m+Expm55bXJmtngFXF/rHWedksM3UV1Uqnw4P36T43Wxhnl/
 6O8akDYn3n3HAzBLUpGu0izJUtiD6fAWnB4lCcRSGBbCO+R4Em5OXJR7owAENDJJIAj9
 DiUIb1l3suJk4ZcFTBJvN04tvEvYXu9k0XekjeRrh49oAXJve69+wUSvPAuj+G1VjqDq
 NMlA0I384Ho7Nwq2w4mO3jQXRzJCtorUIvSKctFGSe0Zwc7lPnm0VeQhh6xhKJ/FpHHN
 vLpsRjRhg6d6DQBR/w1yUs4Ti42eK42Y5LlrG7ijZ4NoHTxTdWrmSo0qvPMdNQZSN7WO
 LnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kmN+kD4FSA2ah1VtoMNYp6bLpdHdftqa8imfp5qvFQQ=;
 b=T+4ZN7Nk78swCsldfiG9b0natvGrUAotuUoCLwBWLVOIFFVI1OhT5233Sdz76/SjVI
 vfdoH/+c6GtCP+RMfhW/QUaywT39imeJNN2Mxsm++cFA0ScGfwIMWQvwg3yNvdSbiCtV
 PKr/kVRSjV4hEo9xGABVD7jUQHnpyuYcmrPH+D1SO/+Z+sthGMveLU3CXUB2EIotbsEq
 cqsNtUNqZWYm3StFm60BwDxZOEtqlSWN65AotHR0wreVQ79IE8W1V8Gw6hcE5G/qu1EL
 5u1IGtPqgGiyttKzUECvOssUjpr1Jndwznpgq39Z8nn7cc/dQrcjuEBujNOUa3rY5YN8
 JG6w==
X-Gm-Message-State: APjAAAWS3vVrFBMb5cs29pEZtRjLG1pQ+xC5J+xrfHamiAoGKyMNVkro
 b1RWgzHEnntxk0cEo8nqbyc=
X-Google-Smtp-Source: APXvYqw8R2TaGaAU3fic2Um7fz5KY8Q5ydfOXnJm0vGUyK4eHmdddD90kmC2E19/Z2AkBgRXGcRgLg==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr28029051wrn.341.1580897270947; 
 Wed, 05 Feb 2020 02:07:50 -0800 (PST)
Received: from cizrna.lan ([109.72.12.137])
 by smtp.gmail.com with ESMTPSA id y6sm33749863wrl.17.2020.02.05.02.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 02:07:50 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Don't try to map on error faults
Date: Wed,  5 Feb 2020 11:07:16 +0100
Message-Id: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the exception type isn't one of the normal faults, don't try to map
and instead go straight to a terminal fault.

Otherwise, we can get flooded by kernel warnings and further faults.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 763cfca886a7..80abddb4544c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -596,8 +596,9 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 		source_id = (fault_status >> 16);
 
 		/* Page fault only */
-		if ((status & mask) == BIT(i)) {
-			WARN_ON(exception_type < 0xC1 || exception_type > 0xC4);
+		if ((status & mask) == BIT(i) &&
+		     exception_type >= 0xC1 &&
+		     exception_type <= 0xC4) {
 
 			ret = panfrost_mmu_map_fault_addr(pfdev, i, addr);
 			if (!ret) {
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
