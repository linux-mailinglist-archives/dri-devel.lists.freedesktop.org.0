Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162515FB44D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8DE10E802;
	Tue, 11 Oct 2022 14:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1810E802;
 Tue, 11 Oct 2022 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665497510; x=1697033510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=J2g4J0KCKmBCJAf+baG6YH8AVSSCVNcQSeIH/j6UtDg=;
 b=kVMJSVAl+R2qTZ8e61fHE02a09FzTL5aK2Sx+nYO3feiJSe9ZvYx5rDt
 VqSdSY0TtjR5gBc+Vnceq7PMw60ulWCwuc0RLPMTK8/tmQcxSR7CJ9Q8B
 JFQzo0RM9m7ogrBKg7mImGOJIaxVMKtqWeS99krvsfmOnb/VmqTlgz02K
 9QTJLat1vlTHIyADvj2x0wqas8ZLWWx5w0CDfC2MsT+HI2u+oAnISDRyd
 N+/9aW1YDKHqJLlE+TQOols7d2N0ZWi/XGASKh51Zj2NETXJzpfPbuHpQ
 3A7M1bWPJN5WmnaWaaWmk9usNsDqkk7+8Zf2/L4j1JWwzNO9jHrYCPRtP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="287776456"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="287776456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:11:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="621416039"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="621416039"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 07:11:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 03/15] drm/amd/display: stop using connector->override_edid
In-Reply-To: <7724d8cc-54b9-1ef9-fe34-42fcbd9b93bf@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1665496046.git.jani.nikula@intel.com>
 <8620697ae6a13bb9202db9edbc26ff30d9f4e2e8.1665496046.git.jani.nikula@intel.com>
 <7724d8cc-54b9-1ef9-fe34-42fcbd9b93bf@amd.com>
Date: Tue, 11 Oct 2022 17:11:44 +0300
Message-ID: <877d16xxen.fsf@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2022-10-11 09:49, Jani Nikula wrote:
>> The connector->override_edid flag is strictly for EDID override debugfs
>> management, and drivers have no business using it.
>>=20
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> I really have no idea what the functional impact here is. I can only
>> guess that the intention is to abuse ->override_edid to block EDID
>> property updates. In any case, this use needs to go.
>>=20
>> It also seems really curious we get here via connector .get_modes hook!
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers=
/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 4c73727e0b7d..d96877196a7f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6109,7 +6109,6 @@ static void create_eml_sink(struct amdgpu_dm_conne=
ctor *aconnector)
>>  				aconnector->base.name);
>>=20=20
>>  		aconnector->base.force =3D DRM_FORCE_OFF;
>> -		aconnector->base.override_edid =3D false;
>
> I'm not even sure the DRM_FORCE_OFF business is right.
>
> Either way, I don't think amdgpu should be messing with
> override_edid, so this is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Thanks for the swift review; is it okay to merge this via drm-misc-next
along with the rest (once they've been reviewed, of course)?

BR,
Jani.

>
> Harry
>
>>  		return;
>>  	}
>>=20=20
>> @@ -6144,8 +6143,6 @@ static void handle_edid_mgmt(struct amdgpu_dm_conn=
ector *aconnector)
>>  		link->verified_link_cap.link_rate =3D LINK_RATE_HIGH2;
>>  	}
>>=20=20
>> -
>> -	aconnector->base.override_edid =3D true;
>>  	create_eml_sink(aconnector);
>>  }
>>=20=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
