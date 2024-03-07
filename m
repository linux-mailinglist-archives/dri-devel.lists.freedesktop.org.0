Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888B875A57
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 23:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1610E367;
	Thu,  7 Mar 2024 22:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxdUKHDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC22410E367
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709850981; x=1741386981;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=o+0H5vuiH0oRSMJ1IHCrSxVI4KRF4Ypwjqb7Qvd5Qis=;
 b=FxdUKHDeVM3bq0Tt+nVJZbhmGVHoEPZ54O2UWPKBCbHbwHhoEov70p0E
 HESI9Qve32JxSNd810T7+7I2boNoCKyUkKgLGZj5nixBMHyo9Xf6rShgL
 +UkeZvjIgsPw/gubFn8po7VFKoi+Iq4pD0L4iS+zvKprivagGWN/Cxhb8
 NgHd317BmAr6ImLmqvm2xpDkn5wn2cdJklEj7kfbmGx9GFBR3EDVZy4y4
 qhm5L2Ud57RnZ/66YUj0S9IHmP2Rs6B9laZPpxZY0Npfnm6HKiVitsAQz
 H1UPWI1utq7e8wZKgaJSNE8tXiHvQTomHH/wtzqRrLSBTYYjeYcE5+jkd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4480934"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4480934"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 14:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10362122"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 14:36:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
In-Reply-To: <CAJMQK-igm-OXa=L-Bb0hdm5+KL98sk9UAznvAR7SptP9iwWAoA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
 <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
 <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
 <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
 <87r0gmw544.fsf@intel.com>
 <CAJMQK-igm-OXa=L-Bb0hdm5+KL98sk9UAznvAR7SptP9iwWAoA@mail.gmail.com>
Date: Fri, 08 Mar 2024 00:36:11 +0200
Message-ID: <87plw5vfdw.fsf@intel.com>
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

On Thu, 07 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> On Thu, Mar 7, 2024 at 5:20=E2=80=AFAM Jani Nikula <jani.nikula@linux.int=
el.com> wrote:
>>
>> On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
>> > Hi,
>> >
>> > On Wed, Mar 6, 2024 at 4:20=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
>> >>
>> >> On Wed, Mar 6, 2024 at 3:30=E2=80=AFPM Doug Anderson <dianders@chromi=
um.org> wrote:
>> >> >
>> >> > Hi,
>> >> >
>> >> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromi=
um.org> wrote:
>> >> > >
>> >> > > +static void
>> >> > > +match_identity(const struct detailed_timing *timing, void *data)
>> >> > > +{
>> >> > > +       struct drm_edid_match_closure *closure =3D data;
>> >> > > +       unsigned int i;
>> >> > > +       const char *name =3D closure->ident->name;
>> >> > > +       unsigned int name_len =3D strlen(name);
>> >> > > +       const char *desc =3D timing->data.other_data.data.str.str;
>> >> > > +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_d=
ata.data.str.str);
>> >> > > +
>> >> > > +       if (name_len > desc_len ||
>> >> > > +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_N=
AME) ||
>> >> > > +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_S=
TRING)))
>> >> > > +               return;
>> >> > > +
>> >> > > +       if (strncmp(name, desc, name_len))
>> >> > > +               return;
>> >> > > +
>> >> > > +       /* Allow trailing white spaces and \0. */
>> >> > > +       for (i =3D name_len; i < desc_len; i++) {
>> >> > > +               if (desc[i] =3D=3D '\n')
>> >> > > +                       break;
>> >> > > +               if (!isspace(desc[i]) && !desc[i])
>> >> > > +                       return;
>> >> > > +       }
>> >> >
>> >> > If my code analysis is correct, I think you'll reject the case wher=
e:
>> >> >
>> >> > name =3D "foo"
>> >> > desc[13] =3D "foo \0zzzzzzzz"
>> >> >
>> >> > ...but you'll accept these cases:
>> >> >
>> >> > desc[13] =3D "foo \nzzzzzzzz"
>> >> > desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"
>> >> >
>> >> > It somehow seems weird to me that a '\n' terminates the string but =
not a '\0'.
>> >>
>> >> I'm also not sure about \0... based on
>> >> https://git.linuxtv.org/edid-decode.git/tree/parse-base-block.cpp#n49=
3,
>> >> they use \n as terminator. Maybe we should also reject \0 before\n?
>> >> Since it's not printable.
>> >
>> > Ah, OK. I guess the EDID spec simply doesn't allow for '\0' in there.
>> > I guess in that case I'd prefer simply removing the code to handle
>> > '\0' instead of treating it like space until we see some actual need
>> > for it. So just get rid of the "!desc[i]" case?
>>
>> The spec text, similar for both EDID_DETAIL_MONITOR_NAME and
>> EDID_DETAIL_MONITOR_STRING:
>>
>>         Up to 13 alphanumeric characters (using ASCII codes) may be used
>>         to define the model name of the display product. The data shall
>>         be sequenced such that the 1st byte (ASCII code) =3D the 1st
>>         character, the 2nd byte (ASCII code) =3D the 2nd character,
>>         etc. If there are less than 13 characters in the string, then
>>         terminate the display product name string with ASCII code =E2=80=
=980Ah=E2=80=99
>>         (line feed) and pad the unused bytes in the field with ASCII
>>         code =E2=80=9820h=E2=80=99 (space).
>>
>> In theory, only checking for '\n' for termination should be enough, and
>> this is what drm_edid_get_monitor_name() does. If there's a space
>> *before* that, it should be considered part of the name, and not
>> ignored. (So my suggestion in reply to the previous version is wrong.)
>>
>> However, since the match name uses NUL termination, maybe we should
>> ignore NULs *before* '\n'? Like so:
>>
>> for (i =3D name_len; i < desc_len; i++) {
>>         if (desc[i] =3D=3D '\n')
>>                 break;
>>         if (!desc[i])
>>                 return;
>> }
>>
> Allow trailing white spaces so we don't need to add the trailing white
> space in edp_panel_entry.

Just so it's clear here too: Agreed.

>
> https://lore.kernel.org/lkml/CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz51=
TJeSQrA@mail.gmail.com/
>
>>
>> BR,
>> Jani.
>>
>>
>> >
>> > -Doug
>>
>> --
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
