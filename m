Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7057BEAEC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591710E2DA;
	Mon,  9 Oct 2023 19:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A8810E2DA;
 Mon,  9 Oct 2023 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881176; x=1728417176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sNANZRxi0vX3RaNkd2diog/a5QTqrd8uNSqOsu1F8vc=;
 b=BUKQjmGzeKw2ln52+ps4wVzWdH6KbTl40ws036d/4h6EjMoffcS9UxZX
 1KK6uGK7QqCVfgpVPBMwkfDbwK/x3ni9gdEQcbnyGxRlXvgemre6Wka3J
 3ZF3JFjhSz2NrnKQ6cDHEE3pgtGMTMz0bzTMksUslK5kJ7ctaAO2k+Y1d
 kNAbGI2LZDzJaNlzeH6FqZEhfGITrYRENJwcv8zO8cyGYw3//mE09hIhg
 8RP3ATmZsyUfn9iJ4ewsGLlb8lv4laGYcgL90dKrRA2rsv35dTZuOfIBx
 4QQocVAsN5G5D7FftedVfkVDlFz0nl9Qge4OhqofkipL+6uu+H2EQ8DM/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="383109179"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="383109179"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823459251"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="823459251"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 12:52:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 12:52:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 12:52:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 12:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgSx3LIQd4IvBUFqOMxL5p+vNwPhA8K2f1EFaSXnZ+RN7/MLS0FdJ02LhKxwRLpycYq5l7J1fwMghgTAF+iMU3njiBHvLGX9JsPr9lrcpPNNwiDGSCpQsfU9DJN8pjHSnrbRRJF3fxGem6X2iqe6M2f0LfVmxJCMRw4OAEGM0EmATR6j6v+1PYMXpBDssoVUTX1O41CoudE4mmjawKArStIIIiZ9FKJaOBPnSTlgc11dfdMymrUhUg67Dpt/ufKV9smiweOmdtQB541NUbuB/dcK4cy6p/unzCN3psnCPcpafUaxkmPnvlIcsuqxxHtqzF7DkSJT6LQmnTz0c/JI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrphpR+HKU4E+MNxIJ7/hS8TjNDSm9w5/jcKckpB0+w=;
 b=XEncfS33IEm2D5tHiEFd35o9/ZSatPylrj0QOEIlO9Sb/3lubEoVh0KTTBGEU4x0WNG4xEeGjqno+eNa4mHEF1PJ3GM5NxwnE8sXKVFBRvTYYOJ21/xCJleaIAzZnDVd68GaDszN2FBOlN4V3Ol/SMBWIWjV/OkgrKSbg8Y21L8aR9Tlxc/poOR7H27TfgeI3l6oyoKNvI7VN83vkKpWMfa9sbdU037VxlPXoRn5yNoog2qgrEAS54iIwwDrxgoqMLbjsLMjjewAkvfKBb7V3EPYzDTuoB0M7SiYFtBpbnIqsFJB0mMoPKP3ntQOar1kYecNfK/oVt6ohCAzfgKdxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 19:52:51 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 19:52:51 +0000
Message-ID: <9a54284d-406e-4d7a-b39b-293d2e449961@intel.com>
Date: Mon, 9 Oct 2023 12:52:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/print: Add drm_dbg_ratelimited
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231006132606.810110-1-andi.shyti@linux.intel.com>
 <ZSQv69bLHoOglE+T@ashyti-mobl2.lan>
 <2e44254d-5243-477a-8b2b-35623967ec1f@intel.com>
 <ZSRX+0BB3Mf5diMC@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZSRX+0BB3Mf5diMC@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0301.namprd03.prod.outlook.com
 (2603:10b6:303:dd::6) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 19865611-626e-4a4c-b465-08dbc9015211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWYxjZFccF9edqZPw4Bs8KbQuOjR4eMOs4abgU76/8R8cg9wPrPwMc9oF83kpZH3cLrQELyAOViit1uV/6HPlTNlaz/UKoX+qnpFxfCCaSk/9j5KXi1rcdnTs8DQLErH8LtYsEGx2fChG8MUNP/A9Kj6bQbBkOir/fgn4WGwgEmYvVgH8OuU0zMekzkYsphQBeVZXhxXILawynpw26bQSDxEuny0wd9IYDVd3GCeALgdiWBpkZMrsiaoOGfWa0bB6f6+sHeveZkdYoxWdZ/uuYGWNM3x4Q++zYwGsNuSasfws2MYvKxuMenEZnzME0KIjZAj1Yah/ZbGm9M/M5XF20DSO3GA3KGKSslqXyBsBHK92be0d+7VlzzFOnQkNiHdOXhIDN7HTT2GVxIFMeRLr4uAKkBnnHABFcckq7guqF4/gm8i0L5GvWsiD6N9HsB808b2c+4uJPEk0a6Ocfs96dfRQeEq87w4ARkuBSwOTd3UxrJvNSGwvR8j5hvk7HzNhFDKTOTpLfjZ+Xd0qqO7Tc5rreVAvBHJV5EW78uf0HQjGUCo6sjsExzShfS2PLjcub+tZkF3iR1zt4C1I+8/BhNW0FskwGdu9EEvekpP3Qvr9II4c0alvGmF/Lx4vQIA+KYif5VvxBYt1eZh2mgrwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66476007)(66556008)(83380400001)(2616005)(26005)(54906003)(6916009)(66946007)(316002)(5660300002)(8676002)(8936002)(6506007)(53546011)(41300700001)(6666004)(6512007)(6486002)(478600001)(4326008)(2906002)(36756003)(38100700002)(82960400001)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTM4Uy8vN3o3Zm5zT3FNRUMzbVg3YW1aN3hyYnRJRlVpOFdJVmNLM25XK05L?=
 =?utf-8?B?L09ZTXBRSS9KeE9zaHc1RGlVcTJFKzZJdDVKVm1aQVN1Q01FdWkxb3NZVW16?=
 =?utf-8?B?Tnc0N1ZwUDFRY1Fyb0FTbVlEUjUrQytvd3l2a0hhcnBnUUpXL1gyaFlHN0Za?=
 =?utf-8?B?TVJTc3pPWnVTYXpPLzNMdTh2RHV5Umg5dDZHK05XMnRWWlZ4eFNvN1pyWHpa?=
 =?utf-8?B?Nm4zRllYWWp3cUZONVlYSGF1M1VmQzNPUTk2Zlpnc2ZmL013RU8zcFRmZm9D?=
 =?utf-8?B?bmdwdXlGaG1qUlpuY2FpaUtmUXV4ZDFUdFYwTTJNTHJQbklUSW1XRnBFNG9S?=
 =?utf-8?B?Z01jdEdRWnQ4VkVweS84VDJpdlZDdlI0czlXZDZMZzBwcjVkZElUMzlCVkpC?=
 =?utf-8?B?blpUY2Rnd1MxeXI1NHdDRVVXQm1uYmthY0oxVllUZklZMC9aV3FYbEh5Smhq?=
 =?utf-8?B?Um5XS2czQlBOaDU2OUNCVFZYT3U4dGw4bThtQ1cyMlgzSkZhVlBFNjEveFVB?=
 =?utf-8?B?d0VDZy9xMXFoak05NzBZaVJJQ3ArOWJQMERPcEtmQUhmNFhqYjhka0wyK2lK?=
 =?utf-8?B?eVZkUGVweXFEZzZqU0tTbVRNMGtNaFpWMlpQcS9Ob2dzY2pnZTlWdkdEVmFT?=
 =?utf-8?B?WVpkdXh3bVU0Qnl6VHM2TklyNHlsTWVRWVkvNjRzQW5QbzJRODNpUnZOYjFq?=
 =?utf-8?B?QmRBVENnWTdHbVlPS2x3MEw5cjhrdnhlcUpwemlUN2VBMGNVclJZUjJvQ2pk?=
 =?utf-8?B?VnpUOHdJV1lqTVQySkx2K1ZtSWNScXN0OFJPYnZQWDFZY2dReGEzY1h4Rmlm?=
 =?utf-8?B?d0J3ci95T2hLZ3ZQM0xpMHpHS1dtZCtHTEs1RnphNzJLb3NQdUtabEN3K3Nj?=
 =?utf-8?B?RkdVOXR3N0JTRXZMdGxiaVBHN2hkcHRJeTVDOGhBL2hSMFA3VURsZjJaK1hK?=
 =?utf-8?B?aFdtYU9zc2JXOFZtK2JoSDBpd3JhaDFoS0lLOGN1UjZpam4xSi9lS21hdTNh?=
 =?utf-8?B?OTREdzlVK1ZJUTMzZmFtT1RCUzVKdzF5c0ZGS1lPYmlMQkhQaVZYQ1l2RjhJ?=
 =?utf-8?B?SXhTU0VwSWh0T0svSXBhdW1iMk1aZmQyZjF0eWtzaXBGUVRBNWtPbkpnNWVE?=
 =?utf-8?B?SXlnbEJIYVVMNHo1Q1RnOEZoQU1Pb2RQL0JJUnNSOFg5RHdCaW5aZDFWaGdp?=
 =?utf-8?B?UkNEVndTaytYdmhFSWJVUEVnc1J6ZzFQcEY2VFA4djVaUFZ1K0x5a21PWjdl?=
 =?utf-8?B?V0MyQmpoTzA3SGxyQWZGUDJZTGJ4Zi82MzIwUUwvL1BLbTA2TklCNncyaGRY?=
 =?utf-8?B?d2NSV1gxNytlc1JxcnVQSC9KdHcrWXc1Y0U0QUNwekZWKzJrT20xT1JZeTVk?=
 =?utf-8?B?WER0L20rY3ZxSVpFd1poY1g0OUxwbzZwcmtlK21ibUMrcG1UL1ZjYjRHSzFw?=
 =?utf-8?B?Y29QZTd3WSt0Z0RPY0ZNZ3dpa3BzZnBiTGNJNTJLVlNjeVVEMDgwci9naHBs?=
 =?utf-8?B?VEZObTZBY2JiR2srcDBtZ1JmV04wRGFYY085V0NFNXBTQkdOU1pDOE5EN3Vl?=
 =?utf-8?B?MzlBUlNkSHF2YnErS05KbW5WRXhNUTVXUTl4RHpkaU9KMzJUbE9VRDdjY2JN?=
 =?utf-8?B?eVFoODRrSmx6Vlh0Q1g3ZTQyVEh1eWxCNWU5ZjAyL24va3pjSXQxVGRNeEh5?=
 =?utf-8?B?Rkp2VGV2VVc3R3diTUI5QjlrSzRQUW43WFBTSEdlWU9VckRxbUZleXJ5TXhB?=
 =?utf-8?B?N2UySXhocGRXbGZMKzF1aTFUaEVMOFN0ZUp4THBrQWZXTng1NkNyajA4VWYz?=
 =?utf-8?B?TkZpa1dBM1VlZnhEU3MxU0xJY2pCMFNKcW5FbzJFdGJrcTNWdERPUHE3dXR1?=
 =?utf-8?B?RzV5MmNmM1RneStXamF4cDJIZWhFbXZXQ3hIa0dPTGVhYkduMzhMWEhMSkNp?=
 =?utf-8?B?dmtKNkZjaXJLQnhwcllZMEdodXh4QVdkcVF6aEVJdXNQK2huUzJnYW5UNFNj?=
 =?utf-8?B?emZIZk1JUlh0K2tOQlRxN2hQQm41NEN4dFBsZzgxdFk3M2NRY0c0ZnNRbVdK?=
 =?utf-8?B?OTBDb1pPL2FFem5SUDlmNER3cmhsSWhRYkpWbTBQK0EyOFQyKzViUDh6LzEy?=
 =?utf-8?B?bWlDQXQzclVNSW1yM2d3NjhFR0dhQ3R6VW1PRjFWRm9menVSb29NWnFHVUVS?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19865611-626e-4a4c-b465-08dbc9015211
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:52:51.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sq2xOnvDzBFMhuka3ovZ9IDRvKOc3ojIsa1kIBIqQ0QRkTp/fOOoUSUAjBDJy9uhSPcQRBT9vZb5KHcy7RZlvuDgDo37TMQLY6zpq/7rjtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2023 12:43, Andi Shyti wrote:
> Hi John,
>
>>>> From: Nirmoy Das <nirmoy.das@intel.com>
>>>>
>>>> Add a function for ratelimitted debug print.
>>>>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Just a kind reminder!
>>>
>>> This is the second time this patch has been sent and we have seen
>>> some potential use of the drm_dbg_ratelimited().
>> But this patch does not actually add a user. So it is dead code at this
>> point, which is not allowed.
>>
>> If you have code that wants to use such a helper then the helper should be
>> part of the patch that adds that code.
> this is the kind of "Argh! If I had it!" patch. At the 3/4th
> "Argh! If I had it!" then you decide to send it but don't
> remember for which case you needed it.
But you should have sent it on the 1st patch set that wanted it.

And if you have code already merged that would benefit from it, then 
update that code to use it and post that as a patch together with this 
implementation.

And note that if your code is GT related, then it should use 
gt_dbg_ratelimited not drm_dbg_ratelimited.

John.


>
> I'm sure that once this goes in won't be long until poeple will
> start using it. In any case, if it doesn't go in I will keep it
> ready until the case comes.
>
> Andi

