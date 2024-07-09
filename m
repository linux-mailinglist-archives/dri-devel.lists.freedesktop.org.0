Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAC92BDA9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150BE10E58A;
	Tue,  9 Jul 2024 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b2ObV7ay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7BE10E586;
 Tue,  9 Jul 2024 15:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4THc5F7tMXVIGnIlF+7oSqOFF+Y3u1F/6UJBo43NscHjUTawZt5d5orKdMpbP65jgJKjVX6kBSznnYuklsqTi5pb+CvtEYHnfmbMDLTrLCX9A682Bb25YAU1XQUkF93zo5uVx2fPkuqq1XIa+LxDHpPTjijvY5HXU1SVaLKERMEI6sfvocsOy2EBVgcYuTJq0vk401wrzIul9uAXvSl38DdRV+/niuNtFoXLI1kAtt5w9GeyJMZI6L8stUy+utmbaTD4MKXmSU2JB3VRmokxKt9Nk+Vr15J0QIvj4upIkS2v2hWsxDz0KgeiJS+sDjPgB/NZGxR7zBMnWcsVFxKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS5v2OmKnOngCzxECsJ9IKvovI3QQ8pJdEfVYbdHkQQ=;
 b=PiFqe9ZIw7b7zB1aJ+aCL/JlFTKQbFWGYIteeXQ0poxABopbOtrpOp/Nlb9RImCjmipVkQqlKsbOfKrXH/KP5NQUc7Bxg8SckqO4R/Nt1XfZyn7EHHLUyNvwZR7ZXvabPGiYXhOKfpQvQIuUroqyHpqv8JPovm4S08qyieGSxL/phLwUq09J+zatNHu7kz4L3grPv5IS+bYsXRoRQWwzaE9/mC1SZ2rqC4ojtBSi9jU6AUwzbRP/+mFp7feW7wk0xtf/Yt21RDYdSma027zJ780yKbij8cxpq6AI6AEVyeZvAnhhrXXPPMsll+rTqnwn2e0ytwA9AMxVpfu/+wYgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS5v2OmKnOngCzxECsJ9IKvovI3QQ8pJdEfVYbdHkQQ=;
 b=b2ObV7ayNzQbN9gSXBhvPObI0JhKDQzN2m42oyZtA6aqXzdc73wRsbkAW1YDvAAVzoC0d11CoIrQwRVYWwI33FyqU2jlAbBD5dqJ7HcN8u+RCaiK4Hnd8WpmiFXcnRtH684ZzTZBPIOKkRh7KcgUJSNQqwy2JHYTIveY41i95rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Tue, 9 Jul
 2024 15:01:14 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 15:01:14 +0000
Message-ID: <f22c70c9-8102-4ba8-b8e9-6df260110b6b@amd.com>
Date: Tue, 9 Jul 2024 09:01:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: Add otg_master NULL check within
 init_pipe_slice_table_from_context
Content-Language: en-US
To: Ma Ke <make24@iscas.ac.cn>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, daniel.vetter@ffwll.ch, alvin.lee2@amd.com,
 wenjing.liu@amd.com, chaitanya.dhere@amd.com, hamza.mahfooz@amd.com,
 sohaib.nadeem@amd.com, samson.tam@amd.com, Qingqing.Zhuo@amd.com,
 dillon.varone@amd.com, stylon.wang@amd.com, akpm@linux-foundation.org
References: <20240709091012.3123409-1-make24@iscas.ac.cn>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240709091012.3123409-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0454.namprd03.prod.outlook.com
 (2603:10b6:408:139::9) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 418d8a4e-9141-49df-4e30-08dca027fa56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2RYOTFRem4rSjBORkRpZUxNY3dYdXJSN1ZLWkVPM0pOeGxBVkljcVlyRVht?=
 =?utf-8?B?KzZQQjRuRGE3c3U4Rk11WHg4TzcxRGpteUVwdTU1MFRLZURvdFlNQ0RoZUVq?=
 =?utf-8?B?V1ZKTHdjSHRSWTB5VGxIb3M5M0k5K0hONU4rMEp3SWVzZVByWWtmUXFnekMy?=
 =?utf-8?B?TnlISEIvUDd4eFVUVDdzdExBdFFUMXR2RTZydnorUlIxcHZIM1JCQm9RbU5G?=
 =?utf-8?B?bm9UZXNIUlRkNXl3UU9zT1ZXT0R3N2lDNXlZZUszM01ldS9iM3ZlQlZWT01x?=
 =?utf-8?B?eXMxUk5wV3dJYSs2MEFEVmM5SUFyNHE0dXBHSC9TY0dTV3ZwSlhGRVFQL1Yz?=
 =?utf-8?B?UTFnRmp2OWhMbHFPcVJ5RlVWWVkyeEMwZWFxYmF3MjRQV2dXM2NjcE9iKzJN?=
 =?utf-8?B?TkFEVDhKY1pCR0cxb0V1cnJYM3JIYmVmeFdaMmhVN0hjenk4Ym1jdDVyeUxU?=
 =?utf-8?B?L25CUkhnWFlOZEJneGVjVVlzZWhrbitueG9WRTN5NWxCRnZyN1YvNUY1eEdH?=
 =?utf-8?B?M0h3akZNRlFTZjFTZCtKS2JWT2p4VEYxdnoyZ2lTTTNKUWFCMVJtSWZlUXNl?=
 =?utf-8?B?dVFzaGhBYXhsdE04RHpiaHVtZHhQN3hrdWFWSktjNkJGeW12bFhUK2taTDZ3?=
 =?utf-8?B?azRPamJEWjIreGpvTUpTZ2UzdDMyVEVoa2hVUkFKRjUvVjJDaG9ic3B0dGsr?=
 =?utf-8?B?Q1lNRFd0RUp3clhBVzYxd0VXdXEya2hwdXBXSVVnc3BjdXMxNmJuanlPd21W?=
 =?utf-8?B?bFdsUWRIT0tsS0E0d3hxdWovNHhMczlpOEFoS3MraGxGV0M1b0E5aHdNMCtv?=
 =?utf-8?B?WkVmSHl1VE1YeG14Z2RJZUJLZDVOQ3M4TWQvOWRkS1dIRmsyeGdEYXN1MXhT?=
 =?utf-8?B?TzJzQloxVFN5L20rTDI3VlFoZzVERVI5M004ZTlsNnR6eW5kQjJ1RW5VRU5O?=
 =?utf-8?B?M3pEb3dSYWc1b2FTU2h0WWVpMEtPdnJBbUVBVXJnOTNwMXdLdGxQbXhha0xB?=
 =?utf-8?B?Z0pVYkE4RkZUOGp6am9iRms4Q2drRUZ3Q2VPa1RKSFpqTDdBN3NNQndoSUFn?=
 =?utf-8?B?RGdkdzZmb3BGaVpkODhJUVg4cGlQNmNTcjhmR0RZR0RWakk0cGVRSmJVMm9V?=
 =?utf-8?B?RjhsVHVjS3RwZU1wNlhYQTZ2d1poSll5c3lXQ2RMMEM1UCt6ZHBQVEVvMGZX?=
 =?utf-8?B?RGVQczZIdE5OZmJmUXBGbVBBQkh2TVZQaUtWTlM0dVFBSzJOOVFpOE1qdmh6?=
 =?utf-8?B?cWljc0ZnNW1uYTY4VFFreG5MTW8ySHY0S21IM28ySU1BVHBXR0xYeFRvR1Ex?=
 =?utf-8?B?WVBlSmdUZ1ZJbHhpdjVhdlZaVFE3UU9pOCt4bHhnZGhrZm9IR0dJcTNHT0lz?=
 =?utf-8?B?bnNCK0orVGhWckhNQ1ZlL3RLSy9vTGV4VmZ4djQ3NkpWbWpoZGhnM3djRjEx?=
 =?utf-8?B?Q040cXRjM1pBMGN2M3lLSTMwZ2svYVdubGV6aHNuZkJkYW10VHNydmwxN0Fa?=
 =?utf-8?B?MHVRa21PU0wwTUJYVHd6ekJHU3lWUHRSRWtKK2NITEozQVZlaS8ySk5XVDhr?=
 =?utf-8?B?bVhVaWFGc2lsZi9BVk94SUJ1QUVpNEJ5dFBaSkdWQzhTSEdWdkR3TXNOSGpV?=
 =?utf-8?B?OElMajFsMmh5eTRjOGJSbkJFNjlaQ2cvTDBuNWcwaktsZkQrU2YzRVFrZytL?=
 =?utf-8?B?a21CRERtcStteE9GeHRqcEZHZE1mTURMMWpOMFNYOVJrb3dma2t0S1hDRmhX?=
 =?utf-8?B?aGxBRlhDWVBGc1NvWWZWaGdTd2Q2QW9nQVVKdkVMb2kvUzZrd3lQbkI4cDF6?=
 =?utf-8?B?bnU2NkpGWlYzelpGbThkdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVp3c1NBQTZxa1RFTjJKN3ZzTmZrT01uSXZza05tQklpdHcweE1jdHdXL2xF?=
 =?utf-8?B?bUhHZk9VeXdyVVFtYW80L2JWUEpsUFV6bEpoYjJwdXZPVFM2Z2pLME9ka2VC?=
 =?utf-8?B?S3crdVlYbzJOVWcxYVBDaDJvWEc2ZGY0L2J2RktvR0FzMEEwVTRxaW4zQWxv?=
 =?utf-8?B?NXFOTkJxcEdvSm9Pam9kUThIOEJuU3ZVMnZTRlhoaTg1aG9nVXU0M1hSZWdM?=
 =?utf-8?B?SFhxcFY5NzRtUVBqeWxIM1hIbncxOHpUQlpnZkpyWkN1OGdVSEM2dGduM3Fx?=
 =?utf-8?B?Y1lMM2VkTEdHMHREbmcrM1pQaWZ3V2FuQUNGSDd5ZlJPRE84ZEN3MmtYSS9X?=
 =?utf-8?B?UXpSc3pUd1c2MWg1cm92WmVWY1Q0V0hWT2hSNjBOZTliZldScmhYZlMrN2xH?=
 =?utf-8?B?YTZmQTVvN05MOHJnYWc4aUhTM25OUlZDTEorYlNobDFZSWZzcTR2ejlSdkl0?=
 =?utf-8?B?ZTFXUFEvb05pSllPQ2U3MDIyOG4wUzIrODBzQVVtWGVxdkFtQTBwWkhoZmFk?=
 =?utf-8?B?MW8rdVVuVTY0WTdVVVZsM3BKTVBKeHdhb0ZXWmJEaWpZTFd0S3VZZWtRUVhi?=
 =?utf-8?B?dnRDK1BTTmlUSGF3cDlXYURMMG1aTCs0cHo2UXFuQlJwOFlUcXAyelBEa2ZV?=
 =?utf-8?B?TlpkYlBkYVREUFgveDNwcTE1Z2RvdnJtbkk1bFZYQ1FoVnR1Vko1SitLSnI5?=
 =?utf-8?B?NE9RaE9tLzJzWUV5VG5meTJRaWlCWHl5Q2N4M3BWelE4VjhpT21LbHoyb0hq?=
 =?utf-8?B?L2U4VFpwWjE0Q1Rua01rYzREODJWWC9NcHlGU09zUDUzL25UMzdIWmxpSkhJ?=
 =?utf-8?B?NmpBcndBbnk0dlBDSkZtQmN1Z0M5eEhjQm1tamlybzdDYlFmVFdLUWVuTHYz?=
 =?utf-8?B?djBjY1RLM0Z6UU1kbUNCazhHOFZ1V0FpMCtuV3ZyNnEwcjJzRUFNNmtkN3c3?=
 =?utf-8?B?L1VDdFJuQXVLSlUzbFJDTzFuTkJCUXl2Y092ckdUZmt3V0pMb3pobFg5dUVE?=
 =?utf-8?B?REVDOGtpRy9nWkY2NVhUZ0JiRERDMXgzYUt0b1BZU1pnZ1FxWSswTmsyVTdX?=
 =?utf-8?B?dFhPeXhpQ085VlNIdk1YdENXZDJnTkloNzl0VEJDb0lXRjYrVVJaS0JBRlFy?=
 =?utf-8?B?elZPdkxjZ2VzS0FHRzFtZVNhbFpoOUdmY1JJYmVuRlVJaTd4dTFpNkxJYXpV?=
 =?utf-8?B?cHk3QTFkRG4xYVFlZXdxYmRnSnk1OHpQak8xd2VRQU5EblVjZ0h1Y2hqOFlk?=
 =?utf-8?B?ZE1ZV3E4bUU1Si9wSXBmV2k0ZmNXODh6RUpMZUpxVEdUc2Z0M01LTFR6ek80?=
 =?utf-8?B?V0xwZ1pUSTVxQ0dZTjZGT1JQWjJRTGgvL2lCaVZadkNiekxhaDk0Ujd3Y1Iv?=
 =?utf-8?B?RjVNRTFjODRoYzBkRzF4L1JMeTJ0dkVWQW9aQjh3dXpoL3RWYmY0MzIyU0xa?=
 =?utf-8?B?dnBsY24rMVNxZTRYMXRpWmV2QXNNMVFNMDZlWXpqR05Xa3IxUXQyZVlsNFp1?=
 =?utf-8?B?bzJESkFmYkF0amZreE9Ud29XWmxQbVptY1JTRlJOSHRIS21RUmt2cXVuaXlv?=
 =?utf-8?B?MU9yYTJOWHM0RGRqOU5lMWdMd3prZWJBYmdRWXY0Z1k5MHZlRnFZVU93Q3VE?=
 =?utf-8?B?MzBKT29TajkvZWtiOEtxbnlYWHhqdXN4MFdTaHZ4azlVU25UTXhoUGM1bkcz?=
 =?utf-8?B?d1JUMUtSYnVyQW5aaHlUZjI4R05QQk9EUVd2dGxTdkc2Q05EamU2NWpwWlVB?=
 =?utf-8?B?ZWZJeEduMUIxODJzTFl5dEVTaTlaYUFCYzk5NmNCdXU3dFF3YUZCSjJuVE5S?=
 =?utf-8?B?alJpdlZUZ21RL0Q1cWZFOS9CR2g4TEtrcFRKUkFvVlVWWlBnQ3FEd1h2bHhx?=
 =?utf-8?B?SUkvTHdyVWw5RjhKT1Y5M2dyR2w1WVRJTCtIMUdHN0JIVnhlU2JNQlBoc1hl?=
 =?utf-8?B?cmY5N0JtZDl4ZWRKZEh6S0YwdGQ1YnZWRHZENmdEbmV1MGMxSXpISFV2S2VW?=
 =?utf-8?B?QlRyTlhuVzRrNlMxZWFETjJiTk1sV012a2c5cU1jd3krYk9ZbTRQYTRVSU5U?=
 =?utf-8?B?ejV5U2NRWEJucm1ZMVRsVzQxUDRXK0xhNDlVOGMwVDR2Yk1GVDBmTkxDclFV?=
 =?utf-8?Q?Wm6jQg3cjYsa8PX/wngLsFf0Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418d8a4e-9141-49df-4e30-08dca027fa56
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 15:01:14.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wbO7sooz5erZV9S/ZRe7n5opSY4i/Ua50DVOwp/lew5Ri2lRr+dICbJpi0x6rNWeh8kHYa/dLMH6kGt41bjUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
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

On 7/9/24 3:10 AM, Ma Ke wrote:
> To avoid reports of NULL_RETURN warning, we should add
> otg_master NULL check.
> 
> Cc: stable@vger.kernel.org
> Fixes: c51d87202d1f ("drm/amd/display: do not attempt ODM power optimization if minimal transition doesn't exist")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added the recipient's email address, due to the prolonged absence of a
> response from the recipient.
> - added Cc stable.
> ---
>   drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> index f6fe0a64beac..8972598ca77f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> @@ -1177,6 +1177,9 @@ static void init_pipe_slice_table_from_context(
>   		stream = context->streams[i];
>   		otg_master = resource_get_otg_master_for_stream(
>   				&context->res_ctx, stream);
> +		if (!otg_master)
> +			continue;
> +
>   		count = resource_get_odm_slice_count(otg_master);
>   		update_slice_table_for_stream(table, stream, count);
>   

Hi,

Which repository and branch are you using? It looks like this issue is 
already fixed on amd-staging-drm-next.

Thanks
Siqueira


