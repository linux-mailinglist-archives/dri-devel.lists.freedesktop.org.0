Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9EB42C4A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184AF10E94C;
	Wed,  3 Sep 2025 21:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="DuzAzvK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09F10E949;
 Wed,  3 Sep 2025 21:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756936613; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GM6nLjyZuteRAkN8U4nk4u1gh2FKLfMYsSMI7biJiaEucMgIFRquZunhe2tqEpVmJbdeCuWYXp1z1LZm4ufUfyB8Y+TggKdEzgTkqKklnLEeVmlOPhYbqLiFLMex4BsThLuefu7gHY9WgE+R9nYSts1HACcgQzLCTDG1z8i/OxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756936613;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=eRSHk19O9P9uZz9jbqWTX9Uo09EOtyCrNtWCAMSYISk=; 
 b=aVtFcIrN1vri+jfsDVMQTzLE9C320uJxGeVgi9B37mQDcBnYSFf+3AyOOXrQdJcxIAKzYJVezb6j1txchFW3D8mBgfG/my/5ywAEJ9m57ti+8Ly/BVGl+atiWq8Ub3FxpDu7YQ2buJgeIdWHIbvsqgMdypEPOaq82kjHv188t/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756936613; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=eRSHk19O9P9uZz9jbqWTX9Uo09EOtyCrNtWCAMSYISk=;
 b=DuzAzvK44DyI2ix0R1iXUwaXHcislnnMs3w5olZ0Xs4ml7EK2KLYrdfraL4khiGk
 p29WX4r0AZif5qNTqnjc8ijTHS2rJNcr/cvItkth81u42dGh8YXWZQVuaUJvNzSUs46
 C6gQyk9D88C/DOez2utBOQOdQgoxUnAUvENS6U+s=
Received: by mx.zohomail.com with SMTPS id 1756936610577726.5474529471205;
 Wed, 3 Sep 2025 14:56:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250903215428.1296517-5-joelagnelf@nvidia.com>
Date: Wed, 3 Sep 2025 18:56:31 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B8C8645-206C-4BDD-8EE0-07E79A78E3F1@collabora.com>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
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



> On 3 Sep 2025, at 18:54, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>=20
> Out of broad need for these macros in Rust, move them out. Several =
folks
> have shown interest (Nova, Tyr GPU drivers).
>=20
> bitstruct - defines bitfields in Rust structs similar to C.
> register - support for defining hardware registers and accessors.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks a lot Joel, I will pick this up on Tyr and let you know how it =
went.

Expect a Tested-by tag in the coming days.

=E2=80=94 Daniel=
