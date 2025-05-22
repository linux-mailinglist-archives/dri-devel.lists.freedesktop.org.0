Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D293AC098F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 12:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C3610EC6B;
	Thu, 22 May 2025 10:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="pS5xqNMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch
 [79.135.106.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E86010EC6B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747908889; x=1748168089;
 bh=cQqKMifk1yWos+SGTPw5y6zCxoWEk/70UCGIQWRWnqM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=pS5xqNMjU/lADhtfbTICyk7I78M2zzSzpEB/XVw7ZLOu253jqfFpimOeU3SNtkK9K
 eW7IfyVtSbGBGpOaeSsA6w2agVqiLs6BJ80bFgOmIHDMHeFsUt7ekR3n+yKURN/ijk
 I4ucsj81JDlXmJn/7dxIFEpnkqY3DTiFieXKLDLeXPX9cyLgAI6zOdRETkS/MRkQH1
 dgSfyQ2wZ74ev0HDVZu/giPqyU4se8vEeEJ0rXfbuEu0v3RuWWT2zfxjaqRhvnNPxx
 wkie6NiU0yNSA0MzjWnXPfjjY5kETctdAdnLVuDERXkA4HhFNcp650k/zIsxP8uW7x
 127Hc1m23Y6sA==
Date: Thu, 22 May 2025 10:14:44 +0000
To: Harry Wentland <harry.wentland@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 40/43] drm/colorop: Add 3D LUT support to color pipeline
Message-ID: <8pzKUkjgb0fIlD3_edy0Wpl9vY-0Uuukcn3texesI1Bl0cLolExOvVoMdUwVv42T5K_o_U_wUY-saxXag2WhjKa7_Rh-EuORqZfWBUDczLo=@emersion.fr>
In-Reply-To: <f92df258-653d-49ba-b8f6-a1b677744a1e@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
 <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
 <CAFZQkGxXJe=FGdymMRevbtU+jKre6PdthAu33Qz+kVsR_OVpJg@mail.gmail.com>
 <BqFABawLqkjFjPvuKwfsFBKt2A6KcEIeJU289qnX9Try6dV0nhXeXF3vxJUK_xUP5a1gfARBt3wY0lpOV2Nbmcmj5WXCw6fsZjPNT39KAu4=@emersion.fr>
 <b3bf99cc-f6f4-46ce-aa00-fea74b3179b1@amd.com>
 <f92df258-653d-49ba-b8f6-a1b677744a1e@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 5d48259c69c6ca71ce810224cc1f2304598d03c4
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

On Wednesday, May 21st, 2025 at 21:18, Harry Wentland <harry.wentland@amd.c=
om> wrote:

> On 2025-05-20 16:13, Harry Wentland wrote:
>=20
> > On 2025-05-19 19:43, Simon Ser wrote:
> >=20
> > > On Sunday, May 18th, 2025 at 00:32, Xaver Hugl xaver.hugl@gmail.com w=
rote:
> > >=20
> > > > > We can always make the property mutable on drivers that support i=
t in
> > > >=20
> > > > > the future, much like the zpos property. I think we should keep i=
t
> > > > > immutable for now.
> > > >=20
> > > > Sure, but I don't see any reason for immutability with an enum
> > > > property - it can just limit the possible values to what it support=
s,
> > > > and that can be only one value. Either way, it's not a big issue.
> > >=20
> > > Immutability is a clear indication that a property has a fixed read-o=
nly
> > > value which can't be switched by user-space. That's also the pattern
> > > used everywhere in the KMS uAPI, so I think it's better to remain
> > > consistent here.
> >=20
> > I was envisioning this to be a driver-caps thing, but I agree
> > if we make this mutable it can still serve that function but with
> > different/future HW possibly support other interpolation schemes.
>=20
> Would changing this enum property from IMMUTABLE to MUTABLE
> in the future (for drivers that support multiple types) break
> any userspace that assumes IMMUTABLE?

I don't think it would, see the zpos property.
