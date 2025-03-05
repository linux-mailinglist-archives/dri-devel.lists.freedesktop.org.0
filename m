Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8536A5040B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E42F10E7E3;
	Wed,  5 Mar 2025 15:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf/B6+jC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F73710E7E3;
 Wed,  5 Mar 2025 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741190380; x=1772726380;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+DDI/RZUnxrcWdczPY+9G2dY/T08VSNyBuK6BnVQ0UY=;
 b=mf/B6+jCd1iDaeg+dHgxJsl9EtbdbXEeiaPPe+9uDBIGIbqHmfb66zgO
 hDWG3KpISfGrkBKoQRsvdqjdgFqgxkRSFW5aDjgWFoaBOVBhKhhupDKLJ
 Lyn7TuuZpdpdzSlgYOFjpeJ7Rtf/p9HXxfZC2As+Wi4Bv2jPtrSH79uwF
 SfJ46M8T/N7lBm4MXtfQ5lW8UGn9cbW9mqYQiSr50ERTsFuhdeX+rfDfq
 ekB0C3yGpU9vA5AawYXsyJZlF+5ucPJPVRAPny13Bn+dYCCew1qTQfHzq
 3xAgqZMW9D5KBeDi5TxL5l0mfMQ9LNFOn8vJF388Rgee+hNENNP6pWuEi g==;
X-CSE-ConnectionGUID: ZUwIcqBwTDaeUMRdF74dTw==
X-CSE-MsgGUID: BoKG2BqAQcuQnFtAIivDhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45816913"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="45816913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:59:40 -0800
X-CSE-ConnectionGUID: cRRjMW9XTea7ITvIWpF/mQ==
X-CSE-MsgGUID: u2vnr6OSQru66jZ7CcjiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="141970238"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:59:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Yury Norov
 <yury.norov@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 0/8] bits: Fixed-type GENMASK()/BIT()
In-Reply-To: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
Date: Wed, 05 Mar 2025 17:59:31 +0200
Message-ID: <877c53xycc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 05 Mar 2025, Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org> wrote:
> Introduce some fixed width variant of the GENMASK() and the BIT()
> macros in bits.h. Note that the main goal is not to get the correct
> type, but rather to enforce more checks at compile time. For example:
>
>   GENMASK_U16(16, 0)
>
> will raise a build bug.
>
> This series is a continuation of:
>
>   https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
>
> from Lucas De Marchi. Above series is one year old. I really think
> that this was a good idea and I do not want this series to die. So I
> am volunteering to revive it.

Thanks for picking this up. My acks in the patches still stand.

BR,
Jani.


-- 
Jani Nikula, Intel
