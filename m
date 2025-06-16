Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF7ADB1BC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659F410E306;
	Mon, 16 Jun 2025 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1rP//rSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308B410E306;
 Mon, 16 Jun 2025 13:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7i1WvCzausveLlxsl0tcrxpmNSPBO0llAGdYcFQ3SAtYxexJcRRowk968nKbxDGCtn43n1enffOePmTOmcyCrLedg/DmLZyRdnxvlIt1u25MDhJEHgjaBUvO5f4DTq6D7ajcmD3WxldtpoN++do26DyVEcCOaRYSMpp0/ALjv2+GI9C/7BipyN8XJafdyvH4Z/uY1Bcngokf7lMYwXftuoUrL12IsMDg7kc3wBWC4FyDfvvxVOC8C+GQdvVh95O6/VqswLfZoj3+LSQnn+pQnEgOSPEdtJPngN8Wpyl0ZfmeXk504nOcZobw5sLqj7foXF2XxoHBokAsqxe3kEVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdoT1J5rFmDOUFjkDcjvHkYtb2BoxGTz1VFl3IsD8yk=;
 b=bvuS54rheBFz23qAZvjRmBwsO0bfOH0T9W677j5FGq5SJRQkuDiKbE40D0HPg+UHeoDKe/PLPhroM2Oqxna/XxMMUPR2Ro6A2CEJS9R8UAdXrUmLOZLQMD5m3c6c85cRY5FZnnTbHiQt+E8c7zr6apBSyVU/pCuOGUF72bl6UwaSY/WdTXeYpObB+qrC0IOFP9wQ8KPPb68FnmYKigd+imu+cA4M1yJ2tkUwyIbr62y9qIEbRk0z9z/Ka4aLHccT7jhd3YRKY/Ox0kAOwoKHOdlhHZpz2xBDqvZ24lNtvh+94hytl5dqDGe5Lkj+36S059KGHBntAir/upSdVifZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdoT1J5rFmDOUFjkDcjvHkYtb2BoxGTz1VFl3IsD8yk=;
 b=1rP//rSsTRdj3nsCEw2cJOTaMOHJirudkyff6Go9PEfH2MULlp9KFWRcGbafgtp7ldCCVguivFALJIy3jh2fMGQBAYPW8nZwlwdDQrYDrhf6qAvf8qe1zP+EH54Nheoq5dztg5YdAN9ZqwE7b9qE1iBubZ0VTx+oyEI2uTSqXsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 13:23:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 13:23:40 +0000
Message-ID: <04728a48-d755-4839-86b6-f4214cc2f7b5@amd.com>
Date: Mon, 16 Jun 2025 15:23:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
 <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7d0e69-d516-450a-91cd-08ddacd901fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXVFNXVEOG1nMnRNRWtjTlpNZWhQdjQzNGJzNU1wVTJjc0lDQnZpQVRIS1F3?=
 =?utf-8?B?RHZQTTl1VjlybXlBakJmV2dvVDBMcDEzc2o0dGxYV2k2Sm1QbUhyOWhTOEUr?=
 =?utf-8?B?d3FSL29xQUtyOUhub3BUOFFxNXhDVnBCRHI4Rk4yWitaVGt3Sjd3WDVrTVJJ?=
 =?utf-8?B?ZnBtYnp2Z0hXK1pMdGFNbThSSlo5a1JmRUlHQmRPOFdUQWVJYTZtMzBpRitx?=
 =?utf-8?B?dnZYRndLZURSamxINDBPUHVRZ2swaHZOeHM0RnVWYmRadE15d0Z2bGJIMnNS?=
 =?utf-8?B?bHdZWVVEKzFVWXVRUThQWU5FRG85ZFo1VjZHOHNQVDlnMERPREQ0R1JTUno4?=
 =?utf-8?B?bWxiUEplbURWSkw5ZnoxMC9GWG9VeGM3SjBCK2xPRWFaTnlqU1I1bjBERHJs?=
 =?utf-8?B?SW5lU2RJZjg2d3NiaU9pSWhnUjZBaDBQZXg4S2NEZWdFL214SkVENlVMS3JV?=
 =?utf-8?B?alE0NVFjajl4UVdoV1hqYVkyYzZBRExxNDVLQlcybDJlTXZvQmhGa2tWK2NJ?=
 =?utf-8?B?NkxETkNpQUFFSWVqOXpSdDhieWhhbmhJMDFPUnhLTGo2T09KS1R6M1VyT0hL?=
 =?utf-8?B?MVRWUVNoaGZkM01ZMjU4ekgwMDg2Y3p2MmlpZUw3T1JYUDZneWNFZS8vME9Z?=
 =?utf-8?B?eER4NytDVmtqYU1VbnRqNXlHeDNLOWJxejFWVEt6V1k0aVlSSjNnMlFGWnJF?=
 =?utf-8?B?a0VkVjV0NXg5ejdUK1dZaUxHRktTMjI3ZTVSd1ZVZERVTURBb0hGVnRISEdS?=
 =?utf-8?B?RWlXYlpaQlNFUDg5dmEvYWY1Z0s3VUNiU3lYdVg1alRseXp5WjlCRXZvaCsx?=
 =?utf-8?B?c01zb1F3bGdvQjBrcXdFV1NPelVMbmNVSVdGdndLbi8vZ3lsRnIvNzZMK1Q1?=
 =?utf-8?B?K0hHbFByZDZjdlA1UW5Za2lvNXpUZXAveDN1bUlBTnE5amhSejExQkRvVkUz?=
 =?utf-8?B?aFVpcjRqenVWRjBzYTRZU1hyZGtqNGc5WkhwOFpiNHA5TUNZbDh1NEwwME1F?=
 =?utf-8?B?KzNzQkZMVHJsd21JeVM1K1JDaTV6dlNleTd5dmdXSmdyMW1iVXBjVXBGaEhy?=
 =?utf-8?B?Y3pkeE11NktIZXphd3lmRUltVVFzU0VDM0p3eWMvUWRVdDJETlNaQkRVeHB6?=
 =?utf-8?B?YzhtVVRFN0JTQ3ZJd2RzN1p5ZUFKaDFZRzUycW91R3N4Z3Z4eUtPa21GcDI2?=
 =?utf-8?B?R3ZGbVFkTHVEQnJzbWJvMHNVK0VKaHJkOGpHR1ZFVVlrbjZuU0tiVVNidlBk?=
 =?utf-8?B?dDJTTHRESnNvNmhjazBZRTZtSG1DcWNnbW5VUWJ4eXladjRqV0dIdkdUbUJ6?=
 =?utf-8?B?cXAydnVNQ1MvMjQxSmtHUE5Td2tVTSthK2NMQlFIWUljcWFYb213Mjk3eEFz?=
 =?utf-8?B?eGkrcHR6bWx6UEFIbjY3NDBZa2xQSDViMUFiZDFaMi9tcUU1b3NtanY3R0NI?=
 =?utf-8?B?eXYrNUs1L1R1ZTFEZ2NIeStZNWErVU5NWStJSGR1b2N2bDlwM1o2eUtBaXVU?=
 =?utf-8?B?aGlGZjZHeGl2Njh6YmpmdUkxM3J3Wm9wd3crZy9XUkkzWWk4bHNkWm1ITXNu?=
 =?utf-8?B?T3cvRlhnRUIzejVnK05aekw0cnVUVzYzbkY4YVZrSXJGWDhveDBXa3o3NXRW?=
 =?utf-8?B?RmV3TXd6TlJQakROcHpxZEI0V2NpOGZobS9yOVowRlcyY0tvT21MT0Zxandt?=
 =?utf-8?B?eGhIYURPREt1M0xoYW4xZDFlVldSR25Tc0J0L2diVHp5WWhpUHVRQTdxTnc0?=
 =?utf-8?B?OW16Sk9CNXU1TUd2Zy92N09HaG0rajRoTlR4dGJoeG1LY05kNUI5a2UrWWpT?=
 =?utf-8?B?TWxmUndDRTRBbG82MjcvSTgyKzIxRWR0Z1NlTTRiaUtmTWJIZ3kvVytDbE4v?=
 =?utf-8?B?ayt3c1hRa3RlNVcyYTBPMjFmVWxYc0F6Qlp1YzU3S1B2dDBDWmNUdHhlTzlj?=
 =?utf-8?Q?EMPuZE5e5Jg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVV4bjg0V21yUEppOVJkT3kreWpqK0VzMUkxTkpQNGdBVVk0QmVneGFHaHpz?=
 =?utf-8?B?R0lHM0hwL29pRmlRRTRSakxrK2psZXJ0aHhBZXBJbHRVdWRrRkcyLytwT2FY?=
 =?utf-8?B?cm9NTC9vL1I2MXNHcDd6Um1saGVVY09LK0VFT3l0UFhPSTB3NjM5emhQTUJO?=
 =?utf-8?B?SFhoZk1JektraWhGSkh1d01TekpwL3ZJV3hnTXY4NXlSVGVoNWRDWHdDMVU4?=
 =?utf-8?B?TmlhRE80bEs3MzRGV0VyUkJxMzgzUkF0Zjl1ZGZiL2FkSDRaM2xlRFhxWkVC?=
 =?utf-8?B?TkNQMjI3Y01XNC9VYzB4Wjhra1BTZzc2L2xndndvemRHMDNKMnd3dmprWlRn?=
 =?utf-8?B?RkR2THZvZjdMcE1BY0pmNUxwbGc2cm40TDA0Nmx5Q0ZKOURFMUlLaUYyREZW?=
 =?utf-8?B?VkZKeHkwbEZDMWswTkNBaERZeDZOSTkyaHdTLzRTTEJ4WE42NUNpZFI0bjNn?=
 =?utf-8?B?dEErTzh3dUFqOGRPRUphUVdKV1hvTU9DalZYRE40OEtNa0Urd2tNSEFWcHFl?=
 =?utf-8?B?c3NmZmZuNFpDT1F0MVY4VXZZYldmSFhKMFRLd2RzUUtMRlRnVVExYjE5cXIr?=
 =?utf-8?B?dTFKT3hhbFRLNmo5S0ptcjdnWDdYdG1uTWZvMFNXR2pHZVNObDk4WTNJNFYw?=
 =?utf-8?B?V1dTQ2k3N3ZaUFM2ZlVVVWJoQm1VWTBDd2JHbVJVd0VzT1lJdXpMSnNUWmJw?=
 =?utf-8?B?bUFpTUwvZ1lNcU5NNnllVWRRcjRZcXcyWjIycnBMYkM2b1djT21GMlFURVha?=
 =?utf-8?B?dU5USjI1MGVxOHpLN2RiMElqNU4yS3FCSmpqclhobkQrYVNvUFo5YW9RTnRu?=
 =?utf-8?B?L0lGVWFDL0UwbnpXdWliT2E4a2lzNE04aExONmkrbW5tT1JEU1ZaVkxaSHJS?=
 =?utf-8?B?cEZpUS92N0ZOcDFGSk1OZDZyNTVTR1dsdWdPa2xQVFdVbENrUzA5NXovNnc2?=
 =?utf-8?B?cERXbXo5Y0hWc2tjc0poU01IejNoTVl1S2ZTeE5IKzVzYlFVclVwUHluWnJL?=
 =?utf-8?B?NEM5WWFKQVpNcWg5azVtUXAyZlFscFNMZFdYY2VTQm9ocGc2QU9NNTJJbmNE?=
 =?utf-8?B?ZVhpemcxdytHZnpBNEg4V3hGdVd3bm9pVlZPejlPdllVN3Zpd05McFRtSG5x?=
 =?utf-8?B?Sk4vbHBtWDhGdGx6MVNoMDA4ZDhiQTJIV05ESWxkVjc3QWNzM2tRTWp5VDhs?=
 =?utf-8?B?NWxQdlVnckFHdzFJRnJEcm5xbk5XdU13THR0K2FBSExDUEN2SldRclFuK2t2?=
 =?utf-8?B?Sko3NWxBcVZPc3J4MjV6ajBaMktXak9vSDE1eFJ3RjUrWmpyaTlmZ21oc2lD?=
 =?utf-8?B?VWVTU0Q2THhlNzhMZGptbHQxZDBHSDRTM1hpakp1TElFbDJnd0oyNWxxdFRk?=
 =?utf-8?B?dVhCa1IvN0xaT0UrOUNCWFU2UU5LSGpYM1VUNkFBZEtLWVYvSHFJcFoyb2Zw?=
 =?utf-8?B?SXhINDhEOUROY040WUZYcmF1TjNrRFJteXZyRENOOGY3MlZVQzBCOUFvTDZi?=
 =?utf-8?B?RmlXZjVnclhla0hyL0hpbEJ5WmdKMmxkYnp4OXhhZHNwdTd3Q0Y1MXBFRWVx?=
 =?utf-8?B?SXkyMFIzN2dhb0RPOGVwNzVFMkpWQjJMVU03LzFGemM3UVRPQ1YrWWoxMTIx?=
 =?utf-8?B?cGc0bEovMjJyZDZheVB6QVE5L3IvRFhCamdBNjBneUtjRys4ZTR1cThaTlNu?=
 =?utf-8?B?SDVxRUJvQllDQnRDR29HVi9wbVZsRW1jOW8xbFhoZmZGeHY4WHE5TmNDeFRZ?=
 =?utf-8?B?Zk8xOXBUa1ZNZDZldmQyWDZKM3FZaWhYZXNTVWo5Vk9XSHZWSjc0RjNFQ2w3?=
 =?utf-8?B?ZitnR2RxSVhna2VzUWhhczRJakpycXZ1SlFGTkIycDZ0b2xPY2NYV1I5SW05?=
 =?utf-8?B?aXZ5THdwcFp6TlpMYS9GQjdMMklQa25OT0lDS0MxVDVUbmpzRkF4eGtucUpE?=
 =?utf-8?B?QmhtM1praCtHR1BtcTVNcTdhbnRjb3NvWWtieTgzY05YV0pDa3dHeTdSVGQz?=
 =?utf-8?B?ZWFSVC9RVTYwbUNyM2pCWkpVbFVLY3oyczdFZStEM2JlcXpBZkh6cE56ano2?=
 =?utf-8?B?SVkrNGY5dUFuekh5bEdJT0pOMEdNaVFyQW5wUXZVMmJla21TTVpFVDFEQXkv?=
 =?utf-8?Q?S8Wv8Dms3s/ZLOUpcjNzWMzhU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7d0e69-d516-450a-91cd-08ddacd901fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:23:40.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH3+4PxlEUZfrFiSOxQ3sCJg8Oqih+UxQFaD37NpxGCX3hoYpiDF2YQWVVLNWiEE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
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

On 6/13/25 17:18, Thomas Hellström wrote:
> To avoid duplicating the tricky bo locking implementation,
> Implement ttm_lru_walk_for_evict() using the guarded bo LRU iteration.
> 
> To facilitate this, support ticketlocking from the guarded bo LRU
> iteration.

That looks mostly identical to a patch I have in my drm_exec branch.

A few questions below.

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 166 ++++++++++++------------------
>  drivers/gpu/drm/xe/xe_shrinker.c  |   7 +-
>  include/drm/ttm/ttm_bo.h          |   9 +-
>  3 files changed, 76 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 62b76abac578..9bc17ea1adb2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -821,12 +821,6 @@ static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
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
> @@ -861,64 +855,21 @@ static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
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
> @@ -958,10 +909,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
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
> @@ -979,21 +927,65 @@ ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
>  
>  static struct ttm_buffer_object *
> -ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
> +__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool first)

Giving first as bool parameter here looks really ugly. Isn't there any other way to do this?

>  {
> -	struct ttm_buffer_object *bo = res->bo;
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_resource *res = NULL;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_lru_walk_arg *arg = curs->arg;
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
> +		int mem_type, ret;
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
> +		if (ttm_lru_walk_trylock(arg, bo, &curs->needs_unlock))

Could/should we move needs_unlock into arg as well?

Apart from that looks good to me.

Regards,
Christian.

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
> +			ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);
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
> +		if (ret)
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
> @@ -1007,25 +999,7 @@ ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *cur
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
> +	return __ttm_bo_lru_cursor_next(curs, false);
>  }
>  EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
>  
> @@ -1039,21 +1013,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
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
> +	return __ttm_bo_lru_cursor_next(curs, true);
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
> index 8f04fa48b332..d3a85d76aaff 100644
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

