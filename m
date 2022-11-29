Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51763BCF2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 10:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391C410E263;
	Tue, 29 Nov 2022 09:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD9110E3A0;
 Tue, 29 Nov 2022 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669714191; x=1701250191;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qqx6B/8RP8z7aH+i5nv1CeOqwhQdYf0WKoZWORVYLEU=;
 b=XJ9I9z47t8KNAdHP096tPU9T9IU/Yk1HTYzkUAZfwqnXk5mslhioRMQb
 aIVaWuOfKZG42OvSJAJu/99qBzlQLa3Pzw4x3uHGwV+QYgyI4PXpj5BEY
 /+RGJG3vgjAVmplCLE1bP8ApOUJCw7IiVqfbX/vroVavwDViT2Bshh9/A
 zEs+qSlGwtAqcXRc3XyhAxNmjNEQ143z4mO9eqoQhs+R4DxiiznxO9VJX
 RdJkjEdmTxzTh9rB97RAxIT3Io/LsM9Yid0TJg8O87p5cs5wrSDsnXCMi
 YBzTN6FGHfLkAi9qCiVJoA2vOyrXEIVtgPHRzfBp5hEPdQ9yK3ETMAAoH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="294760043"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="294760043"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:29:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="645832586"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; d="scan'208";a="645832586"
Received: from lclaesso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 01:29:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC 0/2] drm/connector: connector iterator with filtering
In-Reply-To: <7af346ec-8473-2a37-0fb4-220a42529a1e@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1664966047.git.jani.nikula@intel.com>
 <7af346ec-8473-2a37-0fb4-220a42529a1e@amd.com>
Date: Tue, 29 Nov 2022 11:29:45 +0200
Message-ID: <87iliy3y7q.fsf@intel.com>
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
Cc: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> On 10/5/22 06:51, Jani Nikula wrote:
>> Currently i915 assumes all drm_connectors it encounters are embedded in
>> intel_connectors that i915 allocated. The drm_writeback_connector forces
>> a design where this is not the case; we can't provide our own connector,
>> and writeback embeds the drm_connector it initializes itself.
>>=20
>> To use drm writeback, none of the i915 connector iteration could assume
>> the drm connector is embedded in intel_connector. Checking this is
>> tedious, and would require an intermediate step with
>> drm_connector. Here's an idea I came up with; filtering at the drm
>> connector iterator level with a caller supplied function. Not too much
>> code, and could be used for other things as well.
>>=20
>
> We've been trying to hook up drm_writeback_connector in amdgpu and
> this would be really helpful. I've had to do liberal sprinkling
> of "!=3D DRM_MODE_CONNECTOR_WRITEBACK" all over the place.
>
>> Mind you, we'd still much rather modify drm writeback to allow passing
>> the connector i915 allocated, instead of the current midlayer design
>> that forces drivers to a certain model. Working around this is a bunch
>> of error prone and tedious code that we really could do without.
>>=20
>
> I think this would be even better but also be much more work and impact
> every driver that implements writeback. FWIW, there was no way for me
> to add writeback connector handling without KASAN. Interpreting the
> connector wrong in one place leads to memory corruption and
> undefined behavior and is almost impossible to spot without KASAN.

Laurent, I once again plead - could we please reconsider this and give
drivers the option to allocate and provide the drm_connector to
writeback themselves?

All things considered I think that would be the safer option.


BR,
Jani.

>
> This series is
> Acked-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Dave Airlie <airlied@gmail.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Jani Nikula (2):
>>   drm/connector: add connector list iteration with filtering
>>   drm/i915: iterate intel_connectors only
>>=20
>>  drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++----
>>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
>>  .../drm/i915/display/intel_display_types.h    |  7 +++
>>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
>>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
>>  drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
>>  .../drm/i915/display/intel_modeset_setup.c    |  6 +-
>>  drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
>>  include/drm/drm_connector.h                   |  9 +++
>>  10 files changed, 89 insertions(+), 26 deletions(-)
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
