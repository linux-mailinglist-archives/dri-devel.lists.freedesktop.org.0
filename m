Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF76600BC1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 11:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265C10E06E;
	Mon, 17 Oct 2022 09:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5179410E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666000707; x=1697536707;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zxbYmgJ1tFJXZUq2wDDYpxgs+/4K8DC3Ye2JTdPk2dI=;
 b=M9AzgdokEvj0J9GSDgW/QUb9+r8XcakrqC6BuIpk5rHNOO4pMXVlVcUU
 bMjALR1bhVKr2PluamYm2bWnArSDjUH8Pp3pYvk+RCdlmE4YNg1wz9RoT
 soL9aE7n98kOsArJTNYfGuIRrfG3F1y9AMmta/RIJg+L+x/ZXM2tiFJrH
 Y+5Lf2gso0w561M6RdpshOn2lOB+TX+hZ2+xBZGfqd504SiTBLolm1dii
 u1PJC80i84NBx/nx4YdT3rOQYDTlYA3og/jmX4q3SNFsZarlY34b8Lqe5
 SXHR7tLXcfYOFU+qYNq5ZldoEy35cwB6EZrYAGp85fi3DIE3N+aPoXR1O Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286146963"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286146963"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:58:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="630627154"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="630627154"
Received: from cgarnier-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:58:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Inki Dae <inki.dae@samsung.com>, hongao <hongao@uniontech.com>,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: Re: [PATCH] drm/exynos: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <4e8d94c9-7dc0-039f-7d67-36f6c099ab75@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20220616072357epcas1p4921f90a2fe077e360688e0df00a5dde8@epcas1p4.samsung.com>
 <20220616072233.8302-1-hongao@uniontech.com>
 <4e8d94c9-7dc0-039f-7d67-36f6c099ab75@samsung.com>
Date: Mon, 17 Oct 2022 12:59:03 +0300
Message-ID: <871qr6srdk.fsf@intel.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022, Inki Dae <inki.dae@samsung.com> wrote:
> 22. 6. 16. 16:22=EC=97=90 hongao =EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>> Once EDID is parsed, the monitor HDMI support information is available
>> through drm_display_info.is_hdmi.
>>=20
>> This driver calls drm_detect_hdmi_monitor() to receive the same
>> information, which is less efficient.
>>=20
>> Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
>> instead.
>>=20
>
> Applied.

Sorry, but this is broken. The commit message contains the clue: "Once
EDID is parsed". drm_get_edid() does not parse the EDID, you need to
call drm_connector_update_edid_property() first.

This is what I posted some time ago [1] but apparently was working on a
different baseline.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/f21588dcb93bdb6cf76724506=
063bdfcdb0a6bb4.1662036058.git.jani.nikula@intel.com


>
> Thanks,
> Inki Dae
>
>> Signed-off-by: hongao <hongao@uniontech.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index 7655142a4651..17e9f5efbcfc 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -893,7 +893,7 @@ static int hdmi_get_modes(struct drm_connector *conn=
ector)
>>  	if (!edid)
>>  		return -ENODEV;
>>=20=20
>> -	hdata->dvi_mode =3D !drm_detect_hdmi_monitor(edid);
>> +	hdata->dvi_mode =3D !connector->display_info.is_hdmi;
>>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>>  			  edid->width_cm, edid->height_cm);

--=20
Jani Nikula, Intel Open Source Graphics Center
