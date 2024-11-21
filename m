Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E59D502C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3910E9B4;
	Thu, 21 Nov 2024 15:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3W3p90qo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9097E10E411;
 Thu, 21 Nov 2024 15:54:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqKhtY03wdS1pQVVl9Ov0MUlKJQKMqNlgsgXI0jx353ZZlyhcfkDPRuf7LuulPmg9HkfZBYLx0Jh/b8Db7SZAJN3ba5CoQCzzDLmts/Vfc0lZl9c7tsXMh/MdAZIzhoI7L8meCbD3pE4hhBbmoWeyZB9CkCAAgptomVPo34ZoVWioYJVE26jZbFkgoh5uOGEKJFeTUJBq5UMbW7hLOzmTf8oPgZpNxtYQswr+F7jQ/HMWDqk1I7M+7XbbpwyaH/StVpnzvM7bXAcOu1gb377ZPfDO8qmhjLCUl3/DHjs7oZe7coNfqUDU6eyPAv9gsx2Nc2MGHzpHNy8WL2YhY0l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdPhIgEMRg94WWnohU/JhNnV9OaPdQp0wKpWCcf4244=;
 b=Dp41U4kk0xqqcJVpI4FgEVTONaQupNya9JGJjgaN0uo3dlEGk4C3vSKCMG0de+oGZ7JXLCMbAYtzzWoEy2VfIUAq3fWLU23yy2qv/rFApI1YwXLGe5qiPE/lQHqNKY6ZH5pWBhvJlT2WEXgWgboQz65C5Mk99afZSyEdmRvkQgnR/IRkvQZgvnitHx2P9BHLhEHBRiP7RZE/ekWkMGDnmrZOyGDm00vSbNSq/NA7Mn44DcUe+MzoMHDsqtb6vXrrgwc2EMvDqnPc/k9fGfg7F4L2ZKtsjpMuuv1DueXKGgpR/3P+ddrkt5F/CTQtMuGkbRk1f2OGx8u4Cy6ffGplAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdPhIgEMRg94WWnohU/JhNnV9OaPdQp0wKpWCcf4244=;
 b=3W3p90qoKwkf1Rvrs/0rh6gzFw7Q5FdLZCTBkJ7TmKX/g8vpSuprSlMsew575jAqinG6aCp8UYKzu1skz6mVbfQTnL70s9pTnPw/buTRSJLZsAc81nmVYxO6ruKN9pKsVUfAdEq8usJcUqiYoOVg5t0ZdTeCT41BGdRn5VcbHZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8528.namprd12.prod.outlook.com (2603:10b6:8:160::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 15:54:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 15:54:02 +0000
Message-ID: <78ad9dfc-386f-4aa7-a025-a2ba87936068@amd.com>
Date: Thu, 21 Nov 2024 09:53:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] drm: Minimum backlight overrides and
 implementation for amdgpu
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
References: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0076.namprd11.prod.outlook.com
 (2603:10b6:806:d2::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: dc358885-04fb-4aec-7794-08dd0a44b85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFM5L29xVUpFMjByUnp0RGphNUhHbTZNVEVRV2Y5WHRmZHFrMGxWWHF6TnZk?=
 =?utf-8?B?Uzlqb0x3dmNLK3FFUjNtQVNDajZFd3o3TUs0NW9lcVV3ZFNVUXByem4yckxG?=
 =?utf-8?B?SnV4Um12d3NjMEsydHVyc0xHcEhNaTVGTzByNmNJS2NTZ2J3dFZndlI5TXA2?=
 =?utf-8?B?a0JtZnQwQzZlSXBnYnJsUmxOUHFJNGY1UERJMkp5N21QUERNUElIb0gvaHB6?=
 =?utf-8?B?RGQxeTIrSWsxb1dGSHE3SHF3R2Iyc2c5ZUNMTUpxd0g4Si95bjdTMkVMaEFm?=
 =?utf-8?B?OVFKWUpPNHUyNUFBWmMwNjVPTHJTZktmWUt1UXA2ejVHUUl1TDVtY1RwcEcw?=
 =?utf-8?B?VC9YcG5RSzhndkVWUHdDT2Q5OGcyZnlTUTlEU1V5Q2JpTk5NVkZ3RHZJa3pp?=
 =?utf-8?B?cGFzblVBYTZmRVc5V1BudFYrUlJybFVsUzVrSkdRRy8zaDdkUjNYOTRNWnRR?=
 =?utf-8?B?Y3dEdWdrOEsxUFlVR0ZLZUh4M3p0bk1pM3p4cW10WDAwNHkxYmxlU2paN214?=
 =?utf-8?B?Y0VIYnhKUDhCOFVRN0pZaXNENHgzY012c0NIK2dDSTBjcEFjNlQ5QkorM1Vv?=
 =?utf-8?B?UXpBS2xFUnhzYk45N0hxTGg0a1NVL01ONVhLNjNpVjh0bmxBSXJhQkxQc2RG?=
 =?utf-8?B?RXBOdnhGenhFOHRmUHIybVZjdFBTb1FEMmhSL3E2VFFzREdiajVsSVRVUFBI?=
 =?utf-8?B?WkoxSW9kVWZzNkFMOHhOUndhRnZMNkZJOStuSUk4SXJ1N1RwY3NCOVFHYjNV?=
 =?utf-8?B?NjB0SlUwcWVpYitGWUNNVnlySWFGSTFDOWR2MGRNVzloU3dadkREcXI3NGFF?=
 =?utf-8?B?ZlNld0hVK0JGSEszbTA2ZW1veEc2TTdoWm56QkJRR0NpWVRIdDE5aXpwSzFY?=
 =?utf-8?B?ZkpNWW54UitETXp1Nko3cnlFdExXV28rMEw4OGJPaDV1ejFGNXhIMFdXQ3N1?=
 =?utf-8?B?TTZhY1Nqdlp0U3drcG1RWDcwNE5CTHA0MVAxSXFBTXRpYkFJMHBBTWRvWTAz?=
 =?utf-8?B?Sk5VN09aRjA0TTdYcVZBcnBSdUtraWZKMzZFTHpzTi9YUVFHTFJ6SWVFeDhX?=
 =?utf-8?B?ZEx6SEFYNkRXRWdhV2lndjNBR2k3R0tIOCtTNFpFcUNTcnBBR3A2UUxKUWsx?=
 =?utf-8?B?OVZWV3hHNGdYTC9ZL00vSUVuMmtkVWQwWnh2UU0rZVhzMjNRM2ZSSjRDZ0xV?=
 =?utf-8?B?WXVBTnI3OEpEZGJPK3lpUXFnLzRTd05WdFB0Z3Z0aUt3RlcyTDgydzlJdzNC?=
 =?utf-8?B?RXJDOXRBb1ZyM3Y5RmJRUFVBV29KZERDMmVnSGI4L1RVM3AvTWxBZG5aMGNj?=
 =?utf-8?B?T25wZWJPQlFKVkIvczlGdkp6bW12b1FjQ1hsYnBnNjIyZG05dmx1SFU5MktT?=
 =?utf-8?B?eGFTNSsxbnlZc080Wjl1b0J5K3VFOWhEU0UyTEMrdjdlc29qdXlVZUFwT3Zm?=
 =?utf-8?B?UitnTCtPdENlbTRWSnREenpqV3pGNDFhWjR0aXlLTXVCelhlLy9XZ3dRamZy?=
 =?utf-8?B?RndlMHRHM2ZwQmNnVnFkSTZEVjhyWDFTeDlDU1NzM3luOUxCNy9PUDlQUUFa?=
 =?utf-8?B?eWVVUnhqNkh6T0FzcmVnQ3AyMEZZcXE5MXlOdFRMNkJBUUhwbmFlT2pTaXlY?=
 =?utf-8?B?NjRNY2JDbU41NEw3UVBsUFZORVF4cjl3WEduWHRPR01td1FJeVBySkUvamlq?=
 =?utf-8?B?NU0rV2JoQnRjQlVHdnd3amVvellPeXJrUmRrZ2J1TVF3VXFaaVFjaDJNR0F1?=
 =?utf-8?Q?0GRS3sH1YCsdVl/Lu3c1sVwLxwC17DtUM6OMujC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXhlRlUwZHNNb0pkTmlyQWZnOEpiakxqcUhVY2I2TUFvWDJZMzZUVU5BOGJH?=
 =?utf-8?B?UWRjM3J6dWprMyt0OEF0Q0tQR2l2bHpQSUJ3Q3A2UzVXMjl2VTBPeTdtZDhw?=
 =?utf-8?B?NzBGLzNFTDI4QnAwWHJ5TU5IaWEzY0xQVnNURTUzN084T3Y5OThiZ2oxa09s?=
 =?utf-8?B?U3g5MjgxQ2tyNFZPaUhFQjJOOGhwSm56VXRUWHRaZExub1BLNE1pWGFIVVh4?=
 =?utf-8?B?a1lDS2U5elRiY29USTA5Rk1qQXlxLzlzZ3ZMdVN3M2Mzdk5Ld3ZGRndXQUJQ?=
 =?utf-8?B?U3A5K2NHbU1NbC9ZZmFpWVZjUy9xckRLUm9FdFF2ZHhHOStEQWd5elNOWDdD?=
 =?utf-8?B?VGFpV3pQVjVhRmlMd1pVV1hCRjkyZ2xodnRTcDBlTG5uQkt3NDR1T3ZLOEd6?=
 =?utf-8?B?SzFleHN6bnZrSXY0M2tmS2tCclRQYTNxblpMUEhQZUNuSG0rSW1QTWlyZGN1?=
 =?utf-8?B?NWtiQk8rTkIwdXhrQ1RBZGwzaFkzdDdMZEh0Zk5oZThWcllzb3l6dUlCNkQx?=
 =?utf-8?B?emFKbFZjUEJacWRvcFo0SlJvSnB0V3JIa0lIMWM2ci8wTXFHV3E2akxNSmZQ?=
 =?utf-8?B?NndKVUUxVU1LRllaZERIRGdNT2thZWxxcXBDOHlldHJ1d0RPZDNzSGdWak1z?=
 =?utf-8?B?bXRCa2RhKzZ6TzRyeFVHUDI5UDRBbHRsdDhkOFY3Sk8xbDJla2dLUWZNUlNy?=
 =?utf-8?B?RTJ2SCtNb2lDSmw5d1cwakhVcUFuYlROS0VsQnlMS2NMamd5NGVoVGxTaHBZ?=
 =?utf-8?B?K3phVkxhMUZMK05TOEVBVUszeGpCSTM5dUFrYzlBcnRaSFR1amlEZVhLNFpk?=
 =?utf-8?B?QlNPMlZINDB0aHU1QXpEOCtxdzF3Q0MrQVl5NVpYdWY1dlRjcC9jZ1gwaWZl?=
 =?utf-8?B?ekZiY1l0UWoyM0h6RngrOENXUjk4SHU0VklXaVFYalNlWmhubk1ISDJaWkxm?=
 =?utf-8?B?aTVLaHVJVUZtbDZNLy9ISUpUU1hLZ3JXV1RiWnBKOWRGZXR0aGdvNUVycFh0?=
 =?utf-8?B?d0dVZkZHNHlxczJQVktwQzFQVUpsRmRTZDZqR3dUWDNReE5pRmt0bnFKSzVh?=
 =?utf-8?B?WDdUY044anNsZVdRVUllL3lxK1JpUys4Z3BRL0ZFY1BMWmxCYXEzUS9lSFRN?=
 =?utf-8?B?OUJONlJ4T1ROWVRIa25ZMlhBdUNma0NMQ0tBZEpRZDdTZEVXTXVLVlVOK0NU?=
 =?utf-8?B?UVZXZ3ZNU3N0bHNESUJMUVVFUEgrK05yc01ZaThmQWxmVDZLbVpaZFhJVTZy?=
 =?utf-8?B?L2lsTkZ4Wm9CeDAwMmIyOW4zeERtUWJzRnBkVG9DNWY1SlY0VHUzNEF3SHVM?=
 =?utf-8?B?aTJQMHlTanV4YzFicVdtSFJPL3dBVXBUTDdwY2J1a1VTVjBQbTltVDdXNjhP?=
 =?utf-8?B?bVZZOWFVcmNURklOWlF1U1FmUDhEMjh0aEx0Y0NGMUFCSGk1OEpDRzA0OURa?=
 =?utf-8?B?R0pwV0wrNWs0bHRhRlE5L3U2UkFnOE9sbWpjS0ZXc25pUUxtWkhVc1RzYktG?=
 =?utf-8?B?K0NNb3UzOU5tbUdUNlZSY0haM2FnRHRyRTB1WU1JQlg4cGNReTF1TjQ4Z3Rv?=
 =?utf-8?B?RVVNc1VWVUpueTFUQlREa05hNmhIUGhkcHRCTzhrV1lweGY2cndHOTVFQ1d1?=
 =?utf-8?B?V0plb2hzMWlub1BPVm81THRtRDEwMzBwMUplVEVmNzVUcE81Rk9HZTBVaWg2?=
 =?utf-8?B?aHpuNHlJbGxQcUxsZDFGNkU5YWdLMWpZT0grdWpURTJQTHZZYkpDd1h4aTJo?=
 =?utf-8?B?SnBnZDNwM1BvY1N6MTZDZ0F5ZGdCcWZONTZhU1VKc2QwM0M2UXBBeWYweG1P?=
 =?utf-8?B?MlJLU25aL0FZRG1YbHZRdm5WeDcxNXc4VzBLbS9tdGF0RU1ZNkdqN1FyZHlG?=
 =?utf-8?B?OHgxMUVTb3prb0JiemU1VzAvMnovNURHME1tOEtibXM1RDdOemJMZnJDSlZo?=
 =?utf-8?B?VUxwTHJQZ1dDVlQ0RHd3elU3MkNiOE5PeHBOYXZTMHFybFhhWWlPM00zWnpC?=
 =?utf-8?B?cWF0SVEzd1ErRUFrQmt4MVhOU1orK1VQZ202WWFZUVZGWjl0UUIvR2dmRldR?=
 =?utf-8?B?STVxMDFoS2JyVjUzWHptaXMvMDN6Zzk1amtrTGVWbVlYL0IxWUVsMk1QN0FX?=
 =?utf-8?Q?o1nQBfOISRwV5iWgV+W5aGqka?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc358885-04fb-4aec-7794-08dd0a44b85a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 15:54:02.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ivg9wgv+bAXP4bJo4gmZozBuFbyOuXMM4wDsVE84bAV1+DAlnQZnSVN6TVJZ3roHXHycewoblIFzosKEmKx3qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8528
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

On 11/11/2024 12:09, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Introduce a quirk to override "min_input_signal" to "0" which leads to a
> much lower minimum brightness, which is still readable even in daylight.
> 
> One solution would be a fixed firmware version, which was announced but
> has no timeline.

Hi Thomas,

Thanks for this resubmission and the rebase.  Apologies for the delay, 
but this is now picked up to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=22e5c7ae12145af13785e3ff138395d5b1a22116
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c2753b2471c65955de18cbc58530641447e5bfe9
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=916ecc0db336768d80e14ef28a8c64a775274f95
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d80b5c5b9be6b2e1cdeaaeaa8259523b63cae292

Thanks!

> 
> ---
> Changes in v7:
> - Rebase on drm-next
> - Drop now unnecessary hacky allocation of struct drm_edid
> - Link to v6: https://lore.kernel.org/r/20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net
> 
> Changes in v6:
> - Clean up cover letter and commit messages
> - Add my S-o-b to patch from Dustin
> - Mention testing in combination with "panel_power_savings"
> - Link to v5: https://lore.kernel.org/r/20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net
> 
> Changes in v5:
> - Forward-declare struct drm_edid
> - Reorder patches, quirk entries are last
> - Add patch from Dustin for additional quirk entries
> - Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
> 
> Changes in v4:
> - Switch back to v2 implementation
> - Add MODULE_DESCRIPTION()
> - Simplify quirk infrastructure to only handle min backlight quirks.
>    It can be extended if necessary.
> - Expand documentation.
> - Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net
> 
> Changes in v3:
> - Switch to cmdline override parameter
> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> 
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> 
> ---
> Dustin L. Howett (1):
>        drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels
> 
> Thomas Weißschuh (3):
>        drm: Add panel backlight quirks
>        drm/amd/display: Add support for minimum backlight quirk
>        drm: panel-backlight-quirks: Add Framework 13 matte panel
> 
>   Documentation/gpu/drm-kms-helpers.rst             |  3 +
>   drivers/gpu/drm/Kconfig                           |  4 +
>   drivers/gpu/drm/Makefile                          |  1 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++
>   drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
>   include/drm/drm_utils.h                           |  4 +
>   7 files changed, 113 insertions(+)
> ---
> base-commit: 377dda2cff59825079aee3906aa4904779747b0b
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> 
> Best regards,

