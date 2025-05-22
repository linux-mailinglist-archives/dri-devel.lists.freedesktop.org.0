Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC2AC0E3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417110E178;
	Thu, 22 May 2025 14:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BySLE2MI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5379C10E7C5;
 Thu, 22 May 2025 14:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSfFDyBIjQq4XMFulMUau+QcK/4aZFRyM/usdCnRdfcbt5mriZPmbvgVf65i7y6Y0ScCplN0bjeaAK7OeuDnGwLc34la7whACUdR7tEtIZoHCBp5fvp/01dKyMr7cTvHuU2T5Po2lBVpylaCL0099cQG0YtkW99TMuroe5gInpXZFwc8nM5j0mAFfml/SUORaBmRjNxM2XGU3vlbzs/kpQmGS3kmifdRpSU6S6S6oXsUtA82JJ7hC1DFkZm/nYYBFg83fQ2DAhizK3wUkSxxxet6KNAs26fhepVqTkzAiS5ka+eJbycpgTMcC+f5+hjAQa50Ks50PzJkRP8DWhBCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up4n+APw3P1oQczNOE0Ov9s3sXAXpFSORJzwdslgB9k=;
 b=Rqad16gPnSQEg3gsBkKoy7ch9v/xG5J0X4jOWA71qdKtX3bbQqxac1Z0SH6QFIL88gfYQ4hxMotJgbBeAJxO5YR0flv+//wiQusQZcJvNnPuszaOKLiatKiDaMZ1gv8c7FLkSvydAf/+53ut1xKpmZt/HEabNlADHkl8F9d6eQ8wbPgICr5CFqMoLtSZ4eWciTEyi2E6/8AncBZC638ZRaMM0fXDmhHza8Lg+Af9bjqYsd9+ovgVL69SEWX4GN3s6lCd6h/EJzWrIhJFo791g1Qewg00e3h9i6ondMYRxFxHOvYavigyd2sexItDlZLr7pUmJ0PQmr0vr2gGbFfkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up4n+APw3P1oQczNOE0Ov9s3sXAXpFSORJzwdslgB9k=;
 b=BySLE2MIA43brT8fjcnQSFdJ3dTejY8cRFZ6mrZDZSeu6DY7HuazBAyyQd0IImRQhhy2ooZD3aDtxVL77T9Vewz2bDXzDfOwxQeVkO1yNaigFlgj4JFYtjxOPAH3TAN/dZLua3QJNHuQJwhdrn2ykJ+6vSdY4IJ0Ero8tvSlmNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 14:35:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 14:35:47 +0000
Message-ID: <f912b8c4-c37b-4c7c-ab9f-e1b44f6fcc13@amd.com>
Date: Thu, 22 May 2025 16:35:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
 <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
 <282de2b9251e3a1b793e02ef23675dace248725b.camel@mailbox.org>
 <dcc9f52a-4f46-4f24-bb33-b3af583a1956@amd.com>
 <3dda25c3108747bf1c7ab2974b2429a26f0762d0.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3dda25c3108747bf1c7ab2974b2429a26f0762d0.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:208:32a::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: c39754ff-a034-4596-4ad7-08dd993df138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW51R0N2L0RpakRVS2R0OWxqVWpULy9IUDJQbGN3TFBCSzdZaDVUblhaSEFV?=
 =?utf-8?B?NW5pTlNoajhBYmNIVXY4dkVraWE5ZUJIa2w0b0VPc0t0b2gxVWJiL045eTJS?=
 =?utf-8?B?MjJjRkpESjZXYTI2ZDl6cTVnanRjanFuUk4vSGY4b2xSa1ozUjEyMTExVlFt?=
 =?utf-8?B?YkMvWk9tQWZuSFE3NDJiRHExZUUrbklFMU5FMHZVL2JuaUc1RG1kbktQdnVy?=
 =?utf-8?B?WC9FQVZOY244WHRIbkJUWEV5YWdUU3VWdlg2WXFBbi9KYW9leWZ4d1dQMjhW?=
 =?utf-8?B?UFZ4bzNUUUp3Sk8yYTF2dWVCZ21rZ3psQWd5dzBWaVg1QXd3b3QwVUZJM2Fu?=
 =?utf-8?B?dDJ2eXA3c3I0M0JZYklEcnd5Y3Z0WjdLZDd5ZWxsTnJKMzJvL05YblJMaDVv?=
 =?utf-8?B?VnpsbmIzNXlVRklGdU0vcWllWVM4RExxTFl1QjFPeDlaWUNtT3NXN2xITGpy?=
 =?utf-8?B?enBneE0wZkJ3dmc2UGFoUkg2SXhOVEp4bWx2NVl4ZFAvNkw4TnN5WE40aFdP?=
 =?utf-8?B?bXR0K0dWMWxvYkJ3MXA0eUpuUWxqV2t6YnVOU3BOKzVQckpQc3FDZElaQzZX?=
 =?utf-8?B?c0hUcVhsN05sblNzUG5xYVM1bVkxblpBbFRwTEU0cUc3bVRiVUJLMlVCSFIr?=
 =?utf-8?B?NCs4R3BucDN3ODRrcUNHQVUwK0xxajJqWTJhbyt5OFF6eXdNYkJrLzBSNVl3?=
 =?utf-8?B?S3FraytTMEdYM2ZVVklOQmQ3U1ltajQ5V2lUTFBEMXc1QmZrU01hNUdGQnVm?=
 =?utf-8?B?MU00ejBWcUtTb2c2eTlSV28xSTRDK3ZIVWphOWFQN05acm14MTlmUkxlaUxT?=
 =?utf-8?B?K0ZvUUFKbEdEVzIvNGRXQ2FhT1N1Z2R6ZkQ4SjhIVVV4cVVHZndZaFErblU5?=
 =?utf-8?B?a1ZpSjJCZUp0SHNUcVVGRy90RTUxeWV5UmdGcWhtYkliamtVVzJYaGRBQ0s1?=
 =?utf-8?B?Y1BsM2FHYVh3TG55MGRBdmgwT3FrRUhvRlFwQnpHRWdxT3BQUnpEREZsV0s0?=
 =?utf-8?B?S28yUzBMR3lnT2tsdUdSckk0enl5R3gvenA4aTR5ekMyYjZUcDRDdjhsVm1D?=
 =?utf-8?B?bS9Sbmh3d0FIZlJ0TE1BTnE2cXF3dmorQzJ1V1FuNHBpNEd4Rmh1bTZRZjl3?=
 =?utf-8?B?a0Q3NHBlUGd6allVQm4xbGx5TEpXM2llVm9QQ1VFNHFUL3ZnMU1QTExpNmFH?=
 =?utf-8?B?ZW1tdy90KzUyZ1dZRSt2ZWRFTDhtb2Y5aStFVk05aUR3SW5jSzZWOWMyNVZ4?=
 =?utf-8?B?RDJlOWdVN0dEWDlPVncwRjBuQWk4VHZ5WnYwRnNzVlg2bVVsR2h4NElVVFlH?=
 =?utf-8?B?VDZMaWVsSGFxWWpUa2hHUEtrVStMWmJxRXJxSDJrWlBpWUxzS3BpOUgyNW4z?=
 =?utf-8?B?VXYwRmJmaWNCcUdLT01KK2VSa2cwYnc1U1B3S0FkdE4wYUZqSVJGYkh1czNE?=
 =?utf-8?B?UFhFUUhDUzdHSWkxdmdxWmcrb0RvNjBPU0syaml2Wm9vaWQwNmxsaTNjU1pl?=
 =?utf-8?B?MUdBelNEZTBGRmRhZFJFeGdFbWlTT3FDaWpHQlI5SXBzOWR5RDArSjd2RGlz?=
 =?utf-8?B?M3dRRWI4Qy93OWdmU0ZqL2pMb0VlcHM3K3Y3RUtST1RRQ3BHUzZxQllEdjFr?=
 =?utf-8?B?ODNDZUZZMnNqUmlkdUdvSkhYN2hiaXR2Ni9ERHBaUG1sdDRmck4vb2lLdURu?=
 =?utf-8?B?dzJLQ1JiSjhyNGlMcVZDemN5WlFicG45QlVCOEhwamhiSUlSTVhhanNscnVM?=
 =?utf-8?B?YWUvM1l0Vk42a2I2SlYwSWFDREQzRjB3c2h3Vldpczc3cytNSW55Ny9sUWVl?=
 =?utf-8?B?bm9jQlkrSzROUEplbUxHWE9uUzNrYW0xUk5LVUk5Z285ZjVSY0lQUTBIb2tQ?=
 =?utf-8?B?bjZRR0dhT0tBRW9WK2F5dkRDQ2FRa3pzV05YNXRQNm1OTjZZQ0RUZHNrdTRq?=
 =?utf-8?Q?mtty/BG9Kak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzlDYnlHWnl2RWhEVnl3MURhdzZ4SDgyaXU4eEhHcG55MzhacEdzTWlMcUMy?=
 =?utf-8?B?elVYODlHTTRNNlVFOWozNC9UdEpKTndBdGdmcEJiUEJ4czNVTVJmdWFhMUQ2?=
 =?utf-8?B?ak1jWmxZdHNodHpob2ZlL3V1RXRnQ25hTy9zWlZZM0RnYXVSSGloK3RvMTJi?=
 =?utf-8?B?Yll3Z3RzK2Voa2xsN2k5bjMrT0lxR2E2dmk3YVJBNzVnWnMxL1lzZXFhYXVX?=
 =?utf-8?B?MXlCTTQraGt3OEgySGtPQVB0Tk1jMzFVaHhrUTJqSUhaTXRhMzJBWEo5U2lT?=
 =?utf-8?B?K0UvVFVrOU1QYU1od3pIRnlsaUNQdjNYMFhjUlQ5aDNWRUFZeTVWaFEvUGJ0?=
 =?utf-8?B?Um9GTzlOaGV3M1IvbEhpRDRjWGF2VWlYQkNwRG9BemdaMUh4N01OTnJXZ0hV?=
 =?utf-8?B?Ykg3dzNSN3Q5QlpoUEk3cFUzay80Z0s3eEt3ak41SHRsYi9DTmhOV0xwQXF5?=
 =?utf-8?B?Y1J3SUp6a1F3M2xrcTVsOUhtNUdJOEo1T2liNmlhNXVQclJaWGZsNUU2QTAv?=
 =?utf-8?B?dHhDVzRmSDl1eUgzb2ZTSnNITG94eUYwbE9oTUZYRVAwWlhUL3FodHVtR243?=
 =?utf-8?B?WHZGTFlkanVaYTNtQ05oQUFybXF6R3BWVXVzLzlJWml3YTZrOVJiUlNRQkNk?=
 =?utf-8?B?RDd0QWV0ckVPb0JmT2lKSDdRalJWblZXRVVLSVZaS3JkOWcwY2NNbmRYRDJC?=
 =?utf-8?B?MDVyL0x2a1VOMTdGTm9DMm9jSkRmTUdkQUdYZHlSZ1MvMlJZUGFRYThZVFg1?=
 =?utf-8?B?UTBTNENwVFUxQzBMYkd3cktRTDBnMkJ4QkFjMUJ2S3V3cnVxUTBVcXI2aUFQ?=
 =?utf-8?B?c3A0bkdVQ1FFSFpUbnl4OWJ0VUt0UnlNVDl6bWxEMmNINnFZWTZDaEc4RlNq?=
 =?utf-8?B?MFpsY0tTSjArQm9FOWpRV3JPK1dGY2t2TkhaakRzdGh5UERXYWd6MXBTd2ZD?=
 =?utf-8?B?NzZ4bnFaY3BTb2h0RldybVpRMEJyYUs4VUZFVytra1VKd3RLSFRISmd3S00w?=
 =?utf-8?B?d3Y2TWEraDhEZURkcE1lRG1nOC9GWFUvb09IRVNIeXV3QnhEc3Q3bXVSbjN5?=
 =?utf-8?B?aE4xSHh4akZudzlsK2crOUh0TkU0VXIrS0JsMS9maHBVTTJSSDFtRVhJWmdL?=
 =?utf-8?B?MnhveGNPam90K0E1K3dmb3BjZ0hnWUdoQ053cVIvNUxRWGlZMkgwZVZjZXJa?=
 =?utf-8?B?NTVIcG1oTXcra0haYUM3N3pPNDBhTm94SDdoRTBVUFYxMXJxNllYTVU4VENO?=
 =?utf-8?B?a1ZtMmNOK3plYnZoNUl5b2ZHNWxjNDM2d01PRjVCSVJENzBYbUVEMEh3N0Rr?=
 =?utf-8?B?Ym5mTXRYb3dTbjhwQUVjVENiRXlUNHJyWTc1VXljT3JMUGhwMWxvZk40V0pR?=
 =?utf-8?B?QzNNTHhLeVlNS3Mvc2FGODRXOUNraUdENWU3WGJkV3Y0aTgrbVZRVlhqRkdz?=
 =?utf-8?B?ejhDaGlOZDc3WVB2cUpSODVxVE9JbzhhOHhodE5Tc2ZETGtxMzg1OENzVDgv?=
 =?utf-8?B?dmU3bFhGamFLbmFDeVNnSlkzOExyWkhGaEcwTEU4a1ZzbForSzN5WGxtSXNw?=
 =?utf-8?B?dHNqbzBPVkd2dTZpalN4bjNvKzhMNzZsQWJiTmdoUzhZNkwxbUVHQWs4aDBY?=
 =?utf-8?B?THJRaGVpTTEwakx6cTRpYlNoTXY0MTdvbjFlaXFaT0p0YVJLRmZBMSt0czlX?=
 =?utf-8?B?UUJwZlpzLzRtT1QzZlZwRXhIRHRjVTVkSXF5TXJHREdZeW1VQUQxNytlRDY2?=
 =?utf-8?B?aXh0aHgramh1eEVEZkRlWlN0Y2pqY2xhdzBKd20wUElkR2tDdGR6RzVDRWZs?=
 =?utf-8?B?SjBPS1l6WEhuTmdpU01Mcldnc3hHbUFjNElvOUJkV2F4ckhWbERvcUtJbGtX?=
 =?utf-8?B?dDZhbkd0ZWNraFY5LzZHcDcrWTZVbmVPNkMrWm1DdGtvei96UURqQlpCRjBM?=
 =?utf-8?B?cTg5SDVBVllIanNvRGx5bFNJNUtxSjhNVUdUaTVlTlRXL2JXU2N4MHFaMlpr?=
 =?utf-8?B?czlCRXk4cW12TmZrMEppMFZudzZaQXM2dmFjMWtSeEQvRUJmMjVnVW5XTld5?=
 =?utf-8?B?UFRQakpiQXYzUjFVUGNyQjlmYkZMbEZHWjZQd1ljSXFCVmpLWnFUaFVvQUxY?=
 =?utf-8?Q?ZknlCl28/hTTY0Y6/fBeXLaaB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39754ff-a034-4596-4ad7-08dd993df138
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:35:47.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6NDcsXb7c3OEZ81QGHgM5ksJ4TECJSoIWhoDJ63ddZwLF6IJjSisSO1u4MexFp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209
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

On 5/22/25 15:43, Philipp Stanner wrote:
>>
>> Well there is no need to implement it, but when it is implemented the
>> caller *must* call it when polling.
> 
> I don't understand. Please elaborate on that a bit more. If there's no
> need to implement it, then why can't one have a
> __dma_fence_is_signaled(), which is then identical?

Because the caller then doesn't call it when it is implemented.

E.g. you give people a function which ignores the callback.

>>
>> IIRC the background that we didn't allowed this was that we already
>> had the case that users only looked at the signaling bit and then
>> where surprised that it never changed.
> 
> Why would anyone expect that a fence gets signaled by calling a
> function with the name "dma_fence_is_signaled()"? :-)

Because when that function returns true the fence is considered signaled.

> That was my original point, the name is not intuitive at all.
> 
> For example, if a driver doesn't implement that callback but signals
> fences in interrupt handlers, and then forgets to (re-)activate the
> interrupt, fences will never get signaled and callers to
> dma_fence_is_signaled() will never read 'true', which isn't surprising.
> 
> Again, the point remains the same: the driver must guarantee that
> fences will get signaled. Independently from how consumers of the fence
> check it. Consumers could just stop calling dma_fence_is_signaled()
> after the point in time T alltogether and then the driver would still
> have to signal everything.

No it doesn't. You need to call dma_fence_enable_signaling for that.

Regards,
Christian.

> 
> 
> P.
> 
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> P.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>
>>
> 

