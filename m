Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADBD668AD6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 05:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F12410E1D5;
	Fri, 13 Jan 2023 04:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9876510E1D5;
 Fri, 13 Jan 2023 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673584003; x=1705120003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ZYE8bVO6ylxaKJu4ZISf2/VhsqRHdv+u2NpkK4iip4=;
 b=a2ehgYpfvsgbRm3ryqImU0/SInpQ0SbYAHYoHssp0PYd0rclC5cK7Pav
 6FUUq+R/K2G+3IPenoNKANTRtKe/GqFtNaisZfvygT1jQa6Lr8vw4K2Uo
 7UxUGPCC+GvipgrJTih6bv/SK6Kk24hf3rU6XH2BCDSE8Bkb/VqHsJPi/
 UVi+FTS0D997S3cFdvlrJPNGLuQuf2gOmc3cvaBnX1CMyw4lT88PumRAw
 JHsjODEpBMgRnjzQ3YyoaHfwJczXL9/5yOtNKBhU8sahEmTgKqtnuZeWA
 gWUgE0Db6BzkZySUE5q3ir7HD/YCRkt4UWRPwF/Dv1Y1XP6Fte/XOdrtn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303608686"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="303608686"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 20:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="986853772"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="986853772"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2023 20:26:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 20:26:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 20:26:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 20:26:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9ZfGiWt362lotY+sJSxowXMy4rNqiB9KEGGH3Z7PSmnjdxCiq7EfznKP79TJd8YMWoSiiK4vB9+S0vHKGPURwW3QgpwzOpDkMF9yBO44dZ6Z6IrUuGhMBowKq2naxdJYICrQu7/uKuXqKzKA3ch6VGYqIUojJhGvfBCtHluEyxaAWnqpAvzGod4ES4sjWfg+3JBCISwnTi89TnuXFMamicSEF4pHFtlcfb1ml7h/lhIUY+zqAJAdV5dpMqVK3B27lJ7O6Gio5UNNB3mRDQ0Sz0rWNmPp7s8PemCaKPx8ltFqfB0ywqZTa8a5/WBG7liHWwOwnVRoid257d0eKzroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK3rJ3jgKHMChQVvoMW5JZ3EhuHn6zyOHn2h3ojqgDk=;
 b=IR2+OOIXi2pDjeYQf9ZjvJPOVvQXGu2dxqTjWjvljoUVLoQwxYi8MJwvXVRpENv3H2j4cTQRABG/n1O/mmKOktKhrSqS/TXxEASfAt+6v9fZPVqY5NpbOSf5WWej3cxkKMyvxMt2AHX4QBdE3nCiwdIJFYuponAcI4aT2Hb6VHx/ylaiigzpOPPjRi46PJGmFc9FCjTHgizQNZkvmeKWEbvakIsqMYr4g1CUiAYGwcEBJi2aq1btqjEAspmr1ECuyy8cEMswc6dXUB59GA/QxFtnypmGtSy6QsMmh0NqplrFRB0Fc86YeSazolechCx6jR8IXHM2u48PY7vg5gbicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SJ0PR11MB5629.namprd11.prod.outlook.com (2603:10b6:a03:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 04:26:37 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e%6]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 04:26:37 +0000
Message-ID: <db1160e1-cfc1-08d0-08b7-84909608b465@intel.com>
Date: Thu, 12 Jan 2023 20:26:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Connect root sysfs entries to
 GT0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
 <874jsvazvi.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <874jsvazvi.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SJ0PR11MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1c9779-6ba0-4411-1a74-08daf51e5c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36pD/blYIW/m6NA0Pjr5SHdK6hPPw2IF0GmeSkHcqsAaeNVS7DkG9RWO9R/jNd3aL1RMYSIzYPnnSoV/fgHeFuaToJ/dRtQMyCU5dIZAxLC6BRFayQ8+ly2UtYj5C9vm2AmHPzkFwuGe5mZ5L2CovnutBgKEZ387qU+cuhRai/uwPa9i5VnGkApjsRoKzC0FZPHuEqLJUWtnmsMw1d8YPDirym97R/ZR5J8hWPQ2KefDIhj2uB3NPzIVrTang2y+h581TphHR4hN8TcEo6Yu3tfhkY+vv44QXrOk5ApSQaRQioJIITiJyh4UiQahZPSRubOquy1oUNXYHoahEhzQ5O8I3h8NlCHKw9XPRV7YeLh11wOxHfARPdCVAzkJNrGbwfYgNYVXMuFfe6Uk7kI6A8TWyJGVjgC2Uqc8Y3SORQnRcHXR7X5M1CWymqiot6uNmu1Xn1eFKLafCiPierR6JcUs8iLhUtJJOUWhGoWi4TF2T8U8nmaZTJVgs2c+MgkCsgQv6Ar0Hga9gJKFR2gk1ruMBQ3Pb1YFnP0m01U3IWFPkgnq+gt/hf+SKijGN2uPKRDhdXaZma9IRNVy4PoG4rAEWX/xJEKNc8gYrK8Bt7m25+yjMqfMojmDeYdRYY+Ye/NLPHpPC2MhajySHRvZv7CJQrnPrHgQAW3noMQZ7UIFHaEAlG2GGYfA0eo8EQ+rFXBZer0gV5QFDKKczT3jcWoMlWBpB7+tfgFDYxMsvxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(6512007)(31686004)(186003)(26005)(478600001)(66946007)(53546011)(37006003)(66556008)(316002)(6666004)(2616005)(6636002)(54906003)(6506007)(8676002)(66476007)(4326008)(6486002)(38100700002)(83380400001)(6862004)(8936002)(5660300002)(41300700001)(86362001)(31696002)(36756003)(82960400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVAvRHJSdWFNSzQ1R3dVZ2liMEoxN3NLcGRmYWxCeTZWdDZUdy8xYllnc2pa?=
 =?utf-8?B?QXAxSXQ5YWc0RGVqWkk5VkcxRDBvVnpDTFp6YU55YXFZcVJaek1YY1FWTkJ2?=
 =?utf-8?B?OWllRDcrNG9oRmU1b1gwNjBNc2M3QXRVSE16aUVwa2tuWnZMYzVXUGdoaVVq?=
 =?utf-8?B?RXVTZ2hjTUZESWJYM05nOFVzN2VHNVFNVXdIRk1HaGxNbUJqaTk0UkdibUtT?=
 =?utf-8?B?eXU4dzFPa0ZOTDIvMHhTZmoyaUN0OXZ5VVUyOXRvbmx1VUZjR09YdThKeGpL?=
 =?utf-8?B?L0p1RnBnbVg0T0I3cGgwQVR3dFp0N3ZSdXFzbitXUmNsRGNkbVI2UG12Mktx?=
 =?utf-8?B?ekhSSldZTmpZVXp0OVIzeTBIejdDdk5iVUtKWlB6NmU0ODNCcW0wcSt6QkJ3?=
 =?utf-8?B?YUtNT1dqZzI5eFJWRzFEVXlJaXdpbnF3VHN2UUc1Vno5UmNnMXI1b0tLSW13?=
 =?utf-8?B?bjNJdThuMnIwSXVpRTJEYmpQTUxlM25pL2ZYK3I3YmVCZXFGSnAwMEFRTG9v?=
 =?utf-8?B?U0hoNENNNFFCcHlNakw5SzZEV0htdFM3Wmg0ZGFMN3FHVHZHS0x4SlZXTVZO?=
 =?utf-8?B?RFFSSnd4T1RZcC9wR2Y2bStpMUR0eE9VWU1SL3dicXJCWU1WOHR6YnM5akp4?=
 =?utf-8?B?MkVtdXUvN1c5OVpSVjcvaTJHNWZLY3JFcitaaDZKYUs0dFFzZjVVME4wZURJ?=
 =?utf-8?B?dnlwWUpLaFJocG01djd6Q3JVdkVCQThLQklWeVpPTWJpUU9MMUJ0ZXJhNmpD?=
 =?utf-8?B?dGVWcVpHSHhrRmhyZ2podGQycXdNYjF5VFJoZXpFeTFML3FUVU9CMlZxdVYw?=
 =?utf-8?B?a2MweHJtd0ZSbUorbEYxTk5YYndLZlY5ZHZ4TU1EUHM2Ulk2SXBtTnJsQTg2?=
 =?utf-8?B?S1Y2MFFENzY4K1hMb0dHMHIwSWc1WjdKeFY3RVUrR051NXFuSk5TNjQyUExx?=
 =?utf-8?B?RUpSdldkSGp6amhTMThGRXlYMmx0NzF3NXo3THZ6cUVDMG1ZWjFGYSt3RDl1?=
 =?utf-8?B?bnJpd1k4dDlDQ0VNa0NlNjBrOUo2ZzFMMy9WUyt0Q3huNUxvRGFvVjF4bDNw?=
 =?utf-8?B?YmJuWmgxdjNTeFl6SDJza2EwSm9MY3d1Q2pOdTJoL2lmVWxZYkVSeGk1NzZH?=
 =?utf-8?B?V2twNXFpRjRmZ1Y2dkVjYkZUdmhIVTBkY0NKYVNhWmY3VzY1eHZmYlc4S05F?=
 =?utf-8?B?WHNZcXNXeFBwWmI2QnhCcVhhNTNXNG9oUzNOMWxsaXlnWVlzV1VyZ1pzOU5t?=
 =?utf-8?B?T1IrL01Qa3pEZ08wVEs4eHp1d2pBTno5SXoxakRidlkxTklyeTJ6Y2k1UlYv?=
 =?utf-8?B?dVR1YzgvRHYvM3R0U2JpdWZUbnBUa3lld2VrZ214TEQ3bkc5M2tJNERXR2JX?=
 =?utf-8?B?M0tHZm1YSWtBSU5YcTM3OVovZGY4M0Y3YnZhV1RmQ0RnclJVQWxUMWg2OFE3?=
 =?utf-8?B?RTMyOEhCSWFnK0cwcVNSZUk5QzZhS2I0ZGZZUHJPOUg3M0hxVHBHaGRHekIr?=
 =?utf-8?B?T0NzSnA3WWg5L1IzdGpPTTdGYWxRR2NjQml0YUxEc293NGFqWXc5a1JCTmVB?=
 =?utf-8?B?VUt1M0tCUE9CWFhCVlJnejl0SURDN2c5Z1ArNUU5dHZoVUo4bWNBZW5XWG1r?=
 =?utf-8?B?VGlqdW9zeEIrWUZPNVZFamRkZ2tYN0RUUTRqZU1WUkJYczVjcms0K0hiRTly?=
 =?utf-8?B?Rmg0TzEyMmxvUnFYZzNNUmszTlVlRk9Dei8vcVpacWhnM0diNFI4OG5oK2d3?=
 =?utf-8?B?aER5OXVCR1dvL3NwaGs0bDFOc2Q2OEhtNVgvL0poSGFOOTl4RHNhdGZuVWJS?=
 =?utf-8?B?ZXJvZkl4dFNiMjBPU3ZURFQ3ME1DaXBwOXl4SjRvb3kydkludWJaQVRxMVhk?=
 =?utf-8?B?c1FpWUVFcnJrZmFGbW15MUw2d0svWG9rNWZvTmQ0bTBhNTE0djkwNkhtU0lq?=
 =?utf-8?B?aVdYRkQ0bkFIL2NJbzUvNVhPR2MrVHVONzlZVEY3NFR3WmtTRVpabVBCWHRt?=
 =?utf-8?B?MTJyWDdkUExJbUhVL2dkRVlYdmZZd1AvcnR2Mlc4azFCYjVZU3A4RFBLNzNh?=
 =?utf-8?B?SlhIR3dpOEdsdkdkOUU0UENydThmd0RxRFkvckFsRlpHZk1wVnNpV0N4SW9C?=
 =?utf-8?B?RXpSNGQvREp2a0hLOUVxRjNZRnUvR0FzR1RKNWxVVnZlR0xHaUxiM1B2elov?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1c9779-6ba0-4411-1a74-08daf51e5c50
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 04:26:37.4486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMc4LX5uv67Y+er4JlZoAqgGlasco4o7wvJkrq4y+78Kk5vXzt6toQv9xIyDNRpic9s5WO2U6nGO5jUIx0EFr16gUHcMErC5pde7eLRnczQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5629
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/12/2023 7:15 PM, Dixit, Ashutosh wrote:
> On Thu, 12 Jan 2023 18:27:52 -0800, Vinay Belgaumkar wrote:
>> Reading current root sysfs entries gives a min/max of all
>> GTs. Updating this so we return default (GT0) values when root
>> level sysfs entries are accessed, instead of min/max for the card.
>> Tests that are not multi GT capable will read incorrect sysfs
>> values without this change on multi-GT platforms like MTL.
>>
>> Fixes: a8a4f0467d70 ("drm/i915: Fix CFI violations in gt_sysfs")
> We seem to be proposing to change the previous sysfs ABI with this patch?
> But even then it doesn't seem correct to use gt0 values for device level
> sysfs. Actually I received the following comment about using max freq
> across gt's for device level freq's (gt_act_freq_mhz etc.) from one of our
> users:

I think the ABI was changed by the patch mentioned in the commit 
(a8a4f0467d70). If I am not mistaken, original behavior was to return 
the GT0 values (I will double check this).

IMO, if that patch changed the behavior, it should have been accompanied 
with patches that update all the tests to use the proper per GT sysfs as 
well.

Thanks,

Vinay.

>
> -----
> On Sun, 06 Nov 2022 08:54:04 -0800, Lawson, Lowren H wrote:
>
> Why show maximum? Wouldn’t average be more accurate to the user experience?
>
> As a user, I expect the ‘card’ frequency to be relatively accurate to the
> entire card. If I see 1.6GHz, but the card is behaving as if it’s running a
> 1.0 & 1.6GHz on the different compute tiles, I’m going to see a massive
> decrease in compute workload performance while at ‘maximum’ frequency.
> -----
>
> So I am not sure why max/min were previously chosen. Why not the average?
>
> Thanks.
> --
> Ashutosh
