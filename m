Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D00A96A35
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AF510E589;
	Tue, 22 Apr 2025 12:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4x7NOIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897A10E589;
 Tue, 22 Apr 2025 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745325580; x=1776861580;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f0mBfITJnvoOjbqtEiBNsgv+OJdE2EtOhAmJNpaC1aQ=;
 b=K4x7NOIF5kG7HmThrZc6FVFE+JBK58kHTD0Daw0dhg7MsW6VGB4s1mXl
 0yxl7nF3Ve1dvGTOLTL6w9K9JUBN8P5Ndys5KZ4CknnB1etUb1Ws6dlj7
 j8kFHmQC9aBFVnEXUuazgWveyF85oCE8j+Ah6URN/w810wM0Fn/Ysal0i
 aAWUGu6852wAPBr9mCwSOpV6t7XpLzum8OBxchWVVcJD16uRY6RlwBmYj
 oYQllbjEFaxQRHb4XjWak0evUk/JLH0pCMmcz0MkGjUdXfPtWQQ8qFrMO
 YQ3uxuOKC3D4mMaWHuT0JaLZaeYVHLW/Q9YYSbfV5yUQKoM+oI7tiMe7n g==;
X-CSE-ConnectionGUID: PT/+WpwcQIeTGVobZdtmdQ==
X-CSE-MsgGUID: +oBrwm7UQ2+XOh9897XqgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57863392"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57863392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 05:39:36 -0700
X-CSE-ConnectionGUID: CEZh0V6BRtOYxCjWiR+OYQ==
X-CSE-MsgGUID: JXlIFKCGTi2cOJucckNpcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="169205990"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 05:39:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 05:39:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 05:39:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 05:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntu2ScMY9sw7SCGziB0dpivAA6Znt46vknUk+ihmHS5YEB3PkjVvjhqznyYGOgbuQ43fv/pJv28Zh717wwDFLJ1DJz0O1Y9ZCDjjwMZ+QPzTqhDq7SsQzQkEZJTzb9LUbTvDNIMOPABP9wM3PXkdl7gSf5cen0Ak8jaIY/tYuZFYwJvHPBX/2dG92fqUKW2qbbS48nyi0cCBUT/Q8iHizdUNL7WubxtODKbbKsHWtNwlsx4EJnwwshkFlBnVS8szO/ceGSVLfotO3S6WBClX0YYaRi0nfESX8cWAXWKZb3vndU/MUy2BThETctyWc5B5TZkxBGIZd+BJY1GDFpDMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PakG6H94xsde2krZJgslCzx4pn0OVrXhanaq5CQoj4U=;
 b=sSevIQpg8pHpOH+7rh/eWxj/IXQhkcWLcUVBLx0FCoRtlpmroIsSbBxjWqV2kh92HfqUddqt1uMMUefFiX82rMKyN1mEeYkBGf/D+4vgyRZGPyOgbWaJecPJJc4DVNdELvtzD1ExEKc3Xd+1HWbX4ctBdwKcysSXUdB0tjQ3N+FdOXh4IiqXfpr1bWeM3NpnG2NCYAOww1+GZ77u27bkOfvclj9u5WITYaVUpTsz0PHZELWzKBBVhI5Pnbtlt+6a0wJavy5WGUaD5TG6oeGnfwOmDsIxUO1Hhc7VCTQKNHNQo9D7ASN/pWNlFKVcGj7AWz8TjAqesvhmMJ2iQjqMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 22 Apr
 2025 12:39:32 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 12:39:32 +0000
Date: Tue, 22 Apr 2025 15:39:36 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/i915/display: move min_hblank from dp_mst.c
 to dp.c
Message-ID: <aAeOCMBmomQj5EpE@ideak-desk.fi.intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
 <20250417-hblank-v3-3-d3387df7efce@intel.com>
 <1891a3d0d2fc087bf8c75045d22753acadbd3ec5.camel@intel.com>
 <IA0PR11MB7307139A98F5AC9C27334CA0BABB2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <2c878669c55bc7a2952ecbd0486223907f85854c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c878669c55bc7a2952ecbd0486223907f85854c.camel@intel.com>
X-ClientProxiedBy: DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4e663c-9c80-41ed-f6e1-08dd819abb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?A7vKVxZcFZZ1YdAyPlSOPQIh/Z+6xoEAubHnqzfwhMJeoD8Q46fw7kzSzl?=
 =?iso-8859-1?Q?F+iMsSDNg1CtQ4ETTTaHclorRNzcjm9IpeTosdI2bQ2Ti+aJw7tkQATZuv?=
 =?iso-8859-1?Q?1L0+50qycSzyeLIlFe3QCcuhGEa8zhuo0ei3GkB7hH00/B6/DJ5/Y/eArw?=
 =?iso-8859-1?Q?FtcACvEJtjwaJo6OV3CLCWShSUHQkfcsHEhir7uHD10E1VfgkYg3NyEu7W?=
 =?iso-8859-1?Q?Lmxy1Vqx9q+j3vQ9tE+CY2KVe/z2OPCov9jjU9HHleLW+Dd4RSKTDkCA7E?=
 =?iso-8859-1?Q?0RH6Fy6ufYXq8hetf3VGSDvAFLcK3YoOeqt/ROpIfcr7SPUcx43Cz2FJZY?=
 =?iso-8859-1?Q?Wn4FCwoxFzwYHbgTSLLEgVbuwf1AmeXZjcdpSC7cxf6vIwcQ0NQLRQQtyo?=
 =?iso-8859-1?Q?DiD98ITaljnadMRGGZrgzEgRTOaFAwr6vNxjlR2dVKqKa6genQn2xz6sfw?=
 =?iso-8859-1?Q?wcIchJfEN+o6cd2KlM5WbuCpSbX0Ytxl39yRgK6ylEPjuYR9iIdPmJucUk?=
 =?iso-8859-1?Q?NRS6Ie8swL2JSahVsT0wmCHjsZEdRj64TSVGVapJpJ/K/VIEJbCEO8Jt/8?=
 =?iso-8859-1?Q?l8CvQAO+ZAuni+prMSvsniKS9WdVga7us5iZdGOswCorHjpgVXLN7kENDQ?=
 =?iso-8859-1?Q?z0qILa/0QSA4bPqnd400rNnCI9zpOH//HCdR8FACmIl7lyob0GqU/a15go?=
 =?iso-8859-1?Q?2hO5QxgULxGeY6JcFSxfOOb4DZMTUJZ0+rGI7QnEyBd8adA/GhJs8ken4k?=
 =?iso-8859-1?Q?BZIRzMiinqRGtu/zjw/byLHuCx4/6dDj0mNlOchintm48Nd+j9K/m3fF9A?=
 =?iso-8859-1?Q?XEKKPRaBXvuq58GrmPvx8bXf0OIN1czP3sEt5kYjgQQlLchl4sFG9o9r1X?=
 =?iso-8859-1?Q?m9m3ao7cgmN3AcesrE5v510UpsY9xPVV34cETEcgTSgwOjlvEWtyi7ppwX?=
 =?iso-8859-1?Q?Untee+8Fw8v4poQR8u9Gk/xbA1NOaacO8ylwjPVxz/3Mc2SmlcDohdtqlO?=
 =?iso-8859-1?Q?8rMYOrbXhsIOD5WJpcpiC0xbCl2Kh77xNQQo+1MZHLdrDsyy7zVp7r6YUk?=
 =?iso-8859-1?Q?rMKQtRFT7gIqwzXkgGxE2swGs872cxeeYDfOcM4ajt9s8h8w2ZP5muu4/t?=
 =?iso-8859-1?Q?B5p/lfENGmeV9fPbR8Opb2LW9Erk0iSFYRvVr6o1M2Oq8yMDn4qv+EJpYW?=
 =?iso-8859-1?Q?fFXMWdy+eqUNOshl1F0JXutfSlouRe/Wm/5D9Jzo/9U+a1OEkYZ/4rgdmd?=
 =?iso-8859-1?Q?FPY9vYX7hP2aZOYSwG2iI/nzPegVv5sdAyzD5EKtvZ6ilkCVqFBT6sFHeU?=
 =?iso-8859-1?Q?8vszNNB4NBp0kDFJiXzBF8bdm5vKPeqU/EKG1xGbi7gx+VHvJKFGzCVdvi?=
 =?iso-8859-1?Q?5KAWWx3qNTokhVnojX0HVPpPXfqEN0qFnDUeXBl8FH5z1RMT10u/IehxgD?=
 =?iso-8859-1?Q?HWYdPGZni8BnA+JszrkCNXTESzzDx8GgnAeOA73KsKlcOlxN/Pi9+2AtyW?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5JmsYHJuMUIBh7hTLOlDOAVOzvxAumLi6EiO/KVxrsihXMMVMaKCnFOgia?=
 =?iso-8859-1?Q?gOzyQUXvYIhC7VMa/SzmW5QhNr0fJ4+Z0A3ldHf39eikczqv71AHAJACO0?=
 =?iso-8859-1?Q?tp8Urm/sCczhD6pq9YrzHQAWvIAmRtOdupaVPNbCGlYFgXjfeCdnzdx5DS?=
 =?iso-8859-1?Q?buJdXX1+80P0AKN7nvx72yLRtB2TP5eXX0gQJ5ylJ8YkvKXIXhdb8jxUx5?=
 =?iso-8859-1?Q?aekSs3OKoz5yhrKw4torCpn3PDtGRlCeGKbElL+f0pzMOvILdvJNFys3Mr?=
 =?iso-8859-1?Q?lVuw6fyu+rEWrv8LMWEgVaScrZO1krSIfhs9NJjInPoytyh18SrPJI245P?=
 =?iso-8859-1?Q?y0TPiVvtQEqr2o2LkUawrchKOxu4fsyGNyM7IjyQM+hdlEtuuO3Qbo5+N5?=
 =?iso-8859-1?Q?8uFBNIwlNMeTWDemW9T1Lb2iCItftB25/gVWFBGJoDExPhVCXeqC/4LjXh?=
 =?iso-8859-1?Q?x3Srf+O4j1Ytoj3epgiB/d/UsTNammMal5b9ACETCRFdcupUNRW9Bysvfn?=
 =?iso-8859-1?Q?qcM6XWON3JdCfRRw5QUgSCYpsAZL7WwqLGGBeMzGOx6ySjRX3ytfDFjjLH?=
 =?iso-8859-1?Q?TEhPm6pm3vme1K0ZwgtwzyRxic5eTjWNGAay+fjajnpm5lgG3Cgwqp2o6H?=
 =?iso-8859-1?Q?uwmygEyaqcQ8dqUg+ygAE5h2gO1XIr5U7arllds17SXRHZh17H4NmI6AIw?=
 =?iso-8859-1?Q?KbuufAirxK27GJCWFqCem4DuUF4+ccSMcoeDMxke2pcHZgvnIC1z/h2bdE?=
 =?iso-8859-1?Q?WSSFcX24CF0Ge8yKTUO2/ConVu8L1BnXNhMAaQnpjkokVrDE5vF4+QFVr4?=
 =?iso-8859-1?Q?YYz3nqbBoGg/xtI+zSx6MDfYn3+Beo3SLU0oQenBGV8cpJFclG6eTG/9CH?=
 =?iso-8859-1?Q?RlkY3Va2sFAgNpPfhNsEVOIs6Aochn+YPKxHvsPmClZa0rjDnsrs1canke?=
 =?iso-8859-1?Q?cq4rIyls9RpV5itOrqXA9uyzEA1YIlbAM81UXQ5sHcGxaNTddpWHm3CabQ?=
 =?iso-8859-1?Q?hLdWqQMGnk6QNZhZxJnS2N50jp0lH+GNTJNGntOiH069IoToRyltDYNZMP?=
 =?iso-8859-1?Q?RbiC2v57DqbygKhZRckJiRPZSkiPpScpZjInizjzdJqTQ6RF629LEDPMez?=
 =?iso-8859-1?Q?PrQ73AOTtBw2krlGX8FQkq41ACQKrorvQFN2w2I2XtiMtkfMxKdmH989SU?=
 =?iso-8859-1?Q?pekQzCnC++GnoG184BDMqL42P8Ud7bUtpNLs2XSoGPq9e01XZIVRc5rsSk?=
 =?iso-8859-1?Q?QGgzykECr2LWXKGWD8RM8lqifO+LGovlyYWplASuXMKzmyLy1Mn9IdrTGH?=
 =?iso-8859-1?Q?+Aj4536Sr9zVy8zKnYSOVv4g+rURAplLfIeBjY8+uPiPpQJ0TY9AzW4ADq?=
 =?iso-8859-1?Q?JmueGznxLfNkiC/V4p+ls2qoVIfLfW+IHyqURelOvHC++H8UawNJB8KBS7?=
 =?iso-8859-1?Q?PP44DAFDwdx1Jvyqm6RAZPd59kZk7Gwh1wrqUFlY5uqpvkZFM4EEZl7w0K?=
 =?iso-8859-1?Q?89WYHJUZYeG5z0PkXc2b3c+IwVayFZkaVNTiauJQ4OOKwItR5t3/yBeRfg?=
 =?iso-8859-1?Q?S7mjT7rW1MP9WYW4QBAZyxuQGGnmYAeUJTJSUOdxE2nLsTtYRy2StdWtGG?=
 =?iso-8859-1?Q?W1BLG9fhr9BsyXAAT2gBjf03SrtIJFuWh9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4e663c-9c80-41ed-f6e1-08dd819abb56
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 12:39:32.6825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRQ6+pfFL1nxOeHQawZu+Wgi8gy7fISuQPHtJHO16IgoEPj/mNAVl6kRcOOiUHssnM8UgJZmdvyVNkIJV2L9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

On Tue, Apr 22, 2025 at 10:25:48AM +0300, Govindapillai, Vinod wrote:
> [...]
>
> > > +3263,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
> > > >  				       &pipe_config->dp_m_n);
> > > >  	}
> > > > 
> > > > +	intel_dp_compute_min_hblank(link_bpp_x16, pipe_config, conn_state,
> > > > +				    pipe_config->dsc.compression_enable);
> > > > +
> > > >  	/* FIXME: abstract this better */
> > > >  	if (pipe_config->splitter.enable)
> > > >  		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
>
> [...]
>
> > > @@ -301,12 +281,11 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
> > > >  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
> > > >  							     false, dsc_slice_count, link_bpp_x16);
> > > > 
> > > > -		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
> > > > -
> > > >  		intel_dp_mst_compute_m_n(crtc_state,
> > > >  					 local_bw_overhead,
> > > >  					 link_bpp_x16,
> > > >  					 &crtc_state->dp_m_n);
> > > > +		intel_dp_compute_min_hblank(link_bpp_x16, crtc_state, conn_state, dsc);
> > > 
> > > Also I wanted to check if this is the right place to call
> > > intel_dp_compute_min_hblank()? Can't this be called once we settle a link_bpp.
> > > May be from mst_stream_compute_config() before calling
> > > intel_dp_audio_compute_config(). @Imre pls comment.

Yes, it would be better not to recompute the min_hblank value for each bpp.
So just moving intel_dp_compute_min_hblank() before
intel_vrr_compute_config() in mst_stream_compute_config(), similarly how
this is done for the SST case above in intel_dp_compute_config().

> > Here the calculation is done as part of the m and n calculation and
> > this function is called from mst_stream_compute_config and is done
> > before dp_audio_compute_config().  Let me know if any change
> > required will do.

> Why do we need to do this at this point where we iterate through for
> each bpp_x16 "for (bpp_x16 = max_bpp_x16; bpp_x16 >= min_bpp_x16;
> bpp_x16 -= bpp_step_x16) {" as it doesn't influence any decision on in
> this loop! 
> 
> BR
> Vinod
