Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BkTGDyYhGmh3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:16:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFFCF321E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF87A10E1B3;
	Thu,  5 Feb 2026 13:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="zbe1Cvuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021090.outbound.protection.outlook.com [52.101.95.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6A10E1B3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtFk3ww7PaTDn9V2MO7A0krJDSODV772gWh451Zm8ZOgJf+kcRZGg1uVtQwPXuo+3V6i/Y3DKmmQxnpvJ8mFYjkr97WIpbzEIsJjX3oMUl665JUtPeTuEPUX37vOHTjMwGdVqRNXXQRkngUVq5UluEawTf3rETxijLOiBCHPy6oytxuspsvl9P6j78/wnRFj8qzYb4CWbawZJaWv/O+uwk2suf26x3fDI1VrzQLDWqD7ChbgMSoHqn800wSpTpynmKP4P+a89LHJ4Wnr2bd+PXF9NCoCuDQR5neR0CPTj1k3LazXKHcpjdQWdO7Ss9XcKms90gM9SI4BYz2T/g8NPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4rCExdWz1ZC+c1YdaQt7zpIpQqSqjniM4m8dJv5qis=;
 b=u+oeZGZ6k0w7eCINUi7h+rx7wmKw85IAmq6EYod2bn/4OYe1XpnVk8Gvm14RBF5hxPpgdGGzxn1HkE1+b05xILMHE59zAG4MLy/d9KC0eOXuk9eWGzasvsGIL7+ctl6nRkTj8FG8KsbjPrnICNoA+8XRYj7/KhFnn0F/NK6HrGm1jPjcM8iAGuntLlV1tjVjQjtzC3rM/R1UQl2mtK1rcIKH8AlrvZgKvUNxF5XkGHhTn8/EvWmJI8Ova8Tlb7qXE6k0Eyxtb8emQqrvC6aLV3kjAXWQvvmLYGjpkxhbJommmLIbLdmkcwtpfuiCFkSAGKLXCRdIO2dGfRwbk1N65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4rCExdWz1ZC+c1YdaQt7zpIpQqSqjniM4m8dJv5qis=;
 b=zbe1CvuwmmsgEZWzHHcnGpuRvhQJqTFUnLtc6yxhcRiUEr26cIir+KDmlgSX3cXUbMW1X6ViPBy1iwzhCzZ4nnQRUXuZ8+4LygCUE1VjhiJs7Doave8aaYBK89XupGPmfZWml2Jz7kYMPDa9iolMnzEJlOPG1p04u/YartdIEHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB5945.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:293::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.20; Thu, 5 Feb
 2026 13:16:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 13:16:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 13:16:35 +0000
Message-Id: <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: "Gary Guo" <gary@garyguo.net>
To: "Boris Brezillon" <boris.brezillon@collabora.com>, "Philipp Stanner"
 <phasta@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
In-Reply-To: <20260205111635.5307e1fa@fedora>
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a82470-40f5-40ca-071c-08de64b8ca2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajl6R3hFRmFSUnpkVmdsQ2J6Zm5CU0tpUmlhcG9YcDBOTFFGZmQ1SGNVb0xw?=
 =?utf-8?B?Ukk1c3NCMUN5S1Q1OHAwUlhsZEpPYmswNkJLclJDUDBzK0VmNGRhV2xXMm8y?=
 =?utf-8?B?ZnF2T3RzK2RENmN2M2xrMmZORXg0KzZkVCtzWkFBcFh6MGRycmJ1MG1wUThv?=
 =?utf-8?B?M2JRWWgrZURzdktpNE9rc1djZjNyWlFUQjN5VW1ObVVXMGpzU2syZ0IwTzlV?=
 =?utf-8?B?ckNFbnBvbkZieG5Ic1MybmVtazNZZVZSWktSUktmNXNDM3V5OTUxeUI2cHdy?=
 =?utf-8?B?WWk1M243VFZ2QmgvZHpkZ2pmWFBLRUVoR2xpa25naW91amZCb1ZtaDZEekJk?=
 =?utf-8?B?WlNzOXFpUkRPSnpNMXJjKzljekRlNklzblNjbFJZMFVrK296YkVCV0VqbXJs?=
 =?utf-8?B?cUx5V0lXTlNOSjRlS2YwUUcydWRYdHhFQTFwWFA2T3JuRWtkWFFna3REaEZV?=
 =?utf-8?B?T2hNWDFqVlNVWUR0dzdmMytTMHRONTZqbnp1aWtyN0J4MDduNFdvdlpLVm9j?=
 =?utf-8?B?SzJtTmxsN2Y5QkJDOXN3MmdxdnBvNEN0U3BqMmw2c3FCWW5mQ3J6Q20yY2RK?=
 =?utf-8?B?dU1pUURMU1hENzlwUTZQYkh2Vm9FZm9TQUtDOW1md250Q2c3SWNIdmQ1dE5V?=
 =?utf-8?B?NVFGdXpZVkNsY1ZtSkdvV1MrS052MDRTcnRFRU92Y0NHOFZNUjcyNXZ3d1dM?=
 =?utf-8?B?T1dmRTNEdUhqKzBYbWgyMStLdDNVTjZOQ1R4Y01DSGFyNUN4TjRzK1JmWThu?=
 =?utf-8?B?UWFEU2J3Zy9pdC95TGp0NU02UEZEV09Xc2hTdll6SmFBd2FuRUQ5Ykx4V1JZ?=
 =?utf-8?B?OWhDOWFSN1hiUTVtaVA2MEdpazBDOFhNM1B3VGhIM3l2SUo3N1JHWVR1WW5p?=
 =?utf-8?B?MlhGL0VhUURSZloxVGxCV3gveDZLWGt0WG9yNEIvaTJqWGttMXN1T24rYUpG?=
 =?utf-8?B?U0c4VDAvRE5Qako1enlWV0x4Wi9za1VBNzNETGFYM1drdmUwa2M1WjBCWDR1?=
 =?utf-8?B?QmhUZmZzNC92MTRYVlYvUWdCYlRXUkVzZ01HdmpBTFh6bTlTRHNza3BFK1J6?=
 =?utf-8?B?YnhDSi8vRlRFSHJia0VoOWRtK09MZWo3Q01TQXlDb2FENnlxdFlkdDZ0VmFL?=
 =?utf-8?B?MVZlTkNXcFdWQTl1Vk1NOSthajlsMEhjd0k0RVZYWURJUlp6K0pKRGU3R3pY?=
 =?utf-8?B?SG9XdklseFIzbmhEalZGbUNEb05aQ0xvWlpoUGRkcDFCWEF5cTluWC83NTRV?=
 =?utf-8?B?VHlGWjJRTVBxWFF4c3JTQUdUY1V4WkUxQU8yOXRXZ1pVSXYrcm13bTNEcjA2?=
 =?utf-8?B?NndJRVlaRzNoQSt3ZEh4SDFmTVZObFBFNm1HWkdxYmQvZUtKcHBmeDNqZ2dH?=
 =?utf-8?B?Nkt2enQzK0puellKbzJ5UWU1NGUyV1hucFhXTGJ4a0c0VWNMcEZGa1JSSGFD?=
 =?utf-8?B?UUxrWmtXcXZQV1ZtbXRURC8yN1dXTzJZRnd5S3JwYjQ0TGlNalJaK1A4ZmV5?=
 =?utf-8?B?ajZVbjdjYm4xVDdTM0JXSVdPSzhsRHYrKytwVmJSYkdodDYxNGE1VEN3TzRD?=
 =?utf-8?B?Qm5TSU84QzU1OEtCb0lrb1djOUQxbTNESVcrVFA4M2FBU3NlVnFjOTVjdk8r?=
 =?utf-8?B?emtOZFN2cGdaa0NSN2NiNkNXalBXYTZuQ0RVdDJaQ1BLanhyaE9uVUpudnJr?=
 =?utf-8?B?ODNTT3Nycm1wSWtCdi9XaFNJVCs1Si9OL0Nqa2dlTk9KMWV0VitNZFRXcUNO?=
 =?utf-8?B?Yng4bVBVdFJRbHI0S3JKVS84cjhQRW5oSG8rRzhEc3krVnpVdmhlT3dqeExz?=
 =?utf-8?B?L0hZM05DVHVscTVET1FlWWhLRlMySnpZaFVMVjhxMDBHaDcwQUl5ODcwY1Jr?=
 =?utf-8?B?OWZleEtCRU5ES1BrRE1WS0oyUWtmU2dVZDZHb1BZS1JFMXRHU1Q2ck5Ic3dk?=
 =?utf-8?B?dHNtd0FsdE1ubnVteUtRSUxkYWozMmFLbmRLbEU5NDJQdWhBcDlIVlVsbnZ5?=
 =?utf-8?B?SXRsZmNuTlJXOCtxZDFhanRmbG1pWUFscVJrTXYxR0lIWXB1andZSTJGbVJO?=
 =?utf-8?B?c2VacnovcENjdWxiL21vV0xkcmJURVg5ZSs0ZS9PUGM0RkYyb2E4TGpTRGNq?=
 =?utf-8?Q?GK+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUUwMVoyRTdPTFJzRkt0Y2RUT3VLUXJqb2JIaXZ4aWNqeFBqelZkUWFJV1l3?=
 =?utf-8?B?N05sVHZETWRSUkNWeGJHZG0rYy94ZWJDcXJuZ0s2MEwyd1AydWRySFdqbDhL?=
 =?utf-8?B?MHhxeTBhbTc3NURxZW9pSUFScXVvSnJQQ0hDU2x1MWdPNEQ2anhjMFhjSDVE?=
 =?utf-8?B?dmlUcEhWb2hDL1laOTF2Yk11a3hPYndWK0hNOEJseGY0SFE3NmFZdTB5UlZj?=
 =?utf-8?B?VCtqWC8wN1gxZDRtR09FeU9hanNUdE8vNlUxZjB2MllFdjZZZk42SGtpYTNN?=
 =?utf-8?B?cUxQSVFDbmtuWTN2bVZXTGt1WWppNmhRdER2WldDZ3F2QllIaW1EK2YzeXhh?=
 =?utf-8?B?eVROSnhpaXl0YXA4NmY0SE4wRnQ3aDRBaHhyZCt6RG9nS0RCUWQ2eXhLcDlo?=
 =?utf-8?B?MVRialNJZTBIU1UvdVZ6ZmFEZm5teCtDanI3SHlsK1diemxwNlY4UlY2TUNB?=
 =?utf-8?B?Nm4wdENqdktJanBvNk5CUU9JZXorTHZrU25JZUM0ZzB1ZlBBbGt5MEtISFFl?=
 =?utf-8?B?dW9HZGg3M1FvZE5uendrcTR2czl4TFV0Qk82dXQ4enJiSVc4MzZtZ0k0MjM5?=
 =?utf-8?B?YWhrdUpyUVh4SENZT2xpVEpsTmI1anlwS0c3bXpOdUxNTTN6OWhtOXVLQVVG?=
 =?utf-8?B?VDdJdHdaSWs0b1o0WEpnOXVabzB6WUIvblBWTitPU21zbXRFRUJUS1ZEMGF3?=
 =?utf-8?B?cVVpUnlYZjZrTTFGYWZSVndxOTBCaWVOVVh1V3VWdjcwRG5XYzhiUElYWTRo?=
 =?utf-8?B?TlRKR2llK29aRjIwaEJLejhzZmRaT3orMVJpZm9BQldsQTNNbVlZekRRYnc1?=
 =?utf-8?B?VEFCVjNWNzNCeXhjK0NaeUQwVW1FQ2VTK3pjUFNkZmFBRXYyaXVMeGtWUEhZ?=
 =?utf-8?B?ZTBTZS9tcmkybjUzUTY2NWlIT1hIMVVjb3RQbSttSlBkd0o3N3pxQy8rU012?=
 =?utf-8?B?U0VGRVk1WUZCRGV4d3Rla3k4c2RsVHZtcVh4R1dDR3BRdG9NYmdWRjFQYUN5?=
 =?utf-8?B?dXFTRjhaWThMUC9GbFVCMTYzcXB3WS9LMTg4N2RkdzhtVGNGZCtVYzJsdXg5?=
 =?utf-8?B?Nlk2K2p1bWZHdjQrYmM5Qk1uMjBDbFV5MXZ3R1hpcVYxbmVDamI4MWRXeTd1?=
 =?utf-8?B?YTF4dHJWSnh2MkNldzI3NUVLZTNsRVVCSTJtUVV3aXZMZEpqMWt1RUQxSDVR?=
 =?utf-8?B?Y1R2MUxRajZGek9BNkdGRWxCcFhxRVBSeHVzTTY5d0NpV0pzWnFWZE81eXJj?=
 =?utf-8?B?SlE0NzFpdkJMeGhJWjBCM3g1TWQ4cHVWY2tZTjRrcFpLQTJUejBCdlJyVlBP?=
 =?utf-8?B?RkZiKy9jejhhL0c1eWdGWTlDM0RMZFE4aDRVY25vc1FQNlFGUUhIeitoT3lT?=
 =?utf-8?B?NWF1d25naTEvczF1MzRBcWZoMUF2ZWUzTitKR2ZOMmdGR3djYmcyOWNaWXFX?=
 =?utf-8?B?TFJEMlpzZFBPVVZpWlEybWg5WnZyM3hRTzBEdE9Edlk1L25acWt3WVhjdk56?=
 =?utf-8?B?RURZWFpqa1FmYmZGOE9ONFNGajRUUjVhTVFVdWc5ZllFQm1CcWJ6V1YwZCtN?=
 =?utf-8?B?TVhaZ2VDR2NKTEZMSk1EN05reFhoUXRhYUlZVkJXQmZsLzZaakprVitMQklI?=
 =?utf-8?B?WUU1bWxyMjJWR1Qzdi9XUkc0NERpRlZsUGlHQS9IVnJ0a0ZlTFlsbEpwZ0l4?=
 =?utf-8?B?blNETHVpMHdEVEdwRnFDNmdnQjVDQUJWMkFZMjdkY3BxZFhjenUzUmxxT2pp?=
 =?utf-8?B?N2UvcDFpc2FwRkp0V1RndkpTRTBCTFRGWWFFblpqN3hGS25uTHA5dXExS3Ra?=
 =?utf-8?B?bVhnWnFCZmM3QVJjUjk3Y2lnNGxHclhhSHljdXE0cFhtUlB2SktrTlphTWZB?=
 =?utf-8?B?cjB6eWk0L2ViNk1CcmVSaDNwT000SlIyYXhkOUtFZHVGZDFiU3BwZXZmSHBY?=
 =?utf-8?B?NE9RaUFHQ0YyUGtGdWRnSUhYUWpKTEdtYTRpcGNhNnBzRzk0TlFla0hMWU1B?=
 =?utf-8?B?N1hjb0F5aGdob2ppVXVrQVlLZ040N3FEYlFaRGk2Z3R6RFNPVjh2UHZrK0s2?=
 =?utf-8?B?VmVzVmpBSExQcENyRUdacW1hNU9Cb0JZWERZckpZNUxVZXBGV0NhVHA4TmlO?=
 =?utf-8?B?MDFDY1NaejhHeG5NeVF1bFY4NWhsclczalVkamlwQ0lLeUVvODBHSTVWb1dZ?=
 =?utf-8?B?R0x2ZkVwV0pCU08wc09QWTJhQ1cxeUFSNlJ0Ly82djk5MVViVWVKZm9rTDMv?=
 =?utf-8?B?YUU0WGY4b29ieDlsMGt5SFV1QkVjL0FkSTFUT1ROZERMWThBaXhjQkRuV2RL?=
 =?utf-8?Q?Ttx45eUI7hjqkcBrtH?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a82470-40f5-40ca-071c-08de64b8ca2c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:16:36.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jnXjuHz+jqeZciBBfV+EjZCWjeSt7TRONeHetYNIeA/jaBDLKZkwtSnkw4M03vqbWTuaZ7ffCaxFfnihVBW5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5945
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boris.brezillon@collabora.com,m:phasta@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ABFFCF321E
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 10:16 AM GMT, Boris Brezillon wrote:
> On Tue,  3 Feb 2026 09:14:01 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
>
>> +/// A synchronization primitive mainly for GPU drivers.
>> +///
>> +/// DmaFences are always reference counted. The typical use case is tha=
t one side registers
>> +/// callbacks on the fence which will perform a certain action (such as=
 queueing work) once the
>> +/// other side signals the fence.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFenceC=
b, DmaFenceCbFunc};
>> +/// use core::sync::atomic::{self, AtomicBool};
>> +///
>> +/// static mut CHECKER: AtomicBool =3D AtomicBool::new(false);
>> +///
>> +/// struct CallbackData {
>> +///     i: u32,
>> +/// }
>> +///
>> +/// impl CallbackData {
>> +///     fn new() -> Self {
>> +///         Self { i: 9 }
>> +///     }
>> +/// }
>> +///
>> +/// impl DmaFenceCbFunc for CallbackData {
>> +///     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized =
{
>> +///         assert_eq!(cb.data.i, 9);
>> +///         // SAFETY: Just to have an easy way for testing. This canno=
t race with the checker
>> +///         // because the fence signalling callbacks are executed sync=
hronously.
>> +///         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
>> +///     }
>> +/// }
>> +///
>> +/// struct DriverData {
>> +///     i: u32,
>> +/// }
>> +///
>> +/// impl DriverData {
>> +///     fn new() -> Self {
>> +///         Self { i: 5 }
>> +///     }
>> +/// }
>> +///
>> +/// let data =3D DriverData::new();
>> +/// let fctx =3D DmaFenceCtx::new()?;
>> +///
>> +/// let mut fence =3D fctx.as_arc_borrow().new_fence(data)?;
>> +///
>> +/// let cb_data =3D CallbackData::new();
>> +/// fence.register_callback(cb_data);
>> +/// // fence.begin_signalling();
>> +/// fence.signal()?;
>> +/// // Now check wehether the callback was actually executed.
>> +/// // SAFETY: `fence.signal()` above works sequentially. We just check=
 here whether the signalling
>> +/// // actually did set the boolean correctly.
>> +/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true);=
 }
>> +///
>> +/// Ok::<(), Error>(())
>> +/// ```
>> +#[pin_data]
>> +pub struct DmaFence<T> {
>> +    /// The actual dma_fence passed to C.
>> +    #[pin]
>> +    inner: Opaque<bindings::dma_fence>,
>> +    /// User data.
>> +    #[pin]
>> +    data: T,
>
> A DmaFence is a cross-device synchronization mechanism that can (and
> will) cross the driver boundary (one driver can wait on a fence emitted
> by a different driver). As such, I don't think embedding a generic T in
> the DmaFence and considering it's the object being passed around is
> going to work, because, how can one driver know the T chosen by the
> driver that created the fence? If you want to have some fence emitter
> data attached to the DmaFence allocation, you'll need two kind of
> objects:
>
> - one that's type agnostic and on which you can do the callback
>   registration/unregistration, signalling checks, and generally all
>   type-agnostic operations. That's basically just a wrapper around a
>   bindings::dma_fence implementing AlwaysRefCounted.
> - one that has the extra data and fctx, with a way to transmute from a
>   generic fence to a implementer specific one in case the driver wants
>   to do something special when waiting on its own fences (check done
>   with the fence ops in C, I don't know how that translates in rust)

If `data` is moved to the end of struct and `DmaFence<T>` changed to
`DmaFence<T: ?Sized>`, you would also gain the ability to coerce `DmaFence<=
T>`
to `DmaFence<dyn Trait>`, e.g. `DmaFence<dyn Any>`.

Best,
Gary

>
>> +    /// Marks whether the fence is currently in the signalling critical=
 section.
>> +    signalling: bool,
>> +    /// A boolean needed for the C backend's lockdep guard.
>> +    signalling_cookie: bool,
>> +    /// A reference to the associated [`DmaFenceCtx`] so that it cannot=
 be dropped while there are
>> +    /// still fences around.
>> +    fctx: Arc<DmaFenceCtx>,
>> +}

