Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LDuCnVxcWkPHAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 01:38:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EB75FF9A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 01:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA14E10E0B6;
	Thu, 22 Jan 2026 00:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="BuX1HarW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7445F10E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 00:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769042284; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TlMPaHTO3Csgbi9QylWtdn/sY05JB6SW/VjLuP9R70UVysciyOVYa68rsKfh+ND7HMwKynQs5J5I+D96HoKYBBReJUJE6xvLXrQ7PssLBs6ySnsTWp5nIC3cYVjclbHkAtMCQ8sUzq8nuM1f1LfaAZZTX34AVKnhliWBlEmhkRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769042284;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PKQ3OMXGxwDFvD97qd6tvylwNytfpk6i3gMHCcDTjXc=; 
 b=krbQxH0Ykew7G3ChI/mc+HMLUyfHgLLLcvsk6xYrNvk1kxCteVF1DI4sSlm3CP6U6jbEOsSLp1QwG4vnCrw26aBxmmXCAS3GMq8zP1xxQV75/3nTt9uc478tT2lo6JXNkzNVg6Upm7YenAmpq5K3QaH3ZA6IqW2/Y9vLXz3CrqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769042284; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PKQ3OMXGxwDFvD97qd6tvylwNytfpk6i3gMHCcDTjXc=;
 b=BuX1HarW7SV8pERf0IAu6kROvVn3rhfO2/+YSLEKIPdcuCVy594YymyvV1cW+ELT
 acTLlhWMar9Uw7PKjulQcWFOnjXS1Tb4Bs3Un3/O7rkfGJttEaUPEnELI+kvkrhpL2+
 7GxC1zwHOALTZC4ClmGma0ODuh8/48STc/O3YnQw=
Received: by mx.zohomail.com with SMTPS id 1769042283476199.73502584415917;
 Wed, 21 Jan 2026 16:38:03 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org,
 miguel.ojeda.sandonis@gmail.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: suppress unread field warnings
Date: Wed, 21 Jan 2026 16:37:46 -0800
Message-ID: <20260122003746.405370-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 69EB75FF9A
X-Rspamd-Action: no action

Currently these warnings, as errors, are preventing Tyr driver
from building:

error: field `device` is never read
  --> drivers/gpu/drm/tyr/driver.rs:37:5
   |
36 | pub(crate) struct TyrDriver {
   |                   --------- field in this struct
37 |     device: ARef<TyrDevice>,
   |     ^^^^^^
   |
   = note: `-D dead-code` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(dead_code)]`

error: fields `mali` and `sram` are never read
   --> drivers/gpu/drm/tyr/driver.rs:196:5
    |
195 | struct Regulators {
    |        ---------- fields in this struct
196 |     mali: Regulator<regulator::Enabled>,
    |     ^^^^
197 |     sram: Regulator<regulator::Enabled>,
    |     ^^^^

error: aborting due to 2 previous errors

Suppress these errors so that the Tyr driver will build.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..04c865cb4397 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -34,6 +34,7 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
+    #[allow(dead_code)]
     device: ARef<TyrDevice>,
 }
 
@@ -193,6 +194,8 @@ struct Clocks {
 
 #[pin_data]
 struct Regulators {
+    #[allow(dead_code)]
     mali: Regulator<regulator::Enabled>,
+    #[allow(dead_code)]
     sram: Regulator<regulator::Enabled>,
 }
-- 
2.52.0

