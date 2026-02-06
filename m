Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCysGXw4hmmcLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:52:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF7102481
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E97710E8AE;
	Fri,  6 Feb 2026 18:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IYBBVYIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787F10E0C2;
 Fri,  6 Feb 2026 18:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7yT4KGWVx12ZwfLY10BmuzxW4AJthBiqKvzRowljCscBG/NWIdX3jLDEkjEOA5Qytn1cj7Uo6Dx6Kdjoo9iWTs6ROElH9C6gCBsQ+kzU8HTKRbitJsZB2peMnIQ4fi5KVkyEOl7RgLKbyFKBUVo9Rp81vU4ZBvpSsAZDQUxfGog37IIPfGOmg6iljuxTp/2Unh6qUXq5FaZD/54vjQu6NQ6iAHQZSTT3c8hnFw0o6R2LNmmU6akkXsqaoAM86AM50OO5kz3S/TjlUpbtlpmCNQm5ByFhVE6ghBwNAKmBEHn1cbtKNGkzx2XrZMtMwGFpl2d+4wv9pfUGZVuEp/EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lEnU5oV1nIdI99+yX2d8stz3CZcwRdB5lmNRZMLi/g=;
 b=TT7vn39zwHG5jETp3kb2lhHhhSi50CQ1NS12MebCio6AS2wVtfb0/GRlY2sjrzncHJCl2y/Ki+O/TCnWAmMweCb1ltVErSB5l7NLFEOkEeALrZu9UvIjY4Yz7Tku55T8e0GRTnZdHKqP8rTv/KIxXXTa2yIu48p2frWbKgU2bDmwkmyAvhkatU9xW5NL7WVZ2qH6fwxo44BY3+sbwOwtP+rRll+D4R44QgOjNCEOxMBhp/4tk1IxMSU7EyR0r+5I5gRN8koWYJYX0AusMWIprxnfGUULTGjkFAl1ujkxbVLQx5c6qVKlJHgmLgqPc4LXg/dFwpZwlqBL2WRSVyZzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lEnU5oV1nIdI99+yX2d8stz3CZcwRdB5lmNRZMLi/g=;
 b=IYBBVYIUQxSdAaovH0ehlYRQtKCs+Sv1uRn6Awpffe2VT9mi6TwkzCXfInztlAMgBH4YNauXopk/QmWH0AFamWPFbH+dQ60jeXHEeR1xnCd+iCln3zdYygL8hXHSWhCNVN6hzyheCo0rwitR1T6803b0Yps9wsjU63cAcRGAJ7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:52:35 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:52:35 +0000
Message-ID: <f19af3c6-f865-4758-8c50-aba40ec1cf68@amd.com>
Date: Fri, 6 Feb 2026 13:52:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260203185626.55428-17-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::31) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DS2PR12MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbb0660-37a8-4018-6408-08de65b0e482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNpRENhZHhtc0gzYVdKV2pIQ05yVUQ1ZHd2alRVakdKcDhtS2FQU0dXV0pF?=
 =?utf-8?B?eE1keE56Slc1Mnl2WWVvZEFiU2w2eHhSN0IyVVZFYzJPQi9RZVJjTXNRVVg5?=
 =?utf-8?B?Q1oxWHZvZXIrV0x2bVl6Z2pxampTSWMxcW9xa2NYR0JEZS9MY1F5a2VvZkd4?=
 =?utf-8?B?NUMyOTM2Q1FPU1RMZ25ac2ViRXpSK1ord1d0WHVaNzJyZU9jeWhOcWZFOWda?=
 =?utf-8?B?RHNxVE1IelpOTitOQVMvc010V0Y0b3IvWFdibEMzK2E1Y29OWXgyNzgzRHk1?=
 =?utf-8?B?OFc5eGw2QzBSRjNHRXVZOFBUZnJDS3l1Q2xISFQ4Zis3dTA0VlQ4SGZtQVFL?=
 =?utf-8?B?SHJJTGZSS0NIdU5WRkxNbndFcjd3eHluVVRjS0FWYzFxenllNElVRGUzcUc4?=
 =?utf-8?B?Lzh5YmNqa0hNSms2bG9DRXRUdkl1dkhpOUxEUWRyeVJzRGdBcGs0M2dYQ1k3?=
 =?utf-8?B?YkdPYjg2SGtHL212L0ZYbGFjdTMzL0ZxZDZidG1zZzNxT0twYW91dmxpWEZW?=
 =?utf-8?B?a1dzb0EvSnR5cEdmZzdmMXFQcDl3S2k0NTc1czlMV1d1OUpEaHZpY1lwZjFo?=
 =?utf-8?B?a3FlWldTTHRhUWpCSkN1cEp0dXdjdE5SUzlzUUp2NkZvT004cVRxVWdBai9i?=
 =?utf-8?B?NzQ4QnNDMzhQRFMrY3I1QzBGMkJlMC9zMWVWaTZmYm9uMmdGSlJwdjJ5VnZr?=
 =?utf-8?B?U0tRRnZRbXVxc3draDFuZkJyemR1UEdpK1hQb2VvSnYwck9UdUJ0SnJuK2Vl?=
 =?utf-8?B?MzVNL2hOWFVsaTNZM05MaU9MT3ZHeWx3cUdqVHdCcUUrSXY5bWdRTWJEUEdS?=
 =?utf-8?B?bTA0SmhKZ0VVdEVNVTFKS1pIZVVLTDF1Z0RNS280NzYxREd5djI5NEk1RGd4?=
 =?utf-8?B?NjZFcThEZldtaG9HMGdRTGE4VXBnazZlNVFMWDBaeU5YbERyMVgvMUg3cTR4?=
 =?utf-8?B?Qk9ZZkJOWXA3MHhGQ3lVaHQzUy9BclBrVVNSckFqTlVmVk5MLzQ5VGJWNnJa?=
 =?utf-8?B?Vm5zUmI3Y25CZFRsL1c4UUlETStJWlBPTFI5SUlJS0ZmaTNQbU5WMndNaWNr?=
 =?utf-8?B?WXdrdlk5NGpZRHVhay9Ick9pODdoamY1WGl6Z2d4N1NFSjZlSVkyL0lLS0dB?=
 =?utf-8?B?SU13TkhXVWdBSVlmTnRkS1FBSlB5WHdZQXIwYUlhTEU1ZnNCU1VBYTVKUlNi?=
 =?utf-8?B?L2R6RXZ2MzRaRGVZZjRzaXp1L1NJa2E5dWNOcUpGUnlLbUQzL0VmYWEvQkti?=
 =?utf-8?B?YlRralBrNk9BOG5pSkVrMTZPZ0o2WTRJaGlDNEdicXZFUTgwOTN3Ylk1cnND?=
 =?utf-8?B?eVA4VkJuc3llWWN4UlpHTEtaZlNFK3pzL1BxZkFZSUNPcUR1K0xoQkJGbnhp?=
 =?utf-8?B?NnV4NXZQUzBjZmFmL3BMb3BlMHVVMVRSTWQ3dm1oMEZYTVhBaUE4YWVreC9G?=
 =?utf-8?B?Z0I5dDR4Q1ZxcjJRNE13R2tUUHR4UC9tSHB1SFpmZVRRSUk5T1JZMWdkZjBJ?=
 =?utf-8?B?alJINko4K3hMYyt6eXhXNUFrbTNuL0Y1dWFMZnR2Z2NYVTZzYXZLMENQbDRS?=
 =?utf-8?B?WHdVL2I5NnV3MmpiNmZBdjF2TXlDRGZBU2p3UmVGNGl3NFQ3cXhYQ2U5NHVm?=
 =?utf-8?B?cFUvVXBBVHVIMUh0V21ZWDFGcVlrTXNkdzVnQ2dmeTdGV2lDRWxWdUl3ckZE?=
 =?utf-8?B?R1hUa2JTS1ZIT1l0cGJ1S1pibC9OVXdZRDJWbStzTCsvbURnVHo5MFUzQURy?=
 =?utf-8?B?VWVoRGgreHpNOHRaSGQ4MXc0MXJzUGNhWisyT0ZMWkJha2dyc2Y2enE0dkZL?=
 =?utf-8?B?WCtvWW8vVHlRcWtJVkpMaU9RNWl1OXAraThkTU9RMHRrWlFzdi9jVWZKOGl6?=
 =?utf-8?B?L0RkdDJadHRGVmIyL0xLdG96OHJ1cEZEK2ZXcFlmNmZwR3Z3T1dsUG1YZi9a?=
 =?utf-8?B?L0dGVWh5TUt1N1dTb1dxTFRLOXJRVThFdWZoK0xhRFV5bm1TTGxTS3FmT3g0?=
 =?utf-8?B?QkhPK2EzWC9Pc0VXY2ZzbzdQRzFqYWdSTjBwLzVXQmx4RS84OFdZVGZRdTIr?=
 =?utf-8?B?S1BUMmtYR2l6RVZrUk1PYVQ0cmlFNWc1eUhQWHltUmdTSytkMEUxZ2M0TTBX?=
 =?utf-8?Q?+2Zg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpOd0dnM2NOZVYvTnJqVSsvYXJLOXNiQXhpamVCTk9pMmZSbVFLdVJqVCta?=
 =?utf-8?B?WGtvelpWWlYrc3llWDZWZFFHd3ZDVzFlWTNxQkdKaUZlcTFVOWJURnJVK3Vw?=
 =?utf-8?B?T2V6NmRoUVlIcnRpTnB5d2lpQ3FhNzR4Q1NwbWY0aTdadzVBSkI4Y2NNcWNk?=
 =?utf-8?B?dDJNNTQ2eDVOa244bVFNL0ZJSHJELzRxN3hMdUlGYm1uQlRhZHl0V084RlZ5?=
 =?utf-8?B?dngxZVdhSjI3SnJSM0hqdWlBWENBc0s3TzltOG9tYTk4KzBXUmRQbE1Danoy?=
 =?utf-8?B?MjNHcE9YRHZ5bmxuUVFuRWpzOUV1R3pkdUlnZ2lFbVRpajE3d1JyRU82K2lW?=
 =?utf-8?B?UjRzdW0wTG9ycDgvV1VtOUpycXZjOVVkU25IaVVpcndiM1NLdjBNZUFZZjZk?=
 =?utf-8?B?NzYraDBNaFdoT0pxNVhrZ00yWTRKa3VRMWRnN0YrWGdBc0Zuam5RYUxERTVS?=
 =?utf-8?B?L3hzNmgrOVRkMkltdk9iOGdVVG1XUUF1c2hiVTRJbUVHbm10MTNJK0tvNWNS?=
 =?utf-8?B?M0NKcGV3MjZmREp6MjJSSVdoMk9zUHFqUzMxTy9tbVJSRTV4TXJaajVHQWN5?=
 =?utf-8?B?N0k1RXJoeCtzRkhtK0EwYXA3Z1hqTk1Lb3ZnV0cxSzQrdUlLSHYyTFM0RG5m?=
 =?utf-8?B?cmdRTHMyMVdKYjRxbE1nd0pFcFZUa3ExeE1IN0d0MFM5SE01cFA2bkZoLzdW?=
 =?utf-8?B?Q0dmalhYM08wZmhwSGJjMG1admRZZG45RmJEY3lxOTNCUDlOaFp5ZDJRQVhY?=
 =?utf-8?B?cGhMUFEwYzJScFo3T2dpTWtXeW5BM29XVTU3dW8wNU1CZWlVaWtodnJjazNt?=
 =?utf-8?B?NVp0N2YxYXJob2tveHF1aGVGMStiZzkzWk5RMzlJWmNYSWttRjIzM2RDbElI?=
 =?utf-8?B?TFRkTkJuMEMvN255bGNHTWVZcThSTWM1OXg3UXBGdDZEWEVFT29hREJVVVNU?=
 =?utf-8?B?YmsvMkFZZURjZDh1MnpTd3I4d1ZEb0duYjhPR1hNSmZvME9SaDdpRkFZMUo4?=
 =?utf-8?B?QU5SRDFXaXY4M296UXdHbStJOHRzVTB6WWpobnFuUytrWndkMWhySkRvSFh2?=
 =?utf-8?B?SFlVd1I0dTBnRytuRDlQRGQyZm1EYzdwenlZanpub2NJSDNsRmkvQUxEMThB?=
 =?utf-8?B?Nk1oTVJRVHB4cHZWakIzTkNNVis1eHZnYWRtUTR4R1Uxa3AwaGlLdVNNYUhy?=
 =?utf-8?B?QmIxeENXMG91Q0xQZndjeVNpYkpwNThqTFdsV3pGQlJFLzJHQURDUExnbHdH?=
 =?utf-8?B?Wjh4YjlLMGl5WWpUUzFNZlhSVml4ZTl5M1BSVmtTL1V6V0RLV3NWVFU0TXVy?=
 =?utf-8?B?MEU3a0RrbTdySlJ6ZFFuczF6c3IyTTJpREY2RytuL0JCU1dkVE9WQ2Z1Q3dE?=
 =?utf-8?B?ODJmTkZ6Zy8za2JzUDVMSi9NRjQyYml4NHNtTktiOFc1NGdvMWF4V0NqeUha?=
 =?utf-8?B?THl1WDFpYkFPeUpnSFh6U1dKU0ZtSUhORkFpanFYWUF3bXBQZHZzNENpb0U0?=
 =?utf-8?B?V0hINjcxMkVrdTUrRGVYVkVBeU4vOWVVTVYrS21hR0RkV1EwNnBSTlZubmNC?=
 =?utf-8?B?b2c0cmxQVy9zcUFHSkN3NnY4ak8vT296TmRSSVV2Zmx4KzJJSVp2aXQzTnFz?=
 =?utf-8?B?RkZWOFJVdG40ZXNsZUUxWUMwdjM4SDkxYmlQakFQdHlPd2NDcXpaSkxXd0ds?=
 =?utf-8?B?d1c0MXVBRzJ1Z0gyUHRJcXlON280WllJeU9UVk5MM05zV01BdURQV3kvaTRE?=
 =?utf-8?B?Z3pOV1UxRXJkTzlWa1VUZndWMDE1M0dKdm1ucEZmMnRJaTRqbjBjdWFhTDFi?=
 =?utf-8?B?U2FsNldqRWZ1WnE4bG1wbWFtWGRxVE1UbjJQVFpNcmN2emFicS9KOU55OS9o?=
 =?utf-8?B?YW9FcHNPRmU1cUY2YWJkb2pETnRtZEJya2dYTklDem5kZXdtZkF0WG8rSnRT?=
 =?utf-8?B?anJQT09GYjFUdnRTa2dyeGpXT3p3dldWRDVGcGVMYVhjY3FZTHVvR3FLYTl0?=
 =?utf-8?B?SzhXTUoyNlZVUGFpUjhrNjBSdFJ2Rkl6T1d5OU1CWGJ1NG92YzNrQ21qb3hv?=
 =?utf-8?B?NUIyUEpVVVlhV2NHT3U1L1VleTladXBaU2NMVk1taVc1bGpDZSsreVNTSWwz?=
 =?utf-8?B?WENkNnpmTS95WG5tVnVEUmRsMnVycm8vRUFpdmhINUkvWkVKZE5YNWJBMWJt?=
 =?utf-8?B?cThrK0xIZjZHbFJJd2hPZVVnL1RhTGttRzVuQjZ0VmlaNDVSejFVREYyYjg0?=
 =?utf-8?B?aGxVZlZSYUo5OCt2cUs2aE1Ec3pPOXo1YS9jdU9yUEJlQktKS2RvL2tXNWdF?=
 =?utf-8?B?NE14dzdhaTBwQkVoK1BMdGVpMjRTQUhheEFpR1BqQUFadzFJNkdDZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbb0660-37a8-4018-6408-08de65b0e482
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:52:35.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZxZo02ZYcbQyFLF4lolVBrKWqT8WGViLievxqOSuV/rdRMB91GlwVusmcddAwb+MStVAmCDCuCqbrCzlTx/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: ECFF7102481
X-Rspamd-Action: no action

On 2026-02-03 13:56, Tomasz Pakuła wrote:
> [Why]
> Some users prefer to always manually control ALLM/Gaming mode while
> others might want it permanently forced on.
> 
> [How]
> Since there isn't yet an API to control this, expose module parameter
> 
> Changes in v3:
> - Include a fix for possible NULL pointer dereference by Peter
> 
> Closes: https://github.com/CachyOS/linux-cachyos/issues/680
> 
> Co-developed-by: Peter Jung <admin@ptr1337.dev>
> Signed-off-by: Peter Jung <admin@ptr1337.dev>
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 14 +++++-
>  .../gpu/drm/amd/display/dc/core/dc_resource.c |  7 +--
>  .../amd/display/modules/inc/mod_info_packet.h |  1 +
>  .../display/modules/info_packet/info_packet.c | 46 ++++++++++++++++---
>  5 files changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 447e734c362b..312aa32064d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -268,6 +268,7 @@ extern int amdgpu_rebar;
>  
>  extern int amdgpu_wbrf;
>  extern int amdgpu_user_queue;
> +extern uint amdgpu_allm_mode;
>  
>  extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d6d0a6e34c6b..4b038c8bbf9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -248,6 +248,7 @@ int amdgpu_umsch_mm_fwlog;
>  int amdgpu_rebar = -1; /* auto */
>  int amdgpu_user_queue = -1;
>  uint amdgpu_hdmi_hpd_debounce_delay_ms;
> +uint amdgpu_allm_mode = 1;
>  
>  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>  			"DRM_UT_CORE",
> @@ -1124,7 +1125,7 @@ module_param_named(rebar, amdgpu_rebar, int, 0444);
>  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 = auto (default), 0 = disable, 1 = enable, 2 = enable UQs and disable KQs)");
>  module_param_named(user_queue, amdgpu_user_queue, int, 0444);
>  
> -/*
> +/**
>   * DOC: hdmi_hpd_debounce_delay_ms (uint)
>   * HDMI HPD disconnect debounce delay in milliseconds.
>   *
> @@ -1134,6 +1135,17 @@ module_param_named(user_queue, amdgpu_user_queue, int, 0444);
>  MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect debounce delay in milliseconds (0 to disable (by default), 1500 is common)");
>  module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms, uint, 0644);
>  
> +/**
> + * DOC: allm_mode (int)
> + * Changes ALLM triggering mode (if sink supports ALLM). Possible values:
> + *
> + * - 0 = ALLM disabled
> + * - 1 = ALLM dynamically triggered based on VRR state / Game Content Type Hint
> + * - 2 = ALLM forced always on
> + */
> +MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 = disable, 1 = enable (default), 2 = force enable)");
> +module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 4a7c9f810e35..b779aac28dfa 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -44,6 +44,7 @@
>  #include "clk_mgr.h"
>  #include "dc_state_priv.h"
>  #include "dc_stream_priv.h"
> +#include "modules/inc/mod_info_packet.h"

Architecturally DC can't have a dependency on modules.
Is there a different way we can handle this?

Could we do the determination in amdgpu_dm (with help of
the module) and then set a flag on the stream?

Harry

>  
>  #include "virtual/virtual_link_hwss.h"
>  #include "link/hwss/link_hwss_dio.h"
> @@ -4503,8 +4504,6 @@ static void set_avi_info_frame(
>  	unsigned int vic = pipe_ctx->stream->timing.vic;
>  	unsigned int rid = pipe_ctx->stream->timing.rid;
>  	unsigned int fr_ind = pipe_ctx->stream->timing.fr_index;
> -	enum dc_timing_3d_format format;
> -	bool allm;
>  
>  	if (stream->avi_infopacket.valid) {
>  		*info_packet = stream->avi_infopacket;
> @@ -4658,10 +4657,8 @@ static void set_avi_info_frame(
>  	///VIC
>  	if (pipe_ctx->stream->timing.hdmi_vic != 0)
>  		vic = 0;
> -	format = stream->timing.timing_3d_format;
> -	allm = stream->link->local_sink->edid_caps.allm;
>  	/*todo, add 3DStereo support*/
> -	if ((format != TIMING_3D_FORMAT_NONE) || allm) {
> +	if (!is_hdmi_vic_mode(pipe_ctx->stream)) {
>  		// Based on HDMI specs hdmi vic needs to be converted to cea vic when 3D is enabled
>  		switch (pipe_ctx->stream->timing.hdmi_vic) {
>  		case 1:
> diff --git a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> index 306eb7355c25..9ec123ecc7c4 100644
> --- a/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> +++ b/drivers/gpu/drm/amd/display/modules/inc/mod_info_packet.h
> @@ -41,6 +41,7 @@ void set_vsc_packet_colorimetry_data(
>  		enum dc_color_space cs,
>  		enum color_transfer_func tf);
>  
> +bool is_hdmi_vic_mode(const struct dc_stream_state *stream);
>  void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
>  		struct dc_info_packet *info_packet,
>  		enum dc_color_space cs,
> diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> index 53e488fdb4ea..829cce9455db 100644
> --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> @@ -23,12 +23,13 @@
>   *
>   */
>  
> -#include "mod_info_packet.h"
> +#include "amdgpu.h"
>  #include "core_types.h"
> -#include "dc_types.h"
> -#include "mod_shared.h"
> -#include "mod_freesync.h"
>  #include "dc.h"
> +#include "dc_types.h"
> +#include "mod_freesync.h"
> +#include "mod_info_packet.h"
> +#include "mod_shared.h"
>  
>  enum vsc_packet_revision {
>  	vsc_packet_undefined = 0,
> @@ -54,6 +55,12 @@ enum vsc_packet_revision {
>  #define HF_VSIF_3D_BIT   0
>  #define HF_VSIF_ALLM_BIT 1
>  
> +enum allm_trigger_mode {
> +	ALLM_MODE_DISABLED        = 0,
> +	ALLM_MODE_ENABLED_DYNAMIC = 1,
> +	ALLM_MODE_ENABLED_FORCED  = 2,
> +};
> +
>  // VTEM Byte Offset
>  #define VTEM_PB0		0
>  #define VTEM_PB1		1
> @@ -499,7 +506,32 @@ void mod_build_vsc_infopacket(const struct dc_stream_state *stream,
>  	}
>  }
>  
> -static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
> +static bool is_hdmi_allm_mode(const struct dc_stream_state *stream)
> +{
> +	/* No local sink */
> +	if (!stream->link->local_sink)
> +		return false;
> +
> +	/* Sink doesn't expose ALLM support in edid */
> +	if (!stream->link->local_sink->edid_caps.allm)
> +		return false;
> +
> +	switch (amdgpu_allm_mode) {
> +	case ALLM_MODE_DISABLED:
> +		return false;
> +
> +	case ALLM_MODE_ENABLED_DYNAMIC:
> +		break;
> +
> +	case ALLM_MODE_ENABLED_FORCED:
> +		return true;
> +	}
> +
> +	return stream->content_type == DISPLAY_CONTENT_TYPE_GAME ||
> +	       stream->vrr_active_variable;
> +}
> +
> +bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
>  {
>  	if (stream->timing.hdmi_vic == 0)
>  		return false;
> @@ -512,7 +544,7 @@ static bool is_hdmi_vic_mode(const struct dc_stream_state *stream)
>  	if (stream->view_format != VIEW_3D_FORMAT_NONE)
>  		return false;
>  
> -	if (stream->link->local_sink->edid_caps.allm)
> +	if (is_hdmi_allm_mode(stream))
>  		return false;
>  
>  	return true;
> @@ -541,7 +573,7 @@ void mod_build_hf_vsif_infopacket(const struct dc_stream_state *stream,
>  
>  		info_packet->valid = false;
>  
> -		allm = stream->link->local_sink->edid_caps.allm;
> +		allm = is_hdmi_allm_mode(stream);
>  		format = stream->view_format == VIEW_3D_FORMAT_NONE ?
>  			 TIMING_3D_FORMAT_NONE :
>  			 stream->timing.timing_3d_format;

