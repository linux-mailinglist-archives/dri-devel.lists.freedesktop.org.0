Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7565AC8CD9D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 06:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B59410E15F;
	Thu, 27 Nov 2025 05:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DgVhvlbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7A10E021;
 Thu, 27 Nov 2025 05:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkUJyKuWYkZ9XomG1gWSpfNZDr1A1uWEkao1pT7iiyYBe7qiLS5aWUnsBWh6ji0p5eOaQH0T3Ive4/0AFoZTSLj0+TtxBHWHY3ya6dBT7EqnM5e+IXN+QSQHui/VM1sC1Lr/rjHeNm0OaPF7Gh1Hjwy2pBt5vsdcJmhHueKR4Qo2/qtSTS8+ZH7ho6Ah7KuCjeid3U7cmZjI+EiAJxWH0Ogf2fx2OUBG9R2Xa/7yq+INSUlWhfIwRNTlitu5VzScfQ67h1zGwOPqAjfZqgO52NMg+tblJEKahcvJrxSKRM+oJPl7wCNPeKiXq8GHI/7NMuG4W/bAg8O2F7xD2gZVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0AJO8IS2UL8+nMjpoeHFV7v8A0GY96/ywcVTHujCCg=;
 b=Z/zqIbYtCe4o068yUmbk+wfRKnL9xGDc+M6PR2MT866jMDobDvc5LCnPgBZntP2P4z83cj9XVtSFnpSajlQnt3HnZ9eSOuoigcFxXMI79dO/SbeO+PCGxr65elz489SOUi5MD32zt3q/GPNjuI8cepFcfln5vSjSjHcTkYmftJCVDmsdrNJwS1rcI7UNf9tgLtdJM6G6DWrETNFcXkyURwjGXcflI/JR+7lzSMoVOggyqpI0VZqKQRlDp1he5wGhp09RPIU5huM9d2RVaJmyms077iBh3m8i6fuLeIgggR3pFuTJ3RpU3l+6n6aevSUg7Ni7Q8u6T0eICJndDZB9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0AJO8IS2UL8+nMjpoeHFV7v8A0GY96/ywcVTHujCCg=;
 b=DgVhvlbd1kALmM/iX3xUzv6V1CYdvyGlXcKYdU6+IRp8+0Uubso0CB0hg77mTJqO3juWxkdZJfXuI3ei/hEsYX616GX0irY3tI+vkytsn3Et6o+xYb1OhJpHYmsT4JT2Kmcuaua8VG2mlVvSegEgQKiJOLuh7X2VTIIzsfmWiGTQnHMcNRVH0JhzGcGIDwYTzOaKMiYpPuMYnmi5XrKEGQlE/MIXuiyAwOkrGPanm4GFSgcvgvZrQNS+OyEp9bliRzE8y5yYWa2teB8x5QQIWfD9iJhnVlbBaHWfLMBOMHhhjOtSKVj61GfTNPfC04mibX9Pdo3z9d7Z+vnUJnMRRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 05:08:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 05:08:57 +0000
Message-ID: <93114f3c-c1d9-48f5-ad76-f74d4d53c9e0@nvidia.com>
Date: Thu, 27 Nov 2025 00:08:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] rust: clist: Add typed iteration with FromListHead
 trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-3-joelagnelf@nvidia.com>
 <DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com>
 <04b9f849-94fc-4bfd-94d7-7337a8cffdf3@nvidia.com>
 <DEI7ZVKG4JLA.FH1MEMUQLNUK@nvidia.com>
 <352A2D64-C98F-4457-908F-4BB7AF12D858@nvidia.com>
 <DEJ61A0GHW1Z.3TXMGSHOQ6Y0X@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEJ61A0GHW1Z.3TXMGSHOQ6Y0X@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc777da-50c1-41bf-8919-08de2d73115c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Skt2VmFVL1Z5VGxVbHBYREl4S1V5d2tUKzg5dFhhMzgvMU9RdDI0WDd3dGNa?=
 =?utf-8?B?VGM2NkI1emM5NTRpU05rMGp4Q293M0gvU1lpT0gzQkpDNW1jNnFjaTJBVmpS?=
 =?utf-8?B?WTVVTFRHaGxtVG1qVXplRkZ4UWFzUXFBS09hRTNicW5FeFNERmhTMzdLSXJH?=
 =?utf-8?B?SnZMUk8rdzk3QkducVlOTisyZERJQW9Pb0ZhM3pwY3R3cEp3eS80N203b0tY?=
 =?utf-8?B?K2xsQjhsdTdMTDNqWFJobnVxMlFBSE4yaC91Q3RDazFPQ2hoZGpacHBKMDh0?=
 =?utf-8?B?TnNYSHRpR0lLeHlSMytGUEd4bmEvUHk0a0pKcHMyTEU0K1l0RHhTTHBUcGxh?=
 =?utf-8?B?aUFqcWdsdXhhOWxSVG5Lb3lObFJHOWJTdnpIQm9MQmN2TTJuL0w0cHRjSHZq?=
 =?utf-8?B?WWJLOTNnMlpZa0lXcDVsVWsvSHZURlc3QjFTOUh1Q25uOE9OdjY3OUhYS3BK?=
 =?utf-8?B?b2FiMU5LTDY0ZDFhU3dtYlU3TWh5aEtnK3U2Z1RpOFJNV010a1llSjhFQmZG?=
 =?utf-8?B?MTdrT0pwWmg2aFllN0xWcGJrVVA1Yk03R0pzcThmOGFNZm1tWkdTWHFsZEFz?=
 =?utf-8?B?dGpSYmFYQ0h6MlduRlVtMVhzVVBqL2FjVlU0Tm5sd3NmYWtTOWYzemh2cXpV?=
 =?utf-8?B?dlZiOHJYOVdyRDdXRy9qY1hJcHEweUxGN0ZkdE1oQW1MaDE3aE1lK3V0NHJ1?=
 =?utf-8?B?enpqMXpzcmJ5N3FKUWtJWm1yWlI0aVREbERwUWZQV1d6SFdXL1M4VFdRc0NL?=
 =?utf-8?B?a0tEaGVXZytUSVY4RnNUcFR4TTJaVzFmbi93c1pFK0ZoMGxSeEVFdmZIK0R6?=
 =?utf-8?B?K0FMYkhDdTlrUUJKUk8ybm54SzJVRm9WWFp5Vmp2R3FVUXdoODVoMmh3U1VT?=
 =?utf-8?B?VXpWVWY1N0dmLzBqNXlxU2IvSW1RdkVOcGlvb1c0aE0zRHJobG45dWthMGF3?=
 =?utf-8?B?Vm1VWlZmbis2ek5XcXZSOWlkWWpQSzZESjlPWWJhVnI0L2FZNElnTU1YY1hN?=
 =?utf-8?B?RUpyVHpOMEpXdGxiZVIyMW5uTUxsVHFtYXppcitaRzY3REJQZGxXaitCZWpi?=
 =?utf-8?B?NDhyaDlMTjB1Q0VYRDllcVk4eDVmSENNNTcvNjVKcG91WXNsb3A4dUovOUJT?=
 =?utf-8?B?WG85Yk9tZlk0VC80VzRVTURXb3pYaExWVGEyWXE2UWZETEdZMk51dDBuMUFT?=
 =?utf-8?B?cUtTaE9nblVsVUdWRldPdkY1Vk5NN25yL2IyYlpCU0pycFgrdm43d21Hb3Vs?=
 =?utf-8?B?bmpiZjdNM2tQSzNHb00xekdzT3poQVd1UDV5WGM3N0V0eGVrMjJzK0RPZUZT?=
 =?utf-8?B?SlZmLzFCMXpldWNzVGp0bEJKaTAvREtlOER2QXBWbEkvUU1SOGVFcGc5UUJJ?=
 =?utf-8?B?UHhRdjM2bStNRzN5NmlUajExOWxETzBoWGdUbmtQNjdhNklvcytyOGtIQ0RS?=
 =?utf-8?B?U1hHaGRPTlFRc2VUclkyRUhuNHpVOW9NWFo4SjdUTmVPU2ppT2xyRDEyMTlY?=
 =?utf-8?B?VzBvd2o2UEdtRitZK2ZsM2FMOWJWSXpYZ09Na243RDFibk9hWk1RdzNsK0xB?=
 =?utf-8?B?aGh1VjU0WHl1SmdvQ0Q2R0xva2NJUGFrWDlTQ1pjUGlZcUcyQ3Bjdjd2V0w3?=
 =?utf-8?B?c2pxTzE1amxFQk5TVmo4SHFGbmJGZXVnZnFLbXE1VDZKSkx0QUFhd21RS2Vp?=
 =?utf-8?B?YTFtdERkK2dqOS8xdFhDVzRXckxPTFdLbzBIKzlYTDFjR0NidGxNTklpVkVp?=
 =?utf-8?B?NVN4SW1BZlF2cldDbmlxOE1RM2VPY3J6SkdNa1AzdHV2ZVNSaXMrS0REeHZH?=
 =?utf-8?B?RTUxT0I3ZWNocEZ5RUpLdkRqUm9ZUW9URUZDQ296WGljSVVxS2ZBeWg3MFZZ?=
 =?utf-8?B?MnpGT3NSd0k3VlRGcDgvWis5ZkdsdWl4OXFWcEttT0kyZWc4Y0lHcDRHZDJC?=
 =?utf-8?Q?Z0mXK5E7cPFitQ7dl8Sa5UgI6YoxYZsq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFBV1hKOGtnUlBiQjJENUlwNXFXU0VzbStZeFhIYnNUUUllSXNTbmcyZWVr?=
 =?utf-8?B?Q2FPNk1ZS3UzbkljMXdIMjl2MFRqS1NPdi96QmJETzd0andlQ2hxa2NiRS81?=
 =?utf-8?B?OTJXbFpETXVvUHJtMURDOGZ1enI1MGd5V1lRQjlUZEJlUGdlMnBMUFVuTm9y?=
 =?utf-8?B?bGhvT3Q1OEFFaXZ1RFJwTUpuWVhRdTNqbjdHSzVzQ0NpV25VOXVZaGRLNG5k?=
 =?utf-8?B?MWN2aU5DcUNWaXZldGQxVGlZd2xjU3Q4b3ZHTkptYmM0OUVqNTRxaVdUbHRP?=
 =?utf-8?B?ZjhnMy9TbDNqTFYyR0oxa0xBNzQwdjRCN1JVNTJ2NDltaHRybDZPbkRSYzZh?=
 =?utf-8?B?Ty9EbXRJMmhxNktJMWpEbmdXcVZMRUt0czlHU1RTc3NQSzVHVE13MHVRNTFE?=
 =?utf-8?B?VVhYazRXWXBWMjEzTGdMeTZwSU5nWFBFVi8rQ1I2ZERrZlBDVkJ0R0prTTh1?=
 =?utf-8?B?UGxidHJPR0FYUFJBMWNjaFVZM2pCb1d3eU44T3NQcHhnSXZ0ZjRmM2ZjVUtr?=
 =?utf-8?B?VDl6NXZoenJKWFdIZHV6cno2b1l6R2NEUEN2MXhldXdqVzE1ZXpURGVuMTJv?=
 =?utf-8?B?T1BPU0Z2cjdNVFZsYWJTQzJseStmb2tWNU9SNmVGcU1OM1lzYXlGeVVlYUV4?=
 =?utf-8?B?eFNoV3R6S1Z4R2JzZGIzSC9aRjUybmFLSURCaDB0WjRURlZXMnZwbHlqRUZI?=
 =?utf-8?B?ZXpUcHZGaDRYeGd0OEsycE15cFR6QTFjQjNmblZabnBRcW82MTd0dFNWWWxW?=
 =?utf-8?B?Z2U3bzFnWDBTbUl0eWdIZjJzMk5RaG9GaEZoS2Y2ekhOSXJiR1hCY1ZtOEhJ?=
 =?utf-8?B?MUlya09DbmwxT0dKZ0o4K2YrSE5rMWdEdVZzbzY0WHhVV2ErdmQ5SVU0MStI?=
 =?utf-8?B?SzRwM043VGF5d3F4UUVFRVp2Z2E0RjRibForNXk0QkhMaGpScGJUbEsyTDVs?=
 =?utf-8?B?UU84bWhYL1Y4S0ZNUUgvdjU3bkZucHNDOEtlR2k1c29kMkpvWjdFOFEyQzNW?=
 =?utf-8?B?MVR6bHBiUFNJYkZNbmdnYmc3TlZsUGgxUzdoSEJLSVFYV3BWeWplY1F4Y3Nx?=
 =?utf-8?B?TmNWUWYwbk9aYjRZWDliTkZRREg3RnFvZHRtTmZuUFR1YVJLbHppZ1JiT3B3?=
 =?utf-8?B?QjBLTjBLSWNXSEpBWlM4NHBhYVFwL1pWWHp3aGVWVWd0cUxaMmJhVUNuRnk4?=
 =?utf-8?B?VGd2dE5RWGN1RWs3UEpiRzBLeXJKSXNrTm5FQmRXS3RGdHlSNXk1WG1nNnVx?=
 =?utf-8?B?cDBBSHJLT3NpcUxBQ25WcnVOL1VEVDlMeXhQNWNuVWtFN1RkZHV2RkYvVXJ3?=
 =?utf-8?B?OTRocnN3K2xmR1EwNC9pMER6QWlUdCtSMENjMG1vMjZ0aVJCbE02d2VwQldp?=
 =?utf-8?B?WW81RGFSRWRJMjF2enN3RVB3VWJ0R3NobmNGb3daeEdMUFR3QUJhNGNyd3Ra?=
 =?utf-8?B?aTVicTB2TkZWRStXd3dGd2oxMDBUNU9Eb0RCc3E2WDVPMTcxMlRYUmpaVFBF?=
 =?utf-8?B?V2NaRzRvQ1pxTlZVOFIzK3dMV3pwdHB4cndVR3prWUFueFhGMHVaWGloOGVO?=
 =?utf-8?B?VW80elM2Zy9HQk50cVVCWEsxKytUSVRiQmVMenVrL1Q5aDR2aEVIb0Yvbll5?=
 =?utf-8?B?RTVBYmw0bWgxU3Y5Y0dGdnIvaGFRZUtWOC9jQnBXOERYVFBSSDNhNmNnRHNl?=
 =?utf-8?B?SnhzRmV4VWFtL1hWS2t6WEJaOWQ2OE40b1pwTStCcHBtUmwxU3p5WGpDWlVL?=
 =?utf-8?B?RUprKzRoMytqek5EbmozUkNQOFpEVEMyQzJyaXlHcVV5UXpUcG5ZNmJnSEtX?=
 =?utf-8?B?ekV0QWUvRzAxSHY1NnVWMXh6ZXpnL25XU2Qwd3hJeGM4cGNGS29NQVVWUlll?=
 =?utf-8?B?RkhWUFZpRHU2eDBsK0paWUh0cWtwZVhvZnpPV0VWNWlxNlNiSFZlNVlhTGEz?=
 =?utf-8?B?RjJ4bVNTbVNpMmxaWXBjdEo3R1VWN2UvN0ljcVgrVllLL0RGR2NqcmR3VGVa?=
 =?utf-8?B?Z3NTL1JjRll3TTJGNXcvV2dTcUdFdTM1cEVydmcrZnJkQ2gwcXVxWjZoeU9v?=
 =?utf-8?B?YmNQTkpHQVByNmRMM2xIRk0yRjhSVEdWQWVBbHB2V0RWNURKSG1CZ3hDT2lX?=
 =?utf-8?Q?WnZkLLUYmLUDufrK8zZBdXxVB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc777da-50c1-41bf-8919-08de2d73115c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 05:08:57.0012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+ZylY9hnD29z0pe1d4I4d51sy/2iLURFJ+ekORMiCrilUyyeGI0Isvf4u/qIhQFRPpSTHrwQFUuLROHDgrEZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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


>>>>> Also as I suspected in v1 `Clist` appears to do very little apart from
>>>>> providing an iterator, so I'm more convinced that the front type for
>>>>> this should be `ClistHead`.
>>>>
>>>> This part I don't agree with. I prefer to keep it as `Clist` which wraps a
>>>> sentinel list head. A random `ClistHead` is not necessarily a sentinel.
>>>
>>> I expressed myself poorly - what I meant of that `ClistHead` should be
>>> the only type you need for the low-level iteration (which should not be
>>> public).
>>
>> For low level iteration it is already via that type. There are 2 iterators. The higher level uses the lower level one. I could make it even simpler and collapse bother iterators into one - that yields the final type T. 
> 
> I think the current 2 iterators design is elegant: the lower-level one
> taking care of going through the list, and the higher-level one building
> on top of that and adding upcasting. Maybe the lower-level one can be
> made private, but I'd keep it in any case.
> 

Yeah, I kept it split for that purpose but had a nagging feeling if it was
required. But ok, I will leave that part alone then. Making it private sgtm.

Thanks.

