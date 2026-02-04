Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKIQN+qug2lOswMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:41:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9DEC855
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 21:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8660C10E771;
	Wed,  4 Feb 2026 20:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SyS1dukD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8AC10E771
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770237669;
 bh=o7a0hN8233hHD9BCGtRr6Gh5sxlycp6ly9Wn2+YrBFA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SyS1dukDcR/c7zbhQ7vznUHuIeMeHu0yfGFL4BSrGd2Q3hNrfKx+mAtsRqMxCS6XR
 cr+6gdoqPOofn8e75V+HG6SM2uJ6e/N8GEF+EielAP8IzzaE6kz9EPnbstIsldr6wB
 acVSqw9JUsgknWUP8N6j5toRNqtoYNq8t3rfF/FzEzkDFOkc2jExVGaKmQCtl3VKy4
 LbKqJB5dgN4Xjmw5zYP4V1HRXCpDwTY8iohOajQWPVJQvYPUNMr51pMU9l3qRH9dBQ
 13665TqyAhg84FtxktlvgapuE4GfmmlnW1s0euPxBOyBYIRjgDOXuQFMuG2ucugJc4
 pOXk3l6BA9ORw==
Received: from [192.168.0.79] (unknown
 [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3B1317E13D3;
 Wed,  4 Feb 2026 21:41:06 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 04 Feb 2026 17:40:41 -0300
Subject: [PATCH v2 3/4] rust: workqueue: add delayed work support for ARef<T>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-aref-workitem-v2-3-bec25b012d2a@collabora.com>
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
In-Reply-To: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:daniel.almeida@collabora.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7CA9DEC855
X-Rspamd-Action: no action

The preceding patches added support for ARef<T> work items. By the same
token, add support for delayed work items too.

The rationale is the same: it may be convenient or even necessary at times
to implement HasDelayedWork directly on ARef<T>. A follow up patch will
also implement support for drm::Device as the first user.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/workqueue.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6ae7f3fb3496..4ee4ff567197 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1007,6 +1007,17 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
+// `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
+// the `delayed_work` has the same access rules as its `work` field.
+unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for ARef<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasDelayedWork<T, ID>,
+    T: AlwaysRefCounted,
+{
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are

-- 
2.52.0

