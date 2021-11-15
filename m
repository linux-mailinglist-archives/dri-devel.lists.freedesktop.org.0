Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792A4514E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 21:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718BB6E0FE;
	Mon, 15 Nov 2021 20:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413AB6E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 20:18:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="230984620"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="230984620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 12:18:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="506081883"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 12:18:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
In-Reply-To: <YZK3nPgQRYl8ys8t@gineta.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YZARol5A5hS+5a5m@gineta.localdomain>
 <YZAikieq4bwrJ58c@ravnborg.org> <YZFIvfY1j0f3pVQt@gineta.localdomain>
 <87fsrx3eed.fsf@intel.com> <YZK3nPgQRYl8ys8t@gineta.localdomain>
Date: Mon, 15 Nov 2021 22:17:58 +0200
Message-ID: <87fsrx18cp.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
> On Mon, Nov 15, 2021 at 12:24:26PM +0200, Jani Nikula wrote:
>> On Sun, 14 Nov 2021, Claudio Suarez <cssk@net-c.es> wrote:
>> > On Sat, Nov 13, 2021 at 09:39:46PM +0100, Sam Ravnborg wrote:
>> >> Hi Claudio,
>> >>=20
>> >> On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
>> >> > The prefered way to log connectors is [CONNECTOR:id:name]. Change i=
t in
>> >> > drm core programs.
>> >> >=20
>> >> > Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m>
>> >> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
>> >>=20
>> >> While touching all these logging calls, could you convernt them to the
>> >> newer drm_dbg_kms variants?
>> >> DRM_DEBUG_* are all deprecated.
>> >>=20
>> >
>> > Yes, I can, but it is recommended to do it in a different patch:
>> >
>> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#separate-your-changes
>> >
>> > C&P:
>> > "Separate your changes
>> > Separate each logical change into a separate patch.
>> > For example, if your changes include both bug fixes and performance en=
hancements..."
>> >
>> >
>> > I will study and send a new separate patch with your suggestion.
>>=20
>> I feel these logging changes are the types of changes where I'd err on
>> the side of fewer patches than strictly following the above guidelines.
>
> To size the problem:
> - there are about 3434 references to DRM_DEBUG_* in all the drm code, all=
 drivers.
> - there are 413 references to DRM_DEBUG_* in the drm core code, only 66 of
>    them are related to connectors.
> - there are 62 references to DRM_ERR* and 7 references to DRM_INFO in
>    the drm core programs.
>
> I meant I can make two patches:
>  1 - this one with the change to CONNECTOR:id:name (29 changes)
>  2 - a new and bigger patch to change 413 + 62 + 7 references to DRM_{DEB=
UG,ERR,INFO}
>      in the drm core programs.

The second one is an on-going change that will have to happen gradually,
file by file. Changing connector references while at it seems like a
reasonable drive-by-change to me. (Others may disagree.)

> The second patch will be ready in a few days.
>
> Is it a good plan ? or can it be improved ?

It can't be a single patch. It needs to be split to smaller changes.

BR,
Jani.

>
> Best regards,
> Claudio Suarez.
>
>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
