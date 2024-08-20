Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BF958B55
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10710E2A4;
	Tue, 20 Aug 2024 15:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xSgh1i8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B91310E2A3;
 Tue, 20 Aug 2024 15:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtIcBLvEKknsjJGz7fQcUTtNZk1w0jqsVJx6deqNWrKrIo5WVsyjxgbHCmJgLLSkk6x4qTEKLd5V1cpta1zu2LNzJX5WKXI6SZj0k09GkUigSBpZ+dmR4T+/t5EyAcds/aP5cdMXczncQ8ocMb0DUNXTq8RZbJH+ahE4MFGsvex+HucfG7KkA9ARTyb9vLGiwJIG7PQtkcGmcPK2ojyXzgy6/xT/lOWiZNu8YOQnWupuAROPbtSKWP7FrPv/sA+exUaANN3UMHFqyF2nbWbkuVdQkOSBzRzVzgJ8c6UgFHM/gLz2Vu5ruY8wA6sI3DMqqzcQMPpKM7gDP1ONcu8VvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAJatMnbz1EQiBcstPjEypoJEqInTDm1ETedT7mi29k=;
 b=PeOLq19F92n8bx1xyGydBwfXq+6pOiMGc7mBf75at/C7YyK05DWazyNF44OncU7FcMcR8/JEugbc0KxmoTiyjb/IdTLnX1v+yXS2SxFjglDuJEJnws+JfF028i67vuOX35trjYrs+ADj1snKv+jupbQPa2HhHYQH7YvofJ0fVB9v0whTAy44gXOLXxPWZhe9JFgUUvLX1vM+/kMV6uiN3uB6kgnvOie9ggbZ8LcKCmmJphXUyKeVfJ4SbcJD/KoiVxgNlDd0ECjNsgtnTlK0f0Q/kL+PU9TTyYGVH4gyXdQADiJUM+JR9mWBjbiu42yqaoeM6L0t5A1jvv1l2N8/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAJatMnbz1EQiBcstPjEypoJEqInTDm1ETedT7mi29k=;
 b=xSgh1i8FMoy+sBvsrDZvL04WWBxuWOV20sk6cLdgPKeiuQUKsrNAhb94Ltb5YHkUMzesc5/yRpJ2y1siUChS7Oq0zvi6a6y0PBASLP+/PTn6v/yD2ywK5UNw+jQkGzBGuYgm5u+k7nCDSgweCaSwF99FHAQIdzyxyZ9OgnbwR0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 15:31:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 15:31:04 +0000
Message-ID: <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
Date: Tue, 20 Aug 2024 17:30:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf2caa5-f48b-421c-7d89-08dcc12d1aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkFVcWFPQXZCcW5vMWNHdTZycVFqK2g3VHd3SXpQSEFhbVNrUHBOWGdHbmRZ?=
 =?utf-8?B?TDVOMXdFaU85Z2JHazBKWDhHcCtpMEZLdWlDZlVBckRsQlJ4bTVTU2ZHSjJn?=
 =?utf-8?B?S01GbGw5Qnh3NHRXc09IeUZIRmhMakpmQWNRdWl6bG00UTBFSUdJR2hZcDll?=
 =?utf-8?B?ZlRyUDJBWmYwNUhyeE1FT1F5LzQ0RmRnTW5TeTBrL0JzYVlwNXB6U3d5b2FG?=
 =?utf-8?B?dnkvSktMUTMrczFITHlXMU5KdjZVM3lUVnJuOFFFK2Npbzg5c1NxV2hlaUY5?=
 =?utf-8?B?bm9NdWpJRUYyLzBwSnpKd01uZ2J1dkhlVGpCSmlCYVN2YWtiakRMQ29SSjN4?=
 =?utf-8?B?eUZaS3dNa3Vsbm4reldIWDBXRUNJRVBVck1peHBWUnhVclhBRmthanJHbkhw?=
 =?utf-8?B?UlRDS1AwRFJaZ0FZQlcxUGtRQU9jY0RiNEx2ZmNLV1NJRzA1QU1Lek5HR2I2?=
 =?utf-8?B?Z0ZJTWZnU0d4NmNHMnN4eERQdUNvL2pHUWVoUmZ6Um11OGwyVVlweWhYcDgv?=
 =?utf-8?B?OTNCSzBhdk5sWVFsb2ltRDE1YmpQaHIzazJwNjZwbk0rNCtwUk0xQmZPTGFK?=
 =?utf-8?B?NlhJWjZjV2s3NzBOSUJtTjBUTkxRV0VENVRQSlNFK05lQVowWmtHVzJJSWlp?=
 =?utf-8?B?amkyQnQ5WE9tMVNianpCbThVd1FsdFR1VVlJQXM1ajNndnJIVVNCTXlwR0pj?=
 =?utf-8?B?bEJPYjgxS1RRMENQeDBiODFzZUVhMnNZQW5VTVMrY3Q5UDdyWXdXMEN6aHlQ?=
 =?utf-8?B?SjlKNHZVL0VrYmFaVWtEVmFrTDVQZm95c0srTXdlZi9zS0JuN3JocnpzaUYr?=
 =?utf-8?B?bC9TUFN1dUdUYWliMUVObUpIWGF0MitIRUEzTldlSUxJZHE4VjVaUlBIOHEy?=
 =?utf-8?B?cWZyTEkyL0pRbEdjN1RmbDY0K2xSWDIzS0l3SDh4NTE0ZkN3OTNhbEY0MmNo?=
 =?utf-8?B?WXlIQms3UlJ0U0JkRDdqczArejNxZk16MTBUNG9Eb3JweCtkaitpRFJ0ZkN2?=
 =?utf-8?B?RHNtY1E5R0VkY0prTDhYbnZmZ3VYVXNheTNxWVErUlNYTXorUHhEaHV0cVk5?=
 =?utf-8?B?RjN0aHdvZE9DdHJidy9JR1RSeWU2eWVVOXo0QXdvckNVZDVmeW0zTHZ1am1S?=
 =?utf-8?B?bGtIYnNGdmRTQTZQSnZ1RlJEZEY5bHdFZlc2RE9pUVIzMjI0Z0hFQkhlR0hQ?=
 =?utf-8?B?MEpaV3oxc2ZYL09NZVIzQVA5ZzhzNjJVcXRac3R1dU9lR1g4cisvL2xXTkpa?=
 =?utf-8?B?ZllpbnNZanEzdFp6V2EyaUhSSkpPRlowYml1NzNac2JENmlyYjdlRmNNS3ZL?=
 =?utf-8?B?R2tjdksxVnp4b2xSU1J5Vitxa0pZeEhXRVl1M1orRE9rWlNqVVRHWG9mQU5R?=
 =?utf-8?B?TTR3K2JvaE8zU3RIaHllNEtrK3lOcjNzQkNTU1p4UGt0elpYMlZrcm5uVzUy?=
 =?utf-8?B?cXU2L25zbDVGdmRtMlhRQytGeEpxRXlhT0hZdHQzU0lFWlBOU1FPZUFCUitr?=
 =?utf-8?B?QUIxckJpdUc2WTU2N0Uwc3NtanV4bXVrNncwNFlVb0xzS2NXVWFxa0hPUVcx?=
 =?utf-8?B?MlpGV2NnZE9KTjVoZUNxOXhWMGZ2WHh0aTZoRExIeHc5b0VGMTZuQkgyY0p5?=
 =?utf-8?B?bmVkNU1FVUptTXVnMndnSWpJcDBKdDFRZUtVRUR5ZFYxT25YNmxMeFIrTndO?=
 =?utf-8?B?UHRtQnhqVHU1TFJDTWhpVUZqV3Axb0M2bXRMUW5PaXAzY0diRnlxelM3aWRL?=
 =?utf-8?B?TEtWZW5LRm4rVUFVSU4zWHgzdGRNRCsxVjRjaGx2RDMxWkhleWRNQktRV3lk?=
 =?utf-8?B?RG0zdHdNbUxMMFFyeFRTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhVbVZWbVVGNGRHVXV0TGhQalBybTh1M2VwK0h6Y0VPcjVHUHZvVW11R1RH?=
 =?utf-8?B?M3lyMlhBUUtCTDVEL1VxYXk2a0hLclZMYnN1THptSWY3c3BUVndqQmsyTU1o?=
 =?utf-8?B?TXJ4dkI0NGhObXlFU0sraUtVN3Z5QkJxdVNPN3ZxVzJjai85bHBqUVZVSVk2?=
 =?utf-8?B?SjBFQlVkcEJmRHkzdytGV0l1WkM2d2QyeEQ3dC9VZEM5bG9RcWV3TlZydWlG?=
 =?utf-8?B?K0E4akVadGM4dkhGQzdIWWlobGhXV0JlRUZWQS8wRDFPdyt5bXBEMnlRZ0sy?=
 =?utf-8?B?eTQ5L0hSMHVaLy9lL25DYld2ZnJhT080Z0JrYUpnNlVlSWJBVU1zQjZNeHlR?=
 =?utf-8?B?Q1Z4ZTFtSWpLYUljWjMyNldqbEFWMVZvUFQwa1ZldnV1MVg1b1BXSEE1NkZK?=
 =?utf-8?B?YjhJbmxFNWoyT1pNdms3ZWl3VVh2UXc2eXF4cmlQRjRBQmpyR2IyZU55clEz?=
 =?utf-8?B?N2QyRDRiTWxxQlVkNU53UXYvcmJBTUlKZC9CSDVQSDJ4WGE3TVUxQTlWTzJV?=
 =?utf-8?B?SEcrMEZXZGNKdTVPRzhvYjJmTXp4Z0MvN3dWYXpiZUpyM2FBRmk5bnVIY3hZ?=
 =?utf-8?B?YTUxUzVmL09MYUVuRXVmalpKN3ZKb2tucGxpL2lwSmZhL1AxdkRXZm50WTNy?=
 =?utf-8?B?UWpnNTV3VHUrejBwcmVoTDlxMVowWEpTb09LTEtodkF0dmtzbXhmTEpvQ1E5?=
 =?utf-8?B?NExJaU5kazM3aUxmWGg2bnMyeUFxZFJaZUZQWmpmTytoRWtXNlYvQnpRWTlJ?=
 =?utf-8?B?c0tiQTJWZzdLWGF4MHlSc0pFemJBalQ4OW5rK3RUc2lyOTFtZGduNEVvVXY0?=
 =?utf-8?B?d1o0V1dhSzdSbVFSOFZzQ3g5cTBWQmZYVm03SmMzcXFJaXc2WEpGR1FIVUNK?=
 =?utf-8?B?cmE0d1lsTVhXNGJkTzhOSTBTR3Q1a3hJaE83SXhZWVAweUs3K2thTFRNK2Zp?=
 =?utf-8?B?TG1lVEEvVmc3UjB3RmdHVlhkUjd5MkxiYnBaTGkzRTBEWkdRazhKcGFVdVpR?=
 =?utf-8?B?a3ZtdlhORmFSclVDUTBDU1FTNlZXWndKRmxoaEdEWEdUZ0VQMzdkU0dlamFz?=
 =?utf-8?B?M2pteDlFMTVGQzR1aUlyZHdTNEtCNzZyY3RTWmpjZFpFeUZ2RFVxSTNFd2tX?=
 =?utf-8?B?NE8zVFFHcFhNZ3BXNHlmU2tWQzJaSjR5UXJ5SXJxVmJhUTdGK01kSGdJQzFj?=
 =?utf-8?B?Ymx4cXBReGRXcmtKait1VGNESjBEWWNVWlU3OWdtZ0FVMDNjMTlndDJSWFdN?=
 =?utf-8?B?djZnOXhFUFBjZjFibE90WWpCQkVaK3pUeWdKY3BQVkVRODUzUGtkS0lLRWc3?=
 =?utf-8?B?QW1qNFpRVldHOUt6OEY5czk5VnpUVDEyY0FwS1NBMFovVXJiRzU5OG1JRDVS?=
 =?utf-8?B?OGZlYzl5UFhJZFczaEtNdnNWS0dReGRLR1JHTFBYbTArRHRMeEx2bVB1Y3pK?=
 =?utf-8?B?dnpjOGNHcUF0cjNHdUxpaVRPVStkNVJSbXRmV2FLa0dYWlh4MlloUGxjYlBE?=
 =?utf-8?B?KzJIZ1lUclZRek5Razd3S21qazZzR2c5dS9LTU1VbDhwWlFCd2pyUmpTM3Ny?=
 =?utf-8?B?R3VZaHlOd0lzcHl4eU5NYkhRV0E0bEJpT0FNNDY1UHI1UE8xdW1YL0JNdGpw?=
 =?utf-8?B?Z0RpSzVsaTg5Qm1xQVRCK2dUbnp0dG9sSXN4R1ZSUjNNYlVNNTZDMG11cjIr?=
 =?utf-8?B?M1MyZ01CdW9YVERGRUZBZ0krZ1Q0OERYblkwalBGZmQ1RGNWV3lvRTlVamhZ?=
 =?utf-8?B?TTFDQlJNL2hPWGpacG9NOHpHWnNFME0xUXpXT05meHN5Wmp0bUYrVDlOMXlG?=
 =?utf-8?B?WUNpWC9YR0xPa2RUaVpWU0g2aHRlMVJtQlY4VURucWdFaHBPMmllcDhrbjZy?=
 =?utf-8?B?ZCtBMXlNaThMWmg5R3VwU3ljclovZVJSRno5dFh0YjI0UHBVSWZSL0FKa0Mv?=
 =?utf-8?B?azYrS0k3cXV1Ri94WDl5Q05ZWHg4dXZ2OSt3L0E0UlFpaGw3WDdGUjVNbEcz?=
 =?utf-8?B?VXJOei9Tb1hsM1V4Ym85dHR3UXlGaERzK216b2t2ajlmSUd3K2FNRjA4L3Ex?=
 =?utf-8?B?RHdJanltM2V3eVB4Yy9kYXZkTXNiUlhvY0JwN2tIUTRSWnFTNHVYRTRDQm5a?=
 =?utf-8?Q?t7Iw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf2caa5-f48b-421c-7d89-08dcc12d1aaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:31:04.6519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TnPFFymXwLQow/VGl1Cqte0XXhD1J7H7vdEakvXE4HfVOdXJFpXUGLeHgOfFFt0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
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

Am 20.08.24 um 15:33 schrieb Thomas Hellström:
> Hi, Nirmoy, Christian
>
> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>> releasing backing stores if they want to skip clear-on-free.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> What happens if two devices share the same global TTM pool
>   type and one that does its own clearing. Wouldn't there be a pretty
> high chance that the the device that doesn't clear its own pages
> allocate non-cleared memory from the pool?

That's completely unproblematic. The flag indicates that the released 
pages are already cleared, if that isn't the case then the flag 
shouldn't be set on the TT object.

If one device clear it's pages and another device doesn't clear it's 
pages then we would just clear the pages of the device which doesn't do 
it with a hardware DMA.

Regards,
Christian.

>
> /Thomas
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 8504dbe19c1a..935ab3cfd046 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
>> *pool, dma_addr_t dma_addr,
>>   }
>>   
>>   /* Give pages into a specific pool_type */
>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
>> *p)
>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page
>> *p,
>> +			       bool cleared)
>>   {
>>   	unsigned int i, num_pages = 1 << pt->order;
>>   
>> -	for (i = 0; i < num_pages; ++i) {
>> -		if (PageHighMem(p))
>> -			clear_highpage(p + i);
>> -		else
>> -			clear_page(page_address(p + i));
>> +	if (!cleared) {
>> +		for (i = 0; i < num_pages; ++i) {
>> +			if (PageHighMem(p))
>> +				clear_highpage(p + i);
>> +			else
>> +				clear_page(page_address(p + i));
>> +		}
>>   	}
>>   
>>   	spin_lock(&pt->lock);
>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool
>> *pool, struct ttm_tt *tt,
>>   				pgoff_t start_page, pgoff_t
>> end_page)
>>   {
>>   	struct page **pages = &tt->pages[start_page];
>> +	bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>>   	unsigned int order;
>>   	pgoff_t i, nr;
>>   
>> @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct ttm_pool
>> *pool, struct ttm_tt *tt,
>>   
>>   		pt = ttm_pool_select_type(pool, caching, order);
>>   		if (pt)
>> -			ttm_pool_type_give(pt, *pages);
>> +			ttm_pool_type_give(pt, *pages, cleared);
>>   		else
>>   			ttm_pool_free_page(pool, caching, order,
>> *pages);
>>   	}
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index 2b9d856ff388..cfaf49de2419 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>   	 * fault handling abuses the DMA api a bit and dma_map_attrs
>> can't be
>>   	 * used to assure pgprot always matches.
>>   	 *
>> +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
>> handles
>> +	 * clearing backing store
>> +	 *
>>   	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>> USE. This is
>>   	 * set by TTM after ttm_tt_populate() has successfully
>> returned, and is
>>   	 * then unset when TTM calls ttm_tt_unpopulate().
>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>   #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>>   #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>> +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
>>   
>> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
>> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>>   	uint32_t page_flags;
>>   	/** @num_pages: Number of pages in the page array. */
>>   	uint32_t num_pages;

