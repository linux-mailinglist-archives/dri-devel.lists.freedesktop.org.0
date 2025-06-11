Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9778CAD584B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F199010E685;
	Wed, 11 Jun 2025 14:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iKb6xpen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8351410E671;
 Wed, 11 Jun 2025 14:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNClBtWDOhbvLuercXCP89+AE0tg71sHGGjaIV3nO5DE/leU7RqrL8DIPvq1W77kt4NqoUW2spw1DRKFCEugDcCk/yoq4wQrv0SqlXHuVgNxUlJcex8S0PnNBN6xFPnFxIHf8JTK4wDCZ8QO3VmW3ZZpfcH3ELDkE/tiQj3Z+r9jBTGISNdw/0Y9CLWUskz5WfKYPYEeywHltHs/fa2TwcPQkQXsVUmXUKvsg+5kwvSK0MiN388mYcmR6vzpoSZ41O3WIZcrXOhjgHN4PdZykPeEW2QkrEdqsawlpMGu8pTeRhrNbG33bjQap6GtUYWdyRxasqADHJi0zKflEskeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N45NfTHF6DLZ8GphBLZxwR5SS75flgfFrvVajX9xbg=;
 b=iJRZF0ipPlfD8rIMeKmypMwHXLFqMYQjZTh2PmpshifL1tH9KW+Ysgmyt/H7v2qCYSf9dLmZHs+UIB/Y4v3nWdKdxXWSrnygv/9b8pGn6iiq3M0VNfvb/WgNEJ7/iiLcM7AVPBWzpNhiPSpTiczAtGHuGlnAHgzqg7KG2VClZEUdBrjTIKB1BfOiCv3tUBdMKjplbPaZ1imS0UBzaqsXMZeKGrmeJwiL4yAg8RgX4x7YJDlKlisytIBArC2EVFi154LWM/sIbAGsIIp6Xiqz2Y1fDlT7GOk8UPB/t2y2eSe5jYTb7Oee57n3YiyB6ym0BiR2LEdKwfosW/vkVPiPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N45NfTHF6DLZ8GphBLZxwR5SS75flgfFrvVajX9xbg=;
 b=iKb6xpenPuHW92O7ijf7KJGSuNk8vnwxw4pWr4VO2g619sT6++ITKc0cw3EW0oMUxeZg5n6A43FTn6f8J6lL6luy8tIZFJ4C5keDo532Wag/6meBUXumwehe/3A9oALhHOcakXkycuzcK6K+uMiCDFeRyELZHMj36R1w2zNPxFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Wed, 11 Jun
 2025 14:15:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 14:15:11 +0000
Message-ID: <4211da66-9bed-41ee-a596-046bbc0906e0@amd.com>
Date: Wed, 11 Jun 2025 16:15:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/syncobj: Avoid temporary allocation in
 drm_syncobj_timeline_signal_ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
 <20250611140057.27259-5-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250611140057.27259-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:208:32a::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 44099f8d-0a19-4dc2-cad3-08dda8f2609d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2xBdVNzTjc2Mlk4UmxZOVlLK1Q0eXVXTDQ3cWlxUTBER2I4VGw5dzF1dTUy?=
 =?utf-8?B?ZXh0cG9SZWRSVXVNaGg2elc4amJIdnJscEptK1IvSW10OXJOR2NDa2owR29Y?=
 =?utf-8?B?OW5VaWY0a2xHSzViT0ZXU3dMZkVtZUVKYTN5VFJSOUMxckprS2hGckFvbWVh?=
 =?utf-8?B?SGRlZVZTc0VxNXBoQUFRS1ltZHdMdWZ2QmhFZmk5b2htZ2NTSGQxVDNzYmNq?=
 =?utf-8?B?d2NTODlTWHdueDEwMzlHbUpWZnNBTmNuZlVpL0RwMVNTcC9sR2s0aENoVEhF?=
 =?utf-8?B?MGtVendhTVRJTU1LRTZON25rTDh6OThLd2tvWXRRano5VTF4ZVFwOU0yaWV6?=
 =?utf-8?B?Q3dRejlndnFKL002bXVhZ2xoYTRicENFcUpYUVZLSHNsZHYydmErN1NLSlVR?=
 =?utf-8?B?RzNMMTUyWGdYaWROdnlmcTYvL09ZeER6Ui8yVW9lNjlkVlFFRENsS3ZqM1dt?=
 =?utf-8?B?bHFUVW9BMmQwNGdKMGVHQk1aY1lvbTR3cWh6N2pKUGpnUkdyQTVqeXRHb21J?=
 =?utf-8?B?cjQ1VVphakh4cWhpazB4SysvQjYvOG9sMVdpWTNZOG9vSVZWRlNKRnNIWmxv?=
 =?utf-8?B?di9nZVhSVXdmMVVFSEFqMm9kNkVMckJYZU1zYjQyQ09nWHBpWlA4MjFVV3Zr?=
 =?utf-8?B?SGdDaGV4b1JqeEhPeHc5dDRULzdhaFpDbjhiT0Q1WVlvZ3dVU3c1T1p6N2tD?=
 =?utf-8?B?M2puUy8zNTE1MXhVbWtNQUxGNkpqdXJZdWd5RjM3NERFTTFtZXFvS2c2TWZP?=
 =?utf-8?B?SVBRYk1kYzByVmh3N1FzamV6UEVoWVliU3NyaXFzUHBwRitmc1ZwaS9Kc2xN?=
 =?utf-8?B?d3p4eGlaMlJHdEtTaGMwMFJ2Qk5Kc09ud3NFMGpHbXYxUnZRSXpDa2c2d0Qw?=
 =?utf-8?B?UzlHZUNqbldrS3JwTVpKUHYvcmRSNkxMK2ZCY1liQVBrNndKSXRwby9aQWcy?=
 =?utf-8?B?SGtORlNqUVo0Sm5CUEJFNFcwSHNDQU1LYmxzYU0xbnM3LzdnZ1hCVG5qczRM?=
 =?utf-8?B?ZE9EU0xpRkVvdzk2WnExTDZWYXpIK05HT1RRa0F6RE1rYmYxZ1RiU1phZWhx?=
 =?utf-8?B?bmg1MEUrdjl5cUFEZnNlaFo0NmNWaXYwR04xU3VpR0JiakU5ZTJxYW1iUXJr?=
 =?utf-8?B?bGsxSjkxYVhGcWtRM1BsMHdsMVNLZCttMkM5VXRuZ0s5alU2TEJRL2p0eWRw?=
 =?utf-8?B?QUF4Vk5LV2pVMlJxSDgzUlJjeFNWWW43R0NkQWk4TzQ5MUV6Q1NQbFk3STJi?=
 =?utf-8?B?RmwwYlR5eWZyc0FCOTVuVFZ0SnFlUE1hTEU0blpTOVY5RXBDYXp5c2FuemtB?=
 =?utf-8?B?T0NacWNDRzJ4OElWL0QvR1JuMng0TWtnQ3hUSFJtSk9kZjc1TmJMRXFJU3N1?=
 =?utf-8?B?RUxEZ25CT2VRbjUrSVZHSHo4YlRtK1RPWWFQMHpEeTlzampvQjV2MHRVNzU1?=
 =?utf-8?B?UjBZaU15TytHOWZQQXhnQmZPa1VnelVTbDVLa0tidkhDY2pyM0pXZGtuaDMy?=
 =?utf-8?B?Mks2WlVmc0NVU2M1RkluVmsvZGZobzZ3aGlaOE13SjlmbmhnSGxtN2pjVUhG?=
 =?utf-8?B?VENUVW1DTDRWd1puWFp3a0Jpdk81ZUt5aXNqTXBzVWsyZHZLWG03Qm9ETUh2?=
 =?utf-8?B?YzE5aktVLzFtL3RES1RqYmZpd1dpalpXY05HMEtHOGNSL3oxeUcreXNjQzZv?=
 =?utf-8?B?MlErRnlOWW93NlpURnREOXo2bzNFYU1ZalAvYnhJeHd2M0kxaHg2ODFxem50?=
 =?utf-8?B?U0lkMHNmSVd4V1pJMEczbjlJWnJiazRlQ3FIOWZLUHBlLzFidWxkM0k0QWRL?=
 =?utf-8?B?YlNXMmNlL2ZnQU1RZVU3MTN0a3N5L3N1aC93WVFDZTdIUVp6bERlSWRqbmIw?=
 =?utf-8?B?Wmh5eGdzOVBrWHlyTkkya0tia21aSFl6YVV2Snh0WmtQaE1rRktoOStHZGdI?=
 =?utf-8?Q?GzTzKgYBCQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhqYzhUTTV6RGFJN25GWEloK3FvZENSa2ZFWVRIV28yR1NpajdTN0tmUDdF?=
 =?utf-8?B?eG1xSFpvMjFwZFpKWjZqZ1BGbGxUakdqcXFvMExRM05OV0p5MFpmVHFOMkd0?=
 =?utf-8?B?ZUU4K2J1WVZ4WjltdUNWa3ludDJoTWVhQkwvZmhBTVNlZ3FCOVBYZUE5aWMx?=
 =?utf-8?B?VFlyb2tKaVVGUzYrZVB5OTBBTkpNbnlMOFp2OXhrSGt0cXJmUnQzTk40cHdT?=
 =?utf-8?B?OStET1pMVGliRW5SNGR3MnFEMy9vYmhKTi9iRkI3NmZabHI4MG1JaEU1NkZV?=
 =?utf-8?B?WXlNYmoyTkhaMEhkc2YrdXlDa08vd2RRUEphOHYxYzgzK2xDOEhtK051N0ZT?=
 =?utf-8?B?SkNJTnZVclIvbVR6TXp0TjNXWjR3MmI1eHp4WExRSXdkMDl5V3FGaTVqSklC?=
 =?utf-8?B?bkRiNWdiWHNCTUMyMU5qM0NPSjM4cDRpNkNteDFNNzAxbldHM1YzeGVqSC9Q?=
 =?utf-8?B?VkpVSGE1eUVZSHJwdGZha0k1eTcrS0RsRHN3S1hoY0FNRHpGSXFkRytCWnBL?=
 =?utf-8?B?MU4vZ05QOEpPSlZoZktHbXh3ZE5ZMUswTzcvbWNWZVlnM29sNnVZbGhyQmpw?=
 =?utf-8?B?WDZGdVU1K1FqMzFRTlZmSDZqalpVRTF5bmRuSWJBSndJRkRRV0RVbEp1d0Vl?=
 =?utf-8?B?bnM3ZDdpUm1Zb2JBNEhwcEZ6K1pIWnBYT09uTXV4b0tncWV0c2szbzFSNkJV?=
 =?utf-8?B?Rm1RUmd5TEFxaEV0QXRRTmVhcVJCZHlFWFh5NGo3UHRvVVNGVWNPamtOcVh5?=
 =?utf-8?B?a0w1RU02VllNL1h0NjRDM2JrS01oa1M0bENVZGY3eW5hMS9WS1lvdHpIaDRX?=
 =?utf-8?B?dkRRSTNnVm9xTXZJRmFrY2x3aGNLZUNTYW9ML2JmUEVhUFpBemJDRWlvM25D?=
 =?utf-8?B?VnUza294SkdQNW4rS1NXVUxjeEhHVGg0YzI1TVlTZnB4Z0NnaTVoSW1ZU0du?=
 =?utf-8?B?RERCL2RsWHZSSXZyNDJFa2h6V3dZRGZnNHIvOSt1Y0FZTUtvS2FBMDFFemhy?=
 =?utf-8?B?WEV6L0ZCaml0dHdVQnhnMnNSU0k4dWhPTVcrMndtR3VXT0xPVTlNT0lrY09V?=
 =?utf-8?B?N2diaVRJNWJzNjJmL201OTA5bmdVS0ZwTmJYYlY0ay9WMlJmSnBIb3hDYmxR?=
 =?utf-8?B?MEJMeXZxd3BObW02OGhFV3htWHVTQXJkcmFma2NBWHN0WnIxU0hLRjJVcHh6?=
 =?utf-8?B?YjFFVjNVM3YyWm93WExDdmt0VEtSb3lNdFVDRllDU1N3aFNjL09YOGpkdUFy?=
 =?utf-8?B?ZkdWNUc1YTZDcGsyTXAvSjNyV042dUpJdVBIQTVRQnJaSFlLbmpsSlVSRXVR?=
 =?utf-8?B?ejZ0aWpjWE9lTUJsZ3RReGMwKzcrTWZHSHFMVEE3WTJJWFBkSHE4enV6c1lB?=
 =?utf-8?B?VWZaZzN1OWRCTW1icTFMc2g3amZkWTJWczRGclkyQitiVitxRjd0a0UrWWRP?=
 =?utf-8?B?TG1XL1ZaWTM1SFpEb3FHblFGa3NWZTUvZUl1eFZMT2JhTUZDNHhWQkZHdnds?=
 =?utf-8?B?Zmxtd0FyaDB3L05kb0JCL2xMTlJ5MTVFRnFXbXd4L2xmWmtNVDBBaWk5ZEZ3?=
 =?utf-8?B?bUJzR1pHenVINzBGYzdDczhRQk1YUE80NUhlSmNUSVNsMC9KVnVyelRiTUhN?=
 =?utf-8?B?SGpOYWg3aTBpalNqbVd5RnljbG00aTVBRkZqckxXcUllQ3dZSGVQeWdMU29V?=
 =?utf-8?B?aHp1a0hZRUpMaUtTTjBZTXo3ZjBNbHRjRVh1d2g3ZGxQTnhsMGVyNHFGU2pn?=
 =?utf-8?B?VWF2dEJiUUZzUUV4Y1VoTXpMSFNiUGNGTWdoRG40ZytaVHkvcUU4NGwyb256?=
 =?utf-8?B?cW8wbGQ3TTZaVVkyYzlUb1FPTTdVR2VXWWFCN0Fkc3BzL3JGbnF2YkxxcG9I?=
 =?utf-8?B?VzQ0dldxMm02VDA2L0VvQ0tCSVl5U252a0F6RkdqREJLa3Irbmhqa2lHNjVZ?=
 =?utf-8?B?ODJYKzIxQ2Q4MXhYVFZGS3Z5SG1Qd2REeVlJNys2WUV4V1pTdWlQSWJUTWFk?=
 =?utf-8?B?M3Y3MjllSk9OMzZrUHY1cTlDcTB0a3hhMllaaWE1dWl6S0JzdFA5QnNhdW56?=
 =?utf-8?B?YXZOMFlFUElWcWFpUWtMRU1RZmNVWkhNeVNJY3FEQXVjcllsUDlFNmhEbW1T?=
 =?utf-8?Q?lKnomuMySEskbO0lu/sl1evhx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44099f8d-0a19-4dc2-cad3-08dda8f2609d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:15:11.7368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+FiFBlGF0ufBbgkueH3cz7hkAIA3sjDowlnhg/Tr8TtAOAqonh4fEr8UPCCdVIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
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

On 6/11/25 16:00, Tvrtko Ursulin wrote:
> We can avoid one of the two temporary allocations if we read the userspace
> supplied timeline points as we go along.

The problem with that is that calling copy_from_user multiple times is really inefficient.

So that improves performance with few entries and decreases performance with many entries.

Not sure if having many entries is really a valid use case here.

Regards,
Christian.

> 
> The only new complication is to unwind unused fence chains on the error
> path, but even that code was already present in the function.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com> #v1
> ---
> v2:
>  * Change back to copy_from_user due 32-bit ARM not implementing 64-bit
>    get_user.
> 
> v3:
> * Fix argument order mixup.
> ---
>  drivers/gpu/drm/drm_syncobj.c | 43 ++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 497009fc66f8..9968d9429d90 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1579,10 +1579,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  				  struct drm_file *file_private)
>  {
>  	struct drm_syncobj_timeline_array *args = data;
> +	uint64_t __user *points = u64_to_user_ptr(args->points);
> +	uint32_t i, j, count = args->count_handles;
>  	struct drm_syncobj **syncobjs;
>  	struct dma_fence_chain **chains;
> -	uint64_t *points;
> -	uint32_t i, j;
>  	int ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> @@ -1596,31 +1596,17 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
> -				     args->count_handles,
> +				     count,
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
>  
> -	points = kmalloc_array(args->count_handles, sizeof(*points),
> -			       GFP_KERNEL);
> -	if (!points) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -	if (!u64_to_user_ptr(args->points)) {
> -		memset(points, 0, args->count_handles * sizeof(uint64_t));
> -	} else if (copy_from_user(points, u64_to_user_ptr(args->points),
> -				  sizeof(uint64_t) * args->count_handles)) {
> -		ret = -EFAULT;
> -		goto err_points;
> -	}
> -
> -	chains = kmalloc_array(args->count_handles, sizeof(void *), GFP_KERNEL);
> +	chains = kmalloc_array(count, sizeof(void *), GFP_KERNEL);
>  	if (!chains) {
>  		ret = -ENOMEM;
> -		goto err_points;
> +		goto out;
>  	}
> -	for (i = 0; i < args->count_handles; i++) {
> +	for (i = 0; i < count; i++) {
>  		chains[i] = dma_fence_chain_alloc();
>  		if (!chains[i]) {
>  			for (j = 0; j < i; j++)
> @@ -1630,19 +1616,24 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	for (i = 0; i < args->count_handles; i++) {
> +	for (i = 0; i < count; i++) {
>  		struct dma_fence *fence = dma_fence_get_stub();
> +		u64 point = 0;
>  
> -		drm_syncobj_add_point(syncobjs[i], chains[i],
> -				      fence, points[i]);
> +		if (points && copy_from_user(&point, points++, sizeof(point))) {
> +			ret =  -EFAULT;
> +			for (j = i; j < count; j++)
> +				dma_fence_chain_free(chains[j]);
> +			goto err_chains;
> +		}
> +
> +		drm_syncobj_add_point(syncobjs[i], chains[i], fence, point);
>  		dma_fence_put(fence);
>  	}
>  err_chains:
>  	kfree(chains);
> -err_points:
> -	kfree(points);
>  out:
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, count);
>  
>  	return ret;
>  }

