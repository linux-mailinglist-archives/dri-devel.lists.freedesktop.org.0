Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A0AE9C23
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 13:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE21110E899;
	Thu, 26 Jun 2025 11:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="llLD9dUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032FA10E03E;
 Thu, 26 Jun 2025 11:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQK14eLTUIh7sXzoMlsU4yUuSE+a72rsMgV0wjS4HwsnnfGxFaqEr7kIMLCFOORd7aw8V+9Lfr8X8LQYoAtD8x8mceeUdBeQLsRZKLZ0F5TKqMW1GrqoWUb+7FAtlj164yRMCbXGKF/HPdyYCGA4i9PcfiuMYmWceYwHz5yAc0ozo6w6yRY4ZkicFoJc1Aoras9MVEO9qwc8Ey+d/WMHWaXES7GYpDaxWHAXPkpcn7s3wh/PTV83QFXR3Sf2qYpCxGFi/+aEPRAW7VnM28QUnJBlbTfT2YasfvUgoDNdJ+LwzItK8xI48jJAidHB2bo8RAv31tN+rPSB7gge+ijFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5pCz4B30aBO5A+M0JkzTbJGOjOLcVt7/c7nhSIAAqA=;
 b=wryWgpSdAjadd/w5BMp1cvwTqs8qn9+xcrQC7NcytXKk0dp3Y3XpIKf5we6AsOEpSbRjZnP03lmNXwTs5bWKs+lvtgbYI+wGfwXmA+htY4tCYUBoSWSGNmv49YqzEJCP1ec/6quL0rTwrXXcoU+q7rKgIpOGEV4ZsOic4oQ30JbKLMuemHgVyb3qIfAonEGrsiUPten62ZRll7zDPIjKjZCKGnHWnEaALy2CP6M8mo4solGKtE+Vn+So8Mg5WpBdD/YsQkTs13nvl1FmY4ktMEi5AEIw0rHaYGTUKZOgUeklLtk1Le50kHQQpmNJDxbsVNjKputooJq9kMgeBMqFJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5pCz4B30aBO5A+M0JkzTbJGOjOLcVt7/c7nhSIAAqA=;
 b=llLD9dUT4wFgEQ6tK5G+gJ4St6YpBTX1lBjRCFuAhLcYTZaNjnvsPo8yIH5qjk8iUm1jkBTtviN1CEEYz0epIdhpR+KmreTIbvmYzeYCEj4YE7Nl5+BJd455irHYIjGO5sKh38i/edHG7i8GW0MUzOUe4GY+EWfpNaPwt5D2AZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 26 Jun
 2025 11:06:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 11:06:08 +0000
Message-ID: <bbdc49f6-313f-42df-a531-d573b247820c@amd.com>
Date: Thu, 26 Jun 2025 13:06:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/ttm, drm_xe, Implement
 ttm_lru_walk_for_evict() using the guarded LRU iteration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
 <20250623155313.4901-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250623155313.4901-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00013E0B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c8fcf9-5af7-4dd3-3b54-08ddb4a173e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVYzOFNQdm92OWhST1VMRG1wMFlwNEZIRWtZTCtTWFhJQzBlUGNaM2ROYTcy?=
 =?utf-8?B?ZWJtSmVqRDZ5My91R2xIU0kxd0pCL1J2ZW9jNzBBS3l3V3lYcTM3eDE0SU9w?=
 =?utf-8?B?c1RwV0Nrd0JqVitsQTdSZ2Fwby9UazZXMXVHaHVxQ3VaTUxnRlN3MDVYdUhY?=
 =?utf-8?B?dGt5dEN3UlFKWGhCLysxU09PQ2pwYUJnQk01TVFXQTBidlRzbFZLVThYRHJh?=
 =?utf-8?B?S2c4bHE3Y0RHOSs4MCtlY1Y0RmdZMjR0R3hHVVhqVXJxMVcxTkx5RXRVOFBl?=
 =?utf-8?B?dFg0RWlJZXdGZDNhb005bDk0R1NlUzNBdERiTXI0aUZLNFcwdmpTMzBPbTJN?=
 =?utf-8?B?VUxIcXNjdUpKcEtpV3dGMzZOaHJVcHQ0NUUyemxrcGQvRHBnTUpDNUlPak5S?=
 =?utf-8?B?Qko4ZzNDUE9JNnRXV0l0WHJqOTBPUjFVWVJkNkk3ZXE1Wnh0WmFpU0pKbXF5?=
 =?utf-8?B?NDFWdVZ1bit5d1ZwYm9NVk0rYjNRandDdkJDRW1venl4SFNwelljczR1dHBE?=
 =?utf-8?B?dHN5ckFBNWtBcVI2c3BrSUh4NnVxbTNjQkhBd3pzZXl4NGpsNDdNYlEwWFlx?=
 =?utf-8?B?M3J0NUhHa0V4Y3duU3pRbkRJQkl5eHV3dTJxWFY3SnlpUzltWFRTOGZTSW54?=
 =?utf-8?B?QjVWZzYveE9UalgrUVFZa21YL3JHeTIrT0taWEg0cmlVVFZHcUtKc3BySmNk?=
 =?utf-8?B?d3hEV25Pd2RGbThIR0FYMXdwcjJpOHpBeFRyTmdHbWJpd1hhT1MwT2Q3T1hT?=
 =?utf-8?B?TzFOb2lzUkZjZDlic05UTkFUV3RQc3VobzdqTDc1UjFCa0swRGhIdW8xWWV0?=
 =?utf-8?B?WVUyM0RJSmxOcmxHY25kWTNmR0JoOHBkVTF2N29sbm9jMGdLd1FGRlFLSUQv?=
 =?utf-8?B?ZmNxdnk2V01JeHRFTHdyY3A3YlZNMyt5QWw2WnRyL3dpWHU5azZ5VE9NSlQ2?=
 =?utf-8?B?ODc0bytoaGcxRjNhTVZrYklNZVN3UTFQU0NabHUwd0NFR2QvZUJtTUN2ZmNq?=
 =?utf-8?B?RGtwU1R5dGV2dTg1WUt1WU5NN2dvdzdyclhVYXVVMjJGWVN0aVZRTGxGbTBh?=
 =?utf-8?B?eVVGbDh6UG90aFhWU2ZaQUFEV2kxdndRTkJCTzZENW5xUWtnRHF6TDBNVzVM?=
 =?utf-8?B?YXJEK2NqWHZXcU9USHRUblJMNGdSUjVKakFQWGsrdW5xYUlYN3BqdkhGZmFW?=
 =?utf-8?B?ZXhUQkkyeHJKN1JaT2JMY2ZnTDVDYjhKc3pNaDFGdkV3MWlYZk55UlgvcXhm?=
 =?utf-8?B?b3FyWkJyUHUyczVnY1lCWWllQ2dTSjMvdHhhRE5vemZoSXQ0RnJGbmFqVG9u?=
 =?utf-8?B?MU9uRUMyaVQ3STZYRGhwUmIyNVFEbUU4YzYzcnFJMXFrK1JTOFFRS0I3UDRJ?=
 =?utf-8?B?M3k5SzZ4bWxvNTV0QndjVlU3MldDOUtaSTlhSW5VNmJqYUdrVjU4ZkpHSVhC?=
 =?utf-8?B?UFFFM0xMamV4djBZRUdJZytsZ1VDeVlVVHQzS3pxWkQ5cVpqM2hJR0ZzWExI?=
 =?utf-8?B?M2o5RkM2ZWNWWkhnWDFDWUtTWno0WHAyeDU1eTYxQzFmeWpzQW14WjZTU1VV?=
 =?utf-8?B?WHRoeXhpNzR0R2dhL3lMcXMxZ3ozM2QvMy9lTUp4akpkNklqdGgyUVIrUDRP?=
 =?utf-8?B?K25Ha0FJMzBFdVBZTU5mRi9lV0ZBditUUVVMcFd3aWxidEM0ekl0YnQ0cTl0?=
 =?utf-8?B?S0ZHcVBaazJoZ1JzeUdoVzJuN3pJWHpJN2tpYWFrU0JRcktEdXhVcEcvWWdC?=
 =?utf-8?B?eGNaczlnRnE3L1BnS01iSEtzeFRibnRLWHlBUDkwc1E5Q1o5MGNYT1VuUnlO?=
 =?utf-8?B?dGlsSm4vbXVmZWhVTWFqSzd2VE1sTUtIZU95aG5mZVpIWTQzbGwwUXVSRnNR?=
 =?utf-8?B?RnBhS0ZuOU5nVDk4djRxRThsQlNCNkdZY09xeUN4ZzZvK01DZkNqQytOSWxy?=
 =?utf-8?Q?ytsFXK3MTgs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVI4R25mOTR0b1Y5U1pQbmlibGg0OVYwUEQ4TGwxY1NOM3lUSHczdDBHTC9T?=
 =?utf-8?B?RVBXNjFDWE9CZFcvaGNCMTZNVjByRE42dHYzTXFTbGhTQ0lWSEJneVUxR0xG?=
 =?utf-8?B?V3B6dExzcTU3YnQ0ckJmVXJEZmtMVGpuV3dzdm9YWndYc3FuRTRUMGhOUEZj?=
 =?utf-8?B?ZEw1WnY5a0NKYWE4NzNyc2FsMkRmMG1hRm1tQ05ueFZhMktxS2xzams2d3dp?=
 =?utf-8?B?aFBuWExMTWs5NjZkZzJMWXFUaktiM2NETHJYYnh5UDdrMUQ1cVNQWWdmckhO?=
 =?utf-8?B?YWUwRk5WTmREVzRiNEwxaFI4M25FT1VBZUdUdGNnS2lFTlVuUTgxbTRrK2Vn?=
 =?utf-8?B?OTdVLy95aHMwVHF1L285THg0N2I1Z3JyK2EvRURBOUVJS1hhMmtJSTc0ZGtQ?=
 =?utf-8?B?dXUvd0F3dnFwRE93QkVyemcwaHdLbGtDOFJsN1pycGYvODhuL3VOcWVpN2Jj?=
 =?utf-8?B?d1YydUZSYURIMWhZM2RPYjdDYlZCSG5DaVhwTGEyaHZjVUlGN0dRU0lYNFhY?=
 =?utf-8?B?aXRMSldoQXhoL0lQTjhkRXlldUJzbVByK2pUa0NpS3pJajRmUzJXczdUa21R?=
 =?utf-8?B?V0p4SnIybW1TejFsZ1pQcUxGRGdITVZmdmlORHJJb202ZVdlSWdGemc1MVIz?=
 =?utf-8?B?ZmpTa1pnUG12SkpQMUV6UVhwNThkUnZIVDVra1U5VEhuN0xhMmZCaFNWTjU3?=
 =?utf-8?B?YXNzbHZpTTJyNnhpK2xKeEp0ZTZLb3BwN2ZkOGhzWjNLa1AxMnBMWUVWQTBp?=
 =?utf-8?B?RUQ1MjROcTdWcWlVNnRQZVlqS1BQNUZlYnRJTDBxaU8yVWgxNzEzdElPUnhQ?=
 =?utf-8?B?TVhGV01aOVBtUDVFc0RvcWt6L2JQYlVZZFhjZWV2M08rUEUvaXlRZ3Nsc2pv?=
 =?utf-8?B?TzBncXl6aU10dDcvTGpSSitvZ2JHMTQ5ZGhFQmh3S0dtdVdvUkIvbjEyMjNQ?=
 =?utf-8?B?eXVVM1RLaVdZWGlCMmdXRXBBSW4waHVlcWR3S2xMUWhFMnZXUGttSkVVNDMr?=
 =?utf-8?B?b1lPVHYvci9mS3FqY1FTZmkxVkthWFh0NXhHbEFmbjg5bXFmbmNJMGt1VDNG?=
 =?utf-8?B?cGYvWWZiZ3c1WGVaL1BkdnBvUWg4NGcxc0lrVzYxUkZrSTlrSW9XUHhxbFFI?=
 =?utf-8?B?czgrQ0FJcmh5Mml2N1hZQnpDK1gySVpRRkYzSnNBanhvN2F3cEh0Y3JwdHlW?=
 =?utf-8?B?NHY4bmozRlRrVWRoaklWQ0xwZEFpak5iZFRFRnFKN3dUNW55b3UrNTJxVUpY?=
 =?utf-8?B?cjFkMFhxQ2hpbG83cmswemxWVHQ2RW1XZlZ1eWQ1c1VSeHQ5ZmRuUTZtMFR0?=
 =?utf-8?B?aHRFcUFqWDVGM1k0S09IQ2pMTVVlUkhYVDVHV3A0K2NHTjhEZEN5bXNxRmEz?=
 =?utf-8?B?ZlNUSlFUQ1pXdFFsWDlVcEVFY242SUxxSGh3V1JROFRNMmgydHZtUHpFWndi?=
 =?utf-8?B?OElnRlhBajlmcFVTNllUTnozMlpvUklPeThyMGlJWDZSa3FHU0wrdi9nelNQ?=
 =?utf-8?B?WWVGcHNsQWE1VXQ5VVpxbWdpUFNpK0g2VHVNcGIzblhGTkpneXFNcTk0cEV1?=
 =?utf-8?B?S1dXZmtGRjFSdUc0U0hkeGkrK1M1aVZKVnZCM0RNVTNja1hJeDNTWFczSzBD?=
 =?utf-8?B?NURreEFrN1VTUTdXdHlvL3FJNWdUWFhRQlNzV28ySWhwK3JGa1QxV2xRT21T?=
 =?utf-8?B?eVdodGVIVHkrb01KSmtGbCtpSFJQcGF5TXcrS1lsZ013TXJxM1NjdFJlSzZX?=
 =?utf-8?B?bWQ1NzlZcnFvZm5paTdwZjRJdHhBR0pBd2R3SEVWa1JvSEJZNzFUQXdBczlO?=
 =?utf-8?B?MHBydnZBZEsyZVd6VDNJU2VWSTN5RklKcEZTTklIUUtxaGJtV0MvdFBjb2tD?=
 =?utf-8?B?c2x4dG41TEROaVphdzlqVUVYRFo4ZnFuZGlDMDM4ZTcwVDBsWlFoWWxuYVFX?=
 =?utf-8?B?Um9KS0pSOVZraml6bDRHbE0rN0cwWTdJajMxamZPcXp4Y1g2M2lUVUEycmJR?=
 =?utf-8?B?Vi81QmVWU201UmhyRkttZlQ4b1RqVW10SVZhVlRiYnk5aXI1bmVLcUl1NU0x?=
 =?utf-8?B?WW9kNUNGN1BPMk82L0NFcjIwdi9IM2VBaHpvN2hhci91RmlLdWk1U2JHYnhy?=
 =?utf-8?Q?OYPYdxT+XbQ3XUSmxeq/q47IL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c8fcf9-5af7-4dd3-3b54-08ddb4a173e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 11:06:08.6442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW7+EVU0WlLSJNYlHWTcdVuMdgNloHfudikOMhre09s3Z1fzuOy2Nn5HaNJg5c0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233
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

On 23.06.25 17:53, Thomas Hellström wrote:
> To avoid duplicating the tricky bo locking implementation,
> Implement ttm_lru_walk_for_evict() using the guarded bo LRU iteration.
> 
> To facilitate this, support ticketlocking from the guarded bo LRU
> iteration.
> 
> v2:
> - Clean up some static function interfaces (Christian König)
> - Fix Handling -EALREADY from ticketlocking in the loop by
>   skipping to the next item. (Intel CI)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I have a cold at the moment so I might have missed something, but still feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 188 ++++++++++++------------------
>  drivers/gpu/drm/xe/xe_shrinker.c  |   7 +-
>  include/drm/ttm/ttm_bo.h          |   9 +-
>  3 files changed, 88 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 6de1f0c432c2..250675d56b1c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -773,16 +773,15 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	return ret;
>  }
>  
> -static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
> -				 struct ttm_buffer_object *bo,
> -				 bool *needs_unlock)
> +static bool ttm_lru_walk_trylock(struct ttm_bo_lru_cursor *curs,
> +				 struct ttm_buffer_object *bo)
>  {
> -	struct ttm_operation_ctx *ctx = arg->ctx;
> +	struct ttm_operation_ctx *ctx = curs->arg->ctx;
>  
> -	*needs_unlock = false;
> +	curs->needs_unlock = false;
>  
>  	if (dma_resv_trylock(bo->base.resv)) {
> -		*needs_unlock = true;
> +		curs->needs_unlock = true;
>  		return true;
>  	}
>  
> @@ -794,10 +793,10 @@ static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
>  	return false;
>  }
>  
> -static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
> -				   struct ttm_buffer_object *bo,
> -				   bool *needs_unlock)
> +static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
> +				   struct ttm_buffer_object *bo)
>  {
> +	struct ttm_lru_walk_arg *arg = curs->arg;
>  	struct dma_resv *resv = bo->base.resv;
>  	int ret;
>  
> @@ -807,7 +806,7 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
>  		ret = dma_resv_lock(resv, arg->ticket);
>  
>  	if (!ret) {
> -		*needs_unlock = true;
> +		curs->needs_unlock = true;
>  		/*
>  		 * Only a single ticketlock per loop. Ticketlocks are prone
>  		 * to return -EDEADLK causing the eviction to fail, so
> @@ -823,12 +822,6 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
>  	return ret;
>  }
>  
> -static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
> -{
> -	if (locked)
> -		dma_resv_unlock(bo->base.resv);
> -}
> -
>  /**
>   * ttm_lru_walk_for_evict() - Perform a LRU list walk, with actions taken on
>   * valid items.
> @@ -863,64 +856,21 @@ static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target)
>  {
> -	struct ttm_resource_cursor cursor;
> -	struct ttm_resource *res;
> +	struct ttm_bo_lru_cursor cursor;
> +	struct ttm_buffer_object *bo;
>  	s64 progress = 0;
>  	s64 lret;
>  
> -	spin_lock(&bdev->lru_lock);
> -	ttm_resource_cursor_init(&cursor, man);
> -	ttm_resource_manager_for_each_res(&cursor, res) {
> -		struct ttm_buffer_object *bo = res->bo;
> -		bool bo_needs_unlock = false;
> -		bool bo_locked = false;
> -		int mem_type;
> -
> -		/*
> -		 * Attempt a trylock before taking a reference on the bo,
> -		 * since if we do it the other way around, and the trylock fails,
> -		 * we need to drop the lru lock to put the bo.
> -		 */
> -		if (ttm_lru_walk_trylock(&walk->arg, bo, &bo_needs_unlock))
> -			bo_locked = true;
> -		else if (!walk->arg.ticket || walk->arg.ctx->no_wait_gpu ||
> -			 walk->arg.trylock_only)
> -			continue;
> -
> -		if (!ttm_bo_get_unless_zero(bo)) {
> -			ttm_lru_walk_unlock(bo, bo_needs_unlock);
> -			continue;
> -		}
> -
> -		mem_type = res->mem_type;
> -		spin_unlock(&bdev->lru_lock);
> -
> -		lret = 0;
> -		if (!bo_locked)
> -			lret = ttm_lru_walk_ticketlock(&walk->arg, bo, &bo_needs_unlock);
> -
> -		/*
> -		 * Note that in between the release of the lru lock and the
> -		 * ticketlock, the bo may have switched resource,
> -		 * and also memory type, since the resource may have been
> -		 * freed and allocated again with a different memory type.
> -		 * In that case, just skip it.
> -		 */
> -		if (!lret && bo->resource && bo->resource->mem_type == mem_type)
> -			lret = walk->ops->process_bo(walk, bo);
> -
> -		ttm_lru_walk_unlock(bo, bo_needs_unlock);
> -		ttm_bo_put(bo);
> +	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &walk->arg, bo) {
> +		lret = walk->ops->process_bo(walk, bo);
>  		if (lret == -EBUSY || lret == -EALREADY)
>  			lret = 0;
>  		progress = (lret < 0) ? lret : progress + lret;
> -
> -		spin_lock(&bdev->lru_lock);
>  		if (progress < 0 || progress >= target)
>  			break;
>  	}
> -	ttm_resource_cursor_fini(&cursor);
> -	spin_unlock(&bdev->lru_lock);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	return progress;
>  }
> @@ -960,10 +910,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
>   * @man: The ttm resource_manager whose LRU lists to iterate over.
>   * @arg: The ttm_lru_walk_arg to govern the walk.
>   *
> - * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
> - * or prelocked buffer objects are available as detailed by
> - * @arg->ctx.resv and @arg->ctx.allow_res_evict. Ticketlocking is not
> - * supported.
> + * Initialize a struct ttm_bo_lru_cursor.
>   *
>   * Return: Pointer to @curs. The function does not fail.
>   */
> @@ -981,21 +928,67 @@ ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
>  
>  static struct ttm_buffer_object *
> -ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
> +__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
>  {
> -	struct ttm_buffer_object *bo = res->bo;
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_resource *res = NULL;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_lru_walk_arg *arg = curs->arg;
> +	bool first = !curs->bo;
>  
> -	if (!ttm_lru_walk_trylock(curs->arg, bo, &curs->needs_unlock))
> -		return NULL;
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
>  
> -	if (!ttm_bo_get_unless_zero(bo)) {
> -		if (curs->needs_unlock)
> -			dma_resv_unlock(bo->base.resv);
> -		return NULL;
> +	spin_lock(lru_lock);
> +	for (;;) {
> +		int mem_type, ret = 0;
> +		bool bo_locked = false;
> +
> +		if (first) {
> +			res = ttm_resource_manager_first(&curs->res_curs);
> +			first = false;
> +		} else {
> +			res = ttm_resource_manager_next(&curs->res_curs);
> +		}
> +		if (!res)
> +			break;
> +
> +		bo = res->bo;
> +		if (ttm_lru_walk_trylock(curs, bo))
> +			bo_locked = true;
> +		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
> +			continue;
> +
> +		if (!ttm_bo_get_unless_zero(bo)) {
> +			if (curs->needs_unlock)
> +				dma_resv_unlock(bo->base.resv);
> +			continue;
> +		}
> +
> +		mem_type = res->mem_type;
> +		spin_unlock(lru_lock);
> +		if (!bo_locked)
> +			ret = ttm_lru_walk_ticketlock(curs, bo);
> +
> +		/*
> +		 * Note that in between the release of the lru lock and the
> +		 * ticketlock, the bo may have switched resource,
> +		 * and also memory type, since the resource may have been
> +		 * freed and allocated again with a different memory type.
> +		 * In that case, just skip it.
> +		 */
> +		curs->bo = bo;
> +		if (!ret && bo->resource && bo->resource->mem_type == mem_type)
> +			return bo;
> +
> +		ttm_bo_lru_cursor_cleanup_bo(curs);
> +		if (ret && ret != -EALREADY)
> +			return ERR_PTR(ret);
> +
> +		spin_lock(lru_lock);
>  	}
>  
> -	curs->bo = bo;
> -	return bo;
> +	spin_unlock(lru_lock);
> +	return res ? bo : NULL;
>  }
>  
>  /**
> @@ -1009,25 +1002,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
>   */
>  struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
>  {
> -	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> -	struct ttm_resource *res = NULL;
> -	struct ttm_buffer_object *bo;
> -
> -	ttm_bo_lru_cursor_cleanup_bo(curs);
> -
> -	spin_lock(lru_lock);
> -	for (;;) {
> -		res = ttm_resource_manager_next(&curs->res_curs);
> -		if (!res)
> -			break;
> -
> -		bo = ttm_bo_from_res_reserved(res, curs);
> -		if (bo)
> -			break;
> -	}
> -
> -	spin_unlock(lru_lock);
> -	return res ? bo : NULL;
> +	return __ttm_bo_lru_cursor_next(curs);
>  }
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
>  
> @@ -1041,21 +1016,8 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
>   */
>  struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
>  {
> -	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> -	struct ttm_buffer_object *bo;
> -	struct ttm_resource *res;
> -
> -	spin_lock(lru_lock);
> -	res = ttm_resource_manager_first(&curs->res_curs);
> -	if (!res) {
> -		spin_unlock(lru_lock);
> -		return NULL;
> -	}
> -
> -	bo = ttm_bo_from_res_reserved(res, curs);
> -	spin_unlock(lru_lock);
> -
> -	return bo ? bo : ttm_bo_lru_cursor_next(curs);
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
> +	return __ttm_bo_lru_cursor_next(curs);
>  }
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
>  
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index f8a1129da2c3..1c3c04d52f55 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -66,7 +66,10 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
>  		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
>  		struct ttm_bo_lru_cursor curs;
>  		struct ttm_buffer_object *ttm_bo;
> -		struct ttm_lru_walk_arg arg = {.ctx = ctx};
> +		struct ttm_lru_walk_arg arg = {
> +			.ctx = ctx,
> +			.trylock_only = true,
> +		};
>  
>  		if (!man || !man->use_tt)
>  			continue;
> @@ -83,6 +86,8 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
>  			if (*scanned >= to_scan)
>  				break;
>  		}
> +		/* Trylocks should never error, just fail. */
> +		xe_assert(xe, !IS_ERR(ttm_bo));
>  	}
>  
>  	return freed;
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index ab9a6b343a53..894ff7ccd68e 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -529,10 +529,15 @@ class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
>   * up at looping termination, even if terminated prematurely by, for
>   * example a return or break statement. Exiting the loop will also unlock
>   * (if needed) and unreference @_bo.
> + *
> + * Return: If locking of a bo returns an error, then iteration is terminated
> + * and @_bo is set to a corresponding error pointer. It's illegal to
> + * dereference @_bo after loop exit.
>   */
>  #define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg, _bo)	\
>  	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _arg)		\
> -		for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);	\
> -		     (_bo) = ttm_bo_lru_cursor_next(_cursor))
> +		for ((_bo) = ttm_bo_lru_cursor_first(_cursor);		\
> +		       !IS_ERR_OR_NULL(_bo);				\
> +		       (_bo) = ttm_bo_lru_cursor_next(_cursor))
>  
>  #endif

