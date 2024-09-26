Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB29878A7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 19:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C82E10EBC8;
	Thu, 26 Sep 2024 17:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="pHjOHqES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC29C10EBC1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 17:51:36 +0000 (UTC)
Received: from wse.fritz.box (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0B05B2FC004A;
 Thu, 26 Sep 2024 19:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727372666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H9x97eDU1PbyOXF3v/R8RWr8/PHzoFtqdxlXc7gdyN4=;
 b=pHjOHqESqmMGfH/HwRdNXvirvmdk0Cb7VAux7obRQqlQrN8ldcFalwCDXAseP/ViksCopa
 Nthj70LPG8L6X15wGqIz4laUGuViBeAdK2DvXIkSaBG1M+O/KueagrF2YnhNTs+azowVaE
 /6sax7iDYHuF7It/ipL3XcY9FW4kAzg=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: 
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz
Subject: [PATCH 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04
Date: Thu, 26 Sep 2024 19:44:04 +0200
Message-Id: <20240926174405.110748-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
took some time but now a first working draft of the suggested new way of
handling per-key RGB keyboard backlights is finished. See:
https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
First time for me sending a whole new driver to the LKML, so please excuse
mistakes I might have made.

Known bugs:
- The device has a lightbar which is currently not implemented and
  therefore stuck to blue once the first backlight control command is send.

What is still missing:
- The leds fallback
- Lightbar control

Some general noob questions:

Initially I though it would be nice to have 2 modules, one jsut being the
wmi initialization and utility stuff and one just being the backlight logic
stuff, being loaded automatically via module_alias, but that would still
require me to create the virtual hid device during the wmi_ab probe, and
that already needs the ll_driver, so i guess I have to do it statically
like i did now?
Or in other words: I would have liked to have a module dependency graph
like this:
    tuxedo_nb04_lamp_array depends on tuxedo_nb04_platform (combining *_wmi_init and *_wmi_utility)
but if i currently split it into modules i would get this:
    tuxedo_nb04_wmi_ab_init dpends on tuxedo_nb04_wmi_ab_lamp_array depends on tuxedo_nb04_wmi_utility

Currently after creating the virtual hdev in the wmi init probe function I
have to keep track of it and manually destroy it during the wmi init
remove. Can this be automated devm_kzalloc-style?

Kind regards,
Werner Sembach


