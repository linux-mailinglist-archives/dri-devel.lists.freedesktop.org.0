Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E7AC1E17
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 09:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504610E766;
	Fri, 23 May 2025 07:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lNRvUU9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F3510E766
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwvUtTc0yK4Ybto90RxDCADD9VhG8FCs+S1S5BYC8sQtLRQSJRyEUvTVdlIH+TkXfK3+ci4Jq4Siig9iaSYiJbZ5BEl0c1OTTSrSFw5OatN8mGtt7jvln+WG0cXz18xowa03/vIbmF3MenOH+2bPU717Kvnb34As/bOfvbHj6EE4ktMbjP9HmwFDu/sTw/TD4pKIuwfw5/Tzk9UTjbaNaZ3k1DqmfzQfUnTiqxYz9Cxhgbm5sNOY5eun+Dak0ee1LlzXjq+kUSl6oxLOr3wGhrZ7w0WSH0jj7unB6SojK2fkg+kq5xagu4FNIji+GOjJyhWZLutWmiIBLzY4ZEknvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGuBkjSEI8NUpMqypTOfQwmSfrle7a568TvGSiqQfSM=;
 b=TYwfTrUU9AZkyDdake3MJUHWGfREpx2fc1jIbMESgMdnizh1YRY3RHYV8L8xNf3ssqgvtDknGqD7YMKAe5OUNXL2var59EdDkGqHrbxW5BTWpsDUWmUAl295T82dFqfGBWzaSBygtBND/qZNHAlpc5fBRz4d46A8B+cZgvqOd/Z1/mHsN1Kiv+Ia5OQYLuZYj90TWHEx7MJTbtmhM43TdICveE0vLOJ7yJy9YVgjcmwNeGfk2ntetKeXTT72Obpr60Z0xpyZgsaaDs7rtuJXfzEJDAakvBfTZ2l+aNx3tm58r7aPCVVY5LYSCYq/sCNmII3oG3Ac0cRSpcGBRD+uCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGuBkjSEI8NUpMqypTOfQwmSfrle7a568TvGSiqQfSM=;
 b=lNRvUU9fWlQOj3enhGzVxTglhWdun+vd1HIwxYRx5Q0lr8ICSOigZdZfWJCf3cj4ertQVXSiF4iaXgglu5yXj8Y8plOuIruF0h5/l7tSix33lsyNNF1f2WgAVbvBvgOpXSwKsHHrsQb9seWhwd3v6ojT0LIqUnutk55K6ru352I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 07:59:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 23 May 2025
 07:59:03 +0000
Message-ID: <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
Date: Fri, 23 May 2025 09:58:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Tejun Heo <tj@kernel.org>, Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0229.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cecace6-8d01-4c3c-342b-08dd99cfaed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHY4ZU9SR2VLN3B0Zk9OdmpsUDhQdC9pcnYyYkFsM2VBRmN0YnhmZEVXT3lk?=
 =?utf-8?B?dGQzbjI2SWpKY1htaWc3VHFqV1AxUXRWWlorQnU5WHZXUkd2eVhXcEZpOHpy?=
 =?utf-8?B?OXc3OTJkYVY3UENpWFhSTHNsUERGaElKeWgyeXJ1THEzTkxtaUMzUlNLVlBp?=
 =?utf-8?B?U2lyTjJ2dzRWc0FRWjdmNG1xSHBHckJQbXk0bTZad0dqM0QyL0RLRkpweTE4?=
 =?utf-8?B?THA1SFEwYTZJTVFQSWFQYlFLalpuYTgvWURDcHJxdDNVNkd1Qnl4QU9iU3pV?=
 =?utf-8?B?MDZHUTR4V05VOTlSMVJXL1VjZnBLdE1Fd0djeGlKc2x5T1diRlNqMDFBeW1K?=
 =?utf-8?B?UTREOWhNcTlIeS9GblRiZjZHM05jbGltbDY1dXBOWVBVcjhZZ1pkOEZFT3pW?=
 =?utf-8?B?d1pWKzFBRUFtSGNBd3crWDR1SCtHOGtVYSs3Smxkd0Z2bWcyb3VaUHg5aS93?=
 =?utf-8?B?Z1BDUkdFQWZvVmF5NXNtYzNWVUlKS3RaUzdjNFBDZlJnQlMrYVVGZEI2NzBX?=
 =?utf-8?B?ZWRPbGkrbUUwUmRmak9lRVhQVDU2N2d3MFdEdXNSdEFKdnRTR3hBVytPcTZT?=
 =?utf-8?B?a2d5c3hxRkdSWjA4NzRUYm9XMDRzMVRYL1NFODRUT2Q2VVMwZzJLcUJOWm1s?=
 =?utf-8?B?elVjTnlDY2dJOGk5R0dKWHVtbWdqTGkveVlXQTAwbk5EaWNGNEJNTXBTdUlQ?=
 =?utf-8?B?QzE5N0V0UkhBN2E0REVvckNPcE5FeGZlOTVHaE9GTUVycXdXOVZ2RHI4SkdW?=
 =?utf-8?B?OUF2MGdJQ0xla2p5VTNzNk5FV0F1cTVLU1VBTzB1bkJCam95ckpXQUEvRWJQ?=
 =?utf-8?B?S04yZXhPVWxiRE1BWDBibTA4cDE1Q0NvR0Z6MHZiL0p5S1l5QkxKbXpkc0xp?=
 =?utf-8?B?NFBBQnQ1b09PdGt3Q3NwdEorSW4zNktCUkRqeXRGUEhSWHFKQTA5N0RoYVlG?=
 =?utf-8?B?UldnMVFKam1LK3FjSEZTVDZjY3BHaG1McGtLaXNiSXB6dGtGMjdxNlBrS0Qy?=
 =?utf-8?B?TWJNRG5WaDNjc01tUUUxeEp0S29DNzJWWjJxSk9EK2Y3TDFoN3lWMXNLQzVO?=
 =?utf-8?B?UDIwSmN5aDZQV09nbGZvQS9JcVJFMlo2V0NyL2VhNVJmOWF0cWFQWlZXMC9F?=
 =?utf-8?B?NGJBL29tTjNFckRlSG5sZWhKUVA1LzZCUFlSK0dRVVM4UUV1cTFsMG1sbjZV?=
 =?utf-8?B?WWNwOGNGOVpjTm5DV2RsRWJqRHgzdFNIYm1IbmFUUHk4ZHpISDFybEphdGxO?=
 =?utf-8?B?Q1FkZXdjcU51R3MzLzB2V3R2SHYwNGYyaEF0U3NLc2tRVWYvbkFMSzFIclBG?=
 =?utf-8?B?dlFlMjRNM1lJUlBDRE5EYVYvZ1JRMFg1dGJHZFRJWUZFS0V0Lyt4cGtrZzUv?=
 =?utf-8?B?cmF1RGJQK3h0NW0xaFZ3Ny83ZFZiNjZvVFFpVWFKRy9ZRGtMc2VIZUtseDFQ?=
 =?utf-8?B?bHh5blpWN0pVUU8zcUtYZXF1NkR3MDZVUWhqM2ZPTzh3VDMrRkRpUllGdS9L?=
 =?utf-8?B?THptUUVpdlMyODhJMElrcWQzOGsvZ2FXNVZpc2hiSXZpMjFTVEVwWG90TVUv?=
 =?utf-8?B?U1NmeDZUcHVJMjBRZm1BaHB1VlF4azE0ckxzdXpiTVhMbDdvZGJ3V1ZWbkdT?=
 =?utf-8?B?QTUwWVQvT1RpOGN5aEVKMXlNOEZYWU5scWVZaFhxWFBmeWJSUnZQRi85d1oz?=
 =?utf-8?B?Znk3bGpSdTdLd1UxT1VKeXBSamJXSFE4WVl6N2ZONjF6OXdPSlFkSDIyaC90?=
 =?utf-8?B?dnllMGdRc1JhU2ovN2VnUEhvZWwxWkc5UURiY1U2OEQyd3ZxV211MWtnV1RL?=
 =?utf-8?B?MHNaVmNBdE9TcjAzUGxlcWlwQkR4bUh1NU9oRlVMZWtKWDkvYWFqdnd2YW9H?=
 =?utf-8?B?OU4wVnJ2OTVxMVp1MkEyR2xNNkJIRjNaelJzMnBRNE5Tb01PdDVVVzhXOTd0?=
 =?utf-8?Q?YMSnVvOB9dI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZZRGx6WkZKRTkwZUExd1dEUUdTbHdRRCtKdTNQaWtKRTBmanJnemtWUEtp?=
 =?utf-8?B?Wll4aGpUQ3k0RkI4SEw1OUpnV2I2UFpnQ2x1TDA2eWhEeXlzUDRZWi81Znl3?=
 =?utf-8?B?VWprZkVsR0ZEUFQ1NmROQXAyWXZvdmZFUjdka2tUK2JSV3dqOUJjdEJhWElo?=
 =?utf-8?B?WEo2SlVMaG9jRUliV3Y5OUQvckM5U2MrYVpXSFBMRnJFQTR4WWVvZmJYTWNS?=
 =?utf-8?B?TFlVckllSEZSQmZSS1NkcFdhR01jbk9JRjBuUzJuVW1TVE9jTktPNSs0dDRR?=
 =?utf-8?B?akF0Y0N5OGF4Mjh1MUFOK2NBd05INGgvbjE5SWREMWlsUVRLSFV3RFhUUTV4?=
 =?utf-8?B?ait2eUZkRis1cXU5ak5Ta1JqeTV3MGxKcnNtTDFmMDJaL1RxZ1JjWFJoYzls?=
 =?utf-8?B?RWhsdjF1YUJ1V0hqRjVCa1pWK29Ta3ZHNWV2YkxVdVNTTERXeHhUVDNwZzBn?=
 =?utf-8?B?WDhoeXh2ejRMWXNyazIzWVJlRVlIbis5NkZBcWRuV1djekdMZys4VW1pVVc4?=
 =?utf-8?B?L21ac2kvRXBMZlBIUHpYeFB5d3hrb3ZzRWVoUnJtaGg5Nnd2NWlMZVNBcjRx?=
 =?utf-8?B?d0xZVjh5QVNPd0VIc3NpWHF0SVhCUUg0b1pOekFDN3IvRHUydEplajdQM1Bv?=
 =?utf-8?B?Y0hOSmxPdG5YNGdlVDBDUlM2YWFQWUV1VnJBN1hRbHF2VEhOZjVIcHJNWEE1?=
 =?utf-8?B?aStZb1BxTk0wMjd0Q1NKbE1PbHpSVTZURTJwOHhtWEtPdGRIWm9RTkk1TVZO?=
 =?utf-8?B?TzlwakxOUW5Rb1o0VS9DeUZ3VjN6ek5VSzhCRnJkNEE4dUJvUWswQWVoTDJN?=
 =?utf-8?B?VzRTOXc1NGZUcFdGUnkzcTcyMTZJNjkvVmFna0YxL0VuUm9keHJLemJjSlNS?=
 =?utf-8?B?MkJlNGVHQWhQb2VMd1FieE5ZaE0rVnUzL3BralE4STFRNHhjajNNSTJVb21W?=
 =?utf-8?B?aldYY2FBYVR1bVdkYTl5UVo5RjYyV3hyc29sbzgrZHFjcFhyR2xqa0Exb0tU?=
 =?utf-8?B?UVJCbmsxaW5QTWlEVHZPbjhsWklwdTRvcFhHeUlyOUZYK3IzVXB1UmZJMHZC?=
 =?utf-8?B?UDlJdi9jMUJBaFg2YUFZa0N5K3ZEcXlvYTNidlhRU211QTNiZGVwOWlMVS91?=
 =?utf-8?B?UlA1WnJ6NkRDOXUrMTZsdEdPazFCKzVzK3RjeXFSMllFZFlVREw3NE8wOU4w?=
 =?utf-8?B?L2RIcVgwbnhNY1VwVlpBcEhOd2c5OCtOUGd0Z0ViWGFubGRHOEppYUNFTkhw?=
 =?utf-8?B?R2FHY2pyNzVXN0dGaEhVWHNkQ3NIdVplbGRkaE8wZVpuaHZMdWpnWnJVTkNq?=
 =?utf-8?B?RWhUZWs2cnp6RXNBSFMyRkt1V2M0U1dwSFQ1SDhHb0ZrV2lIVUJPeVZGOEVC?=
 =?utf-8?B?ejFPRDJqbS9JVmpRUS9YeXpZQmRPWUJBeHEvWWxvVE5KSVBTOGhHa3BjMU5a?=
 =?utf-8?B?d2xGa25sbHB0enFWVWpwWXVMTWZ2ZjVjdlNzd1lvRW82dlp5NVREdWFhTmlP?=
 =?utf-8?B?YWpXWnhCRCtVKys2L3JLK21Ddm1Rc0tUY0ZKWlRRbDB4Q1B6NTZ1ejNPZm5s?=
 =?utf-8?B?RXVlNGlFWTg1MG52OUhRYWZ4VlVsM2hvODhCdlk2YkNWeTVkUFRodzY3SXhG?=
 =?utf-8?B?TTZaUUlmTlNDa1hTL25vMUwwQWx4MnRnUEZiMVBLV0lkYkRmL0FQaFc0WndC?=
 =?utf-8?B?ejhKNit2eVIzd1MwdHBZeDlTRVVTdVUzRDZFcWlKOUZBczREQ2tNSWo5MW4z?=
 =?utf-8?B?SCtMTXJXRER0ZXRtSHFrNFdZMC9XSEdXZ29FL2RXR1VZdUNzeExFQ09Ydkx6?=
 =?utf-8?B?c21kaGRJR0hHOGthZndVS3dBUUtUNksrS0ZjYUxxb0lGcUZBamUzSGlpY1JI?=
 =?utf-8?B?THpuMjI0M0s1QTJjSDJIVytXZUFzSjU2eEpwQ01jZVkwYVNkeTZRRkRBT2FO?=
 =?utf-8?B?VHcwamdHU1ltV2dKQW9FU2c4RWFZT2EvV1d3S3RJOC96ejhmcUN4NVlhdDl6?=
 =?utf-8?B?RlNVVE96Q0dmZHRFREZRNjcvc2NYRnZzVHREaG8xVWltN1g1WG0ybXNTbkpt?=
 =?utf-8?B?OFRHWE53eTU2cU5PYS9BTDdUSDA0enBMdzVXeS9BNWlMWUdvdURxNm1pdGRE?=
 =?utf-8?Q?eitnERAgGQ9b3C+o2OggC9MVL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cecace6-8d01-4c3c-342b-08dd99cfaed7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 07:59:02.9159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpDbdWTpHFzh5xolLcRLP2TQr4L2KmyuHDlHOPCC0rWa3Ei0am1y1g/NAXobMZgQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346
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

Hi Tejun,

first of all thanks to Johannes and you for the input, it took me quite some time to actually get a grip on your concern here.

On 5/22/25 21:51, Tejun Heo wrote:
> Hello,
> 
> On Sat, May 17, 2025 at 06:25:02AM +1000, Dave Airlie wrote:
>> I think this is where we have 2 options:
>> (a) moving this stuff into core mm and out of shrinker context
>> (b) fix our shrinker to be cgroup aware and solve that first.
>>
>> The main question I have for Christian, is can you give me a list of
>> use cases that this will seriously negatively effect if we proceed
>> with (b).
> 
> This thread seems to have gone a bit haywire and we may be losing some
> context. I'm not sure not doing (b) is an option for acceptable isolation. I
> think Johannes already raised the issue but please consider the following
> scenario:
> 
> - There's a GPU workload which uses a sizable amount of system memory for
>   the pool being discussed in this thread. This GPU workload is very
>   important, so we want to make sure that other activities in the system
>   don't bother it. We give it plenty of isolated CPUs and protect its memory
>   with high enough memory.low.

That situation simply doesn't happen. See isolation is *not* a requirement for the pool.

It's basically the opposite, we use the pool to break the isolation between processes. 

> - Because most CPUs are largely idling while GPU is busy, there are plenty
>   of CPU cycles which can be used without impacting the GPU workload, so we
>   decide to do some data preprocessing which involves scanning large data
>   set creating memory usage which is mostly streaming but still has enough
>   look backs to promote them in the LRU lists.
> 
> IIUC, in the shared pool model, the GPU memory which isn't currently being
> used would sit outside the cgroup, and thus outside the protection of
> memory.low. Again, IIUC, you want to make this pool priority reclaimed
> because reclaiming is nearly free and you don't want to create undue
> pressure on other reclaimable resources.
> 
> However, what would happen in the above scenario under such implementation
> is that the GPU workload would keep losing its memory pool to the background
> memory pressure created by the streaming memory usage. It's also easy to
> expand on scenarios like this with other GPU workloads with differing
> priorities and memory allotments and so on.

Yes, and that is absolutely intentional.

That the GPU looses it's memory because of pressure on the CPU side is exactly what should happen.

There is no requirement whatsoever to avoid that.

> There may be some basic misunderstanding here. If a resource is worth
> caching, that usually indicates that there's some significant cost
> associated with un-caching the resource. It doesn't matter whether that cost
> is on the creation or destruction path. Here, the alloc path is expensive
> and free path is nearly free. However, this doesn't mean that we can get
> free isolation while bunching them together for immediate reclaim as others
> would be able to force you into alloc operations that you wouldn't need
> otherwise. If someone else can make you pay for something that you otherwise
> wouldn't, that resource is not isolated.

Correct, but exactly that is intentional.

See the submission model of GPUs is best effort. E.g. you don't guarantee any performance isolation between processes whatsoever. If we would start to do this we would need to start re-designing the HW.

We don't even have standard scheduling functionalities, for example we can't say process X has used N amount of cycles because that isn't even precisely know to the kernel.

When we would make the pool per cgroup we would loose the ability to quickly allocate those temporary throw away buffers which are mainly used for special HW use cases.

The important use cases are:

1. Sharing freed up memory between otherwise unrelated applications.

	Imagine you alt+tab or swipe between applications (which can be in different cgroups), and the old application frees us their write combined buffer and the new application re-allocates the same pages for their write combine buffer.

2. Switching use cases.

	E.g. developer first runs some benchmarks which uses a bunch of write combined memory and then starts gcc in the background (which of course can be in a different cgroup than the desktop) and that needs this additional memory.


That it is in theory possible that in between those milliseconds of the switch some CPU load could start to steal pages from the pool is completely irrelevant. For the second use case it is actually desirable.

If we would make this pool per cgroup we would actually need to add counter measures, e.g. separate cgroup controller which says how much memory each cgroup can hog and how much in total, and especially timeouts after the hogging cgroup would be forced to give it's pool memory back to the core memory management.

But I clearly don't see an use case for that.

Regards,
Christian.

> 
> Thanks.
> 

