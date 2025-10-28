Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96933C1747C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F210E697;
	Tue, 28 Oct 2025 23:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IhJuob+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96810E697;
 Tue, 28 Oct 2025 23:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luGIY8YRQpHUBe4b21qaSDCL8KrIUgEjoY/R+QZT9suUZmcIXfJlzT2/loaKyKxM39eGFsGdU5JtQliiksQXFle8vA/uCx1qg9Aviz4WsxLpsWIZ5Dn9UyRQBMWALk8U6rQzW2k+RksFxmb9YFfZEsK2rCf0Prwq6yTZRIkYUl3jy7z6XhPRCUyuv3tMbq902OsCKEe8qnGMoRUYOCBtUeCJyXFL95QCDKwdQ7r/iU8j0f9g3ZVV7u4uSLqEvdEfRlLyQLDvP3aadQA2XD4O/vZL5KKQ6qxBwcO2CKl0rsbuJT4ZsP49HiEETwEIA8bXnjmiTX4mM1OpShOGxPdDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4miekismvEdDNixSLZxOivypIf2TRTgiVGrgJllsFA=;
 b=CM8iCjEqAi3iqEpFP0alnHnM3Ir3tHY2iA1K0Fo6ZjCl4xA/muZKeDoXfmzuGt58ut4yJQqXWgX/4pq6FKI6GBaa91F03wpmUpCaRcXRCEW51Uc68Igq8HndhHy0dhsPsFaGFBWciwwJ4ne7Oik2EFJ/OLvgMGVYy2T7e15pksXl3JUHGaYEqP7YXV8x9NgfbZl3E2ChwYXJHlqIdBmBe5eJ40Dy2AtXxGpBRUq5rxUx8FNUcK5HBcaAUJ9DUOtifpdUjImMgak0pQ6CtEimbpdI0ebqePyZsbJj2Z9QPKM/iIlNCdb1IPhfsZDaO9GxQitZOHLaTcmQ6uqM/FHNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4miekismvEdDNixSLZxOivypIf2TRTgiVGrgJllsFA=;
 b=IhJuob+PMN89e2n4FEvh15phnbxG24yCiuB9FRKhtv6SnvaQuRxXheTAjqcGZZ6oyM2PaFe+K1emccN/jyJeZRGDA25Yo3FI7eZBuI/1ChzCO0q1zJmPaILyCZVbdQZbVSaKiuNtjNYhRqu2PSXSOp5mWDwT1ah3axqonT8exMljzTeH3KHKHKO6W0qkS0rT1QLksEm0vsV0m8eHhx75TGlRzLPJ3+oeUA3WtzqW3ZIgYtUeDxAKpa5Aa+6BRzCz8qlKwKyVRa7LRP000+9Tan4IBbTQN/V5tZ3KQIA689SXvLsCy+6FOVbyQq3e+X1EDRaVEABG9jLy/mvUcddYvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/6] gpu: nova-core: remove use of `as` for integer
 conversions
Date: Wed, 29 Oct 2025 08:12:08 +0900
Message-Id: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhNAWkC/1XMTQ7CIBCG4as0sxYDI0LjynsYFyOgnYVgwBBN0
 7tLm/i3/CbzPiOUkDkU2HUj5FC5cIptbFYduIHiJQj2bQNK3CqJKGKqJKiIPriglcbeIkH7vuV
 w5sciHY5tD1zuKT8XuKr5+jbMx6hKSGGksw0x2qDfx8qeae3SFWak4m9ovyG2kNCcvPLSWNJ/4
 TRNL9ZEaJLYAAAA
X-Change-ID: 20251022-nova-as-8ece4142872a
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0210.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf4f493-e609-43fa-46e7-08de16776e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlJZT3Btb0MvTi9va01wNUlVdnpDUzdoTGNSemFhL3VzTXVSNG9XNjZpMWVZ?=
 =?utf-8?B?VGdmbXQ1eTU2dnZsS0toMGVCYWNIdDQvSTMvTkFCK0g4TkdsWjF3YWVIRits?=
 =?utf-8?B?VFp0YWJCcUlMRVN0M1YzRDE3NmpucktvbnJVUCt6TWxwSzJFakN2TzZKT2Rl?=
 =?utf-8?B?c2V3NFNKZ2hZWjVwZFQwaisyWEVrUlY2c2FNanRZZnZYYjFVeE1JcVdRYmVD?=
 =?utf-8?B?R0piSlljY2M0OXR2WTZTaTVhSTZjZGY0S3hGaEJlQ1JtWlR0MWVHWWQrOEUy?=
 =?utf-8?B?QnFTZGQ0aEtjU3BuVVVjWmd1djlndjBTamMwQ3E3Q1hEK2ovaGVGYTlBYldl?=
 =?utf-8?B?TGNsY2JCSGFBN1ZVeEJUUS9PQk5FOUE4UmVWRG0wcksvVi9QMWJFaldiN3ZY?=
 =?utf-8?B?dTQrYVZha0liblVOdS9nT2NqWE5NN3BpMEFHcXVVelJtMGVqZ3QxS0diWkox?=
 =?utf-8?B?WmxPYWpIZHN1dWRaVk9xVTR4MVAwWUFpK2R4R2hvUGtlTStjTGZBZWpJcktF?=
 =?utf-8?B?bnM5a2RCZ1EwTlQ5MUdmeVorRzFKTDIrcmwwUWViSTkrR2hNdEtaazljQmtJ?=
 =?utf-8?B?SGNUTGVPTXBIdlEwL0h0YisydHpIdGRFTlR6UCtlODUwaGcrdmlScTAyaXJC?=
 =?utf-8?B?MHFTdFZoaDJIZDk1WWVvN1Rzb1BWTWxXTm42bXhBUlpIQnNTQUQwR2hSb0Zv?=
 =?utf-8?B?bjhSdlV1TnZSZ0VtczllamdLbERydWxiZThHZENRY1NWVzlLQ1NsbVBORmtW?=
 =?utf-8?B?bWFVZUI2cU9jRFZmb0VxNEl5N3BjK0w4SlpjcXRvQzB3d2p3VmtwYTBGZTN3?=
 =?utf-8?B?UkcwSkhPYjZBZUQrakdPa3ZMS0tjMWVyUjl5cTFGL2dXT1l4bHlZWVNadmtT?=
 =?utf-8?B?U1RINEV5ZHd2OVVxUUtla3h6NENYNGhLcjNGa2lvNHVOQjVWVFQvTjVqZm1j?=
 =?utf-8?B?OWZHc1ZhZXFOYzQ0TkgyQjErUE5aQmpVWGxhZ3FIWnBldmExZWc2T0x0ZFVB?=
 =?utf-8?B?eXNlSWRIL05rdnFJVnNvNkNBc05PV1pzc2V5UXcxcEJyNEVxRVpsRGVkN0V0?=
 =?utf-8?B?bDVFZDBpMkdtK2NPbHorT0FoTE94ckszeDdTYWlVcml6MTBicjJoYUpuZHBE?=
 =?utf-8?B?UkhEeFhEdXhNZlZyTTkvTlpkdHZjK3VVMGdOaVBNRXBlWUtTUTRsQmVJNjZ6?=
 =?utf-8?B?MGdkbTRkdHZacXdFQlFyUlIydE5TNGRXemJ0QlR5RHpibjJ0Mk8xSG53emIx?=
 =?utf-8?B?UytOQkltbVQ5QlQ2MG90YmR4Mlh6M0FkNWhDQlJkZC9aQWhEOWhQd2hmTzZt?=
 =?utf-8?B?Z28rSTk4TzN0WGJEcS9hay9VVkZSSmNjU2xwV25rc2JCV3puNDRmR0FDeEky?=
 =?utf-8?B?d3JLbjFiaHBqTFl1WDNjdSs0czRMNXpZblY4MU8yKzNXak05SUJqTWxkVTlu?=
 =?utf-8?B?cjR6aXJXU2JoU1RWTk5NQUNxU3dCdEY1dWF1SE9PcUNma3kycmRXWmxjaEZX?=
 =?utf-8?B?UnJpRS9xeWNkcGZHRHFndkVsNlZ6RFBjQitWblhrUElYbjIvamtqZlBsdHBR?=
 =?utf-8?B?TDR2S3J3NldOTzJaakQyYmdVWGlIczBPbHJEWDVsUFhaRzFQSTVVRSsvOFIw?=
 =?utf-8?B?RmJnMTZzZjhxZkI0Ui9JS0pDOW5Ram1KbzRXS1hmNEo2Tk1YVEYvS0JxWUlV?=
 =?utf-8?B?Tm5VL2ZiTWZrYzhBMlFQN0Iwa2dHMDBMMjkxSHBjQ2ROVk5naHp5ZU1GTXpN?=
 =?utf-8?B?MDJWaDFIc0JlM1JzYUdnNlIrY2UzT1RwWkFJTHlGL3c5WXBHd0hGTU1GTjdE?=
 =?utf-8?B?cWkveWpNTktaVytJT3NabUJWcXJjdFcxZSthMHJFSmNiL3ZkVXgrUkZnZ3Vk?=
 =?utf-8?B?eVF6enpLcEZtOXFXajZ0bnR4c2gvaVg1Ym9Ram5mdUM3QmEyeE1zdnNBVVMy?=
 =?utf-8?B?dTlKNGxwcm5mN0l3emdkSTBYREE4c3RZelRxL01SVmFmeUtaR0N3RGx3Y0FS?=
 =?utf-8?B?b1ltaml0VUNhaUM0NlFxU3F2WUhKODh2Y1BFWUVvNmJoL3A2WThGckxDVkh2?=
 =?utf-8?Q?bZx7o1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V21ES3NMbDV0NllDakN2YTVVallSWUZTalZIRDY3TVhrRWh4YnpDRjVjMkdq?=
 =?utf-8?B?ZDFjOHFBRVZ4SU5MUUNXaW1JeFQ5c2NNdjZMZEliZ0JpRzV2a2N4M0JpeExY?=
 =?utf-8?B?blJzcGl4R3JxU2JiS0YxTE10RStTRFEyMDdhWmdSeE8xMjlyYUdpTlIvRGpx?=
 =?utf-8?B?eEkxVGpiaEVjMDJRTzczemZPMzhob3h6N1BiVzBFUXVCdXFZc2V0emIvNGlm?=
 =?utf-8?B?RGZFazROOXZsd2VHa2dhUWNOWWRmNldnc0VyMGxKU1dsU2tRa1QrTEl1Tjdq?=
 =?utf-8?B?K3hHZlA4QXpqT3dKSVVNOXpzQmRVaTN4cnNBUk5Eb3VucXpYOHVGall3a2Uz?=
 =?utf-8?B?cWpPOTBZYWY4d0ZCMEthZU5qVmFFN0ZLQ3dKQUdHMzVoT2JnaEY1TllWQ0Ix?=
 =?utf-8?B?LzJ3d2pJMmRsTi94NDZ2Uk43SS93akxBeW9mMi9zNENFYWl4NTF4Ylk2WHJs?=
 =?utf-8?B?cmRuVk1pd0l6TER1WGhPckpsMVhrTnh6NVp1VU9PakdtMlRMaTBFbVpiZ3Vn?=
 =?utf-8?B?YlFHYlh5VVZKYkhaeEFZeXVjY2t4MWh0V3NaNEVwOUxKQytoMTVQU0c5aDBR?=
 =?utf-8?B?S0h0OW9aWXR2cDdkVWRmZW1YOUMyZkt2QVc1ZzJ5bThFNjdJOCtPT1BwZ0py?=
 =?utf-8?B?dTFnTmRUaG02Y24xV1BYZmZ5U2wxOWs4T1V3RTJseWh5b0tnaEhKOTFudTNO?=
 =?utf-8?B?OFU2dWlhY01pd0cvNXVWVTlmVS9MKzFESFYxK1BOeSsyTW5Fckg1SWc2eXRo?=
 =?utf-8?B?V3pZU1p0aUV5S0FuYWNvOEE5bExsMVZOU2R2ZUhSRnlzaXpMdkpXWnZKUUZ1?=
 =?utf-8?B?QitMTWlnWURHMTFKbGVYM3VScDFQQkpIMmpOMzhvYWlNaUJWTmY2azF2WlBU?=
 =?utf-8?B?aUJWcDhzSnJkUWtRRU1EQzRaZTBWZ0pwUW1DVnBGcUM4dStsdmc0cTlaNVln?=
 =?utf-8?B?Ym5yd09KMXVGWlR4TExEZUNBOXRXaUltdDZ4WmFLc3pWYzBZZzZ6RHdZMFky?=
 =?utf-8?B?ZmMvOHpRYkgrWW4waHl6NmgyTXlVcVFyd0s4a1ZBWElkQ2xzemJSemk5emRX?=
 =?utf-8?B?Z2RTaCtvczdBcnIzVzFoY01XZFAzUHZQQklZUXdxZFlTUk9qdWJ4Vmx5ZHNR?=
 =?utf-8?B?RlBBQUFrZWJ2UmZiL0l3NmhRbXBHK2hWd1NMVHBmTVkyY1IrMmdNbGtISGtJ?=
 =?utf-8?B?QUNCYk1yenAvNGlUMmpHTkw5QURhdUs1c3BhOWRCTUdqU2NUM0NYbmMraUJa?=
 =?utf-8?B?anZYeEtYRHFIdlJ3NUxlRTBBdVh2TC83amxmMWNXd1lSekJmYTMvS1VvMitq?=
 =?utf-8?B?cGFvcVo0amNLOEZFKzZ3RlhjVTBGQW5GNTBybWViM0xkaFpTbnA3b01ocXcx?=
 =?utf-8?B?eXNmSWNmelF3YTlWL3Z6Y0E4WXh4blJVOFJ2UDZUeWxlRVNzYmJ4RDZyOVJW?=
 =?utf-8?B?YTdVR3hEN1d0WjBNTVE3MGpLSWhnSUpPSnBBQ2xrcjcxZmMwcE1yZElYdUE2?=
 =?utf-8?B?dWMxdVNOVW1pQzhOQWloOTlmK3ZZQ1ZLTjNhazl6WEZxbmtnS09IdnFZaDRV?=
 =?utf-8?B?a1RiQStoUWdHYlZDUEVOUWF3emtNNjlNVStJaFV1RlEzaXJVS044TkljYW41?=
 =?utf-8?B?QmJLVVM1VzJpRXBxaUIrbEZUUW1abE56OFV0R0U1SmM1cW9ib0tiUHlpVU9M?=
 =?utf-8?B?dFJvTUNEcmJFS1hZTGo2NytYSFRjQXg5bjdnRDJ0eGcvbnlONi8xak1yd1pr?=
 =?utf-8?B?akp1YXExMVNwYXd2UnJCQ1FVRGFmODREc05VYUpiMzZ5cGhid0k0ZVpSVmVp?=
 =?utf-8?B?MU90MVdKWUFQSVZvMTJMKy93dzVlSG9vN2ZYZXhzdXBaUjVUWmVla25SMWR0?=
 =?utf-8?B?aEJVKzVaaTlGaFBKZS9sMEdTWURlR2RvbUxub0lKNkNZQWhiMWZkQTFkejdJ?=
 =?utf-8?B?OWFIZjJhVUJ4UjJaaHdJTHFQc2I3djlWNS81aTZPZUd6cHF6bHcwOG1WN1lv?=
 =?utf-8?B?NFRlRnEwWGxHVWpJem1tQVdSVXZlWGRFRXRWK2MzMGFMZiszS000UFJyc1JZ?=
 =?utf-8?B?RktEUDlkUVdKWXpHYWdFZUZXMUZhTlZ5djg2bFpGbk95RmJYUVZncExWbXlo?=
 =?utf-8?B?eE0rRWY0cUFFVFJ3VVg2N1RuTXMxQmpkM1hKOFN2VEpSSUEzUjgzZllxeFFF?=
 =?utf-8?Q?P0P7R+2QMmomRwQ78Iq6TAynGsokoOPIGCmmICWR+7bx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf4f493-e609-43fa-46e7-08de16776e10
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:13.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2/YNTTtqLWQr9SoQCzCGzZGR+VHTdiBpmVcddg+uuN/VfYjX3lCOXPocbXtGigwsdQaB47zhBkQ3SxgLQnEEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

Using the `as` operator for integer conversions is discouraged, as it
silently strips data if the destination type is smaller than the source.
Many such conversions can be replaced with `from`/`into` or (when
justified) `try_from`/`try_into`, but these traits cannot unfortunately
cover all conversions satisfyingly.

There is for instance the case of converting a `usize` to `u64`, which,
in the case of the kernel today, is completely lossless but cannot be
done because the Rust standard library does not provide a `From`
implementation for conversions that are not future-proof.

Still, in the kernel it is very practical to be able to perform such
conversions when they are safe to do for the current build target.

This patchset tries to eradicate the use of `as` in nova-core, by using
existing means and introducing new ones.

The first 4 patches use the already-available `From` and `TryFrom` trait
where it is possible or advisable.

The fifth patch introduces a new module that proposes conversion
functions for those that are infallible under the current build target.
This is done through a set of const functions, and the `FromSafeCast`
and `IntoSafeCast` extension traits which, as their names lightly
suggest, offer conversion for those types on which the `as` operator can
be used losslessly.

This new module is put to use in the sixth patch.

The idea was first suggested by Danilo.

As Danilo suggested, this could eventually find its place in the kernel
crate if the implementation is deemed to be fit, but for now let's
review and let it mature in nova-core.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Rename `FromAs`/`IntoAs` to `FromSafeCast`/`IntoSafeCast` (thanks
  Gemini!).
- Remove unused import.
- Fix build error on second patch.
- Fix build with Rust 1.78.
- Use `image_type` instead of u8 comparisons for `BiosImageType`.
- Rename generating macro to `impl_safe_as`.
- Make the const functions `inline(always)`.
- Link to v2: https://lore.kernel.org/r/20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com

Changes in v2:
- Use macro to generate const conversion functions.
- Use `CAST:` comments to justify remaining `as` conversions.
- Add more conditional compilation guards.
- Link to v1: https://lore.kernel.org/r/20251026-nova-as-v1-0-60c78726462d@nvidia.com

---
Alexandre Courbot (6):
      gpu: nova-core: replace `as` with `from` conversions where possible
      gpu: nova-core: vbios: do not use `as` when comparing BiosImageType
      gpu: nova-core: use `try_from` instead of `as` for u32 conversions
      gpu: nova-core: add functions and traits for lossless integer conversions
      gpu: nova-core: replace use of `as` with functions from `num`
      gpu: nova-core: justify remaining uses of `as`

 drivers/gpu/nova-core/falcon.rs           |   9 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   6 +-
 drivers/gpu/nova-core/fb.rs               |   7 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   4 +
 drivers/gpu/nova-core/fb/hal/tu102.rs     |  16 ++-
 drivers/gpu/nova-core/firmware.rs         |   7 +-
 drivers/gpu/nova-core/firmware/booter.rs  |  34 ++++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  25 +++--
 drivers/gpu/nova-core/firmware/gsp.rs     |   6 +-
 drivers/gpu/nova-core/firmware/riscv.rs   |   7 +-
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/num.rs              | 163 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             |   5 +-
 drivers/gpu/nova-core/vbios.rs            |  56 +++++-----
 14 files changed, 265 insertions(+), 81 deletions(-)
---
base-commit: ca16b15e78f4dee1631c0a68693f5e7d9b3bb3ec
change-id: 20251022-nova-as-8ece4142872a

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

