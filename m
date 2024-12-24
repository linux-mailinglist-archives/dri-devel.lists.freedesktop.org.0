Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467699FBA0B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 08:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BCC10E5D4;
	Tue, 24 Dec 2024 07:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="W/zovtmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8E210E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 07:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ijle2VltepuYPfdhjyqP4iIQACXHd+zujnJ3+CAX3vV79eJVhPsMePxQ+LROA0v7sKnGjKHO4F/+nNvpeCy/wMRBlQDAB7R7jQCIYtG2XGZmBRyqw9YNGz6gHrpVXp0trel0gEGA8n2t0T6rmdVvYI++rZFwTkhzS9u4tQ8o4H9MrJ/M0VFuHiw/d+lWTcYH1sMu/N1uNdZtJwZI9dvuxhi0ZZf+n176JPPDVCfYPv3rnVnPvxNxCqNcKiAV9KnI6L/GZ94931YE8zJULWg8xExC3x7nd7LbXdu3bTFkalFjcsMzVanNTRwgxw0WTMsmuQVR8pfrrSuA6sTb6LyjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc0vfoa7HPrlJIEoOeYyqlFaVw2fMBUGNreI8/kjUsw=;
 b=utXgD8uTm/uXdXJpq6Us4nN6ll+moQKSFswPNsvmJZY81QWycuXMXOlNG6B3SeDlSOp9xmw/VMm7sjOMhF+BRRNTIBSoeAAxFYAjm4HaTf4wigx5Zh/pk0kN7H7h1rZklwHATJHfP8nN8BCAlDLbz7Vz8WDVyDP2hXOygr4guUM4t9EzB/1yOvS/e+oQ328AoOMof7e/p7zT2semcvznHw5KPhVAtJTtIk0J/hhfFWqy2IuXXnlqXANPgBZZ6l4YeFsZV2rSqvsNhiecRw5wETYqNaeEENCLavmKrwK04LBl4Hy8+GkiwCfuRXDYaiHQggmnuO/bY7qBJFlqub/BGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc0vfoa7HPrlJIEoOeYyqlFaVw2fMBUGNreI8/kjUsw=;
 b=W/zovtmZRfkdxz5+GP0NRIuplffz0IO05rH7kamD2V09rps/GBa+k0qA/aY07PnVudxOGzm5P7De6iZYCglGFp6turY1VMMDgMR4+oeEkfrPIIA/Ul41OrDrn2JCfd8rcbU0Me0m5PFzi5ysmKoGs22nWWLwoIU7Xd0KBle9cI/nzmTaJYH8lWCxbnCuREk2chUG+M3Q2p+aPbThzy68mXL5bWmivw3G6vEM6MtEd+OSnNB9U3w9Tm+wRV1aLpXpAuipTGPDFT0qukEgOVAo3zwI/qMB120k8UOGF6dNsthkMMmvZx79wQ1PoDQzLe7KSssIsIRqReD5ecgNeWESgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 07:03:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 07:03:38 +0000
Message-ID: <e0bd83d4-ad3a-4b93-b3f0-24451c19bd76@nxp.com>
Date: Tue, 24 Dec 2024 15:04:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, frank.li@nxp.com
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-4-victor.liu@nxp.com>
 <kpem2w4wu7ywc5pvbk3ls5hsyttrwcylomzfh567ejlxkymeqd@cujrbfxgrntc>
 <73c80079-582a-40cb-b9e1-e20fc96fe603@nxp.com>
 <CAA8EJpqJiiR15Xxw3j+vGPUBYYLgvxuXKeigMGBb4F3w178cfA@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpqJiiR15Xxw3j+vGPUBYYLgvxuXKeigMGBb4F3w178cfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d422cd-4e4f-4e42-262b-08dd23e9178c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFITS9VZXZGRTd0bVl4anZqNWNidzRCaHlCUG5LdnRyNWVJdW9YN0dkT1dN?=
 =?utf-8?B?NmNMcDQvalFUam43d28vTkhhdkdwY3ZneGZ3SWZaMEdKQmhjakl5SzZsVTkr?=
 =?utf-8?B?bTNSNnUza2Q2dFlNdVhDRnRZMXFkMWErL09rSHBwd1crNy84Vk5JMFlqL1hs?=
 =?utf-8?B?Y0YvMU5BbWZ1V1FKNGtMU1NBdzB0bThCdnRHYi8yWUxhY3l1QVp0bnphdE5P?=
 =?utf-8?B?Mi9GYVl3c3MxdExNbEhNeTdaenFUNUJyZVZpUjR4ZlJ6UTQ5bGltYmk0WG1V?=
 =?utf-8?B?ZEdJMHlEWFBWL3Jic3U5Z0VULzEzbURJZ3YvVlRCQjdVUG8zcnVrR1k4cE0y?=
 =?utf-8?B?eThjc3o0c0NmWXN6YS85R3d3S2ZMSndVTUxVb2NPdCt3RzJGeXFZc2JoRE01?=
 =?utf-8?B?V0dLMjNMWTFFMytXdFBQUlNld2VvMC9selkxUVA1NVh5UGhyUkRWenFrbTdn?=
 =?utf-8?B?MWZGbTFwNjRRcGRNK2kyVm1pV0lnMDR5dUw5Wlc5cXIwOWtxZ1ZyL3ZVOW80?=
 =?utf-8?B?VmhxWWdUeVhxbnhiVjNRbG5xMGNLT1B0RkE0NHhxN2wwVDh5UWNxVWJleXpS?=
 =?utf-8?B?aXoyRG1GejNCVTJNZitlUURUV1dmdnNpdHpmV2l2cFZPbWRCVkJUcWJwLzNC?=
 =?utf-8?B?UnlWWFFWNU1CVFhhRXNxaFpiZGkvY2lHQmJBR29HbU1ib1UyT01sZVE4YS9u?=
 =?utf-8?B?cHU2SGxNYTdma243aW0raUhRNXBiNkRycWY4Q3J1OWdLY01GZURQM1p4cEJV?=
 =?utf-8?B?L04yZFhYVnZqSnBFWXJRTE1CdHcwZE9aczBhQUYwWm5rVUo5YWw1YWxqQXlp?=
 =?utf-8?B?WFVOZlNWNFR5ZncrZWVNN2Nxek5PU1cyWjBwbDVJK3dhYzlPcFJJcVJYc3R1?=
 =?utf-8?B?ajRheGtpVzZaVFRqenNITHh5VFVNOHN0WEo1SGNHTFMxRCtOdVVTSEF1MDdl?=
 =?utf-8?B?VmVlb2hCM3J5blo5OVlQQWg1aStnbVRteUN3akRuSk5WUnVEbjErc1ZxY1Vk?=
 =?utf-8?B?OExMWS83eVUxNXB5MXBqVFZxNVNUQWU0MDh0Y29teU5Ld2U0dkEvWklhOEZr?=
 =?utf-8?B?MjE3SlgvK2VDTU00c3N3dHpnTSt3akZ6UlJla2FJa2xEaHBpSzk0R250WGlo?=
 =?utf-8?B?K3dJNnNhTlJid0xRbEI1NGFIdmxhNFNYaXVLciszWkRialhmeUlkR0VuQk5R?=
 =?utf-8?B?cmNtS0h0cW80K1FYVUwySWE1Mkw0Z2p4WlVaelRPNEh2MHhkYndCQ1R1eTE1?=
 =?utf-8?B?MVBMK1JzSG9xMnR5bFg5MXBBbGppYTE4M0hyeHNqTS8xNEFtYTB2Y0ZERlkw?=
 =?utf-8?B?MUE1aVlwWVUxTzQ3VkdMaTUzV0E5YjJjOGZTR2dNaTF4cjF5MXhBSzF4VnlJ?=
 =?utf-8?B?dVpDWkxZckFqU1M1bnRsZjY0USt6MEF3WWRZOFlrNXk4bmppZ3drbysyMXV5?=
 =?utf-8?B?Y1I2aGhmYXBLSzU4SjBhT0J4S1IzNEhQQkZZa3RHTndUQU4zNis1VUd6aGRi?=
 =?utf-8?B?ODd0ZnEvdXYwNFVsZHBWb0wwUUNMN09zQ0ZPd2RIOGxmc21Ka0FnQkZyU1ZP?=
 =?utf-8?B?UmxZWE96bGpFM3ZaenBpUHJhSlF1aXV5SFpwZWlUTFVmc3JiVVd2Vm9oMC9N?=
 =?utf-8?B?VGFVd1hNWXVWdlk0eG9SYTIrUkxvZzQ4bTZJTndGNGZjNENaQVF6MVVKUHZm?=
 =?utf-8?B?T0hCdGJkTHdCMGR2U05OQmVZbjVWN2RrZnhrcUhabWNUYUxtUzRFYUJHWmZ2?=
 =?utf-8?B?WG1HSVc0VlI3RzF1Mm1EaWNlTFlKNFRrelNUZjdOSm53K3dhVmwvVTF1SERv?=
 =?utf-8?B?QlBnZU1JdEdaUGpYZHdVdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFhBcDEwb1BJeEVRQmFRaGFFcjNYQjZIZmVmOGNWajI4cDNvU0VjT0QycFlp?=
 =?utf-8?B?REdIZHlidjNwVUhPTlRubWZjdnZ5ZHBzVjJzM0dMeEpQaXR0TUpsaGIrUzM5?=
 =?utf-8?B?WjJteGYyWllaUklSSkppM1lIQStkcC94RTZDaTlaY3FpTFhlS0ljOGxva3gy?=
 =?utf-8?B?bWlPczJ0dTJsVllOSG9RdlBFcDRaeEJhWUJmV1RGMjE0aWlrSGd6TSt6MHpL?=
 =?utf-8?B?NHlER0JSc0I1dmU0aXVJTFFCREc0d0JQRFYyYkJsRnNXU1dseWpkNHZ0Uk9N?=
 =?utf-8?B?YXNHM1ZJUXl1YTM2K0JUbGhiMVN1blRLWmtDbUpIYXVJblFCNzhheVNRbmtZ?=
 =?utf-8?B?cmE5NHJja2phMHN6aWExMHlEYW9pc1NQek8vQVM5RHA1dkJBdzlQeXlQakl1?=
 =?utf-8?B?L3BTMzk0SUZTTXdvb2hGdFRmanpxd3UvTHczL2IrM2RWRC9LQXl2dHBiZHdZ?=
 =?utf-8?B?VFZxc2gyTVZXVUlpbjd4Y2VjeCtqNHlmN2dYK3FSbE9JZXVxV1hBVnF4ek03?=
 =?utf-8?B?WmtpNU1BWnRhNWcySUdjc3RCbUFKU2c4NDA5Q3owSUNiNFR1cUhxdlhRT2xE?=
 =?utf-8?B?TXgwR1pqNHJzc3dvVzF3b0l2Z1BjYVhXdXVub1lucEozM29UbmgzOUNiTGM5?=
 =?utf-8?B?cm14KzV5VEMzMys5VXJVY2p1aXN6dkpNY0sxVkFaNTRMc2Q5dVBnZk9lalhL?=
 =?utf-8?B?TEtnbTd6TktCVEZoamttVlE2OUV1Qkl1TlMxakMwaXIzQ3YyQTZyQ2Fxclpq?=
 =?utf-8?B?VVdiM3ZmMjc2V0lsR1h1MGlvQnhZV1hCMU1HM3k5ci83cEQ4MjZMdUVicTJO?=
 =?utf-8?B?SG4yZzlIdmUrdGh3dDg5T0hQYkp3cFZOeUNtUUovTnVUK21LQVQwVkdySmJT?=
 =?utf-8?B?YXR6aUh4TVROSldGbVQ1Z3dXOVNOeFl3NkZ5Nkt6WnI4QVV0YlR0aDI1MUFz?=
 =?utf-8?B?V2lNR3pwazdtK3UrbjVsaDF2K0JKeXQyRU1rWXpBbi9WWm10ZzJKMFBvMWJq?=
 =?utf-8?B?VDZsSFR3c1ZGSXVWcFNaM0kxamYvVWt6anJCTDhFQ3h5Y1ZIRTRhdFd5SWhz?=
 =?utf-8?B?TTJxL0RlYWZ2ekhMSC82Sm1OVHh0VTU2dTZoc2lZTnUzdWNOd3dPYVBTZHJi?=
 =?utf-8?B?dlBGNEtEdll1ZHVrdVFMVzVwUkVhckltaU1BWHhyTHRvR3BYSVN3bEdDS1A0?=
 =?utf-8?B?NkVsUVZMY2cxNnpMY242ZXRSRlpMbCt3MG1oTnppcHZDazRKVFY5N1FLbFli?=
 =?utf-8?B?aFgxTFEwdVVwRWdoc1ZvdTBOdi9YMjg1R3duVEppQWZLbTViczBnaUFFbjhL?=
 =?utf-8?B?aGJlOW55c0IvVEhYanpCSmpkcGU1TW5RSThpSFdmVERDT2gwd2FJNms5WU5P?=
 =?utf-8?B?dlJaNEJJVXRoT1FYQm5SOGQwTnJLUEU5YnpFTnBTVVNQMC9JaFRDdGFXNXVV?=
 =?utf-8?B?ekRvZXp6R0hENnNqTGQzam94V1VYVmplKzB6dVJrL0UvbzhEbFRsSCsxRGIv?=
 =?utf-8?B?MWJuS3BSR1A0aDQvUHc5OEF6UW4wZkVJRWFhMXMyd2JvUHlxZUc0UmxFNFZL?=
 =?utf-8?B?b1BpeFRHYlVyNktRWHVJTVNZN0FLaXYwbWNsS1puMGNkRWJpaWFETXlRSU1Q?=
 =?utf-8?B?TjRhS2psUCtjMUMvcUZlWTIwQ1BqTGV4TGtoRFUzYWVwQWpHNURkZVdOcEtp?=
 =?utf-8?B?S2ZIaVpFSEcycllCWWpTejhteHZRVjNGUUl5bUl2dGtpUTFrWWs4Zk1vSisz?=
 =?utf-8?B?ZjBmYmpJb0c1bzNoSnpzMzkyQ1lFc09INEpZUlE5S1AxQ0YwaTZqdlBlMW1z?=
 =?utf-8?B?dVU2c3hnUmZkNENCNVdqYkUrWER5T0JtdW5pREErd044MjZuUTUvSWRBSi94?=
 =?utf-8?B?OUN5RjRkSldsTk4vWXF3cHFKMnBqVVpCT0hpaVRyemNhYzNnRnpMZ0Fja0N1?=
 =?utf-8?B?ZjNncDdwT1ZTck5PQno3WWF1a1NOdlYyUWREOFBDLzhiVnl3ajg5clF1cThw?=
 =?utf-8?B?SW00OVhuVFVESXZIeGUxUWZQb3psUW1KVFYxNE9oWWRIUDhHd3ozYi9XbjlZ?=
 =?utf-8?B?NWtwMDl3dlVuZTJRbGdZa3RQcXY2VnVpVGF3MHUyM1lpNUlCSTZjOXltOW9T?=
 =?utf-8?Q?eSnrOWScN2KMNxrFUZ0/DMRl3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d422cd-4e4f-4e42-262b-08dd23e9178c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 07:03:38.7408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZvyJmiNZHRuQGiKtVpPHbgkCim0JL3RNpyyeqKJC+AhwUXEuxhR2YSCZpixbNSQsLGii5H+cyW39c0w0/GDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
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

On 12/24/2024, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 07:56, Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 12/23/2024, Dmitry Baryshkov wrote:
>>> On Mon, Dec 23, 2024 at 02:41:31PM +0800, Liu Ying wrote:
>>>> i.MX8qxp Display Controller display engine consists of all processing units
>>>> that operate in a display clock domain.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v7:
>>>> * Drop DT alias documentations and add instance numbers to compatible strings.
>>>>   (Rob)
>>>>
>>>> v6:
>>>> * No change.
>>>>
>>>> v5:
>>>> * Document aliases.  Drop Rob's previous R-b tag. (Maxime)
>>>>
>>>> v4:
>>>> * Collect Rob's R-b tag.
>>>>
>>>> v3:
>>>> * No change.
>>>>
>>>> v2:
>>>> * Drop fsl,dc-*-id DT properties. (Krzysztof)
>>>> * Drop port property. (Krzysztof)
>>>> * Fix register range sizes in example.
>>>>
>>>>  .../imx/fsl,imx8qxp-dc-display-engine0.yaml   | 235 ++++++++++++++++++
>>>>  1 file changed, 235 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>>>> new file mode 100644
>>>> index 000000000000..60d1e0a4a5dd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine0.yaml
>>>> @@ -0,0 +1,235 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine0.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Freescale i.MX8qxp Display Controller Display Engine
>>>> +
>>>> +description:
>>>> +  All Processing Units that operate in a display clock domain. Pixel pipeline
>>>> +  is driven by a video timing and cannot be stalled. Implements all display
>>>> +  specific processing.
>>>> +
>>>> +maintainers:
>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - fsl,imx8qxp-dc-display-engine0
>>>> +      - fsl,imx8qxp-dc-display-engine1
>>>
>>> Is there actual difference between engines 0 and 1? If there is none,
>>> why are you artificially adding one here?
>>
>> I think engine 0 and 1 have the same HW implementation, but they connect
>> to different ExtDsts through FrameGens.  The two compatible strings make
>> it possible for an operating system to figure out which engine is which
>> by getting the instance numbers from them.
> 
> This is about HW description, no OS in place.
> 
>>
>> If the two engines use a same compatible string, then either 1) use
>> DT aliases to get the instance number(as v5/v6 do) or 2) use OF graph to
>> describe the connections between FrameGens and ExtDsts.  However, in v6,
>> Rob doesn't like 1) because it abuses the aliases which contain the display
>> controller instance number, like "dc0-display-engine0"(i.MX8QM SoC has
>> two display controllers), and 2) is too complex because all connections
>> between internal devices need to be documented with OF graph.  So, I choose
>> to use the two compatible strings, like brcm,bcm2835-pixelvalve0.yaml does.
>> Thinking about 2) more, maybe the connections between pixel engine and
>> display engines need to be documented too, which seems to be more or less
>> duplicating the connections between FrameGens and ExtDsts.
> 
> 3) use IO addresses to determine the block ID. I think this has been
> pointed out by somebody else too, not only by me.

Will try to use 3). Thanks.

> 
>>
>>                                            CF0/1/4/5
>>                            PE               | | | |
>>                                             V V V V  primary layer cross bar
>>                           +------------------------------------------+
>>                           |                                          |
>> 4 FUs + (VS4/5 + HS4/5) =>|               LB0/1/2/3                  |
>>    secondary layer        |                                          |
>>    cross bar              +------------------------------------------+
>>                              |          |              |          |
>>                              V          V              V          V
>>                           +-----+    +-----+        +-----+    +-----+
>>                           | ED0 |    | ED4 |        | ED5 |    | ED1 |
>>                           +-----+    +-----+        +-----+    +-----+
>> -----------------------------|----------|--------------|----------|-------------
>>                           content     safety        safety     content
>>                           stream0    stream0        stream1    stream1
>>                              |          |              |          |
>>                              |  DE0     V              V    DE1   |
>>                              |       +-----+        +-----+       |
>>                               ------>| FG0 |        | FG1 |<------
>>                                      +-----+        +-----+
>>                                         |              |
>>                                         V              V
>>                                        ...            ...
>>
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: top
>>>> +      - const: cfg
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 3
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: shdload
>>>> +      - const: framecomplete
>>>> +      - const: seqcomplete
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>>> +
>>>> +  ranges: true
>>>> +
>>>> +patternProperties:
>>>> +  "^dither@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-dither0
>>>> +          - fsl,imx8qxp-dc-dither1
>>>> +
>>>> +  "^framegen@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-framegen0
>>>> +          - fsl,imx8qxp-dc-framegen1
>>>> +
>>>> +  "^gammacor@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-gammacor0
>>>> +          - fsl,imx8qxp-dc-gammacor1
>>>> +
>>>> +  "^matrix@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-matrix0
>>>> +          - fsl,imx8qxp-dc-matrix1
>>>> +
>>>> +  "^signature@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-signature0
>>>> +          - fsl,imx8qxp-dc-signature1
>>>> +
>>>> +  "^tcon@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +
>>>> +    properties:
>>>> +      compatible:
>>>> +        enum:
>>>> +          - fsl,imx8qxp-dc-tcon0
>>>> +          - fsl,imx8qxp-dc-tcon1
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - reg-names
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +  - power-domains
>>>> +  - "#address-cells"
>>>> +  - "#size-cells"
>>>> +  - ranges
>>>> +
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: fsl,imx8qxp-dc-display-engine0
>>>> +    then:
>>>> +      patternProperties:
>>>> +        "^dither@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-dither0
>>>> +
>>>> +        "^framegen@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-framegen0
>>>> +
>>>> +        "^gammacor@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-gammacor0
>>>> +
>>>> +        "^matrix@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-matrix0
>>>> +
>>>> +        "^signature@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-signature0
>>>> +
>>>> +        "^tcon@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-tcon0
>>>> +    else:
>>>> +      patternProperties:
>>>> +        "^dither@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-dither1
>>>> +
>>>> +        "^framegen@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-framegen1
>>>> +
>>>> +        "^gammacor@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-gammacor1
>>>> +
>>>> +        "^matrix@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-matrix1
>>>> +
>>>> +        "^signature@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-signature1
>>>> +
>>>> +        "^tcon@[0-9a-f]+$":
>>>> +          properties:
>>>> +            compatible:
>>>> +              const: fsl,imx8qxp-dc-tcon1
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/imx8-lpcg.h>
>>>> +    #include <dt-bindings/firmware/imx/rsrc.h>
>>>> +
>>>> +    display-engine@5618b400 {
>>>> +        compatible = "fsl,imx8qxp-dc-display-engine0";
>>>> +        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
>>>> +        reg-names = "top", "cfg";
>>>> +        interrupt-parent = <&dc0_intc>;
>>>> +        interrupts = <15>, <16>, <17>;
>>>> +        interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>>> +        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +        ranges;
>>>> +
>>>> +        framegen@5618b800 {
>>>> +            compatible = "fsl,imx8qxp-dc-framegen0";
>>>> +            reg = <0x5618b800 0x98>;
>>>> +            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
>>>> +            interrupt-parent = <&dc0_intc>;
>>>> +            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
>>>> +            interrupt-names = "int0", "int1", "int2", "int3",
>>>> +                              "primsync_on", "primsync_off",
>>>> +                              "secsync_on", "secsync_off";
>>>> +        };
>>>> +
>>>> +        tcon@5618c800 {
>>>> +            compatible = "fsl,imx8qxp-dc-tcon0";
>>>> +            reg = <0x5618c800 0x588>;
>>>> +
>>>> +            port {
>>>> +                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
>>>> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 
> 
> 

-- 
Regards,
Liu Ying

