Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2AFA80CD9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709310E6B1;
	Tue,  8 Apr 2025 13:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nndeeJUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E60510E6B1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744120294; x=1775656294;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FRyVqyIGDDWPX66ccDPKXCI5hV4OAn9aT1p3wZZXQEM=;
 b=nndeeJUKT2XaEmxQ12CCJC/g4edewUKAUBUi0wCi7vUk07X1fAa0pjmB
 kCBfCrb8Fn7+vbi4wO3trkr1xqV78ljudL/PQJFi+iMIsPOUsXlAFA5OF
 xuFuwibxtj9oP/4J+3eji8IiMGEe4O14EpLmx+QJ3HozN5lSdi93iW9rH
 SVu+Xg/sXZK8dXDE6fAp1nP1omzkBl3s01bygBARKJeeafNgzwQ/dhvPE
 c0NMICfORogXhkUkL8wBmL1fb1yd2Sv2R4lRX/GPExZB5Xh1MKK22AsSh
 mjwYbc7cU2drS3+mPStT9feu2IjgEXeOZK2jcG+yXwBBWRtGvuFNOskuY A==;
X-CSE-ConnectionGUID: 7yRiH+C2T8CVYzOF7RAeyw==
X-CSE-MsgGUID: CcSi4A8tSCmQhxjzj2ZPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49398264"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49398264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:51:34 -0700
X-CSE-ConnectionGUID: LUP5wNbDRZ6oDLkXV+3D9Q==
X-CSE-MsgGUID: LJrp2DPkTDa9WtrX1v+ONQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="159268858"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.137])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:51:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Maxime
 Ripard <mripard@kernel.org>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Anusha Srivatsa
 <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj
 <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
In-Reply-To: <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
 <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
Date: Tue, 08 Apr 2025 16:51:25 +0300
Message-ID: <87o6x6yd5u.fsf@intel.com>
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

On Tue, 08 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>> > We will need more changes than fixing the variable names.
>> >
>> > I get this error
>> >
>> > ERROR: modpost: "__devm_drm_panel_alloc"
>> [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
>> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>> > make[1]: ***
>> > [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:
>> modpost]
>> > Error 2
>> > make: *** [Makefile:248: __sub-make] Error 2
>> >
>> > after making the following change.
>> 
>> I couldn't reproduce this one on current drm-misc-next with arm64 and
>> x86 allmodconfig. Could you share your configuration?
>> 
>
> Here is the config that our CI uses
>
> https://gitlab.freedesktop.org/drm/xe/ci/-/raw/main/kernel/kconfig

There's

CONFIG_DRM_PANEL=y
# CONFIG_OF is not set

but __devm_drm_panel_alloc is inside #ifdef CONFIG_OF. I don't know that
it should be.

There are some stubs in drm_panel.h for !CONFIG_OF but not this one.

Finally, DRM_PANEL_AUO_A030JTN01 does not depend on OF.


That's the issue, but I don't know what the correct fix would be.


BR,
Jani.


-- 
Jani Nikula, Intel
