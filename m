Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10DAD0456
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 16:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD7F10EAD2;
	Fri,  6 Jun 2025 14:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nwd4M0rx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7FF10E3BA;
 Fri,  6 Jun 2025 14:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEBRQHdyEylNtdD/ogQSkp0KIuOzThoMlIoxNctL6/hO0yJk6/62/kKTuUwHN5CDMcmc4wvonxjGF7sZm8nru2rHvuqCEc7jYbCOyGLm9LcsD1Odi83EAcc0X8V4J+84u+2upgZgliP3RwZHXbT9Bz9s/gU70upuEP+4tYmPw85hJQhTVsMqmx5Y6e0fdByMAT2wVoL2sX9Ng1yL7BDjMixrmc1FN5BsBgAjmMR1vBVtQcFyUEXLF0zsGlEX1sIZaIY8Go57uURfJjfZboc+S14sB6NQvGPXVzvqbtucVMM9WKMQmMW+vQ/U4IKmjLv3kiPZWOfW4ilBL+/OXOk/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQcIp+09qq/oG+Lqkcv4qvTHvgnr1G3PgBCBMHhest8=;
 b=Yuc/mJTc970Uh13vYGrIFiapoorIFGTCZCE82FXrVIpSV+X0JVXEUPoOIv6FgocAw2Xr4x3H6r3I/6fSz1ynHxpBdYv/59pu1X2R8lHCGnr1AGkPbETg594rJJ/TsVO3erMEysaAAxPTB7qahKnIhBmuySlWGKZf4im5dhEffGXI3nQeAFbO3kHpm2pdcHMy592kcEHFf5mDYRSGVFjASBHAHakTaBHtf67r2GfENuF+O1uOmzMYOSnt3msOUMdG6FzamRqgbrxmtZeSymi61SzEEZJxaVtLr4PocBzs1MB32yai/db7lqG22snhL4wlVqsY31sByVlDRyH1PPabLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQcIp+09qq/oG+Lqkcv4qvTHvgnr1G3PgBCBMHhest8=;
 b=Nwd4M0rx4ZSD/ik3AU3dP7OVHciXCI7KAjQ01OabKdWS9YmCVtMs4LccakBnHATBWP52ZZ6OFbNJ2EtZgldtv7B7khvcg07i5d4pC4GZIxJG7r+zKvbMOQ9pAEkFUBvhUjpBpjAO7MkZmDUXg0Dcj/ouce7HzZu8o8RXHQJ8BrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.34; Fri, 6 Jun 2025 14:57:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 6 Jun 2025
 14:57:44 +0000
Message-ID: <d443719b-cf74-437b-8049-5f7a130350b9@amd.com>
Date: Fri, 6 Jun 2025 16:57:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] drm/ttm: Add ttm_bo_kmap_try_from_panic()
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250606120519.753928-1-jfalempe@redhat.com>
 <20250606120519.753928-5-jfalempe@redhat.com>
 <dd0532a2-4011-41ec-896d-ec066dc23cbc@amd.com>
 <8ed62378-269f-4385-bf05-eda28098fc1f@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8ed62378-269f-4385-bf05-eda28098fc1f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: c39a04d6-7bb9-4f0d-06c7-08dda50a7e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWtvUUEyQ1VpK3ZaVjJsc0UycHZYN1RpSzFvL0EwLyszcGtua3ZpeXBXYUc4?=
 =?utf-8?B?WUtBU3FHKzVuR0JiRjlQTVhBQlNSQTdKbXpjUWVoVWxPcnZlT3Y2SHA1VTJ6?=
 =?utf-8?B?QWlqNkRick4xL1FNQTA2RmUrQUpDN2g5VFJ2THBkdmpRSE9zR045R0xuUGJS?=
 =?utf-8?B?MHd0L0hyejhtbi9GQjhJMVhCRmtZZnhETlRXUzBsK3Y0L21VcHlRS1NzUHIz?=
 =?utf-8?B?ME5tcDJpZUdUYk9wRENwV3pyTk4yWUlvRFY5RlYyaUhqLzRxdTRJK3Y0dXdr?=
 =?utf-8?B?M1plMmh1ZGxnNkRwWDVQMjc1VXY4VThXYm5ySHBWd1R3Y2c1T29jdEc2c3k0?=
 =?utf-8?B?bVRPekthaVVrWld1bk1UVHZUdm9tVERCSjU0UWN0UlY2bENiM3FBTG5nWHk2?=
 =?utf-8?B?cUpERW9VTVZBZmxxbkdwMm4xeWIrTjlYbU04bU14U3p6S216K3VOc0Y3TzF4?=
 =?utf-8?B?ODZyZzZNekZlenpYQjFuc09aMHN2SlVqcG9tcDNwaDhWZ1ZtYkpTSHdrbWQx?=
 =?utf-8?B?cFJwNUlRSS9NSTNtYVY2ZDFuR0R5WTU4RlhOQVEyY1RmdENxZ2NjREpxa1pu?=
 =?utf-8?B?UmYxd2kyTkxnWTlKb2xzSlVaeFovU3ZwTmI4czIvYXZteGJNdE4zUUQzRmxW?=
 =?utf-8?B?TkE2Rjc5K3A5YndTeDUySnJ3b25KUkJ5QlN3aXptNE5GUUVLTitvRlJWbXI2?=
 =?utf-8?B?M0dOYkk3Qk9qM2wrWHlEU01GbmJ3YVJhUGdIdjFQOUJKMzdLRFFzU29YZW00?=
 =?utf-8?B?ZjI2UWhiNkpVV0w5VUh4ekJwVjdxVHV5Sno4dzZGcnQ1RFJmb0ZPQUFsRUl6?=
 =?utf-8?B?UDIzVXF6d05Md01nbW1zQ0JmN01DZjdTYTdUbVk4S3dlVVN5Rm8xUko1YmRY?=
 =?utf-8?B?UEdveDJLQkE3WTNBMDlhczlBc2tnV1JIOU9XNVhpTWo4QUFnQmx2dTA1VUNa?=
 =?utf-8?B?K2k1QVF5WHNxV3NlVXNKNkRkS0NaNkNCTmVpM2M5R1RtWER3dHNYb0poVk9u?=
 =?utf-8?B?K1NwMmZhRnR5Z3JrcEc1TUtyMXhFTElGQ1R0UlNrYmxjdUVYelNDTnBNUjlZ?=
 =?utf-8?B?WlZKRGJQdS9kOXY1LzBzR0xodlBWby9yVDBKUFFuNEpKZzAxZ1JuRkFDTkh5?=
 =?utf-8?B?eEVObkw3eVBxM3oySjl4S1FOcHBqQXpNbHM5V0xBNUhZRkZlck53eEovbFJN?=
 =?utf-8?B?OVlaOVh6aDR2VFRreGJMYitXNnpNZk9rOVc5QktYeDJ1b3c3UTlMTFpjZC8z?=
 =?utf-8?B?aUxtRUFuVVgvTXJDQjRWdWFwTExMR1pQWEN4TzNtbzZVcFc3L01hdWtWcmEz?=
 =?utf-8?B?M0ZJaFowL3M2dmZnSHlqTUJPNXo2d1UzS3R2cmV0Rks0MERmMjEwWHV1Q3Zh?=
 =?utf-8?B?aFhXby9iZ1Z6MU1OS0xjaEl1Q2NRQStjWEY0UlpOZjNlcHA0S3lGRG15WnA1?=
 =?utf-8?B?T0hMSkRLOWlsdUs3NXN0UFlvd1d5aVpRZDJFTDlFUVdhY2lVNStGcnNSZThI?=
 =?utf-8?B?U0FnQU1OamZXUmpJNVhYc1RCUDYwRER5VWtmekI5T1ZmNDI3ZnhMakk1WWwv?=
 =?utf-8?B?VlM3WVBQVmJONkZlN2xqOEROOXRPN3UvTmIrQWh2N3czaGZJeTR2NHVQL0xX?=
 =?utf-8?B?RGFCTXY2N1lsS1RJejkwZ0VCekdzMUZSSHNVR0pyQjhqZnRhc2pWVkNJTjF5?=
 =?utf-8?B?YldnWWhaczdZUXZhZEpScmNhNmkzbW1ucDFsbldYS3ZHeXdhYy9jdnIvSUw3?=
 =?utf-8?B?RU02OWJ6K2RVSk5BdEt1eUVDNXZ6ZllZdWx2NFZIZSs3N0tUQWNlcmlrdWZH?=
 =?utf-8?B?bk9VczJWdHp3YWFxQ3YzemNVeTBuZjJQZmlPQUtRTS8vam9mRTJzMkIwZGhw?=
 =?utf-8?B?YWZiQ3MwVW1VMEErQjNqWWpxVG8zMVAwOWxmRTZOcDJ0SmNSL1l4S0hteTEx?=
 =?utf-8?Q?bxNAt1LVCSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVmUVZMaDhSSjR0Q3JSRzNpamFxSXNUZkhUTWVDN1MrZnZ3ZE5HcFZUMm9O?=
 =?utf-8?B?eTRjQnFPRnZVQTcwbGZGSVlsOWZmRmxDWWhoMjNGL1FtUjJ1SWkranVURG5X?=
 =?utf-8?B?RHBMWkxseGl4NC9wdlZOL3ZQbFZ1MytlejB4TjdZNzBTZENaWkYxTmU1NzRS?=
 =?utf-8?B?cmFNL0s2YWo3RDNLTmxWTFdvMHZ0N1Q0Wi9GelJlUGw2SnBicEpTdVpjSldr?=
 =?utf-8?B?cUljTGs1ZlpNekJsUkVsL0FjY3FHUEZ1bmptbTFaMWJQbmdqK3ZhZmlmQklK?=
 =?utf-8?B?eDJxL2VDRW1laXliV0FRNVBuVWN3SnEwQzNjdFJKdlMzNEdmcmpBSXdMSVEr?=
 =?utf-8?B?dW9qcWxOM29PZ09rZXNjc0lnb0VwMXozNzlJaXp3eUdqMU5iWTExK09wYXZV?=
 =?utf-8?B?Zldmc3hId3gxOEJQUEF0b0JPN3Uyb1N2VU44cHdqQ1BBSXZZUklZMUFGVHpG?=
 =?utf-8?B?cEs2cjEvdXRZbTJSQjV5YTBOdUw4QVhiV0ZEblhXMEl2czVkcGFUb1hEZFlD?=
 =?utf-8?B?aGpmMXh2YkxUZjBTTzV1ZjI2LzEwc25TZGVtYXhqZk9JNVgxRXRySUtsYXFm?=
 =?utf-8?B?a1EyLy94VkQ3Ukw1d0U5Zk5iR3F0Rk05ZDIvMUJkcmh5a3FrN1h1VXl1OW96?=
 =?utf-8?B?cTdCTGt5dlZWSzRtaXNJNTFOZzlRNlp1UklXQjZpZlF3cnRuSUxEd3NoVDFF?=
 =?utf-8?B?SXJ6ZnBKZmpxb04vZklmb2J1YVJxangzRTMyRDFIQUVXZHJPeC83dEY3Mzd2?=
 =?utf-8?B?UDNWdlNWeUZrWDltdTNkNCtNbVhaTHdsbFc2eHpVa0ZOS1FFTU9WQ2NBK0Jj?=
 =?utf-8?B?bmdBVFhscHpiRUd3NFFPa2dLTkIvQ2s5SEY4MzhxdktkQkp5NkZPSmpLcS8v?=
 =?utf-8?B?ajRzemdYaVZubU1xZm5hR05RcG1MamwzUGNGTi80R0huNUNQY3gycnZCeFVQ?=
 =?utf-8?B?UDNXZHhjTkR4Vy9QaFdrUHhac3QrTzNPbkc1ZlZ6UkVjK0wzZWV6Mjc5Rlpu?=
 =?utf-8?B?V3F4bUJkY0RGcmxHZzlCL0c5cytXbkJia1lHb2ptcXkzOC9QaFRrQXFZbi91?=
 =?utf-8?B?RncrWFJOK1huWTJ0cG12SkxJSWRGYjJQc011bHlNcEJhNDVHSGJQVHdESjFi?=
 =?utf-8?B?NXprYSt5L3U3YnRpcWI3ZUtkUWRDYlFDR2NPM1VDNVJaU1o3b1hLQ0dMQlZi?=
 =?utf-8?B?QU9HMVJ2VC9oVnlPWkRqa3NWYkthNllvQy92QUNKckxMaHhNRVFFREFkYVRt?=
 =?utf-8?B?L0lSV2o5N2swbnQ5YTA3alZxSUp2UlVTUm95S25kS3ZwWkl0SzNkbVNvZ1Vl?=
 =?utf-8?B?V2FHZHlWV3lZTStuM3VsS1Z3RUJaUVRCRVVJNHpnVE91d01wODI1OE5QRnVK?=
 =?utf-8?B?L3MvRVBORkhRYW9sYUZKT2UxVkZ1bDcwUU9rbTMzZk1XVm9WRlJ4cHZiclZQ?=
 =?utf-8?B?SVJaajFuTk1HWTlhazk1N1BXTk9mTXlyM3pwNXN4TnlCWDNnc1NiS0I2TEZw?=
 =?utf-8?B?Q2VTcThyeXhEQUFTelY3ZXhUM2dlbDFHejdmb0lrSk1Qb1RHQ3gvYVJGUXNI?=
 =?utf-8?B?UFZSNTlTdlluR2xsRU5zejNOOHc2TXQ5d3N4cWpadTkvdXUyWW1nWEZncTVO?=
 =?utf-8?B?QmpwYy9JTkcvZkhJbUUyRUZzb1FPeWpSVjRUVjY0Yk5KNERsTFNxdkhuT0lL?=
 =?utf-8?B?MWprSjNYb1NVQVdTU2hqaGc1WXF2K3AzbzZ0Si9QNU1YMzdpSVh5NmdKcUJF?=
 =?utf-8?B?aUx0RWVpVU1EdjU5WG12RVpGYW16LzBvSk5RWll2SEQvbUZ3QmNWQVpRQUw1?=
 =?utf-8?B?SXJIelF6QzMvcFN2aWxjY3VhS1NzWkxKb0VDTzVncGZEVUx1ekVNRTZ6ZGFr?=
 =?utf-8?B?b1FLYkFWelRIU2ZIaDFJTDFPUWZiTnJyK0RMdzVqWHBSdnF5dHNRVlA5TzNE?=
 =?utf-8?B?M1VneHV6UVpkT1FubE5DYU55RGYxSEd2ZjdvUlIydXlEZW95WE5oUFhWUWFw?=
 =?utf-8?B?cXI2YW5MbnlYenFLaDF6Rlo1eVY2WFp5cjdGdWgvTmEyVUU0L3lRTnpBamR1?=
 =?utf-8?B?cm9IQzNFL2ZuWGtYSldxb1BpZm5SZDZMblZtUTFzMm45ZFlXMUhIZHJ4ZFNy?=
 =?utf-8?Q?jVyUGqHQ7514LvMzgCACBlVky?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39a04d6-7bb9-4f0d-06c7-08dda50a7e62
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 14:57:44.7414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06NZgiaVjAZti9rNgZNg8HiO4/uqSeUpFaXxOyRo4BxU2NrAxpT12O4q0oK56bvu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
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

On 6/6/25 15:14, Jocelyn Falempe wrote:
> On 06/06/2025 14:28, Christian König wrote:
>> On 6/6/25 13:48, Jocelyn Falempe wrote:
>>> If the ttm bo is backed by pages, then it's possible to safely kmap
>>> one page at a time, using kmap_try_from_panic().
>>
>> I strongly assume that we don't care about locking anything in this case, don't we?
> 
> Yes, normally it's called for the current framebuffer, so I assume it's properly allocated, and isn't growing/shrinking while being displayed.
> 
>>
>>> Unfortunately there is no way to do the same with ioremap, so it
>>> only supports the kmap case.
>>
>> Oh, there actually is on most modern systems.
>>
>> At least on 64bit systems amdgpu maps the whole VRAM BAR into kernel address space on driver load.
>>
>> So as long as you have a large BAR system you can trivially have access to the MMIO memory.
> 
> For amdgpu, I used the indirect MMIO access, so I didn't need to ioremap
> https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c#L1800

Good point. That is probably quite slow, but works under really all circumstances as long as the device hasn't fallen of the bus.

> For the xe driver, I only tested on integrated GPU, using system RAM, so this first approach is good enough.
> But I'm still interested to find a solution, is there a way to get the current io-mapping if it exists?

You need to ask that the XE guys. There is TTMs bdev->funcs->access_memory() callback which should allow doing that, but I have no idea how that is implemented for XE. 

Regards,
Christian.

> 
> 
>>
>>> This is needed for proper drm_panic support with xe driver.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>
>>> v8:
>>>   * Added in v8
>>>
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>>>   include/drm/ttm/ttm_bo.h          |  1 +
>>>   2 files changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 15cab9bda17f..9c3f3b379c2a 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>>       return (!map->virtual) ? -ENOMEM : 0;
>>>   }
>>>   +/**
>>> + *
>>> + * ttm_bo_kmap_try_from_panic
>>> + *
>>> + * @bo: The buffer object
>>> + * @page: The page to map
>>> + *
>>> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
>>> + * This can safely be called from the panic handler, if you make sure the bo
>>
>> "This can *only* be called from the panic handler..."
> 
> Yes, I will fix that, it shouldn't be called for normal operations.
> 
>>
>> Apart from those open questions, looks sane to me.
>>
>> Regards,
>> Christian.
>>
>>> + * is the one being displayed, so is properly allocated, and won't be modified.
>>> + *
>>> + * Returns the vaddr, that you can use to write to the bo, and that you should
>>> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
>>> + * is in iomem.
>>> + */
>>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
>>> +{
>>> +    if (page + 1 > PFN_UP(bo->resource->size))
>>> +        return NULL;
>>> +
>>> +    if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
>>> +        return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
>>> +
>>> +    return NULL;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
>>> +
>>>   /**
>>>    * ttm_bo_kmap
>>>    *
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index cf027558b6db..8c0ce3fa077f 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>>   int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>>>           unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>>>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>>>   int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
>>
> 

