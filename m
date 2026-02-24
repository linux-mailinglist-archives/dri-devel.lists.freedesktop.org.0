Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mACkCTOJnWnBQQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:19:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CF1860C7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 12:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91EB10E2FD;
	Tue, 24 Feb 2026 11:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ni5jHbXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D1910E2FD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 11:19:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D31A41835;
 Tue, 24 Feb 2026 11:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E760C116D0;
 Tue, 24 Feb 2026 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771931951;
 bh=ETQpOfT+9mRvOB/13pm/mxYN/3+tJD4a1mkuBe/uzcY=;
 h=From:Subject:Date:To:Cc:From;
 b=ni5jHbXnK97clga4K+MDRHITiQB4e6ojDUOBS2aEhSZb8xlZq8Afb+R4l4EjwJfhS
 Tu5wZ0Eb/3k8TLhsps4YgOM++Ztjt1LIKXlzyAtCL7yK3J+jTfucPqiUw7pWEJ/C7o
 4zTenmJ1NWQdJCqB9XcjrWyjAGGda7TAQnS7niUv0fX7txN4kHPMzTPm2nTu0/Z8Jy
 l3xeF/hx2QuyRX8T/tiwFAVaVAhSDBRooMr9LXifD6tWbYzXeHbb8jyPbIeawwDXKm
 c97RDmvrOA553wgiOdc/hT1Iove7mH20/FiKpX/Lpf5HHrXMg67rjvXTtOGrC9RoJf
 cMfpAYT1glo3A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v16 00/10] rust: add `Ownable` trait and `Owned` type
Date: Tue, 24 Feb 2026 12:17:55 +0100
Message-Id: <20260224-unique-ref-v16-0-c21afcb118d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOInWkC/1WMwQ6CMBAFf4Xs2ZptoYV68j+MB1oWaDRFWyEaw
 r9bOMHxzcvMDJGCowiXbIZAk4tu8GlwdcrA9rXviLkmARAoJOYo2ejdeyQWqGVCt7ZRpWw1aUj
 CK0H33Wq3e9q9i58h/Lb4xIsVrx2FAot9J30MGS+tEZpMbY25Pih4ep6H0MFamrjc2QKPtkx2p
 XNqKmVQWXuwl2X5A8NqfJTmAAAA
X-Change-ID: 20250305-unique-ref-29fcd675f9e9
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
 Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, 
 Oliver Mangold <oliver.mangold@pm.me>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7697; i=a.hindborg@kernel.org; 
 h=from:subject:message-id;
 bh=ETQpOfT+9mRvOB/13pm/mxYN/3+tJD4a1mkuBe/uzcY=; 
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpnYjm1MAZgtDuaM4LgRM/TU2b9K/LDkwt3nKjK
 H7yejbRVeGJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZ2I5gAKCRDhuBo+eShj
 d+gvD/0V6lU4+rTLuz6f4PZvwzg+ML9dkM1Z/6DCT705wg+vauLnNPBI49MbfslFc04dAhI69G2
 XGYmtX2Bx4Nb2uNO3UQFYmnwTNf2fCxedGUEwRNLAwJdnB5bkZbpzvvFM0hYqamTCmYTORgsuGT
 ga4qN6cnTstPKhnw5yA3E9838CnZ2jvUhwWXWKtcd2bQ/A9uCpeQdQdqmBT+KgNryDiEN/oNMCv
 BODC+GqSH6V82bMsrek9oHuWOYdai5Pbm9KyVscV4QU9EQKzqsN7CbSkiT4hZfYhnxeBc7rv2WH
 abQeMbppAkp7zKmfpjr2yqPz9zz5wVtB9lVQtXXsLRFLnCIStqyZDRjMaCRi0j7JnpqraI/G8qp
 coOKkAiyrClLpdm5Km04JYDsztuH4VceDbw8PUu90b1HHwVt6G71WN5sfCatCL99QHzIHe4uCPB
 zuFtM+mdSu1838hHY6PPRGfPm/x+z3dVcZaD73++HUPiT58Y7NUzo09u+Nyhyx7Jh+BuoqW3Z+Q
 O9DkX50jFd7TtCIqV5DnD/rKzTB0Lwb7i+I3bo/cOuxHEYR282zvjVmEmvhboxPwMpmBtUM08pp
 O9WICRBIIAxuR5JPNT53gOBnhZFTWQ9y0n5VUtJIivWGGYD6HYz8mWjzihaFdRYMRHwdMZM5paI
 Ck6zdtadWb213xA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7
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
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[types.rs:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:vbabka@suse.cz,m:urezki@gmail.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:a.hindborg@kernel.org,m:lina+kernel@asahilina.net,m:ol
 iver.mangold@pm.me,m:viresh.kumar@linaro.org,m:igorkorotinlinux@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	NEURAL_SPAM(0.00)[0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pid_namespace.rs:url,owned.rs:url,msgid.link:url]
X-Rspamd-Queue-Id: 960CF1860C7
X-Rspamd-Action: add header
X-Spam: Yes

Add a new trait `Ownable` and type `Owned` for types that specify their
own way of performing allocation and destruction. This is useful for
types from the C side.

Add the trait `OwnableRefCounted` that allows conversion between
`ARef` and `Owned`. This is analogous to conversion between `Arc` and
`UniqueArc`.

Convert `Page` to be `Ownable` and add a `from_raw` method.

Implement `ForeignOwnable` for `Owned`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v16:
- Simplify pointer to reference cast in `Page::from_raw`.
- Use `NonNull<Page>` rather than `Owned<Page>` for `BorrowedPage` internals.
- Use "convertible to reference" wording when converting pointers to references.
- Fix formatting for `Page::from_raw` docs.
- Leave imports alone when adding safety comment to aref example.
- Use `KBox::into_nonnull` for examples.
- Add patch for `KBox::into_nonnull`.
- Change invariants and safety comments of `Ownable` and make the trait safe.
- Make `Ownable::release` take a mutable reference.
- Fix error handling in example for `Ownable`
- Link to v15: https://msgid.link/20260220-unique-ref-v15-0-893ed86b06cc@kernel.org

Changes in v15:
- Update series with original SoB's.
- Rename `AlwaysRefCounted` in `kernel::usb`.
- Rename `Owned::get_pin_mut` to `Owned::as_pin_mut`.
- Link to v14: https://msgid.link/20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org

Changes in v14:
- Rebase on v6.19-rc7.
- Rewrite cover letter.
- Update documentation and safety comments based on v13 feedback.
- Update commit messages.
- Reorder implementation blocks in owned.rs.
- Update example in owned.rs to use try operator rather than `expect`.
- Reformat use statements.
- Add patch: rust: page: convert to `Ownable`.
- Add patch: rust: implement `ForeignOwnable` for `Owned`.
- Add patch: rust: page: add `from_raw()`.
- Link to v13: https://lore.kernel.org/r/20251117-unique-ref-v13-0-b5b243df1250@pm.me

Changes in v13:
- Rebase onto v6.18-rc1 (Andreas's work).
- Documentation and style fixes contributed by Andreas
- Link to v12: https://lore.kernel.org/r/20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me

Changes in v12:
-
- Rebase onto v6.17-rc1 (Andreas's work).
- moved kernel/types/ownable.rs to kernel/owned.rs
- Drop OwnableMut, make DerefMut depend on Unpin instead. I understood
  ML discussion as that being okay, but probably needs further scrunity.
- Lots of more documentation changes suggested by reviewers.
- Usage example for Ownable/Owned.
- Link to v11: https://lore.kernel.org/r/20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me

Changes in v11:
- Rework of documentation. I tried to honor all requests for changes "in
  spirit" plus some clearifications and corrections of my own.
- Dropping `SimpleOwnedRefCounted` by request from Alice, as it creates a
  potentially problematic blanket implementation (which a derive macro that
  could be created later would not have).
- Dropping Miguel's "kbuild: provide `RUSTC_HAS_DO_NOT_RECOMMEND` symbol"
  patch, as it is not needed anymore after dropping `SimpleOwnedRefCounted`.
  (I can add it again, if it is considered useful anyway).
- Link to v10: https://lore.kernel.org/r/20250502-unique-ref-v10-0-25de64c0307f@pm.me

Changes in v10:
- Moved kernel/ownable.rs to kernel/types/ownable.rs
- Fixes in documentation / comments as suggested by Andreas Hindborg
- Added Reviewed-by comment for Andreas Hindborg
- Fix rustfmt of pid_namespace.rs
- Link to v9: https://lore.kernel.org/r/20250325-unique-ref-v9-0-e91618c1de26@pm.me

Changes in v9:
- Rebase onto v6.14-rc7
- Move Ownable/OwnedRefCounted/Ownable, etc., into separate module
- Documentation fixes to Ownable/OwnableMut/OwnableRefCounted
- Add missing SAFETY documentation to ARef example
- Link to v8: https://lore.kernel.org/r/20250313-unique-ref-v8-0-3082ffc67a31@pm.me

Changes in v8:
- Fix Co-developed-by and Suggested-by tags as suggested by Miguel and Boqun
- Some small documentation fixes in Owned/Ownable patch
- removing redundant trait constraint on DerefMut for Owned as suggested by Boqun Feng
- make SimpleOwnedRefCounted no longer implement RefCounted as suggested by Boqun Feng
- documentation for RefCounted as suggested by Boqun Feng
- Link to v7: https://lore.kernel.org/r/20250310-unique-ref-v7-0-4caddb78aa05@pm.me

Changes in v7:
- Squash patch to make Owned::from_raw/into_raw public into parent
- Added Signed-off-by to other people's commits
- Link to v6: https://lore.kernel.org/r/20250310-unique-ref-v6-0-1ff53558617e@pm.me

Changes in v6:
- Changed comments/formatting as suggested by Miguel Ojeda
- Included and used new config flag RUSTC_HAS_DO_NOT_RECOMMEND,
  thus no changes to types.rs will be needed when the attribute
  becomes available.
- Fixed commit message for Owned patch.
- Link to v5: https://lore.kernel.org/r/20250307-unique-ref-v5-0-bffeb633277e@pm.me

Changes in v5:
- Rebase the whole thing on top of the Ownable/Owned traits by Asahi Lina.
- Rename AlwaysRefCounted to RefCounted and make AlwaysRefCounted a
  marker trait instead to allow to obtain an ARef<T> from an &T,
  which (as Alice pointed out) is unsound when combined with UniqueRef/Owned.
- Change the Trait design and naming to implement this feature,
  UniqueRef/UniqueRefCounted is dropped in favor of Ownable/Owned and
  OwnableRefCounted is used to provide the functions to convert
  between Owned and ARef.
- Link to v4: https://lore.kernel.org/r/20250305-unique-ref-v4-1-a8fdef7b1c2c@pm.me

Changes in v4:
- Just a minor change in naming by request from Andreas Hindborg,
  try_shared_to_unique() -> try_from_shared(),
  unique_to_shared() -> into_shared(),
  which is more in line with standard Rust naming conventions.
- Link to v3: https://lore.kernel.org/r/Z8Wuud2UQX6Yukyr@mango

---
Andreas Hindborg (5):
      rust: alloc: add `KBox::into_nonnull`
      rust: aref: update formatting of use statements
      rust: page: update formatting of `use` statements
      rust: implement `ForeignOwnable` for `Owned`
      rust: page: add `from_raw()`

Asahi Lina (2):
      rust: types: Add Ownable/Owned types
      rust: page: convert to `Ownable`

Oliver Mangold (3):
      rust: rename `AlwaysRefCounted` to `RefCounted`.
      rust: Add missing SAFETY documentation for `ARef` example
      rust: Add `OwnableRefCounted`

 rust/kernel/alloc/kbox.rs       |   8 +
 rust/kernel/auxiliary.rs        |   7 +-
 rust/kernel/block/mq/request.rs |  15 +-
 rust/kernel/cred.rs             |  13 +-
 rust/kernel/device.rs           |  10 +-
 rust/kernel/device/property.rs  |   7 +-
 rust/kernel/drm/device.rs       |  10 +-
 rust/kernel/drm/gem/mod.rs      |   8 +-
 rust/kernel/fs/file.rs          |  16 +-
 rust/kernel/i2c.rs              |  16 +-
 rust/kernel/lib.rs              |   1 +
 rust/kernel/mm.rs               |  15 +-
 rust/kernel/mm/mmput_async.rs   |   9 +-
 rust/kernel/opp.rs              |  10 +-
 rust/kernel/owned.rs            | 350 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/page.rs             |  61 +++++--
 rust/kernel/pci.rs              |  10 +-
 rust/kernel/pid_namespace.rs    |  12 +-
 rust/kernel/platform.rs         |   7 +-
 rust/kernel/sync/aref.rs        |  78 ++++++---
 rust/kernel/task.rs             |  10 +-
 rust/kernel/types.rs            |  13 +-
 rust/kernel/usb.rs              |  15 +-
 23 files changed, 617 insertions(+), 84 deletions(-)
---
base-commit: b8d687c7eeb52d0353ac27c4f71594a2e6aa365f
change-id: 20250305-unique-ref-29fcd675f9e9

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


