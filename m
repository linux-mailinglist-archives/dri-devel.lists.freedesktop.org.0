Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0E413175
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD116E935;
	Tue, 21 Sep 2021 10:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0F36E935;
 Tue, 21 Sep 2021 10:27:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286998067"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="286998067"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 03:27:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="549430025"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 03:27:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Rados=C5=82aw?= Biernacki <rad@semihalf.com>, "Souza\, Jose"
 <jose.souza@intel.com>
Cc: "Lee\, Shawn C" <shawn.c.lee@intel.com>,
 "lma\@semihalf.com" <lma@semihalf.com>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "joonas.lahtinen\@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "upstream\@semihalf.com" <upstream@semihalf.com>
Subject: Re: [PATCH v1] drm/i915/bdb: Fix version check
In-Reply-To: <CAOs-w0J8pd-CE1iu1Bpy-3R20sxa=AJuSQwiRkyrFz0TFLBL4Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920141101.194959-1-lma@semihalf.com>
 <051f4a37e178d11c6dbcd05b5d6be28731cd7302.camel@intel.com>
 <CAOs-w0J8pd-CE1iu1Bpy-3R20sxa=AJuSQwiRkyrFz0TFLBL4Q@mail.gmail.com>
Date: Tue, 21 Sep 2021 13:27:32 +0300
Message-ID: <87bl4mte97.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Sep 2021, Rados=C5=82aw Biernacki <rad@semihalf.com> wrote:
> - dropping stable
>
> ...
>
>> > diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/g=
pu/drm/i915/display/intel_vbt_defs.h
>> > index 330077c2e588..fff456bf8783 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
>> > @@ -814,6 +814,11 @@ struct lfp_brightness_level {
>> >       u16 reserved;
>> >  } __packed;
>> >
>> > +/*
>> > + * Changing struct bdb_lfp_backlight_data might affect its
>> > + * size comparation to the value hold in BDB.
>> > + * (e.g. in parse_lfp_backlight())
>> > + */
>>
>> This is true for all the blocks so I don't think we need this comment.
>
> Lack of such comment was probable cause of this overlook.
> As this is an example of the consequence (bricking platforms dependent
> on mentioned conditions) IMO we need some comment here, or this will
> probably happen again.

The whole file is full of __packed structs with the sole purpose of
parsing VBT data in memory. People are generally well aware of the
consequences of changing the size, and this is the only such mistake I
can recall.

BR,
Jani.


>
>
>>
>> >  struct bdb_lfp_backlight_data {
>> >       u8 entry_size;
>> >       struct lfp_backlight_data_entry data[16];
>>

--=20
Jani Nikula, Intel Open Source Graphics Center
