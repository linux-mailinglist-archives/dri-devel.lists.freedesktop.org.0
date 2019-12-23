Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E0129A47
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 20:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A889DC0;
	Mon, 23 Dec 2019 19:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80ED89D89;
 Mon, 23 Dec 2019 19:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMdYCkGqg7Qyb2Ue9ggT3SOdgz9B1xao4D1E7j8VOrhIQkmCAdC8cz6XytUkb6toc80GtsNL0aUnNNA5jwpCFFT+aForc+B0K9WOdirinv491DVcear3aBFatW10k+Lu5KjAly6nEb6fiEMGXk6hmnRW8J1qFbS3U9jvDTjUckQJrAyuwscCKnUqVBTkpUmWzrWOsnK7RbezEM47BMKCAsFaeTRzVKtJ3pU/24fKXNNV0d8JlqkRtYtQI4WWDqEgdK5XMaBNdMOjOgZUAeO/wpskimdKj4fl4t3sVb6VpvUW/Ri0eAttwHN1FGnYoIij9Ofr49Mj6wg9M7DQeFEyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78wSWJOyTjhqBil8uCASs2YkVo3bvuC17FY/JCTV60o=;
 b=bCr260ykMgn6S1VipD0DAlzpSo1eVMqUHe97/IgvqoQczTu81fP78hlultTFJsFPyaF7vEICdezIBK4ZDQI8zTke+BDhq/RkGt4pPI4YsmxZEn2E1WcV6d8H0g7IuCKr0Lpf4sS9syvUxSpEMXTPLYEOlsyL6O1B07MIxMJy94DOVlCrQ92tQqdj2G+u+Ue6VAL6EF515ck+SMt+moJhZpR8C1M2ImNBonYmQgHQ/I3F140ona9Q3oxaPIWtMn6MKDWihNDonPiUNzXU992P9LNwgdQDqG5sUzmYFFxgpVbXbfNYC7DVDh0IED03Ct61l8phbpHYWDztjna63+Hxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78wSWJOyTjhqBil8uCASs2YkVo3bvuC17FY/JCTV60o=;
 b=coNVNyFoBiSqN6B6MBEQG+twdOLWcuyNaAaMS4JwXVIb6vk5yXYfCKTDq/09djlP13aQNmKPDDVqmLdviwXy+Y7nhCIP2AVOpruoU0oYKUlY5cpRP7B6aA1PhwXkkuG62SzrKq3AWP8sjqHc4DMqAMNlsfsbdP+JdEc9jcVnqGI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from BYAPR12MB3013.namprd12.prod.outlook.com (20.178.55.219) by
 BYAPR12MB3432.namprd12.prod.outlook.com (20.178.196.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Mon, 23 Dec 2019 19:05:24 +0000
Received: from BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5]) by BYAPR12MB3013.namprd12.prod.outlook.com
 ([fe80::ed87:95bf:7c40:3fa5%7]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 19:05:24 +0000
Subject: Re: [PATCH v9 16/18] drm/amd/display: Recalculate VCPI slots for new
 DSC connectors
To: Lyude Paul <lyude@redhat.com>, mikita.lipski@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-17-mikita.lipski@amd.com>
 <08a2b34d55043c9be603d739211c39702a760e97.camel@redhat.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <187ff1b5-06f0-139d-c54a-ccd52aa614a2@amd.com>
Date: Mon, 23 Dec 2019 14:05:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <08a2b34d55043c9be603d739211c39702a760e97.camel@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::16) To BYAPR12MB3013.namprd12.prod.outlook.com
 (2603:10b6:a03:a9::27)
MIME-Version: 1.0
Received: from [172.29.224.72] (165.204.55.250) by
 YTXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 23 Dec 2019 19:05:23 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 360cbdc1-de5d-41b8-96f5-08d787db106e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3432:|BYAPR12MB3432:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3432338ADA7E0D475B06A8D5E42E0@BYAPR12MB3432.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(316002)(52116002)(36756003)(26005)(16526019)(8676002)(16576012)(4001150100001)(2616005)(186003)(5660300002)(36916002)(478600001)(2906002)(81156014)(66946007)(31696002)(66476007)(81166006)(66556008)(53546011)(31686004)(8936002)(6486002)(956004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3432;
 H:BYAPR12MB3013.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2ykvpGxLgqwlVqN8HgxULOfx1Um6a+SSxAZM83LqiLb9M5X4kONjncYzkrSbXTOklJbXK58cZBjrFsw0dTYxBFcjnMLSasyPJxJT2xxpbVeQG/8t7GgLm2axIxJ1IBlJ9WvvRKBOF2gl90h9xjxdYCmRDc91CNG2f3qANLqfZFUQ/u554y9uAdfKDgFPbN3pa7wMiFpVc4p2LNvFV/oEWqGZ6m51zyNuTUa3d6bkYiUJozB787KRGwKeWsLueTKiLT/zjWhEh99D90/IUMkZVgT/N6laj+Qce7Dj8aYpWRgCZ0fowoeAhkV2QDLSM4PBJfReml5EKQVEqhlua8H9UhqV3En124XR387UHyfwbKYLZdNGcB7ECOIAqrNuDKq0qw2BnYrOaIIz8SG+JZqE3ZxWapbDTWhZs5quJVsKiVDS5klM2EVM22mZYMiQMtK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360cbdc1-de5d-41b8-96f5-08d787db106e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2019 19:05:24.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KBJOA4qejt/eqXB8k2wzPg8mxDiDFA43r6a6d9vnZ0qX578ntYW7hyHXTEW1M+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3432
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/20/19 4:41 PM, Lyude Paul wrote:
> So I reviewed this already but realized I made a very silly mistake, comments
> down below:
> 
> On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
>> From: Mikita Lipski <mikita.lipski@amd.com>
>>
>> [why]
>> Since for DSC MST connector's PBN is claculated differently
>> due to compression, we have to recalculate both PBN and
>> VCPI slots for that connector.
>>
>> [how]
>> The function iterates through all the active streams to
>> find, which have DSC enabled, then recalculates PBN for
>> it and calls drm_dp_helper_update_vcpi_slots_for_dsc to
>> update connector's VCPI slots.
>>
>> v2: - use drm_dp_mst_atomic_enable_dsc per port to
>> enable/disable DSC
>>
>> v3: - Iterate through connector states from the state passed
>>      - On each connector state get stream from dc_state,
>> instead CRTC state
>>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++--
>>   1 file changed, 71 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 93a230d956ee..2ac3a2f0b452 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -4986,6 +4986,69 @@ const struct drm_encoder_helper_funcs
>> amdgpu_dm_encoder_helper_funcs = {
>>   	.atomic_check = dm_encoder_helper_atomic_check
>>   };
>>   
>> +static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
>> +					    struct dc_state *dc_state)
>> +{
>> +	struct dc_stream_state *stream = NULL;
>> +	struct drm_connector *connector;
>> +	struct drm_connector_state *new_con_state, *old_con_state;
>> +	struct amdgpu_dm_connector *aconnector;
>> +	struct dm_connector_state *dm_conn_state;
>> +	int i, j, clock, bpp;
>> +	int vcpi, pbn_div, pbn = 0;
>> +
>> +	for_each_oldnew_connector_in_state(state, connector, old_con_state,
>> new_con_state, i) {
>> +
>> +		aconnector = to_amdgpu_dm_connector(connector);
>> +
>> +		if (!aconnector->port)
>> +			continue;
>> +
>> +		if (!new_con_state || !new_con_state->crtc)
>> +			continue;
>> +
>> +		dm_conn_state = to_dm_connector_state(new_con_state);
>> +
>> +		for (j = 0; j < dc_state->stream_count; j++) {
>> +			stream = dc_state->streams[j];
>> +			if (!stream)
>> +				continue;
>> +
>> +			if ((struct amdgpu_dm_connector*)stream-
>>> dm_stream_context == aconnector)
>> +				break;
>> +
>> +			stream = NULL;
>> +		}
>> +
>> +		if (!stream)
>> +			continue;
>> +
>> +		if (stream->timing.flags.DSC != 1) {
>> +			drm_dp_mst_atomic_enable_dsc(state,
>> +						     aconnector->port,
>> +						     dm_conn_state->pbn,
>> +						     0,
>> +						     false);
>> +			continue;
>> +		}
>> +
>> +		pbn_div = dm_mst_get_pbn_divider(stream->link);
>> +		bpp = stream->timing.dsc_cfg.bits_per_pixel;
>> +		clock = stream->timing.pix_clk_100hz / 10;
>> +		pbn = drm_dp_calc_pbn_mode(clock, bpp, true);
>> +		vcpi = drm_dp_mst_atomic_enable_dsc(state,
>> +						    aconnector->port,
>> +						    pbn, pbn_div,
>> +						    true);
>> +		if (vcpi < 0)
>> +			return vcpi;
>> +
>> +		dm_conn_state->pbn = pbn;
>> +		dm_conn_state->vcpi_slots = vcpi;
>> +	}
>> +	return 0;
>> +}
>> +
>>   static void dm_drm_plane_reset(struct drm_plane *plane)
>>   {
>>   	struct dm_plane_state *amdgpu_state = NULL;
>> @@ -8022,11 +8085,6 @@ static int amdgpu_dm_atomic_check(struct drm_device
>> *dev,
>>   	if (ret)
>>   		goto fail;
>>   
>> -	/* Perform validation of MST topology in the state*/
>> -	ret = drm_dp_mst_atomic_check(state);
>> -	if (ret)
>> -		goto fail;
>> -
>>   	if (state->legacy_cursor_update) {
>>   		/*
>>   		 * This is a fast cursor update coming from the plane update
>> @@ -8098,6 +8156,10 @@ static int amdgpu_dm_atomic_check(struct drm_device
>> *dev,
>>   		if (!compute_mst_dsc_configs_for_state(state, dm_state-
>>> context))
>>   			goto fail;
>>   
>> +		ret = dm_update_mst_vcpi_slots_for_dsc(state, dm_state-
>>> context);
>> +		if (ret)
>> +			goto fail;
>> +
>>   		if (dc_validate_global_state(dc, dm_state->context, false) !=
>> DC_OK) {
>>   			ret = -EINVAL;
>>   			goto fail;
>> @@ -8126,6 +8188,10 @@ static int amdgpu_dm_atomic_check(struct drm_device
>> *dev,
>>   				dc_retain_state(old_dm_state->context);
>>   		}
>>   	}
>> +	/* Perform validation of MST topology in the state*/
>> +	ret = drm_dp_mst_atomic_check(state);
>> +	if (ret)
>> +		goto fail;
> 
> I realized that we actually should make it so that we actually expose a
> version of drm_dp_mst_atomic_check() which allows you to manually specify a
> drm_dp_mst_topology_state, because otherwise we're checking the bandwidth caps
> of _ALL_ enabled topologies which could cause us to fail just because another
> topology's new state doesn't meet the bandwidth requirements yet because we
> haven't readjusted it for the fair share compute algorithm.
> 
But wouldn't we want to fail the whole atomic check even if one of the 
topology states fails?
We call compute_mst_dsc_configs_for_state() function before 
drm_dp_mst_atomic_check(), and during it driver will attmpt different 
compression configurations untill drm_dp_mst_atomic_check() passes 
because we call drm_dp_mst_atomic_check() inside 
compute_mst_dsc_configs_for_state() every time configuration is readjusted.

> Also, I think we should probably differentiate in the atomic check functions
> between failing an atomic check for a topology state because it doesn't meet
> the bandwidth requirements we set, vs. a topology state failing atomic check
> for other reasons (temporary deadlock, too many payloads, etc.). So basically-
> we should return -ENOSPC when we fail because of a bandwidth (including VCPI
> slot allocation) issue.
> 

Thanks, I will update drm_dp_mst_atomic_check_bw_limit() to return 
appropriate error values on bw failure.

>>   
>>   	/* Store the overall update type for use later in atomic check. */
>>   	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {

-- 
Thanks,
Mikita Lipski
Software Engineer, AMD
mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
