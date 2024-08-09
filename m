Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8E94CD70
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 11:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643D610E89C;
	Fri,  9 Aug 2024 09:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McEBh7Q+";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3DC10E0D3;
 Fri,  9 Aug 2024 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723196193; x=1754732193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DULiSxCIG2Bvwy7FuA7gZ52n7hUXMFaJ2hKXwO5m2ZU=;
 b=McEBh7Q+0vQuy1HLKNR64t4EZYniGKWvoEB62ka2hPXJxqF2r5/lGc4W
 fGFZPdilYxpz+dlkqCidCgFJLe+YBYmv5JnNz8kagiTlM8B9WQBk1RuUl
 aape81/+ur23siPdyEcJZDO61C87PqJnnUAC++133t9OecIAIWhXzqbDE
 4p/JbjLU9zx4erfDiwCKLOVOSJ/QbhQYAFeR2UPkcZSDFI3nj0IBLMV80
 /pvlyldF/BqF5lrTLOr2YPgxZdJJZc/BoHXhTP4i67VEK6G4fUR+EjF4x
 +ECQw3ghFYteUsWgrrjjtwI02/Mc7uxP+BSkG9vo/uPORqyIiq3GGNMfJ A==;
X-CSE-ConnectionGUID: G6mjxFj7Tium40qEzyC70A==
X-CSE-MsgGUID: p8iixIjuSz2qOPAKhslWKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21020629"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21020629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:36:33 -0700
X-CSE-ConnectionGUID: VFHl8hX0Q+ybCmbTWoJ3RA==
X-CSE-MsgGUID: FagNIRvPR4uj4OCSoVtgfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="58076525"
Received: from opintica-mobl1 (HELO intel.com) ([10.245.245.156])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:36:28 -0700
Date: Fri, 9 Aug 2024 10:36:22 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Fix missing enable of Wa_14019159160 on ARL
Message-ID: <ZrXjFrPMB8VrZjHO@ashyti-mobl2.lan>
References: <20240809000646.1747507-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809000646.1747507-1-John.C.Harrison@Intel.com>
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

Hi Johna,

On Thu, Aug 08, 2024 at 05:06:46PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The previous update to enable the workaround on ARL only changed two
> out of three places where the w/a needs to be enabled. That meant the
> GuC side was operational but not the KMD side. And as the KMD side is
> the trigger, it meant the w/a was not actually active. So fix that.
> 
> Fixes: 104bcfae57d8 ("drm/i915/arl: Enable Wa_14019159160 for ARL")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
