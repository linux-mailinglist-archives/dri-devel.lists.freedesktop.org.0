Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0613EE93D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4CB6E111;
	Tue, 17 Aug 2021 09:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170EE6E10C;
 Tue, 17 Aug 2021 09:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/srcgO/xABxwutKBKOkDtjLu884ttcetnqlH8rIpwi90IpnN8MOFLvK2CPwICyuB3XtnEbkG69/D75cpPm/Ss0pSj16KDvWwO9BRHj/lIQAxWD4SqaQzLlg/0P+SxhTGKgI1XbIac/dKn6m/s/kFEI9a1YW3JTRxvajaR38UVsPcF2ShptG4cN9J4HpFWo0eaagaPADfBBItv3eEmUhkW9PJYNLERZZbf4CtLrm+fKNhJTdf69qLhg9mwx4Mm5G36+oa9CagRX+qHQOAbmZ/O6BZiYv433WeFq/jiTc7G49ZroGMUZDXSkv7x1z1QL51pnFbnsxBUk8hJdNDXEumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFgi1VCZug7B5/j+rtVF5hAQ1A+LxWDyGNIzLCcz2IE=;
 b=KiiGeMhxbe0D967+pm8/Tp91pARSWTv/nShBNmQpLQ3IvZ7Qod4RT/iqKFW+iqeklLOE/ubGtASppsTjCOY1T9fBxONE+kgIz6FAXV1HhgvSrLbeI1DRCiodlzwb6HH1TWIq9aymDjzew8gT2SS0MdLabqKHlwV3LgyTLCtgxZ5kIMwoQSscN5MQH2IvTEDZ7aqVqHKYJyZlRfo/iDpv4cOxL/C5ke88zTKErfSvwM5eOx9mfu8/5+Nu2yTMcg5oG0wW0gTOHPUWfSSeQl88zz3eZl0WHQMYH6SKfURGzN8JyOuQBhuKLALzWYbvwHsit/0eWBGFDsOGeKU8kajmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFgi1VCZug7B5/j+rtVF5hAQ1A+LxWDyGNIzLCcz2IE=;
 b=P5sQhoMBBZVjBk7iS2Cg8vWmhGCqOEMzPfEKVT2M8JtQJbazQVAkfROOwYLQb3O5ks8DdshTbrFwjxFP2hMbN57K3BUME1BkdCPmc9yZdWGK362XftQR5Wj6jYM1L5TPEAcDMrM7N3yMyhggbzLCQlOqpO62FSbNlaA8XvQTKIM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5253.namprd12.prod.outlook.com (2603:10b6:208:30b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 09:13:12 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 09:13:12 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <ceaa02c9-26ef-e1e5-3f35-3cc202961670@amd.com>
Date: Tue, 17 Aug 2021 14:42:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817082325.2579-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR01CA0108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::24)
 To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR01CA0108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15 via Frontend Transport; Tue, 17 Aug 2021 09:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e1af33-9302-4bb0-5919-08d9615f3ce3
X-MS-TrafficTypeDiagnostic: BL1PR12MB5253:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5253113007B3C6193F61DDAD97FE9@BL1PR12MB5253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: meI2WQmlgfzu6Xgp7o6GAmUFZi4GYBs9TrIE4EHRhxtcDmAM07ZCTK4R3VU5/5bAAr/ywfjHddjmrWdgWyWJkcngMZAtD+682N06W874Rlw29FBmx+mRP72rIalmXMZ3pR27HDTuUvBcdOhk+HO0K/o9bIBNoOTnjP2cl/RLQQnbtzIa+F0DNhIzvmUGhTxvU+MlELF8561HPlbtK9bNQNu4s4M5+4bHd4CVgBRaKXcP8joSs6WwK3Fwb+rHCkOD2VMpl+EmgJMlUt88WL3QPMC2axK9YfipktHv22FR3wl2sTswsGzSnxfCRq+6IYylEKBaeAZr6lT3PvddTLW/HcB0Kh4Z0f12mPxTabHZZBZO/qvJjjKghdyYer+8N6fU5xGYrSadl3NsXnWPeoenFkoZfgRMmjaZGb/wXlvAHNNYhklILt3sb3Rcvfk5MjnhtpbVMkovvu+AHEB1Z5EJikyYEuiDDdibo8/hlnGWNcqchVuZ82KGGJjI0a2+BrWuJPK5UdERag1Ou1kQrori8bkNDIpCdLs+cCgc1yYwSfYL6X7KNb6mO5yzCu7sc1Fj9Xu6f+iNZ7aGPcYXJVhbAZkkyzceyjbh7gpY4rbdO94DAwQKFxMWfHgR1H4w2R0p7l9N0JbkkWRyWKPPATXy7A1eYHr2bFv4An2XiG3hRS0P4N/E7Gu3RFnN2WSwCoDxGacxVZVTCBtXBSj40BbzKRV4FBjfTQkzyKVUtVYEImA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(86362001)(66946007)(66556008)(66476007)(5660300002)(6636002)(4326008)(8676002)(31696002)(2906002)(36756003)(8936002)(6486002)(16576012)(110136005)(478600001)(316002)(38100700002)(53546011)(26005)(186003)(54906003)(6666004)(956004)(2616005)(66574015)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RNTlRjU1lIeEROR0FUK0xTNVM2eFNjUmRHNGZ3N0FSVk1UUWRteXhsWVRP?=
 =?utf-8?B?VW1JaTJWbnExcFNwWURSM1JQaHRnVVRHR1RPMmczOCt1OUN4dUFIb2o5aTJi?=
 =?utf-8?B?Y2o1UHYyVWluNHZUQ1ZRRUY4NUtkWXdDczhyZGNHLytYL3FqSkFtZGFQVWV4?=
 =?utf-8?B?TEo2djREb0xhTkRkc29BVm5LN3hjTjBzVHNEWHpBamJpT2xKUnB5U1BlS1NF?=
 =?utf-8?B?ZEQrTFp5NEdOOXM3NXFBa25BcE1FUklzVnZvQnJQbW5nOUNHWGVZc1g2VS9w?=
 =?utf-8?B?UDhxdE41dThwWmhsaE93QWdrSHJZVVlVb04vR2liNHBrYmxUWVZxbzFaelNo?=
 =?utf-8?B?K3Bia29MSHRhL0gvb3FYYzNUNzYzMzNtanhrTHMxdzFlalErcXhUN0pwdFpw?=
 =?utf-8?B?Rm93Zm9DYzkrbm8xQ002VzQ5Ym9CelU5V3NyZ2RwZFN5Z0VLL1ZGa042dW5Z?=
 =?utf-8?B?ZW5wRGhPTGZPbi8xRjJWd0J0YU5yNzBrUEFvNk0yOE12YnBXbjduUmlNc0Vh?=
 =?utf-8?B?OFhQL0hpQkQ0NDRQSlB4Q1lMREEvOTFaM01CN0x6aEVIOTNJdFhCYTJpQ1RZ?=
 =?utf-8?B?akFzL0ovQ0p5N08xdFNVQmNxcmFaT0xZaGh5OFErK0FKK1NNeUpNRHZnbnh4?=
 =?utf-8?B?RHFYTEpsZTBtZEROcDM5MWZhM0RON040UTdiQUF4SGFxZjk3Y05hQTRFNlNE?=
 =?utf-8?B?d0syekl6SnlHMnpodmJ5NnZnMk0zS21FNUEwdmhUTmpzQ1RVN2lLNktLQ3N3?=
 =?utf-8?B?TUhtS1ZralBqS3FBbnBzb0ZNSml5emxJV29hRWZHU1ljSEkzaE9zTFVOc0xh?=
 =?utf-8?B?Rk4vNzFuZTJZMmJocy9ocXNCYUNpYStrTWxoN1ZMOHNVdU1hdEdSbFpIdHdJ?=
 =?utf-8?B?WUcrdXlYMmptNnM3UHhmQUdDTzZabjZadlVaRW4zSlZsajZBNDN1YU1RNTZO?=
 =?utf-8?B?MFdsNEdqU0luUXBWMlRLUXVwRGVxdG5CQmsxMkxFMjdSWWpJUzRtUUlCUXJs?=
 =?utf-8?B?aUZGcFdFOXFJZDR6aXpRZGQvdEdGR1dDSzdHdWkvd0psK1NnS0Fkb1FDeFBC?=
 =?utf-8?B?TGpxSGErWTVaZGhRbmtQcDZYZi9rMVo1cUw5ZzhrV2VEVjg2QUEva3I3TFNl?=
 =?utf-8?B?SkVESzMxNW0vS3A3dW1JUklKRUFEMFBYR1RkeGovRFpOWk1iamc3a0hjaTJi?=
 =?utf-8?B?cHl1Y1NHOHFvM09BZmYwbTY2NjdaOTNrVGlUWWxlWFNqZWxqSHNFR1B2Sm1x?=
 =?utf-8?B?YUg1ME02K3V5YkE0VVA1KzFSTWJZUEpJZmdKbnMrbkN2dEh4dktIWERuU1py?=
 =?utf-8?B?cnQ2S3FMUzVUR2dCd2xEclpaN1FERHVqZUVMTEVnNTQvQWozcmg1c0J2d3pl?=
 =?utf-8?B?OXNuN2VGdlhxUUo1MGtjNm1TVWNWUVlaWnRjLzZVckJkWUd3eVZtYlVZR2NT?=
 =?utf-8?B?dzF1WU1IK3gxbTVPMmcxREMzSnhwajN5NnR4TytTVkNjZGpOUWZvRUZtNVBG?=
 =?utf-8?B?cS9seU5jd3lNOE9iZlRocW45NWdsZHVZZ05tQTY0UlQvQUxvUDBhZEUvUjVx?=
 =?utf-8?B?SW5CNzdTcnpGMTkrbnpvcWhydy9WY0Y2eW9jOEp2c051UUtKcnUwcHdGNUUr?=
 =?utf-8?B?RjdIaGZZalYyY3I0eXNCZ2hHSDQybm1Yemd1a2tXa0xuZzhqM2pKRXNDQTlo?=
 =?utf-8?B?bWpRRjBUdGw0UXQ3K04rVk4veUN0d2dGMVh6R3k1WUVEeGxjT05xWGx2c0wv?=
 =?utf-8?Q?hqttGRX63RiSRkaDt0A0K9G84zYPKEdfPVmzTEN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e1af33-9302-4bb0-5919-08d9615f3ce3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 09:13:12.4171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhynN6FehEVvvln7SvMKgXftfe4ZDn2k7mwDVSgmHa0w+SyDjoBecymRcDkBWsQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5253
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



On 8/17/2021 1:53 PM, Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> schedule_delayed_work does not push back the work if it was already
> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
> was disabled and re-enabled again during those 100 ms.
> 
> This resulted in frame drops / stutter with the upcoming mutter 41
> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> disabling it again (for getting the GPU clock counter).
> 
> To fix this, call cancel_delayed_work_sync when the disable count
> transitions from 0 to 1, and only schedule the delayed work on the
> reverse transition, not if the disable count was already 0. This makes
> sure the delayed work doesn't run at unexpected times, and allows it to
> be lock-free.
> 
> v2:
> * Use cancel_delayed_work_sync & mutex_trylock instead of
>    mod_delayed_work.
> v3:
> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
> v4:
> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>    adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>    checking for it to be 0 (Evan Quan)
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
> Acked-by: Christian König <christian.koenig@amd.com> # v3
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
> 
> Alex, probably best to wait a bit longer before picking this up. :)
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>   2 files changed, 30 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f3fd5ec710b6..f944ed858f3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>   	struct amdgpu_device *adev =
>   		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>   
> -	mutex_lock(&adev->gfx.gfx_off_mutex);
> -	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
> -			adev->gfx.gfx_off_state = true;
> -	}
> -	mutex_unlock(&adev->gfx.gfx_off_mutex);
> +	WARN_ON_ONCE(adev->gfx.gfx_off_state);
> +	WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
> +
> +	if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
> +		adev->gfx.gfx_off_state = true;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index a0be0772c8b3..b4ced45301be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   
>   	mutex_lock(&adev->gfx.gfx_off_mutex);
>   
> -	if (!enable)
> -		adev->gfx.gfx_off_req_count++;
> -	else if (adev->gfx.gfx_off_req_count > 0)
> +	if (enable) {
> +		/* If the count is already 0, it means there's an imbalance bug somewhere.
> +		 * Note that the bug may be in a different caller than the one which triggers the
> +		 * WARN_ON_ONCE.
> +		 */
> +		if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
> +			goto unlock;
> +
>   		adev->gfx.gfx_off_req_count--;
>   
> -	if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> -	} else if (!enable && adev->gfx.gfx_off_state) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> -			adev->gfx.gfx_off_state = false;
> +		if (adev->gfx.gfx_off_req_count == 0 && !adev->gfx.gfx_off_state)
> +			schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> +	} else {
> +		if (adev->gfx.gfx_off_req_count == 0) {
> +			cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> +
> +			if (adev->gfx.gfx_off_state &&

More of a question which I didn't check last time - Is this expected to 
be true when the disable call comes in first?

Thanks,
Lijo

> +			    !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> +				adev->gfx.gfx_off_state = false;
>   
> -			if (adev->gfx.funcs->init_spm_golden) {
> -				dev_dbg(adev->dev, "GFXOFF is disabled, re-init SPM golden settings\n");
> -				amdgpu_gfx_init_spm_golden(adev);
> +				if (adev->gfx.funcs->init_spm_golden) {
> +					dev_dbg(adev->dev,
> +						"GFXOFF is disabled, re-init SPM golden settings\n");
> +					amdgpu_gfx_init_spm_golden(adev);
> +				}
>   			}
>   		}
> +
> +		adev->gfx.gfx_off_req_count++;
>   	}
>   
> +unlock:
>   	mutex_unlock(&adev->gfx.gfx_off_mutex);
>   }
>   
> 
