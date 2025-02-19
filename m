Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD11A3CD26
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABC810E08B;
	Wed, 19 Feb 2025 23:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NBQFYdJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87D210E089;
 Wed, 19 Feb 2025 23:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740006814; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d8aKRIxU3l8XlTRQEM9685tTMXH5AqKtOf6F87tkY9qm9vwsLiTZyCqysAx2InJs13/MgjYSrfli88xXpElB/rZ83iXRF7jkbmmQ4kCxmsu4tX3AHCi3jmOiyALjA9XD5PAOgjRNmbLwTXxNhdU1/UconIGTOtsJKspu2LOHoT0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740006814;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yYsvej7hta50BXSo4O/kInYZNSTmLUgaMrj4n0kXVMA=; 
 b=OVViB7v1dwUFhDrRdcbZ2766nsGflsj1tunY+Xw8sOE4Cc8xSgneCkiPLqSjp8G5MJ7Qg8uq9HwDQy5g+/BqZNx7Of5Smz09a8eEzUF8NFu9HF4HVanStqoT9D/KwmRdWA7UxfO01rK5KtNn+8Xv/41/GtNT+CE26/gfUKkpfp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740006814; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=yYsvej7hta50BXSo4O/kInYZNSTmLUgaMrj4n0kXVMA=;
 b=NBQFYdJVnDoiFp0z4H+BuyCpQDo0SKKYGuyeZ/UwkjGqSMHSxH50rWoRlOxzw6kO
 VZVXqzLV5fbepi05sriU2H2OhtApWCevNMfCuRY4z8Zx5BidiHRJUxRqOpS9ynDYgQZ
 XDferigcuF0iIJVt5WWy8Vx3nUAzQuRO99sFHxok=
Received: by mx.zohomail.com with SMTPS id 1740006811017578.3153222760697;
 Wed, 19 Feb 2025 15:13:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
Date: Wed, 19 Feb 2025 20:13:15 -0300
Cc: John Hubbard <jhubbard@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1597EDB7-D91B-4660-ADDC-D2252B26CB22@collabora.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
 <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
 <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
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



> On 19 Feb 2025, at 17:23, Dave Airlie <airlied@gmail.com> wrote:
>=20
> On Thu, 20 Feb 2025 at 06:22, John Hubbard <jhubbard@nvidia.com> =
wrote:
>>=20
>> On 2/19/25 4:51 AM, Alexandre Courbot wrote:
>>> Yes, that looks like the optimal way to do this actually. It also
>>> doesn't introduce any overhead as the destructuring was doing both
>>> high_half() and low_half() in sequence, so in some cases it might
>>> even be more efficient.
>>>=20
>>> I'd just like to find a better naming. high() and low() might be =
enough?
>>> Or are there other suggestions?
>>>=20
>>=20
>> Maybe use "32" instead of "half":
>>=20
>>     .high_32()  / .low_32()
>>     .upper_32() / .lower_32()
>>=20
>=20
> The C code currently does upper_32_bits and lower_32_bits, do we want
> to align or diverge here?
>=20
> Dave.


My humble suggestion here is to use the same nomenclature. =
`upper_32_bits` and
`lower_32_bits` immediately and succinctly informs the reader of what is =
going on.

=E2=80=94 Daniel=
