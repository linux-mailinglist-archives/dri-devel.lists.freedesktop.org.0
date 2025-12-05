Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4BCA76B5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F8D10EB09;
	Fri,  5 Dec 2025 11:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="obWVFB1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAAC10EB09;
 Fri,  5 Dec 2025 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764934375;
 bh=DSCLZDzuWO0wYnhswyk5hnrbmKxce6VWhX/0hwQwHMI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=obWVFB1oMWyJkSF6loS4HncN7i9Ql0hdOuGalrXv06mU+dIcDKHhiJ4R+4UXx+I23
 g9HcYm7KXuJKP483J63eDlx1GQvlliyPPybavYxfYv3W+P3cJ8Jd3zZvZ729e6z2HS
 UYXvC1o22O+5yD4d9ZreI5EFCcFftFz2el0vLgP5RWVgEEJ9LTd8dMYN03ZtpI3/ct
 vmV/93Hr0i0azBFvqKe670evUKESnmsQt7v5vR25yvyG90YVIiX+334xD4XLZ6rU1s
 h6488w4j18hjTJme+WJKRYy5YFIiKK8mHVwJ5gTq/cLGvnnFsVV4Eos2n+NlBmAuPy
 4nAbURxWl85wA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 84A1217E0610;
 Fri,  5 Dec 2025 12:32:54 +0100 (CET)
Date: Fri, 5 Dec 2025 12:32:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew
 Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?B?TWlrb8WCYWo=?= Wasiak <mikolaj.wasiak@intel.com>, Christian
 Brauner <brauner@kernel.org>, Nitin Gote <nitin.r.gote@intel.com>, Andi
 Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v12 05/10] drm/i915: Use huge tmpfs mountpoint helpers
Message-ID: <20251205123250.7672fa41@fedora>
In-Reply-To: <f08c170b-714f-46d0-87fc-3218c42ce93a@ursulin.net>
References: <20251205091216.150968-1-loic.molinari@collabora.com>
 <20251205091216.150968-6-loic.molinari@collabora.com>
 <f08c170b-714f-46d0-87fc-3218c42ce93a@ursulin.net>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Fri, 5 Dec 2025 11:18:39 +0000
Tvrtko Ursulin <tursulin@ursulin.net> wrote:

> On 05/12/2025 09:12, Lo=C3=AFc Molinari wrote:
> > Make use of the new drm_gem_huge_mnt_create() and
> > drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
> > it's just a few lines long, the single function in i915_gemfs.c is
> > moved into i915_gem_shmem.c.
> >=20
> > v3:
> > - use huge tmpfs mountpoint in drm_device
> > - move i915_gemfs.c into i915_gem_shmem.c
> >=20
> > v4:
> > - clean up mountpoint creation error handling
> >=20
> > v5:
> > - use drm_gem_has_huge_mnt() helper
> >=20
> > v7:
> > - include <drm/drm_print.h> in i915_gem_shmem.c
> >=20
> > v8:
> > - keep logging notice message with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> > - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> >=20
> > v9:
> > - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> > - remove useless ternary op test in selftests/huge_pages.c
> >=20
> > v12:
> > - fix layering violation in selftests (Tvrtko)
> > - fix incorrect filename in commit message =20
>=20
> Thanks, looks good to me.
>=20
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> What are your plans for landing the series? Presumably you'd like to do=20
> it in one go via drm-misc-next rather than in stages and different trees?

Yep, ideally this would go through drm-misc-next.
