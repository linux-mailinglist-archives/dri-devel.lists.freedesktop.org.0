Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A209178CA1B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AAF10E0B1;
	Tue, 29 Aug 2023 17:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4BA10E0B1;
 Tue, 29 Aug 2023 17:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693328616; x=1724864616;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YUkLAQenJJE5Yaz87Zbzp9BGM85+HFJ0AxL4o4NZzDs=;
 b=e5gps49a+0KNUVin4KFAbEfDz2QsLsUGGzBl//KgpMpkZQV52JLLpzU/
 EHQZU5gLh3K0coX69/FSiC0dSwLt7bJ7TyH6nWK9lGIgaHuKjgoVOu3ri
 0+yzYLvdMaFmf8lv3VcxKTL3GYf8yMyroV/KosbfzcQbEXmiR4LuwOY/o
 Ks7DZEjAiwein27Ii9gTMo/sjVUCTYZ0+7KcIPGiG/MgzFrmc7OruEsAu
 fjIueQ9wBDs+dl//Zqlstnzn0jKNp/5ut2owncthyYGxQ/JyKQkYRHIaI
 i81O5FkPEAytCjqo0DwOV0RtbqMhLc7hB2Kt+BSQ6Gr3r6f4EQMAidI32 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360425293"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="360425293"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 10:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882391625"
Received: from mnefedov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.206])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 10:03:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
In-Reply-To: <87o7ip252r.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1692705543.git.jani.nikula@intel.com>
 <788721f6-afff-e0b2-db7c-32ab2dd075a9@amd.com> <87il965gob.fsf@intel.com>
 <871qfm2kg1.fsf@intel.com>
 <CADnq5_P49U3dcqiZhB-CjS8UbOtB7K2jNObS0ZQqMhOr3UhLQg@mail.gmail.com>
 <87o7ip252r.fsf@intel.com>
Date: Tue, 29 Aug 2023 20:03:29 +0300
Message-ID: <87jztd2332.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alex Hung <alex.hung@amd.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 29 Aug 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Aug 29, 2023 at 6:48=E2=80=AFAM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>>
>>> On Wed, 23 Aug 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> > On Tue, 22 Aug 2023, Alex Hung <alex.hung@amd.com> wrote:
>>> >> On 2023-08-22 06:01, Jani Nikula wrote:
>>> >>> Over the past years I've been trying to unify the override and firm=
ware
>>> >>> EDID handling as well as EDID property updates. It won't work if dr=
ivers
>>> >>> do their own random things.
>>> >> Let's check how to replace these references by appropriate ones or f=
ork
>>> >> the function as reverting these patches causes regressions.
>>> >
>>> > I think the fundamental problem you have is conflating connector forc=
ing
>>> > with EDID override. They're orthogonal. The .force callback has no
>>> > business basing the decisions on connector->edid_override. Force is
>>> > force, override is override.
>>> >
>>> > The driver isn't even supposed to know or care if the EDID originates
>>> > from the firmware loader or override EDID debugfs. drm_get_edid() will
>>> > handle that for you transparently. It'll return the EDID, and you
>>> > shouldn't look at connector->edid_blob_ptr either. Using that will ma=
ke
>>> > future work in drm_edid.c harder.
>>> >
>>> > You can't fix that with minor tweaks. I think you'll be better off
>>> > starting from scratch.
>>> >
>>> > Also, connector->edid_override is debugfs. You actually can change the
>>> > behaviour. If your userspace, whatever it is, has been written to ass=
ume
>>> > connector forcing if EDID override is set, you *do* have to fix that,
>>> > and set both.
>>>
>>> Any updates on fixing this, or shall we proceed with the reverts?
>>
>> What is the goal of the reverts?  I don't disagree that we may be
>> using the interfaces wrong, but reverting them will regess
>> functionality in the driver.
>
> The commits are in v6.5-rc1, but not yet in a release. No user depends
> on them yet. I'd strongly prefer them not reaching v6.5 final and users.

Sorry for confusion here, that's obviously come and gone already. :(

> The firmware EDID, override EDID, connector forcing, the EDID property,
> etc. have been and somewhat still are a hairy mess that we must keep
> untangling, and this isn't helping.
>
> I've put in crazy amounts of work on this, and I've added kernel-doc
> comments about stuff that should and should not be done, but they go
> unread and ignored.
>
> I really don't want to end up having to clean this up myself before I
> can embark on further cleanups and refactoring.
>
> And again, if the functionality in the driver depends on conflating two
> things that should be separate, it's probably not such a hot idea to let
> it reach users either. Even if it's just debugfs.
>
>
> BR,
> Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
