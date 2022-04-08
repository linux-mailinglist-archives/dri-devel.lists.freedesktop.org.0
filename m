Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C054F946C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 13:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080D10E12F;
	Fri,  8 Apr 2022 11:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB3810E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 11:48:22 +0000 (UTC)
Date: Fri, 08 Apr 2022 11:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649418500;
 bh=Zvbi7xqEswNRrjsp8sgXVujH0Lr0d/k1PRut6FcweZY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=hemnCB5PgV6MjKUqiZcXyUtavYgatU3HjzR5zjUPE3u4KXYfkBfTlt8no33INNxWW
 KJRsLOwEe1yoJ+Uqp/C3IT4LCEEhVivfaLb4HC6qOw/2vfBQm8o7WPHmhQyNdMz1nq
 vEtpdnbFTrTpiC1ZW21UpBt8M1VMBr04UGxJrailoyJmbk6zVqUIl9ast2Ae+C9ftD
 xYeibHwc1dbSsi5HSPRz1lK65BJJLVmRzrUgVRqTtnqepmz+okiM+rCiwJp36Ei21/
 Gsg9VN/SP0FqSxxoM5wndaCL9/2jEBfpVRrDft+Y3VO7+56GM5yXbZwb4Esb1SC5+d
 jpDph04eTdTDA==
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu: Fix NULL pointer dereference
Message-ID: <QfKpxmkE_cy9wt5VJruw_TSdnl5KceKM8BxJGmZSBs-KiaRwIYfgc8h_-5h7Wmj6G-NtUJ3A88V5pzPvZuLlpkK-oRO5pSjeTxwHcZWlogs=@emersion.fr>
In-Reply-To: <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
References: <20220408092803.3188-1-h0tc0d3@gmail.com>
 <4o2YD5id7zhK5g__CUK3Yf-6Dj459XQ0qsydW6wKHdco3YYtl78BqGUfXvQ9UO0AZoAsMPfhFB0jw1BFldiFDcbZXmGgsobuAoTMWmoDqmE=@emersion.fr>
 <CAP+8YyED70CSqVRaB7JgrAtK-yvBx5EsvrrdR7EpvOG2AVhskQ@mail.gmail.com>
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
Cc: Grigory Vasilyev <h0tc0d3@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@linux.ie>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, April 8th, 2022 at 13:28, Bas Nieuwenhuizen <bas@basnieuwenhuize=
n.nl> wrote:

> On Fri, Apr 8, 2022 at 12:01 PM Simon Ser contact@emersion.fr wrote:
>
> > Is amdgpu_display_get_fb_info ever called with NULL tiling_flags/tmz_su=
rface?
> > If not, there's no point in adding NULL checks.
>
> It isn't called with NULL anywhere, the NULL checks that already exist
> seem redundant.

Grigory, would be be willing to submit a v2 which removes the unnecessary
NULL checks?
