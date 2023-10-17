Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4017CC408
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F5210E2ED;
	Tue, 17 Oct 2023 13:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BFA10E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697548214; x=1729084214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mdzibe0Lx9Ri9LfGInyiHu6zhHKB34lgf8ha48G24cU=;
 b=hf7zAbHhzTonZe0lfYxc+QjDVbCPoH/aW/cH1a5TkflQXcKPDBhDQp2y
 aZ6K2lRKMvNMTWPDpQnXlcmHLnltzNL48vst8xpKPy+wHUuQbEC2FknP9
 Xnk/oEwmL5UXrKSaDIQox8O8JFjy/1No9cFyCt9rLHBeEsK+3VZrCk/tz
 47RzPmy6ZcxYNS+MxVVgy2BEoWLKrpBdispHLe6/mu3DbBzxXoyq29w+X
 jf565afi3OC5DmUpoax96F6APEF/5D4BVGvqQZP63c1NKJhFD23PWmMte
 1hlCsl7pp3OkpM2aBmMShEUvjENwdt3Svrr3D1GXCX3VPlktuTtrc7StV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388635171"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388635171"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 06:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="732722371"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="732722371"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 06:10:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 06:10:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 06:10:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 06:10:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 06:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8s1lklVrJaMURFXRIzFxXRvk7lsR9cewZCiYj3zau1yxbIpGdcINAd6Hi6RlZ25yUag0m3Rr2WLKB031nyvf6w2hRsNSdFjuuUmE5cqQ5ZPGgRzcBX7Kb6XXbGv5Zq+T119FuLHRFBv3ZbZVenZV/yIZUhRlOlvLH6oyOfuqyMTce4SmF/Dc7Hho2m9PAmGe0BKc4UjRLTKIZVp80gwh/3C5MCF3Bb/j5j/OBpbfiHRewqv7QZCrYADeIqpljp3/9ZXVqyPjfA3q+/C9uqGevywH4jBkSXq6Kpq3cs+MZBJ5eWTkZFNU9J224GQ3ukE5KiyU8u5uUEIMcwua7qk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XajThtj7Eg+aHEx1S58ZGyMojc3KZdtPVijOBryPDaA=;
 b=k882vu9l197gSlbB6LKIeuAboMGg2pJhYc88yuTK7hI6TkmAyrXXrtuQ9i4fmbFcETxX0hiNVzqUcYEH5A0mCoL3/TNhLL9QXx0/sDkDni4gbJfhDU3Xlg2sTuZ6cwtmk4dcv6y+bfFyYr5XsOxjvc0lABw+2N114uOKU1kck1czkZGjGMIUqYozaDrP/5QiIQzyhSwzk67UX6cVwkX0nRthkfUWEHKS7Sd8ijHW5oHBlDtNYewb9x3aIhv1KrxXwMFB++4h8/6YZnJasaZ+2J7GNwhG/+3QrObAOs3VrcfddkCzH0cA/c5pxu0uIUoIpTuU5IgFPc5zDX1Uz+0Rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 13:10:00 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 13:10:00 +0000
Message-ID: <7b34872c-a903-0909-79ab-4b23797c1704@intel.com>
Date: Tue, 17 Oct 2023 15:10:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
 <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
 <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
 <09724727-b5a8-2e67-0ce6-cc301d95e4dc@intel.com>
 <179d176b-47c0-4cb6-b14c-17528024cfc5@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <179d176b-47c0-4cb6-b14c-17528024cfc5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::11) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6b74ed-4977-4e08-22ef-08dbcf125e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DaIj5jBlCsIEXO+FH3eyAirBGC9AyQ59cBGUOjVWD6Mkh0OIi9adMEhxGq/lgJyAOAKltSkNPNR8KJgyb8DJzTz7NWbODoO0Wlngrgcdr48ndt8WO37yfQIMH7WTgKR6raFDCHn1otWJzcmHc1dr03SpCsmTUbWs1D2ABsMS7KPSJz/x7EUwQu08h7VLyGtyMJ4kxNLy9IggP9uajOLs7X1jheHKYTEkLf5nVIwMshfTyFiYjWar4inTq6y6T1V4LOtFJyhg8RRZvYJoWoKbyXdL/fUmbADgSu9DzClEPdvEqAeYQoXb+e9+y/TE/QM9lf7mOnO19iua9ppV8enMgaK/8HxvmLJctBua2EeJkQFDq/wGS0Sd9n91O/2PDwDUFLu2mAT9PsHsFeoWSCJPTZHAKnJoPDR0dmrFsise5LIyaaKcsm/t9s375gc1ZHUM7jtEhEL08cNJAeMR7i3XfCEhGi9xDjNZt3dSKsEX1LbHgt7QQAb6ySDA36wXUUcRVdRKoNCQaP6k0e+PP0LuD+ZpcJW9o/OUbLIk9h1rnM1ENsBoeyiEWXILHlnFcG94X240QIz4O3EPiqaDrujGTQDUOm+v66hi3/bHHt0B6QTY3HW5Y1YqpeT4/hyS3acJfbls/+HQ8flae/aJyE5f3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(478600001)(2616005)(6916009)(66476007)(54906003)(316002)(66946007)(31696002)(66556008)(66574015)(6512007)(26005)(36916002)(6506007)(2906002)(8936002)(8676002)(4326008)(5660300002)(44832011)(41300700001)(86362001)(36756003)(82960400001)(38100700002)(83380400001)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBzOG9mN1dTVTlYMEF6WmozRk9MWWliUUJHZmlUOGtjc0tZbHBWUHJvT09t?=
 =?utf-8?B?aE44ZG5LanRLQ2ptUEEvQy90UmRpd1ZYZ0dnY2lqeDF1RnZjU3RRcHd6Z29X?=
 =?utf-8?B?dVhrL2o0cEkvTzRVMTlsUit5RHFnRlAra2Z5VGZLNmt3cUJLQnFJUFVEUWxI?=
 =?utf-8?B?NnRIVlphUE1JaXNvNEJOZnU1Y2REUlVKWEpHWmpyQ1ZaTkNudVRLOWtmNUp0?=
 =?utf-8?B?anZLcVlRU01ZTWtadEd4aHR4VjFqc0NSQURvWDJETWJDdVdRN0xrdDNRb1hs?=
 =?utf-8?B?bU9mYVNkYzJNTE9nYXdLdHkveDQxbW5ZK1pTdzE5VTVqbVNxUElSUVJrSURi?=
 =?utf-8?B?OGo2MDFGUlJxTE8wa1ZHSlhnc0YrT3lNZTlQMUZ2VVVENU1JTTZUckphRTAw?=
 =?utf-8?B?NXNDLytUVWNWdGt4aThJb3V3TjdLR1Y3ZXRNZVlOSmVSOXBWYjdDSXFwUlBU?=
 =?utf-8?B?aXFLTXZoZmEyYmdCTGdvUGh0K3NDcEk5YkpraUM4QmJrUURpZlc5aVk4dGhK?=
 =?utf-8?B?OEFCWXlnTzB2QXVnVDlqR1cwYVdPd2ZYYlBSN3BBRzNJcGYvVVQ2bU1pRHB2?=
 =?utf-8?B?L2d3K0QvUytEZXByd2VjdDhqa1FMYWxDTE1tcXh5YTlvcEdLREZpR0gzRnkz?=
 =?utf-8?B?RnNkV3M4L09GMEsxRkROWXo4YSt2aGtONVVTSVpDTTJCZWhMT2VBanpRYTU4?=
 =?utf-8?B?b1QwTEtMYmZ4L3FEblNQT2w5MHhMV256TzhOWjduUnJ1SGFpVEM1QlhyNHJk?=
 =?utf-8?B?YmtXSnBjZEthaElUQ2FyL0ZMVlY2SGdZeU1iR2JvNUU2SHNPUGpFWHVDOHpE?=
 =?utf-8?B?cUFSbFlGSU55blhPYTBxanBNRjgzZURtK0NPWU9FMjJBUDhhb2xON1dlNjAz?=
 =?utf-8?B?S0EwU1ZNZDNqeFlnVkVQMzliQ2N1dEsvdENjNmwvUTUxRk9KdG9DSTI5SGlD?=
 =?utf-8?B?cXZ1eFRkK0Y4ck1Obklrb2VlRWhPSGN0Snd1bktWVjRGam1EUHVCSXBRdjNk?=
 =?utf-8?B?YnVidWU0Yy9oU3dSWGNJNjN3MHBLaEhnVk5lbm5hWjdKOUk3cTZLY0tUaVhK?=
 =?utf-8?B?OEczMUxmd2FtTzQ1VGZzWXJjQ05DMWd6OWFVcVp0b1NpSWNheEYwdGxHbU02?=
 =?utf-8?B?K0U0aERSdXFyUnJMQ3QxdlNEOG5idkN2VUM3TGlSVXh1TnVEbFFjbmJEaENy?=
 =?utf-8?B?cUxyKytocXhpQWJ3TEw4Q3lGTU9GSk1GaWpqblRySTNFUW5scFZCaW5UM3pB?=
 =?utf-8?B?Z05ReGVNZ0JEeFZnajBGMTFyMXNuMnpDVE83S3d5RmJRczZRMDZ5MnJUazQv?=
 =?utf-8?B?TXcrZTBnL0Zmc2Z4b1IrbXdVRXljT2EyN2MvNnhQaWxDTnF5U3k2aXppVi92?=
 =?utf-8?B?OVlDMFh5YlE1cFR5aTgrbDF3OHFjWUw3Q003QlJRMjlaZlFiNnczNFdtc2J1?=
 =?utf-8?B?Z0ZhYXRrV0VuZFUrR28zV2h2c3FwY3dUVjNTT0hlZ2hCeFRwUklsTk1YYXV4?=
 =?utf-8?B?ekhiZi92YnBlMTNnMjU0VWZQZ0pSdEFKT1JZL3NXYXZDUS9IRmhkNW1ZbTli?=
 =?utf-8?B?WmthK0pmbTlXdEdyeGtacXY5Qmppb0FINytYSFV3WXJaT3BxVUVPcFhFR2Nz?=
 =?utf-8?B?bzZDSDgreWNBTVNzODNmMFJFaDZMVk4yKzNHUm9Ya2c0UFFJQzlSTWJUQ1lj?=
 =?utf-8?B?VGVTRUZUS1dHMmwwbHl5RUUrWHF0SWpwTzYvVGFhZWMxd3dJTStoRllJcnNO?=
 =?utf-8?B?R2MvU3draXZBcDdmTWVuMzVubzZ0SzlBU3VteCtabUk4UEs3dHRLYVN3Qytt?=
 =?utf-8?B?ZzhUSGdWeERhdFB0Z3FTalhSZnlhR3FUOGQrZkxrdUdxNnAwdVRTYnlCZ1FV?=
 =?utf-8?B?a0pwYkNlWC9DNmhvZlBqSnVoMU9nSEozZWtGMUpEZjVnWStPcWdFRWZJTTBV?=
 =?utf-8?B?NnNCUUlWcHZuQ1htT3V2VWdSaVlnQ3JhUVRkblhWczl5RnlZOFo1bWZweG9n?=
 =?utf-8?B?SDBDSHVXK3dJZEVkWWZaV2hza1c0ejA0Skx5b0g2MGxJeVVGcnpmNGJmbGNa?=
 =?utf-8?B?TGIzbjl5R1p1L0VDbWh0dzF2Z091WlBLQko2MGJnZCtpNzZsdC9RMEh6QkRL?=
 =?utf-8?B?Ulp2elhjYllyanhpRXpsZERwQm5xU2dHNzZac3diUGFRb3hhN0xwMnIwMlZY?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6b74ed-4977-4e08-22ef-08dbcf125e8a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:10:00.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iji2xdV30f840B+ScE4pGHHjpmR+KhORc2QAzIkBBHpMIi0i6+DISBx3qYX0GpIgsrDqv/qh347f0J4jUDai1wTJSyi5y7J191Fc/9MuF4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, "Somalapuram, Amaranath" <asomalap@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.10.2023 14:10, Christian König wrote:
> Am 17.10.23 um 14:06 schrieb Karolina Stolarek:
>> On 17.10.2023 13:57, Christian König wrote:
>>>
>>>
>>> Am 17.10.23 um 13:22 schrieb Somalapuram, Amaranath:
>>>>
>>>> On 10/17/2023 4:35 PM, Karolina Stolarek wrote:
>>>>> Hi Amaranath,
>>>>>
>>>>> On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
>>>>>>
>>>>>> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>>>>>>> Add tests for building blocks of the TTM subsystem, such as 
>>>>>>> ttm_resource,
>>>>>>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series 
>>>>>>> covers
>>>>>>> basic functions such as initialization, allocation and clean-up 
>>>>>>> of each
>>>>>>> struct. Testing of ttm_buffer_object also includes locking and 
>>>>>>> unlocking
>>>>>>> the object for validation, with special scenarios such as an 
>>>>>>> interrupted
>>>>>>> wait or deadlock.
>>>>>>>
>>>>>>> Some of the test cases check the bulk move mechanism and how it 
>>>>>>> interacts
>>>>>>> with pinned buffers. This is to be seen if we want to add 
>>>>>>> dedicated testing
>>>>>>> for bulk move or not. The resource allocation subtests use 
>>>>>>> ttm_sys_manager
>>>>>>> for now. Resources that don't use system memory will be 
>>>>>>> indirectly tested
>>>>>>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>>>>>>> resource manager.
>>>>>>>
>>>>>>> Use kunit_tool script to manually run all the tests:
>>>>>>>
>>>>>>> $ ./tools/testing/kunit/kunit.py run 
>>>>>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>>>>>
>>>>>>> To build a kernel with TTM KUnit tests, first enable 
>>>>>>> CONFIG_KUNIT, and
>>>>>>> then CONFIG_DRM_TTM_KUNIT_TEST.
>>>>>> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
>>>>>> platform, looks good.
>>>>>
>>>>> Many thanks for taking a look.
>>>>>
>>>>> Do I understand correctly that your Tested-by would apply to all 
>>>>> the patches here?
>>>>>
>>>> Yes, I have tested all the 4 patches together.
>>>
>>> No time for an in deep review, but I'm going to pick this up and push 
>>> it to drm-misc-next.
>>
>> Oh! Could you at least take a look at ttm_bo_reserve_deadlock and/or 
>> interrupted subtests? I'm not 100% sure if my solution is right.
> 
> Than this will have to wait till next week when I have some more time.

That's fine, I think. I still have to tie up loose ends in my 
ttm_bo_validate testing (with no eviction cases), so this will keep me 
busy for a couple more days.

All the best,
Karolina

> 
> Christian.
> 
>>
>> Many thanks,
>> Karolina
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>> S.Amarnath
>>>>> All the best,
>>>>> Karolina
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> S.Amarnath
>>>>>>> Many thanks,
>>>>>>> Karolina
>>>>>>>
>>>>>>> v5:
>>>>>>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>>>>>>
>>>>>>> v4:
>>>>>>>    - First unreserve the object before calling ww_acquire_fini() in
>>>>>>>      ttm_bo_reserve_double_resv subtest
>>>>>>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>>>>>>> suggestions
>>>>>>>      how to fix it in a different way)
>>>>>>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>>>>>>> empty one
>>>>>>>
>>>>>>> v3:
>>>>>>>    - Instead of modifying the main TTM Makefile, use
>>>>>>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are 
>>>>>>> tested but
>>>>>>>      not widely exported. Thanks to this change, TTM tests can be 
>>>>>>> built
>>>>>>>      as modules, even when non-exported functions are used
>>>>>>>    - Change the description of a patch that fixes 
>>>>>>> ttm_pool_pre_populated()
>>>>>>>
>>>>>>> v2:
>>>>>>>    - Remove Makefile for KUnit tests and move the definitions to the
>>>>>>>      TTM's one
>>>>>>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM 
>>>>>>> module
>>>>>>>      are built as one. This allows building the tests as a 
>>>>>>> module, even
>>>>>>>      if it uses functions that are not exported
>>>>>>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>>>>>>      ttm_tt_kunit_init() function
>>>>>>>
>>>>>>> Karolina Stolarek (4):
>>>>>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>>>>>    drm/ttm/tests: Add tests for ttm_tt
>>>>>>>    drm/ttm/tests: Add tests for ttm_bo functions
>>>>>>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>>>>>>
>>>>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 
>>>>>>> ++++++++++++++++++
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>>>>>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>>>>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>>>>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>>>>>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>>>>>>
>>>
> 
