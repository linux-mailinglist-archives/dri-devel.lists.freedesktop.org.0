Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD16AE06F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0008A10EA2D;
	Thu, 19 Jun 2025 13:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OSHnJ925";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2DE10EA2A;
 Thu, 19 Jun 2025 13:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMUsksZvg4vedZn07tVMsKga98aTZIR6g8ceLdEFC+lu1eotyyHFBZfE3cqY6bKG5V8g7BZU8tl4lMwlfqHtjN8x8PdoGFTf5v4bRWu2iXON6S2grR56oco+3hhI02jmKIWqVTnP++Gs4wt8Lg2hl1rMFNocBQjCthxoFSRpKZzDvmmYD7j3JidbWZWRur35p4HJs4YBIc1BSD2URO20nVfdk9G+XbtHd3d6iMYTQqwLQ2/lPg7yTXUZhDLP2NWV1TTem0tbE+/ugD2mtwWX4zgvWwnvA4SGvAlAYB5wzlpJszRbSC9p+t36GqSRELiVVMgqFmOJcyBlBv/3SEwLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+4FkyeuBHpN6WZlZceOmpBjsWu2df/v8SoYZsWsfu4=;
 b=Y+gqTnHPd2kGV3BNTqeb8s+u2I6CShfc2N3gZk0xaYY6LAgn7pJ1KDisen+Oai7TNzxoTEZY2omDD2NjkiVp9mLcqrVLtqQYAgrMKAHAexb6LIOvRS0EnMg2B4VLKRQEqLltp3mEHAthqU1l3MOBFQB6QLMCCDiTjOozKlqNGAiVtlz/l17TUFBVBwLTpylEImHf5dWtocLZ6/MaueBBAU7mDz3vehyY8cCS/cpzFlRfWRttNwFIt7JS68Gz6Q6DuXWf5vEqPrTOGHesJ/5IIJjpxy0TY73U3+dZiNSOuL6DD3OC54rFOv0gCbszwiEabwtWfWNHY956Cz/alRkExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+4FkyeuBHpN6WZlZceOmpBjsWu2df/v8SoYZsWsfu4=;
 b=OSHnJ925BWyjSeBtOrfcPSnov9lbHuhF0+mNPYda28OO1CNan4Q4/2BvOgi/HulCVSJQ8kiKKcgTaqPIMgYoWBD9zooXOP62oa9JULXdR6Bo0/D7S/IuCPJJYEfnWHG8WgCX0nwzIpz4pDsw+icZ9SbbQpauxTiPTVqnmlLOXOXEK/kjzN5LT1B5nJMp33XB4BB7oKqHTYAxOsoLugC2+h8Sou81yY7J+VhGc9X/UkzdP+BcoGymt7HiAK/DZqeqYuf+BR46KTzfWguQKFTIOwqgADB1f2zWZmghJmQsX/7mAx3sTpv3QTZ4Ti1xwey4u4qg1S3DsodbmPVPX2XizA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:30 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:46 +0900
Subject: [PATCH v6 02/24] rust: dma: expose the count and size of
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-2-ecf41ef99252@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d3be07-74cd-46c4-c9a3-08ddaf349f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck1nWC9GL0VsUUU4eWZCaURtVllSYjJwbW1kR04zV3ZCV3Fpd1RyWWdIKzJQ?=
 =?utf-8?B?OWF3OEdlVlNwb0FvTW9FU25tbi9wNjliNG1sNWo5ZGxDMEN0VVpiMUErZDMz?=
 =?utf-8?B?NnN2RHlVaVVUUENhY2pIQTBjaDZSdTlVNkorcXM5TVZSQUd3cU5qRmhJN2Rv?=
 =?utf-8?B?NHpKVEJLUkp4L2xCYS9PLzI3cWZ4dG5MWHA5NnhCdmViQUl1bXRwSFRlRkFS?=
 =?utf-8?B?M0RyZisyQlVTNmlCWjRaVElWc2xUN3ZwMHVPaHo3S3F6TW5McVZCTmVWbFdl?=
 =?utf-8?B?dExmeUpOSWFhUXN6ay9ORlUyTkx6WjBpNUNDekRYWEZkTGtHSUE2YWt3a1dM?=
 =?utf-8?B?ZloxR0pNTG5MN09vcXFKNEdvVTBncTlYbFllNkoveUlKOTgrS2NSMWxmSTha?=
 =?utf-8?B?bnhrY0ZldVVML09SaVNKdnliWGNIbXdIWmgxU1UxamFielNGSWdTTlB2VEFW?=
 =?utf-8?B?dnRINmdSU2xzUGQrMWVrdFRvVUQ2VHpCN0tKMGU0K2NtTVRPb0d1YUx2OS93?=
 =?utf-8?B?Uk0wSDhXYzhUSmZFVnlFcFpJZk9uQUN4VmRncDQxbEdURFErVERYa05BZEJ2?=
 =?utf-8?B?eWV3WW1QYWN6Q3dPRDVDaitibldWR1pEc1p5czNOQlc4emVTVzYxWThZR2Q5?=
 =?utf-8?B?SXgrdGRJNmlOMTFMOHo2N3BXZUk0ekRxZGJsemxCNWtGbVdqa1RianYzMWJ3?=
 =?utf-8?B?N2J0RnhBR2YzZnJTOHFOT2VsYzF1YUd4U0cxcmpFanVwQzVQM2NWUWFjbHRn?=
 =?utf-8?B?Rys3T2lnaVBuUFR3Rmkyek1GUWRvUXNpRTNMY2l0YjY1RWdJOGlVbDNIY0pa?=
 =?utf-8?B?YTIxV3Nyd3JDTWg1eS9NMGNKbTRwNnFuTlRGc1htaGtwSGZ2akJNUXo1Nk5X?=
 =?utf-8?B?V0NIK0UrdGk4NTRmaE45aTUzY0c5TzNwMy85eWpLRUdrQzhNeFJlejlVbDcw?=
 =?utf-8?B?eURoOEd1UjZFbW9Na05aNDlVK2tsRFZHTzRKb3R0d2J6MzVFR2dxdFhtUUZV?=
 =?utf-8?B?ZEp0blo3cFhoYkpoWXluRVFKSlltUEZ3RDFiQVFJTGNPNWZYeTR1eXBKVndy?=
 =?utf-8?B?cXFWNTNMVFdERDNqcm03ZkRUckFjZWV6SE9vSnZLaFVJcVZpMkFZVEdGR1lO?=
 =?utf-8?B?RC9IOTZCY0xNUUg1QUZhQWNPZEhtQzh0elRRUzJ0dDJrQ0x2N3FaT0dmQXpl?=
 =?utf-8?B?aUdyZklrTUxqbngzR1lTOURqS0xZZFZmRDJuNE43UFRrajZVMi9sTmRzcWV6?=
 =?utf-8?B?RU01RG81NU5RbmdYUWsxYTFReTNtcHJnRWFQckc0cWE3QlJWRkhDUUpWUFhu?=
 =?utf-8?B?djRtLzZhbERQU1BkeWpIWnltd0k1TnpMT1JaWmZwNzlNMEs2R3YrWEoxTS84?=
 =?utf-8?B?bkJqY0lpYmRLRmQyS2JKUStyZEhJOTNhZUdOdEFOanJJQVNoVGZ4RU9Hbmhj?=
 =?utf-8?B?RXk4VlFOTmFFYmN2MTEzQTRXSTRhSjlneFh2eFZKdlZEYkI2ajM4OHZQOHlH?=
 =?utf-8?B?Zzk3eXN5V0xTSXV5TFNEOW9hOW0zcXJEQ2Z5OHJXQWQyc3cwRm9pVXZWVHRM?=
 =?utf-8?B?K0VFTzdnT2R2Zk9RbFZlSVBqMEYwUmJEcGVoeXgxVzE0SFNKYnMrZDN1NEVD?=
 =?utf-8?B?WHBGRzVmZ0JIN3ROazFiRnF4TFM4SXpWSlN2TVNwcFdRTmYxNEhhaHRMMUZi?=
 =?utf-8?B?cWsrMnF4U3Z2eDJkbGlXQ2tZL285M0Z0V0Zndm9jME1iTUxTV3JrOVBjQzFK?=
 =?utf-8?B?NXJ3UWg1c0tkVURJelFIbXpCV09Ob0VqeWdIRUlaamNHNzlUWmhZS2RLUEdo?=
 =?utf-8?B?V0Z5TFRxNXJGWWNGYzNEZ2pjUFg2Z0tKVHNUMFcwRTlvSWlRTVZoWUZxM2Ew?=
 =?utf-8?B?cHZCZkxzWDRQK244OUpJV2RVLzNId1U1bHVBVGhnTGdVNVVoc2w5bjJHVjRj?=
 =?utf-8?B?MmZ2WG1sejJYOEpBN3ArdlA3aW5oMnh5MUMyb2cyUEI0d1NCTG5keHVhRWZR?=
 =?utf-8?B?eW9vbDYzQkZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0p6Rk9sbkgyb0N1aXl2NTJaeUFkTWtwUHE5QkI3UHp1NVdLeXhjdlNhVjZM?=
 =?utf-8?B?dHIydHJhQVc4cmlzRTR5akVqdVB0RUM0cU45OTU3N0RmS3FuSzZkOVJkYXJi?=
 =?utf-8?B?Z0kxYm5oZ3JlVjg5Q1JEcmJSeTlnWFFtdHpzeVBEcWF0eXdYTGdrbHhMSng2?=
 =?utf-8?B?cTg0cEdWZ2x6c0thZW9mdDJER29QdFZMMUtMZ3lCV2g5c3ZQRTkrUWZsWll6?=
 =?utf-8?B?c0pCNkhJQmhMSXVQSEt3eDc0cHNocGR2RFAyMGZTa2lFbGd6Wk8zK2Y0Z1lW?=
 =?utf-8?B?dnJscW1LZG5pT3BXN0lDd3YxSVZZNmhxSTlYakk5b255Nk5BcVFpNUQ3bDdy?=
 =?utf-8?B?SjFuSWRMU0ZQNkMyUEVVOE1IT1JBUURxUWcxd2hqMXNscVdwWWxQTHhpTXJ6?=
 =?utf-8?B?MnpEU1h3blFSQUFFbHRVZkZmdlBpRUQ5OWt0bHN5Nkp6RWpFdzhoaWFjQ1Vk?=
 =?utf-8?B?emo1NVdldDByTHpodUplN1lvVnBHOStjdSt6R1RNak1LMTdhZzV0YUN0cmlN?=
 =?utf-8?B?QVh1NkFReGI5TmQ5ZGpCOFJnTVdWS2YrcW9naFBBekI2Z1RSZkRjS1hNaEN0?=
 =?utf-8?B?bEc4TGNGL3R1VVVsZ0lrUFFNMUJMSTVzY2lWYWZPUUV3dmUxSzlDbU9IYmtr?=
 =?utf-8?B?ak5WL3Nud0IxbGlyVnc0RWt6TGs3N0tNVm11U1VzWGZIWkpUS1JrblV2bWw3?=
 =?utf-8?B?Z0hRa21tOUpPUEVUcmdPZjFjZTB5RUw1S3dPS01YYVA2S0Y4aFBab3ZxL3R5?=
 =?utf-8?B?Vk14NG1GMHZFdzVwQ0gvOVV2MWRqcnNGMENQSXEvbHhWREVPNmpxMEN5OWVQ?=
 =?utf-8?B?MGlaMXZYaFRaZ1ZaQ2JoUmFBMEpNT2YrMkh0NXlWQi92RzdXYTEwQzRMaFU1?=
 =?utf-8?B?OVdDK2gzVk9ldGJJcDBnTW42d2plb2FhbHVQUkJVM0o5cmcwM0V4ODlQRXZv?=
 =?utf-8?B?eHNPd2hnQnZUL01SSmYvOURFMm1NZGY4UCtNbStsTThvSUZ1cHpMeS84SlIv?=
 =?utf-8?B?bTBmMWxsMUJyWjVva094S2Qwa0t5TnlaN1lMTWl2SmtrTGltTVdtN0tQWEQz?=
 =?utf-8?B?Q0VVRFd0bThUL3BBY0Y0K0pWbkswbjNETmlHVWhoSmdaOVlxNVQ5WU9mSG44?=
 =?utf-8?B?RXpyTDYvRWlPZmVtQXpSWEY4SEgxVXhGVCsyWXJEaVhOWXBJS1A3ZzZnZDRM?=
 =?utf-8?B?R0d2SEVQdWZzMTN6R0JMZk1EcFNUYVpQRnFGOEo0amRJNTR6bE8xR2VTY2xx?=
 =?utf-8?B?blNpY3UxWTNTUTNpTnYrWU5iOWQ5NGZ3RnNPN2dvVE11WlZTMW1VQ2F2VFR4?=
 =?utf-8?B?cjRwR3lUVlk0UDRRbGZ3Tml2M1JDUXE3WVlJeWgrWXNtSXpJcmtrSVFGRjhz?=
 =?utf-8?B?MDlic3dWSFhnZ1I2MG5VdGVnT0hTVlZmTFp3cUgyZzlnSHlhaDVuNG5mbzFG?=
 =?utf-8?B?bmZLZFNaeVVFdndKYWJXWElGNUluUnh3Yk9rMG9HSFdzVWdlaWVzUmxIVDZI?=
 =?utf-8?B?cXBFK2xjZ2dESU1FUFFVaUpxUEZ3S21yT0J3eDNubzNBeEwzRUxUOGNZWHM4?=
 =?utf-8?B?ZzNUZXowYlBoaXVoVDQ1SnJCdXdHK29yaWRjWmllTU83cXFhR3FqYVF6NGNT?=
 =?utf-8?B?SUpwamtnV0U5WldEVTlXdGxxNXVUaVlsTzVneE5LbGhKb0lRVzcvckFNL2FU?=
 =?utf-8?B?STROSk9iY0FrV3d2YlB2SXl2SVRtRG8xUXB6QTBhaFZzTCtqV2JOdWpnazRk?=
 =?utf-8?B?Z0JRS3JUS2Y1WnRCQURuelAzdGFIQVE2aGhhV2RHOFZPMnVNTmd1dHVUOTNq?=
 =?utf-8?B?NTZ3WE5mV3pjT0hZUzZzQUs4N3llQTg1dVNJUTh3MVJhWHFseUl2U3ZtS2JG?=
 =?utf-8?B?NkZaT1hJalI4SnExTmI5cEJtc1lrVlRLS3BkWnRlMUNyNlFTUUFFN21rNnhG?=
 =?utf-8?B?NmxpeHJyN1FVZ2lCcHJvd3VGQkFyaVhYRFI3cUhCN1ZGaVByc3NCMDhpUGg2?=
 =?utf-8?B?TlJoZjlzNjNFUGJiTldJbDBlZkd2UlRUejZOUXgwOWxBWWJtbVpITHQ1bzB3?=
 =?utf-8?B?YUZjRk8vQjZFVDdpNWp1bzZLZTJ3dVVnRlFyRi9KUERQOTZIWFNGbVhqN2hK?=
 =?utf-8?B?dyt4aEhOYTV6VjRRem5iYnFjQVU0SnNyN3J1Uk0vZURhZEZuZUQ0dm5TSEQ0?=
 =?utf-8?Q?ttFktJNUJrpcByY7fndWCMwOpDDSaACrWOgym1bSvTZ2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d3be07-74cd-46c4-c9a3-08ddaf349f6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:30.5651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhB6o4Fi9uVRbZl4noPKLcLapNX52yowki0/KHv9cIECjiy26xMXGzbTkc7RX65GL8pDLc0TZi/ruKyZNxvWxA==
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

These properties are very useful to have (and to be used by nova-core)
and should be accessible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 5fb54714a1600d97b30b24f344081f5558d43452..15ff639b3067d0e4a39e181bbe709a9c372a591a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -114,9 +114,11 @@ pub mod attrs {
 ///
 /// # Invariants
 ///
-/// For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
-/// to an allocated region of consistent memory and `dma_handle` is the DMA address base of
-/// the region.
+/// - For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
+///   to an allocated region of consistent memory and `dma_handle` is the DMA address base of the
+///   region.
+/// - The size in bytes of the allocation is equal to `size_of::<T> * count`.
+/// - `size_of::<T> * count` fits into a `usize`.
 // TODO
 //
 // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
@@ -179,9 +181,12 @@ pub fn alloc_attrs(
         if ret.is_null() {
             return Err(ENOMEM);
         }
-        // INVARIANT: We just successfully allocated a coherent region which is accessible for
-        // `count` elements, hence the cpu address is valid. We also hold a refcounted reference
-        // to the device.
+        // INVARIANT:
+        // - We just successfully allocated a coherent region which is accessible for
+        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
+        //   to the device.
+        // - The allocated `size` is equal to `size_of::<T> * count`.
+        // - The allocated `size` fits into a `usize`.
         Ok(Self {
             dev: dev.into(),
             dma_handle,
@@ -201,6 +206,21 @@ pub fn alloc_coherent(
         CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
+    /// Returns the number of elements `T` in this allocation.
+    ///
+    /// Note that this is not the size of the allocation in bytes, which is provided by
+    /// [`Self::size`].
+    pub fn count(&self) -> usize {
+        self.count
+    }
+
+    /// Returns the size in bytes of this allocation.
+    pub fn size(&self) -> usize {
+        // INVARIANT: The type invariant of `Self` guarantees that `size_of::<T> * count` fits into
+        // a `usize`.
+        self.count * core::mem::size_of::<T>()
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr

-- 
2.49.0

