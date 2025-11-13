Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5024BC553EE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7310E7C9;
	Thu, 13 Nov 2025 01:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gHbiHjyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0510E04E;
 Thu, 13 Nov 2025 01:24:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIBDwBAS8wbMfaydsjXVmF9kg2b6wBy8gTrYbpoGIAF/MqnrvGCBORTfbjdkYfiZ+gkQ7C3MOmfF361ni+k4vLiaqV1csZjC8DaxJ8qi06CV/b0YgTsT6ahcDglh03lIpXZ/fuYU5DMwdj9OiqiLklk7IScE5qkgZYbD562VpLCuWfqa1G/IWwgl8liZW0R0dVHqylnWp/CbL37jkh0yRGstjL0dGcyg3aSrOpSAzXUDZU4uedJDRovLYTl0eBFBbYxLMNO3fWWHBjgAur6d5GsnhOIX69LyNUuC8YPmi3vY8AWTF1Rzf/rttv12vMt25qMKKXZSS4lGtBRPJ8qsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzytIy8w3xjFn2qFJL6PVEcsoYW1Ki8reB6KfQFiQCA=;
 b=WWIAYD7ChTgLvSiFdumSu72gj+2OOLBU8WSHmxkOudlQ06kAjT+U17ZJgBYrMxghrq2XN7fOhH2g+gv1dXMBkCvArlzllYFFj8uNKe79+3pPlohUFLc1JEwRhe1zqwQlAbzierzu7/vqf0uGX5T6OjK7IBUst2m+Cdu5CO9ek57PaWDAISaJO9GyBJivI5J+f0eJChfQ1UczxjkcyXVh+EgyPzXTYZ+3ShMMvdR9oifzCgLAxMDxFkYZ2eTk8fFz4/wfCwMEdfjasWAAb6i3hNWg9TsYwW7zo6Neiwp/nSte5prBBFX6hpbqc7kvN8/NZSWafwDdwDuRfPrD+tVm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzytIy8w3xjFn2qFJL6PVEcsoYW1Ki8reB6KfQFiQCA=;
 b=gHbiHjyYqlCcmJ/veo2ONAZbgJZI0A87vDyzXO34bmh/Hgy4rAhymjKbbrC4I8cHlJcKIqfsw6bkV/syypUKPRYxv1SFepbbdVGe/ok6HGbxgCqxhmfuBPHqL0YdquFlip0AASsQ6uu+SB5PjCf33tFn19yIRK0QfcBEyH+0PBvQG9SGMIjSS8JQHPUAJZVuV+1D5RZ1XcZ6HM8shwpk68TEWdg4TPt79NGzwI4fyzTLXgdhWis9hcCESJtzx/HP7tH60XYfpVM9OWOj9YsSXmd1/l1rxu2zYniV8/OWZYX/jRdDTIlzoM9qXTiEN02FcrV3DRhHzRduCv1U2N8tOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:24:26 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:24:26 +0000
Message-ID: <51d2ccf4-9ca5-42a3-8ebc-d32729b6f059@nvidia.com>
Date: Wed, 12 Nov 2025 20:24:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] gpu: nova-core: Implement the GSP sequencer
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
 <20251106231153.2925637-8-joelagnelf@nvidia.com>
 <912e319f6d5d4d4c1261a02242c1b74b838e5692.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <912e319f6d5d4d4c1261a02242c1b74b838e5692.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:208:238::7) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0fc937-75f0-42e1-862f-08de22536222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmNlNGd0bUtEZW1NbUtnaFp2dWNOblp0NzVqWSs4UXVmOUIvd1N0TGJHeDdv?=
 =?utf-8?B?dGR4dDI1L1RhZXVQTmN2YmtSZ0h0Wkl2RStCLzNXTFIydjNGUTR0c3pCa3lN?=
 =?utf-8?B?d3RBMHo3bDREVk0ya012RWRBWHdhNHlDVTZUKy82S2tmS29wVzc0WUxxRnRL?=
 =?utf-8?B?b1RTUXVsYk1iamMrVkNxd1FMQ1VOVWRqR1JlSC8vOVJ5cWpzbm5TQnVDdmZy?=
 =?utf-8?B?Znowb0hFdDdwQk82VmU1Y1BKZXp2R2pXSCtnM1FxV0V6dnpacmg5UlVXY0cw?=
 =?utf-8?B?a0txOThGSU5uQ210b0tDYjV6SWp6K2ZvaWVLZDQ4b2d4aFU0cWlYa01EOHdp?=
 =?utf-8?B?WDZaODFlSDQraUxkVnJCeEY1bC9SMU0xVjhNYUtiTnFQKzAycU1WMUFldVY4?=
 =?utf-8?B?a3EyQTYzSEYrNXNXa25uOUQ5a29ab0o2OWlwMDQ5Q21iVHZvaHBTV0R1MFVY?=
 =?utf-8?B?K1RDRUtmc1pPamI3cXVmRHpFWDBYNEJmQ1luS3ZJNUdtVnFvRUx5ektOb0ZI?=
 =?utf-8?B?eXA0TnUyWS9uRnlhVGM4ODhNYTZsWTRBUzdQS3paNExuc1NuVnJGZWpONGdH?=
 =?utf-8?B?SDB4ODBtak5LNVN6QmMxN0dLR3RMU2ozSnRoUzBrRGhmQkV0dXpqVXFQZU16?=
 =?utf-8?B?TXBQVDJmZHpSeWxzV1hVUzBlamwxb3NqdEFTYzVReERhcWNja2Qyd21panEr?=
 =?utf-8?B?WG44Zzg3ODJHUjFvK3BQRDJtR3ZFdG5DQWlkRVBhaTJsUTQzb3VzY0k1eGor?=
 =?utf-8?B?TjU3U1piczYvRnAxQWJqWkFyRW1MZE54Si9lemMrRUU0MXpYWWVQSFAwVE4r?=
 =?utf-8?B?K3l2eGFaL3R1NyswNzZUaTJPYXpvUFUxWWFwdHBuN1JYVmtxTHN3YTFHL1R6?=
 =?utf-8?B?NDZDa1NQTmZ2OHp6Mndmc2ZVejdUNGFoV0dXK2dCMVJ5dDNWM0JRZE9VeHJq?=
 =?utf-8?B?QVRHNzRCSzkwbU5zUDR0d09vU3VpR1hQZTBQMmhKSkt0ZHU1eWw0N05FR2Qr?=
 =?utf-8?B?OXI3bTJBZjIya1h4QUhUWml0cGRDNzgreWdjQkp3T2NCNy9JdEJrUDFnSDVq?=
 =?utf-8?B?bit1ODVZRzJIeDR1RjdUMFdxSE83RzdsSnpZVm9EYjJyUWhSQXRRc0pnczV3?=
 =?utf-8?B?bllWUzhtcEF2V2hoaGsyOTBydXczOGRxU2hiR21QM00wWDJrdHpVTmEwdUF3?=
 =?utf-8?B?ektub2pSRExuUHljdkdSc2ZENjNXQXRneVkzUnpwVDV2VWd5NFZPWXNlcU4v?=
 =?utf-8?B?UFFOaC9uejNRVXJHZllab3VjbVBiNDZaUjUybHcvUDVrdlRjSjlCYkxhMGxB?=
 =?utf-8?B?QWp3RzkzaVkrdGtZUEU2TnVjelNuLzQ3azJueHoxRVJLWVlsOUo2Q0ZJemZs?=
 =?utf-8?B?YlczUWJIcVp1ZzF2bTVDOEtBR2FoczhpNFQ4bTBvMzNvcmd1V0tiL0NqcGRx?=
 =?utf-8?B?d2pRWlRPeWs1UTJXV3hoSmpDZit2VVkwQzMvUFFIKzNqN01taXZsMVE5NDAv?=
 =?utf-8?B?TGkzL1F5ZHY2dkxwc1NQM012Z28zTjNqK2crZlR0VEpHdWZQZStrTkpDMmVH?=
 =?utf-8?B?ZnBqb0syYTRTTUpEbGdvZTZsOEVRenBoOHBQRU41TnQ4RlBvM3lJb0FmRVlT?=
 =?utf-8?B?MjNQOVZYK29JcUdIMUQ4ZVVORW5ML3dnR2p5NzRqUmxRVVVIODlGMVJYSWZH?=
 =?utf-8?B?SkdYMm9jRk5FRGdZYzdKZVVhT05KcUg4MVBYdXRPaHJyT3lhcEFSbElDbDQx?=
 =?utf-8?B?QjFvbGxGSFVIaVdRZW1xRHgxN1MyclhhcC9qYzJ1ZTUxUVBJRWR3UUJwcG1n?=
 =?utf-8?B?ZDRuMWdQR0hpWitGRDkwaERweDlUS0tqUXhlKzBmNUJ4R2ttVUdJRmxEb1VU?=
 =?utf-8?B?ODcxOTIwU0V0UVdFa004TkpqZW1pSmx5ZmpKb1dObEh0WElEVU5vWUEveXBo?=
 =?utf-8?Q?Ej4vUWjMNPZhmesKi7qmg2x89+hyInkL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktsSmNrYnhOaU0xWFFpak15WmpCNWxabE1SeEhLWDNWaU1VUjUyNmhIaE5Z?=
 =?utf-8?B?bDRISG16ckovV1BCN244dWJJZGlLYVozVU1oandKanNlVnJxaTF4Ny84TG1I?=
 =?utf-8?B?dTcxRENzRXkyRmpyWHV6YTltNW84dnQ2SkF1Z0thUjJlcG93RzJ5RlJjZDZM?=
 =?utf-8?B?YTFPVHBySXMxcTBaS1I4Q1Q4dGNWbnpVTXNvUEx1Q2ljR01pMm1ERGE3U1R6?=
 =?utf-8?B?VERyL0k4RDlleW1xUWZsVzhldjB3QnZSbHFoMUtSaDFPNUdsTVJLZmd5RWVP?=
 =?utf-8?B?TXN4T0pZWnROSG5YS0tyVUh1bUxFS0tmNm9PTW9HT3B6Mjh2dVpkK1RDK1hi?=
 =?utf-8?B?Ym1ORVUvK2JXekNuTnBWZFlqNHkrQ3RQQzZpOEZxaUFZYmVUZjFhcktuV3dm?=
 =?utf-8?B?alU3clhIdTRNTCtYaHk3bnBZMmMwakc1RVp5OEdhK29zdE4rQnNWWFJwZmJn?=
 =?utf-8?B?MEwrMzRIMXI1NkwvN1dRZG9TUHJBY3VveWtmSmwyN2gzWVN0ZUZITVd6Sjcv?=
 =?utf-8?B?ZmhySEZyeG9rZXlSRkVkSGFCMUVTQ0ZlNDNpZUZ0TlJXQ0NxUkZqTVlscVdZ?=
 =?utf-8?B?WjgvdzlCYytwWXVWQk5PelRDUGtZOXd0dnl1MExZeWI0YmlpNEVOWEFuRUw2?=
 =?utf-8?B?Q2NUSkxNSTNwclBRWXJrK055ejFZRmdHcmFHVTMyMUtTUFNJZ0pPSTZrOFdk?=
 =?utf-8?B?T3pORFRSYjN0TkRyZC9NZjYwUWRpeG9NMzhYNGJ4N0FVK3dPR3Z2T2M2TDFF?=
 =?utf-8?B?UHJRSnY2bWJ0aUxPbERlR1d1YXUxd3hFRG55L01qQVpMMCtzUnVGYWQ1czFY?=
 =?utf-8?B?b3h3cFVIM29XUUdCMTNJaEkvY29VVWhvZjZFZzFwbDVqNC91NW5tVUxHVUpY?=
 =?utf-8?B?RlI5N0xOMjNYWXpOb3NIZ291REwzNmFYYitBcUZzeTdoS1lSL1B3TW45VU1n?=
 =?utf-8?B?STVHa1d5OFB4V2E0djl1aE1Bd1AvMW43WjdkdEQ5Sk5kS0RUYS9EL0huOEJP?=
 =?utf-8?B?RWR4TVhEOWovZmhPMVRQVjg2Mjlad09UZnBuRTdqWG9oYXUrT05kMzdLTy9E?=
 =?utf-8?B?V09SMG01VCtlZ2d6bXV4a04zT20rVlM0MWtDVmFVd2VQbXlIY01UUkhnZ1Qv?=
 =?utf-8?B?QVdjTnRtbE1vRW9vb3Q4aG5OODhMZWhtNmtOdlkraWRJZEUzNW92Z1YwMnFT?=
 =?utf-8?B?MmFIM3RlMlJ0ZDdEMlBMeElwY3JlaEpkajNUS1BxaFZ2cGhtcGMrMTYyaXJT?=
 =?utf-8?B?cXhycytCRldaeWNCeEpNeVk1dkdvNzRjdzBDRmdSU3N3eFBsV2Z1VG5vSHdr?=
 =?utf-8?B?NCt0MXM5empNYzhqeXhPY0dYdFpIUkxSY3kwS2NUT2l4bjR0Wlc3L1NZQTF6?=
 =?utf-8?B?SmFsdTk1ZUtjOTQ5blRkTUw2TXhSUk9uaWVIRDZ1ckI4YzZBQU8zalNtZFo3?=
 =?utf-8?B?R2FoQjZPNFJ5Sm9qNXFOejZucXZndXJjMm1NUTNBcG54Tjh4dVYrMXNyRjRq?=
 =?utf-8?B?eFVvcWt3blAydUJ5VEFQcnpxWVZPTHJMaERycHh2TVp4WXp3VXh3UUo2QUVX?=
 =?utf-8?B?UnprOGNqT1Rrb3dDUUNwTXBOYXNERzZjWTZUdUtrNTlzVTZQNG0zL0pkLy9X?=
 =?utf-8?B?UmFvcGpaZitXMmlNY2NoWjlnL0lEMVhDb2wyeE03dDkrclByNlhwWS9KdU5E?=
 =?utf-8?B?U0VqNi84VzlCTnFJeGpXVFRPMkt5RUpWa3NWSnl1NWV6dm1UdG1DZ0VLRFNY?=
 =?utf-8?B?eDhVV1NraVhDUCtOWng0M3dpeUxra2JndUNXR0RNNS9EQUhjdE5EZjRJYzBq?=
 =?utf-8?B?aGRrZEVWcEpSUS9KbC9pcUljUzlBZCtKTy9ZVzB0TnpwRCs1V2hzWGFXaXha?=
 =?utf-8?B?QVlRUzU5S05vUVlOTE1pVzJueW5RWEZOcmdOc0FYcGg1ZXFRZXFIcHowWUpM?=
 =?utf-8?B?YVZwakE0ZDlTYWZDK3lwWGp0YzZWcHFlMzdkU2RJL0NYYmNLWWhaeUlkbVZY?=
 =?utf-8?B?eXNjZndGanA0TE40TEF0eGRGREp5MVJFR1pzNG9qU2xPd3BsRHZnOE5NdnRG?=
 =?utf-8?B?ekRiMTdWVDJUd2UyNEFtdEl0U01sR1FHV3BscFR1cjdlak13VDNqc1JxZEJs?=
 =?utf-8?Q?hkO8aMOJFJQOVnObpXACnxCCL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0fc937-75f0-42e1-862f-08de22536222
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:24:25.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wEmG2kDay8xvUcdn5LM0TGxIKgN6OFTXpNgw0nR5NE+XEVZOu/cyW0Y8tNgTofqjn18+GpirvL4SBjLUmPO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952
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

Hi Lyude,

On 11/11/2025 3:57 PM, Lyude Paul wrote:
> On Thu, 2025-11-06 at 18:11 -0500, Joel Fernandes wrote:
>> Implement the GSP sequencer which culminates in INIT_DONE message being
>> received from the GSP indicating that the GSP has successfully booted.
>>
>> This is just initial sequencer support, the actual commands will be
>> added in the next patches.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp.rs           |   1 +
>>  drivers/gpu/nova-core/gsp/boot.rs      |  19 ++-
>>  drivers/gpu/nova-core/gsp/cmdq.rs      |   1 -
>>  drivers/gpu/nova-core/gsp/sequencer.rs | 205 +++++++++++++++++++++++++
>>  drivers/gpu/nova-core/sbuffer.rs       |   1 -
>>  5 files changed, 224 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
>>
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 36175eafaf2e..9d62aea3c782 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -16,6 +16,7 @@
>>  pub(crate) mod cmdq;
>>  pub(crate) mod commands;
>>  mod fw;
>> +mod sequencer;
>>  
>>  use fw::GspArgumentsCached;
>>  use fw::LibosMemoryRegionInitArgument;
>> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
>> index 649c758eda70..761020a11153 100644
>> --- a/drivers/gpu/nova-core/gsp/boot.rs
>> +++ b/drivers/gpu/nova-core/gsp/boot.rs
>> @@ -19,7 +19,13 @@
>>  };
>>  use crate::gpu::Chipset;
>>  use crate::gsp::commands::{build_registry, set_system_info};
>> -use crate::gsp::GspFwWprMeta;
>> +use crate::gsp::{
>> +    sequencer::{
>> +        GspSequencer,
>> +        GspSequencerParams, //
>> +    },
>> +    GspFwWprMeta, //
>> +};
>>  use crate::regs;
>>  use crate::vbios::Vbios;
>>  
>> @@ -204,6 +210,17 @@ pub(crate) fn boot(
>>              gsp_falcon.is_riscv_active(bar),
>>          );
>>  
>> +        // Create and run the GSP sequencer.
>> +        let seq_params = GspSequencerParams {
>> +            gsp_fw: &gsp_fw,
>> +            libos_dma_handle: libos_handle,
>> +            gsp_falcon,
>> +            sec2_falcon,
>> +            dev: pdev.as_ref(),
>> +            bar,
>> +        };
>> +        GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
>> +
>>          Ok(())
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
>> index 0fb8ff26ba2f..0185629a3b5c 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -418,7 +418,6 @@ struct FullCommand<M> {
>>          Ok(())
>>      }
>>  
>> -    #[expect(unused)]
>>      pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
>>          &mut self,
>>          timeout: Delta,
>> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
>> new file mode 100644
>> index 000000000000..ee096c04d9eb
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
>> @@ -0,0 +1,205 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
> 
> Any way we could get a brief explanation in the docs here for what the
> sequencer is?
> 

Great suggestion, I added a few paragraphs here, thanks!

>> +
>> +use core::mem::size_of;
>> +use kernel::alloc::flags::GFP_KERNEL;
>> +use kernel::device;
>> +use kernel::prelude::*;
>> +use kernel::time::Delta;
>> +use kernel::transmute::FromBytes;
>> +
>> +use crate::driver::Bar0;
>> +use crate::falcon::{
>> +    gsp::Gsp,
>> +    sec2::Sec2,
>> +    Falcon, //
>> +};
>> +use crate::firmware::gsp::GspFirmware;
>> +use crate::gsp::cmdq::{
>> +    Cmdq,
>> +    MessageFromGsp, //
>> +};
>> +use crate::gsp::fw;
>> +
>> +use kernel::{
>> +    dev_dbg,
>> +    dev_err, //
>> +};
>> +
>> +impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
>> +    const FUNCTION: fw::MsgFunction = fw::MsgFunction::GspRunCpuSequencer;
>> +}
>> +
>> +const CMD_SIZE: usize = size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
>> +
>> +struct GspSequencerInfo<'a> {
>> +    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
>> +    cmd_data: KVec<u8>,
>> +}
>> +
>> +/// GSP Sequencer Command types with payload data.
>> +/// Commands have an opcode and a opcode-dependent struct.
>> +#[allow(dead_code)]
>> +pub(crate) enum GspSeqCmd {}
>> +
>> +impl GspSeqCmd {
>> +    /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD.
>> +    pub(crate) fn from_fw_cmd(_cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
>> +        Err(EINVAL)
> 
> Is this just because this is a TODO? If so, it might be better to use todo!()
> or unimplemented!() for spots like this instead of returning an error.

I am not finding examples of other usages of this in kernel code, looking at
their implementations, they call panic!. Are we Ok with using them in kernel
code, even temporarily?

Though I'd say, since this goes away in the next few commits, its Ok to leave as
is, if that works for you.


[..]>> +impl<'a, 'b> IntoIterator for &'b GspSequencer<'a> {
>> +    type Item = Result<GspSeqCmd>;
>> +    type IntoIter = GspSeqIter<'b>;
>> +
>> +    fn into_iter(self) -> Self::IntoIter {
>> +        let cmd_data = &self.seq_info.cmd_data[..];
> 
> I think just using .as_slice() would be clearer here
> 
Ack, I changed to this.


Thanks!

