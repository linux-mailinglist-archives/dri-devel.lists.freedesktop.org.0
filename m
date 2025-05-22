Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E6AC0F52
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802910EC43;
	Thu, 22 May 2025 15:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Mgs3MbYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55B10EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747926226; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VaT0+rMMISfANLEhrx1eJeDw3XEdDuO0H1+K3rgnnBDqIhYyPwBvEIb4HnAuAHld5i/OkBw8g+VA9uKWADhzCXZfnA2lpBpMb5jGpgGFugvuuHPiPtxWzmeKgtYsh9LHcfhnGkKtC3Q6H6lhLtHfzMiufoR8/wEOIzNHr0K5aLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747926226;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y1QZHCVzfxwbLKbffCkbbTuzNdwB0qlTI7Ka0fWBIBc=; 
 b=gMpBT9qIfc/XFVFWHYwam0lFFmgvEiiNypO+KQcTDDVcRS9aBiQJcBt6jY56hZGpN4FI8cMeG2a48TniWiea5cHULyqfXkUBMtFDf7mI1EpOFdogjXlBhq3X8j7gHZY4XaDc9HULJqkABKXByJ6GOfyNrs5YgLlHszF1+FUHnmA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747926226; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=y1QZHCVzfxwbLKbffCkbbTuzNdwB0qlTI7Ka0fWBIBc=;
 b=Mgs3MbYHIxOzfkKPolz5IJUMnnuNafNkYVitKYXys0UNAyR4GHJanrBMy4XvsHm5
 opbJkiwT7CEaSZv8wfHbWnY8eSWB5JDW8sN4VjVeU0VoKaZr9vLBb59OOkUjrsRDd5H
 UEpcGnyY2QiJCi4vSI+hJJMujGz/TGg25Bj+KE98=
Received: by mx.zohomail.com with SMTPS id 1747926224476523.4321217431499;
 Thu, 22 May 2025 08:03:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2 01/12] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ab32a3ea-84a0-484c-a07b-85aecf99ae00@amd.com>
Date: Thu, 22 May 2025 12:03:27 -0300
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, "moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <56CCCD08-01BB-40F0-B7BA-CD7DAE2C23D3@collabora.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
 <20250521204654.1610607-2-lyude@redhat.com>
 <ab32a3ea-84a0-484c-a07b-85aecf99ae00@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
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

Hi Christian

> On 22 May 2025, at 05:44, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
> On 5/21/25 22:29, Lyude Paul wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>=20
>> This is just for basic usage in the DRM shmem abstractions for =
implied
>> locking, not intended as a full DMA Reservation abstraction yet.
>=20
> Looks good in general, but my question is if it wouldn't be better to =
export the higher level drm_exec component instead?
>=20
> The drm_exec component implements the necessary loop if you want to =
lock multiple GEM objects at the same time. As well as makes sure that =
those GEM objects can't be released while working with them.
>=20
> Regtards,
> Christian.
>=20

I guess Danilo is the right person to ask, but IIRC the plan was to =
expose the
exec logic as part of the GPUVM abstraction, which is currently work in
progress.

=E2=80=94 Daniel=
