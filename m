Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72117AEDB82
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7587610E41F;
	Mon, 30 Jun 2025 11:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QlXCJGGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A83910E420
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 11:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fc715L115mzypSHEU+gOCTgZ61qu6F/0zs6rFPtMDDMSAiGplPxKAXT1PsCx0dDDMnFoSDoewS9mN2UV9k4HG/uv9MHMMMt0CQae+JT3Z+61dcRbzBXnwWCo1MonoR3ZBLV6ajtZ/3Gs0sfw908itgfWryrbp3NX7fkXOfJZ9TRLOSRKqWaUFDO7g0GAfjF+8oaIRoUuMeQrBf/LZP4DMhq1CW9h2Hfw+q46DU7M4p4Mo7XjuB2AkASJIQWBWKHR86DzvKpBz+zrFT2Nl7UA/3i0j8pFeMXbf55Mu+DLfwbnlViAcnvUutu+qxihhrhUQ04G8m0dgB88Tz/N/W+URA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvaGFZyJ4VZg5EpREqjoTRxaYDQrvCVU1003mr84vKQ=;
 b=QnfekthtNCZxrHd1KtUgmCOohFi1H0QLYdUdWcnukCynBuC9mBFlE5AW6AM2vMHmpa9f15h98WxqgYxMiKRQ50DU4BAmLKHqF2O9ys0OyDc5GUvTk0v4YJGA/HxXlqAiBW5lxw3MslauhVcaSHOY+TBYend2QL9lUOUZzhaSqeSjIs7IrgmIEtoslFEcr2LHSwRGhI88ex1uQZ0/3uUqV29l0asBPJFIa9/46kUKjfApBURrVEewaa89/F10jRzgJXseVIRCuHTKHbitN4vOFdSe+JvYCgE+EtY5YFZtnwimicFrgUkVek8vW5oChEUKaCwehwKYjOAec/3egjbfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvaGFZyJ4VZg5EpREqjoTRxaYDQrvCVU1003mr84vKQ=;
 b=QlXCJGGXWLkeGjXCLfk4CfGEnuPHxELM0HqnvKk4vgoVRbNY/03qKOgwk7kn30lsko+O9oa54gc7TvI6Kj6y92i6H8Rajma+QKzZATq5Cfl7K5nwaJ2WUjZvsXylk28vOyOvmiUMSALuJ66K2wwWMmgrFB/wXk7aJ4DyxlhDThs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:46:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:46:10 +0000
Message-ID: <e29a3b7c-31b0-406e-b839-999f7884a3c9@amd.com>
Date: Mon, 30 Jun 2025 13:46:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gem: Acquire references on GEM handles for
 framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250630084001.293053-1-tzimmermann@suse.de>
 <9009d89b-91f0-496c-a45d-03d8f0fb7bf6@amd.com>
 <3477130c-8470-43cc-ba97-0ce48bdf025d@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3477130c-8470-43cc-ba97-0ce48bdf025d@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f41dc9-7fcc-4797-1205-08ddb7cbb4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUFyZjUzdmlxMG1xQ2dNWjI5b0pLYUh6VzVYN3JrQUl0V2czdEZWK3hEdHFU?=
 =?utf-8?B?UUQ1SU9UcHpZWVkxdkhsbi9iRXVMU3ZhWk5CUGtlUXk5QkV0Z0RVQXJEMVlH?=
 =?utf-8?B?aXdkeTJUcUJwVXVHb1J2dXFLUFBLcG9Kd25JQzJDRVdvUzZLQk9idXorL0FH?=
 =?utf-8?B?bWYrQ0YvUnlYa2ZESU9jUUdJSEd0VlFLeFlrSFRsZzltdFVhbUMxYmNkc2Vi?=
 =?utf-8?B?eUloTkt0allkT25Ia3l4VllyWFNDZVBoRHluNFJwdGxCM1JrTUwwNFIxTy9q?=
 =?utf-8?B?OC9kU1VrbnhkRXg0OXk3Q292UGpGc0MrdTVESFFtZEVvYkZBRDQyS1RsSndT?=
 =?utf-8?B?Uys3MWIrQ1BvdXFJR2RlQ1NGaFFURzVCM0lnZDVVaDk0THpvMW5qVm4vVUNU?=
 =?utf-8?B?S2R0Y1JZRFFaeUNudjFLb3RBNXZTM1BCdDQ4UEJkaGRhWGVpNFBnQ1Q4b3hN?=
 =?utf-8?B?N2I0T3NyNTBkODQyWGJoVFZrVEM4VWd3cGF6SFhJNTFpeEdEOVc0SlVPTlp5?=
 =?utf-8?B?eVlPNWsxMlZTS2hTNkhPWm1kemZYRzk2a1JJYnVlQWRiV0JrUDJ5L21UTDNO?=
 =?utf-8?B?djdWbms5akh0OWxOUTRuZkVnS1c0UERtNnZ6US9OUklzbFJsc0c5UGZBZmx3?=
 =?utf-8?B?blQxRmZhTm9hbFlPSHM2ZGt2ZFVrL0hJV2FVK2JTR0pvV0s2dkFjN3d2VDgx?=
 =?utf-8?B?YnNOR1A4azdROVdGbUZNSXh0UU5NQS92TTFwREhWbHZoK0Vtdk93L0MrNm1L?=
 =?utf-8?B?elpQZXdQeGMydVRnM09ST0V6MHJJRFlTRkI2aG9JSm9tV3Nsc2J4SElyVTAz?=
 =?utf-8?B?N0NMT2ZkRlNISk51c1c4QlVkVUEwb1VjZE9kY0VwZHhoalJSZ1ZNTzNXbzRH?=
 =?utf-8?B?MUh6VXZCdnA1TkxVWXZXbkRtQTYzc0g4MjlpOUdldi9UcGtRUkQwb1N0Ym5t?=
 =?utf-8?B?TlBuMkk1ZHY2djdsZTN6YXZGb3BCaFlMSmVhRnptYys2OEMwaEZsZHl2ZmRi?=
 =?utf-8?B?WEROeG12RGNJeUErSE9Dc21WY09xVVNpbjk5OUsxM2pJMHFrZ3cxVGE0Vmg1?=
 =?utf-8?B?MUpRSXptSmJWV2NNTTdzdjc3UWRncXkvbWpZNURsK0RicEhQYTdKRE9FT0Jr?=
 =?utf-8?B?ejMycmpOS3RBSVVvZXlkbFgwaENLR0Q3VVk3YjVMYTdGSGo4NWdvdDNzZzRz?=
 =?utf-8?B?Y0JhVWZ0akFNNE5lUHV6dVBWWWVQUnJDM2hZR3h6NElKSlRqYXZSYTM1aXNN?=
 =?utf-8?B?NWFUZVdPMkphb1lMVXl1WnhxT2xRakgvZnV0WU14WXA2WGVvNk1jN1U1c1Ft?=
 =?utf-8?B?SFFTOUYrc2NRbWg4RWt4NFVleGY4THVxS29VdUJBODl5R3FhdkpkdVhzeDVo?=
 =?utf-8?B?ZzlLQnVkY2ZaSXRoYmo0OEE1dThSVWxweDdsYXlLMjBUODMzY1krMHc3MGJH?=
 =?utf-8?B?dWJudEs3NlZTaW42REVkcWdJY1pyL1hvTCt5L013UDhDNFpvTGtaWXpvanNI?=
 =?utf-8?B?QUpMb2RWUjVUNXR5dFZRV0M2UmoxYmErWjRpUjhOL2dHTndOdElwN1hOU3pn?=
 =?utf-8?B?d09Bd3NlREYrajViQXVaQlhhd2d2bFQ5VWNkL3FmYWxTWEpFT1IxeXhNVEdt?=
 =?utf-8?B?bGZSNzE1S2F5ZlIrbWlFekFXSldyY1FkM3pKaFpwWmRkQnZuZHlWMTRxanFq?=
 =?utf-8?B?RDlxdGU2cFFOQWo5Ry9kc09qWE9LNXFuRkRNdklXTGVYNFJSOWdGMndCd1hF?=
 =?utf-8?B?blFlNWMrZ3dOTkZCOXp6Q3N0YU9JWTcyeW9WZTQzVzZwY1hidHNFVmc1YU9P?=
 =?utf-8?Q?I5O0Zxv9rXoamkPp5MdsuX+a8j6VVhPm9rNYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3V1UnRpT2FBZ1hOSWtRM0l1UWRibVpGNGFNZXRCUUpnalpjcTVjTnZKV044?=
 =?utf-8?B?ckZlbU1xN1VrLzllTVM3dXBSU3FPUnhHU0RndVQrb2dDbzVMV3U2eWd6dFVR?=
 =?utf-8?B?dmQ0YVF2MlM1aE03ZjdMZytqTGI3RG9aSGNya2RpVTdnZkRBY1dlTWxHYU43?=
 =?utf-8?B?blhzTVNIUDR0cHV2OFVxQ0RuVjBZMFRMRVMxR2owb01GRWlsNFRwY0Z0dFVz?=
 =?utf-8?B?TkJiNVRxQWdrZDEwVDBYYnFIbWo1ZUZFbkJQL0J5UTBYYzdvby9JTWtvdGpz?=
 =?utf-8?B?U2FGNW1EUjJkYUpNMGlkblJNN3NIYWNGamVvMldOUllBWHJDTldyTU5JMmQ4?=
 =?utf-8?B?cUR2c3hYTVBVc3JZZUtNN3VkdFRVenZSanhXK0dBZXcyT0lTN2V0T3h4WE40?=
 =?utf-8?B?c0ZQK1dBazZiaUtCanJtRUkyZmNpSDhwT29wcFJpUHN6V3BKNndLdkJJMW9T?=
 =?utf-8?B?WDFMb0pSS3FqTkNNQTNYUE9XRXFrZm9SeUtHenZ6blRYdFpYazVaK0h3U2Fn?=
 =?utf-8?B?SmVkQVA2SmFuL1hjSDdmWXk0Z2tJOXBSK1p2RkVyV0dEUmxuTnJ1eHowczk4?=
 =?utf-8?B?eVBac0NRYTJuVkxKSks3d2JxR1F0UTNTYlB3WGpiWmw2dDgxZjJuRTlwS2o2?=
 =?utf-8?B?UE9rTWNJeE15czVQMnN5bE5jUC94Y0oxQmQwOXB0LzJKMGFzSmJpQXV3Tk5q?=
 =?utf-8?B?bWt5VnZMdFlESzd1MmZGS0dGbk5BSFUrQU5XNGRHcTdqemhORTFjVnZXQ2Js?=
 =?utf-8?B?aTdZaGJCa29Qb3NDSlZJQUk5YzhNWVFlcUo0d05oeWFYQXFCcEVRaG90MFBq?=
 =?utf-8?B?THNaN2VvcmptOVhSdjZaTzRCSUI5ZStacWxsamlWblZLYVBDaE9qWWEyWGRJ?=
 =?utf-8?B?cUJlM3AyQ3M4NlRrRDAyTjhadU9xTFFmNW1OTmRqVXVpbWZqN3JrVngrRzhv?=
 =?utf-8?B?c3FRaFVWeDdOa29XcFRjNUM3a3E2MU13Y1VOcHRDZWxJRTBVa0FaYlZpaUI3?=
 =?utf-8?B?TGZIOXBwODFpODVsYnJYZWp2L2h0MmNpK1h4S0NHeHFXUnBCZHdnZndBa2hX?=
 =?utf-8?B?Uk5wM0tUODY3Nnd2UzZMRjZia05NQWNNRzNXMk14b3lWYTZwMFl2VUV3TmVG?=
 =?utf-8?B?MHVRZFZnd2lwN2xFKzVXRzlkRnFMb1dtNU5mMUIvRERJK3ozMGY0R3VRSnVE?=
 =?utf-8?B?ejlkUDBYaUhZZ2RhaXNhSnIvVDlpRXFsMlJYSFU1ZVowbmdUUENESVJRZldD?=
 =?utf-8?B?L09icHNMNjA4ZFgwUExheVoyNmhMcVdQYnArVFJhWjR5eVFheHE2ZU43Unps?=
 =?utf-8?B?NDZzSm05dTh4Q3lRU2E3Mkl3VVYydXB2ZDFoUks3Yk82dGRtVkU1Tzdmb0xs?=
 =?utf-8?B?N1JQd1g3dzJqVVFQam1ZZktKWlgrdnYrdHdjV1MyWjlIU3VrbnJWVlhUWTI3?=
 =?utf-8?B?eFA2eVdtdkx6RzFYMnZNNkRyTDd0UHNpYzNSWTBRb1YydkJkQVlBVUVSL09i?=
 =?utf-8?B?bDVqbkJGQVVqbEczYktSeWdTb0FHeHB1QUlTczVHeG1YZVlic1RUN1A3OUhP?=
 =?utf-8?B?M1JRT1F0U3YwTElsUXJraDhvZitUbDVTOVBtc1Mwbkc3OWhDN2NBWnRhWTZi?=
 =?utf-8?B?bnFtWHZwaTIxYjBWbjYzdVdtdzJxbS9aOS9jd2dWUHF5b2hqV0FPZUtQY0Jt?=
 =?utf-8?B?SlloUGZTeUZ0Q0ZrbTlqNG9yMjlxSXRlU2M5TkRHcTBDM3JCelVweGlnR2lM?=
 =?utf-8?B?c01VSmJad3EySHBSZFpVN0lpSzJUa2tjZkNVZjRFa3B0Q25jSVZML0d4QXdH?=
 =?utf-8?B?UnFMZVF1RldXVk9wQkRycWNpakJTNCt6L1V6ZHN5eUE3SldGSzIvdWU3RHVy?=
 =?utf-8?B?dnhWT3pxdWY0K1dEdzEzMlA2UHRNL24zMEdsYUUxako3TDNBWWRjTW1Bb2My?=
 =?utf-8?B?SVZ3UlZ6UENuY1N2bjFDblU3aGkvb2ZHWmZ0WDUzM0sydkNRWWZWUk40UDE1?=
 =?utf-8?B?UEVLY3YzVjlmYjg0L1VOSlZjaFJiSkl5Um1aY0hZOGt1N0Zxa2FrMzZCb1VN?=
 =?utf-8?B?b3ZacE93VkZ6U3hodXc1UVNBTkNLVHIvd3U0QzJyQ05WUVFsc3pJSmRscEl4?=
 =?utf-8?Q?l1aIXHAsPTcBw63HkyD+UQd4a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f41dc9-7fcc-4797-1205-08ddb7cbb4fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:46:10.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Gbhzp79rSWidgzKG8CsIue0+HoFWWM/IJWOXU+sjZbqmBXNxie4spywjrTynwmI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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

On 30.06.25 13:34, Thomas Zimmermann wrote:
> Hi
> 
> Am 30.06.25 um 10:49 schrieb Christian König:
>> On 30.06.25 10:36, Thomas Zimmermann wrote:
>>> A GEM handle can be released while the GEM buffer object is attached
>>> to a DRM framebuffer. This leads to the release of the dma-buf backing
>>> the buffer object, if any. [1] Trying to use the framebuffer in further
>>> mode-setting operations leads to a segmentation fault. Most easily
>>> happens with driver that use shadow planes for vmap-ing the dma-buf
>>> during a page flip. An example is shown below.
>>>
>>> [  156.791968] ------------[ cut here ]------------
>>> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
>>> [...]
>>> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
>>> [  157.043420] Call Trace:
>>> [  157.045898]  <TASK>
>>> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
>>> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
>>> [  157.065567]  ? dma_buf_vmap+0x224/0x430
>>> [  157.069446]  ? __warn.cold+0x58/0xe4
>>> [  157.073061]  ? dma_buf_vmap+0x224/0x430
>>> [  157.077111]  ? report_bug+0x1dd/0x390
>>> [  157.080842]  ? handle_bug+0x5e/0xa0
>>> [  157.084389]  ? exc_invalid_op+0x14/0x50
>>> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
>>> [  157.092548]  ? dma_buf_vmap+0x224/0x430
>>> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
>>> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
>>> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
>>> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
>>> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
>>> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
>>> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
>>> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
>>> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
>>> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
>>> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
>>> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
>>> [...]
>>> [  157.346424] ---[ end trace 0000000000000000 ]---
>>>
>>> Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
>>> this from happening. The framebuffer's cleanup later puts the handle
>>> references.
>>>
>>> Commit 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object
>>> instance") triggers the segmentation fault easily by using the dma-buf
>>> field more widely. The underlying issue with reference counting has
>>> been present before.
>>>
>>> v2:
>>> - acquire the handle instead of the BO (Christian)
>>> - fix comment style (Christian)
>>> - drop the Fixes tag (Christian)
>>> - rename err_ gotos
>>> - add missing Link tag
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thanks a lot
> 
>>
>> But I strongly suggest to let the different CI systems take a look as well, we already had to much fun with that.
> 
> I can wait a bit longer for reports, but the patch fixes a regression in v6.15. I'd rather see it merged soon-ish.

Yeah, agree. I just want to make sure that we don't have a case where we never create a handle for a BO, but still try to have a FB for it.

I'm pretty sure such cases don't exists any more, but who knows?

Anyway feel free to push it to drm-misc-fixes as soon as possible, just keep it in the back of your mind to keep an eye on it.

Regards,
Christian.

> 
> Best regards
> Thomas
> 
>>
>> Regards,
>> Christian.
>>
>>> Link: https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/drm_gem.c#L241 # [1]
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>   drivers/gpu/drm/drm_gem.c                    | 44 ++++++++++++++++++--
>>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 +++----
>>>   drivers/gpu/drm/drm_internal.h               |  2 +
>>>   3 files changed, 51 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 19d50d254fe6..bc505d938b3e 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -213,6 +213,35 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_private_object_fini);
>>>   +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
>>> +{
>>> +    struct drm_device *dev = obj->dev;
>>> +
>>> +    drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
>>> +
>>> +    if (obj->handle_count++ == 0)
>>> +        drm_gem_object_get(obj);
>>> +}
>>> +
>>> +/**
>>> + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
>>> + * @obj: GEM object
>>> + *
>>> + * Acquires a reference on the GEM buffer object's handle. Required
>>> + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
>>> + * to release the reference.
>>> + */
>>> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
>>> +{
>>> +    struct drm_device *dev = obj->dev;
>>> +
>>> +    guard(mutex)(&dev->object_name_lock);
>>> +
>>> +    drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
>>> +    drm_gem_object_handle_get(obj);
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
>>> +
>>>   /**
>>>    * drm_gem_object_handle_free - release resources bound to userspace handles
>>>    * @obj: GEM object to clean up.
>>> @@ -243,8 +272,14 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>>>       }
>>>   }
>>>   -static void
>>> -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>> +/**
>>> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
>>> + * @obj: GEM object
>>> + *
>>> + * Releases a reference on the GEM buffer object's handle. Possibly releases
>>> + * the GEM buffer object and associated dma-buf objects.
>>> + */
>>> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>   {
>>>       struct drm_device *dev = obj->dev;
>>>       bool final = false;
>>> @@ -269,6 +304,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>>>       if (final)
>>>           drm_gem_object_put(obj);
>>>   }
>>> +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>>>     /*
>>>    * Called at device or object close to release the file's
>>> @@ -390,8 +426,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>       int ret;
>>>         WARN_ON(!mutex_is_locked(&dev->object_name_lock));
>>> -    if (obj->handle_count++ == 0)
>>> -        drm_gem_object_get(obj);
>>> +
>>> +    drm_gem_object_handle_get(obj);
>>>         /*
>>>        * Get the user-visible handle using idr.  Preload and perform
>>> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> index 618ce725cd75..c60d0044d036 100644
>>> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
>>> @@ -100,7 +100,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>>>       unsigned int i;
>>>         for (i = 0; i < fb->format->num_planes; i++)
>>> -        drm_gem_object_put(fb->obj[i]);
>>> +        drm_gem_object_handle_put_unlocked(fb->obj[i]);
>>>         drm_framebuffer_cleanup(fb);
>>>       kfree(fb);
>>> @@ -183,8 +183,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>           if (!objs[i]) {
>>>               drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>>>               ret = -ENOENT;
>>> -            goto err_gem_object_put;
>>> +            goto err_gem_object_handle_put_unlocked;
>>>           }
>>> +        drm_gem_object_handle_get_unlocked(objs[i]);
>>> +        drm_gem_object_put(objs[i]);
>>>             min_size = (height - 1) * mode_cmd->pitches[i]
>>>                + drm_format_info_min_pitch(info, i, width)
>>> @@ -194,22 +196,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>>>               drm_dbg_kms(dev,
>>>                       "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>>>                       objs[i]->size, min_size, i);
>>> -            drm_gem_object_put(objs[i]);
>>> +            drm_gem_object_handle_put_unlocked(objs[i]);
>>>               ret = -EINVAL;
>>> -            goto err_gem_object_put;
>>> +            goto err_gem_object_handle_put_unlocked;
>>>           }
>>>       }
>>>         ret = drm_gem_fb_init(dev, fb, mode_cmd, objs, i, funcs);
>>>       if (ret)
>>> -        goto err_gem_object_put;
>>> +        goto err_gem_object_handle_put_unlocked;
>>>         return 0;
>>>   -err_gem_object_put:
>>> +err_gem_object_handle_put_unlocked:
>>>       while (i > 0) {
>>>           --i;
>>> -        drm_gem_object_put(objs[i]);
>>> +        drm_gem_object_handle_put_unlocked(objs[i]);
>>>       }
>>>       return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>> index 442eb31351dd..f7b414a813ae 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>>>     /* drm_gem.c */
>>>   int drm_gem_init(struct drm_device *dev);
>>> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
>>> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>>>   int drm_gem_handle_create_tail(struct drm_file *file_priv,
>>>                      struct drm_gem_object *obj,
>>>                      u32 *handlep);
> 

