Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B168C9B58F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9D10E627;
	Tue,  2 Dec 2025 11:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UF3xwlCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF17110E627;
 Tue,  2 Dec 2025 11:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgoGV9t2q4uBAuGQaFEw6t3cn5hu6Q8Q5Fz4POq4Ce3GbTHXFlTv705pVdWDhP/U/BkMSGvclh5XbPvImDqgXYOR9cH3QioCRNiG7YrDNX2NJBJOca2cCo9HQlRjMX683YsnAagRQ9khMPhDCQU/TfeVmdaA4N+7hBiZF1ywDDT3i0cVHcX445T9F+X6ede01A9GVnVOmv4zKEtRwSFDd+IS/nN3SF8hjo0ZoLgUAYmAyfPu5tXqtzUUEOa6kgl6u7dILy+ChbKWaIUniC0mnOJe2azM2SNYw+0kjmC9R3Obi5PAceodoI1GjxV+fqH+lkcO7nD/UxEKBxmctC3q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ysLCpc3RtK9xXITFGEz9q2pY8VQpk3KSwKWBGf45ss=;
 b=LyNyqyPAvVZ1Ytf5FHhEnNnpyxoT6LKzmQ+FRCntu/7g2lK9FSDMwFw1sMHYfmLInIptvyJVlhtdVWQKbojUJyjUZKfQxsc5dwXagKQpRfDzecJfXzJXGwy7yMQIs8vlLn2EXMwkHt3rwdq/x3EYchKTDDg3yo0eXbtnzOf9AlaRMSvvtgSLL/0oYzfP3RZty8EHi0JLLKNzq/INDQ5vdtkmOnrfYhn47VlGZdyx4xXjl/Kg6am3Vs7eBCi/cOHmBIbFfS+asIYLz99yyekT5PesdTC/liNz7g2YA1KmMkhVxk+9v/PolkDCp94sCQwFUHhf7P0R6rqtPgpdfGdKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ysLCpc3RtK9xXITFGEz9q2pY8VQpk3KSwKWBGf45ss=;
 b=UF3xwlCIbQ7Hg9U+gAIxAmFY5imOYCFIijidGyFvF0wiTHlbsk551ZDQnhCi2Rq3FiDSV21qGuFadtqfFsUG4gw9Ie+DVHl0+PfOFkllVXGR0SJF0dExFmCYhcuOLllYRJdpJB0CXTFgKACydgHD18J0M/T6PLPU93+7v4y2EjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:46:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 11:46:42 +0000
Message-ID: <61749711-329b-4e2a-b89c-73ec6b6fecdc@amd.com>
Date: Tue, 2 Dec 2025 12:46:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] drm/amdgpu: statically assign gart windows to
 ttm entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
 <20251202094738.15614-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251202094738.15614-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: da463639-9d13-44d8-7dce-08de31987687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCt6Mlh0WDl5Q3BwS1k3cE53MFhoMFUxYmJGM0RRSVVSNzRvQ2NOWmdXUFFU?=
 =?utf-8?B?RkpGT2hFL1psQWNNbjZLV1N6WkNFOTNkdERDV1FDOVJCZUxZR2RLcjhDMldR?=
 =?utf-8?B?dis5RjA0R05jNlQzNlN6c2VJUktvNlBrSkxkd2d0MTYvSkRLbWpvT1Ruelpq?=
 =?utf-8?B?eS90MEtBNzg0Ti9HMW5yN2xISkw3TUJYQllNNDZpVTJrRm80YUdpdWVXOFhG?=
 =?utf-8?B?RkZ5MzVxNjd5WDliSlExQm1BMWRWYUlTbVFCc1ROdG5FcExhRkVXOE4vMmpK?=
 =?utf-8?B?REVIZ1lBZitzQnJWSmJ3dHhxaDBEcTdIWG85RkduNVQ4bUpaSzl1VGJPRjh3?=
 =?utf-8?B?NWVzdEJXckxFYUV2cGlxY0szL245VnZlZ0srU1N5WU9ZYnNsZ3U2U2VxT21i?=
 =?utf-8?B?ZjFaRytCM2dzekNLZWxJZ0xGa0grRUtwcmNWNEhtL05ELzdSSzRJdE5kT0Zy?=
 =?utf-8?B?U05nSnhlaVliZXhUQkxJZnlzbFh0WDJRb3Z1Sk85bDUyKytYUUZ0Vkp5L2E5?=
 =?utf-8?B?K0lQUGNwWFlaYzZWOG96QXdvaWVEeDR1cUJnNE9jZTRFTUV6ajRPamR0M3Ru?=
 =?utf-8?B?V2xmUGVFZWxCbS95SFZXbndmSWNic3V1UEtYbi9CTTh1ZU5QaVJxaEkxRFBo?=
 =?utf-8?B?R3hHUVRKQTVlTjNxSklYYXBEd2RRSTNDdXJoTU1rMm83OGNHNmRLbEtRSVVQ?=
 =?utf-8?B?Ym5jS3BxeWt0SmRGc3NwWmVkSjlpa3VabndtU1F0M2VXRldUSHNGSXpBTnFt?=
 =?utf-8?B?SWREK01Hd3NqLzFpb2w2c0VjdTRpQWo3VTVxMmlYNnRPcU1sU2thOTgzaXdY?=
 =?utf-8?B?QU1RVlFPenFMZDVtekhqcmVTMEVaYzVLTGEyVys3NmJHNkh4a0hIck9PRzJr?=
 =?utf-8?B?OHpYVGRYOHo4YUpwYTRvbUVyMDhqMitYVlJOanFSMHRmUTBnZ1dUU2g2SjRj?=
 =?utf-8?B?R2ZjSU01L2dPcDdEUnZNYk9nUmMrRDZmdENyWDBDVEV1ZnJabkl4KzdDVkxS?=
 =?utf-8?B?c0Fub0h4bEFEWVViK2I5cldiUTVYbGJYY0h5c0tEUEZCcU1XSlZaQXVTeUhQ?=
 =?utf-8?B?UThlZVcrT1JVRncyWmdSV0NTTXEwUFQwZTZuYVlyMUZ0cVBvWitHeUI0R3FY?=
 =?utf-8?B?UnJjREhPclF6Tm5GSnFVY0tZeDFrMGpFdy9Uc295Z0pwdHE4Tm1CZWltdDhy?=
 =?utf-8?B?Ti9Nazd2Y3AxNWpHZUJ2ejYzWm14WWsrSklPekNoa1ZvRUg5eUc3VFBhRHdU?=
 =?utf-8?B?dEVkRlRYSlpZR2JUY2c2RXBkc2QwejQvMlhuWFpKWTFVSE5TZWYzOFk5VHZp?=
 =?utf-8?B?enhvL002V2ZyUzZtWW5oRENuRGlrQ1Jxbk45b1pGcUNPeENtT01EODdBbHZI?=
 =?utf-8?B?R2I5dk5YdFdkaDM4OXhoNlpUZXlyVWZCRVAyVGRSYlJ5aUhXYUpTVGdtWmY0?=
 =?utf-8?B?RlBBT2U4VVl0MEJBSUpjcXN0NEoydGRxNnBSUmljcXRoditrcWp6R05nb2Rx?=
 =?utf-8?B?ZmVUK1pIMXM3bE90blhmR2U5M0l3MHV6TE1WY3BKVkg3VFFCZjA1cWd2QWFM?=
 =?utf-8?B?eWh6Z1dkakkySDlKaE1lVDYvV1ZpNEFpa2d0T1FCUHBldkd6QVFLYkxIVlcw?=
 =?utf-8?B?dEp6b0RaQndWcFRVR2ZUcXZEOHRObDcxNnJnbVBCdWNRMWcwTXhMSVNCcEw2?=
 =?utf-8?B?VHhubVd2cUZHbk93N1g2QWkrNzVmOGo3UzdWUWNMUHhtOUF3S1J2R3Z3ZFRR?=
 =?utf-8?B?Qm53eit0eDd5R2F2N3Y4NXVRVGZYY3lNSWVJYWdmRjZEUUxrbXpBVzFvd0FO?=
 =?utf-8?B?amNFOCtUc3JqUTRYRlJ2b0RIWU5HQVBBdjgzaUhwTHNxQ0JmSXREN3lPd0Yy?=
 =?utf-8?B?RFpZM3VjbnRYMlpsMjBLelNIRFd5VElYMXVOZmVhU29MVXBzMXBydVE0QWVn?=
 =?utf-8?Q?uBjD3eFAjji4l1jjs9z1thJjfpo7DCuf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVybnBGQkYzRFhGVnpvbnRaaFFUMUUzaHJBV1BqcDAxakNMU3h3czVseUJC?=
 =?utf-8?B?cmZWbW5EZ1RoTlhla2QxVDhUczNQNlVLeU1KVjlkOHlka2llQXdubzJXcFFZ?=
 =?utf-8?B?S2c3NE81bTZCSzJjVlFoWmdYWm51UEtkUmNTRUFjbjBBcXJhdzJ5WWlHKzY1?=
 =?utf-8?B?OHhwbjIzaGd6aWtKOXdCRkdxSDd2NVArS0NSakxYN0RvNUJzWG01YlhFcUtR?=
 =?utf-8?B?TlY1Y0pzS1dZRjRyUVFjTlVPUXRBemhJREh5UWVEVEYrOG9JMnZ0OUZ4L0l2?=
 =?utf-8?B?UlhnRkw2Z25GSlo5RG04N1BOYUNRcm5sTnpNazJDY1VUZ21WcGgrVkQxVUNR?=
 =?utf-8?B?NDI3VG1DWGllZGZsQWt1UCt4UzhubGF6SzZWajJ0R0xCTXdPY1UxMDBndkdI?=
 =?utf-8?B?RXpGMUtUSXBJWHZOa3dyS0FpekRkNXI1dUlBa1RZeXVaeGpoVVYzK2VIYjBX?=
 =?utf-8?B?eCtOM3RJTExMd2dFalZoeWNWN0h0RmVrWk9va0NKUTE4NXhaditnd3pNYzRn?=
 =?utf-8?B?K3Zlb2xBWklGSnpjUUFMNFdUZkJIREJBVTVVbVNwQTZhdGtJUHVKcTVNZXZM?=
 =?utf-8?B?ekl0N1BhY3k5YVl4Q09pTFdVeWEzSFcwamV5S2hzb3dWZG1mMFZyeDEwRHlJ?=
 =?utf-8?B?ZFJIcHJxUmFyNTJqaFJJK1hVVlRqZ0FDeGdMN2xMUzNxK1piVEZhSk1UalBK?=
 =?utf-8?B?NE4yWXQvTlRPSm1LaVAzVVBIeGw4N2NhK2V3Wk10TnBNRjl6YWUxWlhZYkNE?=
 =?utf-8?B?YzE3UzFkSW5tbzE0d2ZqMjVwQ2g1WWFMSy9QZVpLNDMzSXBiZjdrNkE2cU0y?=
 =?utf-8?B?Y2FDemU2RHlPdE8zRXUvMGFZWWlIWHBwUnFkWmJVMnZCT3BmN3RlYWtoTVk2?=
 =?utf-8?B?TlRjWTA1VHMydllndUJCYTNRTkgwNWpPZGNyWGVCQUFLNDV6OGZDNnErQ0VH?=
 =?utf-8?B?Qk9CS2NmekVZL1FwTEFDQzQ5KzIvSGVQQ3d5TVpaN0tQMmpvYVJkTUtOdVRq?=
 =?utf-8?B?N0RGMnFhcU9UUU9ZUVcvVFZ6dWVDUm1BUi9QY2llMHJCamhTTDNkREppZzM4?=
 =?utf-8?B?VzFCOGtMRGFhMG5XZ2E5Z1daeUFxUUwrNUJLTVFqeW1xUS9aaDdlY2JkMjFl?=
 =?utf-8?B?ZHRTeTFWMzYyYUlzeG9OYVhXV0JUS0RpYVVGVUYreER0dmE0UEN2dGVXa20v?=
 =?utf-8?B?eS9QTXRjdTRzQVVUVU02cHk1eFdqZlFiYUVuMXJZcDJUUk8rcFJFdmJkTEEw?=
 =?utf-8?B?ak9mTjJNejNKZHFvZ3RUTVc2dWtvTVNTeWZoQit2cWV1Z0lXVmZIWUdrVjFx?=
 =?utf-8?B?dTZUNFBsU2lrbWY5bDhEa015WkdXMHhjQUZWME5UTmNEQ1kzWmNtN3MvWUJU?=
 =?utf-8?B?WDVxT01JQXJOSmlVcTJLQlErblEzcFBYdDNVWEdlUjNlUFU3c3IycTlXS1Vl?=
 =?utf-8?B?V1RXVG9VTHowY2x5Vk9PbC9RWHo0Z05wSTdlSlRmNlhDaW5SOU1ER05tVWdK?=
 =?utf-8?B?eEJSVmU2N0JPNUNGb2lnTXNXcVJ2cVUxMEt1eVgzM0QwS2xZL2NjeEY1aW4w?=
 =?utf-8?B?V3NRSVRtRmlITTA1UnZ6ZzBFcmF6L1N6WFNtU3E2Wmcydnc4amtXY1dEbytQ?=
 =?utf-8?B?RFlRVFQyZG1GN1VuWlREeE1DcndZMGhDL1c0RjNUMG4rSmFoOTQzaXIvU20r?=
 =?utf-8?B?N3BvK1dTS3V6cVNQM2RRNjZDY3VHOW41VERCaldkOXA2c2NVOFQ5cTVLMklE?=
 =?utf-8?B?c08xV2NyaGgrQURnOWVBNTJSUDQ5bFo5cXVoNXNXazdJVUhQS0pSRWlpMjdN?=
 =?utf-8?B?TnA0dkRuTUIzV3BXeFdjY2duWlFDSnZHcUhZSHRidzczSVQxa01zRW5JVmxO?=
 =?utf-8?B?S25rVjhySmVYZTVmeThVWmsxdUczdzdkQmxJL1ppb1JYSHIyL0NrcXBrY05k?=
 =?utf-8?B?RkFvMWZ2eTRadXR5Zm8vc2RLNm1Zb095UUYydG04QTROa281WWxDdTM0MHRk?=
 =?utf-8?B?NkdWL1pjTGh0U0VXWGZRNlRuK2JkTno0ckEzMEFtbXYwdkNJcnZXdVNoTVlq?=
 =?utf-8?B?QVZyUENMcGQ3U2Y4TmdITEpkSS9VczNKRWM2OEhuRjNRTzR3SzRGU0hGRG5v?=
 =?utf-8?Q?xGrRxvLRTAl9Ic8nXK2ZIQqGD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da463639-9d13-44d8-7dce-08de31987687
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:46:42.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgT+X/AL1Bv/OWMa4EDS8nH9Kpa89Fon4nDfY3fDFQzcRKbWhr/NI4sCesFy3/1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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

On 12/2/25 10:47, Pierre-Eric Pelloux-Prayer wrote:
> If multiple entities share the same window we must make sure
> that jobs using them are executed sequentially.
> 
> This commit gives separate windows to each entity, so jobs
> from multiple entities could execute in parallel if needed.
> (for now they all use the first sdma engine, so it makes no
> difference yet).
> The entity stores the gart window offsets to centralize the
> "window id" to "window offset" in a single place.
> 
> default_entity doesn't get any windows reserved since there is
> no use for them.
> 
> ---
> v3:
> - renamed gart_window_lock -> lock (Christian)
> - added amdgpu_ttm_buffer_entity_init (Christian)
> - fixed gart_addr in svm_migrate_gart_map (Felix)
> - renamed gart_window_idX -> gart_window_offs[]
> - added amdgpu_compute_gart_address
> v4:
> - u32 -> u64
> - added kerneldoc
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 61 +++++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 19 +++++++-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  9 ++--
>  4 files changed, 69 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 94e07b9ec7b4..0d2784fe0be3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -686,7 +686,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * translation. Avoid this by doing the invalidation from the SDMA
>  	 * itself at least for GART.
>  	 */
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -699,7 +699,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	fence = amdgpu_job_submit(job);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> @@ -707,7 +707,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	return;
>  
>  error_alloc:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index a5048cd8e10d..d3d0419397c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -228,9 +228,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  
>  	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
>  
> -	*addr = adev->gmc.gart_start;
> -	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> -		AMDGPU_GPU_PAGE_SIZE;
> +	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
>  	*addr += offset;
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> @@ -248,7 +246,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  	src_addr += job->ibs[0].gpu_addr;
>  
>  	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
> -	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
> +	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
>  				dst_addr, num_bytes, 0);
>  
> @@ -313,7 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>  	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (src_mm.remaining) {
>  		uint64_t from, to, cur_size, tiling_flags;
>  		uint32_t num_type, data_format, max_com, write_compress_disable;
> @@ -368,7 +366,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		amdgpu_res_next(&dst_mm, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  	*f = fence;
>  	return r;
>  }
> @@ -1500,7 +1498,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	if (r)
>  		goto out;
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
>  	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
>  		src_mm.start;
> @@ -1512,7 +1510,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  				PAGE_SIZE, 0);
>  
>  	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
>  		r = -ETIMEDOUT;
> @@ -1875,6 +1873,27 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
>  	adev->rmmio_remap.bo = NULL;
>  }
>  
> +static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
> +					 int starting_gart_window,
> +					 bool needs_src_gart_window,
> +					 bool needs_dst_gart_window)
> +{
> +	mutex_init(&entity->lock);
> +	if (needs_src_gart_window) {
> +		entity->gart_window_offs[0] =
> +			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> +				AMDGPU_GPU_PAGE_SIZE;
> +		starting_gart_window++;
> +	}
> +	if (needs_dst_gart_window) {
> +		entity->gart_window_offs[1] =
> +			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> +				AMDGPU_GPU_PAGE_SIZE;
> +		starting_gart_window++;
> +	}
> +	return starting_gart_window;
> +}
> +
>  /*
>   * amdgpu_ttm_init - Init the memory management (ttm) as well as various
>   * gtt/vram related fields.
> @@ -1889,8 +1908,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	uint64_t gtt_size;
>  	int r;
>  
> -	mutex_init(&adev->mman.gtt_window_lock);
> -
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
>  	/* No others user of address space so set it to 0 */
>  	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
> @@ -2160,6 +2177,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> +	u32 used_windows;
>  	uint64_t size;
>  	int r;
>  
> @@ -2203,6 +2221,14 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
> +
> +		/* Statically assign GART windows to each entity. */
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
> +							     0, false, false);
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> +							     used_windows, true, true);
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> +							     used_windows, false, true);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2361,6 +2387,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
>  	int r = 0;
> @@ -2371,11 +2398,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  	if (!fence)
>  		return -EINVAL;
>  
> +	entity = &adev->mman.clear_entity;
>  	*fence = dma_fence_get_stub();
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (cursor.remaining) {
>  		struct dma_fence *next = NULL;
>  		u64 size;
> @@ -2388,13 +2416,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity,
> -					  &bo->tbo, bo->tbo.resource, &cursor,
> +		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
>  					  1, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
> +		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
>  					&next, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
> @@ -2406,7 +2433,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		amdgpu_res_next(&cursor, size);
>  	}
>  err:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  
>  	return r;
>  }
> @@ -2431,7 +2458,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (dst.remaining) {
>  		struct dma_fence *next;
>  		uint64_t cur_size, to;
> @@ -2456,7 +2483,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		amdgpu_res_next(&dst, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  	if (f)
>  		*f = dma_fence_get(fence);
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 9288599c9c46..6e04f80b6a75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -29,6 +29,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include "amdgpu_vram_mgr.h"
>  #include "amdgpu_hmm.h"
> +#include "amdgpu_gmc.h"
>  
>  #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
>  #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
> @@ -39,7 +40,7 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
> +#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -54,6 +55,8 @@ struct amdgpu_gtt_mgr {
>  
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
> +	struct mutex		lock;
> +	u64			gart_window_offs[2];
>  };
>  
>  struct amdgpu_mman {
> @@ -69,6 +72,7 @@ struct amdgpu_mman {
>  
>  	struct mutex				gtt_window_lock;
>  
> +	/* @default_entity: for workarounds, has no gart windows */
>  	struct amdgpu_ttm_buffer_entity default_entity;
>  	struct amdgpu_ttm_buffer_entity clear_entity;
>  	struct amdgpu_ttm_buffer_entity move_entity;
> @@ -199,6 +203,19 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
>  }
>  #endif
>  
> +/**
> + * amdgpu_compute_gart_address() - Returns GART address of an entity's window
> + * @gmc: The &struct amdgpu_gmc instance to use
> + * @entity: The &struct amdgpu_ttm_buffer_entity owning the GART window
> + * @index: The window to use (must be 0 or 1)
> + */
> +static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
> +					      struct amdgpu_ttm_buffer_entity *entity,
> +					      int index)
> +{
> +	return gmc->gart_start + entity->gart_window_offs[index];
> +}
> +
>  void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
>  int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
>  			      uint64_t *user_addr);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 9c76f1ba0e55..0cc1d2b35026 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -59,8 +59,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>  	void *cpu_addr;
>  	int r;
>  
> -	/* use gart window 0 */
> -	*gart_addr = adev->gmc.gart_start;
> +	*gart_addr = amdgpu_compute_gart_address(&adev->gmc, entity, 0);
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = npages * 8;
> @@ -116,7 +115,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>   * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
>   * the last sdma finish fence which is returned to check copy memory is done.
>   *
> - * Context: Process context, takes and releases gtt_window_lock
> + * Context: Process context
>   *
>   * Return:
>   * 0 - OK, otherwise error code
> @@ -138,7 +137,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  
>  	entity = &adev->mman.move_entity;
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  
>  	while (npages) {
>  		size = min(GTT_MAX_PAGES, npages);
> @@ -175,7 +174,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  	}
>  
>  out_unlock:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  
>  	return r;
>  }

