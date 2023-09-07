Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4979732A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C515210E7FB;
	Thu,  7 Sep 2023 14:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FAE10E7F8;
 Thu,  7 Sep 2023 14:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR22jSzkQyzPncNFGfBYiBffdtjfF+oLOt3Sd0F6UDXJBhIrPyyDTwDnsL0podVfLuBBLazAgwTs6fesCqtUlMyzAVl6hpgvilztYHy1MfpCCWGayITZt9BWf/5jBYKP5yJDuVbn8ve8Yv431LmoKUprFQX4pfFqmZdIFLOd8usfSJzcQmnOPYUtTStsmf6eyZ0QJ4Ung8O+zD/oSjA3LbURDjoMMrLlI3ZmA7GB0Z8oGSukuZp9hxmD7V9KjL2801JPbHmerkZdOGex1e77MJrx5PSKWntahkvb+oLW0r4Y7jb532ErH6X+3YmZoxX5Z/LOc17VysVL501NI1k8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4oFzcEqEm9Y51RaSZaBeUG9k4g4RyESYL9Bi9i3mzw=;
 b=TvjG7bMs3ReFYgFM3XBLYfqGlFNQQaFqJvWO8mNug6GXuDojIdl0ScpLJTtjYuPnpSikr/UIXiCkEzeZD85Hto3ySrb3i8wUV9QKo/7cLTLtYfJyTQTvJ74MopDGcVNAPW7sybyCAL83KiRudNXbhZoEoxAhhEaDh+vjlIpF4TxsZLppHn1MXpRyOZ5e0UmzWPLe4xkbPuhqpOOEZG9IAKbi2+u6kCYhrZkeDGlk77dy9PYO7UhKXfSJiRjLKfcbzPed69yz6oGFFj4r7KgkkWOze5HnQVG3PbabL+3/BVI6gBfp4xEJutxfOl0qQir7N6m9sLh/y4fwNJir3eFP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4oFzcEqEm9Y51RaSZaBeUG9k4g4RyESYL9Bi9i3mzw=;
 b=UFocBHLbQBP+JRd1TL9pR4ZvyOy968UZPEwSzbo6ZNfrUIKucL0RG6IR4lUpAjPz/0i1Rq3OrtxKVPHyhPZa5Fzo9oMS/4ES16+WKqsE3v07RDp1kTcNdyshfw82+3z/pIlBfSGsn36ZDCL63bcsR2D0b2Cot4gzH2xtWfk/0ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7135.namprd12.prod.outlook.com (2603:10b6:510:22c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 14:49:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:49:46 +0000
Message-ID: <95610a20-4364-7ba8-88be-3e303018ea79@amd.com>
Date: Thu, 7 Sep 2023 16:49:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
 <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0052.eurprd02.prod.outlook.com
 (2603:10a6:802:14::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f59e80-3ee2-4a8c-fb95-08dbafb1ad9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPnTBBwp7Y+RliGIJvQML2/wxBPtCbX1X/d+84GoBbMDMmWh0RztD1tgw6uIuv83TnI1KYOSddqOdXXfQO8HMtIZ7qiyvBZmu8t6uBfw3AFKK2M7CHahHWsO1Gdujnk1wdE/C4lLvA2lB1UY1xinPu+IsUxllQQ0tM4BTOw8zmu3ygRGWoB6LcDeotdvRLIE1sb9eXj8sTnX1bX/mDaASprDtIyJBBdmZaO42BBMjIYMLBDLyoGu1q7PEIGh4WXpyC57hVIi+hCbKD58sUEFo67s4Oq5AeH63YbJMQrpMWc5THvP50Pe0yfjr+Q+nFXJyF0mBRkLBMord6KKk4j3n1pQaAFsPNyA/eSJ7ujgqjFeLo4fLkJl7VZQG2WOlJ8dwxo/MWunP54Aid18+bmFynooP5O7pN/I4q4gH675Vxk9VaDgCUxRc0UiKiFZBY9liD9rNabk+jywLdG/LIhJ0GQlqJpTd8n9xuw5qGgq2tujJaSAoHsFKLk7gW52GAme0Vs3rmJoeJu73b/jT23g27rtw4cZuvVG7gGVn8eEwRWVcOA7RFsu0WoReFgwWkbunql6J4+MPZnd8wczMzSfwdJ6HdJ1b7OZRmHD8AwQbDSdt1o080FxRW5fAAMXVrVH8/CafBgUp8HeUqoIwnXbTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(1800799009)(451199024)(186009)(31686004)(6666004)(53546011)(6506007)(6486002)(31696002)(86362001)(36756003)(38100700002)(2616005)(66574015)(26005)(6512007)(83380400001)(478600001)(8936002)(8676002)(4326008)(5660300002)(66556008)(66476007)(66946007)(316002)(41300700001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3pNVUFiRUU5TmpuMmhTek9tWmJMRTZrOUtFT2xzdFZqcDdaZTQ3bVVzWXNa?=
 =?utf-8?B?aTF1ZTVSZENpTGpEV1lQc2FVUUxCd090ekZpdkJlbEQ2MGVadUFoV0JBYzY0?=
 =?utf-8?B?WFBQMnhZTFl6Ui85TUc0Yk5XMHhOZXBneUluaTRtV2wvMzBEWXlPVitQMDJW?=
 =?utf-8?B?SG90SWh3ekFrTk1FYTIyMjNOVi9jL0VRM2NCem9RM3J6SVBucXNhdExnSk9x?=
 =?utf-8?B?M0YyS0JoRGNrL1B5VlROVzM0NmZjRzRUc1FpYU85SWM2a3NxSVR4Z0NsbUJp?=
 =?utf-8?B?OVpaUWp5eUVGOWRQeXZiYzc3UDVMeHIwbGFLNXB2eGhVSEw5NTlRTUU1UmFI?=
 =?utf-8?B?WVBDVm1jMzBud2pUVm5JQkV4ZFd6VklHU2g2QWIrczVXcFZiY29NaG0yWWxq?=
 =?utf-8?B?K2p0Wkl4Y1A5SDNJTW44MFhPQThTSVRJZVJXU0pMK0wvdWFvSDVocFB1R2d5?=
 =?utf-8?B?bXgyUGdwTkNRVHNuaWFnWXdXd1hzYzR0N0I3SDZ1bjJ0MzMxRnJPNTVlbVBi?=
 =?utf-8?B?QTB5L1hBWVRrb0ZZcWlVZWVLQWl4c3JxM1lSc0dQbFc4R1F6dG9mbDNpcjFs?=
 =?utf-8?B?OGo0MDl3QWRDQ1k3SCtubU43SmlUZlRqbGFYbUgxdjg0SXF2UHpDRG03RThW?=
 =?utf-8?B?emw2SU40bmR2K01PK3JKWmgwc3hDOE0vN3UvN1RRcHFpMEhESWV5L2ZFd3pX?=
 =?utf-8?B?S0xqNGlXa3hIVFpsUXlKQ3RCZHJMdFZDVGw2TTk3ZnF5QUpHZjhoTFRTbzJB?=
 =?utf-8?B?eEhEenlmNWl4QU0rOExxYzE5NTN0SU9icHM4U0xTSUdYUnlvWDBrQWxZOVZp?=
 =?utf-8?B?QSswYVJwemhiWEN4aDJQSFQ0Z1h5Tk00emdIWitnOGdaeHpjR0NRcjZteTZh?=
 =?utf-8?B?NDJGZVR6ak42MDBZS2JPUHllV0dzbVVoeVdNS09BVmkzUzNra21oQnhsdGRi?=
 =?utf-8?B?ZEhVNkNwUHNQVWFUV2ZSTElIMnNZY3BlVFlEbURUcDJCWVkxcU1CTStvZmNT?=
 =?utf-8?B?cnN6aHl1azFFZnhWSC9taWEvT1dleHlqODdvSWZSRFhSaTNtblliaSs2NWJS?=
 =?utf-8?B?TVZFK2lQSFBwWDU2VkRwZ2FJOWQyMklFRldGTy8rVDJRN1A4VHZQRVNva3Ur?=
 =?utf-8?B?WG83c3c4UlAwNDNvTnU3Z1VKcDNmMlg4MU1nVHFKRCtWQVNWc08rMVN0aE9Y?=
 =?utf-8?B?VVFoMUpWb2g4ZExZcXJmZGo5UmlwYVZWdHBKTlZFVzNXZnJWeUlMeXYvUzZi?=
 =?utf-8?B?T3BmckhxVDlDUzNTTVhvdk9PWUNYa2dsUjd4bjMxQm1wdlBGdXZqR00rVFVX?=
 =?utf-8?B?YXVLQ2dROEVCTjFYeG5jeExrYWtRY2d0ZWFkS2J0ZWpiUU9KWHhTNFd4WjJh?=
 =?utf-8?B?OG93MlZaekJWejNua3JneWlXTUQyZW83dUhXQmozZ3BHS2JjdDdEZm1jNDRL?=
 =?utf-8?B?UXY1VFlKR3JKRk8zQVNzUjRjWFFpaFJnK1hLejdOeElsMkUyVWdkbkVVQkls?=
 =?utf-8?B?Nmg3Y1gwR3B1RHkxNWhIRVBzbkRNcE10b2F4a2hLems3dWc2M3ltTjhVMGdQ?=
 =?utf-8?B?YW9XUTBieW40dUx0L1kyTjl6RjhNbzhTTVNjc1VFOVd4VWlVU2k5WTNsZGlj?=
 =?utf-8?B?b1MxNUgrajZwUzVhdTBoWEZUUFdsUDRXeE5HZXptQjRYSSs0VDJBbWQ5eWpI?=
 =?utf-8?B?bTZyRk1ENERIemd1aklpbHpZZFZhTGNPVkhzeFVVNWhGUUgwZVNlRkVsd2Nn?=
 =?utf-8?B?N1dTcGJGRHd5Tk1HT25SdW9kak9sNjV5TWhERHU1ZkxDZUdqNmh3NnRSMFBJ?=
 =?utf-8?B?eXJMU1pNaWNsODYzTmhtRzJDQkU2d0MrOXZXSjJFWi9IMkZ2UDhjemxiRitk?=
 =?utf-8?B?a05xZG9KS0daZzl1eGNnRjdQQzMyaFcxQWUwVjNHcy9WVUQyUSsvSmE0WVBw?=
 =?utf-8?B?L3h0ZHhKdW15ZWtISGhsWTUxUGF3K2FJM3ZDUlRweFRUek5wdlF4RXBkNkUr?=
 =?utf-8?B?VkYzbEFuY1hrSGlIODFjbVIvMktUb2hiVkMvbzE3bjZJWGxKNGhUQWE3NFBX?=
 =?utf-8?B?OUVqQlNrS2ppMVVFdzVoVUxQeVVWbTJkYTdNTDhiTmJVSjZMUlladlgrZ2hk?=
 =?utf-8?Q?RxuoP6kfpvHFMQRWbJI1V8gXR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f59e80-3ee2-4a8c-fb95-08dbafb1ad9f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:49:46.3791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaPpwdt83DiNFhDqZC0kIgv/jZXhCTd0WM9LjY+CNWii6cuqVSsYBspNyOQGrjXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7135
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

Am 07.09.23 um 16:47 schrieb Thomas Hellström:
> Hi,
>
> On 9/7/23 16:37, Christian König wrote:
>> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>>> While trying to replicate a weird drm_exec lock alloc tracking warning
>>> using the drm_exec kunit test, the warning was shadowed by a UAF 
>>> warning
>>> from KASAN due to a bug in the drm kunit helpers.
>>>
>>> Patch 1 fixes that drm kunit UAF.
>>> Patch 2 introduces a drm_exec kunit subtest that fails if the 
>>> conditions
>>>        for the weird warning are met.
>>>
>>> The series previously also had a patch with a drm_exec workaround 
>>> for the
>>> warning but that patch has already been commited to 
>>> drm_misc_next_fixes.
>>
>> Thinking more about this what happens when somebody calls 
>> drm_exec_unlock_obj() on the first locked object?
>>
> Essentially the same thing. I've been thinking of the best way to 
> handle that, but not sure what's the best one.

Well what does lockdep store in that object in the first place? Could we 
fix that somehow?

Christian.

>
> /Thomas
>
>
>> Christian.
>>
>>>
>>> v2:
>>> - Rewording of commit messages
>>> - Add some commit message tags
>>> v3:
>>> - Remove an already committed patch
>>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>>> - Condition the test on CONFIG_LOCK_ALLOC
>>> - Update code comments and commit messages (Maxime Ripard)
>>>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Christian König <christian.koenig@amd.com>
>>>
>>> Thomas Hellström (2):
>>>    drm/tests: helpers: Avoid a driver uaf
>>>    drm/tests/drm_exec: Add a test for object freeing within
>>>      drm_exec_fini()
>>>
>>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 
>>> +++++++++++++++++++++++++++
>>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>>
>>

