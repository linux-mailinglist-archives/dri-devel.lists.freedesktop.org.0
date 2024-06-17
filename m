Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA1690B09F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4280F10E0D0;
	Mon, 17 Jun 2024 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rN2XhFlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E06C10E0D0;
 Mon, 17 Jun 2024 13:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZfyxvQEjhAxPYGL+06tleGfNtv7byyhb77KFV+d3r5wQylUZk3QwvA128SaB6koRT7YbyxMXaGvTwcs5dVE/hugfZB0XE+I2WL0GB5dnQJyLWEXPcyYuk/TeWi0n6d+niD2fQDXsEnb4o70X12xm9sMPcwEAj+qK7gnRKe+SEq50kgXj4okiENU2MLlkvQ0T8cmGeWc5OEPHU2zV080IKulzS3sOlRnO0xCNiIjaHahrEIls9z8/Rki2o/yfhpxUV8IliGv588MrijjuNCyn6iZcZFNxE1gh+1TUj+DG5mXO9Wkzq61oJG6gw3O+qAWyYgzHgGCEe1/5Vt6CFIy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B16+WBaVliJI3aKyAt0X3HR/Y8PL4BdLQ09kkmF1op4=;
 b=bFyr+gdozR99OpLGbo2PKiDkICrCIZMxR8NqHm01bLbH6adnp1JZlIVxvtdx1fXfjlsco2b1mJ+jO9L8KUHB8wRe9oR6BAKKF0N6ajmbzXsEUPJyAIZLH9fIo5En4RlzzldlNJ1ws1Ztgn5ThBrZHPtIM71iBt60EinwjDLLnlLvlRXCLgVcGpEs7rLkdDVhD9T2mYm5aktXeTYqQGY7iJ66ZLBecHsY0deGYCZazyO1rkUe9/iITBLVyICCBjPP0vHlu3whoo3cp7VEMpcDwZxvZ5JuFYyPudG/GBr0k+TrdRTqmUKM+BUVCpq7a6I0L2PZl2LjkLhwMiv3MuaEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B16+WBaVliJI3aKyAt0X3HR/Y8PL4BdLQ09kkmF1op4=;
 b=rN2XhFltpr1fW7kMqrPIOuRXjPpf4wu/3Je/JKWvPixWvPAv0UeQLBPEhcxuPxW1obccqkvlMUin+XV9+VSzo1CiuBZUhokCBB9U1Z37vDib2jrCrgYjY9Kc9O58GI2ls1l5KRqcQhY7dBHbJsosdd9IMocB4/ZjtgzOBPCEFMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Mon, 17 Jun
 2024 13:59:24 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 13:59:24 +0000
Message-ID: <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
Date: Mon, 17 Jun 2024 15:59:12 +0200
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
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3568a3-9b0c-4bad-f982-08dc8ed5b191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkUvRjllNDNtSlQzc0w1V1VtTkFKbGk4RXVFNUxMd3hhekd5RzE4KzBOM0x3?=
 =?utf-8?B?akhxMStPR1h2enM0OUZjbExNRS9ZTmM0Mzk5NEg3cHRBMzZYK0lyeWt4OURm?=
 =?utf-8?B?SEV2VXZKeUVaZTRuemRhMGh4WmVRcWdPUHBkTjlrenV2UVdlWjFZNDhKbzBj?=
 =?utf-8?B?VUJ2RExQaEF5dEZxTEgxeXUzSStmN1N0MEpBSk1lSHVGblNHZENnbDZaWVFX?=
 =?utf-8?B?UzJmUEN3Vmg2aGdjcWlHTll3RzdmdHNzdytEbTN6bnVHNHp3UVFjZGg2RWRl?=
 =?utf-8?B?OG11UWFwRnlYZHJ4YjllMTk2UUlrak51OFhGUTU4eTNRWVgzb1dGM0VQSGJN?=
 =?utf-8?B?M0QwUmFyUFE5R3JBMm1LTWd4N2FlUGlLWWhwMkN4STRyZVU1N2lDWGttNDFG?=
 =?utf-8?B?U1JsVDVKVnBCcUtKbDBtRUVIUFgwM0tQaXB6Nys4cnZkVU84cFZjMlNmS3Y5?=
 =?utf-8?B?M092T0NERmdTbHp2cG1tV1hJNGJTcXRYdFRJcGZjL0diYXBQd3R4M3lhMnBY?=
 =?utf-8?B?eU1CV01TcE4rSnJyNUF5L2Q3REV4ZWdlS2lJQUJFWWR1d1ZQR21SbkJ1YUlH?=
 =?utf-8?B?VzV2aDRRQjR5b3pGcDdZYkJLTGwyWkdBbFM5RzdBZkxIRG8zdHlEVW0xcWFM?=
 =?utf-8?B?ZEZVbnlac0lhbHFXQXNQN3BhZ3gwZ2ZldnJnUnQrMXZDR3c3MnM4SlhiTGx4?=
 =?utf-8?B?aFBLN2dYV0s2YVlRb1M3MVk5Y25tdmFDeVh5OXFCM0pjZGR5Y09MZG5BVmY5?=
 =?utf-8?B?cldhMUgyZS8wY3dTMGdja0h4YkQrNHJFeW9FNjk4R2F2RksxaktTc2hJYnEy?=
 =?utf-8?B?bDRidXA1UThaZml5NWhPNFp4VWZQMU5XVHBoZ0NUTUJ2MVJWeHA4eDlzMnA0?=
 =?utf-8?B?VmZSNG5rcTRPdkRVRVlINXNDdVBXTU9Ud0FvaUdwa1RXQThSWklwQ2xsdTVj?=
 =?utf-8?B?NkNydlhmK29nUmVQY0VzdVpQVk1ocXN1NEdmcDNsZEdNSk5hQW5BK3VFTDRR?=
 =?utf-8?B?aUkzU2VJSHVLanBNbytpL2dIa1FBWjRtWWQwRy9INmF5OW42YUZJUXdRTlBq?=
 =?utf-8?B?dm15V0dnNWlBTFRMMWxkTElVc1IyakdsY3RYdUhnQzFFUis1MytOTStHZWtZ?=
 =?utf-8?B?RFZBZVpKQWorZ1JFdTFmL0EwVENXeDl1WHh4V1d4VnU0aEszcHBZQ1phQWJJ?=
 =?utf-8?B?cndNQUdFcXdBbnIzVWxOVlpkYnlEam13c0UycnNXYm1HcGdqbmFZaUJBSm1U?=
 =?utf-8?B?MUVyTTlMYkNiTjZKaTNndDB6aFRydHpaNFhwdTAxdDhGVDZFNnFmYmVibElG?=
 =?utf-8?B?Zm55MkZMQWpJTUpTekt2L09meGx0TURNNk80M0tIeUNIaTArRlhQM2tNU1Jz?=
 =?utf-8?B?Umt2cnJhNjZFV0J0SWNOVWJYQ01GeG1HUTMyZVNNVEtlQlZiVXNrTnVNeE90?=
 =?utf-8?B?VUdqemdyVm9wYitNdlJ0NEhDNVVzdEQ0TFhJU1V2SjZ3bkhrdEtCdDFxMVdU?=
 =?utf-8?B?U1Q0SmtNK1FaN0MycmxoZ2N1YVVrSk1LeWErNnJudzVDMHplOGlBQzJGSEVh?=
 =?utf-8?B?YzFMczlRZ2VPcFJ4UUpHekNvMEl1U3p3UnVFTHJTUkIwTmcwdEF1QjA4RnlY?=
 =?utf-8?B?VGo5SXBzQWk4Mk1mRyszQXRZTHp2N1dzUHA3YlZXdW9PUWUwcGtJUitHWkFY?=
 =?utf-8?B?elptTGdNeDljREVIUzFQbSt0eFQ0a1dzN1d6ZmNCMTNQSlBtaHpPVGRnUlpZ?=
 =?utf-8?Q?hS8apVYD15LrfMSMvAkM4dgT0/EOgsvxrLgVZH3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHB4a2srZUNaSlR3T1dKZnVsMzlEK1hsMmE5cklyaHJqNXZvZFNzYXdray9M?=
 =?utf-8?B?WVZEc3dZcWhHRm8vT1Y2Q2VCU1g3RFJzbk0zMTNKc2lZenI2OUppdUpKdHRE?=
 =?utf-8?B?dUtuUERBMUErQWJuMkJXaXdOQys3cUdYMzFPbjB1Vi9VeUJBeEZJN0NCeXZE?=
 =?utf-8?B?WCt0amJkR0tGYm02Y21JWE8vS05GeEZvVE85VkcrVjBxQ3hhNzl6MkNLV0FR?=
 =?utf-8?B?NkZzTXIxRkpidWF1RkllWVFOOE1BZEYxT1lvKytjY0ZwL0crUUQ3eUt6NmZQ?=
 =?utf-8?B?Q1A0SWJ1WnM2V3p1ZEw4b1E5QUc4QmxUbW82YXhmVUxmTU5XUHdlSlg2Z0VN?=
 =?utf-8?B?aXAyM3JneENiZ3dzdk1jMlAyQmlhMCs2TnNFZ2Vld3lyMUVrZzZLVEc1cktB?=
 =?utf-8?B?dFpzbWwwd0R0TFRUVTA4SWFhRTkzVEsxU2tpbFJIRklmbXBaRTl4UzAxN24r?=
 =?utf-8?B?MXpiUE9zU1YwY0N3alpRMFlrTXhKckl5S0d5SlJ1QW12bTNUR25PckJkUElB?=
 =?utf-8?B?cGx5N0Voelp2RjNhNVd4dU4zdmhKdHRWd0d0SjIvUVlxbWlCMGJvN2tMcU90?=
 =?utf-8?B?RmNkZDJyb2s1OG9venFlVHNxMTFCaEc0eSt1ZDVEWGhJdzhFc2FVTzU2YVZN?=
 =?utf-8?B?TVBVQjlYdkxzZTROL3pVUzZLTlBmSER2UXlBcXVwREV4Zy9LeDhhcHUvM0dT?=
 =?utf-8?B?YWF2OVl0d3U5T0ZYN0dUSTUwRGdBZ1E2L0hyUlVFcC9hUGZ0REFlTEtPUVpQ?=
 =?utf-8?B?bmJJck5wTXV6azB3M0pnYS9NbFUwN0V4L0dDWW1HU21NVktBckI2VVQwNUNW?=
 =?utf-8?B?OVlocUl6QnpCcW1PVzdvN0I5MkdvT3duZW5JaC9DSVp5bHRONHlPalFrYk9B?=
 =?utf-8?B?djJJVjloUGhKSnVXdThZYVppclJmS0IrbVNvbUdya1dkcnU4SE1jQkgreWt0?=
 =?utf-8?B?cVdQVFBibDZnamZiMUZ3aFBQWGx2MnpIdGdtV2t0WTZmd0JoK2hpMU9sQStD?=
 =?utf-8?B?QVpXQ0RNT0ZoR2hzMmErKzR6bVk4bUloMUNHSE15VE40YjlGWGpHR1VBTGky?=
 =?utf-8?B?bFFaSEpZSnl6TTVnNHEwOGpHMTlNZXRnc1hCL3FhdlR5RDV1YThENGxqMis1?=
 =?utf-8?B?Si9MWitKanFudVVxRjR3cVlrMnJYYzdHSTdTWmJmUWU1eUVVWlE4M1l2Mjg4?=
 =?utf-8?B?eGJTc0tJVExId0Y5RlNXaFAvMDQzSnBRNTV1dVFQVWo1UUpkZFRqVGQ3Wkdm?=
 =?utf-8?B?Rk52ajBRdXZIYkRSK0dOT0RXYUZpNWQzOGpycWF0Z0dOb0pRQ1Y1WTFNMjBP?=
 =?utf-8?B?V0ZkOGl0U0oxRktDNy9RNGN3bWlzZVV5VDMvcW43WnlTOVpSOFdSVWNsbmFR?=
 =?utf-8?B?bUxmb2RoNkJ5SFJTQS85eTlSWTg2MlZ3bk1zeGdvZHpxYUtJN09TOWlHdXpN?=
 =?utf-8?B?amptdlJCWWprcEduZS8xUDJERkFaSFpJN2FrcHlPeXBIczBNMG50emorR3Fo?=
 =?utf-8?B?WERyUExlYWwraDFmNTRPWWRBOE9WOUlJQ1BDcnVBVDhWaWwvVGd4NzJ6VFRU?=
 =?utf-8?B?TzhPb214TmZjRCtBM21COTNrVmRIOTNXUWtjZHZFMGtwQmg2Q1NlNjhoUVZr?=
 =?utf-8?B?dVRQNWJVWTNBWFF1anE4Q3dTWlBqUFA0cHN6T2ZyS0kzQ1h4RFVzN1k2Rmhj?=
 =?utf-8?B?K25KMjkreFQxUzF2N2x3SXRjNDljanZNZlJPcjArWDZMdGJJdmJlR1laWlE0?=
 =?utf-8?B?Q2Y3S1RhUlhIWDQvZDcvd2pvOTRnRFV1aEtMZ2FoaHlZbHZUcTVxNXc0VVdK?=
 =?utf-8?B?cmZQdGFCejdhMjVueFdIZzJ5NnV1eEF0ZXE4eG01NmxDczM4d1VEdk5CTlJN?=
 =?utf-8?B?VzBtdGFaT1BUaWVwaXZXRGNNTHhrcVNRUDRMMXhkSDFMMStpVklWdWVVc2JY?=
 =?utf-8?B?ejA2clYvQkgrU21Ddm9jZTFJdGI0RXFDN01QRzR2eEZQSmtjM1d1dnhIRmk4?=
 =?utf-8?B?YVhsakJsZ0k4VW5DWHd1MEZCYXdMQ0hzSitlVFpzaVZDYWVpUngwSDdtNzJq?=
 =?utf-8?B?dlpZN2JSNXlkcncrdzlQSGxLUFUrRjM5VUpjWFI2dkhOZ0Q0b0dmZ3ZhREJB?=
 =?utf-8?Q?BrCvPrwqmsjGGTC8Tjzji3Yfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3568a3-9b0c-4bad-f982-08dc8ed5b191
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 13:59:23.9183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9j4oOrdz9iyidcaOCPjAKbtNgA1ueLSr+B30BaJn7AnUi7FIjuxn+Z8Jvpj3Enu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301
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

Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
> 在 2024-06-17星期一的 15:09 +0200，Christian König写道：
>> Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
>>> 在 2024-06-17星期一的 14:35 +0200，Christian König写道：
>>>> Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
>>>>> The duplication of EOP packets for GFX7/8, with the former one
>>>>> have
>>>>> seq-1 written and the latter one have seq written, seems to
>>>>> confuse
>>>>> some
>>>>> hardware platform (e.g. Loongson 7A series PCIe controllers).
>>>>>
>>>>> Make the content of the duplicated EOP packet the same with the
>>>>> real
>>>>> one, only masking any possible interrupts.
>>>> Well completely NAK to that, exactly that disables the
>>>> workaround.
>>>>
>>>> The CPU needs to see two different values written here.
>>> Why do the CPU need to see two different values here? Only the
>>> second
>>> packet will raise an interrupt before and after applying this
>>> patch,
>>> and the first packet's result should just be overriden on ordinary
>>> platforms. The CPU won't see the first one, until it's polling for
>>> the
>>> address for a very short interval, so short that the GPU CP
>>> couldn't
>>> execute 2 commands.
>> Yes exactly that. We need to make two writes, one with the old value
>> (seq - 1) and a second with the real value (seq).
>>
>> Otherwise it is possible that a polling CPU would see the sequence
>> before the second EOP is issued with results in incoherent view of
>> memory.
> In this case shouldn't we write seq-1 before any work, and then write
> seq after work, like what is done in Mesa?

No. This hw workaround requires that two consecutive write operations 
happen directly behind each other on the PCIe bus with two different values.

To make the software logic around that work without any changes we use 
the values seq - 1 and seq because those are guaranteed to be different 
and not trigger any unwanted software behavior.

Only then we can guarantee that we have a coherent view of system memory.

> As what I see, Mesa uses another command buffer to emit a
> EVENT_WRITE_EOP writing 0, and commit this command buffer before the
> real command buffer.
>
>>> Or do you mean the GPU needs to see two different values being
>>> written,
>>> or they will be merged into only one write request?
>>>
>>> Please give out more information about this workaround, otherwise
>>> the
>>> GPU hang problem on Loongson platforms will persist.
>> Well if Loongson can't handle two consecutive write operations to the
>> same address with different values then you have a massive platform
>> bug.
> I think the issue is triggered when two consecutive write operations
> and one IRQ is present, which is exactly the case of this function.

Well then you have a massive platform bug.

Two consecutive writes to the same bus address are perfectly legal from 
the PCIe specification and can happen all the time, even without this 
specific hw workaround.

Regards,
Christian.

>
>> That is something which can happen all the time throughout the
>> operation.
>>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Fixes: bf26da927a1c ("drm/amdgpu: add cache flush workaround to
>>>>> gfx8 emit_fence")
>>>>> Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
>>>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 12 +++++-------
>>>>>     drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 ++++--------
>>>>>     2 files changed, 9 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>>> index 541dbd70d8c75..778f27f1a34fe 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>>>>> @@ -2117,9 +2117,8 @@ static void
>>>>> gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
>>>>> addr,
>>>>>     {
>>>>>           bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>>>>>           bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
>>>>> -       /* Workaround for cache flush problems. First send a
>>>>> dummy
>>>>> EOP
>>>>> -        * event down the pipe with seq one below.
>>>>> -        */
>>>>> +
>>>>> +       /* Workaround for cache flush problems, send EOP twice.
>>>>> */
>>>>>           amdgpu_ring_write(ring,
>>>>> PACKET3(PACKET3_EVENT_WRITE_EOP,
>>>>> 4));
>>>>>           amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>>>                                    EOP_TC_ACTION_EN |
>>>>> @@ -2127,11 +2126,10 @@ static void
>>>>> gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
>>>>> addr,
>>>>>                                    EVENT_INDEX(5)));
>>>>>           amdgpu_ring_write(ring, addr & 0xfffffffc);
>>>>>           amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff)
>>>>> |
>>>>> -                               DATA_SEL(1) | INT_SEL(0));
>>>>> -       amdgpu_ring_write(ring, lower_32_bits(seq - 1));
>>>>> -       amdgpu_ring_write(ring, upper_32_bits(seq - 1));
>>>>> +                               DATA_SEL(write64bit ? 2 : 1) |
>>>>> INT_SEL(0));
>>>>> +       amdgpu_ring_write(ring, lower_32_bits(seq));
>>>>> +       amdgpu_ring_write(ring, upper_32_bits(seq));
>>>>>     
>>>>> -       /* Then send the real EOP event down the pipe. */
>>>>>           amdgpu_ring_write(ring,
>>>>> PACKET3(PACKET3_EVENT_WRITE_EOP,
>>>>> 4));
>>>>>           amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>>>                                    EOP_TC_ACTION_EN |
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>>> index 2f0e72caee1af..39a7d60f1fd69 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>>>>> @@ -6153,9 +6153,7 @@ static void
>>>>> gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
>>>>> addr,
>>>>>           bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
>>>>>           bool int_sel = flags & AMDGPU_FENCE_FLAG_INT;
>>>>>     
>>>>> -       /* Workaround for cache flush problems. First send a
>>>>> dummy
>>>>> EOP
>>>>> -        * event down the pipe with seq one below.
>>>>> -        */
>>>>> +       /* Workaround for cache flush problems, send EOP twice.
>>>>> */
>>>>>           amdgpu_ring_write(ring,
>>>>> PACKET3(PACKET3_EVENT_WRITE_EOP,
>>>>> 4));
>>>>>           amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>>>                                    EOP_TC_ACTION_EN |
>>>>> @@ -6164,12 +6162,10 @@ static void
>>>>> gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
>>>>> addr,
>>>>>                                    EVENT_INDEX(5)));
>>>>>           amdgpu_ring_write(ring, addr & 0xfffffffc);
>>>>>           amdgpu_ring_write(ring, (upper_32_bits(addr) & 0xffff)
>>>>> |
>>>>> -                               DATA_SEL(1) | INT_SEL(0));
>>>>> -       amdgpu_ring_write(ring, lower_32_bits(seq - 1));
>>>>> -       amdgpu_ring_write(ring, upper_32_bits(seq - 1));
>>>>> +                         DATA_SEL(write64bit ? 2 : 1) |
>>>>> INT_SEL(0));
>>>>> +       amdgpu_ring_write(ring, lower_32_bits(seq));
>>>>> +       amdgpu_ring_write(ring, upper_32_bits(seq));
>>>>>     
>>>>> -       /* Then send the real EOP event down the pipe:
>>>>> -        * EVENT_WRITE_EOP - flush caches, send int */
>>>>>           amdgpu_ring_write(ring,
>>>>> PACKET3(PACKET3_EVENT_WRITE_EOP,
>>>>> 4));
>>>>>           amdgpu_ring_write(ring, (EOP_TCL1_ACTION_EN |
>>>>>                                    EOP_TC_ACTION_EN |

