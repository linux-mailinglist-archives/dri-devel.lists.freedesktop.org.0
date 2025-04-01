Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDEA7752D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16E510E4FB;
	Tue,  1 Apr 2025 07:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="LRduiQGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9379A10E05B;
 Tue,  1 Apr 2025 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1743492373; x=1743751573;
 bh=f6DF/kCDMRce0FNnrWW6wI12RNWRmRZJUAM0UTBbMpM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=LRduiQGK8R57P+5th42l5bZuk6b07UjRcteM05cEV1GeaV5HAEsrKjqPLH0/1bAch
 cP0gQqegnfXb+/xudKIskr70uAYccRQLQf+EljuHNciJTMjNaCWZSugfMfr1d/F9Ew
 JEiyLpCUi+nW1LSIoZXWteSobJE0604I46CvAtOLJ5WHb6r9vWBTrXfLIE0TlRMgrq
 taUSbSZUU5GEmTrBoUzcboDPKn1k7iE73CwsyY6yj8DFYhNvj8frkCuqGgrWqtanTC
 M9so/eN3knMpiYcKVzcngElzPoPsiwY9UNJod9wR/m95mGaxTi6yIwUmFxYj35lETJ
 9mne7XiOeKt0g==
Date: Tue, 01 Apr 2025 07:26:05 +0000
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
Subject: Re: [PATCH V8 03/43] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Message-ID: <QkD_sGjtGkH9YuSmuKpLsZa60qYBDhXtEV2w8A_pjRn2pS5jXfTXyubNLxlb0ioDALb6hKDVqz8cbUyv6EmyqOKp4fPFVYJ7wlfkUGYL7zQ=@emersion.fr>
In-Reply-To: <54869208-04f2-457d-a8f2-e8cba24f94ba@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-4-alex.hung@amd.com>
 <ccapGdDxbM4lcrNuX1aXUz2dfv-z2MhxuugtqOXLuMMagujxDDdzmeyU74zve9pRXbILSWOBHOCecEaLtDI-181pLd-0qOQp-giAvPuPlWw=@emersion.fr>
 <54869208-04f2-457d-a8f2-e8cba24f94ba@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0bc6bfbe2d9fd36816b96763fc2d8317c5afb623
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

On Tuesday, April 1st, 2025 at 02:10, Alex Hung <alex.hung@amd.com> wrote:

> On 3/29/25 09:26, Simon Ser wrote:
>=20
> > I would also highlight that we need to seamlessly switch between HW
> > fixed-function blocks and shaders/CPU with no visible difference. Depen=
ding on
> > the content being displayed we might need to fallback to shaders/CPU at=
 any
> > time. (A classic example would be a new notification popup preventing u=
s from
> > leveraging KMS planes.)
>=20
> Yes that would be the goal.
>=20
> Is there any part of the docs that still need revising to clarify this?

I haven't seen this point mentioned in the current docs.
