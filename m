Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DC6A80E3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 12:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5949610E10B;
	Thu,  2 Mar 2023 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4503610E10B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 11:15:08 +0000 (UTC)
Date: Thu, 02 Mar 2023 11:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677755705; x=1678014905;
 bh=ScJ6XNQumXKi9BQ1t4EwtvbPE/meKsMzAATbjHXuITc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gVP3dKZdr6HxodOUsh+9aGOheB6sKUgJ+pkoQOGCHrlBkTmpi8MtCmAqDHrVNZNTv
 qH6TJPCkWmY2fdUDQLy+r7vs2wF1h2B5s1Yp9fgpiX6KGlI0dxH0tggUJE0rtztRpD
 tZFxeWXxyTdnCMt2ntXwqPs9NKhBHbGaDM6kGIvJL5Jlln6w2TT6AmrQmfDWu+G/iQ
 bFg7fbjgp9DPB+ntmSCOnSXQad1sqJJk29xYgciOK3HvvxS3prWjlroKMke8oW7sUu
 XbFcHVpE6DnyeleIllyjOAnNsegRB7n6GOpLjB/fGcd7TD21UGJpGNlE2/DK/WH0kt
 XDrYJlQ8WC9Kg==
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vram-helper: turn on PRIME import/export
Message-ID: <fKaX5MAmaJ5IFviPDydSgXt6yG8OrTkYMfUE9GzxtbCngKVwmaWELms09eDHix9jHUZrSTKs7fO-1_rnotYxUgzw5EPpu7f-U-M48Fc8Ohk=@emersion.fr>
In-Reply-To: <810b28dc-a0d1-0cd5-7b79-7f2a282b44b6@suse.de>
References: <20230301222903.458692-1-contact@emersion.fr>
 <810b28dc-a0d1-0cd5-7b79-7f2a282b44b6@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
 Tian Tao <tiantao6@hisilicon.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 2nd, 2023 at 09:07, Thomas Zimmermann <tzimmermann@suse.=
de> wrote:

> Am 01.03.23 um 23:29 schrieb Simon Ser:
>=20
> > We don't populate gem_prime_import_sg_table so only DMA-BUFs
> > exported from our own device can be imported. Still, this is useful
> > to user-space.
>=20
> VRAM helpers don't really offer much flexibility or control in where to
> place a BO.

That's fine. The goal here is purely export/import to the exact same
device.

> What happens if the BO is located in device video ram and cannot be
> used by the other participant? A blank screen?

A failure at import-time should happen. But maybe this patch isn't
enough to make this happen?
