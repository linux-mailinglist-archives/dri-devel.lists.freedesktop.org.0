Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A3BA9A85
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D683D10E3E6;
	Mon, 29 Sep 2025 14:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i/BC1Vf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4EC10E3E6;
 Mon, 29 Sep 2025 14:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJ6o7YOZcbEJdm3PIKtdvYQEl97g0cfu+16Xn0YfJPn0qidHcfrECn3HR85mxzgF3DfVVrWWsTJ1nUnM1zaMU2699Bqwc5giRcijzrWwcgJyH05We6H52R5NQdWvZx27Ke4sK3hLujde10cXmhc1aZ1zq94vcr7ZossyrY8QwfNJnqovekPhcMNY5oJW/mtOUgjXbP33ZIxCTwgqp0gN4BERup2CqUQLeGW4V2Ruo+2DbEXUfi8vE4BIWy+qWEVGuC1VUDkWp/7tZUFmiixREkT+NYf3Pmtv/AfiErQRDebpXIZicnbo0zx8xYgyY3jdwDVTnsruyc0mY3V1s/YTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykf1rpoQL2LT1tyd74z31WI1QY9iXi8BrOLlU/1M1+I=;
 b=SCOckdpw5WQJNYd4cvgnL6D2y010g+thwj6oHl1+LgEHCaGm1E1WsajqHVqCYi1kSM47sibU7t0Uuf8o1jLymdbKqWqQMx/LlxnpM08/wgrxKUL+x/pqNzRWJoMdC3gtAOyM2UlWwWl4Kh1Ju+jtWimNn/oDSnyvVPhc0fAonjAErL5Y15CY3OZU4KUcqcAI0w+7QpKFym2lbQQIt+5AvaZw1/JSq72Pc35VxNrJtvEXTIiieMVoWEIdEBzRykIkSm6EW7Jvdct8tMPFC2BT3of0DpTy97FgfYrkGB6fcE5hc53tyEQqzeKz8bvIgaW+OUzGPkAmXyXd7qaS5OoyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykf1rpoQL2LT1tyd74z31WI1QY9iXi8BrOLlU/1M1+I=;
 b=i/BC1Vf1s7jN4rUSl6BcPiYbqzlgInhCbDUXFlWrzvQlxJGZDyR8AmrqhgIVGSXl4HpWxMBjIWDnGVRbotVlC/E34189ejAoJi0d7brSBPjeMqao535Ps74CtfRy69JUZXmvus5vlS8SvTC6E63IsF85Skx288ge4wyoxasCR6yuRrSyi4l/RkF/3BFmD0J9WsxnRact6UOpXSQ8GC3uNy/9xkiNRxyxuBFpb4cfa90FfuQ3YwDlfi25LDo/8sspqez7MYawU4l4ace8CmuSGEDuaRs/5wbtlVq3qN1WKhK2K0dCc/loeSmLas+5n2+IV+nf5sTgz8C/zO+9ZL643Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 14:45:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:45:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 23:44:56 +0900
Message-Id: <DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter
 type conversion
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
In-Reply-To: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
X-ClientProxiedBy: OS0P286CA0159.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2906a09c-80ed-405a-6b93-08ddff66c4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emJ1cDhQOWRKNllncHd5QlJWcjh6QzUrYUxMeUVvNGIyTjdFaWszMU92cjZQ?=
 =?utf-8?B?bnFhNWFsV0p4emNON1ZFK3UzL3JlRERWOUhYSXJqYXVDazVucUpKZ0VGQlJG?=
 =?utf-8?B?WnZyQzQxb0NwUkJHUDZQWU13ZkxtSEdVWlBOOWp2dnpENUlLc2Y4OC9aTC9u?=
 =?utf-8?B?bDg5ZXRuOTROVVhMOUlrT0U4ZXE2NU9CSXB4UnFZOXhxYXVQUEYxcTVMK1Ax?=
 =?utf-8?B?aCtOQXRhR2hpV2F4TFlyNVcwdVVMeDZkajMxZDJNeXdHbkxtNEJCQ3ZhVkVK?=
 =?utf-8?B?c2NsSU9PUVVYUngrRUpTNHZWQ1hFYnNudm9ML2RKanUwQ1IxZHh2U3Z3M3hq?=
 =?utf-8?B?djdsSWI3K21yQWhVN0RtV3JoMHM1eERYaEUxckVCblFna3lkRUJ5L0RMRDVl?=
 =?utf-8?B?YzZjMFdRM0FQZ2owN2x4d2hEU3ZGMmxZVldDNlVuVFFzcE5XQlROQ1RoY050?=
 =?utf-8?B?WDlKQlJTZStQbFVzVkdPNzVVS1dZMHUwVmlnTVBqYzB2M3o1elFTbTBROGpH?=
 =?utf-8?B?eElmWEdXU2hCd3UwOUJ2eEI0KzFYcktwU1pvM1NNaUZ1bG1hV1ZGWDhUdjRt?=
 =?utf-8?B?NlRNYXdzd21hbTBMRVVQYVNuRVd6YkU5N2ZSL3VRVDdxMkJGUGxrRVliZGNY?=
 =?utf-8?B?YWpIcWk1OGliZEhwYXBUQ0RyS3ZZcS9ralpsdE5yaHVyNjN0Rk04UlRBZ1FC?=
 =?utf-8?B?S1pWY1hjV1JScmVsZzM5dWxSYjE5K1VyeGc4Q3I4bTJKUVNLNTFyUWxVdmNz?=
 =?utf-8?B?Q2h5Y2l5bGIvM1pNRmRYZEdWRU9sY2FYcXhhS2VqeXY5eGtYVEdDMUY3bGtq?=
 =?utf-8?B?NzFBN3JiOFRSMDgyZlRId3p3MXd6LzRrZ24rRCtXVDN2RzF0Z0hjdXZ1RFZ0?=
 =?utf-8?B?SUVEZEcyMXJCYTRWMUpGcXMzR2RmZnNTRkJIZ0NCOFc0T0hCeXd6SFBJeG1u?=
 =?utf-8?B?QlVHRXVMblE2aHZucnhpRng2VkY2cE5tdmNzZFFSMGxwR2RCbFNXK1pqaW5Y?=
 =?utf-8?B?OXNtSm5FOGxPdjN1Nmc2ZkNpQ1pHdkFMbnZ0OTd2RmJqSEZ0TUpQYXFIRC9z?=
 =?utf-8?B?M1VYU2svai9XRWdtWDJZQzFwU2lwU0RIYXBuNHpJRzRBcmFIN1dISnF3V0Jl?=
 =?utf-8?B?cDFtL1owZHZmbklHTTRGcHIyalVpMHVCRlB6U0VQdmR0Z2FsN3lsQTVOQWlQ?=
 =?utf-8?B?UFNCUGF6Wm4ydDh6dTk3cGQvTmdJeC9SaVpUY3YvN3dISm4zMjJrNC9heTBy?=
 =?utf-8?B?d0VTb2djNG51dzRQNitaOExlMWw4Y2FkSmdYNnZCZ00xRmo0NEI5aC9ybDVi?=
 =?utf-8?B?eEE2bUZ1TktuS21jbWhQTmhFaHlEY0ZDZlZHODZtcnB1S0o0MTJBWVRZQWwr?=
 =?utf-8?B?ZUlkUWJKazBjY0ZqUjBKb3VuZ2ZqeVQ5T3RiNE5HOXpvOTR3TlZJM2o0N0p2?=
 =?utf-8?B?RkNzOEZMMTJSWk1OdElHM0t6ZkZTZ3RWWEY1TndqVVRZZlVPY1FHNFNYZ3hD?=
 =?utf-8?B?VFo5ZjB4UG5KU2hMSHJPUFNJS1NJem51SXd4bStiRzJzbGRSMnRaSDMwMjBQ?=
 =?utf-8?B?UU04RDhSUmlGVWRNem0vVTdibzhZaERvU1VZcjJuY3RIZDVJcm40ODZXL01B?=
 =?utf-8?B?TjdPaTBNUCtyYWJ3aC9FemJqcmE3SUNDWFZJYUpNU3ZlejMycnlickNuWUtF?=
 =?utf-8?B?ZGpRMlR0MTZYZkxBM0VmclJZbFM4Z29BVVZSVzEzcFhlcjJGcWNtMkk1UGRl?=
 =?utf-8?B?M2xiVG9aY0dOUTJQdFFRdTVlYThWQTN3SUN5RmVFMUJCN1JtMVhYTXRhc1pW?=
 =?utf-8?B?akV2VFRsdnRXa3B6QTBPU05ZTmFWMS9JRW9KZ1k1Vjg2U2o5akc0cVRWcUk4?=
 =?utf-8?B?UnpDaVdwR0xhNDhYSmRua1M0NmNDZjZZOEVNMnFHRUVWTEpPczlRUS85THZ5?=
 =?utf-8?Q?MrqdHoIUE1xlCtQ8xKbCxpbHl76ECcB5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c08vNWc1Tllqa3VPOFlXaDluR0thRE85K2hpaXYxUENSb0k3eHNybjZ3b05N?=
 =?utf-8?B?ODN5VFBqelpuRkdFWUZZY1h0dTloWWQ2R0hGa0hmWFFYYnJ4NC9IcGdQaGNh?=
 =?utf-8?B?Z0F0U3RGVTV4MW1RVkwzTHZvYXVIR3NtQTlqdnJlaE04ZFBNclI0VEVPWklq?=
 =?utf-8?B?bkpjWU4xdnNoTDI0WDZuRTU3Z1hvVlR4VFZ0dEpsVkZUY0loOWl5UHZNeUx5?=
 =?utf-8?B?ZGdaaTkzZE9QNVlIUGE5YVlDd0ZaWG10d0w0L0h6L3VLdGNCU3laV2VFTXZt?=
 =?utf-8?B?K1YzT3g4ZkZQWkE3OFIyNGd5ZHV6Tkc2eXM3aWhyekxzTHhQM3ZLNDl1cUxC?=
 =?utf-8?B?RUs0aDg0d2tZMktyaDc3RnJCcVgvalMycVdjdk80d1ZoS0wxQ1pxb0dQU0JD?=
 =?utf-8?B?RnFPaGZBQUdLcDhERnAva2ZJbHVNNG45UmFXNzg3WnB2RHQrS1JUQjFUekNH?=
 =?utf-8?B?UzBjMjdjeUlMYWJnRHdSMEZDcUNlaDB2aktHb2E4TDlrS3l5aFV0YmIrQ3NP?=
 =?utf-8?B?WTZFY0RWTHMzc3RnZTcwSktHVEhtd2Zqdzd6V2pOVTVyRU1WUEdOTk00bWJS?=
 =?utf-8?B?NDRRVGFVR0l0dWFia1lCZHFiL3pyWkk0QS9PdTNiVlFBaWRNaTVSK0xocDJC?=
 =?utf-8?B?dEw1M1FQaG94WXhjS2R0aFEvS2lybU1scjJMOVJuVXpicmJKZ1pmbUxSb2JQ?=
 =?utf-8?B?SkVNNnJQbXB5YTUrK2MvREVJOVlVd21DUFpzenAxNTIxeWpWdndJSkQ0Qkdr?=
 =?utf-8?B?MHIyeUwzU0VlaVp4QlJ4VFZkRzdLdTBGZjRIamViQnFiREdqR3VGSDRsVU11?=
 =?utf-8?B?R2ZMZGZpSG5vUWhxelk5eHdRV2M0NkU3UGQvcjcxeHhDOGRhbm5ObHNqVzZm?=
 =?utf-8?B?RkJ0bjB1UWVIR214RjNHcGZOR2RwVFhrN0NRdUdNSGZObSswcFV1RVVaaFZG?=
 =?utf-8?B?WVk0Q1Vndjg2S284eXVaTnl5OUZHZWhPd2NlSEEzWEpIenc5SmUrZWs0aHZU?=
 =?utf-8?B?UW5DUFg4bmJyZTlqN0Zsd3phcjBEeUd0MUg5SS95VVFqd1ZuTjc4Q0x1Wnhi?=
 =?utf-8?B?bnhQTXRDbFU0V3R4RloxRGVwbHNmSk5ielZCVHBKM0JubitnNTlEcWFRQUp5?=
 =?utf-8?B?R2o2TWVzMkNhQU5ycGx0UzZNcmY1YVR6c2MxTGZpZkxUa3RFZUl6bXErZUtD?=
 =?utf-8?B?TE1xd2ZYY0ltcjFOYVk5Z2VQaG0rK2RVdnZMeVgyQlVHeFduMTJRb3plNXM3?=
 =?utf-8?B?VXBnT3pidkRyR2NGVUxtNWlOd1hZVUphOVByREJkNXdsUk9aeVZyQ0Z3WmVE?=
 =?utf-8?B?RFNmQ05EaXZwWU9XK2dqdU9GMmR6N1BXemUwUHdkTytrU3ltbDhuN3RqcnFu?=
 =?utf-8?B?cHozQzk5QjE5UjVYd3VPOVQveVJrUUwyci9rRHRpZzRJZkZTYlQxTkVVRjhQ?=
 =?utf-8?B?YUpIMFB4SlhuZk9qR2NHOG9JTEEyekZLVlQxQkJwSkZTcm1ibUxlODZkWTRp?=
 =?utf-8?B?SGcxdmI0THF4WHNJaDFiR0VkKytqaVNhUUdXQVo1bURFM2o3d2NjYmZ2RHQv?=
 =?utf-8?B?QThFYzlwME5DR3FhVXNQNXJ1TjFvMWFpTUpFRmg0Zno4OCs4K3k2QTJmS1d1?=
 =?utf-8?B?NnJyKzRYVHNTODYxWlBQNStmNHRGUjlsMmRzTnlPK2FHc3lRODVqSnlBakha?=
 =?utf-8?B?V1N0NS9aVkdFM0NacG83OXdraGkwWStDSzBXSGduTHFPQVA5TmpncW9zRkZh?=
 =?utf-8?B?WlRmc2FZT2JVYnNXWExuNjJwS1RnRXRHdWJ4Z09PMEZaRnVjMk5EWTUraUlu?=
 =?utf-8?B?SExPaS9iM3MrQXV6UkhIaDRhTE5RSHVWcGlnTFpzekZkb2Q2WlIzYnNuWFhE?=
 =?utf-8?B?b29WNVdHdmIrYlJFRG02eGpzZFJ4aHlvbzFnTjg5NTY4K2d4akdDNjhjcmp6?=
 =?utf-8?B?U3YrVnBtV0dhSzJYQnNIUHU5V0NRWk5hQ2w0TWpRM0VqWnFRNzF5ZUlCUkV1?=
 =?utf-8?B?bEhwOFZqMzFKRmdJVnViMkNRYk5Mc0h6MjRub0dkRFhnT0VVVzNpNXhNMXR4?=
 =?utf-8?B?SnB1TzMvMTZZakhhT0xybzhpS3kxbXpTa0l4aTZ6QStmR0lJdXBOWHlBT1h5?=
 =?utf-8?B?S200YlVCRGFJd2JkSkplYlByMllpM2dwWmhIQmxQVnFzdmR3UWx5WGd2VjQ1?=
 =?utf-8?Q?SF5gXkm+7sVqMUNLnXSIUvNLhoMgBdN1IJ6GGTF0H9dP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2906a09c-80ed-405a-6b93-08ddff66c4f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:45:01.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW13m0hkhvPuWT8Ne1eKTsxYhPDbUoBRxCqtg+KErpqJtJn6yqexFkkoj5fiHL2Av72Mw7g+ZsdYT0R/cvz2Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
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

On Mon Sep 29, 2025 at 10:59 PM JST, Miguel Ojeda wrote:
> On Sat, Sep 20, 2025 at 8:23=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia=
.com> wrote:
>>
>> The bitfield macro's setter currently uses the From trait for type
>> conversion, which is overly restrictive and prevents use cases such as
>> narrowing conversions (e.g., u32 storage size to u8 field size) which
>> aren't supported by From.
>
> Being restrictive is a good thing

On that note, I have been wondering whether we should not push the
restriction up to having bounded primitive types with only a set number
of bits valid, e.g. `bound_u8::<2>` is guaranteed to only contain values
in the range `0..=3D3`.

Getters and setters would use these types depending on the number of
bits of the field, meaning that a caller would have to validate the
value they want to write if it does not implement e.g.
`Into<bound_u8<2>>`.

A bit radical maybe, but correcness ensues. :)
