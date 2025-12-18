Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F90CCC33C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A510E9E8;
	Thu, 18 Dec 2025 14:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TnnWI1TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACF710E3A8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766067215; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZfZ5eleqm2voe9kdBmI29PO93f6wUqNN+f+iNvaUPk8j0MQkYiZsUm7xjLxcPFJhamCZawnVpyEXadmEQIimTx8lJBojOIBCJDlbhhZnKwIvZuMzC4r35vY2TUt0SzxTf1lH8c3VeGI8tgkw9gALjFH7uPSGDihmQcqCfLrSapY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766067215;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=no1MqqNDxu5c0uKxqGvlCaZMIOJT2Yq6Z/VFFh5qh14=; 
 b=NCMMHMrpnC23X5ooOFnvzDSX292dqZ0nI8QO0yLgGMt9xzkqf/5qqKEid7BYenKrwirwcnqtdvkI0duCtJSlmilIQLnSlALeK26kGBbUfp344wKwQirVG5NwaylGb4/KskjaCJ+7oW7xf35ImlBvh6c9H7/SoH4GKTze/Wq7qN8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766067215; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=no1MqqNDxu5c0uKxqGvlCaZMIOJT2Yq6Z/VFFh5qh14=;
 b=TnnWI1TWhy8QqVml3H3a2+y2hyNOpCTtFnbBqqF1pm1SAOhpTJP54CW/IiwoO//N
 EokaIaqcPt2SXdQQHnerGjVOmo3A3ZAI47srDoaNpa/BDWBf+7ai2zOntYDntd/D1s7
 WbbfHOk5SX9lzARgVHCacnRUVZsbKpwtGB26H9tc=
Received: by mx.zohomail.com with SMTPS id 1766067213618777.221126799302;
 Thu, 18 Dec 2025 06:13:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 0/3] Implement Send and Sync for clk
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
Date: Thu, 18 Dec 2025 11:13:14 -0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <59982B51-0CCF-46CB-9DF1-2A5BE3645636@collabora.com>
References: <20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com>
To: Alice Ryhl <aliceryhl@google.com>
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



> On 18 Dec 2025, at 10:27, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> The Clk type is thread-safe, so let's mark it as thread-safe in the =
type
> system. This lets us get rid of hacks in drivers.
>=20
> For Stephen's clk tree.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v3:
> - Rebase on v6.19-rc1.
> - Pick up tags.
> - Add fix for pwm driver as well.
> - Link to v2: =
https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.=
com
>=20
> Changes in v2:
> - Rebase on v6.18-rc1.
> - Add patch to tyr driver.
> - Link to v1: =
https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.=
com
>=20
> ---
> Alice Ryhl (3):
>      rust: clk: implement Send and Sync
>      tyr: remove impl Send/Sync for TyrData
>      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
>=20
> drivers/gpu/drm/tyr/driver.rs | 12 ------------
> drivers/pwm/pwm_th1520.rs     | 15 ---------------
> rust/kernel/clk.rs            |  7 +++++++
> 3 files changed, 7 insertions(+), 27 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250904-clk-send-sync-3cfa7f4e1ce2
>=20
> Best regards,
> --=20
> Alice Ryhl <aliceryhl@google.com>
>=20

I thought this had landed already.

I=E2=80=99ll resume my overhaul of clk .rs during this cycle by the way.

For patch 3:

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

