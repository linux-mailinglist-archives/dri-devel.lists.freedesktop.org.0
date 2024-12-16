Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CC9F2EC6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172C10E595;
	Mon, 16 Dec 2024 11:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6Qqbt9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361110E1A2;
 Mon, 16 Dec 2024 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734347030; x=1765883030;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qZxsuDdQSESsodeJ67vn3c7iLBM624CatINwtNsXBjw=;
 b=W6Qqbt9zu/WZ9ToggdKy5lTl82LIbxHENIqFc57Z+5tpUF2RnFz/Eppg
 JjWhGc3mDTZtVali+eTiC4oMEYzVCXFSipU9tHdI6IAMwa/ABIi+9OuWw
 AT6upJOgY003fzFeB1PN7VbgCB9EQfhKzVQYdiPYT3XmSV5I3IXTClKSU
 upANJGcVbrF1B7Hmp6rjsiV8AwcF4aDHWtKPyrcngX4hBHNuzeivYijYP
 1f2Yo/fzBmOixPMCoO7TqcTlhNLNef5M2Ov6+tFal5gN3M2SYZL0WsB4j
 7pPQDD3LBei3YwsABvS9THO+V/bfNVtAluazknNMe7EFO+WazPF9uY7Et w==;
X-CSE-ConnectionGUID: /VEPg6XRT9mKjVkcpVnFhg==
X-CSE-MsgGUID: 0CXOGVNMSnqjuvT2l18qcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34956845"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34956845"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:03:49 -0800
X-CSE-ConnectionGUID: gubzgyueQdSnYDsX25y2rg==
X-CSE-MsgGUID: nV81fbF8TuOOJ5iG7QTRJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97023747"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.245])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:03:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Lyude
 Paul <lyude@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Wayne Lin <wayne.lin@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Karol Herbst <kherbst@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
In-Reply-To: <Z1wjLr4EuJoeSCtD@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-5-imre.deak@intel.com> <87bjxhxla8.fsf@intel.com>
 <Z1wjLr4EuJoeSCtD@ideak-desk.fi.intel.com>
Date: Mon, 16 Dec 2024 13:03:42 +0200
Message-ID: <875xnjubxt.fsf@intel.com>
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

On Fri, 13 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Dec 12, 2024 at 12:12:15PM +0200, Jani Nikula wrote:
>> On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
>> > MST connectors should be initialized/registered by calling
>> > drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
>> > previous patch adding these functions explains the issue with the
>> 
>> References to "previous patch" become meaningless after this has been
>> committed.
>
> Ok, will change it to: "The patch adding these functions ...".

In 99% cases having the word "patch" in a commit message is just
wrong...

BR,
Jani.

>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> > current drm_connector_init*()/drm_connector_register() interface for
>> > MST connectors.
>> >
>> > Based on the above adjust here the registration part and change the
>> > initialization part in follow-up patches for each driver.
>> >
>> > For now, drivers are allowed to keep using the drm_connector_init*()
>> > functions, by drm_connector_dynamic_register() checking for this (see
>> > drm_connector_add()). A patch later will change this to WARN in such
>> > cases.
>> >
>> > Cc: Lyude Paul <lyude@redhat.com>
>> > Cc: Harry Wentland <harry.wentland@amd.com>
>> > Cc: Leo Li <sunpeng.li@amd.com>
>> > Cc: Wayne Lin <wayne.lin@amd.com>
>> > Cc: Alex Deucher <alexander.deucher@amd.com>
>> > Cc: Karol Herbst <kherbst@redhat.com>
>> > Cc: Danilo Krummrich <dakr@kernel.org>
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > index 687c70308d82b..f8cd094efa3c0 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > @@ -2281,7 +2281,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>> >  		port->cached_edid = drm_edid_read_ddc(port->connector,
>> >  						      &port->aux.ddc);
>> >  
>> > -	drm_connector_register(port->connector);
>> > +	drm_connector_dynamic_register(port->connector);
>> >  	return;
>> >  
>> >  error:
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
