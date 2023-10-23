Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E787D2D11
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2160110E18F;
	Mon, 23 Oct 2023 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6E810E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698050700; x=1698309900;
 bh=cv395rOhvRRsmXYsyvgE2cfgGeGA6dYaArchmFqHrnU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DxJQMRDDXdj792We1zwaB3UukfXBxpurEuFkdS4lzD3qraKBC2OmlVxjC1qOTjk4F
 GlCSesp4ippmjtpcCQYYoqbtX/kDFMSlNl2vYkGn1EdWOu84ia5a7YFm3nM5LHE/5c
 zyJ9dUEk/l6KxUcu9wKCuKPmfIrPpjw172Ap57CJ+og3XVF9R+U1tAWAWl/6U2YdSe
 P+sAvGw1GkBbaBQncjxyjIo7xKj/fG2VwBNBoBVFLDkybcbLKObSLXU3Xt8dRrzXMi
 yJlAdaP8JChjy8SDUM+mShJ2jTgr1lghY7HJ7BZKfbVhMM9cN9oWkIJoh3VKJb+6bw
 0DtK9Vy6JHl5A==
Date: Mon, 23 Oct 2023 08:44:46 +0000
To: =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v7 4/6] drm: Refuse to async flip with atomic prop changes
Message-ID: <OmiJ2t3KUJGjN5EM8mo1cX52UpRgtMZx0oT11igYlRjfeqXtkeQlFdV3OdHO3eA4KkyWKuvSSVX8Ico1zFkioaQQObjLgp0dTu15YE-RWc8=@emersion.fr>
In-Reply-To: <745e35ee-d617-9ce0-8b4e-795c84a5af48@mailbox.org>
References: <20231017092837.32428-1-andrealmeid@igalia.com>
 <20231017092837.32428-5-andrealmeid@igalia.com>
 <CzEtDALWvF3EU4DDLLEmH3ms0B25PbsEHRU9b_IqwfyhzdG4zC-XXAU6fm2PnMcngAYmntH7s4iuew0vocN6cO8zUit8kgi-Sb1hBQXNYiw=@emersion.fr>
 <3r5-_03WC5dK3LaRt1Is78zD_bmT2aaGc5h9jpUGzo2o5GCtGP1zpQNzUxglsieewFklY7xwTrOS9jtI18YlNnnzHNx2Ccw9yM2NuJpDQZU=@emersion.fr>
 <8c1641e4-a7e2-ecb2-ab7a-c6e2bb3e951b@mailbox.org>
 <Bi9El_nuZXA997YlVyCzD5s7KfP820IVUuYiB69mgXnjQbfCgOucCBe6aKvSFrMzB_9DwxO2lli_MqLzMuGZ-rmrRp57vePsTwUarEweLJs=@emersion.fr>
 <745e35ee-d617-9ce0-8b4e-795c84a5af48@mailbox.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, christian.koenig@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 23rd, 2023 at 10:42, Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org> wrote:

> On 10/23/23 10:27, Simon Ser wrote:
>=20
> > On Sunday, October 22nd, 2023 at 12:12, Michel D=C3=A4nzer michel.daenz=
er@mailbox.org wrote:
> >=20
> > > On 10/17/23 14:16, Simon Ser wrote:
> > >=20
> > > > After discussing with Andr=C3=A9 it seems like we missed a plane ty=
pe check
> > > > here. We need to make sure FB_ID changes are only allowed on primar=
y
> > > > planes.
> > >=20
> > > Can you elaborate why that's needed?
> >=20
> > Current drivers are in general not prepared to perform async page-flips
> > on planes other than primary. For instance I don't think i915 has logic
> > to perform async page-flip on an overlay plane FB_ID change.
>=20
>=20
> That should be handled in the driver's atomic_check then?
>=20
> Async flips of overlay planes would be useful e.g. for presenting a windo=
wed application with tearing, while the rest of the desktop is tear-free.

Yes, that would be useful, but requires more work. Small steps: first
expose what the legacy uAPI can do in atomic, then later extend that in
some drivers.
