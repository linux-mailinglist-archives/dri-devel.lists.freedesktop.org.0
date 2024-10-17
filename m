Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70B9A1C3D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 09:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1850310E7B5;
	Thu, 17 Oct 2024 07:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g8n8aYnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CD010E7B4;
 Thu, 17 Oct 2024 07:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n93WxdVp93NeYoCE1dQuzzUZxkeejg7+3+7Cm0GqColzVS0YRkgqe1RVnSiJ9KxWRYVcbfCEm2f9eiWW4ox7x2n27Az6/N14cEcyKypnLWTmKD/PSUpa0ydaCYekvy6EDNhXMsaUGGTotL3OAP+Y8AtUIfHexdONa/0Hxd8lDgUca1Ewx/Xkl6bbyWYRV5YdKvzLhdtTM0ctoExebgFjKgeCmLFCYnf83SlIkoke2LNshK+u4rkoC/eB2mPoCVMcV89UJ3DSdsXvh7JkgYk3lAA7ddxrsoVUyB2cxU0ui+23DEdio6idlNG4+2IWfolHhF57oUhXHrDyH8wFhLZ9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtciJvTw6sXJJ0DPXoLPNdRorlLls+O+sOCaFYjnCRU=;
 b=ork8m5lZ4kF6v1ghAYSL/9mx8C0N6mY1xGS0+3ynJWDVHSDok3VTbSyX+gqN7qdkfzo7gGrFCOF/uXmoL7oESIlcrcIPB36pCYJ3LznoopDwg5HfoBUNPamqi4wyoPPpAODgPb5jm210kFM1Mk/rumAwYNKqbGQS3qr6nykfPf68nxJlGYZaTig7jl46I1PJXnFROGyQGtT5T5cJKeu5xlaPjWHqnNx2wNJErOCK2UNMzTUDw5X1b3+i5uKAzXpFDvstkIE88KTi/3tzSeTdi8kF8eO4hUNck0cDFVXhgQCgfCWNDVwICaif/z/35/0lmd7h50wuE2AEoIcYodlWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtciJvTw6sXJJ0DPXoLPNdRorlLls+O+sOCaFYjnCRU=;
 b=g8n8aYnMV5ONeUQMhV7XRhJ2meYOH2ECXnxGndomeSGtIzcoBfonOPfxUTEaKr3ibQa7ybZFiMjXDsXj7btMlMotq1XLqCNawb8vJNYDcit8mCtA0QItibOcSN+QDraLLL9NCPfzDbJbNLJHn5GlFrIsjikkhwvcspp7z3zRJ+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 07:59:27 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%6]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 07:59:27 +0000
Message-ID: <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com>
Date: Thu, 17 Oct 2024 09:59:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com, maraeo@gmail.com,
 friedrich.vock@gmx.de, michel@daenzer.net, joshua@froggi.es,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ca235-90ea-440f-8823-08dcee819f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHI5VEJOSTcxQ2drenNDU1pIQjh2UmcybzljR2xoQzQ4cDJTUnh3MkQwWlNk?=
 =?utf-8?B?b0Y5ejlqTmF2WHdPQTlHRnQ4RWIrcEJYV1BXb0hkRWZzQ3dVaFNPeDdab0VZ?=
 =?utf-8?B?ZElKMDRmVGxiR05rUzJVZGJzQlBDT3Z0T0hsdUVZLzVIcVEvdTJuTE8zdmUr?=
 =?utf-8?B?Q3N4VWJpWHZrRGI5cXFhcFdxNzFCdUYxeDE1UDg4RCtMYUJsb0NlRTU5Nm0r?=
 =?utf-8?B?dVhCTFFhSkVvdXNjSXN3Tml1aEdqa0xFc0t4clFEbzF4bmFhZ1RXejhuenhQ?=
 =?utf-8?B?QWFNUStCd2VlbWVPSmxRS0UyOHFIYy9aVlg5MndxdjVybFdWSXRtS1VpSGhR?=
 =?utf-8?B?VGlnb3FmVXptWjBZL3dPWFRTbXBpYjBweDZ3c3A0aC9XQ0RSSDJvUHdqSHk3?=
 =?utf-8?B?SjJEYXIxRXh6YWtsQ01mL21wQ1JzRE4ycXpQUWcyQmNlNlBYazlCZFdEa001?=
 =?utf-8?B?bUVDY2RpamhsbmttL3gxZFYxbFkyODVJdlpwYVpsdVRuUFNUVXNvYy9Nb3RW?=
 =?utf-8?B?ZGg1d2lTcGhxSWZUWTRvamc2QUNuMmVNUUhHZ0x1YnNFZE93ckFxVXhvamR2?=
 =?utf-8?B?dW40aEFPMVJYT2RNUmFLQkQwVDBvSS9MZlphOVhBNVVxS3B5Z0I4UzhibUU4?=
 =?utf-8?B?M1lqS3QwdFIxU3RMM25yUjRLdFBzUEd4clE3cVpRdk1UaHk4Q1JNbzdWWGNh?=
 =?utf-8?B?M29OYVpOeG16L0tBbWVSRWV3YlpReStWTUFpWkExNUkvdE14L1NTRWhyRHhX?=
 =?utf-8?B?dHl2UURTbkw2ZlVIeUZQd2JpaGNaOUtnZ2J2Mm1UTFZQNVlLOWVMSmNVRlBH?=
 =?utf-8?B?VE5CUGRPVmhlSTFDaHJvYmpaRkdHams1d01CSit0SkhBMmJVNk5OTE02SVhW?=
 =?utf-8?B?ZUJ4eFovWW9lOURtek5sbk44cVNlRmlZc285elVFWS9haThKRTFkbGxqbENp?=
 =?utf-8?B?RGkxbUZDN0Q4ZVdLcnRoVVdpS040THVQenZVemp0dnFSK0ZockZsRWliZ0M0?=
 =?utf-8?B?UzRjQmpCMzRpWjNISUpuV3ZEZXZWeU9HRHBsdVM1MEFpU3VnaWpiK003Yzd5?=
 =?utf-8?B?aFJIOTVsVkp5d2lTT1FqVWVvK1JtS2NUak1BdEw2cGFTRDd1MXlXWWl6NlZj?=
 =?utf-8?B?eWdya0IzdG9wc0Y5NXp4RGFmeDlmaThzd0kyUzg4bEFEUmRqV1Q0QTBlSStI?=
 =?utf-8?B?cGpackYvY1B0SWtpNndmblhqdjByOXBObGU0MHRqSjZlZHZ3L2ZOODh3U01M?=
 =?utf-8?B?VGpGZUFVSFhpdDFhdmRLM25EcXlpcGlhMFJlT0hWWmFuckMzaEZRTTFlQitv?=
 =?utf-8?B?T1h5WjdoK2htZ2hEcFg0cFhMa2JGTnBKdUxuS0NjL3Z6OWh1S3BMY2VlbWU0?=
 =?utf-8?B?Y2FqemZJMWZjZ2dmWWUvZkZtMGorb2pHMXJFNmlGU0E4ZGdCSml2QlBSQlMr?=
 =?utf-8?B?MWZHQ1lEQ1d5SzhlVjE1OG9XemhiTUVtNklOS01VYVdhUHRZdU5TYmwvZE5L?=
 =?utf-8?B?U05Edzhwdkl5bzVWZ1hEU3E5RDMvLzNzQVUxUE55eGY1RHZ5eHloVE9JQlpu?=
 =?utf-8?B?ZVJNR1VwcXh6bml4OWtmYTJPd0s4K0tUbXhJQjJWeTRxSUFuM3N6eVJSSDhs?=
 =?utf-8?B?YURVd0dZMTluRnJQS1NWOHpFeUE3SzBUZnlJWXdvbEhGMmJTK0NEaUxJaUpp?=
 =?utf-8?B?YmNvTm9jQlB4VXZoa3R3N2dyRGNITFp6c1h2WEcrMG1nTkQzNkp4TEdXYTM1?=
 =?utf-8?B?NTFLTERuUmsvOXNLNkkxNlpKOXp2aW5IYlZQT294eXJxekFCZytxMjVSYVFF?=
 =?utf-8?B?bGhDbWZGOUZoKzc1NjFlQUFxSWF6VUZnV0R5V1R0L1paMDFZbzZvTFZmeWgr?=
 =?utf-8?Q?Co1HYhD8qf4Mz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjJVdmFsdExBUHBaQjV5MElxLzlDQjlmV2FCdzE2SEp4THdGeDR2RU9Rb2ZF?=
 =?utf-8?B?eGpGNG9PQkdOOVE1b1VyeVZERVJoRUg4NTB3d3BWcEl1aEFtaHRGNkM4SHpp?=
 =?utf-8?B?bkk3S0t2S3Y0NkE2WjF0UHlVTWp5V2NCcEpnY0Z5S2ZTVFhxSnMvNkpVLytI?=
 =?utf-8?B?ZlBGRkNOdkQ5TEdTbXl5TXhncUIyUmEyd1Z2aXhFdXEyL2hzaE9LcG9sNWxM?=
 =?utf-8?B?M0NKSndsRk4wOU9FRnUzSzFyYUVRUE51RkNJc3MwTUEwbWt5bHI4YlVNUUJR?=
 =?utf-8?B?THlnUkI0WTgwbnBRQlVxMzBZS0oyQ2RRbUFsSFpsM0J0Q01ndHRpL3ptQ2VH?=
 =?utf-8?B?N3RzR3J6TU1LanQ0U3pwVTNTTWlBVkpMVDRwaDdubVJ3T0NFL01HbVhGTHNN?=
 =?utf-8?B?b09lR2hwT2NVQmJVNmJ2OVA2OGlhaDFmc1ZCdy9qVUhScWxycFV3MHNxZXVC?=
 =?utf-8?B?d1ZaU2tiVStZQmZkRTVUQUdRK1RjemlSMnBITU5vMVBobXhWTjdmajZNaisr?=
 =?utf-8?B?VDlPS2R3Q2p6SHI5TDNwcGhsWHM5Nm9vbE1kMmhCR0E5UFBvOFh6ckk3R0pE?=
 =?utf-8?B?MUV4YjRTVkVMTkJyaEp5ZHpiaHVWVmlyaGljUENWQUlHNGtGbmFGQ2x5V1Jz?=
 =?utf-8?B?SUpjNTVKK1lMRWhIV3VmVFJIdlVlclJwM09TSkltR3h5ZURWWGdCeTZxSHFF?=
 =?utf-8?B?WWxHMGxaYk5HSyt3N2NLaE03NVg4REhyRytsdWUrcXM4ei9JNFN2aE9LOXYv?=
 =?utf-8?B?LzZOOVAzTW5NbXIrZGI5TmY4MWFGRUVNanlLMzYxZ2NxSDBUQURwVU5pT2VV?=
 =?utf-8?B?VGNjSVNEMGhCSEdDTUdFSHIvendkTmd6REtUVGlwNGtxR1dyM05wYm5pWStF?=
 =?utf-8?B?WlhyZnFhbHdrSlRxZzFwNFY1Q05BQXh3V1hKUitaWiswZGgrSFY1Q1hNN0VN?=
 =?utf-8?B?Ujk5cGViazAyU3RxZGxpYjRERWxhOWEvMENkeStXcFZNYlZLTHZnR0JpTlVN?=
 =?utf-8?B?SjVFWjJUOWI2WCtxdUYwSDV0OEM5MjBzQm1pc1lzWVJNeGtkeUc0QmlqQXZC?=
 =?utf-8?B?aWZhMm1CU2Z1TmNLcWpRcFBTM2lBQXJKNzR6WWxnVnNmVjU5L3BqbkhDZHZn?=
 =?utf-8?B?WCtwYWx3Yk82a1Zva0hvbzh3ODJEUXVTOHYvTmhHU0JNdkRXenhIdXpmMzNL?=
 =?utf-8?B?eHJYVGk2M281ejlHZTNML3RnZkFZbTA5WGtJTmZabmRuczlhREpLNThheG9o?=
 =?utf-8?B?VkRDWTB3emRQbjhPN2l2ZUt0eVlsYXlQSnBQUW5xa1VPT3R5RWs5azkzcDhw?=
 =?utf-8?B?bmRWTzE3TlB3bEpzK2ZRaUx3LzlKRU4xeU54L1hiZ3lXUDlZV3l0YitvR2hG?=
 =?utf-8?B?UFAyM0RWOXo2RktJQzNBcVhRUTJRbnBIV0JnVmR0ckcvNUxWWWJDdTBTNGdr?=
 =?utf-8?B?T1o5SjZ4U2tXQ1dBOUNUN3BsaGFPREVTZVMrMzZDd2Q0K1FFbFlUenlIRlRk?=
 =?utf-8?B?anRSSEI1QXovbVhiRVFiRnhUNHBSOWtjTTM5QjVYV1grQ29WZEJqdStQWGNZ?=
 =?utf-8?B?VGhjNDAvR3FKQnN3K1VxQmdKV0VwZkVvQ2VGN1dUSTdsaEpnZ0tyelhsTXRP?=
 =?utf-8?B?QURXUy92WnZaVzRSWEtzVDdSMlRpRnJrZHNEZnlaekNMdWxKNDAxY0p4WThn?=
 =?utf-8?B?WkdEODd2SVloYmpmQmRnM0ZPRFlycnhtcXBoZmxzc1ozNnh4ZGljU3FoVTJJ?=
 =?utf-8?B?NWV3aWMzdUMrQUliYWlHbWhUUnJ4SHRVenVQd08xRG55NzJXa2ovZHQ3bGNH?=
 =?utf-8?B?WkJSUU5XNFJCeTN3aG9JWXBtVXpxeSt5NHd5a1VMMGljNkc3dThPT0Q4d2FQ?=
 =?utf-8?B?ZzM3SFlaMkNtQXpRT0RPU2lnbWNrZGdCcHhVOEhWc0ZhVmx5cWdXTUJ4VlhF?=
 =?utf-8?B?WW1sTWk1b3Fodk5qaVQzczlpUUUzK2VMQ0k3allObkFjaEw2KzRMZkdMMzFU?=
 =?utf-8?B?VFluaG1VN2sxMTFHVGtHZXo1dnhlVW84OHFaRGs5MUVFWms2YjBzeUluT0cw?=
 =?utf-8?B?NUZjZXIvVzBLL3pIL1Q3THV0N2FQUlVQaW5iNlBQeVo2YTM1UDFORWxYNzJK?=
 =?utf-8?Q?Nj9EKcshwHaTw/FHG0b6GXwcm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ca235-90ea-440f-8823-08dcee819f28
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:59:27.0784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxrVT5AUqhiICCDh7Y65ruMDU3JvaxPfuGb2Ya9jyofVOfNd4hVkj45tvmx0D1ie
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152
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

Am 17.10.24 um 04:47 schrieb Raag Jadav:
> On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
>> Introduce device wedged event, which will notify userspace of wedged
>> (hanged/unusable) state of the DRM device through a uevent. This is
>> useful especially in cases where the device is no longer operating as
>> expected even after a hardware reset and has become unrecoverable from
>> driver context.

Well introduce is probably the wrong wording since i915 already has that 
and amdgpu looked into it but never upstreamed the support.

I would rather say standardize.

>>
>> Purpose of this implementation is to provide drivers a generic way to
>> recover with the help of userspace intervention. Different drivers may
>> have different ideas of a "wedged device" depending on their hardware
>> implementation, and hence the vendor agnostic nature of the event.
>> It is up to the drivers to decide when they see the need for recovery
>> and how they want to recover from the available methods.
>>
>> Current implementation defines three recovery methods, out of which,
>> drivers can choose to support any one or multiple of them. Preferred
>> recovery method will be sent in the uevent environment as WEDGED=<method>.
>> Userspace consumers (sysadmin) can define udev rules to parse this event
>> and take respective action to recover the device.
>>
>>      =============== ==================================
>>      Recovery method Consumer expectations
>>      =============== ==================================
>>      rebind          unbind + rebind driver
>>      bus-reset       unbind + reset bus device + rebind
>>      reboot          reboot system
>>      =============== ==================================

Well that sounds like userspace would need to be involved in recovery.

That in turn is a complete no-go since we at least need to signal all 
dma_fences to unblock the kernel. In other words things like bus reset 
needs to happen inside the kernel and *not* in userspace.

What we can do is to signal to userspace: Hey a bus reset of device X 
happened, maybe restart container, daemon, whatever service which was 
using this device.

Regards,
Christian.

>>
>> v4: s/drm_dev_wedged/drm_dev_wedged_event
>>      Use drm_info() (Jani)
>>      Kernel doc adjustment (Aravind)
>> v5: Send recovery method with uevent (Lina)
>> v6: Access wedge_recovery_opts[] using helper function (Jani)
>>      Use snprintf() (Jani)
>> v7: Convert recovery helpers into regular functions (Andy, Jani)
>>      Aesthetic adjustments (Andy)
>>      Handle invalid method cases
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
> Cc'ing amd, collabora and others as I found semi-related work at
>
> https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> https://lore.kernel.org/amd-gfx/20240725150055.1991893-1-alexander.deucher@amd.com/
> https://lore.kernel.org/dri-devel/20241011225906.3789965-3-adrian.larumbe@collabora.com/
> https://lore.kernel.org/amd-gfx/CAAxE2A5v_RkZ9ex4=7jiBSKVb22_1FAj0AANBcmKtETt5c3gVA@mail.gmail.com/
>
>
> Please share feedback about usefulness and adoption of this.
> Improvements are welcome.
>
> Raag
>
>>   drivers/gpu/drm/drm_drv.c | 77 +++++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_device.h  | 23 ++++++++++++
>>   include/drm/drm_drv.h     |  3 ++
>>   3 files changed, 103 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index ac30b0ec9d93..cfe9600da2ee 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -26,6 +26,8 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>   
>> +#include <linux/array_size.h>
>> +#include <linux/build_bug.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/fs.h>
>>   #include <linux/module.h>
>> @@ -33,6 +35,7 @@
>>   #include <linux/mount.h>
>>   #include <linux/pseudo_fs.h>
>>   #include <linux/slab.h>
>> +#include <linux/sprintf.h>
>>   #include <linux/srcu.h>
>>   #include <linux/xarray.h>
>>   
>> @@ -70,6 +73,42 @@ static struct dentry *drm_debugfs_root;
>>   
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>> +/*
>> + * Available recovery methods for wedged device. To be sent along with device
>> + * wedged uevent.
>> + */
>> +static const char *const drm_wedge_recovery_opts[] = {
>> +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
>> +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
>> +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
>> +};
>> +
>> +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
>> +{
>> +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
>> +
>> +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
>> +}
>> +
>> +/**
>> + * drm_wedge_recovery_name - provide wedge recovery name
>> + * @method: method to be used for recovery
>> + *
>> + * This validates wedge recovery @method against the available ones in
>> + * drm_wedge_recovery_opts[] and provides respective recovery name in string
>> + * format if found valid.
>> + *
>> + * Returns: pointer to const recovery string on success, NULL otherwise.
>> + */
>> +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method)
>> +{
>> +	if (drm_wedge_recovery_is_valid(method))
>> +		return drm_wedge_recovery_opts[method];
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(drm_wedge_recovery_name);
>> +
>>   /*
>>    * DRM Minors
>>    * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
>> @@ -497,6 +536,44 @@ void drm_dev_unplug(struct drm_device *dev)
>>   }
>>   EXPORT_SYMBOL(drm_dev_unplug);
>>   
>> +/**
>> + * drm_dev_wedged_event - generate a device wedged uevent
>> + * @dev: DRM device
>> + * @method: method to be used for recovery
>> + *
>> + * This generates a device wedged uevent for the DRM device specified by @dev.
>> + * Recovery @method from drm_wedge_recovery_opts[] (if supprted by the device)
>> + * is sent in the uevent environment as WEDGED=<method>, on the basis of which,
>> + * userspace may take respective action to recover the device.
>> + *
>> + * Returns: 0 on success, or negative error code otherwise.
>> + */
>> +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method)
>> +{
>> +	/* Event string length up to 16+ characters with available methods */
>> +	char event_string[32] = {};
>> +	char *envp[] = { event_string, NULL };
>> +	const char *recovery;
>> +
>> +	recovery = drm_wedge_recovery_name(method);
>> +	if (!recovery) {
>> +		drm_err(dev, "device wedged, invalid recovery method %d\n", method);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!test_bit(method, &dev->wedge_recovery)) {
>> +		drm_err(dev, "device wedged, %s based recovery not supported\n",
>> +			drm_wedge_recovery_name(method));
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery);
>> +
>> +	drm_info(dev, "device wedged, generating uevent for %s based recovery\n", recovery);
>> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>> +}
>> +EXPORT_SYMBOL(drm_dev_wedged_event);
>> +
>>   /*
>>    * DRM internal mount
>>    * We want to be able to allocate our own "struct address_space" to control
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index c91f87b5242d..fed6f20e52fb 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -40,6 +40,26 @@ enum switch_power_state {
>>   	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>>   };
>>   
>> +/**
>> + * enum drm_wedge_recovery - Recovery method for wedged device in order of
>> + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
>> + * Drivers can choose to support any one or multiple of them depending on
>> + * their needs.
>> + */
>> +enum drm_wedge_recovery {
>> +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
>> +	DRM_WEDGE_RECOVERY_REBIND,
>> +
>> +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
>> +	DRM_WEDGE_RECOVERY_BUS_RESET,
>> +
>> +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
>> +	DRM_WEDGE_RECOVERY_REBOOT,
>> +
>> +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
>> +	DRM_WEDGE_RECOVERY_MAX
>> +};
>> +
>>   /**
>>    * struct drm_device - DRM device structure
>>    *
>> @@ -317,6 +337,9 @@ struct drm_device {
>>   	 * Root directory for debugfs files.
>>   	 */
>>   	struct dentry *debugfs_root;
>> +
>> +	/** @wedge_recovery: Supported recovery methods for wedged device */
>> +	unsigned long wedge_recovery;
>>   };
>>   
>>   #endif
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 02ea4e3248fd..d8dbc77010b0 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -462,6 +462,9 @@ bool drm_dev_enter(struct drm_device *dev, int *idx);
>>   void drm_dev_exit(int idx);
>>   void drm_dev_unplug(struct drm_device *dev);
>>   
>> +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method);
>> +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method);
>> +
>>   /**
>>    * drm_dev_is_unplugged - is a DRM device unplugged
>>    * @dev: DRM device
>> -- 
>> 2.34.1
>>

