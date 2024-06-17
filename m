Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EC90AEC5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F6F10E3B7;
	Mon, 17 Jun 2024 13:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IdRW6Aat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2710E3AE;
 Mon, 17 Jun 2024 13:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsqB6qmtZpPmms2OC4r5eSYgSV7u7Z6OMv94GWz8tqkBhTp/ZRMDxYddaT1osELiB4vG4j1Rb9fveYBR2ESIwWKpQqmVLXJ3+HLOwuBttDb9/1TpLOR8sUoGF8URwUGAa9U+hdskXgmc6C3e6GxSiUu742Qx0ND/IR83++sDRo9c2MrjpI7oGjiJf73RaPdUyQi0bb2OMVSEgl0iWXL5839wpKto9j97NxLej1scStikJwkpbNKei2BCwu1gcZLoonZexPnKv5e7iIZ1WmzVXed9IFQuVAQoW9/YM0nB40+qQNqxmbvVz+O2o0zA28aBBjhVNsgmk+sG7i6I4Uy1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA1VLaSytNI2jM5CKHivj/5IudRGcvQeVEt0raR3pac=;
 b=Kgu5FEzbyY8dvGbkL583Bsi4lchHWDKQ9qThaCr/3L6JCEmNjri1BhfoOU8mO5SA+GkPCAf7/WQRQGI3D80D0wDaWh3cuF/sjYesABURb5ZpFk1WoeU9/sWNv44s6521GKVVG0K89eEhm7YcygdYifReZfuc2AMmhPd5LT2iTa9CSneLe8yZ3lPdL7HmEoDHS5oPSYodoyx7/1xFc6ZqcZy631d6X6yt3pzpvwN6E51Tl1oiN0nkAtiTlLC5NCQfylYixjjoOa7zXbocL/VfW0V54296L55QihkaCxotyw8ycr+SUCQqzIBxL1GYbAya1bdqfcXenN0mXVRmaeGKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA1VLaSytNI2jM5CKHivj/5IudRGcvQeVEt0raR3pac=;
 b=IdRW6AatOcdcBd2PwlvdyQ0zCnLY8KmLotvZXiVNfHgHN1kiZWvOjM1SUFw5XrjVbTuw1ymv7KfchXkkG0uOcm0DSFwZKDp/VHvGGokErKfsnlQQOZtIUmP8HB5fIPEwbBc/Kr8XyojhAu0ljEispNx5Zz2FRwPsEZhyis/rpJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by IA0PR12MB7532.namprd12.prod.outlook.com (2603:10b6:208:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 13:09:16 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 13:09:15 +0000
Message-ID: <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
Date: Mon, 17 Jun 2024 15:09:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Icenowy Zheng <uwu@icenowy.me>, Alex Deucher <alexander.deucher@amd.com>, 
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|IA0PR12MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ba21df-5ee2-48fb-5e25-08dc8eceb076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVZFcU1TUU1YbkxLTnRmd3ZyNDV4QjUyRmxBTGduNEpBbjFTeGlBc2dwNmYz?=
 =?utf-8?B?NUtrUk01aGhnWmJMYnU5U3ZDSld2VkF5dUFVRjNIMkMwTnc3UGRPYlV2S3My?=
 =?utf-8?B?NkpKczNFK3A4MDhLWWRnMVIyVXprMVVua0xMaXNmVWhtUm9FdWpyNmViMmVC?=
 =?utf-8?B?RzVsejhVU2ZtRXdnQUtpMkVmbS82UDVRbEVSVFByK1k0ZTNkS1VjRUorTkhx?=
 =?utf-8?B?c01ibmo5c0t5RGlLU3dPcHl1M0djYUZiUDlVdkZFREM0eHZSZWRWdmY3K1J2?=
 =?utf-8?B?RTJOZXExQ25GcFlUOHFpMDlEcEpnNFJpYW0rRDRBUnpWUG9Uckhwbk4xWXBK?=
 =?utf-8?B?elduZ1BBaW9DYTFLT1dSYVNEYkdobCt1M2F2eWtRa1kyZldHTVUvdU5JSFhX?=
 =?utf-8?B?ZDNRWkd0V0lHc2M1UFpKZWx3djI5ZzgzU3FTeHk4RlN4YzhkYytxbDgvRndx?=
 =?utf-8?B?NWR0UEJrYk1hU2c2WlNtZUZDSzZ0bXFXa0xTOXp5NkVyOXc2eGRGUVVtZm02?=
 =?utf-8?B?QzV6aHJMRldNL0xqa0ZSbll4NUw2eFptc0s2cTcwb3R5bWV5VGRLck1nempv?=
 =?utf-8?B?bGdIRDg0RHFaQlVRVEwxUnBZYUdzNExORkx4cVg4WVoyemc2WDUrMm9NTnRs?=
 =?utf-8?B?VVA5T3pKbm5RTys5QUFENWU0aWR4LzJydGVZL2xSUUk3STdzZEozMVQxWnVS?=
 =?utf-8?B?SG1QK08xMWFrODhPMGptRysxM2ZZdzYvcXpIUEJGUU5YZ1NoeW9iTG5Bclow?=
 =?utf-8?B?TDBoOUQzTTN6RXJCU2RaYTBLdzA1djlKbXd1Qk1jMlo2K1VDcmM4Sm5FbjFE?=
 =?utf-8?B?WEpZdEJRK3N6NytucDdVSzIxcVdNVm91bTNZMHpYaEpGMHRlTkt4YWNtS0NT?=
 =?utf-8?B?OGhPWjBSZllSeFJxUGU0UTVlTEZCSVVZalB3LzB0UFIwWU9zQWtodlZXWldm?=
 =?utf-8?B?RGw3SHpKSGU5KzBTY2JJVG5qcHRETVJ6UENNVkN1ZS9jTURVY2hvRE0zVUVP?=
 =?utf-8?B?SmgvU0pFR2loUnFXVVQrOXU4OC9JSExGUkdtQ1A1eWJudDd3SHVvanhMdWN3?=
 =?utf-8?B?WE44bzVhN0dEa1c0d3pqNUNNK29UV2NsL1l1cEViOVN2ei9IMTVIQVRFcmcw?=
 =?utf-8?B?cmh4eHczZnowM2c3ZXA0Q3VHU1NsWUtLQnphbEJHN21NZDlBK0lUME1JUnJS?=
 =?utf-8?B?OVl3bVo2ZTVxQ1Rnclh4TW5hUC9aMmNNUzdQV21tT3AvSExURU96bjF5bFY4?=
 =?utf-8?B?cDRnSU05UFhBd3lDZzdielNvYjcrMkZUdWpGcURkSmhKWEVXZVgzbnN3VXp5?=
 =?utf-8?B?WU5ZTkxoSWRER2NMSTlkZ3NqcElYWVNXNmRXWExMUlVDZFJWbEt2ZzZENGRX?=
 =?utf-8?B?aXpxbEcrcG1HVXVTMXU4S2VQTXdiK0FqaWVnV2xhRXBBZi9RU1k1YlRRbUVl?=
 =?utf-8?B?eUxmK0s2eWZ5N0psK2hZdFVEa3hVNmhqUEtHUStQQWROMmlPV0F6MmthMjJS?=
 =?utf-8?B?cnlKaU1NVGcxRFhmbyt5RnZmejhuWWFTTHNxeEFZYVl1RE0xeHBrcWx0L3VW?=
 =?utf-8?B?bnkzRDMzMjJSR21CMWxrb0NTUGEwQ1JseVA3alpReEFPQzRDQVZJWjBrWndY?=
 =?utf-8?B?QlN3dDdFcDBJaUhjRHB1ZDlMVExaOUZoWjZaM3lJdU85VEdnTGE0aHVoUVo2?=
 =?utf-8?B?S3Z1OGN3dlhJQmQwSGNxLys5Q0dMczF0SFNFalpsbHZVTkFpZGw5eCtLMjN3?=
 =?utf-8?Q?kS7Ul9k3OOhGDbENRTIJEqSy6zcKu31hBPz7RdE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlzcUluVVM0V1VGZmxHQ2pkcmc4ZTNqLzJ4djdSU09BWVVjMFNMTmxSU0ts?=
 =?utf-8?B?Sms3ZjU5NHR0aWdRSytmVlpnWFdXanZqWnp5YWpjNytoWGNkUjMzaHdnSXlY?=
 =?utf-8?B?alZ5Y25Zck9nTkZrR1R1R25acTBad0VnNWhSUkhGa2pZTmhRR3hKeUF0Rmp5?=
 =?utf-8?B?QUNxejVMTGpGcXNpYnhraGdTdTlld25WcXRkVnJ3NHpKd3VqdGg2blkzV3lh?=
 =?utf-8?B?NS91QTNOSC9MdWJIc3YrTks4Z0hDTFJJc05WTlNoeTZRMC9ObDlxbXFRaVA2?=
 =?utf-8?B?TFAzQTZxa1VWMlE5SHBtZ05KbC9RMyt6cys3dnpSL3hLWVkwZ0hEQWtzNFk4?=
 =?utf-8?B?TGdRTUgzQTVhdWplSW42VjVEV0N1QTVjYm9UT2IzQmVjS0MwT2V1M0N4aW1S?=
 =?utf-8?B?T0ZhaVk3N2N2R1lYZktydGdHc2Y0LzVac054aitQWFVBVkNlVFQvbmI3L0RC?=
 =?utf-8?B?V0ZNSVh4aFZOb25IaFRSbGZ4NEowQ051OW9SNHhJb3FzTm9BZ2R5VFRyZmFk?=
 =?utf-8?B?N3hCaW1ES1R3dXF0OHZBaVlsNkNvclNhRmtwNGNZYlRLVDB3cjVUVGFTNFdw?=
 =?utf-8?B?Y1NPcGp2NzhJa0ZqdU8vNVFEalNCRGVwbVM2ZnA5TWhZK2xTQTZ5WkFYOTZG?=
 =?utf-8?B?aWZURnRPQmw5YmQxQ3NRd3BTcmVPbVI2OEhTNm4zUEQza1FlQlNwT0d6OEV5?=
 =?utf-8?B?MWdnY29UQ2VxRnlvclptZXZJZWU3SWVMK1ViSVV5RlJraHFLalE4bG1acHY4?=
 =?utf-8?B?N3NxcGJjclFyZGxzSzBBZ3ZtMExna2E5aXpPVXBQMElieWpZRFpTS2ltVy81?=
 =?utf-8?B?U1JIQnB3bVJ2NmNoYzc0ZzhwL0NxTzNPRTA5aDVEN3JCZmM3cHE1dkVzN0I2?=
 =?utf-8?B?dVNVTmpuVG9SZ01COG84andGdVM0YnFRdzdYVXoxeFZQL2tNYjZUakJQOVZa?=
 =?utf-8?B?eGNXdW5FZGdZRDJiRzViT2FDNGNQVk4ydGQwekVRTDlVdjZ4dTQ5czZncnB3?=
 =?utf-8?B?bHNoWTJCcUROY0NtNkU2KzRIUEprRGdNekU3UVhwam9DQ0hXZmtvUXAvTVlm?=
 =?utf-8?B?LzQyVk1lN1FNdFhZZXJHZzYzaEsxZWtBK1BDRWJKR2JlakNsRW90ekhRaVFl?=
 =?utf-8?B?eGpLQU5WdXF3MzVsYVU1N3pFZXZsZzZVcTRycDBTczJjUWFpQ0tKaGlNTXpB?=
 =?utf-8?B?UFppR1BydWR5cDE3WmUxYzJCMVlwQlhtdjZtdmN2TGNab1N3eWgvRVpuWERL?=
 =?utf-8?B?QktYT0xhdzd4N3FxTGgwQkNtSHMxU3ZPem1QR2pFR05aemVpb1gyUGVLVXgr?=
 =?utf-8?B?T2dUZzd3ZG92L1VCczZqUWtoNXlaUTlNT05iQTBNZVlvMEM5ejlCMk1TOWxL?=
 =?utf-8?B?eC92c3BVTzZOQTNrU3paU0J6a2o4VjZ5S3A0Nmd5cFY2Sk40bDZxdCtCeTFD?=
 =?utf-8?B?TmFYSTZZTU1lTytvNmZJVm5YZEtxZHk0UVJYN2VISk83dlg0NW1CMlh5NlVD?=
 =?utf-8?B?eUxsSkw2ZzJ6L0RBUzJQSjZRRjJHWjRpcDk3emFndU1hSTQ1TCt5Z1VJZVVB?=
 =?utf-8?B?K3NxTVZFMnI5TTVPb05TN0RRdXZoTDhnZ214ZmFucjhxSjVvT3hkYkNpYjJo?=
 =?utf-8?B?NDRGSmlGa3ZZU0tRMVVBbEwrMGlTaC9ZRnFad3RadW9jZFR2dEorVXFsbkNS?=
 =?utf-8?B?YndBNUF1K1A4NU5yMmtxS2l5dWhvT0dMUGpMZ3BScUtUa2ExTE80VTQzZlZt?=
 =?utf-8?B?V2l2SlI5OUNHbWxRdGxVMjZXY0dGcEJUNXlYQnNsVldEZDhLdDV2U3VkWXdH?=
 =?utf-8?B?UHkzUHVVVUU2a3RxWS9JSVY3SEtMRExuRDhudkNLZ0NraGlpZ1VVemRBZ2N5?=
 =?utf-8?B?aGlCMGJlWUkvQytHVmk2YXVPcDM4aWhaRWg1YXhmcVV0YzZ5MU1acVpGMTNw?=
 =?utf-8?B?T2FxWmtHYUhOcGlnK25ibEVuQUxRRFk2cmxNcEdwYmZmYVFpYnpvQk82WjVu?=
 =?utf-8?B?YzE5YmtyV0xWdHViRHhFd2tVZEtGbTZYNzNKUEMrdTU5UEFvUnhDdm4zZklH?=
 =?utf-8?B?UXVrQ3I0aG9CeEE4b0RGRFN4dGpwZjRBaFJxWGo3YitteGtyTys3dEJnaEl4?=
 =?utf-8?Q?UfN+EgyaKRcH0nXmeSwW1XsaT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ba21df-5ee2-48fb-5e25-08dc8eceb076
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 13:09:15.7892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnEOq4wYdR+M0QmoBLGCp6mN424GM+vkcQQf3iT2NrwRbL3FFteHaIvyyrB1DA5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7532
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

Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
> 在 2024-06-17星期一的 14:35 +0200，Christian König写道：
>> Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
>>> The duplication of EOP packets for GFX7/8, with the former one have
>>> seq-1 written and the latter one have seq written, seems to confuse
>>> some
>>> hardware platform (e.g. Loongson 7A series PCIe controllers).
>>>
>>> Make the content of the duplicated EOP packet the same with the
>>> real
>>> one, only masking any possible interrupts.
>> Well completely NAK to that, exactly that disables the workaround.
>>
>> The CPU needs to see two different values written here.
> Why do the CPU need to see two different values here? Only the second
> packet will raise an interrupt before and after applying this patch,
> and the first packet's result should just be overriden on ordinary
> platforms. The CPU won't see the first one, until it's polling for the
> address for a very short interval, so short that the GPU CP couldn't
> execute 2 commands.

Yes exactly that. We need to make two writes, one with the old value 
(seq - 1) and a second with the real value (seq).

Otherwise it is possible that a polling CPU would see the sequence 
before the second EOP is issued with results in incoherent view of memory.

> Or do you mean the GPU needs to see two different values being written,
> or they will be merged into only one write request?
>
> Please give out more information about this workaround, otherwise the
> GPU hang problem on Loongson platforms will persist.

Well if Loongson can't handle two consecutive write operations to the 
same address with different values then you have a massive platform bug.

That is something which can happen all the time throughout the operation.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>> Fixes: bf26da927a1c ("drm/amdgpu: add cache flush workaround to
>>> gfx8 emit_fence")
>>> Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 12 +++++-------
>>>    drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 ++++--------
>>>    2 files changed, 9 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>> index 541dbd70d8c75..778f27f1a34fe 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>> @@ -2117,9 +2117,8 @@ static void
>>> gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>>>    {
>>>          bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>>>          bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
>>> -       /* Workaround for cache flush problems. First send a dummy
>>> EOP
>>> -        * event down the pipe with seq one below.
>>> -        */
>>> +
>>> +       /* Workaround for cache flush problems, send EOP twice. */
>>>          amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP,
>>> 4));
>>>          amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>                                   EOP_TC_ACTION_EN |
>>> @@ -2127,11 +2126,10 @@ static void
>>> gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>>>                                   EVENT_INDEX(5)));
>>>          amdgpu_ring_write(ring, addr & 0xfffffffc);
>>>          amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
>>> -                               DATA_SEL(1) | INT_SEL(0));
>>> -       amdgpu_ring_write(ring, lower_32_bits(seq - 1));
>>> -       amdgpu_ring_write(ring, upper_32_bits(seq - 1));
>>> +                               DATA_SEL(write64bit ? 2 : 1) |
>>> INT_SEL(0));
>>> +       amdgpu_ring_write(ring, lower_32_bits(seq));
>>> +       amdgpu_ring_write(ring, upper_32_bits(seq));
>>>    
>>> -       /* Then send the real EOP event down the pipe. */
>>>          amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP,
>>> 4));
>>>          amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>                                   EOP_TC_ACTION_EN |
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>> index 2f0e72caee1af..39a7d60f1fd69 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>> @@ -6153,9 +6153,7 @@ static void
>>> gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>>>          bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>>>          bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
>>>    
>>> -       /* Workaround for cache flush problems. First send a dummy
>>> EOP
>>> -        * event down the pipe with seq one below.
>>> -        */
>>> +       /* Workaround for cache flush problems, send EOP twice. */
>>>          amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP,
>>> 4));
>>>          amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>                                   EOP_TC_ACTION_EN |
>>> @@ -6164,12 +6162,10 @@ static void
>>> gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>>>                                   EVENT_INDEX(5)));
>>>          amdgpu_ring_write(ring, addr & 0xfffffffc);
>>>          amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
>>> -                               DATA_SEL(1) | INT_SEL(0));
>>> -       amdgpu_ring_write(ring, lower_32_bits(seq - 1));
>>> -       amdgpu_ring_write(ring, upper_32_bits(seq - 1));
>>> +                         DATA_SEL(write64bit ? 2 : 1) |
>>> INT_SEL(0));
>>> +       amdgpu_ring_write(ring, lower_32_bits(seq));
>>> +       amdgpu_ring_write(ring, upper_32_bits(seq));
>>>    
>>> -       /* Then send the real EOP event down the pipe:
>>> -        * EVENT_WRITE_EOP - flush caches, send int */
>>>          amdgpu_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP,
>>> 4));
>>>          amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>                                   EOP_TC_ACTION_EN |

