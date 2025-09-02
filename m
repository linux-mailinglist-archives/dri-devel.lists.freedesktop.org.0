Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF00B3F66B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5E10E194;
	Tue,  2 Sep 2025 07:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FsKBarhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892810E194
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV9e63m3ueEWiykJIWFzje5p6SnPw/3MsnrVsnCUEctloOR/JlDLMFRO9EHcdEDFzVJ8j3ZyMnYzJr1mNbeUjVyskR+tJemJyuif2NMp/Otq+4NXoLavJyaaa3InoCvEK3wL3aoTzEY0txQd9oZiefPSz3Um4K3WUmghvwkAHIKkmK6F+9wjwxPDbrEt2pDMdVCfduV+46wyjXXZ7GnM+WzfgugGlg7GHee9/YpVB0YiirYiTv52rOXvt88RReNBt65f1+CdHDQZMStj7P0Y546sEldQArZcGyTrsC4nR0zz6YIqCq1qezfP5ipkuS1MTkT0QfQ/pjBNv7OfRrmagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBFpqY/PGl3mB7L/KqkM2vC+WsH5Emujce5GkaypXy0=;
 b=HsU8VEFMOZZiRfXdSKAnlo39t1mtWLxgv24YF6iEbRlavg+MzPAO0MQHZgHi7jLThcBAVmCoQPIjfHxie8X7VToZNdu4qCLe0us4vI56waKBg2TgmgL1lZLZBnmEwZxnR5bmogNZlYfQb58sqgQlDzHvPnj6dlcu6URv0o1ibZHJ2rUGEDKMh0btdGvaASe4IQ/uAvFL10Fd9TbKOV1VDV8JDz9OZWpxcnskXYOsjnNONeeLCl9IdqgwMui2LWcAY3o3wke4f0FC26xkiPRuPPmCdq1NBvm42Q5za6w1hRn1nfQwN+SawDBDregCneh0m20N5yO/LTMH5fcx10XzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBFpqY/PGl3mB7L/KqkM2vC+WsH5Emujce5GkaypXy0=;
 b=FsKBarhCR31sgXDOwJ0XHntFWf+bVqME+zqa2tiRjdKClmG0HobmWqQmOU9GXC0tPccOfeJYDP78EeZwqAf0AYHNE6Od3a3KHh7vh1fFlj7oFCvLCkXEP0dAnj1uwOQl+06syfX6E+CxB+yp5SIBFXWIXpDceLEh+kNkppbzPuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 07:17:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 07:17:04 +0000
Message-ID: <5040d0c3-bd87-46d3-8181-928f6ff4cb10@amd.com>
Date: Tue, 2 Sep 2025 09:17:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250902041407.2040538-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902041407.2040538-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1e8d57-7b84-4b00-bb68-08dde9f0b77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVoyUHphT21KTDQzUWRKMnYwSVRJSWhXQzlLT2hZdE0zZi8yakZuVHBpNTEw?=
 =?utf-8?B?N0VnYllMUnhHYnVoT0F4d0dKUk5MQXYwSktadjlXSStSVkhsb2JRcTFLTnJt?=
 =?utf-8?B?QVZPQ2VuMXIwME5rcm4rLytxNXJpZXdXR1ZDdUJvUGd0OFBtUXlvcWFNZGk1?=
 =?utf-8?B?Mm9ROXFwTFhHV3hDMCtBUkEvdE9jaXIvQkZLQjI3ZVpvWnA5ckthSUtMVnVJ?=
 =?utf-8?B?ZFd6QlVIc1F3OTdGWkFHTkZ5MUdLNms4NzhPZW94Q08vT2tCK21vK2NjZitP?=
 =?utf-8?B?eEtySnAzZnpJVGZ6UjI2ZGVHRE9MbCtRZXNyTm9UV3NEYU1CeWc1UHprV1hI?=
 =?utf-8?B?T2xNRmRhbHUyRDlITHUxZEVtMkpyTlRPMStBT0RPTkhBZmVqSVc1c3lBMjFt?=
 =?utf-8?B?OENRelZUUkd5eDlyakpKUFAvelRLNW5NMFhzWjdBMTBudzdqbnNkOUFwZTR6?=
 =?utf-8?B?d0F4WTFzaklWUEVHcGw0MDNqTlU3VElmVWZJRVFmUXljcGNvZGJYWEJLa3Jk?=
 =?utf-8?B?eFpqYXRBOFZ1dHpINVlSSkhHK0ZCVkpKNS9DengrZ2pFanJVaEtBd1VtSjR1?=
 =?utf-8?B?WHJRRnBiQ0JTSUFVWmN0RlU3ZWsrd1hudE0yVTBrMXo1Mlp5TkE5b3RtNC9K?=
 =?utf-8?B?dDZoK2l3VW5GR0grbjk1ZUxsVDdNdDhrK3FJMC9KQ0VhKzl1MEFoc09rYlVj?=
 =?utf-8?B?NGNWazh2NVFieHdQSGc5ZW9KQit4ZHFrLzNQbHZtNFltWFNDeDN4YjN5VXQ0?=
 =?utf-8?B?a1VIQitXclcxMEtsQk0xd2MrZXBPc2ZLQ0gyWDBJeVNVcTJkaDhKU3U1b1ho?=
 =?utf-8?B?THBXVXBORWs1VG5tc003OTNlUlRZUmZVZnNpdXJRbXJUTng0UWFXZ05obExr?=
 =?utf-8?B?N2ZhU25FeTU2L2w1Sk5QbDV5TXF2Q0VkT25tQTZDeUNtSWw0TXJPY3lVenpi?=
 =?utf-8?B?TUxGOVQ4dHFiTjZQWitHSHpxTUd1Tk9vL1N1MlhpWHJta0ExbHpiU0dZNTVQ?=
 =?utf-8?B?VVp6dmpwRzBta3UxVkRyb1pzeU1iUUVCWUZicHVubkppT25YRThmR1M2VFJj?=
 =?utf-8?B?UE90VzBzekpMQUZwVkd0L2NGN0c2Y2YwRjB0a1NDNjg3WkxCbVNBajdRTjE2?=
 =?utf-8?B?K0Nsc0JNR0w5YlgweVE5cTdzczBnTjB6S2dubVM0VjViODJ6aU8zenl2UEhu?=
 =?utf-8?B?dXcxWGEyMHZKVHBITkxGUXpnNDZBNFlVZUZhSkFWR3BEWGUrVVFxOHpEVXAw?=
 =?utf-8?B?VHA2OStXQnQyNjB5NjB2RDlDd1lUdnlVaXVtU3lxeGk0WTJsb3BJRVAwM1Aw?=
 =?utf-8?B?QXRmR0w3cndvMVYzYlczS0l5dlViR0cvWWFUUDkzOUp1eGFScCtMVURnRjZB?=
 =?utf-8?B?V2ZJZXg0eUUxRnlvYTBIemJJUVZNeFFEVUhRSSszeXQzRFYvWkY4aWFPTGhH?=
 =?utf-8?B?bENTSFVtcHJVVlNSMml2YVZFWGg0Sm5DSzZVS0ZiSkp0aHpLeG9hTDVpRy9R?=
 =?utf-8?B?RlFNTExnUmhRNWg4YXU4bVhFRVExeHpGeDEwSGVETHZCbmJ3TklVT2hlZ3kw?=
 =?utf-8?B?QmUzOHJGN2s3a243UEJaQVZXOUw2c1ZXTWV6eXBFU3hYeUFsbEdoN0hpUEF0?=
 =?utf-8?B?VmlmaDZmV2pyMWpGSnNRZHAzUG8yeE5qdXlwNUVYZlEyRGhuV0NnV0RDQ01Z?=
 =?utf-8?B?QVM4dDdZTEZteTJWTjhxY0wxQ1Y2YkJkeGhUSUJBd1l4bVA1bW1TUlh1NFBP?=
 =?utf-8?B?L1hCUHZBTS84UW9GWUJCVXh6eTR4TEVDU2tkRHI1NFkxTy9jQ2FBelQwdEVv?=
 =?utf-8?B?WklPa3R5ODRObWM2NXVWQlp0Y2tqdloxN3UvQXFCaWd1YlRsNDlMUHZndFRu?=
 =?utf-8?B?cFVDRnY5R0NhSjRhWHE0cjRRK2QwSlAzSVo1MXBCZUF6NnUxQi9yYnQyL2tt?=
 =?utf-8?Q?YsXZa6fzim8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Lyt0YytLYXk5alNmaG5TeE0vZ2k0Vkd6ZXFkcHI2YnNPcHVIUVpDTGp3UVVG?=
 =?utf-8?B?YXduUmY3VkpzdW9ETUY5VlhnUWVsbE5DNEpyM1JQUnFaa2pjZG9XQlFaWHJI?=
 =?utf-8?B?WWVoVVQwZlRRdmhNUFFLMTBZM0JtMHZEbzJQanBubGVqbjFXa0dibmdpSWpu?=
 =?utf-8?B?dW1nMzJFUENETStoa3hxRG5hZXVFZmRQQStWRTRUaHRvVDlyNmJLbGVlN1lq?=
 =?utf-8?B?cXpEelVFRVhMV3dXT2Vva2N3eStaMzFnM251TEZUYWRlbWZSTTFVczNsNkFv?=
 =?utf-8?B?OEVlZ2tCYzM5Y1BvQnEzRk1aVFNaamVlaWxGV0xDcEhoaDJpRFd1UjhEN0hl?=
 =?utf-8?B?aFhKMlp1SGYyUHJWTlh5bkpVVDJzcUgvcGQ3SzdkcFJVUlh3eU9MNlVFaHkv?=
 =?utf-8?B?VjdMMW9BVEgvZzJnd1d1QnB0cFlrSDh0aTE1Vy9Dc2VOY1ZhTWlkUmxxM2Zz?=
 =?utf-8?B?enNGNjROM0ZtMDNCVVpwQWFLM0lHdnQ0a1VEamdheWdXUm5ORDlFVnBNRTZn?=
 =?utf-8?B?T0p1S2VCbUVxTDBtTkFlcyt0endVLzRvQ1RQMTdWKzVaNDRMWXNkdEdhYk10?=
 =?utf-8?B?czRYakFMUHRnblNjeGJJWVlHMVdRMy9oejEzOCtQa0ZnN0FCUkVIRk5ISmxC?=
 =?utf-8?B?bnppbDBETzhVV1pDRStuUmZEcjZCSjR5SjllaWxZNEhibGQ4VlZBU0M3a3Rl?=
 =?utf-8?B?VFNkeGJTa0N6aEVPYmgwV3hLWTJrVHpFa2NrZkxHdG9rSWdXZHFvUUhDTEZG?=
 =?utf-8?B?WlNFU1NwKzFQa2lSYm1VVGw4cXRzS2hleWVnYUhrT2c3UEU1VjRlK1FvZ21Q?=
 =?utf-8?B?Umd5Q3RUa0d5MWJWMW5xSEQ5N0pmZ3VLaE5HanpweFJabmtJM09mdHRiRHlZ?=
 =?utf-8?B?d29yVWhIODlWOXJIckx6ZFZwS3UwbGdsSTRldk9vNTUrNlMwbzF5eTlWWkFy?=
 =?utf-8?B?MER1ZEZkbVhIL21HNlNXbjVldDZFRzZLUjZmUkJDQ05wZk12aTQwNWhETDc0?=
 =?utf-8?B?WkdjZjBEMi9vZkpBZHhReklyY1ZNeDhaZ1VSclUveVBQa1FoU1RPNmpBVFp2?=
 =?utf-8?B?eTZucHZwUFNKa3BWWlFIS3l2U1I5c1U3djQvL1pIVTltMWJjeldPbUNQQ01C?=
 =?utf-8?B?UWhKVitBSkcvN05qSi9Yc3JSWncwbHVKclJhNFpWL2VwUHhuYjVaYjlKWGhV?=
 =?utf-8?B?ZjZhdi8rTzMwSmFrbzdRVDEweTlmT2Fkc2FCWlA3VDN2eHZJbFFXYzB1U1I4?=
 =?utf-8?B?Um5jMXJCdVMyT2E2R3NmVUpUMFk4WllncjVlNG1rczk4SlBRTmZoUFlqU2ph?=
 =?utf-8?B?WERGVGtCeE55M1p1L3V1UjZCbzNXNkt3MjJzaUJOTzRzdGxrT2VWZ3RZSE9B?=
 =?utf-8?B?M2ZOTCt0K00xUkZKWlpxTHM3aTBadmMzYXBMNTNEZ0NwZkZtcmNJaU1XdzFr?=
 =?utf-8?B?N2VmY1VuTEJsNSs5VTN1OGZPaVBXK0JzRWpKQWxpTGpCSVZGTjFlSk51REN2?=
 =?utf-8?B?YzBqYmEzem81SUlnWUt3dm9CdFNVOFJkR3RzY1pxMGpxODY2anhDWThvSHdS?=
 =?utf-8?B?REFUUlQrYUFiZlB1bldFQ2l6bkdmeHhETnN0RzZYOFd0a0k3N1lYMnhxNjNI?=
 =?utf-8?B?VFRTWHhZd1dJNTNrVFRzSHhMbjFZOGpaUTlmbjZCQkFhQ0ZRdEt6WjliMlE3?=
 =?utf-8?B?SlFJYnNLdkhwTFU5VWpxYm03bGdTUnFCaWtUc0JDZnZ1VmNSQnRxVkpzaWx2?=
 =?utf-8?B?VVo1aFdXMjJ5UElsMFJSQ0hrR25WRWt6Y0NUMWl3WjdOeEhlOURFZ0h1Qkxh?=
 =?utf-8?B?bDVDSW53RjdhR1NuYWNuYmtCYTA1MHZ6NVVQSml1ajBFV2kweExvTDFMd1VV?=
 =?utf-8?B?cWtmMmRGNXVXSVdZNVV5dlg0cjNXTGNDZ0lKR0JFL2dWdFM3eVdEd2dJeFFZ?=
 =?utf-8?B?U21qSmk4WmdrZms4eDFMeFJQR21TWmFSYVdrOXduWmMxNlFDSFR5WlEwNEt1?=
 =?utf-8?B?WncwRkszOVVIQkE4OFhMdGViNlF2bkZKTGVTWHhXbE95S0xwVUVSKy9XWTlu?=
 =?utf-8?B?SEs5c3AxeXRVNTQzSkRURkRvc3luTHU5RS9SYVZjSjdhSVNSZHBPZW5Da2s5?=
 =?utf-8?Q?gu+P+KaFJ5hAQQqXvp2UyuJeD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e8d57-7b84-4b00-bb68-08dde9f0b77a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:17:03.9068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTsmeHqpm1k+cj1fVQrxPB0kkDLSWDbeDgdBjDnmkwLVASI9y//ZBNtXW2IgX8Ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
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

On 02.09.25 06:14, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing cgroups we noticed a problem where you could export
> a BO to a dma-buf without having it ever being backed or accounted for.
> 
> This meant in low memory situations or eventually with cgroups, a
> lower privledged process might cause the compositor to try and allocate
> a lot of memory on it's behalf and this could fail. At least make
> sure the exporter has managed to allocate the RAM at least once
> before exporting the object.
> 
> This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.
> 
> TODO:
> other drivers?

XE and maybe Nouveau are a must have I think.

VMWGFX and hisilicon maybe, I don't know.

Radeon and QXL probably not.

> split this into two?

Potentially better, yes.

> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Apart from splitting it up Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> 
> ---
> v2: let the user choose interruptible (do we need the whole op ctx?)
> stop checking things outside the reservation, just populate always.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  5 +++++
>  drivers/gpu/drm/ttm/ttm_bo.c                | 23 +++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h                    |  2 ++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index ce27cb5bb05e..c83289ea3e8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -343,11 +343,16 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>  {
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
>  	struct dma_buf *buf;
> +	int ret;
>  
>  	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
>  	    bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
>  		return ERR_PTR(-EPERM);
>  
> +	ret = ttm_bo_setup_export(&bo->tbo, true);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	buf = drm_gem_prime_export(gobj, flags);
>  	if (!IS_ERR(buf))
>  		buf->ops = &amdgpu_dmabuf_ops;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 273757974b9f..3afb577cf327 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1284,3 +1284,26 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_bo_populate);
> +
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo, bool interruptible)
> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = interruptible,
> +		.no_wait_gpu = true,
> +		/* We opt to avoid OOM on system pages allocations */
> +		.gfp_retry_mayfail = true,
> +		.allow_res_evict = false,
> +	};
> +
> +	int ret;
> +
> +	ret = ttm_bo_reserve(bo, false, false, NULL);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = ttm_bo_populate(bo, bo->resource->placement & TTM_PL_FLAG_MEMCG, &ctx);
> + out:
> +	ttm_bo_unreserve(bo);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_setup_export);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index c33b3667ae76..91913cad879f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -473,6 +473,8 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			bool interruptible);
>  
>  /* Driver LRU walk helpers initially targeted for shrinking. */
>  

