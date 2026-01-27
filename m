Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAbGBrLDeGmltAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:54:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852B952E4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36EE10E580;
	Tue, 27 Jan 2026 13:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="knuTd+a+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022132.outbound.protection.outlook.com [52.101.96.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFDD10E577;
 Tue, 27 Jan 2026 13:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDt1Q4YHANDWxcX6QUxu2LvxxYjLDphmCdXE51erMQ7zMfRbDQQnALUYc1jzu/mbxdrQCd04MGt+hIReVDyzuIopVJSrZ4OR3twhBGMnFTXI+jmfVOy8v0wEw6dEGs/zp7+1c16/ukbelle7/aPJ9f6+sNJVlP3sS0m3J5XVr50u63b6P6Uz/O/U9aW6xJN6RxGU881xUgtV4DfpcqijL+tot91k4NXfT66wrKOADrDZuQPyu0F/9ziosIHLT/tVjsuUrmGmCBc609qSRzGcUjXhdMe90L8i1NMNMntaz7RfblPMWBKIJ4DI/qFPkgWAcZG4otm9SCS1oIgTJZ/KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUr8mGSZnEKIkH2nyPMG7ASZAkdR4yDBf2ilcTfvBic=;
 b=CC0rLeI22BOXbrLo5z/PJmhn0DnU2hkN5xw7KUbg9BGbIfWlMXl0dPaz2QOoVfMT1bXXP5UkN0wjOZDV8I4442APCFxkaFAtfYOQEzalquS6L+rq3W4QfL+wuYm+PU2lPExLXScjvczjfsClHe36BvhN/mJa9NjSH0dTgay3N7tlJx+n1hwXmr+GFTNG8EG0QXgRjGNbCraSlWrnD4zbxQTVBydmCuskPoUQ9jzm+MJaDWXjHQQTBwdfUgpqVb4nnR3k105jXAffMRa63cNdS7wNv/1LaagE3uGCguDuOA+weK+HQk6lUuBSECMmZJ/wT5arAeL1F9zOnLtZe3zuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUr8mGSZnEKIkH2nyPMG7ASZAkdR4yDBf2ilcTfvBic=;
 b=knuTd+a+Iq3y/ybKJJcd2AfvIA93DC7N8hT8Klw6cDbwzKiAczqfrPWA1bttIdaf0ffKZmM/RN8ZfrChp+7Z1AHhaKr10g7txcfE512S77ZSfLmkXf5f4+fmv6prTwPhtcWfglkGEHUmvA5qvvVDp6PUnhCfG2aozrcBzOB2lDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 13:54:50 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:54:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 13:54:50 +0000
Message-Id: <DFZF89UDGXF7.22T2PKFSMTQ3U@garyguo.net>
Subject: Re: [PATCH v2 0/5] gpu: nova-core: use checked arithmetic for
 firmware parsing robustness
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a28b8c0-e4e2-4fe4-fcba-08de5daba417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGtGdVlhRGs4U2NrZkdEZ3dPU0NuZUUrUTN4OFlCUGFWUHU2MG8wTER1RzZ4?=
 =?utf-8?B?TFhqdXlnUTNjaExoc2lRN0Q3S09rTGs3cHhnTjk0YTRKSVFYbVdRRmp4NDdm?=
 =?utf-8?B?c29XZ1NKdDAweUR4Z2NyaU84WjZjd0hCLzUySkxpbVBYTWJGNjFmVVZhVmRK?=
 =?utf-8?B?czYra2Q5ZjY4VzVITTdKMlFWS2phcFhGZVFBQ0lMTWEvaHIxSXRIUkpiMUJS?=
 =?utf-8?B?ZXlqK1NSR3hwemhRTTJ0czFRclI0V2NRMzRLMjV0clNOOW9iL04rclk4ZDAy?=
 =?utf-8?B?ZzhYaFZZSzVDNERoTVBzNmdjSkRxMklOL3JPVDgvZU9FOFJ5eXk1NlNyVmtQ?=
 =?utf-8?B?UEpPcEh5RHJyR1JoVXZBNTJxSEpuK3J5TmZJdkJQZTI0dXA1ZU9OaEFrWURp?=
 =?utf-8?B?TjNnZVZYQ2JnWDIyWDQ5YWt2NjBpRFlmTHJEVGhabmtNSGEzb0VNRklway9Z?=
 =?utf-8?B?aUVTRkpPRytvd1hYVlExREp2VXcxRlZSVFVWMUhQWldzUVNaQkNVNW5rNTcw?=
 =?utf-8?B?V2Z4eE9pcncva0hFZWV4UGdsaXhIYWJoRTFDWHhudVo3b1orcUtCcEthcGx4?=
 =?utf-8?B?MUt4dFJiTTlLeU5sMzlTcFl3NmlZTXlyWkFLZjVOUzhkVEJPV0NJbDR5VFhp?=
 =?utf-8?B?aENJdzdlUEV5elBYT3UxbmpNcjNZbVM2LzByTEhpREtaaDZ5Ui96VzFoMFlD?=
 =?utf-8?B?MCtlN3RlVmFjQ3ZpSENRYXJSM2E1N1o1RWl6VURvdzJFYWhFaUZneVJXOGlS?=
 =?utf-8?B?blN2ZWdTbmJNcEhYRFNjbm1VRVRlcXRxcHB3dXgvekZMa09yVW43V1F3Yk1C?=
 =?utf-8?B?Y0hNZmdHMlJrMWNGeGIyWVBDUU14MzhlOTRvNmJscnQ4Z0s0VXNFaDZ4MGVT?=
 =?utf-8?B?RjY0MUhnZzl4MEUxbDJITmNHdFUyeFQveGxPWWxPbUZmaGxuY1dGS1dnV25I?=
 =?utf-8?B?dVhWa3lpc2dnNWJSUHdBZHZtMWpyQVloVm11L0cxT3FaVU95MVVRK1p2SUcv?=
 =?utf-8?B?UDJrQTFZWHNzYzVBQjAxYk5VZ1dlQnBZOVRLL2RaQktqK01ETExGb3pZUzND?=
 =?utf-8?B?aU1iRHhJWkljRmVUZnByVHNwWWNPK2NzU0xCeXRYVG1nNlVvK09NWERtbW03?=
 =?utf-8?B?UkZPU0ViaVFWa1dmOXRBNWYySGdjbDFXWTdaOStHWmNlQnpJaFpBeFBpb3px?=
 =?utf-8?B?RUlmWjBTdDVOck9Gais3R01hUVdBMmRmenFrSWtMb2duTW1EUmtlanZBaEpN?=
 =?utf-8?B?Umt3NEhVNHlEMTFpNjhOZWJaMExESFFuU3p6WWdVQmVheldYeGdhdFVLS3E4?=
 =?utf-8?B?VHo5VlJoUkRZR1ZaZlBxWGdvcC9WbDVhYTB6YjVnUWVIUS9nTHB4V2xVaDJO?=
 =?utf-8?B?Ylg4K0loekVFVFNjS0xzeWc2dkxPZW1oQ3NCNGNja0d3ZStONWlCeGUrdW5h?=
 =?utf-8?B?aktKU3hPbXp4dFJGS0NoL3NiZVNDcHpVbTZudGdYb2NWV2ZTVFpCWjlBQ3Zv?=
 =?utf-8?B?NUMxcVN6NWNWbXBqTVkxNmd3MGV6M2I2SFZ3VXVBSnJmaWZuMUduUko2ejE1?=
 =?utf-8?B?VERYNUExNVV5eGFwS0VRaUZ5YTkxUTBuYWVwWkFmcUNCVXcxK0RxS3hNa1Ew?=
 =?utf-8?B?YzdQL1JpbFJaYzVxUDQ3MC9udlF5V2xvU3ZZSmQ3a1U2OSt0OEJaTk9mMlZ1?=
 =?utf-8?B?VkVxNEN2TENVWHZ2aXpGZEM0OW5oOVBWSVd0bDQzQ0duMUxwQVZVMzZFTXFa?=
 =?utf-8?B?aDVseTJLTmpTSEFKV29PdGVqWVpVQjZ0REhDdksrRjRPTldoV2JnUTRoRVNQ?=
 =?utf-8?B?bm4vbTZRNG94YlBFUndoRmdXcGVuNHg1VjNxWjhkMDhBY1ZsWm8wZU5JS0h5?=
 =?utf-8?B?VklOSTdtWmU0VXdsOXNXdHkvYmlFQW1UTGdjWVN0enVCZzhDWGJUbVBHWTdw?=
 =?utf-8?B?eXprWUhGek11SHZlR3hoMGNBY3RTaUE0SWUrMGRQcTZqNlpvYVFacWtSbFVM?=
 =?utf-8?B?Vy9wazJVL1ZLOGpZUWFESEdHWXhSRHZwbHJBWitVZGoxMnMraTgyYTJVNDhP?=
 =?utf-8?B?SnV1dG9KSi83QkNxNEN6dmNyZmROLzVUQklRRGNrU2hsekdsQUx3K2ZVdENs?=
 =?utf-8?Q?wCFk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEZoVTJDUU1mdzZ5MlBRRWEwb3ZCQUw3aDBUdXpRbHFjWS9vZi9jMTRHWC8x?=
 =?utf-8?B?VCtBRzdoekQwclJZVlAzc2FqaTFWOVVtYk1udzd5a3pmRTR4OFVqeHI1MVMy?=
 =?utf-8?B?QzhXVWR6TE5DQjN2cm1LTWNDVVE0U2dac1hVSWp4NGx2WnRBK2E1cmJqM2Fs?=
 =?utf-8?B?VWlWajhvajRQL0s5NWdOcnlvKzZGbk1SamtxdjdtdG1xd2Y4Q09kQWRXc1pH?=
 =?utf-8?B?MlkwVmZxMjJEaEdaYm02dGtRWjlLYytyWWFucDNOMGdIWVgxMlVIb3pxV1Fk?=
 =?utf-8?B?SC91ZXZCUGpKdERJT2hWQlhyT1AwN2pzMVFZN2t3bURnL3RuNWZoVVJoNmR2?=
 =?utf-8?B?QWg0MmdyT0JjT1pNTFZlaWRCUzlwU0l6R3FIUTUzL2o1OUphQlYySkxnanpS?=
 =?utf-8?B?OVJJUEJ5RWhKSTFFVHorck1oVDdJbDFzYzFQdGpsWDR4L3lCc2cydURCK0dN?=
 =?utf-8?B?ckxVRk1FRGhDVi9sY1Y4UlVrOXFMSCsxQ1V4eWVZSVBLTVFXZWN0UGRMbnpr?=
 =?utf-8?B?WWEwUFJJVWF0RkxldURyK2o1MzNHQ2lCRkZlcWxwelovV0E5dDlHZ0NQYVVG?=
 =?utf-8?B?OURQYm9ZTjhhTk5yQ2liZHR1RUVqdDRUaXlhTXpQZ0tzalIrTVVjYjlmNy9j?=
 =?utf-8?B?RWFKdFNReDVWb3pPUjdNbjF1cGxVL0NJQlZoQVVKbFhTWFpJMkFneTFqeVB1?=
 =?utf-8?B?SEppbjMvS0Myanlmc29xSU14NDRIR3FycGZQODVCUUVJbmZHb0JmakxvK0Vt?=
 =?utf-8?B?U0Q0ZG1jdUtKS0pxOU5wLzhEQTNlK0tCTDVqMlhNS1VMakJNQVFDRXREVldj?=
 =?utf-8?B?c1FsVGF3WFNTWUFDYndacno0c1k1TkU5NmZ6blB3ZnN3dHNMaThUbmpPZzJ1?=
 =?utf-8?B?Um9GQTBtY1VBU3JoSWF4c3JRYmxjVWpnbmdOU2R6VTRyd1k1c2NIRWY0MGZ4?=
 =?utf-8?B?L3BhRmFEc3pacTRoU0IvK0JodUNFT2tQYkZHS3pFamI4azhmRG5NdlUvV2ds?=
 =?utf-8?B?Rkg1TlIxUGtORlZzNTQ2bHlKZW95a0FFMlozL0RUMXNTcmt0ZXNBNzhDY1pM?=
 =?utf-8?B?cE1qcmNKRjlHV0xqdHlxcUhvalA0TXlkQzZpZ3ovRldXTjJITWdIY2RPdjlL?=
 =?utf-8?B?b29nTUxuSFUzdU8rZFQzR0pFYlMyM0krczMrTkdKM3BNcDZlZzJld2twOXRm?=
 =?utf-8?B?anVXVFM3YVBZRURXaUNzL3pnY0N5alZLRnJxSVFrck5CU0RYRm1Kbkxtdjln?=
 =?utf-8?B?WjZWTzk2VjY4dFVaZW14dlNwdW5MemhPcHpJM1lveFp4cVUxMlI5YjBNTDhS?=
 =?utf-8?B?QkJDeHNlK25TeGN3MjdSTkN4S2ZBQmVBTTBCejlyOVl2UlFNS0xJeDBGOFdG?=
 =?utf-8?B?VFNHTVJYSUVwS2ZXV2xKZW5XSHFIUXNENUhQQmpuSzlzL1ZJUUNsMGdRQ3Zr?=
 =?utf-8?B?SXQzMXBKMEVpQWFOcHNZN0V2eXdkNzNQZWRZQkFQQjBibVNPcU55L0tndkYy?=
 =?utf-8?B?QnhVYVA0L3JxVHc0ZG9yVHlQdWY4NEw5QjNnaU1GMEhLS011cVpiRkt1Q0tM?=
 =?utf-8?B?ZEJBYjdUNG5DbWg5ZHRsdEhPWFBqZnBBMGRXR3RaN3BORTBLaTgvWnpnK1FQ?=
 =?utf-8?B?NTZ6RmdodFh4RURxbFBvQUk1MVlsTVAyUGxLQktmYmJQcnB5Rit0RG1LZlBi?=
 =?utf-8?B?c1NhYmp1WDB2SGsyQWdIZWRmeEUzT1B3U0loNDNUb2FVSmNnSFpwdWhPeFpo?=
 =?utf-8?B?MHBiTGhVV2w3SlBZNEg4T0ZwZGZ0NkdNb2JWQ3dCYjlvL0lGYmVGVlE0VkxY?=
 =?utf-8?B?ZXNKc2J2d2dDaTMvbUdOZGlmZ1VDMGZhWHp6OTJxeC9wYWJYLzJxS285enVZ?=
 =?utf-8?B?eFJrVW9yR29WQWlqaERYdXlUbEFKL2N0V2tNN2NadCtxQXM3REEyVUZiU3Np?=
 =?utf-8?B?aUZMZUxseDZqSVdTMGo1V2xtU3ZGMGJFb3FGR3B0dXRTbmhvbVdwQ2htbkRQ?=
 =?utf-8?B?N2F4MkhBa2RCRUgvTDJ4V1pUbzdNanEyYXhuU2ZpVWppcG1FS2U1c0JLSEt3?=
 =?utf-8?B?WEluWlpiTENseGh0b1JMZXhZOWd2bElocC9XanlGNktSQUdoQnpEeVJXOXdZ?=
 =?utf-8?B?L1YzOU9uNHZQU3JTTlBPZlRwQXhnRXBMRFU4T0F0NXkxMTJabWVQTU1rNnhZ?=
 =?utf-8?B?LzdWbExXVWNHSE5VTmpBeHJHeFdXMXVSU1hKd05GdC9IamZHZ2dyUENWd3ZS?=
 =?utf-8?B?TWlPRTBjUFZHUk5uWUpob1BOQkErUHUyN3F1cFVZWEd5Y2R3QVNUNk1lQ0ha?=
 =?utf-8?B?dDQvOFh0MGRucTJ0U3FYb05FdFl3YWZJUmZCZWFYd0FFY3FJdmxJZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a28b8c0-e4e2-4fe4-fcba-08de5daba417
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:54:50.7749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5sB1b/ceduO/kiM/WMQJ9tmeHUdE1qYa9Yx+c/E9+IFtw961kzpSpbvc1dJctKUsh0zsSDlgi4SEvSUY3wXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6326
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 7852B952E4
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 8:23 PM GMT, Joel Fernandes wrote:
> Changes from v1 to v2:
> - Added Reviewed-by tags from Zhi
> - Fixed comment formatting nits raised by Dirk/Zhi
>
> This series adds checked arithmetic throughout nova-core's firmware parsi=
ng
> code to guard rust code against integer overflow from corrupt firmware.
>
> Without checked arithmetic, firmware could cause integer overflow when
> computing offsets. The danger is not just wrapping to a huge value (which=
 may
> fail validation in other paths), but potentially wrapping to a small plau=
sible
> offset that accesses entirely wrong data, causing silent corruption or se=
curity
> issues.
>
> This series has been rebased on drm-rust-next. If possible, I would like =
us to
> consider merging for the upcoming merge window to avoid future conflicts.
> Tested probing with GPU name printed in dmesg on my GA102 (Ampere).
>
> The git tree with all patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-=
checked-arith-v2-20260126)
>
> Link to v1: https://lore.kernel.org/all/20260124231830.3088323-1-joelagne=
lf@nvidia.com/
>
> Joel Fernandes (5):
>   gpu: nova-core: use checked arithmetic in FWSEC firmware parsing
>   gpu: nova-core: use checked arithmetic in Booter signature parsing
>   gpu: nova-core: use checked arithmetic in frombytes_at helper
>   gpu: nova-core: use checked arithmetic in BinFirmware::data
>   gpu: nova-core: use checked arithmetic in RISC-V firmware parsing
>
>  drivers/gpu/nova-core/firmware.rs        |  3 +-
>  drivers/gpu/nova-core/firmware/booter.rs | 22 ++++++---
>  drivers/gpu/nova-core/firmware/fwsec.rs  | 60 ++++++++++++++----------
>  drivers/gpu/nova-core/firmware/riscv.rs  |  6 ++-
>  4 files changed, 57 insertions(+), 34 deletions(-)
>

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
> --
> 2.34.1

