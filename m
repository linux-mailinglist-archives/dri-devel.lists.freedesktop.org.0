Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C337E7BCA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DD010E991;
	Fri, 10 Nov 2023 11:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B757610E991
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699615299; x=1699874499;
 bh=Nv7XlanoaJVutPPwvFLB1uxjyJSIIGCfuXYkg25MBhk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=mh37gSh9YrtZc540lAEEi2ti9pZnVSFanTdtsc2qWQdZ9k5hyhLQmnqVAPS7JKtGO
 qwwCGc+XsK7dXPcA07USYXoiXxSM2roo6BWEHqH9GxnrH2gjnynckupHGc5BC0dC15
 cUJwMUT3PHPZjoCDYiQXq8+9Ctkpqqt6UCmSrtusTOidkl7zxa3SthX2tIXGDuyxwn
 rgnfy1bH+dkduv50JJ6ewOI2J6sj8WVy4Kyctz1iwUz5IMecqaIr3ppAyVAGrHtd9u
 otZ7Gu1pM56otCsTAem9d4hwxOOgxAwSo1G0XmSfJ4gQ2ZLgCiIW8Ljw+nTC0lvtV9
 IaMIWnL44JPJQ==
Date: Fri, 10 Nov 2023 11:21:15 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <x547FihqvjPqU5HRTVPzPb6Gsx8_I4z8LHxxhyiBjTi6fCNHYGKvgfAdQQJlXfcCfbf9rKKK7Tlj4vkZcey0PVaJfgwbEGgPaJIPJfMuou0=@emersion.fr>
In-Reply-To: <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <ph4ssz5r3afaovoviavkkemfxqyttqucnzl6nnrbyi3tejxfsf@22dyuwq3uyot>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 20:17, Maxime Ripard <mripard@kernel.org=
> wrote:

> > Can we add another function pointer to the struct drm_driver (or
> > similar) to do the allocation, and move the actual dmabuf handling
> > code into the core?
>=20
> Yeah, I agree here, it just seems easier to provide a global hook and a
> somewhat sane default to cover all drivers in one go (potentially with
> additional restrictions, like only for modeset-only drivers or
> something).

First off not all drivers are using the GEM DMA helpers (e.g. vc4 with
!vc5 does not). The heap code in this patch only works with drivers
leveraging GEM DMA helpers.

Then maybe it's somewhat simple to cover typical display devices found
on split render/display SoCs, however for the rest it's going to be much
more complicated. For x86 typically there are multiple buffer placements
supported by the GPU and we need to have one heap per possible placement.
And then figuring out all of the rules, priority and compatibility stuff
is a whole other task in and of itself.

In short: I think it's unreasonable to expose a heap without good
knowledge of the specific hardware. In other words, unreasonable to
expose a heap for all drivers at once.
