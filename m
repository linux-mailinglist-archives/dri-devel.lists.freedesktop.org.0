Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E6C99924
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85F710E4C7;
	Mon,  1 Dec 2025 23:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sFcUFCLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3110E4C7;
 Mon,  1 Dec 2025 23:21:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAJaADhihr6rR4QzqeRnuDZ9RxhjGuAj+lKyZvn0q1zkC3wb1gEfN+MOpOlSov7bbvznpfxapr1hQIBrovUKD0UdECMQjnyE52HXZxTzRi+nbG+sHJVGF2+SBwPssJQ2AE0a/zEd1hZvoNMQk4j+LJe66jADu7U21TINz/7znwC9RtHSeaSXjlrPSCvrn3yakX6UkQJs7Rp+7R8JlMF6CnnHCNTBw4PDJzJhMucrCSrr0gzEyMYj23/LHcNHExB3iXIx5+E+NRqWrj2yDUwJTZM5GpbRES4w978yQB0jFfoAZN4SOdGTaVwk50pMZwRtIpzVkQZmwPRLOQRmJ3GXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTdj+3On3xoRZyjl4XqqEUWLd66dO/zy2u6AOnIkYGY=;
 b=b3dkCPBxIDh7GDBt82Hbux65VRgDNkhWXH/VxbxpW8Lg0xYeYT7wwjZaOsfiPXdld8hHiIb1SaL+FboeRzCTw2HDKnnCZB3GlNmM/30ODqeCCN0B6bTXPl68ochVRwicwvz0RmgibpaQilABjb03S75AMrp+dWpLP+iKi4Qv2zHMBW4mR6HgU1ChVDD0rdv1zJx7V5Myk4aVl26Wm4qy9HTf1a1KJH9IGSTaw5UjB1lAr4r3bmf6kOd4y9WjYv3jldhuddQ1e6VflMQXSKcOs+coI2owG0uX2a2/Du8i5tcBqZ40htCz+1MiIYeeX/IynppHrBAVHsiHv/ih5f4QFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTdj+3On3xoRZyjl4XqqEUWLd66dO/zy2u6AOnIkYGY=;
 b=sFcUFCLiqSL1Rvk4siO0U8AmOv+03PcDvKZZg8dpmLJJN9iZK9XCMXPwuFsP8Kac+3lnsRa8J6s4+tnOi17Dr5sYAZyNFpFZxpPUgtLEIFuqp6KJUPTR07M+HxyQKTqVNTEnvNyOdWV24w3WOsEeRx96sWQAlUeqwby8OpsdWRdcnqU5KqYkt/zdPLImjRcdZo8fQI++gCP6FKpd2+inWEzsYw0eenaiTL/ByF/xFGsAZlx/e16ycPl5xh15ACzSxI6H89V+bNyRtSZ5t5ZngefifQ2p65S92kW6DXLULjy3JNbOArWT01LCKAOf0V1qHTsGJg6uJ387+LGctNnKaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:21:45 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:21:45 +0000
Message-ID: <f494374b-4f8b-4ee2-9054-cc7f04fd7d4c@nvidia.com>
Date: Mon, 1 Dec 2025 18:21:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
 <4224983e-7788-4c40-8046-a67e67c9d052@nvidia.com>
 <0ed2f00a-0f32-4ed4-b04b-0a94728b998c@nvidia.com>
 <733283c8-03d8-438f-8c80-5a51714504b1@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <733283c8-03d8-438f-8c80-5a51714504b1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:208:335::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9655b663-818b-4618-6d19-08de31306427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHBPa3YyWnNuYkRXV1pxYk5hU01Sak5uL2xoZjNiRGxhbDdXbjZwUHR0TUNL?=
 =?utf-8?B?RmMyNHplU3o4cHJyY05SSFdITmE2VEVKaEErR2Jva0J6RThsenB3YXJLTW9C?=
 =?utf-8?B?eW9PYjNDbnhwR0pBSm9tK0FzclV3WG5DY3lBYzBuMG9JWEgxRmlQVlJZVTJJ?=
 =?utf-8?B?eDFxVUNqQzZOQVpFdFVGd3BLVkJKWDA5S1B2RURqWEVPMkRIb1R3bTNNcHd2?=
 =?utf-8?B?WW5HSHhHRUgyYU5SWm5va2MzNmZpWVUrQVZiN2lJZ2wrMzJrSllFbUVlZDJI?=
 =?utf-8?B?M0hRU2U3SnNlRVptZkZCRzdEeXNJUURaQ08raldFTjd2YTZ2bjd3TFgzZDlY?=
 =?utf-8?B?VHBBTDhEQURSL2V4YStkbGt5U0F5T09Yd2k4cjhURDZqc2J6aWZnc3RzZVpN?=
 =?utf-8?B?Qzg1RDkwN3BlQm5YWHkwNnQzMXhybGtLcGxHaWhKdGlmbFBBR2ZFTXh6cUFs?=
 =?utf-8?B?cjFRNzdCNkJtdm9hcXk5YWtWOWF0a2h4Y3J4cDJ6TEtJbUdRYmVRY0tYS0d6?=
 =?utf-8?B?WDN3WUdMMytMV3RWajR1Q2d4Vnd2V3c2d3dDaUNOOVBuVUpjWmpqTTQ3NGNk?=
 =?utf-8?B?anF4dytqdDRjVzlRNFpLQ29vU05sVUhJeVNsdHcvVkVyOUhxR0c1S1d2ZHNM?=
 =?utf-8?B?Zy80eFBXRkJsRE1iYkwvemN5Z3NkeE1IQnY2M1N2cG4wbDZkVmgwNWZvYVhl?=
 =?utf-8?B?MHRBcXlBNy83WUJQTEtXeDk3TEhEL0o4KzdmV3lpeDNRWGFWMExQUDh4bzBJ?=
 =?utf-8?B?RTU1UC85SVlUSDBiUXFmdlhObHFVTXc4V3lwS0tHUUE2VXZRallDdysvczdm?=
 =?utf-8?B?Mk13cWo0d0liNWVzd1NreDFKU0NOUjRhcUZWRFhYN1NhQ2EzdklyLy9tV3pQ?=
 =?utf-8?B?TlNVTUVLeW13T3BSS2JPNmtVYW5Dd1JjWUdEbE1GS3VMY2grQTM0MktMdzBp?=
 =?utf-8?B?VHY4dm1BK0ZrNUxjL0JDZjV1VGJWTU1BMCtEbTdHYU10Rk8zaHpsTlZCeXdt?=
 =?utf-8?B?OTNaZ0pnRzBSanUrb0pEbUtLdkRFNm9FdmtxaEszNTQ0Mm8zbUlkOGFWZTBV?=
 =?utf-8?B?QnNoTUoxdEZwODcwWTEyWFZpV0xZaU83T0ZTMWhlVnNkdVlJUTlDZzRaNDZI?=
 =?utf-8?B?clMxTC9IaHFCWkpmMG16TlprY2dHTEMxd0NtVFhjcnlGNHZ6S2JrUVpMNFlZ?=
 =?utf-8?B?K3pxVkZYQ3Fqdy93T2tZblNBa2liYkNjdEFJSDNqUjZkQmlEdWRhbHY4UFY5?=
 =?utf-8?B?RzFrV3BsMWJJdElNK3ptZnN6TzB2alVuNmJUR2tway9aTXNEeDZub1UxQ1Zk?=
 =?utf-8?B?T0YrSFZTdXRrWjNmK2NHNHpqU1RJWFozY1UzTW5pZkM0RHZlekp5ei9lQ2lp?=
 =?utf-8?B?NThreHpXdHROcXNEUEtlTXB4WXRwZ2pXaStybGo2enllTmFBWWxucUh6THF5?=
 =?utf-8?B?M0xOcHZSZHY0b2Nia3NOdmEvK2loQzcwNGVEV0hGamkxZ2IzNnRrSEJ2a0hl?=
 =?utf-8?B?cUZkRytIelNBbzE5aDV5d3RUeEpTZFV0Smtvd015WjVaSk5wUERmSW1sWUoy?=
 =?utf-8?B?VXN0WjdycVRwNzMyTGR5dTdDZnNnbFp2UU8ybzlFNjdLQXVvYXFvSFkweFBt?=
 =?utf-8?B?VlVuRXdTTXhmMWZZb2pJZ3pNMENld29vVVBsOFBVNk5vVXpaQS9yZjJUVjZr?=
 =?utf-8?B?aDJRZ250UlN5NTlzYkgyOCtMc0o5eVFZSXFMdHQ1VU5XVTBYeTd1cnRpMVlF?=
 =?utf-8?B?anI5QlNEYURpeThXODFhY2t6Q1dxeVo1ZTU3TS83by9KeUlGc011aVVOS0Vt?=
 =?utf-8?B?QmdEU3VGM3VGN1N5VysvZTYrRE1lZVZIUXVNc1cyZEdYSlFaTklDaGlEemlt?=
 =?utf-8?B?aHlxQ0l6cktFTkd2Y2NoQ2ZKMVdaZ3l1WDhzeHl1UDZoTFZ1Y1RwcGZndEl0?=
 =?utf-8?Q?Hvu4Q8SNUjsyf7qHjVl0TP6B6Hc5h4Nx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BGWGdYSC9lSERxZHJrclFkbk8xMkpOMUt6eE5OTU9CWWdXTG9pVFFVL3pF?=
 =?utf-8?B?bnhZRlY4ZG1ORmJvV1BIeHBTTlVXQ1NxT3hOM2pESnpQeUp5WEk4bEZNemJU?=
 =?utf-8?B?REEwRjZDVThBSTlRZEFlRk1NWEVHSTZOVmh0L2VZZ1hpbjNnM3JzU25IR1FN?=
 =?utf-8?B?RWwraHlNc21sWEtMR0NRdFhLbXdqb0pRNSs2bjdtWGpjWktDMFVMUlpncXdu?=
 =?utf-8?B?NFgwNXA2UzhRVjdFeVBFdFJMaGl6SS9VbnB1cUxESjZNYUt5TFNBb3lBVzdt?=
 =?utf-8?B?RXBFWjFUdEwzZVJIT213ZkJsZ2NKTm5HWEZ6Wlh4SFA2VTVQYXNFNWQ4WVMx?=
 =?utf-8?B?bEk5aXc2bkN5aEZHNGNNY1gzOUxlZWF3OTlhd3lpZWhtZFRSZXJXZG5RQTU3?=
 =?utf-8?B?VHBTeFQzNmhXaDZqZ0EyeVBudnMyZ0NNQkZOZnZHa2gzek5wZnBXdk9acldQ?=
 =?utf-8?B?dWIzLzdlMGFFSnpJSEZGTjczaEtQS21IdEUySWNEVVl2VGFBY3dEQVFhUW1X?=
 =?utf-8?B?UUk2Qzd1bStJQmc5TUZFVWxaSmRsM2JnVkY5YlhjQmZseGVId0xnRGRCRVlE?=
 =?utf-8?B?UWM5amZLMUR4dFFhZVMwak42K1UxeHlnaGNxUVRnVzU0dmlzTEpwZXZBU0ti?=
 =?utf-8?B?QlZ3SFYzUExhNG9ETDJaQmMxdjlxUFE4UUlzRUcvaGp0NklKWTlROHIxclpv?=
 =?utf-8?B?NFVNL0VaTVZ2RmxuZTZOUXVsWFprZ0l1ZVpBYkN6Kzl1cHl2VEcxVUdvYnNS?=
 =?utf-8?B?Z1FscXYvd2tnVTVCTHhhRXZ3aDFIOWlHNHNSR3J4QXBGSXNvbm9RV05YODlK?=
 =?utf-8?B?emNiVUVpNFI5OTF1WXdvc1RycFZvRm9rU3RsdXY0a0VEbW9vUkZZejRBYjF4?=
 =?utf-8?B?a2VjeXdqUzJadk5WdWZUd2RRMXZVeWczYnRKZE1UbVY2a3hQRGM4V20vU2M5?=
 =?utf-8?B?eEFtYitQbnl3akJFMTJwZDhCb3BuTFl1V2dkblM1alhzMWtmT2gyUS9kRTZt?=
 =?utf-8?B?YXkxMWo3b0ZtcDlvMzFnRDVVT2tDQmpsUXEwWklobFFzWUZBQTdIcU1CSENv?=
 =?utf-8?B?UU1zR0pwK0l1bGo0Mi9XaDZCcHZjUWhzbk93WGV0QmZZQlJWQVN6d0FtbnBL?=
 =?utf-8?B?Q1ZLZzdxL3hYall5M3FicWFUZmdpeGdRZlRMZU1UVGwzS1VmaDJLR3YxSlR3?=
 =?utf-8?B?Q09KUDMwcE8zQWFZUWdWeXNEN0d6LzhTSElQc3R3R2hsWXdTcHhVWUp6MnJi?=
 =?utf-8?B?UVZaeHlvekNQTUZiZDRVSVlQZ1lUZCtGQkc5SzNpQkltYzlyamZOUWRXRlpp?=
 =?utf-8?B?K2RSMWVwUk5peVB6OW9ySEZXYWd0M3FHQmxBV1RDYlJidDhqbEd0cHZhOTds?=
 =?utf-8?B?c1JtWmFxdVhkTGlObnFKRU1iL2crTFI2VjArclNzSEt3RUNUM010OU94NFE3?=
 =?utf-8?B?TVFNWlNzQ2hsei9KYmNFYTFlZ0ZFNzRUK2lhZXJmVnlGK3Ryc2lwM0ZMaW9I?=
 =?utf-8?B?TlRYZ2RGSXBvRmpvUTRiTnVlSGVqc3Uyd2pqSk5iNjNtUkIyOXVXWkhCUXhV?=
 =?utf-8?B?UVRXN0xSLzNOdzhhSjYvUGNyZ3NUVG9UTkpYL09tbXNuWDdtUERpVFBBd2Fk?=
 =?utf-8?B?OE1zRTc1cEwzUXRwbmczdXNhOC82MzlMUFJuSlVDbCtaUTlROTNhc2N1WWt4?=
 =?utf-8?B?UmZSRWw0TFRXajZzdEY3bXZGdzhJMXRuanBIY3I3S2pVeUFpMkRlYnIyNDBU?=
 =?utf-8?B?UVo2bndSbkpTQnl1dnBSSkx2WXVTVGtkenNJSWhwNG1VbVVUQU1RU1FmakV2?=
 =?utf-8?B?QTJDb1Qzak1ZOVNKL3pENUlUampsYk53MzEzY24yMkg1TlpxTFlJRlBOL0FW?=
 =?utf-8?B?TmlFUnRwQnBVVWhTMkRJSG1SVmNvREdvbGFVVkdrSStONnJrVFBsMDlhcSt2?=
 =?utf-8?B?b3Y2WVQrdTU1bVZNUlQrT1NhMkh1bWVGMnZsazVKWGgzeFFianpwTkoyK3NM?=
 =?utf-8?B?R0pjcmNmaEk2VTNVQTV3cUFva0EveWs5VTZ1KzJUNVRrdW9FNmFWV2sva2NJ?=
 =?utf-8?B?UGJ0amtSdkphcVM3ZEdnYktRMFpuMkpSV2NGZUhEWDcrNWx3ZGFhUm5vanBy?=
 =?utf-8?Q?wlyzUonIZ44fWt+uW0794TDwF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9655b663-818b-4618-6d19-08de31306427
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:21:45.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKJc5EmP2jjmAfEQxSBwIwUMhyLEsng6g/KZRl12eaIwyHIx4p7aqzdws/ofcaTiQfmvPqiZU10LbVNdgH9Xqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
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



On 12/1/2025 6:15 PM, John Hubbard wrote:
> On 12/1/25 3:09 PM, Joel Fernandes wrote:

[..]

>> else would we want to do that? There is absolutely no reason. I am unable to
>> find where you go the idea that I was proposing merging clist without the drm
>> buddy bindings - there is little reason to do that considering clist.rs is
>> mostly independent of other things and is really easy to rebase.
>>
> 
> Just the fact that these are non-RFC patches.
On my part, I'll try to do better with marking things as RFC etc. Thanks!

 - Joel

