Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D213B2726
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A84A6E9F0;
	Thu, 24 Jun 2021 06:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from yyz.mikelr.com (yyz.mikelr.com [170.75.163.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE816E9E3;
 Thu, 24 Jun 2021 04:52:05 +0000 (UTC)
Received: from glidewell.localnet (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 2E7E54FA68;
 Thu, 24 Jun 2021 00:52:02 -0400 (EDT)
From: Mikel Rychliski <mikel@mikelr.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/radeon: Fix NULL dereference when updating memory
 stats
Date: Thu, 24 Jun 2021 00:52:01 -0400
Message-ID: <12410445.c4f2iDpdjA@glidewell>
In-Reply-To: <085b7f51-15b8-42e0-fcf0-66da839542c8@amd.com>
References: <20210622212613.16302-1-mikel@mikelr.com>
 <085b7f51-15b8-42e0-fcf0-66da839542c8@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Mailman-Approved-At: Thu, 24 Jun 2021 06:08:10 +0000
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
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, June 23, 2021 2:55:04 AM EDT Christian K=F6nig wrote:
> Please rather keep the new resource as parameter here and update before
> adjusting bo->resource.
>=20
> This way you also don't need to export radeon_update_memory_usage().

I wasn't sure exactly what you intended with the request to "update before
adjusting bo->resource".

Assuming the statistics update is done as part of radeon_bo_move_notify(), =
I=20
believe that function cannot be called any earlier in radeon_bo_move(). If =
it=20
were, the source object would be invalidated before it moved.

So I assume you're suggesting updating the memory usage earlier in=20
bo_move_notify (before the early return for ghost objects).

Thanks,
Mikel
