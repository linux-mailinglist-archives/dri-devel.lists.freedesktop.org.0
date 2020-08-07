Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DE23EF09
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE46E9F2;
	Fri,  7 Aug 2020 14:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C096E9F2;
 Fri,  7 Aug 2020 14:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIsV5FNmkTlrMHbeQR0piFXjP2A4sbwtDx+bZIDkYa/HhbWSI8Vsmmgit8BFsqExlrKKJlwtxwFlInP0f8gDV5QINev0+UqwYerrBJLdPOF9WfVq1+45uSncOpxeH1F8T+PNUSv/BMcYSPq0unudxuA7Qc374SyjNAEVbm8R/LuVxrLzpm6qSgjOOij/3HTIRafadbTYxE6sBm4KugqFF1LtTuA87sCLIZgoidOhSgJAykehSkmjouYGYlapVPcfX0AukXQrsy6wn3GBSg7lLT6HnNRkulU7dLjyksG6TKkeDun/8UxutbN6RcCaAaBlCem0BSwNO29HGgZ6ggiJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd2Agx9tPbxwwRF5zlUw8nVlWeNIcHcjqUkDLO0WEjE=;
 b=ctshGaMZ5E5BMA0pe194/alufGnGO83DMwoAdFpjsWPMvpuC2gp1MVpaT5eonFLhZhHmc4Tm9caDr1bezm2xzsngbmFFEaqmd3445c0pLAQbDWxNpKdu0LW+fNvd+ELAf3RBvEA1TZqJhVaAm6xhZ/TU2h1WYn4V0f9jwtlwHCwykZPguDk3w+zRtdT3Htr9nssoh85kQv4LaZQ4pImas3Y9Eb3Nmd+1aU/bbYHHVLdJUK3C3tJyVK9l2pEXlNyVb00VWkobrRKMoDzxWzx7vbxRijdd33HVPVtchS8SBOdlwEZjirlxQnRdYebE+W7EKBYz4CL2ezZeLjhGF9G+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd2Agx9tPbxwwRF5zlUw8nVlWeNIcHcjqUkDLO0WEjE=;
 b=k/QLGSbDke8KRRX14RogquHayadzUV5L3dCzExOhc29sDuK1FbjKMVHdqabpEhdBkAv7LhfhsVBKNeWHk4GuBxM7v1NZrL1S+XUhaV4hJBZUkFUK7FmirhP/YHf2WhaWsCu4YlgiNDPTVja9sKXupN+RP07TfK0zL4zsVxVLqrs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB3285.namprd12.prod.outlook.com (2603:10b6:a03:134::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 14:29:15 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::7d42:c932:e35f:71b1%7]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 14:29:15 +0000
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated tiling_flags
 and tmz_surface in prepare_planes
To: daniel@ffwll.ch
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
Date: Fri, 7 Aug 2020 10:29:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200807083041.GL6419@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 14:29:14 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ed9ed57-995d-4191-8528-08d83ade42c1
X-MS-TrafficTypeDiagnostic: BYAPR12MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB328559A7604371DD9CA21347EC490@BYAPR12MB3285.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BF+0P4c2M09fFX7192Nwi45JLcyL+u7jnkYgudB4IONoBsZbjDETqL/vjqYYzmKbC7S+o6v/zy7c8TGk6AB617XCxJI7vqbP68MkmZFyP1cb+r7Ni40/Sz9/wyvxM8xbn6ONYxp67hGjVFnuN7hN64rpsMt5qhhJAD7OkojVdQIcgVB2uHGRuCvLki5D8fTeS9ucqQ5GDo2L9ofQssDCjpZhY/DFUKARQK3HZgTwHOXNPagaqkcN66HouWR8maYsuFM1JUowqOhd11dxXAAp0N44SsW1zp0q42153V7n0/hLXRPYTk1fkhhlovIYys0eo33oYUE34xlPIV7hcehMVXt8tVau7kf1FoSRGzXxfYd/owEENbj2G11X0+ezAwIDEYeuzQASKBj5mKfIwpv5M0jRkG/iikr0WcNFUZ8oRtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(16576012)(8936002)(316002)(2906002)(66476007)(6666004)(5660300002)(66556008)(36756003)(66946007)(16526019)(186003)(52116002)(966005)(2616005)(54906003)(31696002)(6486002)(53546011)(26005)(83380400001)(86362001)(6916009)(478600001)(4326008)(8676002)(31686004)(956004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yvlL9fnbZIzhw4aWTiEcmZkoT5h4xf8cXQL3mlQB2l1xuDVm/IyQAcn5Wgtw9loKRbwAYskXnasfxlRbW02CvEI0LBl1Rf2BQ5jYQb2hJ9WGsob9KCD4RbF3i+DkHpwU+KtzHK8HzviT70jsIj8Y8bBw/2/D5mE+2wK2RO5PrRdGWxi/uz74KjfplcwXk5bnez/mHM1G8Vf9X/j64fxgJThYO/SPmenp+Z2mlSoKb8vBMY74mZP9uK6NBFowefXyFM8rdzzdO0A6aAV+du3RRF29CrOcDQY7kC4e50O+GhUAmtA+rexM4uIkHk+Ghjxx64JNF/TRiQYOQMEjWvDTk8xFSItHtyUXQmYw8gRaKfk3jwKUQq8Q46UY3uQEt1F1IppHqREziGJdXLlI6UJyuUnJvyMHfdW788q6lRvOmRfbpyfmq6coTN2oWJHsii2Z7UYQqbolsJ0rwt7ATlJTcYnPtZ3EH41q4VDHDEHNVY7xFbeIM4zjcmpahzZt+7Pe2Dl2Uba+gW6TXTI6K8ANtYgA77e3nI9oZIeedeySmiiWR5wj9ms4sstu1/weCQVwpsR9cLBXigDsnv95XbiWmEocXFW59oQ3jaNYYsBzgfQLoBzu+siPrCqiTELaXKX1zB4h03/A2uk3D3yar0ubUw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed9ed57-995d-4191-8528-08d83ade42c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 14:29:15.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqCE3EWnO9GlSnbb5mhQjcDhRxsFCNsSz0C+ytQmeEY6+wymnw/IHxcVbgBvClf4JIP/I5bxc0LNpFeZokDGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3285
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-07 4:30 a.m., daniel@ffwll.ch wrote:
> On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
>> [Why]
>> We're racing with userspace as the flags could potentially change
>> from when we acquired and validated them in commit_check.
> 
> Uh ... I didn't know these could change. I think my comments on Bas'
> series are even more relevant now. I think long term would be best to bake
> these flags in at addfb time when modifiers aren't set. And otherwise
> always use the modifiers flag, and completely ignore the legacy flags
> here.
> -Daniel
> 

There's a set tiling/mod flags IOCTL that can be called after addfb 
happens, so unless there's some sort of driver magic preventing this 
from working when it's already been pinned for scanout then I don't see 
anything stopping this from happening.

I still need to review the modifiers series in a little more detail but 
that looks like a good approach to fixing these kind of issues.

Regards,
Nicholas Kazlauskas

>>
>> [How]
>> We unfortunately can't drop this function in its entirety from
>> prepare_planes since we don't know the afb->address at commit_check
>> time yet.
>>
>> So instead of querying new tiling_flags and tmz_surface use the ones
>> from the plane_state directly.
>>
>> While we're at it, also update the force_disable_dcc option based
>> on the state from atomic check.
>>
>> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
>>   1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index bf1881bd492c..f78c09c9585e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>   	struct list_head list;
>>   	struct ttm_validate_buffer tv;
>>   	struct ww_acquire_ctx ticket;
>> -	uint64_t tiling_flags;
>>   	uint32_t domain;
>>   	int r;
>> -	bool tmz_surface = false;
>> -	bool force_disable_dcc = false;
>> -
>> -	dm_plane_state_old = to_dm_plane_state(plane->state);
>> -	dm_plane_state_new = to_dm_plane_state(new_state);
>>   
>>   	if (!new_state->fb) {
>>   		DRM_DEBUG_DRIVER("No FB bound\n");
>> @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>   		return r;
>>   	}
>>   
>> -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
>> -
>> -	tmz_surface = amdgpu_bo_encrypted(rbo);
>> -
>>   	ttm_eu_backoff_reservation(&ticket, &list);
>>   
>>   	afb->address = amdgpu_bo_gpu_offset(rbo);
>>   
>>   	amdgpu_bo_ref(rbo);
>>   
>> +	/**
>> +	 * We don't do surface updates on planes that have been newly created,
>> +	 * but we also don't have the afb->address during atomic check.
>> +	 *
>> +	 * Fill in buffer attributes depending on the address here, but only on
>> +	 * newly created planes since they're not being used by DC yet and this
>> +	 * won't modify global state.
>> +	 */
>> +	dm_plane_state_old = to_dm_plane_state(plane->state);
>> +	dm_plane_state_new = to_dm_plane_state(new_state);
>> +
>>   	if (dm_plane_state_new->dc_state &&
>> -			dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
>> -		struct dc_plane_state *plane_state = dm_plane_state_new->dc_state;
>> +	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
>> +		struct dc_plane_state *plane_state =
>> +			dm_plane_state_new->dc_state;
>> +		bool force_disable_dcc = !plane_state->dcc.enable;
>>   
>> -		force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
>>   		fill_plane_buffer_attributes(
>>   			adev, afb, plane_state->format, plane_state->rotation,
>> -			tiling_flags, &plane_state->tiling_info,
>> -			&plane_state->plane_size, &plane_state->dcc,
>> -			&plane_state->address, tmz_surface,
>> -			force_disable_dcc);
>> +			dm_plane_state_new->tiling_flags,
>> +			&plane_state->tiling_info, &plane_state->plane_size,
>> +			&plane_state->dcc, &plane_state->address,
>> +			dm_plane_state_new->tmz_surface, force_disable_dcc);
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
