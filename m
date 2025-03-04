Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66FA4DFE8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB58A10E4F3;
	Tue,  4 Mar 2025 13:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3dfSGSsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602B10E4F3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaFqhRO27xiqCgQEzPZ27ehnS8iyJJMIKJqDcrdsToBun9yPDc8X+v58CEix9nKda6fuwmjZpIKKLO6CcoQ7kobgBcwcQWcIrZSxCQmeyrenw/deYsrfScPZbjsAOYeghKj3vy/NOAg96ZcAeEE/eXulOdMQI3KOrt4ZOiUtpQVVbNMtNUQweHZPSJXDGSQ+CudxmCG197DzHqHc5bLNltJGv+yLWBUHNd61LCtlxjNVEWgqm43215SOyhHj0KCnZGrXaZprcch9l6Xgx3hP7kWCqdasFED+v6nNjEOm14a/zrtoGavMmePVPeDLld+OfR/Ah1jIHeIVdWVoduQRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5+Qvz4wKGzw9WJMebONs+bZ27kqULGZJ7Caj30KtNo=;
 b=jDc0UjWKEreXquFlOZcEArHOx91np8BgnLCh9s6TaGyNOHYclACQBlMtj76S8mt8Qmkq5CjThdVZyf9Z+clkQpvCKrP7x6rNzwrnnp1hWlUCvLAz+kpqZ12E71wgqZ/YH3+94Iiekl6HldyGNU63LQCjSXHC1MOGeN+ec+z6c/oVvEpk6pQPR2q9zDu2wMuz4SBOy0WmjIFIV+p97kHi9+5ewtV2gAOOUa6MMNOKAkxyCGQJLKmK0j4bbQYsagjmthp8b/A/yt5Nu56Ua7oB/W5dupWeM/gRTaqj37DOUsP3KygZ7oNZhuIWHOTTXj48g01xovm2HvMkzsvaBcRbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5+Qvz4wKGzw9WJMebONs+bZ27kqULGZJ7Caj30KtNo=;
 b=3dfSGSsgr9p/dYcjOfakZfvLNKPq0G+1YvKLPQKUI2ZRs32lwpsLYztQ2rvVllQ7hcu4Ncg6CRSgVFNxiTnE/v5ylW+dzCEsZ1t/JQC+ELwuCddCBgBAKSYt3O9lyF9zfl79WGqMSMq7R+523xCKfix6y/CMEKq2IEvT58J7/kY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7849.namprd12.prod.outlook.com (2603:10b6:8:141::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 13:56:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:56:10 +0000
Message-ID: <892844c3-5a09-4f65-b0e9-9878279d375b@amd.com>
Date: Tue, 4 Mar 2025 14:56:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] DRM scheduler kunit tests
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250304131030.52850-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3839d5-8bc5-4449-b7c6-08dd5b245198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?My9jbUxyMkdmRkh2VzhGQ3IvVEU4cDFrZTdMa3h0VlB0dE45TTJXRUpWNlMr?=
 =?utf-8?B?WjVHRTUyK0RWcWFxWjIvZCt0OVFYM1g1QUlxc01tYTh0N3RxL3cwZExPa0Zs?=
 =?utf-8?B?N3VmUER1aHRyc2QzM0g1NWZpSHRLanpJMklad1dja2F6blRrQkRoQjFTQ0oz?=
 =?utf-8?B?dkptakFneDMzc2Vnc2lBWDN3NkNic0lWSDFTcy80YVFUT01ZSk8vK3REVURu?=
 =?utf-8?B?cllObmZXMVRQREI0SlJHM1JPcHlOclYxcmZsTUIvY0JsbEVUU0pDQXRQeUtY?=
 =?utf-8?B?dm8xREUzT1ZidWlZRk5qek9YQ3FCTWYzd3p5M3REVHRRSW54bGo2Z3lOZFJS?=
 =?utf-8?B?b0lRWVNIL0JJOXNTL3VzcUlocGErVk45RUFRcG9qbmlpM2NlY3NWQ2hSdlZ3?=
 =?utf-8?B?NDg4T1B0Wk5RLzg0ek9Lei8vRWt1aTFMbWMvS09DVWt2MXZOL05jMTBnMEJN?=
 =?utf-8?B?TGZMc1BFWTM5TnpnQnowWWM2L0s1N3FPVUtoYnN0R3UzV3B2Smg3Mk5KODlz?=
 =?utf-8?B?eS9xS2hZQXBoWldJS1N5T000NTZXZkVRaGt4U3Z1bHJHbVJpVFVXc2VQSHNx?=
 =?utf-8?B?bkZsblRMZjdBNmhyTjZQSDJmaFB1RHpjdWdrckdNblIxeEpYdnRHVnJxMTBF?=
 =?utf-8?B?VjJreC9LbXVoMlVZRmxWVDEwS2R5S3pzdVdlKzUzY1pGeDhDb29SS1ZkekJZ?=
 =?utf-8?B?L3l5N21LNnBEejB4U2RLUExuZjNmWHJmRmplWWd4dGFLaW1zWWxna3lmb00z?=
 =?utf-8?B?VTI0dDZiR2hYeEdsS29zOVJBYU9wRCtFa3UwVWRqZHhzN0ExZ2FlT0tkZmxp?=
 =?utf-8?B?L0k0dndpTzZRUENwSEd3TS9jYkNmVEdtMTQxY2FMT1NtZ2JSUlFrUkQrRWMw?=
 =?utf-8?B?OE5MSzFGM1NpQmpmRXVJazFRV1VkTnZxYUNaUDA5c0JDcC9RV294NnVub25K?=
 =?utf-8?B?NEFCenZTSW0vTGhnQlBVWmhSeThyQU1XTy9pRklaQ29nejcxR0ZJbGhvTGNV?=
 =?utf-8?B?WkJHRVlINGJDc08xODJxSGgrUGRMUWRoT3RFOFJZTzVydEh2Y2FrRDI4Yktj?=
 =?utf-8?B?ODQ1a1lHWC80aFcvcE9tKzVDb2lvZXJqRms4a2MwR2xqRFNHb1A1TWRpdDJk?=
 =?utf-8?B?dElqWFB4NXFzSlBlUU1VVXRXU3Q1S2dUZnM3T0tUTmg5Si9CRHdSdlpnOG12?=
 =?utf-8?B?eDhjc1hjU3pTcnFsWlEyK3J5QnU1SGRTUlR0Nm5kK2ZQZWdnNXlTNHVSMkwr?=
 =?utf-8?B?QWQ4RXUyeEpNUDh6OUVvU2pBZUoyKzRRVHRlVXpPNGs3NStaZjBYR1NoNWNa?=
 =?utf-8?B?NDNEMFllTDZOdXhVQlJpS1FlV3RDNGhnNjlrbzFvUXY4V3k3SGZyUll4b0VQ?=
 =?utf-8?B?SW1MbEpuc3lDSC9KQWxPTjFkZ2ZZVkVSdDFkSThHN2ZmaFFydTVndVZQWmhU?=
 =?utf-8?B?V0dxRW5wNTA5ZWpFY1djdWpyWmdUZkZMaTFMbFl2OE5sb1M5QkNaM1Irb0tG?=
 =?utf-8?B?a0lzZTF5dUdrWDBSMUFZU3JEVFlHaVY1ZlUzSGVScm9yeG9IeGRxZ1pMS29C?=
 =?utf-8?B?ejNhOW5ScnRpSDRHMkxiVjlDRUVGUENGZlI1M3ArajFneTNzZGpSOExNaFNX?=
 =?utf-8?B?WWorZmNaNWxFQ3AzZEdHelVTbU1KaEt6VzVXRXlka1AvMzcyNHM0cEZRU2lj?=
 =?utf-8?B?d2NFcU1PUjU1cXRGYmt0enJLSlZnSHRFNTJGOFljakhNWkVmNTQ4KzlabE9N?=
 =?utf-8?B?T0NUVUhTVkxNaS9ZTERhTFVPVkFlakVCRythNWJRYVd5MmtvNHVNRzBmSVlh?=
 =?utf-8?B?KzhJd0FEbGNCbUpiN2hwaWMwaTN3VnhrQUNrdDFLWkRocTBHcktmSlFSSVZU?=
 =?utf-8?Q?NSpdHbKsEaeHH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTVVZlR2c0FZVHM0RG4wc1FrVGtEZ2hVb0ZuWElLdmlyRlpZTGVQNllMNDJq?=
 =?utf-8?B?TC9wWnFLbE5EZ1liQjh2R1NjaVAxRVFTMjBQMldZSU41dXdkNHpCck81ajdo?=
 =?utf-8?B?N0FUWXFhcCtNSmhvRnRtdVhtbFR4QzMvWjJNNDU5dXNRVmpLM1lLbEtYc3dR?=
 =?utf-8?B?Q1JmdnhrY05WNXA1dHFxSitlZHVrZEJuNStqVGtPWlNXY1VJRDhSOEdWdW55?=
 =?utf-8?B?T1dTem1TckJhZHJkdkhGODh3cTBTWW5IVW56YTVvNFluR1BiNXlNdHF1c1lu?=
 =?utf-8?B?WUtDZGpmQ2txejFoeGQ4UWVoZEJXTWhMZVkxa0hwNllGallJSUxlRE9QUkZ5?=
 =?utf-8?B?TmNnNXhJNFJ5eExxOTFqdTRlUmhYSjNBZ1J1Y0pRQk0xaWQ0N0I0RVVsdHd0?=
 =?utf-8?B?VTF1L1NPR0hhNDBzT2orRXQ1UTk4MXdsanlodjNQQlM4UmZRa3FSU3VGb2tH?=
 =?utf-8?B?K00vVnlESUpJUWtKNWtvcmg4V1pPRmd4RFl0bE1iS2NGbXdPUHd5aUVYZkZS?=
 =?utf-8?B?anp2ZUxBMm15dzN3M3Z4VUtiK081UWNieEdwQWMwN1V1VTd4WTlHR0h6dG5x?=
 =?utf-8?B?cmVqcGR2QUdYaG5JbUpJZTNSL1F5RmJsMHRNckVqRXpqOGV5SGwvYmFZeVli?=
 =?utf-8?B?azd3U3NqM0hKUVFvZDdMMndSaHJ2RFhPbHptemxadm9vU2ZzR04wT1dLNnZm?=
 =?utf-8?B?U2RoOHZScC9GVDhTNGIxcEVBcm42ZGMyb0pZbUdJMzZaRTRsZWJKNkFJSWl2?=
 =?utf-8?B?VHlBTzZyL21WalplRk8zUDlHV2FrS3VhN2lPSGVkRGJ2MDFpWDdCNkEyaXZK?=
 =?utf-8?B?dlk1aFFIbEtuT1NXYWRMMWs0M2dBNmVPZWEyRExna0ZEa0Vuc0ZSMzZiMkVN?=
 =?utf-8?B?NGQ4aUY5Y3UxTjIxWVJHQ2VReFVHWEd6SXZHRTBQS1hSYWlEb04wbTA0cTAz?=
 =?utf-8?B?YVNXT2h0L3hDajRJT1hUODZ4UEc0Mm05d0FpeUFySUs3RDkyaC9VUnZ4V0J3?=
 =?utf-8?B?bWZTSjZKSVJvQmFOaFEvaU1XbGE5QmJ3NVpmN0VMRi9BdDI3bFFpajlTUGl4?=
 =?utf-8?B?SHhqcVdpenhRNU05bFFkbG5haG5ENk8wM2VReUljVDZhNVlGNjRydnFFbzRy?=
 =?utf-8?B?aW1hRnVVQkMvV0MrdHYySU9DV0IxOUxiNG5wWjJKSmx0aWpqZXEzM1J1aUFu?=
 =?utf-8?B?UStxVGhrd05Td0tkV0tmYnFBSGwyOUI2MlAzSXhMNFlSdjBPRklQNmdIL3lL?=
 =?utf-8?B?cERJeW41Q2tHcDF1bmpERjZ0U2lCQy9sNEM1a3dnK05HNFlxL0dyNkZTendh?=
 =?utf-8?B?aVk4U0Z3eWMxWW1PTlpFNm50WjVnRDdDanoyMnZkVWo3WDFBYVgzYUdYVkZE?=
 =?utf-8?B?Syt4S1AyczFFRGNCSUQxUjFQU0UzQ1Izd3JwdHd6bVJjVmFaaDhEQmJoN2ZX?=
 =?utf-8?B?U2ExNEl3ZHpUcUlaWGpiUkVLaWtIT0hYMFNUbWhhRjlCUU9rbTFNVDcxY1hL?=
 =?utf-8?B?UDZtbm1HeDBFTVhkK2t6eXFKZEYzbzB2ajRHM2dKWUpuK1B0dlRabE9PUk9J?=
 =?utf-8?B?L1EzVXJwQ2dLTWZxVXA4RkwvYmNObnpacGtrd0lqOVlxMjhhREg1d3QzWEFx?=
 =?utf-8?B?eDNROXJ4aGJsL0Urck54bHErQVN1VkpvQ0JBejdCdWI4OWFFWUpqSFU0NExO?=
 =?utf-8?B?dFhiTVVrb2VCQzhNN3BpbzBSd3krNWdHMW1YZE0wV1NBUGdadURnOHhOaUpP?=
 =?utf-8?B?SjA4NGZHcjEvcjZ3ZExibzFWdmFnc0lmTFU1UUUyK0pMaTcxaFZRYjNGajdR?=
 =?utf-8?B?VXBRSVZTcmo3dWFmTVVCTnVKd2lGYzZ2c01UL3pWWElVb0daWU9YWVA3VW0y?=
 =?utf-8?B?SGJXUGxNRUpWTEliVllGbENKNmc1Qm9HdzVVT2dzSmg1eFdScERlN2N6dDVa?=
 =?utf-8?B?MDVrNk9idVdnWFRxU3B0OVFtWmsyQnVWelE3TWNFQTdYRmFGMGFOV3lZSkxj?=
 =?utf-8?B?NHpnZGcyclJTWGlVaHM1K09rejVaSmFJRWRVUEpwaGs3Q3hINWZjc1hYYnNL?=
 =?utf-8?B?QXh2cEZrTU9TL1pwejlnOTJpZncvYXhrZERmOTlKVlUvTDZuVFRlWUR4ZVJB?=
 =?utf-8?Q?Q7YbNGL1oZqQLYuLHYmt+qhG8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3839d5-8bc5-4449-b7c6-08dd5b245198
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:56:10.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJrXiE5bmqmqRXAtPjzXmJZ9Z3py9OMhbWJBlt+BcIcRi09GY5SQQhu8UduCksGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7849
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

Am 04.03.25 um 14:10 schrieb Tvrtko Ursulin:
> There has repeatedly been quite a bit of apprehension when any change to the DRM
> scheduler is proposed, with two main reasons being code base is considered
> fragile, not well understood and not very well documented, and secondly the lack
> of systematic testing outside the vendor specific tests suites and/or test
> farms.
>
> This series is an attempt to dislodge this status quo by adding some unit tests
> using the kunit framework.
>
> General approach is that there is a mock "hardware" backend which can be
> controlled from tests, which in turn allows exercising various scheduler code
> paths.
>
> Only some simple basic tests get added in the series and hopefully it is easy to
> understand what tests are doing.
>
> An obligatory "screenshot" for reference:
>
> [14:29:37] ============ drm_sched_basic_tests (3 subtests) ============
> [14:29:38] [PASSED] drm_sched_basic_submit
> [14:29:38] ================== drm_sched_basic_test  ===================
> [14:29:38] [PASSED] A queue of jobs in a single entity
> [14:29:38] [PASSED] A chain of dependent jobs across multiple entities
> [14:29:38] [PASSED] Multiple independent job queues
> [14:29:38] [PASSED] Multiple inter-dependent job queues
> [14:29:38] ============== [PASSED] drm_sched_basic_test ===============
> [14:29:38] [PASSED] drm_sched_basic_entity_cleanup
> [14:29:38] ============== [PASSED] drm_sched_basic_tests ==============
> [14:29:38] ======== drm_sched_basic_timeout_tests (1 subtest) =========
> [14:29:40] [PASSED] drm_sched_basic_timeout
> [14:29:40] ========== [PASSED] drm_sched_basic_timeout_tests ==========
> [14:29:40] ======= drm_sched_basic_priority_tests (2 subtests) ========
> [14:29:42] [PASSED] drm_sched_priorities
> [14:29:42] [PASSED] drm_sched_change_priority
> [14:29:42] ========= [PASSED] drm_sched_basic_priority_tests ==========
> [14:29:42] ====== drm_sched_basic_modify_sched_tests (1 subtest) ======
> [14:29:43] [PASSED] drm_sched_test_modify_sched
> [14:29:43] ======= [PASSED] drm_sched_basic_modify_sched_tests ========
> [14:29:43] ============================================================
> [14:29:43] Testing complete. Ran 10 tests: passed: 10
> [14:29:43] Elapsed time: 13.330s total, 0.001s configuring, 4.005s building, 9.276s running
>
> v2:
>  * Parameterize a bunch of similar tests.
>  * Improve test commentary.
>  * Rename TDR test to timeout. (Christian)
>  * Improve quality and consistency of naming. (Philipp)
>
> RFC v2 -> series v1:
>  * Rebased for drm_sched_init changes.
>  * Fixed modular build.
>  * Added some comments.
>  * Filename renames. (Philipp)
>
> v2:
>  * Dealt with a bunch of checkpatch warnings.
>
> v3:
>  * Some mock API renames, kerneldoc grammar fixes and indentation fixes.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Acked-by: Christian König <christian.koenig@amd.com> for the whole series.

>
> Tvrtko Ursulin (5):
>   drm: Move some options to separate new Kconfig
>   drm/scheduler: Add scheduler unit testing infrastructure and some
>     basic tests
>   drm/scheduler: Add a simple timeout test
>   drm/scheduler: Add basic priority tests
>   drm/scheduler: Add a basic test for modifying entities scheduler list
>
>  drivers/gpu/drm/Kconfig                       | 109 +----
>  drivers/gpu/drm/Kconfig.debug                 | 115 +++++
>  drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
>  drivers/gpu/drm/scheduler/Makefile            |   2 +
>  drivers/gpu/drm/scheduler/tests/Makefile      |   7 +
>  .../gpu/drm/scheduler/tests/mock_scheduler.c  | 323 +++++++++++++
>  drivers/gpu/drm/scheduler/tests/sched_tests.h | 223 +++++++++
>  drivers/gpu/drm/scheduler/tests/tests_basic.c | 426 ++++++++++++++++++
>  8 files changed, 1113 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/gpu/drm/Kconfig.debug
>  create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
>  create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
>  create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>  create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
>  create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
>

