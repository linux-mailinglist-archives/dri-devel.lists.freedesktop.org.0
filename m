Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0047AFEEB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 18:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A566A10E2B4;
	Wed,  9 Jul 2025 16:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bEpXLAA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E39210E2A9;
 Wed,  9 Jul 2025 16:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sugO6SNuUqghhBDibGz/PQxhXxuqG+JngT6GHmiXMlW3VyGjDlaTQ5WYxYRUE+lSgJU55FY3sXMjh6QhbiEmRZJ7sc9LwWa6sVYJaxNyfOFWVi5t9kqV+laHSs9UOR12lsvMvdz3ezEM6TsVcqWDuxl8xqJtz/8JZhS8ijGQ0XjL9iov3va+45X2QqxiUvvNeKsGxEyXn9i0knGz6DgFju0d9GO3fPqbsD4xKXpB4vaiW+22U/P6IAtHb+gQRqcQfC+50mSGtV6diW3ZIhYNVnvF30Q+mF18KUU82ko3aMO4vGsRj22XBiiZ72Ss0EWwkzIT5hvNm353740VzQufgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YdvsiiMMuSFqJ3Nvkky8bD+J7xk+I05reb/uVUQiHI=;
 b=NJgDB5vLXgl9fNO0ElqPRADwP7KDbQGCtxXWOquKrasp3EyWakZXR84nT8ugwL1Vfhl9NL8RWMviQVdJMXzv1JBcvIYxX6kGjSxaDfYaodH5RQ/+I+kXX1jkjzoRfrd/+H6YxQqp1Zczu7guTeJSD/HJRUT+ipWSebp/wkR3jgziH/RRdnglimkMo/VPDK+sY+wkyEAO2B8BqB9lMQL+ye/jeJcLgUzVIHshZ1/uhZ5JCihgybM7kS/Z/MnbMBysAWWYQVITO+PNV9MqZOoqdNqrPW04iC6gZVeD/2ikNDZf9APK0+fZUZZvCMDhtqBc1qRz8ftinMSEyjDRyULnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YdvsiiMMuSFqJ3Nvkky8bD+J7xk+I05reb/uVUQiHI=;
 b=bEpXLAA7VY/TYZ/hdy5dxZ+C+JjoAbuwE6IxgSUXa+SmNtpWazFuubTXyUM+5o+GKx16aryqZIg/sUiAJ8OYQKFx5gMRdoBRm9edYYggE7kXxe3+jjP3y7A06bdCn9S6YZmWYQdHgJBtBDmEvZHltN52zfKH1h3145L3T8qrXAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 9 Jul
 2025 16:11:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 16:11:25 +0000
Message-ID: <6b3c1d15-9d91-4b50-92f0-ccee1146655b@amd.com>
Date: Wed, 9 Jul 2025 12:11:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] PM: hibernate: add new api
 pm_hibernate_is_recovering()
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-5-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250709100512.3762063-5-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0436.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 52df8cc4-65a6-4837-d925-08ddbf0340d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXN0WmhCbUNHRGVEenNRYWlkL0VSc2Y2RzN4T3o1cmZuNHZsLzF0ZkVkN0Vw?=
 =?utf-8?B?bFltMVF6UUdlWWdhUXRTcVBSWmMxZ1NKSFEzZnF6VU5HTVRYa3FGdTd1bkZh?=
 =?utf-8?B?M1ZQZXRtYnluZmhyZ0wrSUMrZUthWGhBSWtGUmJ1SHRGVk5mcWxZQmtSdUxy?=
 =?utf-8?B?UTdWUjh5aC9kSzFwUUxGUTk1NGh1ald4YVNHVmdqbStzcG9DUGhvZHVOcXZO?=
 =?utf-8?B?eDkwcjdHZGRka2tTR21SSFFhL1BueFNNbmQ4bCtvdEpsWHlHNG5vQ0ZVc2dR?=
 =?utf-8?B?VG8zbHRGVkZWclFZVUxMT2o2bzEzKzdER1BobHdOdW5KdVVWdUd2SStwSWky?=
 =?utf-8?B?ai85VWVJRlFDdVpQQUx3cDcyRHpYRkMxditxVU9GaDRzZ3pyd01TSXpCeUp6?=
 =?utf-8?B?NXlrb01lM3U0TE0rWklFbmJ1Z0pzQkF6NWYzUlVtTTVacTZnZnBESENDZ3Vj?=
 =?utf-8?B?aWVpczQzcCsrbzJzSmdYK3lycksyYlN1Ky90NGZ2NGt6RVVPWmZXMFZVOWhv?=
 =?utf-8?B?eENsYmFyYnExQVRWOUxtN1RvSlNGQVBJZWhvV0t0Nk5TV2QvdWNkS2RxZ1kw?=
 =?utf-8?B?U3R4Z21rN0pJUVYwTkxaM2p2SXFUZUxmU2J5V25ibUJYOS9ENmlodVY3NEhx?=
 =?utf-8?B?OVdlQXJGVTYrM3pSUkxOSHJtNG43N01FUU5JWkgvY2tJUDY2OUNLT214T2Nk?=
 =?utf-8?B?OHN0WHVxSi9CcEEvTGFwVGEya3VJTmV0dXRkVXJlOTQ2TmtsRmZReHB0N293?=
 =?utf-8?B?MGVGcnl6eDdSZXFqazVndUhwSjZDODlWOFFYZC9MbDFnZkI3QmhieGNTeWZ2?=
 =?utf-8?B?ODhXWG5uV0tOREVoRkMrVTBwT3IvRjBONnVkWTJvaHZsdDVhMmpQdW5aTmdh?=
 =?utf-8?B?djlKVTUzWnQwME9ISW44bjBaMDF1eHZHQXFOT3ZrbFFkS1BYUjlOeWdDaEcx?=
 =?utf-8?B?NElzYTRDZUl2eGcyeVhkWlhidmNqNG1acDZqVWg2cHBqNGZoMWdXVDUrR1Jo?=
 =?utf-8?B?ckFnN1M5UnRlMll1S0cxenZ6WXJIOTBqUVZwM0p3Q1g3dHNaR2IyZ2pJNDJl?=
 =?utf-8?B?cDNQNkg1RHpSeUdCUWJnWTduQlFqWVZnYmpuYnZyQmJsVndvbFRqUUpjdDly?=
 =?utf-8?B?cHU0MjFpcGR0RFdLNnE5Y0IvMFdhMWhLa1RaS2lhL1pYZmovNG9GRjJNbDhS?=
 =?utf-8?B?eFBXbnViTDZjNXRTZmxYU1hjTjZzZVo3ejJDMVV3N0VPa0twUE03QTRONDhU?=
 =?utf-8?B?ekVYbmNuNDA5RHN3OEI5OElQZWh6dlY2eEV3bHVPenpmcmwrVE4vckwzdDJo?=
 =?utf-8?B?Smd2RHk5WlhvK3lySkRwTnIyVlhRN0tpRFEwZ2MxWklSZzVGWDZnNmlsNHU4?=
 =?utf-8?B?emQ3dlI2RmZKdVNjMFZmckVwd09vby9RT2NQVnkzblRsUXQvdFhuR05EU0Uv?=
 =?utf-8?B?ckZYVDJHb24xa29YQWNmbk9tbndCazh6ZGN6MmJQWVBUUThLcFZKeWZkaVBw?=
 =?utf-8?B?bDZIaEVUMUdGU3pKaXJYK25KQnZWMmVmZmRheVNBRHJYSUhvVjY5NHh3ZllC?=
 =?utf-8?B?Z1BoUWQwRFE1VUE5T3lsZ0tzYW1vWnVHbjVmZW5sS1ROSnBvVXN5VmFFSTZC?=
 =?utf-8?B?OUVucTBZYmRuQWtOWGdXa2hIb2h5dXRtSXh0N3RjSkx4NDRMa2NZdUM3amov?=
 =?utf-8?B?VjNuRnpZOEhnczdWbE41WTBaTmhvcmVNZTh0S2JlNE90VkNTekN2a0E2c2ov?=
 =?utf-8?B?SXRtblN1Sksxa3MzYldaZ0EvM1E1eGpWV0V1eFBYMWpHOFM2TlhqWFRiT3p2?=
 =?utf-8?B?UitpM0NxSXFpZGpDTUwzbjdGRmIxdjhLS1B2UmljVlQza3VYeHZIK3U4b1ls?=
 =?utf-8?B?S213aGtpNWxKY1F6eEcwdDhITFZ5bG5XVnptS05rU211cmNscXNlT3lPUk4z?=
 =?utf-8?B?U3F3UnBHN2s2VGgxUWNNb0dyWklTNWRSdmgzT3lFRmhzWDBhNU5ERUN1ZkNX?=
 =?utf-8?B?cFVLS1F4d2VBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1FZRm5OWFdaRUNRS0NXTEtLZ2JHeGprOS9YTFlVbXlSNXNhR0lMbVg0bUxB?=
 =?utf-8?B?aE9BVHgzYUVpSEtoMFYvSTc2NnJtR1pmM3d2TXhRejJndU9yTUE4YmVjS0pr?=
 =?utf-8?B?Z2Njc3dEM2ZlMmhsZUswYnl2QWpHelNOVnFTR2JWdUY0NWEvYUZrQnpldVRu?=
 =?utf-8?B?d0ZRZnRhelFPYjdrN2Nxdk5DOE95NmtjSUgxYitlK0dzM1RITytUaXNOM2p3?=
 =?utf-8?B?VjdLd2ROMjVwb2VmMHZNM1JIU3gxcmlMSWVQS0sxTEk2SWtUTnpWV2N0bWhW?=
 =?utf-8?B?Z09mSy9adjI0eE1IMjZrb1dUVzlnNzFDRGNvbXIvejBTNUtZWldNUGZFRHR1?=
 =?utf-8?B?QUovUUlta0ZPMHZxUGdxZW9pSXZhY3lHOEs1ZURBUnlJNDlTeUdIOVFOanFz?=
 =?utf-8?B?UmJVUmt2aFZicUcydEpxd2xrMXVsNS9ETTJad0s3ZTNpa2k4aWF0bk5EdkVK?=
 =?utf-8?B?SnlBZ0l0Z2ROZ1VvbmdKQm1vYUFBS2cyMGhtUTlHL3hTWGtzWXhkVGxwWUdC?=
 =?utf-8?B?M1VNNVZ5ekNRdnhYVlJpTU5jam11SjZFRUdWcnk4R1dhTTFWZkxpaTA4NFVJ?=
 =?utf-8?B?dFNLeThoanZpcEpjTzJLbkwwOVpTQ3hmVDVCOGFaNmc2dmFuTnIxZ1NGNVVS?=
 =?utf-8?B?WmNKa1ZINTVoM1ZEd2JYWmFpSXhGMWFrQkNaalJ5eXlFaXhjdTdXWXpEVVJ2?=
 =?utf-8?B?MldqT0NZTTlqa3pwQUZyMVhuMUVVTjI2UytWVy9QSWtNZ3BkNm83ME9EQnN6?=
 =?utf-8?B?SUxjaTBJZkZOVjlQaWZFOWlrTzFnTnpUd05yTG5NNTBmcll0c01QT1JobE9o?=
 =?utf-8?B?a2VoR3ZLWW5Td0hjWWpkUzR2M1k4OHlwQ0lKRnVXVEtwM3pJUDlZbmRQVTdI?=
 =?utf-8?B?WTFBTEdreXpiRDFVMjc1b3IvQjltM0tvMnpQQ3JvemphWTR5TEtiMjBOL0xR?=
 =?utf-8?B?RlJJblhtK1h6Y3M4dFdQblBoby8wZzdhSHl2bjBvL2llS2djVnJvd0d3OGFG?=
 =?utf-8?B?cVRTWHRrWlZGeWQ1QmtrYnc0dmRyQzFvNFRmT0hVK0NMVlZJZFJBWEVDYjhH?=
 =?utf-8?B?dE1EUmtuZkdVTFJYbVhEQTRWWUlackprekFFZ2NKaHNMU2RmRXZTRm41WDY1?=
 =?utf-8?B?UnBmeWcxVWQ3U0ljdTlOMzZhbVcwK3pHUWp6dlBrWFZFSFV6N2lmQWFFdmZT?=
 =?utf-8?B?QmE2YUFjT1ltYm1lOUltZ29rRGx6RTYreGRxUERlb0pVM2pmRDF6bFovTDM1?=
 =?utf-8?B?djRHL3FxdUI2eHJBS1VvNjdYc0ROaGhqMjVwRXlGTlJzZGhOM0JPdHhVSlpv?=
 =?utf-8?B?Tmt2NEZyajFPTFFVVWhsbXhuMTFzeGY3MS9XbFpVK0NTUVA2bEVQT1FBTWF3?=
 =?utf-8?B?bCt3c3hwQld0TzRPMVFINVhnc2JKK3FQNHBQOFVkQWJ6VXNQQTNENnNzNjNw?=
 =?utf-8?B?dXlERGtZb0lGTWx3NUd0bnBLN3EveFBDNVJBbjhVM3E4TTRYUG85blJsZUxS?=
 =?utf-8?B?NTJVY2RYNzdHRnJORWtISEUxUjkwWnFldmVYOXlnTGVmV0VrZWZGd3dNWGh3?=
 =?utf-8?B?N3pPSlBBWCtBazdZRnNWZ0dZL3BHS1FKaVFLdzl5SlZFL3JHT3NCN0lGMjVU?=
 =?utf-8?B?MVFGM0hKTzhMSXUzeFZvVVFtZDlLL3JlNlJpV1BmRUw3UGN3TjVrR1dJQUQ5?=
 =?utf-8?B?Z3JjZ05SUkVLaVlGNTY3azNYb0xra2JzWUdYUWFDeVRXMjlBVUw5dmt5bFJE?=
 =?utf-8?B?Y1VoYTgxV1hKM0JoUmFyOXF0MW9WeXdKRDV1YUc2eVhSWjZBUXpPYWg0dVds?=
 =?utf-8?B?YVFEa3lTS0F2Mkp1SUJnVHhiVEsrRWtnSk9wclhMRDhRRU9yUjBDZndSbjhD?=
 =?utf-8?B?N20vRSt2b3k3dklpYjRvSDF0WndrZ3kxYkJhVTRuanNiMWN2YjNmYjBMUXow?=
 =?utf-8?B?LzdYNVVSTnQ5KzlOOXZyM0EvUFlheTVQRXFSK3BCalF4dzArYTdxN2t0ZjBU?=
 =?utf-8?B?TGNDNEpxNGh0N1JuRXFlYm5IOUpsOUlWMkI5YWQ2dmN5K1RjbHpJTTlIY1lS?=
 =?utf-8?B?d3AvYmFLRnoxM0hIOTJ4bVRQY0h4UytNNUNnUDFBTnNiQkt3aXFEY2MrbGZQ?=
 =?utf-8?Q?tZfinWdRSS3eTO5yMau/mDmNO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52df8cc4-65a6-4837-d925-08ddbf0340d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 16:11:25.2292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mh7U/i4cPEA7PwFVAvsM5hJElRe4B85fnXjGQUcPNMBHfdfiE45sgDSBqZPfV+/qtpUHzTwMhBIJFZvhSZ1z0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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

On 7/9/2025 6:05 AM, Samuel Zhang wrote:
> dev_pm_ops.thaw() is called in following cases:
> * normal case: after hibernation image has been created.
> * error case 1: creation of a hibernation image has failed.
> * error case 2: restoration from a hibernation image has failed.
> 
> For normal case, it is called mainly for resume storage devices for
> saving the hibernation image. Other devices that are not involved
> in the image saving do not need to resume the device. But since there's
> no api to know which case thaw() is called, device drivers can't
> conditionally resume device in thaw().
> 
> The new pm_hibernate_is_recovering() is such a api to query if thaw() is
> called in normal case.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>

This patch also doesn't apply to linux-next.  Please rebase it.

Applying: PM: hibernate: add new api pm_hibernate_is_recovering()
error: patch failed: drivers/base/power/main.c:63
error: drivers/base/power/main.c: patch does not apply
Patch failed at 0004 PM: hibernate: add new api pm_hibernate_is_recovering()
hint: Use 'git am --show-current-patch=diff' to see the failed patch

> ---
>   drivers/base/power/main.c | 14 ++++++++++++++
>   include/linux/pm.h        |  2 ++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 40e1d8d8a589..ff78cf96f795 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -63,6 +63,20 @@ static LIST_HEAD(dpm_noirq_list);
>   static DEFINE_MUTEX(dpm_list_mtx);
>   static pm_message_t pm_transition;
>   
> +/**
> + * pm_hibernate_is_recovering - if recovering from hibernate due to error.
> + *
> + * Used to query if dev_pm_ops.thaw() is called for normal hibernation case or
> + * recovering from some error.
> + *
> + * Return: true for error case, false for normal case.
> + */
> +bool pm_hibernate_is_recovering(void)
> +{
> +	return pm_transition.event == PM_EVENT_RECOVER;
> +}
> +EXPORT_SYMBOL_GPL(pm_hibernate_is_recovering);
> +
>   static int async_error;
>   
>   static const char *pm_verb(int event)
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 78855d794342..f54a803f2afb 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -657,6 +657,8 @@ struct pm_subsys_data {
>   #define DPM_FLAG_SMART_SUSPEND		BIT(2)
>   #define DPM_FLAG_MAY_SKIP_RESUME	BIT(3)
>   
> +bool pm_hibernate_is_recovering(void);
> +
>   struct dev_pm_info {
>   	pm_message_t		power_state;
>   	bool			can_wakeup:1;

