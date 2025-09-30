Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E2BAD305
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3F10E5E2;
	Tue, 30 Sep 2025 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZIN0gDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9908E10E5E2;
 Tue, 30 Sep 2025 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759242792; x=1790778792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z3OGiCZaRyPOnY/vw8AcTZ1YHVRzAWgWJQLY87mF/+M=;
 b=EZIN0gDbcLYB6qPTyPzZ59LYN7amMpQtPYb3HnMgz3vi8dyh7FqqHkkq
 ySXkm4xrJKi88WvwGFy2doBwf9STVWXpNYvdecgiymBHWWdBg3WdkPnRp
 mGJuxGkAFs7Ro+7WaZZGEh+kouzZhs+7xzsrha11gaGzMWm4FI3/kUSCY
 t7P+y4qNSISzZi5vwsAX6nT0EaQpTko1njsPUIYjmrPyVFocvYWxbPgqM
 LQhTb0n4himRQMp91nGjzfR/+2x0wRCgCMSGv00I9OsDLmbf5uYVFeSWR
 VafVFn4lU2GmDz5wwt4rUaZAYBmCWUnUWNeXtcczQU1fau2fExfnh4vDK g==;
X-CSE-ConnectionGUID: pixEvMgeRQu5OJ34d1ebQA==
X-CSE-MsgGUID: dOqD49oGT52ZOOUPxSn8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72603181"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72603181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:32:52 -0700
X-CSE-ConnectionGUID: EdFZnZhCT/adWnI51hPLCw==
X-CSE-MsgGUID: reILtWKZS++F6slpiAc8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178495060"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 07:32:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:32:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 07:32:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 07:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQKb2mZhf3k0lSyQUwSm7PaegfejGulIzg7669UtbeWVoPfE9akG6U/WLrA129SupiCjy+QtT/08AvEFmxgQrvpkG19X3Qa/ag61gKh5G3QK7yVR/fuRvz/J9+Kxb3VRL6ZybyygEU61lCSV7vr2Li/0bhtaj4yO5IpAP9ZYsx129lrL4Dc0qE+qflI9ef4imgE8pZDnfXVNI1xaR0uW0BcrUZn3MtKeB48hGAE9rkjlIasClL/I++ODhrA47Css13yupCNg+XndeDzZCsZBK2ZysoM8bmRu6Ktkz3GDl4o8zvaWZc2gLQRlmEA8U3RmiquJLgUqc6v9atjU0w/PQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zcpbGDYzD3pbFsmfRYhLbUMzzmsOCPV3QZz39CaysY=;
 b=OsZjSdQJmtHbkUek97bPPa7viMc6oK67qsRAUSVvfcdJqRHmZAAb8r+JkMvwIMCpQecE440P/fORZ0E1s3zgwvWwl1xoVofmAoPcBmnmDn1EcyvMg536vkZy9d1kZ4bQ+BhiJ3eAV/q9L7FX3mUdzEpIQgkf7vaQlq37jLdTPgwC8vWrX5D0Gkztpe/LtsJDlhDAa5uMyarmJOSgtOJInnBFwy4YATiNCk/xDofi06Hz0bQkp1fNOqv4KAYcQnxVUVFeRbXDtMbKCKM7Ggdbd+jkMwEMQ3vyCz9w3NzUSPZxd7BF/Til0Hgb5az0ibG9v/znwMvhB74W6VcdbhJbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF2F2B659FE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:32:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 14:32:47 +0000
Date: Tue, 30 Sep 2025 10:32:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, Colin Ian King
 <colin.i.king@gmail.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing
 initialization of variable offset
Message-ID: <aNvp7rEGBvrwdQr1@intel.com>
References: <20250924102208.9216-1-colin.i.king@gmail.com>
 <19cadb88-1b80-444e-a062-54f3f42c856d@intel.com>
 <CH0PR11MB5444AAF5F484F5F35522F994E51BA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB5444AAF5F484F5F35522F994E51BA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF2F2B659FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 50856cf5-3fd6-481a-fd71-08de002e396f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?whXC2nAfW7tpTkiNpbYFTPgICcDmnPry1iCsS1HSJYs+Cx2Bo/Eoj5VOm/?=
 =?iso-8859-1?Q?dRECB9Fwh8bjbXoMZshCtXVVXsWpPBTqMMaSuwtSleIa8BvFoTYGijcm8K?=
 =?iso-8859-1?Q?d8E0KIj1MQtdU3vIvCz/1eAVCnSlFKVmSfbAQdLsn2tfV7QbF864f/PFCI?=
 =?iso-8859-1?Q?la/4lA72foDz1VIztWNF+eCY9Bo80rfUJmeg2BJLI55LmFdXv4ukiPNoU4?=
 =?iso-8859-1?Q?o+L3MXVkCfuFZEDF2NKsBVRi6vayb41B8WZM/r+/xdRlWY6vp8ItY1wAE8?=
 =?iso-8859-1?Q?ZTaxgtDPvsECh7HSr3J9zRvSe/QVqVqhyP/gjdksjSiTmiCOPsUOhItb5c?=
 =?iso-8859-1?Q?QxF3FSoxjyqEap1pXBKhl0fSQPHa1l5cJ8emnpv9x0vRxw9YLpa7TJBeVT?=
 =?iso-8859-1?Q?lwjzmQs2f/TL7vQDuGgFjpEZcpDUZfDLuoq/pmqiJzMxSYO0Un9Xb4L6WU?=
 =?iso-8859-1?Q?vnsw1m8bsBv5aHnkIHaO0epr8WKIHUQjMKU8a+bz93HAKn5EhDEmWOXRZj?=
 =?iso-8859-1?Q?ImaT96Hm+8UwDOT1dlwZh00k4wFJ0wCxW2R6amUGlVgjiYgX30zcsdBvQb?=
 =?iso-8859-1?Q?Xh9wuCKavYw2qzU2XFPfcZm8+LEPYnSBYQavyChdnrSjVZoctDnad1YC1A?=
 =?iso-8859-1?Q?CGhywKkI9DJFiHCynpHoyZkKAStdFim7+4T+fZielUqTsM13JvNDxYDgMi?=
 =?iso-8859-1?Q?N3c/USN4wYPazIj31INtNnsnI3K3fZnmy+mU9PwXwa/8fuOMyQ3FzzdxNE?=
 =?iso-8859-1?Q?yFX2qhCgGP7y2gYW7WYTe9NH0zO/naZiYb6BcqGUqf10DSvzKqwnrich0x?=
 =?iso-8859-1?Q?lH70zu8G+Jgf428JRaZjhG8iabPEbt5Us4bvAw7hbexUe7jvilfcCLuP50?=
 =?iso-8859-1?Q?5SJn4fzDUJpo/QzkAD5VJyDK5yJTwAEP8D+mNY5ZeY9YJS/UIpPfS5y68q?=
 =?iso-8859-1?Q?zrG2L2nNHRLEHqowql2TdZv7yTpZ0fhS6aUmrxchXijc+auQZDKiqICh96?=
 =?iso-8859-1?Q?mYiNefhnt5J/TcycKxkN3nAv+xRDeCUxXUbZJL4qqe2lyrtKR3MvtrQqid?=
 =?iso-8859-1?Q?mvR+V4BM2LqPci00pnjm9Z5wS9tAAVW4pu4NoDuUe0ywCkjEx4xBZ2dtLm?=
 =?iso-8859-1?Q?s6wg6iorXCVgv+5t75hyyX/ZT4t8aepdzZMwRmdZJlPKx8OrfMjOFNbyAe?=
 =?iso-8859-1?Q?T1b6XNfk2VdO8Zd1IDssajJcCniYE/lSeCDdKSCOfTM23tOeX+gS8kmn66?=
 =?iso-8859-1?Q?+N9/5OJDE3QHWHq2CGlbpQy7X7s529r6mi5AiMdrE3uEf/GOC1JNYdLKFM?=
 =?iso-8859-1?Q?45K7RQIO+i7Mr61s7sUByGMJIRFaijZVB+z6R3hdaScP272J2Wj+NJYRIf?=
 =?iso-8859-1?Q?BvpJvv1BlYkHfVsE+pO04oNFCiNkrc4RzfEHlssHW1+dhNwEm5ESxeSRKf?=
 =?iso-8859-1?Q?+B/cZJj72arZyHNd/1QD9Y1aKFEpLovrk6QKooWAxaAMfp9D7cXhEOYBc3?=
 =?iso-8859-1?Q?aP2Corf/Lg5vlf6DZCIrtA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ShlGAkkiF3F2l1nMJzXE6L7sXIdVHlJVsxqwO1H+l7RDNuImNQqyiEWiz7?=
 =?iso-8859-1?Q?22PZab3kkIBLudn2Tqtx2jYL4Sj7RLfa5S1s66hQ5iQwcUOya9AFrJFTjF?=
 =?iso-8859-1?Q?Dp5vHEjtBImocEB4EVcwhLG1n8dvf6lo5ITR96uKG2ovWW6+NS5nOz41i2?=
 =?iso-8859-1?Q?84/g0eNNcWxJMPHuzpYnxXWGmIcKIVgruuDJAqhN2yTbPyopOSbKlHIDiz?=
 =?iso-8859-1?Q?1lSwyZgGqaA51nCIqQvAH5oI3capjMuaxEHdwbhdRLBTi/XnO98go44NLw?=
 =?iso-8859-1?Q?KPjo0z+x66c3POjZMf7DIi2U7ICn8yQGf69nOOm1sgr1kuZ/OvdKeqK4n1?=
 =?iso-8859-1?Q?ppQGaSDPbitlN9dokxjSzjmKxA7d3B5ijVn+zd3LeF6GHXCW4lsHPk9WjT?=
 =?iso-8859-1?Q?xFK7+tAwpXHKMdxek8TfHe+1YSPcj9xNDUmmOXqq7Q/ggJBV4amPRpUMJ7?=
 =?iso-8859-1?Q?OJkxdE1V9vds+U2FDBmIArJUNgXYhg2+BTCeZOI72ihRHxS+8crllobHzb?=
 =?iso-8859-1?Q?pKoRkp46S0mkohLQgV7flcIBHKEQraQ/K7v/307AQrKsibbtjb6KIFiLG0?=
 =?iso-8859-1?Q?QoFFe5p9CGXQJpLf+T7k+mCeJlBc8HzKpbIwK+xdp34pofKfeohtl70gtE?=
 =?iso-8859-1?Q?ajtEkyxV4lqxJf8DcNXZk9t08VktuVQOlSaqgPJTH6Vi7dQRu9aGHfa3Ip?=
 =?iso-8859-1?Q?zUydOe7MMFfXlIOEUYgPr//w9XUsGj3Fw+Xwbst46Qs4bCoTviesAPmLEz?=
 =?iso-8859-1?Q?5H1PdybmGFEd9eJlZdkA4Icikm0NImUsQZ/kVM0gGQgGr50IYuTT1gJB86?=
 =?iso-8859-1?Q?jfuFPezBlQsRe0hOEuYd6b8pZdZjfTutDhqhPsORBtHdxPiKZir65l+Nn/?=
 =?iso-8859-1?Q?CEv4dL5EboO6Yai13mN+X2TOWB+aDwWlKgMNbfiGs/bC5LjyK9OQrzlmIV?=
 =?iso-8859-1?Q?3LTm4s/Xb/e8P6dzF/9RQWqUyMFzrqJ7noXNn0bO4vomAox/NyO/oBf6+b?=
 =?iso-8859-1?Q?X8Tv1EWLdzFRHZP1nobQljUugjvcdp/c45Bsws3kvw2FfgEO+X8LYIl/Bu?=
 =?iso-8859-1?Q?IbCuRiDy5J9FGmh4d71djwb+hIMbD6oKMTMLZ87EFHNSaqL4C79JFwT7QL?=
 =?iso-8859-1?Q?b4k81BgKY3Q3cA1YDsoD9nUgmZ827MhoIPB2lecefsezYW2LMl0P4aWPbx?=
 =?iso-8859-1?Q?eQtiHknBZF0mU2XDDSKWR1wtZflEYGL0ZObYn8VtxBOUBr+cnGuuVeifaq?=
 =?iso-8859-1?Q?g9jNTCFQfi5fOwmQQtwNOEHu4mIZ/SD8XG+NE4VFH0Lpxwq5IRXFgvVV4R?=
 =?iso-8859-1?Q?mXavEf4R0JmHjmCsJ76ih/n2u9wLRjmGU0gHfzov978ZkECZ+5hymdJ1bM?=
 =?iso-8859-1?Q?FVHbgyPYOlrTzmGCcd3jlHYjrdyQoMtFa95T+cNGfeA3f910wHezPBdQyw?=
 =?iso-8859-1?Q?usCikWLYSreXZxy6xdFRdCxvYHYbzbEobSrGL2xgbI+yUEIJxKxJyGyFrr?=
 =?iso-8859-1?Q?+EZGAEkp5CFzH8NuWdBxJqWFU8JX9EzmlmbiNYi5LEWmbZjpDTzBlo0VL9?=
 =?iso-8859-1?Q?aPQcxPd4Rfz8VTt8QudKolxeeKCM17GrD+H802su3ZG8i6bjNRS2JhqKXd?=
 =?iso-8859-1?Q?m/Gq8SonoTetPrlPVliVi1uZGH2sr+NaLa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50856cf5-3fd6-481a-fd71-08de002e396f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:32:47.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNpj3NFOJebeZr9DVXhEr05gWvFUyVZfYc32DmHE5vYu38sMmkAVGHTPJIGszqzes3tgPA2CIjpsvGwcJP8TqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F2B659FE
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

On Mon, Sep 29, 2025 at 11:49:24AM -0400, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nilawar, Badal
> Sent: Thursday, September 25, 2025 5:05 AM
> To: Colin Ian King <colin.i.king@gmail.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas Hellström <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing initialization of variable offset
> > 
> > On 24-09-2025 15:52, Colin Ian King wrote:
> > > The variable offset is not being initialized, and it is only set inside
> > > a for-loop if entry->name is the same as manifest_entry. In the case
> > > where it is not initialized a non-zero check on offset is potentialy checking
> > > a bogus uninitalized value. Fix this by initializing offset to zero.
> > >
> > > Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

pushed to drm-xe-next. Thanks for the patch and reviews.

> -Jonathan Cavitt
> 
> > > ---
> > >
> > > V2: Fix identical issue in parse_lb_layout that I ommitted in the first
> > > patch
> > >
> > > ---
> > >   drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > index 38f3feb2aecd..8f5082e689dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> > > @@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
> > >   	const struct gsc_manifest_header *manifest;
> > >   	const struct gsc_cpd_entry *entry;
> > >   	size_t min_size = sizeof(*header);
> > > -	u32 offset;
> > > +	u32 offset = 0;
> > >   	int i;
> > >   
> > >   	/* manifest_entry is mandatory */
> > > @@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
> > >   	const struct csc_fpt_header *header = data;
> > >   	const struct csc_fpt_entry *entry;
> > >   	size_t min_size = sizeof(*header);
> > > -	u32 offset;
> > > +	u32 offset = 0;
> > >   	int i;
> > >   
> > >   	/* fpt_entry is mandatory */
> > 
