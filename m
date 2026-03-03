Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJapLitjpmmYPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 05:27:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43A1E8D3D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 05:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55410E624;
	Tue,  3 Mar 2026 04:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gi0giFMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A807710E624;
 Tue,  3 Mar 2026 04:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubUtvCE3DCoR+u80m6zBa1744+PHiyWzvrFaFTKsAPQbwv0f3dk5hvWU3CTtf3rJIndO9zl6gnD5F1Hk3il35EyIjGwEkQ8Ac99at7qsT3C1w4+IPA0H9K+aYje0p79tCgWLmqFfuMc8Wx1WE5rEGpL1rur2M2pZVZ0PzLGsq8Q7enHP1srHp1j/KIsQ/heDhOhWnQwNQVfpHks7RAPIIMov/dM/L9vNcxFiVk4D45+WQIvgmekm6q20KZwluBAgB+i/23NzdXeDdhF8GDGZLTdhfviEa80N43u8UP873StAZyn4KF79LXpJ0i7J7lUsUciKAQQ3fOVquzqYlcgV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU2lRUwIMm04TgzhzF/wwV+lVsRlCAVFGam+TZwYe9A=;
 b=GF8j7caHA7ksAF7TTjeLQNqInLi4QIcxcoVXVQRUQvta99cD+oQEWxSxJxWnfEyobOAaU4OijKtv3wMa7TkvQN4TKOgOyH7oIOUjdFHINGuX/HZY9sxxR6kI6Oh3p0hceKGyEiom4fPw7C/8ctXka6nmmId5jeVhyOWhV7yPbZUWj+q9hqBc6wb1nYFALY5IPG1MwT7h+gf6szUpDd0E32FXKw5pknLv9XeQK5Lm0iImi6JkcGcRab2BRd/pEVgLLcK3fsew5Y74WBfaLTiWomLTFKDr9Pu9YK0T2lB3mkwsiMcNf25KzmdwjspW1BSoZZmh7eIgSY4bXHbMW208qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU2lRUwIMm04TgzhzF/wwV+lVsRlCAVFGam+TZwYe9A=;
 b=Gi0giFMryZ2fuyalfitmp6JG8+H8OwozikXDzsEKtXZal2UXjgX6KyD8URaidNu4zqgb5mqnJmdOjfuP//HtlKgLAKrjl/XU0AzPPK9bX0iMNIoWBan7zTagF3TplT+fdThIpkHXc9j/EslnXw6yMW3M+LFUSEjFEHpjwSksjxDfkFNUAwTeE4/Is7GTYJlHSG/85HkeQL7mWNX7mQpq8cDyDeUa5Rp3KEMK1OnMfFbv3HLgFGMdUFH3RCUAVlFYLqg4iQwu1lNaLu8guX+Ohz/X8jlWg/C89uP/0NOb+iMwR6zJJ9bOrXBKzlMmJhZwacEAGmZWuRjv4Lg8vB1mBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 04:27:13 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 04:27:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 13:27:08 +0900
Message-Id: <DGSV2OSW9KKS.1JSIU4TD8XRIN@nvidia.com>
Subject: Re: [PATCH v4 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Zhi
 Wang" <zhiw@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-8-c011f15aad58@nvidia.com>
 <DGSBHXT0W3VH.3S2OI2EAG2BP0@nvidia.com>
In-Reply-To: <DGSBHXT0W3VH.3S2OI2EAG2BP0@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 05993a24-924c-4bda-d2be-08de78dd2462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: elrKagxW9LGg9vqtIRF4aP+zRl+6CAvmg6esG5K8mOjx92nKMCpKgHFaxa20xTAFlyeujAX6BxZDsiW32BRQMVZ6Nm/tk/dY75cZfO9MpdVU6GR6xkn9oQx6uhNIav4R8jH5NlPExb0giiXHHfkqfROdz3SRKh2JtsRuD9Cur2zz9QFRzUd1DFbWUnJsex5DOIjFt2oiWcUtOg15cFhmumMEgNjU1rslUMu0xNlvxhUSeoHBgMTJ0G0mdM9G7vAImcTmxnibx5ebqHrlpV1wvW682dQ7UvMJv4rky27vukvhoVvuGswU7BFFJDBxvzgbEwtqGWOAmUkYpicGz3HZy24fKYvOW/ClSdoud9tsqS7FK2+L4iyvPttbdxb21dPqCAvC0adecBsuovuVpKMx+KNAs9ywbTgSC2X4jC3KQj5L7xANPnC58fkh++SBxTgT9tEn5+EBVfpPn9P12hybC2/lvE6LTesQOcPbryuEXaFrdKY0FV1EXJb57jBZsPmpkB/omePo7GuYpEMx+8M+KxWW2yOx0lWyTQC9J6tdEG89lttGyxsQR3rP2zzGeCSZNKZNtA+/lxuzGAaaWmcRRnoS7JeoHzErze2rS+D2SBAiLSRiCCZe6YMz/P/DODWMXVNUmr5Tuxkzz3feARK1MQHd6ToahKG/cWD6r5wMXGRuqHpjxb5T65MTEs56HbPSSF5WOaM8jKNIMpV3VOeh2OiUKOqsPriz3GEZUI/z80g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czVtV0o3V0Z1MXAyOGowUXlmcWF5TjljdkZVWDk4MmpGUG1QKzA0Q3dWQTdz?=
 =?utf-8?B?THk0ODdseFhTYTBoSGVGSXJGZE1pSU5CdTJlamljbWsrRjFOaHYxRDErdXY0?=
 =?utf-8?B?K2txKzFCMFlTcUZQNDZMUTFLZFhOZzBQZHZ5Wmd0VG0yYkRJWmtVU1pzNlNV?=
 =?utf-8?B?M1lSYTJ5KzVFL0JLTTR3MnlWRk9ZbVQ2eEg1eGhqanp0dE1CZ0FlSlEyQURB?=
 =?utf-8?B?M25VVEQzMFI1WmdrNElZV1hHdHJvUVFvNDR3QnZLekNic3lRMWdTWGxyamxS?=
 =?utf-8?B?QSswb21ma3lLS1NXbWZWN2ZmNDFFM3NualFsZVVqMFF3OFpVMExrOGZGS0tQ?=
 =?utf-8?B?em9nNmhMalJpQllxT0VRWTQ0dUFWTWp4WVQ2OVpPQlZEV05KNzlmRVBMbEdZ?=
 =?utf-8?B?bHh0ZklWM0IvMUVkUGVvUXRINmxTYldiaDR1QWhKcW5rOVNYNDZOVVU0MzVv?=
 =?utf-8?B?RHZsZjBqY2FraGNwTTNJbU42ZG45RVpFK24wZ3o0bXRqTkxVdjRielVDcVg4?=
 =?utf-8?B?WFJHMXhVT2JHUG01bERSNmoyNmgwZEgxRjVPL3M0c1VockYxUnJHd2FPcXIx?=
 =?utf-8?B?VlZRM1hMR2RlS2tpWUFrNkFWUUpnN04wUU4wK280dnBXUXhFYUdxY0YwYlNM?=
 =?utf-8?B?M2pld2sycTR5aWp5bXQ3NHk2aWJ5RkNxLzRsbnpaaDQ4VkJqQS9MdmJtbnlC?=
 =?utf-8?B?UUdZZm4yQnZhRVFod283NzVtc0dNaVF4Q0R6bXpaMUVmOTFrZmdFdWtxUWRp?=
 =?utf-8?B?YnR4cjg2cEdpZWdNblRyTTBhcnBzWUw0a0xCaExjT2pUWGw0UStrZ0ZSTHg1?=
 =?utf-8?B?YmZGcXVkZWpSNjBNVUtXQ1FDY2FObXdLU1FqdTY3TGRMVTMyTnBsR04wSDJO?=
 =?utf-8?B?QS81SHkvb0JQYzdBYUZaOXRzSmdIanJBekVsaEVnRXNMdFhySTNONHJWL09Y?=
 =?utf-8?B?c0hQa0I5ZFhLWGVBb3JFR3Bmb2RqbkRrL3FIQ3J0NDM0NFBtTTVpcCtiVVl6?=
 =?utf-8?B?S1NZa3lvakMyaTBKWXNFaks2VE9tZ0Y3Tjc2c29sNWN2OHc4NTJwa1pqOVdv?=
 =?utf-8?B?dHF6Znloa3RQMEJVLzQ1L2tERDFiRmRiN00vODdNUUFDdDVrYjlsU1pCTUZI?=
 =?utf-8?B?YUdiY0NiYU5qSGl2SlZiMU16MUt3SGtVSEQ2YUk0NmN5RWVscllFMUx2bFpv?=
 =?utf-8?B?VVVXM05xMWlSVXVJQi9yNjR5WExOaUxRcFdTZXRpckFlZm02SnFyYWhzeWJk?=
 =?utf-8?B?emZEbmozaEE2c0dmUW5JaUo5SUxyZGJrRHd4Q3FXZDRkSjFUSkNLS2FTNTVl?=
 =?utf-8?B?TDI5NlUzaDNwWGk5RTRWUTQxSmJUdjM4aDJWQ0hZOGhSR05Cc3pzZ1hOb3Vn?=
 =?utf-8?B?T0xQeVVleVVHL1BnK01iOThXRXA2dmRGU2FNYjNsK1R3ZVJGd3FQN2Jrb2JS?=
 =?utf-8?B?NmlGUTNjakJaeCtVMWZBay96Sk4rRGd3QjFnYVZheFVsWk1CVERIUFNQWnNu?=
 =?utf-8?B?UkR5czNKdzBvQlpqNHBSNVU4VC93Z2lIVVBDMzZieTh0WnMzS3RTdE51cGNt?=
 =?utf-8?B?MU84eW1jNWltZ3pzd0NzL2NXRzlHMGdCdTV4TklTUWR6bDg4Z2RmWFZWbCt5?=
 =?utf-8?B?L2lTZFQrMEI3WExSRUMySGtKWng0VjBZQk5LVUZVMkcxbThZMkRJUGJueTk1?=
 =?utf-8?B?Nm05c2dMRE5YdlkvVlN1ZmllbTM2WkZiSEhId2cxdGVUNFRQaUxRZEZJY3No?=
 =?utf-8?B?L2diaDNCZWR2YVNGTUxvVFVJNy8vTEFIZE9NdjBHRVlOdFQ2M1pGYnp2THN5?=
 =?utf-8?B?ekxVWDloUC80eTd4WGVsQks4MUM0NjJ1UUUwSllsL0JiM214b0NkeUZUdHNN?=
 =?utf-8?B?a0w4ZGF0Z3oydEY3Si90YlpXNk9POHJIRkhaN3BFQUxUUlgybkhWNGt4aUZC?=
 =?utf-8?B?MUhDOFo4aU5BaUdJdTZGdFczdlMwQzNhaFdNMDd0cGljQmYyQkdkbUJtZ3NL?=
 =?utf-8?B?TXhsU3drYVAycWI5NEZZMHpKQjVFdkFHelBXRWVzWVFhS2pZZFRtbXI3Y29T?=
 =?utf-8?B?OWN4QTFsRWh3Sm5DcGtRTStEMmdUOERGeDRYNklvOEs5VFVveXNtaERNUHFa?=
 =?utf-8?B?dk9WbHlHZmM4SVpmdTF5MFI5YXZGam1nSEYrVWt0TytIek42WG9aWm9mUWtm?=
 =?utf-8?B?R3FWVlJPN3FrT3VhNjBkUjMzNmZqNTlTQXd1c0NRRkZsL3VmZW1wZ2pzQm9n?=
 =?utf-8?B?dXVMZmxHN1YwWHhiSUdPdlVqL29iN2F0ZmtsL3ZJQ3NGUUNzdzdqWllRVXk0?=
 =?utf-8?B?cC91UksyRmxMOEN2aTVnejgzVDhKKzl1K1Zod2RsckVvb29jTytuck1RdGZ5?=
 =?utf-8?Q?qyC/ShZRDoXKeiY2bYyh2ceFI5XMNDf/6sUjoa5uf+A3z?=
X-MS-Exchange-AntiSpam-MessageData-1: WJOZWJPgh6uqAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05993a24-924c-4bda-d2be-08de78dd2462
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 04:27:12.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsVL35/9XFiaoemF06E4H5qXP4GXcyntpYjN5rPtHgRezk6pJL6DxR7bHdz66UvimhVvpdCMlHLo/HdPLjpBDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605
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
X-Rspamd-Queue-Id: 2E43A1E8D3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,google.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 10:06 PM JST, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 8:42 PM JST, Eliot Courtney wrote:
>> Splits large RPCs if necessary and sends the remaining parts using
>> continuation records. RPCs that do not need continuation records
>> continue to write directly into the command buffer. Ones that do write
>> into a staging buffer first, so there is one copy.
>>
>> Continuation record for receive is not necessary to support at the
>> moment because those replies do not need to be read and are currently
>> drained by retrying `receive_msg` on ERANGE.
>>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp.rs              |   1 +
>>  drivers/gpu/nova-core/gsp/cmdq.rs         |  41 +++++++-
>>  drivers/gpu/nova-core/gsp/continuation.rs | 167 +++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/gsp/fw.rs           |   4 +
>>  4 files changed, 210 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 174feaca0a6b..ccf56f1ad246 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -16,6 +16,7 @@
>> =20
>>  pub(crate) mod cmdq;
>>  pub(crate) mod commands;
>> +mod continuation;
>
> Looking at this series it seems more logical to have `continuation`
> under `cmdq` than just `gsp`.
>
> Nothing in `gsp` makes use of it, as it is an implementation detail of
> the command queue. And that way the `pub(super)` exports would be
> perfectly scoped to their user.
>
> Re-reading my review of v3, I am the one who suggested to put it under
> `gsp` - so this is my mistake.
>
> No need to resend just for that, I can fix when applying and this should
> have no impact on the patches that come above it.

I think we might have one more round on this so for now I have made this
change locally and will be in the next version.
