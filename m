Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00682C117B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 22:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E993D10E197;
	Mon, 27 Oct 2025 21:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAlh4eUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7AF10E195;
 Mon, 27 Oct 2025 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761599381; x=1793135381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yzo9d1tJCritr1IkZ9qtvuzyML8wRiSl3ojBHJ5+K+w=;
 b=iAlh4eUY6YYS9IDGV5gOy9KoAxpHQQF3lNkcTY4BueRd13gIcw5KDMft
 WgiJ+dZ53fnEd6MVEw2f+Q+E8CBIbLc5nD7MLwJJ/0AuDBkjrRhkDiotH
 isEUHFK2X+Ek6ICNwGsXHJYe82p56y6ncBBsDI5sKHRT5325bWx3qOQvr
 eTRTMHzlxwUpz7wH6QjY4SFpMdpnxnXi72xElTQ91ZrA4XvX4pysB4PXu
 K4qiLXxy+JrQ8xmHap5StXZ30M0EoZmuJh1YSZlG2D65QZlNySUCeDgT1
 cmS+qRZhfZcSOWCJMbQ3MV2sC7iIkrm9GRIQAQi+MCZrLTO3ZTTksellH w==;
X-CSE-ConnectionGUID: DA+XYYOGSb+BiqyhHIoHQA==
X-CSE-MsgGUID: BPATpW4cTTKbAzE7w0ztuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62897033"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62897033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:09:41 -0700
X-CSE-ConnectionGUID: ed5aZR5HSiao67Yk9N7Gow==
X-CSE-MsgGUID: fhMmUB3CSBq1BsQdBi4nqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185914182"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.97])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:09:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id 23C4F11FADA;
 Mon, 27 Oct 2025 23:09:28 +0200 (EET)
Date: Mon, 27 Oct 2025 23:09:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>,
 Antonio Quartulli <antonio@mandelbit.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, Liao Yuanhong <liaoyuanhong@vivo.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 "Liang, Prike" <Prike.Liang@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Xie, Patrick" <Gangliang.Xie@amd.com>,
 "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>,
 "Skvortsov, Victor" <Victor.Skvortsov@amd.com>,
 "Sun, Ce(Overlord)" <Ce.Sun@amd.com>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Imre Deak <imre.deak@intel.com>, Ben Skeggs <bskeggs@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amd: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aP_fiCX8Cli2KL7s@kekkonen.localdomain>
References: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
 <BL1PR12MB514490DCB870F296D1554C14F7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB514490DCB870F296D1554C14F7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
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

Hi Alexander,

On Mon, Oct 27, 2025 at 03:52:28PM +0000, Deucher, Alexander wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Monday, October 27, 2025 9:15 AM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vetter
> > <simona@ffwll.ch>; Kuehling, Felix <Felix.Kuehling@amd.com>; Feng, Kenneth
> > <Kenneth.Feng@amd.com>; Lyude Paul <lyude@redhat.com>; Danilo Krummrich
> > <dakr@kernel.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>;
> > Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann
> > <tzimmermann@suse.de>; Limonciello, Mario <Mario.Limonciello@amd.com>;
> > Hung, Alex <Alex.Hung@amd.com>; Antonio Quartulli <antonio@mandelbit.com>;
> > Nirujogi, Pratap <Pratap.Nirujogi@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>;
> > Dmitry Baryshkov <lumag@kernel.org>; SHANMUGAM, SRINIVASAN
> > <SRINIVASAN.SHANMUGAM@amd.com>; Wang, Yang(Kevin)
> > <KevinYang.Wang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Zhang,
> > Jesse(Jie) <Jesse.Zhang@amd.com>; Ville Syrjälä <ville.syrjala@linux.intel.com>;
> > Liviu Dudau <liviu.dudau@arm.com>; Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>; Zhang, Hawking
> > <Hawking.Zhang@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Arnd
> > Bergmann <arnd@arndb.de>; Thomas Gleixner <tglx@linutronix.de>; Ingo Molnar
> > <mingo@kernel.org>; Liao Yuanhong <liaoyuanhong@vivo.com>; Rodrigo Siqueira
> > <siqueira@igalia.com>; Liang, Prike <Prike.Liang@amd.com>; Sharma, Shashank
> > <Shashank.Sharma@amd.com>; Paneer Selvam, Arunpravin
> > <Arunpravin.PaneerSelvam@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>;
> > Chai, Thomas <YiPeng.Chai@amd.com>; Xie, Patrick <Gangliang.Xie@amd.com>;
> > Liu, Xiang(Dean) <Xiang.Liu@amd.com>; Skvortsov, Victor
> > <Victor.Skvortsov@amd.com>; Sun, Ce(Overlord) <Ce.Sun@amd.com>; Dave
> > Airlie <airlied@redhat.com>; Jani Nikula <jani.nikula@intel.com>; Gustavo A. R.
> > Silva <gustavoars@kernel.org>; Imre Deak <imre.deak@intel.com>; Ben Skeggs
> > <bskeggs@nvidia.com>; nouveau@lists.freedesktop.org; amd-
> > gfx@lists.freedesktop.org
> > Subject: [PATCH 1/3] drm/amd: Remove redundant pm_runtime_mark_last_busy()
> > calls
> >
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call to
> > pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().
> 
> 
> Typo: should be "now-redundant"

Oops. You're first one to notice, in fact.

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Patches 1, 3 are:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> When did mark_last_busy get pulled into the other runtime_pm functions?
> Did you want me to pick these up or did you want to send them via some
> other tree?

Yes, please merge these.

pm_runtime_mark_last_busy() has been part of autosuspend related functions
since commit 18c1fe53d186867243f4cf17f4eef60737a16c4c, i.e. v6.17.

-- 
Kind regards,

Sakari Ailus
