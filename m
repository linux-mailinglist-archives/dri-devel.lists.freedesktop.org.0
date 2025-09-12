Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C7B541E3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790A10E0C8;
	Fri, 12 Sep 2025 05:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbRARBNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE6E10E0C8;
 Fri, 12 Sep 2025 05:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757654376; x=1789190376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fr5R5YmzgpX19mxyuwp7KxAEcF6Wb9EEZRtiri+lKtQ=;
 b=VbRARBNZvXj4zcYX2/uMAYIaSDgvptuUKmsnUxQnYIJ2GOi16kg5c97y
 6ZBZRyefzeGL08wRTnh/GzlCCSSRm8kg+3PjQ5fvWp2v/e0HgcUMWG1Tq
 tRMrB6aqjp6MANNe2WWn4pfFZHy6HHKjVJKXQnRPsU2V56i/+XUGJMKxu
 2+x0psUMI8mkzKBe3hoCWnDcZMfkNRm0R+ubDBzETOXhpAYm0RtdTG+aU
 R6yp+5Mqb5ZOz4v1aXwYcuUdjObuO5zfdoADHhLyzwNBoqPDwtFLOX0Qm
 qaUD6whnWSSPScTiGtKpyJZqgaaBooLy0OioOtIjLVnIymsmj4iFUqefN w==;
X-CSE-ConnectionGUID: hfK/+NP5S6i/Dpoq6fapWw==
X-CSE-MsgGUID: CctFw09/RqyvKMObf9X0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60056886"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60056886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:19:35 -0700
X-CSE-ConnectionGUID: dTMdd9EuRFeN+cn4K7zYsg==
X-CSE-MsgGUID: KKyAd/tuS9aQkORsJmOqCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311506"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:19:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:19:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 22:19:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.89) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:19:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCn4xlWvN0cEcMinObibg5Q4TzqI4MlECZvzfpT99yiTdPNIRoM9ELTjKl5Iw2GcDNjHmC5m5BAUFWlYSurT+uZt486zDviNCZT3/svLCu9SccFPWaLV9q6m4mxzTFoFoqMWNwHTOoey5l8juObrQg6DSt9m66bM8QpxS8twmRw91/9DurdfbhSyuSQF8IreFmeQjJbfAKRrx0bYY2/BnmCMkJLujQJlrHP/RKvx5Hz3cxiLkA089M8JtHxUx0XOLWjMOAed0YlSURGqgrdnpf/23jVoTbh67jFifv+F6HWQB4K7sE6u3M6511pQmTDkf4qzaBDMxEydxDhUQUGCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrsPByHNExBnYY2APmURNqjJ+rH4AJHgfQ6uTWJksQY=;
 b=XV3mPFZzmtLohbo688AfS9T1SShe88CcJXDR8dZDHaH5b3u6XsHn8qDCdskfxMjKy2z4cGMWqv4LLHWIMzLn1ltuB9opsUgkF2IhI1to1YFWB3bMKfljrq4kCuMQcWgU5htXYuHRNLPb0aiX0SE3Zv6pNaRJY/+PFcPTO87fPeeu6YuHLJ/IOvN5HmoKMl3f12GvjDZG0BsyhF4rnm9ApDwpqQmsnDipzuvR11aDBySfHYDq69vJB30Fa8Bs67CREsK2Fqu1ryy9BYDpe0cfD8XSw3mjjf+mfu+NCE2e5I6FowmXjb8H9BjcAasBK22SJwCeNvHiu2D2uzX4IBKTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 05:19:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 05:19:26 +0000
Date: Fri, 12 Sep 2025 00:19:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH v9 2/9] mei: late_bind: add late binding component driver
Message-ID: <7l4emr357ugep2brz67d6mxgudxqpgfkf3gyhr5cp6i6uhku42@jhgdf4cujbis>
References: <20250905154953.3974335-1-badal.nilawar@intel.com>
 <20250905154953.3974335-3-badal.nilawar@intel.com>
 <tbflj3r6picnz7pzhiz77gzhrdnmfxlruhtas4rfrvm27dapss@3wqf4dd2lmsx>
 <CY5PR11MB63665FAB1FE8D8CBE17C31CEED0FA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <wuy7xx57puqytyigl2fbosluckauxikgdvcrdvtubbob6olvyl@wlbsiuquprep>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <wuy7xx57puqytyigl2fbosluckauxikgdvcrdvtubbob6olvyl@wlbsiuquprep>
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcc6692-f910-4478-559c-08ddf1bbf105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h6BCjWD6KCbTm7p/OE7u9FvWfiMxmUftks/90D41q4+nnDIipJYclJpq4VE7?=
 =?us-ascii?Q?r8IslWYWNOpeZ+rqjMixHovsyZu6WTgu67tc23J3Voyb2Z3zFUQBK0HHm81/?=
 =?us-ascii?Q?/VRRpYRP6/w+BSmTWsbqEALOY6KX6R35PBmdzRoI1lrZxH3yjdK0tozM2VS+?=
 =?us-ascii?Q?7uBll1yiNUyljJNOJy4VNWxnSweS6a9ntXpJQymU3aguz8UGa+vvVnjW04ZJ?=
 =?us-ascii?Q?X+eRWA5Q76vGhvujACb/UnebUqmYthV22Yuu4iiEDB9zTNlPD5Vi/FDwp9GP?=
 =?us-ascii?Q?961uPIDO/ynO2yDGQ97ckz8ZRv5VrgNPxSFfZfdX3Nf18vNQJrMsK1bpql9w?=
 =?us-ascii?Q?8qbAXy08ovDKPQ/lgHrPShG+F9AxxgUMGBl1/tl+OhWCE3J3CFgsfvDtPsWo?=
 =?us-ascii?Q?9v73dYV97MfbJ4w7MDwrMetVUkOia38JMy+TkLjewigyUXHCqEWxVpwsPLwS?=
 =?us-ascii?Q?6gezmhZbDddC0H3zmCaYmaaxwB4qDlDGrK6H901bED38jmO3Ij6xDX0GAP/J?=
 =?us-ascii?Q?7PVrbqVnjIsBT7mpzUfyQNg1Kual7obxpG5F/T+ncMiNqJZV2Es96t4zh60I?=
 =?us-ascii?Q?PoaV54GhMBoVprZlcu/Zxznat70oi9nQ/pc9lYsEbnh+7UBZpqLtCEwdw+AW?=
 =?us-ascii?Q?q0gxhm8JqrH246ll7oNp6ABAgPDrxixCzB7abD04m9KJCtuU0jpKUNCvJz1T?=
 =?us-ascii?Q?6JthETrkJcIFX+c7O2xVCDIFbTb4GY9V+JorwoUhFJJmLMwfCQVkj3rFPXUu?=
 =?us-ascii?Q?63Bm1+X119myJ+LuG5m+eK9/7SjV5y79wpP3rH1lJ9V1voLelFKnKUaIra+f?=
 =?us-ascii?Q?nP9fDmcEsbn6CWjXMn+S6tCoCLlmQoKCEhRFfzNgPi/NyIlswkb13rg6AMl9?=
 =?us-ascii?Q?ZSLp8UFuJWn2U4OVltlmkI559If62/St+DiveMHixoAMwP+NiXbiLUJidVWn?=
 =?us-ascii?Q?Ndjfsanv4BFqQqxjl4Dm09V9/OlXZzw7IoUXA3+7dRRpqAVoqsT2hqH84Hsh?=
 =?us-ascii?Q?R5CfU/tBkK+IzZRL6j6MGzmFJx0Oa1c0MMLTwqK2ivxsgZV/3Gndkg0Aa9M6?=
 =?us-ascii?Q?pLXJZ4CJv8DPFM2bZ6giBYbJPVlQJeEr5kv0c3bVSFKdKyiY1Q06JrP6aC5H?=
 =?us-ascii?Q?pn8Q88HISw+Wv/UwD1omxe0qclFtxhszVewUWWQf924u+PcPJwUv5TOvv93D?=
 =?us-ascii?Q?Ja2xYOWB6OPiGuKN1kr1Ciz+1D1sZw96carUa4ty/9SRHkaklR19eSisIlt9?=
 =?us-ascii?Q?qvMJ6IlClqZQUhRVd16AiQvETVgAxIPc2DwC6w6JFAAn7b+9/0533/Kz5yNi?=
 =?us-ascii?Q?VYMQbN/Rb1GxG2kP+xsZ8iHYrZMErG23iwo2gg9VMUUk27DmrXJHoqJQel69?=
 =?us-ascii?Q?4n2Jg/im7y1/6eXtUIksbyacYr/+ENxcfQ9Tr6I4pPK+rm5atQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZpYMlVKgNCaKUkJL0QwFfCYKQPPRW0zH8Zp0B8opL/JtLMkYaM4hu0MBbeAg?=
 =?us-ascii?Q?re2BC5Q0o0lsEDs8lqoO99hZrjAAwE8gjh0IkIuznE7zX7f84sOksNfyITsR?=
 =?us-ascii?Q?63TYJtzlP1hMA6WBXyBxBOKrvOgGwoddNMzvfi88CE8r4TdcuBDXG26SuNYG?=
 =?us-ascii?Q?QcQFAD+JRLuHX/TFU4FS8EyIPKy/bDk+U8FNHu5RC0oqVg4EPfydD00/gJwM?=
 =?us-ascii?Q?85q9P7nacUnbtER1FiiOFQw4Kl1lQlJoSyYIVMp0lX6L21fJwolL6OTMSap6?=
 =?us-ascii?Q?9XOGP0GmU879GBD+jhXxPsm064YEnv1m1P9GdaQARHIcGq++KEgHSCUAtSn7?=
 =?us-ascii?Q?RQEdHjquTdw3/98AeHmjVu7Fskc6/WOxRdfK1ONSAEEJ0V9hblJQrH6VtBuP?=
 =?us-ascii?Q?akRR9i+d6FWS+vZG70ytq63KI0q2Z4VZ1Et0+OhdkULshZErzfl70a1l5haI?=
 =?us-ascii?Q?JWwv6nO87wVN9VLNIKRgkL2piFR7XrUNlUMwCr5iyIDu+TeBxYx3TxfurZJv?=
 =?us-ascii?Q?84NbQzj+2EoCNlDQxJYzO2gvsNVCoAMi8ZSZCSPloPiQ1fjCzAT+HB4o54Ia?=
 =?us-ascii?Q?HJs2zEwyxhFCzMkN7Xd8nOZFgNrOqEVTZfylX4r7WcQy2l/No1o7ZOsiej74?=
 =?us-ascii?Q?4+ycBrM6kJiDtEf2lQXPsXj9dXEXMr11jcK3UVNBgBU1qgjpAoyzFlVonaZt?=
 =?us-ascii?Q?m7rySBwUVpwkLYZVpaj2ZOdu3mD6i3jsCLaB9E2Wd7DjkdzeCIuCOq3V9phJ?=
 =?us-ascii?Q?FWIUNDQS7EwKn1+pbeQprjDezf70PPgDqehX0pBCQmkjFR6Z/o+oXTOe5UCT?=
 =?us-ascii?Q?hWqSsRmNYvqbWRzU1mMRWCab4HsXI3rrOkAwqgFPsk752HCpeWYtfyq8o/r3?=
 =?us-ascii?Q?2gmKRkmZNEwr2tIxF2JSQ4r3S71sqVRzwl7udojlPpXuppN7NUOdPzWesXLM?=
 =?us-ascii?Q?5U2FPjFI2PNGNmuKMTs0V7d8h/GVf3pFwstlMvISQhug7jnGU11Z49sfoorJ?=
 =?us-ascii?Q?ieos0qqskL3FY0SlE5PoWe0D7N0a96gCUir3UhINBE18WISN7t7vRFK6bbzz?=
 =?us-ascii?Q?htKx1yXLHUqydicQ9ePMqVNU+0N2Z4hcMg/ufYnNuT+WzRww+1WB2VpM/Zol?=
 =?us-ascii?Q?RJgQEi//SUm/VEfJYvkLfgt2QA8QqBormtyLbAF/w7yJSbHVgOIses/f2KrK?=
 =?us-ascii?Q?buRctz+5uTUO4pMCUEVAmj5hWLUwazLCDPWGzI/z1J68oH+UQEBcP1ltj9fc?=
 =?us-ascii?Q?D6EE+VJYnIauBgF+Yy0AnMkDdwEvvZKGMKJrdB2OaUSDdx4j67vk2rov8Lxg?=
 =?us-ascii?Q?1Q6FstE6Li7So/1/vvDE6rjD/Pb3TEvcNShrk+s6+vsLNWsiSoQysucZjawo?=
 =?us-ascii?Q?ujrVyzvMeqdRAanEN+1XbJ6L4Mz1sUPpzclehyJSBx3qkxSNBIX0GSjdOMQD?=
 =?us-ascii?Q?AIIxFOIt9oTeoErX/YCd+Hh8AzRRtfDNBVxxLmtbgSDizyWS121mZTpsW+H1?=
 =?us-ascii?Q?SnzEx+5qXB2Fxujy2pAX6lwV7DNIsg3P/bKuNbZ7PowORVTLF2p2lhAvX2Ac?=
 =?us-ascii?Q?9biQ6HQamS2uCCLdvuL4XJAgmZwdZ6aEgM1ov1wex6mPREjvjMko0bA179wq?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcc6692-f910-4478-559c-08ddf1bbf105
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:19:26.3179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBll/GmgJ5MteTGgSjhtD5NM5/Y1YeX80+AYjirZ3yacx7mo6A65mrt0wxqQLDjUHQ4ya+nEMAAQXj7MuRaCj/C+LL0U7/RWKxqSZ21N1Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
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

On Tue, Sep 09, 2025 at 09:43:02AM -0500, Lucas De Marchi wrote:
>On Tue, Sep 09, 2025 at 04:50:41AM +0000, Usyskin, Alexander wrote:
>>>>+static int mei_lb_component_match(struct device *dev, int subcomponent,
>>>>+				  void *data)
>>>>+{
>>>>+	/*
>>>>+	 * This function checks if requester is Intel %PCI_CLASS_DISPLAY_VGA
>>>or
>>>>+	 * %PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is
>>>the
>>>>+	 * grand parent of mei_if i.e. late bind MEI device
>>>>+	 */
>>>>+	struct device *base = data;
>>>>+	struct pci_dev *pdev;
>>>>+
>>>>+	if (!dev)
>>>>+		return 0;
>>>>+
>>>>+	if (!dev_is_pci(dev))
>>>>+		return 0;
>>>>+
>>>>+	pdev = to_pci_dev(dev);
>>>>+
>>>>+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
>>>>+		return 0;
>>>>+
>>>>+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
>>>>+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
>>>
>>>this doesn't seem right, we should allow other PCI classes. AFAICS this
>>>check could just be removed and just leave the INTEL_COMPONENT_LB below
>>>to protect for component match
>>>
>>>Lucas De Marchi
>>>
>>
>>The subcomponent is unique only in its own instance of the component framework.
>>Or I'm wrong here?
>>We have to ensure that we have Intel display device, not any other device to
>>subcomponent check to work correctly.
>
>We are matching by child-parent relationship + the component id. So you
>have both the mei device and another pci device that added that specific
>subcomponent and both need to have a common parent. Thinking about
>another device that would match the parent-child relationship:  audio,
>but audio doesn't add that.
>
>what scenario would cause a false match that I'm not seeing?

so, I doesn't seem it would fail any, but it's fine as a sanity check.
This is in fact very similar to mei_pxp_component_match(). If we are
going to remove the display check, it could be done later on top, making
sure not to match what it shouldn't.

So, this looks good to me. I tested this on a Battlemage card
it's correclty loading the firmware:

	xe 0000:03:00.0: [drm:xe_late_bind_init [xe]] Request late binding firmware xe/fan_control_8086_e20b_8086_1100.bin
	xe 0000:03:00.0: [drm] Using fan_control firmware from xe/fan_control_8086_e20b_8086_1100.bin version 203.0.0.0
	...
	mei_lb xe.mei-gscfi.768-e2c2afa2-3817-4d19-9d95-06b16b588a5d: bound 0000:03:00.0 (ops xe_late_bind_component_ops [xe])
	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware
	xe 0000:03:00.0: [drm:xe_late_bind_work [xe]] Load fan_control firmware successful


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Greg, does this look ok to you now for us to merge through drm?

thanks
Lucas De Marchi

>
>Lucas De Marchi
