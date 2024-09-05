Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B496D0AF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF3810E0B1;
	Thu,  5 Sep 2024 07:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="G53eyoyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12FE10E0B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725522385;
 bh=QYpU67x17CbfVA21RkvhKE9DGjvoVRNHWWEv4K+vCxY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G53eyoyxWdawLmV4K3e3GIpIf8mKKRJ2JHuum58L5JwXsO4BdxvMHawgE5vRm2qKp
 1b7l7taULwiBcBsGbqIb9WbJL07MaGyZJ/pYJ9KRW85smE2hlIwV/x5ydr7jpkBmWb
 1Kiai5tUAWU/isnajhdSvNvWGl/0GfR3vPLO9MM+qsfpNStZPgNgkbli6SwLCjTZ6I
 rw4KrctsY0RJN33mkAtYeLxeoqGPBK3WK8JO/oOUqeCRdylXDJ8ZAK9Hd2pNn8yJAI
 OyNH/Xbsg15ZD6qaKuF/Fy0yyPzgrESkF8O1Q20Phy25ChkdWg69itybpr0XAqKjsc
 3AgtcmYzDAvqw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E6C3B17E0F94;
 Thu,  5 Sep 2024 09:46:24 +0200 (CEST)
Date: Thu, 5 Sep 2024 09:46:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, Grant
 Likely <grant.likely@linaro.org>, kernel@collabora.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: flush FW AS caches in slow reset path
Message-ID: <20240905094620.5744ace5@collabora.com>
In-Reply-To: <6074ec45-7642-4558-83c5-4c9af7e0543d@arm.com>
References: <20240902130237.3440720-1-adrian.larumbe@collabora.com>
 <6074ec45-7642-4558-83c5-4c9af7e0543d@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 2 Sep 2024 16:11:51 +0100
Steven Price <steven.price@arm.com> wrote:

> On 02/09/2024 14:02, Adri=C3=A1n Larumbe wrote:
> > In the off-chance that waiting for the firmware to signal its booted st=
atus
> > timed out in the fast reset path, one must flush the cache lines for the
> > entire FW VM address space before reloading the regions, otherwise stale
> > values eventually lead to a scheduler job timeout.
> >=20
> > Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Acked-by: Liviu Dudau <liviu.dudau@arm.com> =20
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>

Pushed to drm-misc-fixes.
