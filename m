Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF21873703
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9511315C;
	Wed,  6 Mar 2024 12:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUpcDCzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C069611315C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709729627; x=1741265627;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9V/0lspOmb9T32u1RMsAnMxMJ1V06Y8m+bgWinFW7ZQ=;
 b=IUpcDCzKnafxFdI/jWEWpKbiupRkxbNHAqLV1X/nt+BkZqkKAFOSgKbM
 zAANjLxUAdZ+Mq1TwNjscqZNSgoXfCzrWqylWrltBmUlsm4CJzWia68Zq
 cvEVbQy7eKSOGNeOl0dlet+NlZQ8+tUGubbRLurtK+8cpwiu5F0/ZCSMO
 3WQc5jU/onKixK1DcruIbaSYRneEreRpJqnEQF1x+VLB2PiyZzHWeWGug
 ZHoa5rXLXlgDD4v0skavbs2KtrKiTi50+WamS6jUfvKvh3XAAO52+W8Ln
 /NwNFMLa9ZyCO/CHzbhVRx0rnWValMqlKBL/FDfE0/McjA6712WkmOok8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4270464"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4270464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 04:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9678012"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 04:53:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/edid: Add a function to check monitor string
In-Reply-To: <CAJMQK-hE8sWL2rO-N2WZuyXzPhnXZJN4LUL_TwzKGhq_Ozz6Vw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304195214.14563-1-hsinyi@chromium.org>
 <20240304195214.14563-3-hsinyi@chromium.org> <87a5nd4tsg.fsf@intel.com>
 <CAJMQK-j4wGah=szyUW53hu-v6Q4QjgR7WMLKnspoFaO9oPfaQw@mail.gmail.com>
 <874jdl4k01.fsf@intel.com>
 <CAJMQK-iWHoh6s-hkcNULzZLjMg9UnTuWfjaJ=YfnHU3sQ1NBEg@mail.gmail.com>
 <CAD=FV=UOhTGnhtc9gOQ5C_aAdgVcB+K7NL9RGm4umunF91Wkpg@mail.gmail.com>
 <87y1ax2iu1.fsf@intel.com>
 <CAD=FV=WzLLeEw-b0Kug-Pm-9EYm7eHvmukEUJ8VHnu-4YY3WNQ@mail.gmail.com>
 <CAJMQK-hE8sWL2rO-N2WZuyXzPhnXZJN4LUL_TwzKGhq_Ozz6Vw@mail.gmail.com>
Date: Wed, 06 Mar 2024 14:53:40 +0200
Message-ID: <875xxzzfl7.fsf@intel.com>
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

On Tue, 05 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> On Tue, Mar 5, 2024 at 11:25=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
>> Hmm. As Hsin-Yi pointed out to me offline. Somehow we'll need to get
>> the actual panel ID out. Right now in panel-edp.c we have:
>>
>> dev_warn(dev,
>>   "Unknown panel %s %#06x, using conservative timings\n",
>>   vend, product_id);
>>
>> Where "vend" and "product_id" come from the panel ID of a panel that
>> we didn't recognize. For instance:
>>
>>   Unknown panel BOE 0x0731, using conservative timings
>>
>> We need to still be able to print this message for unrecognized
>> panels. Then when we see field reports including this message we know
>> that somehow we ended up shipping an unrecognized panel.
>>
>> Any suggestions on what abstraction you'd like to see to enable us to
>> print that message if everything is opaque?
>
> Sent v4 here: https://lore.kernel.org/lkml/20240306004347.974304-1-hsinyi=
@chromium.org/
>
> Besides that it still keeps drm_edid_get_panel_id() to be used on the
> kernel warning when no panel is matched, other parts I think are
> following the comments.

Yeah we can keep that for now.

BR,
Jani.


--=20
Jani Nikula, Intel
