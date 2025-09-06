Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E134B46833
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 03:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E618D10E15A;
	Sat,  6 Sep 2025 01:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jCaTVwFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5153810E065;
 Sat,  6 Sep 2025 01:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoDASKustkHEhN5tJmwdSXYMnocO1zwA23+EXA9s3tZuDftj5e1voHrOJaJ1PqU5dBYaRAzbmftVvzL35rc69J4CFv+tEhPTBmlpAmEPVVOtoKjrIBQjUP4KHI8M3uctm4sS3+7gcH9MJbvqa8+9oNhdF865LYOsyZhZlyODNGDB2n/BkVM0gmYgaGEos/XHx4drcqiJzDXQQxqdVHekOgmzCL9OkJ698Ab/q+REz3q6QONqaArKNo5mKrbTOyCFdOIrEd2HCdTy/gwg042gCH6vsfs2TXF964yL9K8romwwsNHob25JUUTL8GaYekNo0ll6Gq0NWclXTlCU7jQjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXc75Y0gwhBVElqOS3R8pb7nNfnRJb7vo4AQp7xqmMU=;
 b=oq/zuvjh0eQBedAY9cmCIU/Fw6M1T6toX4coxqGHkv2A7jZKYY588nbMw7/lqitjkxoU24wWaATjxOYqmrxAQOd6uG8mE6ke4+b9nwx8FeBe/1WfAvpMmK3vf2i1I829OFlhm/F6VbuxzfD0ExdTb+M3cZe2j/W1RtaFBUHDQFWYekUpKISt6vB304nG/45qZYWnkBA3qaNGgekqpuzCfm/8OCjn+30UIzs+3d2ZOTfVuUMGJkw4Xfa1c8Imnc+mq8aICOTOwCkjdlgHAMny9n+ehqm4sRGwNeVnMjDYhV4hhcpj3/kZ12Ty49mp5PJWW7uX95TqMkTNciASb7M5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXc75Y0gwhBVElqOS3R8pb7nNfnRJb7vo4AQp7xqmMU=;
 b=jCaTVwFzLVvlS3KwipEOGM1kcCGmkkwbOIjgEao7tbekMLc71B/CKPAyvDoaRVlMgTiXXZXXKjR22KadPtIGdVP1cEQAmqw6PflnD/DGC51IRCqTVvzBuKon2W6ylbFJZACy8YRg5QRsgAk4hxc5ocRB5JcwMhcgjEsqMznRCPGWwqoLZ/RwCC826iF3cUOgLnuc8uf/a5qflZzkWLDlMRA7hKABj4fa6S/NhGohoG+NiPFHK91xJKv/eByKg2X62xUPY7B+v45kzSZKq6w2UT0/x4MCLxuE7kjznhWJ2NEdOZ4uOtUyWuDoh+025Qls4EY1jNG1IjZq+UwpyEl0bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Sat, 6 Sep
 2025 01:58:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Sat, 6 Sep 2025
 01:58:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Sep 2025 10:58:49 +0900
Message-Id: <DCLCG5OPAF9W.FA6HN1GCS2O1@nvidia.com>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
 <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
 <DCJYU75OUCGQ.3AEODDJR4IT38@nvidia.com>
 <40e412fb-5b45-46d4-ad62-252dea0b9ac1@nvidia.com>
In-Reply-To: <40e412fb-5b45-46d4-ad62-252dea0b9ac1@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6a7a27-6da2-46de-b8f5-08ddece8ef30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1ZRQ3lqMXgwNmZVOGY5ZGhXTEFPL0J6enJBdHl6dlgwanF2aURyWEtKRmZH?=
 =?utf-8?B?NkFsTFowbVl1SCt3TUptSzB2WHp1S2dQWTBnTEdoZDQ5NHhFQ0JmSnR0MGZ4?=
 =?utf-8?B?bWFEWi95TzJsK2ViTktGcXBCVk1VZEFhYUx6Nnp5dk1DSThkTEE3Smkrd2ZI?=
 =?utf-8?B?RUFydFh5VGRjZmNLVWxyK1VWUGVJZ05kKy9PdTFMSmlJOEJ4eTcycDV4MnJJ?=
 =?utf-8?B?M29HTFVxY3hmVWNsbW9qQkdQQ0pyOGVQU3IveFR4VlRUNHdHQVV3SjV6OWJs?=
 =?utf-8?B?V01WMnVObkJWaFJLVVlVMFNDR2pKOEJhMUdabUUxSTVHQlVGUzltbERBanNw?=
 =?utf-8?B?d2l4cEVKaVZ6UUdYdnZXWWkvNlE4dzlzMmhWRTlacllrYjRhL084dUpuOUNH?=
 =?utf-8?B?V2NBTmxtL0NlVFQ0UG5Fb0xwTnQ5UENHVzRxWExOLzBSZDhjWmxZUWVrMkVL?=
 =?utf-8?B?RTJ4Z3B1VVFIdFRuUEIyVURtZmNETzFTbFA5SHJZV3UxMHg5M3loUXBYNUlr?=
 =?utf-8?B?SldPZzVBWDNXZmpOYlhEWWdMMnJWeU5DOHNjNmlrSUxLZ1RLR2Z0YlRMQWhW?=
 =?utf-8?B?VGFaR2hoNDQ2c0N1OThLcmp5eHZ0cHBPKzBXeTlnWkFFNEtSZG5MTXRIUTBD?=
 =?utf-8?B?cEpJcU4yNWRUWkhObjUrQzlIR2l4UEVRaXU5SjhvQVFyV05RbldtbCtlSnFu?=
 =?utf-8?B?bTdKMjBQRTRiekZUclNHbnp1RnhSZFgra0lKOHpjZnJtdXVhODhtVG16YlFn?=
 =?utf-8?B?UHZOeitsRVIxNmJpY1UzMVJ0bFczZDFhWi9PYzFtYkhQd1VJU0R5MFZqV2ZJ?=
 =?utf-8?B?aTJMT21wUGZpQkpmVm9uZkhKS0dFN0NqVWhPRDlheERaUTNha1dLbHpBR1p0?=
 =?utf-8?B?VDVuODFuaDk1RVk2ZU95RzJoTUxVck9wU1NVRXE1dFpVVVloaUxmQ2R1VDY2?=
 =?utf-8?B?Ni83OFMyMlo3MnRwNmErWEJ6MmVRZFd4eGRvdXdmQVI2bldpMnVkUzdvRHNZ?=
 =?utf-8?B?cHk1bERXWW1SSzVTNldab3I2UG96ZmpRa2sxRVd0KzRTL0hrc1dJbENLQWtz?=
 =?utf-8?B?SVJaRGp1N2d4Z0NIb1hxK1RjQURqeld5MG9GcWROakdaTnE0eVVsY3RlNDY1?=
 =?utf-8?B?akpJNEJyRUhTZEtzRnNacEVqZ0FRYkVEWlVJZEIwNUhIVzU4MkFVdjljaU9S?=
 =?utf-8?B?eTA4bXUwZC9vTG45eXk0ZTNieFBvMUJobE16cEZnWVJMUlNNUVY0Nm5XM3Vt?=
 =?utf-8?B?TXBBaFJycWFjU3JONkVVKzArRGhpbkYvZUxuS2lKdGlQdjJIUnA0YW4xb3Zn?=
 =?utf-8?B?a25sQ3hUc2FUTGlqM1JaRHlDZ2NBcW9TcDVUVkRLS2JTWVludCs3L05SdXRD?=
 =?utf-8?B?WExWUjBvOFRTcFpqd3FSL2puR01pQWFtbkNmdEMvNUhHWlZoamFQNVJhKytn?=
 =?utf-8?B?UExROGNrYzhERGM4K0FnK3lGVEx5bGRMbmVSUjBIRndPY2l3dzdtZk5nbmQy?=
 =?utf-8?B?QmJFS0ZKUTFPaHMxRWd4Y0dBcnZVS1VrdVFUaUlUZzVwSGJHQ0xjVGtWRzlw?=
 =?utf-8?B?bHRuRUNScm5RWVFvOVZFOTFudDl5cUsrb2FVdFFDNXJWaDlKUGVEemRiOU9C?=
 =?utf-8?B?bm1teTR0MUsrVmVVSGRkVkdabGk2ckVjM0JPV3huKzdwbnc2c1d5SFBBV0VB?=
 =?utf-8?B?NzZJN1FzdkhVZGpveE0rdGNuTk9aMUZUU04zcWZJcFUwdlFMZ0NsVWEyZ3Zy?=
 =?utf-8?B?TXp0Z095Wlk2ejc1Y29mQVVMSURZTFhkOFBaTHo3eVZSVGlKWFVad1E2MjNJ?=
 =?utf-8?B?VW5VdTRJYzVzUEZ5aFViMTNZU1FZWStaSTV4OXNWZUM0WjNTMDEvOXRqZy9r?=
 =?utf-8?B?VERXMzdVSTNUbStjSXZidWxTb29zejJNeTJ5MEdLQ1R4TUtTVkc4MnZJelRu?=
 =?utf-8?Q?PCS7kIT6cGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21LL210cGV2Lytna2haYnFhbUcrSVM0bEZGZVh6UHB5SHlieWpsM0F2bi9t?=
 =?utf-8?B?SkYvcHZyRjIrMUQwampoS3Z0djBFc0VTZVhUSTlYcFI4OEdIdzN1c01acStZ?=
 =?utf-8?B?TTYvRUE4Ymdma01FcXFkdkNRbEVzSHNMUytaYWtQOHZyNWhRUjRNR204OGJI?=
 =?utf-8?B?YkNrTzNnZkYvdzBMYkc0TmZhS3VFYUt3QXZQRU1Vb2d6aGpid1ZLbmVlYU9B?=
 =?utf-8?B?VkJ4bVJNbmtQb1JXZnJjL1pPZVhIY1haclNJNE5PNy8vRENqQm9YY3c1ZUdu?=
 =?utf-8?B?Tmk1U2kyT2N1ZmRiWURJNjVXTTBFOUl1ZFRpR1V0TFFCbGFvRkluRDZVUTRP?=
 =?utf-8?B?cW84eVNOLzNzSEhCNWZxdDhramdrdkxETkJMVnpRMWgyRFJzQ0oxbUYxc1Jm?=
 =?utf-8?B?dWdiMDhtalJNK28rTmZUOUgrbHVSK0wrUG1yQUNWVGZJS1g1VVZ0KytIZHZU?=
 =?utf-8?B?a0NPVnpjYTF5dTQxTGs5VE5PNDg1N0d3dTVPN1hJWnNFY0RqYi9KWStHUGNh?=
 =?utf-8?B?M2x5cklTcXEwUHVDWjd2ZnlGRHNVZG5udFVkVk1kVFZuUEpGM0xCSlRxSFBP?=
 =?utf-8?B?YXdCb3ZIOWorbnhwbmlsK29sdXBnRVQwTkcyYkxUa2dIWGF2UVBDYXVnNTJB?=
 =?utf-8?B?R3J2dlpESlVPbEVPT2Y0U3FOU24ybXA1SVpQOVFxMTNJZ2FGZUxNQ3Q4U1Q5?=
 =?utf-8?B?a3FmM1VLWWYweWhEV0pyM1BmWlVYZnprOUdsQUtwY2tBMW9mb3c5YTB4OU1S?=
 =?utf-8?B?aFFlMzFLNHhwa1hFbVFOdy9JT0VMaHNRYWtuZDVLSnRqWFRXQjZiUDdmVE9D?=
 =?utf-8?B?S1ZITzJaTlAveDllbkZKM054cytlS282RnVDSDUwS3RrOWYwWVZlNi9VNWZ1?=
 =?utf-8?B?bFJnZExMRnU1VmZTZzhmcUtDaWlMcmZ2SlFUaDZWZ0Z3TW0vemEyQ0VkWHRo?=
 =?utf-8?B?WEZZNDE4VERYQU9SQjNUZmNxQUZKSnlJcURERlAxdmlyNUhrajFqNzRFR2Zl?=
 =?utf-8?B?TE0ya2lYbXhCanlMTGxDUzJid1ZhaTFYSmNoMlFJYzd3THlRdFFJRjY4ODJF?=
 =?utf-8?B?WVNrcWNzV29zdmdoMy9Od1F4RTJmaWwwZktmek9lZTlDRWFPbFpHMXhiNHpI?=
 =?utf-8?B?amR6OVVCNWdnYlJvWG5TOFUwQ2JKbEhxRVJqSjlWckdoWXorajZvM1R5bDJt?=
 =?utf-8?B?ZkNqdjZKYTRHMTNJd2k0dkN6VXFRaDlPaGh5NFVEbXFkNDlzVkhHbE4yVDlF?=
 =?utf-8?B?dDlFTlpEUlQ4QVMvRzIwUUpMY1EzZzZmUlFITHhhTWd5enA3NkZDQTE1bWJ2?=
 =?utf-8?B?SStVRW1QVDkycm9mVTZSQVAxS3BqOHowRi9uckRqcDNVd3Jad1hJdUUrakdP?=
 =?utf-8?B?MG1uVTV5ajNBd3JnSGF3SzlHWnJjRlZBN3NSRDBoeStTT3NqZGFZMndzYXNY?=
 =?utf-8?B?REpKSUdQcGtQNkN6RlNnbkIxWVhnck9Cc0RCaUJqRFhDK3Fpa3dBNUZOZVJw?=
 =?utf-8?B?cnhWcjNrREFBNWQ3U0RiMEFmNTV2UU1ZcGNyTCt5eC9TTjRlTXE4V2xZOWo3?=
 =?utf-8?B?c1cyd0I0dk42dzBGUmVDREZHUGF4VE1uc0ZVVmxHamp2ZXFRK2lXQXVidkRG?=
 =?utf-8?B?SXoyTkV6dFExRFM1NlROeGZPVy9xNVNZMEFSTlhoQ3VrK1ZTMjgzNjVWMm9m?=
 =?utf-8?B?SnZZMGhvK3Y1YzJhRVJQQi8xTm9pSjJCRG14RHp6N0FxRTFyNWk3MHVabE9y?=
 =?utf-8?B?MmluMWI5Tk9xSEVmVTIyVno1N2VnOE02VWJpaFpXU2VKN21rRHVOZUNSMVBq?=
 =?utf-8?B?VHFLbkNMVkN0S0ZtaEVmRWU2WEJYejBGN0JDc2d4MjJqSWphL29uWmhhYVZo?=
 =?utf-8?B?cmNBcEN0UVVPelErNlBPbUFiZkdvQXMvaDcwbWpQTFBGZUFWWjhhZVB1VFNR?=
 =?utf-8?B?a3BOcHBOTjBmWG5GWU0yV3lhQUlWYWh4cFdwdml2UlBnV3ZaWUdMQjRIcGx1?=
 =?utf-8?B?dzVuZlB3MW5WZmx5Qk92VklnRUoxRFFVTzNFbi9DMlpIci9vb3NJZmxISHJm?=
 =?utf-8?B?bTYvRldUVnFMb0dXMVpxc3Q3Q0pub080blRMbUxpczQyV1VWVlBkb0dUTUVw?=
 =?utf-8?B?dVJFSWRKTGFvenBEU0ZnQjFMenBDVnFpb1NQSUVYUlVNVGVKWmpYTSthM1ly?=
 =?utf-8?Q?hAj8x/l+gUNsf2YK3KRImIuXw7AWnaao9GiX2kihdBRI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6a7a27-6da2-46de-b8f5-08ddece8ef30
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2025 01:58:54.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMjOsOhmvSWbhy2PCPoOt9Ue1O3eoK/lYPXUVfKmLcoMPUxhmJWuxxJirKdmMmR2Nrgi80Xax6P8fghJYbiUIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
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

On Sat Sep 6, 2025 at 6:29 AM JST, John Hubbard wrote:
> On 9/4/25 4:06 AM, Alexandre Courbot wrote:
>> On Thu Sep 4, 2025 at 4:16 PM JST, Danilo Krummrich wrote:
>>> On Thu Sep 4, 2025 at 5:16 AM CEST, Alexandre Courbot wrote:
>>>> On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
>>>> <snip>
>>> 	pub struct PageTableEntry {
>>> 	    63:63     nx          as bool,
>>> 	    62:52     available2  as u16,
>>> 	    51:12     pfn         as u64,
>>> 	    11:9      available   as u8,
>>> 	    1:1       writable    as bool,
>>> 	    0:0       present     as bool,
>>> 	}
>>>
>>> This is also what would be my preferred style for the kernel in general=
.
>>=20
>> Sorry for the confusion. The discussion was whether to keep using the
>> `H:L` syntax of the current macro, or use Rust's inclusive ranges syntax
>> (i.e. `L..=3DH`), as the `genmask_*` macros currently do.
>>=20
>
> The H:L (for example "11:9 available as u8", above) is elegant and readab=
le.
>
> The Rust native syntax "L..=3DH", much less so.
>
> For this part of the kernel, dealing specifically with bits, feel pretty
> strongly that we should go with "H:L".

We discussed that bit during the Rust DRM meeting, and the consensus was
indeed to go with `H:L` for these macros as this is the syntax typically
used in fields definitions.
