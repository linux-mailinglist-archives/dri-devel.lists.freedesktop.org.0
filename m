Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOhUIy8cfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:01:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA3BEA43
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B55210E92A;
	Fri, 30 Jan 2026 21:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyRXYswG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51EF10E39D;
 Fri, 30 Jan 2026 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769806892; x=1801342892;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NMc7cvhygMKo/5d5SZgV0E5w8wAPG/Ca3iBPe+kf4+I=;
 b=JyRXYswGUTEVEpOKxE7NfK+SkaBOzA4t7cgJ8wVw5HNoXV9dRK7LBENd
 gi85/QyE5sm3YLfrcKrL+WTgNM01DOk7Iv3h9jJlLsZQk654e+YA2pk7P
 JR7QJMFHgIpgrJKZTpO5V+HJm8xybIEdG1RK9aFv1GWVKsOI+NYgijQ2b
 mlooXg7F43q+c0W1odKKKa1WZGv8wf7M8RsW2FQqf6X5c86tBWJeV0xeF
 j4GjMVoE6P4BtL13BUQoRyllKq3C4TJRB1wBMCMXvETsqJZXieSRvyQQP
 czDoWUUegLCyhv9Vi7n1nnSwOavm1wWzoBWbBcKaJu+OM82h+gfd7cqXX w==;
X-CSE-ConnectionGUID: LXceKQIeT3+S0SRdw0K83A==
X-CSE-MsgGUID: oixSHrYuQpCd+y3CZ8qUEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71041311"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71041311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:31 -0800
X-CSE-ConnectionGUID: 84RROu+ZSvyLj9quZwhBRw==
X-CSE-MsgGUID: 9Pt6fnlBQ3utm+TxLmSA8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="246571331"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:01:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 13:01:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:01:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbgyRN764tyx48Mjt6naqqgmm0gKM9LMj84n1x+/vbBEWfo/VB8jverzyeMm3O84DPhadOZWqqveMWSNee4ATYwdMp8xS6U3lhf4WmKNSOJGwcts7VKjVRKzWFxW7DzNfFbzrSwptTj9//sFsgwjMqB79rOl8JthjfutySV4eoEX9XO2763be7MbUnCWrXiLS4vJTJsFo9DHzRWn9o+wW9ewvBFqbQ9S+LNV6RTir4HYF3ksN5+sFr/Zb2Y/ve6Ku7C3CqIUpCDu+EbwXNFUjN6My8R+5Nbb05clZkXyACvXgUcTpWBKMiWX/BSIs1trLD+iI8gPo8JIeYeUrOs1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFKIOFixxPGQ18G8ckmMn0msXOFVq6wnRFkXY1iHxJQ=;
 b=ksOGAKBpiBSGO+e3Fzb6vbTbKPCbQVM+RKD+WAMFcJAj44j3XPohloNEkembPr8ywUs/1JMix8Y4a/7WYySh+km+hSb4TO9cEDuWhmgNLkY2gkSpsREjOJThfco45mmGnMlFan/djj+tN49Fs3Qy4oVzGsVk2thXy3cGxYYqgVWxdFRpAzit2iFQwttYIAZhO81u5zmi15aXuvjHSbMzCPJ2iN+lwUu6IwV+icMUf08bAR0tMJ5g5XgAAPcLwGIBJQOlXRemWCK3M37BlhRUrwVPhOFVBgucOI/7SDyHlcq6M3Ad7Un0lflWh4rlKkDJZrIFxSb5Lv7NnOx6GlXW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 21:01:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 21:01:27 +0000
Date: Fri, 30 Jan 2026 13:01:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 <linux-mm@kvack.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
 <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c22c419-4e91-4bde-e286-08de6042bbd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sDECCUhuuHUy4K6yWkLoFoTvDJgjIxmlMUGMOey8uqxpspknPSR5r/qzN6?=
 =?iso-8859-1?Q?hxt1Wl6pjHHUN7QhRTEOeOYbIybJnuK73ME3H0chgk2e8NM8pVF86tziKG?=
 =?iso-8859-1?Q?D6sBCeANv47BS8A5xpw1XaqmuT7zfC3P6+4o7lHCVvowK2g7Un2/C3bCYi?=
 =?iso-8859-1?Q?pMfAEhcImq9hQkA5jV7+3Awe7RTVH5SQvdyHRWxWm6UmFyIMG8COv1EG0/?=
 =?iso-8859-1?Q?dn/DTOOX2kFmqDeqzA+5alVBIBMJ0CjeNMrxmw6Ue5VG+GIaqj6gIJQ6u0?=
 =?iso-8859-1?Q?5uR1gmIfgILfTRpCIGcG6gcOiiATtS9DUnlnU2G8mZpotwK6/HcyNXKFPb?=
 =?iso-8859-1?Q?PSrIZBTbXyql30iVHXjeax3wNp8fFTKpzcqUHXX748RU6i8oPMjlZVu6sP?=
 =?iso-8859-1?Q?nQ+JAhPBZFnClV3F6/uEmi0VJfVdnO6LlZAi8nSnGjAgcxHjYqpGsn9KCC?=
 =?iso-8859-1?Q?6XsQ4y1tTwZQPTLBZ3YWkyibdo4NqWkeJ4XEd6/pToiCc2+f098UeeQMHw?=
 =?iso-8859-1?Q?JyxHGdfKHz2dWlIwV6QS6qHtzXp/CEm9cWeG6wpNqzQQxDfXCwRlm3pvnG?=
 =?iso-8859-1?Q?V1fl+hTj2ykGcmutuTY3g8yjt1QFC3B8XW2c2U/knj3PT+oH5bC3TDwDMH?=
 =?iso-8859-1?Q?cn14WBY27DcXKALFK+3KWb954H8xdWkcEInmpvK335CBNvGSBSpgryoUvB?=
 =?iso-8859-1?Q?YK0c7P1PBlhw6rGxdr6VZtpbcyofeNK2OJH9/bKsFvWEsEh7RGrA0oRa36?=
 =?iso-8859-1?Q?mN3B6EFSjsVQ1wlkRsO3yWBlghh155FFrv3qCvLxxjcw2nFDK0iqwaSbxX?=
 =?iso-8859-1?Q?XEEyLXeg/RtXLB2OK/IbETt+zbebt6p5jS00Up4o6scEQ+LZig3UpOXAXb?=
 =?iso-8859-1?Q?oq8me7RvUkUPAzAy1uniYLnmWybIfcDqqcz20pk6a0AXcu0RDhdBD4YsZf?=
 =?iso-8859-1?Q?czMZxHFH2eJzvZIwymSM6Amc5IVJBRDunt16St0wlHzUOWZ4PPEVAQUWLM?=
 =?iso-8859-1?Q?41kPzOEVzyJ4OC0vSlFs86iDBMKzgMzI4KZIKIb2gyUA6j83NeCyrt5uvr?=
 =?iso-8859-1?Q?enwufkPtmqDbwZhbNGpHjhEQ6y3JJhmhpKIm/YNC02dVUK6sQNlNscgS2e?=
 =?iso-8859-1?Q?IQ/Klc5lv1cjljexyBXFhgLs9cMghnqO1aoP66BeROdhxMPAuJx4yplZAp?=
 =?iso-8859-1?Q?SRNOCd0yD0OGWrO/F9X/p9s1sLgTwIUCTK0tybfRciPurtLs6PEdKof5mt?=
 =?iso-8859-1?Q?lMAvtMR+qm06mp2SQWzqNoijIiZr8FCY8Fzixb8cH+cDwEGz3k6tQFDouz?=
 =?iso-8859-1?Q?FC3l6/JdnEaCGRolNFIFXRxO1xW/tELSCxB32CtHxpBVzJeAmeV9vNUlzB?=
 =?iso-8859-1?Q?9iRB/Bxy+o29G9gB1j75RFkAI1UVjCcBACvLqVPeGDS73LrqIkU1tUXDxQ?=
 =?iso-8859-1?Q?UBN/gTglkF0Pn7Px8nkqcBeD81uPyitIcMVMuDGZ1A3uC8RayGQjYhp1yS?=
 =?iso-8859-1?Q?G5YaQfo2GWAqBeN4h7hrJLggu4ZW6Q695LXrPEAsdWie39Z3S4EG0JoSYj?=
 =?iso-8859-1?Q?3yCtZteVqmAb5lf/gmalSFdX+r/5DLLBqqZ2+AP9CR1iRLpo9h1XnxrKuz?=
 =?iso-8859-1?Q?oQcTcltGNafsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WsmkjqV7ALdjIcQyudRGr6SxgDkJt8NeiRwtfP+GbqX69qmM4i6E01oZAP?=
 =?iso-8859-1?Q?NSdVCkrjYQQWiAtJAWhADBeU5lQNCPsfb6iUQbXORvHMTF4A1HNsSOH2+W?=
 =?iso-8859-1?Q?M7atWPSeAd1wYGiZqMJBncFCXV9QYP2YusZv+cglTnjvrE9P8QBsgyRhMx?=
 =?iso-8859-1?Q?F2IgPO1AUPhf0c53ch6iTk8OqCaNukIm5wPIVeAna0nA9uAQ3IkhdW1QGI?=
 =?iso-8859-1?Q?Bk2SB5RP8Cou1npSA8V1KnIwruZ+cBlqHKdqFff/y1dZklEYJzwEpFo0xU?=
 =?iso-8859-1?Q?o0dKA0rdN6mzbHniRPDLCZ7ODx2rbMIiNwCcUzaNa1DAS8yDg+mzQtipLN?=
 =?iso-8859-1?Q?lJbw4Wi5WoWNJBM1v5tL8XH0BnpWAHux4sdnUfCKeVkldBtQ0tbRtRC62w?=
 =?iso-8859-1?Q?CavMwLeznSVndFeHrcf9roVJ60F0G0FXmhM28Q48r/XpR3okD9Ekb9OOyf?=
 =?iso-8859-1?Q?XEf5ZZUK7lzXAY3VZVnX4EvPnspEaygyWUUDkqEvLnW2UgdXyAsCm/QMcf?=
 =?iso-8859-1?Q?nipBbaGjAYAkrmDus54Nj7TZ9hDd103MWWTEfrunvnnYrQj2r1hXXjbOGO?=
 =?iso-8859-1?Q?fE3432rcC4QI1taYWZBw1DuubY24NS215LFDG0SgqSZYhKDt54euCrCNKG?=
 =?iso-8859-1?Q?12leNykDP/oQox7Jbx2qL+h10s58satJSntuvYfbE9mdRCRJEEDH1xhmtE?=
 =?iso-8859-1?Q?15ZLdEOqEGJPp8acbN1SvfjZoTIH+vWOWxSff42HFqnugi+tCBOC29JEyx?=
 =?iso-8859-1?Q?W3DHClATIpMbsktunymLORMQimcBSbSl4t/s0w5YDSwgcSjxNyNZqHAvNV?=
 =?iso-8859-1?Q?bma2wLGY3Jl7tv+6YqcsBFAZYffLdczgidI+vBGE2ZVVloBu1WqNb1Nrb9?=
 =?iso-8859-1?Q?qsMxfOy3R1t4XzKzDO+EEYoDWeydd9sdx5dsWfBiU46I40qw/jLyCIby2a?=
 =?iso-8859-1?Q?gUxGRlC6QUArO5iFvEjdWS9oVI4XtGv6+AbdrdFWn2LtvwUzSe7fZsOmRS?=
 =?iso-8859-1?Q?ZbO5+kAqABEbvIReIxH9WJLetlhySE1FIb5ptBg2RolTEgz2da+YjgNLHi?=
 =?iso-8859-1?Q?PIoC9TdCTdKIBtYLms+yDIFRrraJAssMBdUa4D39MfUmhShiQKv8lmNDVu?=
 =?iso-8859-1?Q?2J1Vwr0sPt5Ih8r6C3ypVfHd/3PDQ7Z2JfwjG2+IwGYldgMyl4e1alQz33?=
 =?iso-8859-1?Q?M2a4oZug7HcB7UqgZZ7AHcAI6G0MotlaN+RV3QlJZwfUGteqqOWo5Ubzgp?=
 =?iso-8859-1?Q?Joajkf08IquikZ6eNKa0yzOAAsnSzZC6CqceXiNTTt489twb/MugfyJ9H9?=
 =?iso-8859-1?Q?Oa9c4s2YwCE3w7x04/gQ/Sg8ixVS1H0Gl8EWXBFAp439Be6JcfSiVTLrMz?=
 =?iso-8859-1?Q?fGC9QfsDTDxjvr7k29sWyCGz3hTEEI9e0sR3RQAl0L9t4sYxms3m75BrMN?=
 =?iso-8859-1?Q?Cwt9vBTNXLbmG2zbBSzVDwekVgmFH10Tt/7HVqDn+OKMNSYqzrzkb5xt9P?=
 =?iso-8859-1?Q?jG+OeOb24UmXgCyduVqbNvDCtGCL/eQd8OUNfm1fikBFd5X/CeBavXKlSB?=
 =?iso-8859-1?Q?9ZPuZXjpJ77gyO87oQNUDJG5u7SyIeXVyAIzw6p0CCO3H1ZG/yduvj6wyu?=
 =?iso-8859-1?Q?xizBYwF+7nIHNE4yzAF4JfLxar7OOsRNkR8RL+ca3ALxi9BDO+U4sl0FMk?=
 =?iso-8859-1?Q?SMTi/ePBa8HXMZibVIU6OkFDZSUrJ4RlhitqexGgEgwsiwkirLM4Mvy2Ht?=
 =?iso-8859-1?Q?BQ46nD+Rn44I+WBqj0PSwhkIY0s3wJgDdXshHpXJcqIx9/Ycaa/w6QXkFJ?=
 =?iso-8859-1?Q?N0z/3fX7Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c22c419-4e91-4bde-e286-08de6042bbd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:01:26.9891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWNn4ujydTEMKhEArIszIqKfSKjE6Djo6/xf90E9mldoiN2SlAlx0p9o7AdfUeajZJyt7dk+WFKaJMIalh4jzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E5AA3BEA43
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 12:38:10PM -0800, Andrew Morton wrote:
> On Fri, 30 Jan 2026 20:56:31 +0100 Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
> 
> > > 
> > > > --- a/mm/hmm.c
> > > > +++ b/mm/hmm.c
> > > > @@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
> > > >  			return -EBUSY;
> > > >  		ret = walk_page_range(mm, hmm_vma_walk.last,
> > > > range->end,
> > > >  				      &hmm_walk_ops,
> > > > &hmm_vma_walk);
> > > > +		/*
> > > > +		 * Conditionally reschedule to let other work
> > > > items get
> > > > +		 * a chance to unlock device-private pages whose
> > > > locks
> > > > +		 * we're spinning on.
> > > > +		 */
> > > > +		cond_resched();
> > > > +
> > > >  		/*
> > > >  		 * When -EBUSY is returned the loop restarts with
> > > >  		 * hmm_vma_walk.last set to an address that has
> > > > not been stored
> > > 
> > > If the process which is running hmm_range_fault() has
> > > SCHED_FIFO/SHCED_RR then cond_resched() doesn't work.  An explicit
> > > msleep() would be better?
> > 
> > Unfortunately hmm_range_fault() is typically called from a gpu
> > pagefault handler and it's crucial to get the gpu up and running again
> > as fast as possible.
> 
> Would a millisecond matter?  Regular old preemption will often cause
> longer delays.
> 

I think millisecond is too high. We are aiming to GPU page faults
serviced in 10-15us of CPU time (GPU copy time varies based on size of
fault / copy bus speed but still at most 200us).

Matt

> > Is there a way we could test for the cases where cond_resched() doesn't
> > work and in that case instead call sched_yield(), at least on -EBUSY
> > errors?
> 
> kernel-internal sched_yield() was taken away years ago and I don't
> think there's a replacement, particularly one which will cause a
> realtime-policy task to yield to a non-rt-policy one.
> 
> It's common for kernel code to forget that it could have realtime
> policy - we probably have potential lockups in various places.
> 
> I suggest you rerun your testcase with this patch using `chrt -r', see
> if my speculation is correct.
