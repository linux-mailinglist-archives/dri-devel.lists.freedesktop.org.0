Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA777870BB6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 21:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9110E287;
	Mon,  4 Mar 2024 20:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isixOAQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08410E287
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709585062; x=1741121062;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+LDt+7BROXBNv2O1HJAcO8FeyqvfobiscAmbl8mDiQk=;
 b=isixOAQdCUb0vHHFbrVUQxDN6Dq/AExS5y6Q9RnDRlJodjOJpjsrNR6V
 0YEzZXbGM6dAC68lfjMt78Q4xgCpDHxvsf8UmL5/UweCTnDnBoI5iLUAQ
 XbDZ1WCDexmvtRzLBXLZKb8+xib2BM4QktJXCA6dA0QSbMDkhlCmSBSea
 sKnN+O2CgXBK59OB2d4vnxzHuTHcJ24Sp/3t+uFQNz4Iz+/XXlR94qre3
 z1b8rXH7aDe+pzgSYHrTG3Lie0l1qYNi3UoO3HickpdZDRSjNIXgG8UP4
 1FJv4Mhr4pLeFIMLPkRL0674C5GdNU7OYznwe7sbb2Vqwx552zxzJ/PkM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4027931"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4027931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="40118905"
Received: from syakovle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:44:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
In-Reply-To: <CAJMQK-gKF+ZeAe4Hp8di83Zx8gp-BJ0vuj6uzi0hsaxeju8GyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org> <87wmqqjmt9.fsf@intel.com>
 <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
 <CAD=FV=WU-2yystd40e+g9VNDNTiv5c=nP0uQg-AR03o7UGMTdA@mail.gmail.com>
 <87bk7z6x1w.fsf@intel.com>
 <CAD=FV=Wzm9Y7m9Q6KqO7yWdnc1xToaRMb2f1s2TQMJqpqVYLOg@mail.gmail.com>
 <CAA8EJpqHJTbc+TCpkccjx_eQH36zaNgcQ9QssecNeQUQgfYApQ@mail.gmail.com>
 <CAD=FV=XyV=V-USfq8kp058=FzRQq=bPA5A4GDb1p0zO-KPbtwQ@mail.gmail.com>
 <CAJMQK-gKF+ZeAe4Hp8di83Zx8gp-BJ0vuj6uzi0hsaxeju8GyQ@mail.gmail.com>
Date: Mon, 04 Mar 2024 22:44:04 +0200
Message-ID: <877cih4tij.fsf@intel.com>
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
> On Mon, Mar 4, 2024 at 8:17=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>>
>> Hi,
>>
>> On Sun, Mar 3, 2024 at 1:30=E2=80=AFPM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>> >
>> > > The problem is that Dmitry didn't like the idea of using a hash and =
in
>> > > v2 Hsin-Yi has moved to using the name of the display. ...except of
>> > > course that eDP panels don't always properly specify
>> > > "EDID_DETAIL_MONITOR_NAME". See the discussion [1]. If you want to s=
ee
>> > > some of the EDIDs involved, you can see Hsin-Yi's post [2]. The pane=
ls
>> > > included stuff like this:
>> > >
>> > >     Alphanumeric Data String: 'AUO'
>> > >     Alphanumeric Data String: 'B116XAN04.0 '
>> > >
>> > > The fact that there is more than one string in there makes it hard to
>> > > just "return" the display name in a generic way. The way Hsin-Yi's
>> > > code was doing it was that it would consider it a match if the panel
>> > > name was in any of the strings...
>> > >
>> > > How about this as a solution: we change drm_edid_get_panel_id() to
>> > > return an opaque type (struct drm_edid_panel_id_blob) that's really
>> > > just the first block of the EDID but we can all pretend that it isn'=
t.
>> > > Then we can add a function in drm_edid.c that takes this opaque blob,
>> > > a 32-bit integer (as per drm_edid_encode_panel_id()), and a string
>> > > name and it can tell us if the blob matches?
>> >
>> > Would it be easier to push drm_edid_match to drm_edid.c? It looks way
>> > more simpler than the opaque blob.
>>
>> Yeah, that sounds reasonable / cleaner to me. Good idea! Maybe Hsin-Yi
>> will be able to try this out and see if there's a reason it wouldn't
>> work.
>
> Thanks for all the suggestions. I sent out v3, which still has a blob
> type since we need
> 1. get panel id
> 2. do the string matching.
>
> And I felt that packing these 2 steps into one function may make that
> function do multiple tasks?
>
> But let me know if it's preferred in this way.
>
> v3: https://lore.kernel.org/lkml/20240304195214.14563-1-hsinyi@chromium.o=
rg/

I still don't like it, but incorporating all the ideas here, and in the
previous patches, I think I have a suggestion that covers all cases in a
reasonable manner [1].

Sorry about being so inflexible about this. I've just put 140+ commits
worth of effort in drm_edid.c in the past couple of years, and I'm keen
on keeping it nice and tidy. :)


BR,
Jani.


[1] https://lore.kernel.org/r/87a5nd4tsg.fsf@intel.com


>
>>
>> -Doug

--=20
Jani Nikula, Intel
