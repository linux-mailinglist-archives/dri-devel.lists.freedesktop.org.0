Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dD3MB+6qiWmXAgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:37:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAAD10DA52
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D059010E34F;
	Mon,  9 Feb 2026 09:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SJL8NeYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9B910E34F;
 Mon,  9 Feb 2026 09:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWnQLJutio+sMTkqTJSj4m+AZAoQF9nlQq9K7AjjovAicXhvAI9xYv9Hoed4kHFvLyXUqurm0Y1i87ImUSWBYy9RyiIM/z12tEmNkCTlerXDt4S1wlltAvwo5oaOjeSb0uA9/QxwPKo89LvfS/h7aVsZjs0kJ3XF4TWALb/syFeLUOCC7VJk9rdVwK+FXqpq/3XgxgMStqjDxcMRvws9iyt9IALNxrldbmRiQ+48c9YTKi8/SZuXi94zIhRiNL1EnxapLqSLWm9QTZZb1rNbpbSZJseZmYpVBdZcqMAPVdcRbOOkK6gFGlwsb4+cbtyVkeg4JrYs8iex2CvoN6e3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9TXC2SCGOdsa6XwMcpiDnUo7P5V21cG5hDePeeSlww=;
 b=Kk6das2adskuLenB+F+ds9pxGpQqQqDW1s2dZ4JLplIP7AGtdwq3Zl6rTH76SAe2nWvFTYQVNasdHEaB/zU3uZ08hkJ9zN0ZwP23dpBddgG07jNRoQiw1ViPhr0UzAuOIEHQyujTLRckBaFe+FErAbG9Mqwuckz/mANO83NqC4h7c9djk+6H/wXADSn21n3H1STSBQ7r5eUtX8sVuIunXqv9/8LafhX+IKKg8wh7ejWGmwp8Rgp1c/iJG//2g8ZSqe/7FAqN+rDT6T7sPfdP+6j1Nvb/SEaze2r65eOb7JNYxl74MRppLIBItZFebMuYhOhutSnUqOfCFY94TbwEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9TXC2SCGOdsa6XwMcpiDnUo7P5V21cG5hDePeeSlww=;
 b=SJL8NeYEf8eHlhj9ef4m+XZBse/8s/e3nnanWi6pws52+l3IIL7l4tzTTzMminvTdVcZ/0u2qXP9+mN19PfVWqZDXC4yY7F3TvvHhdKGJqbRXkRxFayN6BLhnOAfYhX/iAkvV3cUDPrzAiP5qzKoLIZV1RIwEdalzV+A0NuqCk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Mon, 9 Feb
 2026 09:36:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:36:29 +0000
Message-ID: <8c5ed6e7-e2e3-4aba-9b3c-bc1609765d14@amd.com>
Date: Mon, 9 Feb 2026 10:36:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: implement page_flip_timeout() support
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kenneth Feng <kenneth.feng@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260206235846.1019172-1-someguy@effective-light.com>
 <20260206235846.1019172-2-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260206235846.1019172-2-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c98f28d-1c31-466e-6d42-08de67beb404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVNXc3I2UTNJemt5S1RJT0RSN01JSm1ML1ZKK2ZTajhEL1luMjl6WCtRekh3?=
 =?utf-8?B?cEp3MGJ4NFVkSmpmOER2NWlUWTR1aDVHdVFwQWN5Q01mNnBXd05WS1ZLOFg2?=
 =?utf-8?B?QjRLZUM5eVgyK2Y1ZDJ4SkxGY1ZUWVE5NkJVR1J4TEwxK21WbHhJYm1qS1VN?=
 =?utf-8?B?R1hQanFiUDFENWhNZCtiQ056VUJaeUQvaDE5cEJlck8wT29SVzVrb200Z082?=
 =?utf-8?B?TWNxNm9ubVBQNjhaRjNvQzNzZHVVdEpDVU1oV3V6RmdrNDZpaFNQNmV3YzB5?=
 =?utf-8?B?OElkdUF4SGRzZzBQYmJOWlFxd3lQbTFBN2l6ZkszTzFKelFnTzNIY05aVFFi?=
 =?utf-8?B?VGFwTlh4T1ZwWmJzY2xSVCtGbmRDZC9IWXJ2WEZqQ1g2Nk51OHRxMHhZbjZv?=
 =?utf-8?B?Ym9xcjJOTmJ6dWFaMVNuaithbGV3aUlTdGZoanVHWWtVUU5rUEpPSlJ0UGZI?=
 =?utf-8?B?Y2FPTjJLZjlrT2ZvdTJ3YzFvSzI2dWE5QU5MekZTVHA2N1BzNDhzY2ZsRThZ?=
 =?utf-8?B?VHV4MjhqU1czSGZHazdvYlZJalFNaTNxNzhyVXNSeHNERi9mNlMvazc4ekFv?=
 =?utf-8?B?akZ2eHJLUDdtZlJUUzlJdlFZNGl3eW5hZGM2STVwelVKeHdoWEErRVIxVjRt?=
 =?utf-8?B?c241bXBMaTlOTHphM2ZNcjBsV3pVTUJVTUllSXJ0bDhUVERISGNFWWJPSFRV?=
 =?utf-8?B?Z2wwYnpiUDZaMUhhMXlseHB6ZmEyVHY0UHE2aWRVbm1YbUQ2K1owR0lXUXpS?=
 =?utf-8?B?dENUM2FzVEhuU0hCaFgvTitUYXhyUDRTanN2MXNUb3o2aEkzUVNGNjA3Y0pw?=
 =?utf-8?B?S3NML2xmZDRQc0JlYTZrS1U3emRDOHp6ZnA2cHgwQUNHaGhMdkpvOHFld0d1?=
 =?utf-8?B?U0J5cm8wRllWeXZOUmROS1ZPb3dFK2lNVzRvQXdjWVRrVis3VDZjV1YyT1o4?=
 =?utf-8?B?UjJxVXlTV08xZmZnSUJVTU9lcDRCT0ZNdmpGbXIrRXRrL3ZYb3E1dVZGSTBQ?=
 =?utf-8?B?NE5kSXYwLzlJdUVZMXZwaDJrbmNKQ0hHdUJ5SG1KSUxSYmtJb1NVMy9KNVBt?=
 =?utf-8?B?a2gzQ2s3OFJ3MGR1ajZGanV3Z1dlVHZvZDNrUkthNHVETVJOOFpXWnY4WEo4?=
 =?utf-8?B?QUlNbzRXNmVvQnRMRmxvS0MwelFYQ25hOTE5cW8rU3NaZnFwSE5EMzYxbWF4?=
 =?utf-8?B?ZGdGQ0RDSDVrQVlVRXJ5aDFYVHViUXZvTzhsNTZwSit6ZXp0enFpc2JheDVM?=
 =?utf-8?B?V3lQS09KdFdYVm04R29EV3dzMTY1TlhWWDdkQWNqWVNqZFpsY3BrMkw4WVgr?=
 =?utf-8?B?UG9GTnlkKzhzWTlXUFcwV2swa2tNcUI5UTJNWngwdFdZS2xVRkY5WWNmWElY?=
 =?utf-8?B?NXRIYkp5Mno3SklpRlV4NTdiOGdHc0EzSHFGOWtaWkRrRGVPSzZoYVlmblcw?=
 =?utf-8?B?K1JLNkh4TkJiNHEvVVlYVjdXWGthU2dQeER6NDA4YUxDTmFLTjd6Ulp6WXJq?=
 =?utf-8?B?a1VKTFI1MU5OWDBDRGpKWTE3c1NzTXNTdVZlekd3SnpJYXRLYXN2YktpbWQ2?=
 =?utf-8?B?cWd2NW9zS3k5RnBNbEFzd0t1RHBIeUdOd040Znl2VVZ1dkY5dVdvR0U0MnJh?=
 =?utf-8?B?c0tDTVJxMGNDK1dEUWh1bDB4bXlqRzJlcEFjZDhMb3F3MVQ3OE5MY1BEWDdy?=
 =?utf-8?B?L1JsUHhmdC9oUnR1L1VWUmN2YWpYQUFuM1FRdWg3Yjhja2pZRXVYeW80WVIz?=
 =?utf-8?B?eFpxQ3JOZ0J1QUFYOVVLMFNjdnZ0cWxsWkl3TmxyVERoSTRtTW5nRUg5eWZT?=
 =?utf-8?B?THJYOEQwVmV3QXZaekZhSGwvWlpOMUVmMXBjNldLanY2eTM0Zk12dkRzT0Jh?=
 =?utf-8?B?UU9qNGtaSmxncHk0R29USERsZWJaZHdPSjMxakk2dDB2TWFTSW5jN3FsTU15?=
 =?utf-8?B?c3N1VlRGaUdTeHk3YVkxUWZRRWh5SUpVMzVpc0Y5QTM5QmYzRDZGWDV6cTI3?=
 =?utf-8?B?Sm5QZmRkWWR2VjlLdzQ3a3drZzhnbTVFY2pZTmN1S0RqVHpZMUxKNllSdzd2?=
 =?utf-8?B?ckdkVEFmSEMwdHlFczRpYXdocE1ZNnhmZktablMvei9UUmRFcXpFWndHNXlJ?=
 =?utf-8?Q?OBcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlVKzZ4ODBLT2JGdzVYSGNrOEo4Y2llRkhCL0ZHM3JrT0hMVjd6dHBSdHgw?=
 =?utf-8?B?VG0xQ21xR0psRnpQOVFqY29tTVUza1A3VG9wL3prZ0E0U0djS3d4WVZKTVlU?=
 =?utf-8?B?bnh5NjVZQ2hNV1JvM1E5QjRKQzdGcU1yZUlid0hNeHZGQWplcmE3NGg5RTdN?=
 =?utf-8?B?QjJIZlVtQ1k4TXBUSkkydW5IeTY1RmFwMUNCci9sYWx6N2tQOS83NXpvSFlv?=
 =?utf-8?B?VXNqekpxYjQ0S0xUUWI2N3p6YSt1Y3JhVzd2SEhWTUkrYVg2MjBVSVhqV3I2?=
 =?utf-8?B?Qm5lSE5YVm01aE50czgyclNXZDZhMkZCWVRSaWFWTDZvc3J5R1dvaG1DK1B4?=
 =?utf-8?B?QkdpWCtGU3dnWmgzL2FYNklqbTVoZnNPcVBRM3dSejJSTm45WlNDWit3VGkr?=
 =?utf-8?B?M0F0Nk9PdjRoaythZit5Rnh5enA4Ym1IYmI5eDlTOC9rUjhwdVd3M3NwRnVK?=
 =?utf-8?B?NVdDbDRic3cvTnF2T2RGUEsyN2xDYnpnamZCRnAzS1dKeG9FT0VBR0VFRnkw?=
 =?utf-8?B?VnJMcnBTNlR3WVVtNktKQ05aZkMwZzZRbDYydlgyV3NZQWR1UXBmNzhLMllw?=
 =?utf-8?B?ZHQzNmdtb1lEdDFiYmQrSTJ5bEJNWE5CSnM2NlJYTUowNjFLZ2RqbmJxRC9y?=
 =?utf-8?B?ZmpNL3R3NE55ZmZVa1hTMlNDdzlLUjVHdDB2cXFvNkczaUs2bXp6bDJVK2ts?=
 =?utf-8?B?V2hZdGpBVmpXN215Sk1HR25ZZTBHU1FjbzVBYlUrWHdlQWJZNXdYQ3IzZE5G?=
 =?utf-8?B?c3lzRGJsdFdFYU1DcUtza0pCYlcxZVFPVWV3U0FSRUJTZSttREt5eUxLVHEy?=
 =?utf-8?B?RkxEbEIwaUFsTU41c2hmaWNvaTlJalZRTXM1bHBwVE9RZEFVN2RkTHVFMWYr?=
 =?utf-8?B?anUraDZQYWxSTHZMV2RqRk9zSVZBVytVZmxFMFJ2V2I5UTkyNW5DQXB2Mmhj?=
 =?utf-8?B?UGhENDRLNU9MN0RlR2crODcwSkJ5WmVhTVlXbFdjSU9uRks4UlM3dCsrOUdF?=
 =?utf-8?B?S0JJQ2pmaHQ1eW5jNkswNkM0SEw3NVpYQkdib1JBbnVMTWlRNUxPamVYdUNT?=
 =?utf-8?B?NHRicEQ3TTVmYzR1cFRXYWJDY0IrcDQ3R0lob1N6WDdCNnVQWTJ3WmMvNHJD?=
 =?utf-8?B?NUJnY1J3dGR2NXdrMk56NkpUVHc0Y1hNKzg5cGVwaVZGbXl6dmZPYnJWNEFS?=
 =?utf-8?B?RitNTzl5RGRXTVM5S0V2aXBuZ0tCV2NvVjNYRXBtaGRhT1NQRGJhTHhVMWU3?=
 =?utf-8?B?UlZZNE1ob0tkeGhrRWVRVHJaREF3QlZGc1kzVmMyMHJEb1ppY2xyai9iazB0?=
 =?utf-8?B?bndsRFcrUWRBVGUyL0w5bzVNejNPNEovUVhxNGNmdkhuM2tJa05SbTJJVEdF?=
 =?utf-8?B?Y0lIRkdMWW0xaS96Y2tObVNzZ3p6UEdkT29rT2xQUE1GU3hiOG15a0hWR2RL?=
 =?utf-8?B?eXpwbEJ5eVR6bU9oV2dHTVBXZ09CdmxWK3BLVGRWQ3VmSktQK25XRDQxakNT?=
 =?utf-8?B?UFhTbDkyZ1ZOK2dnTklHenVUZGN5NGhDWHhCVGZ1aGZpMlYwSXhua3RVam83?=
 =?utf-8?B?ZWgxK0I3RiszT3hGSW0va21qS3B3TU5nMU9jWHJRMk01MWJuczJ6TFU5dmpo?=
 =?utf-8?B?VjFwNGMzcE80aFhFZzluV3hPQ0xKQ1hnYVBBbFhiQVNrZFlSNG9ZYXJweXNr?=
 =?utf-8?B?UG5MSXZKcFhiSVVGY3I4YzdQZVEwMUl3Y3dUSTRIcG1iSG1JVlpqK1dGRlU5?=
 =?utf-8?B?V0xqRi82Z1FNcGxVQkVxMmZKRzJFalIrbWtKZ2J5RFU5RkZNaVEyT1ZEeFE1?=
 =?utf-8?B?SXdNckNiVXhCTHhzWXlwU2dtWGRvUnNYZzhiS2kvbFJBdEtpN09wbzZZMTJF?=
 =?utf-8?B?c2xzQ0VLd0FJT1EvRGFMK2JUaW9BWExDeEwvK05hTFB0bzFUZ2pvVGVwZCtw?=
 =?utf-8?B?c293MllxaUhiZk5ZVnZGTCt0N3BpSnd4WlF2dUF4VzcvN1dGZThFaEhOQ09X?=
 =?utf-8?B?ZjY1K3R2cy8rRnB6QUJ0TENsWVlhWEl2eS9SUkhCTEFWMUJZUFhqNThXOUs2?=
 =?utf-8?B?WVVhZ3lvajlIaGpQUERucGpHWnRtZ0xYYUJwZnUxRDF0cGp0M0xXWVEvRzRi?=
 =?utf-8?B?dDJOWEsvRmMwd1lpV2Q0QXAwZG1NUC9zc1JBVDhVZTRVcGVlUVdjVlg5eVB3?=
 =?utf-8?B?SFkrU0dVTFNyTUxobnpJc1cxRXJYM3RhdE83dGNtbW8rNlhiNm1yTWhjeWxK?=
 =?utf-8?B?dFozaGVCZXkvczBKdzA0TnliYzQrY3lHWmVGUGhDWnFCSFhDLzdVNDdZcVcx?=
 =?utf-8?Q?xyXelq2Lh44P7nwuN5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c98f28d-1c31-466e-6d42-08de67beb404
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:36:29.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wim0wA1xsLj3to8rnA3MOuXWSKvKTkH0v1DLwdffSZft5pWN7KF7QWL6jb5gQJV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,kde.org,amd.com,igalia.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ACAAD10DA52
X-Rspamd-Action: no action

On 2/7/26 00:58, Hamza Mahfooz wrote:
> We now have a means to respond to page flip timeouts. So, hook up
> support for the new page_flip_timeout() callback.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: send a wedged event instead of attempting a GPU reset.
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 697e232acebf..1faf39b7a1b4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -23,6 +23,7 @@
>   * Authors: AMD
>   *
>   */
> +#include <drm/drm_drv.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_atomic_helper.h>
>  
> @@ -578,12 +579,19 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  }
>  #endif
>  
> +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> +{
> +	drm_dev_wedged_event(crtc->dev, DRM_WEDGE_RECOVERY_REBIND |
> +			     DRM_WEDGE_RECOVERY_BUS_RESET, NULL);

Well that might work but is even worse than a GPU reset.

Have you tried to just signal the page flip as done?

Regards,
Christian.

> +}
> +
>  /* Implemented only the options currently available for the driver */
>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.reset = amdgpu_dm_crtc_reset_state,
>  	.destroy = amdgpu_dm_crtc_destroy,
>  	.set_config = drm_atomic_helper_set_config,
>  	.page_flip = drm_atomic_helper_page_flip,
> +	.page_flip_timeout = amdgpu_dm_crtc_handle_timeout,
>  	.atomic_duplicate_state = amdgpu_dm_crtc_duplicate_state,
>  	.atomic_destroy_state = amdgpu_dm_crtc_destroy_state,
>  	.set_crc_source = amdgpu_dm_crtc_set_crc_source,

