Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DF9302E4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 03:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B338810EA75;
	Sat, 13 Jul 2024 01:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OrSyoQ3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3310EA75
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720832443;
 bh=w/mpt+RlfSL8Dp/1of7ZO8A1RTwC9qamUzbz96QfUWs=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=OrSyoQ3NfLGmrie4sOHpBxx9p3cghk74+ESentpuMhw+yGNSHVb6cBsmY5DsY4DPj
 PMrXhlo+Kf0tyxjdJoRWkDH/gUZkt5B8LVWCuELq46AfrgZElBdSu2SNHckle4d3/h
 3VHwSFfO3gB0ge0YnzAiX15gdqnopDsLTmS4siArj/iwHWswYrc4RqQB9z8rKSa4IW
 iKfmChdjXiAikCxHo6HAZbCd29/5JDJUCe0vnA158VN9Iw4foSfL/909q6BjTSjo8v
 beQmi03fyNWcnmHhBwJph1yk/0uVXx7eoGynEWyrwhToCTybFk/4owNVIIb8OIaiRS
 QATaV3FBhT+MA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: dwlsalmeida)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 581E837813B9;
 Sat, 13 Jul 2024 01:00:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAPM=9twNU3Wm02zCqzipSt4mDU3UUF5AyVycpBkPTGqv7fwPAQ@mail.gmail.com>
Date: Fri, 12 Jul 2024 22:00:26 -0300
Cc: Danilo Krummrich <dakr@redhat.com>, Steven Price <steven.price@arm.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net, mcanal@igalia.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <76D10179-FC78-4563-93CD-0528E3420D45@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <ZpFDeajsuVONbSYJ@cassiopeiae>
 <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
 <ZpFMmAEdqo1dhj0s@cassiopeiae>
 <CAPM=9twNU3Wm02zCqzipSt4mDU3UUF5AyVycpBkPTGqv7fwPAQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-Mailer: Apple Mail (2.3774.600.62)
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

Hi Dave,

>=20
> I think I'm on the uapi should remain in C for now, we define uapi
> types with the kernel types and we have downstream tools to scan and
> parse them to deal with alignments and padding (I know FEX relies on
> it), so I think we should be bindgen from uapi headers into rust for
> now. There might be a future where this changes, but that isn't now
> and I definitely don't want to mix C and rust uapi in one driver.
>=20
> Dave.

Yeah, once this was mentioned:

> How do we (easily) verify that changes in the Rust code don't break =
the uAPI by
> due to leading to changes in the generated header files?
>=20
> Do we have guarantees that future releases of cbindgen can't break =
anything?


I realized that there would be issues with my original approach.

> I think I'm on the uapi should remain in C for now

No worries, I will fix this in v2.

=E2=80=94 Daniel=
