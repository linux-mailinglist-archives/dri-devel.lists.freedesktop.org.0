Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3444A6A75D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E08410E617;
	Thu, 20 Mar 2025 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fDoj44+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361D510E60E;
 Thu, 20 Mar 2025 13:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=somZd7puMJKMEbix4lGyHnYNSfHvI0Ow9vsAzUWLrLqMene8chzGFS0cuE8504A3t6rBiZ8hDxULmfj/OUHm3DjCWzjQDSqzR/056wYriggeYZqDZWG/jrd41WG667CtrT0hiJg1ZBaDAtn7lMAYxFrHuEvM2cSh4ydgzK20E6WvLly2GSuiqZNvWlfej8HN1JCnnoG5tBOx2TyP65BVkJgPyYKpAHqL/Tp6wURRkFG5yOAcctk+HWuW3lxU29ZzxEyzwxLr9uidTmv7rKCI98QScpZTvgZdj8eCh71r2r3tksEFb0lVyxjy+kdyoRBoOHgOfOYCDfZBqtd8AXHekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK4S6/fFpJEHWr5HZhZMZylVlvtpfoJFbihN6XU5xSA=;
 b=LtsS/zelUfeo2AWhHjh/bE/jDYHHvmSTx1rfEClVE7fc51WinAx8GNsS2B8nfi1qA1qFcI9rcWsAK1wPEMDUDvd2XQXizeLE0h2BoJ8XRKeTHLRWpngJckne7QOCcQYxNkInbuNxvztUW1x+tUl8hqCUiT5IH5/WIAgKxe32RLO6p08+Ob1PTDNV3ZRtNSDZGsERBM858QLvYRIyWRD3ZjKNvG3hl8Oau/UbH07CQRG2MXTB/bBqw5uG4qVKpvFf+sFw4UMlkk4W75AfEFXgbONZF762VoOG56Cmphik650v1Z926q/C91IMIwXgpwcIxqHam5mxV1/l0IYFs7fw0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK4S6/fFpJEHWr5HZhZMZylVlvtpfoJFbihN6XU5xSA=;
 b=fDoj44+J8X6CwV/yNnipoJ3iWoH1vq4tjiohXS9VMJvow2uWHZr8Q+CkhBEzTaGk+A+3aZn65/vizO7ux2Ih23oEX3Q/QnHqGgskpjRP4uYbF9jIxsQPfluEMblBQBoic7pZB6uS4+53nmqIW3jXLKnR3qofcGm89m4jWpyiN8vawdWY+zTK9yQEc4DPHQ1MC1c9VhWea+fqdjPnzNUcvmNM7wEp7D6Ba8jsfTi7clIxEqmlaBevr4XV1PvI1pidq0TScxlkDMjlW3U6ROiA/NVgbTQ659He0AhBrn2eXjq+f8yMB7rvzIQMzml+dw8ABJM4DcJkjJbaIH3Ucrvz+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC PATCH v3 0/7] gpu: nova-core: register definitions and basic
 timer and falcon devices
Date: Thu, 20 Mar 2025 22:39:08 +0900
Message-Id: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwa3GcC/23P70rDMBQF8Fcp/ewtyU36xyKy9xCRNL3p4tZkJ
 l1Qxt7drFPmwI/3wvlxzqmMFCzFsi9OZaBko/UuH+KhKPVWuYnAjvkukWHNkDfgfFJvi50pgG4
 epWC8k6aWZQ4cAhn7uWIvr/ne2rj48LXaiV++v0z7l0kcGLSdrpUmHB+7duOSHa2qtJ/Li5Pwl
 hVM3mUxZzszcGGE6bQxd9nztVSgj2Metlyb3Xb1RSYlZyhg8Qer4aDcsvUBQoSJ3KziDowadN0
 KQ0aKPq0zZ4pR/QBP10FZ4TVjbYWsRSYFcFDDaGlfvSt33E9H2kyzsvtLref/DcEaRBSiqVDID
 rMwql3Y7Ci4zPgwrblBRYKMzHbpi9RUXELQdV56/gZdHpYAygEAAA==
X-Change-ID: 20250216-nova_timer-c69430184f54
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4401a5-2b3a-408f-c495-08dd67b4a584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFE5TTB4TEQ3bzdVUUZVYktha0FJSVlMRW0wZ2ZabWcyOTdpQ3pka0cyK1po?=
 =?utf-8?B?SXh2S0lSMTBzQS85RlFZYURxdnIySlNiWTRlaHRPZWZJcDR1RnN0S0cvVDZT?=
 =?utf-8?B?a3BvbWZhRnRWbVVxR3JnSUtBUnNENWtobmNWcEYzNkxneCtmTVlORTgrNk1w?=
 =?utf-8?B?SUdTbVZOTzdONXoyZTFnYlY1RDk5ZTljRXdmWEpaSzlXeWgyMUN6dFlPaGFL?=
 =?utf-8?B?ek9zcHIwcDVTMG9wamxERS9qcWtsSi9ONEpMVnBXVmhMZ1hGeFM5U01mbzBp?=
 =?utf-8?B?SDNycXFFSWJ6TzlTQm9tK1psRXF4SmsvYURNdUVqVVdNS3ROU1gwdXRrbnpU?=
 =?utf-8?B?ekd0eUlFazJTbXlheStva1ZScEJrbWVTM1k3ejBWdjdUa2kzYWZnS0FCYVFG?=
 =?utf-8?B?YXRRbjl2VkFkV0xkeVRJalk4OWtodVd3ajE5NkhGV2FMMXlkTUt4eTVNOE9N?=
 =?utf-8?B?Q0JKbEZRcXFMdjhkaENCNFVrQTJ3WGlOejR6YkZMQVJPQWdkU1lCNElLWll0?=
 =?utf-8?B?bk1UVS9tYlVpM2R2S0k3dS9qcjI4NkFEZlA0Q01sV25ISG0rNkh1d3NOdnlH?=
 =?utf-8?B?UTJiRFk5R1hhMlY2d1ZzUWFqR1lsKzRobkRVbU5rVEI4dDFtZVdBbUJwVEZv?=
 =?utf-8?B?UGpQYlZ3U1oxUXpGYkFHelFLUTNWRml2M2JpU2kzZXZHU2RIa2NsL0dQRWla?=
 =?utf-8?B?eVpheVRtMzFJNGxmVmpvS1NpYm9tdm9lWXlQM2J4YTJJL1lyZzRRY0IvR05z?=
 =?utf-8?B?R3VQVG5oUVFoSFd5WWswbFpsTzFoaFdjZ3ROZTluTEtkQjZsa3dMeGMyMTVZ?=
 =?utf-8?B?L3hIT0huVmNCRFZjTHFKazhEUmhCR1RRcUllbTgybGN6Vmt1SktPejNQLzYr?=
 =?utf-8?B?MWFvNU1QaXprRlo1S2Y2M1ZnYkh3YjFjeHdCMTV2dlFzOE1YdStXV2xvbGRQ?=
 =?utf-8?B?ZmMxcFg2Z2MvN0dSTGhCbmxVUFMxckpZTFM1NGtKTVNDNUxyaEo0a0gvK2Yw?=
 =?utf-8?B?Tjd5TnhzT09LVFJUNDVKdGdYQS9qUWNoSk5lNmtMWWF4S1E1eGFvRnpYU0Ey?=
 =?utf-8?B?TWQzVGdWOXRJaEQybE5XY0czczc1MUhiQnpwR3Fjb2tLSWx4dWtnT0h5cTZm?=
 =?utf-8?B?VHoyL2hJR0JtNWxXdkJjMHZnY0NqN2FRWUtrUDVneDFmVXhiOWtJTktkeEtK?=
 =?utf-8?B?VHNaZjdXTU93T3psMThONThvZ2VqTmdsaEdMRUVETWNWZk5PQWF6Tm55amQ5?=
 =?utf-8?B?MGYvdytBblRIYjA3ZzkxVmo5RVFLNlA4aS9HL2F4OWhFM2tFMzRzdU9LaStj?=
 =?utf-8?B?eDV3eDFjSUt0dEFWZHVtMnh2RFBFckhlOVVxSVRPRmJmak8yMkJ4ZUxsT3hs?=
 =?utf-8?B?SmNQSitkYmhYT056eTVxRS9IOUxRUlJvRGl6T2w0cjVFcWxHTzh0eUJwVGU1?=
 =?utf-8?B?cXVTeTR4Ni9YMVE1TVFnRUpQUTl3bEgyQVJENVM3aGlPOU93OForSTVBTjhP?=
 =?utf-8?B?Tk9xemZEa2haU0FtNXhYeHplRHh5MUdtV0UrQkRUWkVNVDhNZi9CYXNrbWlK?=
 =?utf-8?B?UUZVbUV3cjlxeldMbGtQRFhXWlAvaTk0M1IxbFBBYXJib0JPSk9ack54YXJq?=
 =?utf-8?B?S09HL0p4RnVxU29SclRmOFhUZ0NURWNOUmR3UHN5SnRoMWljVlNEYVVWUzhE?=
 =?utf-8?B?OWJXYThCMmtScEN2a3VMaEpNVkdyMUw0eThiRnowTVRuMUovQUxkb0ZkY0tz?=
 =?utf-8?B?aTNaUVBodFlIZmE4dm9YbmdyVS9UeEl4TmZpZ29uUlVKbjZXdG1LKzlrMGdU?=
 =?utf-8?B?VHdUNHp2VnIvZjBWLzhmZS80M3BackpidlB3QzRTSmE5clkwWXBiSUZkM1dL?=
 =?utf-8?B?REhhVmtFSHZ0UGpuOXdOeWxLU0s2QUorOWlXbENtbDRQaXZwNldmVGk1L1Js?=
 =?utf-8?Q?a+kYujcj0RM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFvY0Vyb3IvTURLQkF4WjRZUzRJRlcxNHpUQnJSeUlMamtjclE1RjA4RjVK?=
 =?utf-8?B?SGx4ZlVGMHlVaDFBdFlFY29sOXBQeHlzaUhWYmlUREszQTdrQW4rMGsvREZn?=
 =?utf-8?B?QkRPRGRVRVZxVUk1cVNKbkt4KzNJcjlKVDB4R1MvRWpHbmc4ZUVTRTVkbTB6?=
 =?utf-8?B?Qll3SUF4TFdxT2dRVEMrRHZkcWROUHNDLzhzMCt0aGkzRENPUStHTDVvTita?=
 =?utf-8?B?eEVFVVdLdnBOenpIRHdpQzk2dlZleHJSOXRlZjEvUjFmSkRLcHFCYVo0Y3Mx?=
 =?utf-8?B?VWp2TlF4c1RFNDI4bXdqNHUxL3B3NjBTc2VXRUF4S3ZobEgzL2VNeXdiZ3Fo?=
 =?utf-8?B?NXdPVkRlOEt0aTJZL1hnYWVNSi8zRXBuK2c0UzVTMkF1N0lZS0w5RG5ZaFc1?=
 =?utf-8?B?ZGM4NnBrekd1VW1ySlRMbmFGMUEyMGZ4VUtJcEUvS3Vqd3c2S29Rc0t6eEJs?=
 =?utf-8?B?dlhldkd0S3dQTFpRd01GMzdVQ0prREt1d09KSzlCeExhdjRMSDFrOVJSRWRu?=
 =?utf-8?B?WGlqMnliOSsvU3BUSWtOY2VtNk9BVEl4a2Y3L1RUdmpXdWZpOGZNeVJXdFFE?=
 =?utf-8?B?ZXBSenlkQzE2M1hhYjJzSlpwMUY0TGxjbUV1bWI1RnRmbS9hR0FhZGhMZmJX?=
 =?utf-8?B?aHJYdkRoUHBram5uRnJSQ0U5KzFUZjFablA3QVdSR3pKai81d0J6akJNYzhj?=
 =?utf-8?B?TjM5dDdVTHA0RHpRb1RUNTNJc09xOHZyZ3lCWmNzalBmcGpMMVlVLy9wVy9h?=
 =?utf-8?B?Q0xRUEhjaHpBOFFMM0pPd0lYNDdrNjkzUXkwRitMTDJKM21IaWwzODRKYzAr?=
 =?utf-8?B?REM4c1hQQXpSYmhEc1dURkNtNkwyS01yV3Y1K2dRTGRzcUpMSEZ1RU1yUExB?=
 =?utf-8?B?QWpzOG9sNCtoaXUwN1RzcEN3K1ZDYjhjN0I4UmFoVWRGSnNOazlQK2dHTUto?=
 =?utf-8?B?UFVJNXdQMXlvUWszRWJmbENiUzZ6QjYva3Q0QkdIeTV2cEgyQVdwWTA3SVJk?=
 =?utf-8?B?a1dkN0tlV3NTYTkvRzRZNDk2YkIvY0hXM0ZDajhHNk1aK29TZ1NheUlqNXpz?=
 =?utf-8?B?NE1RMHFzUlFRaHdEOWdFcHdUOS9kNDlydnNicjZiK2s5RTN4VWlSMnl6Zitt?=
 =?utf-8?B?cUpMQXlkOWpyeWpWK01ISTZnVkpjeWd2dkhpL0dVeUQrZTRwT096a1dZZHNj?=
 =?utf-8?B?WEl6aUFPZWpiSG9sUUw0Wm45Z0xhWnM2VC9oOWJkOGNmOEs3QSt1eDhGcFY2?=
 =?utf-8?B?dG50QVNTVmtocGd2MlNieHIxT2tvd3p3S2JaM1RqLzB2a3YwQ3FuRFV4eEJw?=
 =?utf-8?B?RWI4UWdQSnBsbzBLVUNFeSt6OE9PVlErUkhwZ1VVWXhrMTZ1OVlxbGxrVkJ6?=
 =?utf-8?B?ckxFbnFoaVBHNUl0Q3Blbm5VS3I5UkZtQ2l3MlM5enVLcHFDN2J6cGpMTis2?=
 =?utf-8?B?dFJKeXIyTWVLSnBOdmp4VTg5V1VSMEFtRnFQS3lMaUZKWHRCNURlS1BTZkRN?=
 =?utf-8?B?VUVScTNGdHBCR096Y0p2Wlg2R29seFZjZDYxSUVjQnRBZWFhZzB4ZFpQZm9O?=
 =?utf-8?B?UzI1a3phaGtWajUyZlVDY0NFUVRCOGRYVVVVUjhyNTFIWTJLRElGS0VqUW1B?=
 =?utf-8?B?YzFWdE00RFZ5SkxWa2tMT0NNRW5LbmtlaEZuSnN2T2JxamtxTjBEVWRCeFJ5?=
 =?utf-8?B?QlNVOEFaZHFUNlF6cjFHd0YwU2p1anl3R3RtZmJEU043ZmFjYk5LRENFd01Z?=
 =?utf-8?B?Y3V0U1lJOTVObGF3WlNnUE5iM045OXBzUnM3aUQ0aklwcnNnOFVNWVFNRGZa?=
 =?utf-8?B?WEg5R3I3eVNTeTZISkR4c0poQnE3NU9rSDFZUjBjNVZLcDN4eUEzbWtvNHVX?=
 =?utf-8?B?SldwandxWGo3MWZQT1NDNkhRcDRwaUllRGFPY08yRDErdDJIWkRTSGlnREdE?=
 =?utf-8?B?UUg1S3BOZUxTQTR1cjBnc3RoZnFQazlQYnJsOGtDRm11cDlwSks0V2ZMT1lY?=
 =?utf-8?B?SU5mWitFRWxtem9ORWEzRzhreEhHWDlVbVNJcndET0dFRGxlNG9oZmxLMys3?=
 =?utf-8?B?K29kdlV2WW50c2VZMDRkUkVieURrT1dWSG5Vb1NrM1pPVjMrV25IQjFVRVpY?=
 =?utf-8?B?WHFWVElWU25VSmNnOUZqTlFXSjRta0dpYklWTWwxWUh4bm8xS0VkOHdzQVBl?=
 =?utf-8?Q?1ycsfg2Xj3pW0difSZO5herpZjvaBmsGgKz8qgG2ufVy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4401a5-2b3a-408f-c495-08dd67b4a584
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:32.6434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1d3XPbTiCmDhQYXnSnh3vU+xIy5mBQybst/sWNHebhVCNcbH33TL3tTDXV3VTub9zqt4v0p4ro1uoYHBihDtow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

Hi everyone,

New RFC for the first steps towards bringing booting the GSP, with more
complete Falcon code. This code has been successfully used to run the
FECS-FRTS firmware from the bios and create the WPR2 region, although
this series alone is not enough to reproduce this - the next revision
will probably include the code required to extract that firmware from
the BIOS.

As for the previous revisions, the goal is to get more eyes to look at
the general direction of the driver and raise concerns if there are any,
the main point of discussion being probably the register!() macro that
is used to define register layouts.

The falcon code is still quite in a work-in-progress state, I am notably
still thinking of the best way to implement the HAL for chip-dependent
operations (right now we branch depending on the chipset, but that
obviously won't scale). So the overall design is still very much
flexible.

Dependencies:

- https://lore.kernel.org/rust-for-linux/20250318-topic-panthor-rs-genmask-v4-1-35004fca6ac5@collabora.com/
- https://lore.kernel.org/rust-for-linux/20250319-try_with-v2-0-822ec63c05fb@nvidia.com/
- https://lore.kernel.org/rust-for-linux/20250224115007.2072043-1-abdiel.janulgue@gmail.com/
- https://lore.kernel.org/rust-for-linux/20250306222336.23482-1-dakr@kernel.org/
- https://lore.kernel.org/rust-for-linux/20250320-registers-v2-1-d277409bcde8@nvidia.com/

TODO:

- Document more registers and fields,
- Add BIOS extractor code to obtain the FWSEC-FRTS firmware,
- Complete FWSEC-FRTS execution to obtain WPR2 region.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Fixed typo in Boot0 register definition that made probing fail.
- Moved the register definition macros to their own patch series.
- Used Revocable::try_access_with() when accessing registers.
- Added all the Falcon code required to boot FWSEC-FRTS.
- Link to v2: https://lore.kernel.org/r/20250304-nova_timer-v2-0-8fb13f3f8cff@nvidia.com

Changes in v2:
- Don't hold the Bar guard in methods that can sleep.
- Added a Timestamp type for Timer to safely and easily get durations
  between two measurements.
- Added a macro to make register definitions easier.
- Added a very basic falcon implementation to define more registers and
  exercise the register definition macro.
- Link to v1: https://lore.kernel.org/r/20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com

---
Alexandre Courbot (7):
      rust: add useful ops for u64
      rust: make ETIMEDOUT error available
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: use register!() to define register layout
      gpu: nova-core: add basic timer device
      gpu: nova-core: add falcon register definitions and probe code

 drivers/gpu/nova-core/driver.rs    |   4 +-
 drivers/gpu/nova-core/falcon.rs    | 618 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  78 ++++-
 drivers/gpu/nova-core/nova_core.rs |  14 +
 drivers/gpu/nova-core/regs.rs      | 261 ++++++++++++----
 drivers/gpu/nova-core/timer.rs     | 132 ++++++++
 rust/kernel/error.rs               |   1 +
 rust/kernel/lib.rs                 |   1 +
 rust/kernel/num.rs                 |  52 ++++
 9 files changed, 1101 insertions(+), 60 deletions(-)
---
base-commit: 1d53763dc16c9fc9329a4cdc14d691979d47568f
change-id: 20250216-nova_timer-c69430184f54
prerequisite-change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43:v4
prerequisite-patch-id: 182945904fd914573eed9388a559ce8a642310ef
prerequisite-message-id: <20250224115007.2072043-1-abdiel.janulgue@gmail.com>
prerequisite-patch-id: 73f4047ae5d3e4d51cfa285bd8fd0f1c04d47409
prerequisite-patch-id: 5ad45352d9d457a45886eeea90a46cc21516356e
prerequisite-patch-id: 725e7d42309919c759fdd0585a97810b1eb72706
prerequisite-message-id: <20250306222336.23482-1-dakr@kernel.org>
prerequisite-patch-id: de15c0d16727e6af2d79f88f5b67be4c06212552
prerequisite-patch-id: f8bca95d983222da29508cc6e6886e4b0f992588
prerequisite-patch-id: 1ae8f68250fb43808342285a284bcf7b572263fe
prerequisite-patch-id: fa5ce1308e1dbc71374a381537ab3978babe20a0
prerequisite-patch-id: 7225e000f745bb5fd45fc43393d801d1d9adb767

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

