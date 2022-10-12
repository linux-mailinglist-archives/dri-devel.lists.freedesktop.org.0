Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050C5FC3B3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 12:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19C710E210;
	Wed, 12 Oct 2022 10:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD4C10E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 10:25:41 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665570339; x=1665829539;
 bh=btPgFCl8Sd0yKLZXLQQ2Lx+6Yl/nzZKAI2NRTDgQivA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=YxltpNeHyEECle4PRfxMMvaw2HLiAJYOCXup5R8ckkon3HAh8hIVQoJ0AciN5nInH
 9WH0s4NYEo37jI4masEM4t2EDfBW8F6BoBTUyB/cGXLll10gmt7+XsoU3Fe3Es7QaL
 ArjuxI8JnOeCkIFSambZhmFn/nhPUl0zxV7hvFsW/RBr8j97BUItvdX5m+QciVhw3R
 JB44OYwcr9D+x16zkpd9bZJ1MPx0vD/h0WX9ZurvlyWsvQ/Jg8ZMuktvpelxrU10Ip
 TESTKpapmcdHJjQRDRjMVfe6z/70mzD2X+K7AZCPb7nHYMf4t2vnX6HtwkAn5mdrqi
 QnNqc/RGDI8cg==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Message-ID: <WVB2bcT7aLthDz-fKpP-_--tlos1G_EAuXbA2g5qnlTcZ4BK0z595RaTDjhaC8kK6R4P6dqvYOlgBf-ef8eAV7KMSZ_-v8HAztLFv0-_lA8=@emersion.fr>
In-Reply-To: <240b0135-5219-b923-ac08-1ed574dcb901@amd.com>
References: <20221009144001.161124-1-contact@emersion.fr>
 <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
 <YlRyF1ugXQAIFNoNIuFRmDek7S85or_YpAz26fHKaaQIYeCB3RVGSjEaYhw6nI0iH_k6vDjPYeF6ekmVeEgUWyf5V5w4aMm8Z5oVPjGQKh4=@emersion.fr>
 <240b0135-5219-b923-ac08-1ed574dcb901@amd.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 wayland-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 11th, 2022 at 14:10, Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:

> Am 10.10.22 um 11:13 schrieb Simon Ser:
> > On Sunday, October 9th, 2022 at 20:00, Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >
> >> Am 09.10.22 um 16:40 schrieb Simon Ser:
> >>
> >>> Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
> >>> which signals an eventfd when a timeline point completes.
> >> I was entertaining the same though for quite a while, but I would even
> >> go a step further and actually always base the wait before signal
> >> functionality of the drm_syncobj and the eventfd functionality. That
> >> would save us quite a bit of complexity I think.
> > Hm what do you mean exactly? I'm not sure I'm following.
>=20
> Essentially we have the syncobj_wait_entry structure which is added to
> the list whenever somebody starts to wait for a sequence which hasn't
> materialized yet.
>=20
> Instead of extending this maybe just completely nuke the
> syncobj_wait_entry handling and replace it with your implementation here.

Hm, no sure I understand how that would work. We don't have an eventfd in t=
he
WAIT IOCTL...

We could merge the two structs and figure out which callback to invoke base=
d
on which fields are filled, but I figured two separate structs would be mak=
e
for a cleaner split.
