Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C310ABB28E7
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362F10E782;
	Thu,  2 Oct 2025 05:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="gq5cdMSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6596A10E6F5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1759309417; x=1759568617;
 bh=k2cd0h/lNPW6oKirfHBNFEiPHjT+8NPzCf04+VSLOsg=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=gq5cdMSmMRJ5eEdQ74b46Afg4C59ln8vt80/KmbouM+MFTl2033f/pBX9xzcIeq3c
 enT4MAXopZCXXM6u8MfmhBxjUT6n5m1ghFZIaA2NLIUKRLBpebo7Nl/W+xz25bSdkL
 pM227Wrf+Pf1aQ+0s6p0RpRpMvHjcnf3aX8YNIB7KGbhAhc8bcRGXGXurIHssikDkl
 1q8ZroZcQt16iBc6K+0cXAsicmMEPNQQEwLMybDsThZ0uWpfeXrXHudarIT9Ec323i
 DZ8DMK1X2WbiT+Fk9grZNvAGMjnvy5Kb/X5WF3YPKUnQOnedseFZJOWs8WudYT4Zme
 ksS29du6VknaQ==
Date: Wed, 01 Oct 2025 09:03:31 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: [PATCH v12 0/4] New trait OwnableRefCounted for ARef<->Owned
 conversion.
Message-ID: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 05f6e75cf8354eecb1d79bcf61223bca92da5f3d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:29 +0000
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

This allows to convert between ARef<T> and Owned<T> by
implementing the new trait OwnedRefCounted.

This way we will have a shared/unique reference counting scheme
for types with built-in refcounts in analogy to Arc/UniqueArc.

Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
---
Changes in v12:
-
- Rebase onto v6.17-rc1 (Andreas's work).
- moved kernel/types/ownable.rs to kernel/owned.rs
- Drop OwnableMut, make DerefMut depend on Unpin instead. I understood
  ML discussion as that being okay, but probably needs further scrunity.
- Lots of more documentation changes suggested by reviewers.
- Usage example for Ownable/Owned.
- Link to v11: https://lore.kernel.org/r/20250618-unique-ref-v11-0-49eadcdc=
0aa6@pm.me

Changes in v11:
- Rework of documentation. I tried to honor all requests for changes "in
  spirit" plus some clearifications and corrections of my own.
- Dropping `SimpleOwnedRefCounted` by request from Alice, as it creates a
  potentially problematic blanket implementation (which a derive macro that
  could be created later would not have).
- Dropping Miguel's "kbuild: provide `RUSTC_HAS_DO_NOT_RECOMMEND` symbol"
  patch, as it is not needed anymore after dropping `SimpleOwnedRefCounted`=
.
  (I can add it again, if it is considered useful anyway).
- Link to v10: https://lore.kernel.org/r/20250502-unique-ref-v10-0-25de64c0=
307f@pm.me

Changes in v10:
- Moved kernel/ownable.rs to kernel/types/ownable.rs
- Fixes in documentation / comments as suggested by Andreas Hindborg
- Added Reviewed-by comment for Andreas Hindborg
- Fix rustfmt of pid_namespace.rs
- Link to v9: https://lore.kernel.org/r/20250325-unique-ref-v9-0-e91618c1de=
26@pm.me

Changes in v9:
- Rebase onto v6.14-rc7
- Move Ownable/OwnedRefCounted/Ownable, etc., into separate module
- Documentation fixes to Ownable/OwnableMut/OwnableRefCounted
- Add missing SAFETY documentation to ARef example
- Link to v8: https://lore.kernel.org/r/20250313-unique-ref-v8-0-3082ffc67a=
31@pm.me

Changes in v8:
- Fix Co-developed-by and Suggested-by tags as suggested by Miguel and Boqu=
n
- Some small documentation fixes in Owned/Ownable patch
- removing redundant trait constraint on DerefMut for Owned as suggested by=
 Boqun Feng
- make SimpleOwnedRefCounted no longer implement RefCounted as suggested by=
 Boqun Feng
- documentation for RefCounted as suggested by Boqun Feng
- Link to v7: https://lore.kernel.org/r/20250310-unique-ref-v7-0-4caddb78aa=
05@pm.me

Changes in v7:
- Squash patch to make Owned::from_raw/into_raw public into parent
- Added Signed-off-by to other people's commits
- Link to v6: https://lore.kernel.org/r/20250310-unique-ref-v6-0-1ff5355861=
7e@pm.me

Changes in v6:
- Changed comments/formatting as suggested by Miguel Ojeda
- Included and used new config flag RUSTC_HAS_DO_NOT_RECOMMEND,
  thus no changes to types.rs will be needed when the attribute
  becomes available.
- Fixed commit message for Owned patch.
- Link to v5: https://lore.kernel.org/r/20250307-unique-ref-v5-0-bffeb63327=
7e@pm.me

Changes in v5:
- Rebase the whole thing on top of the Ownable/Owned traits by Asahi Lina.
- Rename AlwaysRefCounted to RefCounted and make AlwaysRefCounted a
  marker trait instead to allow to obtain an ARef<T> from an &T,
  which (as Alice pointed out) is unsound when combined with UniqueRef/Owne=
d.
- Change the Trait design and naming to implement this feature,
  UniqueRef/UniqueRefCounted is dropped in favor of Ownable/Owned and
  OwnableRefCounted is used to provide the functions to convert
  between Owned and ARef.
- Link to v4: https://lore.kernel.org/r/20250305-unique-ref-v4-1-a8fdef7b1c=
2c@pm.me

Changes in v4:
- Just a minor change in naming by request from Andreas Hindborg,
  try_shared_to_unique() -> try_from_shared(),
  unique_to_shared() -> into_shared(),
  which is more in line with standard Rust naming conventions.
- Link to v3: https://lore.kernel.org/r/Z8Wuud2UQX6Yukyr@mango

---
Asahi Lina (1):
      rust: types: Add Ownable/Owned types

Oliver Mangold (3):
      `AlwaysRefCounted` is renamed to `RefCounted`.
      rust: Add missing SAFETY documentation for `ARef` example
      rust: Add `OwnableRefCounted`

 rust/kernel/auxiliary.rs        |   7 +-
 rust/kernel/block/mq/request.rs |  14 +-
 rust/kernel/cred.rs             |   7 +-
 rust/kernel/device.rs           |   9 +-
 rust/kernel/device/property.rs  |   7 +-
 rust/kernel/drm/device.rs       |   9 +-
 rust/kernel/drm/gem/mod.rs      |   7 +-
 rust/kernel/fs/file.rs          |  13 +-
 rust/kernel/lib.rs              |   1 +
 rust/kernel/mm.rs               |  12 +-
 rust/kernel/mm/mmput_async.rs   |   7 +-
 rust/kernel/opp.rs              |   7 +-
 rust/kernel/owned.rs            | 318 ++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/pci.rs              |   7 +-
 rust/kernel/pid_namespace.rs    |   7 +-
 rust/kernel/platform.rs         |   7 +-
 rust/kernel/sync/aref.rs        |  67 ++++++---
 rust/kernel/task.rs             |   7 +-
 rust/kernel/types.rs            |   4 +-
 19 files changed, 474 insertions(+), 43 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250305-unique-ref-29fcd675f9e9

Best regards,
--=20
Oliver Mangold <oliver.mangold@pm.me>


