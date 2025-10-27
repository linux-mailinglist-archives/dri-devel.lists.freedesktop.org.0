Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE1C1019D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D0B10E54D;
	Mon, 27 Oct 2025 18:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t1CIT+n9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011009.outbound.protection.outlook.com
 [40.93.194.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFE010E544;
 Mon, 27 Oct 2025 18:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+oKoeni5e941iH25QOUSsRLux/FaBRz30mxoFAlwciSLLXAUcxbS8uRVB6x7P0/OoVuXrR2o5xX9JnafUvJs70ie4IpjDvULwv/yOViq3c2xBxeiSMMzZKMznkUcX3GFQy/yQFwuPQiFGa94S8YyPxoF3gT8iUigmyjwdbv/14x+tPGZ4ViEhCkTAWSlVgWG35RuxXCuwm8YjzYSxt6QSDoUpfzlLRze9D/ER7PR8bSYPd3teL8kpwLPdUquRPWLkSfZ6iJWGcigL06ez5MwRuNNksepAc9rtoAv1UFGcP4iY/uEUyGNqKYfhXpPFpxvkj+ePCXyHqnX3Fi8okx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3HI1NzA/Of9P67y+pjugCCbvMjdRgUMAq7c/0s9KNI=;
 b=OIdrn3Rn/lZv/D4bVjVPcD4f6q0mnAauSmQTveHDuFP6mrsrFJbDp+GX/vckk+juKhC0OuX2MwPavlqozeVzMrkls9zBAfpE4QuehfreACOK6PSWYES3A44ar6vZyI0yWSJ9Utbsj5qI4UJycPpwB6Qc+IfhB0bdopl7/WTo0lLV2aMQmiJGknf4ckH800UMXdn3fieXAeB+pT6Jyt/O4jlYnU2inTSOmt/u1oYEURUFyxH896UkszNcotq/g36hci6YJGt9wNWpborrqo18grnIAEko5toFjrk3Q4ZzFfQZgNfmTdG/qbGoI4oiTeBhBexs9xouJeEBWkxji4D4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3HI1NzA/Of9P67y+pjugCCbvMjdRgUMAq7c/0s9KNI=;
 b=t1CIT+n9AYcAk8dVioRFtHW1u0SbEtp6phmi9pFKJQmgFNi3iNjq7usXjcrvMEMhaiFP3lVi8VOl2xg5Rng+LZfyUrjcmjJPiowF6LBARbYJqNWLhzIWBeslRnNPj/f4ws6GquJOPTBjrNDOyxIthKo3mqfhaeoUYJnM7wTYGrib5w0K1hSPNxsMqw2pNNECxcJmnXZ4+vVjiILGwbWCnjv87DFk9VuyJTFrTswS1IJvm5lU7FgQLAHtb1sd36vF4bLoZ1XqAAwUUdeXRFHGp95AWaoP43AkYUmF3tEXOfwj93f5YwpeuzCD2gPdxuNG+5HoRELeGWq6xHCq0ORtcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 18:46:42 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:46:40 +0000
Message-ID: <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
Date: Mon, 27 Oct 2025 11:46:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c8f06c-eedc-4914-ddf1-08de15892a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0t0alIxTUZyOEsvUTdWdFdtM2VCZW15ZDBYSHBQdWprREhsQ2t4Sm15QjJw?=
 =?utf-8?B?LzNOZTkvbFVLVERkTEM1eTY4MzFLekJkT0daUWMxNnBTYzBwQ2QxZmlTa242?=
 =?utf-8?B?NEQ3SjEyM1VxYTQxNUtXNzhZSkRBODVhamZaemR3bWY4RDZka3liMWcwbkJT?=
 =?utf-8?B?YWZQQ1hzTWRRTFBjNEZoUUhMSDBNQkJWVFk0UlFOTjhGRXVlcjZEdVZUMGlM?=
 =?utf-8?B?K1F4U0ZabGVVbUJ6SWo4Mi8vUXovTW1TU2ZCWUU3RWlSODNYbXlDRVY5WkYw?=
 =?utf-8?B?bkNCbDJGUFZZTFR0YkJoeGZFZlRFaXpKOHoyMGJWWFFsYkdtSFZ3dmRwQWZq?=
 =?utf-8?B?Q3dSSDBxOHJzSUdsb2kvUW5iVFNEclZzMnErSUsrTCs2Z3RqM3k3cVZsQkc2?=
 =?utf-8?B?VUIzckZIWkJUejd4MkpLSHVYVVFTUzRqM2pxeFV0Qzl4Sk43aS9Lc0gvSTJQ?=
 =?utf-8?B?ZkZ6OFF0RjZsZkMyK1UweHFoNHNLWVZVcERSRFQ2MHczQlV4NVNuaHFpOUVt?=
 =?utf-8?B?TEVXVHUwaFAvSEg2dE9IRi96V1kzdEpGd1pDRE5iZHY5VzQ1SHhBQUVSQ3lw?=
 =?utf-8?B?eExZZmJrd2dwMTZIejhlTTJOTUtQTWc1V3lqa2plbkNGWVdFL1NmeGgrWlhT?=
 =?utf-8?B?YWJHejA5Q0tmL3pkSHJWTE9tRHdXZmMrSWUxWHJOTWI2L0NQVzVPUXVKR0py?=
 =?utf-8?B?LzlXdDkrYnhhcnBnNmdpRGJhRHp3UTFiaDMyaG01RFY4VUF2ZE0rUHp1cTZH?=
 =?utf-8?B?Mk55M0tFRUlKczRmK05nakZYMEFkT2JvZ1hpOXlwdXVMUmdpb0hIY2hpYUFq?=
 =?utf-8?B?T001NXQ1b21VRG95UTBCa0J6L2kxdWREK2dmVkVPVFJGRGk1akRyL1V2cmZn?=
 =?utf-8?B?NTE5VU5SSitaME42RXczWmJUVUlyUk9oM003K3FOMXdZUGJIMktPaGR0UHkx?=
 =?utf-8?B?UjNML3ZmbjFMdDl4Nk1PQzVLWk91b1RlK1pxdFhEK2JaRSszRUp3K1pjQWtl?=
 =?utf-8?B?MW8rVUxCaHJOaUhFMW1YY0JuaHUwbkhSQkNqSHJxQW15OUZlUTFnVWVENTFh?=
 =?utf-8?B?ZXdTRm9iYWlzUDM2SXhJcG9nbzVsTWRJOVJuYTlHb0hSRXltKzlGbjAzeFk5?=
 =?utf-8?B?WnYzNDliRlE0aVlMb1RQTEtPeEVOVlVjd3NqRkhIYTJhbEd0Y3paaXgzSlll?=
 =?utf-8?B?cU1VQ1RCTXNCbkE4Q3RnQW9TOGZIQ0tTRVBuVzVlVnVVNG5pWmRUTDROcTFX?=
 =?utf-8?B?aEZiUDBiN1Yxc0hpL0xBMjMzeG53cS9TYm1kOW9PbC9pekV4K1M5WENmQUtE?=
 =?utf-8?B?RzlQZnlWK2Q4RzB1bjd1Z0FJUjFwVUlVbWI3QnB4NXVvcVhoeFZPWlB0eHNE?=
 =?utf-8?B?MUVtUFQvbzF6SFBVczBoeXNITEYvYVY1REVLTHFOWDZ4cnJack9FL3lDNk10?=
 =?utf-8?B?SGFCMHBUaEJXN09tc3lGcTlqSnFGWkZWcEhlRTdCQVVMMVd5b3M4TzZKaHFH?=
 =?utf-8?B?YUJ3dDdQY3Rrc0ZTRFlZN3Nvajdhc1VnUEZ3cW9pT2haRkxicU9WdnNDMnZa?=
 =?utf-8?B?ak5JcmFDNkQ1aGlvNUdldDlGQnBDamRMVTNEVjdkeFR0TG5VR3YrV1Bmd1Vo?=
 =?utf-8?B?dzh6K1pHcUFqckkzRHJ1dE9DSzJCVHlPcHNsVGFVdlBIRDdGYzBoZnhzdTQy?=
 =?utf-8?B?RjRvOVA5MFJWMlY0YjZ0RFdCL2VPaElNYTBPSG0xaUhkRjdySWdkeWlyMGFj?=
 =?utf-8?B?cGhvQ3I2cTBaYy9aWUp2QmZMdzJSWC9iOVdCRGdhTlJoSERjdlAxMTNHQ1RL?=
 =?utf-8?B?Y3MzWHNRZ1FkdVFtRjF2cVM3cDh0VE1wWHpwRnBTY2hWYkxhMmNZazFvVzBP?=
 =?utf-8?B?ejVBdjdEckhVMnNQRFZMaFprRWVDMFN3SU5mY1FRRktOVVNDT1Q0Ym15WWsx?=
 =?utf-8?Q?VWtHD54zZIq+UHJrIKm086TstB8FcJNf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BtNEh3U1VTQlpRTVhxNmNpcWZZQ2JFSGV3R09TM2tSUWZ2VlBEcjQ4U3d2?=
 =?utf-8?B?ejFSaWxRWUZ0Skg2WnBFSVBxdEkvYU5VTEhzK0lEcXNqNWhYWnU4cWhMeTM0?=
 =?utf-8?B?UzYxeVNLdVhOZ1pGMkJnTGhFUTJldC9yeGtRVXpJdjVMZ2RMWUR2YkFyRysy?=
 =?utf-8?B?eVBLTkpjTlhYL09oaHdXRDRhTW1rWm1JN0lhSXZ2VDhNNGppM0srbzRoUUNR?=
 =?utf-8?B?MlRFcm5PV1AwN1VIek9kWFVHNkVvYTlZd2tVSGxaV2MyVG5vN25IVVZZbmVn?=
 =?utf-8?B?bXhtTGNCNVczb0t3SWM3MjdyeVAzYytYbUNySWNva2lEc1Y2NlUzc1pnNDB4?=
 =?utf-8?B?UmpET3lVZzJNN3dsRFFRSnAybkVKTzAwVjZQV2dMb25USVZqUFVpdVF5MUFw?=
 =?utf-8?B?N1UxdFlYN2Q0R1lZZVJTRHB6dC9ja0lST1lnRFZUS3FZM2NDTXh3SWs3MjMr?=
 =?utf-8?B?VjhFVUlmNEg1ekdaWnJtRk9LTG9TcjZXYjh1enFPdkhOWmkxeVQyakwrb2Rm?=
 =?utf-8?B?b0Ewd2ltRmlUTmpqNzliSlF6ekxtNzRxZHVnaWJMY2VHVk1sNVlBTzJldGVY?=
 =?utf-8?B?MHE5ZUhVR2ZoMTI2eGpXTkFpb282UTV6VDhGbC9ZTzRuV3VaaHk5MWtSTGpK?=
 =?utf-8?B?LzAzUmloM2hSRHJOeHdEZjdEQ2gyZUt6WUdEK2oxeWtzVi95OStBeXVEdUNO?=
 =?utf-8?B?eVNZdmljbDNWZ1ZsSnROcHB1bDhhK0liODF3YjFMOHFZeXNmdS9iL0szb0JK?=
 =?utf-8?B?YWRKVGx2QUVmbnB1S293SjJmMzlzbmNlTk9ibWVNZCt6dTMwRjBRRjZQdmZB?=
 =?utf-8?B?NHNGS2xXeVF6VVFVRlJpbGR2UFk3ajRWOVlkanlacHplRnhsVFNLVVNkdXVx?=
 =?utf-8?B?b1JIOTVVek1JRlZ3ejVIcE5wYXdDRDhVN2pGd2Z0QjdqVmRqankxZlFmdktB?=
 =?utf-8?B?eEUwNGgyZ3g5aHFCcVBJVG1pMTJDSFR4U1VOSy85SHpBbHNnU1RWMUxxK0hL?=
 =?utf-8?B?Q3lSUU1pY2hxbldNM1JPTXg5Ylc1VXY1VXhHWnc4VlpXNWpsZlpqRkxXUmRU?=
 =?utf-8?B?UTFPLzEvNGpXUGs1Z2tvNnh2K1JCUmxNeHhicTN5eXltQWNJMUFMNis3aTZY?=
 =?utf-8?B?anB3WnZHT2Z1TVdKK0J1bGV2SmxoOGJEVWJPQ21oYWRxOTJ4K2tpMEUxckxs?=
 =?utf-8?B?Qkx4eXhmbkQ3N0Z5aEtEZ09WMnV3ZEJ4NCs4RjN4QThWMXk4UFJPNDBRcWtu?=
 =?utf-8?B?OG1pa21uK2ZiS0Qzekw2VXJBajBscmNESzZZVG1yUjY4N25Yd2Rza3A3TUp2?=
 =?utf-8?B?YmNxSDNHODRFZHVQQkhEYnk5RldleWVxYS9KaXNhRnRwakRJK01zRDFrSllh?=
 =?utf-8?B?Wm41VnMwODliUjlPSSs3WE9oSVpkTWFPbW1xV291SVY5RzZKOGZ1R0ludFk3?=
 =?utf-8?B?eitWcVJoVXpsOStyRDMzZytPSGpCR3cyNVRid2Y5alRhQVo3ZFVNMnIvdm5w?=
 =?utf-8?B?S0hnZnFvaFhpdW14UWxFTEhHU0gxajY2Zlo2ZWllaUtKalUvQ25EUWN4azRI?=
 =?utf-8?B?VHl0R3NycFg5RzhISGhuTk1FaG5ZQk44Qy9SWUtXV0hJOGNGRlBETFFQb3ZW?=
 =?utf-8?B?ZmtkQk0yaXNNb0ZMMk9XcUdHMGFxVStrK1lRV1lNTWVMTXdTK01qVmxlNnlE?=
 =?utf-8?B?Vnc1d2tGZXQrYTR3R25NVkVObmxyWHM3dGZhU3IvRTA5dHYrSC9jdnV4YTls?=
 =?utf-8?B?SUR2NHFaQ1g4MmhzcVZyRkpxcXdPSytGUWw1eXd5cVNXSU1CS005dE4xeURB?=
 =?utf-8?B?S1RacmVsZnR5djI2djIvTU5ORVBVVnBDcTd0RUdwazFITDFXQzRMdTBtNlFY?=
 =?utf-8?B?M0RZanNZNXFuWk04YmxLazBuNmpiaWZZUmcwMDF6MEtCQk1xY3laYnUycjJw?=
 =?utf-8?B?dVlCMW1vTzJQYWl1VXpXeXg3MzdoNEtrUHdHNXRNOVhCeENOQVRkMEtnT2k3?=
 =?utf-8?B?bkZkcGdIeVg3SC9HMVlRWmd6SDBVWTVzSk03QjNWSnBaZ2duQlMzc3dBN0x6?=
 =?utf-8?B?YVFRUHIvd1cyUjRsN0s4Y2pqVXc1elJBdnA3SWpRYkwzVWt5T1dHeUNxeXhV?=
 =?utf-8?Q?rvhv92thf+vAn0cyz9AHDxDNW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c8f06c-eedc-4914-ddf1-08de15892a44
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:46:39.9017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfJZHToLRQGttx6OEluopOzl76wQek7Vi6wxkybTrAlyLBK0o+okA78ot8Orf9ypdMaVreMLA9Q1s0LKprHuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488
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

On 10/26/25 9:44 AM, Miguel Ojeda wrote:
> On Sun, Oct 26, 2025 at 3:40 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
...

> Regarding the `.into_as()` name, it makes sense, but it can be a bit
> surprising when reading out of context... The standalone functions are
> super clear, in comparison. But I am not sure what could be better.
> `into_in_this_arch()` or similar could emphasize that this will only
> work in certain architectures, i.e. it is "an `into()` for this arch"
> rather than the general one.
> That would go well with the idea that you didn't implement it for
> other obvious types, which I guess was to avoid developers using this
> instead of `into()` by mistake, right?
> 

Exactly: the into-as, from-as naming suffers from *appearing* to be
familiar and readable, but actually, the naming gives no hint as to 
what it is really doing--nor how it is subtly different from the
basic from/as/into standard conversions.

Instead, we need to add something (almost anything) to the name, to
make it clearly different from the from/as/into.

into_for_arch() goes in that direction, for example.

thanks,
-- 
John Hubbard

