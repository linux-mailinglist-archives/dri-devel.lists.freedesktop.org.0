Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E8BB244A
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8613A10E75C;
	Thu,  2 Oct 2025 01:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnYPrgD0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C4410E759;
 Thu,  2 Oct 2025 01:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j760z5/ElSkLviW6fntGXGw9pWnrOIXqx6oV/g7/WuC9ePVMAayo69HprkIWNkjw1yurKRFVXS4Mfbu6X+4N1n+3jD8hXuViaIkM5+HT2vsYZ0iK5di5p6/BIPVizcqH4CM9s09Ux2V82Db+q7yrDZmIldOO4hUHfWmJW8ya0+G66tnuzj6kVbIcgj52pugelTYQDQZPF4sSB4m8TtXsmuUYwsIGRP2kM1yQdkF2z6I+LSjZPDUBf6b/CuIg+qfrGiPoBwE4jfYbIjcYa5x7DoiOkljTDKYSS+lOETjrFN2xcdk3zmDLysUXN24UD2VQc8lALXlX6CW+inwd3vH2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swr+33PaUf2ikNqFrW3qbajdmir7KTpKqhoRME49EC0=;
 b=HwujtNFNeH9kNFZC4xAuwcnq7+odIoiw3Z8FkmDGdgT5yKssZKcTjXbkNz8oR+e4kBfqlgAFjrFaBKJDHfH1/5cRd0sCcxgT5QLDzxHJlhtqocdmD0IP/lirUZ89yCYoaZIs78YsH/zGwBx0SX9pdxLieWNoGB5PVY30NF0jOJ+tAbyWtY9QDq17hnUlkDT5LRy64Y37susFgoWxf2wEnCYXtGTq4MF59M81GGBBWw4Og3ngJdGu5uw600y9CKpGO84UfdjgLt+GrUWPSnF6tWXBFzJUJzW9p3r/1Bt+CjRnj5Gf6+abjxNK0jBfBVquAumLqTJ3La/5u9Y2FPNdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swr+33PaUf2ikNqFrW3qbajdmir7KTpKqhoRME49EC0=;
 b=KnYPrgD0iUDT1JOAB8b1yxY1ibnLbj9bQ0ewPeXKD5quJR/1FxJRabwyUUjb9WjVQVsJeHhE5JP51zzYPK1idKMJJCwrvP5eRVX8bMq8oS3hV+n6P695tqlZGTEEkGtFhYNFWo1n5Z+DITeANszB0ObLHkP5UjPvFtc6BHBX+gmP3uAaiDeTAeUCr3mp/3rKvLbQVm/GrMFVSxcdwttnujjPk1IOD/j0e9HrU3u+LBJGXkZ4CbWjiseBMleSuVRqjLb6cDlrT5wZh7W2dEqZ2INtWlOqWhcoSI5776b+M58I+f9BB5cQRxJAApfg696YZnHLURpHbR0lqHFtdq90eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 01:26:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 01:26:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 10:26:03 +0900
Message-Id: <DD7G18DF6PJ2.2E1N4DXGT83KL@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/9] Introduce bitfield and move register macro to
 rust/kernel/
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <DD7G0ERRKG3K.1AFE4FSLNBZCX@nvidia.com>
In-Reply-To: <DD7G0ERRKG3K.1AFE4FSLNBZCX@nvidia.com>
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 8420ff71-383d-4269-aa21-08de0152a8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVhTZlc2aG5TMk9HbWNGcDlOZzhVTHIzY2hmazRjYXl5MGN5bnJnTTBaNjc5?=
 =?utf-8?B?SmN4OFhwR2ZXSmllcmRMcktMakxJNjB1VFFPMVFMZjF0RTh0aGk2ZUluaGJo?=
 =?utf-8?B?elpQY2JIWmllRGxub0FEcUpaTmxGWk5wREdtWWRiS1pJeVlEcEVlMXgyRjhK?=
 =?utf-8?B?MkxWWWxCNzFaM2c3Y1p4UXBkMWRXMVhZemJ4RTBJOURCOWJPTmZsTFRCZTFV?=
 =?utf-8?B?RTJkZFRFZDBKNlp4OEZ2SHZPT0hrQWdSL3hSemZmTldFTXZwZEV6WGN4bmRw?=
 =?utf-8?B?VlEyaTVUNWF0ZTZXY1BNMUYwWENldmVyVDFhbXJnVGdmQlBtd0J5MEE1ZnZx?=
 =?utf-8?B?bCtQM1I0Ylh6QWtnQVREcFhWVDNZSElaVExBVDlReHZSUVBINldQM0ZGaFRM?=
 =?utf-8?B?L2xkNjRFZjZuMWZLcEN5aThpQnB6SzJEbForcml0VHRWYW84YkgxNktjb2Fn?=
 =?utf-8?B?Nnluc3RiSXNVM242QW03aU9mRExIWWdKaTh2RThqdy8zRjFqYzFaVnlXeW1O?=
 =?utf-8?B?QkdaMkZ6U1NVR3l5QkRydjh3SE5jbGJCVENydEsweUdVaituWlZvR3p4czNY?=
 =?utf-8?B?a29zamRWcmRjcWcrR1BWVGdJSys1eVdObjJ6MUpWK0I0L3Z0WTQrYVRHUkMv?=
 =?utf-8?B?NnZMbFVPcXd1VExGNFlqMDczUXdKMDZnb1RKSEx5M3VOZU9oNU92NkloNFJO?=
 =?utf-8?B?SGsvZkE1UzVQS0VKQWQrOFBOVWEySDBmZWtJbVQrU1UwREhCN1MwQWh2RUpJ?=
 =?utf-8?B?ZnVaWldoNCt0ZHlqUkprN0V2V1M0SlBXSmxYY2ZrRUFWa0VnSkxqQW85WUVH?=
 =?utf-8?B?QkJXV3RXTTk3VjVHZnJCS2toVEtEZWtpMlNUby9ISGUvbUJVQVA4RnorRXhZ?=
 =?utf-8?B?emtBR2lsREQ5d1FPektUSFgzaFY2UjN5SEJnY05ORDQrQkJaSWtHV1lpNm8r?=
 =?utf-8?B?YWQrTXJJcWNiTjhnWFZoVllYZU1veUhFYklvTDdMK0NWVHRyRlZlenpPQ00w?=
 =?utf-8?B?YVR4eTdIUSs5RHZhZUMwVDhNbVIwMXg4ZU5Ua1dVNTUyb3ZwVWxJRTJzN1Vk?=
 =?utf-8?B?ZDVzbFV0MWltamVRZUwveXZsOEF0RVdwZE5TN0hKbWp3N29ETFF6TjkraXRz?=
 =?utf-8?B?QlMxTGc4Tk1vUmRSbHNtMHp5RC90QXliZlpVT01TUjZZRXdabmcrbTliandO?=
 =?utf-8?B?a2RhVFN0Rm5Kd1B5dDVTcVk1UWtaNWVrMGUxb0xjdWhaRnM4NFVEVTNyb2gz?=
 =?utf-8?B?L2toMFN2bXJabWlTZGZ1VkFOMDNKaGt0c3BjNlpBS1NQNHZ5MjkwRGY1aFdD?=
 =?utf-8?B?V0JPQVdiRkZwYmRiNkVYdGgyY2FNcWs4bnRJdzRVSHByQUJEeDVlQ2NUZXY5?=
 =?utf-8?B?MERIbEhPTGtJakYwSThDQWwrNzdjV1V4R2Q5TjJBSGFvM2hPMHlnWkNFZGl2?=
 =?utf-8?B?WlNpV2owSFZNU0tXNzFWTG9ZT3p2TlVLcE5vZFBwT050U2ZIZlZqUkhNWEl2?=
 =?utf-8?B?TUdLRmpsZVRJMzkxb1BncVVpMVlyN2swamNIMmR5eHdiVGF2VzBibUlIY2Iv?=
 =?utf-8?B?TnVzUVNHcEVBS2RZTGpUOEtNSEpkcEFBTlMxRCtiTUYzUm1aU1NsWlBOZGdw?=
 =?utf-8?B?N0pnb3pZckZxdjlucVhCUkJXRFI2aXFkbXpsdXRpQU5weG5nNzM5eEFvQUI1?=
 =?utf-8?B?eFZyajNwTGd5ZFQyR01jVTdPbE5tOGJHWlIvY0svV2pCSXZ0ZTRVMWVhMEZZ?=
 =?utf-8?B?MUZreTJ0bGtOT1drNGx5NkRJanZSeEdtMzA5VFFNZXhya0xGeFNWZlBYTmNN?=
 =?utf-8?B?UGlQd0cxVlpkV2xrTnRZZWFETEJ6Z0d0YTRhakVhbWtYOWx2Nml2ZXpjdmdB?=
 =?utf-8?B?QWsyL3JxNFo3VEdPWnJIazVMeFo2QUlJZHQ5cWovR0lja1VNVVNsQkhHWDA3?=
 =?utf-8?Q?nH384ZjoEgzumEvskETocNyHzZp171eV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVNVTV5NHVWaTFpMFgvRHdEbVZXMFpSSFRjUmRMY21WQnZYUlFpbDk0SXN4?=
 =?utf-8?B?WHNYdE1aTFU2KzZBZFFLZDI5OGJ3dnR4UlRhLzhvT1c3VUd1MmZkbHV6M0F5?=
 =?utf-8?B?ODBTcFZMSnZiSHY5RGJadVB3clU0UUFiQkFldEN5UlZHTStXNUtkZE54VWRZ?=
 =?utf-8?B?dTFDNnR0Rnl3TVNFTkpMQjRDZkFvcnNiN2g4dlFWRWNDa0Z4WkN6RThVdHNr?=
 =?utf-8?B?cHZLSWVoWU95cGEwM2RaeUhHUTA1dTh5aWVqZUlldXFiYlN4U2FyUWhrV2pj?=
 =?utf-8?B?TmxpRWE2V2g1aDdGSU84Z2lDQXQybVlOUzRsWkJkNy9MdmNpTXp6WnBLTE1R?=
 =?utf-8?B?bHRYZHJqL1IwTEJuY1dlT0tsd2t6dXE1K0dONGFwOUhKMCtPVnZUdjVkdmRu?=
 =?utf-8?B?RTh2MWcwUkY2eGw1YkxoazFIS1BtSDN2RE4xWVBMVnpKdWsrazNVaEhZb1N5?=
 =?utf-8?B?OUdmQ2UxZE1OclJYeEYrZklHdWZXUFZsMGhVREhpMnFmckRuZ3NZcmpKblox?=
 =?utf-8?B?Q1lGNGRFV0YzRmZvSmR6cGp1djdBKzhiL0VGRXRMS0ZZK1FsblJReks5aXhE?=
 =?utf-8?B?WTN3UHYxNFpKTVhTOWZyUFBHRlNWR1Z2THJFcDJicFM5OGdtZVFUUlg0Z29Z?=
 =?utf-8?B?SlNMMjI0UkRqWEhhbGFVWW5VNXd1b1VNR3JiK1A0SXlXZmhsa1NHcHFDUkVM?=
 =?utf-8?B?M1FyUXdyVUpCaUtZNElzckNGTDNMNUpDdFo3SE5GK1FSK3MwN1hKd0tpL3F3?=
 =?utf-8?B?U2tCY0dDRzdlQ0FWbnRNNDJMamFMY004NUliMk1ydFNXajFiVVRCN1JwN0sw?=
 =?utf-8?B?cGRzbnJ5dE5TTHIySndtYTF5b1B0Nzk2TmZ4aGpnWmNIMFdKRm85cUlUMmtl?=
 =?utf-8?B?bUhBdU5NZEdKU011TXROKzZVbXhLUnRCR3d3d0creWdNLzUwa084N0FhNzRk?=
 =?utf-8?B?Rnh4QzUrTk8vQnl0RWQyK0tibldhdnFxOHJXcEUreG96UXF1bXcvdW1WUFJ0?=
 =?utf-8?B?OVZyc2xmYmxoTkdNNzF6U1B5UGhSb1ovMUl2eVI2QjBNSUV2OVlpRWVXeEp0?=
 =?utf-8?B?YSs2Q0hEZUVvaEw2eXZFTzU0S2FGZEVlNitqQXVpMUhsRFRLQ2QzWmJVSzVx?=
 =?utf-8?B?MmRmcHZ3RmVxTXd3a0pCQ1c3R0FQS2pYRzBSSzdQd0l0bXNDaE1xQVE2aGR5?=
 =?utf-8?B?WmNWaVdtUWJBdGIvN2Z4WDdhZlRIZ1Zkd0JJT2ptSHBySGFLaTZQZ3hTd3h3?=
 =?utf-8?B?MCt1SFhuMzZ4enlManhWQWtIeGdQRDZ1S2xncm5Ncm1ySHR1cGE2WXJJY1RG?=
 =?utf-8?B?bTIzYWw3QXdWdnBsaEZwYm1LRDBTVzBKUytRdXUvUXBiZGgreFRtM2xKVTB0?=
 =?utf-8?B?OWRBS3JMUm9FejRkQlY4K2RZbm41ZU9yZmVGZzNkVW5SSFJwSHhkSFVkTkhr?=
 =?utf-8?B?QWR4cDB1dEk4eWJhUE1LRzRkcmdBOTc5OXpyblRPTUsvdFEwdndJaERiYkVJ?=
 =?utf-8?B?elNwVzIySlhUTzk0d09KUTRLL1VncjZLMGs3cmtxZDJGdk1KbG8zT2JsS3Jr?=
 =?utf-8?B?UERrZ3VRZnpXbUhBUG53amR6YjVtUEM0RWc5NGF5SG03ajJwWUdGdEorUitB?=
 =?utf-8?B?bk5IRDM3c0d6YzZ2dXd6YU9yQXpuc3laUXRwTXVqelRLaktQejFkWlRpMXNy?=
 =?utf-8?B?a1NBc3dEQ1pXTUcvaFN3L1grOVdNT2FPcXBWV3RZUzJpSkwxeGZrQlJVckNH?=
 =?utf-8?B?R25wYlRsNGVNTUd2TDZ4MW9PdXhmRVpMamNsQkdxZUlTRkpRY3IxaGhVV3Vv?=
 =?utf-8?B?UnU3bjRxWHVxV0sycnk4d01kcW5WdWwzTE9xN25JbFUyS2w2STZqOVJYaGlK?=
 =?utf-8?B?Y2Q4K2xMWWdRUWQ1Z2lkZE53Nzhma2dFdExJMk5rNXJDMHZBVkNPeTQwWHNv?=
 =?utf-8?B?TVpSamw1Zjd1Y0VLbTB2OU9jZjJMMytFUnlaYlU4TDh0WDQ0czMraWVacE1F?=
 =?utf-8?B?cGVvY0d2Z2pSTzZ3b2RFb1hvNU5rZktaeVFJRHhaUWl6SnhXbHIzcXRnbFlB?=
 =?utf-8?B?Z2tOaTFHaHI4TXhwY05RSHNyQjFWWk1YclFqZFplTFZ0THVodEwvT2ZBSWk0?=
 =?utf-8?B?UG9HNkNZaWNwcVZuQkxncjFNWGtBQTd1eUVhUDZUeTF0TDBEWnljakE0dzZB?=
 =?utf-8?Q?mq2L0majQLQMTxNFI2PaQK1IFNvwH6Yc8ptDhkJrhk1J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8420ff71-383d-4269-aa21-08de0152a8f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 01:26:06.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MILh27o6UTShKwgGoFAclo6Qd2Rok82lgdV2Mc13rfyWNCQO6LdUSw/flkvG/Pe6TtByLLH3Vp0RaurmU3A6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063
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

On Thu Oct 2, 2025 at 10:24 AM JST, Alexandre Courbot wrote:
> On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
>> Hello!
>>
>> These patches extract and enhance the bitfield support in the register m=
acro in
>> nova to define Rust structures with bitfields. It then moves out the bit=
field
>> support into the kenrel crate and further enhances it. This is extremely=
 useful
>> as it allows clean Rust structure definitions without requiring explicit=
 masks
>> and shifts.
>
> The extraction and move in themselves (patches 1-4 and maybe the KUNIT
> one) look good to me. For the remainder, it will depend on whether the
> BoundedInt idea sticks or not as it changes the design in a way that
> makes most of these patches unneeded. In any case I think this can be
> worked on after the split and extraction.
>
> Patch 5 should probably be dropped as it has the potential to clear
> register fields that are useful to the hardware but have no entry in the
> `register!` definition, making read-update-write updates of registers
> unpredictable.

Ah, I forgot: please base the next revision on top of drm-rust-next as
we are likely to apply it there.
