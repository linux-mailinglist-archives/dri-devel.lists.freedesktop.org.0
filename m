Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6CB40A53
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6257210E7E0;
	Tue,  2 Sep 2025 16:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfcKUraQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97D410E7DB;
 Tue,  2 Sep 2025 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756829657; x=1788365657;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xXWjL8J3O1H/+HR63ZNzzETGIAZ/I2IhjndPzGV7u0o=;
 b=bfcKUraQ8YtsSnik+zwNV/3y4xPdM7l6L8gymv/irUBf/YDS9TG1FIni
 lAnHsCGkspgnuYZL713lc8I7x+n8DGw32CyhZP/R1E9e+Iy7M0QLt9F6Z
 mMOde/6z5kxx3FO7n86sRFFZTLXuaiYPJt3OLq96ZMH1dDWsNwAavMab+
 M1Arjxz4h/AX4vvzQUXykbyK6yMQuudasKAaO1DHN5aFdg+43+il9G14t
 9dxHsn+f2hlaRxTcOn5aDsmWZliCLq6u2Ob6M/XJG5n40tbCOnpRCGkNk
 jG/zpdY5f2OglqzEoD4EZ1LH9ys42pqybfC/1JZIo0TH8VEpbBw975YFp w==;
X-CSE-ConnectionGUID: JcCZa3UrRkueCpFS1/7hhA==
X-CSE-MsgGUID: fmNzsRZSTzqjwjMhsk8alw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59180698"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59180698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:14:16 -0700
X-CSE-ConnectionGUID: 34YJOdMhSFenjXbogrO47A==
X-CSE-MsgGUID: EmicBiy5TROJC3W0yCGzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170884923"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 09:14:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:14:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 09:14:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 09:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4UWqxb/8Im7xSZEOEwKbV2X2lQlpRkdn+LvO8bl56U0wRLg+D3EFN2xqVPzffOknIR9QPKvTUQwd5CyP7McKZDkjdzb/gwF7jKWIW6GghfK6j3cuuu9ghc/szBly3pdRnkZoK7Rfutr/HQMjpdKxriKafgsrsTfgVloUmgFjAm1g/pbOUFUAhV0TlYvo3KDQYkfBZCMlmfBvNCZiQ4Btns+FgMn4EKzpaJNI2o4cyxDBi2xV1aXX0Yr0AE6z51eazGuybnEqMjkfmb/5BqFs6EjnKROaMy/p3OQ8PrNiwLFzOgtJ6OJixjl8o76J/D2sGZNzw4yzOO/jLaj5nGXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDfUiqz7EBOtxxczadWVEWIiNqMBdT9Pfc8PPdhD4nU=;
 b=IXMn8GWqeK3oZJ2x/yXJ//hwk/8H+RqDEpXtY+5gMMo1p8oB2+hOmLHkmriQKmzj2zevMMc0W/bPmxYdCsd9slueBRLIpl9wr0k4P1/UFpDvYXKxnxjZE0b3VPFCleCJSFv3BeFS2YZE2AHS6pfPtgElo8ybx1ygCk7Ho+RhOeKQ0+zTE39uelIjdfonTBvYt4oPq6IrAMF+SGAG3g4hfkhqIteEFjr1hR71AaCJwppZYO5z5MlsIvpM0+esGuVa07nfR74FbxZToa6Ccq0XrG4+wtz/FVnGvfxjROHjgRfIvJbmLn0o44dfFQ/+CVmARDD59Xz9fNSyJgIa6WNT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 16:13:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 16:13:51 +0000
Date: Tue, 2 Sep 2025 19:13:45 +0300
From: Imre Deak <imre.deak@intel.com>
To: Wolfgang Frisch <wfrisch@suse.de>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address
 from DPCD_REV to LANE0_1_STATUS"
Message-ID: <aLcXufMj5C9FPqmC@ideak-desk>
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
 <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de>
Content-Type: multipart/mixed; boundary="g4ufQ+StdLI5uzz8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de>
X-ClientProxiedBy: DUZPR01CA0325.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::22) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de8ab3b-3d72-4edb-6faf-08ddea3bb491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|4053099003; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BRTudJNyZIaM5z8wpGu/fCDkzHFw67jqYtDTCPfGG+I1TGomqzFNhsgAd5?=
 =?iso-8859-1?Q?j06Zq5CssJOZcoFb/GbIC1g5wYnqbASNhuziunlKkZGOVrsz1aA0rcQ1Bd?=
 =?iso-8859-1?Q?jEPMYy8ssJjSY4M7j5JdBIOptFxdI0JP6lcmQw1vZhO6CjyQ06Hw9c3eDI?=
 =?iso-8859-1?Q?j/37j8NPzuFw5EVD+eChaKLk7iyud/lJUdN2wq7IJoba6wLwFESme7SlUM?=
 =?iso-8859-1?Q?QlBwePQ3FU2yAI7CD02nxD/Ed9i6GnUXYDnjOFZd8WGkKfhMJy7FDhogNv?=
 =?iso-8859-1?Q?P4os9ff2ZnEzqKplsiCVRvWEPDaMew8AFzQBqKWISXvCFR29vjWjWfh1M/?=
 =?iso-8859-1?Q?FdI1g5/EZGJ/S1p/NOShsPtIVvE9KGj/d9638RDUD8aoRj6977Sz8IOdKC?=
 =?iso-8859-1?Q?AGsEYqLti+peI6NdJ8zaNRtp8Dk6oAF1zZGnZRAwhvvifJU5RnORmFz3wx?=
 =?iso-8859-1?Q?AYPMEJLx2QOKDVSjzcMtMtMvZOTV7D0Waq5ecU4FXLNti5vfAw9EkS/F9y?=
 =?iso-8859-1?Q?BsXO7tXVSvJiHq1c4BmG1RDHjeKy5tdXVw11+0/5Hrq/c0K+hMSXuJ7dzm?=
 =?iso-8859-1?Q?4b0DkRMp6bl76moNwsrxs43wLNIqKy4xcb+h0WjU2UIIE/Ov13k1v3fuFL?=
 =?iso-8859-1?Q?6IcjWV90wnwuVDQIJchgKTNBsYKUvpRws4ZlrzIX04jVcsAYDGaNfuPvVj?=
 =?iso-8859-1?Q?8ex38DOXIqqaxfqRWLPt78OyxInImx6WqPBRBm5hGfxTpzBSzpSqO7YgxX?=
 =?iso-8859-1?Q?VnmcpzHABoJZq5g6q54vB4m4v4UBRtvkuPNyhE9khQMwqBk3zelLBWhVIb?=
 =?iso-8859-1?Q?52BR4BkSyQSKHU8ftqE19cwHx5ThI6f15KACXWtxSNiX7/TOfZAC7zry/3?=
 =?iso-8859-1?Q?PSLrJFjync8Btsfxrf7cUhK7ICohV3+xGMzE4b/ovegH85u1l95cdmBPJ0?=
 =?iso-8859-1?Q?HmcgO0pmKZZhG5b2bMhKwfQ944VqT5ZONdYhDJgj35PeJ52aKGfSxwgGAP?=
 =?iso-8859-1?Q?WMXdxUFAzKbybvWpO1OcvdK0+/oAhlIcPGlqgf+Uv0cSYEzTHZbtflapua?=
 =?iso-8859-1?Q?PAZASgw/xzlhBrnixDxpqgFMfNczMyjoFqvLe6O/XikF8DzdadRj70kXBc?=
 =?iso-8859-1?Q?fZnZKkgrAjUq99spXG+l5bYaNulIbCrBp+S2lzLMQ54vz1aQrbXchAuAeu?=
 =?iso-8859-1?Q?IFIqeVzy540Xnsa+KOW6Nwt+5DnmNLQ8d/pJneBPd/wrDffPc+v11ASDST?=
 =?iso-8859-1?Q?Rb4YvRrjdaTofyToXL20yh+bC5hwKL/fAaIEvTGAuqzgC4QJLyUSBB81tW?=
 =?iso-8859-1?Q?cO1AwGD0SqYN1563uOrNaDyqBsiEQfUhunt8GuzgemWJMkdGmqpiZdNTMZ?=
 =?iso-8859-1?Q?+U7850n26ODdLOyuvSic5fZqlXmZOBacnll+StsKslgbu73Qu8p9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(4053099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ax49qUtl2VOvELUTD3jFBWuLpPkyDEEXZbPVPgieleVjPRmrfiB2Wh3p/7?=
 =?iso-8859-1?Q?sZ5VQFxEjmoZ5PkeRHJ2d074MAj/ji35r6wdkHa+aKyc3jBCgLs7QWeEVp?=
 =?iso-8859-1?Q?L/EED4QVOPp86Lzr6ULxjZ7hmBbomLxLJJGzLQC+CDPNQ2KkL1YwqJ/N3P?=
 =?iso-8859-1?Q?XuolTDGDsjJzvTs6UPPxQPo0klQPsvujy0g2wxZ1VGfBzGaaqhko+NPpGG?=
 =?iso-8859-1?Q?u3Hs0MXQ5wTPwpsO4RSb8iQCyp9gO3YIspEleyKY+hKoEULfieBzpAKDAN?=
 =?iso-8859-1?Q?cIxaVhxrmVunuuZB95hA89fQZRr4VQ2nWY8Q5hmiUuyUP3I8yitvk9xCMW?=
 =?iso-8859-1?Q?+MKuBJzA3nNo+zX5Vu0uz6CRR3KcCCq7eUX6ccf0kSOd00iP6M8BHfQtw9?=
 =?iso-8859-1?Q?Mm39OEv5KjFMLeyF4w2MQbs0ApbmnTzvDPJaoUSoAwIHPbobrY9WO1XTlS?=
 =?iso-8859-1?Q?tcZ+e+J2VpeGP7RsXZY6l2QhBcFhM2ui0vY6oiC0o7cYYwJYpE6CPnMIPW?=
 =?iso-8859-1?Q?WWfQJhAYBs5VZoson1I2PcwrQYAj1gWBXyqqbNR1n5Ezi+pElm5WC1AzhO?=
 =?iso-8859-1?Q?Y9JPLfKxQl04h9F5C9t/6mkxuvLaS0EtlOQPIdoNOj1yDFGasVBaZLZ/wu?=
 =?iso-8859-1?Q?GqLPq3yzoTRH88o8IjtIZoBkwerm/74VswXjhbuzXCd96F503WOyzpUcB4?=
 =?iso-8859-1?Q?1cVtI/Pfcneqs3Jk3GKPOGMR+ndENOmNs1ud6bseBLy8Ms0w/MTVD4gI4j?=
 =?iso-8859-1?Q?TTmxvrBqEDoEmrM8zqxHQTvnlEYcbLif4YejBWddUIxyEaburFjptnl3/P?=
 =?iso-8859-1?Q?hLouRVBApQdCsbNrslKHLEFGScaWqpiSJmRgD767NZKwRr+fCjSNDVRKOc?=
 =?iso-8859-1?Q?Kq+XtLC7zRDaa7vGj0yR8ehLpknKofTyavbHOPpssz1GXVBmEflNMGYhJz?=
 =?iso-8859-1?Q?wQ9Wi7fzsPK5WmsvOyHRexngt8BIXyP6Ya8AMZnYISXqdAdXh+SZNEPTDb?=
 =?iso-8859-1?Q?tFJVneLVBdCWfQv+TvWrrJ6jcdPd3SLpdNwOjzzCm5PmNMODZB9IazPfof?=
 =?iso-8859-1?Q?7ETYp8SovjO+RqGOxS8Rw0JC17lVocmDDAp4+nCLCwxuiNlPvRpAjieAn3?=
 =?iso-8859-1?Q?frwWw5AYMOvsx++oKRg8X2a33fF6EfdaT3RrPmcuN+uRSmHZ6cr7b2/j3E?=
 =?iso-8859-1?Q?ImXcVGbO/kXeV6J1FIRL6M5gtcALL9wfjSUnOYYSgTguZPLjffutsbBeUj?=
 =?iso-8859-1?Q?hIwnDTfaIguEEDZSY3OUsYAdygfIBtM8FSvRBJ1XiilZ2br7oOSHnea+OV?=
 =?iso-8859-1?Q?IB9qUpg8j3BzB9zSW/kAmDiK8B1gjtB7XMZlDETBYwTd8ENhzszzcnIlJq?=
 =?iso-8859-1?Q?6qX1l9/csgsCmgGkRroe5KYHGq9JrXGAbn+Ea1AogBqtjWzjePl86mkJJP?=
 =?iso-8859-1?Q?PIfr5FD57J6mpKWCWOlBq6INmd1q0lLkGf7jVE5c5mL+BmIp+waOgANRRa?=
 =?iso-8859-1?Q?Eu6L+9YJM+Wif5fGmh1O9fCY3ulBHs/88MCG6KRx2uGjXe8JRQ+1DAk2B3?=
 =?iso-8859-1?Q?Zq8b9iieJHO+cVywu9YoRh8+qvLQMcmtdXQojtV+gXQPGnfAuEXq67KRbV?=
 =?iso-8859-1?Q?k5D5XHSgrctxywEDE9qAdMZCFqXTOi31va6TBzU2zs3DMzftngZCHRg+Zc?=
 =?iso-8859-1?Q?Zh3IiVYCB5z7dPbdtkzbp11I1AzTzc3SDbhtMh4y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de8ab3b-3d72-4edb-6faf-08ddea3bb491
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 16:13:51.3523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hy9vqc1PqsE25pEk54gWQYuRJpv5a9J7QYOtqdhowaj0zxbAXL3ImOHjXIBsT44gSv2D6tMDVoAvJdGLWqYLyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

--g4ufQ+StdLI5uzz8
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Wolfgang,

On Tue, Sep 02, 2025 at 04:32:10PM +0200, Wolfgang Frisch wrote:
> Hi,
> 
> On 8/28/25 7:49 PM, Imre Deak wrote:
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> > +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
> The original commit d34d6feaf4a76833effcec0b148b65946b04cde8 broke my setup,
> with a monitor connected via Thunderbolt. Linux 6.16.4 temporarily fixed the
> issue by reverting to DP_LANE0_1_STATUS. My monitor is a Samsung C34J79x
> connected via Thunderbolt 3.
> 
> To be clear:
> - working: DP_LANE0_1_STATUS
> - not working: DP_TRAINING_PATTERN_SET

This looks like the issue tracked at
https://gitlab.freedesktop.org/drm/amd/-/issues/4500

The correct solution there is to disable the DPCD probing, which AMD
folks are working on atm. Until that, could you give a go to patch [1]
on the above ticket equivalent to this solution, applying on v6.17, or
the attached patch achieving the same on v6.16.4?

Also it would help if you could add a dmesg log on the ticket taken
after booting with drm.debug=0x100 and reproducing the problem (vs. two
other drm.debug=0x100 logs, one with the above DP_TRAINING_PATTERN_SET
-> DP_LANE0_1_STATUS change and another one with DPCD probing disabled
as I requested above, taken after booting up and connecting the
dock/monitor).

Thanks,
Imre

[1] https://gitlab.freedesktop.org/-/project/4522/uploads/8b39006b61fe67674d9b41fd92224c32/0001-drm-dp-Disable-DPCD-probing.patch

> With the latter I get:
> > +thunderbolt 0000:c5:00.6: 2: timeout reading config space 2 from 0x20
> > +thunderbolt 0000:c5:00.6: 2: timeout reading config space 2 from 0x5
> > +thunderbolt 0000:c5:00.6: 2: cannot find TB_VSE_CAP_PLUG_EVENTS aborting
> >  thunderbolt 1-2: new device found, vendor=0x175 device=0x20ab
> >  thunderbolt 1-2: SAMSUNG ELECTRONICS CO.,LTD C34J79x
> >  thunderbolt 1-0:2.1: new retimer found, vendor=0x1da0 device=0x8830
> > +thunderbolt 0000:c5:00.6: 0:6 <-> 2:10 (DP): not active, tearing down
> > +thunderbolt 0000:c5:00.6: 0:7 <-> 2:10 (DP): not active, tearing down
> 
> Best regards
> 
> -- 
> Wolfgang Frisch <wolfgang.frisch@suse.com>
> Security Engineer
> OpenPGP fingerprint: A2E6 B7D4 53E9 544F BC13  D26B D9B3 56BD 4D4A 2D15
> SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nürnberg
> 




--g4ufQ+StdLI5uzz8
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment;
	filename="drm-dp-Disable-DPCD-probing-v6.16.patch"

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dc622c78db9d..ec53c545776f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -724,7 +724,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	if (!aux->is_remote) {
+	if (0 && !aux->is_remote) {
 		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;

--g4ufQ+StdLI5uzz8--
