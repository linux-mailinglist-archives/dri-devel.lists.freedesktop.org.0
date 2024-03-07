Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B01874F73
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81640112164;
	Thu,  7 Mar 2024 12:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4rPsAlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDEC112164
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709815875; x=1741351875;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CU8nSLKdsapM+hvdUvqbh4xSxQUz7QJ22trHW5nNp+U=;
 b=e4rPsAlwEPZrt7c3k459hphtltUIFCz8nKv2ElsvisvCyn3zNpYSbVwL
 rTCCwgbxUybEQI9QPaGb65o040F48Eq0S5b2jXruFlqZ1m7jh6N4ppL3Z
 BoMgW/YLGkBBAkOpneRZ2rdYeIM4ZOgGTSfCfz02U4l8tnpHjgaANyWxg
 7HTOOItdDCV9dxgHRVQ779FDAJ+Og4KMj3KanAW6vl+3dxLncgcEWnQe9
 BA5bQ8sj/hjBtwPdDuhFeoRdcAQnDL8k2g0ZcdftU2t4X17y+hiRApVOS
 +H2xHHAbkL4fs1ikNKCaWyHmKz6Do7bDu9zsIXFk/8/OciVloxHsJQdYw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15126642"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="15126642"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 04:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10250327"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 04:51:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/edid: Clean up drm_edid_get_panel_id()
In-Reply-To: <CAD=FV=WvvLFN4U5-EewpXEcT-gz0qO+2SrYdEQpC-+s0DBeBUw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-3-hsinyi@chromium.org>
 <CAD=FV=WvvLFN4U5-EewpXEcT-gz0qO+2SrYdEQpC-+s0DBeBUw@mail.gmail.com>
Date: Thu, 07 Mar 2024 14:51:08 +0200
Message-ID: <87ttliw6gz.fsf@intel.com>
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
> On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
>>
>> drm_edid_get_panel_id() now just directly call edid_extract_panel_id().
>>
>> Merge them into one function.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
>> v4->v5: new
>> ---
>>  drivers/gpu/drm/drm_edid.c | 39 ++++++++++++++++++--------------------
>>  1 file changed, 18 insertions(+), 21 deletions(-)
>
> Personally I wouldn't have objected to this being squashed into patch
> #1, but I'm also OK as you have it.

Ditto.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

--=20
Jani Nikula, Intel
