Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28C9ABAFB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 03:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320CA10E28D;
	Wed, 23 Oct 2024 01:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kX5JOCLc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CAC10E28D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udW5altgSX3iyv5WPr+QjQuBlDoPoVYVrQva9UwcSKI587zkTMjGmnYs6nOF8op7zaQwYrg1LhQ7vXjmMcaQpnfbCJ4A31blr+lYtj+2mzjPZGSpF2RMCNCkw3UF4HO+Jdy4PFoRpt/1ii5h7IeHyXDr9HxapX2nmwTgeAEFAl8UIgFJEjvsK4DGtnaizOtEHYD/j3Bt2y3cfNIZ6sbP3v2wwQ5ozqu2Aw9pHylUjyH3YjSEh6jvBqDFCGoBYyC2DCrDlFeSlqM+DTJ3HVL32/u5vIrbogVlQEnhhKvunC9OTGDaA3BKI2h4ySc92UdpMACTSoxWa2vud1XccSQuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxFaIz2f1CvY3+ShRgywuaxCp2drI642WvTaJ/CXDQU=;
 b=C7IK1bxB8AGolrhtM6Z5BS37B6eiAdVgeIfyX0uPAYyKyUami+u0p/7RSy9mV5GUMvonSNwiu3z56yD6B1fuB5YEb7PqpxP8vq3qXHAns0t7TJWU25+cGJnTZnEIroYUeI6Drhv6Sl4NTnYNQmfNxgsCtYKqlzrcC+cu7QjnJ937LSFenvSO/b3u6dJ0jFxAL5UAn7Zv3RGDCqm7zwXfKuh3pz4u9ATccffwuy2lCo2J13s9YAqnmgKnNiiCpQxT8aC0NqVbXv2h/ERDRfq1QgRWddXVMNgzYKt+Cxp0t6bQlrZUSJcaTpSaHc5Rzo8DTgu0pf53rBWasPU+ip0tyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxFaIz2f1CvY3+ShRgywuaxCp2drI642WvTaJ/CXDQU=;
 b=kX5JOCLcplV9bbZukrhmyzzSd7HAp8dKyVr+7ICG8M7VF+zP5z4gM/xpWXdBbOYPis8B3xYWhWdtesTGqCtipdpk1UK+Hr7cxTCGzsYGChq0gaYVtlwD07hFKsa8gq0FyE2nvG74Krfl1FZzy+wCAyj+QvWY8bCMV6hDJokQQSkK6Der7DSUPj43JwXyiIQ3Q26J3qGRbjQVsT4bR5wLgsh911G7HsOzuPsvrmXJDe1j3KzztKM/PHJjksMmeu9tkxX7E2hIE/G3G/YkMLz9L6xEgJsuxeR7Z7rBM9gF/NuznP5uZ1P88PdVnB3rwJAw/b/ROMgURUg7wHkgnwwAmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 01:27:17 +0000
Received: from PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378]) by PH7PR12MB7914.namprd12.prod.outlook.com
 ([fe80::8998:fe5c:833c:f378%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 01:27:17 +0000
Message-ID: <fd7cae9a-5ee1-4e18-915d-4115f0a6a156@nvidia.com>
Date: Wed, 23 Oct 2024 09:27:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Luke Jones <luke@ljones.dev>, Mario Limonciello <superm1@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <20b48c6f-7ea9-4571-a39c-f20a9cf62319@app.fastmail.com>
 <f56c555f-7313-43ff-abe4-28fb246e31cc@nvidia.com>
 <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
Content-Language: en-US
From: Kai-Heng Feng <kaihengf@nvidia.com>
In-Reply-To: <CADnq5_OjfJzcOqa=NbWVw5ENvi+nmvNAZX0u_0hOvk3EVoh0bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0037.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::16) To PH7PR12MB7914.namprd12.prod.outlook.com
 (2603:10b6:510:27d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7914:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 95789409-8b2d-47b5-a8dc-08dcf301d4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFFTMUwwZTVTWldFSnhSTzFUNE5PaXpKUWZZUmUvbVNoYkpJdXVieDBsMEtX?=
 =?utf-8?B?TEM3TFJudHZhSXg0cXVCRVZjRlZnUnNsNy9iTndkYUltVUp6YUdRMmozSlIx?=
 =?utf-8?B?enFna1J5NzcwTGUwOElMVDZueXl6MXJQSFZZbzRxYldKOXVKVEdScTN6b3Ar?=
 =?utf-8?B?RlR1ZWdUVlpLcDlURHYzc0hGS3Yvdi9pSE5IK0ZJZmtGeXVvSlNlZExpQ3JJ?=
 =?utf-8?B?eU9HTWtNQWVHUHRwVGJNSUQ4MjIwTVgrNEloRlFkb0s0S0UwbWM3WHl5L1o2?=
 =?utf-8?B?cmFWckR3VU9WdDVYZEkwMUxMRnFvM0tzVGRrNzRTbS9BL0d3TnNJc01XcE5B?=
 =?utf-8?B?V00wZ2NGUWNwSER4cXh2OXl2c0YwTy9POTNWM2FYUFBPc2pJYndJVE5NNTgz?=
 =?utf-8?B?TG5SNDZCTWtuMmxpK3lnSStHYVZNRFZxdFpoTXBaQ1lkaGE3OEFYL3E0YjFi?=
 =?utf-8?B?VUZWUlhjWlJHa0dRRFRoZ0x1YTFYRkNXTldZVGNOZXNQbTAzYUFlZkFDSkJM?=
 =?utf-8?B?VmhmRjVQU0NMUEI0eFdxa2dyN0RjVnYrckI2cHdObC85bWVSdE5NTFdUV2ww?=
 =?utf-8?B?b1BJMjdhSENMN2VUVC82dXZ1eFBURFV1K2g1aWk5bnNNR3lrby9VVWpXUDhp?=
 =?utf-8?B?MnRjOWk2VFE2bWs4YzJiNmF4UDh3cFpLalpoSHBoQy85cEhTWnBsTEZNVWtJ?=
 =?utf-8?B?dnpNYkdMOFhrT1ZhMzE0aHVGS0xSdVBLN2FaZ1RsNGM1cnNLMnhwK0ZEblVC?=
 =?utf-8?B?Wncyd2NlNy91dU1GaC92b29nTksyeE1maDJoaTBHVkhjY3IvMXlvQmJiaktP?=
 =?utf-8?B?clVpNS9YUzl2aHZYbzBFMzFRM1d4M091N3U0ZzRpYi9QQmZWL3pOZUlZMHlZ?=
 =?utf-8?B?VjRCN1FyNFJKbUhYYW5pc1ZURm5xSFdOWEFrcUo3Wnl2NFVMMUh1NmJWKytZ?=
 =?utf-8?B?U0RsREQ2aFhHeFVDMGQwWlphc1IzOXhIM1NPZWZMTmh1aUFPUXpCamNqTGZs?=
 =?utf-8?B?MlVXcytKK1BrQjJDOXM5cWljZ1VJb20vNkNiQnpNdzR2Y0k5NjRFWVRUTG9S?=
 =?utf-8?B?dnpGbWFHbjBhVldVQ3RTeTA2S2k3VVB3RzVvZXFGbFJFUU9uT0doY0dTTXV5?=
 =?utf-8?B?U3VkL3hlN1dyUFBNVVczZFpGL1FTTnJ5SGxOamg3ZnQreml6TGFYang2b2tw?=
 =?utf-8?B?SC8xc2lBWVhNZkZuNU8rdy96WTV2TnF0Z0tFZVdRRG5ETmtnT1ErNXZPaENt?=
 =?utf-8?B?WXJpUmg2cHVCbGd2Z01UL25NOHVpK3pKc2xUalVUVjNsNlJERGdLek1ZYVNm?=
 =?utf-8?B?NDlacHBWbFd3RXN0MllUT3paR294eXh3bGQ4bXJXc2JtTmZXb1ErNEl0ekYr?=
 =?utf-8?B?ZHNzemFTQjNueUphcTZ3ZER3RVg5eUt3Q1prMW8yWWFVa3RJdlNZTG5ySTZh?=
 =?utf-8?B?WTN6b00zTEtqaStzZDU3aXo1L2lUVlRxeXIyTkpObEo5eDZDLzYrZUVoMDYy?=
 =?utf-8?B?SEViQjlZa1NsVGlTeStXYmExVkI5ZFl3c25POExZaXpiN3NGSVhYZ3RTUGZM?=
 =?utf-8?B?RW5nRFJnQWlXZi91bWx0TTBKbVRKNFVFZzE4WVJFait4dVpEeGVrUlVNWFZy?=
 =?utf-8?B?UGRPMU5CbE5xU2t6Q1M3MXJKY01JeXB4cDlvaURLRDRKV2ZoeFFtQkoxa3hh?=
 =?utf-8?B?YmdGcHM0NFlrVzJSSnM5dTRma3BEcWZ2TjFuaElyYjJEd0lnVVJTSDd3Wk52?=
 =?utf-8?Q?keeJimRzc8mmI7cBNithVo3jgXeOT7xNxiJFKaD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7914.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXpYVEo4blpTQmwzYmNzUWNFZXpncTI0NUhkQTFraEJ2ck4wbG41VGxhaXlo?=
 =?utf-8?B?SHZYOTdFVi9OUDVMTkhPVTAxdmVGREdqZTRUSGZJdU9HVnA2SFBOdy92ejFo?=
 =?utf-8?B?UjZjRldYd3dleEJtYjRMNU5EMENQZ2lrejdMQ0JNNklGSTVrYkdhUnZJZzVn?=
 =?utf-8?B?Mmc2aytCanNQVjUwVThXcnFOSCs2V3YrSmZHMnN3U3lMSldrRFBleXV4cUg0?=
 =?utf-8?B?SFNobTVsUXBnMHhQNjE4MTNZQ1kxSHZNOERZU0s3WTlJTmYrZHphZjFsSWtj?=
 =?utf-8?B?YkZNRFYzelkxaU9GMEgwT050SWNwNVFobjJENnZIcDRuVDByWTZRcW5ZV2Qx?=
 =?utf-8?B?MGpJYmRDMjR4czAwZWoxcjlqN0pZTU5EWGxyYTVrR2cvRU15ajVBeElyYXFB?=
 =?utf-8?B?clFnRG13S2FocWpES3FubDMzY1NXdllvMVFCeTJ6QjJjVWpsME5tM0I0UG54?=
 =?utf-8?B?L0RNenY4SG9NbzdLaGx4VSt5Z2JzUEhTU2p2Y0pVNkU1V1FCQm5TSGZ6Z1Ix?=
 =?utf-8?B?b2tuV28wbXdKMTY3YXc2aDJpRHVHZ204eXkwcWVPREtCbnM0bFEydTZuWkhM?=
 =?utf-8?B?RDBVdTlnQTk2WnFkN1BYL2NrUUNYZXBHR0RncVJ1cVMxeUVCcjJFOEV2cUJH?=
 =?utf-8?B?VVZka0NwaU5pRDU1RDBKVHN2ZHhQUVBJcE04cGZOZ3JRa0VjRE5Ra0lFV2xL?=
 =?utf-8?B?bG9ncE9KZWJSODBhcGhKYjRmUFN6bjFHWE1jTGRsRWJhNjVvc2hGQWJXaDlH?=
 =?utf-8?B?bFoyTldTV21uZDAybjdzZzcwendEdzQrN2lSRUFXdG51TjNPdUc2Y1VwNndX?=
 =?utf-8?B?ZE9xZDUwY2Q0c3Fibk5CMHZVSS9mYWlSUE9welBicURCbVQwdjZSc0NxZzUx?=
 =?utf-8?B?emlGN3YrR1JHNTNMTzd2U083Z2d2VVRITStsRVNYc0crUzVPRzNUS0xEUTha?=
 =?utf-8?B?NzZxeEJDOEZmOVJhSzZJU2J5WHZkbm1jNHNXd1E4Qkg1MEczbzFxa2M3SmZT?=
 =?utf-8?B?VUMzdUl0Z2pjbnhoTVFmRlJDdmJGZ1A2TjJOR3NlL0NvZVQ5R0NEYmZmTlpi?=
 =?utf-8?B?TmZnaXR4ekpXUVV4ZDRqZkJpNFJNM0Faa1VtU0xlK1ZyemUvT2FKbjBQR0ww?=
 =?utf-8?B?VVhhVXdQWnRVcFZPWER6TlYwTC94SFREdDBuNm91RnVZdEZER1dhRjVMQktH?=
 =?utf-8?B?bGZETGJwejI0aVBzektDSGZoY1BIdGRsVVRuK3RQUDFyLzQrcE9vamJ6cFFa?=
 =?utf-8?B?SnJvRlJrUDNkVndGOWgwQVNtQkorWFFLL2hOOEpBdEZZbG1HMEszcUFWOS85?=
 =?utf-8?B?dDFmL0p6c0dpcStadERReHdSZ0JEaTRVZXRpWkw5b2dyYy9lZ3E0VlNuYzQ4?=
 =?utf-8?B?bjl4QnVab3RUNFJNYTViMXRJVHBiQWlhL2tJWnl6N1VLNXpRRDB4N1ZkenhL?=
 =?utf-8?B?TU00ZnJPMElDUWZhV2FXcTc2dTNmMTZSanZRUHAwaFNOZTBEanQ2MjBJQXVn?=
 =?utf-8?B?UzRTZWk0aDgxZFNUV0o4L2ZWRllMaEZpU0hybjJqZ2pUTVBvOXh3NEhFVUo0?=
 =?utf-8?B?bFZyQTRHQWJ1SXp0cXZlRmJNN2UxdEJUdnpKKzBFQkJUMG1WK2NFSFIvd1ZC?=
 =?utf-8?B?OG5FK2tlejdhVjBwRHpSd0VrUHdGRFdHMkNTeHVFUnJTTURiQW5UZFhid2V4?=
 =?utf-8?B?elhoOUpLZzB1RjNOYVFjd1lBTzRrMExUY2xLWlJNck9paFdGc2huNlZwejcr?=
 =?utf-8?B?YXB2NW1DemI4cjdvaldCY2N4bTM0MW1ZQmh6UXpyTFM1TUQyL2NhNkUxMFJL?=
 =?utf-8?B?NjB4RWt2b2FzZndCbythM1ZaQzZxMVpxVWJrQlhYZlRtNmN2WG9LU0JaK0k0?=
 =?utf-8?B?aytReUFCKytBWDZHQUxCYlVnUk1VdE5YVUcxR3BvZlFuenJZK215aGoxWFA2?=
 =?utf-8?B?M0ZENUhJM0ZzWmc5T1JvUnV5QXdpNXQ2YmxMWU1DRGRjR2lyM2crbTY5RVli?=
 =?utf-8?B?ck9CbWJVVTlXVDVleTBNZmFyME1jSjJjc0JYQ3NIcCtEbUEvdElFR2tsYUNm?=
 =?utf-8?B?UlZXbWQvYmpZVmhxSDNwZVNhSlRmTHdseXIyS05VWEQrSHpDRWx1QkZEc3c0?=
 =?utf-8?Q?V9GWTbWJLQvjciklnDtJS5fj7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95789409-8b2d-47b5-a8dc-08dcf301d4cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 01:27:17.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tQyJ9fzjbek5Bu/ygyvAEeErsmqfX87qCzHtwwse52ELNfEqGRY5YeSZJJZCsccr2VKwwqRFUxdf45gNv4V6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161
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



On 2024/10/22 9:04 PM, Alex Deucher wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, Oct 22, 2024 at 2:31 AM Kai-Heng Feng <kaihengf@nvidia.com> wrote:
>>
>> Hi Luke,
>>
>> On 2024/10/15 4:04 PM, Luke Jones wrote:
>>> On Mon, 14 Oct 2024, at 5:25 PM, Mario Limonciello wrote:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>>>>
>>>> ```
>>>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce
>>>> RTX 4070 Max-Q / Mobile] (rev a1)
>>>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI]
>>>> Strix [Radeon 880M / 890M] (rev c1)
>>>> ```
>>>>
>>>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
>>>> boot VGA device, but really the eDP is connected to the AMD PCI display
>>>> device.
>>>>
>>>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>>>>
>>>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Reported-by: Luke D. Jones <luke@ljones.dev>
>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>>    drivers/pci/vgaarb.c | 7 -------
>>>>    1 file changed, 7 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>> index 78748e8d2dba..05ac2b672d4b 100644
>>>> --- a/drivers/pci/vgaarb.c
>>>> +++ b/drivers/pci/vgaarb.c
>>>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>>>               return true;
>>>>       }
>>>>
>>>> -    /*
>>>> -     * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>>> -     * other VGA devices, it is the best candidate so far.
>>>> -     */
>>>> -    if (!boot_vga)
>>>> -            return true;
>>>> -
>>>>       return false;
>>>>    }
>>>>
>>>> --
>>>> 2.43.0
>>>
>>> Hi Mario,
>>>
>>> I can verify that this does leave the `boot_vga` attribute set as 0 for the NVIDIA device.
>>
>> Does the following diff work for you?
>> This variant should be less risky for most systems.
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 78748e8d2dba..3fb734cb9c1b 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -675,6 +675,9 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>                   return true;
>>           }
>>
>> +       if (vga_arb_integrated_gpu(&pdev->dev))
>> +               return true;
>> +
> 
> The problem is that the integrated graphics does not support VGA.

Right, so the check has to be used much earlier.

I wonder does the integrated GFX have _DOD/_DOS while the discrete one doesn't? 
If that's the case, vga_arb_integrated_gpu() can be used to differentiate which 
one is the boot GFX.

Kai-Heng

> 
> Alex
> 
>>           /*
>>            * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>>            * other VGA devices, it is the best candidate so far.
>>
>>
>> Kai-Heng
>>
>>>
>>> Tested-by: Luke D. Jones <luke@ljones.dev>
>>

