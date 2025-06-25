Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A3AE8E51
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 21:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6210E7DB;
	Wed, 25 Jun 2025 19:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ET9LuHMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F21810E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 19:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750879014; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IupojBcgiuJFEfYbMOO2Yq4WbPyu4PoiSeS/cjsqsvipeh7SwGrXk5aSN9ohUIoazDWxAVpPLMUlIPaRamN1Ci8m2jL7B5Gzr6TEu5HZLOffo4n7nVdjPpDKYL09gBOSjy7UFuqlpKREmbZd6+PM0aDToqoSV6xjnigwQX1O0HE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750879014;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mXp/NJEKK2k9Y06sPTp+De6aiQuPK+J2/l3zBut2c/A=; 
 b=VH4wGgKwym8pq4m/6lwlRAIRVxrYOK4BRK3O7mTPCOC5mbw28US9seDqF+lb4TezwiTGZyIWIsq+aKVnOVNzY7Nn6+cmQwMSwJIfAA3hfl3WveJ8Q3NH6v1oEu4jb72yMc3t61FHEcXP0RBi8H7jvPugvy8t0sbPsrv7KbY5/HU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750879014; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=mXp/NJEKK2k9Y06sPTp+De6aiQuPK+J2/l3zBut2c/A=;
 b=ET9LuHMGh6U8m3sABooFAIdJNWQ8UaCChyGIHCcoqhBj4QcaJqLRL/ohF+0yztuh
 ybdkAK5XoESv6BtyPDQh6Etm1iJEs6FOEAOG/v+TckvV8SXRchvl9UyKRnFolVnIMCg
 7N/tdp/Jh5kZeOl9GN4ly72SJHGvoWQqvz9WUOXQ=
Received: by mx.zohomail.com with SMTPS id 1750879012416705.8054775099233;
 Wed, 25 Jun 2025 12:16:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
Date: Wed, 25 Jun 2025 16:16:36 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D78A0E7-9CA7-4E04-AD55-11254DF66ED8@collabora.com>
References: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

Hmm, this has an issue

[..]

>=20
> +impl<A: AllocInner<T>, T> Drop for MmInner<A, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: If the MmInner is dropped then all nodes are gone =
(since they hold references),
> +        // so it is safe to tear down the allocator.
> +        unsafe {
> +            bindings::drm_mm_takedown(self.0.get());
> +        }
> +    }
> +}
> +
>=20

Where the docs for drm_mm_takedown states:

/**
* drm_mm_takedown - clean up a drm_mm allocator
* @mm: drm_mm allocator to clean up
*
* Note that it is a bug to call this function on an allocator which is =
not
* clean.
*/
void drm_mm_takedown(struct drm_mm *mm)
{
if (WARN(!drm_mm_clean(mm),
"Memory manager not clean during takedown.\n"))
show_leaks(mm);
}
EXPORT_SYMBOL(drm_mm_takedown);


So perhaps we should remove all nodes before takedown?

This covers the error path, i.e.: something failed somewhere else and =
the allocator is dirty.

=E2=80=94 Daniel=
