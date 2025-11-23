Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1ADC7DB9B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 06:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158C310E10F;
	Sun, 23 Nov 2025 05:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UrgZkgEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4D010E0D8;
 Sun, 23 Nov 2025 05:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzHdBmNnXgqyQuo0sUXWHYxqcp18RkxxKQPjrpziVLc8+d57zJe07FWGAyyM57SfXXwz5QIJiYceivghBg/B+5Or5eNFpru4wf+2TtsUKVLkFUAUrG0BNI2eD9JqF6BoyoE1x0OAFS7IuS2rgomUTYFGrYehiQhSuW6YKTSe1mcTmdzg06VM6/MEIrpxYwoaGsiF6gHMf/+HnPEiPoFPYjdPWMc7FFetBdYdO+xZ80BooLWeYVqj8wbE25j/biU9DjKiiAmhBiMtvt2VFgTVy4kTqhKkFTu8NCJvUjttnqWIs1c4DGJ2bcj8y6pDfZOHE+IC6CzgEi8I3fdf63qcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB1rr85cFLmrDFMDHGib35dExgyxiMXQueD04XZHq1o=;
 b=cJJ4uiCcKO5gaf/8eyupJ+VzlhSTs1CLWUHKORzY+zwRnEBgqsGGD4HAherNOEhU0UP3pY6SUrw/XINg/WIduwX7NRczmfNroWRM3NAutlZE8srMiXLQdA4/gMHAw1X/1NUrfp2P5G5NsX4iW2iIsVBjScld9+hqlswKz1MxG1PpmoRgE6hejR8NZI/M/CpyyOClplDvCh149AS+if0+tLhV1PT57/XhAaSIWRDra+AF31md0SBV+D0jjVSXiHCFFNDY+KguTI/iDFwRtD+2mq6UmvCFDZ1hGClnVJrY/o+HQ6qKhhpmxWZ1AoKYLxU1eBOmVU02lVl00CnkQDJFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB1rr85cFLmrDFMDHGib35dExgyxiMXQueD04XZHq1o=;
 b=UrgZkgELBTIba+c8SjiSrHkPbM5z/pC332mBV78uO2+ZTHdghteIeB4TLfRjthzQ2Jn5QhGC0FvM2yZXq+PaDHrkWKNXHm1A3exu2m1QPcqQfmYoP6NELQylNZfNPhjUivpGffkgrkK/kt4KL367aXurcgBEX8Ep73yA3a8j3D6Fm3GYQ1lBoNBiyX+us+2K2QzB6sYjRoylyzRAOxAZA0MBBzyQgzRGPQShehqyB+5IiIFoxM/RlliGAI1vxjiV4WlpGu/fO84keQvAEuLa/L5bc2oIYeWNF+Fx6Im2lg1EwP6AP8FJlqxygsDdB24HpX1TA65MZQiGO8u4P+bRBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 05:12:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 05:12:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/4] gpu: nova-core: Fixups for GSP message queue and
 bindings
Date: Sun, 23 Nov 2025 14:12:14 +0900
Message-Id: <20251123-nova-fixes-v2-0-33d86092cf6a@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6XImkC/02MywrCMBBFf6XM2pFOsJS48j+kizwmdhYmkkhQS
 v7dWBBcnvs4GxTOwgXOwwaZqxRJsYM6DOBWE2+M4juDGtVEpAhjqgaDvLigd9qeAs1Wjwz98Mi
 8F31/XTqvUp4pv3d3pW/606h/TSUc0WhiE5j9bKdLrOLFHF26w9Ja+wCnY4BnpQAAAA==
X-Change-ID: 20251121-nova-fixes-dc9b4f17b90e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:405:372::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: e61fe9a1-ea0d-4a73-d1f1-08de2a4ee110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUwzWjJQR3lJekZqYjNLMEVLT3BQZmJZT3RrQmc3MkR4dUJteXlpSTVBV215?=
 =?utf-8?B?Z3A0Vzl5NlZiek9PdmpiTnp0Q05kb3ZwRHVBMHlyNmxaaE44VjFHWUhKc0FC?=
 =?utf-8?B?a3FmQWp3QU1uRU84L2NzMHNkbWszSEVyNkMwUVRTQWxNai81bldXMDQ4OE90?=
 =?utf-8?B?SDNDd0JZZUtYb0RuQ0VXcG84R0xTcVQxR3g3b0lXYzdWdzZvdHByWG9YNkFH?=
 =?utf-8?B?ZTN6KzVlVG90b1F2VlpGbk10WTJWSlV3YjEvaFZ3NEJLMjFLdFVQU0pIeUZJ?=
 =?utf-8?B?dm5zSEtxWXdkcGpLSnMwVXdYbWowcm9YaHJCY21JVTJUTHErSTJlSnU1cmQw?=
 =?utf-8?B?TVpsQ2d4MXhXdWRJaVQ2V083ckcxRUNla2NhUUtqc3NJS1JIOTNMWjg4YW1N?=
 =?utf-8?B?OU04Nk5ZYk1rODl0MXVhZWx2M1d3UDBlSzZVN2t0NDE0UnJtdndkaWc4UDBF?=
 =?utf-8?B?MFlDNFpPaDFQTFhxWk5PZVVUbW9EYS8wOGJYemtsa3RqOGVmRGsyQXM4aVUw?=
 =?utf-8?B?VmJ3M1hibzEzRU1XczQwcTQzZkNRWWV6ZFhtS2ZUTER0L29ma1ZRUmNCT2Uy?=
 =?utf-8?B?ZnJSZjBxeEthMVh5R2JhQWVDZEFaSW1GYUl6RTBiZ0lDU244YzZKSTNYMUh3?=
 =?utf-8?B?aWNmTGVPMzhvbHJHMjhzSWsxQ3BzT0RaS2VLU2E1WVkxNis5VkpkUWd0czd4?=
 =?utf-8?B?UEpwOTRDaG9wUHlENFFhV25HWmd0TFJ6MHBVQnFXTXhnUTA0b0R0a3BIQ3RB?=
 =?utf-8?B?MFljTjJDK2ZaMjR6YWd6dTdVaG1RbVZqY1ZGa1AwYUF6UUUzdHRLSUtMalpV?=
 =?utf-8?B?MlN6MyttRUNWbW5PZnUzQ3E4cEZGVmdZVDcxaFFyUTFNN0plQzJYRTkvOGNX?=
 =?utf-8?B?SlZSVlZGS3R0djFCYllBdFE1TkpmOC9oR0dqci9JbDVmd2RQb3E3YWQ2amVB?=
 =?utf-8?B?ay9WcmYwRXpQQXhrWjZmdDdaaDdxbk85a3ZmcjRYTUkxSUcrQlg4cE0yY0dn?=
 =?utf-8?B?dnUvV2htcFJYOURIQ3Q5V2xBaXQyT1I4UUl5YXkwM29CWFNFelF1bzJKcGxG?=
 =?utf-8?B?M2E2TXg1VnNMeUlzU0UrS0xqT01jTWFRTFJPaFc5OUZhM1NoWEticEZCdTMx?=
 =?utf-8?B?SzNsejJQcVhscW0yU2R5L3JSWUZ5V1AvV1VDbTBldGdrM0NsV0QvMWhZSzFY?=
 =?utf-8?B?NExPTSsraEJ1MW1nbnhsNTAxVzB5SXN2UjFvN0R4YzFlS3F4Y25oVVdxbXdi?=
 =?utf-8?B?VTB4c2NtY2I2V0JVVmE1YlBrOHZqKzgvVWNVZUFxUWxxNDRZb2psZWZzYWtV?=
 =?utf-8?B?cGhlQXJIUHpYQVNOMVlXY1JLanovVlJDT2grcGJuNUNjZ3BnRnp3YmxHY0tz?=
 =?utf-8?B?WkZPN3UxWHFuR2w4UUhxdHhyaHQrSzk2d1dFT2dCWHc0UVNhRXBLQXZmNTd1?=
 =?utf-8?B?M1loaVdWR1ltbytvWVZpSkVtSGY0RzgwY2RZUityR1l6VjlHNzlycnEwMmFR?=
 =?utf-8?B?SDQzVG5lSWFscXNHZE5Mc2E5eDVtdzY1Uk5RRFU0OUUrVFM2ZVhGZTJkaW5M?=
 =?utf-8?B?UkpYcmxPR0R1aFZXL3hKbnRqb2YrQnZFZEUrOVh6bWF4eE44MWthWkVsaEtq?=
 =?utf-8?B?N0lncnpJbG5kdkg1Mkdrc2o1YXJMb3ZoT1gxNUFQWXhKNVFDd2FhZTk5OUhC?=
 =?utf-8?B?c0JuZEl4R2duQWRFckNjMGV1SThnUjJsVlBybi9ySlZHanFobDJPQlBZczhI?=
 =?utf-8?B?Mng5dzN4N1pBdjh4YXFVZmJNZzUxL3g0Z1hmeURqY3RORUpkQ1NsaU1VbTcy?=
 =?utf-8?B?TlhpY2RBeEdiTmRGTHBrVTF1TjVwQ3lkVlFoWGZ4QndsNGNBYlJXL1ZDQzVz?=
 =?utf-8?B?NHpmS3NJVG9CR0t2T3VGNEVhczBUN1BjRU9QdzZjUGVxcGFVWm51SGVaWVZ5?=
 =?utf-8?B?R3dMRXFRM0orVkF5K3lzVFFCaDFBbVhKTUxvQkZ0TjgrTDdQbSsraFdLZm9F?=
 =?utf-8?B?SGtRR1hCS1JFdUp5Wm9TbUlXMVBKZGk4QnBBNGVIU2FHN3IxWmRUcStPdzMv?=
 =?utf-8?Q?4GfFG9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE0xNEpGanZHMXVvd1hzMHptVW13Sk0rRXFOdHdRQkNUakFXNnVjZEZXNWY2?=
 =?utf-8?B?N09mdXh4ZjRHdzFTRG5wSzlDakNydkt3NURlVTAzV3B3MzM4WlJYSlRuc0ZH?=
 =?utf-8?B?WnAzZUYxSzk0amVQZHMrVUFKT29CZjg0bG9tZGEvWE94ekYzaUJvK0U4bUF2?=
 =?utf-8?B?Ykw5dFVNVU9kVGx1SEhzaTA0TlM5M0ZtWXlMMlZ6aEpJcEd1SVl5Rmc3VTJJ?=
 =?utf-8?B?OTgwbDNoaXVndDFBSng1aTdlMmp0WDF2TE9RWkUxNFhMOXNOVTRqbmFHcUQy?=
 =?utf-8?B?YzZGdzFHNmxacVphM1FFNkVBUWJRbnJFbGJuQzhXWklEQVh6M1dHS0IvYVBn?=
 =?utf-8?B?WlUzbDBFMDJ0MzFCK2NUYU54T3A2anZJam9INis1bWduM0RmS25qL09JcnQ3?=
 =?utf-8?B?cjZkckRWd1FrUjNNOGlWTEJibVQ2Zm9ydzVLQnVOcFMxSUN1NUJQNXRMQTNV?=
 =?utf-8?B?dFpwWCtHcWpMOFE4THBMeVBRcHorcitRWTBZNjFpbkRZVWhLQkpWYjYvdXJ6?=
 =?utf-8?B?YmJSQ3VvUjNLTzJ3WExCTDdMajRHYnVwa1JmZkF6bUhpUitJajRLQ3pXcDd1?=
 =?utf-8?B?RHVUYlJVMlhDOUhLZ0Z6QkVoSjZqSVU1NWx5TVNaRW1KVlY2eXFlb21ad3c3?=
 =?utf-8?B?NDVoUDQzMkc4MU9LM2Z5RDNhd1BIZFkwMkljaWVmTThxeC92ekhaWHNxTGgx?=
 =?utf-8?B?elpSRVgwYnprbzJBUy9wRmVldTlXRkQ3ZUVsbko3dWtXNU50RUkzc3RQKzI1?=
 =?utf-8?B?WEdEYzl6WDBrekVwcmhwRVVZQnlHODVxUjFOenRueHRkN1FTelNnWCswMzJF?=
 =?utf-8?B?dFJVamVmR1c3YTdsUmpjRUFUWEdHU3hzRUlqWVpsZW9yL3FweDFVRStkMVBl?=
 =?utf-8?B?ZFdXSnYrVFNVSWNBVnJJd0ExVmo1QlVGaHpWL1Y2a2VERzk2aWErTU9KSmFH?=
 =?utf-8?B?QzFIK0lOZEI1OTZxdjBrMVBVcmRUTXdRQTQvSUNtNU1xdWhoTXFwUDRTL0ps?=
 =?utf-8?B?bmZibUIvd0dPVDZvajVlZi9iUmhIenYvMUZHU2FWZXhFbG5vb3JDb2xEUHla?=
 =?utf-8?B?ZGU4NzdHa0I2U283QXIwT2g3Nm9YOEk0TmwyT2dISUlWN015aWlYNytCWkdj?=
 =?utf-8?B?UFVDWlFHbkNmT0lnSzVrVFpLS3lkSFdIUS9hclJ1V1dUd1MzVCtJNW9WWHlX?=
 =?utf-8?B?ZGxYVTBaK2NOL0xma2RKeU5VWHZ6MVFoY2xaYVJ5K2FHQmFtOEg3WGREUG5Y?=
 =?utf-8?B?K0xzYnlyNjFrRlF4cDdRb2dseHAveVJkd01salA1dXpDeVc0WHRONVVJZUh2?=
 =?utf-8?B?K3MzQzUraVVTWDE2eTJyVGxsd2E3aEJrc2F4elh6bTNPbGpYL3VuVTlEMHd4?=
 =?utf-8?B?dUFCTDF0aVJSditqWUpOaXFCM1g2SGJFU2xHQ1RoNUpsdFRjbnlSMkxlRGhh?=
 =?utf-8?B?emJwMGZTUDMyQ09sODJRTVY4T1hpNWhndHZMNHg0MVA0bWdPbXZVblBWNGVx?=
 =?utf-8?B?K2ZaNU5rNHZsZkdPSGMvQldzOHlIak5tQXZadUUrb1JNL01qR3R6U2MrQk40?=
 =?utf-8?B?UUx0OTRkWWtEQ0tPZHFuZ0Q1NXF5QndBNDM4bnl6bXBZWEllek1SMzkyNVpp?=
 =?utf-8?B?Z08rbkpMTFpCWDU5amhSdEl0bEwzSitpTUxMWGlIcDFmeVBNbzd5OEd1Sldy?=
 =?utf-8?B?Ny9CRi80ZjdiVDhnOExBM3M1NFR6VDBEK1A3dkJtb2Z5TGo5dmZ6TVVQVjN6?=
 =?utf-8?B?VmlwV2NtVEQ2TmZpS0NKR2Fzd2M4R05TRDBTZXRCazkwcUdXeWFCUUVXU0lI?=
 =?utf-8?B?MStEQnpWNEU4YkI2YTk5d0cwUVh4QTgrQ1J5YlBuenZWNDNaNERhZFMyclNR?=
 =?utf-8?B?czJSeDc1NXZYanhxRlFESjNFckJPZzVsUDdTMWV6TWlzcVIwY3pFZGM1MWhH?=
 =?utf-8?B?dTBBZmlRT1VvUkJpUU5CV1YwaWczS0pBemRoUmZhMWQ3Nmtka29pM2o1YWN2?=
 =?utf-8?B?ODVGWk9nVXZQQXFRZ2lRNlVuYkJhS2NhTkdUMWRXc1JCQXdFUkhTYUswSkNh?=
 =?utf-8?B?alc0aks0dW52aUo4TEFrU2JBcWM5NGxadVRvZXFiZTVLQkpLYWZWTFI4OG92?=
 =?utf-8?B?Skl0MlRoQnVBb213TVk2YXZ5YjdPejBIUTY2RE16blpGVVBZenNybVNhNzZl?=
 =?utf-8?Q?gQbtl4TL/0sCECiIE0BYGdkYXGkPbpZq+koFVp1bVZ7y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61fe9a1-ea0d-4a73-d1f1-08de2a4ee110
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 05:12:21.0405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3Ek9UzKlaQo1U10yQ07yx/IEauG6VQ3pziQRdFGXwKNmaEg6pVhCqt2CuiWES3PyRa2YT2XBCRyvXwYJlVWfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

This series contains a few fixups for the recently merged GSP
command-queue code, by order of importance:

- Some explicit padding required to safely implement `AsBytes` was
  missing in the bindings,
- A bug in the received message length calculation results in the
  message handler being given more data than it should, 
- `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
  bindings have not been updated for that,
- Some items in the bindings were referred to using the version module
  directly, instead of the alias we defined to limit the diff when we
  upgrade firmware versions.

All of them address "bugs" (with the first two fixing actual correctness
issues), but since Nova does not do much anyway, they are also not
absolutely critical and can wait -rc1 if we prefer to do so.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Add missing "Fixes:" tags.
- Link to v1: https://lore.kernel.org/r/20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com

---
Alexandre Courbot (4):
      gpu: nova-core: bindings: Add missing explicit padding
      gpu: nova-core: gsp: Fix length of received messages
      gpu: nova-core: bindings: Derive `MaybeZeroable`
      gpu: nova-core: gsp: Replace firmware version with "bindings" alias

 drivers/gpu/nova-core/gsp/cmdq.rs                 |  11 ++-
 drivers/gpu/nova-core/gsp/fw.rs                   |  67 +++++++-------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++----------
 4 files changed, 103 insertions(+), 91 deletions(-)
---
base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
change-id: 20251121-nova-fixes-dc9b4f17b90e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

