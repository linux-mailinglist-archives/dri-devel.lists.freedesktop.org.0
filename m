Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB5AD0232
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 14:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A82410EA8E;
	Fri,  6 Jun 2025 12:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TGxac6B+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A010E365;
 Fri,  6 Jun 2025 12:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeVDmRShe3SSSlK+auyg5AHLA0ZdYcRm59s1ADH20x//Bj2PFETe5a0iOK9mEcoozXtV+6QRzkezmS/MZ1LoUt5tZykz7Ni1oXlcN8Jz4/4KNur0qXhRExMr8ZBwbv9Q5/mrPIl/ihPu+b3CqxRLEjmDEYYDsfe54CZDSRXAbEKnqmb5MWLuDGg9/lOrXVMKz4/PsDgIdCxaW1kea1gp7FEXpas/LcXv0V9+IYzTrWrkzowsWooQ8PzhZQ4n/wxu/It3FeICk0VNcgaPFbrpN7TjxPY5EAiIog+BIdXbuWht58h4AqNJqiYSFWujb86QYSqVVLUyuDPDNwy2Thx7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qitMhmrN7TmGW/MIO9GqUyinY16BfJEUJB+E7KseOTY=;
 b=A0IgHCMYYwrw+z4RPRGneHiD+iOkfKHDAoVq53j8la6+OfF8CrPX+AFsjsqCxNyj+1h6GuoS4/vFiqFg6vu2LUckZsmFnZhFBJRdSJQdAH3oIkdwansioVb2a9N8Ja8q2lBunvu4cG33j7j/uCKyiXpglmNVPpAgZ7xq8KnDxYvx2DKtJkwRCXUkIc4fWND82n9puw5EQG29TxGDqHcxD5T0RslUOp3XwFdCc27dQYlbJhw3d/ogXfsKkUtBTMRCvtqGiCjXC+4/N4RMn09b7zQ1JhZljxsY6C2CDav5sHoC56TSITETyCTJmT9iNR4V+qG2ishsRmcORuz4UECN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qitMhmrN7TmGW/MIO9GqUyinY16BfJEUJB+E7KseOTY=;
 b=TGxac6B+99PVh853v7N4YWkSuzFL4gVzqGEa5aP7BiGwV9r9JmTzXayTlEzqErCYPC98rTXaOdnE4SAlkOqXZyf9ARhs/c3wduoHAjtz/nArcss8/YhNLC8Rlr9cZ9sWALfApCtiGiTrcD2zAKU+Cp38UkxegJtvdjx0BxJRsNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 12:28:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 6 Jun 2025
 12:28:55 +0000
Message-ID: <dd0532a2-4011-41ec-896d-ec066dc23cbc@amd.com>
Date: Fri, 6 Jun 2025 14:28:45 +0200
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250606120519.753928-5-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c382d3-c1ff-4ee4-156b-08dda4f5b3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW5Na2U4cUVFVUNaUEloMVV5VFkxV0k5RUtZbWNxOStUdE4rV1pnN0Y5TUhS?=
 =?utf-8?B?TTRIQndwU3ptbllhV0ZvYmZvWStIY05Jb3FoLzhKUzlNN2lxWnNSTk1EaWdP?=
 =?utf-8?B?MkNoeUZTd1FxbEg4MTRVWFpkeWJjd0lSZjJoeGVrTGZNR2VkQWxpTkducVFa?=
 =?utf-8?B?dFJZTzdVc1o2ZnhPVEh5SDJLeE9GeTRMd3ZPeXJSNnU3Q256bnRzdGVZdUlY?=
 =?utf-8?B?T1BaNG91THZQa3JWeGcraDI0RnJzU0dMbG43TkcycDhCRVlvbU5zdTVEd2hD?=
 =?utf-8?B?MG9VZVZHbHk1VkxMUnJobWZUUmg2QWx3S0NGZVF2YTA1dWNmSnIxL1laaDFV?=
 =?utf-8?B?bG5UZWg5b1NWcXhPOTM5RzRZVklzT1QrTUlDRGlFWkZGakhxYTdFeHlsRkhP?=
 =?utf-8?B?TG02NW5DUUQvd2dUcjVWZWRKaFlGcmp4TDN5eGhYdHFLN2RKVTNYTG9sdElt?=
 =?utf-8?B?RWNZbFE3d2ZSejRGMko4bXJ1UHZZL2FQa0hscGVwUVVOV1ZqelRJV0JxTVhX?=
 =?utf-8?B?SmdXQ0JiamkxdFEydXNvWVduTU1rcm9lK0JQUFRDUjZHT3hOMVFLYWljL0hN?=
 =?utf-8?B?NUhoNmU4b2ZLbFM0RGRvcjlsS2dIOE5XeURCS3pQc2FGaDljcS8yQ3lFZFl3?=
 =?utf-8?B?VGpXMENBQkdMZ2xSUERwK3RlVklCSHIwMjBPMUJmZ05wQnYwNVRuMm5vV3du?=
 =?utf-8?B?eVJ2S0FBYUZucnIvSXdHL2dGVm91cTdESHZCRGJ4dDBNcHI2Ynl3OWV6UE5D?=
 =?utf-8?B?c0F1RGdrVlNiakh5KzhiaHdSZ2lWbWU5TkhDUlpHM09KcnNMUkN6S3MzeWNj?=
 =?utf-8?B?U2g2V2x0dyt0UVgxMWxXcW9ZNlJPVno3MmJLMUVOY2laTVZWVVgzS0FEWDZU?=
 =?utf-8?B?OWlkS0hIcHVodWtnc3RISmZ5WXgzc0ZiUm5TeUdJbGRqeVM2enhTLzF5TzZs?=
 =?utf-8?B?aU10eTFHZ1lTRUk2dXg4T3dFRnpjWCthaWJNcDRkQ1dMRkxZMWNkMGVtbGtM?=
 =?utf-8?B?T1dYcEJLeXQ4OFV3WXRTM2ZWTlpiUXV5R0VCZEJHZUllUEFHMHNHUS9MY3BK?=
 =?utf-8?B?Z0Vrckh5L2dXOW5TOXhrVHovaTY5TllEbHBCdUd6WTlqTURPcWUybU5pQ0RS?=
 =?utf-8?B?SXdzRlp1b2tLRWk2VW9mTXFnZEZFRDRONjdOMUttdkV2amowVG4zeFIxSjQw?=
 =?utf-8?B?d1BySGNZZGpOVDhwZ2xiWDU2VWVvNHYxUm52Y3hLV05EcTlLelY0MUcybXZn?=
 =?utf-8?B?TGJYUWhjQXJMM2IyemVvcXJ6ZHhWM3djb2V5TzZaMVluYVNtZ0VGS3Byc0Jx?=
 =?utf-8?B?Ri9NRS9FamkxYmN6cHpvNXV4MXEzeTVIYVN0bzhhRk84b1o3OTgrWDV0Qi9N?=
 =?utf-8?B?Y1dhZTNRY0kxbjJTa2U1U3l5aFlKQ1VsRWRJY0pycE5meXpyY1J5TVg4MlNz?=
 =?utf-8?B?TlRmT2FNaFZ2Rkg4bE16WkJoRThUWEhZZGhCSmEvWDN3WDQ1V1VLZFNtT3NB?=
 =?utf-8?B?bW9Yb00yOExldW9PT1hBZWVuOU9rLzR0elUzY3VUclNqRCt3a3NseWVRN0ww?=
 =?utf-8?B?Y2FSM3phcEpFTEVsN1pqaUlQSU9ua3RLUU5vVjZ4OWhTdlkrcjl4RnRvRTFl?=
 =?utf-8?B?SnptVFpIRk96QkF5a2dsVmRjbHgveTFNaWV0TTdjRUp0OUhVa3BrUzlqbE5i?=
 =?utf-8?B?alVRRDlaMWhmRFZWZkdYSjhKdTRWbHduQUFHTWVTejgzRVBoV1hkcksvaXhY?=
 =?utf-8?B?THlCTm96MVlZckJvUzlUeGJUa05RVzNYaXZnbE02ZlVudnB5dm90OW16OFkv?=
 =?utf-8?B?N3ZGSzJhclkvRXVmOWpSL2l2U3REWVVaZFJZZmRRMXRMMDdyRm9yZ3F3TEhM?=
 =?utf-8?B?WEMyZEdYN3RlWHdHWFM4VnpkY1ZLN215U0xqNTYyMEgyakNVWjJEU2NXVjJu?=
 =?utf-8?B?K2JMTVJFREZ5NHgrZTJyRGJUbmhYR1EvYmxkMk04dmdrMWV4NjUvSXdoanl6?=
 =?utf-8?B?eE81QVNBOFpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRoSGp6YkFObEo1TWxmZ3ZEYUQ3NDRsa09YUG5tWUQ5WDJWU00vdjg2ZmRL?=
 =?utf-8?B?d0ZpNk1WZGhoVG1Dc1Y2MGp4THk3SXcyZXJoUjBjeEU2U3J3L2Irb3laTG02?=
 =?utf-8?B?RUU2SVl2OElLd3BxNUtJaHIxSWpWS3lMYkIzSzViditpcEIxZHFUQUhMZ2Jz?=
 =?utf-8?B?RHI2WUNYQ3dVYUh5eDd5MHpUc1FEVVVPOFlpdGZORXJ6YUgwbUU1Nk1XVVFR?=
 =?utf-8?B?Si9XUEw1QVBqQUNOZk95dTF4b2NUeFRQOGFSclFwQ2piSWhIMzkwbmJkYk1o?=
 =?utf-8?B?VGJqVnUyOWs0MXJab0VpazdqbERwNUluZzczL2ZPNjgzbWZrR05adVpab1Fs?=
 =?utf-8?B?NCtvSkF0RndkUFQ4ajJGRnliWEYxeGdXeWhvNXB2SlkvVStBWE1ETVZNazVL?=
 =?utf-8?B?andDV1BQMjNJL0RWdGJQdG4vNkJ6M0JHTmZ4RjdtQktnZU1QWHJDTG9WNVBR?=
 =?utf-8?B?cTJPRElvMTM2MnlrbE1xUHRhcEpXWE4rVTROVnEyVWw4aElxOWdmQzJISkly?=
 =?utf-8?B?NXdpSEpoNVlYTlBQKzVrVEJ5OC9KYWViRFhvUzNLSTU5QjFkV2lXZHYxL1dZ?=
 =?utf-8?B?eGZGTVhMaFc0cERHUXFkOGhZekFyZnVoUXpGNEtLci9hbFJzcmkvNzl3WE16?=
 =?utf-8?B?UmdDZDlvdWlpT3BpSXNKSVJzNjd2cStCZlpxbGFib3VvUGw4eWppWmxVc0Y0?=
 =?utf-8?B?eWk2TG9XUGM3M0ZVMkZEdGhzeUl0bUNHWUFMdjVLUTNrMG1BSjFseDA1Rmo4?=
 =?utf-8?B?RFl0eDZncDlBZWZTeHRDRmJCbTZVdEtVL1p4TDJ3YWJsT3RzREJDYjhJREty?=
 =?utf-8?B?bHU5NWpod2Y2ZGdXakFmSCs4a0o0c2szbW91a1UwZFhTblpvSVc1S1RiL2tB?=
 =?utf-8?B?NFJWTEkzQ3N2Qm83amxPSkpyMHArWTlQaFdtWHpTcnRtMEhoQlJnV29kU1J5?=
 =?utf-8?B?UytPQkJ1SDUvQUxHdWpZeWRLWUdnb1BmRUtSUDBOT051WU5GSkltZzZ2U1po?=
 =?utf-8?B?RC9hUGJxMkM0eFRvTW4yTkxxQ1RDZXlYbG10LzZjRlFLR1Bkb3ZNM2xEelMx?=
 =?utf-8?B?SlpNTDFIM2d2NmZUUGRIREw4Q1M1bVdSVUc1UzhHTGxLc2hCYWd3ZVFXTXFx?=
 =?utf-8?B?ZjVuTUtpR1RZZUcvdUZkbEo5UmNjQXNqWVUvTGNmcVVBTExLSEJsUGtVZU96?=
 =?utf-8?B?M0l4ck9mcGE5NlM4d1lZRWFhRE5uR2pBV0dZTGd4eUhsN1BFYUpXUXNiS0tk?=
 =?utf-8?B?S2xqNmYvODlOVnVYMDl4NXJubGNKREU3MU1MUzRTVXJjK2gydDFKVWJSLy9l?=
 =?utf-8?B?OFhQdXpGSXBONkF0blhpNkZuM2xSMmsxaVE5U0l6RWtTaDRsMXVYWWkzOWt5?=
 =?utf-8?B?NTBQR3AxaGY4UzVHazZ1YkRmbXlQQ0FLT0ZHM3RZYzhhK0hsYm1CdTd3em9l?=
 =?utf-8?B?QnhwVzdJUzh6RnVQRWFLektFaGR1SCt4ZmR1REw3TFZuN1FXNXVIZUE4UktP?=
 =?utf-8?B?dHZsMEQzV21EVk1VamJibTZlalhLVElCM2VrMTNKNnJUYzIrdnBKeUM4NXRy?=
 =?utf-8?B?a2tDMjNKUzNxY2FwN3pUM0hYeDkyQ2ZBd0Y2K2JsRG16cm1PQTdVdittZkx0?=
 =?utf-8?B?Y3FYWkxrZm1LeTRFT2pNVkYrQ3dNQmJhTXJMZUVoSDVDY2RFbCswMmIzbkIw?=
 =?utf-8?B?aEliRTZOOU5veTFhMi9Na05ETlFETllaMFdvTSsrSGliVFdhbENiTzRlLzIr?=
 =?utf-8?B?TlhtRSszYkR0K3hYSzBPODVFeCs0TFZZL05nejg3UU1lWGlaeGlzN1Z4dytj?=
 =?utf-8?B?elQzaHgxUjlYQlNQT3hBeUxFM20yNkVCQlVwUGZFdkkwN3dxcUZuMURYMEFS?=
 =?utf-8?B?ZlcweC9ZZVZXejBwUUloZ1ZOZzBVRm9qelJLeEJ6bFROMTg3NGhYbDI0MnpT?=
 =?utf-8?B?RUl3N25KUGFqSFhXRWFNNXVIZWM3L0gwQW5QcjE3MkpDOVB6cEtnQXRFUkRh?=
 =?utf-8?B?eHBtWk9ZVCtOUCtPYzlwZ1BJT1Mza3NmNlZtTXdad1JONGZwRDJMZFBONjgx?=
 =?utf-8?B?OEpPRWNPRElaZEQ1TEZOT2hNSjkxdGxLUEZ2UHhIaTNyZnZaVi82MEFMNEpw?=
 =?utf-8?Q?arXxBGpL+uWz787iEbeiC6/3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c382d3-c1ff-4ee4-156b-08dda4f5b3e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:28:55.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T40f1gKNXrsaEu5jDZZYZq/4ELbagqijwCGDzOoXWxEIiY2EIcdAombfnZvgJtzI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536
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

On 6/6/25 13:48, Jocelyn Falempe wrote:
> If the ttm bo is backed by pages, then it's possible to safely kmap
> one page at a time, using kmap_try_from_panic().

I strongly assume that we don't care about locking anything in this case, don't we?

> Unfortunately there is no way to do the same with ioremap, so it
> only supports the kmap case.

Oh, there actually is on most modern systems.

At least on 64bit systems amdgpu maps the whole VRAM BAR into kernel address space on driver load.

So as long as you have a large BAR system you can trivially have access to the MMIO memory.

> This is needed for proper drm_panic support with xe driver.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
> 
> v8:
>  * Added in v8
> 
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h          |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 15cab9bda17f..9c3f3b379c2a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  	return (!map->virtual) ? -ENOMEM : 0;
>  }
>  
> +/**
> + *
> + * ttm_bo_kmap_try_from_panic
> + *
> + * @bo: The buffer object
> + * @page: The page to map
> + *
> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
> + * This can safely be called from the panic handler, if you make sure the bo

"This can *only* be called from the panic handler..."

Apart from those open questions, looks sane to me.

Regards,
Christian.

> + * is the one being displayed, so is properly allocated, and won't be modified.
> + *
> + * Returns the vaddr, that you can use to write to the bo, and that you should
> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
> + * is in iomem.
> + */
> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
> +{
> +	if (page + 1 > PFN_UP(bo->resource->size))
> +		return NULL;
> +
> +	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
> +		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
> +
>  /**
>   * ttm_bo_kmap
>   *
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index cf027558b6db..8c0ce3fa077f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>  int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>  		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>  void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>  int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);

