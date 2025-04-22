Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B2A96695
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3410E557;
	Tue, 22 Apr 2025 10:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNa2CsCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CD810E1A7;
 Tue, 22 Apr 2025 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745319323; x=1776855323;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rwLK0flfZoBR4+CVL16rUBqL7n1zk0fjlO0RNkRcey0=;
 b=LNa2CsCESv2hfDF+fGgjLE+8q7xNLoYYpEQimRrlazTIaMsnODDPn1o9
 rCUgGBWBwELl46KEcrWOXEqcbrhL9Y2eRK41anspGLgb0UgJWLepXzwNw
 yAk5WVqAapUubi56NGZ5JNOx1s+VgrZYsz20zZqQaKCwaFlu0SdvhcJcf
 FITwmCeTmlvKWUmziYQJETbz6pzyt4sIuHb/EtMECG0yOc+vvejZ8SvpY
 mnzWw8+CNx5pAf3gCm/1X8koPH2cmwwAHWB7yShkcXZ77hs2vIK96H6LP
 TeHcYZcuQRS3HNKxByjRRxo7C82265UWhGLve0rPwfpcjMKQ/4BGs5rSE Q==;
X-CSE-ConnectionGUID: LYiHkQ6ZQXq3IxXgC5oZyg==
X-CSE-MsgGUID: vZvPm9BjRjC/o/kxIZa3mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57060350"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57060350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:54:21 -0700
X-CSE-ConnectionGUID: V4WJdiKQT8ajioY63vLIEQ==
X-CSE-MsgGUID: GoJvUUr8TXKZgxFR9r4xSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="136851935"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:54:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 03:54:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 03:54:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 03:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9ynMxP6H3NTNY+XiZdxMB0iwPwksB2zA/Id0RIVvh5sz+AzxRaUbccw2Hwyi2/4VuW0jypjlLB+jz5ZBXydpaheQXRcMojeUxZkzhs7jWr2f/zC8r7XEv3x5xA3myqfpKmdm7WnTjIejboI2pxueMiwFDbCfrugdyEZ2z8MUsQiVjkcMSh8vIdUMuVfJz3Du46f1hB4fS+IGEOGea6Fsi7oF9JyTS0QFa2aX7qGXerwDA81t6SY+n4bXXVJm54GDH1JOcWz9CrWYU182dOIDLhJqPscvU6LVhTwT1surDAbOZPe5qWEj/O5xKjgaLy5jOqj3eE1NRC0eSsdcbMysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSBxSP0S3gRNzIKq4Z7F/TMTjNWCpI2BX7BHssnQRIM=;
 b=P2iDPvee6ax7IO43ZY7JplAr68GoapEGXfmBCacX4HdxRs4jFgudscs4DY6pOTEYGb9KADoWqFjPVshv8xOuEyTJ1wga1aOjzCWFbZuJVt+Aqozk/YJCPAe3Sw+QUJmgCKiYzPtlmfaaajNkYqsklFBfZ1aWz7gR24NPkJXHMyQziwBpeCw6PvXTpx7Ey3942ecX8+bFdw/iY/gAQP+PCjbCryYy9Zfo3fZsI7og4sMzedcjyNtiPJcSPAWxboozEY510iEYN6YU+g1vS5P1Z4S3Dyc8RIZMxn2Qspk8HVvN4m9ZO1Q/msh4aCv36bpJ8waeTy6LlMUnuK83X9rgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6186.namprd11.prod.outlook.com (2603:10b6:930:26::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 10:54:03 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:54:03 +0000
Date: Tue, 22 Apr 2025 13:54:06 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link
 symbol cycles
Message-ID: <aAd1Tm1T2_kDeKtz@ideak-desk.fi.intel.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
 <20250417-hblank-v3-1-d3387df7efce@intel.com>
 <SN7PR11MB675003796B6C9B181A696175E3BB2@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN7PR11MB675003796B6C9B181A696175E3BB2@SN7PR11MB6750.namprd11.prod.outlook.com>
X-ClientProxiedBy: DUZP191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::24) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: c93c3e4c-b6da-4c05-5e89-08dd818bfe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fQYj+x1VsW01T+XyMeYj/iYdKhwl9HzCYJxts2RwAXXIdzmMgMn706DLe6?=
 =?iso-8859-1?Q?unHINaOEuPaLvUrxDRdlF1pwDZty/g8A5C4shvCGjrfimxqAon6A5pa5+U?=
 =?iso-8859-1?Q?RGl0Sne71d5vAYo8wx3LPrRTcUMbIZLGfCUCJqxw3iE4vqNZjsuMmj9dGO?=
 =?iso-8859-1?Q?uBb/yDf2Mk7CtnCMOZpkK/mEESXJARTWjoxOR4gikFV1fL/I00++OAT3R6?=
 =?iso-8859-1?Q?nRFWqOvCiMgvkFdZ9NH038XpcsxpvDstnsCqlyNIvv+GO0HJTsiBRUx05h?=
 =?iso-8859-1?Q?2aqwEl31kQ1txIhLjgv29tkF3nr6giQejYOSorsgrSZDOvZ8SLogSTKW2Y?=
 =?iso-8859-1?Q?sOOL08kSDqkgVBVepPN0+GJRTEooT2C6fIPSDB/9ADTZk9OZ3/dEkKrUAr?=
 =?iso-8859-1?Q?vVv4bv4qfH6Oe6Azku6AbHsXA13qy2cGNGEtTJlN+dJ++6BykbBck0SHsZ?=
 =?iso-8859-1?Q?P3zFhdEhOnOIoqPk6do/vosBiK30XD6Gxl1hDVW7Burh0ld4Ikb/voYBgw?=
 =?iso-8859-1?Q?LP6oDq0PjdSNX8kZwiOi6QfS3P33PHoDOaazE8VntVlRj4VfPIEZSndf/2?=
 =?iso-8859-1?Q?0ztpJChPtZEiXCLU94ZIS0FVtOcn1afoUx3dRuBDiAjYGL65y96iW4phGd?=
 =?iso-8859-1?Q?P4CXhD/LecmdtJD0o//aplJMyj9DL7HqlPhusQkE32jGz2bNZozxPhJv6x?=
 =?iso-8859-1?Q?Fp6VgjZ173mCHT5XdhcdQjZk59jTL0aaO4jhDIGw/hKmpjZjXarSqC/IOa?=
 =?iso-8859-1?Q?0hJeM84Kgi4ZkzImL7HhXQqjCvZeVeI9opRpuA6vIqktywQhLUBmYSiDm1?=
 =?iso-8859-1?Q?zlPevmoyvc6mvGSRvE+RyhaCvOMReYLfP6p/4QS+8bbw/JYsmOaPqmer+b?=
 =?iso-8859-1?Q?sKpV4WQftO6KIvAveNeVbn3YB/KQCILqljVR5Zv021v+UMYXkUHAQG0FkP?=
 =?iso-8859-1?Q?Ghcoh7x/KH6NJUFcSeK+MKaUnHy1B9qtJAiRtXqxv2aG9jvVaw7dqZ0jPo?=
 =?iso-8859-1?Q?qC4bIgFk16tuZ+OFzoXDnimkJigbrLuWu15Mo+EbfYRvxDgPpesIApJ84I?=
 =?iso-8859-1?Q?lMHF41TSRoNd4DfzEWIpwiSDsRsQM7tEdLU9QFfmcwtN4hBYMYkqvcWltZ?=
 =?iso-8859-1?Q?yAJJSCvVAu7hFJpHS6QGCpqrueAT6jnhVfUNaadDKda3FYASsjJvVkYqSZ?=
 =?iso-8859-1?Q?dQfQPkE/F+yDo78opAnEw545zCbeGA610zmuvnNFYdsyA20xv1CwJgRNbB?=
 =?iso-8859-1?Q?HPe41VUwiGsirWFljuQ0fpheemYQsaPXsKvKkmQljjENhqHOprwZ7KLib2?=
 =?iso-8859-1?Q?3ZOJoL+h6quAFUJeblA9/h+P8ImLAAKDkcaoUiVHV0FzxvMdeaEIOfVXSB?=
 =?iso-8859-1?Q?OMyb+DI6RtoiCio68NdUg7ES3ksBl9eNhmem84YA/ygb5zh9NoNW/1QpCT?=
 =?iso-8859-1?Q?iaSb4PPmIP1E4cV+CgvmwM6ECqAiQIiMe9xfjQnct7ik1CtL+h08qu9IXU?=
 =?iso-8859-1?Q?KCzGDGzCQtVv797BNM307q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZmNyAE+ZAnp7pwd6jrjDUzlxgKZRiCGFmcFMj7dKfZXccUUdZmzTMTgtIR?=
 =?iso-8859-1?Q?a59bjaTeZ53I+43RwhnADiskTIOZhhzowJTX4wvIcTzsyGxN0UShmZpcWF?=
 =?iso-8859-1?Q?mHdRE4Bo0RvT6q3Q30qhNVX5+v2/LUH4Wxz3Ox+dBWk5rA87MybZngi6BH?=
 =?iso-8859-1?Q?gL/CddWKmktAsz3Utz9XHOj6v5zDSLoPBwvX3PgnkyxRWzyFbaPIbc3LBa?=
 =?iso-8859-1?Q?fkclG0IZxjxIe3iiGI0fuYXyiU0DWbxqsZ9Tli52498xoMVhlm9MwA2aPL?=
 =?iso-8859-1?Q?7wvQ8bGe1YbN7LJCi2sT4hJcAjkjP9FIlTyj+rlvB1js9Z1u6OjLBhTvT0?=
 =?iso-8859-1?Q?rtoDO8dXVcUWObCzHBHiWGRdlqW5QhFpdrWxgUa/C2Pccl5cfvrHPnm8Gf?=
 =?iso-8859-1?Q?W08jrmSoRlTFcuQ3aTHKiv/TcFuwgiGejNFluIEbXCtc2/UASzB7Vx1CjE?=
 =?iso-8859-1?Q?x1knwzny8NmKa9zq4HPPVCZU+UILOQUvbpEXG4mPbdeR4fzrkaWo6vaiSh?=
 =?iso-8859-1?Q?5U/ts2KlXyVJEI+pydEJLp27AoDP3Mb1Q13PccgciYF2IIPeq9hoa1PZGS?=
 =?iso-8859-1?Q?VwadNZVk6OqsDtAMurRXw6ANrf4YLh98+oZI1KsH0eSTDkvMc7xz/aiQ5s?=
 =?iso-8859-1?Q?LVcXkBZEfaqopC8P27USmfgTN+kC+a3Rr3Gcl4qbXD2GDVkGrlFfL5fSFu?=
 =?iso-8859-1?Q?NBdY1KJQdYzW02meBV8xltBREbcRWdRml1KbBn4KxK/ksxyipFALcUNM6M?=
 =?iso-8859-1?Q?UGWrAeR6+0tKzwsOkW6bMxXdtWeOs8tIh/A6CAA7jQIC0SUcHkPBgpxyzD?=
 =?iso-8859-1?Q?uEwPCOuxh83IoGM47pQ3w4RX3lJzeH5g9QaHeDLRMEVE8yFeX+24rw8Pgf?=
 =?iso-8859-1?Q?rG3x2t0FNGsRTbzXelJBfGn7tqEvGmMJWGnUvkNeVSJrh3bO3r4sx+4lLY?=
 =?iso-8859-1?Q?IMGTFDfhgCNH9cKqtO9sjzucLpc96p2Qjmp2qlSXBPRXvKHsgXE9yZST4X?=
 =?iso-8859-1?Q?S7gzObCPaLSwU3c+Y8Kfz6en5u4X07J/oAqgJPopLbMrdVHtuJ0ceT9bIV?=
 =?iso-8859-1?Q?WHI1fGrcxUlr19eVke44iLQEFHy2xeyGJAJUIbbeJXZWnfozugbZy1Vs5o?=
 =?iso-8859-1?Q?YT5jYHq8I8zHkFAa6LfpqIzGIHNq+f33MaFXpwff7Z26viIvy6/3oVYNyw?=
 =?iso-8859-1?Q?2R7BL6fDF0IRY4AeYxQLUHyjikTj4js0dtmhDDxfqbLGMUo556/X4dAdeF?=
 =?iso-8859-1?Q?kmvCmMmCAGzvq7Lv5jZUNz8CKfMEF6LYjAsK/Ns1/ocqMFZB4dLZIGiIb8?=
 =?iso-8859-1?Q?lMNKNbggM2TcIXldOqDiX0wM6CNpYmHal06JJMzqR6UINj8kzCyEJ7ptMG?=
 =?iso-8859-1?Q?Ij3U1PZRG0IFmvHBuUdWr/bjr8EKjhYb5vfh7OD8DSSy9qkFpGto+MbnHx?=
 =?iso-8859-1?Q?4vAi3uWZioLk/iR4LREvCcy9Qun0a+QIGgCMVoQVxlzlv12L2GN4RkMADk?=
 =?iso-8859-1?Q?Dlm4cyMR8vF6pIE/E16UfAPWLxlvAfqdonx+2d8EE3ThPo0gvdL2GT4Y+1?=
 =?iso-8859-1?Q?QNULw+SNEDumoOvwr5HK4g8p2liyn6Spfin0dHyQa47EhNp7PL6i9kJx0w?=
 =?iso-8859-1?Q?UB97vQcqQtzcyIS6q+KvazrhUJL/batL4S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c93c3e4c-b6da-4c05-5e89-08dd818bfe70
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:54:03.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7Kj9p7UVe8LiW2p1vPdfHrYARv7XmbdKNVb0RgkwqfrrDkVF7KNiH+JWaMM/bnPysOF1UtONKLo5t/b5gObrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6186
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

On Tue, Apr 22, 2025 at 08:03:52AM +0300, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Arun R
> > Murthy
> > Sent: Thursday, April 17, 2025 4:22 PM
> > To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
> > xe@lists.freedesktop.org
> > Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Deak, Imre
> > <imre.deak@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link symbol
> > cycles
> > 
> > Unify the function to calculate the link symbol cycles for both dsc and non-dsc
> > case and export the function so that it can be used in the respective platform
> > display drivers for other calculations.
> > 
> > v2: unify the fn for both dsc and non-dsc case (Imre)
> > v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
> >     retain slice_eoc_cycles as is (Imre)
> > 
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 53 +++++++++++++++++--------------
> > --
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 29 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index
> > 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..5ce8ccc3310fb71b39ea5f74c4
> > 022474c180f727 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4392,26 +4392,33 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> > 
> >  #endif
> > 
> > -/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */ -static int
> > drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > -				     int symbol_size, bool is_mst)
> > -{
> > -	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size *
> > lane_count);
> > -	int align = is_mst ? 4 / lane_count : 1;
> > -
> > -	return ALIGN(cycles, align);
> > -}
> > -
> > -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int
> > slice_count,
> > -					 int bpp_x16, int symbol_size, bool
> > is_mst)
> > -{
> > -	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> > -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count,
> > slice_pixels,
> > -							  bpp_x16,
> > symbol_size, is_mst);
> > +/**
> > + * drm_dp_link_data_symbol_cycles - calculate the link symbol count
> > + * @lane_coount: DP link lane count
>  
> Typo "lane_count"
> 
> > + * @pixels: horizontal active pixels
> > + * @bpp_x16: bits per pixel in .4 binary fixed format
> > + * @symbol_size: DP symbol size
> > + * @is_mst: is mst or sst
> > + * @slice_count: number of slices
> > + *
> > + * Calculate the link symbol cycles for both dsc and non dsc case and
> > + * return the count.
> 
> Lets add the DP spec to be referred seems like it was missed
> 
> > + */
> > +int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > +				   int symbol_size, bool is_mst, int slice_count)
> > {
> > +	int slice_pixels = slice_count ? DIV_ROUND_UP(pixels, slice_count) :
> > +					 pixels;
> > +	int cycles = DIV_ROUND_UP(slice_pixels * bpp_x16,
> > +				  (6 * symbol_size * lane_count));
> 
> Shouldn't this be 16
> Also one thing I see which was there previously to while calculating is we ignore the two ceils 
> Inside the function and merge it into a single div_round_up which may bring as slight variation in calculation
> For example for non dsc case
> Spec says
> HACT_LL_SYM_CYC_CNT
> = CEIL(CEIL(HACT_WIDTH / 4) × PIX_BPP / SYMBOL_SIZE)
> HACT_ML_SYM_CYC_CNT
> = HACT_LL_SYM_CYC_CNT × 4 / PHY_LANE_CNT
> 
> But we do
> DIV_ROUND_UP(slice_pixels * bpp_x16,	  (6 * symbol_size * lane_count));

and we align this to 4 / lane_count. So the code does what the DP
standard describes.

> Which translates to 
> CEIL( (HACT_WIDTH* BPP*4)/(16 *SYMBOL_SIZE *LANECOUNT))
> 
> Which does not seem to match the calculation exactly as what was said in the spec
> Lets have an intermediate ll_symbol_cycle variable too should make the calculations
> More clearer and precise according to me.
>
> Also for dsc case lets have chunk size instead of reusing slice pixels.

Let's not add now other changes besides the original request of one
thing, that is to make drm_dp_link_symbol_cycles() handle both the
DSC and non-DSC cases without changing the calculation, see [1]. That
corresponds to the diff I added in [2].

[1] https://lore.kernel.org/all/Z_UvdB05S0sPbs6l@ideak-desk.fi.intel.com
[2] https://lore.kernel.org/all/aAdiU3K5EV6Oq81a@ideak-desk.fi.intel.com

> Regards,
> Suraj Kandpal
> 
> > +	int slice_data_cycles = ALIGN(cycles, is_mst ? (4 / lane_count) : 1);
> >  	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> > 
> > -	return slice_count * (slice_data_cycles + slice_eoc_cycles);
> > +	return slice_count ? (slice_count *
> > +			      (slice_data_cycles + slice_eoc_cycles)) :
> > +			      slice_data_cycles;
> >  }
> > +EXPORT_SYMBOL(drm_dp_link_data_symbol_cycles);
> > 
> >  /**
> >   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream @@
> > -4486,15 +4493,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
> >  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> >  		(flags & DRM_DP_BW_OVERHEAD_FEC));
> > 
> > -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> > -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count,
> > hactive,
> > -							      dsc_slice_count,
> > -							      bpp_x16,
> > symbol_size,
> > -							      is_mst);
> > -	else
> > -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count,
> > hactive,
> > -							  bpp_x16,
> > symbol_size,
> > -							  is_mst);
> > +	symbol_cycles = drm_dp_link_data_symbol_cycles(lane_count,
> > hactive,
> > +						       bpp_x16, symbol_size,
> > +						       is_mst, dsc_slice_count);
> > 
> >  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles *
> > symbol_size * lane_count,
> >  					    overhead * 16),
> > diff --git a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index
> > d9614e2c89397536f44bb7258e894628ae1dccc9..98bbbe98e5bc0ce0f9cdf513b
> > 2c5ea90bb5caffb 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool
> > is_uhbr);  int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
> > 
> >  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct
> > dp_sdp *sdp);
> > +int drm_dp_link_data_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> > +				   int symbol_size, bool is_mst, int slice_count);
> > 
> >  #endif /* _DRM_DP_HELPER_H_ */
> > 
> > --
> > 2.25.1
> 
