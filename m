Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BCA5EA7A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 05:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEEA10E1F6;
	Thu, 13 Mar 2025 04:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7/klOQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCC310E1F6;
 Thu, 13 Mar 2025 04:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741839371; x=1773375371;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wKXFFXCQI/kDzrVQai/VyjtJh0Poq/rTZZ8jDr0XiuU=;
 b=k7/klOQJm5o52weEBbS6S9PFGuK4wlos0XfMaK17uWf8LfWMOQSvLpgW
 DMaXUCjms2g2mYyTU9C0M9EMEwLWo5tlxn3FjzDh0bEyKaW4ljJ/yE4FW
 1OX8UPZEKktdrUiUmKNam6/G0ePvsWYp3350bv5vscynTOEtTjpgeXoRC
 DSFpsFqFFMeWO3B/e1gkWOcpKOKl/LwgcD3GiWKT9t2RxCJ1NpuY5Uv11
 ygjIwNuaihxWRkwDDAuyrRn4h3zaVfhytaTkhU4xIjbfRpSVuw144I6oi
 lyTsX+PMPqSBM1/3nBcM4uLwQo0qjSZzfRpjsuWbLPmzaz2GzUwVhoBPx w==;
X-CSE-ConnectionGUID: xM1FS1DKR0yHTCCpJw9L1A==
X-CSE-MsgGUID: Blux5xzkTku9tljaXCKvgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42819539"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42819539"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:16:10 -0700
X-CSE-ConnectionGUID: DyBWuByOTTKx9BnWTGXNJA==
X-CSE-MsgGUID: /ApawI7eQSaCjniJ69KAsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="124992926"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 21:16:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 21:16:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 21:16:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 21:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs3vOLMThL4D3NbZSV2MVTulkr8l9Ng5EY2Oj2LaFvUNrglrXVALrT+cpJM9fcdr9XTmhq7W8zFRZqY5+k+gk8/IGWlXFP27M7Mbxw/Zr3mS/FQTV06Yrm4AxolHrietcAhcAZnpC7W/N3MFgh7Zd+WkdbfFFAX4Xlqn8fpYXDNjeDmbicnMZOoMMNGiXVWAyc5scyHAsVcnWEf/lJm91dBcEoKAZaheRYbHcJg2GOT4cDUR7jm0kfB3ZzOHrONydgP5M/QEQ1YVikGnIibjrH8XzZvHyH5HXPkC3DeghYWuPIMZQ3KJFxaknqgIpnHOq3YCt8ocnjDnPZIb1F6O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYlyt0Kf4IODawiqOUlEhhLnVPqtZ876pzWmtHopLcc=;
 b=NGJky2P6z6dYxOjk+EAyNPfeAm8adcTp9nioVoe9wgG3BITRnmSYPIKvcUudS8Ai+wQu0HTpu2zmGeg8ls8kaw5ow6+o7fwg+kIoYxxP9lgwBgDXnl4tXOhd9gsdffRhWgRMKE4m115fB1y9YnmChGFx7JHdvvaK6hsmr3X39gj+iUU4PKmWxvLEPERlLer4fcrCh3tpqBRdlz78XgUzRqwXwRRE+Yr1uYC1lz83IVDdNRtopljzu7utPzgP1sMt6GQ0SA+uGOQ12Oqp2uYkpGhV3NTtZ8S+ml2Eqo8k1hkRzkGsgRnMAuvoTG2UHJePLEejbvsq5dAy0/aElKJ4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 04:16:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 04:16:07 +0000
Date: Wed, 12 Mar 2025 23:16:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
Message-ID: <72jcyshw2tp7tu3toxpjmm6rc673o6ai3tlryp6vkayheoe4ow@k25nln2qajh3>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <fao7tp2y66f7nuep4nl6kz5zenfpzswp3hwqiw325uitgu6u6u@7dipwr3vjui7>
 <f15eac8c-567c-4ae5-bf9b-bb3964c83846@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f15eac8c-567c-4ae5-bf9b-bb3964c83846@wanadoo.fr>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 674eaacc-5f7d-4f38-4ca5-08dd61e5c716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?H5GuaGwgSlHoTQsyWxJ33EgV153xF5zjz/TFt16yhSJpsyd64oPqSlAMkB?=
 =?iso-8859-1?Q?YXGOJyl8X1rEFMikP1FQgiLDI0DAsPVdWECOqjJpGEpr1z/QJVh6rB+AWB?=
 =?iso-8859-1?Q?azUMB1FWGU09MgS8LWqU/8P9wamt6rmX9WKuEbLWB4Gz//3dTZRZ1nYOy3?=
 =?iso-8859-1?Q?iwLIWaKz7IozZiAofpmkTPry4BjAjvic/Va+lPdaDEO09X8g7YBO36EdtO?=
 =?iso-8859-1?Q?9/xDT7qqpwtIZY49QKGXQZVuqd8DHEAPxVeKWxoI4Be63BtvNS4Wp9gcSt?=
 =?iso-8859-1?Q?pTobVDkB1Cqi3sg7EU8RG995M6BZRXlaRqQZECIQShkdIRieEvCiPevRd5?=
 =?iso-8859-1?Q?aoTQHe+7m6Wx2epp2D8mv4vE/O+zB6fOCnVnnVmZc2BSCq/CUt4dx4iTKs?=
 =?iso-8859-1?Q?PQ7smB4ddyRwRFUqjLXRKkN5RDvB5d6XIBoaYqW/t+0tiKi4YUTj4zwXx4?=
 =?iso-8859-1?Q?4gV+byhoUeHnQr28l6bvYDAL6+0zH8HTSDO2bh6GiBkyoaiUs16mnKLjnC?=
 =?iso-8859-1?Q?lYnL9/3Touw8PsC5es8ch2kh34yNTiNaHQoRq8teS9iDe7n3DjfUdYtvGN?=
 =?iso-8859-1?Q?VhVzp50SGFRZ1nHZ/elpFl/MnkSeg5nN9CtDgJ6KXyVTAhNSEZYfHYdedp?=
 =?iso-8859-1?Q?rEo+VZ+FGu0lQllPkrzS3z6opkS2KxllVXd7nkNIf0AkYTDifKBaTuQjAR?=
 =?iso-8859-1?Q?60ulIODAXg6pR3c5wBYS+wBQaPWHumaw9xIgq5NrXjWqgiWFujxNkOnxVO?=
 =?iso-8859-1?Q?V3waHGArKKmz5dNISk3evYDUMrAawuc8sa/HnwgpWWozY6uzOm9ColRZzF?=
 =?iso-8859-1?Q?XqIGj2JoDv6d0HQd7X5wvkVgSKqmtQuW/jFWsIfUZB7jd8OCi3h8KKsoDV?=
 =?iso-8859-1?Q?y/awCDv5l/eJjT/p2L6tojz96D5VzQUftZm6YQy5yvkfZebPehN0baHrlm?=
 =?iso-8859-1?Q?UvOaq2uiSy9iXHqQg3YD0xXyLMvubeww1xl9yumNS5HZIFec6O+Tylf8F+?=
 =?iso-8859-1?Q?qOnXOAUDv5JtMCC4QzvP7j+z408iVuogbpPL4bMVQst+YZU8jHMOXJocsZ?=
 =?iso-8859-1?Q?9beAEX74pYK1AHQhAdNW5wWdeVsJdvyRYftQbQpBDORpvwKgEJ/IpdTtYV?=
 =?iso-8859-1?Q?fxkAWCHeRNRF4TqXAmsP9T7rH1XqRVZkLrebB0oD8NMCXr5ihPJ7zKERFS?=
 =?iso-8859-1?Q?3xn2RB4G030JF6VHiA/deCN2SlOaWAVFajU1zDsEvKKEoN4sSNap5MIke1?=
 =?iso-8859-1?Q?bjOg004UWM6dBKUgUzwDuMUbdadm11qU9A/yAGHY4f4yx5+y23zsA+E1kp?=
 =?iso-8859-1?Q?kM9gAuBi6H66nooNl84lhsmRDX4uYCny44UjUNejTXQXqXILfdiVrsfP1N?=
 =?iso-8859-1?Q?Rkz+bbEsji1+xlq7r7ExmiSS3TWyruY26tz8A7qqyqVmQ03AeG5O+usK+5?=
 =?iso-8859-1?Q?k3b55Ns2K8OmmLHr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sFGBa++1yI4rW0xbG3Evq/ODqyF3qI+rEIOZHBxHRk9kP0+fPKspdzX635?=
 =?iso-8859-1?Q?YsFPgue+ULVDW5hf2Y03n1NZXZnavtltIVdAKNNFEkvktdn5tDxtW+LgB0?=
 =?iso-8859-1?Q?Hz09SuHpmcNtzV9P+5Mthlrnq52adyBQ5KANjxmmQg2MJnhoV1+Ujlu2Fm?=
 =?iso-8859-1?Q?FuWmWsEZxlYdw7e60SZx/q83ReI9JxnmW4jtLzwZQtj9ZRUFC35Qo4LJf3?=
 =?iso-8859-1?Q?7U69xSU5TIkI7uZiltCB8BtYp63jyaUVXRw+P5LmBYCiG5hM2Upk7OGDn4?=
 =?iso-8859-1?Q?YjlJjuQ9090Z4DSVPOFWKK67UA/k00arxjG2ymk1nclnWJWq5685nKOUZP?=
 =?iso-8859-1?Q?9IROqn3mGJW3b7W/B0pi7Sj47cKONlBjh/L+s/RJdw0xHoWcMnAcK4+cVX?=
 =?iso-8859-1?Q?QUaPehO43Dky53E0inwUIC85Tx78kJ7bqigzT2/wGWxpsCxdfrTZjs/Zmz?=
 =?iso-8859-1?Q?MP7EFQinHrXv4RK8BVu62voJCnVf2ccguqQXJsf18iqg747zFZ9XuC7gjn?=
 =?iso-8859-1?Q?iwu7Jxc8EfjqkFdctu1Czl3/5bMZtPG+qGSySCa+Ubj0FTUfA9VPQz2+tW?=
 =?iso-8859-1?Q?3ZbiOqt0qr4pPNrAHlpHkSRuwMbk5ei6vRsc1tOuPs0eiXuEdZ03ISToLW?=
 =?iso-8859-1?Q?NLQ9o2VB6VOoseJe2x+nKu4kdW/T8BLtqJSWv+JxkYWSxUZmE/dCDvsgdR?=
 =?iso-8859-1?Q?4IWU3vjUYv5mdI+qUfmxWj7Saot9w0+xFvjIfEzDzjZ00J29za7Yk1jLLb?=
 =?iso-8859-1?Q?QPqVFG58vJxcebckgC8uz6/KCxbXAh8AknlsnhwrEcReQfCkzsUsDqo2mk?=
 =?iso-8859-1?Q?HWN49tfO+64iwQNDL+YOzpQrtN+2GaPb4hrC2ThIkDeuhiWdbAaR25+zld?=
 =?iso-8859-1?Q?r5pZi7Xi2rT3YY4/hlIcnkrDdRBJp22WA9FJp+3riakIxLVG/ubgp6gZv2?=
 =?iso-8859-1?Q?1n1uM4h4c9KCLr44OJ+Y5JCB78mL7KKM5O84vFhKSTgghqROFoX03NDZJx?=
 =?iso-8859-1?Q?QmExhzigMlbrfKQHjm7G9fj/ZftZF8pnlrMODRInDlo9bXl7Ppl5/5Rth0?=
 =?iso-8859-1?Q?ANTk2S16h2BnDro7axwASHXw3oA4mCBhmTXkx1ca0wiB0KTR90eFx8l+a8?=
 =?iso-8859-1?Q?ow6x+QJW+mvV9Io23Ek/Xsd6DgXWhLPEiTPveZoPwhKCrHBga713SO143E?=
 =?iso-8859-1?Q?wSmLcqQctU7CkZZ9XTjCZZGk29rduPRRs5FT1owN08F6ZX5Z9u29X3Wrr3?=
 =?iso-8859-1?Q?VruXiGcEk7wfbzpCMlm30OJmFo0Wk02+sCmtI07gJdeTzU4DtKPJspKrt0?=
 =?iso-8859-1?Q?Cnuf4xwAQgnsSIdYgTreOY+qePa3RaxMY7yXfKFDam5Dfjd3brzRrgef+r?=
 =?iso-8859-1?Q?FjITf6r0S1o6zrwRQdml7XCE8E4kIjLcaNfQ2mAgMuiT25jEV0+gOejHzx?=
 =?iso-8859-1?Q?OSh+IFXC8SzwlZ0yzE5y57Ih4HOSPk9l6gxdzfUTD4F+fN50crtSTT3eJf?=
 =?iso-8859-1?Q?rvnb86TR8aer9BHZp5z1KCFttBRITMjWI5umxhet8rwRC6E2aO5wxB45SX?=
 =?iso-8859-1?Q?9PtuwWXvC1NOJS+qX70sQ6klICq2f22m8wlPxQ95phRuvpIVokHYjQPsE3?=
 =?iso-8859-1?Q?UjQyZ4yYxnh/zlHWWrPjyrddx9mEDRUyjq1+dFMHEQmyARxF1J7Jl1Og?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 674eaacc-5f7d-4f38-4ca5-08dd61e5c716
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:16:07.3976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSMyHyeZAUJako01sOaevcbGEgstqvnkSA6TlNUW7lUtpB2FfuvKqh7B113ieLn9SGf2mbXPSgHoN2vzu4IekWQbWK1BLexi8tIxWLxxD/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
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

On Fri, Mar 07, 2025 at 02:10:28AM +0900, Vincent Mailhol wrote:
>On 06/03/2025 at 23:34, Lucas De Marchi wrote:
>> On Thu, Mar 06, 2025 at 08:29:52PM +0900, Vincent Mailhol via B4 Relay
>> wrote:
>
>(...)
>
>> it seems we now have 1 inconsistency that we comment why
>> GENMASK_U128() is not available in asm, but we don't comment why
>> GENMASK_INPUT_CHECK() is not available there. Maybe move this comment on
>> top of GENMASK_INPUT_CHECK().
>
>I will restore the comment in v6 and put it next to the asm definition,
>c.f. my reply to Andy.
>
>> Anyway,
>>
>>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Is this only valid for the first patch or for the full series? If this
>is for the full series, would you mind replying to the cover letter with
>your review tag?

only for this patch. I'm the author of some of the patches and also add
my s-o-b in others. I'm not sure what b4 is going to do with those - it
would be weird if it added a r-b on my own patch.

Now I added r-b in some and comments in another.

thanks
Lucas De Marchi

>
>> thanks for picking up this series.
>
>You are welcome!
>
>> Lucas De Marchi
>
>(...)
>
>Yours sincerely,
>Vincent Mailhol
>
