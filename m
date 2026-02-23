Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 00PvI1Wim2kV4AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:41:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8B170FAE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714C410E1D4;
	Mon, 23 Feb 2026 00:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ob+ryKmE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215310E1C3;
 Mon, 23 Feb 2026 00:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLd+brg1mf3etodFQlE6f5G5I3vXumwydbaa9dBVEoAEUHeZEAUcUYFFsHKvAeGtg40a06ZWY9/Dn8r3IXF7pFYZJdPpdBsipakMk0S+y9jTND8om+PimL3KlXDU2rmnWoZIHy/5EPiuFZZxEtT2mNv8/8RdZ++m84vAdQroBUYZ6NvaJ7oxWgJUxfJjj10HmJZpWiss4LXR0J/o45gYXaSsRSXZGtdFJl3K2PwFWc+NX4YYOwTOnH1B3zkszYCf8JoWDWnqnRWlzdIxcbnLJAnqKT+JWSbfhd7e97wts6NBu8Fz503wUbIUd0qXrDm2SvKQtVIg1YLM6GtUtgXBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhRXgHQ4oDsEdOiVXzHJa36VfEbotkS5yl9gDa0gZpk=;
 b=ILMk4d3m5Nh12YqbUPDi18hsQEW4Riinjejfb3c2tdVtE09OZqNgi5/kqANlpS3Bghz4Bj3UJwAhVgokioRB3r11dW6Gab5Fkike8mX2ABscuLCQZaEdWsvcsu96fhp9Yc4aCezMqAC07lDA4WW2/NKNkAyxDRExJPh2oMRrHsY+KGOtcsa/1yLo8uiws36vao02zEvsC66Ysp1EeOWJdJgE/Q5J9+NgmkbD/5erN7A/NVC5npn+EANcfRXMdB+LKK5wzPa+vXtfKLXlcy2Obs+GoThvEZM+Cqgf3z/3aVNv+VtE05mjURCb3QoNtOe4YZF4+E6eNrBkUjGNCwR+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhRXgHQ4oDsEdOiVXzHJa36VfEbotkS5yl9gDa0gZpk=;
 b=Ob+ryKmEZrKC9saLKjgvF5Mkh2aa9j0THVKz3W8gjilx/facTLqbae+vhYucF0PmuVbjacvb4hYE+2VjCf/tsQ5CTcesgetIZqph1hrPRZUEMfVA5WB7TanKPDk/2T1sfZUVcUZtkvybedG3x3cZqKd1wblOvj4u8dp+6j5bpKVf37PkMmIeWqAWq9KIxktjH6YSNbdRhwHE5OYtMdPNR7fktTsUAZ/3pbbr9agu9Nv1taL8r5CzBbaGsBb5Hxhy9lw0QAtSxYyp5gERDEtKOTifyOUa9WHM0mq26GeB85z+b1NyXKDC4A4Sl05PK7ByosXinGmGNp3I2+nm0EQpiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 00:41:47 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 00:41:46 +0000
Message-ID: <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Date: Sun, 22 Feb 2026 19:41:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <aZlz49VtPA0JbEGx@google.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aZlz49VtPA0JbEGx@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0007.namprd14.prod.outlook.com
 (2603:10b6:208:23e::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 78af78ee-32af-494f-0604-08de72745302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlNRcE5xcDU4cFMzckVYamZPRXFmcEZ4K0JuOHJJeElZWVVrbUpMRFcyckk2?=
 =?utf-8?B?dEl0WFk0K3ZYa1h3dkxieDJaT1dWRDlsVHpvdW1LaURRRGRDQVo5eDFQV2VV?=
 =?utf-8?B?R3Joay85RHZVNExwNHJpZzhCaGZjbnozK0RDcVMvTGxTRjZMUHYwQW1XWC8v?=
 =?utf-8?B?VGN1eU5CdndIenMzNG1tV3Y4aGJMWVpMdUV2Qlk4YlFyd1R2VGg3eDVSTDQ0?=
 =?utf-8?B?UWJGMGVXaDdRRXpnbzZCdkh3SFE3bmVJTXdQNmpJZkZ3NmpSTnFObGhoTVZo?=
 =?utf-8?B?RjdCUmRGY3k3UzdVV0hnVFEvSjc0UVR3NEVnTTkrL1haTm8reVY2RlFwR0Ro?=
 =?utf-8?B?NVJiQnJmMUxaMWRVMVZ6am9KcWdHNG9Vam1EbDNIR09uYTFBT05aaG00Vzdy?=
 =?utf-8?B?TUxSVkhPMVZ0KzZOMmhvUytaQXNNNGw0WEpyV3UwaWpLMW5rUGpRUXdiRjlI?=
 =?utf-8?B?SjRTWnUwUE42MDU3SVh5VW90d0RJMVdYV0c4ZytnbzZQSSs2dzhWbGZ6MTF4?=
 =?utf-8?B?N2FSK3FmUDJTRVBsU0RheEFuNmIzS0R2d1NFcjFXMk1BSmIycVlnQytkbnJm?=
 =?utf-8?B?NCsrVXFEamVrWjF6Q0xzZjRRQlQyOTA0N0V4Q2FJa0p5VEdMME5oSlZhbWky?=
 =?utf-8?B?YldFM3l3SllKSzgvRUx5bStVbmJPMHNEZG1zc01Hd1BGQU1STjlSOXJuZGxJ?=
 =?utf-8?B?c0xWNDYvV2lzR2xhcXVpZkphRmlwdzMvUHdtUmJoZys2VFRremtoNkZyeTFG?=
 =?utf-8?B?T0VlMER4MDlxN1UyQTR1QWp1UmR5RVVNQzF0QUJvWHhhd0xYcUE1VXgyK05S?=
 =?utf-8?B?dVNUVTUzVXltcS91a3puaGp4UDErcGJOamlnTmd0bmVrOUZXbTd1K2NjS3Fr?=
 =?utf-8?B?UENUZklJR3RvL0pCb1paV2dSL1dDSjc1cE1OTDJuZ1pTYjhNbGZLb0lMdlI0?=
 =?utf-8?B?NlFiNE45RHV2aHlaU05OUG1aZVo5MmhPZmVFenlseWlqZ2NBVUs1SVJOc2xv?=
 =?utf-8?B?Q3BRQzVPR2hpREw1SEt5UU9KN0NTcFRaMzFDZXRFVFBOZkRHdjZwYU9yU1Jv?=
 =?utf-8?B?SDZRa1FxVUdFLzg2alpxd25lb0FHeURPV2ViWXZKei9qRDBMK04rZVdockVE?=
 =?utf-8?B?dFdUaFU5UXRINjcwd3NGd05Zai9rcGIvMUZaU1NPMzBWSUdtbGc1UGloUUta?=
 =?utf-8?B?bmhkWVBkckx0M2JaOHgzV2FpYkF3K3N1TVZPOEdZK3VnL1pZUFNkUXNBNHRv?=
 =?utf-8?B?OUtRRUdISWtVYTJHd2Y1cnYrNCttbTJBMGRZYlZpYjZ6S2J1TjV1RzF0ZkZI?=
 =?utf-8?B?ZE1JQ0tETWREUnJMM2JqblQxMS9tQ29MREswTnNmUjFsMnNHays1Y1VmMldY?=
 =?utf-8?B?d202a0Ftc1VZWXN4cmtKSlVycko2R2F1WEFQaVVXa0xNaStCMXNoWCtXNHRV?=
 =?utf-8?B?ZkVCeS95cE9xOU5rak9xY2JNZHVWeVdwNmRWQUNiZFlBNjlpZDgyRHo1K1Ry?=
 =?utf-8?B?MXVyUzQvOUl4UkMxVE9FRnVGR2JsS0JVcW5NaWYxZ0k5c3MyQThBN21BR0JG?=
 =?utf-8?B?ZUo1eDdlSGIwdUV5Y0tkODZpN1FsRG1OU0EvM3ZFVHRJZnhTdTV3SE5xU29j?=
 =?utf-8?B?TFA3UG9NYW9KTTVtRWx4WDR2WmoxRmMxN3d1KzFHSmNGQjMzRVRvNU5qVitR?=
 =?utf-8?B?cGVPNEtoM0hscVcwSjNobWdBL2U0RHNZaElaM1JZSWRJR0pTUVd1cE5QMExC?=
 =?utf-8?B?eFJCVGRpcGNvbHZVUndubGtCYjFzNG5OUnlCcWdIZThvTEZEbmlGekFiUmpa?=
 =?utf-8?B?UnFiaEY5a3VBWEFmSm9HV2tDby9URHdjU29IRUZzZXBPVng1dlJKcm4vSENn?=
 =?utf-8?B?MDlYWlBIS0YwWERvcmVWQStuMFhlUzZoS1V3Qlo2TUppVVhsQUJGNHZ0eHJC?=
 =?utf-8?B?emp2T2Y2LzB6VEI4R0tLSXVqbFZJeGFieHpqaDkyQXN0ejZEQWk4NHZ4QzU2?=
 =?utf-8?B?MnVrc3V4cWoxUlJlL0dYNkVpSzZZVUZkZzl2M1Z4bWRYU1BKd0xld3JpQ0dx?=
 =?utf-8?B?dko2a09nNnBQMCtRTDUxM3lhWHgrejEzWmpvS3dKdHJLMEdEd3ltdFdUckxG?=
 =?utf-8?Q?+Zjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9MWFJHQitIUzJNelhjRnpvaWc1Y3IwWGJlbGJkYU5Edm5USzVFMFVEQWgv?=
 =?utf-8?B?RmZ6djd2U3F1ODFuM01tME5qNEtxeXBEZllCKy9yc01VUU9DeXBUc0Z5ZCs0?=
 =?utf-8?B?eXBWK3FvdThtTnJDejZ6RDMzZEFRaHdNZTBIRDBoN0hFNFMyZWVtcit5UzZ0?=
 =?utf-8?B?SkVrZ0REWno2SExpUVZsczNxZ2JYREVmUEFqakR2a0hab1dSb1pOSXNsUG95?=
 =?utf-8?B?MEdjWVhpajdITFQ2VmxTL2RRckZ6dFF1emxHek4vNUVIZmRwb3ZMNG1GY1R2?=
 =?utf-8?B?V0F3cStZalgvb1VPNU0zV0sxbkdiNTdHYVdMWUU2TmFUSzdCdk55T3NQaTB3?=
 =?utf-8?B?c21tMDZ5MnBKbnhaenY3bFIwUmRmTjc5eitKdDFSbmdqV0lpcHVTbkQ0N3Rs?=
 =?utf-8?B?WGxLb0dsR2ZxYVpkSWJpRXhYTU81NEo4NEFJYTFEUE1HdTNUcndTV2FaM0pY?=
 =?utf-8?B?NmRkbmxSeUJLL242cDVpc1UyZTVEcG0zbDB4R2FjajdFTjN3L1lMT2VoY0NN?=
 =?utf-8?B?TXZ1Y1BCTGwxdU9zOHBXaWNld1hVekpxZzJWRXh6VUMrUTlCUzQrL3NKbEl4?=
 =?utf-8?B?S0pJZ3Y0T3N2ZnVKdkZqV3UvS0NxUzBDb2Vxc3dDREVKVkxIOTdIUndvY0pP?=
 =?utf-8?B?VmNxbGR2dmFsazhHNWQ4NGZYcGdhUEVwQXNRQXNNaHRqVE9RdVNxdm9xcCsy?=
 =?utf-8?B?TFpxRGE3RnlmbkhRTWJidjUzd1U5K3dWcllzOUNZVldNa0JOdHVMZDY0cDN4?=
 =?utf-8?B?ZkZOMmJlQld5R3ljelBqNTlQTnJMWWJzb2o1Yzhza0dvT2x5ZjV3OGEzSjhs?=
 =?utf-8?B?NFBaRzRrNEJzYjJFZDNIUldvanBMVzV6UnBrVFI1TEN3QW5oMHM3dDBmQTZr?=
 =?utf-8?B?UXlnc3FRdzZzZ2pSNU5mQ2lQZjdZOVFSaVFJQThlMEs2ZU1Xd3ZqOHFVWVpF?=
 =?utf-8?B?V0Z0Vk80WWZ2VTNjVGgrdklrSlc1bCtycGYxZVMyakJGY2dUR3FWS1hnY3FD?=
 =?utf-8?B?ZDkyVGdDaThudUJuV0lFKzNjMk0xS1VyZ2V6UTQzeUxnaXMxTmFYSFFjSnFv?=
 =?utf-8?B?TVUyeFM1ZjQwb2J2TjBBTkRUUXZBTm9DZHNWOWUrS09oc0lYb3dTclNwY1Zw?=
 =?utf-8?B?cHZtWEtJK3F4S21HT1Y4VHVMTUFkd2NlbXJCVHNxTVdiQzFNaklIQnloemZo?=
 =?utf-8?B?K0pmMTRQT28zcm1rdzZoSkgrWWxUTDN1UmNNbDBWbjQ4eE5hYzNmbFIrTmJv?=
 =?utf-8?B?V3FFZm53ekc0MFFoTjF6L1FWc09CS2NHOUlzRU9zNUZubTFRSDRiMDliZnRx?=
 =?utf-8?B?UTh2eXRZaU5rZ1FHSnhZd0hNSlQ4eTIrQ25oeTQ2QUZvZlh5ZnRGVll0WlNu?=
 =?utf-8?B?SlgrKzU1QjVSMXVPMkRaQjJvb2M4a3hwWGVWZmdIc3hLcnZnTkk1dTBJYlE0?=
 =?utf-8?B?a1BKQzl2YkgySjhGVWYvdnZvcHphWmRac3RNUFRvbkl4U1VTYS9zbUNMSmlO?=
 =?utf-8?B?OVBvUjhCcmdvNmpBZ1MycjJ2UjU2cEhZRWNMeDZWbzBRKzVOUmJxNnE4R0pv?=
 =?utf-8?B?c3owOXhZT2RoTEdiWkJFbnpUYWkzOU5YL1pBNWNEZmNVeXYySElFdk93NE9l?=
 =?utf-8?B?UFczSHk5OXBpS28zZWdHcUFzaGM1L1d0SzllSjFDbVh2aHU2R0JQYW1PeHRa?=
 =?utf-8?B?WmdSTUpuSVdrTXJLSm1kanA4dDZjYjB2TnZnUWM1REIra1dNVzJIalRVajlm?=
 =?utf-8?B?dVZaL1BoSG5FSDFsWHFYR090L1JzcnV2V1cvSldzTnB1N3pVYmNuTjJPYVZv?=
 =?utf-8?B?b09JcmdyY2NKZUU2MDNyUld2U2REMkJJZW03KzBTUC9zcDU2MHpGd1JJQ3RJ?=
 =?utf-8?B?aVR4WUd3b0ozbTlpNHRjdDFabmNWcjZ6b2x3TUpVQnMxZndJcXhUeTdKZThI?=
 =?utf-8?B?b2UycWhpdG9XRU8vWXNSNWpXVGc5M25zSUU4WFFZZFBuSjU0cGk3bm5VdCtT?=
 =?utf-8?B?K0VuT0NwSE9uM2JGdUZxY0FrM3dvMFFKMitIZnloSGdwT29OQ2U4OWR0QTVu?=
 =?utf-8?B?N2hzMUV1L0hpZExld2IwcmZoVmtrUExjNUY4Si9oT1hLOWZmRUdBYjBkNGQ1?=
 =?utf-8?B?WFQ5YWFDYUNkZS9hVHAvS3UxZUU2QzYzUE1nZ1dJdStXK1FkY1VPSnhYbDBK?=
 =?utf-8?B?T2pvSjlOZDBHYlJpL3g1UTlmUXliSHlFVzBvNTBxZ1l6dFpHQ2pQRDdobFJY?=
 =?utf-8?B?eDhPRm1FeWF5TldISCtyMGhEK3daV2txcDBKZzdZVC8wbU1TVkxIb3F6dkVi?=
 =?utf-8?B?Z3JBNkhtVlRCOGl5dGxEUjhCZG96MU8vdDZvVEJOZks4RExPYm1ZUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78af78ee-32af-494f-0604-08de72745302
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 00:41:46.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H93KjWOtI9iO88oWczd7Wxpkhj+oO1WlzMfL6vMWZWwPHZGzfEBGWfpjdJoaTh6QHJHwVxHfPwLKIyxdVCkmCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: DFD8B170FAE
X-Rspamd-Action: no action

Hi Alice,

On 2/21/2026 3:59 AM, Alice Ryhl wrote:
> On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.
>>
>> Typed iteration over actual items is provided with a `clist_create`
>> macro to assist in creation of the `CList` type.
>>
>> Cc: Nikola Djukic <ndjukic@nvidia.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Acked-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> In general this looks like a useful tool to write other abstractions, so
> that's good. A few nits below.
> 
> Also, I think it would make more sense to split this series into two
> with titles like this:
> 
> * Add clist helper for writing abstractions using C lists
> * Move buddy alloctor one level up
> 
> That way, you can tell what the series actually does from its title.
> Yes, the 'why' of a series is very important, and must be included in
> the cover letter or commit messages, but I think the title of a series
> should explain the 'what', not the 'why'.

Sure, that makes sense I can move the buddy patches into a different series
indeed.

> 
>> +impl CListHead {
>> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
>> +    ///   for the lifetime `'a`.
> 
> I don't think C vs Rust is useful here. What you want is that the list
> is not modified by random other code in ways you didn't expect. It
> doesn't matter if it's C or Rust code that carries out the illegal
> modification.

Yeah, this is true. I will change it to the following then:

"The list and all linked `list_head` nodes must not be modified from
anywhere for the lifetime `'a`."

> 
>> +// SAFETY: [`CListHead`] can be sent to any thread.
>> +unsafe impl Send for CListHead {}
>> +
>> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
>> +// by non-Rust code per safety requirements of [`CListHead::from_raw`].
>> +unsafe impl Sync for CListHead {}
> 
> Same here. If another piece of Rust code modifies the list in parallel
> from another thread, you'll have a bad time too. C vs Rust does not
> matter.

Ack, will change it to:
  // SAFETY: [`CListHead`] can be shared among threads as it is
  // read-only per safety requirements of [`CListHead::from_raw`].

thanks,

--
Joel Fernandes

