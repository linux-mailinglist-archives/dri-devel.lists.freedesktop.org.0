Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP0rDqMMi2lXPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:46:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC733119C9E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00310E54E;
	Tue, 10 Feb 2026 10:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1bzGWKmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638110E54E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XY7v5ic8OAJjc98H46qVjAaJZRJ+VUfvTPqdTo6iwWs56d7ry/BLwEhiFI7EHJct32Lj3/h/qDSvL6rMiubYa0//Jj3dsZTfWiw7aFr7trYV4juW71W6rcWj2MH2Hc4LtfyPLBOwUUwzwxfckd7h4iW/zsn6R7ClGydH61wxVveOsEG4ALqag8cn4a8kY4AatY36m/tbjENd8q/UUANCueuDqWS3lpSeSWX06pSMUFel+NUbdTCheW1A/dbOHC9FxkuJUW4FZUCVxTZFfosGY/BtpVfnXqsfFUkwHR83pbDXjHOVEgi/fLTpHM1q1+0tgDoO7lV4uegoxngHI2tk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgDECb91bK1rGG8Ns7Gy0AMjm+UZ7B0hD1h0LciLkC8=;
 b=oy2UhC8JylcacxYMc7sAMuDhtuW1ZrGtKX40Xtgbsa8zzeYf+NHhGu3XQQKac5MXLkrW7hthTnxT1dVYLVVQZemwoz8W5KQJrutrZbHMp8PNhbgGhj3iWOvxk2WiVgIL7Sd4oH5VhID9+Z6G1VnoHcvcMYGG/BCDDXtMIDqaHtPA8HSfbI43JZWYAb+MZK/NaoobsEdfKd3mlqciO6J+bXCY4wKCwDedGhHwZMbK0XpfaJoOI7UG1ma33WGqmI7J9cmJGWjsWbcHZvVI+OJQPREMCy0+bbG8tEqqfRL9QY8bkVfSGs4S383Q4AeQMcPXj3VGBKJE7NYG5njD5qAk5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgDECb91bK1rGG8Ns7Gy0AMjm+UZ7B0hD1h0LciLkC8=;
 b=1bzGWKmGDRt5hdgP3vZQX+bIGKvxeGD2QekzjeaHdpQQyQZY2COK1Meab23Bu4dLcp6y2wi9YC1v+PK8cloUm7T7IBeoDRxGrcSI0cRNPSSruDzHNWi5lwiVplAKL6aHMYNhN/V3V9kFhLURwPtM+EL56P4T68rAhrGh9bEUkz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPF2D39B31FF.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 10:46:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 10:46:52 +0000
Message-ID: <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
Date: Tue, 10 Feb 2026 11:46:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: 404298aa-28b9-4726-e2bf-08de6891b39f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVDWkx1Y2U4Z0YybGdmZTIyWE1Rb0RpVmtYY2FvaHFhQjJOMnUrUXZRNEFE?=
 =?utf-8?B?K05iYjlkQ0ZWQUUrTWtSMDI1SDR6dXo0a0dtNnkwYlJIcWx4UEZBTDJpZ0ZW?=
 =?utf-8?B?cXdteURHdkpaa2VQZUhaQ292ZEZXYWxwN2I3MnNGSWFFa0U1aHRMcXliOEUw?=
 =?utf-8?B?MnJZRExKOUNNSStWM2dSeEFxU0ZORFZFMkhleEE2S3FjVHZJdXpTNjBWdkdu?=
 =?utf-8?B?TGl3NHZmWjBMOUpCZVNrR2M2L2tNVk5YR1p0cmdOQ0xSVThhN3RMMkt6bThK?=
 =?utf-8?B?ODJUM0EwS2JhQTQ1Sy9CRjg5NXFxdjgwMjZNUWt5QUY5OXpHQ0o4bmpVZnFX?=
 =?utf-8?B?VFBldC9MOHlmZE0xano2citkTmkxck1qazN6Ulh0OFZGQitXT09qeXJvVXBC?=
 =?utf-8?B?NitJV1ZodlpwaWo2MVBzRXNVZEthYkFRVjQ3cUR0OTRmSHBtelluWExIbExW?=
 =?utf-8?B?VUl2MHFLK25PR0hJZVg3SnFKV2hzRWJWa0R6ci96b3JtV0hTTGIwNVBQc01O?=
 =?utf-8?B?NjdUeHpoODdVbzhndVNRbzBjaE5hOUFWVEphSmZDdENJcEpaZ3dJWEpNMmdI?=
 =?utf-8?B?dTR6aW01aldCMm1jaE9Gc0YyclpuNW5VbitaSnY3TWpKT2JGYk84YkFMODVZ?=
 =?utf-8?B?eFZNZnNPeGYwWmhBd1MzaitqZzFQclFsMFcwNWRPakxrcGJ3Q0tCU29mNm01?=
 =?utf-8?B?LzY4SHdLNlNvRmZYSnFGOHNNbEpVZEl0dzZjVUltSHNyak5YcFRJMVBUaEtZ?=
 =?utf-8?B?T0JCSExWZUNockpNS2xtMjB3OEhQaVg5MDk0WEhUM2FPQVp2NlRPbmpOWjZP?=
 =?utf-8?B?MGFxWWpLVUZQOEl6T0F0cFgxZkFQNVpndUIxZm51RnJQODNRMTNkbkMvQVV0?=
 =?utf-8?B?dHhtUE1qTWd5ZmZpSVlpTGgxYkRXUXVWUkF0MVd6cjlnL3VuYVlHN2FRTTVW?=
 =?utf-8?B?MVpyMU14VHpjMHd3QkpjTEFycE1nZmd4NnJBSWxZTHhuMGVKeEo5eHZTb1Zy?=
 =?utf-8?B?SE0zckd5YW96VWRaVEVockVhaW9mZkxTcGpuRzVJUVpGNU5wcW1OaHFnMzlL?=
 =?utf-8?B?YnNsNGRTK05TRHIzYWNkSjU3SWk0ekFlUlZQL3d3TDBENGhsVVJ1S05rZVZa?=
 =?utf-8?B?OW5BZWd4akJGdDdvY2Zsd09uWGxpN3J3YzRyQUpvV3I2L0YxdzBvbzVtSWlo?=
 =?utf-8?B?RkViM3B3eEJvSEFackNHZ1ZTQ2E1WjRkNURaMm1LUEJVODlBcC9pak5janJz?=
 =?utf-8?B?Y0ZCcWdnZ3BoMmc3S1Njc2dGbng0b00rUFV0N09GTW9QMHZiWExzS21QSTlZ?=
 =?utf-8?B?cUtRK1lRdllXSnRNSEd0b1hBZWROSkpoMzd5LzljeGxvekp5V0NVajVSeTJl?=
 =?utf-8?B?QmVVR25CNkczNXBHMDR2cC9aa3JkNTJZS1pXTmJBbmJNcjVmYjBWNkdERlBW?=
 =?utf-8?B?TzdianZoOXB0ZlJrOXl0VC9DQ3poOHBGajg1S2ZRcy9scytUUHIrS0ViQlo0?=
 =?utf-8?B?SXZ2dEhCQ3BFYkd6djgwNTZxTFF6bVlsK0dZZGRzcnJpcExJQUtaeEJyMHNs?=
 =?utf-8?B?eXpsaWMxS0d0NzhibWwzVTBESUhJM2FOK1RReGdwbm1Fd3R2MHhRQlh1VllQ?=
 =?utf-8?B?amI4aHdhWHZEbnRhMEdyUmxBb296eWxVR1FIOVpVcEc2UEMzN3NpUUUySlkr?=
 =?utf-8?B?a1RsMEgyV0d4Z0Y0QitTYXNMY3NvSWREQngrU0RTV3RUR1pKdlJ1VVNTVWJG?=
 =?utf-8?B?azN2aXFDUUYyczBkeEZZTis2TC80L0poNnlTVm5oMzNiZXVEMHVsSmt4L2hK?=
 =?utf-8?B?OWg3eDdRWHl3dkZqZjFCM3VnWjVFbHpuNktuY1lrTEt5UURVUjJaUGswL1R5?=
 =?utf-8?B?akdNQndUbmdnZ3JGY2lzT1VmUVN3MVI2SDRYSUEwL0NRbHA1SjJ3YXl0dGVY?=
 =?utf-8?B?UUFmUGlJZXlkRmZ5OTcyRnQvMFYxekN6N1RFZU1ka0hFd0tHdi9lS3MzVWVt?=
 =?utf-8?B?a3pUTmZwV0FXai8yTU1LSElBVGFPQlhNTTlKdHptN1BXMTc2VU5JWWVYR2Z3?=
 =?utf-8?B?MzFjalF3cUNtcmJHNjNtY0J6c1hNYkFSNHFqbXZhNG5hZk1SdHpObURibXox?=
 =?utf-8?Q?gr0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXNERlFxbHpRclRTaG91WlJiTGIyMnRpTVNzSHNWb1NxeWdlbHFyVzRFUXZs?=
 =?utf-8?B?WlBpeHR0R0w0TUlXWVNYYnNCNmZZYTI1VW1ZU095Q2hHalhsa0Y3NEhzL0ZS?=
 =?utf-8?B?VWtZZkxJenlnUW5XUG10cTdOdk9KalNIaEUwRjZ1d2l0eW91N2hFQkJjb1R1?=
 =?utf-8?B?UHhCOEgwVzR5aGRXS3BvZURrRGJ2dFR4WW81RmhkQ0MyWnd4THVOSU00SEVQ?=
 =?utf-8?B?S2tDL0JYY2VsdjNrZU1vNU5VOWZibGJ3MVZJdllLL1g0aTJoQml4ZHk1YmlT?=
 =?utf-8?B?S2pDYWNlWmZiMzVOQlc1WEplTVA4Z1ZaNUI1VEJqUG42aDU0TFBvVFdrak1n?=
 =?utf-8?B?L3o2RWIvZCtkRm9lOEVJbDNGOVM3MkdJcjBOaVhSZldHWW0xYXZGUVRVQS9z?=
 =?utf-8?B?amtScUM3YTdETVR2Z0R0VVRpaU9WeDJuSS9UUWo3TWJYUnpaMi90Ni85akdk?=
 =?utf-8?B?QU5Kc2JveFpRRFB4ekxDZ2txcWo3bnBxT1NPYzN3bXlDd296KzdBblY4SE9K?=
 =?utf-8?B?WDJOK2ZpMW1jUFBFRVZYc0FjWTJVbyt4K1VGNFIrbExDelhBL3hVVjBVazVx?=
 =?utf-8?B?aDJmWDl0MnhUT3JIbkVKT2MvSGFzUlJxakEwbkF2bXMvdllYWFFzRGRmM2pu?=
 =?utf-8?B?dDRrSXJXRzlWV3B6Yzk5VmkwdXM3L002TzF1aFNiblVjelk4MCtzKzc1MDBO?=
 =?utf-8?B?MUl2U1QxU1dmenhncUNLU1ZzTDRTaXNsdkRxVmpDVHlvV2p3WnFtWXN2TW5E?=
 =?utf-8?B?Y1FQczRLZFNWZmovM1FuR0w1a25ic01UN281TlZvbm9WK3pPSVFoU2w5VmtI?=
 =?utf-8?B?azN5NWx4cWpGeTdvU3VEdFlUT2RuUVhEYjhVMFFyS2U1T1Exb1dlR1d3Z1VN?=
 =?utf-8?B?aGE2ekRRVE5uclgxV1VxYWtoY0tnMTlOaVp6Zk1RdnUwam5QOEYvaEFQd0VU?=
 =?utf-8?B?dEI1eGk3bzdqbThsR2ZTRll1TE1KMjBCL2tjYnB3SXlpSE10NjlFektMU2xt?=
 =?utf-8?B?dkhrczlaYzFtOXNTcXp2bFpnZGhTVlY2SldtUVM0Tk5ieVNvK0FZSWNINTZD?=
 =?utf-8?B?ajQxSnVmZTN0TzdDdGcwR05nMVlPaHQzbGNNMFJTbDZvMmdPNmI3WUVvVERM?=
 =?utf-8?B?Yk04Q3lLQlljWG9GZmFYZE5FRnBkYlZqejF4eEVubjZSanh4WlZ0S3lSTEM2?=
 =?utf-8?B?QUZQVy9uaVJNdjIySGpualp3UjE2Tlg5aXJzY3pVUVlKU2tienRvUjE0bVlm?=
 =?utf-8?B?RVhGc2paQXhBYWdIOHVWSEZnU2hhaVdQWnRLMTVJRS95K1NvL210UmE3RGFu?=
 =?utf-8?B?MjJ2bURJK056TDlBWWdBWDVtYW03aUhmb3pPcWZ0WWl2cUJ2alNwTEU4QWFs?=
 =?utf-8?B?TzBGQXdYYUhZTzRrVldtMHFlK1NGbW9za2NmdFhrUjFjZUJTSHBtQWVPeUxT?=
 =?utf-8?B?VTYzdGs2TjZ4RlBidUpia1VYdktwYjRDMlFmOXV6MkltMFBMS2dONVo5TWh0?=
 =?utf-8?B?THJmS0RETGZ4N2xicEZmRGp1MDF5R1BwMjFlNFlsYWVOMy9yOG5rZWdHMTFV?=
 =?utf-8?B?UHkvOTd3Y0k2TVBmbXRZcWxRVmMwMHJtUVN2THRSNjJXOHFLUlhPOWd6T1hP?=
 =?utf-8?B?OVJ2cTM1ejdKV1RLRzMwQU9ZdFRLY2dGQ0RNdE04TzdleEozVk0xbVU1a3Bz?=
 =?utf-8?B?ZGpmOWpPQlYvU1VZWnoxQ2pJSlQwamJsWW16Zmhxblhab1l2Z1NHR2ZaVmg1?=
 =?utf-8?B?K3pEZEJVMVBMUnZVdzhETU9YSWN0endCd0JlSTVsUVZDQzg2Skk4L2VVSmgv?=
 =?utf-8?B?ckVaTmlXb2xycklRS3BzckMyWkZYUzBESzVzeWlJL21Fa01KcEdsYnB1Qytt?=
 =?utf-8?B?NHR6ZGNiaG5LU2ZmOXhXSVFOMTUybGhHNWxnSGFtYzNZUWZ0Q05IOTh1aGtk?=
 =?utf-8?B?NGZVTVFLVkMyRGFXMVoxenlUSFZicmFic3lLNGZGMTlTTGNXTEpRYzZTOVI4?=
 =?utf-8?B?V2I1eDk1MWZGZER2ZmFGcVM2SCt1Nyt2b2ZqUUIxdXpNU1NxZDdkQWtUVjlX?=
 =?utf-8?B?VVNzYmMwL3hTUHZZeFo3elM1eVlkLzJBd3MyT2hweDU0YitZdURnamJJUFlh?=
 =?utf-8?B?blREVE1mLytjN3AzZEZtK042a25ZeEdKRWlZeWJNNThURGhQSWxTZlkyaU1a?=
 =?utf-8?B?RlhpUXoyYU5pa0JXUHhIRCt3dFBiS01DV2paZG9aRHptTGRjbkpWZTZBOWFN?=
 =?utf-8?B?eDF5djBySGQ2ZnBLcnNNb3lkU2JwYTlmMmVqSnJqSUJORnBsaXA2alpIWm5Z?=
 =?utf-8?Q?RRSvrBB6QB6aC7jCvs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404298aa-28b9-4726-e2bf-08de6891b39f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:46:52.8260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4QC+tPXKXZgvF7KAJp1R8SYMeubXKcDDg0AlSxfJjo3ES/2n1GAhkYJUFl2uYL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF
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
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: AC733119C9E
X-Rspamd-Action: no action

On 2/10/26 11:36, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
>> One way you can see this is by looking at what we require of the
>> workqueue. For all this to work, it's pretty important that we never
>> schedule anything on the workqueue that's not signalling safe, since
>> otherwise you could have a deadlock where the workqueue is executes some
>> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
>> meaning that the VM_BIND job never gets scheduled since the workqueue
>> is never freed up. Deadlock.
> 
> Yes, I also pointed this out multiple times in the past in the context of C GPU
> scheduler discussions. It really depends on the workqueue and how it is used.
> 
> In the C GPU scheduler the driver can pass its own workqueue to the scheduler,
> which means that the driver has to ensure that at least one out of the
> wq->max_active works is free for the scheduler to make progress on the
> scheduler's run and free job work.
> 
> Or in other words, there must be no more than wq->max_active - 1 works that
> execute code violating the DMA fence signalling rules.

*And* the workqueue must be created with WQ_MEM_RECLAIM so that work items can also start under memory pressure and not potentially cycle back into the memory management to wait for a dma_fence to signal.

But apart from that your explanation is perfectly correct, yes.

Thanks,
Christian.

> This is also why the JobQ needs its own workqueue and relying on the system WQ
> is unsound.
> 
> In case of an ordered workqueue, it is always a potential deadlock to schedule
> work that does non-atomic allocations or takes a lock that is used elsewhere for
> non-atomic allocations of course.

