Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69657C60F12
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 03:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B04310E0C7;
	Sun, 16 Nov 2025 02:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JfexDCmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A756F10E0C7;
 Sun, 16 Nov 2025 02:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb6tpKomzulvj7Mg0SDuecwbbv+wowHTBBG7Q0laDUKSuh0sgM3Hg9H5be6foIMQr1S+PmjjTfRLuoP1TzlviXo0pVoBFOPPuiunz9jV4ZeoB4aipNif158U6/4YeDqAhy4M7b7g/QjTFBM98F2HI/QcOuFGNK9pqGlWmDc7YRcaRUo+2GuxyBO24A/JG9c5gV3ZsO+mFwMukStm77tasUPFumer6kzJou/y79nSav/ioZHP7BXl0odBlZFkIKWt4q8Ryby2AGucPOWm50NspmY0MdnMZ8cEsvLZNHfvleRIApGyzapOovIbEfWyGDJ+2y5SB/dHj5xOen9MdMOupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da7wWRufFa3eK5AHmUiiIOgU8fy/uwtCfMZGCxaP5lY=;
 b=buQLtJauruVmZc4QS2LW872shsfOUOoiTOmhPvXrrYN1eK2YOMNYPiI6KUADGWg0WZKCojltA9mtQ7kCi77fbpgMqZC900XJ23mMpyziv05jnt3tfnP3hgCh+PKB+OKBr1MfUPA/tNeUv6O3sYnopA7yEV3KyYmbjO+YtmFFArNxItxvyi/K+qMPagLiKL4Vd2eWc2p7Krya2iMwLA4yQ9NSdUnjEf5oc5LcA9b5nH5d4tCoLy0Xs3P7Gcokeglbfxx2bIHiR6OeIMileq6sfgjtAvr/q3QVkrhL4/Foaxn3T1jsBKBd8ftvc1/V0vQkMs+3A5g+wUbfH2LREBrwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da7wWRufFa3eK5AHmUiiIOgU8fy/uwtCfMZGCxaP5lY=;
 b=JfexDCmd1wOv6HUtZv/EcSSNl9yIzoTtMbdXmzSUO2Zyf9M+pIrBatQPXx/nWwTliOF/1KTPEqs9AATfA1RCNGOMS67tI8RNh5pWtv4TNQM/mZw0/cf7czlajnp+wP6MUKzjJisVEI20+frPaHb+zrBjpc86LXu54mEHztz2+Ol3thcFm6RmYkP7w+bLf0eE8rwjNdFtUI86fDVasWzbBMhf+giLxthx/xEm9Ha7aM/4utOaTZtCQm0LzkZLQWUPJZSUA7cquBRRjJg3haNzUnV8aIo2IgKfuC3EPqIZ4aQez3PQG4Ychkm//9Sr85N+MKpmreNPxGgaE9ZG4A9l0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sun, 16 Nov
 2025 02:32:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.018; Sun, 16 Nov 2025
 02:32:51 +0000
Message-ID: <ba4da7b2-39f8-4d23-9a40-581ea94437f2@nvidia.com>
Date: Sat, 15 Nov 2025 18:32:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] nova-core: Complete GSP boot and begin RPC
 communication
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
 <DE9B0XPTIUC0.NKSRERTX9YI3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE9B0XPTIUC0.NKSRERTX9YI3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bffe6af-606f-41d7-0cbf-08de24b870b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnVWd0lzMEpjbGp3YXRiZk5rSTRoWWYrSWhwVVIwN3FBdkVWQ2svci95N0hs?=
 =?utf-8?B?RWV0K0c0ajVLOFE1STBQcTNobGd6dlpjNGE2aE5CU1A3LzhGcFdLa29wZjFk?=
 =?utf-8?B?T2JzVGNmalkxM2laMzVWQStGVnBaeXZjcnFlZHk4aHl1L0Npc0puREtkbUtz?=
 =?utf-8?B?Y2tCNmVGV0VUMmNmRzBOM3prSjUxVjNDSTJIL2RDbzhDa01ENWJhY3kwQjZJ?=
 =?utf-8?B?UVB6UjVWKyt4clZGOEprNXRPOUZLRE9KVG42bGtrZUZFcjJoOVVtNUNUdXZt?=
 =?utf-8?B?Y3llaGxHcUtCQW1vb3ViaWh1UGxTSkRybjU3bFVGaW9qSFBLTElISExXYnZx?=
 =?utf-8?B?ckRMNTlSVWs4QkprMjJFMFVBUFVWek5QNWN1VElVVkVKSU9KSzVEMjBha21k?=
 =?utf-8?B?QndqMzRGL3QrdE5OMmJGR0FUdkpOYkZEWXpjTTloQ1ZibjcyNTZqbkRSelh5?=
 =?utf-8?B?aVMyQlV4bkczUTBPdTZIMG1jODFmVVByVEloQnQzRzRzcEZJcTN0Zkdmc3lJ?=
 =?utf-8?B?UGltbUcyMGNRQ1ozME5VT3pmYzNrWHYwYmJ4c2tPOXJPM1pRN2lKVWNDRDJ4?=
 =?utf-8?B?cGxlR3JnNDk4Y3VCNjZFRnlIQ2xPM2hLYkUzY1ZVSEVibHhNS2o1QkJKWkY5?=
 =?utf-8?B?ZktLeC9obXNhVms2cXBtdW5YSGdncDhvTjFKMG5kZlZWMWFaODVYWW5GS1cz?=
 =?utf-8?B?UVNMRGh4TVNVcEpndVlQMWluN2kzRE9KOGFISWtqOXFNeXp3SEhmTnhUVHVw?=
 =?utf-8?B?aVpEOGY3Nmt5QTgzRkZKQTU3S00ybFJIZThISVpvV2pxUkdoYWxiU2FCVS9Q?=
 =?utf-8?B?MnFpYUZhclJrQmpJa3V5MURLMUVOcEh0NElvSnZlUWVlY2R4VG5Pd29TaWl5?=
 =?utf-8?B?aEorOWZnc3dYZkEyM1lBek5QcmpOaDF6Q2FuaXZWak0xaTk1ZG1pbWt3YWl1?=
 =?utf-8?B?cy85KzRGQk8vZVV4c3JTNjlEKzhhT25QZHFtR1NCK0VTSmc2UXhWZEJlU0d4?=
 =?utf-8?B?NGpPVnljVzQ1ajVRZHRZOVRGVWRTN0hCT2NKdXVyL0JweHpOYlFuMFFzUkxw?=
 =?utf-8?B?T3BYY0paTTh0QkVHWFF4d05MNmxicTlNU2I1VjdTVTc0ak5DOEhlRnJoNGo0?=
 =?utf-8?B?QVpDUXV5eCtrcnFVOEdFdXI5ajBnV09tRDBENmVFRVdQS2plWkZLa2h3NWlK?=
 =?utf-8?B?MEJjSDdaNW5yRCtQeG84Ujc1S0pvQ0E0aS91TVJSU2p0RXN0V1BCK0ZYOXBy?=
 =?utf-8?B?Ujg3VUE2YmdzUVhKcExyYmVpWVNUbVcydjdEMEdqK0Z3VjJzQnpYQlJQa0V1?=
 =?utf-8?B?VVJVUWVIcUxKZnZFdmcwMUcrTHl4d09yeHE4d1BNanBmMFlWMDc2OUw0SHRF?=
 =?utf-8?B?dStaTFY3OG5oRGRvNHRFaHh2TEhHN0I2djBPMkVTN1Q3VGduR2tRdUh3UXRC?=
 =?utf-8?B?N2JTcXR6Tnk1S1Y4aVlkUlp5RytES0xmNDZyaGVNeFpNcWNqVVRhQUs2b0pQ?=
 =?utf-8?B?WWh6c3lPMHhiSUpkMk85SlNmOG9QQVQwRWxoelR5ZlF6Ui9LSDF0RjRybFRn?=
 =?utf-8?B?ZStzenp6Vk4za3ZoNHZLUzkxWGloRjJQZHpBNHRHVnB6Sk1CdS9DenNrOEE5?=
 =?utf-8?B?WSs0ekt2NkdlcGRCc3JGTjZvNGo5eEhGNHE1c2Y2WUlxR214WFVoMlYzaXQr?=
 =?utf-8?B?U2l3cFIzbWE3di9JQUp3cndjWHc2Uk5samlZd0dlb05qZzNZU2ZaUmVaT0Qx?=
 =?utf-8?B?cGRqN0NEdS92OG5hV2FOYllHMzBPS3l5WVFxUlI0UVlrcFhVK2UzTnpESy9u?=
 =?utf-8?B?UFQ3bGRMTUFmeHJiWGErOW9CNHBmQm9nUk5tcFNka1h4c3lxak9RRVd0cStJ?=
 =?utf-8?B?ZGE4V2JBdW9LQkYxMzE1RmxRejdNYVdNUExabEczazRiZXZUZnFEL3cxWVJs?=
 =?utf-8?Q?qtYm9e+CsFSEVKXImyCm7wXDx5hhztvM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJ5QVFmODJYS0dhMDl2ZmFpZG5RTzExVDl1TGliMFVZeUJZZkxVdlpseFNw?=
 =?utf-8?B?YlF0T1Z0bmsyejZnNW9iZU9GRm82b2x4QkxYM3ZkRUQydDBxMWt3VFpVdjNt?=
 =?utf-8?B?ZFRMTWNrWlZJenAxSjhxcUtCYnNxZXlqNXNjSS9PNWhXazNReUlhM3JZc09D?=
 =?utf-8?B?M1ZEWkhjTXJMU0M0VWsvVmlsSUYvRWFvTFJXYkpiZDVFYUlzNFVnV0RGLzZV?=
 =?utf-8?B?U01yMjJoVkJCQWxoTjdtVlRLWWlnUGE1bTNrNHJYSThlVE50N1pvN25waFA2?=
 =?utf-8?B?N053WHZKdi9hcXEvRkxNNEwxUE5wMWlVVUMxUE9DRkxzc3BSbDg2T1VNTWMy?=
 =?utf-8?B?bmFWUnJ1SGxpZXA1ZUR2eVRHQUpJdVNxOXY4N3FOWjdNM0Y2a2h6WDBDSGFo?=
 =?utf-8?B?ZWdqcnhRcXRTWGJZbi8yQ3BvaHUwcGZRM083RVJwTDBTS1lMWEtsMjBlZUFN?=
 =?utf-8?B?T0QxNW1DOTdtUG9JK2J2MG85RFlObHIwUjN1cnlKR3RINEVjNlhKWWpxNzdQ?=
 =?utf-8?B?N1NlYm1ZK0hlaExicXVLZDRlRVV2WlRzcHRNcUYreDdxd1NzY2FORkFKUWYv?=
 =?utf-8?B?ZldOdHhBakVOWmVyYy83ZEZiMGpNRm9QRXE0QVhtOVVTenlVK09sazdZSXJR?=
 =?utf-8?B?N1RZNjNienBoOGxIN0Y3a2I1dUVzd0RaeWkxNkxzVEZZQmFvQ25wRE1sZkZy?=
 =?utf-8?B?cldDREJsSG40M2x5Nzd0RFVNdmxtcHhSYlVMTzVTS2xLaWVpdlNrWi96d1pF?=
 =?utf-8?B?VXp4TDdhYzBaRS9LN1c3WnF1UTRjQ0dIOGo3a3pVSHFPMDJwZURuOWpvQVdq?=
 =?utf-8?B?Njhzd2lib0JhNXlzeEV4YSt3a2ozb0NKMDcwSE4waXNYL1o0S1h5Tm1UYlM0?=
 =?utf-8?B?Rk93WFlKTmttKzl1cCtWQTZSSElKZFpMamxqWC9HOUR5NVYxQTh6SkNUZjFx?=
 =?utf-8?B?a1Z3S1lXaWx0KzJVaG9hZVFZeXd0ZTd3REs0UDlxdHpJcWs2NkhPbTBvZFFT?=
 =?utf-8?B?WEZpZldMcFd0OU5oOHNJR2Z4aVQ0M1pSeWNVNjBrY2k4VWpUN2N6WlZIZzRo?=
 =?utf-8?B?eUorSFFKRTVNWmFabzh3dXE0MFZQSGJnRHoxWmZRdWVidlU0MUhFc1VBbWVF?=
 =?utf-8?B?b2JoTkZwdU5OZ0JzL1VTUEpON255dEo0SHhjTFRiSHMrdHhGSUs5TnhuRm5M?=
 =?utf-8?B?ZUdiYXFwMUo4YUc5WW54UStFTVNkT0hDaUNUN1B0YUhtdUJzV0Y3ZnFWQmtU?=
 =?utf-8?B?MnJoSGVzSVRtc3NYQVdtdDZRY1pQeWRGaVU1ZUgzTzArUGxhbU5wVDFQRWd3?=
 =?utf-8?B?aWZwRWZuUGlaQmh0ZDFLZVdRSTBrY3dyeFRqMHFrYlV1T3MxTFozRTVDdzVU?=
 =?utf-8?B?aGJvc09jZjljSDcrVW1UckVyOTV3MjdKMlIxTm53N0JwOS9Jc0NxN2huNEZL?=
 =?utf-8?B?UjQycWVSTmIzY1lrM1FJa3NpejQvdWRvNUMzRjFwaldpd2ZPNzVjaE1jcG1r?=
 =?utf-8?B?NU9EWWx6VUJYNDJ4dUg3ZFB2dm9VQlVIVHhRK2ZnenM3RWVZd1JMek1YTVd6?=
 =?utf-8?B?UE9lQUQyTElNMUVuWXJCS0ZPNHh1WmRVTlVoNUVIV1lGbXBVRjhJT3FRMG1q?=
 =?utf-8?B?bU41RmsrQUsxckZxcWNacUdRbmdRQ2tXTlNRYnlCZUtZYkpFQVVmcDNRNlVG?=
 =?utf-8?B?VUYvTW5iRXpjTEk5QVlPRFFyUzh3SERpMERTRno5TWJuOTByMm1WMjB2Yita?=
 =?utf-8?B?eGovbHJaL2tpd0NOcEZkSXFxWjdSQlNKcmJyQUpNanhzTlUzSzF5VlRQOXZv?=
 =?utf-8?B?VGlnV0V1Mll6clVqWG91V294MWFpeUVNdi9zdEhjRnowYTB0Q2Y0eXBtZXk1?=
 =?utf-8?B?N1VGdFlCQnBsTFl5aUo0SFBmSDRhVWJUN2x6a3lLYUJsRXByRVBTbU5HSFpX?=
 =?utf-8?B?RTBCOVNEMmtNZlVjZmY4TytjV2FUOERGZjNmbFZ3SzdHZVJJU2ZRSm0wbCtl?=
 =?utf-8?B?S0tMWnZvTGtPOHZnRmlSQnd5Y1dlSTZkSFRuM3JEQk1KUnFCV3I3NXVUNnh3?=
 =?utf-8?B?aUZqNDNDdmY3bER6WDJLSWdzcHNpRjQyNGFjL1lLaFR3MVQxQzFGb1VSS0tr?=
 =?utf-8?B?MmpBeVoyd0NBMklVelFzVjh1L0ZtTWhYZ2NlUGRkYXVFWmdoaDdVcGJ1dXN6?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bffe6af-606f-41d7-0cbf-08de24b870b0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2025 02:32:51.7934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+QqbtbFY2Qx8ir76j0J62797ohr6Gsr/gC5EYGMCYJpyfX/xY8mklVMNS8mzIqkyCqE6Pi0l5lunrVAAzJ9HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883
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

On 11/15/25 5:31 AM, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 4:55 AM JST, Joel Fernandes wrote:
...
> Pushed to drm-rust-next with the changes I mentioned inline, thanks!
> 
> We will definitely want to make our interfaces evolves some more
> (notably the command queue), and there are still a few nits to address,
> but we have been kicking the can down the road for quite some time with
> this one and in its current shape it provides a good foundation for the
> next stuff to build upon.
> 
> The GSP is now initialized - not that it does anything beyond telling us
> its name, but it's a milestone nonetheless! :)

Yes, a wonderful milestone, congratulations to everyone involved!

And a special thanks to the many Rust for Linux reviewers (that includes Alex
Courbot here), who have been as patient as saints while our Nova team learns
Rust at the same time as writing the driver (!).

Here's the latest dmesg verbose output from today's drm-rust-next running on my
local test machine:

NovaCore 0000:e1:00.0: Probe Nova Core GPU driver.
NovaCore 0000:e1:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
...
NovaCore 0000:e1:00.0: RISC-V active? true
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspRunCpuSequencer), length=0x18e8
NovaCore 0000:e1:00.0: Running CPU Sequencer commands
NovaCore 0000:e1:00.0: CPU Sequencer commands completed successfully
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspPostNoCat), length=0x50c
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x68
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(UcodeLibOsPrint), length=0x70
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GspInitDone), length=0x50
NovaCore 0000:e1:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8
NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000

Beautiful!

It is so great to finally see this emitted from a driver built from top of tree
drm-rust-next, at last. :)


thanks,
-- 
John Hubbard

