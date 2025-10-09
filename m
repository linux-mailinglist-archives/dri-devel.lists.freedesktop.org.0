Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A620BC8322
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB310E98A;
	Thu,  9 Oct 2025 09:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9/ejS7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509E810E98A;
 Thu,  9 Oct 2025 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760000924; x=1791536924;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fvep23//chNCFYNAfdSyIgM69wVc23KqWs+OFcZMV3M=;
 b=C9/ejS7qX38gnAToJq4L/zP0wb/Xk6erkdeBQhvj3wyPYt4Pb6hcPKXg
 /WB/j9uoK5ZoSJB1IxYGUpRL2t5TSjP4semYui7/4g10C9tLcbkKKuD5F
 HzDx1pX5VcghqEkrxvJqjVMOt8hw6BfZIsEcXlDP3x20R2DqBMduhH8Vp
 +qGc8GSS2BXTKNJE4mbrY/2BMWv97uJlbGP+Mayaejypyw3hKu2OMQ8Ud
 xyRgrDoBlshmeffqwo3cItPUaLxrf/FpBRRN19IBsP8C5dyhxpQlg51ij
 lFHhCUvV38zX2AkbnmClW3qULli80QkH6OQ7191W//Rp0PRRZpd8z4+Al w==;
X-CSE-ConnectionGUID: LOFPpNZ9SjOl98MisUfyrQ==
X-CSE-MsgGUID: k0JM+q4+R8ujF3orJkgIBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="87665405"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="87665405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:08:44 -0700
X-CSE-ConnectionGUID: R9f6YEemRR2+qcwBj/C+NQ==
X-CSE-MsgGUID: KkKt9yUnTLelgy75V39/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="184927120"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.113])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:08:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 ville.syrjala@linux.intel.com, nitin.r.gote@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzkaller@googlegroups.com
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
In-Reply-To: <CAGfirfdACPUrW7hxOKXEpaPZ6=Lkwde24CfHov9=75JhXiPApg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
 <175922381867.30706.10351894191632562572@jlahtine-mobl>
 <CAGfirfdDe879wFzABVZkTV7grEimpnc0XrrKpj2SX1w_TLtgNg@mail.gmail.com>
 <aN0X3ck-egLMn_Xy@ashyti-mobl2.lan>
 <CAGfirffg4JzGkwaKTm9fL9Nyud4kBALvfW3Et33ZF60e8cVO1g@mail.gmail.com>
 <CAGfirfdACPUrW7hxOKXEpaPZ6=Lkwde24CfHov9=75JhXiPApg@mail.gmail.com>
Date: Thu, 09 Oct 2025 12:08:36 +0300
Message-ID: <27ca005b5505e66cb51bb4917a71ef44b0afc7c0@intel.com>
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

On Tue, 07 Oct 2025, =EA=B9=80=EA=B0=95=EB=AF=BC <km.kim1503@gmail.com> wro=
te:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> <https://l.mailtrack.com/l/a23538b60e872501ef9881ddb3a7e5ffc2cbce55?u=3D1=
2392148>

Please do not send HTML messages in general, and especially not with
tracking links.


Thanks,
Jani.


--=20
Jani Nikula, Intel
