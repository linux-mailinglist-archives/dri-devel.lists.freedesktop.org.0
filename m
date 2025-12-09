Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27571CB1618
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 00:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A42110E593;
	Tue,  9 Dec 2025 23:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="YXDYMZ91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171A10E593
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1765321501; x=1765580701;
 bh=QjajmOWbo4pcjlvE+oRBJEOFsxfTcBcRPFYWKdC73jA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YXDYMZ91rgk5OGCoX2dkZHzwpgmsFspv5uVvw4Rj+3hTSlB3m1xch4fBZqBD2UiLF
 S25AZYHyTUciBsdCjoW3vILoIbAZQe8faar+G21n6ypZ7IB4+v1KMjTCSbWYL5OGND
 xeA4HpgYlO2b9wD5x5cAuxAKqTmXJv7VUEqiC/dXEnby1zMVj5Dpl+HVV1VCh0KVyh
 fycEW3Z8mKioP2eHlK7dyTZCJD6zeTkq5i3X+JwoMpXPDfjmiqwLw58eJSKMaM2Gl6
 jXCPJwr4uhYVbFOaNd/t98wZPDPAwyvvJQhHuQzEbxMWrZkpoqg5KGwmwnseo4clqA
 ujcS89Ixg0brA==
Date: Tue, 09 Dec 2025 23:04:57 +0000
To: Melissa Wen <mwen@igalia.com>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper
 func translation in DCN32
Message-ID: <be1jxZ9kinyTHjggWBeBj7gEj5xxhfrNTxG9yZwGiwYVqYzJctzu4T-TiTKtRzD5L_0wzaQJjmaQANV3SRcorSX_CQ-wfeDy8svdpDW7CPo=@emersion.fr>
In-Reply-To: <e0eeac27-3bad-4004-be5d-2c55e495d908@igalia.com>
References: <20251126005608.37513-1-mwen@igalia.com>
 <2a918940-700d-4b24-90ae-4d9d4f9b457d@amd.com>
 <f832ec8c-cce1-45e0-975b-ed7000bed891@igalia.com>
 <2ddb06d0-70e5-4a1f-850d-3753f9fb3d0a@amd.com>
 <7ad74d3d-5a63-462b-8243-f8f26441b04b@igalia.com>
 <b0288d0f-fcd9-4ae6-817f-5a927b9164e5@igalia.com>
 <4f02daf8-1bd2-4105-b270-0aed496501cb@amd.com>
 <e0eeac27-3bad-4004-be5d-2c55e495d908@igalia.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b096a798e9c125d04faabddf04d5dfaf683616a6
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

On Tuesday, December 9th, 2025 at 16:27, Melissa Wen <mwen@igalia.com> wrot=
e:

> > Do you know if anyone's working on migrating gamescope to the now-merge=
d color pipeline API?
>=20
> AFAIK, nobody is currently working on this migration.
>=20
> I started migrating gamescope, but I got stuck in the libliftoff
> changes, because of my lack of background.
> I don't think I'll be able to resume it in the short term :/
>=20
> Not sure if someone is working on this topic for libliftoff.
>=20
> Simon (/cc) , do you know?

My plan wrt. libliftoff was to set COLOR_PIPELINE and program all
colorops after libliftoff has done its work, by appending more properties
in the drmModeAtomicReq. A libliftoff issue [1] discusses how color
pipelines could be integrated into libliftoff, but it's more work.

I don't have interest to work on gamescope at this time, and don't
know about anybody else working on this.

Simon

[1]: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/85
