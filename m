Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA47C381E1
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 22:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033E10E08B;
	Wed,  5 Nov 2025 21:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n8595GPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4E10E08B;
 Wed,  5 Nov 2025 21:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6f73tclQXgIjZs/6omfXKwNsVlzxhdsKHv3NbgdxuUP3Iqa3ZgzyAZ1Dv52X/WAJ51ZKxYEhiwCaz0A3WJayuZHe03h0oJzj6BtAjrJ6TbPohsKkYmwtT1a5ZU4bxy/PClUEPbMxeJ7n7e8Rm1ro+R4GkF1hrLADMd1UwS6KqaVstCDxuH04TRHXTiyXlFZaQgEa1TAboH6h8bNcDjK66ijNVkDYP7OdiiVQfDPyO1GmheRxM56K+Tg9AzcTEWNluLAlLuRzn1tcOpF6FRFyizfxyNKtjZ5CCyvcohMVYKXG6IdnVjij4vIrju021Qg5hmEq1S8Etu/+3axieRP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4k3564xqw6aXzMzldUjODX4qU3BN39OY5mn6oHJq9M=;
 b=l5kDZvFQr7nT60km6ITt7QSG6FpJmXk386bes08/H3bA6kGXPeoPPYIIfCGNfYgbfVojv4AAbb+lkXckn7W1oO5dTQ6q4T6mZOgNGbvJRRDmGp5NdAGAe6jCkZxSLCVk2JhdqU75/xRvW15FQN9Qw+nGQhnla+cU159nhRWh9itOePskJrmDJBI8DQFAJeg6Ggs9/daErqMvrqnZGRQpkpsS0T6PyAPDIPwOUONCkLITzezrEU44mkcNBdjrbNZz7WrO57HSZQgmGBMaD5+NPsCgF8wdBy4fXJjKoy+wAQW88phLqQgcEqhln2+9uQPv7H46PIiUIjKQGUFn3VJxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4k3564xqw6aXzMzldUjODX4qU3BN39OY5mn6oHJq9M=;
 b=n8595GPllc9DotIwrzZlTGna6HcaVfrFGcPBDfMlpZtjZiwzF1u0QVNQAg47unOFPDlwS8xQCffv/GdVxSps7Xx3cZ6Fr/jsct184oUTIGZNohDmjrKbjLtxqRGOoDS586M54nsqmGoMf9mHABMpfHaX0h7eLgrvQy+YMRHB3qAL/GCJ6zIMu+qgMEg+PzuCVf/9vVnR5nT81em+ZoYfaj+hQ8ftk8C12XTdaavuZZ6qZVPEAW2ng70breSO+8J8SrCpHsRcWl6tJtl1TOnMYoLDOZoCQp0s55lvg5JTv/rzKJBRB4/f6xkTp8hyD1XmYr+dYPcHdRxV1ng8eVIBsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 21:55:32 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 21:55:32 +0000
Message-ID: <3c625930-348a-4c96-a63a-6a3e98e59734@nvidia.com>
Date: Wed, 5 Nov 2025 13:55:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
To: Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com>
 <0FF9536C-8740-42C3-8EF1-5C8CD5520E49@nvidia.com>
 <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <93c758298250d2be9262256a698c243343b64ebc.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SA1PR12MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7cff1d-79b8-4ec5-dfaa-08de1cb60a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFBScmJuZHNtU3VVNWxaYzlySDZxdGpoNjRLaUVpQkhaMjBRZDFNdG1SOEh2?=
 =?utf-8?B?bTdZUXJYcnJMRnZvamN2Wk8xNXRXUVBzYUQwTUZUK0drMzVLdk51YS9LTmVP?=
 =?utf-8?B?L1lDQWt5ckN4dHZNR2ZVTndOZkRPZFB5RjVBbHE0VE1tUGI5ZHRQMEdGdEtk?=
 =?utf-8?B?NDNXYWRjT09WM3BxRENpQUcwb283czFSNkh4QVNUK0dwaW5MZGYvMURiOTdO?=
 =?utf-8?B?YzI2RmZIencxZ2dzMUlnTnd4NG80UHRWRE9oaWY0WVVuT0w0OVc1MUt3b0lK?=
 =?utf-8?B?Q0wvYjN4YWJZTTdFRU45OEN3ZVNKSDV5dzNqdDBTQkR2bHZ6WVdwOFZZOTRO?=
 =?utf-8?B?eUJNME83bUNrNW1INGJNcmxBQS9TTEFvaW1UZFRqVzNvaHErWlk4dUluaE56?=
 =?utf-8?B?VmdBTHF6Y2c0Z1F6NFE4S0dtVGxnR1kvaHQ2aEpjM0NkYUpyMjlvN2xZOHg2?=
 =?utf-8?B?b212YlNNaVlKVGR4T2ZpZy9IMWFDWk5GTWJZU0VuWGFKRWllU0NRaVE3SFc3?=
 =?utf-8?B?WWpLelpuUDVpZFVlNlVMeWZPRHNZYS9rTjdndFdrd3JoMHIyaVFKUUkrL3ly?=
 =?utf-8?B?ZnFZQm5PcTlEai9aeTNKb0VlZnplUWJwQlV1aTRaOGM2S3J3a2pSWTdXVW5n?=
 =?utf-8?B?TGUySUtjZUJvRG9Da1JPMFRvU05tTWRnVVF3VGsvajh1KzN0OFdwQ1VuWE1m?=
 =?utf-8?B?RVJGd3VJcnp0U1BLZ3E0UFdoN2pQd2hCNFVySnBmM1F3eEV5WEJKd3lwRUFM?=
 =?utf-8?B?em9tNU1MY094TjFWQU5RbVd3Z1dwd0Frb3lNbFJnakt3bll1dHpxeXg3dzJk?=
 =?utf-8?B?L3lzMGR1RUk1VHJPSUNSVklTZVYyQW9BVTE1eXQxeHAzczJmNkFnVS8rQkR6?=
 =?utf-8?B?NEt2QitZeVFlZDkwU0Z4UVVSUWh1ZzVXei9TNHpnMjVlV29YMEpvYnc3T3dL?=
 =?utf-8?B?ZWpiSTQ5WW5XR0MwMWQyTGZaVnNHdG9uNXUxSUhBMy81YmNwdC80Z1dnTnA0?=
 =?utf-8?B?ZDQwdDE3NnZqcjZjK3JaQi9iamdJdDh1ZUhITzVDRWpwWmRzQkw0NlcrTmZY?=
 =?utf-8?B?TkE3UEUrb2JLaTRCUnJDQ0FyUkNPdlloNHI4dHJoVElidDhMNnM3REtKeUta?=
 =?utf-8?B?VXZ2aGRsczR6Qm4vUFRjUERuaEI2RFJOMjVhTHBoekpNQmtNaGRjdEg0ZE4r?=
 =?utf-8?B?Nzkxb3p5RVpZSTF5ZDgzSnAzOGhXZUdPNUtFL3hYSmxBSHlVV2VZdGk2TzBM?=
 =?utf-8?B?RjU3ZVBMTHpwbTExWVE0bGRIQWt3Wm42L1ZMSU1SRU1yMTRCUzdVa01XV2U0?=
 =?utf-8?B?eVBmWFJNMHdqdG9EZnY2bGtkeWhDYlhJUUYzaUZDR21XSklVSnRPSkx3cXRw?=
 =?utf-8?B?TlNsdDZ6T3BKekpUR3A5TzJ5NmMzcjc4eDN0ck9tNVdTZTBKaURjOExFL3NS?=
 =?utf-8?B?TmVYOGdUMVZaTUh5eHV1anZSazVHcjY1U3JVcitzaXlhTTJrMFB3UGVRN3NI?=
 =?utf-8?B?b1R1MkdzbTJCelFvcWNVNjg1UDU0U2tXNG9WbDNMOFBHbDhrbkxsdUsvYncz?=
 =?utf-8?B?NmpxUXN4NlRsYy9DRlFnNjgyYXM5NXRhNnhha2FmODJ6ZFJKdkNSalRFTzRo?=
 =?utf-8?B?akRHa0ZseDdZdGpLamZVRzgydlUvVjFSbytYemlUdzE5SGNIZFhYZG5aZFo0?=
 =?utf-8?B?Nnc5ZE9BQmRvR2xmaG5LT3gzeHpnR3ZjRkkxdU9rNXBDMGRHOTVzc0x2bldJ?=
 =?utf-8?B?YXFhZUhCMEFLN1JjVzU4eDVQWW1MQ1IvL3gxMEJOaEVJNCtXYUNzRmRjS1k3?=
 =?utf-8?B?SU9XdWZGK2wyS3lDR3piNTA0WW03NDVXNHErbG5wUFlwbDBYTThaNFVMSGxm?=
 =?utf-8?B?L0ptWDJ3dGYrQTY1MVoyTjAwcGtrOW9DRVN5QllFS2IydzM1eWx5K0x1MWV0?=
 =?utf-8?Q?LqbQeKnpfljWK2oSjnCiWn0lJWayCdBX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmpyTEplanA3MFpJR1U3SjZ5ZDR2UEdDYnIxQXdwcXp3eFNScmp1MDI4eVZG?=
 =?utf-8?B?TDhiUlVtN0UveU9BQU5YYzRGZFoyOHVWcWpLRWFUSVFoSXloUUNIVmZ5bHBn?=
 =?utf-8?B?dVFjNjdXdGl0RXV4aWk4U05OZ3dBeFNpWjNicGcvZUVmbWh2SUNjTFB0V3hF?=
 =?utf-8?B?OWFwdnJETVRMeDhsOTFrUVI0ZEZweEYrRERiWjY1L2lFS1o0dDl1UHVOelUy?=
 =?utf-8?B?RVlHc1JxRVNXaytvVGo4anc1M3hpRlc3Qmk2ekI0ZFFnYk9zU1VXM0RoRlZL?=
 =?utf-8?B?R1RTMlhuTUR5NWN1TnUzZTF3bDM1eFM5S205dVF3dmFmSUFTK0RXd2lDYXZy?=
 =?utf-8?B?dlkvTzFJYzFWSms0dXN4NE44eXBRZElKK1BhVmlNYlczdU50cjZSdFhqbjNW?=
 =?utf-8?B?dXNzTlgxTEJyLzhQS0pJVlhPNFhQTWJsWHNJM2d2bkJVZ0hKTVZhUERmdHdZ?=
 =?utf-8?B?NXlyVk40SXJKUHN6TzVWbzM1Vm9HdXpYbFRzb0FMWDRzKzBTcHdWUzBDWkZU?=
 =?utf-8?B?Z0NWNnBZVnVZcXNvSXVJdzdQNUI2eEhLQllwekJEQ1pNbk1QSkt4UDNoTHJ5?=
 =?utf-8?B?djF1a3B5aVM3WlJtbFY5QUdqWVYwczd3VTMrdFpTTjdTZGJsY0luUmRiekFF?=
 =?utf-8?B?K0xnTVJFOUVvRHhFdi91VHdhaStYSHBQZGV6TnQzNmV2MlZINWVmc0xyZzBN?=
 =?utf-8?B?WFJkK0t6TDltN2ZwK1JReVlHTTRpMTdZT3FhQUdBS2RKQnVhMWp4QzlDSzdr?=
 =?utf-8?B?OXQrSVN6RUROdFduZnh3ZHBud1hoM2FYRlk2dWNWUjU1N3g3cUpCN3kwU3R4?=
 =?utf-8?B?czQyZEZGMktHOUt5dkFYZkF6NHZ5N3JTdkNUb3ZaOHB2eXFVMkZqT21lM0dm?=
 =?utf-8?B?d1BiWDM1TUwvSmw0bWVaMm5lTUdvMXJXNGs2SWwvemhweHo5c3lMV2VlRnRS?=
 =?utf-8?B?S01zcWxzOGlkZWpJWm5hcFRCbWxoYXBMWE1zY2VHU0dockVYeHRUc0g3V2gr?=
 =?utf-8?B?WTFFTnFFeGJWbTl1dExtWWdFUENoa2Z3WjlVTS9WMUpyTHNUZmN4em9rTm4r?=
 =?utf-8?B?aXRmZTlURFhZV0FqcVNEZS9wajl4Y2ptaVZEdHEwbFY1MWpqK1pIL2JDcVdP?=
 =?utf-8?B?RFc1Q1F3N2Q2TDdseUpIWHpkUlBONElSWTNHSE85VlJNY1FEY0RoV2piVk53?=
 =?utf-8?B?SjJILzdHV2svZEh2TE02b3Urb2drRlVLUFltK3o0cDR1L0UwdjdVc2tZSWVy?=
 =?utf-8?B?Q0Q4TmhRb0JITXI5N1huWXp6eW10UlJ3YTZBZkhPRFhJeGZnU21RaENBOTRE?=
 =?utf-8?B?bEJMK3dscTExd3RaNEs4WnFkWUFpUHVPWWpBM3dhY1R2Ukk1SGFvWTZzWitq?=
 =?utf-8?B?OGFZSjV0SjgrS3EveDY4RStwREVyT05MT1EwNjNleDEyRjU5L05Kcno1ZHNp?=
 =?utf-8?B?QWtNWG1TY2pjeDJoVU5OUktZT3V1eGhNeStZU3JBa1lhaDFReDFEUUd1T0Ry?=
 =?utf-8?B?RjVqSjZtVm8zeXcwVEhjUjhXQ1lzME5nMlhYN2xUenJBQ3VaWjF1WGI1S1A4?=
 =?utf-8?B?VnltTC9EdTlwT3JmRWlzZWgvODBaRUwvS1B0cXR2RVdxMDM3Ui85VVh4WWZR?=
 =?utf-8?B?NWt2dkpURi9LeFVURWlVZEF0VmRqampjaXAvVUoxam95TTQvTlVld1pmeVpI?=
 =?utf-8?B?K3FiLzh5K3hoazd0aFNYVXNmS05xS01CcEpLYU96anJjcWdVaEdHN3l4bjFU?=
 =?utf-8?B?YTlYMmRQNzkwZ0svQTVQdEpQSFlkYzBRbEU1SkY1N0EzOEliTDVrdXYyNUlB?=
 =?utf-8?B?aGtDWFpZRTh4U1ZhZG55S1FIK0lFR1VZZCt6T0J6dnZmTXh0aWdCWWtLRU9T?=
 =?utf-8?B?U0JqZ1hHcE1hWWZjWUxybUNoVEIxS3l0VEo2RWkxUVZqeDRSM2RWM1h1OHBn?=
 =?utf-8?B?aE1KRkw4S2w1Q0JTNlZuaW1hY2pmYzdNL1UxM25ibm1sODBWVWhRZy85U1J6?=
 =?utf-8?B?OS9sUHNsaGppN3lBQkpsYkl5UFhPbUZQYXlYWVFIYVk3R1Mvd3pPZjdaUDhF?=
 =?utf-8?B?ZCt5MFViQjRzeUQ2SmFIeVNSeHM0TW9rVFhrQlhxYjg0U2tJaEhFWFJGRVh4?=
 =?utf-8?Q?U2dExNcTCSthZSqxcySZBY4L3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7cff1d-79b8-4ec5-dfaa-08de1cb60a7e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:55:32.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otJXHKG+O0Kag7vjjU0HA4t0BPfRiS52XkP4r+D1gt+/Q0bLnvW4QYAD0D4DMmd123tSarZgHF/hUdU+ExGIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
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

On 11/5/25 8:30 AM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 03:45 +0000, Joel Fernandes wrote:
>>>> +        dev_dbg!(
>>>> +            sequencer.dev,
>>>> +            "RegWrite: addr=0x{:x}, val=0x{:x}\n",
>>>
>>> Hi Joel,
>>>
>>> The RegRead, RegWrite, RegPoll prints generate over 400 lines
>>> per GPU, into the logs. This is too much, especially now that
>>> it's been working for a while.
>>>
>>> I'm thinking let's delete these entirely. If we somehow get
>>> into debugging this aspect of the sequencer, we can temporarily
>>> add whatever printing we need, but I think it's one notch too
>>> far for the final product, now that you have it working.
>>
>> Sure John, I am Ok with removing the prints. I will do so for the next spin.
> 
> Or, you could do what Nouveau does, and define two more printk levels below DBG specifically for
> stuff like this:
> 
> #define nvdev_trace(d,f,a...) nvdev_printk((d), TRACE,   info, f, ##a)
> #define nvdev_spam(d,f,a...)  nvdev_printk((d),  SPAM,    dbg, f, ##a)

...and those are unusable, unfortunately. I've tried.

ftrace/bpftrace, maybe those are the real way to "trace"...or something
other than this.

thanks,
-- 
John Hubbard

