Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7297B7E32C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A870410E046;
	Wed, 17 Sep 2025 01:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dg54XbrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C323D10E046;
 Wed, 17 Sep 2025 01:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC27AaiVL2X2XMclUDTsB1164bIiXjIhunHS4orvqfWN+Qr8hluJwloQ2lnK1WKvAUIYrAWh6kH7Q3vmY4pIluD61vL6TklNjUXufVpFITZhCv+q0evGC36ComIwP+8IHISNCam/zbJRwrpac3v0qy5NhTzaX/nD/Mw0odWUSU1e1F+NGnfD25wZMoBtW8J1vy1OEteWcy+Er3pjGz6xSd1SdxP8D8oXgvW2cYJobn+nEc9y39Ym2gVlSaRYJPCrmyYahp8lYd1lThwY6InUGqnjlGGJrKjNzyjFqczL2NWZY0wmFfnSyVUaa9sylgxUmkGoRxw0bqM8HXeSYj8t8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhiEwQZ6vqTrtIjPvHLtTPaKFkeiquAtnvYS2hTBLno=;
 b=Hnx4iiK2QB62WFieCOQSspWJvgbFNHiyu15D9IIavpM9OmUhQDkvcT+N/LUwXqx/3i2Et2jyiZX6HHHzVwHplkRnCY7ygcMjpb9O+G5dxSphUTS9b7NuVvsksCQGEHGbOw5PevUfM5FWgXZe+V59oUCBmzqvYmbv0iFvreY1+GKqbYKpePS0YGxueTwmxky7jbROjsa+bcoVpA8XUxMaO1aZA31FKdXSUo07GuUOHrBjs1sMOXr9Gp2fhZeT3+5352v953qtnJJ9Th2Vr17MiOARuTso1uTmvEqyelkBZd/ERoiB6eNI25g1R6NhMFsIRJ0/9h4yAxjOF3pxayf1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhiEwQZ6vqTrtIjPvHLtTPaKFkeiquAtnvYS2hTBLno=;
 b=dg54XbrHe06xzou96F38rRDLlTnn3E0BX4L2/EfbfD8nv/v1/18Zf2N3UzkVYdIhB1ruAcXZgKTWgY2ZJiFfbiy2rfr74/5ZdpRW92nHHoN/Ds4MN956sOxy3o/5QlSuO62nG9S9df7/HbSsv/xS/b6rpCdCM1d5oKHvIth6Lcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 01:55:02 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 01:55:02 +0000
Message-ID: <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
Date: Tue, 16 Sep 2025 19:54:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 14/47] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 harry.wentland@amd.com
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-15-alex.hung@amd.com>
 <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe00997-cea5-4157-abfa-08ddf58d3719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEs1eFIrWFpIV29lMGJjN3NETit4bGtoMDZVTFBxSi9kUHBXcUlZNGJyVXRR?=
 =?utf-8?B?MExIQUtOUDZxaFBqUEx0WHlESnpaRWZSUkwxUVBuazJPazlVMTZDMVBBVE1H?=
 =?utf-8?B?QmRBZmtLUFZvV1Q4TERoN05HZUhtdzRYZzNOME4wVGV2dlIzTmZxV0IvTVJi?=
 =?utf-8?B?VXZWcmphZWpmanNSZXoreWlValJkQWZXSkQ0aEh4dkZLRlVON1Bjb1ZFYUtz?=
 =?utf-8?B?MzBBaFIvL0hQaDJ3bmlSZCs0KzFab1FLblVGZmF4dWZFcEtwRlhWQzlZbGhL?=
 =?utf-8?B?ZkI4L1ZYd1pmMlZtVEdISklIaFJKMVpuSy9nemp2VFlpS0tvZlFGNUYweHVh?=
 =?utf-8?B?bW5oMUdCeFZCZHAzbW14T1QyME5iRTZhd3daSnc3VDBSUjNKVzkxS01TS1c3?=
 =?utf-8?B?bmlDNE9Ec0t3UkE5VTE4RWR3b0RYZjcwcFhSakNhSEZyS1Fvcm1YZmF1VFd1?=
 =?utf-8?B?R3JnM21ucis5ZlJJS0Y4TGRHRTlPWUhiTkJGdWl4RGpUY2dvTVFHN2RxWnpB?=
 =?utf-8?B?cXduTDlqVEpaYlRmT1BFbytqVGw5T3B5czk0SHZlb3RtRzJPU0ovTXdyNkcy?=
 =?utf-8?B?akEyS055aVg1VU9Qc2VXOFF0M1hiUnRibkwwWEpnUmtKa054Q0kxamhQTDZx?=
 =?utf-8?B?U2pRWWRUVi80cWVCT1R5c1JrN21sZnJkMW5jb1g4NlI2WjBvdXZCZDA0eXF1?=
 =?utf-8?B?c1Nvc29aU1U5Zyt2QlR6NnhRbWR3WnVPbHYyWmhzSDRWTExEUGkyTTZQRE1W?=
 =?utf-8?B?UUxOaHJiT3FvQzJuL1RoWGVhaG9CS2ovYW45OUJGbW9Pb1lLWHdIOGViV2hE?=
 =?utf-8?B?b2hmTUhYTU0vNmx2OVRESXIydm9HM0Q0OHBJZDAybXJvWlJIWmhqVHlQbVFP?=
 =?utf-8?B?QVVLK1hiY0ZNbHlMRHpndHdUbVhMMHAwQkRsbzZEbTk0TnpsSmtKTVNZZW1k?=
 =?utf-8?B?S2ZhdnlNVjBubGQwbG9wZWJlN0FhQzNKSEIyZ1FKc0pzeDVQRURwZlREM1NE?=
 =?utf-8?B?RW90M2YwRXhBeFlxOHM4TlljbjBLaHR3Z080VGJHWEFPaW9TVTBTNHpzZXVW?=
 =?utf-8?B?K0t2QzVXblBnMGhEOVBZRGlVem5NamxFR3FheDBWUklBSURBT3IxcVBaT3JT?=
 =?utf-8?B?c1RuK0pJWjFsV3c0NjhZdnpWUmQxZGo1RE5RSXp5bjBQQ3ludFlXWFBjcTJN?=
 =?utf-8?B?emtlS3BvNEhpRFlDdy8zZnNSZkRwbEcrY2hsUVlPajBQTEJlUTNpMHNramQ0?=
 =?utf-8?B?Ny9NMWhCTWJWUjZvTnRINVc4OFB2MmUvQWFiVkg4Q01MS0FSOFgyU2RGODdS?=
 =?utf-8?B?WXlXZTNtQjZNNE1sQlRaK05neWE3bWpjcHNaNDRhcDNVcWkwMEhIMWsxak1x?=
 =?utf-8?B?UjNDTGMwTGZPdXJOUnF2TG9TWXRUdHRzYTVsVXhORmFvOGRzRWRVRmlkd2xu?=
 =?utf-8?B?KzY2UEZHRVBTQm5iTG9wSm5Mazg3WmFZY0d6NERtY2Z1aFJYQlpoWmtmSjRm?=
 =?utf-8?B?YWRSRHMrNWk3ZzBxNktnNHRGK2ZuVlFzK3FyYU9TY0FSZkR6K3NTWnNmY0Nl?=
 =?utf-8?B?azQ5eXduT3VMcXl0QmRJSkhtYk5nWVc3SHgyYzRqa3JUK1d3SkVYTGNzVG9B?=
 =?utf-8?B?SmVJenJGb0FSc0FOL0x2Mm9vaXpHU1hoNWtONEdNQXQ5RGFwYWc0TkRqd2VI?=
 =?utf-8?B?Nlp2SzRIRGRRTkZSeTllZnlseE9GZ3Ryb3NpeXpKVFJLUEpXb0tjQ1VzK21D?=
 =?utf-8?B?VGxhS0kraW1LaWNnR3pkT05INXIxbDNML1FXd1M3WG1SWHFRM3RTT1Z2VlpH?=
 =?utf-8?Q?6VWb5I9OH/0+ugJ7Nce+GciK8ZCiWIbBc7QmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNidjU4T081MEpObVBCL1drYzJueVRoMSt5eTU0cGFtWUU4QXI1c3VRbUIv?=
 =?utf-8?B?MXFiZzFONDhHdm84SjJpcWlqVlNwY0w5R3hBVG5yTmw5blNXdTVPSWFuVHRt?=
 =?utf-8?B?a3JCYWY2UjE3SFBTNjZKTWgzaG9jRXEzQ21PZW5pQnlWRHExVnhtYWtUenBv?=
 =?utf-8?B?enJRRW40cnhMNVFSaXB4V1l6RWUrMmZ3ZWVnTUNIU3FrTjZlNnJGSUZ5aGhO?=
 =?utf-8?B?UHRnRUI4cEJiNHhsR3pTaWNXRmtMQiszUlNaY2VCU3Y1SlNPYzQyRE5UNDc1?=
 =?utf-8?B?K0NVa2FDeEJoWEkvc0xIUkt3MVVpYkNSUzlJcWFmL1hXK2JmK2NUZGdKUlor?=
 =?utf-8?B?Z2l3K3JVUVZ6Ym5KSjhtaEVhZDRjZU1jdHE0WFIxRFdZUmg4S2JHRkgrNmNj?=
 =?utf-8?B?UFdQK3hmcXJGWTJ5OGFVZWgzTkw5ZUxyQ0REYUQ5d2FlOWxUMlBFVHJZeW0x?=
 =?utf-8?B?ZHNBaGgvcVV4TTZMenBUK2Z6ZWUva2QxZ2duMEpiZkNtemJCTzN2aFpIc1V5?=
 =?utf-8?B?NU9XUGs4SE9zZ0psYk00WDhFYW0ydXhMZUdFWHlPbTVJcFY4TTdXa1R6eGFp?=
 =?utf-8?B?OXowd1N2czJ4VzIzS3R0ZmxUdmxzSmxpQXZhdWhnck1NaGwyREJBN1NjZ1ZR?=
 =?utf-8?B?SkVvQ0EvZ1JCdm5kc0xYNnVNWjJGTWJ3OVJQdFJTbGtwZGc3akFwQ01leW9m?=
 =?utf-8?B?SjFtKzBqNVJoS2RsOFFiVWdpRTc5bWNJLzZVZ282UmY2RWt2MFJwcmtFQ0lB?=
 =?utf-8?B?d3YzenVCaisxNGhKVmJ3MTd0UEt2SnFrSm13U1hpQ1BxVEhyVWNEaFdaZ25Q?=
 =?utf-8?B?ZVJzbFppdUJHMFpXM1I4cDV4eThIMGFzc1NGWE9BVmhVcGs3Vkw0LzI1K2U1?=
 =?utf-8?B?RlpwZm9JenNGNXVYRGpFczM1SDdzK0dSL2pCNG5yWnM3Q2M2Q2ZMbk5PbGE1?=
 =?utf-8?B?UjlhUWN4Nm4zUU9maGdabEFxWVIva2xDajBmam5nRkcwYUVpRGw0TzNYbWpl?=
 =?utf-8?B?cDBhdWExQnhPZ3pwSzJHUGY2VktZYlZQOTZmQWNxbTZ6Zk9nZWJleGN6SmZa?=
 =?utf-8?B?aFE1VFQ3aUpuTklJWjFIUjFMRHFmSXEvRllzdFZyazNQQ2R2VzFaaVhuekpp?=
 =?utf-8?B?c0Rwek9BVG4rZU1qQVRrTGNvR1hlVDM0UlA2TTI4K1g2bkIwaTRESXlyRkha?=
 =?utf-8?B?ekJJY21LTzdEKzRJZi83a1FaV0l5RnI5MnlmNzgzZGZsZ29DdFBLTUl2YU1W?=
 =?utf-8?B?NW1sTDl4YjZBazd0SU1RNzV3bHhPNUU4WlAySGVhUXE2d2xpdldBQlhHQSsx?=
 =?utf-8?B?SEFYMVFKKzlKT2JDOG9mTG84Y3N6dEVwNjB3ZldvNEcyaEN0a0E2ZW5HRUw0?=
 =?utf-8?B?QlhUY3hPWmZBYjhvOFk3Y1NpZ0w3UEtVK014YXFKYjhWU1RFQVpSdlYvY2Js?=
 =?utf-8?B?NmZUOWJXRE5NWE1hVDVXMlduZUROZmtVMTlTZUhnS1RRWndSeGxTYU9WaER0?=
 =?utf-8?B?amlobWlOa25QQ1U2ZTljSkNTT1NFRmRnRnRvU1loeXBQZHpLT3BzSThDMXR6?=
 =?utf-8?B?VHVVV0RyUGp5R1RWT25lK3ZEYU02MEY4ZHhhMGNYdms1U2Q1SzJmTFp3THVG?=
 =?utf-8?B?b29hU09EYmxLaFd1QkRyaUNGY0U3aFIvVVFiQTdMWXR6cG5EM1RaWUE3bEQz?=
 =?utf-8?B?Q3ZROGNjSnBhbkJzT0JWc1JhUzVmMEZFRHk5RldmM0NLaDQ4TDRxdzVWYmhn?=
 =?utf-8?B?R3l4cHRwNExsQ0Nvd3ZhRFgwdFduUEJ6TGE2S2hFajdTZFdydlBLSjdlZWNG?=
 =?utf-8?B?T2RDdGZ3dmE5bzlBZU5MQ09pVGh2OE5vYkZpZmp0dmlOSUpOamlxZEt1STFW?=
 =?utf-8?B?cUQ2Y3RDdDdJOHVyS0orWTByMFoxOVFaZmhVY1U2V2FVSkxzZ0cvS1pibTZu?=
 =?utf-8?B?ZmRpNVZGenJsTDE1Y2hYRWpOM08rVk4zcUN6ZmEzeURLRU9DVkhGdFZ5Lzk5?=
 =?utf-8?B?c1k3TkJOOUZ2eTNsU2h2VExSaFhmcE1vU293THh4cENGTTBrT202U1dFM1o5?=
 =?utf-8?B?aVRQTzFkTldybi9NeHdMYVVuL3MyUlM3RUFpN2xzWjRjZDZwTklwSjdoSXd5?=
 =?utf-8?Q?pgjTFxpHbp2jgbMAxUTijqy93?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe00997-cea5-4157-abfa-08ddf58d3719
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 01:55:02.3696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJI/odMn3+0nC0UPanxKsk6B6T4xoJPBjpIU7ehG6nJIVq7RvQKVnnnNL2s/qLMrFf8nYE6yqt7HndHw66nojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251
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



On 9/5/25 11:12, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This patch introduces a VKMS color pipeline that includes two
>> drm_colorops for named transfer functions. For now the only ones
>> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
>> We will expand this in the future but I don't want to do so
>> without accompanying IGT tests.
>>
>> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
>> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
>> generated with 256 entries each as IGT is currently testing
>> only 8 bpc surfaces. We will likely need higher precision
>> but I'm reluctant to make that change without clear indication
>> that we need it. We'll revisit and, if necessary, regenerate
>> the LUTs when we have IGT tests for higher precision buffers.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> ---
>> v11:
>>   - Update drm_colorop_pipeline_destroy from plane to dev (Nícolas Prado)
>>   - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test robot)
>>
>> v9:
>>   - Replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)
>>   - Update function names by _plane_ (Chaitanya Kumar Borah)
>>
>> v8:
>>   - Replace DRM_ERROR by drm_err (Louis Chauvet)
>>   - Replace DRM_WARN_ONCE by drm_WARN_ONCE (Louis Chauvet)
>>   - Fix conflicts with upstream VKMS (Louis Chauvet)
>>   - Add comments for drm_color_lut linear_array (Louis Chauvet)
>>
>> v7:
>>   - Fix checkpatch warnings (Louis Chauvet)
>>    - Change kzalloc(sizeof(struct drm_colorop) ...) to 
>> kzalloc(sizeof(*ops[i]) ...)
>>    - Remove if (ops[i]) before kfree(ops[i])
>>    - Fix styles by adding and removing spaces (new lines, tabs and so on)
>>
>> v6:
>>   - drop 'len' var (Louis Chauvet)
>>   - cleanup if colorop alloc or init fails (Louis Chauvet)
>>   - switch loop in pre_blend_transform (Louis Chauvet)
>>   - drop extraneous if (colorop) inside while (colorop) (Louis Chauvet)
>>
>> v5:
>>   - Squash with "Pull apply_colorop out of pre_blend_color_transform"
>>     (Sebastian)
>>   - Fix warnings
>>   - Fix include
>>   - Drop TODOs
>>
>> v4:
>>   - Drop _tf_ from color_pipeline init function
>>   - Pass supported TFs into colorop init
>>   - Create bypass pipeline in DRM helper (Pekka)
>>
>> v2:
>>   - Add commit description
>>   - Fix sRGB EOTF LUT definition
>>   - Add linear and sRGB inverse EOTF LUTs
>>
>>   drivers/gpu/drm/vkms/Makefile        |   4 +-
>>   drivers/gpu/drm/vkms/vkms_colorop.c  |  81 +++
>>   drivers/gpu/drm/vkms/vkms_composer.c |  51 +-
>>   drivers/gpu/drm/vkms/vkms_drv.h      |   3 +
>>   drivers/gpu/drm/vkms/vkms_luts.c     | 811 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>>   drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>>   7 files changed, 962 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>
>> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/ 
>> Makefile
>> index d657865e573f..0b8936674f69 100644
>> --- a/drivers/gpu/drm/vkms/Makefile
>> +++ b/drivers/gpu/drm/vkms/Makefile
>> @@ -8,7 +8,9 @@ vkms-y := \
>>       vkms_composer.o \
>>       vkms_writeback.o \
>>       vkms_connector.o \
>> -    vkms_config.o
>> +    vkms_config.o \
>> +    vkms_colorop.o \
>> +    vkms_luts.o
>>   obj-$(CONFIG_DRM_VKMS) += vkms.o
>>   obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/ 
>> vkms/vkms_colorop.c
>> new file mode 100644
>> index 000000000000..f955ffb0ac84
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -0,0 +1,81 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <linux/slab.h>
>> +#include <drm/drm_colorop.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_property.h>
>> +#include <drm/drm_plane.h>
>> +
>> +#include "vkms_drv.h"
>> +
>> +static const u64 supported_tfs =
>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>> +
>> +#define MAX_COLOR_PIPELINE_OPS 2
>> +
>> +static int vkms_initialize_color_pipeline(struct drm_plane *plane, 
>> struct drm_prop_enum_list *list)
>> +{
>> +    struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>> +    struct drm_device *dev = plane->dev;
>> +    int ret;
>> +    int i = 0;
>> +
>> +    memset(ops, 0, sizeof(ops));
>> +
>> +    /* 1st op: 1d curve */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>> supported_tfs);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    list->type = ops[i]->base.id;
>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]- 
>> >base.id);
>> +
>> +    i++;
>> +
>> +    /* 2nd op: 1d curve */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>> supported_tfs);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>> +
>> +    return 0;
>> +
>> +cleanup:
>> +    drm_colorop_pipeline_destroy(dev);
> 
> If it take a device, it means that it deletes everything, which is not 
> what I would expect here: you are curently allocating a specific plane 
> pipeline, and deleting all colorop for other planes because of one 
> failure is counterintuitive.
> In this situation I would expect either:
> - error propagation to vkms_create or vkms_output_init (it is already 
> the case) and "device-wide" cleanup in vkms_create/vkms_output_init;
> - "local" cleanup (i.e only this specific pipeline)

Hi Louis,

Does it make sense to make drm_colorop_pipeline_destroy(drm_plane), i.e. 
in PATCH 13 as in previously V10?

and then drm_colorop_pipeline_destroy should limit to the pipeline in a 
drm_plane and should do something like

   drm_colorop_cleanup(colorop);
   free(colorop)
   drm_plane->colorop = NULL;

We can have same behaviours accross device drivers like amdgpu too.

Hi Simon and Nicolas,

Do you have comments on above proposal?

> 
> If you go for the route "error propagation", you can also create drmm_ 
> variants of drm_plane_colorop_*_init to automagically call 
> drm_colorop_cleanup on device removal (+ it will allow using 
> drmm_kzalloc to also free ops[i] automatically and partially solve)
> 
>> +
>> +    return ret;
>> +}
>> +
>> +int vkms_initialize_colorops(struct drm_plane *plane)
>> +{
>> +    struct drm_prop_enum_list pipeline;
>> +    int ret;
>> +
>> +    /* Add color pipeline */
>> +    ret = vkms_initialize_color_pipeline(plane, &pipeline);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Create COLOR_PIPELINE property and attach */
>> +    ret = drm_plane_create_color_pipeline_property(plane, &pipeline, 1);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/ 
>> vkms/vkms_composer.c
>> index a375f4a65acf..2b9838ef23d3 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -14,6 +14,7 @@
>>   #include "vkms_composer.h"
>>   #include "vkms_drv.h"
>> +#include "vkms_luts.h"
>>   static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>> @@ -136,6 +137,54 @@ static void apply_lut(const struct 
>> vkms_crtc_state *crtc_state, struct line_buff
>>       }
>>   }
>> +static void apply_colorop(struct pixel_argb_u16 *pixel, struct 
>> drm_colorop *colorop)
>> +{
>> +    struct drm_colorop_state *colorop_state = colorop->state;
>> +    struct drm_device *dev = colorop->dev;
>> +
>> +    if (colorop->type == DRM_COLOROP_1D_CURVE) {
>> +        switch (colorop_state->curve_1d_type) {
>> +        case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
>> +            pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, 
>> pixel->r, LUT_RED);
>> +            pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, 
>> pixel->g, LUT_GREEN);
>> +            pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, 
>> pixel->b, LUT_BLUE);
>> +            break;
>> +        case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>> +            pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel- 
>> >r, LUT_RED);
>> +            pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel- 
>> >g, LUT_GREEN);
>> +            pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel- 
>> >b, LUT_BLUE);
>> +            break;
>> +        default:
>> +            drm_WARN_ONCE(dev, true,
>> +                      "unknown colorop 1D curve type %d\n",
>> +                      colorop_state->curve_1d_type);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static void pre_blend_color_transform(const struct vkms_plane_state 
>> *plane_state,
>> +                      struct line_buffer *output_buffer)
>> +{
>> +    for (size_t x = 0; x < output_buffer->n_pixels; x++) {
>> +        struct drm_colorop *colorop = plane_state- 
>> >base.base.color_pipeline;
>> +
>> +        while (colorop) {
>> +            struct drm_colorop_state *colorop_state;
>> +
>> +            colorop_state = colorop->state;
>> +
>> +            if (!colorop_state)
>> +                return;
>> +
>> +            if (!colorop_state->bypass)
>> +                apply_colorop(&output_buffer->pixels[x], colorop);
>> +
>> +            colorop = colorop->next;
>> +        }
>> +    }
>> +}
>> +
>>   /**
>>    * direction_for_rotation() - Get the correct reading direction for 
>> a given rotation
>>    *
>> @@ -351,7 +400,7 @@ static void blend_line(struct vkms_plane_state 
>> *current_plane, int y,
>>        */
>>       current_plane->pixel_read_line(current_plane, src_x_start, 
>> src_y_start, direction,
>>                          pixel_count, &stage_buffer- 
>> >pixels[dst_x_start]);
>> -
>> +    pre_blend_color_transform(current_plane, stage_buffer);
>>       pre_mul_alpha_blend(stage_buffer, output_buffer,
>>                   dst_x_start, pixel_count);
>>   }
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/ 
>> vkms_drv.h
>> index 8013c31efe3b..30941714cd0f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -300,4 +300,7 @@ void vkms_writeback_row(struct vkms_writeback_job 
>> *wb, const struct line_buffer
>>   /* Writeback */
>>   int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, 
>> struct vkms_output *vkms_out);
>> +/* Colorops */
>> +int vkms_initialize_colorops(struct drm_plane *plane);
>> +
>>   #endif /* _VKMS_DRV_H_ */
>> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/ 
>> vkms_luts.c
>> new file mode 100644
>> index 000000000000..82cb792f10d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
>> @@ -0,0 +1,811 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <drm/drm_mode.h>
>> +
>> +#include "vkms_drv.h"
>> +#include "vkms_luts.h"
>> +
>> +/*
>> + * These luts were generated with a LUT generated based on
>> + * skia's transfer function code. The LUT generator can be
>> + * found at
>> + * https://gitlab.freedesktop.org/hwentland/lutgen
>> + */
>> +
>> +static struct drm_color_lut linear_array[LUT_SIZE] = {
>> +    { 0x0, 0x0, 0x0, 0 },
>> +    { 0x101, 0x101, 0x101, 0 },
>> +    { 0x202, 0x202, 0x202, 0 },
>> +    { 0x303, 0x303, 0x303, 0 },
>> +    { 0x404, 0x404, 0x404, 0 },
>> +    { 0x505, 0x505, 0x505, 0 },
>> +    { 0x606, 0x606, 0x606, 0 },
>> +    { 0x707, 0x707, 0x707, 0 },
>> +    { 0x808, 0x808, 0x808, 0 },
>> +    { 0x909, 0x909, 0x909, 0 },
>> +    { 0xa0a, 0xa0a, 0xa0a, 0 },
>> +    { 0xb0b, 0xb0b, 0xb0b, 0 },
>> +    { 0xc0c, 0xc0c, 0xc0c, 0 },
>> +    { 0xd0d, 0xd0d, 0xd0d, 0 },
>> +    { 0xe0e, 0xe0e, 0xe0e, 0 },
>> +    { 0xf0f, 0xf0f, 0xf0f, 0 },
>> +    { 0x1010, 0x1010, 0x1010, 0 },
>> +    { 0x1111, 0x1111, 0x1111, 0 },
>> +    { 0x1212, 0x1212, 0x1212, 0 },
>> +    { 0x1313, 0x1313, 0x1313, 0 },
>> +    { 0x1414, 0x1414, 0x1414, 0 },
>> +    { 0x1515, 0x1515, 0x1515, 0 },
>> +    { 0x1616, 0x1616, 0x1616, 0 },
>> +    { 0x1717, 0x1717, 0x1717, 0 },
>> +    { 0x1818, 0x1818, 0x1818, 0 },
>> +    { 0x1919, 0x1919, 0x1919, 0 },
>> +    { 0x1a1a, 0x1a1a, 0x1a1a, 0 },
>> +    { 0x1b1b, 0x1b1b, 0x1b1b, 0 },
>> +    { 0x1c1c, 0x1c1c, 0x1c1c, 0 },
>> +    { 0x1d1d, 0x1d1d, 0x1d1d, 0 },
>> +    { 0x1e1e, 0x1e1e, 0x1e1e, 0 },
>> +    { 0x1f1f, 0x1f1f, 0x1f1f, 0 },
>> +    { 0x2020, 0x2020, 0x2020, 0 },
>> +    { 0x2121, 0x2121, 0x2121, 0 },
>> +    { 0x2222, 0x2222, 0x2222, 0 },
>> +    { 0x2323, 0x2323, 0x2323, 0 },
>> +    { 0x2424, 0x2424, 0x2424, 0 },
>> +    { 0x2525, 0x2525, 0x2525, 0 },
>> +    { 0x2626, 0x2626, 0x2626, 0 },
>> +    { 0x2727, 0x2727, 0x2727, 0 },
>> +    { 0x2828, 0x2828, 0x2828, 0 },
>> +    { 0x2929, 0x2929, 0x2929, 0 },
>> +    { 0x2a2a, 0x2a2a, 0x2a2a, 0 },
>> +    { 0x2b2b, 0x2b2b, 0x2b2b, 0 },
>> +    { 0x2c2c, 0x2c2c, 0x2c2c, 0 },
>> +    { 0x2d2d, 0x2d2d, 0x2d2d, 0 },
>> +    { 0x2e2e, 0x2e2e, 0x2e2e, 0 },
>> +    { 0x2f2f, 0x2f2f, 0x2f2f, 0 },
>> +    { 0x3030, 0x3030, 0x3030, 0 },
>> +    { 0x3131, 0x3131, 0x3131, 0 },
>> +    { 0x3232, 0x3232, 0x3232, 0 },
>> +    { 0x3333, 0x3333, 0x3333, 0 },
>> +    { 0x3434, 0x3434, 0x3434, 0 },
>> +    { 0x3535, 0x3535, 0x3535, 0 },
>> +    { 0x3636, 0x3636, 0x3636, 0 },
>> +    { 0x3737, 0x3737, 0x3737, 0 },
>> +    { 0x3838, 0x3838, 0x3838, 0 },
>> +    { 0x3939, 0x3939, 0x3939, 0 },
>> +    { 0x3a3a, 0x3a3a, 0x3a3a, 0 },
>> +    { 0x3b3b, 0x3b3b, 0x3b3b, 0 },
>> +    { 0x3c3c, 0x3c3c, 0x3c3c, 0 },
>> +    { 0x3d3d, 0x3d3d, 0x3d3d, 0 },
>> +    { 0x3e3e, 0x3e3e, 0x3e3e, 0 },
>> +    { 0x3f3f, 0x3f3f, 0x3f3f, 0 },
>> +    { 0x4040, 0x4040, 0x4040, 0 },
>> +    { 0x4141, 0x4141, 0x4141, 0 },
>> +    { 0x4242, 0x4242, 0x4242, 0 },
>> +    { 0x4343, 0x4343, 0x4343, 0 },
>> +    { 0x4444, 0x4444, 0x4444, 0 },
>> +    { 0x4545, 0x4545, 0x4545, 0 },
>> +    { 0x4646, 0x4646, 0x4646, 0 },
>> +    { 0x4747, 0x4747, 0x4747, 0 },
>> +    { 0x4848, 0x4848, 0x4848, 0 },
>> +    { 0x4949, 0x4949, 0x4949, 0 },
>> +    { 0x4a4a, 0x4a4a, 0x4a4a, 0 },
>> +    { 0x4b4b, 0x4b4b, 0x4b4b, 0 },
>> +    { 0x4c4c, 0x4c4c, 0x4c4c, 0 },
>> +    { 0x4d4d, 0x4d4d, 0x4d4d, 0 },
>> +    { 0x4e4e, 0x4e4e, 0x4e4e, 0 },
>> +    { 0x4f4f, 0x4f4f, 0x4f4f, 0 },
>> +    { 0x5050, 0x5050, 0x5050, 0 },
>> +    { 0x5151, 0x5151, 0x5151, 0 },
>> +    { 0x5252, 0x5252, 0x5252, 0 },
>> +    { 0x5353, 0x5353, 0x5353, 0 },
>> +    { 0x5454, 0x5454, 0x5454, 0 },
>> +    { 0x5555, 0x5555, 0x5555, 0 },
>> +    { 0x5656, 0x5656, 0x5656, 0 },
>> +    { 0x5757, 0x5757, 0x5757, 0 },
>> +    { 0x5858, 0x5858, 0x5858, 0 },
>> +    { 0x5959, 0x5959, 0x5959, 0 },
>> +    { 0x5a5a, 0x5a5a, 0x5a5a, 0 },
>> +    { 0x5b5b, 0x5b5b, 0x5b5b, 0 },
>> +    { 0x5c5c, 0x5c5c, 0x5c5c, 0 },
>> +    { 0x5d5d, 0x5d5d, 0x5d5d, 0 },
>> +    { 0x5e5e, 0x5e5e, 0x5e5e, 0 },
>> +    { 0x5f5f, 0x5f5f, 0x5f5f, 0 },
>> +    { 0x6060, 0x6060, 0x6060, 0 },
>> +    { 0x6161, 0x6161, 0x6161, 0 },
>> +    { 0x6262, 0x6262, 0x6262, 0 },
>> +    { 0x6363, 0x6363, 0x6363, 0 },
>> +    { 0x6464, 0x6464, 0x6464, 0 },
>> +    { 0x6565, 0x6565, 0x6565, 0 },
>> +    { 0x6666, 0x6666, 0x6666, 0 },
>> +    { 0x6767, 0x6767, 0x6767, 0 },
>> +    { 0x6868, 0x6868, 0x6868, 0 },
>> +    { 0x6969, 0x6969, 0x6969, 0 },
>> +    { 0x6a6a, 0x6a6a, 0x6a6a, 0 },
>> +    { 0x6b6b, 0x6b6b, 0x6b6b, 0 },
>> +    { 0x6c6c, 0x6c6c, 0x6c6c, 0 },
>> +    { 0x6d6d, 0x6d6d, 0x6d6d, 0 },
>> +    { 0x6e6e, 0x6e6e, 0x6e6e, 0 },
>> +    { 0x6f6f, 0x6f6f, 0x6f6f, 0 },
>> +    { 0x7070, 0x7070, 0x7070, 0 },
>> +    { 0x7171, 0x7171, 0x7171, 0 },
>> +    { 0x7272, 0x7272, 0x7272, 0 },
>> +    { 0x7373, 0x7373, 0x7373, 0 },
>> +    { 0x7474, 0x7474, 0x7474, 0 },
>> +    { 0x7575, 0x7575, 0x7575, 0 },
>> +    { 0x7676, 0x7676, 0x7676, 0 },
>> +    { 0x7777, 0x7777, 0x7777, 0 },
>> +    { 0x7878, 0x7878, 0x7878, 0 },
>> +    { 0x7979, 0x7979, 0x7979, 0 },
>> +    { 0x7a7a, 0x7a7a, 0x7a7a, 0 },
>> +    { 0x7b7b, 0x7b7b, 0x7b7b, 0 },
>> +    { 0x7c7c, 0x7c7c, 0x7c7c, 0 },
>> +    { 0x7d7d, 0x7d7d, 0x7d7d, 0 },
>> +    { 0x7e7e, 0x7e7e, 0x7e7e, 0 },
>> +    { 0x7f7f, 0x7f7f, 0x7f7f, 0 },
>> +    { 0x8080, 0x8080, 0x8080, 0 },
>> +    { 0x8181, 0x8181, 0x8181, 0 },
>> +    { 0x8282, 0x8282, 0x8282, 0 },
>> +    { 0x8383, 0x8383, 0x8383, 0 },
>> +    { 0x8484, 0x8484, 0x8484, 0 },
>> +    { 0x8585, 0x8585, 0x8585, 0 },
>> +    { 0x8686, 0x8686, 0x8686, 0 },
>> +    { 0x8787, 0x8787, 0x8787, 0 },
>> +    { 0x8888, 0x8888, 0x8888, 0 },
>> +    { 0x8989, 0x8989, 0x8989, 0 },
>> +    { 0x8a8a, 0x8a8a, 0x8a8a, 0 },
>> +    { 0x8b8b, 0x8b8b, 0x8b8b, 0 },
>> +    { 0x8c8c, 0x8c8c, 0x8c8c, 0 },
>> +    { 0x8d8d, 0x8d8d, 0x8d8d, 0 },
>> +    { 0x8e8e, 0x8e8e, 0x8e8e, 0 },
>> +    { 0x8f8f, 0x8f8f, 0x8f8f, 0 },
>> +    { 0x9090, 0x9090, 0x9090, 0 },
>> +    { 0x9191, 0x9191, 0x9191, 0 },
>> +    { 0x9292, 0x9292, 0x9292, 0 },
>> +    { 0x9393, 0x9393, 0x9393, 0 },
>> +    { 0x9494, 0x9494, 0x9494, 0 },
>> +    { 0x9595, 0x9595, 0x9595, 0 },
>> +    { 0x9696, 0x9696, 0x9696, 0 },
>> +    { 0x9797, 0x9797, 0x9797, 0 },
>> +    { 0x9898, 0x9898, 0x9898, 0 },
>> +    { 0x9999, 0x9999, 0x9999, 0 },
>> +    { 0x9a9a, 0x9a9a, 0x9a9a, 0 },
>> +    { 0x9b9b, 0x9b9b, 0x9b9b, 0 },
>> +    { 0x9c9c, 0x9c9c, 0x9c9c, 0 },
>> +    { 0x9d9d, 0x9d9d, 0x9d9d, 0 },
>> +    { 0x9e9e, 0x9e9e, 0x9e9e, 0 },
>> +    { 0x9f9f, 0x9f9f, 0x9f9f, 0 },
>> +    { 0xa0a0, 0xa0a0, 0xa0a0, 0 },
>> +    { 0xa1a1, 0xa1a1, 0xa1a1, 0 },
>> +    { 0xa2a2, 0xa2a2, 0xa2a2, 0 },
>> +    { 0xa3a3, 0xa3a3, 0xa3a3, 0 },
>> +    { 0xa4a4, 0xa4a4, 0xa4a4, 0 },
>> +    { 0xa5a5, 0xa5a5, 0xa5a5, 0 },
>> +    { 0xa6a6, 0xa6a6, 0xa6a6, 0 },
>> +    { 0xa7a7, 0xa7a7, 0xa7a7, 0 },
>> +    { 0xa8a8, 0xa8a8, 0xa8a8, 0 },
>> +    { 0xa9a9, 0xa9a9, 0xa9a9, 0 },
>> +    { 0xaaaa, 0xaaaa, 0xaaaa, 0 },
>> +    { 0xabab, 0xabab, 0xabab, 0 },
>> +    { 0xacac, 0xacac, 0xacac, 0 },
>> +    { 0xadad, 0xadad, 0xadad, 0 },
>> +    { 0xaeae, 0xaeae, 0xaeae, 0 },
>> +    { 0xafaf, 0xafaf, 0xafaf, 0 },
>> +    { 0xb0b0, 0xb0b0, 0xb0b0, 0 },
>> +    { 0xb1b1, 0xb1b1, 0xb1b1, 0 },
>> +    { 0xb2b2, 0xb2b2, 0xb2b2, 0 },
>> +    { 0xb3b3, 0xb3b3, 0xb3b3, 0 },
>> +    { 0xb4b4, 0xb4b4, 0xb4b4, 0 },
>> +    { 0xb5b5, 0xb5b5, 0xb5b5, 0 },
>> +    { 0xb6b6, 0xb6b6, 0xb6b6, 0 },
>> +    { 0xb7b7, 0xb7b7, 0xb7b7, 0 },
>> +    { 0xb8b8, 0xb8b8, 0xb8b8, 0 },
>> +    { 0xb9b9, 0xb9b9, 0xb9b9, 0 },
>> +    { 0xbaba, 0xbaba, 0xbaba, 0 },
>> +    { 0xbbbb, 0xbbbb, 0xbbbb, 0 },
>> +    { 0xbcbc, 0xbcbc, 0xbcbc, 0 },
>> +    { 0xbdbd, 0xbdbd, 0xbdbd, 0 },
>> +    { 0xbebe, 0xbebe, 0xbebe, 0 },
>> +    { 0xbfbf, 0xbfbf, 0xbfbf, 0 },
>> +    { 0xc0c0, 0xc0c0, 0xc0c0, 0 },
>> +    { 0xc1c1, 0xc1c1, 0xc1c1, 0 },
>> +    { 0xc2c2, 0xc2c2, 0xc2c2, 0 },
>> +    { 0xc3c3, 0xc3c3, 0xc3c3, 0 },
>> +    { 0xc4c4, 0xc4c4, 0xc4c4, 0 },
>> +    { 0xc5c5, 0xc5c5, 0xc5c5, 0 },
>> +    { 0xc6c6, 0xc6c6, 0xc6c6, 0 },
>> +    { 0xc7c7, 0xc7c7, 0xc7c7, 0 },
>> +    { 0xc8c8, 0xc8c8, 0xc8c8, 0 },
>> +    { 0xc9c9, 0xc9c9, 0xc9c9, 0 },
>> +    { 0xcaca, 0xcaca, 0xcaca, 0 },
>> +    { 0xcbcb, 0xcbcb, 0xcbcb, 0 },
>> +    { 0xcccc, 0xcccc, 0xcccc, 0 },
>> +    { 0xcdcd, 0xcdcd, 0xcdcd, 0 },
>> +    { 0xcece, 0xcece, 0xcece, 0 },
>> +    { 0xcfcf, 0xcfcf, 0xcfcf, 0 },
>> +    { 0xd0d0, 0xd0d0, 0xd0d0, 0 },
>> +    { 0xd1d1, 0xd1d1, 0xd1d1, 0 },
>> +    { 0xd2d2, 0xd2d2, 0xd2d2, 0 },
>> +    { 0xd3d3, 0xd3d3, 0xd3d3, 0 },
>> +    { 0xd4d4, 0xd4d4, 0xd4d4, 0 },
>> +    { 0xd5d5, 0xd5d5, 0xd5d5, 0 },
>> +    { 0xd6d6, 0xd6d6, 0xd6d6, 0 },
>> +    { 0xd7d7, 0xd7d7, 0xd7d7, 0 },
>> +    { 0xd8d8, 0xd8d8, 0xd8d8, 0 },
>> +    { 0xd9d9, 0xd9d9, 0xd9d9, 0 },
>> +    { 0xdada, 0xdada, 0xdada, 0 },
>> +    { 0xdbdb, 0xdbdb, 0xdbdb, 0 },
>> +    { 0xdcdc, 0xdcdc, 0xdcdc, 0 },
>> +    { 0xdddd, 0xdddd, 0xdddd, 0 },
>> +    { 0xdede, 0xdede, 0xdede, 0 },
>> +    { 0xdfdf, 0xdfdf, 0xdfdf, 0 },
>> +    { 0xe0e0, 0xe0e0, 0xe0e0, 0 },
>> +    { 0xe1e1, 0xe1e1, 0xe1e1, 0 },
>> +    { 0xe2e2, 0xe2e2, 0xe2e2, 0 },
>> +    { 0xe3e3, 0xe3e3, 0xe3e3, 0 },
>> +    { 0xe4e4, 0xe4e4, 0xe4e4, 0 },
>> +    { 0xe5e5, 0xe5e5, 0xe5e5, 0 },
>> +    { 0xe6e6, 0xe6e6, 0xe6e6, 0 },
>> +    { 0xe7e7, 0xe7e7, 0xe7e7, 0 },
>> +    { 0xe8e8, 0xe8e8, 0xe8e8, 0 },
>> +    { 0xe9e9, 0xe9e9, 0xe9e9, 0 },
>> +    { 0xeaea, 0xeaea, 0xeaea, 0 },
>> +    { 0xebeb, 0xebeb, 0xebeb, 0 },
>> +    { 0xecec, 0xecec, 0xecec, 0 },
>> +    { 0xeded, 0xeded, 0xeded, 0 },
>> +    { 0xeeee, 0xeeee, 0xeeee, 0 },
>> +    { 0xefef, 0xefef, 0xefef, 0 },
>> +    { 0xf0f0, 0xf0f0, 0xf0f0, 0 },
>> +    { 0xf1f1, 0xf1f1, 0xf1f1, 0 },
>> +    { 0xf2f2, 0xf2f2, 0xf2f2, 0 },
>> +    { 0xf3f3, 0xf3f3, 0xf3f3, 0 },
>> +    { 0xf4f4, 0xf4f4, 0xf4f4, 0 },
>> +    { 0xf5f5, 0xf5f5, 0xf5f5, 0 },
>> +    { 0xf6f6, 0xf6f6, 0xf6f6, 0 },
>> +    { 0xf7f7, 0xf7f7, 0xf7f7, 0 },
>> +    { 0xf8f8, 0xf8f8, 0xf8f8, 0 },
>> +    { 0xf9f9, 0xf9f9, 0xf9f9, 0 },
>> +    { 0xfafa, 0xfafa, 0xfafa, 0 },
>> +    { 0xfbfb, 0xfbfb, 0xfbfb, 0 },
>> +    { 0xfcfc, 0xfcfc, 0xfcfc, 0 },
>> +    { 0xfdfd, 0xfdfd, 0xfdfd, 0 },
>> +    { 0xfefe, 0xfefe, 0xfefe, 0 },
>> +    { 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut linear_eotf = {
>> +    .base = linear_array,
>> +    .lut_length = LUT_SIZE,
>> +    .channel_value2index_ratio = 0xff00ffll
>> +};
>> +EXPORT_SYMBOL(linear_eotf);
>> +
>> +static struct drm_color_lut srgb_array[LUT_SIZE] = {
>> +    { 0x0, 0x0, 0x0, 0 },
>> +    { 0x13, 0x13, 0x13, 0 },
>> +    { 0x27, 0x27, 0x27, 0 },
>> +    { 0x3b, 0x3b, 0x3b, 0 },
>> +    { 0x4f, 0x4f, 0x4f, 0 },
>> +    { 0x63, 0x63, 0x63, 0 },
>> +    { 0x77, 0x77, 0x77, 0 },
>> +    { 0x8b, 0x8b, 0x8b, 0 },
>> +    { 0x9f, 0x9f, 0x9f, 0 },
>> +    { 0xb3, 0xb3, 0xb3, 0 },
>> +    { 0xc6, 0xc6, 0xc6, 0 },
>> +    { 0xdb, 0xdb, 0xdb, 0 },
>> +    { 0xf0, 0xf0, 0xf0, 0 },
>> +    { 0x107, 0x107, 0x107, 0 },
>> +    { 0x11f, 0x11f, 0x11f, 0 },
>> +    { 0x139, 0x139, 0x139, 0 },
>> +    { 0x153, 0x153, 0x153, 0 },
>> +    { 0x16f, 0x16f, 0x16f, 0 },
>> +    { 0x18c, 0x18c, 0x18c, 0 },
>> +    { 0x1aa, 0x1aa, 0x1aa, 0 },
>> +    { 0x1ca, 0x1ca, 0x1ca, 0 },
>> +    { 0x1eb, 0x1eb, 0x1eb, 0 },
>> +    { 0x20d, 0x20d, 0x20d, 0 },
>> +    { 0x231, 0x231, 0x231, 0 },
>> +    { 0x256, 0x256, 0x256, 0 },
>> +    { 0x27d, 0x27d, 0x27d, 0 },
>> +    { 0x2a4, 0x2a4, 0x2a4, 0 },
>> +    { 0x2ce, 0x2ce, 0x2ce, 0 },
>> +    { 0x2f9, 0x2f9, 0x2f9, 0 },
>> +    { 0x325, 0x325, 0x325, 0 },
>> +    { 0x352, 0x352, 0x352, 0 },
>> +    { 0x381, 0x381, 0x381, 0 },
>> +    { 0x3b2, 0x3b2, 0x3b2, 0 },
>> +    { 0x3e4, 0x3e4, 0x3e4, 0 },
>> +    { 0x418, 0x418, 0x418, 0 },
>> +    { 0x44d, 0x44d, 0x44d, 0 },
>> +    { 0x484, 0x484, 0x484, 0 },
>> +    { 0x4bc, 0x4bc, 0x4bc, 0 },
>> +    { 0x4f6, 0x4f6, 0x4f6, 0 },
>> +    { 0x531, 0x531, 0x531, 0 },
>> +    { 0x56e, 0x56e, 0x56e, 0 },
>> +    { 0x5ad, 0x5ad, 0x5ad, 0 },
>> +    { 0x5ed, 0x5ed, 0x5ed, 0 },
>> +    { 0x62f, 0x62f, 0x62f, 0 },
>> +    { 0x672, 0x672, 0x672, 0 },
>> +    { 0x6b7, 0x6b7, 0x6b7, 0 },
>> +    { 0x6fe, 0x6fe, 0x6fe, 0 },
>> +    { 0x746, 0x746, 0x746, 0 },
>> +    { 0x791, 0x791, 0x791, 0 },
>> +    { 0x7dc, 0x7dc, 0x7dc, 0 },
>> +    { 0x82a, 0x82a, 0x82a, 0 },
>> +    { 0x879, 0x879, 0x879, 0 },
>> +    { 0x8ca, 0x8ca, 0x8ca, 0 },
>> +    { 0x91d, 0x91d, 0x91d, 0 },
>> +    { 0x971, 0x971, 0x971, 0 },
>> +    { 0x9c7, 0x9c7, 0x9c7, 0 },
>> +    { 0xa1f, 0xa1f, 0xa1f, 0 },
>> +    { 0xa79, 0xa79, 0xa79, 0 },
>> +    { 0xad4, 0xad4, 0xad4, 0 },
>> +    { 0xb32, 0xb32, 0xb32, 0 },
>> +    { 0xb91, 0xb91, 0xb91, 0 },
>> +    { 0xbf2, 0xbf2, 0xbf2, 0 },
>> +    { 0xc54, 0xc54, 0xc54, 0 },
>> +    { 0xcb9, 0xcb9, 0xcb9, 0 },
>> +    { 0xd1f, 0xd1f, 0xd1f, 0 },
>> +    { 0xd88, 0xd88, 0xd88, 0 },
>> +    { 0xdf2, 0xdf2, 0xdf2, 0 },
>> +    { 0xe5e, 0xe5e, 0xe5e, 0 },
>> +    { 0xecc, 0xecc, 0xecc, 0 },
>> +    { 0xf3c, 0xf3c, 0xf3c, 0 },
>> +    { 0xfad, 0xfad, 0xfad, 0 },
>> +    { 0x1021, 0x1021, 0x1021, 0 },
>> +    { 0x1096, 0x1096, 0x1096, 0 },
>> +    { 0x110e, 0x110e, 0x110e, 0 },
>> +    { 0x1187, 0x1187, 0x1187, 0 },
>> +    { 0x1203, 0x1203, 0x1203, 0 },
>> +    { 0x1280, 0x1280, 0x1280, 0 },
>> +    { 0x12ff, 0x12ff, 0x12ff, 0 },
>> +    { 0x1380, 0x1380, 0x1380, 0 },
>> +    { 0x1404, 0x1404, 0x1404, 0 },
>> +    { 0x1489, 0x1489, 0x1489, 0 },
>> +    { 0x1510, 0x1510, 0x1510, 0 },
>> +    { 0x1599, 0x1599, 0x1599, 0 },
>> +    { 0x1624, 0x1624, 0x1624, 0 },
>> +    { 0x16b2, 0x16b2, 0x16b2, 0 },
>> +    { 0x1741, 0x1741, 0x1741, 0 },
>> +    { 0x17d2, 0x17d2, 0x17d2, 0 },
>> +    { 0x1865, 0x1865, 0x1865, 0 },
>> +    { 0x18fb, 0x18fb, 0x18fb, 0 },
>> +    { 0x1992, 0x1992, 0x1992, 0 },
>> +    { 0x1a2c, 0x1a2c, 0x1a2c, 0 },
>> +    { 0x1ac8, 0x1ac8, 0x1ac8, 0 },
>> +    { 0x1b65, 0x1b65, 0x1b65, 0 },
>> +    { 0x1c05, 0x1c05, 0x1c05, 0 },
>> +    { 0x1ca7, 0x1ca7, 0x1ca7, 0 },
>> +    { 0x1d4b, 0x1d4b, 0x1d4b, 0 },
>> +    { 0x1df1, 0x1df1, 0x1df1, 0 },
>> +    { 0x1e99, 0x1e99, 0x1e99, 0 },
>> +    { 0x1f44, 0x1f44, 0x1f44, 0 },
>> +    { 0x1ff0, 0x1ff0, 0x1ff0, 0 },
>> +    { 0x209f, 0x209f, 0x209f, 0 },
>> +    { 0x2150, 0x2150, 0x2150, 0 },
>> +    { 0x2203, 0x2203, 0x2203, 0 },
>> +    { 0x22b8, 0x22b8, 0x22b8, 0 },
>> +    { 0x2370, 0x2370, 0x2370, 0 },
>> +    { 0x2429, 0x2429, 0x2429, 0 },
>> +    { 0x24e5, 0x24e5, 0x24e5, 0 },
>> +    { 0x25a3, 0x25a3, 0x25a3, 0 },
>> +    { 0x2663, 0x2663, 0x2663, 0 },
>> +    { 0x2726, 0x2726, 0x2726, 0 },
>> +    { 0x27ea, 0x27ea, 0x27ea, 0 },
>> +    { 0x28b1, 0x28b1, 0x28b1, 0 },
>> +    { 0x297a, 0x297a, 0x297a, 0 },
>> +    { 0x2a45, 0x2a45, 0x2a45, 0 },
>> +    { 0x2b13, 0x2b13, 0x2b13, 0 },
>> +    { 0x2be3, 0x2be3, 0x2be3, 0 },
>> +    { 0x2cb5, 0x2cb5, 0x2cb5, 0 },
>> +    { 0x2d89, 0x2d89, 0x2d89, 0 },
>> +    { 0x2e60, 0x2e60, 0x2e60, 0 },
>> +    { 0x2f39, 0x2f39, 0x2f39, 0 },
>> +    { 0x3014, 0x3014, 0x3014, 0 },
>> +    { 0x30f2, 0x30f2, 0x30f2, 0 },
>> +    { 0x31d2, 0x31d2, 0x31d2, 0 },
>> +    { 0x32b4, 0x32b4, 0x32b4, 0 },
>> +    { 0x3398, 0x3398, 0x3398, 0 },
>> +    { 0x347f, 0x347f, 0x347f, 0 },
>> +    { 0x3569, 0x3569, 0x3569, 0 },
>> +    { 0x3654, 0x3654, 0x3654, 0 },
>> +    { 0x3742, 0x3742, 0x3742, 0 },
>> +    { 0x3832, 0x3832, 0x3832, 0 },
>> +    { 0x3925, 0x3925, 0x3925, 0 },
>> +    { 0x3a1a, 0x3a1a, 0x3a1a, 0 },
>> +    { 0x3b11, 0x3b11, 0x3b11, 0 },
>> +    { 0x3c0b, 0x3c0b, 0x3c0b, 0 },
>> +    { 0x3d07, 0x3d07, 0x3d07, 0 },
>> +    { 0x3e05, 0x3e05, 0x3e05, 0 },
>> +    { 0x3f06, 0x3f06, 0x3f06, 0 },
>> +    { 0x400a, 0x400a, 0x400a, 0 },
>> +    { 0x410f, 0x410f, 0x410f, 0 },
>> +    { 0x4218, 0x4218, 0x4218, 0 },
>> +    { 0x4322, 0x4322, 0x4322, 0 },
>> +    { 0x442f, 0x442f, 0x442f, 0 },
>> +    { 0x453f, 0x453f, 0x453f, 0 },
>> +    { 0x4650, 0x4650, 0x4650, 0 },
>> +    { 0x4765, 0x4765, 0x4765, 0 },
>> +    { 0x487c, 0x487c, 0x487c, 0 },
>> +    { 0x4995, 0x4995, 0x4995, 0 },
>> +    { 0x4ab1, 0x4ab1, 0x4ab1, 0 },
>> +    { 0x4bcf, 0x4bcf, 0x4bcf, 0 },
>> +    { 0x4cf0, 0x4cf0, 0x4cf0, 0 },
>> +    { 0x4e13, 0x4e13, 0x4e13, 0 },
>> +    { 0x4f39, 0x4f39, 0x4f39, 0 },
>> +    { 0x5061, 0x5061, 0x5061, 0 },
>> +    { 0x518b, 0x518b, 0x518b, 0 },
>> +    { 0x52b9, 0x52b9, 0x52b9, 0 },
>> +    { 0x53e8, 0x53e8, 0x53e8, 0 },
>> +    { 0x551b, 0x551b, 0x551b, 0 },
>> +    { 0x5650, 0x5650, 0x5650, 0 },
>> +    { 0x5787, 0x5787, 0x5787, 0 },
>> +    { 0x58c1, 0x58c1, 0x58c1, 0 },
>> +    { 0x59fd, 0x59fd, 0x59fd, 0 },
>> +    { 0x5b3c, 0x5b3c, 0x5b3c, 0 },
>> +    { 0x5c7e, 0x5c7e, 0x5c7e, 0 },
>> +    { 0x5dc2, 0x5dc2, 0x5dc2, 0 },
>> +    { 0x5f09, 0x5f09, 0x5f09, 0 },
>> +    { 0x6052, 0x6052, 0x6052, 0 },
>> +    { 0x619e, 0x619e, 0x619e, 0 },
>> +    { 0x62ec, 0x62ec, 0x62ec, 0 },
>> +    { 0x643d, 0x643d, 0x643d, 0 },
>> +    { 0x6591, 0x6591, 0x6591, 0 },
>> +    { 0x66e7, 0x66e7, 0x66e7, 0 },
>> +    { 0x6840, 0x6840, 0x6840, 0 },
>> +    { 0x699b, 0x699b, 0x699b, 0 },
>> +    { 0x6afa, 0x6afa, 0x6afa, 0 },
>> +    { 0x6c5a, 0x6c5a, 0x6c5a, 0 },
>> +    { 0x6dbe, 0x6dbe, 0x6dbe, 0 },
>> +    { 0x6f24, 0x6f24, 0x6f24, 0 },
>> +    { 0x708c, 0x708c, 0x708c, 0 },
>> +    { 0x71f8, 0x71f8, 0x71f8, 0 },
>> +    { 0x7366, 0x7366, 0x7366, 0 },
>> +    { 0x74d6, 0x74d6, 0x74d6, 0 },
>> +    { 0x764a, 0x764a, 0x764a, 0 },
>> +    { 0x77c0, 0x77c0, 0x77c0, 0 },
>> +    { 0x7938, 0x7938, 0x7938, 0 },
>> +    { 0x7ab4, 0x7ab4, 0x7ab4, 0 },
>> +    { 0x7c32, 0x7c32, 0x7c32, 0 },
>> +    { 0x7db3, 0x7db3, 0x7db3, 0 },
>> +    { 0x7f36, 0x7f36, 0x7f36, 0 },
>> +    { 0x80bc, 0x80bc, 0x80bc, 0 },
>> +    { 0x8245, 0x8245, 0x8245, 0 },
>> +    { 0x83d1, 0x83d1, 0x83d1, 0 },
>> +    { 0x855f, 0x855f, 0x855f, 0 },
>> +    { 0x86f0, 0x86f0, 0x86f0, 0 },
>> +    { 0x8884, 0x8884, 0x8884, 0 },
>> +    { 0x8a1a, 0x8a1a, 0x8a1a, 0 },
>> +    { 0x8bb4, 0x8bb4, 0x8bb4, 0 },
>> +    { 0x8d50, 0x8d50, 0x8d50, 0 },
>> +    { 0x8eee, 0x8eee, 0x8eee, 0 },
>> +    { 0x9090, 0x9090, 0x9090, 0 },
>> +    { 0x9234, 0x9234, 0x9234, 0 },
>> +    { 0x93db, 0x93db, 0x93db, 0 },
>> +    { 0x9585, 0x9585, 0x9585, 0 },
>> +    { 0x9732, 0x9732, 0x9732, 0 },
>> +    { 0x98e1, 0x98e1, 0x98e1, 0 },
>> +    { 0x9a93, 0x9a93, 0x9a93, 0 },
>> +    { 0x9c48, 0x9c48, 0x9c48, 0 },
>> +    { 0x9e00, 0x9e00, 0x9e00, 0 },
>> +    { 0x9fbb, 0x9fbb, 0x9fbb, 0 },
>> +    { 0xa178, 0xa178, 0xa178, 0 },
>> +    { 0xa338, 0xa338, 0xa338, 0 },
>> +    { 0xa4fb, 0xa4fb, 0xa4fb, 0 },
>> +    { 0xa6c1, 0xa6c1, 0xa6c1, 0 },
>> +    { 0xa88a, 0xa88a, 0xa88a, 0 },
>> +    { 0xaa56, 0xaa56, 0xaa56, 0 },
>> +    { 0xac24, 0xac24, 0xac24, 0 },
>> +    { 0xadf5, 0xadf5, 0xadf5, 0 },
>> +    { 0xafc9, 0xafc9, 0xafc9, 0 },
>> +    { 0xb1a0, 0xb1a0, 0xb1a0, 0 },
>> +    { 0xb37a, 0xb37a, 0xb37a, 0 },
>> +    { 0xb557, 0xb557, 0xb557, 0 },
>> +    { 0xb736, 0xb736, 0xb736, 0 },
>> +    { 0xb919, 0xb919, 0xb919, 0 },
>> +    { 0xbafe, 0xbafe, 0xbafe, 0 },
>> +    { 0xbce6, 0xbce6, 0xbce6, 0 },
>> +    { 0xbed2, 0xbed2, 0xbed2, 0 },
>> +    { 0xc0c0, 0xc0c0, 0xc0c0, 0 },
>> +    { 0xc2b0, 0xc2b0, 0xc2b0, 0 },
>> +    { 0xc4a4, 0xc4a4, 0xc4a4, 0 },
>> +    { 0xc69b, 0xc69b, 0xc69b, 0 },
>> +    { 0xc895, 0xc895, 0xc895, 0 },
>> +    { 0xca91, 0xca91, 0xca91, 0 },
>> +    { 0xcc91, 0xcc91, 0xcc91, 0 },
>> +    { 0xce93, 0xce93, 0xce93, 0 },
>> +    { 0xd098, 0xd098, 0xd098, 0 },
>> +    { 0xd2a1, 0xd2a1, 0xd2a1, 0 },
>> +    { 0xd4ac, 0xd4ac, 0xd4ac, 0 },
>> +    { 0xd6ba, 0xd6ba, 0xd6ba, 0 },
>> +    { 0xd8cb, 0xd8cb, 0xd8cb, 0 },
>> +    { 0xdadf, 0xdadf, 0xdadf, 0 },
>> +    { 0xdcf7, 0xdcf7, 0xdcf7, 0 },
>> +    { 0xdf11, 0xdf11, 0xdf11, 0 },
>> +    { 0xe12e, 0xe12e, 0xe12e, 0 },
>> +    { 0xe34e, 0xe34e, 0xe34e, 0 },
>> +    { 0xe571, 0xe571, 0xe571, 0 },
>> +    { 0xe796, 0xe796, 0xe796, 0 },
>> +    { 0xe9bf, 0xe9bf, 0xe9bf, 0 },
>> +    { 0xebeb, 0xebeb, 0xebeb, 0 },
>> +    { 0xee1a, 0xee1a, 0xee1a, 0 },
>> +    { 0xf04c, 0xf04c, 0xf04c, 0 },
>> +    { 0xf281, 0xf281, 0xf281, 0 },
>> +    { 0xf4b9, 0xf4b9, 0xf4b9, 0 },
>> +    { 0xf6f4, 0xf6f4, 0xf6f4, 0 },
>> +    { 0xf932, 0xf932, 0xf932, 0 },
>> +    { 0xfb73, 0xfb73, 0xfb73, 0 },
>> +    { 0xfdb7, 0xfdb7, 0xfdb7, 0 },
>> +    { 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut srgb_eotf = {
>> +    .base = srgb_array,
>> +    .lut_length = LUT_SIZE,
>> +    .channel_value2index_ratio = 0xff00ffll
>> +};
>> +EXPORT_SYMBOL(srgb_eotf);
>> +
>> +static struct drm_color_lut srgb_inv_array[LUT_SIZE] = {
>> +    { 0x0, 0x0, 0x0, 0 },
>> +    { 0xcc2, 0xcc2, 0xcc2, 0 },
>> +    { 0x15be, 0x15be, 0x15be, 0 },
>> +    { 0x1c56, 0x1c56, 0x1c56, 0 },
>> +    { 0x21bd, 0x21bd, 0x21bd, 0 },
>> +    { 0x2666, 0x2666, 0x2666, 0 },
>> +    { 0x2a8a, 0x2a8a, 0x2a8a, 0 },
>> +    { 0x2e4c, 0x2e4c, 0x2e4c, 0 },
>> +    { 0x31c0, 0x31c0, 0x31c0, 0 },
>> +    { 0x34f6, 0x34f6, 0x34f6, 0 },
>> +    { 0x37f9, 0x37f9, 0x37f9, 0 },
>> +    { 0x3acf, 0x3acf, 0x3acf, 0 },
>> +    { 0x3d80, 0x3d80, 0x3d80, 0 },
>> +    { 0x4010, 0x4010, 0x4010, 0 },
>> +    { 0x4284, 0x4284, 0x4284, 0 },
>> +    { 0x44dd, 0x44dd, 0x44dd, 0 },
>> +    { 0x4720, 0x4720, 0x4720, 0 },
>> +    { 0x494e, 0x494e, 0x494e, 0 },
>> +    { 0x4b69, 0x4b69, 0x4b69, 0 },
>> +    { 0x4d73, 0x4d73, 0x4d73, 0 },
>> +    { 0x4f6e, 0x4f6e, 0x4f6e, 0 },
>> +    { 0x5159, 0x5159, 0x5159, 0 },
>> +    { 0x5337, 0x5337, 0x5337, 0 },
>> +    { 0x5509, 0x5509, 0x5509, 0 },
>> +    { 0x56cf, 0x56cf, 0x56cf, 0 },
>> +    { 0x588a, 0x588a, 0x588a, 0 },
>> +    { 0x5a3b, 0x5a3b, 0x5a3b, 0 },
>> +    { 0x5be2, 0x5be2, 0x5be2, 0 },
>> +    { 0x5d80, 0x5d80, 0x5d80, 0 },
>> +    { 0x5f16, 0x5f16, 0x5f16, 0 },
>> +    { 0x60a4, 0x60a4, 0x60a4, 0 },
>> +    { 0x6229, 0x6229, 0x6229, 0 },
>> +    { 0x63a8, 0x63a8, 0x63a8, 0 },
>> +    { 0x6520, 0x6520, 0x6520, 0 },
>> +    { 0x6691, 0x6691, 0x6691, 0 },
>> +    { 0x67fc, 0x67fc, 0x67fc, 0 },
>> +    { 0x6961, 0x6961, 0x6961, 0 },
>> +    { 0x6ac0, 0x6ac0, 0x6ac0, 0 },
>> +    { 0x6c19, 0x6c19, 0x6c19, 0 },
>> +    { 0x6d6e, 0x6d6e, 0x6d6e, 0 },
>> +    { 0x6ebd, 0x6ebd, 0x6ebd, 0 },
>> +    { 0x7008, 0x7008, 0x7008, 0 },
>> +    { 0x714d, 0x714d, 0x714d, 0 },
>> +    { 0x728f, 0x728f, 0x728f, 0 },
>> +    { 0x73cc, 0x73cc, 0x73cc, 0 },
>> +    { 0x7504, 0x7504, 0x7504, 0 },
>> +    { 0x7639, 0x7639, 0x7639, 0 },
>> +    { 0x776a, 0x776a, 0x776a, 0 },
>> +    { 0x7897, 0x7897, 0x7897, 0 },
>> +    { 0x79c1, 0x79c1, 0x79c1, 0 },
>> +    { 0x7ae7, 0x7ae7, 0x7ae7, 0 },
>> +    { 0x7c09, 0x7c09, 0x7c09, 0 },
>> +    { 0x7d28, 0x7d28, 0x7d28, 0 },
>> +    { 0x7e44, 0x7e44, 0x7e44, 0 },
>> +    { 0x7f5d, 0x7f5d, 0x7f5d, 0 },
>> +    { 0x8073, 0x8073, 0x8073, 0 },
>> +    { 0x8186, 0x8186, 0x8186, 0 },
>> +    { 0x8296, 0x8296, 0x8296, 0 },
>> +    { 0x83a4, 0x83a4, 0x83a4, 0 },
>> +    { 0x84ae, 0x84ae, 0x84ae, 0 },
>> +    { 0x85b6, 0x85b6, 0x85b6, 0 },
>> +    { 0x86bc, 0x86bc, 0x86bc, 0 },
>> +    { 0x87bf, 0x87bf, 0x87bf, 0 },
>> +    { 0x88bf, 0x88bf, 0x88bf, 0 },
>> +    { 0x89be, 0x89be, 0x89be, 0 },
>> +    { 0x8ab9, 0x8ab9, 0x8ab9, 0 },
>> +    { 0x8bb3, 0x8bb3, 0x8bb3, 0 },
>> +    { 0x8cab, 0x8cab, 0x8cab, 0 },
>> +    { 0x8da0, 0x8da0, 0x8da0, 0 },
>> +    { 0x8e93, 0x8e93, 0x8e93, 0 },
>> +    { 0x8f84, 0x8f84, 0x8f84, 0 },
>> +    { 0x9073, 0x9073, 0x9073, 0 },
>> +    { 0x9161, 0x9161, 0x9161, 0 },
>> +    { 0x924c, 0x924c, 0x924c, 0 },
>> +    { 0x9335, 0x9335, 0x9335, 0 },
>> +    { 0x941d, 0x941d, 0x941d, 0 },
>> +    { 0x9503, 0x9503, 0x9503, 0 },
>> +    { 0x95e7, 0x95e7, 0x95e7, 0 },
>> +    { 0x96c9, 0x96c9, 0x96c9, 0 },
>> +    { 0x97aa, 0x97aa, 0x97aa, 0 },
>> +    { 0x9889, 0x9889, 0x9889, 0 },
>> +    { 0x9966, 0x9966, 0x9966, 0 },
>> +    { 0x9a42, 0x9a42, 0x9a42, 0 },
>> +    { 0x9b1c, 0x9b1c, 0x9b1c, 0 },
>> +    { 0x9bf5, 0x9bf5, 0x9bf5, 0 },
>> +    { 0x9ccc, 0x9ccc, 0x9ccc, 0 },
>> +    { 0x9da1, 0x9da1, 0x9da1, 0 },
>> +    { 0x9e76, 0x9e76, 0x9e76, 0 },
>> +    { 0x9f49, 0x9f49, 0x9f49, 0 },
>> +    { 0xa01a, 0xa01a, 0xa01a, 0 },
>> +    { 0xa0ea, 0xa0ea, 0xa0ea, 0 },
>> +    { 0xa1b9, 0xa1b9, 0xa1b9, 0 },
>> +    { 0xa286, 0xa286, 0xa286, 0 },
>> +    { 0xa352, 0xa352, 0xa352, 0 },
>> +    { 0xa41d, 0xa41d, 0xa41d, 0 },
>> +    { 0xa4e7, 0xa4e7, 0xa4e7, 0 },
>> +    { 0xa5af, 0xa5af, 0xa5af, 0 },
>> +    { 0xa676, 0xa676, 0xa676, 0 },
>> +    { 0xa73c, 0xa73c, 0xa73c, 0 },
>> +    { 0xa801, 0xa801, 0xa801, 0 },
>> +    { 0xa8c5, 0xa8c5, 0xa8c5, 0 },
>> +    { 0xa987, 0xa987, 0xa987, 0 },
>> +    { 0xaa48, 0xaa48, 0xaa48, 0 },
>> +    { 0xab09, 0xab09, 0xab09, 0 },
>> +    { 0xabc8, 0xabc8, 0xabc8, 0 },
>> +    { 0xac86, 0xac86, 0xac86, 0 },
>> +    { 0xad43, 0xad43, 0xad43, 0 },
>> +    { 0xadff, 0xadff, 0xadff, 0 },
>> +    { 0xaeba, 0xaeba, 0xaeba, 0 },
>> +    { 0xaf74, 0xaf74, 0xaf74, 0 },
>> +    { 0xb02d, 0xb02d, 0xb02d, 0 },
>> +    { 0xb0e5, 0xb0e5, 0xb0e5, 0 },
>> +    { 0xb19c, 0xb19c, 0xb19c, 0 },
>> +    { 0xb252, 0xb252, 0xb252, 0 },
>> +    { 0xb307, 0xb307, 0xb307, 0 },
>> +    { 0xb3bb, 0xb3bb, 0xb3bb, 0 },
>> +    { 0xb46f, 0xb46f, 0xb46f, 0 },
>> +    { 0xb521, 0xb521, 0xb521, 0 },
>> +    { 0xb5d3, 0xb5d3, 0xb5d3, 0 },
>> +    { 0xb683, 0xb683, 0xb683, 0 },
>> +    { 0xb733, 0xb733, 0xb733, 0 },
>> +    { 0xb7e2, 0xb7e2, 0xb7e2, 0 },
>> +    { 0xb890, 0xb890, 0xb890, 0 },
>> +    { 0xb93d, 0xb93d, 0xb93d, 0 },
>> +    { 0xb9ea, 0xb9ea, 0xb9ea, 0 },
>> +    { 0xba96, 0xba96, 0xba96, 0 },
>> +    { 0xbb40, 0xbb40, 0xbb40, 0 },
>> +    { 0xbbea, 0xbbea, 0xbbea, 0 },
>> +    { 0xbc94, 0xbc94, 0xbc94, 0 },
>> +    { 0xbd3c, 0xbd3c, 0xbd3c, 0 },
>> +    { 0xbde4, 0xbde4, 0xbde4, 0 },
>> +    { 0xbe8b, 0xbe8b, 0xbe8b, 0 },
>> +    { 0xbf31, 0xbf31, 0xbf31, 0 },
>> +    { 0xbfd7, 0xbfd7, 0xbfd7, 0 },
>> +    { 0xc07b, 0xc07b, 0xc07b, 0 },
>> +    { 0xc120, 0xc120, 0xc120, 0 },
>> +    { 0xc1c3, 0xc1c3, 0xc1c3, 0 },
>> +    { 0xc266, 0xc266, 0xc266, 0 },
>> +    { 0xc308, 0xc308, 0xc308, 0 },
>> +    { 0xc3a9, 0xc3a9, 0xc3a9, 0 },
>> +    { 0xc449, 0xc449, 0xc449, 0 },
>> +    { 0xc4e9, 0xc4e9, 0xc4e9, 0 },
>> +    { 0xc589, 0xc589, 0xc589, 0 },
>> +    { 0xc627, 0xc627, 0xc627, 0 },
>> +    { 0xc6c5, 0xc6c5, 0xc6c5, 0 },
>> +    { 0xc763, 0xc763, 0xc763, 0 },
>> +    { 0xc7ff, 0xc7ff, 0xc7ff, 0 },
>> +    { 0xc89b, 0xc89b, 0xc89b, 0 },
>> +    { 0xc937, 0xc937, 0xc937, 0 },
>> +    { 0xc9d2, 0xc9d2, 0xc9d2, 0 },
>> +    { 0xca6c, 0xca6c, 0xca6c, 0 },
>> +    { 0xcb06, 0xcb06, 0xcb06, 0 },
>> +    { 0xcb9f, 0xcb9f, 0xcb9f, 0 },
>> +    { 0xcc37, 0xcc37, 0xcc37, 0 },
>> +    { 0xcccf, 0xcccf, 0xcccf, 0 },
>> +    { 0xcd66, 0xcd66, 0xcd66, 0 },
>> +    { 0xcdfd, 0xcdfd, 0xcdfd, 0 },
>> +    { 0xce93, 0xce93, 0xce93, 0 },
>> +    { 0xcf29, 0xcf29, 0xcf29, 0 },
>> +    { 0xcfbe, 0xcfbe, 0xcfbe, 0 },
>> +    { 0xd053, 0xd053, 0xd053, 0 },
>> +    { 0xd0e7, 0xd0e7, 0xd0e7, 0 },
>> +    { 0xd17a, 0xd17a, 0xd17a, 0 },
>> +    { 0xd20d, 0xd20d, 0xd20d, 0 },
>> +    { 0xd2a0, 0xd2a0, 0xd2a0, 0 },
>> +    { 0xd331, 0xd331, 0xd331, 0 },
>> +    { 0xd3c3, 0xd3c3, 0xd3c3, 0 },
>> +    { 0xd454, 0xd454, 0xd454, 0 },
>> +    { 0xd4e4, 0xd4e4, 0xd4e4, 0 },
>> +    { 0xd574, 0xd574, 0xd574, 0 },
>> +    { 0xd603, 0xd603, 0xd603, 0 },
>> +    { 0xd692, 0xd692, 0xd692, 0 },
>> +    { 0xd720, 0xd720, 0xd720, 0 },
>> +    { 0xd7ae, 0xd7ae, 0xd7ae, 0 },
>> +    { 0xd83c, 0xd83c, 0xd83c, 0 },
>> +    { 0xd8c9, 0xd8c9, 0xd8c9, 0 },
>> +    { 0xd955, 0xd955, 0xd955, 0 },
>> +    { 0xd9e1, 0xd9e1, 0xd9e1, 0 },
>> +    { 0xda6d, 0xda6d, 0xda6d, 0 },
>> +    { 0xdaf8, 0xdaf8, 0xdaf8, 0 },
>> +    { 0xdb83, 0xdb83, 0xdb83, 0 },
>> +    { 0xdc0d, 0xdc0d, 0xdc0d, 0 },
>> +    { 0xdc97, 0xdc97, 0xdc97, 0 },
>> +    { 0xdd20, 0xdd20, 0xdd20, 0 },
>> +    { 0xdda9, 0xdda9, 0xdda9, 0 },
>> +    { 0xde31, 0xde31, 0xde31, 0 },
>> +    { 0xdeb9, 0xdeb9, 0xdeb9, 0 },
>> +    { 0xdf41, 0xdf41, 0xdf41, 0 },
>> +    { 0xdfc8, 0xdfc8, 0xdfc8, 0 },
>> +    { 0xe04f, 0xe04f, 0xe04f, 0 },
>> +    { 0xe0d5, 0xe0d5, 0xe0d5, 0 },
>> +    { 0xe15b, 0xe15b, 0xe15b, 0 },
>> +    { 0xe1e0, 0xe1e0, 0xe1e0, 0 },
>> +    { 0xe266, 0xe266, 0xe266, 0 },
>> +    { 0xe2ea, 0xe2ea, 0xe2ea, 0 },
>> +    { 0xe36f, 0xe36f, 0xe36f, 0 },
>> +    { 0xe3f3, 0xe3f3, 0xe3f3, 0 },
>> +    { 0xe476, 0xe476, 0xe476, 0 },
>> +    { 0xe4f9, 0xe4f9, 0xe4f9, 0 },
>> +    { 0xe57c, 0xe57c, 0xe57c, 0 },
>> +    { 0xe5fe, 0xe5fe, 0xe5fe, 0 },
>> +    { 0xe680, 0xe680, 0xe680, 0 },
>> +    { 0xe702, 0xe702, 0xe702, 0 },
>> +    { 0xe783, 0xe783, 0xe783, 0 },
>> +    { 0xe804, 0xe804, 0xe804, 0 },
>> +    { 0xe884, 0xe884, 0xe884, 0 },
>> +    { 0xe905, 0xe905, 0xe905, 0 },
>> +    { 0xe984, 0xe984, 0xe984, 0 },
>> +    { 0xea04, 0xea04, 0xea04, 0 },
>> +    { 0xea83, 0xea83, 0xea83, 0 },
>> +    { 0xeb02, 0xeb02, 0xeb02, 0 },
>> +    { 0xeb80, 0xeb80, 0xeb80, 0 },
>> +    { 0xebfe, 0xebfe, 0xebfe, 0 },
>> +    { 0xec7b, 0xec7b, 0xec7b, 0 },
>> +    { 0xecf9, 0xecf9, 0xecf9, 0 },
>> +    { 0xed76, 0xed76, 0xed76, 0 },
>> +    { 0xedf2, 0xedf2, 0xedf2, 0 },
>> +    { 0xee6f, 0xee6f, 0xee6f, 0 },
>> +    { 0xeeeb, 0xeeeb, 0xeeeb, 0 },
>> +    { 0xef66, 0xef66, 0xef66, 0 },
>> +    { 0xefe2, 0xefe2, 0xefe2, 0 },
>> +    { 0xf05d, 0xf05d, 0xf05d, 0 },
>> +    { 0xf0d7, 0xf0d7, 0xf0d7, 0 },
>> +    { 0xf152, 0xf152, 0xf152, 0 },
>> +    { 0xf1cc, 0xf1cc, 0xf1cc, 0 },
>> +    { 0xf245, 0xf245, 0xf245, 0 },
>> +    { 0xf2bf, 0xf2bf, 0xf2bf, 0 },
>> +    { 0xf338, 0xf338, 0xf338, 0 },
>> +    { 0xf3b0, 0xf3b0, 0xf3b0, 0 },
>> +    { 0xf429, 0xf429, 0xf429, 0 },
>> +    { 0xf4a1, 0xf4a1, 0xf4a1, 0 },
>> +    { 0xf519, 0xf519, 0xf519, 0 },
>> +    { 0xf590, 0xf590, 0xf590, 0 },
>> +    { 0xf608, 0xf608, 0xf608, 0 },
>> +    { 0xf67e, 0xf67e, 0xf67e, 0 },
>> +    { 0xf6f5, 0xf6f5, 0xf6f5, 0 },
>> +    { 0xf76b, 0xf76b, 0xf76b, 0 },
>> +    { 0xf7e1, 0xf7e1, 0xf7e1, 0 },
>> +    { 0xf857, 0xf857, 0xf857, 0 },
>> +    { 0xf8cd, 0xf8cd, 0xf8cd, 0 },
>> +    { 0xf942, 0xf942, 0xf942, 0 },
>> +    { 0xf9b7, 0xf9b7, 0xf9b7, 0 },
>> +    { 0xfa2b, 0xfa2b, 0xfa2b, 0 },
>> +    { 0xfaa0, 0xfaa0, 0xfaa0, 0 },
>> +    { 0xfb14, 0xfb14, 0xfb14, 0 },
>> +    { 0xfb88, 0xfb88, 0xfb88, 0 },
>> +    { 0xfbfb, 0xfbfb, 0xfbfb, 0 },
>> +    { 0xfc6e, 0xfc6e, 0xfc6e, 0 },
>> +    { 0xfce1, 0xfce1, 0xfce1, 0 },
>> +    { 0xfd54, 0xfd54, 0xfd54, 0 },
>> +    { 0xfdc6, 0xfdc6, 0xfdc6, 0 },
>> +    { 0xfe39, 0xfe39, 0xfe39, 0 },
>> +    { 0xfeaa, 0xfeaa, 0xfeaa, 0 },
>> +    { 0xff1c, 0xff1c, 0xff1c, 0 },
>> +    { 0xff8d, 0xff8d, 0xff8d, 0 },
>> +    { 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut srgb_inv_eotf = {
>> +    .base = srgb_inv_array,
>> +    .lut_length = LUT_SIZE,
>> +    .channel_value2index_ratio = 0xff00ffll
>> +};
>> +EXPORT_SYMBOL(srgb_inv_eotf);
>> diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/ 
>> vkms_luts.h
>> new file mode 100644
>> index 000000000000..925a4a7b84e2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_luts.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _VKMS_LUTS_H_
>> +#define _VKMS_LUTS_H_
>> +
>> +#define LUT_SIZE 256
>> +
>> +extern const struct vkms_color_lut linear_eotf;
>> +extern const struct vkms_color_lut srgb_eotf;
>> +extern const struct vkms_color_lut srgb_inv_eotf;
>> +
>> +#endif /* _VKMS_LUTS_H_ */
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/ 
>> vkms_plane.c
>> index e3fdd161d0f0..db8d26810afa 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -232,5 +232,7 @@ struct vkms_plane *vkms_plane_init(struct 
>> vkms_device *vkmsdev,
>>                         DRM_COLOR_YCBCR_BT601,
>>                         DRM_COLOR_YCBCR_FULL_RANGE);
>> +    vkms_initialize_colorops(&plane->base);
>> +
>>       return plane;
>>   }
> 

