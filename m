Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAAB1B75C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405F10E6B2;
	Tue,  5 Aug 2025 15:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8N+aMoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DA210E6AD;
 Tue,  5 Aug 2025 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754407206; x=1785943206;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=RVtJzwN6ds3SakRR4PDIi06I30cHeHAUl3SycxWE9EQ=;
 b=Z8N+aMoV8IRQn9i1hmRGoLcceXp3hMwrZ9Ml3hUYB6I1A7J93U8xVlqg
 T/x0cRsUCXKbMvrowXBAw0ScWPGTRi5+EIrvMxtQzAMxcByG3tl4gnbTB
 EpVx6YE96mnYvv327qfWzL/N3TDOLFoeMG+Bm8wDhEe8yjM0Lla0x3cvh
 QtgRMXTWNX9uBpbWATy8QXEeq0NkzOK9GFgF0Dj6Vzy7S/JuVRjNGXYYo
 a/zZFW4G6j4A7kJIuOZQFLnqHYwU5DWNGkIjvPJF/fxOdS8YTCC7sIXpI
 vp4xVwRMVGSOC06TLLhx4EtHt4bK8CpT3R3ow2I0k2u+aTsdOzymSZouz w==;
X-CSE-ConnectionGUID: 0bpIiKFWQIeW+0JHBb7NAQ==
X-CSE-MsgGUID: 5OTUib0HRgiwdkLSWO3gDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60519251"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="60519251"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:20:03 -0700
X-CSE-ConnectionGUID: kgvJYUAHS6CtBuetoNh9JQ==
X-CSE-MsgGUID: k7L1dAGZS4CGnftrihln/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="165282695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:19:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 08:19:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 08:19:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 08:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ayaj/GgxlBC2ZnxJqpZ3esERVOzxAo8IuFF3sQTL0D552AofnmRieLGFljSiXI6pTZwXdXOjOKTxdDYRnGUN19wiT14VNjh/dQA1/2/a/tcZcKcyI7tYkEWLJ+pgMeXrMi8S/oYNjcTrWJHiMGzRZ/j2NkNEln2ciK3hRzUTLZOuGPmRLr1nFQHrKyhVhWozUtJd2Bw8HL0COR2IT853FhYDexPU+s00eXdg3ddlaXHgF2eVHnws5hNmFTKo8wd+P8kJqwSGYL6TCIDPyhueh6NE83DCokn7Pz2GKM7K9kr70qOee2FzGywjSm9AywF+u9ZfKJY4hTZ9qt53bnoRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QatqgQ8PcDxpyKiOhYLNEMsG+RaVpZ2IAi2zQeVDDqw=;
 b=RYYlTb30WnMjeEv5EcY+nSbLMYixFtRl5gtWxlzCh6H34flhotphhkwcDeDfkrGAOAHYis/fyXFN+snJ+YwrYNTQR0bQfzmm0Vi6m44PgJ/5vywqLdwaf2RZ/NoV9G4iGIJOJX1V1K3DOPmjo32tBZG3aXZu9YgbvaFClFyvZbuxCbor43MclF73th3wKDel8+0lZhn+zyHF8651vvDvRymvmqmMZp1AGZ67qxuUOrUHQXGFmXNtgfub+A2ptZif3qLHnQnhRpLpl1IoXgbf8gfRj30W1GTVA9ZQj5LngIwk7iFSCESq3h3DjTMrBtput1K5HKsaNkOLZVHUoRfcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 15:19:50 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 15:19:50 +0000
Date: Tue, 5 Aug 2025 18:19:39 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Nicusor Huhulea <nicusor.huhulea@siemens.com>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <cip-dev@lists.cip-project.org>, <shradhagupta@linux.microsoft.com>,
 <jouni.hogander@intel.com>, <neil.armstrong@linaro.org>,
 <jani.nikula@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <laurentiu.palcu@oss.nxp.com>,
 <cedric.hombourger@siemens.com>, <shrikant.bobade@siemens.com>
Subject: Re: [PATCH] drm/probe-helper: fix output polling not resuming after
 HPD IRQ storm
Message-ID: <aJIhCyP2mwaaiS22@ideak-desk>
References: <20250804201359.112764-1-nicusor.huhulea@siemens.com>
 <z4jxkrseavbeblgji4cnbyeohkjv4ar3mbbdvothao6abfu6nf@nqlhcegwtwzf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <z4jxkrseavbeblgji4cnbyeohkjv4ar3mbbdvothao6abfu6nf@nqlhcegwtwzf>
X-ClientProxiedBy: LO4P123CA0237.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::8) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA2PR11MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b24fed-ceb8-494d-6dc9-08ddd4338548
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dclDaOzWsW5SxOGVuU6gk7AATWDyrf+qaS32l+bWrZxGqn62HSD7bGH/gCnU?=
 =?us-ascii?Q?MkQVfPpZ0qP4WhzYhmEYVNWRjV/6379UVT0tBVqvCsrrln9UaM87fmn5CTqA?=
 =?us-ascii?Q?1zl7djB956ToSzHDUoTJ6nCnFhCuPOK8CGx3+iEADzQEpzUrzAmrkD8/7tLp?=
 =?us-ascii?Q?sQaIEBpjk+XloaFiINaXRxXYgvQeLtxywzxAvnJ6hQTve+9MVQvgqZ8a9kBF?=
 =?us-ascii?Q?mA++W6Uxj/G+KbGx+EZXjL+TatPm3QUPFPYvQXBslaXxGeXlupol7JXnDgcL?=
 =?us-ascii?Q?cjrPdGHHaNFfQGc20/v37TvgmplGq//cAGrbYc4m9PlFqxo4/DgI5mOEkaWs?=
 =?us-ascii?Q?z91igVgKEefHT8qtS/ZbVBQ2JI9FwgyEG8bY1AuSouuf2sA5iASj3uCH6+5/?=
 =?us-ascii?Q?sfoThRr0UYp95q1uh7Sr/BRgKnYfBU9A+h9iIn8t9d7pcj/XssfqrVFKCqWe?=
 =?us-ascii?Q?9TfNRqUcT9R3mQOKOuVD0+dLqBs3GfLPICgU+p7FntGOMGLkQzd1pIjVNpNc?=
 =?us-ascii?Q?7DLa5szZaJY1AwBoMUr6VVb5i0Ak7Z5uJ/EOMhnmBobqJCTquILv0YWVRR7F?=
 =?us-ascii?Q?RcOWsIG435QRQ9YFZOp9iOycoNXXCxawXA0yk3ZLzKKXfFxjgiQrp9hA8hnk?=
 =?us-ascii?Q?jVmFizhlJS9BNXmlTgZfdmJg3LrKB9/4+iysU5M9ZvaET78jftcWkp/klKTL?=
 =?us-ascii?Q?tM+Y3UetyDNbiJbHIPsRwhDyDUaDdzdiah/+NVjw4xWsxINcKsTc3eWA2kSV?=
 =?us-ascii?Q?B5NdtOJS/lziyElPFzHuDquXBlUMruSrTUWpvanrKV4BMQnHcOTWX8YcP0PN?=
 =?us-ascii?Q?XlRsCgO6t6IPVokBRrt5/u2WEj/Ab3E6TvldNyeFiQdi0R6gYizRyCzyvxqZ?=
 =?us-ascii?Q?u/ytmuXKXsVHMeeaAIMjIvGHtKh4YU9R3PS3XzYtVw1iG5RCQMBwouROr7eq?=
 =?us-ascii?Q?7Q55m/RQihFnJ96JV7LIiklzdzWDspgp3Ne6lKK1F0K67DXUZaAY/8MH6+hr?=
 =?us-ascii?Q?v+Dm7J4d738GsV8VUwSKKktdyK+aPtEMM4D9/9dKfa7iRRDJysCXrSXYwgG+?=
 =?us-ascii?Q?DO2akS8q3ESxSyBRxWPynczxfB0QIkd9TwV/5Q36oBmjgcZ3n3XBBCaxkcI8?=
 =?us-ascii?Q?dhn10Tv+g7RjQDS9XUVpVGjs0bhTYWn9LxKrtmtKxqwk4o3kIJnuDqtCtFJU?=
 =?us-ascii?Q?/SE8Bz6ZKW0/XV8+ULRdOOqSoxP5khHnYRymREgphMh1P+GNGlEN9CLfM1F4?=
 =?us-ascii?Q?KzzFAOKwcECr4PhZGshjiFG62Uy3O79Q1YNFq+YjprLd0Zieq9bQVEndsdmk?=
 =?us-ascii?Q?mSi7cZUt/vRg+KWHZCU2gHd6QevQ1SLa8QFECxTYe54TOdgIw8JRLPNucKWg?=
 =?us-ascii?Q?MSh172qQa8vRYEXNWgtIbENPpGHA04IyhUQ8frAgd8zinRiS1vP2MUIsRtU3?=
 =?us-ascii?Q?aIemQdeDy2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EuBEnLaZTMULBCuBYWHJBKmzZaaHqmL+bj0ZVVdIRpJ3hpvQatrEHBdVqYC?=
 =?us-ascii?Q?TCunsBOcLEbw9G0Hmo0RyjXsJkEvrsIslQJV09b0osgdUVApk5zK6+7Is9La?=
 =?us-ascii?Q?ePUr+ltpfRGPRXTTN30iXRensT26NihaA0/G/V2y8Kn3+HHyFWpJLLwFJIgz?=
 =?us-ascii?Q?bMlcPee9C1cJyT4J2iuFQVVhxslArosnuXTK7hdgByYlrDhxPMb4TNj8dUlq?=
 =?us-ascii?Q?o5UN5aCkiqbU9WOfgw/6V/AQn6mQ8ZKUmah0BX7gsypvOBgmyTsxix4J1+hB?=
 =?us-ascii?Q?386DteAn5P7YrX7gOhmp1mAKqAfY9y9PM9ZPDpPeyeg/4JY4CLzetnxDHmaP?=
 =?us-ascii?Q?fivj2y3HG/JQmLfy+LLgq8fdQ4uucBaw9jP11O9L71RZ6zlwxYTNwxnTcNMK?=
 =?us-ascii?Q?dG5ptRFGJxxEs0EjA00YTLMVuwIMjA0H0wJvFnCg2jx/LOfnNb6bB3yKQAFn?=
 =?us-ascii?Q?O7UD2NijxTrCC4XMyQ7U7CwQMqMzMXxgHEnY1S0Wbnv1fPNkQn4iSEHcHqFJ?=
 =?us-ascii?Q?lk+2A6i08ok+Vs8I7U2c+J/sZ/Cqqgwr+QZIsfHKV39P5LkWqqv8XjD10BH2?=
 =?us-ascii?Q?MA73dFrd/LbtTFe7tpydoM8uJ4vVP5EHhMnE0cEdd52WaNcOgb18cr6kxgyZ?=
 =?us-ascii?Q?RCwjxWZZFMFPK6SCHhl9Lzg49kOvNTzpdsHg2sfmbV3AQrTOXzasllnUgthE?=
 =?us-ascii?Q?MyxWZ/OzdrtXyIPo7vBFbYFUzyYuBYZo1pDt/BeDbSSi5ymWjilIC/5I0Q2d?=
 =?us-ascii?Q?3kE5dCYWCoUkwP9e2lXfgULmK9y6cFrmxbwFbenAaLltW4jU4D/UMAMza9Go?=
 =?us-ascii?Q?FUDSop0YnwruHyr6wKEudGIyalkjd7RvMWnnnM9wG5RIE4EouGfqO0Su98M/?=
 =?us-ascii?Q?XWTxZDKVCeWe2E1BKokeuLUKvPIH/peVBQvWrM7UfgBUm05fdDz4PBu/lbc2?=
 =?us-ascii?Q?bv3mZ7d44L0a6UubGTS6ZKe7lsopO33HBXF5KFdB6VV7wzl3FfSueCHXbNrN?=
 =?us-ascii?Q?NHV+U7TghKtVcwsGoJhVqkVRk0unY559ZoUjX/ZYObhGoTvI7hDbL4v8ViUQ?=
 =?us-ascii?Q?hlS8JqJkdAfHDKEmetiNUv/NXEB+6mdCnAxD2PZayuThAcwzQ8QSSw9qQGlw?=
 =?us-ascii?Q?lHDCSSov9SfmMZzRqM5Lykd4Wxe5EApDuu7bl8nx/UHFBZZQhmeaRwm3t+1U?=
 =?us-ascii?Q?bj1AEBUoQE8yjDz2RlyxQlP8dp5JwkQvq0gHwVe+yQ/0gK7cv4EUbKVhhVUY?=
 =?us-ascii?Q?Yys0s/bE0lzSCYOevtQ4992uhwv/B95jLc8/4lDnWx2FqhjUutrxQNr/905H?=
 =?us-ascii?Q?GPbvL1aHB6z9Al0QQTjDomc1UkYFpazr6NlaKE7vDQ9EuJ8GPVdF5w6ijgvD?=
 =?us-ascii?Q?H3JAu1uLlymJUNHGQLQfA3hCdWum/lSHhKJJ0W3I2Y8LArrOx6ALz4liuDUp?=
 =?us-ascii?Q?ZrZfXE5UiSYRyC3ZWrwlvLHOS/0cMeEvyMWnuASkX5iI/Cp5GfsTp7Ig9xfb?=
 =?us-ascii?Q?C3RE+biUC1vb61m3L7fsnxp2Q2pCM+qfae3ooeTXZHeW9o8WRwr/LbQIhwQW?=
 =?us-ascii?Q?pS+UrrKoHXAtD80ihh6SO879SzWmiAWjsla+sy2oJun30nfwxOd/wTVTCeEv?=
 =?us-ascii?Q?pwjJH/dftdLBN7xQ2jk6w5CixgpzTCHfB44t3FNph7rs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b24fed-ceb8-494d-6dc9-08ddd4338548
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:19:50.2565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVu21GuJe52RJn09jDFZzAM/hBR49lRVKbbl9DgyigAVwQnWisHpCk712GPUKSMdEfqsXMkmT5P2EdhhDk4ilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 05, 2025 at 01:46:51PM +0300, Dmitry Baryshkov wrote:
> On Mon, Aug 04, 2025 at 11:13:59PM +0300, Nicusor Huhulea wrote:
> > A regression in output polling was introduced by commit 4ad8d57d902fbc7c82507cfc1b031f3a07c3de6e
> > ("drm: Check output polling initialized before disabling") in the 6.1.y stable tree.
> > As a result, when the i915 driver detects an HPD IRQ storm and attempts to switch
> > from IRQ-based hotplug detection to polling, output polling fails to resume.
> > 
> > The root cause is the use of dev->mode_config.poll_running. Once poll_running is set
> > (during the first connector detection) the calls to drm_kms_helper_poll_enable(), such as
> > intel_hpd_irq_storm_switch_to_polling() fails to schedule output_poll_work as expected.
> > Therefore, after an IRQ storm disables HPD IRQs, polling does not start, breaking hotplug detection.
> 
> Why doesn't disable path use drm_kms_helper_poll_disable() ?

In general i915 doesn't disable polling as a whole after an IRQ storm
and a 2 minute delay (or runtime resuming), since on some other
connectors the polling may be still required.

Also, in the 6.1.y stable tree drm_kms_helper_poll_disable() is:

        if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
                return;

        cancel_delayed_work_sync(&dev->mode_config.output_poll_work);

so calling that wouldn't really fix the problem, which is clearly just
an incorrect backport of the upstream commit 5abffb66d12bcac8 ("drm:
Check output polling initialized before disabling") to the v6.1.y stable
tree by commit 4ad8d57d902f ("drm: Check output polling initialized
before disabling") in v6.1.y.

The upstream commit did not add the check for
dev->mode_config.poll_running in drm_kms_helper_poll_enable(), the
condition was only part of the diff context in the commit. Hence adding
the condition in the 4ad8d57d902f backport commit was incorrect.

> > The fix is to remove the dev->mode_config.poll_running in the check condition, ensuring polling
> > is always scheduled as requested.
> > 
> > Notes:
> >  Initial analysis, assumptions, device testing details, the correct fix and detailed rationale
> >  were discussed here https://lore.kernel.org/stable/aI32HUzrT95nS_H9@ideak-desk/
> > 
> 
> -- 
> With best wishes
> Dmitry
