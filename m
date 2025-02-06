Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2BA2AAAF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A93C10E860;
	Thu,  6 Feb 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGh0fHEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BB610E85A;
 Thu,  6 Feb 2025 14:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pnmy/ZsHp54T/qpvVL7exbyGiOk1GoRhCsU5d+7EZuREhoP08PPnSIbauJCvRj8aHPgcUT/2A7/Sy5CRSfb8Ghwz4Zfsf58z5kMpZ8lYZGoKD8DQ9lHtgkuCl/AgmfNSCqYVSkqp7uve/QIy5ZGaESA0RWjCVCxQGdHFdcHNLZTp5hbVl1+xy0QjqHV7aL7iVu00dNPM7AdMXl4pceqqVwoGIzXM6Xxj4oeuDUhIpTSgJAihNFsnI9v1EYR0MnowWRfKSvU9UjUQnOAELADsXjpVGbNlfqgM2dDfr57Ho0TmOqDYgniR/XQGhv0fstvQuO8XtwgPn3YlJdpXij0r1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN+xw9Ak2Q2og9BjoiGKh4nfM+BiCodJ6Vx/idKwiVc=;
 b=yXwekywUbb7jTDgML3vz5n1EziQRTSntUA0VF99ypR0jqUnqvA7zvjQv1V3SCX4TGDMOzSteKiv/guZhvslC33n+n3hlleBRXoG0VUwsL2jQZC70xY0Fqw5sHrQuvvgStE8LQPaN3te1uWsaEE6DrzUqI9rbjlS/JmYQ8UrQN8gYYoMIhOSJ1Og63M9hLjqsczwGcaKG8bQqvFGpyc3+bukxsgtB4pw3LRsgurez7ND/+EgEhQkqU4zEZErKH8fGbN4F+wTAuNlCZTEchTSTJuhQMESB6vVQG/64t9IgZXnfBHupAiF47wkrqxGsUysaHRA0iVk85eMPIQuqnqIFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN+xw9Ak2Q2og9BjoiGKh4nfM+BiCodJ6Vx/idKwiVc=;
 b=BGh0fHEPXYcMKlDQgw98BqXBZQtWFkiT9nilsU2UE3BF6Ukk+wBQXoQXc8jJZsqUpsell1n5CngnG6GZoE7DaiXAbvmZIuEmAukYNPgIfshPYsxs6FMXM27uhn3k1jrvs12gCdPYyHCyMNIAEgDTz4mdzONUy6ZUTWquto53vXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:06:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 14:06:24 +0000
Message-ID: <ae307b57-e96f-44fb-9e30-c1219a3f21d5@amd.com>
Date: Thu, 6 Feb 2025 15:06:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/7] drm/xe: Add a shrinker for xe bos
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-7-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250130101325.3068-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac18637-4792-48fd-b433-08dd46b77100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHhUeEdYaDB1M0ZvbWY3eDMvWnpOY01KUVB3bzhEWlN3QmhlK1JkbWIxbjdS?=
 =?utf-8?B?QUJDR2xTWCs0cHdCYVhyaVJBZi9zVUVtTXZjY1BNODhnN1YwL2ljVFAzTHVQ?=
 =?utf-8?B?MlBFVVR0YzBRTmltbFo0bTZ0NVlNNU1zdkR3THpWY1VuUjZmWmpKdVhzTWxv?=
 =?utf-8?B?WUxoZzc1UHAvZVd4dWpubnowZlRROXNIdDZ4UXBSbFNnMGIyZWNsMkZlVHJx?=
 =?utf-8?B?dDVJbkR2WFdxdWZmamUzd25YWDd6U3liN2IxcDRsRVBmemFKYk5FOGpjY2Jn?=
 =?utf-8?B?d2ZLamFDV2hucW1hNVU3RmhtaEVFSHRlL3BqbnpQNjg3RXlxSFloQy9IdXEv?=
 =?utf-8?B?Rk9vSGFOWWt4VHd5VGFucHk0RkZXVlVMMWVPTGNVM3JDaGdOeWQvVTdiNXBT?=
 =?utf-8?B?a0I0SmZyZ0ZOM3VKTzJDNUMyeG5LWUxkWnR0ZXpyKzRVZlZyR2Vvd056Qnd4?=
 =?utf-8?B?b1NIajRhb1plOFNoNWtEaDNHalR6VW82Vi9SQlNwZm9QMFZYMVhNbVhWTkww?=
 =?utf-8?B?LzE5UDQ3VGk2UXdMVWMvK2kxVWRCT0UySDljRWJmaUFXdS9iaVVKbzdnbmRy?=
 =?utf-8?B?M1lXVmJHZ1dTSFNYSmZ1dUFUb3A2dVRMSFdWMCsyK2NwS2RDalNFbGRNS2RZ?=
 =?utf-8?B?bDk3T0dNQmxWa2pwdCtYby84cWxlODFrRU0zbCthY0RmMW8rSFJUbFZhcXcr?=
 =?utf-8?B?WXNsVHRrcXdKd3JsMkFnL1lDRzNDTGx2ZU1kT1AwaXlRdXJVc1VDQ01JM1Uy?=
 =?utf-8?B?UC80ZS9aN3lPbk9Va0x0Zkg2YzRrMDBCTkdDenJzVFJMMEJNRDUvcVg4bGdB?=
 =?utf-8?B?dTRackJSL0hUYjh4eEt2Z3FsaE1QL1B0U0lRWm9ENVh3NTd4b3FqVXJWbWZ4?=
 =?utf-8?B?by9LUzdnVHRuMkhiamk0VkdmbHhBM2tyVVhVT3VHci9uT0UrcjNNM1IzNnhw?=
 =?utf-8?B?NnUxYkQvM2haUXdaZmNrTFM2TzdWaFI5V2hGb0o2UnYxQ3NGRmNDSFhmTDZa?=
 =?utf-8?B?NUdaOUdQby93U0doTDlFRXdxRk9oTzZWTm00cm95T0hNL0p6blhDZUR6NW9h?=
 =?utf-8?B?Um51eS9Uc2xUaWluNnRLS0FFSG1lZkFZUVc0aFdEeTVYZUdzNSthTUxMclBT?=
 =?utf-8?B?cVhHN3VMTjJVM0NPWndyemdKbVZnd0QycEtZQ0hkMWhwZjYydFhScjRFZkpD?=
 =?utf-8?B?WjZ2MnozZGlFR1dtTFJkdUFsZVJFSjdXWWRVL1FOZy93WmkxbWdacGo0Y0I0?=
 =?utf-8?B?Tmw3S1hVOEtreS9ia1ZOUjFhZ2FXWGQwMEpSNjFCejlwYW41LzRLOU1DK2RQ?=
 =?utf-8?B?K2Z4bnJUOXdOOTJYUEVwakxnWGVHR1ZzUERxVllhSkxkVHZ1OURoRVJqVVFh?=
 =?utf-8?B?TURsYlgwSkdUSEZWRW11bFo1dERmTk5KWU0yNkUxTXF3TlhMaHNJTUtQNWxF?=
 =?utf-8?B?Y2k2VDdoK0ZPWGVaRVNXZ2l0YXVOUHpKRm1lT3pEL2kyS2hrTnM1enJYS2JQ?=
 =?utf-8?B?Wk5tdW40Q3B1c3JaZ2Z4emdaekg4ZUpWOEFqYXJnd1AzN2lkQnJFOGdldHMr?=
 =?utf-8?B?T1E3Yi8xaEdsT3MyL0hTTWV2RXJhTGpLZktoRVB3VlgwVUtHVE50dkYra0xS?=
 =?utf-8?B?MmNiYWZJM2tlWXpRNTlnbzdIbzlpSU8xN0NxWFdlSkQvbTFiK0twRlJ2aUQ1?=
 =?utf-8?B?d2ZQS2dEZk5oZDNYUmhjYkZDd1ZsbitPUlNockV0RGtiaCtlSy9mdmI1bjl6?=
 =?utf-8?B?K0EyN0o1Q0pCV05SdEkwSVJ5UFU1UW1HTXloSmdPUTcvNSsrYWMxU2NHY1Qw?=
 =?utf-8?B?d01ZUnpyZjJzcXZVTkN6UG96bElrb3EwOFdtUjR4N0Y0OFlPV1RpTFk2QXJW?=
 =?utf-8?Q?d4o0JQ1gR1/Fy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhWY25vcVcrVUNsRE1sMXdlNXloNVpzRmJhM281U1ZSZk5TKytTc0h0azRJ?=
 =?utf-8?B?UkdibjlUbnlTbHdWZ2hxT2J6WGZZc3FIT1QrSUUvckVkcjdFbEhHeXBlU3Rk?=
 =?utf-8?B?RTh4NHR0Vk9GRHZ4elVXUEtaTTRpdmZ1QTRJUUdJSVpqOXBxc0V6L3J4U0Fr?=
 =?utf-8?B?MFpaVEdwOU00SzRpazY2R1Fya2FRaUFxak1tcnJyalNnUUM5Zkh3VGk0T3ZE?=
 =?utf-8?B?NnhHelViVGJrUW1qdmtURDBBd1R6NVFxR1kzVXhYdEtvVVp4YVpnQ3RFV1JO?=
 =?utf-8?B?NFVUa0ZmS0EzSHVqL1RnbElsRnZOY1NGdUJ4RjV4WWRmdnN0clVxQzQrdmVy?=
 =?utf-8?B?bk9zMnlTRll0cWZHUThUbkgyUVJ0OWRFV1YrMlFHeEd0L3F0VkNDTk1MV1d2?=
 =?utf-8?B?R292dno3bW1sREFNY0tReEl4dkZhRFcyMjhBUjFHQkZGRFJFYWFwZ3dKNElM?=
 =?utf-8?B?c3hjSVZjbGo2YjBSejBTOFVESStSZ2hub05yZFFtMERVTE5BN3Mvbmd5YzZ6?=
 =?utf-8?B?bkdXdnVTb3RRdmdDTVVCZUtNN1pick5ObG02Zno1NW5RdWhUQWpRUGloWElB?=
 =?utf-8?B?M2FGOW1MczZCRjFZZVcwdmdUeDcvMEpnbWhxQm15Uzd0OXFabVJ6OU1vTEdk?=
 =?utf-8?B?YXdrOFR3Y0dlcVJmaG5xVXRkRVFKcW9UR2NYREgvaW43SXBJbmY4NlhXRW5p?=
 =?utf-8?B?MjJFeXhyRFUza0dxMzg4UzdLRlpQU05ESkhvK2xWVUVOOGdRaDRrMkl0cTNp?=
 =?utf-8?B?TENJSTloV0s1N1VISWFYdkdUNkZzd0hxbTZQVXhtRzd2YTNTZ2RXR2ltMmMz?=
 =?utf-8?B?T2dUdjViaytTd2dCVWRWZGRQYzhaSmEzMGdKMG5tVE84Q0YrcUdNaXlvZVlZ?=
 =?utf-8?B?RXR4WnYwdzgySHI5Q2pQN2RCS0hqQ1dYRWlUbUNMb1VPc2U1L1UvS2oyN0pv?=
 =?utf-8?B?ZmpIc0oyb0JyZnFRdy9maVZWY3lrSkZSN2R1bmRSdldlWkJkdDJVRzY2aVdi?=
 =?utf-8?B?L1VhV1gvc2RLa3lycUd6SXdnN1FuRUVYZkZqdkJVeXVxS3RrdlM2eGo0V3V6?=
 =?utf-8?B?eG9yU1lkQWFQbUNuZlpLN3RaMjJiVjQ3dFRORHFMSEtqcDhWUFlwMEVnWkNR?=
 =?utf-8?B?U052ejY0bXBmak14bkVxdHlRZWR1am1qWjNJdG9obFNTUGc2SkRnbzcxNUhn?=
 =?utf-8?B?STNrKzd1cW81RkNLbW1XcVUzRlNQVFNGOHFqa0xDOE85Mm1RcXl5ZDVSbHR0?=
 =?utf-8?B?OGZHekdKaW0vdjJ2Nlk3aU9oMzQxa3lQZ3BqcElaQ0cyRzFDQUJsZk9RSzlP?=
 =?utf-8?B?djZHcEExQlRVM3B4OEhIS1RIMTQ3TkF5RGJFc2R1eVhkMnVuYjBoQWtIN01S?=
 =?utf-8?B?dlpEVnhMWTNHczIzRmIvLzR4RmVlRmRsLyt6UklWbzNUUUcyS0hoeXZuQXRs?=
 =?utf-8?B?dGk3VWs4SGhwa081cFZoTVhVV1VreGVocllPSkxmZVpuQURJQnlkZ0tzRjk4?=
 =?utf-8?B?RjRXbzlEdDhRVU9yMG5nRWMrbElCUWU4bzVIZitpUUUweEdncTVhS054bEtJ?=
 =?utf-8?B?aFdjN3RHdWpIRkhFaTRRVGJURFAzRkhsNjRoMy9yeVc2Q3VrL0wzYnZ0MmZI?=
 =?utf-8?B?OFZpT1Boc3lIaGJuN09Yc1JPN2dReUdDVVpOL0l2TERmM3RCRlBSZWxYVEdh?=
 =?utf-8?B?RUFySlB3OVNqZGJMWTVpWWtvMEgxZW43bUNGd3JwZVdIZVljS3RGUDdXb3Rq?=
 =?utf-8?B?M29CM2FDMjM0SEVqcFdWWGNUM0JkVkFBc0YrN255SVlqODYwV2N0TlMxbnNl?=
 =?utf-8?B?dzBBV1BSWUxXcm5ZQUJBUWpDUUhnU0laYThsOHlRUXBPWHl1S2ZvNkh4aG4y?=
 =?utf-8?B?WHBiM2xFT3IvNnFrZEQyTi9EQkpJM2lEU2lwejlJU2E0Z1hMZnM4UHdnSGpS?=
 =?utf-8?B?ekl3MGNNcnpsbHR6dkdMYmN6SU8vS0F4U3NsL29GcUZ5QmxoN3JXRjArWm00?=
 =?utf-8?B?d1JvWGs0ZWtvMFRpeW0xYmdNQUs2bDYwUlN3OXJoblAwYXZVUnYzbGE5Z2Nq?=
 =?utf-8?B?eEdjNVlLWlpzbWJkMFlmZ016T1JzS1RVQ29NODJzb01OQ1MrNFZaNFk5OEt4?=
 =?utf-8?Q?DAqfq29r+S/bbL6sqy932SfNw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac18637-4792-48fd-b433-08dd46b77100
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:06:24.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zv4wwhuRUolHY1A4zRzbodaW5rJ/CllQkoq5K72tPIl+u+VnKrepUWbKKQzvtsIX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648
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

Am 30.01.25 um 11:13 schrieb Thomas Hellström:
> Rather than relying on the TTM watermark accounting add a shrinker
> for xe_bos in TT or system memory.
>
> Leverage the newly added TTM per-page shrinking and shmem backup
> support.
>
> Although xe doesn't fully support WONTNEED (purgeable) bos yet,
> introduce and add shrinker support for purgeable ttm_tts.
>
> v2:
> - Cleanups bugfixes and a KUNIT shrinker test.
> - Add writeback support, and activate if kswapd.
> v3:
> - Move the try_shrink() helper to core TTM.
> - Minor cleanups.
> v4:
> - Add runtime pm for the shrinker. Shrinking may require an active
>    device for CCS metadata copying.
> v5:
> - Separately purge ghost- and zombie objects in the shrinker.
> - Fix a format specifier - type inconsistency. (Kernel test robot).
> v7:
> - s/long/s64/ (Christian König)
> - s/sofar/progress/ (Matt Brost)
> v8:
> - Rebase on Xe KUNIT update.
> - Add content verifying to the shrinker kunit test.
> - Split out TTM changes to a separate patch.
> - Get rid of multiple bool arguments for clarity (Matt Brost)
> - Avoid an error pointer dereference (Matt Brost)
> - Avoid an integer overflow (Matt Auld)
> - Address misc review comments by Matt Brost.
> v9:
> - Fix a compliation error.
> - Rebase.
> v10:
> - Update to new LRU walk interface.
> - Rework ghost-, zombie and purged object shrinking.
> - Rebase.
> v11:
> - Use additional TTM helpers.
> - Honor __GFP_FS and __GFP_IO
> - Rebase.
> v13:
> - Use ttm_tt_setup_backup().
> v14:
> - Don't set up backup on imported bos.
> v15:
> - Rebase on backup interface changes.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

@Felix at some point we should do something similar for amdgpu, it 
removes the 50% limit we have on TTMs system memory allocations.

Regards,
Christian.

> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
>   drivers/gpu/drm/xe/xe_bo.c           | 202 +++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h           |  36 ++++
>   drivers/gpu/drm/xe/xe_device.c       |   8 +
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>   drivers/gpu/drm/xe/xe_shrinker.c     | 258 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_shrinker.h     |  18 ++
>   8 files changed, 513 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 328aff36831b..b3738bcea11e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>   	xe_ring_ops.o \
>   	xe_sa.o \
>   	xe_sched_job.o \
> +	xe_shrinker.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 6795d1d916e4..9fde67ca989f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -514,8 +514,13 @@ static int shrink_test_run_device(struct xe_device *xe)
>   		 * other way around, they may not be subject to swapping...
>   		 */
>   		if (alloced < purgeable) {
> +			xe_ttm_tt_account_subtract(&xe_tt->ttm);
>   			xe_tt->purgeable = true;
> +			xe_ttm_tt_account_add(&xe_tt->ttm);
>   			bo->ttm.priority = 0;
> +			spin_lock(&bo->ttm.bdev->lru_lock);
> +			ttm_bo_move_to_lru_tail(&bo->ttm);
> +			spin_unlock(&bo->ttm.bdev->lru_lock);
>   		} else {
>   			int ret = shrink_test_fill_random(bo, &prng, link);
>   
> @@ -570,7 +575,6 @@ static int shrink_test_run_device(struct xe_device *xe)
>   				if (ret == -EINTR)
>   					intr = true;
>   			} while (ret == -EINTR && !signal_pending(current));
> -
>   			if (!ret && !purgeable)
>   				failed = shrink_test_verify(test, bo, count, &prng, link);
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c32201123d44..a133d66587b8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
> +#include <drm/ttm/ttm_backup.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_tt.h>
> @@ -27,6 +28,7 @@
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_res_cursor.h"
> +#include "xe_shrinker.h"
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_vm.h"
> @@ -283,9 +285,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   	}
>   }
>   
> +/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
>   struct xe_ttm_tt {
>   	struct ttm_tt ttm;
> -	struct device *dev;
> +	/** @xe - The xe device */
> +	struct xe_device *xe;
>   	struct sg_table sgt;
>   	struct sg_table *sg;
>   	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
> @@ -298,7 +302,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>   	unsigned long num_pages = tt->num_pages;
>   	int ret;
>   
> -	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
> +	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> +		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
>   
>   	if (xe_tt->sg)
>   		return 0;
> @@ -306,13 +311,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>   	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
>   						num_pages, 0,
>   						(u64)num_pages << PAGE_SHIFT,
> -						xe_sg_segment_size(xe_tt->dev),
> +						xe_sg_segment_size(xe_tt->xe->drm.dev),
>   						GFP_KERNEL);
>   	if (ret)
>   		return ret;
>   
>   	xe_tt->sg = &xe_tt->sgt;
> -	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg, DMA_BIDIRECTIONAL,
> +	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
>   			      DMA_ATTR_SKIP_CPU_SYNC);
>   	if (ret) {
>   		sg_free_table(xe_tt->sg);
> @@ -328,7 +333,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
>   	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>   
>   	if (xe_tt->sg) {
> -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> +		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
>   				  DMA_BIDIRECTIONAL, 0);
>   		sg_free_table(xe_tt->sg);
>   		xe_tt->sg = NULL;
> @@ -343,21 +348,47 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
>   	return xe_tt->sg;
>   }
>   
> +/*
> + * Account ttm pages against the device shrinker's shrinkable and
> + * purgeable counts.
> + */
> +static void xe_ttm_tt_account_add(struct ttm_tt *tt)
> +{
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->purgeable)
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
> +	else
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
> +}
> +
> +static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
> +{
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->purgeable)
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
> +	else
> +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
> +}
> +
>   static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   				       u32 page_flags)
>   {
>   	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>   	struct xe_device *xe = xe_bo_device(bo);
> -	struct xe_ttm_tt *tt;
> +	struct xe_ttm_tt *xe_tt;
> +	struct ttm_tt *tt;
>   	unsigned long extra_pages;
>   	enum ttm_caching caching = ttm_cached;
>   	int err;
>   
> -	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
> -	if (!tt)
> +	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
> +	if (!xe_tt)
>   		return NULL;
>   
> -	tt->dev = xe->drm.dev;
> +	tt = &xe_tt->ttm;
> +	xe_tt->xe = xe;
>   
>   	extra_pages = 0;
>   	if (xe_bo_needs_ccs_pages(bo))
> @@ -403,42 +434,66 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>   		caching = ttm_uncached;
>   	}
>   
> -	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> +	if (ttm_bo->type != ttm_bo_type_sg)
> +		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
> +
> +	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
>   	if (err) {
> -		kfree(tt);
> +		kfree(xe_tt);
>   		return NULL;
>   	}
>   
> -	return &tt->ttm;
> +	if (ttm_bo->type != ttm_bo_type_sg) {
> +		err = ttm_tt_setup_backup(tt);
> +		if (err) {
> +			ttm_tt_fini(tt);
> +			kfree(xe_tt);
> +			return NULL;
> +		}
> +	}
> +
> +	return tt;
>   }
>   
>   static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>   			      struct ttm_operation_ctx *ctx)
>   {
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>   	int err;
>   
>   	/*
>   	 * dma-bufs are not populated with pages, and the dma-
>   	 * addresses are set up when moved to XE_PL_TT.
>   	 */
> -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> +	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
>   		return 0;
>   
> -	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> +	if (ttm_tt_is_backed_up(tt) && !xe_tt->purgeable) {
> +		err = ttm_tt_restore(ttm_dev, tt, ctx);
> +	} else {
> +		ttm_tt_clear_backed_up(tt);
> +		err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> +	}
>   	if (err)
>   		return err;
>   
> -	return err;
> +	xe_tt->purgeable = false;
> +	xe_ttm_tt_account_add(tt);
> +
> +	return 0;
>   }
>   
>   static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>   {
> -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> +	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
>   		return;
>   
>   	xe_tt_unmap_sg(tt);
>   
> -	return ttm_pool_free(&ttm_dev->pool, tt);
> +	ttm_pool_free(&ttm_dev->pool, tt);
> +	xe_ttm_tt_account_subtract(tt);
>   }
>   
>   static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
> @@ -888,6 +943,111 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	return ret;
>   }
>   
> +static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> +			       struct ttm_buffer_object *bo,
> +			       unsigned long *scanned)
> +{
> +	long lret;
> +
> +	/* Fake move to system, without copying data. */
> +	if (bo->resource->mem_type != XE_PL_SYSTEM) {
> +		struct ttm_resource *new_resource;
> +
> +		lret = ttm_bo_wait_ctx(bo, ctx);
> +		if (lret)
> +			return lret;
> +
> +		lret = ttm_bo_mem_space(bo, &sys_placement, &new_resource, ctx);
> +		if (lret)
> +			return lret;
> +
> +		xe_tt_unmap_sg(bo->ttm);
> +		ttm_bo_move_null(bo, new_resource);
> +	}
> +
> +	*scanned += bo->ttm->num_pages;
> +	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> +			     {.purge = true,
> +			      .writeback = false,
> +			      .allow_move = false});
> +
> +	if (lret > 0)
> +		xe_ttm_tt_account_subtract(bo->ttm);
> +
> +	return lret;
> +}
> +
> +/**
> + * xe_bo_shrink() - Try to shrink an xe bo.
> + * @ctx: The struct ttm_operation_ctx used for shrinking.
> + * @bo: The TTM buffer object whose pages to shrink.
> + * @flags: Flags governing the shrink behaviour.
> + * @scanned: Pointer to a counter of the number of pages
> + * attempted to shrink.
> + *
> + * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
> + * Note that we need to be able to handle also non xe bos
> + * (ghost bos), but only if the struct ttm_tt is embedded in
> + * a struct xe_ttm_tt. When the function attempts to shrink
> + * the pages of a buffer object, The value pointed to by @scanned
> + * is updated.
> + *
> + * Return: The number of pages shrunken or purged, or negative error
> + * code on failure.
> + */
> +long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> +		  const struct xe_bo_shrink_flags flags,
> +		  unsigned long *scanned)
> +{
> +	struct ttm_tt *tt = bo->ttm;
> +	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +	struct ttm_place place = {.mem_type = bo->resource->mem_type};
> +	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
> +	struct xe_device *xe = xe_tt->xe;
> +	bool needs_rpm;
> +	long lret = 0L;
> +
> +	if (!(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
> +	    (flags.purge && !xe_tt->purgeable))
> +		return -EBUSY;
> +
> +	if (!ttm_bo_eviction_valuable(bo, &place))
> +		return -EBUSY;
> +
> +	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> +		return xe_bo_shrink_purge(ctx, bo, scanned);
> +
> +	if (xe_tt->purgeable) {
> +		if (bo->resource->mem_type != XE_PL_SYSTEM)
> +			lret = xe_bo_move_notify(xe_bo, ctx);
> +		if (!lret)
> +			lret = xe_bo_shrink_purge(ctx, bo, scanned);
> +		goto out_unref;
> +	}
> +
> +	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
> +	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
> +		     xe_bo_needs_ccs_pages(xe_bo));
> +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> +		goto out_unref;
> +
> +	*scanned += tt->num_pages;
> +	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
> +			     {.purge = false,
> +			      .writeback = flags.writeback,
> +			      .allow_move = true});
> +	if (needs_rpm)
> +		xe_pm_runtime_put(xe);
> +
> +	if (lret > 0)
> +		xe_ttm_tt_account_subtract(tt);
> +
> +out_unref:
> +	xe_bo_put(xe_bo);
> +
> +	return lret;
> +}
> +
>   /**
>    * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
>    * @bo: The buffer object to move.
> @@ -1905,6 +2065,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
>   	}
>   
>   	ttm_bo_pin(&bo->ttm);
> +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> +		xe_ttm_tt_account_subtract(bo->ttm.ttm);
>   
>   	/*
>   	 * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -1964,6 +2126,8 @@ int xe_bo_pin(struct xe_bo *bo)
>   	}
>   
>   	ttm_bo_pin(&bo->ttm);
> +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> +		xe_ttm_tt_account_subtract(bo->ttm.ttm);
>   
>   	/*
>   	 * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -1998,6 +2162,8 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>   	spin_unlock(&xe->pinned.lock);
>   
>   	ttm_bo_unpin(&bo->ttm);
> +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> +		xe_ttm_tt_account_add(bo->ttm.ttm);
>   
>   	/*
>   	 * FIXME: If we always use the reserve / unreserve functions for locking
> @@ -2021,6 +2187,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>   		spin_unlock(&xe->pinned.lock);
>   	}
>   	ttm_bo_unpin(&bo->ttm);
> +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> +		xe_ttm_tt_account_add(bo->ttm.ttm);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 04995c5ced32..9ca87973cff7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -148,6 +148,28 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>   
>   void xe_bo_put(struct xe_bo *bo);
>   
> +/*
> + * xe_bo_get_unless_zero() - Conditionally obtain a GEM object refcount on an
> + * xe bo
> + * @bo: The bo for which we want to obtain a refcount.
> + *
> + * There is a short window between where the bo's GEM object refcount reaches
> + * zero and where we put the final ttm_bo reference. Code in the eviction- and
> + * shrinking path should therefore attempt to grab a gem object reference before
> + * trying to use members outside of the base class ttm object. This function is
> + * intended for that purpose. On successful return, this function must be paired
> + * with an xe_bo_put().
> + *
> + * Return: @bo on success, NULL on failure.
> + */
> +static inline __must_check struct xe_bo *xe_bo_get_unless_zero(struct xe_bo *bo)
> +{
> +	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
> +		return NULL;
> +
> +	return bo;
> +}
> +
>   static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
>   {
>   	if (bo)
> @@ -343,6 +365,20 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
>   	return round_down(max / 2, PAGE_SIZE);
>   }
>   
> +/**
> + * struct xe_bo_shrink_flags - flags governing the shrink behaviour.
> + * @purge: Only purging allowed. Don't shrink if bo not purgeable.
> + * @writeback: Attempt to immediately move content to swap.
> + */
> +struct xe_bo_shrink_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +};
> +
> +long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
> +		  const struct xe_bo_shrink_flags flags,
> +		  unsigned long *scanned);
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8fedc72e9db4..c4a6062124b0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,7 @@
>   #include "xe_pm.h"
>   #include "xe_pmu.h"
>   #include "xe_query.h"
> +#include "xe_shrinker.h"
>   #include "xe_sriov.h"
>   #include "xe_survivability_mode.h"
>   #include "xe_tile.h"
> @@ -396,6 +397,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   	if (xe->unordered_wq)
>   		destroy_workqueue(xe->unordered_wq);
>   
> +	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
> +		xe_shrinker_destroy(xe->mem.shrinker);
> +
>   	if (xe->destroy_wq)
>   		destroy_workqueue(xe->destroy_wq);
>   
> @@ -428,6 +432,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	if (err)
>   		goto err;
>   
> +	xe->mem.shrinker = xe_shrinker_create(xe);
> +	if (IS_ERR(xe->mem.shrinker))
> +		return ERR_CAST(xe->mem.shrinker);
> +
>   	xe->info.devid = pdev->device;
>   	xe->info.revid = pdev->revision;
>   	xe->info.force_execlist = xe_modparam.force_execlist;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 89f532b67bc4..7406deac0fec 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -369,6 +369,8 @@ struct xe_device {
>   		struct xe_mem_region vram;
>   		/** @mem.sys_mgr: system TTM manager */
>   		struct ttm_resource_manager sys_mgr;
> +		/** @mem.sys_mgr: system memory shrinker. */
> +		struct xe_shrinker *shrinker;
>   	} mem;
>   
>   	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> new file mode 100644
> index 000000000000..8184390f9c7b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/shrinker.h>
> +
> +#include <drm/ttm/ttm_backup.h>
> +#include <drm/ttm/ttm_bo.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +#include "xe_bo.h"
> +#include "xe_pm.h"
> +#include "xe_shrinker.h"
> +
> +/**
> + * struct xe_shrinker - per-device shrinker
> + * @xe: Back pointer to the device.
> + * @lock: Lock protecting accounting.
> + * @shrinkable_pages: Number of pages that are currently shrinkable.
> + * @purgeable_pages: Number of pages that are currently purgeable.
> + * @shrink: Pointer to the mm shrinker.
> + * @pm_worker: Worker to wake up the device if required.
> + */
> +struct xe_shrinker {
> +	struct xe_device *xe;
> +	rwlock_t lock;
> +	long shrinkable_pages;
> +	long purgeable_pages;
> +	struct shrinker *shrink;
> +	struct work_struct pm_worker;
> +};
> +
> +static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> +{
> +	return shrink->private_data;
> +}
> +
> +/**
> + * xe_shrinker_mod_pages() - Modify shrinker page accounting
> + * @shrinker: Pointer to the struct xe_shrinker.
> + * @shrinkable: Shrinkable pages delta. May be negative.
> + * @purgeable: Purgeable page delta. May be negative.
> + *
> + * Modifies the shrinkable and purgeable pages accounting.
> + */
> +void
> +xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
> +{
> +	write_lock(&shrinker->lock);
> +	shrinker->shrinkable_pages += shrinkable;
> +	shrinker->purgeable_pages += purgeable;
> +	write_unlock(&shrinker->lock);
> +}
> +
> +static s64 xe_shrinker_walk(struct xe_device *xe,
> +			    struct ttm_operation_ctx *ctx,
> +			    const struct xe_bo_shrink_flags flags,
> +			    unsigned long to_scan, unsigned long *scanned)
> +{
> +	unsigned int mem_type;
> +	s64 freed = 0, lret;
> +
> +	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
> +		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
> +		struct ttm_bo_lru_cursor curs;
> +		struct ttm_buffer_object *ttm_bo;
> +
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
> +			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> +				continue;
> +
> +			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
> +			if (lret < 0)
> +				return lret;
> +
> +			freed += lret;
> +			if (*scanned >= to_scan)
> +				break;
> +		}
> +	}
> +
> +	return freed;
> +}
> +
> +static unsigned long
> +xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	unsigned long num_pages;
> +	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> +
> +	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> +	read_lock(&shrinker->lock);
> +
> +	if (can_backup)
> +		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
> +	else
> +		num_pages = 0;
> +
> +	num_pages += shrinker->purgeable_pages;
> +	read_unlock(&shrinker->lock);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +/*
> + * Check if we need runtime pm, and if so try to grab a reference if
> + * already active. If grabbing a reference fails, queue a worker that
> + * does it for us outside of reclaim, but don't wait for it to complete.
> + * If bo shrinking needs an rpm reference and we don't have it (yet),
> + * that bo will be skipped anyway.
> + */
> +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
> +				       unsigned long nr_to_scan, bool can_backup)
> +{
> +	struct xe_device *xe = shrinker->xe;
> +
> +	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
> +	    !ttm_backup_bytes_avail())
> +		return false;
> +
> +	if (!force) {
> +		read_lock(&shrinker->lock);
> +		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
> +		read_unlock(&shrinker->lock);
> +		if (!force)
> +			return false;
> +	}
> +
> +	if (!xe_pm_runtime_get_if_active(xe)) {
> +		if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
> +			xe_pm_runtime_get(xe);
> +			return true;
> +		}
> +		queue_work(xe->unordered_wq, &shrinker->pm_worker);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
> +{
> +	if (runtime_pm)
> +		xe_pm_runtime_put(shrinker->xe);
> +}
> +
> +static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
> +	};
> +	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
> +	struct xe_bo_shrink_flags shrink_flags = {
> +		.purge = true,
> +		/* Don't request writeback without __GFP_IO. */
> +		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
> +	};
> +	bool runtime_pm;
> +	bool purgeable;
> +	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> +	s64 lret;
> +
> +	nr_to_scan = sc->nr_to_scan;
> +
> +	read_lock(&shrinker->lock);
> +	purgeable = !!shrinker->purgeable_pages;
> +	read_unlock(&shrinker->lock);
> +
> +	/* Might need runtime PM. Try to wake early if it looks like it. */
> +	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
> +
> +	if (purgeable && nr_scanned < nr_to_scan) {
> +		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +					nr_to_scan, &nr_scanned);
> +		if (lret >= 0)
> +			freed += lret;
> +	}
> +
> +	sc->nr_scanned = nr_scanned;
> +	if (nr_scanned >= nr_to_scan || !can_backup)
> +		goto out;
> +
> +	/* If we didn't wake before, try to do it now if needed. */
> +	if (!runtime_pm)
> +		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
> +
> +	shrink_flags.purge = false;
> +	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
> +				nr_to_scan, &nr_scanned);
> +	if (lret >= 0)
> +		freed += lret;
> +
> +	sc->nr_scanned = nr_scanned;
> +out:
> +	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> +	return nr_scanned ? freed : SHRINK_STOP;
> +}
> +
> +/* Wake up the device for shrinking. */
> +static void xe_shrinker_pm(struct work_struct *work)
> +{
> +	struct xe_shrinker *shrinker =
> +		container_of(work, typeof(*shrinker), pm_worker);
> +
> +	xe_pm_runtime_get(shrinker->xe);
> +	xe_pm_runtime_put(shrinker->xe);
> +}
> +
> +/**
> + * xe_shrinker_create() - Create an xe per-device shrinker
> + * @xe: Pointer to the xe device.
> + *
> + * Returns: A pointer to the created shrinker on success,
> + * Negative error code on failure.
> + */
> +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
> +{
> +	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
> +
> +	if (!shrinker)
> +		return ERR_PTR(-ENOMEM);
> +
> +	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
> +	if (!shrinker->shrink) {
> +		kfree(shrinker);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> +	shrinker->xe = xe;
> +	rwlock_init(&shrinker->lock);
> +	shrinker->shrink->count_objects = xe_shrinker_count;
> +	shrinker->shrink->scan_objects = xe_shrinker_scan;
> +	shrinker->shrink->private_data = shrinker;
> +	shrinker_register(shrinker->shrink);
> +
> +	return shrinker;
> +}
> +
> +/**
> + * xe_shrinker_destroy() - Destroy an xe per-device shrinker
> + * @shrinker: Pointer to the shrinker to destroy.
> + */
> +void xe_shrinker_destroy(struct xe_shrinker *shrinker)
> +{
> +	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> +	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> +	shrinker_free(shrinker->shrink);
> +	flush_work(&shrinker->pm_worker);
> +	kfree(shrinker);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
> new file mode 100644
> index 000000000000..28a038f4fcbf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SHRINKER_H_
> +#define _XE_SHRINKER_H_
> +
> +struct xe_shrinker;
> +struct xe_device;
> +
> +void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
> +
> +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
> +
> +void xe_shrinker_destroy(struct xe_shrinker *shrinker);
> +
> +#endif

