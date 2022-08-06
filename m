Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4358B822
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 22:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5011291E;
	Sat,  6 Aug 2022 20:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BAC1125B9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 20:11:04 +0000 (UTC)
Date: Sat, 06 Aug 2022 20:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1659816660; x=1660075860;
 bh=Cc28ws3HPXjCbDRMPaRWRLSv/vem2ZvOfbjdOBkIMVE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=OqiWlC5VXdkFR96uPe3QdFl7XbG+AKvZDWlFZxdtwTCvddMjAHO/yXOJWT3A4+Bxm
 oJ78f/uFxCdcmm9JO+SOFZ0R3DxuUsF6LgFwEE9F23fOyKVRczzKvVWGwvjgdWURrx
 OuoyVvREvdSXXgE2guV3NWo3hcN26fGuAgOHayQQJhkO++rNkNVkoRaNSTRuKUsr7c
 khyuA9othZgs4x8H1QWRJssdg3W/eutBUDS2trKYZIo9QSHrjDJ+yGzJofH4saGq1e
 RFRo2q6TXTAsWdGV6ZkdoQ4DolM8/vdbXz5FiDAJiCBpqfOtNYAgxh3Qz5UoFT29jf
 t+31cSW/AXmdA==
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: How to test whether a buffer is in linear format
Message-ID: <fy2nAbatiBdkL1uU_gQDMm_cmINuuox465B4N5RaTdAv5TPpHZdlXn388lhEA3wRJT3ux8uRcQp_N2E4E3Lnpi2ryLfEPOx30RDhVYQkr6w=@emersion.fr>
In-Reply-To: <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>
References: <491b09b4dd40404c8559513713bdb17a@garmin.com>
 <20220806144700.0519b70c@ferris.localdomain>
 <2beb027f324d4d60a1d1bf10fafb65ee@garmin.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, August 6th, 2022 at 21:56, Hoosier, Matt <Matt.Hoosier@garmin.=
com> wrote:

> Any idea what=E2=80=99s up with some compositors adding code to infer
> DRM_FORMAT_MOD_LINEAR semantics when the buffer=E2=80=99s modifiers are s=
et
> to 0?

What does that mean? A buffer only has a single modifier, and LINEAR =3D=3D=
 0.

> Wlroots, for example, added this as a =E2=80=9Csafety net for drm drivers=
 not announcing modifiers=E2=80=9D.
>=20
> https://source.puri.sm/Librem5/wlroots/-/merge_requests/63

This is not upstream wlroots. This change doesn't make sense to me at
all. Either a driver supports modifiers and advertises support for it,
either it doesn't and gbm_surface_create_with_modifiers fails. At any
rate, forcing LINEAR in this code-path doesn't make sense.
