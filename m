Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBF8717FF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7C7112925;
	Tue,  5 Mar 2024 08:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+ECqh+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD85A112924
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709626671; x=1741162671;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dTiwFwokUkSifaC2lQmY8eSH1jMSEYMz7QMmSWuxxb8=;
 b=a+ECqh+tAOwTAF8Oxvlick0RxYuarwRbfQ2hylSCN8ALabBqMMQy2XRC
 CHdafbZ+22g42WY71Unf9VwDbtJzSVWziN8KkKjWatXj3yXTF9YdkRPaj
 nOICnneUSa/no/yvNUhx0KKE+XMmS+HXsW9oq08prh8GPqnKIpEZFtaJM
 AEM98PYQSZIgBYph5y1LpQ+vJx2Tz1fbMK1GCq48Wy5bOXOxKnrJC5Y6D
 lO0s84ZmNN/yTlhxpw3GHmtE8LTdDw9mg24DCXfNAgYB2v2O0cTmpKUnH
 NQuo3O26QgMpiVvRCSFwjW/FL/2Iofkzzy1uQCl3jS5FN1/AeTkKuQxB2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4020958"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4020958"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 00:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="13879915"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 00:17:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
In-Reply-To: <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org> <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
 <874jdl4k01.fsf@intel.com>
 <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
 <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
Date: Tue, 05 Mar 2024 10:17:42 +0200
Message-ID: <87y1ax2iu1.fsf@intel.com>
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

On Mon, 04 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Mon, Mar 4, 2024 at 4:19=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
>>
>> > > Probably change to u32 drm_edid_get_panel_id(const struct drm_edid
>> > > *);? Given that we still need to parse id from
>> > > drm_edid_read_base_block().
>> >
>> > No, we no longer need to parse the id outside of drm_edid.c. You'll ha=
ve
>> > the id's in panel code in the form of struct drm_edid_ident (or
>> > whatever), and use the match function to see if the opaque drm_edid
>> > matches.
>> >
>> drm_panel prints the panel_id info on whether the panel is detected or n=
ot.
>> https://elixir.bootlin.com/linux/v6.8-rc7/source/drivers/gpu/drm/panel/p=
anel-edp.c#L792
>>
>> Is it okay to remove this information?
>
> Hmmm, I guess it also is exported via debugfs, actually. See
> detected_panel_show() in panel-edp.c. We probably don't want to remove
> that...

You currently print the information via panel->detected_panel, which is
a struct edp_panel_entry *. That doesn't change. It'll be slightly
restructured to contain a struct drm_edid_ident, which will not be an
opaque type.

BR,
Jani.


--=20
Jani Nikula, Intel
