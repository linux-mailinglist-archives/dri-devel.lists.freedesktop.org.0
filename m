Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B12BFD0D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C345A10E7FD;
	Wed, 22 Oct 2025 16:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BA/hTKgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552D310E7FC;
 Wed, 22 Oct 2025 16:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wp32ziOe/Vw26HdGjvOvnRbjQbzwN+LIIu82MrFpSlpERIzNm7SAsIQkcPavWiRJcgomh8z/XbXEWdIfufg7ZMqnNvDlwOwY9zQausfyqQtmntAZMosBEMQePDJKfb4LriLq7glw8LW5f71VJhHWueHbiPOk3fXhN8PnSsVj3amosdRYqNxr83YUwIT75dTz/d4fJ0Ek11zPNHnBRXsljUcHm8/cj9DTTfKgIXkXMhDBNSeNTNu2Y6RJTfjea5b3sZTRVIL1n3vpN8chvmgCbeHTLN+z1gEP4R96KTEyLhtp1C7n6/VeNcdOaNW6hdFwPhSbltZcbn9dFmC+f2yGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kfg/MOfmlP0nmq3ria7J0Ul2stu+x221K4afYgEmMyQ=;
 b=G2xlHfV/23m2kZ36d02kvdlTPoMtlyJWXwrqH1q021nS/Ba7q+Cxk60O1MJzpPa95nrelj8fQPd13WWbNfqBPs4gZduj/atarY2W0jDyzpk6LPpL2FHhHtK20hYmmYCtM4P64aH4KSQHn2/6WhBvkv/yYweGOpZ8LYs6tW9C0osVGa1AP/9AWQAO3/Bp98xfAjyckZDhufEqpodBuA2Bnw2LR2jQSM2RHJApEYuwnTSRZ9CTHYs86i2wbky+Q2TaKzzwCf/p6x6SV+ZhwOYDWDvDyfiVNM/YAjd68bf0AHpNosgjmwWkX2QEW/7GZmf7TbC7fYpLdhKGj6UoD5S96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kfg/MOfmlP0nmq3ria7J0Ul2stu+x221K4afYgEmMyQ=;
 b=BA/hTKggI3xt32IqA3S2LUV2uHoT0Kpqt2MEL/nTrCDGHOHx0rrA1TkQR28WFlF0CC9mLFiV/6aOaTY13pdS3zTsGi3QzedaGED4p4OUW+O4eMgpzFcWBDNv0XviYwWFWGZL4zyCOe1dPHuEAKuSQP568CeQ3NsJRYh1Tm5s2XVYGQ+5hAld63za+SWzTSRvYe6yNCLDDc8wgNyAxcfanjZkdCiauLhwPOl7Q6WBNo7Wma0oFQR6OOEGXLl3Mel7NifnEKsjY21HXH5RrUMsR9lxLM3maHxuoAG0H5nWeAeFYu47orFBMIWGWOvliUsfcOfPrE4Jmcz7+uoL0xXM3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 16:11:06 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 16:11:05 +0000
Message-ID: <ecc69b04-3746-4119-b1ab-fc666d6ca352@nvidia.com>
Date: Wed, 22 Oct 2025 12:11:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gpu: nova-core: bitfield: remove BitOr implementation
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
 <20251022-nova-bitfield-v1-3-73bc0988667b@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251022-nova-bitfield-v1-3-73bc0988667b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f54757-ac00-409a-4c9a-08de11859a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFJ0eDRMdzR3Wnh4aTdCSk9kS2RINHowOTh0MEFoNDNhSkZHVGthUGd5dk1k?=
 =?utf-8?B?MEN0NHJLS2dYMDdPNnBweVJmVEFPaTNDV292Z3BPUnVLOVU3andsUFpQVVlh?=
 =?utf-8?B?OWYwNzVldUQ2OTFXZW1MTDBZSUx1VjY3cjhqQTVTeFBJUGtCTEJrb3JoRHdy?=
 =?utf-8?B?eitlOXU3SlVUZy9sREx1UXB0MUt6MGxxMWlsdHF0Mi9HZm1SUksyZGdyTWdB?=
 =?utf-8?B?NFY4eFJxU1IvNE0vNXJ0Y2UySkxFL3daRnRVMUJ2YXl4SmcvaUVyZ0pzSklL?=
 =?utf-8?B?R2lJMGlKMkdob0tOaHYySXVoNDJ5anlUWXRyM3RJY3VoMHppZXFOQXcreWtK?=
 =?utf-8?B?eWNjUXh2OVF0M0cxbGI4VzhHYjlLWFc1VUFmSUVXTzdRYVN6Rkhmb0s3S2VD?=
 =?utf-8?B?VmFGR3NpTzR5K3BJcDd3bythc2FKUTIzSFRYT1k1V2tHMSt2dStBbk9ENkxC?=
 =?utf-8?B?Z1VacEs4ZWJtcXQzTm4zM1JrMmtUM0UwdGNvZ3NTTTB1WHBWck5RVlU2c2dU?=
 =?utf-8?B?MEoyRVUzVkJ4RFJlbjQvV0ZPUkt2clU3bDNrYmJiTEVYVUlZWTFvWGhkSElP?=
 =?utf-8?B?MEIxRWJkWFNjWHpoOUtxdGV0bHI0U212MTJoWEt1b0pDSzRUZ3V0eHZrTUpj?=
 =?utf-8?B?VlJaMXpGQldZTXFXUnlia0htYW5Gc0dXejN3RTdjRHNMYkIzY1NtUlBzNjZG?=
 =?utf-8?B?cXZ6SlRKWW5aZ001V1UvMmMwYjB3dmpQSE5Pei9PbnBIa0JneWs0YkV6bjJ4?=
 =?utf-8?B?Q0lnNStEdEJtbUZReGlxS2ttejF3NWFQa1FNaVpEZG9QTHJzQzlCbmR5TWFS?=
 =?utf-8?B?TzZzVFVJbDlqRVVjamIxc3J4aHl3TU1NejFyY1FieUFlcDQ1S0tLNGNnSkIv?=
 =?utf-8?B?QnNXY3RRL3VJUUpQdjZ3TFNhRWJxN3F6R2I1Q0xtNE5rWXQ0MzBvUitKRGpP?=
 =?utf-8?B?STJBa09KRkswYTJkaEdTU05Ea0d3cHBNT1NlOHdSYVFYVUhTblliY2hkK0c1?=
 =?utf-8?B?RVBQSHhBV2htU0NFVGJFNjZ6ODVuK3BzTElsanhJZlM0ZjdoTW5NS0tyWm9o?=
 =?utf-8?B?WGNtQWxKdElseHNySTdQcE5TQ2ozQ2NHU29OWkMvS3YzUkExL2VoVWIzb0FM?=
 =?utf-8?B?VzZtS2E4UldnaTNHUW5OWm90NWliYkgreUFtUjhEdldqVHNyUms0VG4rSDN3?=
 =?utf-8?B?YmZnSGlVYy9JNGdYakV6ZzhvdnB1Mm9hTHZZRExuTVVxanlXQUF1cWdDR2Rl?=
 =?utf-8?B?WVA2RDhMczhzalFPcDdrRktNZkJBV0hPd0pzdFkyU2Y5S0pLazh6TkhnVlFu?=
 =?utf-8?B?TjVtcmFhblYzUTNFWUNyek9nNStEb0hsc3lUU0QxMDA4RkxPWElSTENmMjJq?=
 =?utf-8?B?amwwU0lCVEZQV0I4SXFmN1ZjU1FKWVgzeFJieHlDS3pXNEd0TWhWa3VxTEUv?=
 =?utf-8?B?NkVPNnRYMDlIZ0xicWVVWXdyRE9vNzdVSkZ6REFpckdGRFhTMDh6cm0rcVJn?=
 =?utf-8?B?cy81ajZKRlNOMXdCZUg4S1habTRSV3puYS9VdERvZzhhTmR5RnBHOGFwS2xn?=
 =?utf-8?B?anh1cmNvcGV4alJDWnhvK2dQTDF6V0hCQW5OSkVndWZ6T1VXMzBOb3BZUUVZ?=
 =?utf-8?B?Z2UrMXpodHVDNXM5TExLMkNuSitBdmRlRkNHZ1VQUkx3Tzc4aE1rUjE0UkE2?=
 =?utf-8?B?UDVDam1wQ2k5dVFXaE5MTnJrTXdkVnF4VW9EcWdyM3ZmNHNJNXd6bGMzK3I4?=
 =?utf-8?B?WEh1V1R4WVQyY09VVVdjQzE5UXRLUUdZYU1NZm9aY1hxNElPeVFHVnVzd0hq?=
 =?utf-8?B?OWNmN2oyaVpYVWpSZXN1Q3BwVGV5cDB5N3Rjb3kyd2pBUVgrdzhPaElUSDNs?=
 =?utf-8?B?a2p4MzZVMzlTUGc1YmFPUWplTUR3ck96UWJsU1BFY3NnSGhkdzM1MFVlTGtQ?=
 =?utf-8?B?cGc0ZmVma21jd2RTbDhJRzd4YlMvUFhHYVo2UDB3ZzhkMGdRbHh1bUFIZnpT?=
 =?utf-8?B?NTBXd0ZUSXhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk03ZVJOSUN3dTVtRlBXQ2RGUlo1bG9ZNTJvQVNuUS9OL0VpUjJpeUlzclhN?=
 =?utf-8?B?b0pZb2NsdEhGalRLY3RHVW1UdElTQjVQdzU0U1gzVGNLM1dhMjlQU1NIbzlh?=
 =?utf-8?B?cFFUTU5FNXBGYTBjcm56aG1pYkhpUzJDUHJHWGQ5MUh0SlpCamwydm95WTlx?=
 =?utf-8?B?OG1jelZscUxUN21wMHpaSWtDc3JNdUR2NlMwU2JiQXA2bWNnT1M5S05xeHJP?=
 =?utf-8?B?Rkt6TFlpdjU3cTJLTDM2aHN6QWpER3VSWWNkWkpXS0F2QnlkTEJxZmxST3JQ?=
 =?utf-8?B?SWFzRnNtOWdXeWJldzNDSEE5cnJRTGRMa3NyS2tBeC9FQkdXUndISFdDNGJi?=
 =?utf-8?B?Z2RXeDQxMVZ1c0ZaZXJ4U3JreFNyaFBUa0NENktCU0N5WWtyaURDZDU4N1R6?=
 =?utf-8?B?U24rcW45ZzJMMXZpT05oUUt5L0VlRmlhVHdHNWhReWxMRjF4djdTank4VjZq?=
 =?utf-8?B?N1BOSGRkVllRbW1JWUsvZlFLNHFqa1A0RVZITkhhWnpXUUZBMXhEYVhiY1Z3?=
 =?utf-8?B?U0EyTFNvMSs0WkNzc1N4UWZ4QmVQaWR1Wm5CbVBsazhaaEw1UXJkcFgwNlFj?=
 =?utf-8?B?eSt6N2FKWWVzekp6czQ0RS9OSkwvNGNaSXRMMzc0M3VvTjl0U0EvYzh4MkE0?=
 =?utf-8?B?WUFuc1JXS0VlN2tHS3lMK3daMUVsamtDVS9yOXVrVENwdFo4R0k0VCt5ZVA3?=
 =?utf-8?B?M1I2ZlBxRGVwTmI2dmE5TnBWNlVuaDZjaWthUHJUTjNuQWh0aUFuRkZBMFJ2?=
 =?utf-8?B?Y1ROcFZoK3prRGRYOWxkVE5ONDdpWjNkdS9ubi9nTWZEeW80N1JrR1Y1M2Y4?=
 =?utf-8?B?UmJCemc2UzZvcEkyNTJuWGlIVktncjE0Zmw5Y2R5N1l4MlpaQ2dmY0RrWVEy?=
 =?utf-8?B?eFl5WDZ1TFhPcUdBUzNTWHBCY0VQYWx4cEtJN0tnZ201VWpWbXdjNUVXUXBV?=
 =?utf-8?B?SGFMRmx6N1JBa0U4TC9FbFBpSitMRnIvc0dCY0crdGRJZlFoWWNxSlh1aE0w?=
 =?utf-8?B?L2lWOUt1cFhYeUR3VlhUSXFFaVZKd0N4ZFpBNUFNeFNvRUFJRG9KUFlWTWdT?=
 =?utf-8?B?ellxVDJjanBUa2Q2RHZEQ2dvZGVlTjcvZ0lLQnZUeDYya1FPTEIveUh3OWlI?=
 =?utf-8?B?RStKVmRlbnhoaEg2TzMzeWE5bnJZUWhVaW1udSs4QVpTQ0dsL3BjZ1ZITHBC?=
 =?utf-8?B?VjR4MVAwdTQxMUowcElHZjlPUDRGUFhWZy9PM1lRaThocHM1NWRvM1Q3dGJN?=
 =?utf-8?B?NVNacG1tb2dtVm8yM3NhZkhjYW0rc3JYN0lHdHpPemNwOFYvSjJRV2NHU21u?=
 =?utf-8?B?RzVzSUVrY05iZm9KM2t2WDh1TUhxQnp0TmNlSzRhVUZrV1RTemp2eHlVMENh?=
 =?utf-8?B?bzZhMjl1TlMyVzgwRUFGRDVDcW45aVdaNTFDcVFVaGlZWENNQkc0a3ZleVUv?=
 =?utf-8?B?bGtRV01Eb0c3L3JsL2ozMkFHcXJPV3g2UHZjQStXSnpEdkw4WnljbzRKMjRm?=
 =?utf-8?B?UU5tYTRYZlFZTVBzd3BEU1hLZ29YK0t1eTlTMWR4dVZRY0Z3Q3JJY2NRMU0y?=
 =?utf-8?B?WTUxUzV3Z0NjQ0RPOUZxUzVGZUxNZ0RWZjdmc2pKeGt2ZGJMSWNkajdYbW9w?=
 =?utf-8?B?VVo2aXlWRzlQeUJCVzlhT2VEbytROUJwZnpNM244NWJ0U284Y3NMZkdZWTFz?=
 =?utf-8?B?UlpaMlAvL3BTdXBJWXhrOUZJcDdvWjk3OW1PdWZSVVR5dGMvUlVwVTdXTVVw?=
 =?utf-8?B?MHJmUUVpKzlnTXdJS1BDcjRDQk1Idm1WSkJ5MUR5cnR5QjJtellXcUR1ZFVF?=
 =?utf-8?B?UXlnMStSSFJSUWFBZlNJMTN3R0xhNWZic2Q2MENzaWJ1MnY2U1creHBxeFVt?=
 =?utf-8?B?MThJemcvdGxWWldkalBNV2tRYmt1NjNXWTdrTVg5S0tXVUJIN296RXoyNjRq?=
 =?utf-8?B?QlQ1S2pQZ2dGaUY0Njh1cVg0UnFyVkN0dnZvUzNTNjhjMS9TQW1yN0wvSm83?=
 =?utf-8?B?NXZhcUpMOW0rNjhRczl0eVB0UmtnRkZYR1BMSW5lSTFMeXRJSmg0c0V2VjRq?=
 =?utf-8?B?OUR5VWd5TE1ubnV5YXhNaUYwUVc4OFdRclllYTlZRVZjZHA4WVRFY1BiOG5q?=
 =?utf-8?B?NjBLdi9PUWhjd2ZtWmpKTEhTY1ZRTUtlV2x3MkZvUS9waytKQnNMK2ZpQlkw?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f54757-ac00-409a-4c9a-08de11859a45
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:11:05.1337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svxqJwzG1PzFu3TP1lL0R0o4g6vJ7McwHO/aKdcVum4ejeFl6sh0l4KKSY+SMu8TKELebyRRofToMOFSiOmU8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000
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



On 10/22/2025 6:50 AM, Alexandre Courbot wrote:
> Using this operand can produce invalid values. It also doesn't bring
> any benefit as one can use the builder pattern to assemble a new value.>> Reported-by: Edwin Peer <epeer@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Yeah, we should get rid of BitOr.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks.

