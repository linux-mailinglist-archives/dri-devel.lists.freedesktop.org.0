Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0ABC2B97
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 23:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687A810E39A;
	Tue,  7 Oct 2025 21:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LWZ8LwAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4610E1AF;
 Tue,  7 Oct 2025 21:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7bsPyB8ZtPSt9x7lIC1Zxp051iXGgwmSMtCjkBaKHGAx36P4jN4NpPFfGA6YhH7eKAsSzaRpGnILa4Eym//WprLSgjg+yKXH2hdTlnx5NK56Ts47/QW+ZC9FB1pFny06BErYJIJelmCMoXnEhXir9ZS4Pj9G+7zKZP8Q3tvX8RMl7+f0vxGVhdm3mjxA/8wQLZJpav5tTjBltgruTpW/oWgqcGdxZ+XDJPECnDaMuCIwlQ96D4RUk6Qs4E0QdQE5dh+7bCuKNQZzFU9yeninAHYxFQaquOBXGaSRRFBE8S/6oUE+O5ZLINK00Pi19KZNLwgysEMeworr3HIlZvAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyYRoimdmcb5oqGBeUdyEjxTYjqvuNylLkvygju7Tww=;
 b=M+NikRDDCDEsPVwasQ9WZdsmfyXqE82Pt8orPu5qqZY5N8mQbyt2anbsjJ5OXxCPq4k4uM03kE2XnNN+MwevZ278cdSYJXSoso6qWilV1hqkLV6zQpnVhMj+u6Igkz+h/pnULbmsWvepUiFi13zgj6W8r30Bn8y8dM/XnfkDPO0Yxgpd3WPOebaPeiArrHkibCJtwcklyVOYg4/JoS5cUnrNWjcNM7IvxNKuUW+g+rIfJaI7QKiEdV03CiXxxYFcUUFvv80OwnHHSsSBrKgsfEg622wBpf55Za724VKTpqv5kvMg7vt8Ts29Hk4wu8XWeB+M+3NC+E0wB7ZOKWrA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyYRoimdmcb5oqGBeUdyEjxTYjqvuNylLkvygju7Tww=;
 b=LWZ8LwARp7jTgfynpJRc5l0lr1mN7kBHFkIWfxGl7PrjvbZl7w4GiWV+54QT/wbtlk8ZtXx0YY5rNxASuujRPI9Umln86G7eL6eswhG40LuAhJ0scTD1pAooz5jFVB82nKxpebB7/AacY9s+QYOXNk5EcL8b0Ym2glBXNYI1CcbBQqgdLqif3HgcLt06Myij9Y5xWnabRV8MmwXP0GsH5v/Li4dTKE/zT5IUxWS6PM+vVP/MTcIr0E63pS+Vy36CsnT07H57D8oHvHRiILdSfKEOsuPB7yj4jcMhu5WZqKRIermpEcm91BBOR1c61stIESkKtsM9m+7hulr9ek2sIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 21:08:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 21:08:22 +0000
Message-ID: <faa99188-7ccb-4c7c-b705-3a207f5acd17@nvidia.com>
Date: Tue, 7 Oct 2025 17:08:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDC49ZIRX79X.2Q4KW0UY7WUF3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0964.namprd03.prod.outlook.com
 (2603:10b6:408:109::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 6977d0d0-fb4d-4788-db9f-08de05e5a5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFExWFZ2SkRCTFA5U2xDMGhmN1NrY1VxcmY1VnhxRWkwVyswQ3hNWTgxRmNR?=
 =?utf-8?B?UW1KaTRPSlJPSnBYUXcxcnlWVlZRSFNTNVVxWHJXNFVaZlhhQ2l1VmYrcDNY?=
 =?utf-8?B?UHcyZ3NtSldTWUpsUTRLR25pNEZFVkZqUnFraE55OFlRR2dCbDBob3F1MG9M?=
 =?utf-8?B?dThIaEhwTlZSMldkUDc2NnkxSFdHNWFJVzVoRlhFRkF6TVlMTlZxdzgyNHNm?=
 =?utf-8?B?YytJS1ZneFNnTjRuMkdLYWZZU2hRNmNZbmU2a3M2NlZTVjEzR0dXb2tKZU1E?=
 =?utf-8?B?QU5DQXdSbyt0R2JnTlVtSGhkRzNoSVVZSlA2OGQ3cUx4STN5TkFGTG9uSkln?=
 =?utf-8?B?NU1icEZlSy9hWXdzc1lIRjlRZzZOMG8wc3pIekh4S0d3amEvRGgzZ3NaWExp?=
 =?utf-8?B?RTlvR3p6SS83ejFsK0YrUFlMLzJwdGJPUnNTaklYV0ZQTDdqUzREVlF6T1p4?=
 =?utf-8?B?VVdSLzRTR01NMUUvcHFuT28zcEpXYnV3b2plVEthNEVxZ0xLcThYd3hYcHhL?=
 =?utf-8?B?STA5Y2JldlpzNWhZUmNNaUZxeFRFK2daQW9vNnhsdGF6VGlMWW1nbk0wUitt?=
 =?utf-8?B?OUxYNXp6SHdsQzFhdzhTeDlKMTkzejdWVU1kK1BMZENpQW54c1diRlY1S0Z6?=
 =?utf-8?B?Z2tiUGhsMUwzMXNYdm5KYmRkM3BxZjV2b3F2bXZKVXlTb1k0TzBCSmFEeHZm?=
 =?utf-8?B?VTVwMVNKWFZGc0ZRdGZGb2hLOGk4Z2VHM3VhbTNzNWtaT0d5dS9YaHZKaUdk?=
 =?utf-8?B?eU1EY05mbmNweWJjNVdqQWpnZi9sU2YrU1h2OVFLT1lIcGM0a3JxS1Z1ZWZO?=
 =?utf-8?B?OWZEZWNGZmYzVVo4MEhOWGhNTTZmSkFpN2UrQTd6eEZxRENWMW8ydmZVQ25q?=
 =?utf-8?B?VllzcU81d0o3N1ZONFBjTCtOajBjNjhaeTZOTlFxbnQ1eGdreEo5ODIwOW45?=
 =?utf-8?B?WWFWdEpqSTZnaUFPWEU3aC9YYm9uaDZ0Zm1mbFp5ZVlLeWMya0doWmFwOGlQ?=
 =?utf-8?B?RzB3VGZiU1kxbTdnd1hwWkpES0FqSDhyeHRzRS9jbTEwQmdzZW9KOHE4b0xh?=
 =?utf-8?B?NEh2THpIS2lkT2ZZT1Y2bTdiWHltMWxUZGU5eUdQcFVwZ1dNTzh0Rm9yWjFX?=
 =?utf-8?B?b3Q1ZmhWblBOVUhla0ZVaWxLb2RNNkg4S1hLKzg5MDdLS2VrMzh1MUJVbXZs?=
 =?utf-8?B?YTFFWEx4bWJQMFdWMXpPVkU2bHFuZDg0NHVyWXNGTmxMRkRCbUlmam00UXVq?=
 =?utf-8?B?TzY3Rk1hZndkb1NWUHRMV2k5cmY5dzBrTkVnQzFmcTNtYk9MbmdTelpPTkFp?=
 =?utf-8?B?bkdQNG9SdzFpeENSVVp3UUpCWXJ3Q3pzZ1VTR2N1cmxoaWlYMHFmUjVKOUdq?=
 =?utf-8?B?bXZKeVg2djRuUXFDV2ZHb1oxZDI3aHNoeHpRcXRqTlVoSEZyVWtOcFVycnNh?=
 =?utf-8?B?ZzBPOXQrdzBxUkNtdCtxWHhpbEppUVRQM25mRVdKTm5FcGlZcTYzODlSRG9D?=
 =?utf-8?B?S29HVDhjeFV0eFdQZFhwY0tPZGpLeGlWdldXM21UaGxRSGRDd1VqNGp6dHBF?=
 =?utf-8?B?cnhJWGZldmF4RWhNZnVLc1hlMSs3VHV2WFQwVnZLMzc0ampaNytRaXA4YmRi?=
 =?utf-8?B?VHQrQWlHWUUyZC9ha1RvMDdLeG5BU2JZTG8wdUdkU0ZPdSs2b3BDMmNnSW1M?=
 =?utf-8?B?b0dlSm1EQ0FHdndSd0lGOFVLVFRWY2JoaHgxV0ltV0djS09wMTBBVHNIN3Vn?=
 =?utf-8?B?WkVCbUlGS1ZrTWxiaE8vTXdoY3lnVThxRHU0TUFodzVyUnhmZStmQ2dxVlFh?=
 =?utf-8?B?MlNHd2xoMEt3NW93VkxNTHlISURQMWVQT01naWJWRVE3ZHdZVjNDVE40eWFG?=
 =?utf-8?B?aGhCK05aVkV0YVFsRlBxUHJubDd4dURkVjB4eEl0QXE4cDdEbzVlM24ya0tP?=
 =?utf-8?B?ZzVaTUFrb0hJNTIvSWVjUXVmSTVMdDZBcWppQnM4T0I3WGRtZ1U4MjBWZFZV?=
 =?utf-8?B?enlHTEJWUVNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU1oQUFHbzFiZDdIaTBPVGw1YlpxT29CcjhVS0JGN0NITjNlL0U1ZXNxNGRn?=
 =?utf-8?B?REJMZjNRUER5N0Nxc2ttWkRjOUZVOEwrMDU4ZlkyZm5ER0lYb0dieEJMOWdF?=
 =?utf-8?B?K21EV0dPRjBhcXVrcUlGQ2xGclVHQTkzai80RUhkaWNXTGFpVjBDdS9aTUZX?=
 =?utf-8?B?UjhXMDJWL3BYUEVQL21FbGw3OTFTckh5UDB0WFpwMVk3cjhLcUdHWndXNEl0?=
 =?utf-8?B?ME5KRmhLVFhlL0UyTlloZ21uMytuQko4cHBQRlJUbHVlK29xVjE0bkRCbGl4?=
 =?utf-8?B?SS9RSFhnMVlZWklJTjJlc3RMQVBZdEQzTEppYU5WMUhyWEgyUzZ4VEo2aUpz?=
 =?utf-8?B?dUtxWExFa0VqQ2Jra29lOTdNYlBmY0pwMExXTXlOV2h5Q1pobE94ZHJxVHJR?=
 =?utf-8?B?WG1maWJWeldzREVZQ1VnNnN0ZTFGSmhnQXZvL2N6TDFGNkdMeVJPNDlBeDhX?=
 =?utf-8?B?MEJWUmFqSTJnNXZSZlRqck8zVjM0b3BUQWtSbmZsVUdzQUZoMDFZa0ZHeFNw?=
 =?utf-8?B?eFF0cDh6ZUM5VUNvM09RenJDajNrVGhXYWRKclVXWUQ4eTA1SnBRWU5LZ0FQ?=
 =?utf-8?B?S3Zkbks2NHhScjNvMzRqR3hqeTVsOEh4clppbHo4SjR2YlB2Q2U4ME1KMVZm?=
 =?utf-8?B?NGNreVpRK0tXdENIY2FuQWdBc3NWNk9lckhhN0dFRUw1djVjT2FaUW9kODJm?=
 =?utf-8?B?UjZybkxtYXAzTGxocE52WWc4bXZKdjFzeVFOV2VmNEp5SVhOM3NEaUF0SXRB?=
 =?utf-8?B?RlZLRHJGOUp4ZUZFZ1NWWEdvem0rT3QwMVBrOGFqWExpZ3hza2xZeTFZTVBX?=
 =?utf-8?B?UFB3cDBRb1h3MDhOSmgrRDBQeGVtYWt4cTN0dENrMDg0L3BOdHhpMWt4ekZT?=
 =?utf-8?B?eFVzVFQydjVGU3ZHSTE4eUhBTFRGN3hxVTZkQ0thZHBJZ1ZQT0xETm9NNUUv?=
 =?utf-8?B?Tk9tVXZkMm05R0VFbERaL1B6di9CNEdqU1crN1V6ejhaWVpDTW5sajZwQVlm?=
 =?utf-8?B?K3pqSnpINnUzMGdTTHkwcDdHY2x1T1pUOXJyaGM1TUlkdkw1d0NicHVqMEZC?=
 =?utf-8?B?REE3YUpHTTBwZ1FiZ0I5TmYxVFZKaGp4bXF4d1pXQ3JGSEkrRmorZXNLNWdt?=
 =?utf-8?B?blNvTmtwUnVkdmJRSE1OSHkvSTQ5djdFK1JiZXFzVVpvSlBZTm9IQkpQR3lv?=
 =?utf-8?B?S1EyTCtQQVkwT0p5bVRRV2k2Z3BOVSt6cU9TSDJXUXRXSFhHUm1ZL1hHWlMx?=
 =?utf-8?B?M0FUZ0FvNVhuTWdYcTVoRTdwdVl6MFFiOUZUcmN3blpiZUUrNVNJcHlUSVZU?=
 =?utf-8?B?bDJiVFF4U2l4QkJScFhUYUs4NmNVY0dPSUUvcVFEMmFDSE42U2tuMklmallT?=
 =?utf-8?B?cEJHa3QxT1pQRTZ4c1NvVEQ1d0xwNHBPNVZjK215WnNweTFjU3hqcjlCOGlF?=
 =?utf-8?B?d2JBODFDd005RWF6MklpcWxISGVLbzNqanNkYkcydmNjenhmZDlva2hpaG1t?=
 =?utf-8?B?cldTbk82NnRGOTJISzA4cXlhZVlEZHFGN1ZQZHJDMTE5cW43dndXbllSdDgr?=
 =?utf-8?B?MUlKMU40VnJnV3d4dnYraHlLaEs3QU1JaXpmUllSOFdSTmlrQi9CbVFNUmov?=
 =?utf-8?B?VjZaQkZiNitsUVFPajIzRDg1NHdLQTIvcmNJbmtMaHp2RUNtY3V1WldkbVk1?=
 =?utf-8?B?TElRblNCUzB5bHhPcitjenJBR0xqWlFOaXE0V29BR0tFSDZyTVcxakJmcmtl?=
 =?utf-8?B?aDVUbDJhdS9UdUJrUFM0QnVVWE5HakJVM1R4SmkyRkhoTm9sMytxMEZhTDNN?=
 =?utf-8?B?cXhwblUzU3VuZXRMalVLdzU0M1pNS2RoMGM1Y3VhQVVvcmZISTZCRjc0enFU?=
 =?utf-8?B?MXJyVDlZTU10RVlDeWo5UzAzZW9WYkxDcHZBU3o5QkFSYjYxc0NXODh6Z2hQ?=
 =?utf-8?B?dnhpQjc5MnVGYmZBMEVzMlFEeDRUY1d2NFlJbVdlWGxiajVXMTkwMjJWZ1Ns?=
 =?utf-8?B?a0hveGp2NGdIRXM1VXRIc1c3VjdGY3lHaVQ0dGlFWUZzS2d3MDhzb0tOYkhx?=
 =?utf-8?B?Qjd5ZFhCaWppQTNDdWJaYk5ZUzNrUXJpWGdueWtoeFJ4eHI2ZExzZzJYWkhT?=
 =?utf-8?Q?iWG5FF0AN1V+QIOwPCwWMR09a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6977d0d0-fb4d-4788-db9f-08de05e5a5f8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 21:08:22.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWjX5fN6tAjgsni7V0LLtIHnUcgzqmxyBC/KajeEBPGynUPnfInh/Kil2okf9H9rkzA/K5m4Hilpb7R+WbXdlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713
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

Danilo, Yuri, Miguel, John, all,

On 10/7/2025 9:16 AM, Danilo Krummrich wrote:
> On Tue Oct 7, 2025 at 12:36 PM CEST, Alexandre Courbot wrote:
>> Because letting it fully mature within nova-core also has the drawback
>> that we might miss the perspective of other potential users, which may
>> make us draw ourselves into a corner that will make the macro less
>> useful generally speaking. We are at a stage where we can still make
>> design changes if needed, but we need to hear from other users, and
>> these won't come as long as the macro is in nova-core.
> 
> There are two different things here that are getting mixed up a bit.
> 
>   (1) Moving the register!() code out of nova-core to make it accessible for
>       other drivers.
> 
>   (2) Generalize the bitfield implementation that so far is baked into the
>       register!() code.
> 
> Both of those make sense, but they don't have to happen at the same time
> necessarily.
> 
> Now, I'm not saying that we necessarily have to change the approach here. The
> current merge window isn't even closed, so we have plently of time left, i.e.
> there's no rush with with patch series.
> 
> However, if it helps, I'm perfectly fine to take the register!() implementation
> into the I/O entry in a first step and in a second step generalize the bitfield
> implementation and move it out of the register!() code.
> 
> Again, there's no rush as far as I'm concerned, yet the latter approach might
> add a bit more structure and hence run a bit smoother.

In my view it is better to move both bitfield and register macros together
because if we only moved register, it means we would have no bitfield support
for the page table / mm use case I just posted a patch for (which is why I
started looking into Bitfield support initially) unless we create a copy of just
the bitfield code within nova which we definitely shouldn't I think. So I think
it is best to move both.

I think we can address Yuri’s concerns shortly. All the outstanding concerns
(including Yuri's) are as follows (and sorry Yuri to send the v6 when we were
still discussing v5, but please let me know if I missed anything):

1. Undefined bitfields to be zero'ed to avoid undefined behavior:  Unlike C,
this is not a concern in Rust because we will be *defining* the raw value
explicitly as an inner integer. In register! macro usecases in fact, we do
store/read the entire inner value some times so we have to support that (without
zero'ing).

2. The setter API should fail or trim inputs based on the (un)defined bitfields:
This should not be an issue after Alex's idea on moving this issue to the type
system [1]. The compilation simply fails for invalid inputs.

3. Build pattern chaining of .set_XX(...).set_YY(...):  Yuri requested to drop
this. I discussed with Alex and we feel this is idiomatic rust and we ought to
support it.

4. Concerns about "a.set_foo(XX)" pattern ignoring returning value resulting in
a NOOP: Mark the setter API #[must_use] to prevent patterns where the return
value is discarded, ex: a.set_foo(XX);

5. MAINTAINERS file updates: Miguel and Yuri replied to this so we can adopt
their guidance. Currently I am considering Alex and me as M: and Yuri as R:. For
git tree, let me know which tree we want to use or could create a new one. For
the IO (register macro) change, I can add add an entry to the existing IO record.

Does this all sound good? If not please raise your concern as a reply and let us
discuss it.

As next steps, the only thing left is to address #2 (unless anyone replies with
any objections). However, IMO #2 can be addressed once the code moves out as
well (it might be a bit of time as we need the bounded int changes in case we
want to address #2 before moving code outside of nova). Thoughts? Everything
else above (expect #2) is good to go and I can roll it into v7 soon.

Any other thoughts or concerns? Thanks.

[1] https://lore.kernel.org/all/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com/

