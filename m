Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E161078FD2F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 14:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7410E7B7;
	Fri,  1 Sep 2023 12:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7D10E7B7;
 Fri,  1 Sep 2023 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693571264; x=1725107264;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OTEL3GSK+6A4sQHuCHvEp5CHkNzWKNu+FDPztYX+hGI=;
 b=FshBngAnY5WJ3BlzDpMAEoxHz8qcADzo7OsqpaZGyUigPFByWLzZozl/
 oUkO0orWx/9u3MIPlt2CZ3YY4rGD1zth/7aXP9q9kdMcmj+9mXBVL/Cbl
 i/Fgp+gBN+oOmHGqZ5utoSxInSCJ2AewVF/5ltnnHvkR0o/gu8KBjA6sg
 Mu3fxhFWn3Qz9jfv67eZEx4QHRbdhLfmR05L8CBYk/YyqFETPsjb3Euze
 rSdj9m1fCUwXkaAFomPhRUc/HERezpuzUaloDupwbMPpbax/P0eW9YdDJ
 Dgxmx9utfucH4exCPeeLDfsQcq4vdX5+sjaWsUbiEizbE2tkYUEjy5Lhq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462575733"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="462575733"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863524687"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="863524687"
Received: from epronina-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.34.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:27:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com> <87jztd2332.fsf@intel.com>
 <1e6aa1ff-9aa9-6b2f-84f4-e0304205085c@amd.com> <87h6oh0yz9.fsf@intel.com>
 <b32199ef-7179-3908-3bed-dd164cadc5de@amd.com>
Date: Fri, 01 Sep 2023 15:27:27 +0300
Message-ID: <87msy6hyds.fsf@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, "Wang, 
 Yu \(Charlie\)" <Yu.Wang4@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
> On 2023-08-30 01:29, Jani Nikula wrote:
>> On Tue, 29 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>>> There is a patch under internal reviews. It removes calls edid_override
>>> and drm_edid_override_connector_update as intended in this patchset but
>>> does not remove the functionality.
>> 
>> While I am happy to hear there's progress, I'm somewhat baffled the
>> review is internal. The commits that I suggested to revert were also
>> only reviewed internally, as far as I can see... And that's kind of the
>> problem.
>> 
>> Upstream code should be reviewed in public.
>
> Hi Jani,
>
> All patches are sent for public reviews, the progress is summarized as 
> the followings:
>
> == internal ==
>
> 1. a patch or patches are tested by CI.
> 2. internal technical and IP reviews are performed to ensure no concerns 
> before patches are merged to internal branch.
>
> == public ==
>
> 3. a regression test and IP reviews are performed by engineers before 
> sending to public mailing lists.
> 4. the patchset is sent for public reviews ex. 
> https://patchwork.freedesktop.org/series/122498/
> 5. patches are merged to public repo.

The point about public review is that there's no transparency to the
steps before 4. The patches are posted for public review with
Reviewed-by and Acked-by already added, based on internal review, and
there is de facto no public review taking place on the code drops. There
is zero visibility to the discussions taking place. We don't know if
it's just rubber stamping, we don't know what concerns were raised, if
any.

I'm mainly disappointed about the double standards here, given that we
post most patches directly upstream (especially ones that have zero
reason to be embargoed like the ones being discussed here), and the ones
that have gone through internal review will be stripped of all prior
internal Reviewed-by's and Acked-by's before posting. Because that's the
upstream expectation.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
