Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC5679DAD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8D310E6B3;
	Tue, 24 Jan 2023 15:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EDB10E6B3;
 Tue, 24 Jan 2023 15:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7U1sP4r0CIJ7Jhsi/qOd9OCCYLI6N1U6XuuTjDeK2SOg4TSezGX1AMUi8SG4Lku3ffeN2VFnA7W6kK6Pw8/4jgB7qwT3gdbvXmQFe6KOHFtURYsbP5Y5p1DtWmU004DsSbSieCY3+QlZ8MYvMnYWe4fbZrmYjWsPvk5rX7MgxRMaRIa/y89b8Lssnepg2d4LHut72hIS1WRFPjH4VA5IEWCMC9W+71xqR6uo0k5NRL1lGW5GiwO2lG+Hh4MhltG2KZuboEbn7LC28if3piCFTkoQirxOmBa3S8u7CFArhCIy2CcoOwG3hP+1C39MoVPLC1nSaBvX+ESU1KQyLId/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR7rCdriMlckcS3CwnUoKsgOJXU0cnieIUFnU/hp0tQ=;
 b=aZxYL5Z0JMQxvSom1cHQXgCVXTtHT37GCYT+FvrrPae0HVkc91ZydC3YjM3vV7H5kUMqd7Oc0ws7bv8gYYzFvaBP6sD78+R+ud5fjhFomhtDAvdPDoiYJjr3QWzGazChrFyfBprGU8QY2cQl0sO/26ZqexhLZ1ThOV1zRumaVbpxi2R8FA2NH3/ozpIfyEV/LJ1Ak5HmJZ/dEUR1KMxrZK+x9QilOpaNW8xTpevThDix25TGombSYmGaOyIgL6pLfNBtgkc6el8YNgwVr8bwpcS4pxdkGRYFYzTOEkEQE2kBfAzVPaTMt+AIvdDlLWTeL0jikFWO2iAcIGHgWUUjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR7rCdriMlckcS3CwnUoKsgOJXU0cnieIUFnU/hp0tQ=;
 b=j1cWZp5aXcebeKGc+7C1wThhvw9tCW1oaAxtmEMmfuNkVwfK9EmJtKtSNIZAAIBJNfNEfkR1deZo8Mtbr9vbBkm3zPEocKDD1AY3PL6+HlGnvSU4TJI2XYNT8/kEq1L48fR+M5tzUB5awXiTgRin962KBuzNt26/f68QuW2gqPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 15:37:43 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 15:37:43 +0000
Message-ID: <0a57bc76-91f7-dc00-6877-cd0a1dfa7347@amd.com>
Date: Tue, 24 Jan 2023 10:37:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 18/21] drm/amd/display: Fallback to 2020_YCBCR if the
 pixel encoding is not RGB
Content-Language: en-US
To: Sebastian Wick <sebastian.wick@redhat.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
 <20230113162428.33874-19-harry.wentland@amd.com>
 <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4xHKNSWO21Swq_b2VPPxtYGdeo4e3rPEVo44OPmB+opZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0348.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 1daf80b4-0d39-4f1b-bb17-08dafe20ef0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OA0nbJqu7wDE1tpqShKdMOYtAP/DLapDiT5gdjryBBUOcTV+F7CmrlhluGOA0Ao6pSC3nztei6voLM3Usxb//4/jTjAgat5LqfzTWI/M4FtsHW37NO28qfwYGhNy4982axCekf5QBN4CNIo8eixKXuf4pFRXbCfTFpT91RamUHLrKb2kykHtySELZDCoJ2upeBRsviBWHpJCgbRhj/UBJD37Mx7CK72v20nti6WaJl+tCYNdpkzSS41ynUOv6im7bUm094j4pcoLe/cUOF9CI6Re/1f7maMVWzdbuiPBW0BppV6EHgmXYHmKctlSZ2xwEiAu8ddkg6pSykImtOpJGjSbVXZdtOjpAweecLZaP34R/Bnw9vwnah5V36VaZrUDaXKfaKqRoj8tp1MOZOku6kNPdcW6fqL91w3ERUNw37uUGA8vkzStm7ZxeNU2ZKGi/3s767YKExGLHFMJqf5ADNcdAOamE3Zh88dgJ/4oQDvYa7jgu2+WuIJX+5LcsX5dFUZ0NaMDs/WHraYf1wXA/0VS+AO20pUnIdV72Z3OEWrnEQNJZTk/5409UVfUsQHYN7JDdOgAhtfpXT3KgFX6H1r6HeVMyoYUiCZ5RPE+VbZhQNMrj618osaA0s2A/tjVGsz/2KNM51pTpUtIcGe4x6IFoCLiESwEwPd5Cgndl6/mdb4hbRPdGG0dFXKm2lRWof820Vm9WNRMKbQLaz7lMV/SVQ4O700QmDQy8ay23eA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(38100700002)(83380400001)(41300700001)(86362001)(44832011)(2906002)(8936002)(5660300002)(4326008)(316002)(6512007)(6916009)(26005)(53546011)(6506007)(186003)(8676002)(6666004)(66476007)(66556008)(54906003)(2616005)(478600001)(6486002)(66946007)(31686004)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitNaXA1SW5LbnBpeGF4ZnA0aytJZU02THlGemRBTDZna1J6NFhFcTZldDdS?=
 =?utf-8?B?S0p4aEtZaXIvWUlscytrYk9XTHFJZXJCdGQ5YUhvOGVRalM3bzBIdTY3Nksz?=
 =?utf-8?B?a3JSN3hQWkxOTzQ1NFRNVStaS2lzZjcxc3JZWlBHbkx6cEgzTVorQVY3dWdE?=
 =?utf-8?B?NFB6OUdpcTkzV0R0Z2RRRjI0OVJBK0Nwb0FIanNOdGl6VmVPb0JnUDRXV1d0?=
 =?utf-8?B?M2UrbjgzRldvZk5mUVlkc2kvcC9VbW1sNEd0ZUh5Z2hXTmtqZEdHdVlHbTlL?=
 =?utf-8?B?ZUlLYUpLQkZwdjZYaFNRanpNTjUyY1Y3ek9jTUNMaHprRVN3SitlMDA5dGVV?=
 =?utf-8?B?cTF3cDNlM1ArczNIaEJuc2dDUEI3L3llUFlzSmszRmtNNUtqR2N0QjltZFZm?=
 =?utf-8?B?UmdZSHJWdWVsZnJOQXJFMGhTUlBoWVlaUG8yV2k0WDNBZWtmT1RmYmhrVC8w?=
 =?utf-8?B?VC94SFl5QzBwZWZISEhweVIxYTBWdzBGS1FlTXorM3pIRllBOFVKK2M3Skcy?=
 =?utf-8?B?QTcrOTllMElHdFFsWVM1VUo1R2NZNXFNYzFwRjk4bVFYeUZuTE9ydE5nYlhV?=
 =?utf-8?B?bkkrVzl5TW10SjRVOEpmK1RwWkNNaEIvZDdvcFR6MzgrQlhkTURwT2NsV3Q5?=
 =?utf-8?B?RlJIQXJYMHp6L2EvMXpFK3M3amEzbnJMWFdtUDZ0NUVlYUhoU3FnejZ0VktH?=
 =?utf-8?B?ZTc3NnZLY1o0YWdkL20yYUk0WFV1RytrWkN4d2ZRKzVxL2p5bHlVd01ZOFoy?=
 =?utf-8?B?MERML3Y5YnUzQ3lZSzZBOWEyb1FHQ0xEUGlJTmdUVU1ocDVTMDVJMzlIaWdQ?=
 =?utf-8?B?UURNc1A5bTJwMGtza2hBUWFhWUF2WkgwR1gzOGxZVGhMVDk1ZVFMTGM4UTZw?=
 =?utf-8?B?dXVWZjZnbEQ4eUh6MzVZWDcyd1ZBR3JOYUYrNWpwTU5MK3ZaVFZjaUZvWHFm?=
 =?utf-8?B?VUJIMWVwSHc2OUdac3BoSWZDakUzeUpzM0ZxcjhONmp6cUxZRkNrcWs3T1Fw?=
 =?utf-8?B?Y2RZTzNJSlNyMFBwdlh4T1JGQWp0MjVSZTFSQitQdlgrU0VVNnE4VHFmblZ3?=
 =?utf-8?B?QlFTanZIRWF2dUwrSWh4bDhHdGkxc3NhRGM1TXc0SkduRnV4NVFCNGlLSnFl?=
 =?utf-8?B?OFFZZnQzK211WTc1WWR6SFlWK0dDL0Vsbm1oYS8wenprVlVBaXRjdlpnZFBU?=
 =?utf-8?B?d0l1VDV0ejArVi8vdzY2a29yM2phbTRORncxczVxVkNDajlOdlpyRHB1RWVt?=
 =?utf-8?B?U2h1TVJ6VmQ5T3NBSzNZSDZ3Mzh5c3k4cWd0bkw1S2xlZ1lEMVlzVTFiVHJT?=
 =?utf-8?B?RVdGbi90U202V2Y5dkdvejhhMkFONmlBQkNnYTBqMlYvelgwdldielpNMmRj?=
 =?utf-8?B?RjBDdmhxeUhQRGFhbU5qOCt1SHJhYVVabHVFc2k2U0YzRWlxRmY4OVpkOFJX?=
 =?utf-8?B?Vi8rd1RVZGxlQWxyS2xqOGhRRFBkdG5PMDljWklMdzVUUmpucm5XMnNPWGVZ?=
 =?utf-8?B?VDUwQit5bmIza3FMNTFBOW90RURCam9PT21GaHBCclJDSjBZTklFeG5UOWFx?=
 =?utf-8?B?YWVFdHlVVC9oTW1XcE9zUEtQR2dIS2x4Z2dacHgvbmhaUjdGc0FLUXgyblNk?=
 =?utf-8?B?TlRXZ2JaWHFQV0xPSzBPWDgrTUFzMzVkTjdwWGQzeFNQdy9oQlR6bE80SUgy?=
 =?utf-8?B?Z2FYVVR0cnB4VDJibnhvZ0VRMGVmaGlIL3BuV051YkQ2ODJ2NWEzRnltY2Ew?=
 =?utf-8?B?ZGRCaWFub1FuR2lxbkxjVEdDYXRFZ0NWTjJndmNkQmxEakdsVElqZG9JSjlX?=
 =?utf-8?B?dkNkNitQdE5DNFNmSjYyUUNlWHpBOERkSE9odmdKSVNxMkt1K3pQZHAxa2JH?=
 =?utf-8?B?b0JPaFh1RGNkUFhTUjdublA4dWl5YXZBdFBXS2sxQ2hvSi9VR09kTVkwU1Qv?=
 =?utf-8?B?ME42eXlnNnh2aEduc3Z3RmJRaTNOZ01MRW1UVTFQUVNSS09vYjd5QlhrU1M2?=
 =?utf-8?B?c0FCSk5HcytLZ1ppRzdVR3AvcjdveWdqc05PS2MrcjNHRVRubzBtSUlzR3pD?=
 =?utf-8?B?c2V5TzdmZXVYUFYreGJOTm8rMjBORDNKS3lZV0pCbW5SNUNWTDlxQW43VEFS?=
 =?utf-8?Q?K7WzQQcY4JUTsfWwBQqA1mzl/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1daf80b4-0d39-4f1b-bb17-08dafe20ef0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 15:37:43.2446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYsFkSwN00Um0gYwBsU/tRVMm5xEBZ4TdqWKH6Q32zI696t7RaNqO77FmLxVRekAPgYM+gLp8rcvH02i9D8dMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
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
Cc: Joshua Ashton <joshua@froggi.es>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/23/23 15:30, Sebastian Wick wrote:
> A new property to control YCC and subsampling would be the more
> complete path here. If we actually want to fix this in the short-term
> though, we should handle the YCC and RGB Colorspace values as
> equivalent, everywhere. Technically we're breaking the user space API
> here so it should be documented on the KMS property and other drivers
> must be adjusted accordingly as well.
> 

Could someone point me to a userspace that uses this currently?

Harry

> On Fri, Jan 13, 2023 at 5:26 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> From: Joshua Ashton <joshua@froggi.es>
>>
>> Userspace might not aware whether we're sending RGB or YCbCr
>> data to the display. If COLOR_SPACE_2020_RGB_FULLRANGE is
>> requested but the output encoding is YCbCr we should
>> send COLOR_SPACE_2020_YCBCR.
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index f74b125af31f..16940ea61b59 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -5184,7 +5184,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
>>                 color_space = COLOR_SPACE_ADOBERGB;
>>                 break;
>>         case DRM_MODE_COLORIMETRY_BT2020_RGB:
>> -               color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>> +               if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB)
>> +                       color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
>> +               else
>> +                       color_space = COLOR_SPACE_2020_YCBCR;
>>                 break;
>>         case DRM_MODE_COLORIMETRY_BT2020_YCC:
>>                 color_space = COLOR_SPACE_2020_YCBCR;
>> --
>> 2.39.0
>>
> 

