Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F619B9FAC1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDB10E089;
	Thu, 25 Sep 2025 13:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V//urE0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DE410E089;
 Thu, 25 Sep 2025 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758808404; x=1790344404;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=3Fpb6XuuqQ4tMU4I4bBktsh7QB2mNAlQIyyGYi1/dBI=;
 b=V//urE0ExgkQN6dWHqx0mXWs32/bd7gyBBuvqh+I+hUFaU5oNin1DnDd
 EyhSaUF1LCq02CpRG64zbiKT8l06r7giP2w5M+VHiLJ8Y/Kmr92Y4PARi
 nemJQXPWILP7L5d7HPv+YARG0pP3S9tsw4jiOsaabCLjYRBVLhWfVuLou
 ZQz3eyAn4MCPH0hi4A4mkvwYpZFL9SDGgqm20bGsLp7U/NyJ4Ypece8Cd
 h9PmTcUGblxdcMMroMz0VoZ6ZUnt+HDeXSJiqG6PeFLVEbqXaUwHj6IR1
 WDHN/wKytrXO1WZbN8Jh/MWP7LHFvwvN6cvasppsgCDn3iFuHi2H6Mrg5 Q==;
X-CSE-ConnectionGUID: XYVaHn3vS/2Xk+niIEDTVg==
X-CSE-MsgGUID: glKmIxO0QO+bim7U/Z0r+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72483960"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72483960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:53:24 -0700
X-CSE-ConnectionGUID: S83XiSvdTkuU5U9a9mz0ag==
X-CSE-MsgGUID: k+N4f4txRSG/qaHV5GcjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176914592"
Received: from dev-409.igk.intel.com (HELO localhost) ([10.211.128.26])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:53:21 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
References: <20250924124852.11-1-alsp705@gmail.com>
 <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
Subject: Re: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
From: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org, Krzysztof Karas <krzysztof.karas@intel.com>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Date: Thu, 25 Sep 2025 15:51:42 +0200
Message-ID: <175880830233.2803386.1327911402611756316@DEV-409>
User-Agent: alot/0.10
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

Quoting Andi Shyti (2025-09-24 22:20:33)
> >       mmo =3D insert_mmo(obj, mmo);
> >       GEM_BUG_ON(lookup_mmo(obj, mmap_type) !=3D mmo);
> >  out:
> > -     if (file)
> > -             drm_vma_node_allow_once(&mmo->vma_node, file);
> > +     if (file) {
> > +             err =3D drm_vma_node_allow_once(&mmo->vma_node, file);
> > +             if (err)
> > +                     goto err;

You cannot jump to err here, as that will try to free(mmo) which either
was not allocated by the caller, or ownership has already been
transferred to the mmo tree. It is sufficient to just return the err.
-Chris
