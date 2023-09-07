Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57340797319
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC4310E7F2;
	Thu,  7 Sep 2023 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E01F10E7F2;
 Thu,  7 Sep 2023 14:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjavN0qlnXbxqe9X/Z8X9XwTgBM4yQAGoTrWZJKH20JXClfnp2VJgKdqCXtVoavAo9loJBlgkhFAtCRX2DI3rel+S/NvZXBuN7TNu1yaZROzYURyw9DxvTRzzE7xQ68mCh4SsEhOcsTCu8bt50lSDBPip2pfgI/KQxsHiSEm2EXVJWJaaG8fnPZ711kadpSEjzfeT+akKajyF2BacP6jZmg2U/02+/bw0bmVit26nawFd0UCpE7hF70D79DESmElDesAjpZ2RlADforcD33IOh8Zlv8qQWGmG1hLWPSgZYQVOwrBXjlbx1toI2WUIbY/RhvQzMuieoKf2fC3ucX5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7mZgtNuxumEbuZ897mgDuLdfwj3igNRfE4fbvHISlg=;
 b=KBEHF9C5sNSSrnmZAfkj2bptwC3Ez8vNSRL7YFQg2LShqbNXJkNK7gsAZ4Ebsa/78aOAlmZuuCmCNv8GHWtbH2pLrKHIF29oEB6qftyol/Qp0Rzb3cbR9bqeWApOviSo6p+oS7NDTIwuBrhQNEyJsEXV8w3oQjOQyvrnVbHh1yT9dxr7KO/quVh+GjSdTw0HsDtfy0oRKs4jt1exumxZmtPjHO4QFhbVkrnq+804Y5/gmJmNFSMj3Zgl7v0QRr5CjVmeOkMhcz8JwBc6pqhE8bWrffkaAWOcgLAVu9XOl0MFHpv7jJmEAHDtSGsKm01SHrV9OUJlFCVTQaYVDtxUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7mZgtNuxumEbuZ897mgDuLdfwj3igNRfE4fbvHISlg=;
 b=RbPK+h6FxfiTqokCkS8pMOCPY4fXZ9nSNNaosIb/za9nH83Kw+LgAi0h+qc42pQODp77fFhPF0Yd4FvPSRuH0gKPWCeemdXVHBXZhyP740qAhzWTv1S4vs2Vhgex4JvnNIptVMYgGcjbZ9udTFzcMVvemZu7NDUePDZwYv1KD0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 14:37:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:37:57 +0000
Message-ID: <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
Date: Thu, 7 Sep 2023 16:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e08ca8b-ea99-451f-ab94-08dbafb0073b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeN8u5VfUU3F1SMS31MPPN9L1OOFBz05XiJ5nCUXvIMNrZfEm/YLz2kc3UQtfPQh86GjBrBfZZFsZqxkLCyhVW9HRd1lpzQ5pNtlOcLZO4VZ9zxBMatgDxXlGx47GA/SRxdcGQO+tgFgV8SgR7F0mYLPzSZsGcooy+dp2uhFSlmmyVcDCIp4lkIdOURuKJgLdx4kLoYRZ8c1uuysRNZgcQ5IAA6Re1JNnwHot/zmpqI320vtlbNFEXDyGw8lA7BmyMfukR+h+adY7XyyXRoxJvmcSCrYz2llZaHywBK+8LIG49NcQ7ohIU8zQhjhoJ7uKl/d3Jj9PLs2b95worT50tIHvZ9EQxJV9Q4ROR+c+o1gZVKVcWWAQP6g8TovfuVINVgBQc7vyd5VGWGnoROd0MVMiksniLx2xUIlyxIS5EBfGzdT6heVxwm/calDNDFs7TJAQhc+oxHV3oFaJ3P+nFYKZaxwAsliX/3cVr/0L3QyrBNCAvQ24o80WSP//lgroUxP+u0QoCGbuOeE/PSCDWkZMe2Wjg5Ab2WG2ftL3ctf0+7IC0KpSLyhnu98gjnl7z9XWA5q4Gnk5NMEFBfyHDu1TqWTlptWChmZQKKc1D9hvPP7GqxWHtzK57sXvRgzLHRx89X0ybVn8J60wXuRFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(1800799009)(186009)(451199024)(8676002)(4326008)(66574015)(8936002)(83380400001)(478600001)(66476007)(66556008)(66946007)(6486002)(6512007)(26005)(6666004)(6506007)(41300700001)(316002)(2906002)(5660300002)(38100700002)(2616005)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRSd2svY3pNRUo3Y0tmQ3M5NmNRLzdveGxacE1oemRxclFRSmgxWUtuWFQy?=
 =?utf-8?B?ak1PSEtpU3ozWVhSQ2pKUDhOUGUvYzkwaEtwWjRWd0hqdkxqdFRQWkNlMkR5?=
 =?utf-8?B?QVFmc0RZcXd1dmJLNXBGZC9VeE5wOGpPOWVmRDFlNG9VcGFJc0VOamIwUWlX?=
 =?utf-8?B?MFpSS0JtQXk1NFl1ek5QSXh5NGZ6bDI4VSszZnY1ZU9QRTJqREF2T1l0ZE9s?=
 =?utf-8?B?M3lDQ0w2QXo0MUZXdGh2bkVLUGprS3ZKV0d4UDlMSlFBN0RjQlR4Z3pPTXlB?=
 =?utf-8?B?WFA1T1RoUGJINHNKNWU2R0JWdWFOY3dEQ3dROWNFb1FzTjRjOTJPOWVyU1ZB?=
 =?utf-8?B?cnhJZ3R6UDJxYU9uTWNWWGViLzNha1krOHQ4OXhwRFdNMk5SS0crdGRFYURi?=
 =?utf-8?B?NFoyQzZBNmgvSDZNWUNDZmZrYXJvUlZhUFVmUSsxUkU1M0U5OElGUW1tZkEy?=
 =?utf-8?B?cU1tbGdaTlJEQmEzNllmUGp5WHZVUEEvU2VvclRQVVpKSE1lcFBNS1dPRFBL?=
 =?utf-8?B?MGc0bWxpR0ZzcGM3eGVKUFBrK1RST0FPVWFWZC96MVhIKzJvWFlYNk9FWG5P?=
 =?utf-8?B?YVpLaml1aHhSMmEzMFZ2RXhGQ2dsYjZUemVMenU3aEdwZ0hzc3JVSWYyV1lG?=
 =?utf-8?B?WndtT1VIdVdEV2gyZFhWRDl3ZytsUE1MTzdoVzY3RnlGVC8xQ3k2QzAvZEdR?=
 =?utf-8?B?ZHd1M00vSFdMNUZsUE9tNjB1amJpQUlrZ2VYMVJoaUlwRjJpRWtKaHp5TVRu?=
 =?utf-8?B?Y2ZieE9KMEllQzl6TUdIeXk2UlhSS0hXenhGZDF6am45d1EvSWxUY0lVazZW?=
 =?utf-8?B?MXU1Vnc2R21aMnVMUDhvSkVKQ2RlQ3pxLy9Ha2ltY2lUdlNLRXVNeThYbUd1?=
 =?utf-8?B?WmhseCtlWTkxZXZLdTlXN3dqa004WnVmZWlDRFVNWHpLdWduLzNKbGFLckpo?=
 =?utf-8?B?amt5ZkVHMk53V3gzbXZaejlwT0Jmc2lnTnZUWFI4SVFjb0t5MkhwVXdxT0Y1?=
 =?utf-8?B?NG4xRWIrNGZOVzhQSTlQQzg2SmhvY295US9GQWd0NHBiZUNCWnZ2QTVTN1ht?=
 =?utf-8?B?cEpLNzhYc3kvR3UrT2ZCVExwaU1Zd2s5dDJkR1l4WExRWWU3UEIvUmpDL25L?=
 =?utf-8?B?REVwM2hyaVVneWl2M2tiaUR6YTJtK0lDWEdXNDNpdThVRVhINEZTbWZ1WDla?=
 =?utf-8?B?d1lpS0pVVWlXc2FWUEVmQjF5bmprV3BZUHR2T2ZVeEtlTjZyN2xnLzA3b2Js?=
 =?utf-8?B?VkM2WlZsdUNDR1ltMElUV0hkdWdIYTBvOU42cHMvZGYvZHBHVnAwMEl1K0N5?=
 =?utf-8?B?L3NwZWNMR1d4dThMU0tvdmQ5dzdMZUpiSHZYcUVEQU5WL25pbTlBc053K3FJ?=
 =?utf-8?B?TWtocENQVFJrNWlIaE13NDAwYjJZdkUvcTY0UXowVkU4Q0hiOVd0d1pReUlW?=
 =?utf-8?B?Ym5lLy9qSHFlRWEyVlJFZXZrbDV2UHpHQlYzWjFFR053SFJFT2dkTktJY2Nh?=
 =?utf-8?B?MVkwOG5ZaW94MWpFRTgrMzIrbnJhSC9sakxLdlR3aTI0eVNMMFJXTWRJVlhw?=
 =?utf-8?B?WVQwMkR0TVFJc0ZIWExKVzdtTElRTUdCMWZzUjlwQkdEK0Fqcm5hM2thakJM?=
 =?utf-8?B?U3Z0NXAyMzdQTkwwMFA2dDhENDZSVTYwRjRTbDBZcEx1V0FqKzM3VGxCcGlC?=
 =?utf-8?B?REtNZ21XL1Roc21nVDI5c3AwUndiQUdYcUVRN3FUeDJCWGZHUlM3OU5mRC9w?=
 =?utf-8?B?ZjlHemlaVkR1NzRVUzMzOUdjWEd5QXY5WnRicm1VSjFBOGZGWEFabE5MOW01?=
 =?utf-8?B?RzhJZXZzZ2QzZjk4VDJmNlErMHJYYXVlUmcyTU9JME8yVWdZUnpOeGd5bWh5?=
 =?utf-8?B?enZUT0VVbWpJK2wyT2hHZDZ5cHlaNGJGbjVSWUI4MFJtdTBhc2dicEhsWEk4?=
 =?utf-8?B?NnJiei9DeEZWOVJ1SFV6bFQvR0Q4R1dJL1dRcGxUSVZ5cEpXMU1UbXZZSGI1?=
 =?utf-8?B?MWRkTWI3aEJ0UzJQM1ZKb1MrTGl3eEZpeEVwTUJ1aE5Nd0t5L2JQQmRLWjdp?=
 =?utf-8?B?SzJOcG93eU5Fd2QyY2xkaVdBdXBYZ1B1b1NJbW1aUnZlbEFBK25zYzA1QWd1?=
 =?utf-8?Q?uj8hh22U+iggI4l58oKvEbaRZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e08ca8b-ea99-451f-ab94-08dbafb0073b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:37:57.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zjt9A3VsFLSg95Uzezex5wB4I28TJMGmlWcCkud3KOCWJLYjMXnENphk/pkW6YUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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
Cc: Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.09.23 um 15:53 schrieb Thomas Hellström:
> While trying to replicate a weird drm_exec lock alloc tracking warning
> using the drm_exec kunit test, the warning was shadowed by a UAF warning
> from KASAN due to a bug in the drm kunit helpers.
>
> Patch 1 fixes that drm kunit UAF.
> Patch 2 introduces a drm_exec kunit subtest that fails if the conditions
>        for the weird warning are met.
>
> The series previously also had a patch with a drm_exec workaround for the
> warning but that patch has already been commited to drm_misc_next_fixes.

Thinking more about this what happens when somebody calls 
drm_exec_unlock_obj() on the first locked object?

Christian.

>
> v2:
> - Rewording of commit messages
> - Add some commit message tags
> v3:
> - Remove an already committed patch
> - Rework the test to not require dmesg inspection (Maxime Ripard)
> - Condition the test on CONFIG_LOCK_ALLOC
> - Update code comments and commit messages (Maxime Ripard)
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
>
> Thomas Hellström (2):
>    drm/tests: helpers: Avoid a driver uaf
>    drm/tests/drm_exec: Add a test for object freeing within
>      drm_exec_fini()
>
>   drivers/gpu/drm/tests/drm_exec_test.c | 82 +++++++++++++++++++++++++++
>   include/drm/drm_kunit_helpers.h       |  4 +-
>   2 files changed, 85 insertions(+), 1 deletion(-)
>

