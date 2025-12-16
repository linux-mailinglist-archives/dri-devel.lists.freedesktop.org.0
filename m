Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33ECC0F7D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979110E03D;
	Tue, 16 Dec 2025 05:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cggs8m8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C7B10E03D;
 Tue, 16 Dec 2025 05:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixoDpTw/hjXVNWZbci8Oz2/Diy2TmJVnkgODaRoagIGOyzpRO5MD4Y8fZxJEmB5zqH0RlLQKLAToPuvYd+VxhSwXQjlzL+y6DwuU8DqclgFP2BjXxyPbG0SKN/zW6jerlgu4ZpKoXNoTiAJIvW9w2UT8fwCX4SdKjKxprfqCV+wjG832Mf/CP4p9KVRKoQAZkrP8IUcyL6aZWJFnD1mXc1oRsVhfRKlKzlkMXkzytCnTDsoQQYQia+B5bJizK6qP4QnAe6z53m6yZNXSwnRLuSSUCw6wPM3Sz/ethyDRZqwgJbRdOmRvYNfjjraKTDCAAaXqssAGGFf6dcH/6q3kWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0uVNs12ho11xb0EEPHuaN8IS2B72tqvGSiqti7NWgU=;
 b=tCljbdr8Wpv+lMrAa277B+ilvW5B4oI6ZreVnLGN4Ne1bt1pjEWmyhngklqHVQbmygDB8VOQKOE2lZn+edeTJ4u1WXH13HVsDgrVojg00EwsXmPNEc4DAQIug8gWDJ3M1wno7+NYZjPJvEYOxA58lqHG1RN6uFDFXZGHs4EhKZDC0CDmPB4MpCGxiyW9zlWPtV0y31Fu1sQc03mC/m3zZyGgWmqhC6Cstx2xaLyAb1kIiarl8DVk6qILIbXaujCssNAI+j52llCfhLydE3X5FRI5Ia5X1qOsEu59PzFuUjYD3XtTMhIk4KqYXnCXmDyI3aFsExUzJkAoCcxonruQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0uVNs12ho11xb0EEPHuaN8IS2B72tqvGSiqti7NWgU=;
 b=Cggs8m8OIRkQV+dEWTgJ4FHVWPOIfgUC+av2zV79/gGPygDQ8iG6tVOPVTgVpPH1WW6hgZH1xIH0xO1dOe79AesxSGS4lzrKnelhIhswnGPITBvgKqAEOooQjsvlCtcZAWZMC4vTKAxJQb10CfBZ8RCKXJqm6AkISLkMZQAIjYFvA9mguzTje8XORLR88WjgkwyBWtzMYoShDq78tnMyd92xgYiPV1SOqJuTXQyaGE60WVeFjDz6dGx17s36o71/flaiuApvn6SdkrHaT1cZvSUg9/A+eJenTZPZvioUdHyFlfWUsmB0977p+w5rOZL8N5qErTsif1gwONBuBAL+ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/7] gpu: nova-core: run unload sequence upon unbinding
Date: Tue, 16 Dec 2025 14:13:26 +0900
Message-Id: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbqQGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mz3bz8skTd0ryc/MQUXRMDI8sk4yRzM0tTAyWgjoKi1LTMCrBp0bG
 1tQAg7nJFXQAAAA==
X-Change-ID: 20251216-nova-unload-4029b3b76950
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b43cbcb-9091-4c8c-1ce5-08de3c61db69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFRRWmJ5SEo2UWhDQXlSTlgwSFlNWU1GNVdYdjhTcnRORTdDQUhXaGhQVGcr?=
 =?utf-8?B?a2lrRFZkOTBsM0N6N0I0MUt0R2pLWHhaNlJSV2kxYjl2ZDJUM1lKWmZraXVT?=
 =?utf-8?B?SUxKK0NiMG5zQTEzVlNHRTZWRG5DTUZFVW5OZFpyeW1iU1dDY2twOGVsSmJi?=
 =?utf-8?B?ZWVrWjlGV1JBdHNZOUJmdjhtTzZRSmZManNtamhoVVNtZS9DM09vVEx6N0ha?=
 =?utf-8?B?K0FrUHZFbmVBZlRWVnl3SHBhc3l6c1oxdmNvaFJIcFJ6TTRpaUJOc3VIUUtZ?=
 =?utf-8?B?dzJtN29pT0JlTFlyQmcyLzJVZzNFQU13Y24vQjdld1hHSERwLzJMMjdqNnhv?=
 =?utf-8?B?R3RyVFVIcGNzZnRxUG9mWUY1ZWxrNjdPUTlKSUVFeTF0MnhROWxST24zRGdn?=
 =?utf-8?B?VEJrbnJjNThyYVJYQXdzSEwxL29ZbmFtWFZ3UnNmekdQbzllUEtVeXJ6Ymg0?=
 =?utf-8?B?cHlWT0NpdGRCeFZnajVKTFpJWlg5aVM3M3RLVkh2NlJBTU5UTTdMNkdSS1pZ?=
 =?utf-8?B?amlic3Y5eUFvVXUrMmFrdHlTalcxTkY0dW5RT0RoSVdjNmx2Vm9UTEw0MXhX?=
 =?utf-8?B?VzR3STFXeTFCZHRCWm5SUDc5b2ExTm11aEZHb3FFR3MxQTROUFdmMXV6a1pO?=
 =?utf-8?B?UkJweXJTT2crQWRJVEFvSGxHZXN6UkUwV1dGaSsvUGo1M3BBdG4rK3pjQlRx?=
 =?utf-8?B?K3FISXAxaTVldTV1NytrM1VYS0NVZTZ6WGtDK3BuVmZkOVVxd0ZwMDBLZGJC?=
 =?utf-8?B?cmUweHhUbkdQeEYyYWxxTDFmZ3ZGTm8wdmU0QzlYWWdMZDJNN2dXZGlPTWsr?=
 =?utf-8?B?VjdjcWhESUMwUGhBSXAzZTlVMWNWT3dBNkVWaURYQk02U2cvUHlPZFRYRUt3?=
 =?utf-8?B?SDJMc1VXTkRNRHI3OUk0WnVUaVlIcUFCVjUrUHc4eUNnZ3FyN3pvV3BqcGtu?=
 =?utf-8?B?RTI1VVZtM3VHUDdUU0Z1NzJ5NEVCUUpYMHlTdHlZbCtzd2h6N2FWTFZjNmdN?=
 =?utf-8?B?b0RzNmd5V28xTUl1SnBsNEJUUDFOaFk1cjZySDdMcXB1bWdualZKNzV1ZStX?=
 =?utf-8?B?ZkR0OWFIdVpPOWZlTWRQbnY1Ukh0Y2tYWHBEZ044MDJ2ckdnbzFpcG8zZnU0?=
 =?utf-8?B?eTZnS3JuV0RHNmhtQ0pQcENxbXdaTWc1ZDM3ZU5zakQ1OTZZMUt5Q0cxQTli?=
 =?utf-8?B?UDJ3THIyYVB0dW80K1VxMUlJVUNnZWhVNDZ0WGZwQ0xhSlc4eUtuODkyMlhx?=
 =?utf-8?B?TTkwUjZsVmhGTlVLVHlhS29tMUoxRExJTVZmSVNIbjZacmRYbUhSdFQvWmFE?=
 =?utf-8?B?cWNidE8vZUozaytlY3hqeU8wZ1BCWUhzeENsa0ZaL1ZNQU5ScXZyeG4rK1Rt?=
 =?utf-8?B?T1g5Z29naHQvK1pNbHRMWDRxdE0vb1RCbCtYVjdYZWZXT3A1Yy9vNGx3YjBo?=
 =?utf-8?B?STA5Y0Q2N2lmNU5kN1NXa25zL0xzTXp0d1FFVVpzRU1BSXpRSmZ2d3BCTnJZ?=
 =?utf-8?B?eXRiTll1VkVFSFNBZGFjMWMvRlJuTmlVd2ZadU9qMTZHZkg4blBqRmgyRXUw?=
 =?utf-8?B?RUxSNlZpbmlieTFKbnc3MDJuWVpqMkNtMUdHZVdrazhhQXFlVjdEVHZva0p5?=
 =?utf-8?B?U0hSRTdmK1QyQ1Z4WW8vUUlEbms1b3lLNWdqcFRiclQxTmFCN29MNjVGeEpV?=
 =?utf-8?B?OE5udXRCcTFrWVZQTzErR05KUWFDK3Z0Y2R6ZWoxTmY4Skhtdzl2cHk2bWw1?=
 =?utf-8?B?MjlwOHJUd0JaSXZ6UTlaMGRkbFYwMmt6WFZVSU5Oc1FRWFB1NTdta3l1S3hJ?=
 =?utf-8?B?QmE0eFk0aHdRQzFTRFRXM25ReDZJNjNDVDNaODRTbzhaU2xsZHZNbnJHczZ6?=
 =?utf-8?B?aEtYUWQ0UURFN2NSSDVHTnJKZFdXSXp1aXkweDFoMTRZeXR0Rk5SL09IRXVo?=
 =?utf-8?B?cm4yait4UGJiTUhuTm5WYkZMdzdsV01FaDVJWUhndk9KZklRQVBIZzR5U3M2?=
 =?utf-8?B?NG5lc1FOeUs0cnV6UFQxNGlBbitqQlRtUnRteUVqb0p6RXJXSVU1Zk5ZODZ3?=
 =?utf-8?Q?wYRvjT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmIzalcvQWp0ME5TcHhrQzZxWHhMWlkzWE9Vb0REbnlpRUVSRWVHd1FIeE5D?=
 =?utf-8?B?SzdnNlRxZEVqRis1MlE3MlI4SVRlT2VvWmtFblEzRHNxeWF1a2E3b3cvWkk5?=
 =?utf-8?B?K0diRmtyUnJkNGowRzNWR2dtank4TlFqcW9KcnRSTC95UzNzaDg4UEdLZmk4?=
 =?utf-8?B?eTRkb2FyS3ptbzNGWVJwcUpzNzYrUzhNaWdlSEt6Vk9wYUtyZFRqeUd1UTE4?=
 =?utf-8?B?U2p4RHJZdS9UT3ZxUDhRZ0NmWGhoMmdyZ0FBQnpucGhTWm0rQXhRWmFaQlhx?=
 =?utf-8?B?dVUxUGhNVEwydHNrVHVYR1BaTVFXRU9ETXd5a0h5RFVSUEhJV29IRnNkb20v?=
 =?utf-8?B?QXh3OEFlSUUxdE9OTFBiVS9PREFPdWR5MHFPdWhJeVBKV1dZb2VYWktNWHR0?=
 =?utf-8?B?S2ZYeEh2NFVoN294VC9MUVRoSmVndGtkVXRvc3RyTGtyNGhSbnRKeTlaWVk2?=
 =?utf-8?B?NW9URFc0OEZ4MFN3ak9ZejArd2tMTWltUkJ3RGRSYkNrN3hLOFgvcmsxV2Fn?=
 =?utf-8?B?OXB4K2syTWdpRzI3SHg5V2FRRUVGREdIVkhUdkNKZUZYdU5WeU1tdmcyYjlm?=
 =?utf-8?B?UkF6RytoRVN3TWJhZVRFcDBtTjlMMDlqSlpnMFc5VjhRaGZXWXkvcThWU0ov?=
 =?utf-8?B?NzRzY0Q1aERDaWVtbmo3bXNJUG5BQmh3bXNrVEc5bGVmWTJySzVUVTFVa3RK?=
 =?utf-8?B?aStGc0lJbTBEYmlsRDVOQkxKTCsxa2p1clExZklCanNrMm14NElvdlFrWis1?=
 =?utf-8?B?b1NvOUlvUjJja2pzVEJiblBmVkN3cGVSS09rWWFpR1pLR2psZ2ZlMGl1OS8v?=
 =?utf-8?B?S0JzWjUrV28rd2xQSUVGcmZVRFlER1o0MjVFbWhhYUdoRnlabUhPRmlqYlZq?=
 =?utf-8?B?bVUyNFZ4Nkk4WWdPSDJZUlBSSzNPMlJ4L0dvdmh4bDNVeU40cFdWellDVjZz?=
 =?utf-8?B?NDFNc2FwL1JtQ3hQTW9yRjVUbEpQc2hTc2g5MTN0Y1MxK3U1cHNMMWhsVlZv?=
 =?utf-8?B?S2Y1VlI2U08wLzNqUFBYcEFmUXlrdmQ3OUZRZStpa2pTVnlhWEthbS9YMUZn?=
 =?utf-8?B?RlUyUGJFeHFqS3AyMVk3SkE4Yy8wV0tJcXJMb3g0YTFxREc3M0M3SXVRME1N?=
 =?utf-8?B?NGZGMzlYTFg4UGNiVUtpMGFKbzRtUitaZzNHVEFsU2ZiV1RjZUpLS09iVUhX?=
 =?utf-8?B?OWN5WGt4QXIrL2E3eDc5bXFNbmI0Z3V3b2svZDNsR3RreDVFbWd2ZFR3QlUr?=
 =?utf-8?B?OFY1NVl5Q0VKa0tabFdDVXNMMjJKYzljK0pnak9PSFg3N1RjRHU2WWZVclIw?=
 =?utf-8?B?T0g3TDdUKys1dVVaVmdoaVJ5L1lyK0xTcFFIMFc1QSt3VUJhRXlSSEJqQzV4?=
 =?utf-8?B?SThJekdzblZvRTJJNy90Ly9pdHdIMis0VU03eGNjZG82b2tPUjh0SFRIQVFL?=
 =?utf-8?B?YmJMUzF1NmErVTdqSjM2NUM4bDZsZVN4NGQwY1N5eWdQbU1RVDZ1QW5jQ0tB?=
 =?utf-8?B?REVUS0xPYlJsOFl6WjFJRG1IaHU0T1ArWlZUWCtRbC9NMGUweXJUdXFmVGV5?=
 =?utf-8?B?YWNmMXp6R0VNVUN4ckJQUXhNOStJNytLcGNyaHJFQTVEWlRDWW1UZElWQ1Bt?=
 =?utf-8?B?YVdJL0NLQ2kwRDlFWjBiZmYxa3pMU2xzUXBPUC9BbmtYN3JrMENHS1ZUd2lE?=
 =?utf-8?B?bmlTdjBGWEpFNUg2Vks2T2VHczFMSkc3Smx1OVFMS3QvdjFOYStsYVVqUyt6?=
 =?utf-8?B?YThlRzdnZm5KRlZHdmE2Lysrckd4SHpRR3ZWV3dvSWd1SmZvclJTbUVtSjhE?=
 =?utf-8?B?UFd2OW9PZWdHemlDdWQveU5oWm14Z2RSREcxUkZyTFhCSkFGRXkwNmx6Mkx5?=
 =?utf-8?B?VXJrZzNCR0UwQThCaExKSU9kRnF1UTVpTjBDMThsU3NJenFWckVwbkMveWoz?=
 =?utf-8?B?RGNydmRpVzB3SXdTdktURWd6cnl3MHpPQzBMNCtlVGRqR2sydHJ5eW82Mkx1?=
 =?utf-8?B?bmR6c1F1Rjh6RHl6bGNqSEtrcGJOczFsZVVVSEVwN0xUb2d2NUVjMnBKd3Fn?=
 =?utf-8?B?UEFQdmZrd3lQQVFQUEZ4d1Q0VFk1ZXdibFdXbTZQMmNycVdwTnRtdmFvRmpJ?=
 =?utf-8?B?MWhQa05RV3hLeE84ZWlaSHdTUDhJOFI2eDNKRUgyRDlMSXlYemJvUlJhT1Zq?=
 =?utf-8?Q?bP0Xv/isASruJSCzDxjMoww1Ars01cF/3rP1suGib4sm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b43cbcb-9091-4c8c-1ce5-08de3c61db69
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:32.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nkm3MCM1FCjOe9Fngi0gw4SYM+vQo1g1HHPVWECs/3XNbAr7qvHtL2SbpTnL5dhX13cdzjXVyUq3EMTnlA0qGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Currently the GSP is left running and the WPR2 memory region untouched
as the driver is unbound. This is obviously not idea for at least two
reasons:

- Probing requires setting up the WPR2 region, which cannot be done if
  there is already one in place. Thus the current requirement to reset
  the GPU (using e.g. `echo 1 >/sys/bus/pci/devices/.../reset`) before
  the driver can be probed again after removal.
- The running GSP may still attempt to access shared memory regions,
  which the kernel might recycle.

This patchset does the necessary to leave the GPU in a clean state after
unbind.

First are a few preparatory patches:

- Running the unload sequence requires mutable access to the driver
  data, but the current device unbind method only passes a non-mutable
  reference to it. Since the driver data is destroyed after the call to
  `unbind`, we can just give ownership back to the driver at this stage
  to solve this issue.
  The need for mutable access is likely to go away in Nova after we
  support concurrency on the command queue, but for now we need it and
  it looks like a sensible design direction anyway.
- A `warn_on_err` macro is introduced to call `warn_on` if the passed
  `Result` is an error. This simplifies the unbind sequence's code as we
  need to proceed to the next step even if the previous one failed.
- A fix (?) to the automatically-generated pin-projected structures,
  suppressing the warnings when using them partially.

With these in place, the rest of the patchset is relatively trivial. We
change the signatures of methods related to unbinding to work with
mutable pinned driver data, then implement the two steps of the GPU
unbind sequence: asking the GSP to shut down, and removing the WPR2
protected memory area.

This series sits on top of the following:

- Nova fixes for this cycle [1].
- Nova misc improvements [2].
- Transmute on ZSTs [3].

A tree with all the required patches is available in [4].

[1] https://lore.kernel.org/all/20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com/
[2] https://lore.kernel.org/all/20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com/
[3] https://lore.kernel.org/all/20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com/
[4] https://github.com/Gnurou/linux/tree/b4/nova-unload

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (7):
      rust: pci: pass driver data by value to `unbind`
      rust: add warn_on_err macro
      gpu: nova-core: use warn_on_err macro
      [RFC] rust: pin-init: allow `dead_code` on projection structure
      gpu: nova-nova: use pin-init projections
      gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP command GSP upon unloading
      gpu: nova-core: run Booter Unloader and FWSEC-SB upon unbinding

 drivers/gpu/nova-core/driver.rs                   |  4 +-
 drivers/gpu/nova-core/firmware/booter.rs          |  1 -
 drivers/gpu/nova-core/firmware/fwsec.rs           |  1 -
 drivers/gpu/nova-core/gpu.rs                      | 25 ++++++--
 drivers/gpu/nova-core/gsp/boot.rs                 | 77 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 42 +++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |  4 ++
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 27 ++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  8 +++
 drivers/gpu/nova-core/regs.rs                     |  5 ++
 rust/kernel/bug.rs                                | 10 +++
 rust/kernel/pci.rs                                |  4 +-
 rust/pin-init/src/macros.rs                       |  1 +
 samples/rust/rust_driver_pci.rs                   |  2 +-
 14 files changed, 198 insertions(+), 13 deletions(-)
---
base-commit: 8d4031f6a53fe47449b91f30cd7aa5b439558874
change-id: 20251216-nova-unload-4029b3b76950

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

