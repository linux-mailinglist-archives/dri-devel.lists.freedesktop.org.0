Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD5B531EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755710EAF3;
	Thu, 11 Sep 2025 12:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lq9nxiQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00310EAF3;
 Thu, 11 Sep 2025 12:19:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOX8Qs0dyD238vLvx1HSojrRz17pb+lAHyxpv47Hc1Wh/rB4f+D8H1KMkh3ia3tID2HIOhVyoN+VqFHqXkNTn6TIDllUQbjD2vZV9uo94UTpWDk5TVpskwec4Eq221a1sWvVLWojJg+BsLtShURve2BWbBT9330VGwXm+5EGdXU+ZSQNBQW2ba1uHww+oCSPDW1I42rPG4dZue7s1mB6hhdDghw2XVuob+bfIsSEIfAz8ZaXaU/0jE5CithAoC+3yQfbQU4JGJDcR5WUR6+ETnZhFFJKmmFmWh6XI/GMsXZeSLAyjW5i47tbpXwgLHs16R86A+vkP2GLFg51ljoCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JroClYfmAMymtloP+D26h6/X73vl6tBpFmVU5CfS8Zo=;
 b=v16kzZ2UsTFMFbLfhYcBJtqnQ57lD5qDbN/W1x6zZo1+d2pgKAr3xWjsYEGQhxCjFaZM/nMdcHyYQoL6kAmTAWPbwBkd5kjFcD6Ah+smPPa+9USkZd0oJyId7w6cFJ81f0pX1DuT7F79yjpqzFrBeUcRMh573daDckaaCm904lOeam2+OUdYUYG/sRapPl12xZ38FzTnHR4ngV+osmyN1w/FmIubaoHBNCk9Mr4JQ02y9bFrLpLhX44NfEyTxZctNOdTAZmZk+ilaN2bwMdQDTetZOUop7r2PTmUfz8xikSqP+atiukVxdBm2NeVr+qsx3GYSXK/HUaoOPQA5xbTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JroClYfmAMymtloP+D26h6/X73vl6tBpFmVU5CfS8Zo=;
 b=Lq9nxiQRW9g/Fp6mW0A/OE9zOSymMh9qeVsE/DwbTSRNuxtsfNZ9QGayb8WworYqzbZxq+v8B1rl3y6AhiL10l4hg8egSLpYypzfDaYLWotPprbg1C3qDqQjSbLRswU7V7N0YSXRQSGHyUEmhSscKsQUdmT/HyUISasX/mNYce5AhPAxMX2J3Yf4lF2tSpg+6zu+Bd2TaHB/+Qpexo2hm65CdTSz7ZyukPVH1SNwwI3+6v83MZbHIJJy9MaIW3xWEWh7rIFIMtjoZHgc4+etDr2j8MFajGpYWqGusaTGYukfNfUpVCeUrL2Xt6tskPxPuzgyau/F2jI8Lj9fQUHKCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:18:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:18:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 21:18:51 +0900
Message-Id: <DCPYRM28MQZC.1AAFVGYE9WYXE@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/12] gpu: nova-core: firmware: move firmware
 request code into a function
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-5-5a8a33bddca1@nvidia.com>
 <694e6b89-4d83-4a61-87e8-5c420b60114f@kernel.org>
In-Reply-To: <694e6b89-4d83-4a61-87e8-5c420b60114f@kernel.org>
X-ClientProxiedBy: TY4P301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: f16176a9-7c6d-408b-9922-08ddf12d607a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGdneXVQOXRpQnRWVWsrVnNCUDM3Zm9XRjIxSUdNaTBNL210WmoxZ0NobUJO?=
 =?utf-8?B?YVd6b3BIUERsclRsbEw5VkFCdVlCMVF5NHZ5VzVXK0ozRmRpWjVjT2VuNlh3?=
 =?utf-8?B?QlJLYW1vblNCNFJFV1E3citjUXFtR3dTTW1PMlFEUWtHYzNzbjQ3dmxXTUJu?=
 =?utf-8?B?RnkySHJTNG9ncXNDZlhuTFhndkNDblNoMWJQcEY2bU82SnV2cVdTL1ZPaHk5?=
 =?utf-8?B?NFVhOUZ0d0JpK3hMVThmMWJWZWlRekkwcmxmenBQT3YvdWNyL3pLZERpSlp2?=
 =?utf-8?B?VHl1RzNYT2JveG5VTmE0RTlOblo5eTR1SW1mbDJhS2N3ZGVRUFMwbmRPY1dn?=
 =?utf-8?B?aTNETFJoOCtpQkxtVExTSmwzL24vTm1rczFNVTQ5d05sV2RHSjVkZURwYUY2?=
 =?utf-8?B?WGpxeXVDOCthUFVSekZHOUJIWWxzdUgzendwVmMyM2lZTy9neHp4WGdMc2FN?=
 =?utf-8?B?dklMNHYyeFNWUkI0cjVxSC9EVDBoRmU2RG5YN2g3b1pnTjlON3B3LzFMT2tH?=
 =?utf-8?B?WkFvdlZCVmQ3ME55bHN4U1hJWE1pczFmUDVmTkdCdTFSSG1kVzVleGFaRHk0?=
 =?utf-8?B?ZDRFeW1zZmNhSXI2L2Q2d2MvWVR5UGJaaTJtbkJmanRNMnpyYU9vRm0zL0JT?=
 =?utf-8?B?T3QvYXFKaTErNnU0S3RZL2ZiUkhZUHVTZ0s2ZlNQSkx0bFRyVFlwUWZhVFNS?=
 =?utf-8?B?aHNCdndOUWRjcGhUc1c1U0RxMnI2QlUyckF4SVQ2N0JRMGZHRFFHWlE5bVdv?=
 =?utf-8?B?MnZQUDdyM1pJcFpCek9TUGVoYXd0S1d5QS83SDlCeDIwMllweEJpV1NMelIz?=
 =?utf-8?B?cnNmSjR3NTR2V052a0t5T1U0dlY4Z3ZINndWaFRYSTdiaHYwc0h0NEphVnJo?=
 =?utf-8?B?N2FZV2NSYjAvNEM4TFJWaHRkaWlXbjA0MGdvTWZ5VEMvVHREblVKSG9MWlNZ?=
 =?utf-8?B?V1d5Q1l4Y2RzV3Fqc1BVZnp6WUs0V243WTdLM2M4Tmh1YS9KS09pbzJIK0Vp?=
 =?utf-8?B?L1N5NDZSSko5ajU1R0hLdDU2a2tYV1FGaSs3MmRzakdRaVM4STVoNlpSczRk?=
 =?utf-8?B?RlFLaVEzdWRXblZ2VVNCcjdKUUpSR2JaOHR0WmsrNUFVUllDR1RRMGpwWTVO?=
 =?utf-8?B?Yzkra0RIME1weXc3eGczRjI0ejVRY0ZtejdibVphZUlIS0lsWS9JSWpsV3JC?=
 =?utf-8?B?MDF6a1BaM1BrQTlSWFNLWUU1WkIvWHB1aHMrREY5VExkcWs4M1JTUTZ1MExL?=
 =?utf-8?B?dDJwWGQ3UzdkR3c3cUFuZW9YcFRUWDkydnVCZkJiUUhnTGU0OVFDUEErMzlO?=
 =?utf-8?B?ZU1kRiswV2NncDBoaUJwVW52ZlUzWGRqOW9OaEFVR1krdXpYVHhoSFM1NTRy?=
 =?utf-8?B?MUJJK1czQTZ2bmNHVDE2UTB5L0p4TjJ5MEsxNDQ3Y1VYMlJKTDNLdDdyTmtv?=
 =?utf-8?B?eHhLNDR0NEZRQWl5MUNvOEZ3YmtFZDZaSzZoWUZSUFd3amEvRFc3bzJnZFdm?=
 =?utf-8?B?SXpiemxaR0JRNmUxcUVtTHBWaUpGMzVNd1IrSUhWb2JBUzF6aGRhYjBKeWNm?=
 =?utf-8?B?a2NwaURmRXNqckthb1dMQjRYb3lDNVFXbk5ieXVZQ2NlcnRGRnpHbEtMVnFp?=
 =?utf-8?B?ZFQwQ29YUmdLcUQxTVZwSFVNREhJMFBPWWxIejQxOUtVK2VSRXJtRkQzdUFY?=
 =?utf-8?B?czljZ2dNTG8yakM4SUpKdnN0UEZqcVRwRjlIUWs4TW5VeGhuRldkR1BMUDhD?=
 =?utf-8?B?RitqRUhNajk3MjJCeHNkWDFGOCtwZmoxUlExSkNhS00wVkg4TzEvNDFFSEdT?=
 =?utf-8?B?ZlhBbGdRUkdpUW1FZGl2d2FQckNoMTVySXlJa0llREhGMktZREtMaEZWdXIy?=
 =?utf-8?B?Qi9yM1NTQ05ZWWhxUHJndmh2SWdlbFNiaVYwNEc5aGw3cnNWU2VOQ2l0UWhF?=
 =?utf-8?Q?yhQR2eATmlc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dKQWIyYVhsNjVmU3RWUzRNei9HbVZCU3dxeXZrWnY2dlE0MHhnSDlKRHh0?=
 =?utf-8?B?eFdSZGNhTUVXTUlhZmlLelMxSmhwMlluTDVncTVlTWZCOTdqc1ZaczRiZWJl?=
 =?utf-8?B?Q25YK3M4ZW42UndHMy9jZUFoUm1aZkJ4MDdXazhsZWljZ1ByQWZaNEhSdmlN?=
 =?utf-8?B?ZDZxMncvaTVaT2tpbVBpV1M4QnN5S25oMnZrSStyZk1kK1o1azVobGMzSWFs?=
 =?utf-8?B?RmRjaFJ0em5xemVMZU5ieVFsVWl0cG9HNWFuYVNTMHhKWlRWcnh6Q0cyMXFX?=
 =?utf-8?B?aEZFMTJQZDN4RVJKRFM3MG1XbC91ejdscURnTTYyY0xUWjBQci9QWWYxOWJo?=
 =?utf-8?B?RWtZaVl3MC9rbTZkYkZWaW1rRTdXMzdMT0xZQnZqRy9hcWZaWTR3R0dZNXdB?=
 =?utf-8?B?ekdZSzBBTUgrdHBuSVJhdGdiN0loVkRyTmFrZ1NOQkVoRkhYN3JwOE9EdzJ2?=
 =?utf-8?B?U0ZEVU9zRzFoV1dKdjJnZ0kxeTFhdnRpRDBaWXFtR1RUNkIrd1UwYUxZMnRq?=
 =?utf-8?B?dDNvRVE2TW5oTWtRWmFvd1dlWmFnZUdxLzQwWnM0QjdPQzVFazhuZnBWN2F3?=
 =?utf-8?B?eGhEajl5VXJSeVFtcnBNNjFZRXN0UjV6M2E2dVRQR2VERDdaakVsTDNVQ2ZC?=
 =?utf-8?B?RFlsaE1xdDkzb04vcHNPMWl1Z0J0d1h4Y2paWGQ1bHI3R2IxU2VPeXhhVHBS?=
 =?utf-8?B?TkJhZ255LzYyajJTbWNoY3BWbGVaajZaQVhlU1VBZ2ZWbkZSY3FtMTg4bjl2?=
 =?utf-8?B?Si8xN2RLNjRiZ1BoMVk5clB3b1RiNWFIUlNMTzN1ZGZCRkQ3eUZ4V3BybFhR?=
 =?utf-8?B?aFZUYTI2MS9MY0NNeHp2WlFhKzRRUG9EMVhoUzJiOHBQWC9Tazl4WnFlem9O?=
 =?utf-8?B?WTFkMmJ5bmxxUy9sWXVvNVdsR25HTjh6dlliWFpXSyt4ZzdjMUpaeDFoQzJS?=
 =?utf-8?B?R1VQbGNWYzhFOXNHZ1crWVNMT2xNT0VydW53UzRIbFdaaWxiUkVTUWpibk1L?=
 =?utf-8?B?ekE4amJwQThHbU1hdlRScktlSUlqNWIrMEdoK3NMbkYzbzJyL0ZYMnZjdi9n?=
 =?utf-8?B?KzV5UVRzd1d6WXNINkVhQWMwbzBxUjg2TCtrVDVRdWNmODlCUDFSNEJjMXQ4?=
 =?utf-8?B?WW4yR1V2WE5GZ29TMVpGc0lENXJiN01XdmUzWlB1elA5d0UwaDZhYlh4SDJW?=
 =?utf-8?B?STMvNG1SMzJvZ0Y1ZTFXVDNGczFRRWRmVUlNVXczblg0QWkyMHFmT00zVTY0?=
 =?utf-8?B?Y3UyN3lpSE1oazFndVQxUlQ5V1ZHczNqQ2RORDZEK2dpMTNpSzB2dlZDekZk?=
 =?utf-8?B?emRxVFJmWnBycVl6NmxmbGQ5QTlPTTNkb2ltOWtoRy9ickU1Ynd1dk50ekc4?=
 =?utf-8?B?aHJNUUtNb0lGVmVGaDRTZ2IvdU5HMGdud09ldW5WRk93bEFIV0lJM1c3SEJi?=
 =?utf-8?B?Q3EvTU1PLzlFSjNSQ3MwM05vRVZTZzl6UmFaN2RzWmpMTzdVTjMzQUZDOXZ6?=
 =?utf-8?B?cDZZTloyZVJkR0JSMG9uaC8zZVVaZE1HWG8zcGtLMTEyNzkySk5tK1Zud0J5?=
 =?utf-8?B?YmxQaG5CNWIzWW9nUmp1ZGVKWnJWRDZVUUNESjdvckkrYmJ0dUFwMWF5YTc0?=
 =?utf-8?B?UDlkM1RZWnljSTBkNGQrZUYwYmNNWHVBd0YwRWNEaFV0Y1d6SzFIQnFRWHpu?=
 =?utf-8?B?TXN2VGxtb0dTRzM4eGxTcEZQK2czU3hhMFROM3RMZHc5QnJwVVIwK3Blem1n?=
 =?utf-8?B?US91RmNuNlpXOXJtTzUvZWZiZXUxdHhGaytnMDFiZ203QjFvWlFkV1hVTVpw?=
 =?utf-8?B?c1lxTHRod25oZU15N3hPaUxucmpOeFdZMVVKamQxOEswT2QwY3RpeVV5ZnVG?=
 =?utf-8?B?aytkeVU0ODN3QmdES1MwQmRxV0luT1lnM01ldUJ0RjhqUVdsUklxMHRqWGJw?=
 =?utf-8?B?K05GSkx6cFZET2tMdjBPV2VYVS9pNm9kVG5tNi9iOU1NaHdCdW9yZDlrVnFp?=
 =?utf-8?B?cWZYYzA3b0tad3VkQS9MeXBzV1BDNXBVKzllUDBTUFhRUDdYcEFjUUdIK2N0?=
 =?utf-8?B?OHZsV0xMVjlheWlOelR4Tys4LzYrck1BeVNaQ1U4Zm44emZhL2tnUXZuZDVj?=
 =?utf-8?B?VCsxbGhVZ2dXL0RCdlVJUTF2RjEwR0d3NmIxUW1qNkVid3cxQjNtZTVNaHph?=
 =?utf-8?Q?8xBYtL+XhQUWStifMbn+dIBVdQ7XZUhya5NbrrwpPwwc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16176a9-7c6d-408b-9922-08ddf12d607a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:18:55.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpBBJSh1Wu/UtcYs9fjIEdzUjIAabbf0bKYhCLF4RlAkuwPlgL4ExtSy9GYgXx5j4qiqHI/NVVmK1lGRke+TAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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

On Thu Sep 11, 2025 at 8:23 PM JST, Danilo Krummrich wrote:
> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>> +/// Requests the GPU firmware `name` suitable for `chipset`, with versi=
on `ver`.
>> +fn request_nv_firmware(
>
> I think just request_firmware() is fine.

Sounds good!

