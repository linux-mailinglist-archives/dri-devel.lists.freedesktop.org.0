Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0ECC0DB3B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1618D10E474;
	Mon, 27 Oct 2025 12:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I1S0bw1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013049.outbound.protection.outlook.com
 [40.107.201.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DDA10E475;
 Mon, 27 Oct 2025 12:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSQ75uWo4rFF1EbpUl98dcPgnIr9QFtt5yZZ8HKgb25vhL3jRYGjbC6Dmse3ubyvR/35cDLPuPv8eZ+LJe5xo+uR+uVXnz5HfP5hg8vQFGslCOK2VVFf+9jABO9hUGyV2PsTWbUYumDTW0SUbsiidlQPSpIl7jYWqe2hANk2Xl70nvfu0YbRLIlM07fyhOEVG9a7891YG0LIkfDiikaBGR/XLzaLc7jIfUdgQdbrxPLJVfPFKJuYeusrPdd4JMuUhBTVrIn+q82JontQVN7tFmtr00jR4XIsaPLzbQGi0gu1eUf6oKdcAM7Q/ppzxn/t4qqfw5Lsx7ZiRo4amQie6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST/NRuXz5oB9ccTZKk8ndDVRxdtoyIa0gCXH1x1pt80=;
 b=Wpa0GmmQJJFgzVoX89fKLLreIxK5C2B2wjXCyDQdY2t0e2fDbT6Bph+7Bc1t1Q+NqXz0QjsWfRsLrQ9FMLpUqJMVD9rXehOn+gUj3C/iLyeZEnuEzRUn7TRU/5LLO0t6X/5U8MzSeHpTjoRqtQSECNiG+zcvEJ1/+j1FEr1iPhLEQeYIkv0ztDYj8guihAeHcbJKyglz8h53fnK+UaOD0YQHpHvczfNXu5zChpVeG6aEppG8uIC94r/4WSzqUAGb4Ki7ySQrNficD8TYNM1iijGrJAUfxX4UVnEu7CW7MuQsbQecO1mDMrnWj/4V8nT3Cr3KgEGcQ9c31rYJ6N0Ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ST/NRuXz5oB9ccTZKk8ndDVRxdtoyIa0gCXH1x1pt80=;
 b=I1S0bw1Lyjk48doneVeIlXQkegqjXLf5QS8qIMlIZ20N6XrPCfcgofT4eRS/ue5hXZAbUcwJ6OtK9E9WiLT/1VSM2iwjSyK2TwJOl4l5q28W2s5ajASwCPTPjm/mbHGjo3EdhLWPh7ND0/USNltia+l/fivvO6wMGBAHgwxFmbiL81B8+JBqDX6AYimVTQ3vr+1sAPp3GbqKlri2m/bqR2AHrr138PuZQanyij17kaBf5lRyJBbgCrVU17OVXsog1zLV6RDj26xawu3LxKnueA9+Sn3MKLU9S7rK0BYLC+F0Z8B6l5xYYyaMFdS6uFjNSFMXGGT4jdP3xgUCdI5aiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:54:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:54:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 27 Oct 2025 21:54:42 +0900
Subject: [PATCH v2 2/7] gpu: nova-core: vbios: remove unneeded u8 conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-nova-as-v2-2-a26bd1d067a4@nvidia.com>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
In-Reply-To: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a09acbd-f856-4fea-f044-08de15580614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEpIakdRSWsxT1hQazVmKzlEb1FzRHg5eTRENThicmdDcmxxVlNjNSsyZCtI?=
 =?utf-8?B?N3l0RE9hdnp3LzRoRXVjb2prd3lONXZnMHZzeTBVdlV5eU81ejZGWDRNWnJ2?=
 =?utf-8?B?d0JxcUNHenhWV1ZKelFXVFd2RW1uN0tSVVJoUGh3elRCQTA2WVB1QUpCeFkw?=
 =?utf-8?B?aDQ0cEloVEdLRVhLWmFIc0ZIYkpabi9TZXd6MGw0bXJCVDE2aDZjcTQ1VzFR?=
 =?utf-8?B?QmU0RnFNQmVNZ0R3R3VvaTErQktFZVV1MW5KK0x1STcvR09RT2sycm1mYjJM?=
 =?utf-8?B?bTByNm1nZ0pDeitJcTVrU0hwNXRIUUpKNjR2c2diWHZJdDk0dUdOMWhhdmFl?=
 =?utf-8?B?d0RLM2NlRWd0Z3ZhTjhkS3JTYUNYS0Erd0JSVnpmUUxack9za2I1ZDMvK0Jl?=
 =?utf-8?B?bndwSGpueVlpV05tdGd1ZFdEMlJvalFobElHUDQ4V1lDYmwrV20va2d2b2J3?=
 =?utf-8?B?ZnhsTy8vbjRJN1dWa1lJQ05tMWlYakdrYzh4QSs2aTRtdWRka2tQcjEzd0FO?=
 =?utf-8?B?MkxEM2hRaEV5SmJQeWhiRHFlam9nOEdpT0ZRZ2J0UUVVQmhqWlM4NjZ1MGh5?=
 =?utf-8?B?SXlZb043ZDV0OTNnb3hnWnZHbXBobzJRNlFBaFQxdWthTW9wb2xrbHV2NXJt?=
 =?utf-8?B?VWhFMUw3b0FtNUdtakEwdmZIWmg0Uzc2dWRYbU9kaHJXNnRVb3IyOGpoV0pF?=
 =?utf-8?B?TUx5SUxoTzVick5JeU9qekRYTWFFUGpEZHNWcC9XMFRndkF6bGVzSzZhY2dL?=
 =?utf-8?B?NUlVbUhheDlzblduQ2VMMVFDOExIWitCcFhsbndnWGpwQXp5R1ZYUjBrNkkz?=
 =?utf-8?B?OGY5Y0NSbU5FVHo5b2NiZTBMaDFMT2NYZFl3S04yeXV0SEUvS0oyRTNHQ1By?=
 =?utf-8?B?bjRJVTZ3QTJvRTRsaFBTTWgveHhWT3NRbmRlaElNYUt5S0FiUWVGeWhLc0wr?=
 =?utf-8?B?SVM5eVFzZk9kZUU5TmhpeGdWRGs4bFgxUFZKRHR0ZHAraUF4L1dNWjlSRDgy?=
 =?utf-8?B?MVZzeWptTXRTTVhISy94NVY1ZCtHenU1K0pVcER1a1ZIZG1sT1A3YlNqWkU3?=
 =?utf-8?B?VlBlL2orTE8wUy84WTRNZmllY1lmNHJJWFdXOWxONE4wcHp3bFZ2djZ1T3Ar?=
 =?utf-8?B?M2FwOFNVZ3dpWkxMVXpKQU5pbnplbDlTRUE2c0k4SzJhaTFmM1Vzd0trTGVZ?=
 =?utf-8?B?WkdLbVdBb2hQMlQvRHZPWmFJTnhDWEd6WUVGNktOWXJFWUtqT00rVG54a2RB?=
 =?utf-8?B?SEZaRWt4UlVobEdjQWZEaGFQbjBaVlZ4eUN1d1JxQ0JpckdyWU44eU9zQXVp?=
 =?utf-8?B?NWpRbGwrV0F4R2VxaFdQZW9LVFA4L0s5S21FTFpvazd1RFg1QUlCTFk3Q0Yz?=
 =?utf-8?B?M0RIdHlualZJSmttV0JSdE80UlBna3kzbUtSRXl4ZkJhRGMvMnlWZFBmRjR1?=
 =?utf-8?B?VDl2cWpVZXB0OUkrd1Zyc2xuOEt6YmYyT1V1QkYwNjJhZW9wbEd6S2pqcjlx?=
 =?utf-8?B?NkZnQklnTHRKdmVncnJtUS9jS0J3MDdDNC9FT1pac0VqOW8zeFdVa2Z0QlRw?=
 =?utf-8?B?am5HV2txNVIwa3VJSmdrUlhpdmVOUlE1ZzkxNHNoaDB0cC9ET2xVbG5wQ1E4?=
 =?utf-8?B?aUlhR1c5WW5qcEgrMS8zVGNIeXpEbHFZdHZuN1RGRnB2NHRTNHhkdkhjME5X?=
 =?utf-8?B?MlI3TnhMRmZ6UHN1TnVxRkNUTU95TnptZmhQZ3dCdTBGWktmNFdDMENzMlBu?=
 =?utf-8?B?b29RQ2lIaGVmVGc1dlJuTHBUTytzVWNpUFZuKy91N0djOS9tMlEvUy9sSWlh?=
 =?utf-8?B?ektkdWxCUzczQ0N0UElhTjhvTG9HWVd3dHg3UFUyVTRCd0VPLzFVK0U4WE1H?=
 =?utf-8?B?VE5KRGlYdlpCeU1rVkY1dm1rdG9sbXBFZXQ4NXd5VmVId0s0ejd0MXRlQzBI?=
 =?utf-8?B?TjlJc21uZWlDYkVINXhsWTdoQ2hJZ3p0aWtFbk5JWGZRM0svOHhrTmNqdWIv?=
 =?utf-8?Q?WGsoa6EOq++wC7Jkz42bUJh2AeIkRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdhTFBuUjNoYzdrandpd0diN1VxZkFYdmhzVlFETVVxYW1zeDludjFHcTJ1?=
 =?utf-8?B?di9EOXBhSEJxNVozK3lvZlZHRFNzUUZEM3V0NCt6Y2dzZzJhVk1WVDdoM0x3?=
 =?utf-8?B?d1cxWGx2Q0ZpdDZKR0FkdlY2cThSTmdQRkFTc0ZMeVFOa1VZblpOYmwxMVZN?=
 =?utf-8?B?cU1wNlpPV2JtR1BwK3dNeEEzU1Z5bUtYNDZzbWZZb01FZGRvSUxCcUFna3c2?=
 =?utf-8?B?ZTBWZmdSUFlMMXhnc05vZjNpZkVmYm14T0Zwbk5lUjcrM2hkWEE3Z1ZRREc2?=
 =?utf-8?B?c0JwSlYzSElybDRCNFQ3OVd0Y2ZQTWxDNUJsZEVDakM3RGVEQVRGbldGZ3Vh?=
 =?utf-8?B?RXVPL1N4M1JWRGFXd3VzK1RCejhlNUZWNWVrWXkyY2x1djdVN0V0Q25RNVVM?=
 =?utf-8?B?TG43Q3I5RzkveFl3YTAvellmSkZQd1FmOEc0MWhieURTbkRLSTRxcVh0UU84?=
 =?utf-8?B?L3JYNEkrc09lbUU2K2lMdWlRcjYwempIajd6MEo5Q0duQUZScVp5RkJQSW13?=
 =?utf-8?B?V0xyZkl3eVc1S01iR1BPVzNmU2Ztb21SK0Q1bHpxbGdDamhhWGZ0MkVwM1dx?=
 =?utf-8?B?Ump5MTRUREtsdC9IOWR6L0FTRkJzQ3FrOXVFcVVZRkhwM1N5THZoUGg0VUZZ?=
 =?utf-8?B?QXB3TzhPVVhldkVHa3ZOTEJaTzk5aW5qaFhCL1BnZDVWTU1UMDNaa294b2RJ?=
 =?utf-8?B?cU95UUtyZWJmTnVWOEo1ckR6V3Z2TEMwTzNrQmFlb0VQa3NxNUl2Nlg5TUhS?=
 =?utf-8?B?SE5DbVVhMU5ITGdiYnFhak83eVZla1Q0Q2s0S0VlSnhMT2h5YTgwU1pCU3Vm?=
 =?utf-8?B?dGgwaXJYMGlFWC9OdVlLdkdGMEVINXpibGhneG1wZms2N3BGWFZ0RmUwVWxJ?=
 =?utf-8?B?YU5VWE1PMysrRWpWcVVjc1VTdFNXcFBkSWg2Z1lHYS9HMEJmeXBEdnRVN3lw?=
 =?utf-8?B?RXh6bC9JbkRNMitkTWVKeGw1RWlMako0aWdOM2p3VmFLeElRNzZUT1hGZEZv?=
 =?utf-8?B?NTY2b0sxd1BkeHVsZTdHcDZ6bldlV3NMRSs5NUpsMmtnMlNQTFFFcGNXcTh4?=
 =?utf-8?B?aDZ2NFd0M1czcjJjVWlOVmV2N25PbDRKV1hETEw2dVkySlBWZ1F2ZmI4YUZw?=
 =?utf-8?B?UEVTejhneFBRdGk2RU8rS29SeVNneHRXRkRnMURHc3pXT2NXdWVpWVFOZXkx?=
 =?utf-8?B?bEUvVTh3WlVOdHZPSjRTN0FnWDVabDMrWE9vazRZYVVMYlA4UFpId2pwUTJk?=
 =?utf-8?B?N0ZuYTg5eXFLMzJBMW5rNHB0RkxQbU5DUmU2MjFxRzA5U3l2UDJtYzQrV09C?=
 =?utf-8?B?czN6UFlUZHo1RG16Tk1UODNMelBuTkFNTFIxYi8zeW4xUjU4U3JuNzl1S2dl?=
 =?utf-8?B?TlJ0NFFkNW9RNmpacDRycFVFUXRrRGRrMldWT0pRT3krU1JvRzdCdDVxZFUz?=
 =?utf-8?B?cFp6NGVZM2xyaVZLQ1kzOGNVaDhjYzc4S1huVU0xQmVGeXRHRnM2K2I3Y29w?=
 =?utf-8?B?N1MyVDhHYk1VbW4wcWFBQVVqWjlQODBaWCttV09sQi9PM3JYK2puZDcxb1hr?=
 =?utf-8?B?K1FMYkxDOHVrVnB4dlJlSnhneThnMHJ2b0srVU9mdGsyNzlxV09NRDVRblU0?=
 =?utf-8?B?UVRMaHJBYWpOakEydjVYVzNmdnErSG01eHR1V2hKTDdvMVJ4SDgxbmNnQUhE?=
 =?utf-8?B?VUxSQU1yRE8wcTVuVzVQYitwdmVIN3pZOFkyQmdxVkt5R0lZWjNsVEZnS0I5?=
 =?utf-8?B?TTNTVWZCUytPM2NFL0hTSktrb21ObGkxR3JBSHRUMm50bmwrclNjcnNFTHA0?=
 =?utf-8?B?N0VoaVJKUjZkNlltUWcvMGdOVmhCbGhaSjRsM1N5eDhmZ0MxVEpwRDNZVDdT?=
 =?utf-8?B?ZjZOYVI3YW9qcjJReTFmb2sva2Z0b0k3MnNVSE5va29LRzNOK295U1RDYkVU?=
 =?utf-8?B?TUl1aGJuTWdQVzVsa24veHNodjhNcDhuQ1BTUk1PTVBzS3pQUmVzSVl3Q3ov?=
 =?utf-8?B?V1ZrbVdtUVQxdm1xNUtmRXg4bGllMThvUzRQQmo0SVU3YXFOZ0h6NkxYTVNO?=
 =?utf-8?B?aVNaeFlTc01saUJUSnFQRFhRT1hTSjNDRTNrWmluMlFmYzBKbWFZMUJXM2xu?=
 =?utf-8?B?WnNUQUxnWDRXZ3ZpcGo2bS9PSUlVUFRvN0d3SXpGSm1mcnUzMjMxUmIxTEJL?=
 =?utf-8?Q?DN1WgFFGPaX1kBDRTJIszrTTLr1lUUO5bywbjnCoJC7T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a09acbd-f856-4fea-f044-08de15580614
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:54:53.7995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2NdLYOy+jJjmYyuNJ65i2Udv9FfwPB7VThlURJzm42HPS8HOY82cJqUSiZiMnMOIQ5OtUClVg0uLhqPocVP1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

These variables were read from the u8 array `data` and converted to a
`usize`, before being converted back to a `u8`. Just re-read them from
the source to avoid using `as`.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 943b0dac31df..dbe0d6e4a015 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -911,9 +911,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         Ok(PmuLookupTable {
             version: data[0],
-            header_len: header_len as u8,
-            entry_len: entry_len as u8,
-            entry_count: entry_count as u8,
+            header_len: data[1],
+            entry_len: data[2],
+            entry_count: data[3],
             table_data,
         })
     }

-- 
2.51.0

