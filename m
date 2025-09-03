Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B9B41867
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780CE10E4C5;
	Wed,  3 Sep 2025 08:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GGTyGxhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82A010E4C5;
 Wed,  3 Sep 2025 08:27:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A774043DFC;
 Wed,  3 Sep 2025 08:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCF1C4CEF0;
 Wed,  3 Sep 2025 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756888069;
 bh=RB95aOX+kayC1qRy+/KzYs7xMyQLdRtju6GyR1JJy4c=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=GGTyGxhXDPj/D/mL/FktKW2Jhl6+O+srYKvLL2UpeNyBlC/2u5YUY6Xcw2fBujEkw
 djeD3MthykhOOjLgMXTk2on5Tvs4Clbj8mXVtFbDE5Vx9It70FI/kaP0bGrPqvEQ/b
 w8VU/q9XxXYjn3LuQiugbvIvBpZT47OEEoe3kOCC/LkVq5mlpYNn9/w9WqlaI2E+5G
 HJu8ZOQ07xw8IrpW+hnTRrChSbA5nWZ4T1E0Vv7MzA17uav1faItGrtQL+e19yB7WN
 fw1EJ2OygYlfoHT+I3kF3SpcJHrjFSsjjhrfJR++PWU1kt7EdVA0PkIW93dO/GE0GC
 yDOKvPV6wcM6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 10:27:43 +0200
Message-Id: <DCJ0UA7KM9AP.OGO7EJB4ORQP@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
 <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
In-Reply-To: <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
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

On Wed Sep 3, 2025 at 9:10 AM CEST, Alexandre Courbot wrote:
> On Wed Sep 3, 2025 at 8:12 AM JST, Danilo Krummrich wrote:
>> On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>>>       pub(crate) fn new(
>>>           pdev: &pci::Device<device::Bound>,
>>>           devres_bar: Arc<Devres<Bar0>>,
>>
>> The diff is hiding it, but with this patch we should also make sure that=
 this=20
>> returns impl PinInit<Self, Error> rather than Result<impl PinInit<Self>.
>>
>> I think this should be possible now.
>
> There is still code that can return errors (falcon creation, etc) - do
> you mean that we should move it into the pin initializer and turn it
> into a `try_pin_init`?

Yeah, that would be better practice, if it doesn't work out for a good reas=
on
we can also fall back to Result<impl PinInit<Self, Error>, but we should at
least try to avoid it.
