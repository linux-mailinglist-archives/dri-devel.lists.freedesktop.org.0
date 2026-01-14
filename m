Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B7D1EA22
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CDA10E577;
	Wed, 14 Jan 2026 12:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvRlaBsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7A10E577
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768392296; x=1799928296;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8Vys6z8x451y8jCfmv4tHJdqji+vE+8qZ4G6/y7V1fs=;
 b=IvRlaBsPIgTLVAQIcSy1MfjQlAqigqz7dOaIfRmZkWXTXfqV+/i0Rj04
 zc09Rdn5InMiVZ5E0FykTZz309un17AbzaFDRcku9/ppaCstuSzdtrCwM
 mgRoePoESKMplSb2CJtJ9iIm0T3D1j0k4MCPTvYdahbX5GYpM98Lsq9gj
 pylkLCG0kvMT9VXX+967pGvJWhP4Pe+wSkwPOKq8U55rUKiiq9RcLhw96
 P5N/TUa3uNnloqmk7FxGM3s2xULhG8F2YZliLK6cqddEe/vdVhYQh/gnB
 znkQ6lrJbqWNWYn5Hr0ihX85pkNbFwZmlS7+Zb5PxY0hqHDQcTPa5crYD A==;
X-CSE-ConnectionGUID: Mcp84+0eQiW8v2+G9xQvaA==
X-CSE-MsgGUID: JqONOFnMQRK6+YlOTqp/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69608376"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69608376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:04:56 -0800
X-CSE-ConnectionGUID: L5TFJIbzQHuz1awGSe6Qmg==
X-CSE-MsgGUID: UaaRHJhvTS+nCq8qGoc/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="242205696"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:04:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>, Jonathan
 Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>, Chirag
 Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 4/5] accel/thames: Add IOCTL for job submission
In-Reply-To: <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:04:44 +0200
Message-ID: <1acdffd8f05eae0a3531d43d3919d8bd4558f37a@intel.com>
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

On Tue, 13 Jan 2026, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> +#include "linux/dev_printk.h"

Random drive-by comment, please use <> instead of "" for include/
headers.

> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_print.h>
> +#include <drm/thames_accel.h>
> +#include <linux/platform_device.h>

In general, I think it will make everyone's life easier in the long run
if the include directives are grouped and sorted.

BR,
Jani.


-- 
Jani Nikula, Intel
