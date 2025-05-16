Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3CABA1A8
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 19:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39B10EB42;
	Fri, 16 May 2025 17:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZtviVyyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3855510EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747415441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SqqXQ0u/im929/mMLP9js8oD6omAmYTkJ6vuyxHmHR4=;
 b=ZtviVyyUPHrGDa7VEbeUXKM/2w9dSE26ebyoXnU010n8TCpqIV8+hkJO3iLWOC05EHgVLy
 5HJUR8ZxdQWzOX3hB+oW+NdizS+RLlN1IxyfYbOH26yGpZ5J/RwnuCFWBXj5IAxgEsvyhg
 uplI68ZARHCLD3O0vgBRMGZMm04yKEw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-ByzUrL92O02iX4Q4pNUlyQ-1; Fri,
 16 May 2025 13:10:38 -0400
X-MC-Unique: ByzUrL92O02iX4Q4pNUlyQ-1
X-Mimecast-MFC-AGG-ID: ByzUrL92O02iX4Q4pNUlyQ_1747415436
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 94E54180087B; Fri, 16 May 2025 17:10:35 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AD28719560AE; Fri, 16 May 2025 17:10:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/4] rust: drm: gem: More (and final) cleanup
Date: Fri, 16 May 2025 13:09:15 -0400
Message-ID: <20250516171030.776924-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Look mom, no generic soup!

Anyway - this is just the last of the cleanup stuff I ended up while
working on cleaning up the gem shmem patch series. It simplifies the use
of generics and also adds a type alias for some very long types
currently in use. Also, drop one unused constant I noticed.

Applies on top of nova/nova-next:
  https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Lyude Paul (4):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverObject type alias
  rust: drm: gem: Add ObjectFile type alias
  rust: drm: gem: Drop Object::SIZE

 rust/kernel/drm/gem/mod.rs | 102 ++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 58 deletions(-)


base-commit: 38cb08c3fcd3f3b1d0225dcec8ae50fab5751549
-- 
2.49.0

