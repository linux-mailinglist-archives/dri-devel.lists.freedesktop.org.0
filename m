Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CB93C749
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D706110E315;
	Thu, 25 Jul 2024 16:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5rY0H4e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DCD10E315;
 Thu, 25 Jul 2024 16:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgpQ7dbg/0VZHxfUCrdFGbkmdvpvUa238PX4tC620Uzz2ZK+MAJVm4mR2YADMMunw6pPbu59CshBqgjVd66ruxE6N2rCXrrdmZ0T9oD+mqf3FVJ9HQrHeOxF7aOB7Mw294wyGqxofshiliyic8O0csWZVmPCv/4p215JS+eSClxc+Qevymz2v73wJgRcZ/3kBie1LNEp3JDtozDeQrR6jbyWHOb51B7zgJorF+kvCBCfqKbZ3B/SiJ7rjtHnWEQBmVaw3doXNZByRcdq66enMIyyqcNtorocg7K+ctFj76kvfeD/N4+tk6pcj+Gc3w+CxBTh/+0DQuka3Ao3MDHGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLrJ9lKO3zWcRMRIB5DBuy2oh3vHifDH7xatJbavfVg=;
 b=R4meXd1BzfcGhlv3IWLSD5ihtns7v1UkuHJWx3U9jFLWcurCU/SIvWzOv9PlXV9Y0ZUtJ/08Ao5LESP0vBQCSgJlwdmpVw1Ux6SI9Lv+75JnTRMyJQd+Dj6vjZC04yZDsa5btz5wLSK9XgNkLtnsFUA/zOsttJcqDDTv7DXJqsGRnUOHBtbq4UVN7kUILf+vLbQyYcQaoJq73UpyeqMzBJWcfY/IHvmMUt+yFiDpP8dH8NyoZ3IUNZd7OOI5SrPYetjc/2PvgTgChlkZ+xFu9rbBP14H8GO/C1JNQUcxqwSrGw6z1mZXdZMZMj5I5afUd2cmk+ZKZLd11h9CMvqYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLrJ9lKO3zWcRMRIB5DBuy2oh3vHifDH7xatJbavfVg=;
 b=5rY0H4e18GOLexVxXC5579kBRRUY0Z6Xqp0TJ6F7SpDZyqN8Eo65Bxr+J9xI+GIq59nMGuV5+LNUQ/SAwhxjgfsK6wCxENzBETJmi4OTnYp1QuQOxHkKVeCD59dI9RY294UX6Z4RB6pXANvQ+bhxO5PGtBGJDYrDAcG7DGFCD2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:40:23 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:40:23 +0000
Message-ID: <2eba5e73-a430-4964-8f84-4fa2a42940ca@amd.com>
Date: Thu, 25 Jul 2024 10:40:19 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] drm/amd/display: get SADB from drm_eld when
 parsing EDID caps
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-11-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-11-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0402.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::14) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 67243682-388a-4a0d-35a7-08dcacc87a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEh2YXdUaDJBOU90SCtIS2w5V09YSWVFZnhBWENzVzlGSU1FZldIbHBZT0dm?=
 =?utf-8?B?NmE3M0hJSDI0YVVxZ3ZMcWc1K2kxOVd2VU1aU1VQRVpSbDQ4c0ZnTytTQlNS?=
 =?utf-8?B?U3pEVW9VaSsxYUJldThqU3dGc3dsOUNiN3oweWpOZXk2cUVlYmVnanlnVDFH?=
 =?utf-8?B?UHZmUHl0YnZrV0h1cm90c2MwYkJXR2pONi8wVVdUbVRMUDE5Y01xYXdOaEJS?=
 =?utf-8?B?VkxzSytPaFVlejZjVTVuSW9vanNkUFk1Qm9rOStFdzlwcGpIN2JwYWlieDdS?=
 =?utf-8?B?T1hDNFdQV3h1MGZENW5ENy90djdpWTkvM3Npa1pMS0s1TURLMHNsb1Z0ZkNa?=
 =?utf-8?B?UDdnTE9CeXFMVnJGZytiamJkYXV4ZmNMeXVCQWhPWnF5V0xDSHhxUlVwQUk0?=
 =?utf-8?B?cDZNaVdTZnU1VzNQMTQ0ejB5QWNwR25tdktZaUVwU3pic1pHdmZrdXFYbE8x?=
 =?utf-8?B?VmVtMzRvRUdjbkJMb2I5TjhpTVFLd244VWh4ZUxXVFBWdDBpNGxnRWJwVVU0?=
 =?utf-8?B?N0U3S29iVFhWSjBTUHJxcU93Zko1TXZKYU93cVpVQ0RKaXlHbTJvMlF4OXV6?=
 =?utf-8?B?SU9mNUM2NGhGZ3JXSmJjQVp2QUNOa2ltVlNteWVxNDM4UHFHbUhFZHBVNS9a?=
 =?utf-8?B?enlvUUw0Y3NiVFg5R0I5R2hDRUtNb1g1K1o4MjFrRGwxa2pCOTNsQW5ueGFi?=
 =?utf-8?B?VkRQOWRIcjdnU0Ribm9oRjRFcVNIZjA2V28xMGF1RHBpclpHZDZhaG9GaUtm?=
 =?utf-8?B?VkV2S3lMOWdrcE9uRHQxZ0EvaE5zQ3BoUzQ2ZE1BUHlNNlF6SmpSMHVFb21r?=
 =?utf-8?B?d0NEU2owU3pKbVQ5aStYNWpqWU1zd0lMbGV3b0FOSllmZFJ1akx5YzlLbnBO?=
 =?utf-8?B?QUdwcytUYnErZ1RsNjNFQ3BOcGZqNGlIb2IyNEVseUkyU3dRNkEvNjFGOXBN?=
 =?utf-8?B?R1VEV1BSUzBldlNMbXZPQ1owd1o2Rzh5UmR2UjM1YlZCYjdJb1BvM1Y4cjg2?=
 =?utf-8?B?NHFIWWhpTUhWb0g2WisxV29zdmJCTFdKdkxpRDBIUmRTTDZzTnRTbEl5NE5M?=
 =?utf-8?B?a2tWN2M1MFRUSWQ1ZEl3aWQ0WU04M1NyWFhhalNHUjhoRnJ0ODN1eGRDSlZE?=
 =?utf-8?B?ZHR3VGtkUzczUVNxZDhuMWNBeEdxVmwzVkJtUXN0eGljdE91TmxwQlh1eW5Y?=
 =?utf-8?B?TjVhV3h5SnhPbVorNU5IVUV3c293QzBTSVpVMk1sN3hvRVNydHM4VDNWSnVG?=
 =?utf-8?B?OUJCTVFjVHA1WnRDYmh1Tk13ak91SS92UGVaS0lHVEp3aWxHYXVvT2dEcDgw?=
 =?utf-8?B?MlBkazNwWURheGJyRXVLWTF2a0pKUEdxYzBQS2dGcVk3NXpZVm9kcmF3ajNQ?=
 =?utf-8?B?TEErVnhRLzloTlltNFJEaWlJRDY3SDFxSDhBSElJSnhWVEFCL2kwMFczYlFW?=
 =?utf-8?B?eWdQeWdFS2NvcmRSUHpJbzQxYzk4VEN3THJ1R2VadkVOc1N3SGROejI1YzR3?=
 =?utf-8?B?QWRZVXIybVRGcTZYT0x5bXNQWEwrak5ESkZZVHFkQlJnTnpFN0NGZWJFZnhW?=
 =?utf-8?B?eCs3RXMvNzVVNyszeGpDQ1JXbU1oS01aVjFETDVvTzFSTkh0d3E0N1BZdEQv?=
 =?utf-8?B?eTJaRFlpZmlQQ050Rm9sNWdlSDJxNDgzY3NJUXg0aVg5VWIxVUJpL2pBeTZw?=
 =?utf-8?B?MjJJajNhbVFHMkRrZ2JuandrR3IvaWZ2Rndvb1AxM1QzN3E4UTRUcG9nTWwv?=
 =?utf-8?B?SlJKMy93T2hQSVR4UEtpWDQ1T2ZUOHhRQjdVOGFsT1pONnZJT3hnSWo0RGM1?=
 =?utf-8?B?TlRhV1VINjZ1UVdVYlkrUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVnNWlhRlhSbWY4azE3THZuU3duV1JYZWpnclF4cmtqN0p1TXFCSlB4d1Fl?=
 =?utf-8?B?SVpTankwWHdRUlF5ZXZDVlFRRW84VG9wZFUwVGhWN2NzRThqZHl6MERMOTR3?=
 =?utf-8?B?M2RIcmN2a0ZwZ0pyaGQzcDdNOGc0dnBWM0tiMTRRQUl1cldpUUNjMklPYUNj?=
 =?utf-8?B?QTVueG94UnorN09rdHppemN0TG5nbytOa1VsclAvbkt3Q3FRYzhENCtRaHBy?=
 =?utf-8?B?ZUVNT1I5UjJZUlExblptK0tpS09qWWVSTlhSNmM3ZmVybzNHQlV6NWc1OURv?=
 =?utf-8?B?Nm9VS1h5MU9LZ0kxNzNUckx0UXQ4S0Y4QVcvVnk2Nnh1WVZ0eXpUTXVRZ0k4?=
 =?utf-8?B?eDFBNUhBbEx6NFdoRWMzMlpUbUswd3Robi93MVptSnBMb3lsZFMvZVV1alFx?=
 =?utf-8?B?b09KR2hybk9MbXU5ZlZIOEV5QytpMGU5emdnMTRkSkM1VWdxZTFQWCtmdWti?=
 =?utf-8?B?L0daUVVOR2RMQVBTNE9xUWtYRGVRY1FDbGJkeDBVK1FGNDhJemEwSFZtY3kz?=
 =?utf-8?B?eXZsRVNRMmFYUHRBcWUyT2JxZHByUGNZS3Y5YWJLNUlmWkRWUFJLdXhTMTU0?=
 =?utf-8?B?cEo2bVFaS2pPQ2FmSisxMlFHdU1NZytBc04zOUdLMjkwdlFEWVpScXlhWG0v?=
 =?utf-8?B?SFNWTEF0aVpiQ3VhTGh5T0FiL2xiQ1lZVEdWZkNzQlhsVXgzV2ZpaGlKZjVX?=
 =?utf-8?B?SFFHT1RHNFRXQmp6aWNyUldEaFpNQWpQc3BxdURmYzBwS3FqZTF3UW43Zm5O?=
 =?utf-8?B?TmRCTnIrRlU0cTE4ZU5QbU5DekMwQnhTYWRQTHpKeVRKblQvbGhQZHpjemV2?=
 =?utf-8?B?MjM5ZkFpOExxbXRjUENDREx0RWxHcmZsUUVGRlc1ZmNSeDJjNmYzcnNLc1pU?=
 =?utf-8?B?ZDBleXk3bGttYmpxdVg1RXBsN25xWkV1N3dkZVN2amdpZjIyYmNTeTJzT0JN?=
 =?utf-8?B?UlFsV2VHSG5Ob21FdXE4Z3dyV2F3WjBESW1UcnhFaEZFalVObkpSQmtkNGZ5?=
 =?utf-8?B?R3NzYWZ6N1VHd2hRYVJOK3h3cjJnVmladVpqY0tlaEc4WTluZWNGVHpNcmZo?=
 =?utf-8?B?WGszTW5nTnlwcmNXaXhQSnk2eTNBaXI0RkZ4dHIzQWtNRlErK0tWMkEwdTE4?=
 =?utf-8?B?S2U3M2lqWS9DQ2M0ektKNVo4Vmt6dldIRk92R2dneW5MNTU2VEZoNGRJZDZj?=
 =?utf-8?B?blZEdnp6YTFZRFRMVUdHUVI1Y2wycDNVU0w0dXNBOGZsZnNIaTVkNE9Ha29B?=
 =?utf-8?B?V2RMUU13VE1kbDVZZnF4OVFhaTBvM3pGT2lQQjZ0aEtIbUVNY2FNR0lSY081?=
 =?utf-8?B?NWV3YlRYeVZFQ0IvemNTcjEzdXFYeFNhNUtLcjJYYTAwVjdXZGc0cDhxU21u?=
 =?utf-8?B?QmEzYmFQcTRLSVZVMTVxOW1mUnVWZWo2WGZlRk9FSEpXcTdyaHVXNUtXRTJ6?=
 =?utf-8?B?NFQvT0RySXE5aVlJYkNEbVFzWEZudlgwbE1hM3Bldk04Z25zdXAxb0trYzBa?=
 =?utf-8?B?Qk5RZmdEcHB0RFBYYUJxczU4a0lmazUxVHhMZkNEV2lqVEZuTlVZWlRqTm1F?=
 =?utf-8?B?UFM0YVdWOFoxMVZBcWRjT3E3TEJtSUhKQ3NtN0tMcXJNSkJTVTdVZmN6aTE4?=
 =?utf-8?B?WWp5QmRIc0JqVmxRbWhTMjdWaUdrRG5ONHJEWVpVRG94aFJrdjgyVjFDalpM?=
 =?utf-8?B?TTFXQVRXd2hQcVVXRnVFcG04N1k3SXRUR1BYSFFqd0pMNmJTeFhGM2FxK2RN?=
 =?utf-8?B?UFQvdWJ4VnQzc0VMdXBJSnkrSVIxQTlvR1F3dGpQMXIzWjIrQVk0T2d2Q0RR?=
 =?utf-8?B?V3hjU1FqOFdGMURqQlhKQ3ROTld4MTJwelEvSnVXeEoraGlUdy9aZ1lHanFN?=
 =?utf-8?B?cnNCNmVoaytsV05FYW9PU0kyc0RvSkNlQ1l3RjZyUUl3U0g1MGdPT0xOanV4?=
 =?utf-8?B?V2RtcUVSZjFrSHJmZVpocmhxa2xWMzZmRWt1eHluQ2hNcEhjaEg1ZUVGZUlu?=
 =?utf-8?B?aDZITEdmMmNWbENWWlFhQU82TmV6VUlJZ3BRNm84azRRZUFjT0tEc3RGMkxj?=
 =?utf-8?B?RjNDSDFTWUFudDVxdDZsMkgzR2RnWFMxUkNFd0grMUxhNFNlR0JHdTdyNHdm?=
 =?utf-8?Q?oEdNkHuQ1azc8BP9+rL3qe5zI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67243682-388a-4a0d-35a7-08dcacc87a9f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:40:23.1384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DVI2D6nTnFFLkVhpMUQkONeuTG/QVYUjLc2Meefx+gTYtWp38VxxnL+BQAx46agdPEsJdK3pWF52F+rbANDyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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



On 2024-07-05 21:35, Melissa Wen wrote:
> instead of parsing struct edid.

A more informative commit message will be helpful.

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 45c04de08c65..3fb07f437793 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -97,9 +97,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	const struct drm_edid *drm_edid = aconnector->drm_edid;
>   	struct drm_edid_product_id product_id;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
> -	int sad_count, sadb_count;
> +	int sad_count;
>   	int i = 0;
> -	uint8_t *sadb = NULL;
>   
>   	enum dc_edid_status result = EDID_OK;
>   
> @@ -143,20 +142,12 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   		edid_caps->audio_modes[i].sample_size = sad.byte2;
>   	}
>   
> -	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
>   
> -	if (sadb_count < 0) {
> -		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
> -		sadb_count = 0;
> -	}
> -
> -	if (sadb_count)
> -		edid_caps->speaker_flags = sadb[0];
> +	if (connector->eld[DRM_ELD_SPEAKER])
> +		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	kfree(sadb);
> -
>   	return result;
>   }
>   
