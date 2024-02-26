Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F945867CC6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589F10E7C0;
	Mon, 26 Feb 2024 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N6GfTfz0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3BC10E7B0;
 Mon, 26 Feb 2024 16:53:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYLzlZlovPMMSvgMDDL6uqJpla01G1nAZlyHFZkMnzqAm4tkjMRygQldLDXhFPxflvodetUxDCB1oNc+esCQ6vP+DcNMO0h1MycXGVN/8RjAwAYhJeSM55lCxL5H37pLuDMScZ5q3rPIwQKee0QFx/tlq9k74Pw4Fz+BxhTaMjk+CVmlgdL5dHRQomIdPIVf3v8i3qtTZTjGpSuC+z9XBzxzh30ZaUjVfQdyL2GOw/V1TGH0kdubzup9aG7wZ2WitwbXhPMhZ+1ObRH16jDJILoFqF6jpPuwAWVr8KJi5zULnimGhfc0Xn+c/PKDXwpKxY6rDw37RedgKJniBYy7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgGVvXsf4VqTvtaavcwmiuoQzch6D9YjXQxG99+6w9s=;
 b=Hea7nvktHwyoudHvd1rcoV9O8Ds4lBuNUiCgjTl+8Qi/iV+JfWf6FzoWrR4HaH6ObLWjcYn0HXtxNfsJk/Tb6QBvJWJlzRPVCGkhCn5SpfjEJRjofXR6LsZ2FKfrKQNoJpak0g6k/NXptz0SBfSOpwXvX0i7EVYYe9aR95y4+QEpoVOUxiaPGjS50KZD0BC1Nj3e4i5jRN0fhLz2N6LofB+PiSJjjOHsCNU9ZtrLlR6iivTy61FBIBAGJbTTx55ZLRfCZXsJqq2jy2l3FG1NV9bHbODt3TygJTqUEv4kharCow5Oczrr09juxrGb/wfT7Fhx3JlDAlT6zYd/qWhhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgGVvXsf4VqTvtaavcwmiuoQzch6D9YjXQxG99+6w9s=;
 b=N6GfTfz0FKuHlRlG6yOyXJjsT2NuUKxUUsljHOjGd7O1+heOf01LLtUTqWS7tr/qARUj25HnEQbtgWZccR1vkGkrJXKDg80L2j087LDVKoWxWsRN2l0cnPKOMUqtF23u7+RiP1Hfc0vqjv8lhasJ2QTMnDkUTEiUzU6TTRoqqKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 16:53:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 16:53:46 +0000
Message-ID: <e34fd063-656b-4c17-bb71-2f2a9ff4a1ce@amd.com>
Date: Mon, 26 Feb 2024 17:53:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
 <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
 <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
 <b08c2c14-5a99-49cf-ba79-b89f86487f15@daenzer.net>
 <7dd49c00-8d5e-4492-801c-f1b6db5e1737@daenzer.net>
 <d1528a0e-6dd3-497a-972c-3b86efd46313@amd.com>
 <298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net>
 <4253f207-23af-4510-aa0c-a7509546917a@amd.com>
 <9e2f788e-7e74-4c71-ab45-7f72c230152f@daenzer.net>
 <08f4b8be-2059-4489-b356-ef02ef41a927@daenzer.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <08f4b8be-2059-4489-b356-ef02ef41a927@daenzer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 29932d95-efda-4c38-e5d9-08dc36eb7f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRJus1QJVFDz4r4iyPVAcsJOiv7imUOBgC9ihHeda0jNrKEotXHpQBfvoed3aYH0YDeQZRIgaVffxjMIQtFgLdrep0G8kqNQTdCzjkOiqXXD5X/eoE9Q28kvgSW80bbPXX8sLzbOE8l/3IOrP5yaAP410Oz2xnOnlB/Nj3jvYxlEubjwoWiYQfZjz0C+zLFCW0u/YSEAUVx29iIDMDm0Ofu7fnTapX14mziMCahIRC0vRQGcIaiZl2dcIcvXFhd1vUi3NWDXoO0nTqiS/ZI4981TtSZ+87IisGJLMXAVh78mImh+wd1U9GH6x7yEmyf+fRkyDK1oEdvEemEuyyAN8sr2DqX0LpJnVVf9wkwybJzcUXfYJmpeUATIkHPYFGkQ/vkqgWnkFdgIH9S57w9DUmMyMAQeyrcsHJSzfKWQvzGAreLuEAgW1sPTDj/Ko2oQnum3/ip/Pyv6eNlapsJtax3nIhIOv3PnRPady95nRXZFaWG/YsBW/0RYG1v7grr4Q0JAmftfeN4HVQKUFZujIcOl8c2+L0+KAcXvZzt+57n7w+ga3yyZX63ItgoR0++3kxYTQFBzUydySbKYhssX2KTC58JWGjY04CkkTfkOgNfmcm091wu1acGrjpYwB8CKznpjyyO08tnFZYPRRGbh2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU5kY1BETUExRUkzc2ZxNXVFY0x6bDdneWFmR2xOTXg5bGFXS24xeDgzaGhj?=
 =?utf-8?B?ZmNmZHFUVDh5eHRUMk83cmgxVmhGT1dPVTdEbFAyOVhwUmlGajhnbnB5eUZR?=
 =?utf-8?B?ZHc3Yno5eDZ4RTZ4RkVyb21YS0lWQ0VmNVFuQi9XaWJXQ2ZOMStES0xEWHhx?=
 =?utf-8?B?Y1ZGODNrbFI4N0hacGtTK3AyNDFaVzdjVlgrbDdOZzJQUDlCcE8xZmRLU3M4?=
 =?utf-8?B?a3IzV2laQTFqcUh5N29OSVRHR0NNTG9kbDB0ODZNWkFNeDNlL1VSTGNXLzUx?=
 =?utf-8?B?dy9rYzJ0cFRFNU9HTGcwNjVkeks1YzlXWWxBODhzUGc4OE5RYzVPcjJ5cEVl?=
 =?utf-8?B?ZHJaa1k1STVnME80T2pQcGFqaEs0cTlMYldSVkZqdFVMdlZqRU5GcmUyenph?=
 =?utf-8?B?UjEyMUYwVlZXZmJpRlAwY3dBemh2SUN0UkR4YmRLSGdMYTFWK0xJbTN2ZGwx?=
 =?utf-8?B?QW1yZXMxajI3T3JQQ0x6RWpweHMvdXdhREx6Mlo1bU80cXpBUzcvMkZ2cHAx?=
 =?utf-8?B?SkNxVStDR1Rjdk1pY2l3SXFBa2lkbEIrRVNmcXNxeXZvVXkrdEM3V0xkdlF4?=
 =?utf-8?B?dlg2RTR5TFBJVDJJaGxuSWFqa0ttelhJQTlaR3RuSEM0anAvbi9wa1Vmd1hW?=
 =?utf-8?B?amJLTTcrU2o1aEs5azVoTll2K1NtSWlrenB0NFN1emdTVVp1ZjJ0SzAwL25m?=
 =?utf-8?B?MzVPbTVXckdVRmdOdGNEcHB3SUVNb2daRjFLV3dEQTNnNU41M1IwVVNSSHZv?=
 =?utf-8?B?TzZyOTdqNzRkdVF0aGtSZXBPSlhQTkUwamVQeUN2UnRDaTN5RmE4N2F5MkxU?=
 =?utf-8?B?eG5yMDFncXpIRUNjSmRLbUZ3MFJVK0lYOEZGTVAyTzU5eEIraVVGNGRBRXVW?=
 =?utf-8?B?eXNkeDBDNWo5cXNHb0lNbnRlYk1zVGF4R29BWWdleUs4blBPeGVRZUExM2t5?=
 =?utf-8?B?SGQ0eFhFMDJoeEdWalhZdkxCbUlsTlhoRWdLR0FRcGxzT0U2bFVRYVJsWUVs?=
 =?utf-8?B?UE1rbjE1NFZISHk0WFJIL2krQzN2UUlFOElBYXQxdWtadkZ6VXI2SnBEVUh3?=
 =?utf-8?B?aEtxeEZwR2E4WFp5R052N3pSSkVkUEVxK2lkY3hsUFJ1czRhVlIyS041RFB6?=
 =?utf-8?B?MXBPMkhpZzNJWDJPRnBKSkRRem5oQ1VValVWRlFzNERGQ21EdFRJQkZkWDRl?=
 =?utf-8?B?eWZaT2V5eHl2UHp3bDNHQWxyTitnazZZVk44WFdZTnBJNDkzQk40d3VSbnp0?=
 =?utf-8?B?aDVpbEtqUm9uZDI4ellwKzhUWmtjUThHbXJSNTYwUnRNNFRxU1puMS9vbFBE?=
 =?utf-8?B?OUc2emxDVTFLeU9nOXNSNk56YzJHYjZSQlFpeFpFcnF3ZGdiMXdOVGtKb2lJ?=
 =?utf-8?B?SVdmYmhDcWVJNmZqamNzNW9iaXpZaWFPUlRwdTcxRFR4SW01MFJNRjM2MFhP?=
 =?utf-8?B?Z0t2eXVOb2hUNjhEM0xFb2JPQzZ0cTAzaGwwaWpMR1krcHc1dmI5aCtycWhl?=
 =?utf-8?B?RHJYaDdzSU1sbVkvTXJ3a3hnd29hSGFnUlhDNWIwRk1UeGRBMUNXQVlObnE3?=
 =?utf-8?B?cXFpQytkMTdEdE1VazVDdFhHUjQxVWNjeUs4U2tCVDJSbzZoanl2Wkc5b21R?=
 =?utf-8?B?SGhvbzhKRTJxSEpTZUJ0VENBUGY5dXkzcDlMTVByWFI3RTFGYkN3TFNIUjNk?=
 =?utf-8?B?cmk3NmtGVlc1SVBtaEYwMzMxRG0xcE5HekNGVzFvMEZqVEhFOU5ENEVTOW8v?=
 =?utf-8?B?WGc2UDFidk5zZ25ISDJ4dXB5a2V0U3dad09OTUlpaGxzUFZIMm5kUjd4eEM0?=
 =?utf-8?B?aXE0TlAxb3ZMVGhtQnpWVFlWK2VPdVd3UHlza1pqV0IyMjg0Ni9sT1NQdE5F?=
 =?utf-8?B?eW1lTUptUEZPNHE1SjgwL2FzZlJna2ZJV1lkNmI4b3RQSkYrUDhINkN4eHYz?=
 =?utf-8?B?NzhlNmFQMzk2Y3RXbE8vaWhWcnpFWm9ZR2NVTWlLZ2NwckVBTjZqRjd1OFpl?=
 =?utf-8?B?aEdTTEk2OW4wQkNZSlJ3d1VwWG9ZalJkRXREU0U1aXo2Y1hSOGVKRVNMMzVB?=
 =?utf-8?B?VWpyUUdMYktmOStEcHhFSmVSOEFObDErK0c3SDNWR0xSZkpseEtzdGlSaXhV?=
 =?utf-8?Q?4uyy3xLZar57XovTxG4NwWest?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29932d95-efda-4c38-e5d9-08dc36eb7f8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:53:46.7473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz1B1F6pSPj7cHoOw7Yq6TmE5sJuZbwmSKSewqnWh576ws2Kv2VK9oKvdKuS7kH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448
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

Am 26.02.24 um 17:50 schrieb Michel Dänzer:
> On 2024-02-26 17:46, Michel Dänzer wrote:
>> On 2024-02-26 17:34, Christian König wrote:
>>
>>> My question is why has it worked so far? I mean we are not doing this since yesterday and the problem only shows up now?
>> Yes, Wayland compositors are only starting to try and make use of this now.
> To expand on this, mutter will want to do something like this as well sooner or later. I suspect it's the same for others like kwin, sway etc.

Yeah, but we have done similar things with X decades before. E.g. 
basically the client sends a BO to the server for displaying it.

Why we suddenly have to juggle with the fact that it is DMA-buf shared 
with another device? This has worked for at least a decade before.

Regards,
Christian.
