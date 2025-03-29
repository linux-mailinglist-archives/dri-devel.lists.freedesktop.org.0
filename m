Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21FA7570B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 16:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000D10E2AA;
	Sat, 29 Mar 2025 15:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="jbouPSB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7711710E2AA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743263291; x=1743522491;
 bh=7QvoOT9+Hwx2Qo1l1B0mfsYbRxw0zQjfLpU0BLarQFw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=jbouPSB71NefDvc9FuHkOIJTHy1VmTTjklEZFkmDVsDBXDPh3OIwBBzv13sndqMCq
 IrlqsSkIyHoLExoierohk4yeKZ7cMuK/QdsZwyT+QlAVmiXaIn7VJM63qqyJHlfPCM
 oOpss/X0FmvgTdLopMWF+5iqk2xZW+5/OA7UifH4iSyZb/kK9c/p3h3f9TrgSDurr/
 iXq2qfIUGZgaT0lTYCe9Hhj46nEgs/hU8iHLP2RstGU7FFfC3nA3Hnq8tRK0WiNvA1
 tDTEde38307EHfmyeAD92s+PgZI/ozwQgiqkd0xhCkaxjffhJkKpl9za12YQe0BgNP
 8eUgIsYiiHxug==
Date: Sat, 29 Mar 2025 15:48:07 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 43/43] drm/colorop: Add destroy functions for color
 pipeline
Message-ID: <_GmbIozpR3Vwp7BPlTFO3i1Kn2S3SIYiQLIbF4TEizuVzpkcUrTZWj87cDM8l_ArWVpCKWJVYJyrNX3ElPuu-fOb_J5C5dVhGfdLkQ5Y5k0=@emersion.fr>
In-Reply-To: <20250326234748.2982010-44-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-44-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 630314200453f391807c79dbc1dbc970d9fda5e4
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

I would prefer these functions to be introduced together with the
patches adding functions to create objects and adding the new fields.
That way it's easier to check the symmetry and at no point in the
series there are memory leaks.

Additionally, I would avoid using the name "cleanup", which seems to
have different semantics: for instance drm_plane_cleanup() doesn't kfree
the pointer. "destroy" seems more appropriate here.
