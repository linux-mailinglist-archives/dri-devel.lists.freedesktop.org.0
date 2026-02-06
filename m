Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH0eG7hshmlaNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:35:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9277103D92
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE7610E251;
	Fri,  6 Feb 2026 22:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OupzJrFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A2B10E251
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770417332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Le3aiYwi9QA3jxc/i9wr8UlZrE+EEzProIFjlbUe4qA=;
 b=OupzJrFC+gTDBK5OVXDdlNKIRveVdfdTJX1YbUIFavmbfSgwNcw5eAaS3S+U9Qw6AQCNkl
 /jc/aqCDjgf0PUMeJioJo4sp65xftsaP8k7Nhyfp51KU/Q6HmZAAa/vmcs/HE4CbortsXd
 HL7IwFnGWJT9wTf5SnfHLpnbZgqB8DA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-4jPKyixaMymbbkTAC_xJwA-1; Fri,
 06 Feb 2026 17:35:28 -0500
X-MC-Unique: 4jPKyixaMymbbkTAC_xJwA-1
X-Mimecast-MFC-AGG-ID: 4jPKyixaMymbbkTAC_xJwA_1770417327
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 800E41955F27; Fri,  6 Feb 2026 22:35:26 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D357619373D8; Fri,  6 Feb 2026 22:35:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
Subject: [PATCH v7 0/7] Rust bindings for gem shmem + iosys_map
Date: Fri,  6 Feb 2026 17:34:24 -0500
Message-ID: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: WxBD2z9H11DaQirDjZfTsSMDqvvh1UaSOvOyPBjh-6I_1770417327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:dakr@kernel.org,m:nouveau@lists.freedesktop.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:lossin@kernel.org,m:acourbot@nvidia.com,m:j@jannau.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B9277103D92
X-Rspamd-Action: no action

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we achieve by introducing a new set of rust bindings
for iosys_map.

The previous version of the patch series can be found here:

https://patchwork.freedesktop.org/series/156093/

This patch series may be applied on top of the
driver-core/driver-core-testing branch:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Changelogs are per-patch

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (5):
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: Introduce iosys_map bindings
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 drivers/gpu/drm/tyr/gem.rs      |   3 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  56 +++-
 rust/helpers/helpers.c          |   2 +
 rust/helpers/iosys_map.c        |  34 +++
 rust/kernel/drm/gem/mod.rs      |  28 +-
 rust/kernel/drm/gem/shmem.rs    | 467 ++++++++++++++++++++++++++++++++
 rust/kernel/iosys_map.rs        | 210 ++++++++++++++
 rust/kernel/lib.rs              |   1 +
 11 files changed, 815 insertions(+), 7 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs
 create mode 100644 rust/kernel/iosys_map.rs


base-commit: 21bab791346e5b7902a04709231c0642ff6d69bc
prerequisite-patch-id: c631986f96e2073263e97e82a65b96fc5ada6924
prerequisite-patch-id: ae853e8eb8d58c77881371960be4ae92755e83c6
prerequisite-patch-id: 0ab78b50648c7d8f66b83c32ed2af0ec3ede42a3
prerequisite-patch-id: 8d20a8db8cf4660c682ee91f3db04e640c144e33
prerequisite-patch-id: 299de9cd2789c19c22e2816f7c817d80d5a4f1db
prerequisite-patch-id: 661ee334905f359daa8fb8d808ed5f4a8085f5c9
prerequisite-patch-id: 05aef545e564948160354e498a3d3c5fd5bbfacb
-- 
2.53.0

