Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C4CB01AC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 14:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD8210E5C8;
	Tue,  9 Dec 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ft/F/UU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D7410E5C8;
 Tue,  9 Dec 2025 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765288478; x=1796824478;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KyxtzSeGSxnhUFUw5tze00BkJ5ynPPx3IxA9CeCUyBs=;
 b=ft/F/UU0HNhQUZkyn6h6hu8ln3JwJNDkFUqsHbRnxkB4xRon0Eo3OjrL
 FQA9lrEpEkCI5ZupEPGCQ6xPvF28sYcIKXC1ekNCqG/YktgTbsdHzX0F0
 hYapWF+3hDfRfbTWcAfP6QHW3JfUI0D+FSlap62y6sm3a9/9+avEazBxd
 aXTZWdS/rDlsfgDlrR7ZnbGJfoxNdgX9lTZb7hfz3QgibLswv7micL1r3
 wgTcxXDguOLEMYHieKqB3Wp1szkUXiYEWpaRMb8kC7qDUrWAv9hdL+C9s
 u3THldOg/ahOwcu+kKzxFM9zjNCPwAdFRch5xoYIgpEBFTuESuENrrTJb w==;
X-CSE-ConnectionGUID: gtyEyhVhQYqL3qlpho5olg==
X-CSE-MsgGUID: 2MTCejnAQiW715G7//4UYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69835294"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="69835294"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:54:38 -0800
X-CSE-ConnectionGUID: 5w2pzBbCR2yjh6xI87h6cQ==
X-CSE-MsgGUID: YlNjGifeS7eJ5gfm+mTckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196235815"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 05:54:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>, David Laight
 <david.laight.linux@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
In-Reply-To: <602813bb-096b-44b4-af1d-95681769c943@ursulin.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
 <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
 <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
 <20251205182813.09231c45@pumpkin>
 <602813bb-096b-44b4-af1d-95681769c943@ursulin.net>
Date: Tue, 09 Dec 2025 15:54:30 +0200
Message-ID: <fc8d83613fff9944f44cd3ad5908ce45d5264476@intel.com>
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

On Mon, 08 Dec 2025, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> Anyway, I have pushed this patch to drm-intel-gt-next so it will appear=20
> in 6.20. Only now I realised I could have suggested to add some=C2=A0 Fix=
es:=20
> tag to it, so it would get automatically picked for 6.19.
>
> My colleagues who are handling drm-intel-next-fixes for 6.19 could=20
> perhaps manually pick it up.

Picked up with

Fixes: 3b38d3515753 ("drm/i915: Add stable memory region names")
Cc: <stable@vger.kernel.org> # v6.8+

added.

BR,
Jani.


--=20
Jani Nikula, Intel
