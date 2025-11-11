Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40785C4FF11
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 23:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69D10E661;
	Tue, 11 Nov 2025 22:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CDJCeYNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053D110E661;
 Tue, 11 Nov 2025 22:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3MLwfHKPRb4UM3iuAMaW2Q0EplWxQUxCIm0XjYx7GoewBlyI0dT5rr9+cYp484JpAg5RVpv/UbArOl3FZSZiFLqZKp2U5J0npi6V9Ga55Dz9nehxMfte2+3DnyT8mQyiFbsEh32YaSBy8AVSZ4QrqWb2WrNlIy5SAW9l2upGvfBalngKD2eQZOhGsuXjquNE32hh9SG+n+HGjjuH0nxs5J0QYdtdAft5WlB9Zxk9MizYsO8Q6/JK0lyxZeA1t4SEZnDoyEg7Uc0SeSoZpG2KfMYN8J0G8W3HiV5I/zIxHSXzUyHIu059voE+mXw7pb9tydK/lT6UlRohwxu17seTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tO0oURMNKw9Rw/wEzvAvp52Bgw3rvUBpcITn8DI9dD0=;
 b=SgoOdMh3LGCWO9w7jAreHpcuep5tkolbi/+2L69DJ07HT0Zph9PuLyYSTGNpd+tnc7Sj/0EGaZMJh99GKPAFiry3uwG0K+9urtrDRgyWeMBSeyXEENvIeeczukM90hGU/PZqfpYfSC2GS/RwJasKg6b74qRtkYyXodzEL9I8ywU5MlhH2sQb0SiIl5IGNOIuwwhHQoqk5HzSQ0UcWz8rMAo5QSRN1txSZjv3cK3tCmeTIatvz4BmALkh4+9GX64Hdmm6jyNoqHXaAuhiy6iHV4NVziaUYs5nJlt01lpfYETjrS+YVNTMdOBWlKx6OEpdOkAKpohr8giBiVMRCnzNDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO0oURMNKw9Rw/wEzvAvp52Bgw3rvUBpcITn8DI9dD0=;
 b=CDJCeYNKm/vm0tQww9mokIbRMqDTs3mDImdnVaG1AYh4TPA1VdLWCa3Il3G/sSU7Rp+B5mpUG1RAbTqBccUNt1vuwQmNHFX1Rj2Ku1iVl7KX3S28uo76wd+9zGOG3rZM/qiE3h5r4KT29ZVWIPFEvvMF7A3kGzJ980x/tGa7nc3DbG0u0v9LYxMRNjWA5aZtAKI04UZ905DD0vl0Rh0YZWXDhNV4yl/lFGrp5aY0i2vAY3RekdYOpUqLBroKF9y89HVGzNNvifzJ27Wov3RVk4s510M9AwdBRVn8vbqdFIohFNiwpnnw9AsU1SuNVBR22XfScGpLQBRy8AhmApeCbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY3PR12MB9656.namprd12.prod.outlook.com (2603:10b6:930:101::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 22:06:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 22:06:09 +0000
Message-ID: <f7608a86-3842-439b-9d5c-b7039cd15d1f@nvidia.com>
Date: Tue, 11 Nov 2025 17:06:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] nova-core: Add bindings required by GSP sequencer
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-7-joelagnelf@nvidia.com>
 <DE521OFQRH29.ZNUPX2POGN1V@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DE521OFQRH29.ZNUPX2POGN1V@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY3PR12MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3ec71f-7300-4541-4dba-08de216e84e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDRKSFQxaDBDVzFwQ3czaGQyZzRYR0F0YTVYc3hZOENSbnZFdFNYM3JFWGh1?=
 =?utf-8?B?TWNtUmluR1ZkdXd5YlFOK3Z4cm9SalVCUkFNNnJENkJUSkExRXhFdVdYY1JP?=
 =?utf-8?B?M1J0R01nNE9BWFUxSGszcHl6Z2dKdy8ycVpaaFVxWUk5OWQ3Y01OeWhlTEJT?=
 =?utf-8?B?aUZrMEl3c2VTV09KVmNZQUJUWXN1SUhnZHlHNXpFeE1FTnV1Mll1ekwzVkQz?=
 =?utf-8?B?dGQrN3Bpbk5ad3IrTFdIRGJvVDlqWnE0dURiSWlOVE84L3NKaGVKaHNtWktm?=
 =?utf-8?B?T1VTR1lOVFFaSGpLWUJDNldaeXQzMVFzdVBGSUdONG52RmJ1cGVFNFcvRDcx?=
 =?utf-8?B?MDZTUWZXUm44WTlrZWRISGZPNDFOTDhGOVJ1WmZvcWZQSkRldGlPd2VOTnh3?=
 =?utf-8?B?bDFKM1VaODhYc0JJV0E0OUZ0K1N0Y3Q5WDhVVUwva29PenRlMGR5TWNOMTZ1?=
 =?utf-8?B?U2tXWW81d3lqYnlwWUNlYkp5QXB1Q0NZelVuYWxyN09xT2dITGFqK1BxZENV?=
 =?utf-8?B?U1VHV2lHdmlVUG1RQU5Xclk0SzgrSUVDZWkwaGc5em81dGR6a0F2VkJpQkU1?=
 =?utf-8?B?bkY1aG9Ldm1pZ1ZsM0huTWdQd2l4ckgydE5KYkY4Zk8zN2ZoT0tVQVcyVE5w?=
 =?utf-8?B?Mi9vL1hUVUpKdlpIMjZQZVVaTjVNeGNoQUR2VmJ5REFZRmlwUnZPeldXRkds?=
 =?utf-8?B?OGUwS1dsd3ltck9rQVAzdStIOFh5SkhRbnhacmZVZEs2STAxWXIrR2x2L0ZL?=
 =?utf-8?B?MW1FT2JFZkhtM1RQQ0dxVy95TVJCOEZ4NEgyTFZLQ0o3cXQwNU5oQ0lJa1Jw?=
 =?utf-8?B?a3M5dE1rQnNqM3gwTDk4MGZJOEdEMmFQemlLL1RwS0NzclpCaENxT25ISkZR?=
 =?utf-8?B?Z29hNFFrY3kycmdtcXF3TVNTZDN1blFjb0x6NWZvUHUyN1lzUlVJcnhUM0w3?=
 =?utf-8?B?Mmp2ZDAwUnRkRmh6NkwrVmhIOGkxUEVJY3BIUXR0WVBOR0NKbnRyZ00rVTB0?=
 =?utf-8?B?REt4U0dDc2pRcFhrc0JLQmpiNjFXbDRiRTl2Qm1jU2dUTllMOVFCelVmUGdR?=
 =?utf-8?B?Wk5DVnlxV0QrZW1rSFNRY21KNDNwbjFEMnJJdUhRY3dubXh6LzJ5WUNLRGhD?=
 =?utf-8?B?bE1Bb0daRy9mdzN5dzZ1Z2NURXAxV1NaUVZyazZEVy80WmwzYWFiNnR0SVZJ?=
 =?utf-8?B?NWZzWlJyQ3lVaDlsUmVMMk9vZm9KTFlOcyt1WlNmMm52b2xxSGZ5bzBkN1Zp?=
 =?utf-8?B?TFFWR3d1VXpGT3p4SGxWcEM0N0xpVFlDdmY4dE92V1ZzQjJNT0ZaVStJSlh0?=
 =?utf-8?B?azdrOTFyRkIvLzd1ZE1hbWRYMFZqTGJDamVGWDF2V1ZHV2JseUdFM2c4RjN1?=
 =?utf-8?B?a1cyK0QrcW1vK2VycXIvK2RWNlArREg5Ymk2bmRMalRvZTh3MGtaaWNWNFlM?=
 =?utf-8?B?emhldlFvUVJrTVBuSGk4K0ljNlFxU0F4clh2SE8xZ2RwMENrTDBEVTlieE5F?=
 =?utf-8?B?RHZhVS9XK1pSRFpPd0hORk5jM25rc1dyM3JWVERUN3h1d2FRUERENG1jWC9m?=
 =?utf-8?B?V1hKREYzbmFpUkxKS1ExamhYbVFDTWRDWW84cUZWckpFS3A4dXRTd0djY0xK?=
 =?utf-8?B?NFI1YUJGbjNRTU9HOW9YN3RqRGV5YUJmRUdjSExXMFQ4a29iOVFTM2M3R0dJ?=
 =?utf-8?B?bFgvMUQ3Rm9oZ1ZVaWhmWlJrVHY0dWZsN3VKNFNVbGpIbXR2TTFZQVU5NDFv?=
 =?utf-8?B?ZElRTlc4eU1JTlBYY0M3aEt3U2RxZWtnOEhyY2tmMzMwQnVyTzEvK3d5eGhS?=
 =?utf-8?B?OWRMVmtlUW14NzJIZ2FFbVd2ejRlZW1oSnh0N3lEb3IxcjJzWlF6Y0dMVnJP?=
 =?utf-8?B?VXRRVFhyWmpiWmU4eFRsU1V6YkxSYlJwMXBtMEJnZWZXSnNDNjBCWkZUYVc5?=
 =?utf-8?Q?OC13yXYo1/D0w0Hc2IYgT/dV034cpi3M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUhMUjdYTVI1cW1UTndETnZLR0R2LzAxN0FET0dIOWd1M1QwYmFvT2RZajNr?=
 =?utf-8?B?Qmx1dXBkZzR1RFovR2RkcVNmRWlqMmY4M1Y0eURua0w2UVRsZkw5SmxEREhl?=
 =?utf-8?B?ZTRrWS9QUXFjODg0UnFJVVc2R0dibkE2Qm9PWkJWck9qMFpYa0F3OHdlOHVT?=
 =?utf-8?B?RmVrWTVhNWlqYjB2ZTJlL083N3V0MVhvQyt6bkxwdkZaK0Qra2lGUWh1MGpa?=
 =?utf-8?B?M01iSXF5VTFiZlA0SXIyaFVkeHZJL1VPUmdUVFl2cE1zVno5c1BLV2JiOXV4?=
 =?utf-8?B?WlFqdVNNRWUwS3VhUks1UEk3cXI3cERzbElTV2V1SG1ZSTh2ekZlTnZ1TGw4?=
 =?utf-8?B?ZGFiTGI4SisxVklVUTdCWnZ4bExnK0lTOEMzWEVLY3o0MjdEOFd2Uk1nVXMv?=
 =?utf-8?B?VEpZdDZYVmprQnFsOHRNNmZiZ2oydzJkQ1RkQXF4TmtHQXExVlcxWEszUkhK?=
 =?utf-8?B?QkhCd05jSVZoV0ZJMWw0VHJLNjVPRzUxc1RkSXo3dVc3Zk1SdmlaNXpXbk1S?=
 =?utf-8?B?OUwvYjZ6NWhkckNmcHg3QmFqMmd6QmpkYnliWndqYUtTRVRtZTdQaEs5OXI2?=
 =?utf-8?B?ZEVMOWlKZUZVbXZEUTRjV2x0eVh6aTcvSjhnQzEvMnNiMWYrZ3NNWVlhNm1J?=
 =?utf-8?B?dHBWaDhDNDIzSHduRkpUZEZ0S2dmeTVxZzlodFdHN1lLTEpZZkJVeUNuS2tI?=
 =?utf-8?B?N3VTaUJidVF3QzVYVXlEbjlicXBPOVJ0OVlvclVHaXhyUGFXTEJyQ3ZDTjB1?=
 =?utf-8?B?dDJQNi9aVmRaSWdEWm90WHJvZjRxMTg5WG9xT01wQmJjWW1XWElTU3MvMGNB?=
 =?utf-8?B?VFFaZHpoYzlIZ2VVSElLZGkwNy9RU1Yybjdud2MyVkM2bi9GYUY1VUNHcFZP?=
 =?utf-8?B?bGQwVkVXMGE4TTd4Y2d5ZWN4T2VDaStSb1RGWkp4MytSbWd5NXlMZmQrTFZZ?=
 =?utf-8?B?UWFGZ1lHbWp3NVRnbGs4TUk2QmdTaTRpUlJJSHpmYXQ5bm9oMW5uZFRDcXI4?=
 =?utf-8?B?WnlDRWx1djhVQWdULzhudWZZdnFrNjF6elhFWjkxeGdNaFRzNS9PaGpJMUpt?=
 =?utf-8?B?YXViQTZ0c1BiQVJWL3RLT0tpYjV5TVppSkdhSTdWWnVyN3BIWFN2aVZnTHR0?=
 =?utf-8?B?Rjk4NTFESWFOUzBjWExEV1RBNUFodGh0bnFpN2NteHpmZkZPZ3R4YXEza1Q3?=
 =?utf-8?B?RElad3RtM0docThGSFdYLzE5ZlBLS0JlT1ZLMzVad0owU28vVXEwMFYvT2lo?=
 =?utf-8?B?cjlaWU53MzNVOUhablZibkJDMy9JNWlEbTlkbnVDMElUQ0NtQ2NqSTVkbzk1?=
 =?utf-8?B?RUxrbWZtK0VZbUtxOEtTaU5maFJYdmp5UERMMU5wcEhUeER0dHRwRkIyL2l0?=
 =?utf-8?B?NmRweEEyR3dLbFdJMnpCNStoS2F1dmMxYkZTOVZGZGdtTGlLUU1RYnc0S1FY?=
 =?utf-8?B?ZU9EcFhwOExJWnFBeFpKekpLdnd3M1Q3eWZPdG5FN3E3M05nNk51eXhKaGVx?=
 =?utf-8?B?TWR4aUhSUGVoY0ZBVkMyODh5WUhNNzU2RDl3K0E1MVpRcnFicWRTYzhYTzhl?=
 =?utf-8?B?cDRENzlKSmhEQ1JjK291dWE0QThwREk3ZUIyY0tZZ3ZpSE50SUFLSWNJVSty?=
 =?utf-8?B?NThhS0R4a28xWHp3UzZqV1JOL1JyUTlOZDhTcGlOcE9RSTNkUXJtMnBHSkNj?=
 =?utf-8?B?dHVwRWNsdlkycjVHUkVSWUZHcEg1WE9mdlJCOXhEbWxQbXhCVHBsUmhBbzJY?=
 =?utf-8?B?UXVWM0hqNUJ1bHdudUM4bHRBQjhWMmtXdnNrS1FsNUs3WVNBdFdNSHAzaTFF?=
 =?utf-8?B?NndRQnduRlNnRHk2ZUpjZ2N6cmlwTTdaSkZZYUtNVWZGWXA5dWJERS9nbGNs?=
 =?utf-8?B?VzI4Nm5HSC9Sc3VIVFpRTDVkMFFpSzRUMVZteW9QRGpJcDA0TzN4dWdMSk51?=
 =?utf-8?B?OUU1Zlhvb0ZKdHJTV0s3TUljOU9rdFVMcVpYUFM4OU9WRmJSeXRDcDBCb1FB?=
 =?utf-8?B?ako3dndYc0FhTFhVa2tLY1RZSGRWdWpjVW1CaGtNQTd1RFpxcUdZZTlYZ0RD?=
 =?utf-8?B?Wks1MFh4aWNzS2FVVW5tOVQ5WnBEZU5pcnVZbmpxWDNUeHB0dWFaSUtBczRE?=
 =?utf-8?Q?gFd8AAkfitZSrmMteiC+jYvKS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3ec71f-7300-4541-4dba-08de216e84e9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 22:06:09.4562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGIg/3J8X92so7lczkHm1Ik6oW4YSbpe9hD1I6DNqPAd6Kc94/p3h3m6vWxg7yutQU6Ru1aLiyl6i/qwkkCdUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9656
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



On 11/10/2025 8:39 AM, Alexandre Courbot wrote:
>> +    // GSP sequencer delay payload structure.
>> +    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
>> +
>> +    // GSP sequencer register payload structures.
>> +    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_WRITE, //
>> These ones are a bit trickier to abstract. Since they ever only use
> `bar` from the sequencer, I guess we can have their semantics in the
> `fw` module, exposed through a method that receives the `bar`? That way
> the sequencer won't have to access their members which are private to
> it.

The sequencer does need access to the private fields, because the logic of what
to write to the bar should be in the sequencer, and that logic depends on the
fields.

Example:

impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
        let addr = self.addr as usize;
        if let Ok(temp) = sequencer.bar.try_read32(addr) {
            let _ = sequencer
                .bar
                .try_write32((temp & !self.mask) | self.val, addr);
        }
        Ok(())
    }
}

Here, the sequencer needs access to `.addr`, `.mask` and `.val` to craft the
address and the value to write.

I could expose access to those fields as functions, but I think we should not
move sequencer logic to fw.rs, that should live in the sequencer.

Or am I missing something? thanks,

 - Joel



