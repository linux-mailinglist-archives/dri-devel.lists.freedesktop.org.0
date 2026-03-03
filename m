Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLrKF4tPp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE661F74D6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412D810E8D2;
	Tue,  3 Mar 2026 21:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dwcPEOXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0CB10E8F6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772572551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
 b=dwcPEOXWn4opOtp5G4RGm5qe6Qz8rm7pfGdh0iMeUmwtKZG1yxHkIjnz/6sJhozPAg+jGw
 BPhmntvzfQDpKMFQMutl5w4Jxup0LEhbRpr7gCvdTgViYsgeXzt/BoyBXL0C3zI7P4NxJL
 YVXY5CJRUTZn9VOUgJbM7LkXFNyw/XU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-XPEMsJ-LMbiHfHXgcepSKA-1; Tue, 03 Mar 2026 16:15:50 -0500
X-MC-Unique: XPEMsJ-LMbiHfHXgcepSKA-1
X-Mimecast-MFC-AGG-ID: XPEMsJ-LMbiHfHXgcepSKA_1772572550
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50340e2b4dfso653365351cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772572550; x=1773177350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
 b=B4qNEZbPT/CpxzHjCLOQaUdunrS+8JP7hl1AFfyosSAmb00YBc0c7naSv4gfhnoIVr
 a5KOMUoESZUdsnZnxVEAeqpfcm6mX0Bwvxv5jqC7SpYWU+3j7Uoolf0vSJtMR1iHFGTU
 hKKiap529kUPA37O9QeMMrg51K6+LNTd1uoTniuUQNbfcaV27scp587aV36nP/Od81gY
 WVazSQOyJdYu3i+GN4uXzLKGoJIYP2mg4EwDkAvRcst0PSoXKhqV3Nl2kKjtNRG/18bV
 Dcz2VwFZKzjNyZ80mU26cGOuKch9Kxn+qSTiPND7QunRcleRzPHG3VqfVzJ6bAlWw386
 tSsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlI7otObb9kODTTvJ96pk+5WHR6JFC76mKkTaYNVwrpthBteP2MR80O0/gCymQSgZvroX0HG5RyGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3R0r6i/lyyzLfsKyZKSd9RmLelnU3f6cWmupRs/j6Rdjk3UCm
 pFjzq1LWy7jwJRsoJbUq0bpvJ2FhiRg5k3BDMuDFK2r4Cb/HGOfmvizVk8wZPLa1kozZKjtyzgs
 A8DN80vuHqdu/ZFz1R4l4DTGxv1sFTvB/R5R0eK4gdVbHjUd64tweYw5JGPdK57CWk3G/Bpa2n/
 gjkt7Plg/s1FAhWbJH5lJzK8b5WQaH73TRitjYccEhZO2qoEcdn/NxYpGt
X-Gm-Gg: ATEYQzx2BJ5c9dsy3xXBwBrLn2n8B5rCgxBkuPQ5RQ4v0zxpN+9I2nLU2cnDELFS2wc
 GnaScKNUDJ9NpXn2fvPR9lQGSdEoT+H1ut5zpw1a9vvkqarjcZpYdmOkEq7zjrRRsxDrwgX474a
 /F4SqJ5i1qQ8IrooW8Ivb6cj1WtKffJzaF168MxM49kb9PPO1wG8DsYE5noO1c4ynaYHy3LFmXt
 8LVg85eAPAYz+JzrqZlcDBhGCnVGGRQz3HBCLM14ZzrZYa+FA7RU4E5hYUyUPk+LCmnIkueVwJA
 SyuqU7f7u3QtbIgQwFXHwYMRc1yYGMbOKEZVqT4FMVmVpQBiH9XmK7cQZmQDyN3AhptqI+QaoUe
 Ra46UnLH1g8HsOSpVittmeLFWzA==
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id
 d75a77b69052e-507528db6e5mr222734801cf.58.1772572549704; 
 Tue, 03 Mar 2026 13:15:49 -0800 (PST)
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id
 d75a77b69052e-507528db6e5mr222733911cf.58.1772572549028; 
 Tue, 03 Mar 2026 13:15:49 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 13:15:47 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:28 -0500
Subject: [PATCH v3 08/10] rust: pci: add num_vf(), to return number of VFs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-8-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ga-3aJIJFi43ZsR_uHy00dAifKTzdzoz2_zovsZdXjY_1772572550
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 0FE661F74D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:yilun.xu@intel.com,m:trix@redhat.com,m:mdf@kernel.org,m:rafael@kernel.org,m:boqun@kernel.org,m:linux-pci@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acourbot@nvidia.com,m:apopple@nvidia.com,m:joelagnelf@nvidia.com,m:jhubbard@nvidia.com,m:zhiw@nvidia.com,m:nouveau@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-fpga@vger.kernel.org,m:driver-core@lists.linux.dev,m:pcolberg@redhat.com,m:jgg@ziepe.ca,m:alexgaynor@gmail.com,m:abdieljanulgue@gmail.com
 ,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,redhat.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pcolberg@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.53.0

