Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CDBB53522
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6DB10EB49;
	Thu, 11 Sep 2025 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zy6KhP1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53F10EB49;
 Thu, 11 Sep 2025 14:22:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A99A44F5D;
 Thu, 11 Sep 2025 14:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66722C4CEF0;
 Thu, 11 Sep 2025 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757600537;
 bh=QDhJAvOCsdIistqI6MMfn2o6fnfPXYWO+sHhpw1GRlc=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=Zy6KhP1FnUJTnzjCHupiTfOJwHSAYTIDPqfAwBq8VYvdzx1OXLc18f56+UCnfxQD9
 XGwy+ZmE9vqRsAKOiobewyrq+pscXpqdpCCwAx++nKOHqzTuUILVFAAP9ZW6Vvucca
 Lj0zqKc1ikv4Vl8ysOK/ApMD8IIU8dXafI2Va93U3rkT9ZeQeCibTmQOLafOE+6FbN
 T4uQ/0aNcpoAA5toexNdZsiYW2Wl8Sg1AwnbxHhmgzbl4G/jQcC4K3nVh/UGxPQ8O5
 KDOs2sQQ6M6MluaNqdw2hvZt/Oyg+8GuWjqcZtgHXlt4FJmDQ6Loa0Bk20+aaAdiiK
 MHS209o1ofCpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 16:22:06 +0200
Message-Id: <DCQ1DZAVH3CG.REFX5C8FMNJ5@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
In-Reply-To: <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
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

On Thu Sep 11, 2025 at 3:26 PM CEST, Alexandre Courbot wrote:
> On Thu Sep 11, 2025 at 9:46 PM JST, Danilo Krummrich wrote:
>> On 9/11/25 2:17 PM, Alexandre Courbot wrote:
>>> You can see the whole process on [1]. `libos` is the object that is
>>> returned (although its name and type will change). All the rest it
>>> loading, preparing and running firmware, and that is done on the GPU. I
>>> think it would be very out of place in the GSP module.
>>>=20
>>> It is also very step-by-step: run this firmware, wait for it to
>>> complete, run another one, wait for a specific message from the GSP, ru=
n
>>> the sequencer, etc. And most of this stuff is thrown away once the GSP
>>> is running. That's where the limits of what we can do with `pin_init!`
>>> are reached, and the GSP object doesn't need to be pinned anyway.
>>
>> I don't see that, in the code you linked you have a bunch of calls that =
don't
>> return anything that needs to survive, this can be in an initializer blo=
ck.
>>
>> And then you have
>>
>> let mut libos =3D gsp::GspMemObjects::new(pdev, bar)?;
>>
>> which only needs the device reference and the bar reference.
>>
>> So you can easily write this as:
>>
>> try_pin_init!(Self {
>>    _: {
>>       // all the throw-away stuff from above
>>    },
>>    libos <- gsp::GspMemObjects::new(pdev, bar),
>>    _: {
>>       libos.do_some_stuff_mutable()?;
>>    }
>> })
>
> Can the second initializer block access variables created in the first?

No, that's not yet possible :( but I'll make it work next cycle.

---
Cheers,
Benno
