Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC0B4A38F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AFB10E053;
	Tue,  9 Sep 2025 07:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ihVwoE6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1904810E053;
 Tue,  9 Sep 2025 07:31:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 150746019D;
 Tue,  9 Sep 2025 07:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A815C4CEF4;
 Tue,  9 Sep 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757403109;
 bh=axBiV+zvocF8Tr1Scfnkshx6gVsJC4rKDNByqo36RTo=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=ihVwoE6qkU73bAn/FVsjlbibLiJ/Wk5A/JT1lOK1O+Cq9dw3h7d9v/r61fQ7sReox
 CbuVYd6l5Lqzdgb/xSSFrWrAEkJG9kfTTOJUYhZEYrc6bhsblvkkRYxKy8NDFjnOFT
 AwzEJoJPrxF+s45EdEdGXWX3LGkcU1o+Haa9gvNI9tOmHtMdpQvArM5SBnes11ZH80
 v6DSozVnCMje1Yt/IDcoi7m7ahF3J7W8UVEo5S5KpDnZLpFc68PR25GHjABdr+qv+l
 ULNoPxIm8+ixkQLNCs5l4dUtnZWS37vWZ9AvJl0hHdvonBnoLbaoWGCgel3PstT8JE
 +/EKj9XsezBgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 09:31:46 +0200
Message-Id: <DCO3EPQXQSUL.2XUR07VDP2Q38@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, "Dave Airlie" <airlied@redhat.com>,
 "Christian Koenig" <christian.koenig@amd.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/4] ttm/bo: add an API to populate a bo before exporting.
References: <20250904021643.2050497-1-airlied@gmail.com>
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
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

On Thu Sep 4, 2025 at 4:16 AM CEST, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> While discussing cgroups we noticed a problem where you could export
> a BO to a dma-buf without having it ever being backed or accounted for.
>
> This meant in low memory situations or eventually with cgroups, a
> lower privledged process might cause the compositor to try and allocate
> a lot of memory on it's behalf and this could fail. At least make
> sure the exporter has managed to allocate the RAM at least once
> before exporting the object.

The below use of TTM_PL_FLAG_MEMCG suggests that this goes on top of your c=
group
patch series. However, wouldn't a similar change make sense regardless?
