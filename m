Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B4ABCBAF
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 01:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1910E2D8;
	Mon, 19 May 2025 23:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="LX46+u2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E34910E2F3;
 Mon, 19 May 2025 23:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747698224; x=1747957424;
 bh=n4kq5HE6pZ8F6DDqOLDXEhIGUD7Ygb6Ig2Mf1bDOKGE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=LX46+u2ANawZhs2AzPUBzOoCAG4rAarRssnno6nTEzj0bOH5a2wmqWylzi33GS+Bl
 aBGvH8pB9xdHnRvHXGt8UUc9t4kEdc21d0dkuYZoUAXWetSR7o5Jj5M6JZe2bL0P9s
 uk4LU/0mwKb8KlmcyICX+rDVVRPNohU93PsqyQKueOg8tpj+AxVKDrdaddoPhsiVEM
 Q1MpA4Cx6LQ59Cl/zAoibFtelyBxZZNjmM+CkfOouVnC6FQBUYCxGSN325692Piis2
 Nb2Kechm7I1WDZHut6w4JErzyaN/9GPKcDz1a5vEjBrA1tzA+CBw2AnYH3ubtfKI1O
 rjKZL/8LzuikA==
Date: Mon, 19 May 2025 23:43:39 +0000
To: Xaver Hugl <xaver.hugl@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
Message-ID: <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
In-Reply-To: <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
 <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 15131c2775dfe8a887013d96e7525abcaaefd2e0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, May 18th, 2025 at 00:32, Xaver Hugl <xaver.hugl@gmail.com> wrote=
:

> > We can always make the property mutable on drivers that support it in
>=20
> > the future, much like the zpos property. I think we should keep it
> > immutable for now.
>=20
> Sure, but I don't see any reason for immutability with an enum
> property - it can just limit the possible values to what it supports,
> and that can be only one value. Either way, it's not a big issue.

Immutability is a clear indication that a property has a fixed read-only
value which can't be switched by user-space. That's also the pattern
used everywhere in the KMS uAPI, so I think it's better to remain
consistent here.
