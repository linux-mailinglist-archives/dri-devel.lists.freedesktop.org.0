Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C768C25A0A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFB010EBCF;
	Fri, 31 Oct 2025 14:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GPKDZ4Ji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8FB10EBCF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:41:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cykFd5Ty1z9t6Q;
 Fri, 31 Oct 2025 15:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761921701; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7oF0pHiTKfHggDqHbs4XCDSzjGm+M2FdqzdYufdWyg=;
 b=GPKDZ4JixaBKjXl2cX9I1oyUFn+2gT1Mvzzfp+dtw61j63t1VKbr4wE/3DL7lHcmGtms1L
 WYLpHlKRysiK/+AcAOIE/Lc2UcB50ZdPWhASbd33rwMQ8BXpZmtRQcbn9n0NzpFbnF1khc
 A5ehcjerpzth4q8Q3Be+aJIzdcM9+QqZfRgdXgttIevy5WsSUHNyzyEjzej2Lh7UD8nUNk
 EvRXRqtQ+VVlDQ2XO4NMVOXK7sr2Pl8xUHlh0UnyzkLt0a36mYR/idiWnlnmQsBGguYH67
 eNqtW8UV2otQBr9uK9A4mF9IRvWhv+0LAwWwCqgr6XUSdJ4Nhws9I+SedACoHw==
Message-ID: <3006a63b5e38f3d3bfd07047fa8e8ed2e9d2a93d.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/sched: Add warning for removing hack in
 drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org
Date: Fri, 31 Oct 2025 15:41:38 +0100
In-Reply-To: <ebc028f2-3d2d-4f42-a667-df7d6c2b7eb0@damsy.net>
References: <20251023123429.139848-2-phasta@kernel.org>
 <ebc028f2-3d2d-4f42-a667-df7d6c2b7eb0@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ozkjknk9jqrgne35isjct51z4rm7d7ye
X-MBO-RS-ID: 718dfa83b9c480413cf
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-10-31 at 15:10 +0100, Pierre-Eric Pelloux-Prayer wrote:
> Hi Philipp,
>=20
> Le 23/10/2025 =C3=A0 14:34, Philipp Stanner a =C3=A9crit=C2=A0:
> > The assembled developers agreed at the X.Org Developers Conference 2025
> > that the hack added for amdgpu in drm_sched_fini() shall be removed. It
> > shouldn't be needed by amdgpu anymore.
> >=20
> > As it's unclear whether all drivers really follow the life time rule of
> > entities having to be torn down before their scheduler, it is reasonabl=
e
> > to warn for a while before removing the hack.
> >=20
> > Add a warning in drm_sched_fini() that fires if an entity is still
> > active.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>

[=E2=80=A6]

>=20
> The patch is Acked-by: Pierre-Eric Pelloux-Prayer=20
> <pierre-eric.pelloux-prayer@amd.com>

Pushed to drm-misc-next, thanks.

For the future: b4 / maintainer-tools wasn't able to automatically
harvest your Acked-by. Would be helpful if you have the A-b on a single
line without line break and without other content in the future

Have a nice weekend,
P.

>=20
> Thanks.
>=20
>=20
> > =C2=A0=C2=A0		spin_unlock(&rq->lock);
> > =C2=A0=C2=A0		kfree(sched->sched_rq[i]);
> > =C2=A0=C2=A0	}

