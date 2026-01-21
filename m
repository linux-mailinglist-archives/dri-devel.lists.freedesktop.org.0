Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMrvJYP0cGmgbAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:45:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467C5968E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5014710E819;
	Wed, 21 Jan 2026 15:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="reYvIRSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020125.outbound.protection.outlook.com [52.101.196.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E544810E819
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:45:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdUkbandjNeYCPapNrnrl1qQAHZ+pLmKuVkTc1y9dFy99qhQbincq1vm/YnYYNiHdvVKyL4VRXnGDWWM+ScdQGNsqpuQjWctjsEfbkGSQCiqHIq98xdAC5RF0m6mfdsAtJDYqUh8bp/ZVdDPi1hhft1aLP14jEAvd2U9iVyy3cdwaRlmXLRH0K9cul4/iO7c5p7HutepE8wCHvjRFr9OJ1ONAtf1Q5wtnrNs79pekQ8jq/mEeIG4BknZ9NxwuSnShUEZHHhy3fHu8R3j4nd1iAXUT0JJnqmL74iuLP0n3QfrTm3suwBuDhs03om3KQObILR8r4B6rhuqJZm9q+asFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwZcM237reY7Y9VBD3i9mgWGyaqrSa9yE9mMOiZ4xWA=;
 b=ORUTOCqVxLPxJU+IPbkMim3cX8/vqOOp1YvpBei4nwCnd1NRUcbLUPkDKJoA3CGsvC5Exkmytuuuux9+5IlxCEy3N9zcfKt5CU6+v0Araof9H9wVWgv0btBehjB9yc+WEpcGi5+qdLVYwYAirv3GCsNJ1UsZvBFhSnVMJ2q65b4Gy9Ie3b14P0NP/y+ZSZk+iGSRuOC1Kl+Iym0xxsGUXyRnA6dQ61W7b+uXhMiQoktC/GQxrAwNnrKJ9kOMtpB7qqHc9GPemHyuJd2Sy3UDpcDLHoGubiiFdiCdPHMkoEj2uV6LJ62JlxukwgxU8mFzzqDtdV3NZaQt1nZ1wP/k/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwZcM237reY7Y9VBD3i9mgWGyaqrSa9yE9mMOiZ4xWA=;
 b=reYvIRSBRJP7JrNzDlDR0uy2KwB789kGiQW9tIh1/ykADo1JFXawCMDnDlWBV4NZLX8riulKCFu/gGjSVPQA3DkJdPUSuqm7aY1uv1G6lyHAHDmhqMXzHyHd4DH1wJ+QjJu7fhIa/xaAFlrpDBmu8A1sIRxIyR29yEFWnsxUFyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2848.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:45:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:45:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:44:59 +0000
Message-Id: <DFUDTCPXZ816.FKOR7VJAF8SZ@garyguo.net>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "Janne Grunau"
 <j@jannau.net>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Lyude Paul" <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
In-Reply-To: <20260121-gpuvm-rust-v3-2-dd95c04aec35@google.com>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2848:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd7b43a-eef0-4beb-6c3c-08de59040963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T283NWIzZlZTL2lTMGpFSFFYbFpCSXlvS251TWMwNGtMekRqQkl3b3pUYnU5?=
 =?utf-8?B?YnZTYllPM0Fmd2ttU2duOVlwTlBERGlhTjFLTmR4NkFlb0M2b25sMEZId2Vh?=
 =?utf-8?B?elArcTczeG9CMGxhYS9mK20rcTVkSXd2NFRnVmxyays2VDJUY25weEVranB0?=
 =?utf-8?B?QldGK1JxalY4Z3h4eFd6Tk5pd2hVL3VkZTFFb0hJU1VyY2p4and2d1REbWYz?=
 =?utf-8?B?S3pOSHZFSHBtNFFCSHoxTFNFU2hDNzFRem5Od2lmYWQ1OWNNWmM3V2hra0Jl?=
 =?utf-8?B?bEMyR0NxSU5mOFJKQXl2M1NrSC9uL3ovT0xiVWExREVHN1RCUm1UbjlqT0dF?=
 =?utf-8?B?a1l1TThpK2JnbHdZSFNsclBONEgxL2ZFanV4QzBGRjA0MVNWNDNmbk9LMjkz?=
 =?utf-8?B?VVNoakk2RFU2UWowQS9GVUJLWWlqTGJ3eHp5RThYeHZNY0xiQXFlT2I2dHdG?=
 =?utf-8?B?WWRkd3B4YzdOQUZYWlZEYmFwMnhmdURYTGpZSVpaeGN1R3FXbjNGN2tkWVov?=
 =?utf-8?B?Q0hmODZpR29PdVdKbFNLVW0rSW1YLy9wb1NadUkwL2xGUTIwMmxCbXA0eXFF?=
 =?utf-8?B?OHR0bGlRRmdNcDZMQlRucEpXczBXT3dDVjhUcy8vZDQwNEpyTURnY1kxNjk2?=
 =?utf-8?B?aCt4WFNPbFdXQlNqenZaVlZoeStKejUyTFZaallmTEZ3UWE0akVvKzNEL1Bu?=
 =?utf-8?B?b2xFZk9wM3R1SlV2QTR2Tm8vaUhZdmFmRjB2WEI2L21MYUwyWXhGbUY3bmMv?=
 =?utf-8?B?TXpFWnpHK200N3RWYTJmRVY0MU03bVpva1Z6VmlNUlNYZGhKanJDdHlwWXl5?=
 =?utf-8?B?Ui9Xdm9hOTlIMGdsbEJjN3ltUVBiSmhJMnhoYmdJUUNRK1JUUnFuVGc4M3pQ?=
 =?utf-8?B?L3p6REdudWY5UVZ0cEV2RDRva1hFSnAvN1NZdkNIVG91c1phdllSUExLY1Q4?=
 =?utf-8?B?aVhlRE5TS1QzT1ZCa3VJNVpvR3pDWlAxVGhFZDlnSlVySCs4MlMvVmpCREla?=
 =?utf-8?B?M2gzV0RwclVSTFlpWnhQUU5hVHM2UFJKMWhNUkhYNzRQbWtEd241bWIvNWo5?=
 =?utf-8?B?cmkrdUw0N0dQVlJyTkZ3YithTTh3Y1Vaayt0NElNcmpKTnI3OStoSTAxU1Ry?=
 =?utf-8?B?NDF5Q0ZpQzR4YXVCQ3NQdkRpMkZKbktaMncxY2xEZ3VZbGFTS3hyQW5JU3R1?=
 =?utf-8?B?YWJIRGdzcXVOUVJaaEs5bUdzVnVobXhSRlIxQnlwQmNRdGtTVXZlQnlKWTFG?=
 =?utf-8?B?b2J6dDRKRitRSDQrcEJCNXEzbS9FZ1grd0RHbFAxZHl5VXFLOXpwWjhKWTA0?=
 =?utf-8?B?OVFGdDh2dzBiT3dJNUU3MGZ4L1NIZXJ4RDFyUE5jMEJZN3BiTWZNSWQxOXRy?=
 =?utf-8?B?K3pYNXdMOEZvcUpiL01HbGQ3Uml0aUZLQ29saDlWYmFZNE1iaXh2cEJucjNS?=
 =?utf-8?B?ZDlRUGUvRWpZK0x5Y1hNaFZ5WFZvUU8rV1N0MklyTnpqQ0pRVTBwSmRTRy8w?=
 =?utf-8?B?OC8xeDY4ZThuSTE1Tkt6NzBiRzNJbUdwbjJ2TUpmWjd2N1V5eCtEZStkcUpM?=
 =?utf-8?B?aG1DbWNiVEkxc1ZRRFVRTndlYkNXalI0QkU5OFVOZy9iZEVLRVFkRllKaUE1?=
 =?utf-8?B?VDBTK3lTNEE4QzdHRXd4U2JTb2ptSitHZkRVYzV1eFdqRnVhU05IVFBOdEMw?=
 =?utf-8?B?c05sRHUyd3dEWWhWcUxXM3lxV0VKVnIvdER1NG9STVU2NEJhakFnTUFUZVlp?=
 =?utf-8?B?ZE5xRWIwem1oNlhUc0ZlZUNYZmZDR1pYYVZCM0p5b2VzOTlhNndHdFhvVnRE?=
 =?utf-8?B?NW14emhpK2VGRU0zQmgwWWFJcS92M1ZUc2Z4d2k2Z25lWUFYL3MxMlorZ0xF?=
 =?utf-8?B?VmdNQ3N1ajVmdjg3cnp5bzROaE5QMFg3ckNvTTFKY0ltUTN6YkdyTGdVWFNq?=
 =?utf-8?B?OUVWZkFhUFpsZ3BHVFMzWXZKeUxTcHdJNlJONERaSlExTkRUVUpzdlBaaFRG?=
 =?utf-8?B?UklYd0R1SUpNK3QyVFpaRlF2UVBWanZVM01ZNGt0NUJYQkhtRmZsb3Noekhl?=
 =?utf-8?B?YlQzT2hiVG1lRTNsSTdueExCV2tRQTJkRW1OdFRWT1d2Y1hkZitmZ05NTldh?=
 =?utf-8?Q?bcik=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVyRlVMUXU2SHVNS1dQaDM3b0RKd0pPNEpCUlpCbTVRQ2VaQVZGMkdGbit2?=
 =?utf-8?B?Q1I4UTVZS1VhSTNQYzROR3JBallWeHcyRFlPa3A0UEZmUGZXZjFrRWMzYkZO?=
 =?utf-8?B?R2dXV0U2dmJOQUVJYlZ5UDdDdWpjcTczbjVHTTd2MDkxNSsxUyttblNIRHpl?=
 =?utf-8?B?QzhBV0JYU3h3aTQ3ZkQ2VUZQZFhRL0RvSDhoenkyWGJoR0MrWXU1OVRXRjdG?=
 =?utf-8?B?cFdTb05ITTZKak1KU2lIbUl0Nkc5M2FjNXkzTVkyeFBXTW5icit0c3Vxc21q?=
 =?utf-8?B?UGQ1YVZwa0swalc4aEE4Z29tRzU0TXhEa2dRMDhsV1UwNDR6d3M4V2EvT2ZP?=
 =?utf-8?B?TVYxZE9HZXRqMlo2V3BMelNldWk4bHVZNVluYlVZN2JySU9sUXBxaFdSdWJq?=
 =?utf-8?B?QmhNTVJiQk4vYm56aWhSTVl5S1h3NHlGK25zMWlvYTFocG1IbEtlYkxIdCtJ?=
 =?utf-8?B?WlhCK1NpTnRnTXRtV0tmdFBFL3ZOSlNKeVRraVc4eFpBNDN2c1h1aUpOL21L?=
 =?utf-8?B?bFNidWhrVU5HWVM1S1huUGkxSUNMNXFodFM4YTVUQ2N3cE1vOVVDTU5TanRz?=
 =?utf-8?B?Vk0zL0tpbzQyTUhPSWIzU1B2UXRpQzV1azVZV1FyWEJWMHlSYWcrL1ovVDB2?=
 =?utf-8?B?Z04xYkEralpyWUQ4QTVlSk15NXBJRW1DUmk1U1I2SkNQeUNLdFgvTnVoQnNN?=
 =?utf-8?B?QjA0QlEvTXZrMTJGYnJFWklxcjZnY0lZU0hiNUltWE4wd2doMGFUclpubFZ2?=
 =?utf-8?B?MmxxYlNRVEtXNXo0c3ovMGZteGFGQWFWYnlkSDYrc1JlODI1MVJ5dVREYVo1?=
 =?utf-8?B?NGg1RnY2aGJvdlFlUUdHTmJvMjJhRHVTWGxyWGJlN2tNT2hGQWNrT09OYmo0?=
 =?utf-8?B?MEFYdllTWnVTUmxsOFVHM3NwaC9nZERQZzVselB4dUhpZ3Erd2JLekRUb2Qr?=
 =?utf-8?B?RDJHeDV5Tm9zTmZFbVFNcU5FT2NOY1IrcmZSaTJFYzJ5NU00TEc1dUx3TTdQ?=
 =?utf-8?B?REs4VVRVUXBveEoyN1UycUhqZzVJdDN1VjUrbDFQUmRJbXlCS1VCclA1WTZN?=
 =?utf-8?B?R3VWTmR2SzUzM3crWW5xbjVOMnA5alI0UmdNREVFeEFhRG4zdVo5cUVtanh3?=
 =?utf-8?B?K2J0YXdXUmcxM09WcTFMRzNxVXAxblgwUjREQVZsTGoyeWNETXJMRitUalVY?=
 =?utf-8?B?OHMyeENZSmFkR053RHM1eTBmeE1TZ0NiUzd0dSs4aEpQYUhlRlFwWjE5R3Q4?=
 =?utf-8?B?cFh5dWJmc2hUTVp0dWlGQVVWYXB3SkE4L0NwcG1GUXpFcjNlcjNCM0R3VnR2?=
 =?utf-8?B?TXd3cFU5SVY0Tldya05FUkxXcWpkR2V6TUl3S3VjWVF6ZzJOeDJOWVVXR0l0?=
 =?utf-8?B?MU9tMnVuSVgxTHBPTlFJMU1JYVlVWFNjOUgwVnpIcXpkWHVHcUFHbTRNa3lp?=
 =?utf-8?B?NzJ4MDJEWmp3SUdzUi8wSElkbHZXZVNwWlBQdFpLVkx5aDVBbE12UTJTU25m?=
 =?utf-8?B?Q2pSN3FQSFRnc0RtZmxWUHFEc2tyUTl0WTg1NHZHVC9JYjZlRTNINzJIYlFT?=
 =?utf-8?B?L24waHdjejBMN3g4Vy9ab1dud1lYbkU3ZmZsdEpxTzFjL0lIZ3VsZWU5OEZQ?=
 =?utf-8?B?dE1vWXVaS0dHR2hGYUZtNloyb0RtUDdnaTdZRzNoOWE4RmI3TG9ydFJtYVdm?=
 =?utf-8?B?eThKbysvOXpHMFhCTGNkNjN4WEdManpPbFRjY0RPbDdaa1Y5SlNBc0NTSkxE?=
 =?utf-8?B?NkN1bmRPSlhVbTY1NGtCbzc1VFdmSXQxS0p2K3JRaUppR0hWM3FpMm5vRDJn?=
 =?utf-8?B?Z1BaSDc4eEFLTEYybFVvMkxTVnlYRXdmSVJadFNXZnZNY1lodGwzWUdXazNB?=
 =?utf-8?B?YVJCWUdMc21CT2RKWk9lQnh6ZjBsV1MrYTRSSmN4Q0pCc0R1ZVZ6TWRYdVZn?=
 =?utf-8?B?OUdWOHFkYWxNZitUcEVFNy83UWtvMTBNblRvT0RaNEVUMEJ1WnBtK0Y3UzFk?=
 =?utf-8?B?NDZMOEh2ODlTSlliN01DR3FxNHJIdGthR3dCeCtaTWMrUmhQbWgxQjFLVDJx?=
 =?utf-8?B?Nk1wYk41b0NwOTBodlNUdnBaRCsva0NmdHJzaDYySmRRNXNTMHhwdmFlK0R3?=
 =?utf-8?B?Znp0ZTEzcW1HNUFjU0xOb1Y3QmhEWklmbnN0MlhsWis4Y2Q2Ti8xQ2xMTUJL?=
 =?utf-8?B?NE40b1Uydm9JWSs0S3dxeVlVbnQxa0haWnR0cGgyQlJTdi94T0NZUm1oNXc0?=
 =?utf-8?B?TmhJaUR1OU1KSEtMR2RSM042SVpla1c2M3g2ZnI2OGFvdVlJOERhclpwSXBh?=
 =?utf-8?B?cExLNXVhcnpYWTVhS2dXd2I1VmlqamQrcklKeW9kRnZJa1JBU01xUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd7b43a-eef0-4beb-6c3c-08de59040963
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:45:00.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcqxCEBrrQMWBlVjxinYluhwIFTKLSkYf3WfF2+w31pzJ/sUpcuOrFksry5Lhyr2xhlclbj/J+8uCoef53i4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2848
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,jannau.net:email,collabora.com:email]
X-Rspamd-Queue-Id: 0467C5968E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 11:31 AM GMT, Alice Ryhl wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
>
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
>
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Taken from:
> https://lore.kernel.org/all/20251202220924.520644-3-lyude@redhat.com/
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/dma-resv.c         | 13 +++++++++++++
>  rust/helpers/helpers.c          |  1 +
>  3 files changed, 15 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index dd60a5c6b142ec2c5fd6df80279ab6813163791c..ed80dd8088bc60c67b02f7666=
e602e33158bb962 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -52,6 +52,7 @@
>  #include <linux/device/faux.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/dma-resv.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/fdtable.h>
> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..05501cb814513b483afd0b7f2=
20230d867863c2f
> --- /dev/null
> +++ b/rust/helpers/dma-resv.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-resv.h>
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ct=
x *ctx)
> +{
> +	return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> +	dma_resv_unlock(obj);
> +}

This is missing __rust_helper

Best,
Gary

> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0943d589b7578d3c0e207937f63a5e02719c6146..aae78c938b0b5848b1740fb3f=
2dc4b7f93b1a760 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -25,6 +25,7 @@
>  #include "cred.c"
>  #include "device.c"
>  #include "dma.c"
> +#include "dma-resv.c"
>  #include "drm.c"
>  #include "drm_gpuvm.c"
>  #include "err.c"

