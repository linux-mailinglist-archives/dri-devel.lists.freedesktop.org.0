Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346B9DAA60
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39D410EAFC;
	Wed, 27 Nov 2024 15:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PzloyXAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE0510EAFC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732719990; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k9bzAax6RmR5/F5C45GGWZDFpRGAXYP7OeTqFeTTp+4k6UCM64LTAWFLI3tO2vbCxCRMGQN0v3GIPL3/JKCPecW5ts0iRSdV8iQIoBfhfB2TaBeSzPZIuhsIIS7E/i4MEa/t/4pw5hu8qpK9nNRyBDGPkgUNgZWTR1AdyoV5ugE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732719990;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cTB8tVP17iTCkKFJEUEvpmnCqtzZZquvxdFQUNiJ0OQ=; 
 b=XfH9j0lr3L9nX1bzR8topmlg+5dzATMQzgEJ+akN0k25BZVcvVlpNPCi3J/FvD9OpdQCjUzkiEfy6JTQ3s/7zhyPFXa6gBfM+qaUWibnxFKuK14zCifv3bwfN46X0rID2CX4yAXc43i2B/KK58KHiFN5ZbjcVt59oadKD6b4SL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732719990; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=cTB8tVP17iTCkKFJEUEvpmnCqtzZZquvxdFQUNiJ0OQ=;
 b=PzloyXArepdtqElxALV2pCihTwsS1LA36w1rAwZxpgi9tYXVyfzOtePTpdm+oJsK
 Wt+ynMeCwWW8pXC+l1/BHCvYQPWsLlIkOl/QEOVRxPGDtOYkhVFTNVV43dNCSioXZ1D
 F9VKH79/u4YA7DLVHlF1prAzTIfiMNu0jBDdGimE=
Received: by mx.zohomail.com with SMTPS id 1732719989945619.4745434437646;
 Wed, 27 Nov 2024 07:06:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 11/35] rust: drm/kms: Add
 ConnectorGuard::add_modes_noedid()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-12-lyude@redhat.com>
Date: Wed, 27 Nov 2024 12:06:14 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C008D12A-C5C0-46A9-81D7-8B544341A80C@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-12-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External
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

Hi Lyude,

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> A simple binding for drm_add_modes_noedid() using the ConnectorGuard =
type
> we just added.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h  |  2 ++
> rust/kernel/drm/kms/connector.rs | 11 +++++++++++
> 2 files changed, 13 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index ba1871b05b7fa..7695f11f4363c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -10,6 +10,7 @@
> #include <drm/drm_atomic_helper.h>
> #include <drm/drm_device.h>
> #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> #include <drm/drm_file.h>
> #include <drm/drm_fourcc.h>
> #include <drm/drm_fbdev_dma.h>
> @@ -19,6 +20,7 @@
> #include <drm/drm_gem_shmem_helper.h>
> #include <drm/drm_mode_object.h>
> #include <drm/drm_ioctl.h>
> +#include <drm/drm_probe_helper.h>
> #include <kunit/test.h>
> #include <linux/blk-mq.h>
> #include <linux/blk_types.h>
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index 57ab29473c344..7d0f67c3bdaf8 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -378,6 +378,17 @@ fn deref(&self) -> &Self::Target {
>     }
> }
>=20
> +impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
> +    /// Add modes for a [`ConnectorGuard`] without an EDID.
> +    ///
> +    /// Add the specified modes to the connector's mode list up to =
the given maximum resultion.
> +    /// Returns how many modes were added.
> +    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 =
{
> +        // SAFETY: We hold the locks required to call this via our =
type invariants.
> +        unsafe { bindings::drm_add_modes_noedid(self.as_raw(), max_h, =
max_v) }
> +    }
> +}
> +
> // SAFETY: DRM expects this struct to be zero-initialized
> unsafe impl Zeroable for bindings::drm_connector_state {}
>=20
> --=20
> 2.46.1
>=20

LGTM.

=E2=80=94 Daniel

