Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE297D059
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 05:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC24610E79A;
	Fri, 20 Sep 2024 03:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2aZzR8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582CD10E799;
 Fri, 20 Sep 2024 03:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726803799; x=1758339799;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=57fyQU1+KsbmoeOalNo+qiJMKe4WK9OYCW+AAFMekuI=;
 b=G2aZzR8qhRnjOxe0ImLg4fMRJW0mWvL1iQTN5NiJYOxkDjYKJPbUgKm/
 p8cb7CaDXa2Dq5hohPiiISA6gGdCUHKih/5ypUOJZbSyNy4HGiJsJlx+I
 3vWBLAWzldOkIsQ29Tu03QPvsZYT9TFGQCpuq6Q/aNspSybWNTBkF9mKw
 JNjdXva/vWvDnSrKtWyVL9cED7y1fBf7vkp0fdKy3PWlv+zawLqo6af/R
 ZM01hLtMQWw+nAvfOxxhdzHuahADgrG64TXC3/QHU7VnNMpmrPKM3R+lU
 LGhBNvruPCziR8mQf5chb9DlQhrg8JW4n5cl3zVmzqZ5ND4iOQr3KzZ3H Q==;
X-CSE-ConnectionGUID: 0jDrmJUDSwSNp+l8kWGNfA==
X-CSE-MsgGUID: fjQW3vasTzuShNwpGrzFfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36367700"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="36367700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:43:19 -0700
X-CSE-ConnectionGUID: LIHsAvRSRoyKTuq7qPTysw==
X-CSE-MsgGUID: 3yoyD8xDSjeGNO8b+3xStg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70593349"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 20:43:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:43:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 20:43:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 20:43:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 20:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP1ZKuGZJsKY/uY4MCFIhNzrAd89YIKXKp0w3L9RJMJ6LOt6OlNEkCWAFsMErNlwCxK/pSZHfMZKqtat/ZqBq1uWJDA+rCP8jewNcvGh8ACL/zG1/pbotFuKJGyuIhT1H/txmzlxjKivdJGtUWcjcz/Z7qBBSOrrRe9fEv/waEgSh6YjU+7cCIUBY7lbbW5Br2BxObSY2wF46AWfwPsr+ZmeDH8Q2Vp9Yp0lfFlHPTC8HXTDl8SVMv1PuaCnv8RYt62C3MKnaBE98t189/cKvd8JDPtI3P/mf1pFheHd1F0rrvZ4osU0BcZ3jgJKNFgghW/W6Dl/qDmy3mzfAvcIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm0J1ggnV+0MgLzwObMrvEyfAMF+CHfXZADFI0Pumxo=;
 b=gb8+oi/jrO/P0RA6BHtpuf09D1kYdICEPEiJGQR5w2RuJbISOxhLUu+7nXgh9E7wGHOsbjp+xYGYTT3T2zSwSLE1kP2Z7jPRimYs304gf0GvkwGuGEYbBAXcv0bfYXk4L1x6uazeU5AcVzRPfIqnz42zlqN9aBsYrVLpdRp0Ye9KssnA382wzp+QFAWW1P1o84I2DVafz6bIJK4cVGDFQEtLrucOi5a/Nzs35NnR9BlslqALxerGtAbEUJPX7P+7g6foAP88p1j56mLaGD1v1n+QVEYJVp7/EdyKLlheBus0y8mKYL9fKBpSm8XCJGyLHG8fK26aPRTJdyZ91DaGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 03:43:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 03:43:15 +0000
Date: Thu, 19 Sep 2024 22:43:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Kees
 Cook <kees@kernel.org>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <owkmwjhxbhii6devx33npufv3pgrjygbjprba5lby2dq25wvce@nvm4ll6d42h2>
References: <20240909195939.067c1c13@canb.auug.org.au>
 <20240919092752.5a832aaa@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240919092752.5a832aaa@canb.auug.org.au>
X-ClientProxiedBy: MW4PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:303:85::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3e09c7-96a4-4915-3e7a-08dcd9265c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7cJO9KJg3RKmPWC38gqbIunoqlY3rNFWdX+Z0UZSxfobRk43kcbIqhyYRf8v?=
 =?us-ascii?Q?KBP9nInxjy/rvb+1sDWvzjfdJu23rd6RZnxlSL+nA/oI8POjah/a5EkQyLsj?=
 =?us-ascii?Q?bGpxafL1GkT0jnyBV8QSD+0FQcwpr8RN9pBoFMZg8pQMLa+Yz8i3kE32v5LR?=
 =?us-ascii?Q?lir+TLm3wPs0fHmvSDNYcmdWOTwTJ63Xios4vDAaktnhifK9g5e3Pmds/UVw?=
 =?us-ascii?Q?6mb/ibyVpdaeHcSbAtyx/oknK4PkssBoZnhFRUifI4uxRa6lRjdF8+4Yd+El?=
 =?us-ascii?Q?k5P/eH/6nbr98kOPKMFiEhHmY/YyrCqP/EGIDJgnDnWjlfME+0mlUquGK8/w?=
 =?us-ascii?Q?YbOegHTq3Iv0Wc+eC09pckaiSbjdinYFGuuOI9mMWv1Iooe4HF/W57a91Sk2?=
 =?us-ascii?Q?N7cXH5ukqeOCxou6d3M61nrukg5Cghvy0p+/bb1z/ProgD8b6klllFyTGvp+?=
 =?us-ascii?Q?cATRursGwTH0iJqaW6YnqIz1MoMozO1+XTJHtUj+rb30WBJXJdIATQMqaGXO?=
 =?us-ascii?Q?3pSYSuVWjmFQBFYq68OVj/ls3/yRsUl3PzW88stZpYNPUyw/wWwAbDnftCXn?=
 =?us-ascii?Q?rL5b6eFHvA3I4LtQg1YaoDSaH0eV/7XE5Mvd2uHtrlto4qeqbJH1geHBoOYx?=
 =?us-ascii?Q?wsm6LX4vXa5Hyq5jMT+rZ+OeSSS//x3hemYvkusw32wTLCTeVSlJi4kYc16q?=
 =?us-ascii?Q?y/YAT2bJ40MRQF5faWja9CxfQZ/s4NKlz/oUpdQestr2gWe77/i9E6nQz730?=
 =?us-ascii?Q?StYgT2qQQO924tE8CNQo6Cwt3WCrckajZJmptfSQwsct1EIIfuHEs7zvKjTR?=
 =?us-ascii?Q?tE3oS7tnjcK/o1r7JhtDy8kH/LeL6taUE4EXnUmBk/JFCK55XPfmbc8AXrQb?=
 =?us-ascii?Q?CIU1ILCAoAkDD8bcSDREvMMUR24lEpvzpbwQHGzN2Ve1eDBVqZON6NBd1p6h?=
 =?us-ascii?Q?r3iRL/o+VFCJ3MqVFR993SMFvWd+mBiCy5CBPWQiXN456BB/rmElUNQmPY3q?=
 =?us-ascii?Q?/y92uCwQoolQz2264kRp+DZ6mBHFarCLxAaSeNGC9uYshQ3fqOhIvTnhtuQz?=
 =?us-ascii?Q?rIUmCEXKhld0yzE3msTy66oX1s5mFL3UGil1CDq8RHUbvgesbYKcjqYsB/Ke?=
 =?us-ascii?Q?tSKLBQ6c5OENDXGEHbkpcgShi34LHwSlCVR+clYws/icmX8YqWma34lYJHmf?=
 =?us-ascii?Q?I8ngfu6FrVozk+Nhj8Bbfv4XeOF7gZ0+TWkt4F6C1eVg6C+QgxnoDFzRnZcp?=
 =?us-ascii?Q?beSFgNza/J7Lkd6eG4gUS92+Saasp9/Cp15xf4b6Sw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VWvbhCIkbv486ZKwhSJVBTq+ftiyfIpILC8LLrPNM+Twa66FkYnPzILjMola?=
 =?us-ascii?Q?lr1aoaK3UCI/+ICv/+hiRYs32+z6bFF37UOyFEtm/FOl2bY/5uXoCm91lVpP?=
 =?us-ascii?Q?UgW7rmsGoJJ+dlT7X5lhWAwX1zt2MUM11j5SYfSzec+6XGutaPOt+kkWKFLn?=
 =?us-ascii?Q?v7/eWzR/3mHtHxxMt6Vfw2tZhT/spv5jX17op+0BWCm9xowj40+9xev6SzZe?=
 =?us-ascii?Q?4CG0GIe8XZp4YZbbuP1LRz1kuW6G3G2sF44WGgfu4ziVmi2G/zzC7bAwKUer?=
 =?us-ascii?Q?ddT+LzNQji3a3qyN1J0xaTFIw+8Evh/RuI9OoUulF/ci6DHn7Y9SNgIbH6LJ?=
 =?us-ascii?Q?GDbxqrAb68Llg0IPxEO4XqpBB8JHjVDcV77TOO75HZjs/0O3dBagVtyr+grh?=
 =?us-ascii?Q?pPwy581mtfF0VqMZaJL5Xl263W01ws3fXIwkY8bLzm8vXwtYwK64WSS6q7Bz?=
 =?us-ascii?Q?PBAMx+dBpydN4hkAGXSl0ghJsaJDiZ4hmlBvzhB/re722oCxQcP5V+6eYNGI?=
 =?us-ascii?Q?VGDMM3adhsNg2kkLjO8kSHUUE4orkOyKjM4KgLKobnhvwI3taNY79+xg8usG?=
 =?us-ascii?Q?/zZ4yimqYRd7ad4aqUJpMLLsJdYx42jfdth72T53Yx7YywpLoGE5TKBHHO/1?=
 =?us-ascii?Q?FS9xjsTnJaWmcKNK8ssGDFL552WNUT648KJhVRCOJMnKj767uOsFCz6sMURo?=
 =?us-ascii?Q?wpVJhfChMNM332rFEZHItpRgepZ1tsDM2h9+4gmdUtWChQv0OdgTAhlz224q?=
 =?us-ascii?Q?Akg8SymN0Tj4bfGQRCZNHiSYvtlOk0mzrhVJ9gfdX0NswsNqQqgPoflh9E5k?=
 =?us-ascii?Q?BtFDX8W5Tq+c5ekb1g7Xw/SMISXrgqVISRuHSK6oKgFRBD0Ja28NsXsTkwXL?=
 =?us-ascii?Q?a3xYmVhxEpJJBWkEX8Uah8IYhrTqH3H3+t7aAJIKgkwQuHO7a6asG8RXuLDM?=
 =?us-ascii?Q?6UN/fAsbMzU+M4f5kPKarHJN+K3VSDOqLVW+aBReHegxQ6o8TwpBOvCA6nVe?=
 =?us-ascii?Q?jUOFet91YoqBeE0MRtxvKvx6olcH7iUNdsxNyXdkrWcTxG2hduqjW0sHLu6+?=
 =?us-ascii?Q?hDsgXDefZromdX2NbH5t1kuCh21m3hjoWP0mQZQH+KydO2a9DU6dAHdfbmmu?=
 =?us-ascii?Q?exNPfiB+wb1BCHMm2bMqwDzB7HDFilIal/WX6PmP9/LoOuS+GGzejAbQBck/?=
 =?us-ascii?Q?/5mlgpf2jxSgK3ouJPBHrT+xDWnol8nXKeiNRm4di00p8nwhAe5Zrdc/eWiR?=
 =?us-ascii?Q?DYRw5e/7P6W8P9jaXiGgnaj+dZRL6/jUraM1FHJhtD1gua3ITk8Mc+FdHJaR?=
 =?us-ascii?Q?aGUSSeQ+efYLfBXbFr3DKOxfDGm44XID7POORNLRMPEdMnyZoSj9KBcEkZ+v?=
 =?us-ascii?Q?CJdIt3ErXdrN4fWha3IBxK5+g08dx2fqm2ZbMrR7+T18V2xmecIhX3morMcF?=
 =?us-ascii?Q?1nlY6DsDNFTer9k43bRzWnKdK+zTY01ZAncgE8I96M8kKKK85LKz28dIcVQW?=
 =?us-ascii?Q?MP5aU5MNVsrXO7sbWSptS2y9aWCOUUzZOBnxseJAS6j8HdSIKFg5XbKt1Ne0?=
 =?us-ascii?Q?AX8PFFFV/ls4Q3ztpUnGSfkfZyUeRP+y3ALfgQmE9hmU+feARhBzS60LD/Bn?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3e09c7-96a4-4915-3e7a-08dcd9265c05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 03:43:15.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8RP9IgZD2MQP23dhhXriLMO5jkAGqLk3JbgZZAu3rbFZFJKzfXPgN2E1JfxMt80+/r4xitlBucjG1sg83VtNe2I8ytJ/qXPI4mNZY/4IZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 19, 2024 at 09:27:52AM GMT, Stephen Rothwell wrote:
>Hi all,
>
>On Mon, 9 Sep 2024 19:59:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the kspp tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/gpu/drm/xe/xe_gt_idle.c:56:27: error: redefinition of 'str_up_down'
>>    56 | static inline const char *str_up_down(bool v)
>>       |                           ^~~~~~~~~~~
>> In file included from include/linux/string_helpers.h:7,
>>                  from drivers/gpu/drm/xe/xe_assert.h:9,
>>                  from drivers/gpu/drm/xe/xe_force_wake.h:9,
>>                  from drivers/gpu/drm/xe/xe_gt_idle.c:8:
>> include/linux/string_choices.h:62:27: note: previous definition of 'str_up_down' with type 'const char *(bool)' {aka 'const char *(_Bool)'}
>>    62 | static inline const char *str_up_down(bool v)
>>       |                           ^~~~~~~~~~~
>>
>> Caused by commit
>>
>>   a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")
>>
>> interacting with commit
>>
>>   0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
>>
>> from the drm-xe tree.
>>
>> I have applied the following patch for today.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 9 Sep 2024 19:40:17 +1000
>> Subject: [PATCH] fix up for "lib/string_choices: Add str_up_down() helper"
>>
>> interacting wit commit "drm/xe/xe_gt_idle: add debugfs entry for
>> powergating info" from the drm-xe tree.
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_idle.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 85a35ed153a3..0f98c1539c64 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
>>  	return gt_to_xe(gt);
>>  }
>>
>> -static inline const char *str_up_down(bool v)
>> -{
>> -	return v ? "up" : "down";
>> -}
>> -
>>  static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>>  {
>>  	switch (state) {
>> --
>> 2.45.2
>
>This is now needed in the merge between Linus' tree and the drm-xe tree.

Thanks. This not going to 6.12. It's targeted to 6.13, so we should fix
it when merging drm-next back to drm-xe-next.

Lucas De Marchi

>
>-- 
>Cheers,
>Stephen Rothwell


