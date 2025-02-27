Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C69A49879
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60C10EC62;
	Fri, 28 Feb 2025 11:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4CE10EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received; s=s1; t=1740654237; x=1742468638;
 bh=TVxgBJxmZfiHsWtX8JFHPCWQpRFrk1VLF7e9y8dPpiQ=; b=C04sIOcZN1cd
 DQHAM9eki5k77SLJlz4yCobjprjhk8naYHlwzNv1L14TcBNizFSTRhWIiYLMSPAi
 /9yQk68zflD8EiRDbCb9vJhbhR4otMHExeDuh0mPZs+Tx0boONCPKxCEo003sJ+6
 r0r0B2O/w9bzpe4lr7qQO8kXLspW2oU=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 56FDE2C0125
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:57 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276639; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
Subject: [PATCH 10/10] dcc-send: Fix freeze when video stream is stopped
 during ongoing draw
Date: Thu, 27 Feb 2025 12:03:32 +0100
Message-ID: <5245ba7dd46644371b7c2b8495e4650ec987c598.1740651328.git.michael.scherle@rz.uni-freiburg.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
References: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

Prevent a freeze that occurs if the video stream is stopped while a
gl draw is in progress (e.g., when the client requests a new codec).
Ensure proper cleanup of the ongoing gl draw.

Signed-off-by: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
---
 server/dcc-send.cpp | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/server/dcc-send.cpp b/server/dcc-send.cpp
index 7bc20a22..71873563 100644
--- a/server/dcc-send.cpp
+++ b/server/dcc-send.cpp
@@ -2383,6 +2383,10 @@ static void marshall_gl_draw(DisplayChannelClient *dcc,
         spice_marshall_msg_display_gl_draw(m, &p->draw);
     } else if (DCC_TO_DC(dcc)->priv->gl_draw_stream) {
         red_marshall_gl_draw_stream(dcc, m);
+    } else if (dcc->priv->gl_draw_ongoing) {
+        DisplayChannel *display = DCC_TO_DC(dcc);
+        dcc->priv->gl_draw_ongoing = false;
+        display_channel_gl_draw_done(display);
     } else {
         spice_warning("nothing to send to the client");
     }
-- 
2.48.1

