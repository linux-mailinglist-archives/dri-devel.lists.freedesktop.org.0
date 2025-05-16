Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9626AB977B
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D8C10E140;
	Fri, 16 May 2025 08:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ku3cDlcT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFDE10E140
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 08:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGxTzh04UIWJrI2suFI+8gVXUCPlYIdv/13/Vco0LiUv+jKJRyF89KBOpVxqs9UL5dn6hSJCLO/SJ21WP85rzmdN0xUfJkOZizJeZhg43i2Rwpx0b8UHA6qvM3Q//ORAA/EX8DTt3MLQWNeLP1CEGXCS9PinxBAJ2cTgJnRkfVNt2DxwDpmJ5SVlYDjuzoDMnEAN5w4wlb8YtMUutUrDm2qR3hjxeMrqnDeSEYZDxSbel1aW/NO+wNgWqvrSGIpTPcTg+/e3lMSm9uD3uPA8IFUzXwwv87amM+tUrrN6tLLvL8lF9VWW4YXMhoEBl6ROdBkJ+JXPz5ZFk07FUxAvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf34iKisKqTRydRtOVPPVzvDFX5vnIREUbLUSL6Oypo=;
 b=DcJiV7hGKD580LKCpPyser0r6WEfvEy1prYALUE0I94IpvAcFrirlt/FyYl8ii2xZ5IGu+AR6Ek84rweLFbfsY4nuX1lIyqSWnIS8DIOiulQtEM8/PHWiXGcJWSHQANy+fx+7U0uKcXw54DuG70IHygC4Y4MAsGrpLInyyXQ1SrhSauGwNTMw+o2abmujpKaoENvLLnSLRo70sOAZDsWitEHmbWiRbvzt0tf4s3IKcOINOyrba/XE/MG11RBgyS7yjn1WL4UqM6VaKOOts3SAgm43kcJFvZNL8Iqrn0pkPlW462nOlGf9rByqdYuKYjmQO1WcSn5OHojGf09fdtfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf34iKisKqTRydRtOVPPVzvDFX5vnIREUbLUSL6Oypo=;
 b=Ku3cDlcT58vGX7l9RwxJgRb0XRRQUb+7RVuaKtJEqqeZMul3OxV6us671ohcdpu/zj3pgh135O56wqF96fzy3v9w04Dg3mGVi1K0Jh6jZa6A4uWbVaxCp+PSNcfe7J5zBGoCKYt1D/ll+7cI3RHPhDViQig7BFOSk7Qtv/a7+6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 08:23:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 08:23:35 +0000
Message-ID: <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
Date: Fri, 16 May 2025 10:23:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make pool shrinker more responsive
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e587116-1585-4b79-e3bb-08dd9452f35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnMzeTFkOXFaSXZ0UzlSODJBSWJvUm9Fcm9vbWRXdjRhbmx2aERwUjhjWjBo?=
 =?utf-8?B?TkdVMi9KQXJaYUd0b2llVkdRZnZ5NWpyNy9Xb0NtS2FKcHA0Q0lCSElMOEZM?=
 =?utf-8?B?UEd6YUNLWmJrUGtCR0h6eFI3Ylk2VklGZWpVMU5pcXdDaFhibDRFRmR2ZFlI?=
 =?utf-8?B?UzBpQm5OQlk1d0FqZm5HZ1NUQnpjdXI3N0NxNm5jSEJES0pwRXFpTERrS2h3?=
 =?utf-8?B?b3dzRDZOZEs2YkpCbThWYzhCTTdBNWhIK1ZnSWxqaEdUaWVicUhrNDNZcXpw?=
 =?utf-8?B?am8xbC83WllnR0tKK1BSOVNNbzZ2NEFINHM0M3gyWGJrWHFvcWxKdlhkTHU3?=
 =?utf-8?B?aFI0NnFTTGp4N3E4L2F4VW5wUGhnTlhjZ2NTYXZ0NnJtZ0c4b2dua29KcVZz?=
 =?utf-8?B?aWFFZlVXMXBnZllCaFVpQ2VXOFhIUkxqc3JaTUlPaWVzeFVCYjdVQ3ZMcTVR?=
 =?utf-8?B?TmM0OUtoUXJ0Zm5McWNDZXY0NWhMMXRRZzZEQklnUHdVSG1mMlJGWXFGY25v?=
 =?utf-8?B?Z0NKOTVCWGI0aDNYZ3pHWjE0ZjZwWjZhSWlkeWc0TzhJQkJXUlJEcWxSTU1l?=
 =?utf-8?B?TDhFZS9NRHl5NEZ3YzNheExremtlU3lYQ2gybWhiWVBCdFVTOHpqMERiYUo2?=
 =?utf-8?B?K1M0TXJOcGV4WjVKSWNET0daTEI3aUExUlZrK2d2WkorUTBQR2JGdHJ6dVNZ?=
 =?utf-8?B?TWJuTjhrVmpuVm9nNWhHK2NhZlQ2MVppQWNqbnhqd2htSXZ1SXVwKzRudVN0?=
 =?utf-8?B?V25vYXdMaTVkU0lMSmg5QVpHeHorQkhReitnalhlaGFKN0lON0h3ZFJFaWdt?=
 =?utf-8?B?azBlcGhGSXhiUWtWaHNKaWVDdDR0Wnl5dk53cmgyRjI1NUUvUE5FR0tkWDVI?=
 =?utf-8?B?TnhWWWdVaTI5N2V0RFVzd0JwTE5KWk85K2YzcHV0N3Y1T3h1ZHBERXMxTEhx?=
 =?utf-8?B?dC9Jby81Y1FONkhGeUc3WkF6UHVnS3g1VHRJczZ6bDMzTFBFVm1LcWtWU000?=
 =?utf-8?B?SVh2VlZIQUc3MXVma3Q4LzBOQnNsWDg5UFNmc1hyQXA2MVZnejhvNTc2OWIr?=
 =?utf-8?B?aTNZZ3ZNTDRoeEJGM09wMWYzWEhJdTFLTVZBQ3hCZEovdXAzdjNFVkxpZndi?=
 =?utf-8?B?c1RBUnM5MVU4K0E0ek13UnZaYkZzY0lVK3luUWZONngycnZlZ29jdnM5WDlw?=
 =?utf-8?B?WUcyUkJERGR3WExQaG13dDRWdGZveTNOM3BkY1VoSVhqazJkUHpKMXhKdVhE?=
 =?utf-8?B?alloVkt2NnFDVkhKdUVLUmJROEo3a3VKNGJORlFHWmlkNmhEVXFpT1kvbjB5?=
 =?utf-8?B?NXRmYnRnK3UzVkNzWUtQNXM1WGd1bHE2K25PWlBDTmhFV2JoaUZPZ0JuVGVm?=
 =?utf-8?B?SlNtZkhLcW1pWjliSXpSTUUvdS9LMjkvTlJRNE5rcm0yK0habEJiVFZsMGg3?=
 =?utf-8?B?U28zTUZ3djlMU3F6bzdVcTM4T1dYdlQwdGhPSHdNRG4vR0ZXaWR3b2hzMDgz?=
 =?utf-8?B?RTZhWkl2d2Q4ZHY4Zm5PeGdkUzVYS3J1NWZIeC9hYkc0REtJYmtvbVpMdmpu?=
 =?utf-8?B?M1VGalBVN0IvcW9Bbm9OR3Q0ZG9CNWhnaitHVkd1b2hONklsakxwSFV3aWRk?=
 =?utf-8?B?QmZlR2V0WTUyUVVCREhMeS9NQU4yTEk5UHNLV0h5WXVGOFJyRnFBTjFCRE9X?=
 =?utf-8?B?clBhamhKMU5SQXZReWJySEF2QXMzYVIzbThKRFJLUE0rY3VCVXFWTTkwZTcr?=
 =?utf-8?B?aVQwbFc4cGI3cFowYlJFK0RVdWYvNzR6ZkF4d1NjUkdZQUZWb2dUWUtHOGxL?=
 =?utf-8?B?b0lpM2FJVjM2WFRjU3ZVaDBxRGV4dHlHT3RhWWUvREVwTWhWN0NhRG9ka0Ev?=
 =?utf-8?B?RnFLU25GcnZZMi8yY3lMUHZNemR4SEVSNElBNURxZ3RmdUV1RGF5U2JBWFh6?=
 =?utf-8?Q?b7wj4GVjKXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGUwVE90QnJjVGI2RXJqL1dwM2hWK1lxRFcvVjM1MWNSRmR6bXJFZEl0bktZ?=
 =?utf-8?B?VFJiejZVR2JHRThQZHd1MEpQRkgraXppZjhsY3JteVcvTFE0T2sxZ3RmdWFy?=
 =?utf-8?B?MVhvUC9mZHN0U21kQlpWcU83WGNld1JyMGJHL1ZTR3NPVTJMYUQ1TnZPTlk4?=
 =?utf-8?B?RFRSV0I2eXlkaXRQRE90QU9SbWhCU2cycVQ2VWhVNE9hZThyckN1ZlZ6TytG?=
 =?utf-8?B?U3hJZXhZOXhTd2p5Nk9WUkxZVHRBam5uVGkwTkFHa3IzbmVJbXlyNFhqTHY5?=
 =?utf-8?B?S2xLditvYUFaZjlJSnEvbVRKUTA5N1VCM1JnNmFOSWJuZFo0U3N1dUw0YWFZ?=
 =?utf-8?B?UjlsMmw3TksxOW5GdVJIZUd5R0oxOXhVcmI1S1NPZDRkUEdwb3lOZ3pXN3dy?=
 =?utf-8?B?YkxwOVlLUkt3QWhKaFpSV1pOV3VrdUNhaFJFdjk0OHBlMitjRzZVTGtqY0g5?=
 =?utf-8?B?M3pmancrSTVudGNLOWdQeWtDU3l5YnQ3WngvbjVyKzF6aVdnN2JWbGQzd1o4?=
 =?utf-8?B?REN2NDE2TlFORmJwVW4yQkl1enNNMHZkSFVtbnc3cFIwQVdNblg2dmRxR2Nk?=
 =?utf-8?B?SG9DK0FEOWgvSjgycVk3Wk1QZExsd0FnbUc5cjRqT0g1M2s0QWd2QnRiOUpM?=
 =?utf-8?B?NkU4UFpKTGtKV3l2Rm9uS1dVTXVNZVhobFdQeUdXaklaTU95Q2x5Ukt6eTZB?=
 =?utf-8?B?R2NEbWxDbk0yNWUyWTdlYWNEODc4a2UwWnFlQXI5amUxQzJKQ2grR1dQQnNx?=
 =?utf-8?B?OG10WDVIZS9GSGdMdGFmb3BYbmR0VEpINnJ6SGFRRGZwQnlwblRrR0N6bWtL?=
 =?utf-8?B?TEo0Nnl3elh3K1pyY0Zhc0ZZUklXNnlSM0xaUzZZSzV0bERDSFRINExuNWk4?=
 =?utf-8?B?TkVDQkN2TFhIM0JJd2xyUU1pWGllenQxTTNaZzZtdVljOUV3bEN2R2VCRkdJ?=
 =?utf-8?B?eU4rRzcyc3NPcDl3S25RQVRXNU1ENTJGUVJQREYzV0lXTjJkcmV4QXJEaUlt?=
 =?utf-8?B?amo1VS92VCtKK2RuTm1CdkUrcHRnTEdia1Jnc0N5REgyUlpPY3l3Q1dOWXE5?=
 =?utf-8?B?U0RiR1BpaWxVNm55N21TTUFjQkNsNCsyUGhWeXgrMEFyNk45MnFVSDhrMUNB?=
 =?utf-8?B?eDVRaEllYytpdFpiZzFCTG0wUzRQMkk3eHJNQ2U2VjQ2Q1FpNjBxbW5TcW5p?=
 =?utf-8?B?YTlRaXBJaXFycldkN1BZTTVpbkxBcVRBbXdkUVpYNjc3ak5ZQzRMU1ZWUEtN?=
 =?utf-8?B?bGtGcDgwTERZU3pIUWxBdEZvQ3p1YUZTMjhDNGxPdndkVlV1QVNnS1NtSXJS?=
 =?utf-8?B?MXNwMzZrT0UzUHZ5L2srSWI1SmpSSDN3eksrd2lPeUdvUFhmTk9teVE3dGcx?=
 =?utf-8?B?Q3pGQVpjUXdzaHNPUk4yL1c5c0xBd2pDeFNrUG5kNzB0TjdpM0tBeldxd1NS?=
 =?utf-8?B?SnZLZXZOS1JLNXFqU1VBcVprV3J4YnlEZGovUWgvSmZsNzlmWHdXbEwrdTl3?=
 =?utf-8?B?WEIwRUt4bVUxb2Zva2dPaDlmdlJ2UjF4cm1KR09ISkdZdEVETmNaM2o4NmNB?=
 =?utf-8?B?NnViczk2OTJPYXhGWDFlRzFEeXVGVnI2cjYrT0pXejIyU1lwSmkySm40WVdi?=
 =?utf-8?B?Q2FIek9FSVdGNTVrT1pUV0lFK2I3REZXRWlNczk4TlRHcExGQmlld3R4eVNX?=
 =?utf-8?B?VjlrOFFQUEVRZnBLemZVbDVjTzJ4UTh2aFlnQWhVYzFiTXl3cXZpMDRsYVJN?=
 =?utf-8?B?b2VNVmprU3dQY1NxdjhUWU9ka1dEZ1JnSkdrRjZ4aHUxRXRUaVl5bE9WTm9V?=
 =?utf-8?B?dzdTTTlKaGF4a3ppQ1Fhc0ZPYURaQTAvZURDNnJKMzBKbXZ3RU5lUks3ZHNZ?=
 =?utf-8?B?YnVoUzduV3g5d3E1RGVjUG81SEpWMTcwRkk3bjBVT3pOa2dSN3FFM1dITHJl?=
 =?utf-8?B?TysrQkNHYTJOdXRUWlVQdThDSC94dnFUdkRZcFlvclZlRTFrWktzbmt6dXp4?=
 =?utf-8?B?RS9vcGJvdXhYNHh3RFRKcXFWaWtsSTcreTBDd2h6VW1XRTlHNlJ5YUt5M29B?=
 =?utf-8?B?ZnJuYlVzQVVucnZXdyt2MURya0xtMVBxeFcvY1RiWUk4RndTNmp5UzRMVVMr?=
 =?utf-8?Q?k4h9mj9/q0wjj6Dv/FalSTAcL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e587116-1585-4b79-e3bb-08dd9452f35c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 08:23:34.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jwar9DdjGruBN/kaYTU7AFLGneQ4bnvOmzZwTTqebVK/VRAupxwVuDMt13A/4xSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588
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

On 5/15/25 22:57, Tvrtko Ursulin wrote:
> Currently the TTM pool shrinker ensures it frees at least something every
> time it is invoked, but it also lies to the core a bit on how hard it
> tried.
> 
> For example core will ask it to free SHRINK_BATCH pages but the shrinker
> can, due how it walks the LRU list of pools, free just a single page and
> still leave the core thinking it expended the full SHRINK_BATCH effort.
> 
> Apart from being inefficient in terms of number of calls to the TTM pool
> shrinker required, another consquence of this is that the core can abandon
> the shrinking attempt too early due thinking that the whole set of
> freeable pages has been scanned.
> 
> We fix this last part by correctly reporting how many out of potentially
> freeable pages have been scanned.
> 
> We also do the freeing in an aggressive manner, considering the scan
> target as a free target, to ensure walks over pools with unfreeable pages
> do not cause no-op calls into our callback.
> 
> And finally we customise the shrinker batch size based on the median pool
> order and the total number of pools, with the aim of searching more
> possible pools on an average invocation.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 39 +++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c2ea865be657..a76fe5f95781 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -368,7 +368,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  }
>  
>  /* Free pages using the global shrinker list */
> -static unsigned int ttm_pool_shrink(void)
> +static unsigned int ttm_pool_shrink(unsigned long *nr_scanned)
>  {
>  	struct ttm_pool_type *pt;
>  	unsigned int num_pages;
> @@ -380,16 +380,15 @@ static unsigned int ttm_pool_shrink(void)
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
>  	spin_unlock(&shrinker_lock);
>  
> +	num_pages = 1 << pt->order;
> +	(*nr_scanned) += num_pages;
> +
>  	p = ttm_pool_type_take(pt);
> -	if (p) {
> +	if (p)
>  		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> -		num_pages = 1 << pt->order;
> -	} else {
> -		num_pages = 0;
> -	}
>  	up_read(&pool_shrink_rwsem);
>  
> -	return num_pages;
> +	return p ? num_pages : 0;
>  }

That change here doesn't make any sense.

Scanning a pool type for pages and not finding anything doesn't mean we have scanned for freeable pages and then not freed them. 

>  
>  /* Return the allocation order based for a page */
> @@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   */
>  void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  {
> +	unsigned long nr_scanned = 0;
> +
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>  
>  	while (atomic_long_read(&allocated_pages) > page_pool_size)
> -		ttm_pool_shrink();
> +		ttm_pool_shrink(&nr_scanned);
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> @@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>  
> -/* As long as pages are available make sure to release at least one */
>  static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
> -	unsigned long num_freed = 0;
> +	unsigned long to_scan, freed = 0;
>  
> -	do
> -		num_freed += ttm_pool_shrink();
> -	while (!num_freed && atomic_long_read(&allocated_pages));
> +	sc->nr_scanned = 0;
> +	to_scan = min_t(unsigned long,
> +			sc->nr_to_scan, atomic_long_read(&allocated_pages));
> +	while (freed < to_scan) {
> +		freed += ttm_pool_shrink(&sc->nr_scanned);
> +		to_scan = min_t(unsigned long,
> +				to_scan, atomic_long_read(&allocated_pages));
> +	}
>  
> -	return num_freed;
> +	return sc->nr_scanned ? freed : SHRINK_STOP;

That again doesn't make sense. That we only find pool types which don't have pages doesn't mean we have scanned them.

As far as I can see the existing code was correct after all.

>  }
>  
>  /* Return the number of pages available or SHRINK_EMPTY if we have none */
> @@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>  /* Test the shrinker functions and dump the result */
>  static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
> -	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
> +	struct shrink_control sc = {
> +		.gfp_mask = GFP_NOFS,
> +		.nr_to_scan = 1,
> +	};
>  
>  	fs_reclaim_acquire(GFP_KERNEL);
>  	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
> @@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  
>  	mm_shrinker->count_objects = ttm_pool_shrinker_count;
>  	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
> +	mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;

Since we install only one global shrinker for all pool types, which might contain everything from 1 page till 512 pages, this seems to not make sense at all either.

What exactly are you trying to do here?

Regards,
Christian.

>  	mm_shrinker->seeks = 1;
>  
>  	shrinker_register(mm_shrinker);

