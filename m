Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12660AF0D4F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8805110E315;
	Wed,  2 Jul 2025 07:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RIr4Ipc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3310E313;
 Wed,  2 Jul 2025 07:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtE+odt0bG28Neege+VgWjSAa41YbYsHirw0em1eKo6jCpas9G6B0E34j5NaP2ZbYM87movnCJjLvFcRhvcdqwnQ1SjDX44y9qAdtRlj42fQd9WRxQs56MgP+mZNBOl0r4oO58C2lOK9OwtCkkmWNvunS/RxEYIOPquROpOPgrie/MiPmrg2ow5S/3LLKJMFaBpbTz1SepHBye151G+YoFO847K3fY/S0waXBjGgHIc+3LhdpVlSva7sXd0NMbTOM5caAgA2XgCf1q4yJE6KhO0VmeUE5+pnuYYAivERZHuM0kquVdbPGiRxh0OJGF9c90ctSDgLo1sux66SrdwT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjzE8MsfgCevI15XgUvnMdOFnF2bdXJTQ8oNM87Ujso=;
 b=yucipmapEDKzOCxyp+wP3Jv0AgtwoMoYYCUllDMNy9J4OoXoXQuVMvIs9UfsUcSC09GzUABTQ3+IHWmpVVXYZ40HcC73g9oeixPai1AKvGTiQYTZbx9Y2f9yKHg8QVmVUJDjOgBeQv6hjceYqsgWSYEdxo+Tlbh+tFT6B7jCepTUZ71sXvBlnKaYIWTo1EIXh5wTojJmrazlksqWTgqMVJIM3OcB4yKvZ/5i/TGkf+gvDnYwmi83oYP72ndaGBGJUATJkER6OEFHrX8bl2KGUIxwN6+wwe/qir5lMr36XRqca0mkrIXOVcYi176/Z5k60XJTlzCCQDqhvMFY6Zf64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjzE8MsfgCevI15XgUvnMdOFnF2bdXJTQ8oNM87Ujso=;
 b=RIr4Ipc2+tzQNjykc6YiMamMt73sv5k/CHhSTkIUYVW3/4ydJrtWXAk7hTtFkyWNxBvCCiS/xvjsxi25Mni4wN69PP99gNAAHO/Z72mHLln68V3Hyv9HYtNfZBu8Jv0XVtshfv8TJD3MWojO18wReSC3LybwwgPfUNQr3Dg7aQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:57:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:57:33 +0000
Message-ID: <39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com>
Date: Wed, 2 Jul 2025 09:57:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/amdgpu: Dirty cleared blocks on free
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0287.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d31ba5-2d49-42af-ef1f-08ddb93e1a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1FYaVBGbDJlTEpJOGtqbkl4Rmc1eTBJSTByVGYrMlJJODI2SE5Jb0JiSWtk?=
 =?utf-8?B?a0I3enVNRjI1THNjdzFobUpNTGVQWXVmMGRGV055NkFvL25uZEtYcGsweExW?=
 =?utf-8?B?MzhBS1pJTUxxUnVUd3BZZVlzRW9aTVFQdmJuZEJCcVZnbUVMcWptaUxsOWR4?=
 =?utf-8?B?a2tXd3ZQK1BITHVId25ZTk1QT0VncGloL1ZIVUlzVk0xNEs3bXNoODdNcmR4?=
 =?utf-8?B?bXBab3krejQxamVCYm9qMWRiM3JXRUZjNlBxcEsxb0ZuVmdVWms1anUveHh4?=
 =?utf-8?B?MUE5ZG9sWTA2dHNMV3E4RWt5N2tUN0RsU1g0NUFNM1VkbG11RDUxQW9QZHNt?=
 =?utf-8?B?dUtJdmJDN3B3dVFUN2oraTYvNkgvT1NxT2k4aFlMSUtBZDlBUHY4ZExQVUhE?=
 =?utf-8?B?VUl0Y2FIV3VjRHlHU2dZRVBDK1RWU01oS0NxUTh4cDIzWEdhZW9Ya1NpUUdE?=
 =?utf-8?B?VThocXF4ekFTWW9zc0o4OWRxaFRpeGFBQUVaYmtKTFJJRGpCQ3hYTDl4T2s1?=
 =?utf-8?B?dHBBRVhZbXZyeTZNU2QvaUxxcDF5VDNNZzhhOEhZV3A2UjVMYVlRWXRlRElt?=
 =?utf-8?B?aE9EMjc1M3JBNHY1RFp4YjVhNW5UUzErcXZ5NW00Ukk3UFBDbjRFOHZ2aFZq?=
 =?utf-8?B?TWs2ZGVSSVpteUtFaGY5T25IT3RmV1V6L29zTnB0K2JYek1HbXc5enN6SGR4?=
 =?utf-8?B?cmRGZ0kxTCtSMWYrUmcvN0w1UTJoM014TnBFUWJ2TFBWdVJpOUJ1MytFOWtw?=
 =?utf-8?B?eFBiVmw1ZTVnZitId3FUa2YvTVN3cnBnN2Y5VUJmTmpCL3JnUlFXdEVPMEwz?=
 =?utf-8?B?NkdxczBCZHVmN0dQSjFGRWE5RGw2bWpLajFhN0l0V0oxSzJTMzQzY1NhaW11?=
 =?utf-8?B?M0RMMGl6VDJYZEZqU0ZLMTZXVmJtTGdFTmtaV0J1VEpkbld0YzZGdXZaUUM0?=
 =?utf-8?B?ck45OUVMYUhzbi85Wi9xRndIK1U1bGlSRktYMmtVVWJNMytjQktweENEc0w3?=
 =?utf-8?B?Mzl3bmNzOUphTXlYTUxZQnFvM21pUUsxd2ZPSUpZQVVObEhHcW1jTWpJWCtU?=
 =?utf-8?B?ekptQS9YdGpETmc0aXNUd28rM285V2xucS9vSm5hbmhSZXJBeFZJeHVLZm1W?=
 =?utf-8?B?eUtqTWlBbXgvR2dQT1YvWEhpTENsbmg1REJLM0cxU2xwSm92eHpJL0ZyWTVK?=
 =?utf-8?B?aG5JK0liS2hEWGxaWHJDSnNFZ3hlcWJzRE0rMnF0UGZtbmRRRk5QaHlWY3FZ?=
 =?utf-8?B?R2dUaFg2K25adHJ6U29UKzVqMU5hTTgyNDBCMWlMUGJJM3dwQ3VlRUlwd29z?=
 =?utf-8?B?NGt0T1BoaGFNb3h6aE9nR25XbGdrLzN6RmZFb2Y1VWprdW04d0VldE8yZEZl?=
 =?utf-8?B?YzRwUE56VEU4OWtXTUdLZ09WV0daZzE4eDBqczI2ekIzZjY3RFUxRm1zSm1D?=
 =?utf-8?B?c09jenAwTGFDU2FRM0xqdWgvMUJCTGJ4Q1BaQ3g0VjVIcHZJQlNHK3ZMdXJY?=
 =?utf-8?B?Zk5xQlNrT25kV2lZd1VBMVgwUVBhT2xNYk5DZE5qWlBBaEhXNHFCYmtETnBX?=
 =?utf-8?B?Vkl2L0F5R0puN29UZ2lNNzgrRXl6NUUrelYvS3VGVXZqTm90cXlpdy9KMXVG?=
 =?utf-8?B?VEtHa2J5QnBQRjIyTjhYMEVZbzdtQStTNllTYlZkQklkRTdmSlIwZzBmVkMr?=
 =?utf-8?B?emUyTmEyUlc3ckJObVUxRW5DRFcrMnlWRUpicGx4eTdTK3h0cmJUam51SGpl?=
 =?utf-8?B?b2Vwc2VleUJiRDBsUG9KL0ZER3F5V3RsNWoreDNLU1pQODRRVEJyT3RLditJ?=
 =?utf-8?B?VDVsNUUvMnhaKy9yRnpHYllOSEQ4eXNFRzI4TnZ1bnQ0Vmx0VE9IOTY2Mm5S?=
 =?utf-8?B?MG9DR04zVms0Y050Tnc5c2JtWWRyQ1JvenBFVWVhOHNYSmo0NGRGSUl0REVF?=
 =?utf-8?Q?utjxqu34K/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzkxMU40dWNhOS9LTEFiczErZ2dTdnR2Rmc1VjB6ZnNzWTJBaHYwNDhHNklz?=
 =?utf-8?B?RFlEYkN4OWlLd0tSOHlsNjhzekxzUUpyU1RMVWVHTm5pMnpkZkVZTzBia0Nm?=
 =?utf-8?B?MVRvMWoyTXVqcGVGbkc5bmZNVkgrV2dwWVh2ZC81ZjFiYmhpVlRydTJMWjJ0?=
 =?utf-8?B?QkdBM29GQlFqQ2c1SUN1OEwzeE41dk9vQk9MTnBoSDFTTTBqMWtQZzF4QlBO?=
 =?utf-8?B?L0E5M3VSSnZiV0MyRW5UbVdXYW55dFVmMnBsOERqbU9mc2VLRjgzdjZHL0RM?=
 =?utf-8?B?VzBuelFJTFF4YU1MbmEzSWY1RU9vVTl6RXJsWjEzZVVUZ0g2SXBOMitBcGJ4?=
 =?utf-8?B?ZGc3U1dVQUN2YVEyMFN0ME9pREtKbzhySkFJOGRHL1RtKzgvM01IUkNoREd0?=
 =?utf-8?B?ODhnM3ArK0lIOFN6YVdqQ1JaZXl3VnEwV0lFQ0tCb011ZmM5bmZ4bWdaeE1H?=
 =?utf-8?B?b3hhQXk3dWV2ZVA4cDB1UWxEb21QeVovVkpoSS9BY1pmSUdTVTlsbTdWS2NT?=
 =?utf-8?B?UUZ4dkJJNXR0M2M3SXl6ZDdiM0NtYU5VUUYwOS9DSGl0YWRxbVhKRGNzdnpj?=
 =?utf-8?B?TEhzR1FnQTdqMVRjMVB0ZFkwYitGYTdsZGpSVVh0NXVDaUlxakZHVWYrMS9q?=
 =?utf-8?B?V2h5YXp2QXhFWTlVbWpDZTZGTHpkWUkvaGZ2RG9DQlZpWTVDT2FPejVmNmp3?=
 =?utf-8?B?dGFQOXVXZkpvcmpqd0hpQTRydm9mRHlUWDY4d1h0SGROSmFjWjViQ0hvMzhq?=
 =?utf-8?B?S0FLWGhKaStJRnNOb0NoakMwSlRxQjh3OG1pdFQ2WnNsdUswNEh4VDkzcERO?=
 =?utf-8?B?Q3B1UVZZelZ5QzJzRzEyYVNHeExTbCttOFc3Sk1sQ3ZacmFzcEw5bDBMZ0lw?=
 =?utf-8?B?R3pqVXlXdXlmZ2hZbW5wbmYwTWNNSzZYM1BielNNYWRRMWU4V29VR2xXc21R?=
 =?utf-8?B?cjdNWlh6RDlTSVVtRG5PZDRkemIrUmx2YWQwZkpRYjQyMUtST2t2RERUblNp?=
 =?utf-8?B?MTJwSVN3UWhYT0xacENSdkxoRDVUaUR2ZFArQXdML2diQ3Q1eDhGVFlia3lM?=
 =?utf-8?B?T09oYndLSFl5SnVqcHh5Q0s1WE1zNU94aUVzNkduTHFaZGhrd3ZnTmw0TkZu?=
 =?utf-8?B?MGg4NWFTTWl1WkJkeS9ZUmhuVzAxWDJaRWpZTTB3blJIVlZMQzZVUTRhN0U4?=
 =?utf-8?B?RjJWMHRISit1blY2d0d5QTBWRWJEWXJYdEFDWWxvamhiU3gzN0NSRUp1UVhV?=
 =?utf-8?B?TTQreWR6MU13UGFiTTNOcEJlbm80akhadkFHbHJYVnpXSkMvd2N1OGhUWWRv?=
 =?utf-8?B?QVh1Zy9lMUtNWm9yK3MxZkhpWWgweGhkTTZTMWNqdTFhTjg5K2ZObVJVZHcv?=
 =?utf-8?B?bHdOZytjQlIwcFJDSHhydGQ0ekNPaDBNZU1DYWE3QkpkNktRcHBkMFFORW5V?=
 =?utf-8?B?WFdnL1pncXhVVjM0MHB1VTNsSmFKUjdIUGhINXIxK0FZd3RSNTBCWXBHNVp6?=
 =?utf-8?B?blUwTGtTanVycFFJSzdQQ1E0S3VTa0cyeGJhbXlzdm8waERTWVVkYVRObzVl?=
 =?utf-8?B?Uzd4RktBdUUySm9mOVJ0eVB3c0J1ZFJuUGczaWgybEh3WlAvMitCb1ZVVHpF?=
 =?utf-8?B?d1plWFBhTE9iTXNXaGxpR2ZabEVTN2RZNC82VW91R2c5UGh3akZNYUdKNHc3?=
 =?utf-8?B?QjMxTnpFN3dYTkxqVW4yMDcrNGh6RHh5MmppTlJvYUVTUVZlcTBvMVdXcUdr?=
 =?utf-8?B?ZE5iY2YyOXJ5Q1ZsVnFhdEgvRFZ4VUxCRnNMNEFUd3RFaUgzTnRLZXMrZ1pL?=
 =?utf-8?B?ZzkyOFFqRVo3R1dZelJScW4xOHo3Q09EY01hREFkMjhSNEJLTnVHRGNIN28r?=
 =?utf-8?B?dWlRMlk2aXBUdUhxWTgrL3dsdTVpY08ybzFLaHVod0RQOXlQdE1qK0U2MzFQ?=
 =?utf-8?B?djJwNzcyakZZQnRyN2hmMXBZc20ydndPc2gxa0V0b29FWSt3N3RxVFpnMUcz?=
 =?utf-8?B?TEMxU2FWVTVvcTArWHZMc3I5VEFGVDJucXlEVXZuOHEvYWlvRUpEL1kwRVN5?=
 =?utf-8?B?OE1NNHNFY28wc1lCWUVQcGFuSzVCbVcyTDE2MnF5S0Yzbm9uRXU2d1V5SzdZ?=
 =?utf-8?Q?DC8tCsHAamKs+Axa9hOGXrfdZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d31ba5-2d49-42af-ef1f-08ddb93e1a1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:57:33.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl93aZz6toC47XlOnEiTXK2kL2OoG4j0IBQ6KXfCmPJGyU0/l6A2kyz2fhiLjSXL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
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



On 01.07.25 21:08, Arunpravin Paneer Selvam wrote:
> Set the dirty bit when the memory resource is not cleared
> during BO release.
> 
> v2(Christian):
>   - Drop the cleared flag set to false.
>   - Improve the amdgpu_vram_mgr_set_clear_state() function.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9c5df35f05b7..86eb6d47dcc5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -409,7 +409,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> -			amdgpu_vram_mgr_set_cleared(bo->resource);

Mhm, that looks incorrect to me.

Why don't we consider the resource cleared after it go wiped during eviction?

Regards,
Christian.

>  			dma_fence_put(fence);
>  			fence = wipe_fence;
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index b256cbc2bc27..2c88d5fd87da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>  
>  static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
>  {
> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> +	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
> +
> +	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
> +	ares->flags |= DRM_BUDDY_CLEARED;
>  }
>  
>  #endif

