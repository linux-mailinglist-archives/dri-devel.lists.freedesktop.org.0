Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E338D3AF8E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A2210E4A6;
	Mon, 19 Jan 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Otq9VxZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDE910E4AE;
 Mon, 19 Jan 2026 15:50:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D28042D65;
 Mon, 19 Jan 2026 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE4C19423;
 Mon, 19 Jan 2026 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768837815;
 bh=4bjc5aajcuzBHvXCPRPtvjsISc8dexTvQe1HeiR9z9k=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=Otq9VxZxTCDWO7NP/o5dZBtU+J9r7kwGjWWaBS5ZuQFvXYQW6QmPZYzv6lLEZSEh7
 eIf8etXkH7aluEctAwBnFQfwWBGmNCS8EYcpQzSyDpaHdYfzFmM5MAa6rYQL1pr67F
 vA23Z9df91ftloLSZ85httOC3PIqxdUsZT2T3ETaEd8GZkLQaSS/6hPMGn5teV0hjN
 NE0tOqrwZK84qi+OCVdWaScwcK/9jHBVoGnvrpXbYxC0h9bKJzJbnzoRzhK6TLuTzt
 /jPktw9xMgoQVbVtx6ada4eBunVBCMMj7TeBfjmxbDJPYBfT7e/wUDTdUk0aYLTWpG
 MnDLlyeo5vHPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:50:10 +0100
Message-Id: <DFSOO86MMNW8.37S7T88EKPEFA@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 07/10] gpu: nova-core: firmware: fwsec: do not
 require bound device when unneeded
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
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

On Tue Dec 16, 2025 at 5:27 AM CET, Alexandre Courbot wrote:
>      /// Loads the FWSEC firmware into `falcon` and execute it.
> -    pub(crate) fn run(
> -        &self,
> -        dev: &Device<device::Bound>,
> -        falcon: &Falcon<Gsp>,
> -        bar: &Bar0,

Hm..the method also takes a &pci::Bar, so its either called from a bound co=
ntext
or within a Revocable critical section.

Leaving the other argument as &Device<Bound> makes it obvious which one it =
is
(and should be).

> -    ) -> Result<()> {
> +    pub(crate) fn run(&self, dev: &Device, falcon: &Falcon<Gsp>, bar: &B=
ar0) -> Result<()> {
>          // Reset falcon, load the firmware, and run it.
>          falcon
>              .reset(bar)
>
> --=20
> 2.52.0

