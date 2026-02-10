Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI9LBYI7i2neRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:06:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365E11BB41
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 15:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1BC10E593;
	Tue, 10 Feb 2026 14:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hjxYZNW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612910E593
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 14:06:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR/Y0DJRVlQQhpQqDnyB91/1z48hhW88hXDJrTkqjzKKJ9bUEE2uVn9g9A21VKn8qC1eMG5XJYH0PZ9QtddHd6PYjP0GCPP2XbO83g/7J7uRVN/9xrgxNNJ6LUZrOcrmHKlz/YcZWk8i22Sxut7ZLXrcQUHB13blbAfeDQXQm7MUuNud6/ZB/pNespQHKFWUx/1m3Db5xpXbHXuuCPQib4aeAjJz4p7MBAs0ukvFIykAmq12OI+8sfB0OGlLtbsOxpZktNMaqezHnQI6kf3rHQSf5QizBRjwSOFsZXILwtkODZY+Xli/88Yz2ok6BciieUuJHrnj5qVSpCNsB27LxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVuvp0IWSEQya/+qxF4iN3lhQrpgxhsKdBbvjXuDYhI=;
 b=LKKxDGO86Aseq+DjdElw207ueZJGCMnUTnD9QCsvmGG0+1AAslKdC6MhN2it3EIAQGNojHYCY1S1Wbs6JWlFkrdRwlejUz3pViCOzA43vCxmG4LinpH1cf/8PUTeY6myFHA3fugadY7WE8boHH62G08YJ3cDW5Yxc57x6btehD4iwxx5IVOOuQpzrumcKM0zRAMogDaOoOBSrzATm79eG1NBNUhVbZLd9JuXvcf9bKtNDn8vdZJ/ZKqVMa5pSyGBNcvO6Hx/6DQTC7dDblHii5rX6QAyy1sz1mS+N+6CIAUXydYfTyYJcV04dhYdu9+p7xeXAFiROPM+7Y+1KzGL/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVuvp0IWSEQya/+qxF4iN3lhQrpgxhsKdBbvjXuDYhI=;
 b=hjxYZNW0+WRiPyTpAJ+rGHRmcGHmkP+9tDjL2prMEkJV5tGIW8DsIAjN0TGy0tDqz5OHevkdh4gYXLesg8qsl3pGLHlez/Q9ZAmV6ERhCGtygH+8P/kdrcS4V7opOjb9ZWbSbJllzQWSHkG17EANYApniGE98+zKqdHQNvKTFVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB999086.namprd12.prod.outlook.com (2603:10b6:806:49f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 14:06:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 14:06:44 +0000
Message-ID: <c1d4ad2a-44a0-4c04-b0b4-94d6242d4ae8@amd.com>
Date: Tue, 10 Feb 2026 15:06:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <fe2f97ae271116e7544be778a1d1aaace529dfec.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fe2f97ae271116e7544be778a1d1aaace529dfec.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0540.namprd03.prod.outlook.com
 (2603:10b6:408:131::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB999086:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6b2882-b422-439f-0a72-08de68ad9f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVJRNlZOcEkxZ2dTU1NTU2xLMUxFY055MlptVEt3ZlZvSzhvSlNVcms1TnUz?=
 =?utf-8?B?N21renA0UXdlZ2prdDdOM1F1RkJKckxsZHozcTE0YWpPN1VZMFRYKzRVRXhk?=
 =?utf-8?B?d0NUVDA4eGI5V2c3WnJLVjVXM1FCMXJOR2JyaVhOWFdVR3RFRndrS2RybmFS?=
 =?utf-8?B?RW56NnRiUmw1NVp1UDNjREVDVDNuOCt5b0VHRzFpdElKOFNQR1hwWGFNNTB0?=
 =?utf-8?B?RU5pTGNLcW9VaHhlL0k2OS9uM0JrQ0tXei9XZ0JFWWZudnNpYVg1KzlpUk5v?=
 =?utf-8?B?S3FMbnl3MGxDeVBSRytMZFZ1Z3h4Q014b0V2MDNIWC9La0lEakRyeWt3cmZl?=
 =?utf-8?B?NUZmdzF4WXI2TkxaTlVSL0JQdU9nR0JqMFlaVFF6UWtpQ3J5ZmR0dTBPL0wy?=
 =?utf-8?B?QUV1NEozeWNpQWsrekl5NmNBdEI1RUtHQkRWSkVwbklyR3ZlbUdESHdFVWda?=
 =?utf-8?B?aHVlMEpJRU5RajJ5bmc4eFZ3ZjJWZG5XV0ZJVVdpdHpsM2RjNEtIZVN4YmFp?=
 =?utf-8?B?djQ5NVcwOUJYbVNPeWJZVG53NnR1dFBFVGo2bGEvOUp5WkpkcXIyRmRoMDNm?=
 =?utf-8?B?d05GajBwSDY0ckw5bk1acTZoQWtWcEZJc1Vxd0NWaFRWU05OYm5FVm5VdWdi?=
 =?utf-8?B?TXpqczQxbTdEbjkzeUt1a3ZSaE5wNm82TlQ3MlBScjhnemJDZm9iMzVBUUV6?=
 =?utf-8?B?RlVnRFVNNS83TjJYTHBPV0ZobTNUVnVXeHI1WXZqcE0vaWdGRi9RQUtFU0dS?=
 =?utf-8?B?Q2Y0TkRZdUxwbjlwd21SSEk3MG5neFNoVkJxWi90NlJDZFY0VkxSQkdSVnJy?=
 =?utf-8?B?VEFlWWliaEZNcWk3TWRUNDU2NWYxRFdWK29MWlArR256UzRTMytEeE5pcnEx?=
 =?utf-8?B?SEx2MTlIWVdFaHpxQjZJc29tT1JkTkNrMjBzakRXRWRrUzhlS0FEK2c2UC9s?=
 =?utf-8?B?WWx4Y0FPNjJKZWM5eiszQ3A0ZFNhbmJEWmkzbmFDd1JvTzJzK21nN3pHMDF5?=
 =?utf-8?B?VVFSL25VTjdqKzZZdDNScGRxREdKVEJTSWhzSlNDbEZsRGJwV2ZEL3NWVWlE?=
 =?utf-8?B?MXh2cTZ5bEZmUnZ4dU9iSHZEc0VHWDZnR0ZLK3U1bVE3Q3A2bk8rWUFuV1JE?=
 =?utf-8?B?bGE3SFZxNkdRUTRROTBKdXRrY1R0NmJoanlNOFFRSC83a0JPcjMxeTZyTDha?=
 =?utf-8?B?dGhjQ20zRzJ1NlFoVTJ3a0szNklDb1VicktLVkd0SlpIZDdjV1E5eVJIRFZK?=
 =?utf-8?B?VkhHK1RpdEdtR2ZkWUZSaXFuWGJkSDRlcXdKV0Q2aTZBN3RmYll4TWZ2R2Z2?=
 =?utf-8?B?MFpLVmFDcU1SSTJnTWlxVFJRVVBqKzJQR25sSUxIem9idFF2S0ZFWFVhLzUw?=
 =?utf-8?B?djlKcXNkaG1BNXhWUHB5MmlRVDFhWHVlNy9VeHd5RlpKcmc2NE1ybFQxV2hv?=
 =?utf-8?B?UEhTNUE0OGNqMjAxZTNPSzhCbjZZMzFvQ0xQRTdnM3ZtYzJ0YndRd2FOam9F?=
 =?utf-8?B?OUJIU0pJb0xEa0RZL1E1V1pPTVhSMWIrcmVJeVZrall2Z3dBRVZRazJvOUN3?=
 =?utf-8?B?RVNCV292QjZ4VW8wNDNlYmxxZDBsaUZjWWtRV0d2UkRVU0hIQUw3eHloeEFn?=
 =?utf-8?B?aDhZeGRUcWlTZE1rYmJ3OWhuakg3cUVvK1Z6UktYQkR6TG1sYWErZytIVGFX?=
 =?utf-8?B?NlJkSUQxL09UT2orT0lldDBGZERvc24xeHp3QjExR0NyZXArYzNZVjRUbTBu?=
 =?utf-8?B?UldpUDc3ajRwMm16Q3hQVnFqL2Y0SXBQbS9MTEh6WnUxaUVPK1JjOVYzNU9w?=
 =?utf-8?B?ZG9xbzZZV21md1VWalJZRCtOS2JicitTNldwaWtUTzlYT1A3K0xDV3BJdHJw?=
 =?utf-8?B?bENnMXIzNVNEOUVZTlMwbS9nMFRnbm5GbWtab2Q5VUMxMGtUcU0xc25JdTEx?=
 =?utf-8?B?VzhNcGFSTDRUcDBLUlpnV3NJZkZRRzVIb1kyVUVndkJzdUpOblNtVDVjVkZO?=
 =?utf-8?B?ODNUQ2xOLzQ5c3BXblZodVUwMWZMTC9veVZkcHFXb0lJZmtiZm1OSUpQV0Iz?=
 =?utf-8?B?ZHI0QU1UdjhzTEJQYWkvZU5lc2Q1RGJmNVNMOGFycVZ2Q0ZnZy9LR1pMSVJV?=
 =?utf-8?Q?g8iw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUVsblhoeFBtcCtIaWdDVFRkeU90QXBmTWswODVwdURmQm9VMUJmdU5TR2ZM?=
 =?utf-8?B?ZFllUnZ4djFWbjV0TlVBQU9PR0pRc21ETVM1ZXJVOW9WTE11L3o2bkdZaXVu?=
 =?utf-8?B?R2ErQmhxL2ZtOXlUdGtiRTVZUU9uL0JTT21zdXdaUVkxbXg2dThrb1VhSkpJ?=
 =?utf-8?B?eGtwTjU1bVhKTTFEanZTOGIxUGU3cURKSEFRRUwrUHpNY3VwTmFZRkhkeEZP?=
 =?utf-8?B?WlRDK2kvRTFtZkEzYTNGQ241aHF1RDBTdytIRWVtN3l5UllVMXZBeGV3Z2Nj?=
 =?utf-8?B?WWYyTXEzV1VBRDZtbzc2QVYvYUNRYVpQTE9FcEdNQ2dlU0owdXpNZndFOVEv?=
 =?utf-8?B?MG9aVDIxcm1jcDdZQzdYeHhtWER6YUlYU3VWcFZpM1hQZWM3RG9nUTJxTWNy?=
 =?utf-8?B?clQwV2g1eERjVHdIRURrRFhmTHJnT0NVOUNXa0l1ZUZtQWNFOTFST3R4OFpQ?=
 =?utf-8?B?OEZLblNCM1gvWklBcVVsclhUWEJkemlUYjlFRVZ6aitkMTJQSGFOUUNUbXQ4?=
 =?utf-8?B?a005MUpQbXNpc2Y2MDYyZU5SNEhwRHhGbnNmd055NUovVjJkbTNpMXJhRGQr?=
 =?utf-8?B?NThuQ2N6ZHoyaGpCOS9UKzN2WGd6VlhZcFNPVnovN2hRems2WG1pdlFZSXhQ?=
 =?utf-8?B?S251ZU5BVitlYWhaZEgzbUNoNitmMWVrNXM0eTJIVm14dXN5UDdhQk9XQUJS?=
 =?utf-8?B?NDZpQmJQVHliVG9QNzhmaEFFc0dNL2xXZ084NWZiN2xNd0xuSjZJRkRLWWly?=
 =?utf-8?B?aU9RbUlxWENoZnEwMDZobkFjVVovdUllVGlEMU8yY0dKU0F5SXd4Um1QOUxQ?=
 =?utf-8?B?SDl1UFBoOCtMT3lKSGc5ZW93R1A5V0F0bVNjMnkrQTFPS1JXR0Fkb1haLyth?=
 =?utf-8?B?d3RZVDh2QUFSLzhDVkVaS21EN0hMcUJPU0x4dkZ3aVVTbFVLM3k2Z3FmcXFD?=
 =?utf-8?B?Sk5rTWV2cHRPV2xHTmVsOTBJYUs5YU5RSTVUTmRCemVHZ2FhNC9tVTFqazZV?=
 =?utf-8?B?cGs2eEl0TVRnNlREbEhseHhWWTBXWmVlMm9hNEQ3QnpNaHVJT1NKNVlURDdW?=
 =?utf-8?B?bFdnZWRTRnFnN3g0N1Q4TVozUW1Bc2dzVFJacDZhWnBNbUxpQXZUcW83Y3k1?=
 =?utf-8?B?bGg0NHpidkxsMkZVc3IyNEM2NVpFM29hd0tMWXVZdDllU3pBWFVrRSthOG9L?=
 =?utf-8?B?RXB4Z3hZQ0srbDlKWUdSQlRmaVJZTmtTOGZsZ2Z2MVNzbC9IbWlMNG9LOEYw?=
 =?utf-8?B?SWYxOHRHQXpmK3VvL0hsek40b3d6K002VmdXcDRvZFdEQ3FXREkyQ1VpcGdl?=
 =?utf-8?B?dXFzQ1NtdEQ1TVhxekIrb2RkWDNRL1UwNE15ZStVQlVlU1VOTy9HbnJjQzNC?=
 =?utf-8?B?S1V5ZWRES0N4NDl2TE9FelJUY3lYNnZrTVRwdDNSZmczTU9IMUNyT1dNL1d5?=
 =?utf-8?B?V0dhQldzWGppeS9mdGtablhINjBWZkkxMUFCTWt4WHc4TC81eWlkdW02dXAv?=
 =?utf-8?B?d2lBS1dseTF0ZzUzRTRwZEtMV2pwaVVYdEI0SUM3VlorKzNJVFBudGhHdWt6?=
 =?utf-8?B?OWlscElxOVdXbFBPckhtUzlWN0IvMksvRm9aVEFvMTZHTjlRdDlPaDA4cE9N?=
 =?utf-8?B?QUNsa2JUM2tCOVIrREJNT3FpUjdEbi9hRE15STFOQzlJcmQ1NldVbDBMY1Bn?=
 =?utf-8?B?eGJsSUVsaTJDWUtxaVVYYlFiajIrWlI3cVJETGl6eWwycVFueVp3ME9yR0dv?=
 =?utf-8?B?dlAyRTZhNk82WEc5dW1JdWl4V21TNVUyNWNxcEVjVjU3c3hXOW5rY0FEKzNC?=
 =?utf-8?B?WXV5elBRUVhDLzJ0MTY5cVNuQ3l5TWV0TEU4RFdINHZMYmVoMUowTnNJRjRF?=
 =?utf-8?B?Vzlzd3BtcmNUaUVoY1JUYVZFQXg4Zlp5T0tRTE1IWlRDRXEwM3RkWFBXVzkv?=
 =?utf-8?B?U2NZMUpTKzdRNEdvZW83QjRvZm5CcStyRjdpUnltUkoraklOK3MweElzaVVo?=
 =?utf-8?B?MHZwNCs3dVlhcDNkaHBoRWZnNEV1WlFNRVl4dWVwaDNyTTMvbCtsTEVsa2RL?=
 =?utf-8?B?VzRiOXVkTzRVcHpnb2p5NmdTcEFZcm50aGFoK2VrUHgrVTBXYjMxb2tnc2hD?=
 =?utf-8?B?UThFQnNhNnR4N1JIY2tMTnA5SDdqa0hyRERtZ21LSkJ0WTRrWUJrNStBQkx4?=
 =?utf-8?B?a3VxTnpWYmd5alFFZmxXc1VHV3FzeXU0TmdISkJYVnZWcWthWGQvZ3hZRE1U?=
 =?utf-8?B?Y2xjcENrTFZvK0g5WUs0b0w3QUZSRjRrSGpxeisrUWJoYm5GU2Fmb2dKSXJs?=
 =?utf-8?Q?m2ZGi9yVOwi7d4pVUI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6b2882-b422-439f-0a72-08de68ad9f20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 14:06:44.2955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHGEQIDzZTuwdAk5l9IXdtUMKKeh3RaQjz8o6sxzCkdxx6N4gQRLtxAe+vonsKQn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999086
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 6365E11BB41
X-Rspamd-Action: no action

On 2/10/26 15:00, Philipp Stanner wrote:
> On Tue, 2026-02-10 at 14:56 +0100, Christian König wrote:
>> On 2/10/26 14:49, Alice Ryhl wrote:
>>> On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
>>>> On Tue, 10 Feb 2026 13:15:31 +0000
>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>
>>>>
>>>>
> 
> […]
> 
>>>> I mean, the timeout handler should also be considered a DMA-signalling
>>>> path, and the same rules should apply to it.
>>>
>>> I guess that's fair. Even with a timeout you want both to be signalling
>>> path.
>>>
>>> I guess more generally, if a fence is signalled by mechanism A or B,
>>> whichever happens first, you have the choice between:
>>
>> That doesn't happen in practice.
>>
>> For each fence you only have one signaling path you need to guarantee forward progress for.
>>
>> All other signaling paths are just opportunistically optimizations which *can* signal the fence, but there is no guarantee that they will.
> 
> Are you now referring to the fast-path callbacks like fence->ops-
>> is_signaled()? Or are you talking about different reference holders
> which might want to signal?

Yes, I'm referring to the is_signaled() callback.

When you have multiple reference holders which can all signal the fence by calling dma_fence_signal then there is clearly something going wrong.

What can be is that you have something like a fallback timer for buddy HW which swallows IRQs (e.g. like radeon or amdgpu have), but then you have something like a high level spinlock which makes sure that your IRQ handler is neither re-entrant nor multiple instances running at the same time on different CPUs.

>>
>> We used to have some exceptions to that, especially around aborting submissions, but those turned out to be a really bad idea as well.  
>>
>> Thinking more about it you should probably enforce that there is only one signaling path for each fence signaling.
> 
> An idea that is floating around is to move the entire fence signaling
> functionality into the dma fence context. That would have exclusive
> access, and could also finally guarantee that fences must be signaled
> in order.

That sounds like a sane idea to me.

Regards,
Christian.

> 
> 
> P.

