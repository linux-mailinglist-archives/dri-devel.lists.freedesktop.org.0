Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALTbFeksl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4D16030A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C910E71A;
	Thu, 19 Feb 2026 15:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HTplgTQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5B810E6F9;
 Thu, 19 Feb 2026 15:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6trdVyEffPTCCIit5FZ2dw2fMC4AfnCAf5Hc9DRPWLP7FkZ/CwpxPJF2xCdOT/tWWH36OdA9WNHlk9/sad0J/9d3OZOG+76/896U2XGszokezBaJ6cmN5RYtfc1AD4U6HevZRB64IcWsipWH5p3Ic7yKiP0ubh3uX88o9zrp7cxgx1OpPt3g4w2/7+olI2/J5pmjsWH+6rp769P/xqhnVOyKI5q8qdWey7yLT/mDAEK0oMnh9HCnPNCgDrz1X6DAmqeaFBcCseQoSEI+Xc0h+5Zb4DxFjbYIRUFWINBrA8RNbN2GiSXal7OkSP2GInufxtQn9bm2mXQPXO4UV5rPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwyOwByPCFEoWBYKLnClJVsHSiF0y3SrV1Cwz1pvq9w=;
 b=eaMKsH46EPkakqEZqI6/qw3gIO5AuRWhWf4QM0eqaiGyfUvavdIvkHcnSt5aQwetmVDfnQfDFrxdFBlPVt5HOEOiXk5Yq8UkuyERvnqbTutHz+Cnw0redCQ3fGreRiZYGAzdn1QJfvVsQiYYm21mnq8hnQMbYaMyxH9vgsn07b1/XRHJIT8hXCSuR3gTPoX5WE+Zru5oytTOPF01cEnbJ5pkz5om5tYxXd3k3I+YXDrCxKQzZoA6g0PG0W1KDg2rgzDvO1GeqqOh9FXFQ0Kn9KvelT9JVPfIFilg/z8x3eONCTQTIxMhXit9Vy970BlfsHwUnmcnH1hDVJLJ+cM/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwyOwByPCFEoWBYKLnClJVsHSiF0y3SrV1Cwz1pvq9w=;
 b=HTplgTQb6mC4HEAljE1s1mNJ/B9YF25Ll2xZX0YFUNNu9luK5PS/jhCBbd2bYH3Lgoc5nzv3oIsAKAQecfvFglPxa7w07YCz4buNDdKGuabwrRVfkR2Xmqy8p+qNx/BrGyvZBBj28lPCrd1vkTFu1krqY6x+u9Oz3yGQ8jsSX1gmb59+C2k7LTBfRceaEZY/wKq2IOFKo/Er3+ekrU8h4SQY4VXzl0bWdNOSzuB+TiGS2mx7gJhl+ZLNa1ij3DPdrBWqs9j4I6f9PnX1BGAO0d1fqwryRSEU/verspj8UzDR/gnLAyYglPDMQsWWs7SwpgLnff6WwfNASAHY0tclIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 15:31:33 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:33 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
In-Reply-To: <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
Message-ID: <ab1bad5fd85cbe0a9fdfe89cb8e902bb@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:31 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:408:ee::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 277ae0f1-ec6b-4d0a-9263-08de6fcbf5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjBmMHFEY0g2V1dFREdZWlErb0w5dXI2TGRIRlhZSlB1TUNSV1g4eWYyNVNt?=
 =?utf-8?B?NTFNbTB5dGZxOXc4OEx2c0UrRTdZaGkrOE12RVlUbVUxUmgzWEozQi9MbVMy?=
 =?utf-8?B?cWlxYXRGeHpZRWUyR3dzeEthNnR0ZmJVWkU2eVg4Y0Q5YUNFdWY1d2dkbTFq?=
 =?utf-8?B?bHB4SS9obzFTZjBKZGdOTU1UVzRVVzZDTVkyVUxudStDZHQ3L2RPRkxqekk4?=
 =?utf-8?B?NnVuM3hZMjZHMXZUL0Y5MjVoQkFJMHpTNGpZWE1rMUVPZjRSYlQzMHc4WDVC?=
 =?utf-8?B?MnZEVkNTdU9jeDRsc1pvWUFOKzhQR3Q4TmNrR1BGckJuQ0gwcnRrYUYwcnZm?=
 =?utf-8?B?VEZ3VmRseldxNk9OWVdIYU9RSGx0RWMybmlWZmpvdklCYXZrbFk5d3JNYi9O?=
 =?utf-8?B?ajZBVHRwaWdLYzFVRVpPKzMvb01STnBXVjczM2x2QjYrdnZ1REN2OHJ0OHZp?=
 =?utf-8?B?bW85N3NKS3VOVVJsc3BQa3lCVEl1WWxvSUFLakI3MDcvT0JvQzdEZ3dhdHBi?=
 =?utf-8?B?L3hxOS9ySnpibXpJVExHWVIxT01EbTU2djhnT0xnQkdFZ3U4VTB0c0NxLzQ1?=
 =?utf-8?B?Zm9TcEZxRG9LMmdTVmpaNGRWcnNwVXJYTzZ2UWxTMU9JdWhqYlJHZGxZWFFB?=
 =?utf-8?B?bklBTW9hdzd5UnkrMW9mOG10RFBPYXZGczdTMzJXdkdZRlk5VE9OYkVvQUNa?=
 =?utf-8?B?dVljQWh5ZjRHUjcyZXBqWmpzUDRMTWVVL2pFTFpzYVV0NEhmVmQ0NTh4OXJJ?=
 =?utf-8?B?SnZJSFZvallobFJjajI5MnNORi9uT0xxTE1KL3U3VDFQOEFrVTAyNlovODEy?=
 =?utf-8?B?dmYyRjRHRVd2ZW9HLzNWM0NyMGdudjJMdDkzcFBibGprT0l3VnJvSkpWeFh0?=
 =?utf-8?B?Vm9zSVl1emxXYzlyclNwTHNuL3UwZk1uM3dEU1FEQ3R6em5RL3p5ZFZBSXp3?=
 =?utf-8?B?NEx6dHdiQVFjUXYvKzZmNkZ2VVpDNDJ1TXMrZU1kTGwvTWVnMnBLNU1ERUJl?=
 =?utf-8?B?by9xSE0zWHlVU0VMeldVcE0yNEREVjd2OWVJS1VEWFNKL1cySTl3UEZKTEQ3?=
 =?utf-8?B?WStBbHcrWGEvMnZ6T3Z6SWVJSGNNazRkUklpR08xd1UybTU3K1NMQlBublFU?=
 =?utf-8?B?VmExcHZXZmNxMTVWbC95YW9EUHpsWmdldkQyM1VLRWF6Y21yZE5tMU41SHV5?=
 =?utf-8?B?UXB1MlE1dXRsYkZYWll5cERaUDBrRjZ6WUE1dTdOOXVtSkgyWkovRnpNNGc0?=
 =?utf-8?B?QXJIalRpYTROUXhDZ3pZNmM1a24wVFJvVWFFTGtOU0FKUXp2bktuMmhLNHdG?=
 =?utf-8?B?MVlRb3luSnlhajdVY3dYdlpOZmJISk1rTGM2V1k4dlR1Y0ZWaXlmM29VZWNG?=
 =?utf-8?B?dFZ2cERXaVNxd1NqQTFLbjdFcHROcnJlR2N0SW1VVFVQcFJ4VEJsNHZWMU8v?=
 =?utf-8?B?WGhMTytuMVNWUUdoVWJwTVQzSk1OMWZ1S2xKd0FJTEJ5V095c1Fyak8ybkVp?=
 =?utf-8?B?ZWtCUXZVSytua2c1Yjd3SDVCMlorK1hpRFF0T05FYzM2LzlXOGFUR3pDalFy?=
 =?utf-8?B?QjVRbkZrbFRoVlp6ZTZmaDBPMlVQT2huVWdXckdxOCtNYm1pYmxhYXBBME9L?=
 =?utf-8?B?bkJCK0VrSUt0ZjdtY25mZk1wNFhDd1FEUjk4WXhtOUpmbGQ1dnMvdm94VE96?=
 =?utf-8?B?ODg5NzNhZVN0RHcvbFEwSHFNdGtwTG9sdHFrclhJUUdVajB1Q1lUMVhhVThL?=
 =?utf-8?B?VjUydFByY0lOSFV0UExXLzJrNitOS2M0VEQzNERHckYyTUFyZ0ZjdHlHZDd0?=
 =?utf-8?B?Y2NRMFdualJWR1dSOGZCM1lkeEtkWUNUaWNpQmxRb2h2WS9OZXpUNUtyY0Rv?=
 =?utf-8?B?YlRUYi80SVhHTW4wVHQ5V0tkbjhVUkRlRDV1VzJMYjFyckZJZDl3cE9MS0Fp?=
 =?utf-8?B?bkV4bXBqeG1tUlRVWFVXSDI3bWU2SWJMSzZhQ29oMjVuZTc1ZEpsZjhwbW5N?=
 =?utf-8?B?cjYxVFNNNzF0Q0ROVTFMSUxEaDJxS1lYRVhBb0lHaGZLR0plWGhmZ0phRTla?=
 =?utf-8?B?VzV2MW1qY2hDMkNRM0Vzcmo1SzhNUU5hNk1lSkI5ZDBwanNZVGRaRkROM2wr?=
 =?utf-8?Q?YVgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtZUmF2MVgySTJ3Y0FUQjBvQkZuUFBDVDVrY3huekQ4dFpvY1kweStOUnJ6?=
 =?utf-8?B?QjRQZnJDZXAzSENJYmZNT3FndkFQeXRFZzBlaGtJQWkvanBQeERsSXNuT01Q?=
 =?utf-8?B?ZU5TNHcxSXR3WW1IclZkK0QwSWJ1ZVFOVjFqZWpQMlVodjhQZy9VdGNCVkdR?=
 =?utf-8?B?MVNxeXd5ajUycjE4a0dNYW05aCtLbC9RbDJLNXZ1cTlxWjU2eTRlVjk5Qmhl?=
 =?utf-8?B?RzVCOUZscjYxaG9jaUcrSEdzRFBnYVRBQU1aeUtFYWs3L0xJRHIwM1I0UnJU?=
 =?utf-8?B?N1pvN2lwNmU2WW1HbkV1Y0JqZ1lyVldEYjJjVGcybU9ORmwvelNLQ0lVdDAw?=
 =?utf-8?B?WGd5T2NSdU9LKzFDMktUc0ZZcGp0bkpuWVVjblM0cFFmZVdTQ1RoZi9waFg1?=
 =?utf-8?B?Z3JTY3JiWS9GcVROaG5lUnQyQkRadjNkc2ROdjgzOGtUWWJlTnlIYkdqNE1z?=
 =?utf-8?B?c0pjWmprMXVjMldlQjV5SnF1Qy8wNC91eFloYjU2Wk1qQjlsYnplTjkzTEYy?=
 =?utf-8?B?cGZTZkFRVXpDdUJCMVdKN2YyM3Urc3hteVhWYmxJUlJvQlhhb3pCVWlJNGdm?=
 =?utf-8?B?eE1GSTVTZ2tBTEtISU9VajIyU3Noa05WZ0lUc1NXSFdDMWZvZzMvUENLQkpN?=
 =?utf-8?B?ZDlCbzdPZVQzZTNiY1RTeGdNOGZnL3dFbzJkcjZ1T2FVOC8yQklpUWdVbExw?=
 =?utf-8?B?YXZhWXpJOFBSMDBlM1NTNWN6Mk9GWVF4NG42QmtkM0dPVmdXdHNicWtzdEtU?=
 =?utf-8?B?T3BydDhBeFNEeSsvNk9IZnJVcys2TkpDQjV5MllHR3gyZVRLRERuZUFoSEJI?=
 =?utf-8?B?NThvd0FvNjJ3SnVHZmxNbzViUUNYcjRxM3dTeFE4TG5jUnV1L0E4ZDZoQTd0?=
 =?utf-8?B?eDJyRjhHQUZYUzZWOG9pS3FLRThzR25xZDhlcXdlMk8zemZjNzNDWDFuK2ZN?=
 =?utf-8?B?MTUwYW1Lc1hRZVMxRmZ2ZE9IYmk2aUpKekpKN2JzOXNRcGsycHI5UitNK0Rl?=
 =?utf-8?B?NUxXMExIeWNwWFRRd2I2c2g1b3ZqOS9wOVFjNHdacG9qZzZJRnRSQmVmRUdM?=
 =?utf-8?B?VEZTZ1RkdTJ0c3ZMemxZZXFIUkJEMm1yR0lrL2l6NTVBN3FrR1ZyTlFIaWZk?=
 =?utf-8?B?MzVTUSs2YWFjR3poTVIzUTI3TFU4bzNtc3V2ZTFqOU56N0U5TE1IUXJXTDJm?=
 =?utf-8?B?ZzNReXo0Q25ZdWNENXVuNExwc0J2MkJkZEc4dk9yaENoTnJ3U0tBY1diTmxl?=
 =?utf-8?B?Rm5xSVdwSTF2WGUxcG5ZYldMaTRaaCtsckl0WGJOcXd6TDYwaW9FM3cwQWdk?=
 =?utf-8?B?U0w1TlJOL3NwU0loZjBxRHUwSExSUUthR2tLdVdRS2NMdmE1THNDd0VlSUM2?=
 =?utf-8?B?cHFyenV6MnpsL0JxT2YyRDRpREc2OExzZVhoWE9qOVVwUDB5K1IrOGtKREVy?=
 =?utf-8?B?K0V4ZTVSUTB3ckxDTHU5Rkllc215bm1OWUFtU2NXZHQrRnptZ210S0wrZDRa?=
 =?utf-8?B?aFhKajVmODdEMHNQWm5ZY1dOVXdyY3hlNkw0MEVhanRiWS9lSnNOa3YvdEps?=
 =?utf-8?B?Q1I5djNNc1B4MTU0NHczYm9oL1JILzZ1NmNOcUJlUWI3SGN2cnR2S3NaOFVK?=
 =?utf-8?B?UjQzK1lOS3UrcXhRNk5yTWhGOWhsdnJ1QTg1Q1pFemdTL2ozN3B4UEl3SHZq?=
 =?utf-8?B?c245T25hV3hMNmlJYnZpNS9lMHdVaXluQ3IxbVYyc00vZGRoajBlREw1MTlF?=
 =?utf-8?B?TjNuc3hVbHZIb0wrd285eWpSNFBXam9KT3N3YXNPR2hUS0wvbEswQXM5STZV?=
 =?utf-8?B?VCtpbXlGZjFQb2NuS3Q2K0ZGT0d3d2Q2QlRoRm5jNjczVnZMYjFqYUFhTDlO?=
 =?utf-8?B?dEJ3Mm5aNjZ4WmdkNVB2VFJRUlBzS0ptSFpnL09LUnVUeHlZUWNENmpKZUZh?=
 =?utf-8?B?Y0J1WmtKMzVFMHpOOU42TFhSejJyaHhlSHcxQm1mUXQ5amQzbzYyaG9BZmoz?=
 =?utf-8?B?VldTK1NGNnBpU2hNVU9uNDdJZ3g2d1NRYlhEemVTMm9CVXdMQmxWd2diRUtT?=
 =?utf-8?B?ZXBUSUxGaE1vK1FYRmlIdnZyQ0NnQXpUckZIRWtaM1I4TTQrQ3ZMRFNnOXE4?=
 =?utf-8?B?Qm1PK2dhT3M4OWUvbnh3d05UallHcVZIeHZCbHR1MnVXZzF5YUJOcFphZDJM?=
 =?utf-8?B?cVNURGNVblJ3V1FseWlVSjM1R1BzVFhuVGVLaW1hT29GUVpWZlNFRXFySXd3?=
 =?utf-8?B?Nm5JK2pHVk9vdmFFK2ExQStZRERFRTB6UkJNNnY3WWVidFRBVmtFM2Z3RVNG?=
 =?utf-8?B?d0kzaEcwOTZpeW4wSmhGWFZ1YmM4dllyVUFidEdDbkdQbmFMUjFnUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ae0f1-ec6b-4d0a-9263-08de6fcbf5e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:32.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vZYSzM8weM7tZWguUVwSjEcyRXieQ5JvmK/G7IE2VElQoKlUVue3FaGgL1U9QOFX0S9Scqp0vp3N/CSexQl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D4F4D16030A
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 02:13:37PM +0900, Alexandre Courbot wrote:
> > +    types::Opaque,
>
> Need a `//` or `rustfmt` will reformat.

Fixed, thanks.

> > +// SAFETY: [`GpuBuddyInner`] can be sent between threads.
>
> No need to link on non-doccomments.

Fixed. Removed the brackets from SAFETY comments for GpuBuddyInner
and GpuBuddyGuard.

> > +/// - `buddy` references a valid [`GpuBuddyInner`].
>
> rustdoc complains that this links to a private item in a public doc - we
> should not mention `GpuBuddyInner` here.

Per Miguel's reply, I've kept the mention but removed the square
brackets so it doesn't try to create a link. This way it's still
mentioned for practical reference without triggering the rustdoc
warning.

> > /// as references from [`CListIter`] during iteration over [`AllocatedBlocks`].
>
> Link should be [`CListIter`](kernel::ffi::clist::CListIter) to resolve.
> But maybe we don't need to share that detail in the public
> documentation?

Agreed, removed the CListIter reference from the public doc. It now
just says "as references during iteration over AllocatedBlocks".

Thanks,
Joel
