Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FBBBF202
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A60510E457;
	Mon,  6 Oct 2025 19:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dHAdTgi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F910E457;
 Mon,  6 Oct 2025 19:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA0WUyIYwZf3Bkfzxa2VXrCiH3cDZWmDZ0ZunDEpLc5O1MZ1CQT71Vn7FJl/X3skzOC4Ngnb7301gI8/GO80UO05DGDPeoPKCYxFGefMVAm50SDdM1CevsTEoTCVXzvuvp2DRG2/d6NfXo41ohXwYI55x2h8I264mGdofsZeUYGOyGUUfDBFmXvwswBGC75C+Pyaoru+lPDa8J1asw7JAIfZT9Ffx3jtsuR7mvISPdNxOe2K5e64M2SbvJAEuicRH6OmJIdb80DTksvI65b+1WXCW4u6yUHvxDVH1v5SEtyVLSSbNuJxbACD7SQilUqOkr1JLGpkW+02zlK/GhfNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Djx+IpAekWAx2jAAy8rg/Rkm9LxEwv6lQGiQ/4V3wcA=;
 b=eVZfqg9rFmGw7oAOVrOnKHGD0ExW4r3WqHiqvv4U92aGbGrPT7IkRWgWwSOMuE/WkDIyM8zkValOCh1ellj6V0hzQ3jRGDkMgJlZbOYy7952OkySHUQMziZ+CYPGcmwXIrNuhRPf6ldcZa3CLZD5pvYhy06Z+fykw+LIQQSs90pQV+P16LwS4vixEuc43hk3KHro2A+T7sAfRZ8s2KPIEXbmU3t7J4EkZ9vxNPLJTN34q/vKhmf+4xwz09a7DAqrkR59Xwfg8apYTKquY6jE7WuH4bgCMog35OstHs+TkPqc0iXmpU5UiS5nJdlP2q9Cz9RAUi4xfJSSp2KUmO+0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djx+IpAekWAx2jAAy8rg/Rkm9LxEwv6lQGiQ/4V3wcA=;
 b=dHAdTgi4A+ygaEKYfaYqIzD7gsFfDbuupc9gnL5AlNfkuQOJh+E8w0APhvv8+pyGG84nGsTLI+0rWcgoVuVl3WDgi99eB/YGPLN82ODraw75dPtj+NexUqpm7kyDEcG3MPGDbRc5sqXnhbIIXOcva+K89TfBKqvmn49arOAtvfeSs8YcAsYJt4r4h20T/S7QfDfwhhL38WRRE6yRrGQsmJDP2XbTBbQ5CrikTG97Yo6++y3rTWrjAM4X158zfsJZ4fcgpYc+RskFQA3ilCMKcQiXrH82ksCVgxTJR8j23CsK4Fh7Z/EP7FPLXNWD+kvTpumDBlWBTUF8g1B7jz99Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:50:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:50:09 +0000
Message-ID: <cea9b90b-649b-4e84-92d1-188565450a98@nvidia.com>
Date: Mon, 6 Oct 2025 15:50:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com>
 <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
 <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
 <CANiq72mC5pWz92KYtOhtgOcMuTeuzOeM9xrbkna+HkrwHAQqVw@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72mC5pWz92KYtOhtgOcMuTeuzOeM9xrbkna+HkrwHAQqVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:408:e0::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1019438b-6d7a-414f-0450-08de05118e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWM1SC9IWVlWdU9KOUtseng2ZGpXNUlwa1NsU2FpeTVRemN4bWxzQ0hhdW44?=
 =?utf-8?B?d2oyaWhibGIwYVgzZDFQcXNucHhSMUlGRGNMd0luL3U1UG13RkZ1RFI3N2ZM?=
 =?utf-8?B?bTR6UFVBdmQ0TThrM2xqbWFoY24xMEFOTlU3WFpsWmQ2Tmt1bjFOZ3o5bGRn?=
 =?utf-8?B?WTZwdWhLRHdwS3gvY1M3cnczaTJWaFoxa2pBVjhvR2IyTDBsNG51S1dBOXEv?=
 =?utf-8?B?RjdwRW4rM3l4MEVNOENrSEpvVTBBcXJlZk5VNngxTjYyK1pMTGczbXdTeG1B?=
 =?utf-8?B?QUljSUxxeVFMUmcySUZWNGNnQzlVN3QzQkI2d3lQN2dGRlZOaXRKRWtGaWRq?=
 =?utf-8?B?dGhuZXRPdDhsMXRjMkc1Zk5wRlZhd0w1OEFNQjdYemozSitodDRrK1VpaERZ?=
 =?utf-8?B?WTRzNkM4NTVEZEdBUEp1MzFpdklqa2FjQUVFYklSUU9oRElYNFJNdklRUlgw?=
 =?utf-8?B?ZWdjak5hU1pFQkNUZjBzOFcvMWNmNEtCSmhNOGV0aW4yTXdvQUM1dHMrMCta?=
 =?utf-8?B?Q01mVWRqUWx5VDd1T2xOQ25DWDk5NVI5Yi9BaURpbUpRWTg1TVpnREo4VFZH?=
 =?utf-8?B?b2JCaU1LZjRKZk9EMHZHRlZPT0Z2Q2F2NU9XYklzeUpaM3JCTmZZbUtqenpj?=
 =?utf-8?B?NHN6WVVGclp0UFM4eitFSmdoaEZ2a0dzOTkxTjkxRDdQczd1dW52MGVCbkpN?=
 =?utf-8?B?S0wwUEc2MUpFN3IzcHlNN0syaS82d1g4Y2g5TlcrNWhkSHFIR2Qrd1BwLzN2?=
 =?utf-8?B?bHZLdWJQeDBhS3o5WXRzRUtxQ0JqWTBzRzFlVmMxVFlPdHpXL3VFczZZN2tH?=
 =?utf-8?B?dVYvc0FuVWhzUzlmV2dBV01ZQk1KVC9ZcUZTYUxxUnQ2aDkwdFArSWZxUHVw?=
 =?utf-8?B?SU9RaTlFMHNXUW5sNzI1RHdJUlMyK0M2TUJ4WE0xYzkrZGpzMUZLV0VFSEg5?=
 =?utf-8?B?ejJibkxvWDVZeEdXc2pVd29EUUVuL3hxZy9JN0lVeXo2bThUc3phaGdJTjFI?=
 =?utf-8?B?OVhSenNHb2RBQVFYdGd1VnhIRlIxTkRDUkF0eW5rdlFWNFF3SGpRQjl4R24x?=
 =?utf-8?B?ZjV2WkN5U2ZnLzlPNklNUzJjUXVHbGh0TE5tQnpCV1lKdTRDcXBNVmlDMFA5?=
 =?utf-8?B?RC9IbjRaOGxYRnVJTkhCdFhlOXc1OWVYRDFuNzFBNlg1Vm1KY2VtWXJ0OWtG?=
 =?utf-8?B?cEd6MCtoZElkcWo4cHgvb1pDYm5VeWV6ZUMwQXFjeHJtSmlZbG5sNlh1TG1L?=
 =?utf-8?B?UzVneGFzcWhRTDdaN0pZUlhHSlovUkdRTDRaUng2QmNsNUlJenl2UkhVSTZ2?=
 =?utf-8?B?anlNQkc3REVjV21BYkxrdmM0QkVYc0c3M013MEd0V3owUCtZdkpPb0FaNHBh?=
 =?utf-8?B?NlFQKzJaTXkzKzh5K1NTUEI5cVExOFVFdWJLaFB0YkNxTXlyYnFBVytraWc4?=
 =?utf-8?B?MjR0TEZKRUlKQ0t6NVJ0RGRQNVlCMWVobGhqbjNSbTBzMUM1TUlLV1FVcERE?=
 =?utf-8?B?Qkk2aW5SQXorc0pubDFNNzVvdEdSQTllTmR6OW5qeENSanNRbzZyY01ZNjA5?=
 =?utf-8?B?b05rTGNVNTNlc0k2Yk9ITjRtd0VNQitoNDZUM0Jld3BCcEc4K3JobVd3enhq?=
 =?utf-8?B?M0VJaDl1ZGZ0S2FobzNhSW5Cc2pYenpXOGNyNldiMENlYkdrRlRxQTJqUStQ?=
 =?utf-8?B?ZHB6QWN1S3JtRnlkOGsyMGk1am50Mjg3Zkp6aU9QSEJvczFIMXBrR3JDS25G?=
 =?utf-8?B?M3kwMW53MGluVXJMUDBIMGhCUjlzdkVscG1oTEdmL2NOL0RITHduQmR3SDl5?=
 =?utf-8?B?a1RlMTN2c1ZBQ21FaTVmUlNuUllWWHA1L3pFWlNSenN0OHJhQWVxRExEaGNk?=
 =?utf-8?B?ejJWSTk1Z3RwTmJnaWVjZTJDS01wQmgwWGFuOTNpYnlRdXR6SjdEMzNUbVRT?=
 =?utf-8?Q?9eb4Yug2WRWcHDFHcwKG/1V5XN9k60Xd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzZKQ3lEMWFQRzlCdEtZR2VNa1prRE5qaEUxbmh3TEdlaTl6VUFOUHY5OXBW?=
 =?utf-8?B?NlRxMUw4bGx5MkVOYldpY3hUQlVUM1dWdGFmTkx4dkthNytFQ0x3M3lOYk9p?=
 =?utf-8?B?U1R5ZWVRbEcrcVk1RFh5bTBnUTF5QXNqUWp2OXVPNmVocWlwMFRFVHp5emdB?=
 =?utf-8?B?YjBsMmd0VHh4MWw1UW05cHN2RWhMdVFrRVBKSTVWNENUdjN1bHk3cXRSalNC?=
 =?utf-8?B?Z3ZFdVVrOWZuYXdmK3ArRDJ4eERybzVObi9CMnFPeDJtSmpMUkZqK0NTOXBq?=
 =?utf-8?B?MVZBL1BuT2JIa1Zwb0hMcjVZSXhaQlJxamZva1l3aTFJV2kxbU11dERiWVFy?=
 =?utf-8?B?VWN6VThwTWFpK1d4L1NYOVRMNE5rSFBweUhCVDZGc3g0eXBZREdvSzdiTUFN?=
 =?utf-8?B?UVZTNnlrQ2UrZW5xWStsU1hLTExBaGJxRGJLN2xYSGtzRjdYbjJadzhvNEFE?=
 =?utf-8?B?QkNNTGhSK0xVZ2JhYnlZT0pWeXBmTjFjSDJiS3pDa0Z4QlVnMTFxMEo1R2tp?=
 =?utf-8?B?Nk1LbVZUdU40dkFmOFo2RXRtYlowRmhUQndaZkJ6bWdjTVhxZnJzVFlzRXFY?=
 =?utf-8?B?V0FGMDlTc2NJQ3VMQitWZm9KbDZXM3k0NTVpV0lMN3RKQmxBbnhkd0h3TUMw?=
 =?utf-8?B?LzZJQ3Q1a3hYTjVxbExnaFdoRVNIazNqVkpQOWYrTFNZcUE1eno4eFlYemNH?=
 =?utf-8?B?UVUyQ2trNS82VVluT0xyUUZyYlJlZGNseEVyUnh1NnpQOVNWNkhTZUdaMnBG?=
 =?utf-8?B?L0FiV2JoWG8vUUZNcFllMlBDQkJEKzRXeHJ3VHFRMExjRm5RcjM5MXZMOGdC?=
 =?utf-8?B?L1hWTXRFSS9VKzhCSW1HcTdEM2NvZHY5MWdtN1VkWkNNendUNi9RdGZmZnNz?=
 =?utf-8?B?azBPSy9ybjBKSExJQU5WNlBSNTl3ZFhXQ2dzVXNyTEFaeU00aGhBM1ArNENS?=
 =?utf-8?B?YndYRHY5Q1hQdTZlem40VXBBVHc5NFdDaWFFSkpvTDh3Z0hiN1JVaUdraDlq?=
 =?utf-8?B?SlN1dURtRkdpSGsrNi9kdm82SGdRcjBiQlZ0dlNtNmV1UUluUU5pTmVSdFF4?=
 =?utf-8?B?R0J4TFBaeVJtVXJHTjBaM1FPbkNrOFM0R0M3cUNuTmJRdjFxV1BDY2txejRa?=
 =?utf-8?B?bEZuVm1UNTR5T0FoR2dPbVFKTFZxL1VXVlVoaXVIL1J3VGFNcnYzb2RhOU5F?=
 =?utf-8?B?N2hFWnBZODIxRzB0cytDRFlSZi91TXpIN1hma0FXUEM3aDc3cnRNRFV0QUx1?=
 =?utf-8?B?b0x1QTVrYXRHdmpueW1jWEoydU5XSkF2MXp1L20yRjVUYWZFVHhkRTVPYmVC?=
 =?utf-8?B?N2hCeU1mdi8rd1lvdldydkZCVUNWaGFua0Ivb0hTekJ0OEJMd0xyQXUwdTho?=
 =?utf-8?B?TTZYTGNsMWZFZWhrSW1wMGZGMXpuVUxnb2lCdi8xQ1RleTY3SEJQT2Q2alpo?=
 =?utf-8?B?QXFxTFR2QUM0cjRZM0lROE1JSjY4RU5oN2FiUHNjTE9EallKcFpLNWtGdFVE?=
 =?utf-8?B?WHNWRlVoM0FvM0NEc1pRTXIvVWNnUTBoMkZWK3cyNCtXZ1FtWTVrV2w0ZklO?=
 =?utf-8?B?SWZBUjJLUFZJSG9iS1g0Yi8yakJ2Tjk4ZGlLdEFvbjhNbHVlTldaQzV4bzBj?=
 =?utf-8?B?K0pRNUsvUnBQZ0FpRGtxMG5VVnBBMzJ5cTZwMW5BME52MHgrT2tKWWlwWVVL?=
 =?utf-8?B?ZG1EZkRjTlprVllsNkFjRGtiSmt6ajBLalk1S3A4akxTa041N2ViZmxIbzl6?=
 =?utf-8?B?bUhYaDN4aTlPNzNyZm1WVHZ1aFM4QnVhakhHa28zOXZmUHRzaVgzWW9hM2xC?=
 =?utf-8?B?dEt5aDdtNUk5Mkcyc0pCU3N5bU9vKzV2ZHBOOFdURTFpVDZLQjU0N0Rwd3la?=
 =?utf-8?B?N2N2aGxEMHFhK1F4RmplSlhGQ0h4WHlOelFxd05ESEgzRFFqaE05TDZLL215?=
 =?utf-8?B?b2pPeU1UMjFmRHIvMkFaV3RIRExsWER4L2ZnZk1OdDRGbmRySG5FaXMwVldS?=
 =?utf-8?B?RFp2NE84LzZpQkdYS1B1VWwrNnhtSW50aGMwYTloU1RoRmVNcldQQ2c3S0xv?=
 =?utf-8?B?eEcxWW1SdXU2dkxCTXVFeUUyUUFtTE9TMjZmNmh2aC92WEl5YnhyeVNZK0kx?=
 =?utf-8?Q?q3oPdotqB1zopkag32HxptP5j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1019438b-6d7a-414f-0450-08de05118e7c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:50:09.7637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmHabzZYL58Aw+l0J1sNd0Bwcn1rE56hjHB9UGvyqVk4W5AC8UZdLijvW3w+0f1x1NPR5z1sFu2gb/2dQzEAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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



On 10/6/2025 12:40 PM, Miguel Ojeda wrote:
> On Sat, Oct 4, 2025 at 6:14 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> Well, it can be efficient. It really depends. I have been contributing upstream for about 15 years if you see the git log, often when someone chats privately with me like you did and they told me they are ok with a patch, I save them the trouble and add their review tag especially after they already added their tag to all my other patches. Surprisingly though this is probably the first time anyone has been pissed off about it.  Anyway I will not add your tag henceforth unless you publicly reply (or you let me know otherwise by chat).
> 
> If they just say they are OK with a patch, that would just mean an
> Acked-by, not a Reviewed-by.
>> In any case, the documentation states those tags cannot be added
> without permission -- if someone gives you a tag privately, it is best
> that you tell them to please send it in the mailing list instead. That
> way there is no confusion and others (including tooling, e.g.
> patchwork and b4) can see it.
Sure, certainly it goes against docs/guidelines to add a tag *without
permission*. I don't think anyone disputed that? I don't think I was advocating
adding RB tags randomly without consent at all - please don't get me wrong. :-)

And no doubts that publicly replying with RB tags is the best way.

cheers,

 - Joel

