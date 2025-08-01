Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E5B18307
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2D410E861;
	Fri,  1 Aug 2025 13:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVx5oJz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB2610E859;
 Fri,  1 Aug 2025 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754056669; x=1785592669;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LHioNnK+td9GRZob+f0CgIjido1UaupEbOs3wFg1UWM=;
 b=PVx5oJz8l8M92JkG82V4yo+MGuRyEyoR33OmkxIMGK8Cy0G3Q2OrcEbN
 AUgKOVtaldQgsS3hq0rpK1gcPGgri+OyqkT33AaujvpcPKaUqQxWjXqHf
 2GLLx+duiRSI4hmrm5S1iQrjIxOyA2HIAJ7KbIcuqFAh2+DCqCKl40KHV
 t9H9fcgMTPr/Tam04+B0sT4U7PlTMdb9OwCcJVqBLEtvZKaafdrO04SAT
 3DzhxUErKgm2FwSwSk6BwdUfkFQTZtYn+LepVjIviCy/58ycHwe2bLqw4
 TbIkjpvvSIieY+z69JLMl39fwjAaGTNkVK8Wp3TOJeJD+azh/OInP+Loh w==;
X-CSE-ConnectionGUID: 5qBBy5btRKqFETKC4t1YJg==
X-CSE-MsgGUID: nAkqmISgTxCRtz2mJvJXOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56291376"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56291376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 06:57:49 -0700
X-CSE-ConnectionGUID: iP1HRk6tS8KaJd1fx+cugg==
X-CSE-MsgGUID: OmN8BjAqQEGhs8GenEBOeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194532729"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.164])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 06:57:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
In-Reply-To: <mn5lxsobcdc27m7xjh6srii4gbrpus36bvxyu3krqrxzoj5hrv@k3rc4v2xz2nd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
 <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
 <81dccfde92580d525cab5ce95d529e08c27b972c@intel.com>
 <mn5lxsobcdc27m7xjh6srii4gbrpus36bvxyu3krqrxzoj5hrv@k3rc4v2xz2nd>
Date: Fri, 01 Aug 2025 16:57:38 +0300
Message-ID: <31cfd8b7bfe25d0b0558826cbadf04052b1de973@intel.com>
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

On Fri, 01 Aug 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> Yes. Basically, that's why I suggest refacoring drm_writeback_connector
> to mvoe drm_connector_writeback into drm_connector itself (like it's done
> for drm_connector_hdmi).

Ah, sorry, I think I missed that portion in my post-vacation email
catch-up.

BR,
Jani.

-- 
Jani Nikula, Intel
