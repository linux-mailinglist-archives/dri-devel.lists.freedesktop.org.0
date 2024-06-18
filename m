Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D990DFEB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E83410E7FB;
	Tue, 18 Jun 2024 23:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EaWxsBBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30A610E7FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718753622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
 b=EaWxsBBlHh4CQy32WvvC/cvYzSXfulwJ5EAMby9dz8sfWWPMaBy0b2jWvLa/0/WCGZ3HK8
 NMF0FFurp80YLjc22souIdkl/AGP46d9nGrlEzS/iykIGMH8iNshTtthmqIf3r+sVgVGVx
 /uWTGitti8PXQ38yWIMZqLZ/JD59u50=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-jH531qAHOOCRqJgbltCx4A-1; Tue, 18 Jun 2024 19:33:40 -0400
X-MC-Unique: jH531qAHOOCRqJgbltCx4A-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52c805e6f38so4233080e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718753619; x=1719358419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vRjyrj62G3ZTVc+TSdMn/DvpeQf6xGighzoYUQH+3w=;
 b=w9GIB2+aeYtQ6mV6Qb8hdebSapubXNCAe4cUkmx2QjHFEhRHRftF0wwVNdjM1N9rez
 34dy5dyMPGQHzVS86Fw3yWEWvZ6b3jXuOMdcn+ljJTIf10iVEQfSAJ4OTi6r/HL+isHL
 GM7Ms6zyTEVJZxVhKSP8Ww5XpBK1WCkusg4t1j1sdEZ3QWthmSxgOA+mSbIloQkcNhoc
 OWFF/UpubYl3olGa6bm+uIYXS7fVCSB0ajZcrhAOL4AhSoDX+luzXkd6SXPbhRyBiMeN
 inWlKd2W558h892tBMtTAqajpGvknddYfIT8Vi/8sZTTiqJiYeubp+Oydl94cW/Rm/nX
 MxNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSZtOlQV8DCxIIdhGpqCHeOIXHZl1rapQnKwyAKTVsthdpbGicuuzPoJhK93NWaHr0y2pSLnGEU11re9EXSm79MrMp90EV7t/EaC0eosWS
X-Gm-Message-State: AOJu0Ywi4JTXkbiIcGRgRfdAB05P+x5RTOGPfoDoELCXIzBcei87ms5b
 7o4AUtDSfplACx0vRXfjmfKCPrq/KkCOfqhuPSeSncTZE/wOK/GetXcg2Sql6l/9rutocB7tOyi
 1Xc7KD//xweL+ErODW/YTh+dpV4Qo+ewR/dXgfsh5OHTP+PhMuWVf4R48cfCaVKWb7g==
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id
 2adb3069b0e04-52ccaa5856bmr685589e87.7.1718753618842; 
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR5TELOyHF36z9x2sDA7EG2pwK1HEt4LI7J206JjJ23kRVx6cagS1d8R8DZaXj8i3UqYOx4A==
X-Received: by 2002:a05:6512:3d0b:b0:52c:8a88:54c with SMTP id
 2adb3069b0e04-52ccaa5856bmr685559e87.7.1718753618490; 
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f2407sm15548805f8f.72.2024.06.18.16.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 16:33:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 2/8] rust: Add a Sealed trait
Date: Wed, 19 Jun 2024 01:31:38 +0200
Message-ID: <20240618233324.14217-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Asahi Lina <lina@asahilina.net>

Some traits exposed by the kernel crate may not be intended to be
implemented by downstream modules. Add a Sealed trait to allow avoiding
this using the sealed trait pattern.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 5a68b9a5fe03..d83c4c58834f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -68,6 +68,11 @@
 #[doc(hidden)]
 pub use build_error::build_error;
 
+pub(crate) mod private {
+    #[allow(unreachable_pub)]
+    pub trait Sealed {}
+}
+
 /// Prefix to appear before log messages printed from within the `kernel` crate.
 const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
 
-- 
2.45.1

