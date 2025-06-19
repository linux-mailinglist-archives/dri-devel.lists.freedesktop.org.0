Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7FAE071E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBE910EA5D;
	Thu, 19 Jun 2025 13:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OTFbH+do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DABD10EA54;
 Thu, 19 Jun 2025 13:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tgnghu1gJz3hL9lXR+mBlmV833oh3VRdQKfq6La1zl7Ou8eHIKO/M+5ITq44pUF/AgNupakU/sGSbt6R57gKEH8oWqLt7vIPz8zvMCKTziDZwmHkkDfXOW6fbgHF+o0tu2D5uqnEsxF27C64ff/HkV4rdudyA1VL6kke5A7wgsxL3QME1T+5GDCudfFmslM19oHhlB0I5wub3cNuwZvr7Ibe5rjdpiBXRykWEtBLloJgXPFY2nu05bMnhmBdXV0CzshUw3Fe0rNh6jepylyAM1pXnKNj/f8QwH9uQ/AlLMQdcq5NCjft3I+uSUgoynL/EduOVznJSn3hQqFyeI1nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWjjHk9m5eR4xURuAy5XVvaxuditHZL06vbD2JM0H4Q=;
 b=gmHP3t/1MuhNoZljK9g1gu8dYxLHDP2uB3OGb5AC1//BNcLeCkNvujKxXrsUWGNLlEJAXkADPDHXQv1pOeT+PvSWH0vzTWEUOi9zRf6t6fur2d0lAdm7IDp5y9qqxG2uSbRimHj7s5JZQfyBcsGjZvyZMKFukjxFiS+1Adq7DQUw17ceJsJeJ9nj94b97/pgS2jCV3PLwFJE0/HnWT+qEopwUn5fPE7V8PBGy42QeZSyamfCU3mOgi2H3Y56211mmCV0mlH9k2kO4cZDhJfKWYdFfjJaYcY6OzJS+/sgaWufBmSCkJnSiruoKoL0WiX0A0fM2HzPPLGSoZEpOT166w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWjjHk9m5eR4xURuAy5XVvaxuditHZL06vbD2JM0H4Q=;
 b=OTFbH+dow7y2LfhLsZFwuHcZnRgqOUQfj6rxmnGB3HXHbboHFLjUb1Ffs3E2TbA1HL1lqvM5UR6xTgpm17A7na0qYUXxfY3nCtE4qYlGSzynvrmBb1Q0E9AlV3+6zudYoD1A80OWLUYf0TMPZBLe5EKIh3S8NlbxSJOr6iy/PWbjNN3mNwY6+8Wg78+2JeEwZr07NxIxY8+gMGDaD2iORoe+XN/UHPrY3Kqzr5q8x3EtbAucf1IbJaSozIYYswxRm/BFUlPk18Lur1T7o0kCbBYvIIPA3OwzthdCrvuzkDubeCr/LC+4gfeJ6HEY5g6XbmEN5eZXvbNcAmScTbhHIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:04 +0900
Subject: [PATCH v6 20/24] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-20-ecf41ef99252@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 348c7382-a3ff-48ed-78fc-08ddaf34c582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3VQZWtMMmlhMVREdE5iUVcvaWFOaEcrUVZraFNpbGlqQmxTVUZCRjdhOWNw?=
 =?utf-8?B?b3YxN0t6a2FRczNSazQ5MnIzb2lENnZ2d2pCMjdPbUplSkRMdE1qTG1ta2dE?=
 =?utf-8?B?TkNSeGVtUGc3QmxDdmViRHFMYzRNVEY0OVpLNUpIdEVJTFcvSlAyV013QkZh?=
 =?utf-8?B?NUhWMlJqbzFRbkJPTnN0cCtweUlyd0gyblZvN25IZ1g1NWRVTUxETTJYbWNT?=
 =?utf-8?B?V0h5M1djdVhoS094aU1BS0lMWnp0Z0tOcTdTSys0SkM1M1dnclg3aWY4VkNI?=
 =?utf-8?B?T0lIKzJLMWJ6SlNlMmgyYWFlZDY1d285d2FJRGd4dVlSa21tYnQ0MkNyU2ZN?=
 =?utf-8?B?UERMTkhzMTU1Ni9pR3R4Q1MvL2t4NjNiLzY4K0lINEdob3RiQXlHN3Fvekl6?=
 =?utf-8?B?V3BWUk5xTWVTSktaZG9USnUxRC9iLzVCNzNXaEtYRnhBc3k2ZFh6YXc0Ny8v?=
 =?utf-8?B?NEVjYVdEMWZnRnBRb3pPR1lnQ1FPazc2aEx3TkVYZWhIQ1Z5K0huQVpKaVJN?=
 =?utf-8?B?d3ZScjVzY3NXbGY4dS9KWlJ0enY2dGhFLzY5WjNKcld1Z2VoZGtmK29mVjNs?=
 =?utf-8?B?L01QbUcwUkpMSFpOczBMNng0cS9lZUhRSTNLQmtiek8rcndJa1JzZzRIa3lQ?=
 =?utf-8?B?NFcrZlh5N0l1c0xNTHloZkM5RjJGU25CNTlWNFNheU82cWJSNGVyd0tUbVFL?=
 =?utf-8?B?U0FkVTBtcWRDSGwyWkNVMk1nWEdyU0VSWmU1ZjNvajBNVWdFY1ZRWUY1MUgx?=
 =?utf-8?B?N0lTWjBmbExCWE9BeW1ISFNSVW4yazI3ZFdSOTlpK1J5cmlWL2YzUThrRDNv?=
 =?utf-8?B?K3Z5SW1DS25QWG5Hd1BydWRKM2RjTWpHVk1peksvVFlHdHNHaFU3QUVIMExj?=
 =?utf-8?B?QVFCcHNzUHBQallVNHBTRjVxZk5ueFVkMFhMUlJnckxFK21sbGZLdGt3R0pW?=
 =?utf-8?B?KzFWZVg3WVYwWlNCdWlWQmVJL1c5cmt3dkRibkJKUHJPcVdFeFNnRjdVVzJ1?=
 =?utf-8?B?cVlxTXRwZk1tWUo3Q1VSM3BSRFV6dWt2bGVhVjZmVGN1alJsSjV6YWxDSDZE?=
 =?utf-8?B?Uk5QQnBDdUxHTzZEb0xwMW1ENWYzRFlvdmJ2VE1SRHo1RVZ6dUVGa25ZcFRW?=
 =?utf-8?B?enZCNjdkTTNYUWRyeCtIV3JmYnY3Y0pydFpDTmNkaHBERE9yclU1RlFDRm5K?=
 =?utf-8?B?dGpTaUZnT05zVXJYdG1oc1hsMEdJbkEwY0RXL0l0WVRFWVV6S3VHZnQ3Q004?=
 =?utf-8?B?NEdQQ25CK0NXMjdRSDYzSWw4WVZJbU1YQVRXczg4aU1VUTlTU3JsT1kxcHh3?=
 =?utf-8?B?N3hOeFF3MUtWK1RnNUVRbVd5UHd6ZEc2cy9uMmlZQ2FYVlZmcnNDMW9uUmNF?=
 =?utf-8?B?VW1GL2FOcEZDeERmVGoySUROUnRrTTk1Ri9CdythTXp3WlFQSGk1RU9JZjNK?=
 =?utf-8?B?czRRWXVGU3NDWkUxcVpUV3RzZUVFK1VrajE4d3pleWJreXB3WnJHckxGRjJz?=
 =?utf-8?B?YTcvUDBhUTRmR0poMG1vU0t0cW9kSUhxTWY3MXBvbnV5QkpnQVhEaGpTVmNR?=
 =?utf-8?B?UG1aY2dFRXp3cmNYaW8wMmw0ZDJNanJaeTd2S3dReTVST2V6VDNveGJhaXdq?=
 =?utf-8?B?RGFxNndrR05tUmdpWW5aSHpqSWl4ODdzM3Y1bllOOVVlOUFFUndBNDRHMGs3?=
 =?utf-8?B?cGNVbVMrTVYzbUpCZnNJbnM4V1hNeFZRaVlRSUJRL2NUcDY5M0QreUJhMldo?=
 =?utf-8?Q?xlYjb+UW5H7ZwyL+dYEeWUZqecXpXWTvPVHsUF8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkptUld4STV1TnJPSDZiYzJ5ZUoxWExuQ0svWXFEVVF4NytwNXlXS3FqVERa?=
 =?utf-8?B?eU5zRXh3anhQcGhDK1o0UUNicXphbHlRTkZpWDFkSmZ1RC9semVHY2grUFZl?=
 =?utf-8?B?NVRrYytIdFBXMjkzbDJWL2Y5ZG9sMEdoWWwzYXN2NDZRaExkUURVd0t1ZStD?=
 =?utf-8?B?UzRVclpxL1ArTEsxWDBPelAzcHdQc2Frb3d2MTFTZWZ2Mk1WbFoxV1Y0VkRC?=
 =?utf-8?B?LzZZM3B4akl4eFVodHZYS0VVenY2cUlIWlpMM1BmU3BlN0FHYVhhSWlWQTBL?=
 =?utf-8?B?OVJVUjBaSjNQQS80Umd2VWpZTjVsN0pwbGZ5OHNmMkQxOGR2ckNNRW1sMEIx?=
 =?utf-8?B?NUlCdCtYWFlQa0xTa1J5VHFjSmdMdkNJTEQvb2pGUWtIcGk0bDk4ekJwdFhz?=
 =?utf-8?B?ZGludytYcXZza0dJek1JOHNpZ01vYVNkVHpUMkpHaWtqUENuVnZ5UnBGQ3RC?=
 =?utf-8?B?YTVKeUdqRVFLcGdjWTZHQ2NQWUJWdk5VV1hneVFOWjJlZis1K0NZVmVuN21s?=
 =?utf-8?B?RmxnWGVXekgxdkMyQzduWm1ramVtTFo4UGorRHRPM0EyWVlyaUUxZDRCVEQx?=
 =?utf-8?B?RTltOE1tSzdUeS9zNkhmN1FZSjVHQWw4T3pWWWVDZzNrUEdhaDRCN2FkRElE?=
 =?utf-8?B?aDJocWlNN1RSZzRmcDVDeGcraGZ0M2hEQjhPVkNadzNWQ0ZsbnoyRTRxR0NH?=
 =?utf-8?B?NkNjeWs5Vlo0d0lMdXJmbEIzbSs3RSsxT1dNaXRBelNVdlJmWElPcTFUbDJn?=
 =?utf-8?B?ajRxd0Rld2lwZVlkREtkQmorNVRlUXlGWjZFOVVFYjdjbmhsL25CSStXWldD?=
 =?utf-8?B?M3dSaW5paFROVGd2R2IzSndSaVdjUXpWTndYUnNQSFEwU1oyenVDM0RORjRx?=
 =?utf-8?B?TkJBTG80dzdpREdqQTZsUFQ4U1ROT3JzdnJ5V2VyOUJBeVhLc2hYbWtpN2tE?=
 =?utf-8?B?ZkJHYTcydExyWEMza2VKWnNZV1h4WTVoekp6VzNseFcwcVNxbTQ1NGErVUNT?=
 =?utf-8?B?bzFsc2MxR0tZRFpZeHphQ3laNEFTK0VCUVgxOXVuS1F3d0pKTWpyNjB6NWpC?=
 =?utf-8?B?U0pFaFZ2TjdaNTBVc2MxbktyRGxKSTV1SE1qcW9aUVErd1NDbGR2ODgxSmhM?=
 =?utf-8?B?SXY4U1UzbTRsT0ZaSDg0QWFvLzlMUFp2VXFObElrTGhPendYRG5vVHgzaC9E?=
 =?utf-8?B?dm9ocjNEdlhzSjdLZmwvQTVtMFU4SVA4RFJxRFZCaFBXK1g1eDF0dCtzN3Vr?=
 =?utf-8?B?Y0dVd1pzUW5aYzV2d3NCYkxndUVYaXFGS2JLOHZUT0x1MUMwakRNZFAwamRp?=
 =?utf-8?B?a3BZOWEzU1BuYjFKVnJseTlvRUVBUXJhR0UwOFphelIwa0ZVTFVIWVQ0RVFK?=
 =?utf-8?B?VFFsVjFDTHB3SkFwWXl0aWVWZjQrV1pydllYY0ZySk94b3o3c0t5SHJmOXBV?=
 =?utf-8?B?MWliWlFzRmpNbXJsNmlzbGRrMGNhM2hTeHJqd0k3a3NCYXFGb0lWQ1kvRWpu?=
 =?utf-8?B?VmgyYVZpU2NoQzFxQytVUCtZbCtaUHdkbnM1QWpta2ZuUk5MaWJBN3FQVTF1?=
 =?utf-8?B?eXRoOTJmbXd4ZW5JcWJScE9rSnNQYkwzcnR3cDAwZ0xnVUllakVlN3BmcWsz?=
 =?utf-8?B?KzFSVTRqTFBhdjBhS3dSWWhnZ3pGNG1jVlgxOWc0R0ljcnNEdDFDSlFyUlNa?=
 =?utf-8?B?L0ZQR2dRMEpPUGJWNkYrNzVUNlVHcU5xUXFidnhHTU1CTG1iNjN6Rzl0Q2Za?=
 =?utf-8?B?VWJEaUJ4REJUMU1HY1BnY096eDU5ZzB2OU5GUlZJQjVjVVNVTVd6TXhodnhE?=
 =?utf-8?B?M01YZTROOHhrVDZrTkVqZlYreFF0TENXNlB5Tm5pNG5LVFNTSjg0andwVnRT?=
 =?utf-8?B?YVE5dUlhSGFMTWxuVjR2T1hBQnhnWlpESnlUZ2hsS3UxVGhIR0RiNDNnVEJl?=
 =?utf-8?B?MndyMTVxMm5iRnVUZkJtaWk0b0RTU1RIdkkyZUpVa0J6Wi9BTGEwc0oxS0Rl?=
 =?utf-8?B?Tko3OTJPSVo5Rk5UcUtUYWdUK0NHQm5iVXJyNUx0K2l1WGF2Zm5wNHhlUGhR?=
 =?utf-8?B?SjlOelEyOTdtU0JGVE9va2hSWHh1MHhFVTFpWk1VOU8wbDBKMUtVSlZNNGlX?=
 =?utf-8?B?ZmM1RFRmUFozMFdGNTlLZnpVNVFIeDBKOXVsajdLQWNFd2h6anlFK3lNQ2Fp?=
 =?utf-8?Q?34i+x2CpwtUMImhw09nYPI6Cvr+SfKZoWBQqkz2mxVjq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348c7382-a3ff-48ed-78fc-08ddaf34c582
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:34.5035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Irri7uLKo/199q9uUvGyT48kTYiXwpwYxdFSRAnhIa86n+oid3jndRTHgIi78V+rLyqonP/akmAjRce/+RydA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 70 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal.rs       | 12 +++++-
 drivers/gpu/nova-core/fb/hal/ga100.rs | 12 ++++++
 drivers/gpu/nova-core/fb/hal/ga102.rs | 36 +++++++++++++++++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 16 ++++++++
 drivers/gpu/nova-core/gpu.rs          |  4 ++
 drivers/gpu/nova-core/regs.rs         | 76 +++++++++++++++++++++++++++++++++++
 7 files changed, 224 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 308cd76edfee5a2e8a4cd979c20da2ce51cb16a5..dc009a3ed44c2de7ffeb8cc0be06a72cf2ca5309 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,12 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::ops::Range;
+
 use kernel::prelude::*;
+use kernel::sizes::*;
 use kernel::types::ARef;
 use kernel::{dev_warn, device};
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::regs;
 
 mod hal;
 
@@ -64,3 +68,69 @@ pub(crate) fn unregister(self, bar: &Bar0) {
         }
     }
 }
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[expect(dead_code)]
+pub(crate) struct FbLayout {
+    pub(crate) fb: Range<u64>,
+    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) frts: Range<u64>,
+}
+
+impl FbLayout {
+    /// Computes the FB layout.
+    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+        let hal = hal::fb_hal(chipset);
+
+        let fb = {
+            let fb_size = hal.vidmem_size(bar);
+
+            0..fb_size
+        };
+
+        let vga_workspace = {
+            let vga_base = {
+                const NV_PRAMIN_SIZE: u64 = SZ_1M as u64;
+                let base = fb.end - NV_PRAMIN_SIZE;
+
+                if hal.supports_display(bar) {
+                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
+                        Some(addr) => {
+                            if addr < base {
+                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K as u64;
+
+                                // Point workspace address to end of framebuffer.
+                                fb.end - VBIOS_WORKSPACE_SIZE
+                            } else {
+                                addr
+                            }
+                        }
+                        None => base,
+                    }
+                } else {
+                    base
+                }
+            };
+
+            vga_base..fb.end
+        };
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
+            const FRTS_SIZE: u64 = SZ_1M as u64;
+            // TODO: replace with `align_down` once it lands.
+            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            frts,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 23eab57eec9f524e066d3324eb7f5f2bf78481d2..2f914948bb9a9842fd00a4c6381420b74de81c3f 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -6,6 +6,7 @@
 use crate::gpu::Chipset;
 
 mod ga100;
+mod ga102;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -16,6 +17,12 @@ pub(crate) trait FbHal {
     ///
     /// This might fail if the address is too large for the receiving register.
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
+
+    /// Returns `true` is display is supported.
+    fn supports_display(&self, bar: &Bar0) -> bool;
+
+    /// Returns the VRAM size, in bytes.
+    fn vidmem_size(&self, bar: &Bar0) -> u64;
 }
 
 /// Returns the HAL corresponding to `chipset`.
@@ -24,8 +31,9 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
 
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 | GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga100::GA100_HAL
+        GA100 => ga100::GA100_HAL,
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+            ga102::GA102_HAL
         }
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 7c10436c1c590d9b767c399b69370697fdf8d239..4827721c9860649601b274c3986470096e1fe9bc 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -25,6 +25,10 @@ pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
         .write(bar);
 }
 
+pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
+    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
 /// Shift applied to the sysmem address before it is written into
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`,
 const FLUSH_SYSMEM_ADDR_SHIFT_HI: u32 = 40;
@@ -39,6 +43,14 @@ fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
 
         Ok(())
     }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::tu102::vidmem_size_gp102(bar)
+    }
 }
 
 const GA100: Ga100 = Ga100;
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a73b77e3971513d088211a97ad8e50b00a9131f7
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::fb::hal::FbHal;
+use crate::regs;
+
+fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+    regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
+}
+
+struct Ga102;
+
+impl FbHal for Ga102 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_ga102(bar)
+    }
+}
+
+const GA102: Ga102 = Ga102;
+pub(super) const GA102_HAL: &dyn FbHal = &GA102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index 048859f9fd9d6cfb630da0a8c3513becf3ab62d6..6f8ae58e9481017f1a81fb8e75fb24782e50a781 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -26,6 +26,14 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     }
 }
 
+pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
+    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+}
+
+pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
+    regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -36,6 +44,14 @@ fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
         write_sysmem_flush_page_gm107(bar, addr)
     }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        display_enabled_gm107(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        vidmem_size_gp102(bar)
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1c577d3eff8b32bbc45d7d2302c3e2246bef3b44..413f1ab85b37926cdfd9a9c76167816b21d89adc 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::fb::FbLayout;
 use crate::fb::SysmemFlush;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
@@ -219,6 +220,9 @@ pub(crate) fn new(
 
         let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         // Will be used in a later patch when fwsec firmware is needed.
         let _bios = Vbios::new(pdev, bar)?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index a2f449eb08b5691aaa6f2f0e7635791838996806..8ca7bcb5a93f4b60ee9ee488f26469af48e2f1d8 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -52,6 +52,27 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     23:0    adr_63_40 as u32;
 });
 
+register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale as u8;
+    9:4     lower_mag as u8;
+    30:30   ecc_mode_enabled as bool;
+});
+
+impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        let size = ((self.lower_mag() as u64) << (self.lower_scale() as u64))
+            * kernel::sizes::SZ_1M as u64;
+
+        if self.ecc_mode_enabled() {
+            // Remove the amount of memory reserved for ECC (one per 16 units).
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
@@ -77,6 +98,42 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
+    "Scratch group 42 register used as framebuffer size" {
+        31:0    value as u32, "Usable framebuffer size, in megabytes";
+    }
+);
+
+impl NV_USABLE_FB_SIZE_IN_MB {
+    /// Returns the usable framebuffer size, in bytes.
+    pub(crate) fn usable_fb_size(self) -> u64 {
+        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+    }
+}
+
+/* PDISP */
+
+register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid as bool, "Set if the `addr` field is valid";
+    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
+});
+
+impl NV_PDISP_VGA_WORKSPACE_BASE {
+    /// Returns the base address of the VGA workspace, or `None` if none exists.
+    pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
+        if self.status_valid() {
+            Some((self.addr() as u64) << 16)
+        } else {
+            None
+        }
+    }
+}
+
 /* FUSE */
 
 register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
@@ -218,3 +275,22 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
 });
+
+// The modules below provide registers that are not identical on all supported chips. They should
+// only be used in HAL modules.
+
+pub(crate) mod gm107 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+        0:0     display_disabled as bool;
+    });
+}
+
+pub(crate) mod ga100 {
+    /* FUSE */
+
+    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+        0:0     display_disabled as bool;
+    });
+}

-- 
2.49.0

