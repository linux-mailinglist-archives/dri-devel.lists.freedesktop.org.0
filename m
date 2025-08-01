Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB6B1815C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1C10E840;
	Fri,  1 Aug 2025 11:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKmiGbxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC810E84C;
 Fri,  1 Aug 2025 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754049478; x=1785585478;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k4uJWNznZjrWRAkBSWrPOnb2RYyI0II7yPHZj90bRpw=;
 b=TKmiGbxT/Ij5W7RVU0QKXGf/8ySUlDXJPlUDUrFSkNGvc6yzQqT/knce
 fWfktE0d5MephOVZdGOn1+CifQn8lqqlQkFX/Ft2NVzFIm4/8IADm5hus
 Odktr47tCf8IKVTUM1m5G6uET2+H0lV1be9cQVz549JNbaCr2Q2GTGozQ
 MJBZJBNC+kzWmGeC4Bwon7RwO0eJWj3YL9OTtH5YI/b5mKIEokTxQaNAr
 p+hOj4CjLzz8ZwKhR7mRETY/GX67rMkl7okqFeGuUBkGwMXzpuSnt7xub
 nfedzJ4gHs8qAO+qPDQ16762m8n8yFQZyXirr6zWQ0bONTSx4bSPvSPXW Q==;
X-CSE-ConnectionGUID: +VQDQuYTS3mm038y4rax7A==
X-CSE-MsgGUID: LtX3WRy/TROTLZW6i7Fm3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43990993"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="43990993"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 04:57:57 -0700
X-CSE-ConnectionGUID: yA34cemMQQGS/GXT4qXCTg==
X-CSE-MsgGUID: 4X8/13uFRfCv0W0/ZV+Qog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200705685"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 04:57:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
In-Reply-To: <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
 <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
Date: Fri, 01 Aug 2025 14:57:48 +0300
Message-ID: <81dccfde92580d525cab5ce95d529e08c27b972c@intel.com>
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
> Thinking in OOP terms, the encoder is just a field in the struct.
> drm_connector is a base class for drm_writeback_connector. By making it
> optional, you are definitely semi-breaking the abstraction.

The trouble is, in OOP terms, drm_connector is the "base class" for both
drm_writeback_connector and intel_connector. We're already stretching
what we can do with C.

Currently, it's always guaranteed all drm_connectors i915 ever sees are
embedded within intel_connector. Changing from one pointer to another is
trivial, guaranteed to work, and is never NULL if the source pointer is
non-NULL. This is a design that's been around for the longest time.

The current writeback implementation forces a different design by always
embedding drm_connector itself. We can't use a drm_connector that's
embedded within an intel_connector with it. If we want to have our own
stuff, we'd need an intel_writeback_connector wrapping
drm_writeback_connector, and it gets even more complicated with all the
interfaces that use intel_connector. It really shouldn't have to be this
way.

Using the current drm_writeback_connector in i915 requires careful
auditing of all drm_connector <-> intel_connector conversions, NULL
checks, and graceful error handling, also in places that have no
convenient way to return errors at all.

The OOP abstractions just break hard with C, we can't have multiple
inheritance, and IMO the pragmatic approach is to let *drivers* do what
they want, instead of having a midlayer helper design force something on
them.


BR,
Jani.


-- 
Jani Nikula, Intel
