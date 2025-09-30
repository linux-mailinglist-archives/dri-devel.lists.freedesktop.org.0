Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7CBAC7F3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1D10E295;
	Tue, 30 Sep 2025 10:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HGvpomiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EE210E295;
 Tue, 30 Sep 2025 10:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A28444A32;
 Tue, 30 Sep 2025 10:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28729C4CEF0;
 Tue, 30 Sep 2025 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759228398;
 bh=9kytHiFrpM4nP2m+PtHjF+LmiM13fFvF27ssloeTfnA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=HGvpomiqFwr6mmm3CTLEpr3OrLb899zID3z1pPal1usJfbgNesB2/WJAqEDIDlJsW
 160yrqK94HbRLXvGVzgHfzRboKzvTF99D0kfk1j+JVtvby9T2qE+MHjeXYMISdiIHd
 thgGQrhJo0MW2qdOJgW9PiCBI/dFFoALC8U8DwLWh8HZPqCWxNTbr+vRKoZyvYUN+Q
 qSU6V1sRE3niWCkNIkpkndDhb/lkDMIZBmxV2nH/9zc6H5TK260ZafJLPt3UrksB6W
 VK4IkLfCbtP79/qz8dyziPWsbQAlqU5YoBiPdDCrH0dV/ZYq6+6ivJGGavEwNuzGj7
 F125oQ8CI2xaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 12:33:12 +0200
Message-Id: <DD62F2EK4XHL.3QT9NHS42Q55R@kernel.org>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <qwqmek35wzu3chimtfsoftqvt4lw4g7btbvqzoc6qb4hoce3zq@pdu57fdxfb23>
In-Reply-To: <qwqmek35wzu3chimtfsoftqvt4lw4g7btbvqzoc6qb4hoce3zq@pdu57fdxfb23>
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

On Tue Sep 30, 2025 at 2:36 AM CEST, Alistair Popple wrote:
> I feel like this is largely where the confusion/disagreement lies - what =
the
> `gsp` module provides versus what the `fw` module provides. My thinking i=
s that
> the types don't leak outside the `gsp` module, the `fw` is really just pr=
oviding
> raw binding information that the `gsp` module turns into something nice/a=
bstract
> for the rest of nova-core in the form of functions (or types) to do whate=
ver
> is needed.

The goal is that firmware specific structures (and the majority of their
implementation details) don't leak into the business logic of the driver co=
de.

Of course, due to its nature the `gsp` module can't be entirely independent=
 from
firmware specifics. However, think of it in different layers:

If we encapsulate the layout of firmware specific structures in new types (=
i.e.
wrap firmware structures into new types in the `fw` module), all changes to=
 the
layout of a structure, new features, etc. are local to and can be handled
transparently by this abstraction layer.

Once we actually introduce a second firmware version, we will also introduc=
e the
corresponding proc macros to annotate those structures accordingly with
`#[versions(GSP)]` and let the proc macro generate the version specific
structures, which subsequently allows us to treat the new types in the `fw`
module as if they'd be existing only once (and not per firmware version).

Hence, all the other code in the GSP module can be left untouched unless a =
new
firmware version introduces semantical changes (which should be rare).

This is not only a major advantage when it comes to maintainability (which =
is
one of the major motivations for the Nova project to begin with), but also =
leads
to a much cleaner structure and naturally separates the layout of data from=
 its
semantics.

Yes, it does require a bit more code to set it up to begin with, but it avo=
ids a
horrible mess leaking trivial firmware changes into the semantic layers of =
the
GSP implementation.

But even if that would never happen and the firmware interface would never
change (which I think will not and should not happen), the separation of ho=
w to
lay out data and the implementation of the semantics by itself adds clarity=
 and
helps with maintainability.

The feedback Alex gave in this context looks pretty in line with the above.

I hope this helps.

- Danilo
