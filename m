Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825378FD60
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 14:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8310E1AD;
	Fri,  1 Sep 2023 12:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FC510E1AB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693571878; x=1725107878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g6wT6NxlcPrhnkfCtrb9VsP2isP3sVamOTkPFHmSaoo=;
 b=GvI33YzswKpVlTp5Erx71LpWZM3j73y7MwELZ+/44uOGrV/43RMGBQn1
 R1iAxabr2Y31VmQKKXXInm3Zd/NKMK/UXLNWtVBkBlRbUCuq9IT+01l8o
 zzMvj6QVNRiYRBzf6m1M+3bBVXUMscemBPbMWYMPY8PUGo8umsaXZD2ak
 LZEdjVxt2YIIwuATiTJSrXiB0wY+oU3J3LhbQg+aa1e/5pG909fczxkz3
 4lVPl8pehi/dxTYDnmglrrACIE4QrzpL7WdZn+iXTc2fQM2kC/FFpVNsv
 kWwbqQbZPTIWAKMEdBTxXryxYN0/AOlDs3vLz+J4XgpJTK7pNDbHr7OEn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376142396"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="376142396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883176063"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="883176063"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 05:37:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:37:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:37:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 05:37:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 05:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHA5v8ajOvSivrgKVWbU2mBB99ohn+XJcoWPqBkE2b6iIjKaYFlitMPMJYp1EDPD+zO1dRyF8LdkPNWNGULRLq6m1nCD/+sneHk2vRfN0wrfAmEGgFHx5gQjY4ehxeXtUoCRDQaufBnUxicyFGIl9rVFqvXZuxD5TEWsZeXetZppypfrmv31kEl5cJMfBztMPtMhf150QBxothJetvI5ekmYexJOl3UsK0PUXWQmtFgjuJNYr9lMTu1iT/ttX/PggVnHQ8eJ7nRSjRj65vg36oRQPDRrEdfYWwSOEGT+F0sUJiY4dG2mISa1xbiVTtNEThvPh5lWPZOtF+4pzAhNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiOI4VfbAnG99F+26rGHpdw4OU/SwvjpAAgwaNfmnbM=;
 b=F8cmAR4Orj3ghY0oLMZn67sbNi4gyLo6qtXON/6djVnsvpvoKsGQGfypabTw4r+nSKCSFHhlc6DJDMGU05UNKIm36cPYqP8KMe6jPGT3ZAjL1//ax11gDV7xKoPazzLVSsHULs4Hn06Ae6D0c6scmiVw4Arm3MmeE6MuZRI9MRttDi05bA/cvbX4zIoIxDrKzJGfFsiBZl/O4b1t0nLxmHMIjdwivng0Mi/+K4EZOECJsmU7h/EzuB6TmzElpa7BreWaGow8M883OtNyXwBekYfybJKV3b82DolCYPAFLqLPoxbvYnIl4ra8D8Iq2NnNcmrBHJzGu4+8pYkjrs/rvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH7PR11MB8057.namprd11.prod.outlook.com (2603:10b6:510:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Fri, 1 Sep
 2023 12:37:13 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::6bdd:42c5:dc9d:dc75%4]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 12:37:13 +0000
Message-ID: <41345404-3440-00cc-745a-d2977b406c64@intel.com>
Date: Fri, 1 Sep 2023 14:37:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek@intel.com>
 <202309011935.bBpezbUQ-lkp@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202309011935.bBpezbUQ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH7PR11MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: e17bb5b4-be19-4bde-3335-08dbaae82a8f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T4DSDpgoXco9KHctA4a+uz9WQrSMtDfc5oZEAo1NeWBxoOyVp7ZoKG1pQH7L1zBh7RAPECNN2IqcnqjSRjTCGnXvFdM5plRVV3Mmrwkbfj6OnHg9nbPsWd/L6gAkCZacLEXzhDo6d5ejLe0hcjW71Pjb+2tFm5uXMym+wErLWdGT0AnxgX66E7eEdeeDNOs1UWbhywL079w2W8lVHt7/SMPaW56MlPuwsTBznOx0m5g1EoMLGC2ZE18JyjJdTQXvlwWY/B74eIVh7fljOjXjfcKj1+pDuJ69Y6Gx7+m9KHOYBYLcL466R+Zzd3U1TiTq8+GJDTReffg0N+mSRWB3ZMInBct0ShYKwIfgoBVBYujp3Mq1f6RzDqHst4AIRXI5vKIhpO+J9dq96oEDzNgBDU1L+aNGuTHvcr5bwMKxQpsqV9lMgUsvv7V5lvyF/OBeU3pJ37sN/s8lvG89d5oAFVepinmblpSuYvRpKLfuZckRtMmOokmdcEV1/zyIS4UvKWWZaynmqMUU3NjKWAByZ9vC9jT8H8hAwxIpixUOzSVD64gtnC9Als72LyUwzwu12TP3iEfcbKPpGSvnUe2LqkL+wdBGEy7RGaXxNL7sy+HyQkFBO3KB0Nrn/k0lUbzM+soIzbkVNeoBKjrKrN4uFR4StcvxOMFPY8BqSqdYVHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199024)(186009)(1800799009)(31686004)(2906002)(30864003)(6636002)(66556008)(8676002)(66476007)(36756003)(66946007)(316002)(41300700001)(44832011)(4326008)(8936002)(5660300002)(53546011)(6506007)(2616005)(31696002)(966005)(83380400001)(6512007)(38100700002)(36916002)(6486002)(82960400001)(86362001)(26005)(478600001)(6666004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3BJZC9sRGRIQkNRclZGQnBORTd3UmZNZWJPbk5PdDdMcXA4VTBFaXJ6ejBE?=
 =?utf-8?B?bjV0TnVwV2JLbDhmU1MwbENNeXlqVHo5bys5aVhMVjV1aWthTzg0ZVczZk5I?=
 =?utf-8?B?WUJRYUxJak93VjVxZDJwak9MQkk3ZkpzLzdzK1VhWCtpSHRCMXlQazZJbkpj?=
 =?utf-8?B?OGM1MmtDL3YxUy9GdWpwaFlIMUNYZXViS0ova04veENwYWRzUVZXaUZpdUxU?=
 =?utf-8?B?K0VzUUNJS2Nta29EM0I2dkZEZENXSjF1NWpNbTNjUG9QZHBQb25TYUpZTkdM?=
 =?utf-8?B?SmVuUmZjaTFXeE9hRStWM1RHZ05qWlhrT1ZhN0oxYW02MmpIQ3AzclhDZ2pR?=
 =?utf-8?B?RXNnS2ZDYmliQXcyZmZqbnk3K2pEbEJqbmFOaDBWQjBWMDNrTXpzbmFVd0VU?=
 =?utf-8?B?Y0xKaXQ1U3QyRHhRUXdXczZwb1ZOR0FZVDFEZGtLeDVnRVU4WkdEenlUeGhv?=
 =?utf-8?B?aFpYN2pRdCtQZjc3V2xVQk9MUkNQUXg0VHhoa1UvL3JTb2NBZ0kwdTg3eTZp?=
 =?utf-8?B?ZmxWMXlCYUtpMjBHMFhVK0dBZjNiUEhTMTdsWTlBRzQ3UGJXQnlYamVhZUF2?=
 =?utf-8?B?cFJsQmc3V3hqUGpZdlZNcTUvYmdaNk91T2ZESXZSeFVFZFI1R051a0EwaERy?=
 =?utf-8?B?RTYydmNLUnRxVDFmR05JSFo4TjBSa3FPVlZVTjJZaGtORFlVRk9TQmMxcTY2?=
 =?utf-8?B?aGJXc1E1SzhVeDM3S0s3YlpsenVrVkZnYnlVQm9yNENvZHJFY2gwaTF4bkJ4?=
 =?utf-8?B?U3pBSlNsd1d3c0RTZXF2d0JqdXJVUnRhODNnUUU2RGQ3RkZSa2tTcDlwNWhW?=
 =?utf-8?B?OE5OdlBSd1RlSVlQeGRNVFRGQWs3Y0c1aCs0dGVlK3NmMDB5UElUTllyM0xG?=
 =?utf-8?B?cCtCUlJ4MXVrc0NKL1Z5bXlXSCtQdGUrM3dXRnJtKzQ4UVVlc0RaMy9jd2Q5?=
 =?utf-8?B?bGlCVFAxUkZUZmg5akNUWk91QWp0enNReDE4VUlUcmpmSGRkNHc3S2lqQnlN?=
 =?utf-8?B?SzhyS3dMbGtqcmVsc1REVkQ5dVE0SHBmT2k1VTY1OGlzeEgwRWVxTHN5Z3U5?=
 =?utf-8?B?NFFRRlhYMVhMSFBpcDRFMVBXeEJkMU5ZbElsci9QNDZaa2h5ZWdCZXY0NGZL?=
 =?utf-8?B?akFvZGx6b05qZWFXUFkzVGVlVytBT0R4aDZmQ0ZHcEJYaVBMVGtCdndvbVp0?=
 =?utf-8?B?Sy9lRUFyczlka0JWV3NMNmxkcGFQMFFCYVVKeWt5NTFNN2JNVzJ0SE5EMGtL?=
 =?utf-8?B?U1FPREZRbXpTQlRlcGF3WTNvSkdCdVdwQ21VMmkrZ2trbGdXU0dTcHhLeGNG?=
 =?utf-8?B?U3huWWR4cUZ0UUN3aG5WYTloN0lEZU5kUnV1bGRqbkxNUE9mSkxCS0FuL0da?=
 =?utf-8?B?UEdOSkV4QXo4NlBBc3VRTEVzTkpvMzZBVUZISGVINUVDMXhKSEdsQk9mKzdh?=
 =?utf-8?B?bXEwL25jaFk4MVc1OENWbjVSZzZlRzRINDlHd0lrUzVKOHJSeWEzVXB4LzBk?=
 =?utf-8?B?U21VSDBsQ29IUHI0aUtWcjl1V255MDhVSVZzczJZTXZweldvMnFkbzZOcEV5?=
 =?utf-8?B?akIwbHBmUFVaa0ZBbkd6bWVhRGxjVFhaS0hrMHlhejVhcXZYeTV2RVMwYkt2?=
 =?utf-8?B?ckxFR0tyYUhsNEdDMFc2UkJ6REFsWVZONXRMaWxYRFJGeVJDNjkreWtxeGlj?=
 =?utf-8?B?WEtsVUxiYlg3UTlvdmFGRzNoWUN1Y3BNbjRnTnMvL1Z3WElFemFRMXIrbTlR?=
 =?utf-8?B?d3B3N3lrV050U2FQUlZVSDQ5dGVhWlg1dGRKeUx3ZjFJenZFN0hzcjFuYi9X?=
 =?utf-8?B?cndyUnNtZXppSVZyRUVDdjRqQUNHd2c0YW9sK2ZsN3VDa3dOQzdGT0lQL1dS?=
 =?utf-8?B?RUZrVmpETi9Ga0hTTnJ4NFdSSEszaHl5Q2NoNzh2V1IvcUNXaXpia0QrRlJo?=
 =?utf-8?B?WU9CRjlOaG5pbzA3RGZSQm9aaThQZ3BHaG5qc1lJWENtc1BUUzUvUkhMZThY?=
 =?utf-8?B?bnN4cWt2ekYvUHJTSFlVWUhYMnIvbklyaUkzdzFqdDR4WUpBaGtwWTlscExy?=
 =?utf-8?B?ZHJVWTM4N2VHUUtyaEhRNHZUNmV3M0NpZk1Nd2tKczV5cjZHTTlOaFZqTnI3?=
 =?utf-8?B?QWtjcitwcWZoc0ZEcHBSSWhmM053aWxRaWZScEJTaHdKcUdxdWplZTU0azNF?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e17bb5b4-be19-4bde-3335-08dbaae82a8f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 12:37:12.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfqPdTkjm3q11mTI4rMVbmbd6FSYh9CQAW2uVv7v7vmN3IFfZ0QNYYerQJCQ17SCKNG8nn79GC0vNwPBZ6aviLb2T8xuvFPXFrLAsYlBayI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
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
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1.09.2023 14:04, kernel test robot wrote:
> Hi Karolina,
> 
> kernel test robot noticed the following build errors:

It's a problem of building TTM KUnit tests as a module, the issue is not 
tied to a specific arch -- the subtests use unexported definitions. 
While it would be possible to add EXPORT_SYMBOL to the TTM functions, we 
don't want to do it with do_send_sig_info.

Christian, two questions here:

1) Shall we export ttm_resource_alloc, ttm_tt_create and ttm_tt_destroy? 
Or is there a reason why they are "hidden"?

2) If we decide to keep ttm_bo_reserve_interrupted subtest as it is, 
should I make CONFIG_DRM_TTM_KUNIT_TEST a boolean, instead of a 
tristate? DRM KUnit tests are tristate, but I think they don't use 
non-exported functions.

Many thanks,
Karolina

> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230831]
> [cannot apply to drm-intel/for-linux-next-fixes v6.5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20230831-185954
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek%40intel.com
> patch subject: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
> config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wlc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_fo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ovf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblcr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_twos.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ftp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_pe_sip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_nat.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_raw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/xfrm4_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_nat.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_reject_ipv6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_hellcreek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot_8021q.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rzn1_a5psw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_crypto_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_token_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_broute.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_filter.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_nat.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/auth_rpcgss.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpcsec_gss_krb5.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/vmw_vsock/vsock_diag.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
> ERROR: modpost: "ttm_resource_alloc" [drivers/gpu/drm/ttm/tests/ttm_resource_test.ko] undefined!
> ERROR: modpost: "ttm_tt_create" [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
> ERROR: modpost: "ttm_tt_destroy" [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>> ERROR: modpost: "ttm_resource_alloc" [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>> ERROR: modpost: "ttm_tt_create" [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>> ERROR: modpost: "do_send_sig_info" [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
> 
