Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB19DBE28
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 00:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5526010ED74;
	Thu, 28 Nov 2024 23:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nc6zRuz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599110ED74;
 Thu, 28 Nov 2024 23:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcPcC/SJgM2BBjlFTA/Q++8CNC2wjZV4QgoyfnaFIzzYYi2GhmW3+DKDluBj8kFO28CYoMl3mKid4tLliGyCsvLYlCXPYlEBJSWqHe1aE2eB84Yyp5gFQgWoD2+4LNlKYwrGmiw3zwQwubhRZPQSroFXnd107VLSBW/xE3wWWPs2/uWwnLL8vzbdtmVfVg+0jr27DDM60IDTMs/YcVRrZ/y5k2iY0sKidw7EVRwy2SAfirtUjaHwff40ITk5CkUUV9VIzpP2Rkbps+rcPRb3L5IyIfjsRfWl9DfQHeo2N8rSfaiP9fwkL03li3s8h7IsH7fyR5SGKofeJq8FxkxwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkniBoy3mBvoMxBx2VcNWcstXSWDUJ+pXwdJcrsaMwI=;
 b=BRlwAe7+OEksquuMRSTU/dfhlBxFo7BLH4afegE1D9yx4ljir9Ds4FgJbTghfQ1GsCcQFVHmCNbBItzYCVdueEp21Jyi+l6qaIeH+02kwhx+0iI52rMTv9XiKg503TJ3SDTgHgwi8yvTB0/2RA4xYcydbej+rkIYl10kZY11WkdgXE9yBOd+LVJa9gp5Xm4N2Gpxe+6LA0v7PBA4PhwRlbSEqq0A6EtHo9QZi3Y0VDRgJ+w0Bak5dkSb9mQHNRcxp3fTFw/s7kSo7e8Fx97ZtRiNJETR0QfNVw3Px5fkghxjDeDCVqDSk2Xhhw8vfuNHUXqav8hu6uRh7Zgto6/9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkniBoy3mBvoMxBx2VcNWcstXSWDUJ+pXwdJcrsaMwI=;
 b=Nc6zRuz/NECoRktosY/hI+z4ATUTfo6LKsKxoXsAtsPvsfFFFYLozyEWzwlW4WLl6lXz1TAveyrAMaQIRE6eVIzjZt3xkWTyEQ+FNrw7/KsNoWoRaK7gGN7U5rF6qpu6murkmYIB+QxRLDG3Vh4ligEupZuUw0DgHaEq+QwC20TY8AYhEqsGfGEVW96F3y9xRpYeUfZhIzBEx/w6PrR/FDZde0qi3X0gLM2ruV3Ks7YagvyuSqKOlLvtaDOazS1wa37weq9UkjA06JyvqatwkZvysqhvswocJpZWh39inw2wy55910T2Tnul7VdmgDewMWJ6c3jDsFPyrhMdkVeWLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 23:42:17 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 23:42:16 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
User-agent: mu4e 1.10.8; emacs 29.4
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Date: Fri, 29 Nov 2024 10:31:32 +1100
In-reply-to: <20241016032518.539495-4-matthew.brost@intel.com>
Message-ID: <874j3rexik.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY5P282CA0061.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 301a109f-eb09-483f-be4a-08dd10064ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmhDbGhjWjk5NzJ6d1hZMENNNVQwUWtCb2dkVzlab2E5eFdlR1I2dEpOcDBt?=
 =?utf-8?B?bUxvZ0RGS1VZWlZJS251T3Z0YkZIRzVpSGdwaGczK3J6Y014N09LVDR1UVlG?=
 =?utf-8?B?T1dodUVVNHNXQndCOU9sVFYvYTE0K0VobUcxRForZTB0aFlkMDRGYVVlM0ND?=
 =?utf-8?B?U0g3SlpQSVYrY0ovWkVaRXJyQmY5bXN5VE1Wa2RmU05WTFM0UkprbFByZCth?=
 =?utf-8?B?Q0lFOTdDSThsYi80TzhGUDJRVDV4ek1IdGFidldBUlY3bjhsb1hEUHZKUWx3?=
 =?utf-8?B?Y2FOTVdxSDJaVUQ5bjQzcktDN3FQeG9YMFRPeWVwOS9jbkJuV2U0ZStvNUpk?=
 =?utf-8?B?YlE0UHd1dXlqWkZVK3M4Q0o1S1NCMFdoTG5HM0FtY2pva2Rla1pxNjhpcDlP?=
 =?utf-8?B?SGJPY3R5Rk01VGkwK1NqQW1SZnNKRU5iUGpyMjNENkZyYmg1Yldhc0Izb0U4?=
 =?utf-8?B?R3pKcS9TZUh3T0s2aWxwNyt5QVU5K3JJV0R5WHMrd1pabGRxTDdxeWI3TGhR?=
 =?utf-8?B?NWw0bGswZkVlTnhQaUdCY1lsVE1DY1R4SG1TNTFOc1V0VEhQK1JVWE5YaXl1?=
 =?utf-8?B?MHJueVZOd01LOHB0TW5IVnh0b254TzdPSlRTMzZqd1YzT0FlU2pRWGtxcEd0?=
 =?utf-8?B?dlFtVW9TUXdTM1I0dFVUSW5MbzAzTzJ3T1d2cmI0VzlBM0lqb0JDOEZTZ1hE?=
 =?utf-8?B?eTJPZ1lDbndVU2NBY0pJR3lRbDBzS2p2OG1JS2gxUk1OWVJ5RXJtQVdKZ251?=
 =?utf-8?B?b1ljT1p6clNET1ZDcWdIaVRlM2dhMURPU0hHYUc1T1JvV1JLaisvT2lreVZn?=
 =?utf-8?B?VGtVOS84bkVEbWwwam1Ua2dGd1JqSVREaUw3M2VlaDVGVkJ0ZzV3c0c3OHBO?=
 =?utf-8?B?SnpaSVFJWndsL2hiOVhHYzdma3FpL1BkaEVqNXdOdkg3aW9nT2RMdFdzKzZW?=
 =?utf-8?B?OUowSllMdW5GQ1ZjcFpCaStOY1Z5UGRsQWw3czMyQ2xXVXNwOVFkN1hYb1lz?=
 =?utf-8?B?U0pGUWZGemExL2IzM2RJdk5UWlpMaUwyM2dIY0JZTXFmem10dlFpN1pyOGpn?=
 =?utf-8?B?TVBsZFpVL1V6NisyRVl1cnp0WTlDOHlBNk9hbU53YmNobFRNVzVxQVAvQ0E2?=
 =?utf-8?B?VjQ4cVZUNGlreXR4V1RxUGJ2UTFZRk1tQWZSVldBcCtxLzc4UGc2UUpzMTUr?=
 =?utf-8?B?R2NwcmMzclhFY3hNNXlrY3RUbXNJcU93alhZbXcwSmRvSCtTYlg1T1RkOXZ5?=
 =?utf-8?B?UUVaeHJwTTBaT0xic2c2b280b2w2UlNFWjlFbFRTdXFORWZQLzhzM01NQ1Jx?=
 =?utf-8?B?WEI4NmFrQ1dmcWNtcExhcHNKTm4zaVk0MkxGcG1SZG1pYndKa1hXRmF3WXhH?=
 =?utf-8?B?SEh6MXhJWmhwTTRlUmdGUjdkK0V2YjF1NGF0T1lzY0NTUyt1Y1JPNjFyeGhT?=
 =?utf-8?B?dUZ3ZkE0NTEwSXRTc0U5d1hDL0VrSysyY2l5V091QVIyYmUzczl1N2V5TDJ4?=
 =?utf-8?B?Rmpib3JZRm5oYVVOQnM2Zy95MGlEbkVsOVFua1JyTTVCWko2em9LQVE1YW9q?=
 =?utf-8?B?R3pqK0ZUL0VjTG4vRFQrV1pFemtLZHNaUm5id29jdXUyUzQyY1ZEeGlMN3R2?=
 =?utf-8?B?T0V0NllWOTcvY1Q4RXpJK2VwZ3RZR1VQbG5mclVjTmN6RTM3VmRVVVlPcVNC?=
 =?utf-8?B?aTFMMU1lYXk4RElaQytSL1RxSzFkOFREYXhRUVRmUy95cnNiZ2FvaWNzNEVy?=
 =?utf-8?B?K0x1cTI3c0dmOGVNL2xlM0pwam1MeUJpbEhjRHRyOTd3Wm82Z0N6VWVSMlh6?=
 =?utf-8?B?VmpQS0dtZ2E0QlA0S29vdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmlaeTdWVlJTeDkwL0lXOURSbGRqTW1OMG1jamdkQmEzRzl5cXpKV1ZWK2t5?=
 =?utf-8?B?VE45R3lQbGtKTUczRmIrY0ljalYxZVVueFdDNU1uYlBCeUdPeFQxclVwUUx4?=
 =?utf-8?B?Y3lrZmNFelJvMFVYNzNQbERXeGlyRFFsVDNxMURMYnYwOWpraHhmZmtWdmpt?=
 =?utf-8?B?T0VDWW04OVJCamhKYmx6N21MMW5OUHFIWG45eHZqUzVsZThIOFl3ZWpVd3Bi?=
 =?utf-8?B?TWtTVzU2RHFQVWZleEY4a1V0NW9OTGRxYXljREdoeStXcVNldElLaXFZWHoz?=
 =?utf-8?B?SjNkMDZUTWpUR3RmLzB0VFVEM053aWNuVHh5ejl3T1RUTlk2WnR5SVJqQjhH?=
 =?utf-8?B?WlNwL0FONVArdjg2TDlqVE1PYld1TTg5OWZhVUhISmhUdWR1QzdUTjRqeGhY?=
 =?utf-8?B?Wjh3TEZ3YWk2VWIxakdsRzVReTcrSVNRcVI2MGQ0eVRvUkdSS3hCYng1R2FS?=
 =?utf-8?B?MFVZZnRZbnptSUk3c3NnL3RsaUVIemhTTFNicnVNUGJYazZyQkFqWkltaXFl?=
 =?utf-8?B?cS9BdnFzRVYwTVg4dDZlbjNFOGtUZjhEbzZBSnFaR0J2aWpwOGhCelFKVHB5?=
 =?utf-8?B?eTV1UFVTVWRFdHNtaXRjM2JEOXYxVEJLaFM1Wmp5a2t5WUg4ZVBOMFgwNWZO?=
 =?utf-8?B?Sm5tNXlSWkQ5TS9pa2RqTlhPWmdrRnhhU3ZNcWdzV2M5V0xpMHVwclVOMndG?=
 =?utf-8?B?SXF0UkhTazNNelBEL1F2bG9UOHZmREtvam1KVW9uQzBROERMTkpNYkJJV2o2?=
 =?utf-8?B?L1M5VmJNWGp3UGx6MUN6LyszeWZiK25qdWhYaUZYbHBicmRHcVlBa3ZudXBi?=
 =?utf-8?B?bmZoRzJOUzFGVytBYWJOQ3JBR2tmSkZCQUZuRFhVYldaWGNocEdwQngvUzZT?=
 =?utf-8?B?ZENNcUlMTmpPaDJKS1NKUUMrMVg0TUxIR2Erdk5PRis4WEJwa0Z3VEsxYld4?=
 =?utf-8?B?VCtBS3Z3Z29BZzY3cTlaYkl1Mzh3VWo5TU5yR01RWC9IR0dNQzVEcU5YS1pB?=
 =?utf-8?B?Sy96UTNiN1IrcHJGb1Foa0Y2QTFyT1AzcjNWRWxnSEtKSE9PWXVibzBFUWE4?=
 =?utf-8?B?bVpRZFNrSkIxTXBHZHBUeVZ3SktScWZ2RUVObm02Z3M3Z3IySlNMdno1b3Zj?=
 =?utf-8?B?MkQzMEdqTmlGVWEzV3hkeEsxNFhGcHVzWldGWjRRaTNTTkUvVk4rTURDS3FK?=
 =?utf-8?B?aFFJUGc3bGVRTDVsbjREaEJVUkYzQ0xYak96ajcvbmh6L3VlL0J4OTFrcVlu?=
 =?utf-8?B?UnBzbm1pZ05iSmIxbVhZTFdIYStsc29MazdrM1BKbGh4b0U3Y1dCWXhxanYr?=
 =?utf-8?B?SVV0bnkrMU9kd0dCKzk2YXI0RG9FbldqSjU3VnJpZm5QczQybE1IaGI3UmRl?=
 =?utf-8?B?TmxwUlJoc3phbVozR05NNHJnZGZqQmhHdUU0L1VuS1RsUzV2Rm5CQ0tTY1RM?=
 =?utf-8?B?d1BFNGg3TjZwd0RDcE52ajFpNFk1dnBEWG1uRjl2UUVMTHVmUkE4a2YxaEh6?=
 =?utf-8?B?bDlWb0ZQTS90dldCMnVET1ZqRExlZEQxbUJta3NjNTdLenJ6THhWVjd1TDBU?=
 =?utf-8?B?QXNpd284cVEwVUNEWDdzcmRLTlVUZ1NDSmNXVUhrNjBhdFloblN6ZktENzhV?=
 =?utf-8?B?Q1RwZXBpVkhNOWEwMUMreno3anNLWW91QUI0Mk40TGlUak9kdjlJb1NWelcx?=
 =?utf-8?B?clFGSmtSV0c1aWZQWWNDNXBXNnlSSzVHN2ExbWVTblZFOTVGZzVXTVh5RUdX?=
 =?utf-8?B?aTlMdTdYRlhFdWhXb09VbC9qMHh5ZlFYMkNtclhuVHFLOGlRdTRxUitTSm9Q?=
 =?utf-8?B?Q3phVHRmeDR6d0piaWQwMWM2V0llTFFncWdHc2h4akdrUnNsc0lrb2FVZW1N?=
 =?utf-8?B?OWpMMExDRUU0RUdtNndWem5RTFdzM0FiVUExaDlEa3FlMm9vcnFCdkNyd1RM?=
 =?utf-8?B?T0JJWUdoL2ZVamM2aUNrK3A2Y2FTaFY3ejN1UmJYNHNHVzUwTHVFQm1KeFht?=
 =?utf-8?B?bXZURXFTQUR6Q2hGYmlmTExGS0ZpZzZ1SHhHRGVtekNMVTduSHJSTE1MOXJD?=
 =?utf-8?B?dmcxbWVNQUMyRVZSdmpiSmRiSjQ5YlRzYWwycHJ6YXUrL3h5dkdWQ1JVYkJy?=
 =?utf-8?Q?Yj9YoLKlxB9kMBCOjpQmTFbiF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301a109f-eb09-483f-be4a-08dd10064ac4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 23:42:16.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpLxBPwuPnt645u+leYQ/p76nZtCyt0dAiZ23RBRnaDTOTLclPavwXPcd6mzAonukKdgS6p+Z5eTPM9Sgz3zbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154
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


Matthew Brost <matthew.brost@intel.com> writes:

> Avoid multiple CPU page faults to the same device page racing by trying
> to lock the page in do_swap_page before taking an extra reference to the
> page. This prevents scenarios where multiple CPU page faults each take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page being locked in
> do_swap_page, the migrate_vma_* functions need to be updated to avoid
> locking the fault_page argument.
>
> Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> DRM driver) SVM implementation if enough threads faulted the same device
> page.
>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  mm/memory.c         | 13 ++++++---
>  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
>  2 files changed, 56 insertions(+), 26 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 2366578015ad..b72bde782611 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			 * Get a page reference while we know the page can't be
>  			 * freed.
>  			 */
> -			get_page(vmf->page);
> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> -			put_page(vmf->page);
> +			if (trylock_page(vmf->page)) {
> +				get_page(vmf->page);
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +				put_page(vmf->page);
> +				unlock_page(vmf->page);

Isn't the order wrong here? In the common case put_page() will have just
dropped the last reference on the page and freed it so the unlock_page()
needs to happen first.

> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			}
>  		} else if (is_hwpoison_entry(entry)) {
>  			ret =3D VM_FAULT_HWPOISON;
>  		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index f163c2131022..2477d39f57be 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   struct mm_walk *walk)
>  {
>  	struct migrate_vma *migrate =3D walk->private;
> +	struct folio *fault_folio =3D migrate->fault_page ?
> +		page_folio(migrate->fault_page) : NULL;
>  	struct vm_area_struct *vma =3D walk->vma;
>  	struct mm_struct *mm =3D vma->vm_mm;
>  	unsigned long addr =3D start, unmapped =3D 0;
> @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =20
>  			folio_get(folio);
>  			spin_unlock(ptl);
> -			if (unlikely(!folio_trylock(folio)))
> +			if (unlikely(fault_folio !=3D folio &&

We don't currently support large ZONE_DEVICE pages so we should never
get here. I think a WARN_ON_ONCE(fault_folio =3D=3D folio) and bail would b=
e
better.

> +				     !folio_trylock(folio)))
>  				return migrate_vma_collect_skip(start, end,
>  								walk);
>  			ret =3D split_folio(folio);
> -			folio_unlock(folio);
> +			if (fault_folio !=3D folio)
> +				folio_unlock(folio);
>  			folio_put(folio);
>  			if (ret)
>  				return migrate_vma_collect_skip(start, end,
> @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  		 * optimisation to avoid walking the rmap later with
>  		 * try_to_migrate().
>  		 */
> -		if (folio_trylock(folio)) {
> +		if (fault_folio =3D=3D folio || folio_trylock(folio)) {
>  			bool anon_exclusive;
>  			pte_t swp_pte;
> =20
> @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =20
>  				if (folio_try_share_anon_rmap_pte(folio, page)) {
>  					set_pte_at(mm, addr, ptep, pte);
> -					folio_unlock(folio);
> +					if (fault_folio !=3D folio)
> +						folio_unlock(folio);
>  					folio_put(folio);
>  					mpfn =3D 0;
>  					goto next;
> @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned lo=
ng *src_pfns,
>  					  unsigned long npages,
>  					  struct page *fault_page)
>  {
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i, restore =3D 0;
>  	bool allow_drain =3D true;
>  	unsigned long unmapped =3D 0;
> @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned lo=
ng *src_pfns,
>  		remove_migration_ptes(folio, folio, 0);
> =20
>  		src_pfns[i] =3D 0;
> -		folio_unlock(folio);
> +		if (fault_folio !=3D folio)
> +			folio_unlock(folio);
>  		folio_put(folio);
>  		restore--;
>  	}
> @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>  		return -EINVAL;
>  	if (args->fault_page && !is_device_private_page(args->fault_page))
>  		return -EINVAL;
> +	if (args->fault_page && !PageLocked(args->fault_page))
> +		return -EINVAL;
> =20
>  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>  	args->cpages =3D 0;
> @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>  }
>  EXPORT_SYMBOL(migrate_vma_pages);
> =20
> -/*
> - * migrate_device_finalize() - complete page migration
> - * @src_pfns: src_pfns returned from migrate_device_range()
> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> - * @npages: number of pages in the range
> - *
> - * Completes migration of the page by removing special migration entries=
.
> - * Drivers must ensure copying of page data is complete and visible to t=
he CPU
> - * before calling this.
> - */
> -void migrate_device_finalize(unsigned long *src_pfns,
> -			unsigned long *dst_pfns, unsigned long npages)
> +static void __migrate_device_finalize(unsigned long *src_pfns,
> +				      unsigned long *dst_pfns,
> +				      unsigned long npages,
> +				      struct page *fault_page)
>  {
> +	struct folio *fault_folio =3D fault_page ?
> +		page_folio(fault_page) : NULL;
>  	unsigned long i;
> =20
>  	for (i =3D 0; i < npages; i++) {
> @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> =20
>  		if (!page) {
>  			if (dst) {
> -				folio_unlock(dst);
> +				if (fault_folio !=3D dst)
> +					folio_unlock(dst);

How could the destination page be the faulting page? I think we can drop
this check.

>  				folio_put(dst);
>  			}
>  			continue;
> @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfn=
s,
> =20
>  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>  			if (dst) {
> -				folio_unlock(dst);
> +				if (fault_folio !=3D dst)
> +					folio_unlock(dst);

Likewise.

>  				folio_put(dst);
>  			}
>  			dst =3D src;
>  		}
> =20
>  		remove_migration_ptes(src, dst, 0);
> -		folio_unlock(src);
> +		if (fault_folio !=3D src)
> +			folio_unlock(src);
> =20
>  		if (folio_is_zone_device(src))
>  			folio_put(src);
> @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  			folio_putback_lru(src);
> =20
>  		if (dst !=3D src) {
> -			folio_unlock(dst);
> +			if (fault_folio !=3D dst)
> +				folio_unlock(dst);

This one also seems unnecessary.

 - Alistair

>  			if (folio_is_zone_device(dst))
>  				folio_put(dst);
>  			else
> @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns=
,
>  		}
>  	}
>  }
> +
> +/*
> + * migrate_device_finalize() - complete page migration
> + * @src_pfns: src_pfns returned from migrate_device_range()
> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> + * @npages: number of pages in the range
> + *
> + * Completes migration of the page by removing special migration entries=
.
> + * Drivers must ensure copying of page data is complete and visible to t=
he CPU
> + * before calling this.
> + */
> +void migrate_device_finalize(unsigned long *src_pfns,
> +			unsigned long *dst_pfns, unsigned long npages)
> +{
> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> +}
>  EXPORT_SYMBOL(migrate_device_finalize);
> =20
>  /**
> @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>   */
>  void migrate_vma_finalize(struct migrate_vma *migrate)
>  {
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> +				  migrate->fault_page);
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);

