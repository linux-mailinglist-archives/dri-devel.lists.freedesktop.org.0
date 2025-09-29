Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4101BA7EE4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 06:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7873910E20A;
	Mon, 29 Sep 2025 04:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EX1U7BG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BFE10E0F8;
 Mon, 29 Sep 2025 04:18:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbH/7ywlmFZ2r7pA3LUSNJy8Kv4RycAgc32YXrS7c7dNzmYckIEP9UaS5SU9e0TEx8OtXDz+vyHpxFAFvmIhVsL7Q5mWfsV46kgGcAyru1rukyBeXdrdoRjV6VvkRaZg2YuDrIesZWkzGSU7pZRBZTIlpIgOVl+QdNLBpZczmEI8zzfyTcFJnyroweFwsPWfI5Q18FqBWl+slJD4PV5XW8XGQDtqsqZwmNyxGndY2Mt1YdDaI7TKhH4QmhK2zWq/fi8PXiHdN5+w4sbSy0uRi0vLI77WejFD7M7OUlZe8lYeCa8qWl86jgXpa1HPG6eWixe+bu/sfgkepeGffkDYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZpZ/khkovCJELyqQWsuatmF/c1VI+XaJGP3DzmtLC0=;
 b=bYxoOHEod6AufGqUqGGgsx7qsHNrLScZQEnsA5Hd0SEWiCFOvsgYYzGE0cyoaJ7FTtHOGtBcB+il2lqxJbn8EODsiPAjTZ7I4yQ8C1klEGmPwpiiLFi6XpfQdZp1fH+e95TkPu/j1tMf5JK4PnOC2NyPuo4AvCz6ZKysRuTxMlDdko3csM+rCxS0NCwuYsr2PPfmAcaZnvqxAMbZIjxiU3nNzYlX56MPeMTbEdwazMPEcEnFheyAe0lOXHCMa19TWOvB9CESrJw7YuBKUf/lWW4MSLvzPkIXhcBqYedVesq0XYSVdMtw7vcEItUPSXbDOHqjuIa30H6cq2zL2qciuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZpZ/khkovCJELyqQWsuatmF/c1VI+XaJGP3DzmtLC0=;
 b=EX1U7BG/LyQLHjBUzRGsRG/rfiTjL91UOVFsW2tx0vt5c5G2Jk3xYldYc509Rh0lCmZ6LlhabOv4Q1bmJQmHC86lyixUX76m4oV35Angd8ckSZge7CdjK6plPAVUILjBs82BQ1jOFEUxskCEcD7M6nRLYq+lhrhdquIwPLdbeVYLl4VAMrczaHQ2UhuW8B5/kEFhTb/dpjTZ9H5EXfEYYu0a8MaaGd+i1EXqqg2m1xzyAwgxxOV2REYt0xj01oDFeT2P6HreDAOghL3LjS2F84eXhll+1cd+gGFjMYX9R3zqu2PxUmwhcHO40VtBrIo9WJmI+bLvRmWMVSHfrZEliA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 04:18:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 04:18:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 13:18:17 +0900
Message-Id: <DD4ZTGLPIL87.CSOZ9KMSOAC2@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: remove useless conversion
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <acourbot@nvidia.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250926130623.61316-1-dakr@kernel.org>
In-Reply-To: <20250926130623.61316-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0075.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: ba563035-6e53-4aa5-863c-08ddff0f3944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDV6dnVCNkZGdFFrOFo2Q2MwYnBkZmJHUCtJNUZ3dkM2c0JvaUl0TFpqZ1ZV?=
 =?utf-8?B?eG40K0FsSGVzQWNtRnIyM2s2cktRL1E1UFVnamFoZ09EN1BlSkNFaUVTaytQ?=
 =?utf-8?B?OEVrNE9tSytXOThGTXYrKy9pTWlGeGcwek5Qc096QXd5c0dIVmM0OUZkMElB?=
 =?utf-8?B?NHN4bzFwTlErWVdSVmRSMFFZWE4zYnFlU1B1cDhkQU5OL2R3TTZGK1c5aklQ?=
 =?utf-8?B?dnc1aWtJLzlKWVFKaU52TjBFUlVVUW1jUEpFUTBFUU81UGxnMDVmL3ZvUzRW?=
 =?utf-8?B?VTEzaHNIUWZBTHNqOW9NK2JjUzljT0RxNEJWNWRtMkxUalYvOHJHNnRzQ3A0?=
 =?utf-8?B?YlRhaTVScjV3TEJpSjZzbnN2cXZWcS91ZDNGSGZoMlBqbmhhMTdBQnJ4SDQy?=
 =?utf-8?B?cHZyUU9jTkJZYitKR1ExVkNTbC9SZHpIb29GcVhvSXVrb1VMSkE0NXFXNGFG?=
 =?utf-8?B?TzdDbGJXTkpjSGxKTHVsbTk4YXIvZjloOVFZc1RWRkNpSW9pbGl6NWUreE9B?=
 =?utf-8?B?VjR5NVFmWVlXc0tmR25UZGFvVkpQQlhmYm9IMVFlMFlrYVd0WkxqL21hNmpH?=
 =?utf-8?B?QmZ3T2pJditTdGhEbW9zVXBpNXhHNlpGM2tSQzJiaUJQVnJGZGVLK09NYkxJ?=
 =?utf-8?B?emx5Ymc1MXNscTQxQXQyUXhFblhkSG8yUE5hM2Q0cVVMWmtIc2E1N2M3RlBY?=
 =?utf-8?B?TG85dkdvL2tRa0ZackxnY1EzamtwcC85WVlhaThnemY5b1pPNk9yR0JjRi9G?=
 =?utf-8?B?MDdEMGMxU0hyMkRmZXRKYUVyMWl1NG5kdG0vWHJBUVdSZ2U3S3RPOTIvQm5o?=
 =?utf-8?B?c3ZpVnpSMEROeVBuQ0dza3U5c3dNVEV5ZVQrY0diTDZucm9tN2RlY3Z4N3p4?=
 =?utf-8?B?ZTZZcTJSWFIycE0wV3ZOTWlNeVNUT1c4NjFJVDYrYldqNUhycTEvOFhwTDBN?=
 =?utf-8?B?NUp4MEJSSjhVRmUyZElTNjNDZjBvNnFvblJmdjRQMU0wZHg3bEMyMkVZaHNO?=
 =?utf-8?B?Z0oraTNMOEIvQUFIR0svLzdLR3R3aHhvTFg5eHREbmRqUjdCU1BwL01xblRI?=
 =?utf-8?B?RmVCZnJvdWhscHorQXpHUlA1VWNVemtuNUlKM1h0MHkzK1dpWkVNREsvOVB5?=
 =?utf-8?B?ZGM1aGxDUXNRUlRSYXB5SHZqMysvOENOOWtqWnhRdFQ4WStWRE53MjdVbThW?=
 =?utf-8?B?b3l3K3RIU2pHQ3gwNUxwSjFmeTN5bzg2cHd5c3Q5Z3FWNGZvV1ZQOFpyK2M4?=
 =?utf-8?B?M0w3a0ZiRTJULzNXOE95UE5GNGdEMzc5U05md1B6TjJOUkprejd1UGc1aVUx?=
 =?utf-8?B?bFd2MnNJeG1MZ2hPbkpTNG9OcGRES2pHbG1USTN6QjVOYk94SUZySUcrRFY3?=
 =?utf-8?B?cXZqRFdIOHdGRkpSeDlTVFVSekZjR3VhSmFBNmkxYUxKb2c5bXZ1eTFET2tX?=
 =?utf-8?B?bi9wdjFMYTBUTmMwOGwxQUJjbkovWnhGQkE4R3Z1YXd0OTJYMk5wVUcrQWFu?=
 =?utf-8?B?Y3VZbTJTS3NXakhETGVpVGsxcVNKdU04bStuR3JpeHVFcCtvNE92RDZOQ201?=
 =?utf-8?B?Z1pqOXgxS1JBay90NFlmb2JOS0drR1hpTEZmblk2S3ZPSG56THVzRkxVU0Jj?=
 =?utf-8?B?WkMrMnhKRHZWNjhhUTk5VTQrK2V4aGtLWG1GRit5bFBmUy8wVDlKZ0lseW9Y?=
 =?utf-8?B?NlBhbWR0WHRlNnQ5aWN1Q3BHSHVlOGp3TTJsMmlpN0ZlMmN4N0RaSWZ2amtO?=
 =?utf-8?B?WHdDUXlmSjZ0aFdibVEzMXRrVTZHR0FIUytKUUhCdDlVNFRqcmE3NGJTUElr?=
 =?utf-8?B?aWZ4T0YwN1p6S0hNVzlKdEhuUkRWRUZqci9iTjgrcGMxRzB0MDYxQitFZ3pN?=
 =?utf-8?B?R0pNVWU3WDBPZUpkalVONUtmblVWN1JXRUhBSVNYUEQ4NmREcmp0VVc2VjhP?=
 =?utf-8?B?ODU2dDVrZUpiaWhmMGVEOXpyS1VYa3U5RVNENVJROEVnLzkyYjliYTNZS1hu?=
 =?utf-8?B?bXJlV1hPRWxjQUJKM1JWWTR3aFMxRUp3ZU1qV2pzamIzZUdXelFjam9zMGVI?=
 =?utf-8?Q?XKJBfW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHN6QWhNNUJzcFcycXhYZ0RJWHcweWxjSnpXM3RGTTZFTHJadHFQWGdEUHJ2?=
 =?utf-8?B?U0ZuNVBRTjhrMTMzK0JmR0s3UXJEYUR0Q1NYeENNeEp0dUVYYUV1SFNadDJp?=
 =?utf-8?B?WFFKT1llUTdQWDlTQ2VpcnRrMEdWbGhHR3RReFFwRXd4bzd2ZXdlOHVxclN4?=
 =?utf-8?B?alBGM05ERTIrNmV3cDAwdllOaFd2UFFuRkF0bXZ4T0I3eGQvaXp5Zjd3eTIz?=
 =?utf-8?B?aFFBeWpPaVVWWDhvMEdDL0g1YSthU1NEd1p1RmU2UFk3M3d5MnJSa3NqaEtH?=
 =?utf-8?B?WEpGOXRmMGFHZWxQYmpZV0RSaE92NnFjNFYzcmJIUkd4eU9WS1FsWlphNHRq?=
 =?utf-8?B?ZzI4Y3R0VldFU1dDTXJzeGUyTXZFNFZ4c3hHL2NXdGVLSDdOM2FMSmswN3FY?=
 =?utf-8?B?NTlqU0FYRktaSS9pSUZEMFhBVlNaYUIveXpqelVWQVFSeVdrNG1JYlphbURi?=
 =?utf-8?B?K2hMYnFjcDRtMnNGMTV6RlNabEVlUUdaYjdvMmpGWVhiY2Z4by9kZHNVM0JT?=
 =?utf-8?B?NS9QMXRtSHc2U3NiVWJCUlk0dUF1Zjc3QlBORTZCaStOWkxnWWx6NGQybmE4?=
 =?utf-8?B?VFVvRkgxUWVVMFVtUWRmR3FENW4xbUxzK0dOKzNJNEk4WFdPRmRJVGZLQ29o?=
 =?utf-8?B?UWE4UlRkYklHQ3gxYUNpN2MxdXdJcC9WbXBpdDFyaFpTYzFXSDMwNHdTVzdX?=
 =?utf-8?B?QUNlUExCRC9ITFk1RkU1eUxjMHk3Rndnem5HTjRURDZRVW14QjBtNDNta2hM?=
 =?utf-8?B?RGp2VG1IQzROOUhKWkFFWDNRRk9tYjBqdU5sc01jVDNTa3puM1FwV2JlVERS?=
 =?utf-8?B?a1picDZTRitranFQbWJvUHZZUGt0UDBNVng0MVpKMUwybXVZRjRQbkw0ZFhL?=
 =?utf-8?B?Wm9jSVlwV3R6dk92dVJZVlBDN1ZjS3VFZW9BS3dFN0RWeWZkS0ttTStPZVhk?=
 =?utf-8?B?VCs4emZUTnRkbVlXMEVtUHAvdDhSTk1XSThzWk41Y0pjVXlDZWp3WkhZSDJC?=
 =?utf-8?B?REp2Rzh2Zk5ILysrQ1RzUUE1cnpQWEg0NmJ1MU1ORzR6NVZmenlqLzJKemQ0?=
 =?utf-8?B?bFBET1orN3N6U0p5RERuNnMzaGliR2x3ODBrM2dFbVpKVDg0ZkVWUzVUZGw4?=
 =?utf-8?B?Mk1SMWRnVERqTnhZeG5ZRTFOKzBoWnBZNWdTTEFPRVpRS2IxS1lrdStDNHYx?=
 =?utf-8?B?RjhPcXNOVHY5aExHUGpHNnJxajB4UGVWblRVQzR4d25ZM3QreEhVd0pnWk1Y?=
 =?utf-8?B?T1IvbU1USU1GQ25nSWlqT3NUTnN3YVlKY1V0T0dsaUNZS2l0OHNRV1M3enpx?=
 =?utf-8?B?Y1JSeXVEOUNXeTMxekdsU1k5RHJkNXpIOWlvT2V3MVhZUmUwUDBkc0dzNzc3?=
 =?utf-8?B?TmhlV1BMQ3ptY1NoTnhqdTFJSzhJNHVZeFNVOGhlajMxKzgxZXZzT0JSdCtl?=
 =?utf-8?B?UU00ZEVPS3BMT1RPTElQczhyRnBWTkFFSkM5VzRzVGtnM08rVHNpemx5VjVX?=
 =?utf-8?B?cDd1R0hYRUNTUXd1SlNwUlVaMGlOVU5yaTVLNk5HVHVGekU1OXI1VGFlMVR4?=
 =?utf-8?B?WGZzOVIxSndpd2t5SFdicEhEMmdrL25VQ2lKVzMyRGV2SjZMaUlKTndnZms2?=
 =?utf-8?B?czlDVGlEZTBwUWlURktuaHV2eSsxNGFYbitOck10dUF5bUExMmlVY1lYZ2gy?=
 =?utf-8?B?U3QvQnZKOFhJdDJHY0VUL1ZYTWVtQ2RFOXAyM2pmNERoM3MySTFKQlp5UHB4?=
 =?utf-8?B?S3c2VGwrRjFQOVF2Y3NRMXBIcnZNRUtPK3FPcy9JWm83VkNmV09wZFdxMnZi?=
 =?utf-8?B?WnZPYU91OFV2YUdJZVF5dVhUQXB5bCszWUdUenJYbGU3VWdLMEUrUzN3OEdW?=
 =?utf-8?B?N3BDNVkvcW1hdFd3ZkZ2SG5KQzY5OUJRSEZtRE1iRmZJWXllQzQ1a1ZzUllC?=
 =?utf-8?B?SGNUTWFOVVhXVlNuekhidDVsWmlxVTZTcVNzMVFlUE5hVFc4WTlJSzExYzFW?=
 =?utf-8?B?OExoOFJoRVlFbEtqQk4zQTZFYjc2Y2xXczYrMXVUZXhHQnBocElUT0kvV2ZO?=
 =?utf-8?B?ckJ3NlYxWWlGV05tUFdheHlyUExFZ3ZIeENBN3dHOW1CeHBRWkhYTGdBYzhh?=
 =?utf-8?B?MHpudWZDMi9xM1p1WktlY3JJU3pldDg5MXhpUys2NWNqYmFtNTlmc29GdzVG?=
 =?utf-8?Q?6vKXBE58wDZBsfAOhZ7wMLKJ7/2AxNbL/EP7zMhQ2VPI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba563035-6e53-4aa5-863c-08ddff0f3944
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 04:18:20.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQnWtEer0tChwzHWJVp06w7w25M5WXWtDIsN4FupiF3jbHWe4H/S5xh68bh4cUNs2OAxoJr6K2x+isjqeikv4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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

On Fri Sep 26, 2025 at 10:05 PM JST, Danilo Krummrich wrote:
> Meanwhile nova-core depends on CONFIG_64BIT and a raw DmaAddress is
> always a u64, hence remove the now actually useless conversion.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks - staging both for being applied to drm-rust-next after -rc1 is
released.
