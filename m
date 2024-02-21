Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C070C85E670
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 19:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C406B10E7A3;
	Wed, 21 Feb 2024 18:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4abgZqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B7110E7A3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 18:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChYnwp1x9fk2JfVdLSOduisrnSD68elAPXLBjmL+iZ34qipctle/XWu0imBmpKoQkrIr8FQAHEHwFZ6CeHJTVuwmnuJXmDsW0dUrH7iaqIv48plajUehRtQYNk/IpuWEkDCGEkffNrD5zOEwR1XrFH2b7uXOC39PkHup4Lpb2dnQmWobO/Y0jGlpTINGYXa3TS0KYbUqszP+wI4uk1F1i1Vmab55ai8HGnXb3uvdf/DFdaGFqPl7hhyJNTcJprEQPfOBWHuDl5ohJPAylYg/AqEfnpSczFoS08Xa6vDk4yZ7qUis6e4BQoszLkdPmGfvsD1cW+LAzOKjN3eEmOV4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADos/pVzMtbZX/nW3a5G/xXKc9iHwhK1mcGZvh4gmSU=;
 b=KAkcTlQIhl0o2e1FavjLlSHpqdjUDnTGPT6KEj6BN2cBrAXp7/4QTrBaQrLxGTNZKzZHBs48W1dpXrJW0WHtfxgOgTd2jpmyTnUn4tyspelBRyzFO7QWWEa9abk0uq8d6TrQwS5ujmNqImXwnCReWMSMz1gNi8ievt+lxAo1FqLUEGRt7y//B9PsEa4Th5tRgheFOdVnl9U0irn/Ht8vwgzrYwnOLWHvjSTk0aulWC4mfxrLvbRbR9pC9u0m8rNqKSOSMfmwJBEh3RaJR9UCW4Nyp0PDk9uj1eMqcoBQqcrDRY2FJQih44h3On4Nez1nnOAYeWu/ykQ2uMIaTSyv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADos/pVzMtbZX/nW3a5G/xXKc9iHwhK1mcGZvh4gmSU=;
 b=X4abgZqm4qMIdIMkd3yW9EuF8l4Esug4rRQzbYn/s5wkfEaq8IPsaHNhvF+3wmf8ieLPbg4BtgWyfX1ZFCqeRLxO1y3sV98DgIft/BF0lbt6baC+7NtE/UxYsdY0jVsGEYSbaZKF9akcRPEMWkRREoXPVpRy5Jo7mR2QCToTK3vicp0630uq1Hclaw1rr/sZtKhCpgUGQt58AKt25l/OO2Zo8wHAiOKmc2Dfx92up+bXE7NnMvEvbwphtVdNycSzM6ruhkoMFkvDLuN1t1dNTFpPeB2u0vbYCbPAjna99jfnryaJqKSoDICfLvi/rZUAt2vv6aBubqL8IDhHz7xCTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by DM4PR12MB6423.namprd12.prod.outlook.com (2603:10b6:8:bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.22; Wed, 21 Feb 2024 18:38:24 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 18:38:23 +0000
Message-ID: <31d1599c-e3ba-469d-b4bc-0548ef961247@nvidia.com>
Date: Wed, 21 Feb 2024 10:38:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, contact@emersion.fr,
 david1.zhou@amd.com, ashafer@nvidia.com, jajones@nvidia.com,
 kbrenneman@nvidia.com
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
 <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
From: Erik Kurzinger <ekurzinger@nvidia.com>
In-Reply-To: <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|DM4PR12MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb85402-9d6a-4dcd-864a-08dc330c48fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOcOOpeJMFfHJko77mI9hm9Mrpa+idvcdh3Bb+GmxmpISsj2wZvo8dSOmtP/J2f4cQ+ezoBdAUaGgCwoZu2Q1hIKFhl54blsbTOWmefZ7ADgW9Z8UQvLQQoadqZAtyQFzAhGpLWlxBdXgLQvLFk6g09RGBwIOPMWJg2NMxM/kov8VFWqFHlfeDDZxxvy/o5xWN70TV5wqFVSwbGyJchrBAN96Gbj0iwTfKaBHlb57OkGyMkS2aAMH/D8DsHa0U/UnKYze8nv3C4FcQN29/m7OiAqruHKK5DRveYOsdI+/leZ4AkfJCEpucFMsuzwJQfpaXBUGnEqO7sguXu22bQxLpMooQToGN9Gh2FRJA8zCbOOXfM5BeP89jkoD2W9A051uOzE0yheJr9oTuOnFBbhs8ZN2o+KoJQbqvZIQwNVUFf8SPOpLdYvBfHGqrjC31jHVxhieNpED15dPX9mO85/Z7NbSeWuEE+7EUwtX0GuWtXrJ+TwqI8w8ZUiFknfwov5zTo2hUhn2TCM+2kRwuzmchqChZX6Fs3aOAU0ypv8l8hbLjX8vDr57XSIBV9y1L1u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUw5TWdPVWNXUlUrU1lMZVBEeitsVzhucldyWWREZVdwRU5WdmFqL2JzeVYy?=
 =?utf-8?B?L0pnUVBZVEQ2Zmp1akRwZnErUk5CRTZuRFlyT0ZEMW9xWlZIYXpCVHRsVEFI?=
 =?utf-8?B?RHFFSmRBT3p4d0tQcGZTWU4vbFYveFRaNFM1dUROeGlwTWN4ZkMzUFVCN1Jj?=
 =?utf-8?B?OWhmV3c0YTJKeTA3ajVJV1hTZVlUNVZjUVV2K3p4TTVqMis5MzBra0ZKNmt3?=
 =?utf-8?B?STJIUjBJb3JwU3RMaXJ1YU1ic3BoMkhockllR0hUSG1MTHgrUDhJWmJuOFJy?=
 =?utf-8?B?VU0yY0FwNEtpZkxXc2dFUlVXMHJlTGhnWGtXek5VYld6KzdDUENvQzlDdEU2?=
 =?utf-8?B?R290MDI1QWZ4d3JoMjNJOC90ZWVHTkhGUjVqWHlTallIV1g1VHhPZW5EQlU3?=
 =?utf-8?B?eVJDbmh4MW5wZlpXZVJodGRYYUM1TG91a2ZsY0JiYm1hSUpyL0xPaHdpUXBB?=
 =?utf-8?B?bjJ4MG8vZE5scmhNQmtpOEJjcWZ6cXVleExJN1FFS1J3ZHI1clVKcjFNNW5P?=
 =?utf-8?B?ODFvV0R5RHBPTnRFalRBM093ODBrSTVDRTZzUnV2VkxPWFdkNWk4R0dmTUlh?=
 =?utf-8?B?alczbjNsQ0xJRVNzYURHUlQvTlJIQnZ6cXg2SENya3hQNEs5VmZWS21PeXNx?=
 =?utf-8?B?TnI1dHJKcUFob3dzL215N3BQRkM3cGxLdkJPSG1nTmxqdzI4YWZOVi9kYVRp?=
 =?utf-8?B?aml1dkNPemNCUGkySS9jZlV1cE0zY1pRdHhNSXJvYzZUS2grbGpRdlIzeGlz?=
 =?utf-8?B?b3hZK2dPRE1QY0E0SGplcDg3RTFmdUh5K2tWQ3llSE1USGpGaE9lSHVoMU94?=
 =?utf-8?B?ZVpsNk1iUDk0MzA3dDFMMCtCQ0JRZWY3czkzMWxXeUtiMGZFaTBoNURMckVU?=
 =?utf-8?B?UzF3dmptNVIxaE45U2IzUlprZjJaZlI2UmRUOGh3b0I2cWxTKzVDN0EvZ01y?=
 =?utf-8?B?a2UvYWl3U0YwajNIQVVUZ3BrRmthczNqQ3VsQUxCeW5tNEhuK1ROT0RPT3Ew?=
 =?utf-8?B?b1NBYWtCckszTmp3ZlNSZW9Ea1lZR3BmMzJpa29FMXpIRE1tUUJHT0xRdVcr?=
 =?utf-8?B?Nkh0aGhtVjlzbVFNQ2Vxb1J3SzI4S2RzK3oycVlBbXBGZXBYTWdFU0s0NDls?=
 =?utf-8?B?bXJUMjYxUXZnN3hPOUFYWkpTZjYvM0FIL1RrbEs4dXZzZUVaU05FMkZpajkx?=
 =?utf-8?B?SUg1YXM2ZlRHYU82ODUxd0xvRGhIL0VOYU5oOXhXeW05aUpSSmhtb2REZkZP?=
 =?utf-8?B?OG40WHhjZjR4ZFZHUFhLNVBqTFVWTno5ZUZpTUpxUGl6QTFLQXNxdUNuZmxP?=
 =?utf-8?B?NVRmeG0yUG1oMGYzSjMwTHRGUFZneDNGek9WTUFNbGluYWZCRXZ1Vm1PVDlI?=
 =?utf-8?B?cGxOdGgveHRoZnhLOUlaNkhTVGUvSTBscXdsbTlpQmwyaXFSeWRxVTJHRWMy?=
 =?utf-8?B?bGt6djFKclNzWDlmRlRBelBDN1YvK05xeUh4T0pXd2pVMFBMYnhZQzNhN3BQ?=
 =?utf-8?B?cTFDQlFaR3pPTnFWenhQZ1h5WlVaVi9jbHRJV2lzczNRQmxTdy9NQUlZenQ1?=
 =?utf-8?B?TWQ2eFgyaGxFOGViL1hvMGxkV2prc0hHb3BUd3pPOG5YT2lGbUVXTWkrUVVs?=
 =?utf-8?B?ZXBrNnl6d2VWWkk4SEE4c0h3c080WTRKMlpqNlM1Y3c2SWVaQXJsQkJhNm5k?=
 =?utf-8?B?T0pmY2JyVlJNVVdwOHk0OVNqSGtnaUY3aWpVbUI5MitpQVZOVkVaUTYxcGxH?=
 =?utf-8?B?eEUrcnA5b09PZ2VPK0oyckVmZmNrZ0E3S2hDTGJGQkVIblNPTDc5MUxoTk5H?=
 =?utf-8?B?b1NjMDZEWmh1QU9PdS9PUXRES2FhVDNTazlyWEhjRUVvSDNpcEtpZ0h3QVZq?=
 =?utf-8?B?clBibUp4eXZ4OWQwTktxRmlMVkdFOFduVzdsRDZ3SlZLbjNJNXlCZllHZkJr?=
 =?utf-8?B?MFltUU05Ti94WENzNFdheW5TWkFoQVpPakxuNmR2c1FiZUFFK1BZUHpMZ3BE?=
 =?utf-8?B?U1gwbGplMjl5a3RUeFZUN3RjbzZLOVRoR0hIcWJ3bENMMXgzM1RjaHlZSE11?=
 =?utf-8?B?RU43TndRMFFIOS9rdmJpZzR2YjkveUl0Mm5iSVEwZ08zcE1kZ05xSkJXaTVY?=
 =?utf-8?B?aXp3UGJpaG9LREFRRzRPMzV3eXpNTHlKblNjRGtsRmxBbnhjeXVSbjNuQWd1?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb85402-9d6a-4dcd-864a-08dc330c48fb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 18:38:23.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BKYdnIfXQXNTOBDKmtV0hYC8e6x60D1Tj9iJ5gqXWpvWqRk3PwTElWrrpszaQs9+NS1+zblwZXanvIphDfzyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6423
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

It looks these these patches have still not been merged after one month, is there anything more that needs to be done for this to happen?

On 1/25/24 10:12, Daniel Vetter wrote:
> On Fri, Jan 19, 2024 at 08:32:06AM -0800, Erik Kurzinger wrote:
>> When waiting for a syncobj timeline point whose fence has not yet been
>> submitted with the WAIT_FOR_SUBMIT flag, a callback is registered using
>> drm_syncobj_fence_add_wait and the thread is put to sleep until the
>> timeout expires. If the fence is submitted before then,
>> drm_syncobj_add_point will wake up the sleeping thread immediately which
>> will proceed to wait for the fence to be signaled.
>>
>> However, if the WAIT_AVAILABLE flag is used instead,
>> drm_syncobj_fence_add_wait won't get called, meaning the waiting thread
>> will always sleep for the full timeout duration, even if the fence gets
>> submitted earlier. If it turns out that the fence *has* been submitted
>> by the time it eventually wakes up, it will still indicate to userspace
>> that the wait completed successfully (it won't return -ETIME), but it
>> will have taken much longer than it should have.
>>
>> To fix this, we must call drm_syncobj_fence_add_wait if *either* the
>> WAIT_FOR_SUBMIT flag or the WAIT_AVAILABLE flag is set. The only
>> difference being that with WAIT_FOR_SUBMIT we will also wait for the
>> fence to be signaled after it has been submitted while with
>> WAIT_AVAILABLE we will return immediately.
>>
>> IGT test patch: https://lists.freedesktop.org/archives/igt-dev/2024-January/067537.html
>>
>> v1 -> v2: adjust lockdep_assert_none_held_once condition
>>
>> Fixes: 01d6c3578379 ("drm/syncobj: add support for timeline point wait v8")
>> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> 
> Yeah I think this series catches now all the corner cases I spotted in v1.
> On the series:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>  drivers/gpu/drm/drm_syncobj.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index 94ebc71e5be5..97be8b140599 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1058,7 +1058,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>  	uint64_t *points;
>>  	uint32_t signaled_count, i;
>>  
>> -	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
>> +	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>> +		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
>>  		lockdep_assert_none_held_once();
>>  
>>  	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
>> @@ -1127,7 +1128,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>  	 * fallthough and try a 0 timeout wait!
>>  	 */
>>  
>> -	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
>> +	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>> +		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
>>  		for (i = 0; i < count; ++i)
>>  			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
>>  	}
>> -- 
>> 2.43.0
>>
> 

