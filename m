Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76605874FD1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07F10E709;
	Thu,  7 Mar 2024 13:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkbMheRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F2210E709
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709817635; x=1741353635;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=kPWUqgeNQP4Y3dgOFvto8n5/fcerRCNZ/MdkFfUD21A=;
 b=jkbMheRy1HNVHekW5YLCRuklzlyLOzY8N10N2YTqwzJSc9UhUIWUvkeq
 NzN1zVo0Jq1lQk+c3+MWTprQrNGUOcwr+cir4r66j596m/ZvqTVzq+LLg
 NwyG/+AoZ2M4N6AdUyctlguRJusEpsEUKXAC9Vo5zSdgqk4eDz5aveK3E
 5mDGJICSAvttU7HtrIMac4Svfj2G947Dt0noQ1APUtYC4kOcSfsVqFJt/
 6uQeZBWVFxr0ke24PnaJTdxgW1fMkHZTGqSFlMVHFTHTpJTgNtwcreJNq
 BYbaEjE+cbkLg1MzxZXh8oDC7N1jgwDWkAs80hiznI9BCXvb3NoM33e8P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4659932"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4659932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10534839"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:20:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
In-Reply-To: <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
 <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
 <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
 <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
Date: Thu, 07 Mar 2024 15:20:27 +0200
Message-ID: <87r0gmw544.fsf@intel.com>
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

On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Wed, Mar 6, 2024 at 4:20=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>>
>> On Wed, Mar 6, 2024 at 3:30=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>> >
>> > Hi,
>> >
>> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.=
org> wrote:
>> > >
>> > > +static void
>> > > +match_identity(const struct detailed_timing *timing, void *data)
>> > > +{
>> > > +       struct drm_edid_match_closure *closure =3D data;
>> > > +       unsigned int i;
>> > > +       const char *name =3D closure->ident->name;
>> > > +       unsigned int name_len =3D strlen(name);
>> > > +       const char *desc =3D timing->data.other_data.data.str.str;
>> > > +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_data=
.data.str.str);
>> > > +
>> > > +       if (name_len > desc_len ||
>> > > +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME=
) ||
>> > > +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRI=
NG)))
>> > > +               return;
>> > > +
>> > > +       if (strncmp(name, desc, name_len))
>> > > +               return;
>> > > +
>> > > +       /* Allow trailing white spaces and \0. */
>> > > +       for (i =3D name_len; i < desc_len; i++) {
>> > > +               if (desc[i] =3D=3D '\n')
>> > > +                       break;
>> > > +               if (!isspace(desc[i]) && !desc[i])
>> > > +                       return;
>> > > +       }
>> >
>> > If my code analysis is correct, I think you'll reject the case where:
>> >
>> > name =3D "foo"
>> > desc[13] =3D "foo \0zzzzzzzz"
>> >
>> > ...but you'll accept these cases:
>> >
>> > desc[13] =3D "foo \nzzzzzzzz"
>> > desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"
>> >
>> > It somehow seems weird to me that a '\n' terminates the string but not=
 a '\0'.
>>
>> I'm also not sure about \0... based on
>> https://git.linuxtv.org/edid-decode.git/tree/parse-base-block.cpp#n493,
>> they use \n as terminator. Maybe we should also reject \0 before\n?
>> Since it's not printable.
>
> Ah, OK. I guess the EDID spec simply doesn't allow for '\0' in there.
> I guess in that case I'd prefer simply removing the code to handle
> '\0' instead of treating it like space until we see some actual need
> for it. So just get rid of the "!desc[i]" case?

The spec text, similar for both EDID_DETAIL_MONITOR_NAME and
EDID_DETAIL_MONITOR_STRING:

	Up to 13 alphanumeric characters (using ASCII codes) may be used
	to define the model name of the display product. The data shall
	be sequenced such that the 1st byte (ASCII code) =3D the 1st
	character, the 2nd byte (ASCII code) =3D the 2nd character,
	etc. If there are less than 13 characters in the string, then
	terminate the display product name string with ASCII code =E2=80=980Ah=E2=
=80=99
	(line feed) and pad the unused bytes in the field with ASCII
	code =E2=80=9820h=E2=80=99 (space).

In theory, only checking for '\n' for termination should be enough, and
this is what drm_edid_get_monitor_name() does. If there's a space
*before* that, it should be considered part of the name, and not
ignored. (So my suggestion in reply to the previous version is wrong.)

However, since the match name uses NUL termination, maybe we should
ignore NULs *before* '\n'? Like so:

for (i =3D name_len; i < desc_len; i++) {
        if (desc[i] =3D=3D '\n')
                break;
        if (!desc[i])
                return;
}


BR,
Jani.


>
> -Doug

--=20
Jani Nikula, Intel
