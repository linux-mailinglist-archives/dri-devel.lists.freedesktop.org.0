Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04771ABA9ED
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4F910E176;
	Sat, 17 May 2025 11:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="rQNk9JZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CAA10E296
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1747482811; x=1747742011;
 bh=ou0Rl92XeXQ2muv1Yc9M1YkwDF57ompx49E095SM54Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=rQNk9JZTrSdg8FvKJ/aWnpcIyFfrtYK1WuIzr2G6ODPGB9YPb+Vr+DOpURMo26sjG
 CeV8nJggQ6/R8eEuq+MdtcwGZySYEkWCRjMmfbrVZzjv03AZUD4mGipcYCSGRT63Ie
 Rvv8gfmVw41KdHPu0EMnN6nSEHfN3dthcFkFgcY9/Y+iiIcfDCvOocYNwb7NNlTooi
 TL92O84ZDqBalhY9fnzjSqIfdnJy5+u+Qgk4A8Gsbm/0ANPO2/UICQwKYv9Zi/p5/e
 af7HuWy58IPR4mkhdOwoPWAmWoh2bbLKwYvRUlgkh29QVk5ND0fyao6A+mt2rX5SV8
 kdKs5/GTI3wig==
Date: Sat, 17 May 2025 11:53:28 +0000
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
Message-ID: <vyX7bdPppc_pDUQBeKeZNyy69WUl_XKExs-I7dfuDJJy6SKXWoBL7B-IRMZKxuktNMQCIg0lP56Xj0qLidKOlBJQJjUYHOQ5Id6yw5k8Q10=@emersion.fr>
In-Reply-To: <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-41-alex.hung@amd.com>
 <CAFZQkGwrP39REsvZwQ_Uaq+cHR_pH2EPuv_POXRO7Hxj9u4Xsw@mail.gmail.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 40c49360d9d66d751604cb6144a38060d3afe3c5
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

On Saturday, May 17th, 2025 at 03:23, Xaver Hugl <xaver.hugl@gmail.com> wro=
te:

> Do we ever expect this to be something with multiple options that
> userspace could select? I think it would be good to keep our options
> open and make this property not immutable (properties that are
> sometimes but not always immutable are more annoying to deal with in
> userspace).

We can always make the property mutable on drivers that support it in
the future, much like the zpos property. I think we should keep it
immutable for now.
