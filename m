Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E28739746
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 08:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE0510E4CF;
	Thu, 22 Jun 2023 06:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E828410E4C2;
 Thu, 22 Jun 2023 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687414567; x=1718950567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cJ6UGBXW7k2549St1EzXrB6OpruDWXKIzrVnDlpmvUI=;
 b=PCjkio33ikWmsbjQxr57cejrssl6evfgUokbb2ht8iEdGcIQl3n8dwzc
 wPRjJXx4vokrGdeYVRxdxGoKuYeGSBYraBy426ZBt82cfvUDLd6mlBOEn
 97Dgu2du9fdocMbs9lM3unSWvwQIDl7JC31rVHRjomNgAb0nldVZgw8S6
 8vedvYtM/2ssbLQEQ5iHAN4kduyshNhBNw+PiNoaI2AtJaXBzxumolyaF
 S4SqdI4bnjlf/9DI4co6jod3kiaSkT+5vkNTzN4c7BBUfDLAEVzgsETuM
 rZVtT5PGGzlhMOJzKN4ycoVtxTCweqoXgZzpGhxZcCCXbBV7bjvYKjLq2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345134805"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="345134805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 23:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="827762294"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="827762294"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2023 23:15:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 23:15:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 23:15:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 23:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT4oBokqB6/lb1IcWcl7TFie89qv4CV2b4BanXGjxQeKt4tumUX2aGpgd8iFEBRm9SAR7f0g+d0NDje7/deAn4Y3nX0uGAxmJpQGIl7jaAN5wE3j4rfAwPKTdrC321KXxFeci/R10O1fOYfQgPuVAoeKsSdmrWE0JQr/t7kxI6+Ggk1bJOcYqI7h+hijBx2XdcW7LevTyj0NGbeMwNFCWzUbbJ6XTowaTpXlSBamG15Toiky/T8I832Q/MdvAyZsI17nyy1Z1A28iyHcGjUli/C0cJkgyGZ3W9rO9gj3I5wPkX+LUD03JmNPLJhMEeER1eRTZSMObJFjGgt0dpeqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZauluaXXhW8rvOwbQgDkM/SRBqNMOo8J7u2HsYVVtro=;
 b=GQoByEdy6PDizfjY4KHWNpPQRPBtkr/gSXokrmAltO6PGJtvmABkd0L5Bz60ZosjtLmPm96h6CGY3ambipdMeme7cSY98Ue/S6Y3wBuFsXJE33Zt/3NdCsuIFtf1XLoR6t3v1PA2s2PaYf/rw4n4RvLXUqV5A18GoU7+jRaCpI9eynGiWByUVNkxXFr+HBlCOyMQ9WdK6krlaKeh9uKIFhz9pecl9zwPvbAq6RaadkP7AAzMjTkftmcAdXKKizgSqgmbMbyPojxEo73wHCFn/6PYapplxErSHqD5Bouyy4ASqaTooCZmQohpf2xx7EGHTixiJrhFkm/RrO4sN0lF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8343.namprd11.prod.outlook.com (2603:10b6:610:180::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Thu, 22 Jun
 2023 06:15:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 06:15:54 +0000
Date: Wed, 21 Jun 2023 23:15:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <alzfewo3jado7ezyaibq52ep3vuxbyfism4ablchmvmioio3jb@3gyx6vaoscbf>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZJOwC5LIEySpduQJ@yury-ThinkPad>
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a3e8f4-947e-4eeb-14a9-08db72e82270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCnxn3hUDHfD2SSyOwjkioojsTaVeZxno87zbfyB8uRtkVyZfqxJkJZu9hTjH0/3j6vVG0phJsnzIlVRvF75NCzjLn69hkuuCDoKKSQcJkgr56NgkwqWMq6PVlihD8R1m+b8kE3iv4lqmRC7dh8SYgXwPLgLoN0ZCuK+8M1+FQOEYwxN2ICEzDh3Jw78Z4ChhPEjP2jfUuDsdpb5MbhXlBn/40dxrahhPACNlu+zLeTO+kWw/+zdNUgfg0BKIVRd55tsiB4MC0Dpj9s3KcXF008O9iuROItBkC99XmISbHdeCldL1ddlI147PizcGCF3KazU5BPef2M/pQObKIcCK+5AIyVnhxYMdMVCjaPfY9Xo+QrIMFTZ3YNRmVqF6UT6aKhGk7r9zXaYjKn9HP6C5jMPQZtRvaV//sZ9YWpjyUWEUy+RtygmRbXz5Q1htRXg52c5B21ivtc5QYc49/+SZusdzGCadHmV60GUwXqzhquwH/AX7bWQGB2/9fY1OEoS9RNWKD4z6nfOxSIcP761tcxqzHW18GfdkK50ovSr3PILlKwCrtnXjRaRa7ihMnX/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(41300700001)(7416002)(83380400001)(6916009)(86362001)(8936002)(8676002)(5660300002)(66556008)(316002)(66476007)(66946007)(33716001)(82960400001)(38100700002)(26005)(6512007)(6506007)(9686003)(6486002)(6666004)(478600001)(54906003)(4326008)(2906002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?akiKwuB8ojVCsFsXE8DWZNe1ds47+bYOE1iiEhAaAMpBPRQ5czDLTj59z/4G?=
 =?us-ascii?Q?TF8C5ufrDt5bjgQNKiWBfW2MAgwJmEYmY7V7Uf2bgiuBhcuhC2S0+w2R0okQ?=
 =?us-ascii?Q?HD+TIWcz0p/0k8pRgL2K7NLRY/ktQepTk8XTPMvL52l5j76evvurKgNcJo28?=
 =?us-ascii?Q?7WGVQtJKc+wE4cB9/gI6P8CYZRxECUGv+06BLpXL5OiteTOanxveKmsvl8cz?=
 =?us-ascii?Q?XAeHKRaC/vkvJVk9f0R4K0QK7VqUrc5xoeKL4nNSKjvdS26StlrU0UeyQCLO?=
 =?us-ascii?Q?cuhoe6nB2HZIF1wyy8D5d1iki1x6dNB70wiVwk74T4ovhRGdE5GEN4zhpEUG?=
 =?us-ascii?Q?4kwPOOOUBDV+p9KdL+eAmGZYjNNHog+wLQxLV8EiGEWWRUXeQMwUkjL5MbfU?=
 =?us-ascii?Q?qO/rzJcfYNSLGwzjT3eYw2FzwtULIHY0oT9AQVAmpbLXBfB/rzR35zdjBEL2?=
 =?us-ascii?Q?RVNY0RKsoZhYxwMg09O8EnzQ4L/oyfNTVADaTErcAh1jVk5QLxyX2Q7IBXNi?=
 =?us-ascii?Q?BY1z+i9GVEeGa7m5N7Z+RG2Sp/v8nh1AFnKnqYAgGE0/C8ot5xvWxFc8axii?=
 =?us-ascii?Q?t098cjddoBu8fHkDI8CnaIOQ0MNNyiuRexfsI1yzEH+GVdrzqFBZVsb0t29W?=
 =?us-ascii?Q?eWZ84CkvOQushU0TqCNkHf31q9UsEuuV17ZZq31/wOFtpUOVcl24TrYNGAHc?=
 =?us-ascii?Q?V1xYGskM4DneWu5UaIHkt9xSc+dBWyGqK4YxTldIa4ed0uP2q23u10HXNPQF?=
 =?us-ascii?Q?7XztQDjH88fvR4zSsfYFqX0L8HIMhdR4Y2gqgaIhPsCX0Yi7v7ENs7eWMJtp?=
 =?us-ascii?Q?WvmrNAq3phrZ/3eY6rCRpOlkgFNt05Ag2g36x6tP7WKequ/uw7poh9lLqzs2?=
 =?us-ascii?Q?jXyaxAp8w0T35hV4CF5j7k5sMofubJHhl3b7rO0+KnQxQ56wI6QD7mJm5S2E?=
 =?us-ascii?Q?xmYs1ft27AXUbImc4LO4yKzz9RLaqfNA+RMqG1gy6PyZVr+UP6qxki0jfDrp?=
 =?us-ascii?Q?jpNg7F5tW6aJBnu6VMQA6KkNdQ63d+aeLsA7YxTWH96suy/iCZFHPIgYLJG8?=
 =?us-ascii?Q?iv5RKWG9XW95froGq2qJZ+vAVuVBodYHkqubdP9fCqx9nSeylAcO1pqRS0kO?=
 =?us-ascii?Q?C+UGeTfNjfp719j1fGfyLCiqXZkr9+wg9No2XKauEYvsBHrOs5vnG+Em0DCK?=
 =?us-ascii?Q?72FmcKUUDINM1CEv+RuKCsjPyyCl0OoQTgmZpObLLd73BAPMasQCiX29bCAa?=
 =?us-ascii?Q?TOz25VC25ONeKZz0knE2WmSr0ZARVjbm7l+LP6/MwSxqe1D/SzGg9bz18jTS?=
 =?us-ascii?Q?KpJmohnnghGfOl/Hjyivk5QdWjjSLczDv0Mmfr/hM+Ln2pJ7SEVUFm/i1iNL?=
 =?us-ascii?Q?kHC7kuVl9i6xETQBTG1k+aCNV2VzSK9He5gt4RuI0oSowhVkfzCth5cR1lzg?=
 =?us-ascii?Q?b1XbyrmLjnmt+YFPR+D2ZALjCcjVkEWjzBRQn1jEJv+K/hAtrocugRNcTgB0?=
 =?us-ascii?Q?c2z/lkFenq2RoPpZQrJnICIFtEpuGi/KeQ6QQMEE9SrjpMkp1DNy68+AdFxx?=
 =?us-ascii?Q?sYDXkTvg/HE0eQsLSaMAqF5bXXu4WbMLodkMN590PqAeEbNoT9+AOVp0Z1Q4?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a3e8f4-947e-4eeb-14a9-08db72e82270
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 06:15:54.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q4V+sKcpUWoM978QOtvHj3hxIK1UsVSvrG1iFx3Lym5P0AFnwXfIwo8gCuVrT6AR0uzmlIVY004zhOMBYK2yUFGaVqzHguy6K2Kl2Kd++8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8343
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas
 Gleixner <tglx@linutronix.de>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
>Hi Lucas, all!
>
>(Thanks, Andy, for pointing to this thread.)
>
>On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
>> Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
>> masks for fixed-width types and also the corresponding BIT_U32(),
>> BIT_U16() and BIT_U8().
>
>Can you split BIT() and GENMASK() material to separate patches?
>
>> All of those depend on a new "U" suffix added to the integer constant.
>> Due to naming clashes it's better to call the macro U32. Since C doesn't
>> have a proper suffix for short and char types, the U16 and U18 variants
>> just use U32 with one additional check in the BIT_* macros to make
>> sure the compiler gives an error when the those types overflow.
>
>I feel like I don't understand the sentence...

maybe it was a digression of the integer constants

>
>> The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
>> as otherwise they would allow an invalid bit to be passed. Hence
>> implement them in include/linux/bits.h rather than together with
>> the other BIT* variants.
>
>I don't think it's a good way to go because BIT() belongs to a more basic
>level than GENMASK(). Not mentioning possible header dependency issues.
>If you need to test against tighter numeric region, I'd suggest to
>do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
>directly. Something like:
>        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))
>
>> The following test file is is used to test this:
>>
>> 	$ cat mask.c
>> 	#include <linux/types.h>
>> 	#include <linux/bits.h>
>>
>> 	static const u32 a = GENMASK_U32(31, 0);
>> 	static const u16 b = GENMASK_U16(15, 0);
>> 	static const u8 c = GENMASK_U8(7, 0);
>> 	static const u32 x = BIT_U32(31);
>> 	static const u16 y = BIT_U16(15);
>> 	static const u8 z = BIT_U8(7);
>>
>> 	#if FAIL
>> 	static const u32 a2 = GENMASK_U32(32, 0);
>> 	static const u16 b2 = GENMASK_U16(16, 0);
>> 	static const u8 c2 = GENMASK_U8(8, 0);
>> 	static const u32 x2 = BIT_U32(32);
>> 	static const u16 y2 = BIT_U16(16);
>> 	static const u8 z2 = BIT_U8(8);
>> 	#endif
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  include/linux/bits.h       | 22 ++++++++++++++++++++++
>>  include/uapi/linux/const.h |  2 ++
>>  include/vdso/const.h       |  1 +
>>  3 files changed, 25 insertions(+)
>>
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index 7c0cf5031abe..ff4786c99b8c 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -42,4 +42,26 @@
>>  #define GENMASK_ULL(h, l) \
>>  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>>
>> +#define __GENMASK_U32(h, l) \
>> +	(((~U32(0)) - (U32(1) << (l)) + 1) & \
>> +	 (~U32(0) >> (32 - 1 - (h))))
>> +#define GENMASK_U32(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U32(h, l))
>> +
>> +#define __GENMASK_U16(h, l) \
>> +	((U32(0xffff) - (U32(1) << (l)) + 1) & \
>> +	 (U32(0xffff) >> (16 - 1 - (h))))
>> +#define GENMASK_U16(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U16(h, l))
>> +
>> +#define __GENMASK_U8(h, l) \
>> +	(((U32(0xff)) - (U32(1) << (l)) + 1) & \
>> +	 (U32(0xff) >> (8 - 1 - (h))))
>> +#define GENMASK_U8(h, l) \
>> +	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U8(h, l))
>
>[...]
>
>I see nothing wrong with fixed-wight versions of GENMASK if it helps
>people to write safer code. Can you please in commit message mention
>the exact patch(es) that added a bug related to GENMASK() misuse? It
>would be easier to advocate the purpose of new API with that in mind.
>
>Regarding implementation - we should avoid copy-pasting in cases
>like this. Below is the patch that I boot-tested for x86_64 and
>compile-tested for arm64.
>
>It looks less opencoded, and maybe Andy will be less skeptical about
>this approach because of less maintenance burden. Please take it if
>you like for v2.
>
>Thanks,
>Yury
>
>From 39c5b35075df67e7d88644470ca78a3486367c02 Mon Sep 17 00:00:00 2001
>From: Yury Norov <yury.norov@gmail.com>
>Date: Wed, 21 Jun 2023 15:27:29 -0700
>Subject: [PATCH] bits: introduce fixed-type genmasks
>
>Generalize __GENMASK() to support different types, and implement
>fixed-types versions of GENMASK() based on it.
>
>Signed-off-by: Yury Norov <yury.norov@gmail.com>
>---
> include/linux/bitops.h |  1 -
> include/linux/bits.h   | 22 ++++++++++++----------
> 2 files changed, 12 insertions(+), 11 deletions(-)
>
>diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>index 2ba557e067fe..1db50c69cfdb 100644
>--- a/include/linux/bitops.h
>+++ b/include/linux/bitops.h
>@@ -15,7 +15,6 @@
> #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
> #endif
>
>-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
> #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
> #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
> #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
>diff --git a/include/linux/bits.h b/include/linux/bits.h
>index 7c0cf5031abe..cb94128171b2 100644
>--- a/include/linux/bits.h
>+++ b/include/linux/bits.h
>@@ -6,6 +6,8 @@
> #include <vdso/bits.h>
> #include <asm/bitsperlong.h>
>
>+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>+
> #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
> #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
> #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>@@ -30,16 +32,16 @@
> #define GENMASK_INPUT_CHECK(h, l) 0
> #endif
>
>-#define __GENMASK(h, l) \
>-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
>-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
>-#define GENMASK(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>+#define __GENMASK(t, h, l) \
>+	(GENMASK_INPUT_CHECK(h, l) + \
>+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))

yeah... forcing the use of ull and then casting to the type is simpler
and does the job. Checked that it does not break the build if h is
greater than the type and it works

../include/linux/bits.h:40:20: error: right shift count >= width of type [-Werror=shift-count-overflow]
    40 |          ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
       |                    ^~

However this new version does increase the size. Using i915 module
to test:

$ size build64/drivers/gpu/drm/i915/i915.ko*
    text    data     bss     dec     hex filename
4355676  213473    7048 4576197  45d3c5 build64/drivers/gpu/drm/i915/i915.ko
4361052  213505    7048 4581605  45e8e5 build64/drivers/gpu/drm/i915/i915.ko.new

Lucas De Marchi

>
>-#define __GENMASK_ULL(h, l) \
>-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
>-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>-#define GENMASK_ULL(h, l) \
>-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>+#define GENMASK(h, l)		__GENMASK(unsigned long,  h, l)
>+#define GENMASK_ULL(h, l)	__GENMASK(unsigned long long, h, l)
>+#define GENMASK_U8(h, l)	__GENMASK(u8,  h, l)
>+#define GENMASK_U16(h, l)	__GENMASK(u16, h, l)
>+#define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>+#define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>
> #endif	/* __LINUX_BITS_H */
>-- 
>2.39.2
>
