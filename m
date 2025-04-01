Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03630A77F6A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2D10E5FD;
	Tue,  1 Apr 2025 15:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="rypkbvKG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rypkbvKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2069.outbound.protection.outlook.com [40.107.241.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BC10E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:48:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TzUN9WnBXUWpeqvU5r6AIEvFmxobwc/OuBdXH6GIQJ2ggWgb2G0jI32g713j+Lg5G+cn7ZTBSrV1EFX4/NFSC8+IWeH/9bBe8iRU80I53dtdM1BamaVNVeSKJRPE+guJaUHlyUDjRatUqqX3FtIJhTclV1UT1P23DWxf+ZMkEP12vHDwDMrt9JqtXtGPYUFmVNMn2ijjT3Ez64O4X3JU/6/gO87XTdnspfYtc+MLROECjAh7oAJYYtIAz6NwXf5XP/WmQd+tUPhoKtYZAFV/wvdV0jLjP2h/QBnfPaGMpsKxbZhXXojZM2jL0lMn5nFiQ8/yZDtthaBT+aGCw3AR+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=Ar4Ll9vdXHoWJusU54CZGWPgCmBTM6VftbUG95fm8y9pNJN/RuD0odvHaH1MroT1H4Al/P0nKv0qGRpunz0L6Vjq6aRpxzcG2bUern7EhV/y0iHeX37OHLuo0UVBKgJgAU75HfyQOb8NYzTgHXppnU4N0xqzoUKtzf2i0KszVGYuSlBmcPb6ncnSEgb/3nkuLn7oC4q1BY/2nBXh1eSzOEv58UuxUaZLoPEOqhxBa99bmyE8UnOZSmsOjg8if69fDJlcLcrxIAuNbfrXJw/T9Md4JfUg768wS0iZoxTU0EgVSNj8LjV2dEB4a92+vne6DYseYkbUd4g0aoSCQcaKKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=rypkbvKGX6P/B8DCrD/VR3VuOCY4aXTdSNJf+wiW38v/2XYu1ilFj6NkSjTxlTS5b3irCR0p2MO5YOpCH18VdMTvpf1w2JyD+5I6M1v0jMMSESEtyV3q5EemdX4WJ3CZ+TyJw0/s6PZ1Kp7tCIsmxsXMFy90wB1Z1snfCPXFHqA=
Received: from AS9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::12) by DB9PR08MB7536.eurprd08.prod.outlook.com
 (2603:10a6:10:304::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 15:48:49 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:540:cafe::56) by AS9PR01CA0007.outlook.office365.com
 (2603:10a6:20b:540::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 15:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:47 +0000
Received: ("Tessian outbound 67e15cee2e8f:v604");
 Tue, 01 Apr 2025 15:48:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75034f922c7c18c9
X-TessianGatewayMetadata: NVIPw0w9ADQjKF8N7lBHDk3qwldFY5qBhz0ct/GaQTJicfn4Dlw78wx7k5V4an/JidtmVm1tSo571sBXgBQUT03XiSlpw12mgy59pC4Opn/GITTkNxmfyTjFEMyJX3OEc/47eitpBmHh1QgQIR5vNEdzNOne3XP2sFbA3kdQJnM=
X-CR-MTA-TID: 64aa7808
Received: from L4cd4c3758d8d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6531A2E9-B29E-46CE-99BB-9FC6DC945D36.1; 
 Tue, 01 Apr 2025 15:48:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4cd4c3758d8d.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvNQsO5wpS/iYy7km+TdNKwXPqn96KQGXbCl2I56mKXtVMZ3izv8nlVGWtvo6LvXgB7C4c3dNJahodjxE9y051LcC0CS78nzCaKnQPKVHxHFyh3MVOxe6Oxwx9sM7LxcTVz56eb9B+8tx/VGrrgd7BYCQ8rRrM/MVhnQSzVQvjmpeWPeLRConq/6UfnB/kixXrGxJvi5IDipSE6+YY1ogkqYbYVeVeZk09g4Tmr+0MPXYdR8Peat7nAJNtxNXppft7Z2Mz7VYPWe8088doQN3oLIwa46/2aIE1l5oPiZF3qtfEnNt64FytWzkJLoEELmN7KwLNZybdda03PDLCPqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=R8vm0AihhrJrWmrsePAnjYAI5fBnYE90YVCvbAMbjLdDPYlTmLYYRTLmVEqT912vk9mXCzmbmUwn8h0SK1Rnsm9EtxoopFrXcuipdg5XP/pBSLT1Xn7CzujdGrHCmWn16Q4TJovpMV4YsFRqXXJ6zwTwLcK7DyDrDETz2Pww5g7rJCtvPk2jf47mzAvraSdSkQkIHZu0OcV7jKlgCqpu+Jy48gLJa8NMTR4tMrc2nPVuJYalsg4/QFVwCm2j+gGpTYM+pIzoP7w3mhUHBcd0C1/4Fp7k35HEjKvWWm+zfHB8aDReARBDX7KX9z+SOHGMpH2n3vGFtS1Fm+Gr3S3fPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCB6axTDa+9Pnw96Iv/CHezjexvrPPHp5Wr/Pn/qDuU=;
 b=rypkbvKGX6P/B8DCrD/VR3VuOCY4aXTdSNJf+wiW38v/2XYu1ilFj6NkSjTxlTS5b3irCR0p2MO5YOpCH18VdMTvpf1w2JyD+5I6M1v0jMMSESEtyV3q5EemdX4WJ3CZ+TyJw0/s6PZ1Kp7tCIsmxsXMFy90wB1Z1snfCPXFHqA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:32 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:32 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 0/7] drm/panthor: Add performance counters with manual
 sampling mode
Date: Tue,  1 Apr 2025 16:48:15 +0100
Message-Id: <cover.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|AMS1EPF0000004C:EE_|DB9PR08MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5867aec6-e310-4372-56e8-08dd7134b0e4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Sk13TmlxdmJoc2MwNGlxcFlUMGx2bGhKVUducUR0aHRCdjA5M1V3T21TZlY0?=
 =?utf-8?B?K1lOdEkxOEdRNzdSWXBNM1B3TG16QjhYSjJGa0hkbGhDeUJBb29oeC9ZVVp6?=
 =?utf-8?B?SjlHcURucVE5bDR5L0RpaFJLYmRtWXZocm81UFdnaUpjT1NVTzE0aVVIaFdn?=
 =?utf-8?B?SFhtdlExRXZrSVk5cmljQXVHK3Y0UmMxQ0xZNENwd1A3cEZRUnlrLzMyQUdq?=
 =?utf-8?B?TWVjWDlqN3ZPckFRTlVkZUd2Ymo2cnc5WVljOG5YRjNRVHpqVElXYnM1WlAz?=
 =?utf-8?B?aExNNEFDZDlydS9rTGFoclVkOGpNNGFkM0ZJSUhSUy96NEY1RCt2ZGg5eGtN?=
 =?utf-8?B?RlNWYzdBcW55U0RHTU9hVEcvZ1F3VFFQK2dpQkxzZG5hRVlDZHZuNlFpYVRG?=
 =?utf-8?B?VnhMN2lYU3N3OXZBM1EzRU1VTmpRTmhJWXZZRUtHTmt2akRQSjdDZlE1cThK?=
 =?utf-8?B?S2tBRTRvaENZWHV4NGd6eEp0YzdvT3NOVVN3SlRaYURUZEhSR0N6bjFkSHdN?=
 =?utf-8?B?NW53NlB3VUQ0STNXc2N0UDhzMCtvN3pJcXRTYmpEMGkwZG9aT1p6Yk43ZzJ6?=
 =?utf-8?B?NjhnL0ZqYWRoTHRYZTFvMkQ1Yk5sb0tkd3YxdEFCM2Ewb0hiQXlNK1JxOEU0?=
 =?utf-8?B?TVBxQjhSdHliaWlRVjBNSWliWm9ybXJWb0dYQVllYlI5UTkrMElmSG5xeUk0?=
 =?utf-8?B?OHoyRmIzOXh5ZVhoYmo2NVFFRGJzbFR4WlFiSXJMNS9WcWJhZWZnZnlpTnJJ?=
 =?utf-8?B?K0JySFI1aHpESGFLbzkzWGlqK21Rc0kwY0kwdDhiT3pFc1FrWmNzMlZ3ZWw2?=
 =?utf-8?B?N2QxTFpMVjdHV2o4T1dWdGhOVmpNOEl0MXJWejBIMTRLeU83bzJGZ3FIWmc3?=
 =?utf-8?B?SEcvcXpIT1A1Y25SOEdPeU5UcXdCMnU3Q1ZvaE9HVUNnMVh6NUdGSVhQVm5F?=
 =?utf-8?B?MTRjc0hGSWgvSXY1T3BXUTBIUUxwRHY1QXpwdWt0WlBVenI5aFp6azZNSW4x?=
 =?utf-8?B?dXBWOHpHRFFmVDArUzBGU0ZDaDdVaTcvM0Z6MytVUGZ6VmJJOGEvMUF1MlBq?=
 =?utf-8?B?VEpFZE5obk12eHpFQVFlSEtGamEvUFBORWNZVCtYN1p3SVZMbGlrcjROc29I?=
 =?utf-8?B?V1E2TkdiTXF5QmkyYmx4Q3ViU1B4L0ZsbnZVWEVNSEZxc0VOQ0YxWmM3MkJP?=
 =?utf-8?B?a3RHcTc4c1BvdGdjdlYxZUwxLytzbDYzUnpyVkJuZHM3ZkJ1Y0hLaVVHS0Q0?=
 =?utf-8?B?TklzRGpLRFp0K1k3QmxsQitKbkVUbzFCWnpVbC9VbndXSFpHVDhCRlJubGpW?=
 =?utf-8?B?Vkw2YlJVUER0ZzhEb1pKUTRsWExaVFZTODJ1M2hFbkVGc3hodU1HTkxFT1lk?=
 =?utf-8?B?MlVRWThReUhKR2t4RmpSQXcxRnVkWk1jMFpmODRqNGxIQko1Z1VQSnFJcGoz?=
 =?utf-8?B?Q3pFc3g4M2xGT2FXblFjNE14MHF5M1F3WlliRDJFaUV6MVVnVFlOTWtCbnlr?=
 =?utf-8?B?anhtb2xRYmdpNjErOUs4Q1hwQm9QY0xQbVFkYm9BNnhFa2xSTWpvTTBmQW14?=
 =?utf-8?B?L0VYRUtZbUVjSytNaUE3d2pLOFZVVi9mSkVKVkhhS2IzYVl6NzNPcUx1UjFm?=
 =?utf-8?B?aVh4L1pQVUpaOS9MZjRjYTVCSFkyL2VzUWNGT09UZW9VUUR3ZGFHaDlLaWdR?=
 =?utf-8?B?MWFHdzk4R1BIZTNDamM3RFFvNHZpN0w0RHRLa0IxN1JVajlCbTduRnFrSGRQ?=
 =?utf-8?B?OUNNVndnMDZiVFZFYjQ3T0NIbEl0NTlZUDFtNmhuMnp6Z080bjdIVS9zbXFC?=
 =?utf-8?B?eG5JS2NzUVZWQS9GNis0azE0ZG5xYVc3TThkTk92NXI3UVJUVCt0NlRsTy9M?=
 =?utf-8?Q?c8SUoyoETipWU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 08f88fa1-1ae5-47ca-e742-08dd7134a7a5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|82310400026|36860700013|14060799003|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW9iYjc2cnU2MEs2dlo1WVJ2OHNTZExLS2JXS0VDbmcrdENSampOMGlDdEtB?=
 =?utf-8?B?ajdLeHpac3ZWbFZWUUlmWEpJN2NHa3BJK3VqczRvZlMvNVNGWldWOW5rYmll?=
 =?utf-8?B?Wk80Skk1YXJtQ2pGdllwRDlnckRHWHd4WGc2ckttVDRHTkl6WWNTK2F5NnIz?=
 =?utf-8?B?TFNIVERKeHliUWxQTWx0b2tLVTl4VEltZ3lkR1IxMzBoRzFFK29GallwSXFv?=
 =?utf-8?B?Wng0N3NtVE8vZmR1OFc3NlJPQmo5cCtqOHljMXBwK0tVNU16c0VFVFFmTThm?=
 =?utf-8?B?RkRqWnVRQW0zMzZJMlcvcnBYOXVPZG9kMVl5dWMvZFViMU9pMGFnN0R2THIz?=
 =?utf-8?B?RDlTWDkyTnRDWVR2U09hd0pKQi9sYkwyUjVPT21jNlJwY0JGblk3SVhwTlIy?=
 =?utf-8?B?bnNXMDVkQi9ZZTd5cGlNMExVOElFMnQva2dKZnhvTGpTVU5KOVN0S2NQYjJm?=
 =?utf-8?B?L0hZWXZzNXZOZXBDT2ZEak1qMXFrLzhubmI1aUp5OUVOMDc5RFUxY2tuWmY0?=
 =?utf-8?B?VFFGMWpmMzJXTkY4SExFWnY0NTVoYnMyK0ROUW41Q3FDL0psMUtqdHYvR0VV?=
 =?utf-8?B?U1NOb1Y2TzM0cU9obUpxVWp2bnZvOUVPYnAxUVZadm04ZUlieDR6VHN2bnU1?=
 =?utf-8?B?eUhtTDRPWklkMmRGTTZNQzRNK1Y4R3p3VnVkd1RQa0wzVE5WMkU3c29OdXNw?=
 =?utf-8?B?L3RxKzVGMXhueS9reklVM3NDVUNIU3pWTy85TFdjV1ROZnVuSmRBM2NUQzdK?=
 =?utf-8?B?ZTM5elVSN1BFRit5ZDZ6UmNIdTdrZUxWVitvUVh5Y2tqSHV6dlptQWU0Tjdm?=
 =?utf-8?B?SDNVbS9ISjZTbFpaV0pxQVZmWnZ1aUw1RkNXVmhoVnNJaWR1dTlZeCtZUDdG?=
 =?utf-8?B?Zkx6NVRiTnYyWmlXUDB5MGd0SFo0VklxNGNzQVNteVpmbUNLMmppVk1sY3NI?=
 =?utf-8?B?YzdObzdrRGNobjhJWVRmTjZ5amZTQmp2WFFIa0dvcG9mZmUvZWRXVmhJOFZK?=
 =?utf-8?B?aXhXbmExNTQ5dUMxTTZodWN0a0RsL3ZsVWd1TEpMRld1YWdFQUtqSFd6K0dX?=
 =?utf-8?B?ZWJSMVZqZjBRa1E3OXlzNzQ3R3owYURMUFZDMDdFYm55Y0NjdTJMYTJrRHpH?=
 =?utf-8?B?SGQ4N1lnODN0TXYyN0lWVVZZOWhFd1U1aE9DYXZZZm11R0FBVHZ6VGpUS1Yz?=
 =?utf-8?B?V05GV1daekpKNnNncFVQL244S0lCUTlTZWFwcVBIdlp1a3V3d3lGcGpBSm53?=
 =?utf-8?B?WUR4U3BOQk04cW9RK214a1NyZUNjSmVnMzFTM2hEeW9PS0daU2hWenBYNDVG?=
 =?utf-8?B?aVZ3VmpQbVMwRkEvVjdGemQxMys4NGJmUTQ1N3c4c1RIMnBqQUx2WDdReGky?=
 =?utf-8?B?MlFEeWV5SkxkbHVSSTgvbGVzRlBxM0k1Z25oRVg4NXY4ZzZwUFRNWUcxMzhL?=
 =?utf-8?B?Y21EKzYvYys2bXVrRzh0VjF5MzJNVTZ6RllCVW5Qbk9kZEJneEt4M2FUZ0k5?=
 =?utf-8?B?R05maHVDWGFpMjh0M1J4ZnJBUGFJclpqdlhQMUQ1eVhqYWU0WW1sWXVERXBG?=
 =?utf-8?B?STZ2OVlmMklmYVVvUjVXanY3b3Y2ejJvRGRrdXUvNjJnYWU2ck05eDI4NjVG?=
 =?utf-8?B?Q3R1UEZsckJEZUVIZkZFLzZNcFVrdUdiWS9RcExXUno4NEluQ3ZXSU1RUGhk?=
 =?utf-8?B?MDc4UXFHZWhSTmhxMy9VdWNCV2oyOVhka1p0aEpvUy9jdC8vZjEzMzdKRWZw?=
 =?utf-8?B?Y243eGpKY0I3RTNLeFdOQWRINzBYS1BNdnoxZndTcEd3UXhTYUR6NzluZEZP?=
 =?utf-8?B?eGs0ZzFIUHBvMGt3UEVMd3Vhci9WakRVQmNWTUtvSmlTYVpjL0xCeEZ0ZHNT?=
 =?utf-8?B?MUJuU3h1MmZaNmkrY1VDb2Q2Y3BGQmJuNTlPOUVLVDNhbG84d1pIU2tRZ1hv?=
 =?utf-8?B?MzdvR1JiSHZMbklUUW04azYzcy9IdEJISUUvanNtZjk5cGdFTmJQVjNQTFBX?=
 =?utf-8?B?NjhIUUZZcUR3PT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:47.5846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5867aec6-e310-4372-56e8-08dd7134b0e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7536
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

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1]. With this patch series, the RFC tag is dropped,
following [2]. The Mesa implementation is in progress, and
will be posted within the next week or two.

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or exiting a non-counting region, or when a
  shader core has powered down.
- the clock assignments to individual blocks is done by
  integrators, and in order to normalize counter values
  which count cycles, userspace must know both the clock
  cycles elapsed over the sampling period, and which
  of the clocks that particular block is associated
  with.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

v2:
- Fixed offset issues into FW ring buffer
- Fixed sparse shader core handling
- Added pre- and post- reset handlers
- Added module param to control size of FW ring buffer
- Clarified naming on sampler functions
- Added error logging for PERF_SETUP

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
[2]: https://lore.kernel.org/lkml/20241211165024.490748-1-lukas.zapolskas@arm.com/

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   14 +-
 drivers/gpu/drm/panthor/panthor_device.h |   11 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  150 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 1940 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
 include/uapi/drm/panthor_drm.h           |  546 ++++++
 9 files changed, 2712 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

--
2.33.0.dirty

