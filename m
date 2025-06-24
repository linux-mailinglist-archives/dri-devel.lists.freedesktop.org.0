Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC5AE6706
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EFA10E02E;
	Tue, 24 Jun 2025 13:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E1EeUSGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5EC10E02E;
 Tue, 24 Jun 2025 13:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2Q3O13WWppEWWkYgzSwB9A8Hus/EDyo/A0RoYd6cWtpwymFkebazC2ymGoBzHABdO7Fh9SXxa8RXQkS/JSoTfWAUCe9yG95grl/xjB8EWG3dCelTHouUOtaK9j1CuOIABkgNGtNSY8nTjHlmg9rBt6j4l1zQ1ERdouuz9m0+AHjdzbTF7YyVAIDStSZiOWGjcWgrsIqQLbwEIQbXl7nNv0KskbyfMrv83Xxp6SaK6FrIGDbL3FywaA/aZVfqKj7qSX4wFttlkgF0iTfxJpQLvHgFWCobuiZGihnwPyEP15xMktlJAH8niw47NMdlG8yaHwA+VTLGZU7N/n/DxgkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CbCR90ug+VtOuCEXRX1BrAnzhRdvKYCKTDpVZwAuqM=;
 b=Q/k1Jr3rvxTBYmdN2lGtJvZNhuiys/LwhAruGyf7KYqCYA5S9cyMTcES7usl8Dgu816y2Pv8Bx6vlK4+Fw/NadWTyqf1mZiL1rVoVd5EaqFn8MUL1MnaFE+weg2aU+lpCF9GeINd1wD4tlCpp/qJ+bS4NPL+Odm+8nDjzuuXLYQfb5WHvxcAwRETaTy5satzSqRCXhmbBnMxT+2GNUjBsbZ0W37i0AXUa6Jz1Lh0pUFLUFINLXVS3/Xb5+xbUdXTiUHm7dMC2/vPMfuWCyVkkqc4MXzntFQoJLf8X6CDM6E62Fn9QHe9Kh2h2RFJ2srmTbIBGS05Hx/9pGg6gCWozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CbCR90ug+VtOuCEXRX1BrAnzhRdvKYCKTDpVZwAuqM=;
 b=E1EeUSGMrxIS+jHLi9mEC3LBcTwg4TdiPy/JhFRDp8HEjTcTXBR6gNZXAK4iKo7yWUF+QdzUjcscmu727W7T5pslXoi/C2TJmZaltmRirhycdYuwtL3oLDYS4T9SAVYc/hMofCf+5rpZZ3VQ6CKaON3kJKu8DUYUYjZInxNSqnww/8VtcMxRRUzXKOPWMvEbwIENqdsidfmOwq2ax59eaWnFzJ1sonbAIPharchKptgZo7xFO2823HWxdHI+tST60WrBPiXZmhoVv6o9fFJj1GrZrfy6XT8E0SFu12adg4ZriJUcrdyk7lw9Nx5zMcZ7xxOSmqwU9HhHg37G7O7WFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 24 Jun
 2025 13:50:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:50:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 22:50:20 +0900
Message-Id: <DAUT8MBEGFYX.322FPPXEEDROK@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: consider `clippy::cast_lossless`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624132337.2242-1-dakr@kernel.org>
 <20250624132337.2242-2-dakr@kernel.org>
In-Reply-To: <20250624132337.2242-2-dakr@kernel.org>
X-ClientProxiedBy: OSBPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:604:2d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa06e14-50cc-40df-ba6b-08ddb3261193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDduWG5sNzZkRDRsQ2hVQVovdGlYZnd6MFM5djhIdE1ZcHMvQUxkTmtqQzl2?=
 =?utf-8?B?NjdiVmpNL3ZIWFgva0gvVlVYTjV5TWt1OEF2WlNKaGR4c3c4MnRiSGJWTXA3?=
 =?utf-8?B?RlFIaTdhUzZxTFY1dnA5eEl2bncxTzNTMlBtbHh5THJ1NlloU1BXOC9KQ04z?=
 =?utf-8?B?eGZHNEpyNG5McFEzUFNZaDdzbTZKR2UxeCtENll3eEFXb0Q0MUdBOWkyN2pz?=
 =?utf-8?B?Q0lqaXJtTVB4RUxCYnE0dVcwcTIzejlLMC9rRjMwNVlDeFRZeWhIOStwdTU1?=
 =?utf-8?B?M0ZDNml4d3Z6eVVwWjlEbnk5eE0xZ29TcUhieml6WDFUbWk5WFNZa3MvbXNy?=
 =?utf-8?B?UHUxK3BvaXZkS0pHRXVYTU42SURBcXY1SGl3blRWRnlhKzNSdDA4cDN5OTFh?=
 =?utf-8?B?Y2pJd1lFYklBbk1icVd6bmwzN1NYR0ZFRXdPamtQNHgwSnRnWjhhdzNMeTlq?=
 =?utf-8?B?TnpZWExPbjRnQTdkN25uRGdsa0h1R1psOXRFTEpBT2lXSlF2ckJHaXBRY2Fu?=
 =?utf-8?B?OWpFMElNai80cm1uVTJwdHV4dnNlYVNGZEdaeWJKandyYXQ4elpKaG5OSlA0?=
 =?utf-8?B?dW9ZTW5JMVNOTWJLZHJ1dUhZOFNtWGhuUFFqY0IrVzlyU3VkUUlzbUl2YkVn?=
 =?utf-8?B?Mjl4NjFEa25RUVBJVElsRkZsZlJrY0poUis4c0o4VnlocUNES0Nyb1FHOGlQ?=
 =?utf-8?B?bGhUQURtMDloeEJNUWVNZ3FhMC9xb0cxQ3hDQlh3dGpzU0VTSkloMThvWklX?=
 =?utf-8?B?cEJrZHhqR0FsUFh0dWFkTlFObWVtNllsYXVJcUxJczNVWXlWR2F1WWVuS3JX?=
 =?utf-8?B?VUpJQjAwSlRlcXdHZWs0azJvc2xmUVlHYyt4dXRCVk1Td2hvS1NlSXhKNGFr?=
 =?utf-8?B?cnYzc1NvY2Y0MDFPT1pSdWF2ZWlRSmw3Zlh5VGFidzZFeVc3azlMS0xWZUZ3?=
 =?utf-8?B?NkF5SDgvREtPa29nL2tTOFdYYktOVWhNYVhqVHNuanBLZHJ2YnFGcFJ6U2pm?=
 =?utf-8?B?WHRZS2pIMjVGN0ZYZXZKZk8vbXE0RlNSK1pmTHV2RXVEbzd3OVVvVFlqZHNP?=
 =?utf-8?B?V0FTaXB2YjIrbnNpR0Rmdm15dmg5Qit6WEg1NG0wV1NhWG4zYm5mNzcvYll3?=
 =?utf-8?B?Q1RINmlHY3h5OWQ4dDBuWmg1encraUVSNjRVMDJseVRkbDQ0Q2gxVHlUSWZw?=
 =?utf-8?B?Y2VabDVNUm9FMGQrZ21BUjJOd1lxcStRcS8xL0hPdFNMald6NXBvanVsUkp1?=
 =?utf-8?B?alRwSGlDTnFvT3RpT050NHNnRS9FWXRBSkFxcTRnV0picW4xT1Z0K0l0akUv?=
 =?utf-8?B?MUpiQ0oxeHk5YzdVbEhZcytFb0RXTDkrdWdUOXJ0Z0gvYVNTcTlXNXNnK1pl?=
 =?utf-8?B?c1JreFR4T0pSWTV1d3ZqQi9DU2JYTklYYmR3SFJySUphbUpEVnRzZTJhNUNK?=
 =?utf-8?B?M2V5WVJaenRhWGxTTFFCbDZINjFjd3hjYzZYQ2FJRzNJaDZmTmZ6NG1lMlZu?=
 =?utf-8?B?SVE0b1dOeUd6bEQraklOQlFFN09VQ0o2SXYxQ25nMVE0ZzJVSnFDNW5OSjZt?=
 =?utf-8?B?bTgySEt4QWNiZU1yNGRHcnVCR1kwL3JlYmEycEVxVW5ib3JIc2pYM1lYdnkz?=
 =?utf-8?B?VStBU3o0dnl3ejNqUnBuZjc1V3Z0WlpyY0xmeC9YbS9obHB0SUQzZWg0RFRt?=
 =?utf-8?B?Vnovc2gwa0dzVG1kL2FZcGM4b1JkWG9EZjMwRHpyZlI5K0RUeXBCUmxBUGhX?=
 =?utf-8?B?Z3doa3lVdmZkbzBqZTRacHJKSFN1Zzhza0p0bXFuTWx6bzJNSWg0U1FHZDB3?=
 =?utf-8?B?S2NXemJNbUVtSkJXUEoxQjlsUGNnQWcrekg4Qjk1VU5HQnprVmN3UTB6QmUw?=
 =?utf-8?B?NW1DSTkyU2JzUlV0YnlPK0hwZnp4VGRJL001cXJCVStrZmZLM2hiUmsyOVBN?=
 =?utf-8?Q?cHOmjX3w0OU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZBbTRaNmZ6U05GYW5PVWhjdjJsSjIzZ1dlMjVISXZ5bEx5RWpWMmY5ZVBv?=
 =?utf-8?B?QmpPZVZMbXV2NlRFWXZsdHdBcC9zVlF4MUtrTHUvQmtWbGcwMmNBTjVsVVZY?=
 =?utf-8?B?VWgxM3gzWHVEb3FndHE3QjNHc3dPVWVRaitCWkhTTW51UTh6NXIxcFJuaG53?=
 =?utf-8?B?emthZTQzYXQ2R2NWNFJ3aDYzUXRIRjlLUWxRdjRxTU5McjhSZm5SMWxlMGJ5?=
 =?utf-8?B?ZUNmbCtaQkRlRkQ3ZlB3c0UxQzUvRTByVzFDTXF5S0RPN1pSWEtHRC9uZlVj?=
 =?utf-8?B?MG93MUJGOE9lN2ZGdWMvRHBuaDl3K1A1MEFkRDdKNkExWW9YNTdVQUNNWVFt?=
 =?utf-8?B?bUF1MmFwZG9mRGlGN1hXVlR0RkxMN0k0dUZtQUJjek9mVzdCZlNldFYxNUhj?=
 =?utf-8?B?Y1hNaDFrWHV5VGFqalZBbnBhV3lXcXJrYnlWOWZRQkNhOEhrWGNQak9kdjJS?=
 =?utf-8?B?ZmhpOEZ2Qzd2UTFPNlNEWVo1OEszM3F5L2kycUk0MUZoeVR6MGpQa0k1UW5O?=
 =?utf-8?B?TFZCQktBcXBQdm55bGFPTjhBUVJnc3REb1RkMjc3SmZibDZHaGtZVTl4cTdR?=
 =?utf-8?B?MENvTEo0aU00K3JHdEp6NEg4L0t6Nm9rbGQzY0hLUWF1K3BJanJhVW0zTTdn?=
 =?utf-8?B?UFo2VFgrR3ljeVc3RGxxa0FLcW9zRWlhZmpMMUV6N0pPbHBqeE0weGw1cHBa?=
 =?utf-8?B?V1N1UHdvdk9sd09BMjFCbXpITTdzSUdTYnpUUndIN1VpdFcwNlh5aXpub0w1?=
 =?utf-8?B?WFRYNTV3ZzBYdmR4TUh5dTRZdHNCVkZQUWd2Nit5OE0zcFRiaHRGK0oxQ0Js?=
 =?utf-8?B?VEcwN1FjR3BBQ1pIR1FyV3ZKaXVqZXJ3VGVkSkFSc1BNUFRiTjVvT1pEd01s?=
 =?utf-8?B?ejU1TXZHYVVXc3UzTU5hMlVSQXFzTDJ3KzFleGl6NG95UFl4WGVLZzY2OGtE?=
 =?utf-8?B?UjgyOWhTY0hXV1F3NlJuM2RYMlQzNnZvU203enE2NFNFN2xsWU1ZWXNYT3hi?=
 =?utf-8?B?VjJaTElNMmFkM0k2N3d3MjBVQlFubEpNaVdUR0E2bjRCa2NMNmFOV2YvMXZz?=
 =?utf-8?B?dXphZWNtKytRNTBKNm5SVlFsYk15U0swaSt4dENUYTF0bUZXM0srcURwbmps?=
 =?utf-8?B?UXNmRTRiUnFOaHVMTVBuVWpYSVI4WUdnRUtSeVRLVnZvNWczYkI5THZCUnNv?=
 =?utf-8?B?ZkJvdlk5WC9yNEN3c1BqVy83WG0yRUFCVWdtRUM4dG9tNjdkaGdzWVZWR3pY?=
 =?utf-8?B?RlBzajRMdHpUMEhyYXZDL1ZJbS91YVUrY0tHaU9lVlJCZUxhNGFKTkdrb0dL?=
 =?utf-8?B?dkFMRk96SXFGQjJEVVFNVWp1QWU4NnVkSFFUMnVGcW5FTXhKOWhxOXN4YVJL?=
 =?utf-8?B?OWZzT1hra3NST1UwTVVUdk9QdThmNjg0SWFOcFhVWk1JWFdPcHdCVituYmxO?=
 =?utf-8?B?OC9ESzFwaWFyM2lESFd5YkZrUEtIbzg4RXhpcm5IcEc5aWVyc0szTkhqYk1l?=
 =?utf-8?B?K3dHTXZOYUd6L0F0N25ZUEJXYzhoaTVGQWtRd01ZWHBDMldWdGh6S0hrQi92?=
 =?utf-8?B?UmJ5aFVwc0V4SGJqZVNheDUzSGpyS2IvdkwwaW1GUFVWcDc0N1BPTDhWOXM1?=
 =?utf-8?B?SW9SL04xNThtMDdpSlBjM3RhU2RtdC9DNCtPZWNpTllxcjZLV28vaDhoYzI4?=
 =?utf-8?B?cVFEV2NnSVI4cDVRcm1uL1hrRFFONnJxZkdETngwbFZHM0VEZEcxWk1PeUdP?=
 =?utf-8?B?Y1phRjdqYjdtN2lOQkFPdnI1VmtNVHh2V1JQVUZLS2dPRlVrSnViTkxiVzhX?=
 =?utf-8?B?OVc2Q1Q1R000a1VPRTlJVFZQZ28vTDlaQStxdGhVSlZsZDdyYUd5dk1kU2NB?=
 =?utf-8?B?ZTRtOEptVk1OdGhZMFltdEJFVU9xaVZuc24zRFE1d0NSWXhaanpYeENZZzJl?=
 =?utf-8?B?cW0zQVhUUzFIVUlzK3RFZHd1NnBDTGdFdkRQeVp5TWxaMTNhQzJoRHZIMHlm?=
 =?utf-8?B?eW1IZEl2Y2tTbGR6T3dlVmJ3UHFVcGhPdkg2OTFZWlNMRFFBRHAwM0x4cVdK?=
 =?utf-8?B?eGI3SXJ5S2dBbERrTnd2MlptZ0FDSEkvaTkwMTV1dWV5bDJyY0xUWVV2QzBY?=
 =?utf-8?B?dzVPS0VDeCs2aVM0bjJ2NlFXSm5zMCttQ2RFTlpjckJ1SlZxNGNtZWNYblFR?=
 =?utf-8?Q?swfYRNh4ZiuvyBPcfC/Wtvf9FGpjazo+gXjskb4PQB/O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa06e14-50cc-40df-ba6b-08ddb3261193
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:50:24.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lllmdZdULWymvtJTBn8kJIUAHthJvCG7M/U9dhfSJF3v/+v0XAewvhNiYtEcR/FEwPDAhf/tdAgpFcJxya2Zbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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

On Tue Jun 24, 2025 at 10:23 PM JST, Danilo Krummrich wrote:
> Fix all warnings caused by `clippy::cast_lossless`, which is going to be
> enabled by [1].
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gm=
ail.com [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Also confirmed that Ampere still successfully probed with this:

Tested-by: Alexandre Courbot <acourbot@nvidia.com>

Thank you!
