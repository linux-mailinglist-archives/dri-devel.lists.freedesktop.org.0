Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36F97723C5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378C889B70;
	Mon,  7 Aug 2023 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5BF10E292
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691410957; x=1722946957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F3qbO3Kx0H+jWolq5ij53M8wVP5b1q/rHveoEgzPZLs=;
 b=EpYzyFCdW5jt+qGHNADaXyEkLjBJOrx/V3GK8DlMfu6m15lEJTKhCR9N
 7lDy1CesLpp+eZQt+aFoY6VRNSgHLa5I0WgVfzdUdWVuQL5wprPLyvV+N
 jrHj2ShpzfJyUAUaAPucxznlQWHTdXSaR6J8+YoSp28vM8YaigVs1+94k
 3t3l+cIIhbYqkOrUvT7J2XrjWqyRgV/zmhlybhzDTPcBtFjTZ3wR0nuIN
 9+Cc20jbWq2s8Wxg336dwoLuIfOiJ8QC5VbT2d/3/2MISXu578NZ1cYpP
 w3m+HYHoOmSm8hbxcZQoWXft3eNgS/PWWgX+u99xyiImqD7T7mClBvHpT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="401500083"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="401500083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="1061565338"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="1061565338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2023 05:22:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 05:22:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 05:22:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 05:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGzeGQ8o3VMtYoNU5P8Pb3z6CjHr702DVBqrAm2afgRuD6tRckcsCFtIYTGRrtBLEPT8ndoYqECb1uu0ShHBzdV0iD+ScoWnm29GWtGyv8RilM9RNvdScelAQROq+hFzxsnfus+ktLXtHRbTXAYrpVhbCtE62rCbyyPMio7NVrYVr3l/QqHZQYn8diXDf4aToAj6PYs992j6ONeX3NVJ7p7HVPHUXrz9hQPHwwxU/m+3rw6uzXeGHghSzD0ULX3fA1V76s1FWMS1IXrAODlVOUCLRJUSib0EGoAmlhJ7FiZdDbYk872DeIguTozzoxbNnjrg8q/ZR8k3hg9H1BhdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=volVkAR/5uaOyzSP2WlCfu6UwLxCirc2iRgqB46/e0I=;
 b=W4CeS3wS9MG7rFuqbpIrkLt30I0yInfVC1KXYGSiaIVc0qAS/nxkP7PkmnRxMKjUoZrIefeZicV+/E04nXZiRVxeXb+0SjAWd8rpzBx+/VwqP8Lr+WP+ji2GZ5GnCquZorgMUXO0pU2bhY+Su4Dne1MAGfynMyBTujDT+wxGilCDKxSxHUIPShXLixT7dI+IPaACF7WqtlYpWrj2MP21QRYJdUS1ywb+kfNLyXibxJpo6VqoNJFu5khrB+QpsDuCCevFRNmbhwukRfZoBZLDWHOTeGoRpwOgLJMR63FuORAhC7u8Zsussk/VUMyHVMe6x7S7QG7cJ4IjFF7hwQDlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 12:22:33 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::f6dd:da7f:fb1:5bce%7]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 12:22:33 +0000
Message-ID: <47890cdd-1ab8-49c5-be64-5927d5640c21@intel.com>
Date: Mon, 7 Aug 2023 14:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v5 0/3] Introduce KUnit tests for TTM subsystem
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1689343130.git.karolina.stolarek@intel.com>
 <c22c2984-70fc-be19-fd7a-a99e06003ec5@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c22c2984-70fc-be19-fd7a-a99e06003ec5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eaaa76-426d-4a59-519b-08db9740f9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujEFO6v7cFCtoPtjnoyWvH6NWMc7KVim9EOu7/eFs46P0dP620TREOUubkMaeKmgasHkzigG8SGbLN1FMqZ3Td2VWvZzTHAzePkG2Ttts2twMT5ZW4wLIzBeSPc85aB8Ouox9Tn6G0BBmGSzevSL55mzUaofhPAtg4FBWe04ACvaIq/Nw3Pr1zw/YlaxT993C5EctcAfLYY5CUD0fYqUNpcoVlaWDNqYoqM4E6eA0yudUn9ziD0BB8RJ0tDRbjQbYDBjNmFe0MGIwe9AbLwAma0jj2wp+6u0T9MzH95SuC+bwv3OhB/S6FVm+O3td/SvbRXHOZ/j33hIqgNGkIGqlH8Ad3jbPxRHfHQGiumefbpF1tOwMSBdZXuFJTnbJLTp/vAOG/xZY6DE48ytgtA2kvoYHxeSv2eDS297K7RWOydBhNz2gnuobOgTL4Bwmd3yvQWaR1Zm7RG9ydrQ32G8Yiu75PXjTFpWzNj3hz2TeEWwZVp1gOVAlROq3N67p+t9hLaDA29LMC55xXjW68pIM/F6D2JRATF0/eqV0FfQmhA5/2n/LCzVJaHN09uo2A3xWd9mvGYepeY0pqNI5lXOuzx6AoVvCIsFEF/Dj6BznWnZrzceZYooLsTY1OpxheHFfbfasQWMlw+Rq44oZnRDTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199021)(1800799003)(186006)(36756003)(86362001)(31696002)(83380400001)(82960400001)(38100700002)(6486002)(6666004)(6512007)(966005)(6506007)(53546011)(26005)(31686004)(316002)(41300700001)(66946007)(66476007)(66556008)(4326008)(478600001)(54906003)(2906002)(5660300002)(44832011)(2616005)(66574015)(36916002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmJDVVlyL01VZ1FKT2hRTGhxR1VyN1VySitPU1p3QUNVN29SbGtXN0JTTDVt?=
 =?utf-8?B?MENTSDIvZ0cwNFpTd1ZoSEthUDEzbkh3Sy9ySDVHL3o5WmhMd0JuSEw3SmNC?=
 =?utf-8?B?TUZnMnd2cFB2OGhpV3VzVHVDbmdlejVqVHhGcVhJdkwvRnFyVWtESEt4R1Jp?=
 =?utf-8?B?ZzFCUU41ZkNiSU02dUtHYytRQ3Q1WkpYVUp1Vm9vL2JnbXMwa1grWWFnWUVM?=
 =?utf-8?B?d09TOTdFQzBqVmh5YzFPaHlrZ2NQbGE4eVNTc0dXcXUrQ1VaZlB3VVNFWE01?=
 =?utf-8?B?amJOTjYzSUpteURHZ2JXdWJoKzZyeVdTQzQ1RE9ZU1hmZ0FFSlQ0VDgxeWlI?=
 =?utf-8?B?ZXJ5VzJqNVBEVytqMmRwc0toMjVOaDdDZ3M1aEl3MS8vNElvenU1b1J3OEpN?=
 =?utf-8?B?R3BIaDgzRTFWajVxd25pdHBNdFJXeWd6bVRrNjJoajU2T0ZCTmNBWkpKSXZC?=
 =?utf-8?B?TndtUEVIbXlYTExUZ2pCQ2JDVlhpRkxWR3F6bWYzRnJ2MUdhaHJDVDFrQ056?=
 =?utf-8?B?SlUwbUszeEJVSlZLOU1tbkYxZjFZdTJDMUZhT2NON05UWFhWYWYrVUU5QmJ6?=
 =?utf-8?B?Z1J3NDI3K3hLNk0zVTFuSGJHQ1R0bUxIT0NGVXZoU2c1dmhVakhpUzVzcUtW?=
 =?utf-8?B?akxjbkY5R0ZoZ1psWmVIazc0djJoamE0WkxvY3Yvam9SVWxFQmcrekwxaSs3?=
 =?utf-8?B?UENMTHFFbUdNeDFhOXA5Wkh0bXlsMWNjQ003a040TDFCb1E5dWNheURrZml4?=
 =?utf-8?B?Tmt3amtCazBzWjN3Wk51U3M1TnJtK1VlZnhKa2VaUWV6TnpZV3EyWG40UFFs?=
 =?utf-8?B?RGhybDZ3cXMrUW1JKy9FcCt5a1BWaEFHZVY1MWdUc2Yya2thMEFUbnk1WndW?=
 =?utf-8?B?SEk2Kzl6RlZPN3I1U0M1UlFrOWJ2a0VCWkdaQS9BbmlzOThNeWV3ZFh0bWl3?=
 =?utf-8?B?dktjb2dXMnBFZkdFakZCa3BleW05cXdpTjV2RnN2SkFMcnp2b1NRMmNiS01B?=
 =?utf-8?B?Z1p6MHJmTnV1SzNjTDJUUWVWSXFxYkcwUk5wanQ3aGlOT0NybEhZbTNyWGw3?=
 =?utf-8?B?TjM3bkJKY3Jla0d0TnNnMi9QMGQwKzhIRWVtajh6Vno0ZDJ3WWhIT2ExUnBQ?=
 =?utf-8?B?NHVxSmlMTEFGNUpReCtFdmpoc3E3WEtYQjM2SzExK3EwRjQ3VCtHNTV6ZkZk?=
 =?utf-8?B?R3FSUUJDN3pSOXdXclNmU1Ewdk4yclU4a0VJQ0Z3eFZMVHlDb0xSWVo4cWVC?=
 =?utf-8?B?YldhLzdxVk42b3ZPaUhqZklONUNpcFJWdHN3UkVFWTUwbngxUC95SERta2NP?=
 =?utf-8?B?cUlvYXZyMUpaR0o0QW9wU3NYV29EVHhxWFE4bFRWYzZTVDlxVEZVenQyUFI4?=
 =?utf-8?B?VG1BK0JBU3JMTVNvSW9wLy80ek1UdTRxUkNKU0ZMeWl6bkdUc0pnNCtKQWVV?=
 =?utf-8?B?UllGVjh6Ly9KSXRKcjhpTllwWVJ3SEZnS3RDZlh1a2ZCUFJDQVhKSktjeUJS?=
 =?utf-8?B?WlFDaDduTWVqSzVIK0RPanA5SjdteHdKZm04ajg3cEJOM3hlMXJ6a1Jsdy80?=
 =?utf-8?B?SmxOM09XRXh2OEJ0TWRwdUkxL0lsSDFIVlpUSlBId1oyMVdudXAzZXowSCtm?=
 =?utf-8?B?dEdjZWRPTGFQVm5EZjRvY2V0MHl5TkpWMjF6WkJIMmYyZkNYaTQyNVZib0k1?=
 =?utf-8?B?VXFPc01nNlZWeHF5Yjc1MmtGUUV0VXFtZFgwWWo2Q1UvZmQwWC9YSW1MNUtt?=
 =?utf-8?B?elFDUHJ5Vk1TZWNiek5EYTZiZTdoRXRaQkN3OHEwSXFsU2JQUUNhVkprdVNX?=
 =?utf-8?B?azhBRTR3RTNpTVFLaXpWM25oN2tWdVBoMnJ2Y3BsUGkwVFNMTUl3elRuS0pY?=
 =?utf-8?B?RkRocW8vaG5tVEdEMUlHajBYT2prOVIraFdyNXU0bVBPTFZyZ2tVRmlUU2xi?=
 =?utf-8?B?QlNhUmUxeisvZkhzV3g3RDJ0dnAwb2Y3QXFBd0tVcVlWRmJseDFNRUlEaGU1?=
 =?utf-8?B?cWdDaEtkSWw3bHE1QXpvbGpRTzJiZGg2akV5QWNaTVFyZjEyYVBWeW1ZaVo2?=
 =?utf-8?B?dTZldERZN01EVmlOOC80SjhsQnFnQ09aKzh4ZkRIQzgyU0lUZTB6bnM1TFU4?=
 =?utf-8?B?c3BUbHhOSjVFb0p1MXNlKzVHNkhmdi91bzRkZWs4N2VzNlZDYzdFdUlwRUVo?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eaaa76-426d-4a59-519b-08db9740f9d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:22:33.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8e1b636Rz3sdvI070tswvpVBaB9Ryc2gDTMUGC5ym1uLkgesU9+HYWO5MNZK1fpA0QTiWHQ9kr2kCuEsUIEVPOxdBmLLudjuHF2tuQTkVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-OriginatorOrg: intel.com
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 3.08.2023 09:56, Christian König wrote:
> Feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> 
> to the whole series and push to drm-misc-next.

Thanks for reviewing the patches while I was away.

I don't have commit rights to push it to drm-misc-next, so I'll go and 
find someone to help me out. Still, I was thinking if I should send v6 
of the series. I fixed a couple of small issues while working on new 
tests, like UAF warnings from my kunit helpers when running kunit.py 
with --raw_output option, but I can include them as a separate patch in 
the new series. What's your preference?

All the best,
Karolina

> 
> Thanks,
> Christian.
> 
> Am 14.07.23 um 16:10 schrieb Karolina Stolarek:
>> This series introduces KUnit[1] tests for TTM (Translation Table Manager)
>> subsystem, a memory manager used by graphics drivers to create and manage
>> memory buffers across different memory domains, such as system memory
>> or VRAM.
>>
>> Unit tests implemented here cover two data structures:
>>    - ttm_device -- referred as a buffer object device, which stores
>>      resource managers and page pools
>>    - ttm_pool -- a struct of pools (ttm_pool_type) of different page
>>      orders and caching attributes, with pages that can be reused on
>>      the next buffer allocation
>>
>> Use kunit_tool script to manually run the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and 
>> then
>> CONFIG_DRM_TTM_KUNIT_TEST.
>>
>> As for now, tests are architecture-agnostic (i.e. KUnit runner uses UML
>> kernel), which means that we have limited coverage in some places. For
>> example, we can't fully test the initialization of global page pools,
>> such as global_write_combined. It is to be decided if we want to stick
>> to UML or use CONFIG_X86 (at least to some extent).
>>
>> These patches are just a beginning of the work to improve the test
>> coverage of TTM. Feel free to suggest changes, test cases or priorities.
>>
>> Many thanks,
>> Karolina
>>
>> v5:
>>    - Drop unnecessary brackets in 2/3
>>    - Rebase KConfig file on the top of drm-tip
>>
>> v4:
>>    - Test helpers have been changed to make the creation of init/fini
>>      functions for each test suite easier:
>>      + Decouple device creation from test initialization by adding
>>        helpers that initialize ttm_test_devices, a struct which stores
>>        DRM/TTM devices, and can be used in test-specific init/finis
>>        (see ttm_pool_tests.c for an example)
>>      + Introduce generic init/fini functions for tests that only need
>>        devices
>>      + Add ttm_device field to ttm_test_devices (previously
>>        ttm_test_devices_priv)
>>    - Make TTM buffer object outlive its TT (Christian)
>>    - Add a dedicated struct for ttm_pool_test (struct ttm_pool_test_priv)
>>    - Rename functions and structs:
>>      + struct ttm_test_devices_priv   --> struct ttm_test_devices
>>      + ttm_kunit_helper_init_device() --> ttm_device_kunit_init()
>>      + ttm_kunit_helper_ttm_bo_init() --> ttm_bo_kunit_init()
>>    - Split ttm_kunit_helper_init() into full config (with ttm_device
>>      init) and basic (init only with device/drm_device) initialization
>>      functions
>>
>> v3:
>>    - Rename ttm_kunit_helper_alloc_device() to 
>> ttm_kunit_helper_init_device()
>>      (Christian)
>>    - Don't leak a full-blown drm_gem_object in 
>> ttm_kunit_helper_ttm_bo_init().
>>      (Christian). Create a small mock object just to get 
>> ttm_tt_init_fields()
>>      to init the right number of pages
>>    - As a follow up to the change above, delete 
>> ttm_kunit_helper_ttm_bo_fini()
>>      and just use ttm_bo_put()
>>
>> v2:
>>    - Add missing symbol exports in ttm_kunit_helpers.c
>>    - Update helpers include to fix compilation issues (didn't catch it as
>>      KUnit tests weren't enabled in the kernel I tested, an oversight
>>      on my part)
>>    - Add checks for ttm_pool fields in ttm_pool_alloc_basic(), 
>> including the
>>      one for NUMA node id
>>    - Rebase the changes on the top of drm-tip
>>
>> --------------------------------
>> [1] - https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
>>
>> Karolina Stolarek (3):
>>    drm/ttm: Introduce KUnit test
>>    drm/ttm/tests: Add tests for ttm_device
>>    drm/ttm/tests: Add tests for ttm_pool
>>
>>   drivers/gpu/drm/Kconfig                       |  15 +
>>   drivers/gpu/drm/ttm/Makefile                  |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   4 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   6 +
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 212 +++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 115 +++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  41 ++
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 ++++++++++++++++++
>>   8 files changed, 835 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>
> 
