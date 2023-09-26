Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2437AED88
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C29A10E3D5;
	Tue, 26 Sep 2023 13:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5745910E3D0;
 Tue, 26 Sep 2023 13:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EizhhPpJjdJ8wGipmxC9PMMs/3ldREd7uaVm/p6i4ny9AyzqO0sHkdJmrX22Im7bgVFoOxcVdYUjoIs3snHooErTdKAFix6NE1Vz+mv9pGS6oAzZ5y3YgijYp0WbpJ09CJ6z/LOCSAvLeGEWaz47f0uUulYkS80iKH0SnS7L3hpSIdgr5j5tNXk7wjE88T1AsZSinRy34e4lA9mkSmYdT+Wk5mx8gl8zfwNrd1KQo1/G51O6HRQ1lo+4+u1ErvYumQ8T6fh4pkabwydzk4Et9lP7ToajTQPJM1RyGEF/bnCWaNk2RuH18EsyzvWOQlAWbxwtaiDHPUD4ZYjyuZY3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TuZJ/Nw757eKmRk/SYJOXSm/eFNzYbdJJEF/Of4FKU=;
 b=UlG34v8Ujiag/str1n5BOVeU4gWO9Rv+dnIxygClPscpgcU/aXigRlRuo/H4ScRp904u8VLN1R8W2Vnh9uM9Dm8R5fgJWnLPnh/PJLKA3AIy9rYYbyGW0AHHqFVsA2uDpBnxChRxPmreX0QL1WbQeZG3PrRsMaNgIelIoi1GVI/YoOeN4xTjWhjuUYFO6Y+TB8saA2W1tYHctB/kkdnpWKpbdtoWucQsN+ZIA9jIio0zV7srXniD4n82yoHBH0YIlOkm7zf8eCAsaYD2M5fDcGS4+F+gfbcTYUubRtlyzwPejBI6rYGSmQ+3KhVAsztr6XVKKoQW6PBrE20Xi7oitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TuZJ/Nw757eKmRk/SYJOXSm/eFNzYbdJJEF/Of4FKU=;
 b=qBiaurm4kUrryQirfcBS1B8e2Oj6otGYJQjYeRUw6ertxQQCI1aJULHuAZ2X96GqQv4TLmsCqbYWCeGUWZlWQXIbzze+GkOl45hrtjP9X5QpUsKHJ4bDSp5vxjHRIFQ2EcNpygFimXCFm3vSNYM9hb+KSg9GXnq4+N2icHiyz6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31; Tue, 26 Sep
 2023 13:00:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Tue, 26 Sep 2023
 13:00:51 +0000
Message-ID: <c3b2a240-d6a0-4b4a-ac23-30ac908da157@amd.com>
Date: Tue, 26 Sep 2023 09:00:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] drm/amd/display: create DCN3-specific log for
 MPC state
To: Melissa Wen <mwen@igalia.com>
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-4-mwen@igalia.com>
 <c5004296-7f2b-4433-a81c-65d5672403c1@amd.com>
 <20230926123729.d4j3rgmxa6bgnddk@mail.igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230926123729.d4j3rgmxa6bgnddk@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 8133ce15-3e5e-472c-1747-08dbbe909c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCZhXT++dWFruW8vEn2BAEr82JAvn3EUVjdMC3jtW2SVjKBbAMbZ+wEP/jduo/D0rWE7WQzJmJ2oxOBmvBuoQgTPjIFU0ggYHEQrmZJb8RwSos7Yc0TNWynrZVH2btDVIaCWB1loK3GjecIP/HS2NoZn6/0zd3XkKhj0S72P0uM6D+entVaxdxZWWb4x8spmtIhXR/oD324I7faeRr9p11DS4IMlBKjI3IrTLUoHvl06ZnrfyMmXkkSWy481UAq5EupVZQRf58HLNKUbYlgzN8Us2q92MePatViuYP+DGdjTUSC25iR6RI41nQnFys0acbOkpPBZrI9tPJrvSxzynTAmj+PZid9lwCajHwYCEgKX3kUnGxZWWVdU0iOw+YgGyTLTYXtfqhe6LSkiyPuEwotIc5uKsaZ3rP3uPqrTW5vMhLEpArZwC2xH603x4TMs72UNrH0kbCIzemqjG4jV5D9LE0UOgFobzR1Sgx2L7uFPCLU94/c3TsvdmDQ8bd1cB2l3aOTMkaZk9/h6PvzxoX+HbXimo3uFWTrTkIQuuIwwUB8wKs45GaVnu5Lmm/gtaOo/64Dm94PKOcb1fLbRpCgDgAP0kIjuyzfnNnkAFkWACvNnl20oyE0P6sLE1gdh93qEWl/Ifz+j+EYUuIyUTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(44832011)(5660300002)(8676002)(4326008)(8936002)(83380400001)(38100700002)(41300700001)(66476007)(54906003)(66556008)(66946007)(31686004)(26005)(316002)(6916009)(31696002)(86362001)(6486002)(2906002)(6506007)(6512007)(53546011)(478600001)(6666004)(36756003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09HU01rZWlYamM3ejlXNlhObVc2VnpSZHdpSW9FWlNQZVpXcWRVRCtjVHBZ?=
 =?utf-8?B?cHJDelZZdmpQWkg1akNhVThYL0hXeXJlZnZHZ05BazlJTm4yamdRYXc1eGxa?=
 =?utf-8?B?V25EYXMzbzdEMnlEbGlIcTM3QzBZb3ZsZ0hXZGNGSTZyaURQM0xtVzlZY0xa?=
 =?utf-8?B?TVh2K1BHQVJWMmlocWtnem1sZlZ0VFRIK0MrQ3E5Vng2MFVpaVZWd01PNldW?=
 =?utf-8?B?cVJlQTl1b3kwSm54dlRxdmt4RVlGR2xBUWY3NENsREh0RzNwWjZTSHhENGdR?=
 =?utf-8?B?T3NpQVFnRFJJeERObFBSMTRKU1o3b2RyNnQ4N2NVT3R2bFlwVnhOZVZiVzJU?=
 =?utf-8?B?QWJzQm9FY3JrMC9sWWpBeXBrOXBoVUJkWm9YYlYyaTZEODZRbzFUaEhrZVhC?=
 =?utf-8?B?K0RveWYxalRyLzVISU5mR2NvL1l1Nmh6OExDV3h4YVkrU0toZE1lbVQ4L1F3?=
 =?utf-8?B?aEl2KzdncitJd1A2d3lwNE1TQTJBZjlOSWxqU0RvTi9VbTJzOWRZVUhhN3Np?=
 =?utf-8?B?SGN3L1J1WWc4dk5VYXZyYmRHWXZDMmNzamdlRm9WNWQ3QUdtNWNkWVRiTTR3?=
 =?utf-8?B?bFR6amlBdVFLYVFJTStBSmFJYytZem5saHZzRFJ4cHBzem0zZFJ0MXR0SHBs?=
 =?utf-8?B?STRTVXFkcXdJOEJuRHQ2ejVyaDVOdlFPQ0hBKzAvWkVMc2tORGlyUTVvaFpw?=
 =?utf-8?B?MGlsNUNraWRDVlZIbzlZR0JiVnh6WFpBWU5Qc3YrNko1eVlYeFRGOXBqN3Qw?=
 =?utf-8?B?aTBwbG5ZeS9EcUU1emdBeU8yS25WWXY3NU1GbjRhaUJjNjJTN3N0enJJWkt3?=
 =?utf-8?B?djBkZC9rMU14ZDg3dUpmOS9LSXZvdlVaNjZ0UDgrL05hODk2VkJyNTl5VlNo?=
 =?utf-8?B?VHdteThXVFY2cVpSR0o5SVoxb2NFdGRWdmZNZWZwdGorU0F6L29vZWZWMGRn?=
 =?utf-8?B?SUJ6eStka2F3YTJQNUx2TUdNU0wxZjFUQjArRWwxSVNGTTFIb2N1STFYVFhH?=
 =?utf-8?B?ekdtU2lSandCK2J5a0RuVzd0TFhsTlVhMzFhWld2S2JCNUcwcjRyUlRpa2M1?=
 =?utf-8?B?cmYwbG14SjE5Nk81dyt3L0pZSlJaMG9vRmNyUitVcWdzNWpvdU14ZjZyeTc5?=
 =?utf-8?B?VmZFdW45VkprRWloUU9xY1UzS3pEcUZzdFd4aGNQQmxtN2kvTUwxQ1FVdGlW?=
 =?utf-8?B?YVVud3NBblRYY2NPTUJxaFhVWG41Vy9VelRubE9WL2FHanhuOU5JRFNDLzBu?=
 =?utf-8?B?aUNSZ1FrbmpSdThoemlPTnRyWkY4N1VqUVgybFh4bUp5Ny9MRlVhWDZnODhz?=
 =?utf-8?B?TVFIUFd2d1JJY3hPd1lXb2d6MEhGYTRPdTRBSHRaWkhrc0ZaazE2R0o1MGYw?=
 =?utf-8?B?VVBBYjd5YVZNb1A3MjFLejVzTVdtcGc4bmc3aXY5aFFHbEpaZ2E5SW1Uc3Vj?=
 =?utf-8?B?M1VtT0g5cXY5NUtFYklCcmhmeDFzL0ppQTFLUnI0NG5SeDhodGh3cWY5KzlS?=
 =?utf-8?B?bnNQUTAvK3RidE53SjFPQ1dtOHowcWNDNklQdEp1MWoxNmpZbmJZN0libDEr?=
 =?utf-8?B?ZWFuUy9FSmNaVFlXSnNjd25yQmhZOHhIU1pYU1YzUXJyV0NpNUZ5Zi9NNk13?=
 =?utf-8?B?UWpqN3pXN1B6bXVzUy9vbHNieXRGdnMwTGJyRllZK0FYQXk4ODZvZmhyNHlQ?=
 =?utf-8?B?R0dtMEJqbTZxd0RaUGNQbVBBMVBtMllocjNGN2xlR2N0anhYNEJrVExnWENz?=
 =?utf-8?B?b3ZqRDFCRk5RNGRSMERVNG85eDQ1WmRTRkJONkwxZkJiSE02VS9rU3JlQVhu?=
 =?utf-8?B?YUd5UWU0RWdVL3M1RjR2NUQ2TzF0S0pkMzdGUld6RS90WnlJU21MOE0wYytm?=
 =?utf-8?B?cnEvOXpjOGpsMjZROEJUL09HK3N5NlVUY25ZVmh5cUxvclF1cWNsRSt3NWIz?=
 =?utf-8?B?U3hkcS9yZ2ZiTlA3bzFjRUU1d3BPN3AxeE10Z21oWFVHSDlLYTVNUkRxRldM?=
 =?utf-8?B?RUVyaTBCTEpNSTJITGMrVlpCdG9VOEFqMjBGWGdVNlN2TjlJUXJCZlFIdjFC?=
 =?utf-8?B?d1BvR3hDSkNPcUZnODh3djN4ZVlCVElienhIak9nVjFiRE1GbjNqWW5kV1FR?=
 =?utf-8?Q?GeT1fwkdfkH74oODlsGZGp16d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8133ce15-3e5e-472c-1747-08dbbe909c4d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:00:51.2458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkcshJaGZcBv788wKO5RumJ78ztFAPiY5wTt7eWD0lpcWFX6ozdn++YXs9vGbr/tHRteuac7dPEKvqywXis90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-26 08:38, Melissa Wen wrote:
> On 09/25, Harry Wentland wrote:
>>
>>
>> On 2023-09-13 12:43, Melissa Wen wrote:
>>> Logging DCN3 MPC state was following DCN1 implementation that doesn't
>>> consider new DCN3 MPC color blocks. Create new elements according to
>>> DCN3 MPC color caps and a new DCN3-specific function for reading MPC
>>> data.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 55 ++++++++++++++++++-
>>>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 13 +++++
>>>  2 files changed, 67 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
>>> index d1500b223858..d164fbf89212 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
>>> @@ -1382,8 +1382,61 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
>>>  	}
>>>  }
>>>  
>>> +static void mpc3_read_mpcc_state(
>>> +		struct mpc *mpc,
>>> +		int mpcc_inst,
>>> +		struct mpcc_state *s)
>>> +{
>>> +	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
>>> +	uint32_t rmu_status = 0xf;
>>> +
>>> +	REG_GET(MPCC_OPP_ID[mpcc_inst], MPCC_OPP_ID, &s->opp_id);
>>> +	REG_GET(MPCC_TOP_SEL[mpcc_inst], MPCC_TOP_SEL, &s->dpp_id);
>>> +	REG_GET(MPCC_BOT_SEL[mpcc_inst], MPCC_BOT_SEL, &s->bot_mpcc_id);
>>> +	REG_GET_4(MPCC_CONTROL[mpcc_inst], MPCC_MODE, &s->mode,
>>> +			MPCC_ALPHA_BLND_MODE, &s->alpha_mode,
>>> +			MPCC_ALPHA_MULTIPLIED_MODE, &s->pre_multiplied_alpha,
>>> +			MPCC_BLND_ACTIVE_OVERLAP_ONLY, &s->overlap_only);
>>> +	REG_GET_2(MPCC_STATUS[mpcc_inst], MPCC_IDLE, &s->idle,
>>> +			MPCC_BUSY, &s->busy);
>>> +
>>> +	/* Color blocks state */
>>> +	REG_GET(MPC_RMU_CONTROL, MPC_RMU0_MUX_STATUS, &rmu_status);
>>> +	if (rmu_status == mpcc_inst) {
>>> +		REG_GET(SHAPER_CONTROL[0],
>>> +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
>>> +		REG_GET(RMU_3DLUT_MODE[0],
>>> +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
>>> +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[0],
>>> +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
>>> +		REG_GET(RMU_3DLUT_MODE[0],
>>> +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
>>> +	} else {
>>> +		REG_GET(SHAPER_CONTROL[1],
>>> +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
>>> +		REG_GET(RMU_3DLUT_MODE[1],
>>> +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
>>> +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[1],
>>> +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
>>> +		REG_GET(RMU_3DLUT_MODE[1],
>>> +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
>>> +	}
>>> +         REG_GET_2(MPCC_OGAM_CONTROL[mpcc_inst],
>>> +		   MPCC_OGAM_MODE_CURRENT, &s->rgam_mode,
>>> +		   MPCC_OGAM_SELECT_CURRENT, &s->rgam_lut);
>>> +	REG_GET(MPCC_GAMUT_REMAP_MODE[mpcc_inst],
>>> +		MPCC_GAMUT_REMAP_MODE_CURRENT, &s->gamut_remap_mode);
>>> +	if (s->gamut_remap_mode == 1) {
>>> +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_A[mpcc_inst]);
>>> +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_A[mpcc_inst]);
>>> +	} else if (s->gamut_remap_mode == 2) {
>>> +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_B[mpcc_inst]);
>>> +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_B[mpcc_inst]);
>>
>> Any reason we're getting (and printing) only the first and last
>> coefficients? Is it to avoid printing lines that are too wide?
> 
> I'm unable to reach the other coefficients through this
> `MPC_GAMUT_REMAP` register prefix. But I'm probably missing something
> since I can see the registers using UMR. I'll try to find the right path
> and update it.
> 

From dcn3_0_1_offset.h the registers are there:

> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A                                                         0x014c
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C13_C14_A                                                         0x014d
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C13_C14_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C21_C22_A                                                         0x014e
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C21_C22_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C23_C24_A                                                         0x014f
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C23_C24_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C31_C32_A                                                         0x0150
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C31_C32_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C33_C34_A                                                         0x0151
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C33_C34_A_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_B                                                         0x0152
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_B_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C13_C14_B                                                         0x0153
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C13_C14_B_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C21_C22_B                                                         0x0154
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C21_C22_B_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C23_C24_B                                                         0x0155
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C23_C24_B_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C31_C32_B                                                         0x0156
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C31_C32_B_BASE_IDX                                                3
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C33_C34_B                                                         0x0157
> #define mmMPCC_OGAM0_MPC_GAMUT_REMAP_C33_C34_B_BASE_IDX                                                3

But in dcn30_mpc.h we only define the first and last:

> #define MPC_REG_LIST_DCN3_0(inst)\
...
> 	SRII(MPC_GAMUT_REMAP_C11_C12_A, MPCC_OGAM, inst),\
> 	SRII(MPC_GAMUT_REMAP_C33_C34_A, MPCC_OGAM, inst),\
> 	SRII(MPC_GAMUT_REMAP_C11_C12_B, MPCC_OGAM, inst),\
> 	SRII(MPC_GAMUT_REMAP_C33_C34_B, MPCC_OGAM, inst),\

If you add the othes it should work.

The reason for the MPC_REG_LIST_DCN3_0 (and others like it) is to
(a) abstract the _offset.h definitions away and give us common code
    for register access for all generations, no matter if the offsets
    change, and
(b) to give us compile errors if a register definition is missing.

Harry


> Melissa
> 
>>
>> Harry
>>
>>> +	}
>>> +}
>>> +
>>>  static const struct mpc_funcs dcn30_mpc_funcs = {
>>> -	.read_mpcc_state = mpc1_read_mpcc_state,
>>> +	.read_mpcc_state = mpc3_read_mpcc_state,
>>>  	.insert_plane = mpc1_insert_plane,
>>>  	.remove_mpcc = mpc1_remove_mpcc,
>>>  	.mpc_init = mpc1_mpc_init,
>>> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
>>> index 8d86159d9de0..e60b3503605b 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
>>> @@ -193,6 +193,19 @@ struct mpcc_state {
>>>  	uint32_t overlap_only;
>>>  	uint32_t idle;
>>>  	uint32_t busy;
>>> +	uint32_t shaper_lut_mode;
>>> +	uint32_t lut3d_mode;
>>> +	uint32_t lut3d_bit_depth;
>>> +	uint32_t lut3d_size;
>>> +	uint32_t rgam_mode;
>>> +	uint32_t rgam_lut;
>>> +	uint32_t gamut_remap_mode;
>>> +	uint32_t gamut_remap_c11_c12;
>>> +	uint32_t gamut_remap_c13_c14;
>>> +	uint32_t gamut_remap_c21_c22;
>>> +	uint32_t gamut_remap_c23_c24;
>>> +	uint32_t gamut_remap_c31_c32;
>>> +	uint32_t gamut_remap_c33_c34;
>>>  };
>>>  
>>>  /**
>>

