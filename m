Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36044B8F1DA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6236110E3B2;
	Mon, 22 Sep 2025 06:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NB0MBcbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4923510E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1u1iQNL4S0YckYr8y6tL7dB0AAZAcUnDlHqJL/50jQ3Syu/dtj/1rieC5Cs/2iiBRyiGu+X0vi6Yu4EplCFZIZ+nrEMB5jzR7ipkrtVNZkJ0SxoeWlWDYFJTborKHJ6+9y/k+Vw84LUb7HTbH6wZiZ/EcGOfEVXA3tflg21RPrYX/mz3ZVjDwczNxyiSKspldwou2EBy7EIk+ixUxJCwByFetnSsYVGW8Z4PmjHBGqkev2UfOiWeNENk0eap5vfMJwigRiRubWTMJcwcBfBaH33tuEi8e8DlQnvc5jF+ZJ5zAelrubC4o7pu+nPd8pMHQcmA5yqba/E+na/bA58cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeBX+2Y3un3HLwhSl0HbNL5WzuGLxGWrqowfcdD34ts=;
 b=LbmDg/PODAArsmhnRVlU2LzthUb91fhKk/TQAo7+CkiLiZE6RtNwvKAgaUGz2U5NU/nH36TmnnPaAQGqhLcfT2qBsuiivMJ7e3ZM691p//YKTsQJ/hQHIlhpMiZhBFt0/w/yfywzaIUagLzxRDS8GU62dKK2Ql56HKXyKretciLZqCE674lfrcsGUxtyXQpJ0mZbI9Xq4F4O5lRsfEvsCSE0nsXEsCxK7uTt26FpvuXkp0tYijs44W/By0otRY/wdRxKTGdKr8XbyWlHosmiVbB8kUWBD2Ph/UchU4l37LsZz8bvusRZT3/VSxFfO09s2A8hM3yIYTqur1QKTZTxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeBX+2Y3un3HLwhSl0HbNL5WzuGLxGWrqowfcdD34ts=;
 b=NB0MBcbWosVT6nsdHcO/msSbFGaCsBuLQBOsRPFWZCzQ/sOBOZOQwUc/mIIyQbolN1qIfMtC32SxUGIH16mVoEchi0YTjkwlSigeXbVGggZPCMkSsjYFmj7hoqNgqZmPYfdkJsyVcXMq/HAKDKZ8LwLqI7jkATiZJ99GXE0FwZNQAJUwjTFaSvSYkKlJz3FHmkKbxvGyB4li17/f+PwcK88B09xPeW76zz2UeXlck84z5MkDkp2Qc3hZ4AkAbPdiN9e9Vvl/r8+Dp4KKAe1tETDoxOEMjz9aM9NFOdPjM6LuBjT19q7MPdUtS/5b2SvIUqy2fcNXFQqesz+wbwe2SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 06:23:08 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:23:08 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Mon, 22 Sep 2025 15:23:04 +0900
Message-ID: <4198615.hdfAi7Kttb@senjougahara>
In-Reply-To: <CAPVz0n1Tur0YY7yOYAyUFvyTxie4OteyzGhzv487L+aA-YY+wQ@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <25240767.ouqheUzb2q@senjougahara>
 <CAPVz0n1Tur0YY7yOYAyUFvyTxie4OteyzGhzv487L+aA-YY+wQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbdb779-67ab-4182-05e6-08ddf9a07f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhOSEZaK3UyRExTWDluZkVVK0laeSttNVR1cG1ZakdkWXpGdEI3UDhtN3dL?=
 =?utf-8?B?L0FSWkhKT3AxRjV6M09VcVJXQmpIbkRNYWYwM2ZBd2xrN21tVHBqcDk0U0xV?=
 =?utf-8?B?NVEyckhWSmQxYTJHZHZFa2RLcXlRbFpXQWRNckNERHpwTEFWUEd5WXdSaUJE?=
 =?utf-8?B?QUJCaFpSRGw4NmJhc1JmMEpZSVZJYnpLZlpDUHJyUEhkYjZtVktnbWdhUHB5?=
 =?utf-8?B?QWVZOTNQanNUY2d4TzlwZTJycjFGSUtRN2YwbXMrRnlwQUhrVnVoS2tNWEZm?=
 =?utf-8?B?WnZYdlNKZ29aeWZ2Y3ZtSStrck80blRNZ0JjaTUxaGJINVZpUi9XMU93Q3NF?=
 =?utf-8?B?R0lBZk14MnM1V1pZZWlXM2JsUGZLUHJUOFdiRWhTQzlQaXlaTEhtcTlFY3hE?=
 =?utf-8?B?L0dzVGpDSHJMUk1Wci9ZeE41SlRwWms0WWJ3UjVKclk2NFdpRGhzTFBOdlhK?=
 =?utf-8?B?c0N1K3pIazc3SXZVcXdkY3ZjTkFyOGxadGt2czYrQ2FDRW9pclBJaGwzV2dl?=
 =?utf-8?B?bkJqSHE2RmdPVUEzZHAxV3ZaWGNrSlBnclBvNFlwRVU2bTBjeDBrKzZ5bVcv?=
 =?utf-8?B?UTQxbXUrSk1PcFJGOU1ENWFTYVZmSGs2anhsWXN2WWNEeThwVGErU0N6N3l0?=
 =?utf-8?B?RW1iTWVsWXpTODNpRlczeWlwc2FMQ0d3S0t4VkU3dzRpNXV6bGtQd0lTb3hG?=
 =?utf-8?B?NGc4eFFoK242Y01iUFhRd1BPOTNxR3Z3OEdPMlVOaHYrOWh1RUNTVG0xK2Mr?=
 =?utf-8?B?MnVtSEhuSmR3S3dQMmk3RFBhWmJNenU4aTN1LzQ0cWNrRU4wK3FOVFprampw?=
 =?utf-8?B?V0pQMWhFejFybkp1b09keUlRemxIaTdMQjdFNldUYzFnS3YraTlkcmFvb3Vx?=
 =?utf-8?B?MnFoYjl1eUNzUWptb3BSMFBLc3I2OVVzRGZLaklYWW82aWFUSmdoQjJsS0lw?=
 =?utf-8?B?SmsvUmpRenR0RDkzR3FvU3ZkejZ4SnA2ekhnU1dXNDZCcWVZYllTbGxwRjhl?=
 =?utf-8?B?ZlhJN0tSWXdLNFdnVDlhWTBaeXgvaktNSGdnMERlK280c3E4OVFXL05aUXgy?=
 =?utf-8?B?Q0ljVkFZajhnN1pCbFpxcko0b3V2K2s4V3lnNWorb2t3WEhkMlp6aFVOa2Nj?=
 =?utf-8?B?VEJ5QVpGeEl0aFhKTStrWURRVm12emMrZW1heHl6dCtwb2NlSHhXdEw2SVNa?=
 =?utf-8?B?REt0SGl0a1B2dlJwb0hOL2FCRExrWU5OekZOVzYwNzFLek5KWkpOcHd3dVhI?=
 =?utf-8?B?OHJ5ZngwVnp6OWMyVVR6QTU0TzIzN3M4QXRIdXVZSmU4SDhtZUFIY2l4VXB6?=
 =?utf-8?B?eHVpZGhaWVNzdVUyaHZETzdWT3BpN3BlVFV5ZW5TMmM4TERxWDF0YlpKbXBr?=
 =?utf-8?B?cVJFTnVMS0ppb2tEYVhFSXc0dHo4UzFoTUY0TUVmaURzVERLeW5NRmtoOWE5?=
 =?utf-8?B?dW9idno1VkRSd1JybjV2SUYwU2hMTmJ0T1hwSHdiSy81OUZwOUcwSGJtci9w?=
 =?utf-8?B?dmxFSGovRHQyZnRkQW9MVmhGb0FDNHhENTdKTzd5WUtLdmNFOC9tOW9WNzhj?=
 =?utf-8?B?aVB4VHp3Y1RYWHZHR1FDendCdHFOcmIra3FWODFzODZKdjhrSllneTc3K2J5?=
 =?utf-8?B?QzVZVXloMUR1ZVNBM3FCNGFHOGRGQUhSWXFVaW9HaHJWVy9YdFUwVVpqYjA3?=
 =?utf-8?B?VC9IVGxhQ3krVnRwQTdCcjQyZHg1YUVVUzZmeGhxdGFrQmNvQUlYQ0FKM1k5?=
 =?utf-8?B?ZzVwZ2lNdDhCdlVZMHp2WStYQUJyZFpMRjIzZmorL2gvYVErbGZlVnFmSCs2?=
 =?utf-8?B?aUo2YnNra3l0dzY2dE0xdyt3cmdYWEVVM0d2RWFtaktBYmNvVVZIVEpFMi85?=
 =?utf-8?B?RmYvQ2x6Z2toWndyeFhvbERCNkZqTjhrTFRrVTZJWUtYYW5WYlFyZzdYVElT?=
 =?utf-8?Q?6aMuAwUHvaI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2Y4eEtGb21lempmT0FWU2gzVlRCNDlFbDNvbE1qakVLdk81NmtiaG52M1Bm?=
 =?utf-8?B?UXZXeFhiSndIQjVYclBBbC9pdC9CS2Z2WmJPNlVHeUE0dE9mYjZEL0VpY1hO?=
 =?utf-8?B?QWdKdm0wSEg5bEp5ckdYYVU3dEUvUDNWU3BweUhsQUxha05GVkNIOGsrRC8r?=
 =?utf-8?B?ZndVUXpzZFpwNHFrTkRsMyszM1llNGVaSzB4b2JmRU0xY1ZRYUpTdlh6ZGFu?=
 =?utf-8?B?L0lxbVVIVzNkbzlaZ1NzN1B0RitsMkFMMEJBZCtPUzBZY010VjdYam9SaHEr?=
 =?utf-8?B?MGxrT1BybDU0SU1UUzU5bU0xSnZIU284NjVYTkgyeFRrRlNhN24wMk9qeDZP?=
 =?utf-8?B?Z2gzc3pPV3c2Z1dIR3M2MllvQ0pGWHpEcFhiTWRhMHE3Y1FLVU8zekJJZWtZ?=
 =?utf-8?B?b1M2R2JlMm9tT1g0Zk9GV3FrZWk2QVVvOHpLVDdVYjBqekdRSno1UlJQNXJs?=
 =?utf-8?B?QUFkVTJsU0ZUcE1PYWN5emVwYUNzbHg5SHpiekY4aStkT2JOd2Z3UmZYM1Qx?=
 =?utf-8?B?MzN0a2FYc0IwamJDMThhejJmRHQzZzdUdlJJY0U3RjVYVzQ1aHVLaFVEdnF2?=
 =?utf-8?B?c1Yya1gvc0l2cEdjWmZEc2FtTmFDdUVja3VPcXNFenNTUjBnVytSZGt1cHox?=
 =?utf-8?B?QnluekoyK0JsWXBlcVY4RElaeXFzODlyN1NvS3JWQ3hOU3h3MkR6NytJMWdJ?=
 =?utf-8?B?a2VieEpYeU1Pd0pQbFoxb0RSbndLNjVobXU2R2laaHQ5ejcvV3E4SGZHRTdi?=
 =?utf-8?B?ZGVVOExCUTJRTm1TTVBxRnZYQkF0V3B1c0hEa1BySituekRJV1l2SDM3MVFz?=
 =?utf-8?B?NkxvMlYzUDQydnFNcTVZdFJaaklhT2J6TWdWYUtTODFsaUxIRkFGVmJUQ3N0?=
 =?utf-8?B?UkZsZjFtNVFtVSswdlA0YzE5U0NwOXVoUUowd1J6TUZpY1BRVzZ0UXBiNUQ3?=
 =?utf-8?B?K3JTRC9CNXpVUmRWNGZEVzAwQUxPcGxTTGNNNW9EdlZjdG4waXVFajdtMmlr?=
 =?utf-8?B?Nm9DOC9ua05VY0V6K1FVcEFuYXhPNXJHQ1YyQXluS0VVd3VhYUVFOEtqOG0x?=
 =?utf-8?B?dmlwRFpLdkZ3MWJwc3RqWnFSMHRWRGE4Y0NYUUpNNlpBbVlNekdYc0E0aElE?=
 =?utf-8?B?K0FHMlkyamowME9vK3o1eVYyZGxCSmVhMTNCWWpkNkcvWFdRdHJXSW9vNHVq?=
 =?utf-8?B?cHlzU2xGYTNiUy9pY0R2cDVFK3YzNC9zdVp5TkpLcTVLNWFidlZ3bThDbk1L?=
 =?utf-8?B?TTN5d3llcE9BbTlKNmU4NW1yZnVNd3A0WmtoSVBoY3FTUUtCSzZCNVdIM2dM?=
 =?utf-8?B?elVYYlAySTM5QjhSblFKQXJQTnR6ckFYbW5PaUE0QWlUejZDTDIzSlc2U1d6?=
 =?utf-8?B?V2drRkhoTkxTWWp0MTZCcDZhZ2EwYjZ6bTZuckhRbm93NmtiQlZIbVM4aHNh?=
 =?utf-8?B?enU0dTJuTHdxRTJ6TUhTcVVxMi8vZGE2RGNLOTFFb3lWWExsTXIwWFY0UWJl?=
 =?utf-8?B?SUhGZEQ5VFFjRjlVYVZYRVRNdnlqTXBLQ2krTjRLS0YrY0NEaTdKaGNhRHNS?=
 =?utf-8?B?NEp6alRDWFZhVlZ3UzNzdjRCcXJoTi81dnU1MzBmWHZWVk02V3BDSjJHbGZk?=
 =?utf-8?B?VHllT1Y0c0VhK2RJUXlCdlVxQ2pKRGxwSkN3UElWR1BYMUI5eEs5OE10b3Jv?=
 =?utf-8?B?TDlJWGh0T0cyYmdBMFhvQnRYaHJSQm94dGZZNFJ6aHlpV2R1OVB3b1haUVVs?=
 =?utf-8?B?Q2xzc2FlaGExd3ZCNHF6TXlXK1M5QlRidFNkM20vWjVSR2F3ek52N2ZEd2Ny?=
 =?utf-8?B?UjIrTG9veDJXZXJub3JPM2hXQUtwU3M2cjgzNjRLcnRRSy9TTjUyWDdyK0xL?=
 =?utf-8?B?TFVEeDJuUEVaTUt4cnZzcHN6UDF2aUFGMkJ1SkgyUGhZWXhXeGxva3dVMU5v?=
 =?utf-8?B?NDBxNU45cGVSZlFpSnljQlQrcFB4UHZpUHVXNVRKalZtTWJFeE1hcStzSUtQ?=
 =?utf-8?B?VmE3WHZUcE1SV3E2cE9abjhyeWZicThBcm9HQitibStsaU45VDc5T0x1UU1h?=
 =?utf-8?B?SHN6NXhLRUhlV2w5MVJiOWd5NjZHYlV0MzlGbjhpL0hRdGdsNmlML3o3eE5Q?=
 =?utf-8?B?TTd6RGZYY3Ztbk1RTjhtdzZsY1NESHQvTnVtbHlUdG9pRmM0MHRwbVN0S2tw?=
 =?utf-8?B?YWI1TlB2cUFiL0grQUo3cU1IZUtDWUllY3l6bjVwTFk0UUp1cEV3blUvdXFj?=
 =?utf-8?B?TWhkRElGV2pHS0lwQUhTellFdk5RPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbdb779-67ab-4182-05e6-08ddf9a07f00
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:23:08.0250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1uKUYSgNHt9HCy5DMSE6VaHwGQt7dPMTtCDn7b1PrTV2+7CoE+5ZcV+5yJkZVWIiysmvMtbAJZit8BYrg/Gug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086
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

On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:44 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Simplify format align calculations by slightly modifying supported fo=
rmats
> > > structure.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-----------=
--
> > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index 6e0b3b728623..781c4e8ec856 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_fo=
rmat *pix, unsigned int bpp)
> > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_=
MAX_WIDTH);
> > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_=
MAX_HEIGHT);
> > >
> > > -     switch (pix->pixelformat) {
> > > -     case V4L2_PIX_FMT_UYVY:
> > > -     case V4L2_PIX_FMT_VYUY:
> > > -     case V4L2_PIX_FMT_YUYV:
> > > -     case V4L2_PIX_FMT_YVYU:
> > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->he=
ight;
> > > -             break;
> > > -     case V4L2_PIX_FMT_YUV420:
> > > -     case V4L2_PIX_FMT_YVU420:
> > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->height=
 * 3 / 2;
> > > -             break;
> > > -     }
> > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> >
> > Assuming the bpp is coming from the format table below, this changes th=
e value of bytesperline for planar formats. With this it'll be (width * 12)=
 / 8 i.e. width * 3/2, which doesn't sound right.
> >
>=20
> Downstream uses soc_mbus_bytes_per_line for this calculation which was
> deprecated some time ago, here is a fragment
>=20
> s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelfmt *mf=
)
> {
>  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
>  return 0;
>=20
>  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
>  return width * mf->bits_per_sample / 8;
>=20
>  switch (mf->packing) {
>  case SOC_MBUS_PACKING_NONE:
>   return width * mf->bits_per_sample / 8;
>  case SOC_MBUS_PACKING_2X8_PADHI:
>  case SOC_MBUS_PACKING_2X8_PADLO:
>  case SOC_MBUS_PACKING_EXTEND16:
>   return width * 2;
>  case SOC_MBUS_PACKING_1_5X8:
>   return width * 3 / 2;
>  case SOC_MBUS_PACKING_VARIABLE:
>   return 0;
>  }
>    return -EINVAL;
> }
>=20
> V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2

Googling this brings up the entry

{
	.code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
	.fmt =3D {
		.fourcc			=3D V4L2_PIX_FMT_YUV420,
		.name			=3D "YUYV 4:2:0",
		.bits_per_sample		=3D 8,
		.packing			=3D SOC_MBUS_PACKING_1_5X8,
		.order			=3D SOC_MBUS_ORDER_LE,
		.layout			=3D SOC_MBUS_LAYOUT_PACKED,
	},
}

which matches that you're describing. It doesn't make sense to me, since it=
 at the same time specifies PIX_FMT_YUV420 (which is planar with 3 planes, =
as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED

/**
 * enum soc_mbus_layout - planes layout in memory
 * @SOC_MBUS_LAYOUT_PACKED:		color components packed
 * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:	YUV components stored in 3 planes (4:2:2=
)
 * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:	YUV components stored in a luma and a
 *					chroma plane (C plane is half the size
 *					of Y plane)
 * @SOC_MBUS_LAYOUT_PLANAR_Y_C:		YUV components stored in a luma and a
 *					chroma plane (C plane is the same size
 *					as Y plane)
 */
enum soc_mbus_layout {
	SOC_MBUS_LAYOUT_PACKED =3D 0,
	SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
	SOC_MBUS_LAYOUT_PLANAR_2Y_C,
	SOC_MBUS_LAYOUT_PLANAR_Y_C,
};

i.e. non-planar. The code in the driver is handling it as three planes as w=
ell, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_ADDRESS_V.=
 Since the planes are separate, there should be no need to have more than '=
width' samples per line.

>=20
> > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > >  }
> > >
> > >  /*
> > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops=
 =3D {
> > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > >  };
> > >
> > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > -{                                                    \
> > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > -     .bpp     =3D BPP,                                 \
> > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOUR=
CC)      \
> > > +{                                                                   =
 \
> > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,                =
   \
> > > +     .bit_width      =3D BIT_WIDTH,                                 =
   \
> > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,                 =
   \
> > > +     .bpp            =3D BPP,                                       =
   \
> > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                     =
   \
> > >  }
> > >
> > >  static const struct tegra_video_format tegra20_video_formats[] =3D {
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > +     /* YUV422 */
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > >  };
> > >
> > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > >
> >
> >
> >
> >




