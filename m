Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCZwGFmqiWlZAgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:35:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294010D9D3
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D70510E3AA;
	Mon,  9 Feb 2026 09:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1H/aszRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0C310E3A2;
 Mon,  9 Feb 2026 09:35:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+LhBYByavouW3vcVgqFHFq4fqqSxQiH0QcyJfuXM93CPranpiKyvLqIuFJf0S8ZCjjwmR2LmFOE391GPrqQDJKj9QgCsX5ine6BVFMCKxJY100w6hYZ9l1JOFJm804X/hMA76SFNo0lJv9EHpNMe3oLUV/HAjyqx5bd+Mna46Vb1WBKlgn78sJ9oj4L6KbcfIhxOg4NZRW22KqiHXLjoAztwNv4sQiwS4w81igONEQkUGVqQFUgMdH6Hl1spnYvfxsRsIuKaWzWHALVL8NcfnIT1UhjCcpg5X6EmFAPmYZbVxmGNNyUsEBT2CjOw5hcveItHSbD5AO0/uY9nAq3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXYzchKcYHoWC80s66UwrcUs/cRkakRpxUdafRTHwrI=;
 b=pLiepJz/VllOuSR3qy6X7T/wq2whIFW1hWKnLJf6qcgp7tCdx1cx2OTwmiPYVR9lBTjkT8Zm0ILKznuvMcY5GLdhDQLAkiL2HENZZ8fJFy1ZfVdk3qRWXaHmd+EE11xQRIg3PhWkBrDhiMPwf0b3S0kzvF3QXn3w5GaO0qKKgwHx3/c9DZ8JvdL7jZDugJRLU7gReykoNj61Ao79STGDblGRCiwV3aArXIX1yjTJQUGCwQIKi8LnN+zV0h/uR9LW9g+wurik23WmGsjLtkwoSIauy63rIdyA9bHGK7y08aNZ6V4Vj4oNI+kuZQhVP7Lh9T8KxJkwFaJ8/C8M8uiwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXYzchKcYHoWC80s66UwrcUs/cRkakRpxUdafRTHwrI=;
 b=1H/aszRQ0iSvKBGEKY1+qwwPu4v84GEzpxVtjngNa56ND57GeQ0ASzzBg9L76ZTI7pMgQVqS9WM/tTfKx2pWk0HA1pxJjZ4nTC9w9k0Jcj7lLvBEJKAE/vu88VqK2WkhG52tGy+jzOR85c7VcbAJUNhcaM2lGv+ExiJv7KzL51Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 09:35:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:35:11 +0000
Message-ID: <2ac2dc2f-552c-4084-872b-179a1e489156@amd.com>
Date: Mon, 9 Feb 2026 10:35:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: introduce KMS recovery mechanism
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
 Ivan Lipski <ivan.lipski@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Hung <alex.hung@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260206235846.1019172-1-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260206235846.1019172-1-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: 45392e7c-6895-48fe-7f9f-08de67be858e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3lHdkh1elI1L3hUSlFrcHFhT3I5R2tCeGpVOEtvZ3ViQys1NWdjaGZ4Yi9i?=
 =?utf-8?B?b0JOSXYyaitkeCtUcFNWeTRSbjdWcUNZOXp0MjUzNG5UODBpMGZqaTlXWHNQ?=
 =?utf-8?B?aVFxTTNuL1FubmJFdHlFaXBuMUpZVTRKNFZQdC9mUlRDK2RXNzVQZXRNaXJK?=
 =?utf-8?B?WFhBWEEralp2dTk4OXRRd0ljN2NLbm9DUTZzRStHR2FUMUZCZW5ScUkvMC9h?=
 =?utf-8?B?WG9taVVGTE5NUUF6U1k3eDBsZ25yeDBYUlhDbjJ3REZmTTFrQjZ1ZzgzWXFv?=
 =?utf-8?B?M2ZXVW5sUjBRaTUwK2VOZkM0ZjRxOW5XYjlrcHc3VTd1Q0xoRTMrRDlvalFi?=
 =?utf-8?B?SUNqZkozNlBCNFI0OVBDU0JuWkt0T2JBYldjRSs2bU44ditlaDViNFNWdkph?=
 =?utf-8?B?UWRJRkhzWnVQdmVkenpNTWJoeGxWaElDS0JVZlhoVWJoVGR3djJHK1RuMGpx?=
 =?utf-8?B?eTM1d2k1WmJCRVNsU2Frd3g4VEJjc1A1M2kzN1Z5KzJ4MzlYdlpiUUVMWkdP?=
 =?utf-8?B?aFRZRHhxZkNoOFVtSFpVOFdOTHI1dzJhY3NiVW1MSkZRSUo5N1ljUTlQdVZP?=
 =?utf-8?B?N0VpakgvY0lzLytnSHk3SG9qclJJaTEwNmUrVzNXRUNPY0d0U29zOG9CRGV4?=
 =?utf-8?B?WERlNnN2V2w0Sm9RbkFVc2NlU051bHkybjdwZGl6K2hsaEhOQjU5NS8wUU1W?=
 =?utf-8?B?RnlLTWhpK3lBZndlWW1FRCsvUUFPSkM0MEVpNXU2WnErLy95S0U1N2NMRldB?=
 =?utf-8?B?V1hKYmhmOHdMR0pBWTY4WjZuelljS2xHZmFyYWZEVmQwenpjN0M5L2cyVUo5?=
 =?utf-8?B?bmNINDl4clFiaFQ5UTFFUGZ1eTUwaWpwM2lJUmp1VXM1aWdMeGhGMVhRNVg4?=
 =?utf-8?B?eTZIMStvWnVUM2lFK2YxeXNmVVZHTzE4MnFMaVFqb0JCRmVzOERwM3NRYVU4?=
 =?utf-8?B?TXA4c3VwTjYzdXpmU0oyamNqWDBoMDRQNFIxVlRkSWRZV1pZa09ZRnZNd2c2?=
 =?utf-8?B?WkVhUTZYQVdnVElJUlJPamoyMjVlMlpvSCtYZk9JSXlpTUs3NjNLNXR1RGZz?=
 =?utf-8?B?WkYxd0Rad0xvTWlSbTFGdGxRajNWVjIvcytZaTEwRHBvbTBTVndGajdrNWJC?=
 =?utf-8?B?a29IbnpaNC9CNDVnQmozZFRuMFlKeE94RStqUDJHWVZRL2V0NUo5Z29BOGJu?=
 =?utf-8?B?WURCQkVrWjM0Y2s0ZHFtNWdySEJ6YUNNMnUrRDE0c0tnVDUvWnBKTFdKWjk4?=
 =?utf-8?B?eDNPYlpxcWJ0WEE2djI1Y0ovOGlkMWJVVUU0RW1xb0p1OFpyem9udlJtRlEy?=
 =?utf-8?B?THZqQkxBRzlHT2ZQNm82dkZSeDdhcGtHU1pkZnphVlhsdVNYWlFMdlFGWmpW?=
 =?utf-8?B?U2pnUWJ2UGJ3OUEwUEMzMzY4U2pZRm9odjNIbVJYbVdGZ1BCTldvT3psOVFT?=
 =?utf-8?B?MGZGWHFaRDVUTmQvOWsrKzBBblJlbE1nMmR1RXRNOXcreGlDZkZEcXowVDZO?=
 =?utf-8?B?Z1l4YWFEaDV4UDN2bWMzaWN2YkhvUzFaREV3YWFFUTVGQmUrU1NueE1leWt1?=
 =?utf-8?B?UjYyU3ZtOGQ1VW1FWmxNYi82dVlYYkV3QnNJTDFOM0kwRU9QYm5lMWlraGRo?=
 =?utf-8?B?TUxjaEIzTjMzY2dLSTVVN3orSWRSS1JFd3FQa3o4WEJub0ZveXRGbWkySUxS?=
 =?utf-8?B?RTRCRGtBbzJoOFZwTVVPVzF3ZW8xb2xvdWsvMHVZMzhEZmFneUowS2ZXbERQ?=
 =?utf-8?B?aTZOTDRzclZoNVorUldXdDloT2dFNjhNcnpnS1ZabG9Uam42M09WNjdJb24r?=
 =?utf-8?B?QXpza1NOMmdiWHRNejAvWTFSZEdUQWsxdDFZYjR0WjVodC9mRTd0anY1ZzVh?=
 =?utf-8?B?M1NJWlROZHJjaXV3NW9ybEtnVVlkOHVWblR0SldyaEZIaC8zK1FtTGhZeHBY?=
 =?utf-8?B?NkxwMTJaWFV1ZHU5aDZhaTNvNks4OXNRdGRmZUt6VGJNTU8zcG83OUY1V0ZG?=
 =?utf-8?B?SVJTYitLRGlldndsamMzblZtSmhzRG5nWWFTNktsWEN4UlRZZjkzUkpFLyt1?=
 =?utf-8?B?V1h0TlBTSWVVRlQydG81cyttS3lGRVhKdWVpejNCeHkwT1hSamNJRjQ1dE5m?=
 =?utf-8?Q?n/J4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJVdzVRaGRlUjhHLzlFTytpemxuajlEZDVadnhMb3ZsZkJDVG44aTJEMFNR?=
 =?utf-8?B?aEN3TjZOWEJyMCtZaTRsNW5tTkFNYWhmMFNXUXU4d2xGL2xPOE84M05OTGtk?=
 =?utf-8?B?N1hJTEpKdkMxdG81dk1kaGExYkFrTFZGRFRKaE1mV1Rub1F0TXVwQVZib0dE?=
 =?utf-8?B?dXlmS3hMdXowRXhCU0xXMCtKVUNZeVVwcGYwcThvVm9YbUhKWTN0VlNDMzQ1?=
 =?utf-8?B?U051cnJtaFhQcWk2dXRubDhpYld0N2ozVEw0aHRENTNSYlA1aU1VM2xaTmVH?=
 =?utf-8?B?QmU3Z2hkOXFHSnJBVXdXeWpNR1p6NGtWTFBCTTd0akFxRHB2KzZlQjVNMXZ2?=
 =?utf-8?B?elhtcXQyVi9lcFFEWTB2UVJ2QkY1Yjk4dHdyVmNyYzY1MldKSlN0VjJsbHBR?=
 =?utf-8?B?R1RhODRSUUcxMVJUeUxRZ01aS2IwVmJUeG5ucGo0VXRRZDk2cmltbTBrMndn?=
 =?utf-8?B?ZksxUmlBRUNYTU1HaDhGSjVhbHhnTHFPdEN1YkxsbitETGRvTFd1eENBOU5z?=
 =?utf-8?B?M1R4ZnFPTzNXYytsMDVnalRpUHZTTjNtSXJvcm1ycUh2bXlsd3Q5djJJdFJM?=
 =?utf-8?B?N3Q5d2xtTUp0TEx0Uk9YYitIeHg2dkRoTHh1R2I5TVFIbW1HV0JGUGRHV0hZ?=
 =?utf-8?B?NTVyQ3Q2Y3NIdlBETlg2aVN5L2FXRGkrbzUra0tyMjZucU9BeGhXWERKMjB2?=
 =?utf-8?B?Z1EyNDd2TWFpUU43U2VpSEhvNmY1elNUYzhrMERQakNpeUVxL1YxbGVCVnZk?=
 =?utf-8?B?UDRIZ1pDdm9MYXJFVTdXTXRZWmo1SHJxck1BNjArVVV1dG1sMkJIZDBScks5?=
 =?utf-8?B?WU84aHRjUVZPK0VPcGloaTBjUnRhRlE0ZlJxQUxNaTBKWE5BTmJ4WVhFdmxR?=
 =?utf-8?B?NHY1WEd2WG9PY3BJYUlmQ3REb2o3Q3crMklrVFJHRnJmdld5cE0yNHlLSGF1?=
 =?utf-8?B?ZDk1T01vR21xdytkc2pZVkptajhMdGN3TFdsSUVVMWYzU2tqc3o4Nmc2NFBw?=
 =?utf-8?B?dHJzMGlRZ09GcENQTzUyVEoxRlhhcmdNa0tSSTgvd3VtcktldTJpMk1FbTln?=
 =?utf-8?B?SFFlWHZ5QTdVTEgvN2dCdGR5d0gyeDRIajFLZDVGdUJQVVY5dXlFWGw5T1ZN?=
 =?utf-8?B?YUo4VjFyU25ENXg1K2hNMFVVSlJ3SDc4MVhkVEM1WkNxMzFaT1ZOZGJCNk03?=
 =?utf-8?B?WWNKOWpRNS93TFhGUCtUTVVnc2djVmFNTTB0UHFuUURVSnEvV1ZPekhldkl5?=
 =?utf-8?B?Z01uZ0RjZy9rQlVOeGhRWEtBODdpcEtqT1grTXoycGQxOGsvVS9MbEhOVVlB?=
 =?utf-8?B?MWdEbjBuNlB2ZExBRnhLV0ZFU3FDUjRJa1pPd3NRZDBLYktzYVJHb3lUMXk1?=
 =?utf-8?B?Z2d3U0lvWmR1TGZPUmprR2dCRHRZOFo0bDdGaVJac1phK3lTUzE3UndWZFdx?=
 =?utf-8?B?M2FJdG5lSCtCNVJNZFZoczdyYWtEd2N2UHVkbkRxakV2YVVzRkRuR0p4RmY1?=
 =?utf-8?B?NzBYam1TbXBscjd6N0tGTXhnQzJzYXgwM3BSOW03WUlwY2lzY0tYbFJCQWpj?=
 =?utf-8?B?MlQ2UlpscERqMCtvZ3pQTEl0Y2U1VTM3NzJBNHBjem00SEtPTHNvbHZHUnA0?=
 =?utf-8?B?V0JmN0w5RUd3MWZ4OWhUTUlqRjV6bklXVVJYK0h0RUdyODNYZHVMWjZ3bFFP?=
 =?utf-8?B?UGg3bXRBWUhKb01SeFZxZjBlb1R5SEtuUGhJZFdVUThTUG1pd1FOSHE4UlFw?=
 =?utf-8?B?SEJXZFhZUE13SkNGUzdwZmFidXdNR3dPTnJBaEVRNDNZWUxsZ2NSQytYVlpp?=
 =?utf-8?B?SjNXaHlxVWxiMlcwdjYzN3pRejg3M05mNVlWZFFocGlTbzRiOFJFMEYrSXBC?=
 =?utf-8?B?UFNTUXl3bmhiazV3RktnNmJEeFdqelpmVlNNSVVrWUlQMHhjTHBsMjMvMzNJ?=
 =?utf-8?B?bldjOHlORzloSzQzRUs1eTlaeGJFY2Y1T0tBQ2FYellQVEZZZ2NOZUs2Rnhl?=
 =?utf-8?B?WnpQVjlPR2dPRU9Ec001OWl2dTEyMUsyL3BqRkFZTWxLSnphdCt6MFBweVJx?=
 =?utf-8?B?VEUwV0RYQ0JqMm5zelRUdkdiSGM5ZGJ4VjhZV3hSSXBvdXFaWU9ZVHI2bzFG?=
 =?utf-8?B?VWxHbnVBa1pSelFHcktVTlV5YUJiNjV6RkpZUE9hTzdqM3p3QmRsRnU3VVBJ?=
 =?utf-8?B?M2pQdHlxWHBCRnE4N0VEa0gzbGhNWjBIYVR0c1B1dmFRbWVTd25CRkN6bUVv?=
 =?utf-8?B?c1hKSk9oUXp6alBpQmVFVTMrckpuOEZ2MEQrTVpKblhNWk5OVFBySUdiMDhw?=
 =?utf-8?Q?Zk7saK8pdVOkNLh5Si?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45392e7c-6895-48fe-7f9f-08de67be858e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:35:11.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOYQC4PknymUhM0hTgWCgImb27GroipLpI2x28PSCfCVZ95xya9szBGVWUtHcLha
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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
X-Rspamd-Queue-Id: 1294010D9D3
X-Rspamd-Action: no action

On 2/7/26 00:58, Hamza Mahfooz wrote:
> There should be a mechanism for drivers to respond to flip_done
> timeouts. Since, as it stands it is possible for the display to stall
> indefinitely, necessitating a hard reset. So, introduce a new mechanism
> that tries various methods of recovery with increasing aggression, in
> the following order:
> 
> 1. Force a full modeset (have the compositor reprogram the state from
>    scratch).
> 3. As a last resort, have the driver attempt a vendor specific reset
>    (assuming it provides an implementation to
>    drm_crtc_funcs.page_flip_timeout()).
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: new to the series
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 36 ++++++++++++++++++++++++++---
>  include/drm/drm_crtc.h              |  9 ++++++++
>  include/drm/drm_device.h            | 24 +++++++++++++++++++
>  3 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5840e9cc6f66..f46d68418e32 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_self_refresh_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
> @@ -1881,11 +1882,40 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>  			continue;
>  
>  		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> -		if (ret == 0)
> -			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> -				crtc->base.id, crtc->name);
> +		if (!ret) {
> +			switch (dev->reset_phase) {
> +			case DRM_KMS_RESET_NONE:
> +				drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_FORCE_MODESET;
> +				drm_kms_helper_hotplug_event(dev);
> +				break;
> +			case DRM_KMS_RESET_FORCE_MODESET:
> +				drm_err(dev, "[CRTC:%d:%s] force full modeset failed\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_VENDOR;
> +				if (crtc->funcs->page_flip_timeout)
> +					crtc->funcs->page_flip_timeout(crtc);
> +				break;
> +			case DRM_KMS_RESET_VENDOR:
> +				drm_err(dev, "[CRTC:%d:%s] KMS recovery failed!\n",
> +					crtc->base.id, crtc->name);
> +				dev->reset_phase = DRM_KMS_RESET_GIVE_UP;
> +				break;
> +			default:
> +				break;
> +			}
> +
> +			goto exit;
> +		}
> +	}
> +
> +	if (dev->reset_phase) {
> +		drm_info(dev, "KMS recovery succeeded!\n");
> +		dev->reset_phase = DRM_KMS_RESET_NONE;
>  	}
>  
> +exit:
>  	if (state->fake_commit)
>  		complete_all(&state->fake_commit->flip_done);
>  }
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 66278ffeebd6..45dc5a76e915 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -609,6 +609,15 @@ struct drm_crtc_funcs {
>  				uint32_t flags, uint32_t target,
>  				struct drm_modeset_acquire_ctx *ctx);
>  
> +	/**
> +	 * @page_flip_timeout:
> +	 *
> +	 * This optional hook is called if &drm_crtc_commit.flip_done times out,
> +	 * and can be used by drivers to attempt to recover from a page flip
> +	 * timeout.
> +	 */
> +	void (*page_flip_timeout)(struct drm_crtc *crtc);

As far as I can see a callback is clearly not the right approach.

The drm_atomic_helper_wait_for_flip_done() helper is called by the driver, isn't it?

So what we need is just to give an error code back to the driver.

Regards,
Christian.

> +
>  	/**
>  	 * @set_property:
>  	 *
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bc78fb77cc27..1244d7527e7b 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -66,6 +66,23 @@ enum switch_power_state {
>  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>  };
>  
> +/**
> + * enum drm_kms_reset_phase - reset phase of drm device
> + */
> +enum drm_kms_reset_phase {
> +	/** @DRM_KMS_RESET_NONE: Not currently attempting recovery */
> +	DRM_KMS_RESET_NONE,
> +
> +	/** @DRM_KMS_RESET_FORCE_MODESET: Force a full modeset */
> +	DRM_KMS_RESET_FORCE_MODESET,
> +
> +	/** @DRM_KMS_RESET_VENDOR: Attempt a vendor reset */
> +	DRM_KMS_RESET_VENDOR,
> +
> +	/** @DRM_KMS_RESET_GIVE_UP: All recovery methods failed */
> +	DRM_KMS_RESET_GIVE_UP,
> +};
> +
>  /**
>   * struct drm_device - DRM device structure
>   *
> @@ -375,6 +392,13 @@ struct drm_device {
>  	 * Root directory for debugfs files.
>  	 */
>  	struct dentry *debugfs_root;
> +
> +	/**
> +	 * @reset_phase:
> +	 *
> +	 * Reset phase that the device is in.
> +	 */
> +	enum drm_kms_reset_phase reset_phase;
>  };
>  
>  void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);

