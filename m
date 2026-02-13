Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB2PO0tsjmnuCAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:11:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E278131E67
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 01:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557F210E161;
	Fri, 13 Feb 2026 00:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UD7qQqsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011003.outbound.protection.outlook.com
 [40.93.194.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405010E161;
 Fri, 13 Feb 2026 00:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCZsARRB19TVmsOOg3tptqe1irJpkdWfzKxVnNwSeH6OHvrS/kwoY6JrYy0tNTwY2jcBJSyLiqe3OKrL+Pp4ZAOx4g7yeadETrhtjTFpmRxBdL+LycjUntkk9XjBis00oRY+4a2yG5tIdZUDEzsGrPG4iBVaFMfxpHVqDBtBVEKkS9LgSoQE8P3T3vjSkMRfud2b3kWZJ/HMwayT4ZSHM8eGbT26U5/nsyBdgOq7Ao2r6tEYHyeSADfyAMwxC91uQ/fkdNXfdAWtx/TUOpQKGwCyARb3mmR0RoUP1rOdUS6+l5CRd5mXLwt4EIhFV99PmU9G6tu+6cLiTPJW4757qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3YxjFvZBPNgD4iWXFQb1mvAUwVtVnerhiP0vOVM26Q=;
 b=mU7rvEml3W7c1SKnovlT60cvOp+jjiowbbtN2m8ojUvqHHzXKa8PZEtYGB3NInuhstSvnQlcu0LM7As2Nddozajzf8kMy8gwUjt3JGcxpeQBZbJVpRU4LwuGwbKeD4TAPCFYubLgaZp5TKLhnAbETIRPNsqEY7rxNr1QMcQ0HaqWfpZwZs7cxUdg1LmvJ47B6I0UDYqYYgbBAXadUNyma1cHwHIfqUZBFYFQKGDvLKQjn5a/ZcNT0HBzoNdBOd9z7YEJvQshaSOOsdtuWsq0FDq+1cyLHKzDLXtmu/C7pxgEd0jWIulbMu6VvBRLw+jN4dbdsG2aIlYL7qJyu1Cdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3YxjFvZBPNgD4iWXFQb1mvAUwVtVnerhiP0vOVM26Q=;
 b=UD7qQqsDu5BrekOXclKqxg4QMYMW+5TNCJAny0Q556+whr65Yz9Mj5fqESvUSPyRkQcFn8D9zi7AhOQSLYLWA9HQgt+105TfASqD0gvUrhyfJjWoeMAc+hSpFJyMsz9cB5UhWry3sgvObEs+26WhLxKyGdTBPpd+R+JFNKUgSdmbHqBtPmig5hdZQzS3XEeUw7rJPOvejFAyOa7aSiciA8gH0yyt8CSYMtvPc1guAzkpw+FXqkjP/WMxOcti0SVRl0+ZEykNIxW1iDJVaAoNqP6m4KVeCIksbrEJqtjJCrKPCguTmTukgUfdY2NMyxU5U0Gy5XsorQGWJPQJ+D9Ctg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 00:11:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 00:11:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 09:11:41 +0900
Message-Id: <DGDEDADP80DF.2ANDW4MYXMOED@nvidia.com>
Cc: "Gary Guo" <gary@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
 <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
 <DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org>
In-Reply-To: <DFWUTANX4HBS.QIN5BJPI5MAO@kernel.org>
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: a39e1512-62f6-44fe-8fa4-08de6a947898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEJqcnB3VENaUnZON2VnNjJqRE1NOFF4WnpkbGp1QjI2NU5BTFNlWmpRMnBn?=
 =?utf-8?B?M2I2eENkOE1ybUVmdTZ3eW15ZjdiMkZwbS9IZThaUEFocDh6Q3VmNjVhQWZ2?=
 =?utf-8?B?VE5QTFpxdFNVay9Sa1JMaEFTenhYdU5TK00rakhhNjAxYUtJcVk5bjA5Ullz?=
 =?utf-8?B?K0pyaS8yZU9VSEVNbFBmSXJmUmx5WGpPTnJIYjhtdmV4eFU5RnBqVzdsdGU5?=
 =?utf-8?B?akg3U2NzS2V4RUJFT0hhR2o3VUdoblNQTlBQVGVtdFo5T3AzWm5QSXZ2NTFW?=
 =?utf-8?B?aFEwQ1piTG1IYlV5dkdzMFFrZWluN1VvbnhONTlhODE0cWVDYSs3MXl6RGlF?=
 =?utf-8?B?bllxQ1kvN2U5bzVESTczZWlia2QydVpERVdnUlRBS2lDZ2VKeUYyMS9oMWxr?=
 =?utf-8?B?aG1aRjQ0bGVsQmVBQW84dEdPNXRXaDJpSVdCcm0vektLbHA3ZmFkaDVROXht?=
 =?utf-8?B?RHEvVmZ6ekdKaC9ENHhjaEtZaHp6Y0xnd0M5T1l0YzZvb1M5Tmpidmtkayto?=
 =?utf-8?B?Uy9hakMyeFl1RXZRalp0cCtzaWRaaDJyTUloZHBFeDE1OHI4elRSUVdoZGVL?=
 =?utf-8?B?TndiY0ZFQzM3QWRPMm9ZSUlScWMzYU1PQjBMSU5MVkU1eC8rZFZ6R2ZFUUdV?=
 =?utf-8?B?bFFGOFplcXNYMmV0T1FkNmpMWVMzUjEyVFJ0dm5DbkF5a1NpRXFCVU9Va1RV?=
 =?utf-8?B?ekp1QU5rU3ZQN21CT3AwekU0emYzM3hqZUk1NnV6c0dPOWc4ak13dlIrSGVi?=
 =?utf-8?B?cmFDa1Y1WDZrRFg1UnRhRWxmTEc0bEZEZmdlZ25yWmtPUmRRcTBrRVo3Smxi?=
 =?utf-8?B?Z1dmVEcwVENRTSs5N05Ea2RCK1d3czc3bjdvU2hWUUlKRnhnNFEvMU1DTjU1?=
 =?utf-8?B?NCtHUm8zU0NZY1VYTEpCV2tvRXZDWVhtT1l3NHNWdzRLNzVQcjA2Nk9Weklk?=
 =?utf-8?B?RG5ST2JrbGV5WFNMcEc5Mlk0WnRmeHE3QlU2QWlJSWI4TjJ4NWVCazVOcHlH?=
 =?utf-8?B?RTNJZHZIWTVrWVVlYjlybWNQMnVNZGNKd3NzRnB1VEJlSmFEeXA2bExkTzA0?=
 =?utf-8?B?WlNoS0xjR0Z6VjkycnROMUU0dWdXR0FsemR1NGN5VXYxazBWQVJweWVLQXFu?=
 =?utf-8?B?RWE3SHpCaUV3bk5aY0tzSHUrV2RVRHJnbjgzaDdZZnNTdWl4c01VSUNGMzFZ?=
 =?utf-8?B?ZE1nVS9lbC9TSnUxTTEreVBFMHhQUU02SjVFcWYrTXhDNmpMRGxsSDVxcHRG?=
 =?utf-8?B?aERXOGdzelRrdzhWU1Y4VnVPUENtYTFUTmpXNVUwV1AyRzgwcUIzc2VOL0RI?=
 =?utf-8?B?OENYQ3ZvOU9TYS9iNFNxTGFXcWUxOU5tZmRnaDRING9jSVpFNHRTMWI1MlBO?=
 =?utf-8?B?a2lJcXNJTklCR1ZFakFrUUZuMmQraDRnQlNsVUtPYTZSOEtPNzF2NTlPeE9j?=
 =?utf-8?B?TENCVG5KYks1cjJoTFRMT2JDdXY3QjFESFRBMzdLODd6UzdxRTRvdTZ4aTFh?=
 =?utf-8?B?bjRZSy9MSFd2UG9CcTdxSEd2ODBLb2xSTjlZWEZNUk4wS0VBcDhZZlloNHRm?=
 =?utf-8?B?M21JWGxyR3g0ckJlVlZhV2xLUkJ1MHRvVkd5cUJqT0RKbHV2TDh6VlpTNlFo?=
 =?utf-8?B?WUc1SlRNYSs5Tmx5OEI4aC9XQVQrQUFxQlNESlU3MFc1Q1dVWEducmpIcmM5?=
 =?utf-8?B?cmkyTzNrSDdEUXFoY3g0R2pldk8zZmx3Z1ptM3dUQ3U0NEJxTmRHanY5N0JS?=
 =?utf-8?B?WFptdEZTamd3NHljd2E0Q0FpSk5VbmdIU3hVZklNQ0RzUW1rWW9UbzAwZG5V?=
 =?utf-8?B?Z2xsMlBHZ3ZmMDdsQlJveGRNNld0VmVYWDVJWkxaZDRJbXlVUFcweW9jRC81?=
 =?utf-8?B?K056OFI4ektUYlNDZ2RIWmUzQzRQWXNEZTFuNW9XSjFVaW50Y0dxek9sNnAy?=
 =?utf-8?B?cEwvV0xRTG1aSlMzeXhDeGpkenpDZ3RaZVBtcmVVWEUvcTZOYUhYVEhqT3Nh?=
 =?utf-8?B?MUVUei9tekU1b3FLNkd0YjJjMWVSamhZUGxOSWFFdTAxSi94ZUJVQ1lCTSsy?=
 =?utf-8?B?SWppN1VoV0FLNTNaNWp4THBFQzd6V2J2eUZraG83MGtsM3ozOFpFenZKb3lz?=
 =?utf-8?Q?jsRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0RyTWZ1UG82bzNYRGFsNi9JcXV5U2IxMUNDdWdMRnUxTWpVS0RGcW04M2gr?=
 =?utf-8?B?RVNWbWV6WHU4eFI1Mjk2aW55dGxZRWQrWEtnOGdjalNzSTN4VEkzR0VMNEhr?=
 =?utf-8?B?ZXBJaS9yOVg2T1ExTDRabWdqcjM0OUxZYm5DKzk1aVA5KzhBZW9wMHM3Tmh1?=
 =?utf-8?B?Z0N4d3VCSEhjREJuM05hZ1dqTW82TW1FOXVkeVlQUmNFN254SnV1anhwVXJF?=
 =?utf-8?B?c0thMWQzbHFTVHh5YkNSemxBdEN3ZHVlZkpBNFFmS1FHTHJGMVhTb0hVWmxK?=
 =?utf-8?B?TVNuWkNISXAyNTRaU1RJK3kxR2xaUkdYN1NlNkNNeEZZT09zVkR0MVo5YlAw?=
 =?utf-8?B?L0xGb1NCK1FSRWpQbWRkM1dhcFFqbC8wd2ZoMXNKaC8wM0pSWmNsTmxib0VV?=
 =?utf-8?B?b3JhRU5BN2R0aUxaTmFPMUtiUEVsdFJhemViRUxQeVkvMHhVclNMMzEzY0Rz?=
 =?utf-8?B?YU5CME5YRC9IK2hBTEZ1NVRhSlF1VDhHUGdmS1UwRkthbzJlbFBJdlZMZ2Jk?=
 =?utf-8?B?MTJIUU4rQnB0dWdKckFuUVVpRHRkRmZ4cmFwcUJSZ3ZIUDk3di9ZVWxFT1Qv?=
 =?utf-8?B?NXFqb1JoYVk0MHRqb1hFUDgxTU5BWGNZbEZmZmt0bnI5aTJpd2xBVkhWcktp?=
 =?utf-8?B?ZUNob0sraTB5U0FuMFNLaHY2MWJVSzBja3NINENpZE5QWGpQUHdzWTFYUGhS?=
 =?utf-8?B?d1p0bWtwTGZ5Uk5uMVhDNlV4NVdpMHBHVmF1bm8xUE5qa0RmajExbFltbnNF?=
 =?utf-8?B?QjhWZSs1TTF6WW9VWjBQOGR6N2xReVBHZzFiUVBJdWlLY0VhdUNwZWthQlNN?=
 =?utf-8?B?ZmpWTmo3aCtvMVo3U2tOY084NWFXRGV5bTlKalZLbmZUSnNmNEFiaDNXQ0NO?=
 =?utf-8?B?MGNEWkc1TlRkZFlPQ3puSndCeVNZZGVWQVRMWCtEUUo0SzgxcmNJUWRnRVhP?=
 =?utf-8?B?dkZWeU9EV0FUUURQanlPMnV2K2Nxa2JDZFkwYnAzWXV3TWkrZUtYYXBTMUFW?=
 =?utf-8?B?OU56WUMyc3RwVWlnRDhoVThPQnB6S0Z4UzhkT3N5ZUpNUGhvdmU2d0crRnhk?=
 =?utf-8?B?eWlHeWQvclpsaTdiM1QraXBPb25HczJkZzV3MGRNak1wbzdjdGNuaS9Ubmw0?=
 =?utf-8?B?eEtrbldwMHdTOUMvSDJRZ1RaT1pQUm10UmFZYytKOUFMTkZOTE9QbFArbzN0?=
 =?utf-8?B?K1pTMTd3VXFiVE93OWV1TUFHdU9QWTNWM2JkeEsyZllXZVArWFU4S3Npa3p1?=
 =?utf-8?B?MjFudmVTS2ozVUtrWE1TeS80VVFtQ2xjREZsZGxaTFdyeEdpYVJuYzk4Rno3?=
 =?utf-8?B?eE85WStRbGF6R0NFRFBhSE1teW5PMWVtQkJmZ2k4R2liaHRNcG9zaU1XS3hB?=
 =?utf-8?B?eFFXV2Y0RkZ3Q09nWmVub1ZsUWFDbkxHY3ppLzRNYzlZd2I2dC9LbmZTNjRO?=
 =?utf-8?B?cUNhZEg1NjJQQS9TUDR5SEVmbjJ5UHJmWGg1U0N5T2NSZ2FzVjJJY1hQdmEv?=
 =?utf-8?B?dGNXMHM3aHRxUURlUTNIbUJlU1BUMWJjZUJ4ZUxoT2dyWGYwa1dSY1NzTFFT?=
 =?utf-8?B?N2NtclNkSk4ya1crZHZONTcyMU1iZno0MkpybDZuQWVWR0VITGlWazFKRXUz?=
 =?utf-8?B?RjRxRXJ6aFJ0ZlMrMmVFeUJKb0JtdTV1NVd3Qk0wL3p3RjRsd3RRVW5Cc2dM?=
 =?utf-8?B?NEd6UDR4dDQwZExpUTlxdGtLZ3B0NzNraW5IYU5vRTF2NDJRbVd5ZThubzBD?=
 =?utf-8?B?TERmR21zVXZ4azNMOENCR004bzRmUnVnZjBhbEMxT3FwWWxBWHMwbXNJYmVz?=
 =?utf-8?B?STB1Sm1WYk5OS1FEbnluRlNJams3QnBQNVNEVFBBM2tYaWszbHNQZWh2cUVj?=
 =?utf-8?B?MFhxdlZ2Vk1ZNGR0MThnZmxNZEZmdVZZbFZJQmxVTVArTE8vQWxqd0tJYzJu?=
 =?utf-8?B?YkZQWUFUOS9Xd29XdHgzNEtRei9LRWUvZnFRZ0d5Q1VZQmR2cHo3bnJtZHhS?=
 =?utf-8?B?aFhHQ1N1SUUrdUtOSTVEQWpBcm9yZm1rZzFKNjJVenk3a3FFN3FrREZOQU93?=
 =?utf-8?B?VUdWN2gzRml6NFc4enk0a2FKNEpSVHZiNVFiZk1HZVhVa0hWd3JsZW5hNXl6?=
 =?utf-8?B?Z2tnM0tNQmlrcHI2RkFpVGkzK1NRdFlOTSt5VkhKSmdCM3NnN3c2VGYvRVBh?=
 =?utf-8?B?emRGMzM2M2FnMG9IU0JTd1JBNy9HeFo2MWJmM3h2NzBJQzgyWFZtUXdJb0w3?=
 =?utf-8?B?TVNVbWp3V2JXNEdBZVFOQnJSRmhIc1hUM2RwU3daTWFqTllJRG1ZejRObXhK?=
 =?utf-8?B?UkQwRHVQYmRYMmpTbzc0c0pBUXdORTlRd1dscVlWQWI1a0QrV3drNkROYStC?=
 =?utf-8?Q?eJFWvul0EDj2LzHf65SvA/TdPBmiOz6zRGp9v/MDAnG2B?=
X-MS-Exchange-AntiSpam-MessageData-1: WKnAUl06NhiPqQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39e1512-62f6-44fe-8fa4-08de6a947898
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:11:44.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgGOinqchIYr5QU3hCgtVTG0G9fD7ez39GUX0sfGi6uanK8c1q+pleQCnl/FM3WrD0BkBpvMm7Dx3vHJG2ytRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,linuxfoundation.org,gmail.com,protonmail.com,google.com,umich.edu,ffwll.ch,dabbelt.com,eecs.berkeley.edu,ghiti.fr,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 5E278131E67
X-Rspamd-Action: no action

On Sat Jan 24, 2026 at 10:29 PM JST, Danilo Krummrich wrote:
> On Sat Jan 24, 2026 at 2:07 PM CET, Alexandre Courbot wrote:
>> On Sat Jan 24, 2026 at 2:58 AM JST, Gary Guo wrote:
>>> From: Gary Guo <gary@garyguo.net>
>>>
>>> This is now handled by the macro itself.
>>>
>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>
>> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> We should take this through drm-rust in the next cycle to avoid conflicts=
.

Took into my queue for merging into `drm-rust-next` as soon as it
repoens.
