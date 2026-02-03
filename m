Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE33DYETgmkgPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:25:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97533DB421
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090A310E128;
	Tue,  3 Feb 2026 15:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Ia9vbNX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021107.outbound.protection.outlook.com [52.101.95.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAFF10E128
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThCxZRV36lD5npNODP6fyZLPvJ6ddrY7vhQnnoci0/5IhENu3ES9SYwEGQSyOTeQ77zID/ct8nl8lEGgZt1UPelzC5gnZQqLuDkg94PoAlsn47g4rTnrd/Ick/B4fNgjjLOKtYm0f54Fav1ldfqhNegkvn9U8HtiWHM8n65amPpFCpszIl89DIeCStKc3g3RI2uaDgFz7BLNVE6c43BozG/txnWSFbETIaPgZTPci/jLQ1bG7q5oafFtA/j+lfkWXVEUgcKGjYxJ63nCR6uaBOe0QgeUigwNh2NX1OP6oVuDF0H0HDjrPJ5A4NYukWEewpDYbfmPPyEVGT1yeoz2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDetwuN85ANC2pyZaOq0YC/aLP3CagjzwggrcWoX3kE=;
 b=VZaaPhVxQQxnUlKf04/FKJ5eegYRwEfpTtDxmzNrxVtWxIezhTN0hNW4vfBCDsiTuPSpR0+3dasjmRYWwLvpskgG9QGvKFwhwwt8wxhMP+SQc2KqPsya2MFd2/oANLfw3BchxkYPPrStL2aEPbYmV0x2Z1mM06Kh6Nlorw2o561WcLvl90RYSawqPymEOZTGrc6Yy6xBTKSi1A6nAUAkDbbUOWNoBBLrR/qOy5O85pNlBzH/3eku89wMS6zOr26RbXF7uH/3fLLYS08csBgYtNPo8WqJbHGyr9rB5Ozw15VtbHunyf459mT71bssOwncQibsp2q6vOZoA2rHjTAdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDetwuN85ANC2pyZaOq0YC/aLP3CagjzwggrcWoX3kE=;
 b=Ia9vbNX8DTfcsSitoXbMKo6KUeTmOEIWndWiFLvfgdNrGf08kEOFTvw0GrEHiDksCzq2u+ViSaqX8gBHSD1eFT+fZnt7HFKuMskY9MKfb/YYvDdr6EBlC5b8RsGQ5OqYm/+e2TOtTOisunP5bt1je9BHJqnsGwUotbFMmxyZQZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6925.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 15:25:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 15:25:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 15:25:42 +0000
Message-Id: <DG5FJO49SRRJ.3D8B0XEM9VT06@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [RFC PATCH 1/4] rust: list: Add unsafe for container_of
From: "Gary Guo" <gary@garyguo.net>
To: "Philipp Stanner" <phasta@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-3-phasta@kernel.org>
In-Reply-To: <20260203081403.68733-3-phasta@kernel.org>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e478a2-59eb-43d8-b021-08de63387f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hNZFZsYzhvMTRkby9MRkhMSi9kWmpvTng4aHBvWXVOYmVMcEhkcldlVUhi?=
 =?utf-8?B?dTJDRkJTK1FFT1daMSs1aU8rYmFHQVZFcEMvTHdicUNxWWZZKzF4SU53UXRk?=
 =?utf-8?B?ei9iemZIS3FWQmNheSs5S2NFNVh0ZXZ1aWxIVzJhZ3E2c1JhYUpjMm9RMDNo?=
 =?utf-8?B?MFhsRllRemZBZThyNDhGdVVTUTVIblVhM2x4MDM3S0JaWmRhQUgyMEtBcHZ3?=
 =?utf-8?B?RHUyL2t4RzQ1TEZzVVJOMUtqVzhYZ1BrRllwYmNkcndUSWIzOFVZc0xBeUto?=
 =?utf-8?B?eHVyRlRmWWR2aDNtYkZYMTBKNXRKbnJmUmRWS1FGZ2NQMkxMam1FZnc1Ui9r?=
 =?utf-8?B?SGQyZ2Q2ZWZUMlFaUXBSbDgxMDlMR3lJK1V5R2lLWGEvbm9xWG9MR0tlVlE0?=
 =?utf-8?B?RVdOdWRSQVRhMU1tN3BwMkNDeDU5R0NtV2ZxK3ZTL3pwTWF5bndBSjhMWmhO?=
 =?utf-8?B?WnVENDhPSVJjSGpValRjL3E1ckI3UTZxZVdqekdURlExU1RTYy9obEwvcmJl?=
 =?utf-8?B?cnd6SEFpT1ZvN0thRE0rN3ZEeXhSMU9jL1JXZmdZVVFvWUpEeXFQSFZ5ekcv?=
 =?utf-8?B?a0thVmhMQTJLUWNJNE9WTGtTeFl6RGpQaDg4NEtxa2N1bm5JYUt3YVl0aWtJ?=
 =?utf-8?B?MVBvT3NhS0kyY29UbVNTY2VCRndINzgyMEFyN0RINFFqMVpCbVlFTlhONlY4?=
 =?utf-8?B?ODZyY0d4M3NYN1BzU1M5MkRyS3dRdE10L0xNaTlLV3hCQmhUb1k4aFYzVWVv?=
 =?utf-8?B?OWRBQ2tGcWNaWmdsOUhpOGUyUFZ0K0RhbkU3Rkc0K2xaY1d3SUMvQVZycGRF?=
 =?utf-8?B?NnQ3cm42WFRvdXJ6M0EycUpWSzZISVphKzM3WDJndjVLa2JFNGNWVVZtR0pK?=
 =?utf-8?B?UVdnbG8ya0dTQTRFdUU0dm9vR2tmR3FKNDNVc1VmZVN6NnhBbWFOd0xwQi82?=
 =?utf-8?B?OWdNbEZYNnpVZ21VYUkvQ3dWd2lzMmtqcnk5RDJlTENnWjl6UE1RWVJMM3Bz?=
 =?utf-8?B?a3prVzR5T0U3Ym9zcFNTVnpSVHI4QVdwS2lJSVNleFltS3Q0RkpaU2xOdmF2?=
 =?utf-8?B?QXBBM2s4Q043MEpHbnhVMDkvK3UyTi9wU1VMUzZkSUFjaDhxWkptVXdXNnhq?=
 =?utf-8?B?MXZSUGtlMTYvaXhqc2xPb0N2and5dUNYV1o4eWVwZjhsZ3lud1E3ZXp1OXBQ?=
 =?utf-8?B?dUduc0hTQi9heXBZc3JaRm5sQkNraks2SDdlRm5FZ0JDbERJam1POHdHbEkr?=
 =?utf-8?B?UENvQjlWMmtxeTFCU2ptV0xOVi9acVNGNHREUzUvMjcrNWMrVUx5NkdEb0VD?=
 =?utf-8?B?d2FPaTd2SVA2ck9hUnpMN3hUTkRsd01pQlE3TFkyUlRhdGhidDhid04xQkJt?=
 =?utf-8?B?S2xXSUNITURNNS95NVlwUDUrU2kvdVhxMkpMUElOK21Cam4zeWlYRTUzZ1JN?=
 =?utf-8?B?dGZvVDEvUytleVFCd2g3dlhBb3pXUHFrTXNxRDJMbE1OUWJQTFVjU3NoTTBw?=
 =?utf-8?B?WGpRSjZ2L3pkKzVXTnJ1bGVBdHdDMGJSY2gvYk5ZMHB5RzU3QTlyNkFHRkhV?=
 =?utf-8?B?dFRtMExubVpXVGlPemZtSXNrSStublhnSUQ2L3JwSWlwNzJIWCt2b0hrb0Vm?=
 =?utf-8?B?cUluc0E4WjFkbVhVS1JKTzhzZzVFM3drSEJTdkFaV2FDV1dXcU9aVTY1RmhI?=
 =?utf-8?B?aTh1eVJMQW5EemFKUnZqTXJrREp1SVhCMkhUNHFWamVIWW44aUlLZWJkYnVx?=
 =?utf-8?B?dkd6VTZIbUU5dGQza2VoQW9HaEhPZUpRc1NpclNCSEJ6akVnS0ZNUjVQcTdH?=
 =?utf-8?B?U25mZ2x4M2VWODM0djdlWjh2RlgwWG1qeTBha25nSzFXSlAzRzFwWkRZZnYy?=
 =?utf-8?B?Z2p1dy9MNW8rVW5vY0YvVUdSNDJSREl0NnBQSGN0SktTcWVYQnNNUlFZSlls?=
 =?utf-8?B?N2VkT1piRFltTDNyalJ5SEhVYk51Q2JxbkY5ckE2K1BPNVV6UThvc1dKaGlt?=
 =?utf-8?B?TlZlbWdSaXZLWVM5MUd6SEx0dWFVTTF0cHNtemtYckYvS1J1aXZGVmNQY3Nu?=
 =?utf-8?B?SVJWRzE3RW9oa1JJYWVqcTduZkZLNVM5WUMzT09iUk5mTlpRNEo0MVpMRTlu?=
 =?utf-8?B?S0lwQURPUzVDTjJVRTV1Nkl4YmRxQk5zWGN0bXZIa2dPVXlDeGR3aTBCV3h0?=
 =?utf-8?B?ZWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1BKM01LNlQyL0VubFMrUHp6QTNUUjZqZ2hvZUFiUHNJUkNqVlUyRFkzSGlu?=
 =?utf-8?B?NXc3dGI1NXZBODJqZ0xUeVZDdVluWXVLSzFiY3ZENHJySW5TVjZGMy9Cdktl?=
 =?utf-8?B?eGEwRFB5bkU3aVdrUm9pTEJPZ3Z6VUdEaDIwTzU5cWhrYkQ3TENzSEVGUFpz?=
 =?utf-8?B?a3dUdHYyQXVKSDI0eHhOMFljRndLWTRVam5YS1NZQW0ybU0zSmExd3pCUDB3?=
 =?utf-8?B?NUtVMHR1NkZ0cnMrYXlyMGQzSG5BN3NRZFluU0pzZjI3M3JMazQvUWNPMEl1?=
 =?utf-8?B?RHNoRVNzODlaSjM3THJJWEI1U0o1d0Z3SVowQjVlaDhXRlRoaUlZdEo1ZXNT?=
 =?utf-8?B?ZER0U0wzQTljZXkyaTJ6Ulg0aUhhNlg0WFNoR3ZnNE5xS1F5TUdJT3Nkd0ky?=
 =?utf-8?B?aW5NRENwSGVpa0tNemlXM2NyTGFUV0IzK1hpUjZ1aTR6VlZObDlFeTBsU0ta?=
 =?utf-8?B?MVVUV0dsZFl4ZHdua0hSd3VIZEQ0MkVmbm5hcTJOK3F0dm1OWWlSeG1Dc205?=
 =?utf-8?B?ckFheWZGZ1VHSHUwU1lOMS92b2MzSzY3YnhiKytzdFN6TUtiMUZINDBXT01N?=
 =?utf-8?B?cEwyRkNpMmFaNHE4ZlV0TVEyMzFYeFA5UThRSHJSWjJCTlF4Q0dCdHZpQWQy?=
 =?utf-8?B?b25lWXdMdksxVWJiYkp3cUNzc3dkVC91MEc3MU5oQ1V5L1Q4TzlGMVlOcXRZ?=
 =?utf-8?B?ZUZ6TERFTWlMNTZINjJWdmRSUXV6M1BBUzZ2Q2E2SkMzcmJoU0R5aUZ4b1Vp?=
 =?utf-8?B?cGRYb2tidXFwenNUdXp5YTJGTXBlemlMSlFhejN3cEswQlFkb2FBYkRvaC9J?=
 =?utf-8?B?cDRtMVR2SDZVbmQ1d1NkMmIrUnhHbkt2Y1NjRzJoZm9nVkhIY01ZU1UxQis4?=
 =?utf-8?B?RmhyUldUWVFVSnllck0rdk5mbjF5d2h1M28rS09KUlZzVHRxM0F5SjZoR0NJ?=
 =?utf-8?B?T2Q4dWpOTFBxV1dmNnkrMTN6aUxqTUhZTHZJZmVmTFA4cFdjbUpRVUwxTE5n?=
 =?utf-8?B?QnRhUXhqNHB5NklvSllwYVFuWjNFTUE4ZklqaGVwcFlZMkVDOHNCU2VsYmxw?=
 =?utf-8?B?bmlxYmdtV24wbzFHamx6ZnNxejFCNkJNTU5YTktPY2JwVHlkNDNKbGhFUk53?=
 =?utf-8?B?SG9JeFRJaXhObFdYK2pUZDhHNlI5M1J1cUc3MjFvemtMb3lKZCtwR0tKOStk?=
 =?utf-8?B?cUxTWWI4bEtXcHVXM3UyODEzZVN3ZWZ3OTFpZmQyMGxpNVdxVW9WQmNxeGVk?=
 =?utf-8?B?SUE1bWVscndSVXRnVWYvc3NSNGd4VjlZbVhqc1MzbXFaczRQSDFQVVNIdWRK?=
 =?utf-8?B?V0RVODJ4c1hXV2Q2RVhyVlAvZEpGbmJTa0t6UnFMcmFtUnczdmxEK2FtMEFE?=
 =?utf-8?B?ZnZ0Z1pqZm41RU82YTVqOVpkZGtPOXZSOHpSUkNnSW1yKzFlOUJQWE9WcTgr?=
 =?utf-8?B?N2NaZGNkSE9lTEMxK1pUM05QUHBOYmUvbVVFQmxvcTlOYi9IbXJabGtZdzVO?=
 =?utf-8?B?VkFGR01jeno2c1JabnJDcVJIU0F2RVhNZUphSEZ0b0ZvQ0dWMWRlc1NlUFAw?=
 =?utf-8?B?UjJCL3BZOTRBSnRmaXhjcktlVEgyRitGYjBYbE1sUEczMmJCOGI4OFM3bWRZ?=
 =?utf-8?B?Nm9reWtNSDhkZmtJblliMkF5TlRoRFkvSGFyY0ZlUDJVc2paWUZuMjhLTlhY?=
 =?utf-8?B?aG16MjFyWHhubGdnb1hKbGJlejVVcFlZbVoyczNMSEEzb3h0NURKbmZabkdy?=
 =?utf-8?B?R0dVclhjeTY4RE9MekJseXhTLzBtQ013WGhlUm95S1lmSFV2K1pWUjRPOEF6?=
 =?utf-8?B?ZmxkUWNiRWw3RTZVVXRLTWNyLzNYQmNJNDJNaTlPZjlMSzZkR3lHVE54eGMy?=
 =?utf-8?B?UWxPZWovYWJmdUJpZWxCc0R4ZEx6aHBGNE5NTHM3OFhLNUNvZitJUitTR21L?=
 =?utf-8?B?RXdzQ3lRdUZGMDJVZlFYa21YZUR6RWZob1BsZWFwR01QT2h5STRYdU5ud1NZ?=
 =?utf-8?B?Q0RJUG9GZHJrZndhN1F6RktpMW15YmF6aVJhWHpZRzN3eHl6WXhOUFlETkZG?=
 =?utf-8?B?cTNOdGZuWW5zS215RlE2aERiclMvWGxISEdQSUUyYTV4S2RkUkxHdEtiYmhC?=
 =?utf-8?B?NFhMNUZ3d1BsdExSMFJtNWlSQU15Q1VUT2hWc2Z5U2FlTzBrdityR2hOZE5P?=
 =?utf-8?B?MDlvYWpLQ3FIckd5VUJIazh1TXM1bERyZktKQ2JsemwvZG8vL0RxV24zamUz?=
 =?utf-8?B?R2UwM2tUSU43enJ1cnhWeGhXTmM2eU5xeXdsbmtDNFRMeFlQcnB0ZGRWdXZL?=
 =?utf-8?B?aWNReWRiSUorZWV5ZmprdmVMQmJsNWN5Vkh6dG1BQnJETmpOSUZuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e478a2-59eb-43d8-b021-08de63387f04
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 15:25:43.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZrUKsXa+z6U/+w49o0KBnNR4rU96IirU7Adw4tJsbGTUUmatdwR8flONoPs8p7+8xqx+QLFdz2zPJGXV0NR4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6925
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,amd.com,collabora.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[impl_list_item_mod.rs:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 97533DB421
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 8:14 AM GMT, Philipp Stanner wrote:
> impl_list_item_mod.rs calls container_of() without unsafe blocks at a
> couple of places. Since container_of() is an unsafe macro / function,
> the blocks are strictly necessary.
>=20
> For unknown reasons, that problem was so far not visible and only gets
> visible once one utilizes the list implementation from within the core
> crate:

The reason is that the error enabled via "unsafe-op-in-unsafe-fn" is a lint
rather than a hard compiler error, and Rust suppresses lints triggered insi=
de
macro from another crate.

When the macro is used in kernel crate itself, it's no longer suppressed.

>=20
> error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>:=
:byte_sub`
> is unsafe and requires unsafe block
>    --> rust/kernel/lib.rs:252:29
>     |
> 252 |           let container_ptr =3D field_ptr.byte_sub(offset).cast::<$=
Container>();
>     |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to un=
safe function
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links=
 }; }
> 100 | | }
>     | |_- in this macro invocation
>     |
> note: an unsafe function restricts its caller, but its body is safe by de=
fault
>    --> rust/kernel/list/impl_list_item_mod.rs:216:13
>     |
> 216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks=
<$num>) -> *const Self {
>     |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links=
 }; }
> 100 | | }
>     | |_- in this macro invocation
>     =3D note: requested on the command line with `-D unsafe-op-in-unsafe-=
fn`
>     =3D note: this error originates in the macro `$crate::container_of` w=
hich comes
>     from the expansion of the macro `impl_list_item`
>=20
> Add unsafe blocks to container_of to fix the issue.
>=20
> Cc: stable@vger.kernel.org # v6.17+
> Fixes: c77f85b347dd ("rust: list: remove OFFSET constants")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

Can you send it as a standalone patch so it's clear that this is intended t=
o be
picked rather than part of the RFC series?

Best,
Gary

> ---
>  rust/kernel/list/impl_list_item_mod.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

