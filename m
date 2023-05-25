Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EA710757
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2134210E157;
	Thu, 25 May 2023 08:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3F910E157
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG7s+06mc/8BB7BOFUao4R/0X9gewpB4hUyTsabZlocExtVS5do7oYJ3mWs9c1FP71+CZ0IQLBdcwHfvqEH8x7txvfBLd5+6Uap1NYfsKlfzOUbeOkYFsMgJQHiJe6zi/C62ZLU0L3mO/78+D7U74rtSkjUgMyMmns9JCz7Fy19KRgQawXzPnDbVcHoC80MktBxGU2CX26j1UmwxQ3dF4lCxwdmS4MbZ7+acCnTUqy0yOM8WPCxwNCSsnQPKhqrZmBbUpDTZ7qGh0LdJXQ+/1bUdLfKO2zIMO1yYzyTdD2fJYVRjQ1plo4xggV7YPwMjNXVjOkjPkjd8GPDwQBnQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbYxIacoGa58vAewdh1UXLJ6uzbAzOLblKnvMTfC/SA=;
 b=PRz6F5SImwFZ/6S25kDaJ+2nhrQ7coe9DxCVAqt0vEqOMFh2SDXUVLe4jH7Y0j+zZW8qUp14WwDbWIiXnuoHqOXiXzdRsz7R5n8XRwrC+9j1b/nhcIUv615gG4pF95dUSUaDahD+baPoJPaiSsFqhvBeH7uFS6yNP2fl3GVzFEhtfrpOkdfNL3FB8jCEO9aWPSe9yDNLvSBeeYMEldG9j3bceCrMaujNesO+0tK5kC++jH8TaGH8N96UatqmGEKd1JXvYgZs+SHVs2mdmYLDxKIzgJ7Y7xpz6V99hYHk8LuZBwdF6LOWZOEXRICa4Likw9aWIcD9CXxoPEvnglVaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbYxIacoGa58vAewdh1UXLJ6uzbAzOLblKnvMTfC/SA=;
 b=5RDV3l25mVKXfLBKE4422j50/4yb/OvAu+qP7jMDx3qMYRXTcJYmjumUa0WzejmFThLBNkaivw0CWxzcNfe7MmnS/VY/HZ/oN2WW2bEjnVRDrKxd9/Y/e5x2iValHrK0ALkmqMP+PdBdzs2X3/eWXIoJZyryZ5G9w7eAT1l/f3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:30:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 08:30:11 +0000
Message-ID: <7b324b38-833a-070e-7f95-e1bd2c48782f@amd.com>
Date: Thu, 25 May 2023 10:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: KUnit tests for TTM subsystem
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cc04343a-de20-4e60-aca0-695ba69253df@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cc04343a-de20-4e60-aca0-695ba69253df@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: c3003244-b016-4fff-75f7-08db5cfa413b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHactImAK2DPBZxotZ6UIa3SdFBYz6uJUEAxcTpubAqfpsNs1udVbXG+IU5BwXOKaDbPdVf/sYGoLeXtYVHMKVC/LtXh+m1OyFEA21Ki2SWMb4zC/1xEL9wORXg5LOS1dJjLnZZCeuCqwVtmRHsgffI7G554QdhJgLt8g7r2RkdGvd6ccZQudOMH3nyNL2hz1mVRGBUjCM3nGDXx4wV2zfJ5rc1NMRPhG7iC9h/zBVRNcBcXPerWC2H11xvZPnyjddtkTbynZNAcmIes/TUcG5vCH1OmcCbD/UKTegUzRQpeJLOHHa9hL+IIgsuoka1aI11zBxzYNvseptyBoV+4S0efo8HG282GM/pB4N1Rh6T+XwyDLR8Bn6Y2x9gIY7thZ4AfuoNm2zRl9qeWyYvk66Pirag5J5oIIBMRXnTCNNF/L64lnJiQcbPNceezQk/FAP+HfPU8rgA+BNznBdUAonTXTAANPd7IygjRy/YiIrqMYl6IshW7WuewXDqWS5LY1KB/yfirxut8F1qBpTaXiYn0P6RpvA7avCtYixc1LUI/FBIy1sY2fZQvi+2lJ+r+Xza01tMVbDfhpU+HOOdwMtDRjY+UrHE5URQ8mNAzTRVc0TE5TAsSgJuZmuorMs/olzDYNx0BlmO5gtC6HGSn+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(83380400001)(4326008)(38100700002)(66476007)(2906002)(66556008)(8936002)(41300700001)(66946007)(8676002)(31696002)(316002)(86362001)(5660300002)(36756003)(2616005)(54906003)(6666004)(6486002)(186003)(6512007)(6506007)(31686004)(478600001)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtPaWR5V3dqWnBhd3Q4NUFuTEtFL3ZxQzBxQWp6dFVuNEZtcUxESWcxcUl5?=
 =?utf-8?B?VVhoV3VKaVd1aVp1N2Zlcy9mMmY1Sm5nUnc2YWFqL0pyZ20rT1hENDNWbXIy?=
 =?utf-8?B?Umk3UXk0ZzB4aDBJaEVtVUhZWWNtZzU3Z2o3K1dTeVRxaUtFN2M5azV0MWFS?=
 =?utf-8?B?T1FaNWRodmdXNXlmOXBVOEdFbHZvTWpkSUE0Sy8xRm9TN3ZJNUpXWHlQUTd3?=
 =?utf-8?B?N2pyQ2RVdUFPR1dFaFdoTk1HZzVDdXA5T1lNMEdobERSK1h5Z0ZhbUlKRC9E?=
 =?utf-8?B?ajZOYkxzci9pWERVZFp4TXpUUmFPRmFPVnBqc0JzVjllaGwwVUtubGUyZzNB?=
 =?utf-8?B?dkwyTXBtamx3Q2xNOHhiV3dLeVV4Smg2YVoweVRBaktmS0wvc1o3b3J2S1Jz?=
 =?utf-8?B?NDBrc2x1VTlKbXU2YUIzRUtUcWVaRFNnbGtZVElFbmEveTZlbTAxK01FbEVI?=
 =?utf-8?B?SnRvalNCQndQMitOU0dnTmxvYjRPODlhSkw4OGgrZkdURitOSnhna0ZzYlB4?=
 =?utf-8?B?dEdaVis5K2VXbDdNVlE3aTA0TFE5ZVBwekV2WjZEcE0vS1BpQUZWVU5FaFBp?=
 =?utf-8?B?LzYrbUhiTHlPaWt6NTZTbTFIYnE5TGJZSzc5NHhXRytiazdvUm9UdFg2QUpS?=
 =?utf-8?B?NHdHTzduZHFpbVZZMGFLamZjOFpza2J1SkJaY2t0dTl2U0o1M2JmN2F0VTZC?=
 =?utf-8?B?WDJFbW8xOFRkaFRHUXQzeFJ6OG9oNHRTN3RWYzQxbWlIMHhKT2lUdUpFeC96?=
 =?utf-8?B?ZTVxSTQrenJ2RjF0Qittc3dGanB5bW9FV0dqQmhCa3I2UXJsU09FeWxFTW5i?=
 =?utf-8?B?UUxSb1NhSy9NZ29NTnE0OGY2UVJNMUdFWHQ5NFozdkYxanRYaUhOTkF0N2t0?=
 =?utf-8?B?cDhTL3RzWFJiMlNtblBPUlhURHdEUUZIL3c5K21kVVhYdFNIRytyaXJoSng0?=
 =?utf-8?B?d24zc1NYU1FjNHZ6OWtpQ3FHUnhQVmhEMTFLeGJ2b3RoQWFBTHVGMzZvRCsy?=
 =?utf-8?B?UmJqTUtPZUNOSEhsc3pLUFhaZnNsalpyeDJpeHdsU1A3d1kyRGdUY2RZYURn?=
 =?utf-8?B?bys3bitZWWJYU1BMdjdjMXFiMmNudkhiOXF1NlVTVTJ3cEs4NVFrQktqUnRV?=
 =?utf-8?B?MXA5Y2Y5cnp2citOcUgxTmhkSnVSdTJJeUNUaHM2N3NVZ0ttMVk1WXl6VDNV?=
 =?utf-8?B?ZyszUnpPT0VUbUdseTcwdHAwc2U1a1VNVXQ0WGd1eGk0RDdsM2djTUdRMmNU?=
 =?utf-8?B?eXpYRWUveUx3aytYbk42amQyeDgxYlo0MzIxTnA4MTZyd09BdzhpV1QyKzZl?=
 =?utf-8?B?V2VvMDg1STVpWE8rVGpocGV3ZHhtVkJDWmpUbVV2cDUrbDI1RTA0UVh2YjZD?=
 =?utf-8?B?NmhvRDBjc3V4VUZQV2E4VzNoVDNqOE1PZHFIV2o3SmR4OWI1d2Y2UklqMFYx?=
 =?utf-8?B?OUNRaDEvWkw1WHBRQUVvSmliMitwWmdXZ292TzB1UkVBeGRoVWhTa2F2TXY3?=
 =?utf-8?B?VzJtTnJSbjFEU0pTMVd6NURhM3UxaWtRdk9lYlE1V1RHeWQ1OFgvcjRIclRq?=
 =?utf-8?B?SGRoSmE0N3ZRdCsyZS80SXk3QWVIV2ZCWWFiSWQ1VlJTSHpRVzhWa2NBUTZz?=
 =?utf-8?B?K3oxQkpNZHZlOFdtRkNNZXhGNWFCUUJhcXRubDk1ZVp4Y3lmNnlpR0NRMHF2?=
 =?utf-8?B?blJYc21acGV2S0pmTHUvbWpzM2pJWnNERElMYkxmNnFQZlN4Syt5aURwb3BG?=
 =?utf-8?B?R0pnT2ttYXVrSzB6MmJCTk8vQW9yc2lzZk5nRXdZTzR2ZjFuZUprekZlMm5I?=
 =?utf-8?B?RDk5TVVEU3N3amNkOU9ZeEllRDlPcXB2R3lHc3FKUk5BWjZJVElZZWJKY1lZ?=
 =?utf-8?B?YnpJUWZmZ0NwcUN2aGZIempaaXdNOUF0eUcrV0xyaHFOVGJiZ1p3ZEtGY1BI?=
 =?utf-8?B?d0tBVGd5M2w4VjUyQ2hDTDZzS0RqbHpxSXpyL2U4Y25vd2lBQmIyVTBzNXBL?=
 =?utf-8?B?NDUwV0NzbjU0YUt1TjMwMU8xM293bzlzUTBpczAwejRFcUM3SmgveWUxRUpE?=
 =?utf-8?B?M3R2ZWw3TkpPczIyN0ZtdUo5UXNqWDhZT0FqdHQ5WFIxZzlteEQ2WkRoL3FW?=
 =?utf-8?B?LytSVGRIZG01Nm0xY2VtUGZ3eXFCU0dwSHhCZjRFUHVUVzA2WVFGeXlRNXBq?=
 =?utf-8?Q?q5THQu+5AIVJNOgztrdjfiR6T8N4X5ROOi2zH34TEu3m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3003244-b016-4fff-75f7-08db5cfa413b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:30:11.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJB7AFcxuqiji24L4BK/9OCpuWwDX63swraQgB2crByrcB7t9X8DZMnmvo8a1QSR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

Am 16.05.23 um 16:02 schrieb Karolina Stolarek:
>
> Hi all,
>
> I'm working on KUnit tests for TTM subsystem (nothing RFC-worthy yet), 
> with an aim to provide better test coverage for the code used by i915 
> and Xe. Before digging deeper, I wanted to check if the priorities 
> outlined here make sense and clarify a couple of things.

oh, yes please finally somebody taking care of this :)

>
> My plan is to focus on testing the higher layer structs to cover 
> what's below, e.g. test ttm_pool functions by testing 
> ttm_device_init() and ttm_tt_populate(). I want to split the work into 
> a couple of batches:
>
> 1. Basic testing of structs (init/fini and reserve/unreserve), with an 
> introduction of fake VRAM resource manager to test 
> ttm_resource_manager init. Add some ttm_bo_validate() test stubs.
>
> 2. Eviction-specific testing with ttm_bo_validate() to trigger 
> ttm_mem_evict_first(), possibly with a separate testing of 
> ttm_resource_*_bulk_move() and ttm_bo(un)pin(). Add tests for 
> ttm_resource_manager struct, including ttm_sys_man.
>
> 3. ttm_tt_(un)populate() testing, adding more coverage to what was 
> implemented in (1) and (2).
>
> 4. Testing of ttm_bo_vm_ops and mmap/kmap/other features offered by 
> ttm_bo_util (not quite clear on how to approach it; suggestions are 
> welcome).
>
> Is there something else I should pay attention to here? I can share 
> more detailed plan listing specific functions and what tests could 
> cover what, if needed.

Sounds like a plan to me. But I suggest to start with the ttm_pool since 
that one is easy to test and initialize without the 
drm_device/drm_gem_object stuff etc... Write a patch for that, get it 
reviewed and upstream and then extend from there.

>
> Also, I have a question on how should I treat drm_gem_object when 
> testing ttm_buffer_object. From what I understand, the majority of 
> drivers initialize and use the object, but the TTM BO can work without 
> it. Should I write the tests against TTM-backed gem objects or use TTM 
> BOs with a dummy gem object embedded?

IIRC VMWGFX was the last one to not use the GEM object, but Zack 
implemented that a whole ago. So the GEM object is now mandatory.

It should be trivial to initialize. Just see the GEM unit tests how to 
come up with a dummy GEM driver and GEM objects. IIRC it was something 
like 10 lines of code for the EXEC unit test I've wrote.

Thanks,
Christian.

>
> Many thanks,
> Karolina

