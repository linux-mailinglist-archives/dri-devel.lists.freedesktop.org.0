Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C45CED88A
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 00:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624D610E03E;
	Thu,  1 Jan 2026 23:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tJcLEqXv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tJcLEqXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jan 2026 18:48:43 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45D710E058;
 Thu,  1 Jan 2026 18:48:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhwdz1pjqz9srM;
 Thu,  1 Jan 2026 19:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767292903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0KsDstpxPfEmoJFxxat6nI8hzti13oPVPYmI3WSj8wg=;
 b=tJcLEqXvymLZHN815RIrk2fYTlMW3jISiUz7afjzHgptbU78t1/YvU/1dsj7Sj5w+ZhYNZ
 vNC1TUdXsU01VdtZddiRwKVQMNlB85lTJv8CJEj5rUoXBbwBHFy9kxPx2PbOLKPllqXZ6l
 Pc+9/qUofD1G2tdjGF75u2Ycb1pl0jx1MqgOncBz6r0lVgrrkpu3LoclG5DRwy5CiuuXP/
 +6quJBThUABiBy4hV7Ti+Y7e0+J78gAWq8e8ZTiFdDdVv7ebcsZq3AeSBWTGwc96DlUIMX
 hSB1nz5sjmt4VC0UKwjF9sgpHbbMgl8dd9nfW03xseICEzctp/QbBIU6gZ5Wjw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767292903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0KsDstpxPfEmoJFxxat6nI8hzti13oPVPYmI3WSj8wg=;
 b=tJcLEqXvymLZHN815RIrk2fYTlMW3jISiUz7afjzHgptbU78t1/YvU/1dsj7Sj5w+ZhYNZ
 vNC1TUdXsU01VdtZddiRwKVQMNlB85lTJv8CJEj5rUoXBbwBHFy9kxPx2PbOLKPllqXZ6l
 Pc+9/qUofD1G2tdjGF75u2Ycb1pl0jx1MqgOncBz6r0lVgrrkpu3LoclG5DRwy5CiuuXP/
 +6quJBThUABiBy4hV7Ti+Y7e0+J78gAWq8e8ZTiFdDdVv7ebcsZq3AeSBWTGwc96DlUIMX
 hSB1nz5sjmt4VC0UKwjF9sgpHbbMgl8dd9nfW03xseICEzctp/QbBIU6gZ5Wjw==
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Maurice Hieronymus <mhi@mailbox.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: use stable name() method in Chipset Display
 impl
Date: Thu,  1 Jan 2026 19:41:36 +0100
Message-ID: <20260101184137.80445-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c12ee0ab6ccfe1fcacb
X-MBO-RS-META: 4myaz3cqa73rzs77hg741bizctpyjbpu
X-Mailman-Approved-At: Thu, 01 Jan 2026 23:02:43 +0000
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

Chipset's Display was using Debug formatting ("{self:?}"), which is not
guaranteed to be stable. Use the existing name() method instead, which
provides stable lowercase strings suitable for firmware path generation.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/gpu/nova-core/gpu.rs | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..be8c882338ea 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
     }
 }
 
-// TODO
-//
-// The resulting strings are used to generate firmware paths, hence the
-// generated strings have to be stable.
-//
-// Hence, replace with something like strum_macros derive(Display).
-//
-// For now, redirect to fmt::Debug for convenience.
 impl fmt::Display for Chipset {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{self:?}")
+        write!(f, "{}", self.name())
     }
 }
 

base-commit: b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
-- 
2.51.2

