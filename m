Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8B69A965
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 11:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2910EF53;
	Fri, 17 Feb 2023 10:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E5610EF53
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676631010; x=1708167010;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oesV3PQujutHfB7j+SlHkyxVpPTQ5Dz190YNXIcxXEc=;
 b=chPcKEknA5l2zpnPxXgdF/Rivr9ehL59ouITbDYqgO7RJagxzSP864Jx
 fIo6pjShOmGdugvv/XnHkajyTH+oIYvFh4avZJkn05m1WWC2i9roDsedB
 v1gkuOM8uyHyT2J4D/usPga8uoS55CpB2OVMicXBKcphgcccyZCNPFzfP
 QwiNP4n3gvDnW9rP387qiFQMGI20HGS8n0Wf0rPJTFP/+0h1952pXiexA
 +7jtz3tCRsL3U8umGFSdAwMHNGMeXDBk2xWVlFyDZmwzvGL40V102tDXc
 vlCRtBXPwhZu0vJ55e8S6h9WGxlsyy46El3cf1P/hoRd3TmhTmGqFxEn0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320066517"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="320066517"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:49:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670500094"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670500094"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 02:49:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
In-Reply-To: <20230217103501.GC2862577@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com> <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com>
Date: Fri, 17 Feb 2023 12:49:41 +0200
Message-ID: <871qmozhve.fsf@intel.com>
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
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, daniel.vetter@ffwll.ch,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Feb 2023, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> wrote:
> On Thu, Feb 16, 2023 at 07:06:46PM +0200, Jani Nikula wrote:
>> >
>> > But should not this the driver responsibility, call drm_debugfs_add_file()
>> > whenever you are ready to handle operations on added file ?
>> 
>> In theory, yes, but in practice it's pretty hard for a non-trivial
>> driver to maintain that all the conditions are met.
>
> Hmmm... 
>
>> In i915 we call debugfs register all over the place only after we've
>> called drm_dev_register(), because it's the only sane way. But it means
>> we need the init and register separated everywhere, instead of init
>> adding files to a list to be registered later.
>
> Isn't this done this way in i915 only because it was not possible
> (and still isn't) to call drm_debugfs_create_file() before registration ?
>
> I think it's should be ok by i915 subsystem to create it's debugfs
> files and allow to access to them just after that subsystem init.
>
> Or there are some complex dependencies between i915 subsystems,
> that reading registers from one subsystem will corrupt some
> other subsystem that did non finish initialization yet?

That's the point. It's really hard to figure it all out. Why bother?

BR,
Jani.


>
> Regards
> Stanislaw

-- 
Jani Nikula, Intel Open Source Graphics Center
