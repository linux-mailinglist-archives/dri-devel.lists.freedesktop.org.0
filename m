Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E187116F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577E311274D;
	Tue,  5 Mar 2024 00:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfgHuFoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982811274D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709597395; x=1741133395;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sxwRPIeHhnGwmE6TMkVaxGE/qOGK/s2muW2cFbd2vEY=;
 b=lfgHuFoDceiMhr5vfA7k/qNeNWP/AE5y8lG0KtG/SV4v4nuQM2XWj/aH
 a7nf3si6ymrPPvs9ZcUHdijaavhB6U8RDv5WJ1Hk2EVM9Dn8WLPF+5s1R
 4ZJ2PxlJdQG5YO1BJ25Y2IXVgYL8RxjWIyEyYXOkelijE1n08qWQv2L+z
 MLBocfxIcFR5g/DFdhHTVxVqpDq1hczovfmoiZUy/6ie+MNv1aNsprTZ2
 z+IxvZGCi/YPirrV9KEfvdoQsyrQ26VcV4zgrB/e954fBQDgOz1UUMGEc
 2kzKjcxHA8fMwL6VLT6Z/eyLxjHxWdseNUPbBrBVjEo5nKIkb5MOwbKsw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3982370"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3982370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 16:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9076604"
Received: from syakovle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.3])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 16:09:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
In-Reply-To: <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org> <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
Date: Tue, 05 Mar 2024 02:09:34 +0200
Message-ID: <874jdl4k01.fsf@intel.com>
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

On Mon, 04 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> On Mon, Mar 4, 2024 at 12:38=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
>>
>> On Mon, 04 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>> > Add a function to check if the EDID base block contains a given string.
>> >
>> > One of the use cases is fetching panel from a list of panel names, sin=
ce
>> > some panel vendors put the monitor name after EDID_DETAIL_MONITOR_STRI=
NG
>> > instead of EDID_DETAIL_MONITOR_NAME.
>> >
>> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> > ---
>> > v2->v3: move string matching to drm_edid
>> > ---
>> >  drivers/gpu/drm/drm_edid.c | 49 ++++++++++++++++++++++++++++++++++++++
>> >  include/drm/drm_edid.h     |  1 +
>> >  2 files changed, 50 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> > index 13454bc64ca2..fcdc2bd143dd 100644
>> > --- a/drivers/gpu/drm/drm_edid.c
>> > +++ b/drivers/gpu/drm/drm_edid.c
>> > @@ -2789,6 +2789,55 @@ u32 drm_edid_get_panel_id(struct edid_base_bloc=
k *base_block)
>> >  }
>> >  EXPORT_SYMBOL(drm_edid_get_panel_id);
>> >
>> > +/**
>> > + * drm_edid_has_monitor_string - Check if a EDID base block has certa=
in string.
>> > + * @base_block: EDID base block to check.
>> > + * @str: pointer to a character array to hold the string to be checke=
d.
>> > + *
>> > + * Check if the detailed timings section of a EDID base block has the=
 given
>> > + * string.
>> > + *
>> > + * Return: True if the EDID base block contains the string, false oth=
erwise.
>> > + */
>> > +bool drm_edid_has_monitor_string(struct edid_base_block *base_block, =
const char *str)
>> > +{
>> > +     unsigned int i, j, k, buflen =3D strlen(str);
>> > +
>> > +     for (i =3D 0; i < EDID_DETAILED_TIMINGS; i++) {
>> > +             struct detailed_timing *timing =3D &base_block->edid.det=
ailed_timings[i];
>> > +             unsigned int size =3D ARRAY_SIZE(timing->data.other_data=
.data.str.str);
>> > +
>> > +             if (buflen > size || timing->pixel_clock !=3D 0 ||
>> > +                 timing->data.other_data.pad1 !=3D 0 ||
>> > +                 (timing->data.other_data.type !=3D EDID_DETAIL_MONIT=
OR_NAME &&
>> > +                  timing->data.other_data.type !=3D EDID_DETAIL_MONIT=
OR_STRING))
>> > +                     continue;
>> > +
>> > +             for (j =3D 0; j < buflen; j++) {
>> > +                     char c =3D timing->data.other_data.data.str.str[=
j];
>> > +
>> > +                     if (c !=3D str[j] ||  c =3D=3D '\n')
>> > +                             break;
>> > +             }
>> > +
>> > +             if (j =3D=3D buflen) {
>> > +                     /* Allow trailing white spaces. */
>> > +                     for (k =3D j; k < size; k++) {
>> > +                             char c =3D timing->data.other_data.data.=
str.str[k];
>> > +
>> > +                             if (c =3D=3D '\n')
>> > +                                     return true;
>> > +                             else if (c !=3D ' ')
>> > +                                     break;
>> > +                     }
>> > +                     if (k =3D=3D size)
>> > +                             return true;
>> > +             }
>> > +     }
>> > +
>> > +     return false;
>> > +}
>> > +
>>
>> So we've put a lot of effort into converting from struct edid to struct
>> drm_edid, passing that around in drm_edid.c, with the allocation size it
>> provides, and generally cleaning stuff up.
>>
>> I'm not at all happy to see *another* struct added just for the base
>> block, and detailed timing iteration as well as monitor name parsing
>> duplicated.
>>
>> With struct drm_edid you can actually return an EDID that only has the
>> base block and size 128, even if the EDID indicates more
>> extensions. Because the whole thing is *designed* to handle that
>> gracefully. The allocated size matters, not what the blob originating
>> outside of the kernel tells you.
>>
>> What I'm thinking is:
>>
>> - Add some struct drm_edid_ident or similar. Add all the information
>>   that's needed to identify a panel there. I guess initially that's
>>   panel_id and name.
>>
>>     struct drm_edid_ident {
>>         u32 panel_id;
>>         const char *name;
>>     };
>>
>> - Add function:
>>
>>     bool drm_edid_match(const struct drm_edid *drm_edid, const struct dr=
m_edid_ident *ident);
>>
>>   Check if stuff in ident matches drm_edid. You can use and extend the
>>   existing drm_edid based iteration etc. in
>>   drm_edid.c. Straightforward. The fields in ident can trivially be
>>   extended later, and the stuff can be useful for other drivers and
>>   quirks etc.
>>
>> - Restructure struct edp_panel_entry to contain struct
>>   drm_edid_ident. Change the iteration of edp_panels array to use
>>   drm_edid_match() on the array elements and the edid.
>>
>> - Add a function to read the EDID base block *but* make it return const
>>   struct drm_edid *. Add warnings in the comments that it's only for
>>   panel and for transition until it switches to reading full EDIDs.
>>
>>     const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *=
adapter);
>>
>>   This is the *only* hackish part of the whole thing, and it's nicely
>>   isolated. For the most part you can use drm_edid_get_panel_id() code
>>   for this, just return the blob wrapped in a struct drm_edid envelope.
>
> To clarify:
> struct drm_edid currently is only internal to drm_edid.c. So with
> change we will have to move it to the header drm_edid.h

Absolutely not, struct drm_edid must remain an opaque type. The point is
that you ask drm_edid.c if there's a match or not, and the panel code
does not need to care what's inside struct drm_edid.

>
>>
>> - Remove function:
>>
>>     u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>>
>
> Probably change to u32 drm_edid_get_panel_id(const struct drm_edid
> *);? Given that we still need to parse id from
> drm_edid_read_base_block().

No, we no longer need to parse the id outside of drm_edid.c. You'll have
the id's in panel code in the form of struct drm_edid_ident (or
whatever), and use the match function to see if the opaque drm_edid
matches.

>
>> - Refactor edid_quirk_list to use the same id struct and match function
>>   and mechanism within drm_edid.c (can be follow-up too).
>>
>
> edid_quirk currently doesn't have panel names in it, and it might be a
> bit difficult to get all the correct names of these panels without
> having the datasheets.
> One way is to leave the name as null and if the name is empty and skip
> matching the name in drm_edid_match().

Exactly. NULL in drm_edid_ident would mean "don't care". I think most of
the ones in panel code also won't use the name for matching.

BR,
Jani.

>
>> - Once you change the panel code to read the whole EDID using
>>   drm_edid_read family of functions in the future, you don't have to
>>   change *anything* about the iteration or matching or anything, because
>>   it's already passing struct drm_edid around.
>>
>>
>> I hope this covers everything.
>>
>> BR,
>> Jani.
>>
>>
>> >  /**
>> >   * drm_edid_get_base_block - Get a panel's EDID base block
>> >   * @adapter: I2C adapter to use for DDC
>> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> > index 2455d6ab2221..248ddb0a6b5d 100644
>> > --- a/include/drm/drm_edid.h
>> > +++ b/include/drm/drm_edid.h
>> > @@ -416,6 +416,7 @@ struct edid *drm_get_edid(struct drm_connector *co=
nnector,
>> >                         struct i2c_adapter *adapter);
>> >  struct edid_base_block *drm_edid_get_base_block(struct i2c_adapter *a=
dapter);
>> >  u32 drm_edid_get_panel_id(struct edid_base_block *base_block);
>> > +bool drm_edid_has_monitor_string(struct edid_base_block *base_block, =
const char *str);
>> >  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>> >                                    struct i2c_adapter *adapter);
>> >  struct edid *drm_edid_duplicate(const struct edid *edid);
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
