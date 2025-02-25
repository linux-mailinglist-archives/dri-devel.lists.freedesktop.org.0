Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D738A4434B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACCE10E6F7;
	Tue, 25 Feb 2025 14:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OUeZBbLs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E4110E6F1;
 Tue, 25 Feb 2025 14:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtDFKB4AMYQmbp6zx9yXnl4TwrXmrXC0uvtnJQ3wSniiMGXVMvRabSx1VlaXbk4X82uI4VWi4F+R6W2Pc0NF04uA/a4giKCrXVfeqxdnfL+g1ltZp+v1YEvjWZ0q9X3VOBK8TXwNKSaJBIIkmtM8uDz4Jm7RTcgSlil5P3WdzxN48eg2xOPCoTDdwdvelKWN2zwCsFW57e9nuNZQZkTkC9duqutcCi8pc4Hb+Vka70GGXWkjGN0xfhJVQpXhR81Apt3iQcYsmiAKMobFuMIdOadBs97FxmFMw+v0ZcKfChgNkMiETtRu5LxAAUuMweQHUW7F7j71rLX2uHhvaF70bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q+Av2KkXh8WStkg+FZtEIOodGH4DszewiBrcQaSH3I=;
 b=CjbRN9NWtLi6lwrMNhonaaujjmsKNi25g1nyzoU0pcdH0ZRC3eclp4cgPoy1Io+9s29WDseBRdQDOxLpDNLEygTAxN3gNPtyaqEGExRdQYFnazD6BbDQCQtnwXYzI+5ZEN3uGa6YxQPWgyfJKF92na8gHznRZgWO8I64Dt9y3KqEdoF2saAp60OMAWwWlydN8tOU3a2R3GVmFQDTnEWgTwilT+6530QSNWszVZaLeI0vyDVAUwVEbQfjQ46/zPe7sU9NjevEiFGm8ono+ZRyIz+NEdzAR2Qdxl8JYTmaRortcqwg3j5EHZkMdC5QtfkgVOwfT67+wW01sqJ/9L98mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q+Av2KkXh8WStkg+FZtEIOodGH4DszewiBrcQaSH3I=;
 b=OUeZBbLs1qXJxVrHpov3LXgioGHXWi/c5Kaoy+stSwE6hoQ4UHEQl3xJcH/uIT3ksB+FbXuxSrRsByTORTkxhGoqaRkt4Qesq/xXCYen8OjBP9z3dNIX7puEpoW0deFhsQdok/JwrGwTueQMv3DvMewEm/lXdxPgfcRLRXssNgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 14:45:08 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 14:45:08 +0000
Message-ID: <67f0dd85-4816-4972-82e7-31717cf578be@amd.com>
Date: Tue, 25 Feb 2025 09:45:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 03/45] drm/vkms: Add kunit tests for VKMS LUT handling
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-4-alex.hung@amd.com>
 <e8651c30-e602-4dd4-bb2c-0e6bca61e53b@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <e8651c30-e602-4dd4-bb2c-0e6bca61e53b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::37) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb91020-4d7d-48b8-884e-08dd55aaff9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alhZMHZSL0ovbHZwVCs0cVNUNFFHOXp3VVBoU2ZHMDVNN0pwR1hWR2s4OTZq?=
 =?utf-8?B?dUxLWVp5dmdlNDVSVmFWQ1RUenRMVjBWODBqWmF5YkNaeWxkOVlCZFNBTndZ?=
 =?utf-8?B?TVlvMytzUmNSY1MvZ1pmZ051OVI3bk1TYlh3ekdwZ3JubERyM2hVdEZrYnIw?=
 =?utf-8?B?UUlYVVhhN2VtR3E1eW9vS3ROdmFHYVBRUTd6L0JoMVFvTGNSWnpkMmIwZ2hJ?=
 =?utf-8?B?UkpwYldIVUFkOGtkanBYSVlmU00wN1dEaVI5TXlSaEdqWndaQWVwa2R6V2F0?=
 =?utf-8?B?RkE2U0o3NHI0OE5KR0VzQS8zek1LMzJHcGRkbnNUcFp5clhEaVRZVkJlT1RN?=
 =?utf-8?B?eXROTjBUSXU0OUxEREdPeDdwTXY2WCswMnlicFNxTUx1Q2lyTC91Y3V6Q0tX?=
 =?utf-8?B?VEJ2REEyQi9iTm5IUTk0TEJUbW5XWnZ6eUpEejNUNTBvTUh4M1FoU3picUIx?=
 =?utf-8?B?UURZd1AvVHlVckFnUCt2WmhQNnB6YWNSNUFtdHZXZWduVzlPak1wRk5zOFhZ?=
 =?utf-8?B?VGhoTU5LTVhQUXhxOHVneWpIU0NjcG93OVlkYUdxSWdlcURMQ01HZGZjK0Jp?=
 =?utf-8?B?V1ZiMmR4V0RkVlBOanhDNis0bTFpS0lidUhqaEkwSEdmc2orMGx3R24yM2tY?=
 =?utf-8?B?N2tFeUNpY0xyQ1VheHVEb2tLU3ROMkEzZGo1Ykc2b3hvMXE3TzJYZEQ4WDk1?=
 =?utf-8?B?TENyeVFiVWt3cUJrR0RTQ3UvNjR5RWpsM3RiNzdrZjY1Vi9HejkvZmJwU3RB?=
 =?utf-8?B?czlFNXV1WWpGb1ZYNGtRUTB5U3FnTTRBUU5vaENGUTFwTlVrNE9DTVZHZW1v?=
 =?utf-8?B?OG9yMk5FWXZRSEdKT0FpUWJpNTNiRS8ydDQveTN2am9EZ2ZlWnd5TFpkUnp3?=
 =?utf-8?B?Mm8xeHV1YmFObytZTEFldW5rNWhFK1hjRWlnSnBRK3hxMXV6d1pHOFY3WDNn?=
 =?utf-8?B?SytnTmdCV1Q4MndnRlRMcXB0a0lodjU1bk5CYUZzM0pTM09wOTdTaEFNNzdt?=
 =?utf-8?B?Z0d1SGREK3U2cCtYYm9HMnh6VTR4SGE2OUVjMFRadGVvdXJianhrckg2YWZB?=
 =?utf-8?B?SUc3N1lMazdTRTRKUzRqNlBmWWFGbWY2Z0xrZ3F5Ym1jME11aTM1UTA5UWN5?=
 =?utf-8?B?Vm0wK1NiV1BWUEpUSFB5YU5leW1ZaGttS2FaTG5iOWlQdXJsSnUyZlVDK1Vt?=
 =?utf-8?B?Vnp1YngwajdPZFRadWtlY2xCQ3VISTdBZVVFekVCREt0V3k3MXV0eDJSVjI3?=
 =?utf-8?B?NWlSM2VJZHVSL0RackNOcnFnZnZINWUrdXVzaHhyTVB3aDIrV09Gb2ZSaFRl?=
 =?utf-8?B?elpwTmI0amZiUjBKcmtCeDlaa0ZqeUV2VXIvZ3FSZTlURjlOSndlajY1WURO?=
 =?utf-8?B?WmVoK0JEUHd3WnFGVFBVZ2d4VWRnNGVnNGI0Z0pKWGVsa2lESmErUExrUVBY?=
 =?utf-8?B?OWE0SzdyMFpIT20vdU9XRTRwejc3ejlESlg4U2ZZcjE0THB1UlpaT0h1MWlq?=
 =?utf-8?B?UE9HOGI5QXRNZ0ZvRDNWMzAyZWRyeHFtMDRjVWxYRjQyOGwrK3JPUlpDVXph?=
 =?utf-8?B?SEZGVGVycENwMkF2a0tVbXdqTmRFWXIraldpbnlCcmVqZmpMaW1oRUZGY0lY?=
 =?utf-8?B?ZnBxQXU4aTJLNXZoQlJkcUtnZGxlZlF4dlNxT0FWdXkrSE1EWnQyTG9YUTZR?=
 =?utf-8?B?ZzlaSU45TkFkNmxIMnZxLytOZUtWRTJMd2FCNVV0V1ZIblNkTmpQcmY5NjBH?=
 =?utf-8?B?cnlFRm1JZUxPc2Fqb0toSjlCS0VNcGp3MUltWXdBRW5BRlovaWM4NHl2OERt?=
 =?utf-8?B?bEUyWHBMS3pHbll3SHRYMmFlTE9uMWdRTUdwaFM5RXFyWHpWankxZDRnVEJV?=
 =?utf-8?Q?uZR3KsUR/Klhn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnhiV2gyQU54amJsYU9pejVudlBNcmQ1cG1kTkRpSXFFZ2lSRDJjamhjZTFC?=
 =?utf-8?B?RmM4WGpkMkpjb3VGTnVmUDl2bVF0dlpyd3kvT1RhREdqRXBzREx2aTRDNkU2?=
 =?utf-8?B?WnJ4NmUwbXZpMmZCVzYwTkJTSmhrN01ETThQZkRRY21acUNGc20wUkNzSk5q?=
 =?utf-8?B?bHRId1JieURDN2hkMUw5TmJaU2xxZFZvNkEvVWNFcUlwUXRKZFYwRUgraDFM?=
 =?utf-8?B?NUU5ZkJPZlpkWlpiYlpLYmNXdzd6SUM3THVNaWU4cUNiUnRUY3RqWWpWZ3Nm?=
 =?utf-8?B?am9kVk1DM1JqQlVNVlNoOGY4L3hpTkllTjBRZWhvMGRWcXFqQ25LQmNZSVlE?=
 =?utf-8?B?ZFR3QzZqb1JYQmo2QTU4REd0QS91R0VwTEIvYTBuNlVabmhVdWo3NERPZnZ1?=
 =?utf-8?B?SG5qZUtoMkprZXlwTW9tMThMN2RJd3pSUEFBOGlua2lIbUg0UWRHVmlhTkRh?=
 =?utf-8?B?STh3RUFBYTRpalBCY1VRVHZoYmhIWkZUNkpYWDFKa3B1N21mQ2ZWY1ZuUXJT?=
 =?utf-8?B?Q2pMMXRTSTNvcDZuNitDM084UnhBc3RSQmJDRmljUFp3V2VxaGJmeGVnWjJm?=
 =?utf-8?B?b0V5WlB6eGFQTlFZSUoxVmtYcmI3QUNNTmtXbFZUd0VIdE5MZ0JPVkVBVHJ1?=
 =?utf-8?B?VTljMVJ3aG9Sckk3LzdnTTF3bmZ4N0JvTFRPd21KVDU2MEhoTnlqTWdxQjdY?=
 =?utf-8?B?Q1prNVRyajVRTFFzSVpWSkh1UkRYRXJadDJMNEVnOVduVHhkTkRjZC9GZXY1?=
 =?utf-8?B?VG9iZkMwOVg2ODk4M3loN1dFc0xmRlJIbmc5Zld1cWZtL1dKOE1GdUwwb3hQ?=
 =?utf-8?B?SHp1YUt1d05nbEpMeVBnclVvSHBGWjRHU00xVkZXaWIwemdJb1BoallHYXhY?=
 =?utf-8?B?MGplUEE3WTdIaGNlS0JxTnhINFo0YjZ1UTlWdnBHM1B5dmJBUGhxUGk4RENl?=
 =?utf-8?B?QS9WNzh2d29RTDlGTjdNY1NaYzFSR1I3OFBWZzl5dlZLanJCdWhFeUFReWNM?=
 =?utf-8?B?U0FmNFp1Z2QzSll2Nzg2Rkd2QjF2MzBuNmpSM1hTbldhclpUUmRrc1JnNUxU?=
 =?utf-8?B?NmFVeTlxYWdGNitvakE3QVpQVXE0V3cwL3lycW5CZEl3VGQ3dHVmZW9RNndS?=
 =?utf-8?B?alJqQzlHSGNueXVoNGQwbXYzZGh3UkJhYzJCTFplaFFOeVpnY1lsZ05ia3R5?=
 =?utf-8?B?M2g4ai9sd3JTOXYzL2R0eXgyV0ViTjBaei8zVkp0cTJUb0phL0p0OHBLTGJz?=
 =?utf-8?B?VVhJb2d5Y3ZnYTV6NU5Sb3RYMUV3Lzlud3drTGlzZGRRQnJMUmR0TFZtQXcz?=
 =?utf-8?B?aGpQVUF1SlZ3SjliMURab3pZMks1S29zU3NIdFJUc2NNdG0wa1pWc1pVY1Z3?=
 =?utf-8?B?T2loVkxBVVRIWXd2V0JheWtMUE5jbGw2b3VPRXI4WjBTT3A4czFJWXJ2dk9M?=
 =?utf-8?B?RGIrb3R6c1dMdHp3ZkE0TE9pY1dTMUxYc3NiSGk2YnptVlVpeDU1Mk8zZnB1?=
 =?utf-8?B?SkExdzR2QXlrMktDK2ZrOEs5eFZuUldXUHlNZk55UjdQeWErUFlsMThXazRC?=
 =?utf-8?B?blFmTUVrdlFtUDBlV2JQMTl2UFFIckdHTi96RzZjUjRPbTlqM3V0NnlkZWRX?=
 =?utf-8?B?Uk44dEg2dVBrbWpzdXFnVmJDVlNkemRhZm1JaW1tWWxQZElLNzg1T0V4ZUVU?=
 =?utf-8?B?aGVCNVVpRHFhRklYVDNjSVpYQUVVeFpwR1pycUcvdno3ejAwK0hHVkhsc3ZI?=
 =?utf-8?B?VnV4QVc2TVdCeU1GSk02aktOTGpNVm1NMHVIZXk3aWRQMlg0Q1Q0djEzcTRM?=
 =?utf-8?B?ZlVTc1R4ekp0TXpXeFdGUjVDSkdGUmhwRi83NWlNbE9uSmk2MVhBVDhiVVRJ?=
 =?utf-8?B?VWxFdDNuOXh2czcxeDZyZkZVOC9mSnFkZ3Q3WWxjc0RvK0p3UlpEeDM1SnYy?=
 =?utf-8?B?ZGxMSWhyZTAzOXM2Y3JqYlNOQTJmMHlsbk5kemxxTWl5eXladFJBSmMvR0pn?=
 =?utf-8?B?WStSSmJ5TXR1ZEkrY1N0OWVqMXhEQ0t4RHl6NzZpNS9sclNCVEEvclVnSFJr?=
 =?utf-8?B?K1ZseFRidUQyWWY4aXlabGtlcmZ1aGU1bVlmU3dDWlBiV0twRzBBcXd0Yjk2?=
 =?utf-8?Q?MXjTSfTG21OtK0fjJa5wU8aNb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb91020-4d7d-48b8-884e-08dd55aaff9f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:45:07.9743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBk50GWD+twcS4XaEeX68D5IMm9lNMP3Llw651YqtedQ2KwWXUZDn0sMyujD/ZHqmkDvQWeX5yVoZscfVlVFkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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



On 2025-02-25 04:51, Louis Chauvet wrote:
> 
> 
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Debugging LUT math is much easier when we can unit test
>> it. Add kunit functionality to VKMS and add tests for
>>   - get_lut_index
>>   - lerp_u16
>>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Hi,
> 
> I would like to take this patch too. Can I take it with the modifications below:
> 
>> ---
>> v7:
>>   - Fix checkpatch warnings and errors (Louis Chauvet)
>>    - Change SPDX-License-Identifier: GPL-2.0+ from /* */ to //
>>    - Fix checkpatch errors and warnings (new line at EOF, redundant spaces, and long lines)
>>    - Add static to const struct vkms_color_lut test_linear_lut
>>   - Add "MODULE_DESCRIPTION" (Jeff Johnson)
>>
>> v6:
>>   - Eliminate need to include test as .c file (Louis Chauvet)
>>
>> v5:
>>   - Bring back static for lerp_u16 and get_lut_index (Arthur)
>>
>> v4:
>>   - Test the critical points of the lerp function (Pekka)
>>
>> v3:
>>   - Use include way of testing static functions (Arthur)
>>     drivers/gpu/drm/vkms/Kconfig                 |  15 ++
>>   drivers/gpu/drm/vkms/Makefile                |   1 +
>>   drivers/gpu/drm/vkms/tests/.kunitconfig      |   4 +
>>   drivers/gpu/drm/vkms/tests/Makefile          |   3 +
>>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 172 +++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_composer.c         |   8 +-
>>   drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
>>   7 files changed, 214 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>>   create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>>
>> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
>> index b9ecdebecb0b..59c4a32adb9d 100644
>> --- a/drivers/gpu/drm/vkms/Kconfig
>> +++ b/drivers/gpu/drm/vkms/Kconfig
>> @@ -13,3 +13,18 @@ config DRM_VKMS
>>         a VKMS.
>>           If M is selected the module will be called vkms.
>> +
>> +config DRM_VKMS_KUNIT_TESTS
> 
> Can I change to:
> 
>     config DRM_VKMS_KUNIT_TEST
> 
>> +    tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
> 
> Can I change to:
> 
>     tristate "KUnit tests for VKMS" if !KUNIT_ALL_TESTS
> 
>> +    depends on DRM_VKMS=y && KUNIT
> 
> Can I change to:
> 
>     depends on DRM_VKMS && KUNIT
> 
>> +    default KUNIT_ALL_TESTS
>> +    help
>> +      This builds unit tests for VKMS. This option is not useful for
>> +      distributions or general kernels, but only for kernel
>> +      developers working on VKMS.
>> +
>> +      For more information on KUnit and unit tests in general,
>> +      please refer to the KUnit documentation in
>> +      Documentation/dev-tools/kunit/.
>> +
>> +      If in doubt, say "N".
>> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
>> index 1b28a6a32948..8d3e46dde635 100644
>> --- a/drivers/gpu/drm/vkms/Makefile
>> +++ b/drivers/gpu/drm/vkms/Makefile
>> @@ -9,3 +9,4 @@ vkms-y := \
>>       vkms_writeback.o
>>     obj-$(CONFIG_DRM_VKMS) += vkms.o
>> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
>> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> new file mode 100644
>> index 000000000000..70e378228cbd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> @@ -0,0 +1,4 @@
>> +CONFIG_KUNIT=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_VKMS=y
>> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
>> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
>> new file mode 100644
>> index 000000000000..7876ca7a3c42
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_color_test.o
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
>> new file mode 100644
>> index 000000000000..b53beaac2703
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
>> @@ -0,0 +1,172 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <drm/drm_fixed.h>
>> +#include <drm/drm_mode.h>
>> +#include "../vkms_drv.h"
>> +#include "../vkms_composer.h"
>> +
>> +#define TEST_LUT_SIZE 16
>> +
>> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> 
> Needs to be changed to: (Can I do it?)
> 
>     MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> 

Sure, no objections to any of the changes. Feel free to take it
whenever you like.

Harry

> Thanks,
> Louis Chauvet
> 
>> +
>> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
>> +    { 0x0, 0x0, 0x0, 0 },
>> +    { 0x1111, 0x1111, 0x1111, 0 },
>> +    { 0x2222, 0x2222, 0x2222, 0 },
>> +    { 0x3333, 0x3333, 0x3333, 0 },
>> +    { 0x4444, 0x4444, 0x4444, 0 },
>> +    { 0x5555, 0x5555, 0x5555, 0 },
>> +    { 0x6666, 0x6666, 0x6666, 0 },
>> +    { 0x7777, 0x7777, 0x7777, 0 },
>> +    { 0x8888, 0x8888, 0x8888, 0 },
>> +    { 0x9999, 0x9999, 0x9999, 0 },
>> +    { 0xaaaa, 0xaaaa, 0xaaaa, 0 },
>> +    { 0xbbbb, 0xbbbb, 0xbbbb, 0 },
>> +    { 0xcccc, 0xcccc, 0xcccc, 0 },
>> +    { 0xdddd, 0xdddd, 0xdddd, 0 },
>> +    { 0xeeee, 0xeeee, 0xeeee, 0 },
>> +    { 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +static const struct vkms_color_lut test_linear_lut = {
>> +    .base = test_linear_array,
>> +    .lut_length = TEST_LUT_SIZE,
>> +    .channel_value2index_ratio = 0xf000fll
>> +};
>> +
>> +
>> +static void vkms_color_test_get_lut_index(struct kunit *test)
>> +{
>> +    s64 lut_index;
>> +    int i;
>> +
>> +    lut_index = get_lut_index(&test_linear_lut, test_linear_array[0].red);
>> +    KUNIT_EXPECT_EQ(test, drm_fixp2int(lut_index), 0);
>> +
>> +    for (i = 0; i < TEST_LUT_SIZE; i++) {
>> +        lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
>> +        KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
>> +    }
>> +}
>> +
>> +static void vkms_color_test_lerp(struct kunit *test)
>> +{
>> +    /*** half-way round down ***/
>> +    s64 t = 0x80000000 - 1;
>> +
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +    /*** half-way round up ***/
>> +    t = 0x80000000;
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +    /*** t = 0.0 ***/
>> +    t = 0x0;
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +    /*** t = 1.0 ***/
>> +    t = 0x100000000;
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +    /*** t = 0.0 + 1 ***/
>> +    t = 0x0 + 1;
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
>> +
>> +    /*** t = 1.0 - 1 ***/
>> +    t = 0x100000000 - 1;
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
>> +
>> +    /* odd a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
>> +
>> +    /* odd b */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
>> +
>> +    /* b = a */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
>> +
>> +    /* b = a + 1 */
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
>> +
>> +    /*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
>> +    KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
>> +}
>> +
>> +static struct kunit_case vkms_color_test_cases[] = {
>> +    KUNIT_CASE(vkms_color_test_get_lut_index),
>> +    KUNIT_CASE(vkms_color_test_lerp),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite vkms_color_test_suite = {
>> +    .name = "vkms-color",
>> +    .test_cases = vkms_color_test_cases,
>> +};
>> +
>> +kunit_test_suite(vkms_color_test_suite);
>> +
>> +MODULE_DESCRIPTION("Kunit test for VKMS LUT handling");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 3d6785d081f2..d15ceac6c56f 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -12,6 +12,8 @@
>>   #include <linux/minmax.h>
>>     #include "vkms_drv.h"
>> +#include <kunit/visibility.h>
>> +#include "vkms_composer.h"
>>     static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>>   {
>> @@ -91,7 +93,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>   }
>>     // lerp(a, b, t) = a + (b - a) * t
>> -static u16 lerp_u16(u16 a, u16 b, s64 t)
>> +VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
>>   {
>>       s64 a_fp = drm_int2fixp(a);
>>       s64 b_fp = drm_int2fixp(b);
>> @@ -100,13 +102,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>>         return drm_fixp2int_round(a_fp + delta);
>>   }
>> +EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
>>   -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>> +VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>>   {
>>       s64 color_channel_fp = drm_int2fixp(channel_value);
>>         return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
>>   }
>> +EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
>>     /*
>>    * This enum is related to the positions of the variables inside
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
>> new file mode 100644
>> index 000000000000..9316a053e7d7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _VKMS_COMPOSER_H_
>> +#define _VKMS_COMPOSER_H_
>> +
>> +#include <kunit/visibility.h>
>> +
>> +#if IS_ENABLED(CONFIG_KUNIT)
>> +u16 lerp_u16(u16 a, u16 b, s64 t);
>> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
>> +#endif
>> +
>> +#endif /* _VKMS_COMPOSER_H_ */
> 

