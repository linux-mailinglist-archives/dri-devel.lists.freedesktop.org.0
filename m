Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F15FBCAF85
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 23:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562C510EB29;
	Thu,  9 Oct 2025 21:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7CuLYCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC2B10EB23;
 Thu,  9 Oct 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760046341; x=1791582341;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=C8ig8SU83hj8GCY1oOwnQLTSifH7XUAF9p8J6OjwS34=;
 b=J7CuLYCeBIsHbbVAVzS2kQwDhDH6Y/aFj/OiWTYl+q+ff1D6ZgIvVwEo
 YcKNu7jtOPG3TPsA4o4KdmG0eqJ5cu0AYyXiuMTw0Mxp3TTsyhPUBulg6
 fzXxf8oyQcXCadkk02rkn/k3f8AM6ZNg0MW8oizc/pcqoMioGSKkojgzq
 jWlFYmnPV2/J3iUOcOgGsz/8KojH4EN9Shvp0/YuDx59QcTujhepElvyk
 448IjK8MU827CtaUaH+C2vdbsRX0TNB4HBLp1Xn3/VP5gJUKv/DKEH4zh
 lYBxg8Ud0YWQaLAOirFCuEK/zU02dXoqHn/gN4GUmgAOyMlYPrUrXipNk g==;
X-CSE-ConnectionGUID: megd2crnSgCbsSm8bAtYKg==
X-CSE-MsgGUID: 7TK7g1u1QYib+RbmeoHqpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72522891"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72522891"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:45:41 -0700
X-CSE-ConnectionGUID: TC+Ffi7XRWm6f5/GywJA6Q==
X-CSE-MsgGUID: eT6uZniIRByIat4OxbXkNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180065180"
Received: from dev-409.igk.intel.com (HELO localhost) ([10.211.128.26])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:45:39 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251008115632.16333-3-krzysztof.niemiec@intel.com>
References: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
 <20251008115632.16333-3-krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Change semantics of context isolation
 reporting to UM
From: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Thu, 09 Oct 2025 23:43:55 +0200
Message-ID: <176004623530.3107872.452127983185392051@DEV-409>
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

Quoting Krzysztof Niemiec (2025-10-08 13:56:32)
> From: Adrian Larumbe <adrian.larumbe@collabora.com>
>=20
> I915_PARAM_HAS_CONTEXT_ISOLATION was already being used as a boolean by
> both Iris and Vulkan, and stood for the guarantee that, when creating a
> new context, it would not contain register state from preexisting ones.

The ABI predates Iris and Vulkan and provides information about
platforms that they do not support. Since they are using a strict subset
of the pre-existing ABI, there is no requirement to make backwards or
forwards incompatible changes to the stable information provided by the
kernel.
-Chris
