Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB59BD55E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26710E604;
	Tue,  5 Nov 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oP+gtUqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B3D10E425;
 Tue,  5 Nov 2024 18:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkZL6Q7zeZ1xVO9nedlsfq3mC0aUQQi6jg7irBXHRJYmFexP3tWU0V5BfqioUihzdJTTgDmmng+FikkkqDsirJV3zKuRoPJAxLyXs/OyWrj6EXqz8Ec8YXUjQOKISWoNikxgQpIF5jcHEiwE6eIsd97U32nkZt4oTQiRE21vf8ZmGYQle3yY4kSyBx6HWbmt4pRB/0A7aGg43cuQFYMXGZwSFl1mslgGP8RIQZo13rqsmXkt0eDBxoT5RWzJ/n0qI+TbaJAV0dnCGlaALRjrXcbclL6IsHuxNBTtet1ahc4btsWICrKke8ETbpEbnbcWuPO6uLuvF8xqaLz9vvB9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvBubuWNQmBugH+V/RWH48Q993XXvcS7C7lF6Wu9woQ=;
 b=FQeXvGB+9ot07NJDn8R6gMjAUtiFSFdFZjeDqyuoxldTtDgXez/DX2JyRbGMbeKBGcjZ+Nh7NYYS6REQrJ2dx9bxomn2l0gq7Vc/8DyPj94xMt4AccaUvFUi6BvZIZtaeDaUdYDlbbDzWU45uTNNmn+v4PfiLMYHWnVMBSlGmZFQfrGOe2kPi31osTiXh75jhgY2QXMqB2u6jjiTRk/Zq/R7qki+FSM6ihvkb49yUYE91SQTGrizPXTw30OPZxj/OVKyTX7szsQZ3t+7NqquWmwDGGIyVkz3j7w89m0YJJ8nG4eA5iWov8ztAuz54Y4eId0M7fKJJ3p7tWsbVR2M8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvBubuWNQmBugH+V/RWH48Q993XXvcS7C7lF6Wu9woQ=;
 b=oP+gtUqzAoiTmyjuftSCDmtlRN2hzkjNtmZSPXhwPM+B1zCeqG4gKVpJxuMp+XHPfPnaAHbEHjCGwI/nggDPCPUO8HHZ1D5W2laoCKh0k15VxBgdpvF6MAXyPIrTfFUtTJKfnhuImG1205rB5FpBT3aXPsq1JTMkuKyktWJM3qM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 18:52:03 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 18:52:03 +0000
Message-ID: <7889ad4f-7eae-47b7-b385-d2c3eb67dd3c@amd.com>
Date: Tue, 5 Nov 2024 11:51:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amd/display: Fix Power Gating Configuration
To: Zicheng Qu <quzicheng@huawei.com>
Cc: tanghui20@huawei.com, zhangqiao22@huawei.com, judy.chenhui@huawei.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Alvin.Lee2@amd.com, chiahsuan.chung@amd.com,
 alex.hung@amd.com, wenjing.liu@amd.com, Dillon.Varone@amd.com,
 george.shen@amd.com, mwen@igalia.com, yi-lchen@amd.com,
 martin.leung@amd.com, yongqiang.sun@amd.com, tony.cheng@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20241105140256.2465614-1-quzicheng@huawei.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241105140256.2465614-1-quzicheng@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::23) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b727d8-0b98-44d3-22a1-08dcfdcaefce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlhHS1RqdEtvUHVLN3FLTllScW9UQ0loc3pSR3lUSGo3TWVJT1RsR1ZOSCtF?=
 =?utf-8?B?YVVVQW5qZnR4VStXZmw4Y2UwbEFXdC9aYzVuVlhoR3FZdVlyUDMxbHpNbi9T?=
 =?utf-8?B?cXVLVER3ZkhUZzhtL2lWNU5jdExHQzhGOU9mcmFLSkpRN0NzbXRMK254QnNl?=
 =?utf-8?B?cGZ5bVBZUjI3cXZkZ3hHaE5rK2N1UjY3RVQrbHo4NDVOOFBwaCtwQlI1MWtz?=
 =?utf-8?B?blRxOXVSeXd4SkwwN1lubWpJNy80M1ZxaWxuYmQzMzk2VTV1Z2lIN1N3R0tp?=
 =?utf-8?B?V2RIVTVraXJ0ZkxCL2tJZ0FqbWo5dFZjVFJUdkw0UUlXUGl5Ym95VGlLUVJS?=
 =?utf-8?B?UGVyRXIranNYWTUvRmRoeHZoKy9aWGhqd3M2YzYzb2Zud2ZCQjJObVZ6NUNZ?=
 =?utf-8?B?N0dJMWhOcTlOd3JiaWFMWWpXOGRkUFhndVhnZzlSekEyK1RpRXFKUER6WHZh?=
 =?utf-8?B?Uk1JNmVzTWdsVkhxb1o4K2VqaTQvbVIzZ3FHeUU3bWczNitiTnpxd2NFbllp?=
 =?utf-8?B?a05LTmVFYXRCUUtwQzNiYzk0M1Q1ZmswYmhxTGovVkdqOE8zVVZxUlNvaWVD?=
 =?utf-8?B?OGlQVkkrblZVQjVZa0RsaDNnY0V1ZloxZnlvOHV1T1ZpNFFVaENGam5CaWI2?=
 =?utf-8?B?OEtzUnhEQTlCcTlkUFlmVm1KRzFNQ2l1RGtHWXRYSE1lTHJ2ZXFmMzRrMlFI?=
 =?utf-8?B?VWswZnptKzRkTlJCUzRtelg2Nk1raFgxaHFRdWQvb3REVHlENE4ydUl3UlR0?=
 =?utf-8?B?U25uMTEvUVVMdWNrSCtKTVNhRFB2cE5mb211SGZ4cmxZa3VsRWIrR3lmZFZq?=
 =?utf-8?B?Q2VENW5GYnZHS0E2TGsrbEw3SWNmbnBtbGJwOTJqMnI5ZVphV0Z5MFJyemNE?=
 =?utf-8?B?YzRNNXVQcEo5K2tJYWFtRTFyaE5CM2o1OUZhM1l3M00wcWFCWGRyWXRHUWNL?=
 =?utf-8?B?UlVkWisrckpxVXIyK04zUWNMbUFFSHBjcG0vZnVhL2ozVFQ3ZUNPVjZGWTl6?=
 =?utf-8?B?dVZpMldNM2RubXc3bFhubkdISGI2WHMzblpMTGZIaFVSanR5SG9yYzJwdnRX?=
 =?utf-8?B?RGVjdjFrYUY0RllTeDNBaXFGVW5mVmxSYW5YbGhMRnV6NGFDUGF5QUxRd0xy?=
 =?utf-8?B?VTlRR0RQMHV2LzlEcTRyOE5abHA4SWtBeHhxK0prVklPalhtQXBKcm1IdkJB?=
 =?utf-8?B?blhXcnBEWGFOb1RMdFAxT3VPMzAyVmZUUTIzeXdoR3lqK0RBb21Fd3B2K3M4?=
 =?utf-8?B?NWlMR3cxVFZNRnovelhnQU1rMFBSeFJZR2xjdXNFcFB0R1RhTDI2Rkp4Z3pM?=
 =?utf-8?B?d1VQUDMvc3RZMnRDanlaNDkxMkdob2g4dmhhYnhiUHZQaHVZY3NsRlF3SXJJ?=
 =?utf-8?B?NGVoSFdybmFlNFM1elliK25SK3UvUHdEUytiZVVtVHM1VHFieXhlODBDK2t2?=
 =?utf-8?B?TUErbnc3VEY2Z2ZwOVJpRm1TV0hTSEFMbEt6b0pJUmROdFBIZy81OWhWdkpV?=
 =?utf-8?B?TndTU1FEVlpBK3NOUEZzNWxHTE9tanNHVnBvbXp3d212cnRYVEkvTnJVWEJa?=
 =?utf-8?B?YkFWZ204QVFJWlRnK3I1ZWJsS3d6WmxOb0pkRGVDZGo3V2t6aWVPNmE1YllR?=
 =?utf-8?B?V3J6MmtiOEN6ZWxya3UrMlNBaDlBU0JXTkhsNWw5TUJHU2U0T01Vb29GNjBq?=
 =?utf-8?B?T05VbVAzZkNhbm1sSExWUmhYc09lRm5QL3pSdGlTbldzNFA1Z1ZIaUdTL1VQ?=
 =?utf-8?Q?0tj8HtD8Yb3N+bb7+S4cSBqc8yvjp0L8J4JmgvE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWFISVN2bGVpOW0xbk1aWDVwUzVQWE9YZmlOYnd4MEpwZVZqbEZKQm9WaVZW?=
 =?utf-8?B?b1F2djNHSXRvUFNza01OVlY1RWFTa3l1MEdPa0hHME55eGJkTFI1aFFiU2JN?=
 =?utf-8?B?bFMxSE9PMFJHNnlHamhzcUpLMDZxV2RSZzUxdTZ3dmRPUWVHM2pncVZibjJx?=
 =?utf-8?B?VEkzQlJ6UTZEYXJ3RWMwMitWVlpkaHpTeTJDdCtWR3FQOGpacU9aMDlEL3N3?=
 =?utf-8?B?RkRWQ090NmtLVXZSdS9oY0kxdmF2NERGSys5RHdUMUlzMCtVaUJvU2wvK09h?=
 =?utf-8?B?eDFLT25UNWdFUHR3T1hmV1FxVVJpclpLRHIxZzI2TlVqVjZDajNDZmsxVmo4?=
 =?utf-8?B?YVEyR1hkVVpsak8vdXBrNVBjQnp4UGcrUEwwcW9UQlgxN085UzRjdU1jKzlZ?=
 =?utf-8?B?ak1uOWVYYTc2T0JCMjFvSDRqbmFZWW1sOENlRnIvbVFQNE8wNmliTW1iNWht?=
 =?utf-8?B?Q2cycUxkTlhlSGhGSGdMbXlJSlU3elRJU3NvL1FmOUtiWXNpb2lKekR5c1JY?=
 =?utf-8?B?SWdLcFpDK0pKTFRDSE9zL0ExTVZvcStLaDNlb25SbnU1MnJTb0x1UURTbFly?=
 =?utf-8?B?N1FYNW1VSkJTMEtlNXZTa05XRWNqRHBNTUNaTTlKOG5FNFVmZi9ZNU1QeVlw?=
 =?utf-8?B?VTN0WmphSTdieFQ4c0lqeDE5RWg4aHNFNHlyU1FTQkNDNVYzeUtZd1RYUHpP?=
 =?utf-8?B?TXZ4SmxkRkFrZVNpckRmUFh0ZXZjcllLeklxeWZ3QncrRlBVYzZOYWdHSXdy?=
 =?utf-8?B?Vlg4RDZBU2Z0Rm03RmJaZ0l4dDFFUFEycitvN3l1S2RJY004ekJRdGs0NlNE?=
 =?utf-8?B?T1RWQk1XZVlGVExzSE5wL3hpWE54ckJ5M1RQZFJtbE9UK29OUUhBR1ptbXpx?=
 =?utf-8?B?SDFFUkZkNDUvcXZHajRZNnRwbW1WdnFoby9Xb0N4Y0o3eUdCazVsbitjcVU1?=
 =?utf-8?B?cTVMYlJHYi9EVG9WZ09obXFmbHdEdWpEK0xzdW9VVWhtWEc4M0pqWHlhbWMw?=
 =?utf-8?B?aTFidXlpRjROcUVJTFZnMlhuUWtEQ2xIZzVpd29wYnN2bFJFcGh2Q241MFJF?=
 =?utf-8?B?Zk02RTgzaTJ5eEEzTXJOTHUzOE01VUFBZE9EVFBIeTBOQ2JuRE9sVUVJY0FR?=
 =?utf-8?B?RXBVZ1lYNzY0SmNDOUtQak0ybGFtVDU4UzBzZitKOW04TEJtelZVLzZPQ2w0?=
 =?utf-8?B?ZEV0YzdSU3loUHdKK29Ha2Q5TUYzbTdQR1MzZ2JhZHZ4OHpnOFBhVGYrTFQ3?=
 =?utf-8?B?bmdENEJ2UHZzWVlmZEt1QW9qdlZRRGo5d2pMTy9EM3BMRXUxb2xxSzRvQXRZ?=
 =?utf-8?B?TVc2QndSNlJGS2NjUVFLcDh1bzRvOVBsOU9BNlExOENaVlc0akE4OFFQUjI4?=
 =?utf-8?B?NTJVSVpYTTBONEF5N3pVdWw5Ujh3TGpNU2JhWnRXa2gzdGxGRVFZanhmOXJ6?=
 =?utf-8?B?TjlnQVdIM3J4M3pxMW9kTU1PZVhod3hRNEdlNERQZklXK25SQWl1QnEvVjRx?=
 =?utf-8?B?eHJSbzdheWltSnFzcWpIcDRGUk1VbTZGL2h2VDlSa293YWg0S2Z5TXc1WFlz?=
 =?utf-8?B?UUVXNnJYOU5FV1FNKytYcjBhOGE2UjBQby9jWjJsaThGLzlldS9XZUlTVWd1?=
 =?utf-8?B?dmR2MmIveGRRanluSnF2eFo4dFZzZnhGOEpFV0dOUmVIaU5XM2RPZFhtSVBK?=
 =?utf-8?B?QW5XWlJXTDRvS2tXQVU1eDBBYWRsbjZwNWZ0S0JlK1pvcDRrUHpBa1MxcnFq?=
 =?utf-8?B?U3lrMzZhWGIxdGVWYnVPOTVFams0Qy9lOGZ2RlNWWEpkenczWlo5Wlk0aUda?=
 =?utf-8?B?c241N1E0MzF0L3hCa2w1VFBmaVNUb0lDRURLLzg3ZHQwdDdWRXpHVG5QaDFR?=
 =?utf-8?B?TktTWHYrUVlLMC9BSUhNSWwrcUZTUVliT3p2UVozSnYzTWdCanRoS2syazRw?=
 =?utf-8?B?MW51ejQzRWd5KzAxcWRpSnoyQ2lucEVyNnVvNnMzNlRVQlgwNXZ5VU8vYkQ1?=
 =?utf-8?B?VVV0UDRiNlhXU21oMjhna0J3ZmdRYndyU3FoS0FlVG1ONEI3bDFxckU2SW1t?=
 =?utf-8?B?UnZHT3pYcGxvQXFndU9kckVzckdsaFJGWTFZSnRPQy8zNGt1OThqMnRuSk00?=
 =?utf-8?Q?7ApNEp56r/NOxHXCVnmusMfXP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b727d8-0b98-44d3-22a1-08dcfdcaefce
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:52:03.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9A9tMWGdeOjg5TbMnqgHGoy4DXHhSUAgjn6zxYTvHZNgWjRVqrDlQjFdVql0KX4V1lB6pT58oB6W0+u7z9BIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010
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



On 11/5/24 7:02 AM, Zicheng Qu wrote:
> Hi all,
> 
> I am submitting two patches to correct power gating configurations in
> the AMD display driver.
> 
> 1. Patch 1/2 (Fixes: 46825fcfbe16): Corrects DOMAIN10_PG_CONFIG to use
> DOMAIN10_POWER_FORCEON.
> 2. Patch 2/2 (Fixes: 46825fcfbe16): Corrects DOMAIN11_PG_CONFIG to use
> DOMAIN11_POWER_FORCEON.
>

Hi Zicheng,

Do you have more details about the issue? Could you describe the bug 
that you are fixing?

Thanks
Siqueira

> Thanks for reviewing!
> 
> Zicheng Qu (2):
>    drm/amd/display: Fix incorrect power gating configuration for DOMAIN10
>    drm/amd/display: Fix incorrect power gating configuration for DOMAIN11
> 
>   drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

