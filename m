Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469A95856E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 13:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7D10E738;
	Tue, 20 Aug 2024 11:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPalnoNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81910E0D8;
 Tue, 20 Aug 2024 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724152113; x=1755688113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ZbqQ99qIrSTiJe0Vj3KSmgFad4MrVhzeua/QS1/da0=;
 b=mPalnoNKNRLGptLDtEw8RZFrmclo7dreeclNbW+LCsmJejI0ecxcOgaf
 YBdeH8b+N2Cy8nGuqBDFt8Z/V4EJsx14OW666qV/BBV4Pzr1W13CZ0W0u
 HxfpaJ4noXTiDN3m7riPSY4ZE4Ifnv6W6G9ZqZBLe7VLW0z2e4h+stxJg
 IcAANYwKstPVUZ5E7OOwBjJ0VVhjuQgfSFr8i5E+HDTBEDFBZEAzKoNzs
 ZfX+5f+A0qoss/KD3j5vpZV9LBr94hx8WZ0NSFeZ9eEaszVynNs8GSBBr
 bReIfYDw4RIGm01LO7P+RkrGe5Z3D282JoUwkvTWAfjVb+rT8515EgUf+ w==;
X-CSE-ConnectionGUID: PrF3AyAEQZujczsSG6B4qQ==
X-CSE-MsgGUID: +lAzUEBURuaBoHnAtdIO2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22623574"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22623574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 04:08:32 -0700
X-CSE-ConnectionGUID: wo1qZI6rTAqbIWo2cciZVQ==
X-CSE-MsgGUID: HuB3iPStQiS9fW9N+VlO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="83902821"
Received: from slindbla-desk.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.197])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 04:08:27 -0700
Date: Tue, 20 Aug 2024 13:08:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Message-ID: <ZsR5KPxo-l9_7p0X@ashyti-mobl2.lan>
References: <20240820095304.2746102-1-yujiaoliang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820095304.2746102-1-yujiaoliang@vivo.com>
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

Hi,

On Tue, Aug 20, 2024 at 05:53:02PM +0800, Yu Jiaoliang wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> v2:
> - Change subject
> - Leave one blank line between the commit log and the tag section
> - Fix code alignment issue
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I didn't give you an explicit R-b, but that's fine, you can keep
it as I think the patch is fine.

> -		struct i915_wa *list = kmemdup_array(wal->list,
> -					       wal->count, sizeof(*list),
> -					       GFP_KERNEL);
> +		struct i915_wa *list = kmemdup_array(wal->list, wal->count,
> +											 sizeof(*list), GFP_KERNEL);

Do you see the indentation is off here? :-)

Please, run checkpatch.pl before sending the patch, as well.

Besides, what patch is this? Are you replacing kmemdup_array with
kmemdup_array? This v2 applies on your v1 while it should apply
on a clean drm-tip repository.

Thanks,
Andi

>  
>  		if (list) {
>  			kfree(wal->list);
> -- 
> 2.34.1
