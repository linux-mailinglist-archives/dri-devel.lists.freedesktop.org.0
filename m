Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5785FAD54
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 09:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE2210E7C8;
	Tue, 11 Oct 2022 07:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA510E7C5;
 Tue, 11 Oct 2022 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665472823; x=1697008823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SWyygabijBYM8Iz4fQ8EX/wCoEDK8XDQK1VEUWJ79Iw=;
 b=R+MqcZ2nM+uMe2GR3pxkxf3hNsIGJjba/3fcuMhjAx0ybidlshK6WFV4
 +P+aZEzEML72GARua41OZ9b9Qsghd1zEQUJTEpTyJxFFJX1tCtgLj4IyX
 KPkaCz6nAVQBQx56I+utB8NaqqKYwQS7+tarcG2MhtHNbcEhowa+fnCGR
 mZNF7/hWIUb9BTsXz/f9qIMk+K59SqIeWf2cSb3WAIwwzsp2joU61n3T8
 iH2pffdIednAS227EzZXIIxzRWuGwdjDuHHptpWLQi4LspsDq5t62uW45
 S+zRBa5SvjeqGXcq3zw0t5Qpgh1Ridm/dUuCkqpaoYteAihEYjiDz5A1V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="303170433"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="303170433"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 00:20:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="659439177"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="659439177"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 00:20:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matthieu CHARETTE <matthieu.charette@gmail.com>
Subject: Re: [PATCH] drm/edid/firmware: stop using throwaway platform device
In-Reply-To: <GLSKJR.CU4DWLJQSTHT2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221006222146.2375217-1-jani.nikula@intel.com>
 <GLSKJR.CU4DWLJQSTHT2@gmail.com>
Date: Tue, 11 Oct 2022 10:20:18 +0300
Message-ID: <87wn96yggd.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, Matthieu CHARETTE <matthieu.charette@gmail.com> wrote:
> It should fix the issue. Meanwhile, the system will still crash if a=20
> new monitor is plugged while the machine is suspended. We might need to=20
> precache the EDID to prevent that.

Please elaborate.

BR,
Jani.


>
> Matthieu
>
> On Fri, Oct 7 2022 at 01:21:46 AM +0300, Jani Nikula=20
> <jani.nikula@intel.com> wrote:
>> We've used a temporary platform device for firmware EDID loading since
>> it was introduced in commit da0df92b5731 ("drm: allow loading an EDID=20
>> as
>> firmware to override broken monitor"), but there's no explanation why.
>>=20
>> Do we need to?
>>=20
>> Maybe this fixes the suspend/resume issue?
>>=20
>> (Yes, I'll rewrite the commit message if this is the way to go ;)
>>=20
>> References:=20
>> https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmail=
.com
>> Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid_load.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid_load.c=20
>> b/drivers/gpu/drm/drm_edid_load.c
>> index 37d8ba3ddb46..fbae12130234 100644
>> --- a/drivers/gpu/drm/drm_edid_load.c
>> +++ b/drivers/gpu/drm/drm_edid_load.c
>> @@ -182,18 +182,9 @@ static void *edid_load(struct drm_connector=20
>> *connector, const char *name,
>>  		fwdata =3D generic_edid[builtin];
>>  		fwsize =3D sizeof(generic_edid[builtin]);
>>  	} else {
>> -		struct platform_device *pdev;
>>  		int err;
>>=20
>> -		pdev =3D platform_device_register_simple(connector_name, -1, NULL,=20
>> 0);
>> -		if (IS_ERR(pdev)) {
>> -			DRM_ERROR("Failed to register EDID firmware platform device "
>> -				  "for connector \"%s\"\n", connector_name);
>> -			return ERR_CAST(pdev);
>> -		}
>> -
>> -		err =3D request_firmware(&fw, name, &pdev->dev);
>> -		platform_device_unregister(pdev);
>> +		err =3D request_firmware(&fw, name, connector->dev->dev);
>>  		if (err) {
>>  			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=3D%d)\n",
>>  				  name, err);
>> --
>> 2.34.1
>>=20
>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
