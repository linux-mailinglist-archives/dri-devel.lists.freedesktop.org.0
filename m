Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5960AE0702
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F9010EA3C;
	Thu, 19 Jun 2025 13:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MKnXfWyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789B10EA3C;
 Thu, 19 Jun 2025 13:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+g65Yk8cc6Cp7tdZzCKZSyuqr7T9XepE6Ts8NeUL0FPEOkZfO2ntdkSqz6tKQwkVRDvbn+JKw274KU4YPJndIrNP9ye1TaCG9JeKh9gI8KWKWFI4vGglkKQpz88ixH4NPabgKHKK97yiM/grYRaYTlkBHXPIkeRGDTVspZK+j1G66lf9Lg5TQy3I8204Xn5oAMHDlU+Ra6o7Sg8aaOqMFG/Thq3UlKj9ATHazs90xZPuri/piKk05jN5arV5kJiIuZ7W525qi9PMK3PPr70DE2XnZ/cOn5uWiGNDmchavGa5g8z8PJOpzH8G/1YS31uAXAMSaoFPYnWRQSDdOESDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1t4RRkGZ6r72flCGa5XSSMQ3GK7dWXFbXCAHMRGTqE=;
 b=WGVnOYw1Vmb2Gn5eK+V82xkM5brw0aEnIypTxvTwcFqv/HlQZrZTSUwSKOJeJCfOJpEv48JEVCDcivClTpb+h/JtrWdmCqbc+B1N+HzETYi2f2MTvEZUuJlyr5EybOToE+U8cWpePsrZeVwkYVQVzJcsrmlECgCDR0DT3ALnDU6pUd40B17ShLLAv70i3VM+7e51Zbei+UkHwwHPYIl7K0Zfq6b8lT6TbeFUv75R05tm5Xery9XedVZ2k8SMg8WGDMXMOiXmx5f1PNp3RuFWarPfKzWEVDwKn0i0ElB0t4chyvN0RvLM4RaYdqsV2MdiLYXnLW+3m18m6iRI2RpiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1t4RRkGZ6r72flCGa5XSSMQ3GK7dWXFbXCAHMRGTqE=;
 b=MKnXfWyM/ExHzZgxuimnALvyo7yazFtHPlcu21ihs0OwecMg6G+IIU2sJ4flXxzpdbV51iC61Jt+oHfFhR2F/7CzLzDeoaI0UjY3QKSn+d+38XU2hGijcypEb1DlodQZFHXMsn7zkxVNnjW76sRTcapJMB5LF4zYyNUEi+1kK29iVDQUj4Hus9nLgTfk3fpxtGXhRbXIIgW4yg12oqvqjK6ahO7TAM9GN0Kwpjb42otTAHBpkEBCmr+TTp67bqzFICbYHc/UjSa/QQWVDgOyk9EMThs7LTucT1WCHSoA26ixcvfN/YWt6Dn0F6ZPtPWMDCGd7ZUTDDFYXK3q72kXgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:53 +0900
Subject: [PATCH v6 09/24] gpu: nova-core: allow register aliases
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-9-ecf41ef99252@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7b4d42-3950-43cd-2ae2-08ddaf34b04b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1dDYmphS0xkVTdRNmVpZEc1aUI2cmY3cmdja3J1ckZHNDRWQmMwOU9VSlla?=
 =?utf-8?B?bUpVa0wyTTBCV3pObDBiS2VOTzFlL2NrRDEvU09MOVB2WGdWSCszbENWQVR4?=
 =?utf-8?B?NDBmcEcvT01yZGNtc1lyVFo5cjViSnJpYkRvWlk1WmtodTI1S3ZXQjd5ZlNU?=
 =?utf-8?B?ZlBwR0c4MXUwMGRUQ0hGckxiU3g3NVdhVk5OV1JieElWNElISXlveWZjdXBD?=
 =?utf-8?B?Y0FESWY0R2Q2MG5CRnhlRlpPQWcvTEhsaGtaSGg4SzQraWx3VENOc01RUElU?=
 =?utf-8?B?UDd0eWZaZ0NDM2xQNkJmMHhlZC9xUVZQOTk1Q0E4WHJYc284dGFXcnRxY0lj?=
 =?utf-8?B?V1dGSU1NRzNuKzBuY3N0c2JQN1RnL3k4SUNBSUxQZzZkZ0xVaW5nZ3N0Z2pu?=
 =?utf-8?B?NGRvTzBUc2cyeTNvZGlUc0JGdDIxRFRQQ0twQlh3Tnk5MHRhN2JZTGhqZWo4?=
 =?utf-8?B?Q1lKVm9rM3JPWGNDRU1GNzZKbGxlQVZIUWVCUzBHUFVQb21kenBRVXg2ckg0?=
 =?utf-8?B?aytBeDZQTVBtWTMrL0FvQm1kelRUNWRWNjlGbnNKN3N2VnVoWFVQZWRSVzdh?=
 =?utf-8?B?eU5ZSkRweDN2OFBDOVJjeDdCL0xuZ3dhRTFsMEt5ekVhZEZ1aWxsVy9EQ0dZ?=
 =?utf-8?B?dFIvd255WjEyVmtuZTdUNVpnK0tlY1RQNk1NcldzaTMyRk9kdXpId1Z4NmR5?=
 =?utf-8?B?ME50OXRQalhIWGJ0d1FZQi9JK1p5T004SUhkUzh6bkVuWElpZmwvcTVyUThy?=
 =?utf-8?B?WTMxM0F0d2NleVpScjVCSTlkUFFCckQrQjVKNkt3aWN5c29FelpnQ3NycDFE?=
 =?utf-8?B?YmlMWHJZdksxNjVTekJBWm1HWU5TNGVSVWlvWFFxRnBsKzdkT0xUWURMTlox?=
 =?utf-8?B?T1c3VjVId1g0cC9lKzFWSWo0R2pNTzVxUUIyTi9MM3B5VGw2d3FnMlQwUVJR?=
 =?utf-8?B?a0lMWE1ncVllcFB2Wm8yTEhaRmozOW55aUx5dTNjc0dVZ0dsVDBtS3JBeGtn?=
 =?utf-8?B?dVJvWWtWMjcwUEZzTVZ2TG5TelNBbTNCYVNzR1JFWHZFZEF3YmJUZ0xIc2VK?=
 =?utf-8?B?MVVSS21TYmFVOEl1NzBtb01RL0YwY0VibWFHOGRva0taREY4RFJ3MzcvVThj?=
 =?utf-8?B?N3Z0Nmp4UXRyajhFZC9xNUhoRUt4Vmo1cDZiV1hZR3A2VHdGbXpkTGxrdWtv?=
 =?utf-8?B?MTFBU3Q0ZkdGUnRkMTdtZldFOHlobTFmcmIwbVhJbWFBakJWZ00xQUNReG9h?=
 =?utf-8?B?bUtTNGhpOXdiTW5IbWluYXNvb3Z5Mk9lK2ZvemFQQWdJUjdzWGZIMlQ3ekk1?=
 =?utf-8?B?Tm1Ia3Z1eDhZdjNseE9Ea3N6dUZjdHY5TlhFdDhLMWFJQU14anBuWEkrcGZ0?=
 =?utf-8?B?V09SM1hJdDliL0ljOXk2OUUrVFhyNHB4L0NXZGZmVVJPd3FYYVg0UmI1MFRN?=
 =?utf-8?B?d2E0Z1BxcGVaVElwNWE5TWZBN1A4RWE1UHdUSkc2UEllTW5UK1dWenJaUjVv?=
 =?utf-8?B?bUxoQ3hkeDlOQnBwZTVwenpOVXRWb3JmSWhYWTczZm12TFU1b09CK0pHYTB3?=
 =?utf-8?B?bitObnVaRzhRMzkyaFhNd2hiWDVyRjQyelY4Y3BsUmVDSDdXZVVmQWRXNkVl?=
 =?utf-8?B?NTJ0MElUdktxbjJZWnpadlhVZXJlQWprbGhxU3pLZm9XMU1CQ3dHWmk3YjQ5?=
 =?utf-8?B?THRtRkg4VjdCcTFIb3dVemFOYkN1OE1rUWkvTGo0RzFMb1k5ZkFMVEZTQlFn?=
 =?utf-8?B?dGp2eEd0dEovV1V4ZzB4c2w5SDFTVlZhTDlISTJJL1VnWUt1SXp2MnJXRG9Y?=
 =?utf-8?B?cE1Kenh3Y0UzRFFaQ1ZnL1pZdGhUQ1k0eW03dGIydFVINjNLOTRmMTlsbS9Y?=
 =?utf-8?B?aEdRWWhFYzlWSjNFTXMyT3ArTFhmaEF5OGtlTHpDQjZrajN1a2NUTVdqeUtC?=
 =?utf-8?B?a0xKNlFOVDRWZ2RXdFJaNnI3dnQ2VXhpcGxTMGpWY3doU29PdUR3WFFac1VK?=
 =?utf-8?B?Ymw3L0lHcU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGlVdHdxbGdtTmxqZ054dUpEY21UY2JWZ1Z4U3ZIQ1ZXUGUyL1ptMGd6SEFx?=
 =?utf-8?B?QzRScm1kS0dDMkRtRU9HNFBid1dlTGdjNXhvR3o1Q2NycFMvNTY5RGJlTXRS?=
 =?utf-8?B?bW1qSURsaFlIRjZHVVJiZW9EeDV0SVB1cHlOMjFWemJyZlpmMkNxU0tDMm11?=
 =?utf-8?B?QmtIZGVZUm5XcUl5VnFuUXNITkc1V1hjelJjTTl5QnJXRERvSnJmY1N0QUt6?=
 =?utf-8?B?NEhBTGdiZDhjNXVDZ3FRQVlsdDFJaHM0a2JkVm4xUGNOalU4VkN5NTdmekEw?=
 =?utf-8?B?WVhNTlpIYXBvenJCa2FGa2lTa0ZNc1RybGkrL0lkTkw1MlduTCtVL1BxajVD?=
 =?utf-8?B?WVBCSnlSRjRoMWhaampDc25qT2tuK255eVRKS3FRdDFzSEQvSllWbndneHA1?=
 =?utf-8?B?OVY3TVpRUExZQjhSZy84NVE2V1pjc3Q2NFNpQkxYYWwrNnNuR0U4Uk5TUjFy?=
 =?utf-8?B?L2JFY0VXNlRIR25BNld5eW1qTUI2d0lTbEttTDl1WnpuSDFUbUpUK29VMnMw?=
 =?utf-8?B?WXNoVitqSVhoeVo4cjc3eGp2dGY3R0xQcVFIdVQ2dVk2RkorZThGcmhCRnRz?=
 =?utf-8?B?ODFHK29vc1dYMW5vcHhNM2RwRWlYUk5DUTg5bGk3T3VWVm05WDRibTVqdUVs?=
 =?utf-8?B?MzNBTENTYllLam5NenNJenBMalMwRm8wWmEvbWZFb1p6SHVwTjNHa2kyN1FM?=
 =?utf-8?B?NE9GV1g5eEYzeHJ1QTdjdzRvYlJuakY4RGlhbTJwUVo1ZktUQTdwM0M4b2hx?=
 =?utf-8?B?VklSUWZMd2Naa25PSWk5WkJzUlRiM2VFVWN1S1haM01DaVg5a21aSS94Q0pZ?=
 =?utf-8?B?V0ZEYWwxVXpFK25BSVMzbEVzajRsZDJmSm1rZkYraGwrSk5BVVJVQU10NFgx?=
 =?utf-8?B?Zm1UWnVrWVU0cmkyajdrVVFSSkY3ZTFiMTJBRHAyTnNLQ2toaS9nQUxsSE5R?=
 =?utf-8?B?eXVTSU13V0o4bmpZb3ljbVRCMENHNXY4YzRBM0E2RDZacjMvN2JHTmMyV3U0?=
 =?utf-8?B?cDlOWXZFUlUrUXhza2tCWXgraHlKbTBaRWFwSXNDQkpXRWhaUkNpYkNzbE9s?=
 =?utf-8?B?MlZpVG1oQnJpeWEyeGdseUJzM2JpTXhIRWpRVzFGa0gzSzZGS3VQNzltbnJr?=
 =?utf-8?B?a3JjOHlyVE90OEt5NXBqdkxuT1k3TmNRa3BMeWZoSGJqTDlucTFaZlRLWGRQ?=
 =?utf-8?B?Mlh3dW53UTNtSmdmVUlucGoxb1NOQnlZQm9FbmhNQU9BbGptQVk0SDQrWXFu?=
 =?utf-8?B?MDBtR3dyVnhjVnViVVNIVWd5aXZxS0hUZXdmanplUmlMTGVra05XbnJVVWtP?=
 =?utf-8?B?S0xMWDNhdnJtUlFaUXFpSzd0aFBmbUxKdUtZaW5pdndGbk84U3pGYnJ4ZE5x?=
 =?utf-8?B?K0xZNWNUVVNGbkoxMUovOU5oVE01SlNTbDdEWklycmVaSlFIWitOcXVTaUwz?=
 =?utf-8?B?WW1TZ2lYQlN0U0hKa3c3Y2tHMEFuZ3JNL3VKcXR1M1F2RDhiRUtQSmVnMkM2?=
 =?utf-8?B?UE1QckREdmtpQXo4Wk02RTlLRHRIZ1lFV2ViVHBqM21lSkNQWVBOQ3piNFdT?=
 =?utf-8?B?ODF2SlJCdVIwcGZVck55MU4xajhoRWhoRitoLzBxWGphOFFwTFRuWWdlWFZE?=
 =?utf-8?B?Zmg3MmxMdFlxZ2VCdDMzcWVDN29mQy8yWFBEUlQ5d1Y5RDhHaEFSbGdxRHNp?=
 =?utf-8?B?a3NrZHgvRnBIbjZYT3I4eU41aEtpd3dQVmtHZTV5eU1keTNzTXlVbXdYT3do?=
 =?utf-8?B?U2N5ODhrV2gxRUpLaVRYcDJ1S1ZicTlyOHA4cHlUNjMvVDQxZGkveWlDbDhm?=
 =?utf-8?B?RkZpR2l2ZnNuR0gvSEhSTlhkR2xxczBocXJBVk1ta2NMRmxLTGZuTmgveG9l?=
 =?utf-8?B?aGs1ZUl1U1UyK2k3QzFiNzdRa2FuVVdrVzdITUtXcjNYWFpPeG12Z0JYenlW?=
 =?utf-8?B?UnkxMXYzZkVjOUR0TUJBM0JZanhNeDdDNDh4YWY4M3R1WXVhaUVxN2Rpa1Mx?=
 =?utf-8?B?N3phVDhsYVNEZWtkaVFHdGU3L0pjRUVJWmJmditzcVVRTkttSXI3T212bzB2?=
 =?utf-8?B?aEtudjVVcUVVaE9rbVFqNHFSS3BpanNzYml1bEJ4UTFlTkkvd1lPSG5jTEZw?=
 =?utf-8?B?MTJ3NzJPaTBWMk5xOEIxTWtrd2tGOXk3S1hwRHBUaFN5RWY2NzFiZkdLMzdE?=
 =?utf-8?Q?bamGse2t90lJkrxAztODZyO5tUo9OIuiWfAnbiVA0sK/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7b4d42-3950-43cd-2ae2-08ddaf34b04b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:58.8689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL9e5PRPldD+1JkGu3MvwcJ0vFHm5MJVoS2QTM5twgglDe+lMvD75efBThLjk6iMxiwihfG6b6iWc4fpKTXReA==
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

Some registers (notably scratch registers) don't have a definitive
purpose, but need to be interpreted differently depending on context.

Expand the register!() macro to support a syntax indicating that a
register type should be at the same offset as another one, but under a
different name, and with different fields and documentation.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7cd013f3c90bbd8ca437d4072cae8f11d7946fcd..e0e6fef3796f9dd2ce4e0223444a05bcc53075a6 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -71,6 +71,20 @@
 /// pr_info!("CPU CTL: {:#x}", cpuctl);
 /// cpuctl.set_start(true).write(&bar, CPU_BASE);
 /// ```
+///
+/// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
+/// for cases where a register's interpretation depends on the context:
+///
+/// ```no_run
+/// register!(SCRATCH_0 @ 0x0000100, "Scratch register 0" {
+///    31:0     value as u32, "Raw value";
+///
+/// register!(SCRATCH_0_BOOT_STATUS => SCRATCH_0, "Boot status of the firmware" {
+///     0:0     completed as bool, "Whether the firmware has completed booting";
+/// ```
+///
+/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH_0`, while also
+/// providing its own `completed` method.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     (
@@ -83,6 +97,17 @@ macro_rules! register {
         register!(@io $name @ $offset);
     };
 
+    // Creates a alias register of fixed offset register `alias` with its own fields.
+    (
+        $name:ident => $alias:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ $alias::OFFSET);
+    };
+
     // Creates a register at a relative offset from a base address.
     (
         $name:ident @ + $offset:literal $(, $comment:literal)? {
@@ -94,11 +119,22 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // Creates a alias register of relative offset register `alias` with its own fields.
+    (
+        $name:ident => + $alias:ident $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!(@common $name @ $alias::OFFSET $(, $comment)?);
+        register!(@field_accessors $name { $($fields)* });
+        register!(@io $name @ + $alias::OFFSET);
+    };
+
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
-    (@common $name:ident @ $offset:literal $(, $comment:literal)?) => {
+    (@common $name:ident @ $offset:expr $(, $comment:literal)?) => {
         $(
         #[doc=$comment]
         )?
@@ -280,7 +316,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
     };
 
     // Creates the IO accessors for a fixed offset register.
-    (@io $name:ident @ $offset:literal) => {
+    (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
             #[inline]

-- 
2.49.0

