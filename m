Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A16AE070A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647310EA30;
	Thu, 19 Jun 2025 13:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YNK1YB9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190410EA47;
 Thu, 19 Jun 2025 13:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmRG3w7bl7DguQo8JUAssjEwhSq4ZMNOa7ttlzLRQ2M4CKfCoW4hYrpuhAzNEkW4JotA7ZemIwlfgEmHolt9wKApLqOb+/XefLXAuRey4upPFe5xYHv6jswzURUMysvVNCT4JvdBBmjb7YttJR/o35Z51xZBmU71TU8gYZA3r9+xLnJ/mhcqx/edTwrv4zNtLtPCqI8MCjahC7556skuNQTRGVOCdOr4J9uWPwoD8fB7yGrAiO11XgBXfHQ19ihkw1up0Ix4CvrdHhSNNcoQyLdoqsoYZAfHk4R4MuVlpVnOYhT3jVxFEWJc2mXaoAssv7iOpmFRFbqrwQrSLeEzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRjeMuVP4MSTGcQuXUwyjIthIfbNdUWy0l7Vne+gbew=;
 b=erNqF0ixU8tuKkBIPUUMzDG+zTH7mBTtTTFD+ptRLCIrFT9Zd4C9oGQuUwvGD7H09agi/45iTBnH21z7lD5AGZTI4zc2ZGJbkz27/KH6t6GCjZzAlxqNINKYWMs6QbKjl3k44aiQq0UYyNKgzHN7JixUxTCjb2ORfo0OH9tG9zn+GmRf77KXkv2yrL31yeewgnBTniOns2QbOAg1yWYrQ9hIgfsJfDI5tR+V+7Y/TdrvyV5/SQu3V9eb5823bRDm0c77M2S5pnnM2u5pfNHK529OZGJyoL5awB6G2561sOopMve7yUpQF+cTf/GpuGRjX65Hzl27yuvSjgyJnFZQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRjeMuVP4MSTGcQuXUwyjIthIfbNdUWy0l7Vne+gbew=;
 b=YNK1YB9wTb/0qizXbVnk2fHAkMTjKi41xZFnfa0wQQEUUeaGbB6O3zUdHpvD6BrJP5xUsKXQioLtaGmOCV4r7A0LARLkE4XHHNNEBMyq+F/Gh8u57Lzgitq7Sy3sPmIJQa7HI/DUg9RUNam3WV/8ILj9Yxk3QnRuPerz28bep6XNffhZ8lO8iUHPnRwJFzcIER8zrxUJjAYIiuj8T/rPcdjXGpFY5jcK5UGhl/Ao6qS+bZr7zVn0vjN8u10XkgKLr6YxEFsCeat2dAZ1654k6odrTudGxpD1l1AHwuTsPU4Rh+7PONppEwfecz0kY8Ej8Shb/ObsXXO20MCjiebwxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:25:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:56 +0900
Subject: [PATCH v6 12/24] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-12-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: c842ed01-e963-46d0-2a64-08ddaf34b64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUF4WTF3SEJ2QTg5ZWs2clpsNVpXWm5qK3BWOGl2QnoramRsV1c4T0wxRHhE?=
 =?utf-8?B?NnhPc2JjQ2hrVDJncDR0VjVOUU5zNW9PYW9JcDloZ3RkazVQc0lKeUt2QVJn?=
 =?utf-8?B?NzFUdk94bUMvS2VkaUgwOGJIMU9KNEhNN3hkSE5Bb3RuTktwQWFWYzZ5ZXk2?=
 =?utf-8?B?bXNCeFRVQjZNSjM1a1pGMFNoTTc1SGlyeXhjcEVIeXVhczhtOXBOaFlwWC9h?=
 =?utf-8?B?VjhBSVVJdlBGb0Q5REV3TURhTUFNT1pwRGd6Q2hnR3VqK3BLVU5IUUk3S1Jt?=
 =?utf-8?B?S0xlSUtCYzdXRU95SS9CaHdZN1A4dWRHREllSU9yNWNZTGVJUWdjcFA5R3Zr?=
 =?utf-8?B?L2EwZjNxbFUzVWFNNFpoV21mOTdHL3NqYXQ4VWtyTEE3YU8xcmhRdDNqS0gx?=
 =?utf-8?B?TXZ5TkRhdjBGQXQ5Yk40dWJkSEk2OHlRRmNoSUZRNi9MOHlTZjFXTDhHZ1p3?=
 =?utf-8?B?K1FoV1JEL0Zkdm44Z2RiSmJrZWRwVjhseG90cHd0RUo2cmtQZEdUMVRHT3hk?=
 =?utf-8?B?OE1qa3BRTVFzOGIwWExTbktkSlpMRmhGWHFsNzRlQnhnU1BsemVoRGxyWTRm?=
 =?utf-8?B?ZUpNZU05K29sY21JRXRZN05XRkhRbTZLZHoxak8ydFFqUHN4TytrQjl1RnZ5?=
 =?utf-8?B?Mll0d1dRcHo0Uis4YlhLV2tuWFhVaFJhMjRxZ08yKzM1WVVPVHRKNGt2bEJi?=
 =?utf-8?B?ckZvcmRGbGpyck81K0hYYzM3SGNXemNsVFJhdk8wLzdiQmp5SmozVyttNTZS?=
 =?utf-8?B?TlFuSUVNR0NreWhjTi9hMi8rZ3RaNURiamwyQlpVZGVDM1phRnNleVRTcTRr?=
 =?utf-8?B?UW1QbkVKZ2hKVEIvaDgxRnE2MFBsZGlZcXd2NTNrK253OURnZHZ3R1JqTjFu?=
 =?utf-8?B?b2svcEtjZm5LZCtrNUxEN0oyaDR3VitCeklzZUlDVFJsLytySkdveHBNQlB4?=
 =?utf-8?B?QVo1d3lPbXVqZVR1R2dkb1dqZ3ZxakdXQ0ZZOUlUVzFZeHNWUE8yYjU3Zzh3?=
 =?utf-8?B?aXhwY0lzZzFPWHJwTXBkTWNkVFZOc0ZHUW0zY1UyRU1CbVVwdURVcklUYWdR?=
 =?utf-8?B?M21hNlYvM1ZMT1N5MTZLMGI0RmJmYmNQNXN4b0tSVEhqbTJ4MXNKNnc3czZ1?=
 =?utf-8?B?K0ZEdlVXdDlNaGRFSERHMitjYkFHK2ZpL3BHdE9oNjRzRmNwZzhnWGdjZWll?=
 =?utf-8?B?Vlg3WHVCa1JHNHNFcC82dHZOKzYycll0RDRkcHFkcmFobkRUSTdiWUdKV1RK?=
 =?utf-8?B?YUpRd0JHMEljRkExUDVZdXlmM1NPYTRXU3R3dFNqVVhNMFNrU05KTlpZWHpq?=
 =?utf-8?B?cytMMVVYeG1QelhyUHNNRFU5em51dEY3N1pzNXRrTU1UWTc1K2RTVVNqWXRS?=
 =?utf-8?B?OStvc080MUlLak5OVkRxQ1JPdm45N0ozdVZyS21reGlnOVh4Q2YyWFBUMkdj?=
 =?utf-8?B?dFBCSzRLWjAwNmh4QW8xSjNaRlQ3WG9PK2twK2x5bGIyc21YR2NFY1dCemRI?=
 =?utf-8?B?MEZaN05oU0U1NG5vL2JIc1hudllxZXQrK3ZleEpaTElqaUZTdmZRMldwVEtB?=
 =?utf-8?B?cmkyZm9JS0U1b2pRaWpEWEdRUk4zdnB4LzB5MzJhTzBHVTJPRTZVNFNZVWdj?=
 =?utf-8?B?NmlvdC9TRi85S2hOVzFqSmNRaWV0clE0ZENiZUp1Y0pPb0p2ck4vSjdCZkFG?=
 =?utf-8?B?NER5UDRLSHJKTDltNnRDaTNRempRc0tjTENPQ2lhR0NpeTJGTTRQL2RxVEFI?=
 =?utf-8?B?ZHRtSmpDdkpMMVUrcSs0a2dnbm44QVZOMHlBc1VJZGpUSmp0QnNzQzZLcWtV?=
 =?utf-8?B?ZEMwQUk3NDk0S3hZMjNST3c4Nkw3VG5tQVJ6bDdGd3E3c2o1cDgxd214ZEQr?=
 =?utf-8?B?L0xHUEtPVHBVQ2wxMUZ4SmIyNGNzNFh5ZmlJeWs2Rm5mYUs4VnFkWnhEQW5s?=
 =?utf-8?B?amNoVHd6aWMwaTFYOE1RSkhMLzJBQzlLcFBQYmtNanhxTXdBb2VqNDFzc1Nw?=
 =?utf-8?B?QkUzQ0dTNit3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnBYVHRRSGFMR2t1aXBPa3lTemRFbG9WMVo1aXpUMjM3cW1IVldRTlVZV2h5?=
 =?utf-8?B?N1p0RFMzSG5GenBuTU5EWDdHYW5NTEtLWUQ4ODY3ZWliZGwzUmpHQkdYYUVa?=
 =?utf-8?B?aFE0eEVUMFZiUS9LOW5NMTBFSEFodEsxcVQrMHh6MXJxZ0RZYWdKYnBzWWln?=
 =?utf-8?B?US9IWUJES3lkRUQ1MlRCTjV6T2RxelcrSzlGclJvNWdGQWZMTVQvVE1hVjBs?=
 =?utf-8?B?U2lvbUUyamMzMHg3bGw4UzFtcnBvUlVhTnhGSzdSRVFkaVBoYXpGM2FKZFJO?=
 =?utf-8?B?blh5ejkrbXRFU1ZpbjlkeE91YisvKzdzU0tCNUxMN3lKNVc0WFlpUFR0d3VP?=
 =?utf-8?B?K2FsY1ZMYTN6d3ZMbnpPdFZaN2hZR25NTHRlZGxSbmQvZCtoTHRVd2pnbUc4?=
 =?utf-8?B?K3BxcEdaa2RiUk1zVWhOcDgvOWwvQzVpS2RXWXdWT2Z0M1plZ1MzVjlXT1Zv?=
 =?utf-8?B?MkdyRUlXUGo5MEZsUHpBWUxmR2dMaTFwK1psMHZkdmd1L1pYekRjckphRTY5?=
 =?utf-8?B?bXdYd09qak1vbkw5Q3JIOTE1Q1ZKOGdMb3pYL1JvSlBiNjhydHlpMDN3RStD?=
 =?utf-8?B?T0tPMGllbHJ4TVlTY0JRVCt0WlpRQkxvd2I5S3ZZTzA0KzZ3cWlUdUdPUzll?=
 =?utf-8?B?U2RNUU0zYzd1anB2SFpZQm1YUGdtMzBSK0gyUHllZDVrR0tNaHAyUWRKRjBQ?=
 =?utf-8?B?dFZuQ25BdHIwbks2Um5yd0xkb3hNbEFnUU84ZHJ1SVA2d25PcDVaVUI5NGJL?=
 =?utf-8?B?N3hYVVNySEhCcTYyTTQ3cjhBS2ZnTXlSc0JEV2pHai9lU2s2cGpzYzBYNVVQ?=
 =?utf-8?B?WlhDYkpyL0hocXQ4dmo2WnJjMnNRNVdTNFNCa3Z2UENZb25pV3p6NEs5SHd2?=
 =?utf-8?B?QlhjRlM1NTlyS2REL0pHcWFNcURCV3o4MkdlblVKYXdPc0F1ejB0UUZLK2VO?=
 =?utf-8?B?QTJoMm4zeXlXcGgzaGIzOHZzSUxWYWJzUUxqYmlSYWk2OFpyUFc3SlU1R1VW?=
 =?utf-8?B?ajVRT0ZMVXQ5WEVBNHpEYi9MVmZWYS9hMVVPSzdVd1k5MnppYUtYUnkwZnMx?=
 =?utf-8?B?bWZza2dMdjBvd2MxUU93QUdxUlhYT1Q0NWYyZ252MlU3dnlaYUREQ1dNMGFP?=
 =?utf-8?B?dVRZZ25QTXhQYmgyYmhiMEc4M2dSa0VJTWdmNVdQVnhOVWRLQStvVTVKbFJ6?=
 =?utf-8?B?am5Qay9nRnZCTHQvTHg4WWtoVHVTakpzUnhLQzhORFlUOHQ4c0hTdSsvYWhI?=
 =?utf-8?B?dWJ6QXNOaDJEejdmbEZNckNMVitYaGhPcHd4S1BtNEFmcnhKTmV6Z0lJMmlz?=
 =?utf-8?B?clRtazN3Nm9yZ0U5RnZnRXRxc0p0dDNnL0M3Z1RvYjBaOExYUW1DWHBQOUJW?=
 =?utf-8?B?cGVXNjhXeEorVHZxSkU1bFZQam4zOWtISjFRc0c1a0FuZkFGbmk5dFQvMUoy?=
 =?utf-8?B?ZDJqNWRhS3VMRjF2VXNEaUpTL010WTNaZFJNOVMrUmhVZ0NrRmlBOXhmTHFY?=
 =?utf-8?B?aGVhc2ZBSTNSZnpoRW1tdlVaQ1d4TlZodjBBaWJRa1BJMnptY0xZNmgzOHhZ?=
 =?utf-8?B?NTFCK0tvS0Y4b0VseGtUamJNV0JpM2c0K3VvNHRSV2xsWDlKRG1WTUFwRW5q?=
 =?utf-8?B?Uzh3SHljUXo2ZG9WMEFyczVoWjRnUnNHbkowc0UvZnM0cWFyTzhkT0tjOUc1?=
 =?utf-8?B?d0hNNVhtdEpKZ21RTmFNaTgzcUcvdisveUZ0ZlZDb3lBVldSR1VRd0h4SGpw?=
 =?utf-8?B?bUZrRXpjUElzT3h6Y0ZJZ3JhUjR4ZXc2QUJiZmdzbDV4cCtSTUhyNzZXMThx?=
 =?utf-8?B?WnA4MVdKUU1kSXlrNnlicmxteFdxQ0hQK2h0THBONncxWmpmS1hvYW95NEV4?=
 =?utf-8?B?endxNG5UMWhNaDdkUGNTMzZDS0pWY3RkaUFzdElYRER3ZUluaGFiQ29PbUtu?=
 =?utf-8?B?OUxDLzRRS0h5T0F4a3FoL1BFS2xMMWEzR0JqQW1rRDRBK1BZc1NMZjkzOUhY?=
 =?utf-8?B?QkZyRDBKZDdNUjBtMmttLzQzR2dSeGRkbFlKdjZsaVZrYlRVWGQ4S0N4U1Fr?=
 =?utf-8?B?Q1NnWURNY1Zpa0VBVys0aFIwRTZ0K3drODV4cDlhVGpETEN0ZWRTdlBaazlL?=
 =?utf-8?B?bDNyYS9rNDR2L1VkNXh5SEJYMW4rSU01VlZaQ2J5Tnc3NU1XQi9JTWw5Z3Bx?=
 =?utf-8?Q?vQNnjkx0AZmrgtX7u8ddAm6nXYzYZgYuPp680dnNBu2k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c842ed01-e963-46d0-2a64-08ddaf34b64e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:08.9386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Yib+u0r/DKtTaYBHJWA0IeokVHRKepdcUA+w9S+A1yfVcGqvBelM7xJ4Y8i2EeIRnPj9mlGUEb6oVcP4GI1dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Upon reset, the GPU executes the GFW (GPU Firmware) in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs       | 41 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 25 +++++++++++++++++++++++
 drivers/gpu/nova-core/util.rs      |  1 -
 5 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..fa3f642bc814c7eea1ce1f2c2e24e684d1ae5fda
--- /dev/null
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU Firmware (GFW) support.
+//!
+//! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
+//! the GPU is considered unusable until this step is completed, so we must wait on it before
+//! performing driver initialization.
+
+use core::time::Duration;
+
+use kernel::bindings;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+use crate::util;
+
+/// Wait until `GFW` (GPU Firmware) completes, or a 4 seconds timeout elapses.
+pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
+    // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
+    // reset, and should complete in less time than that.
+    util::wait_on(Duration::from_secs(4), || {
+        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
+        // status.
+        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+            .read_protection_level0()
+            && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
+
+        if gfw_booted {
+            Some(())
+        } else {
+            // Avoid busy-looping.
+            // SAFETY: msleep should be safe to call with any parameter.
+            // TODO: replace with [1] once it merges.
+            // [1] https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
+            unsafe { bindings::msleep(1) };
+
+            None
+        }
+    })
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60b86f3702842dc2c8b06f092250a5bad3b97bf4..e44ff6fa07147c6dd1515c2c6c0df927a2257c85 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::gfw;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -182,6 +183,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        gfw::wait_gfw_boot_completion(bar)
+            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 618632f0abcc8f5ef6945a04fc084acc4ecbf20b..c3fde3e132ea658888851137ab47fcb7b3637577 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod driver;
 mod firmware;
+mod gfw;
 mod gpu;
 mod regs;
 mod util;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5a12732303066f78b8ec5745096cef632ff3bfba..cba442da51181971f209b338249307c11ac481e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -37,3 +37,28 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             .and_then(Chipset::try_from)
     }
 }
+
+/* PGC6 */
+
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
+});
+
+// TODO: This is an array of registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
+    "Scratch group 05 register 0 used as GFW boot progress indicator" {
+        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+    }
+);
+
+impl NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT {
+    /// Returns `true` if GFW boot is completed.
+    pub(crate) fn completed(self) -> bool {
+        self.progress() == 0xff
+    }
+}
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index c50bfa5ab7fe385fae26c8909ae5984b96af618a..69f29238b25ed949b00def1b748df3ff7567d83c 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-#[expect(dead_code)]
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Instant::now();
 

-- 
2.49.0

