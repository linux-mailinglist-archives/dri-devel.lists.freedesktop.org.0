Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881A69394A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 19:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876710E40B;
	Sun, 12 Feb 2023 18:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A04A10E345
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 17:26:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4PDckK6tx7z9sZ1;
 Sat, 11 Feb 2023 18:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1676135882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jHaXaIfIppV17tTyYXgdCwqLTkKmucKWl22U2BYin/4=;
 b=JUwERk0V7pns7w52I2O8wiTqh+ROy9Mrv0QdcKJqcBfjkq4DIX1YPNvOsE0GCFoSodZ1lx
 qjzBU6CG+js1I9JwN6xYmnv96Wy5Q4tPT0wVwBFXvYtEOq+nZKJ+kum7wDVV/LQTcL/WWF
 qH37OYYvnKUAQrYT2H/91h9wGbOvKA6Mai1AQD9lTMU0sYV3AP35gqk7fUf2ORfvagh+ab
 7UMWI8vs8Zyb2Md3wi1OkJ8Aw0lelDfg37euly2cMDz5cWXliVARX6c/gAu2zLSLOY+c6y
 LlWEMJw0AAyadXVMqtSHjYs8HLG9IRI11pkgUWhjSFPYy0MZ3lSLRlicEPqPJg==
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megous@megous.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/1] drm/panel: st7703: Fix initialization failures on
 Xingbangda XBD599
Date: Sat, 11 Feb 2023 18:17:47 +0100
Message-Id: <20230211171748.36692-1-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4PDckK6tx7z9sZ1
X-Mailman-Approved-At: Sun, 12 Feb 2023 18:11:01 +0000
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
Cc: Frank Oltmanns <frank@oltmanns.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes intermittent panel initialization failures and screen
corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
used in PinePhone).

It was originally submitted by Ondrej Jirman in July 2020:
https://lore.kernel.org/all/20200716123753.3552425-1-megous@megous.com/

The original patchset contained two patches. One of them broke the panel
on the Purism Librem 5.

This is the concluding message from Guido Günther in that thread:
https://lore.kernel.org/all/20200801110409.GA6351@bogon.m.sigxcpu.org/#t

Guido wanted changes to the commit message. I updated it to adress his
requests.

I send this patch in Ondřej's name with his consent.

The patch is based on drm-next.

Please let me know what you think.

Thanks,
  Frank

Ondrej Jirman (1):
  drm/panel: st7703: Pick different reset sequence

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

-- 
2.39.1

