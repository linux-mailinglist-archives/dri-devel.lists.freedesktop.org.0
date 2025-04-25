Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2DA9BCE4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 04:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A996410E272;
	Fri, 25 Apr 2025 02:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tQHUXusa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2010E272;
 Fri, 25 Apr 2025 02:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npsP3nKL79nPsjQWMaY6sLfCnjkFg+riHJAG4r0H+QmfmENJyLHt6fkzUH0sKjj52/y4jyNhO92/E+UAURMNpXEPTEsY8dYWjHFEdwBj9J0/GTaB3mSTd1goHO7nMQBtNz9LFn5XUdWUl3tW6u6OcZJrTqoJfCiS/4VXCySiT0DTvJeEUr2B6iHC4U8H491YzgBmNugF5h7AkmAgkatkopFc8Gk+HHlApCAeO/bF8M5hMpe/KJRt9qIx38kCSw0ypG8H5UL9gw0Iva1TT1ErE0lgA4G3A2EfgJs1xUNiXU805qDlhWweEGcu9ekdp5l+ZreQ+tuLKN7v1seggk/wbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhK6Dmdo3KQbfygBnMw5+ba9Y9Zl/9a/gKpshXT7VP8=;
 b=kzeIzQ1dCd741BX4bjWNhYf7bQ53n//3asYJRIo8xK4O/hqDJJ89lnNpzNqWKdwhzPG26kuo8ee9lX/4Hyn9lNoRdJA+yISwawRC0PWQJTPKSXNSf20aHbftSep+vCuiMAAW6/A4E94hi3FGYGTNS1NQ6yikwy1PjZXO6/Ow+oRA1Oo22MZXvMXBfJdsO0WHINSksWSRXL4QBCSxHZZ7hpibyyK8rVqJ0Kj8Yjbp//3kRXsBva3S+la8XEQ6kzGuSzQTK//2qXMTKg+ZQwpV4n8KHZ7GKHJOynFAc7+IbCDuO9/zBwzNyrG9DMbLU5b6XuCdRMof7mVa8tr37L2sbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhK6Dmdo3KQbfygBnMw5+ba9Y9Zl/9a/gKpshXT7VP8=;
 b=tQHUXusaZkBkNfBlbPVXUuThXH7AtLgSwZEDOaC0z50t2LL+RjQ1TDcYmn1cY3ToDs+zM8U3sXub7aevWByovbY1z7oHUZSFuTZ1mhal4jKsrVyi/TVQUg9DzCSwNs/m5Yigd0dLEzgR9IAi0LdnGKIqvP+XM2bQNKpPZD7VqVbWNfa0yeqdUNCB3/bTz4t+E8VUP1b1S2nWan1wwPFc0YH0rRjLauV+RSrJvtYzPJsCqEHLqrLQc1EHu0qYdBXHTd647kz5usG0WcT4VFQ31F8X8Ua7SvB5z82fyLDjukevcct7aGiWJFjZH6mesY568FWJfnyWeFGlYX8QDQ0aXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Fri, 25 Apr
 2025 02:32:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:32:58 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [13/16] gpu: nova-core: Add support for VBIOS ucode extraction
 for boot
Date: Fri, 25 Apr 2025 02:32:55 -0000
Message-ID: <174554837570.876.11918974074625574396@patchwork.local>
In-Reply-To: <aAqccVvLIEZw-zrU@pollux>
References: <aAqccVvLIEZw-zrU@pollux>
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: BN7PR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:408:34::38) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 4177e8b0-dd4f-4bdd-db38-08dd83a17dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U24zM3RLdWpSQVlrYkJlOHEvcDA4Nm9qamZxeHhGRVFaenlpdSs0anRKNUN6?=
 =?utf-8?B?emhXcWcyS2FkbDk3T0UvVWcxQkxRYTVjNEFyUmdKMlVlc3FMVG5vSHNKaS9P?=
 =?utf-8?B?cVBqMzdHT1EzdC9CTS9VMHQ0dFg0ZnRtSGhTMHZTekR0MFMzc2pmaEtVRi9R?=
 =?utf-8?B?NU12aU1rUTdVaGY5MjZ5YjViVThHUEpEa1U2YUgxblZqMEVKMHZTZHEwcmpp?=
 =?utf-8?B?S1JCSXMybTVwZzczQU9Sb3g4R3I5QmFaaXZOYU9LMlhWU2VHZnpXM1JNODBz?=
 =?utf-8?B?UHZmcUpIQ2E4d2prVFdpZmNuL0x5SlEwM29CZ0lGVnZ4UmE5QnNmZ2dON1k1?=
 =?utf-8?B?L1YwQW45dnFIVDNndnlVT2dBQzAxUitrZ1BqZDYzVWxWUE1Kd3ZHUTMrd2c0?=
 =?utf-8?B?N0RCSHBIS01oZTFkNTZTanJPMk9MNkgrVk1EVnoxTlM5UVNWaHZqbnlrNmQ4?=
 =?utf-8?B?QUNpdjhNYkRCVHVSVUczSGY1OXNZVGx1RFc5b3VscUdiaFFxMXFzRTFqaHk1?=
 =?utf-8?B?dWV3a1BEb1gvVG1raktONEplRkk0N1BmL2U1RzE2NjBXMkdkRjc4MXY3RzNK?=
 =?utf-8?B?S0J0Z0ZwaVNRM2QxQnkrUzlBeHJ6eS85aHpxZU1iRjVEVHgvQXRQR2YzaUJw?=
 =?utf-8?B?Qm1haENLM2tnWmw0N1h5cUFhc0c0RXYybWR4QXVjUGtTUndBRVI5QjhGN1dR?=
 =?utf-8?B?SUNiRDVVN05vbjVHQmdDcXVBVGcybGd2dkhHNzhpR3lEOVlWdm1EeHBndEtq?=
 =?utf-8?B?bG40c2VHQXdZb2tSZ253eE5iWXI1UkpjTDBpeFFJUVgzaDBpbUNjb0lmWFVs?=
 =?utf-8?B?WHdkdktmSkxOYWlFNDhRU1ZXZHRuYVhTMEtBN21Nc3hmcVhZMkhBdGltQ3Rm?=
 =?utf-8?B?T1FieWhWN0tWQnREeTJ0eGRuaEMyRERTK2NwNmRzeUJyTGgrRDdBc3k1UlNR?=
 =?utf-8?B?VkRIZG9DY1VMUkNTaGtscXFIZGZvQ0FpdnYxQmlrSGswTDN4b3UxcUxqSktJ?=
 =?utf-8?B?MXBYVGdsRHdmZ1RUR20xREJrWHl1eFNIZ1B3TEVEc2NMeFJJdTU2am5OMnJ4?=
 =?utf-8?B?SG96dUtFc3kyNm1leDJ6SFkyWEJiekt6QXoxT0lMR2NrVjc4SmVJTlZ4a2k5?=
 =?utf-8?B?YllqU3paTFRzNS9jQTI1YlAyeCtWOW92MUxURkJCQ2FYa3FJVmZHNjY3S0Va?=
 =?utf-8?B?Z210WUxWUkJ6YUtlWExGbDB4YTRxZXlkNStEMnNSK21IVDJCc0ROdjRJVkx1?=
 =?utf-8?B?ZWtBRnp4cU01NjV1MzFvZDV3M2ZHMkk4RlVSVmpKSUw0SVJoVXNDcDBSdGcz?=
 =?utf-8?B?bHNxUDI2QlltRmFxTG1rWXdPalU5ck1weUpOYnpJRWN0ay9lTEx4SDNjSFFs?=
 =?utf-8?B?ZktCa2JQalQ0UlVjS2Ivc3Y0UjRqQUZyK2F6MldPeDlmbDRuQnhxUHcxRTJr?=
 =?utf-8?B?THkrTzFzbE9hNStGZExZaEZDK2gxNU92NHluNVlTRXVEQ210Tk91cFBWQ0x1?=
 =?utf-8?B?L1U3d1dXNityZVl2VTRPaG1vWXFlQnkyVlFsa0tXMFJnaXorQUJvWlJvaUVq?=
 =?utf-8?B?ME1zS3VZZ2FWZW0vNFZiNDlzaEpaZ1hIQjVMUnMxUHh1b0diMzFLMXc1V2Zv?=
 =?utf-8?B?bXptSkpwUTJIY0FCNlZWYTgvSFRkRHF5Wk12U3RZSFAycHpxOW9tdXhnK2tt?=
 =?utf-8?B?VXJyQXdCdnZ2N09BWjdBSlkvZERrTmp1VGg1UW5oY0FmUDRHMGhuS3djZzJu?=
 =?utf-8?B?c2Y4RWtWSkhXd0lMWXR0TkFJa2hVVmFQOXlmTDNRcWlreW5NdTNlTGdrVkxE?=
 =?utf-8?B?cHM3R2ZQU29QNUNiOFQvR2JaKzdEb2pCejBEd2ZxOFVnanpNUWJJTUYzMUlY?=
 =?utf-8?B?blNpaUlIZzlBTkxxQnNpU2oraTBvMlh5eVZPOW1MWTloa1kwVUZZQWNhdmxR?=
 =?utf-8?Q?BNAnx5hcKcA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZJQXU4emtwVnZpTTE1dnJNOHgzVGFqK0FwVXl6Y1ZkQ1dSZGxRZTA5WXVL?=
 =?utf-8?B?SHl4a0VvZVhMZ3pIL0FWNWlTVEFIU3hXWExNMnV2ajBOdGpVTWw2K0VKbStt?=
 =?utf-8?B?Mk02SGZwVHJZekFGdU1rTmpac05hSEpmeGF5UDVYNTNITDNvR1daRm5qLzc2?=
 =?utf-8?B?UDBtaTg5cmJtdUEyS0tzQ0NidjB6a2s3UEd6blp2c2ozUFpFZDU1QW5UVGVr?=
 =?utf-8?B?dVlwWll2T1lIQnNFWTl2WENCNmpyOHgvaTFUblhYbUdoOXVTc3Zldlc4K3Zx?=
 =?utf-8?B?MG5CYnZBRUYrY1dMQzloVEVBNXA3S2JBNVFhdS9WNnZQNTNZcG5LR3FNUm81?=
 =?utf-8?B?ZlVHOHNsQ0lncjNtY2QxRWFiVjJ4M3ZWSG9uRWgzR1lmckRsMG9jTFcvSEt1?=
 =?utf-8?B?ejZNSnJKWDZlUGRORk14SEcycXdnanJLcEsrd0hIUVFtNUhKSTdsN21rUk0y?=
 =?utf-8?B?MkcrcFJmbUthQ3ZtdDhGOHZmUjM0cllOdU5xNjBveHUyNFhpNTd2OW5mUW1R?=
 =?utf-8?B?N1F4V0x6dFprYVlXdG5rZmUwRG81Uk0zZ3hvQ3ZxR1creEk1YzlTMDhzS1Zn?=
 =?utf-8?B?ZGlhODFmSjdSZnc0NXdGQ0ZaU2h1N2plUGxxb2JPOXorNTE5T29nelpGaGNB?=
 =?utf-8?B?d3RZTHpqKzhLdW95K1ZuZkhWOGVHaDhrQUMvTTVaWVY3T2k2dGtNanQ5czVU?=
 =?utf-8?B?NXNHWUt3UEpDZGh1WlhvTEYvL050VVRaV3o3UkRIYmtmc2UvVDVNRDZvZVZz?=
 =?utf-8?B?S0U0T0UyYzJxNUUyNFVQallRZStSSmhjU3QzUEVyTXBhOVFHNy9PWDFZU2Fz?=
 =?utf-8?B?Q0QzS1ZCQnZiTVRXNlU4ZzdmTzlkYWY2UmFOR1pwVE9IcE9Gbkt1NnE3SGZz?=
 =?utf-8?B?NEpPdlBWaVJJZFpJSTc3MXdQelMvQlNEM0xIZ29iVGxwQ2lJdW5hemdhYjR1?=
 =?utf-8?B?b092b3NkWHhvTGt6Z1d5MFBoYTNGS1l1dlZVaG1wTnhEQUpqRWYySU5tb1Uz?=
 =?utf-8?B?Vm9sTEJhVEYzUmZlQ3JQRXJrYko2S0c1VHltSkkzN1o1VEE1SFdrbkhyZGFQ?=
 =?utf-8?B?d0s0Y3BGNWlEbFRkV25nVUp1QjhtK2tYUVZSTFhqeGpyQ1Y1WDIrNHdyZmI5?=
 =?utf-8?B?d3FjTTJqRThJOS9Ed3hHeS9PdFgrVnV6NXNxalFnci9zZ3ZFUlpycmtmMTdu?=
 =?utf-8?B?Nk9uRVpNY2ljTmxyOXhmWWlCcnhROUh4UUJ5UkNpTlJwamRJMWdFOGxZSGlE?=
 =?utf-8?B?VUdtOWdpSGZ2eXE3Vm83dkZqQVRDckFubnBHSTNKVWZScWxwQWNGVG1uS1FS?=
 =?utf-8?B?MWR5RVo1a01Idlo0SnhWVDU4UjIrdEpqcmhkaFVyeUFlaXJLNkFvVXNlM3B2?=
 =?utf-8?B?dzRUaWxiWVdFSXViU2FNY1FSWm82YnVFMlZrZXVRMW9BclRLZlMraWFidkpF?=
 =?utf-8?B?WXRTVlo2bkZiWHVrc2JXZkoxMGJIVmRPTXdnMEczYlMwUEdQSDk5MFl1VVJM?=
 =?utf-8?B?STdDZkdocy90QWcrUzY4K1JaTEZ6aDh6YXR5Ym90bjF1RytINm5STnk4dkV3?=
 =?utf-8?B?L21FcnlYNVZQZ05ScUNBZTJoRnlvdWpxR1ZMNVdKVFNvSDIwWXAxVG9pN0Ji?=
 =?utf-8?B?VThRNlZRaG1mZ3hXczhud1dibTdwcEJ2TXlvbDBIRTBXNnEveHVacmV0UGJB?=
 =?utf-8?B?cmJwRk5rVlQ5OXFZTWpFSE1ORndmaTd5ZWl1TlVoNGpONDF4SzdRQ1RGWE82?=
 =?utf-8?B?REV6MHJMSTdTRWpucHVjb1drV0E0Z2ZGOGtSWlZwaEV2eCt0bjF6TXFoODhn?=
 =?utf-8?B?a0d3cld0TzA4MldaWnlSTjhKZEJacXhSeXZEekRjeE0zZDBLeGRITkp6cXNM?=
 =?utf-8?B?WW5Haytldi90Zk9GVThoZmR2Qml0RjdPK2lYYTY2RmZpYVFOMTBzaGl0RUcy?=
 =?utf-8?B?bGtCR0s2MklrQ2JkWGhNK0ZOYjFnNXF2bWlXSGhKNWpRNitVVUFrV1Y3ZUxS?=
 =?utf-8?B?VFREYmloUjFjYUFjcHl2UEhHaEhEQldLendndHAzMjBIb3RLV3Q3MjVNZjA1?=
 =?utf-8?B?VmJWOHdjWVFxamdGQUpLWUx3YURPbnRXNC9aRnI1NWhpcHhBc0NnZlA2SEp3?=
 =?utf-8?Q?yApJtV3HVl1v5XR1tzN8OuHXf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4177e8b0-dd4f-4bdd-db38-08dd83a17dd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 02:32:58.2224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5BD54B+SEAVd/WOdEpvLEN+MmKMbf/PFaxgRsXCG5X+ZFSkSAtFxQDKAGTZlmJkPS/kaalrsDiFJGOAIVG0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
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

Hello, Danilo,

On April 24, 2025, 8:17 p.m. UTC  Danilo Krummrich wrote:
> On Thu, Apr 24, 2025 at 03:54:48PM -0400, Joel Fernandes wrote:
> > On Wed, Apr 23, 2025 at 05:02:58PM +0200, Danilo Krummrich wrote:
> > > On Wed, Apr 23, 2025 at 10:52:42AM -0400, Joel Fernandes wrote:
> > > > Hello, Danilo,
> > > > Thanks for all the feedback. Due to the volume of feedback, I will respond
> > > > incrementally in multiple emails so we can discuss as we go - hope that's Ok but
> > > > let me know if that is annoying.
> > > 
> > > That's perfectly fine, whatever works best for you. :)
> > > 
> > > > On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> > > > 
> > > > >> +impl Vbios {
> > > > >> +    /// Read bytes from the ROM at the current end of the data vector
> > > > >> +    fn read_more(bar0: &Devres<Bar0>, data: &mut KVec<u8>, len: usize) -> Result {
> > > > >> +        let current_len = data.len();
> > > > >> +        let start = ROM_OFFSET + current_len;
> > > > >> +
> > > > >> +        // Ensure length is a multiple of 4 for 32-bit reads
> > > > >> +        if len % core::mem::size_of::<u32>() != 0 {
> > > > >> +            pr_err!("VBIOS read length {} is not a multiple of 4\n", len);
> > > > > 
> > > > > Please don't use any of the pr_*() print macros within a driver, use the dev_*()
> > > > > ones instead.
> > > > 
> > > > Ok I'll switch to this. One slight complication is I've to retrieve the 'dev'
> > > > from the Bar0 and pass that along, but that should be doable.
> > > 
> > > You can also pass the pci::Device reference to VBios::probe() directly.
> > 
> > 
> > This turns out to be rather difficult to do in the whole vbios.rs because
> > we'd have to them propogate pdev to various class methods which may print
> > errors
> 
> Note that you can always create an ARef<pci::Device> instance from a
> &pci::Device, which you can store temporarily if needed. Though I don't think
> it's needed here.
> 
> > (some of which don't make sense to pass pdev to, like try_from()).
> 
> Yeah, it's indeed difficult with a TryFrom or From impl. I guess you're
> referring to things like
> 
> 	impl TryFrom<&[u8]> for PcirStruct
> 
> and I actually think that's a bit of an abuse of the TryFrom trait. A &[u8]
> isn't really something that is "natural" to convert to a PcirStruct.
> 
> Instead you should just move this code into a normal constructor, i.e.
> PcirStruct::new(). Here you can then also pass a device reference to print
> errors.

Ok, I had a similar feeling about excessive TryFrom. I will
make this change.

> 
> We should really stick to dev_*() print macros from within driver code.
>   

Ack.

Thanks.
