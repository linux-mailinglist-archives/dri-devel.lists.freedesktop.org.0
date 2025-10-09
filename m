Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D855BCAC11
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5221710EB0D;
	Thu,  9 Oct 2025 20:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jfyCDari";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062210EB0A;
 Thu,  9 Oct 2025 20:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73CBD602F4;
 Thu,  9 Oct 2025 20:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA4CC4CEE7;
 Thu,  9 Oct 2025 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760040587;
 bh=YpM7f2AlYfeNrk/FXsfKdNh/0ocylryEsJVj0mQ6sAE=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=jfyCDariiNtG4Mqtxt7MwAqyAC3lb4kqQ6eRDk5MCrWno0Zk9zEF7A1Pl9wvCsFPT
 XQUw7nE1Ft9umT7IISl/owHkaHS5EtWeglbvfzMNjuuz/gCKYS7IZa7NXOtXgSOJ9o
 lK7eh7iXQ1dqKR782fSypHMWRRB+pyyu4ICRwGCNE32uvd3cJPafqwNwGiPqvXJubZ
 +Jn7JwOp85GNZ5QcGBlYyikmhrGdq7IK1vcTnyIktc5pebcTz05OxRcvG+ecHKAocv
 v5eRgkKJ+gqWrmYFnIvxij0jMTM5uoEmjzlh67THMZl0tW6UXY0hPqX45LPS3U/wV3
 hv91ume/dFsoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 22:09:42 +0200
Message-Id: <DDE2BDLEZHBW.253EO66P7ZH2P@kernel.org>
To: "Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Mary
 Guillemard" <mary@mary.zone>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, "Lyude Paul" <lyude@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
 <20251006191329.277485-3-mohamedahmedegypt2001@gmail.com>
 <DDBISJ2DUDF6.150HCB14ZRPH3@kernel.org>
 <CAA+WOBvu2Gq=SM2TBdahsQ-RVi+vn_U-oDa7-DG6kj9Arq5tpA@mail.gmail.com>
In-Reply-To: <CAA+WOBvu2Gq=SM2TBdahsQ-RVi+vn_U-oDa7-DG6kj9Arq5tpA@mail.gmail.com>
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

On Thu Oct 9, 2025 at 6:51 PM CEST, Mohamed Ahmed wrote:
>> Let's move the call to select_page_shift() into op_map_prepare().
>
> How would this work? Originally when we were working on this, we did
> place it in op_map_prepare() but we ran into the issue where
> nouveau_uvmm_vmm_put() needed the page_shift retrieved (see
> nouveau_uvmm_sm_prepare_unwind()).

-			ret =3D op_map_prepare(uvmm, &new->map, &op->map, args, PAGE_SHIFT);
+			ret =3D op_map_prepare(uvmm, &new->map, &op->map, args,
+					     select_page_shift(uvmm, &op->map));

You can move this call to select_page_shift() into op_map_prepare(), that's=
 not
related to nouveau_uvmm_sm_prepare_unwind(), right?
