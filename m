Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA978AF5E32
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14EC10E15A;
	Wed,  2 Jul 2025 16:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmXHNi6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4810E15A;
 Wed,  2 Jul 2025 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751472808; x=1783008808;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pNv8pav2rm4812b+6RoGvJG0tDyXeliH2GHOnK/UdUE=;
 b=HmXHNi6Syve2IhkE5ZJ/1Vv6aP6YCqq7zTBHiHb+Q0IVAMNrCxs7rMBu
 mBwdPXSUWUkEcCDeF23OY/lfItdRZpJ9Ft33psLYYrRTYlWplaSw+ajsP
 9F6BFfeJ/za2rPP/WsR37Sg5SxjOxcOBoL0r033tUNw4qJY4cFwCABmx4
 SMWG0h+xklRho0Rv4ojzcMFjjGLDspCYeZ+01RtR9xHGliUVnwpPtjPng
 7OtodYKNRwwVsGbHDNs+WwWdyz9OTWK/xeemi62UFV6RuTqXYVNksPUfM
 J1E8Z1idZbH//VDTkintgMVeJu6vSLYAVoVqVQjDHhwjiFdPHpsHL6Vnk A==;
X-CSE-ConnectionGUID: YTbrHiqwQWCLq570poY1jw==
X-CSE-MsgGUID: ngDhNM5qR4a1ERwGCwhBhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53890082"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53890082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:13:27 -0700
X-CSE-ConnectionGUID: wGTHtGZjT/mSafatppt1lw==
X-CSE-MsgGUID: NKTsFVqcSGmYlaT71U81Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154625106"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:13:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:13:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 09:13:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:13:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjY8tja367OOAK6h8xjt/DLuk6s3+4EnFOswFpmbP9VN2MQFSPiWUz9qb2/dkFQuuD3LdNuGOptK0tEBKt2UZnBVm5x7lZn+wLD9cFDN4n+gUcVH3jcl+BpNjsmoNA7DwajIAsAfhp3VUN5htlDsSz/rpjVefs9Luw22l6FnwlyQquTnOHqa9XiUAvYkjyWwkPKp9N5Xg6uMJA19/tk/YZ2EYMjNLxHjvnj+z1fWmYc0AWUYD73rcbKYTYqpI1/ATAo/aEwZf0tJZnLIQ0gSJO52mc3LfnMWQK16CewZP2CmFDQ0b01ZszZ9Tnd43axChI79dzr/4Zn5PeYISwDMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro6tnQe7+tF4dP0Wucfaa17uH7Xov/dkN8sng5iqCw4=;
 b=zG7xLeMsn5vPHjbtcqsIsGor+vtRmTgIksi3CR/WFB8fPn+PcW0AdpYuCreFCJqb5iTGquPcR8gW1S0Bit+49L4aQB+Vkb0stUU6pbFn+jGfa7Q4WyW5dpA1Kx2V+XGE954lP9xlKI8CNbdoQtJI0IRSSCA02K4eNm4hlrguof6DBCEKKVylaG97hXIWpAJxvUkO0M0JL0oOJa5FAq1RANTmqhsWj2hqgDnawHM7iVRoQCfCdEswSfoLLVpgTuFQxn0nTSoMtFCullyA4isfRaONkQe1xpcuIU0J55l0DaTQNSfqzdVRtAIcrgzFMJ2pJDceypLSBMoj5ZP2LWlX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 16:13:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 16:13:24 +0000
Date: Wed, 2 Jul 2025 09:15:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: Switching TTM over to GEM refcounts v2
Message-ID: <aGVbCnLV9fWNwPnS@lstrano-desk.jf.intel.com>
References: <20250702110028.2521-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702110028.2521-1-christian.koenig@amd.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e62fc4-0bc8-4d9f-bfeb-08ddb9835f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?g4Rn2VJuGJyvRUiVdezOZsT6SsrvfjJmv8/lrPV20aRsywD8F++03lSZIr?=
 =?iso-8859-1?Q?vBJYLE6b5wEjvAoWRup+J39E5XZI1ggYfqZeS9nuHFcfMaHs7RGGu5UvMr?=
 =?iso-8859-1?Q?P0ME37463v4ZdWhTL/cJ0g906+xL4GwLyLjGP6oW2fMjnZV8VoEtnNhZFk?=
 =?iso-8859-1?Q?0TwWeKWqvL/hrM8nuMy0LK4xXbzXtuOvWF7lD6c5dgyp/n3PTh+gWW0lYY?=
 =?iso-8859-1?Q?ip5o2A5Bw0opxMP6CIiTKJkc9eOTFpKy17vkgJkwyScJkH2oKd6AyhocLE?=
 =?iso-8859-1?Q?6UnEHBmwDnfCk+/nOlthNNwHiRNGRxpQkMFsIEbCx21DNNRZnWOeOaVThF?=
 =?iso-8859-1?Q?rL3lHlvhQV+ObYEpVZByV7Jkqmh2aQthSu8n4Rf4KwTE/bG642LGKLiteb?=
 =?iso-8859-1?Q?tJf7O7/0aqL4ADfYQP9btKO0Q3gb96mwNp0WO/uEslYUwsrEkods8TsHs7?=
 =?iso-8859-1?Q?jOTSXBFgQ7zbV8KIOMPXq+p7goqQGq7AW8747kZGPy+dxs6uRjL3MkuFCY?=
 =?iso-8859-1?Q?m38yNVW57y1m51V8dZSEXqljBzZcBoVyA6wszqGoXXSbHBzdFHbx1nen1W?=
 =?iso-8859-1?Q?2jyvsOLZQagPJQZH11FKT9JFyazoFPSXYv9AOIlSU7tKj/oL+f8tQGpBMg?=
 =?iso-8859-1?Q?DQ0K9cizcfrgVvsd/J0pVBzJAm3GpZbVTX+gC5V25XDwXnk0pb4ntWL4Ri?=
 =?iso-8859-1?Q?K4YXOGRvoBDpabD/BSOGVPeB977M4HQtMYbCuRf8nQLT1GVsFrrqedEW14?=
 =?iso-8859-1?Q?0Vyop9otFeyIPcVEROYUR3IbweaGCpmTHKrmRyEU44hXDLwmHKqe0NxDDA?=
 =?iso-8859-1?Q?ZcLRY7e7IumVAgIEr9D3Gfbykk+Ln1reRmTLyU1gVMGl2yZNQFJpr+/E/t?=
 =?iso-8859-1?Q?/zMdLxwxZYPHaFDGjB6l2i78aTkSBF+kW0MLrQIpmibD73PbhX1eD3U1cT?=
 =?iso-8859-1?Q?wkws0RDeCTjdM4XnrhH7qo03SlHzXxhSKER0Fj7AHvCIw34/rGOo0OuazY?=
 =?iso-8859-1?Q?ip8mpZCpr+YZKnxC3YFms/Ilp47vI2cpECx+S6w8qlzex/GvrvZDPWyhFa?=
 =?iso-8859-1?Q?re62ptef92JOzQUhl7pmCXvqHc2G3GwMOn/wSnz06L9o4uEkrE9KJadHDr?=
 =?iso-8859-1?Q?Q9cBCxMKlsiHuIGKE0ukqsmWYAtbOj4HtABQ+tAlkeHpFUtomA9IzWAhIZ?=
 =?iso-8859-1?Q?zO/2OjcGEQBymXRP+88epSPD/nW89VE/T7/qAHy4jYPToIT7CejAgqJUDE?=
 =?iso-8859-1?Q?TEeQIkpi95rnyPqrzOVxMX9/HuN9GcMtsQ1ILtO3Ipbz7X8tQp13uQ/jSo?=
 =?iso-8859-1?Q?9TaXIwMGAvFN77mCbVLFnFe7cFPAslMod8KM+fIaM/N+wtASuUm8pBNOjE?=
 =?iso-8859-1?Q?UbEPR3/nXWVQy42fL+IkPlE4HuNDiQBYOimRMDjHTrmgc8QGzQTQ5wUXn9?=
 =?iso-8859-1?Q?o1HLf4GfEflvcLzvb6l+HiuIr2blni75gTWFPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EFOm0wSgulXo8Eqb+bJmMIoAy97tEe4Ar/fHbwMfb93WCCy87p+ckoWRLt?=
 =?iso-8859-1?Q?oBRIDGQ/qYnZ0isip9Vb5g8/tatVkvzgIJrYXV/4FH3XWYFYoBoS0gtguW?=
 =?iso-8859-1?Q?czGS2ZZSup+5a8OoAtVt5woPZXvrQ4OGhhWWJ5blY2iEMv3/FvOQ+I++VP?=
 =?iso-8859-1?Q?n9yQJNxHMoB/hr1DnSgpaeBvQNAuCdnOERrQVwRd44Q8i7B6Q6HANzDccy?=
 =?iso-8859-1?Q?E+ZAff5+XMSR7mEmTOZN6jaDAW8JWUvXstL1hBMBLfzf6mCH/X6ZW8VzOq?=
 =?iso-8859-1?Q?wtTf/fDdVvoY2TkvjXXrilD0ags9gvJo5ibcT/aLZ8ynDqAWcRo3lFTTml?=
 =?iso-8859-1?Q?58ACGOmcA2Z/i5N2Qkn35wqZWhLETic5+sn5ioRhf4R4hE9bYB192UdAWE?=
 =?iso-8859-1?Q?DORPvu0NS49m9t73ALjRCTxpoztXW8jBpWOGVMqRdF1diDWBGMYjDufEO5?=
 =?iso-8859-1?Q?h0y7wm+jGeYaA8i5z7GnKZV6KzFk6UfSC2R/qLM8Psg/78Q4YXFSD4vg6F?=
 =?iso-8859-1?Q?c7MFIrMqGpaZnxOVJ18BZmDJIWrWPRMCnsgymmD7C7dGEKJMV/IhnWz5Dy?=
 =?iso-8859-1?Q?n9uukj3A7UTkA8ePcTli29PwmJptkrMwKolYJJgPJtSuwqggzFjW/VSCnq?=
 =?iso-8859-1?Q?zP8qfi0r6G2XEIZnYnFTYX73ccZ4zbE2KoirxJgB5cnTbZiaOcs+GPG1iA?=
 =?iso-8859-1?Q?5fbznikoUREPnS1KPugqq33q+aehxF0whTy/ZnKbPxJdNOCpLEcgDbOHKy?=
 =?iso-8859-1?Q?J4mkeL8Kg+KtH3xdHddfjg5aSKBCEpb9QRz+dadoqV7BRDMDjlz0biSdqv?=
 =?iso-8859-1?Q?lz7ykuYUuXUixph8DHvuC69Y8xQo8QHYWwZi8tyXmXfvMnLgc8j48OzKsZ?=
 =?iso-8859-1?Q?IarJXLt4xomUt6mcBQejtDtKQCa9ywaNcx1D4wGLHnyXYOVRDvis4UsxEO?=
 =?iso-8859-1?Q?obEDDZdZfTo+A3P/YlOvOfiX1Y4VRvNtVvvjsaSbB7AnRLlovYs1IcxfE/?=
 =?iso-8859-1?Q?pAHjuM02wxfdpdN0hI716HyuPcK8DPA1ORR0FiwNY7YmeixSnONniX3g15?=
 =?iso-8859-1?Q?3MMoFbsNdcNI/sAUlAhGWUaR+579oH6k6QMqlpReYR469oPCD2LsuJJfnZ?=
 =?iso-8859-1?Q?qUZ8tZJOvr0TMfDHeggjQVRphWV6eb4GZxfM+0rlLhdniobctbWuzXvYP8?=
 =?iso-8859-1?Q?oAqtFQB1RNdRMPp2x/Ps/AUi1hOZ3uDGHz8mHZSLuOIqeyXKBzjVL6TZHs?=
 =?iso-8859-1?Q?mgsSOJom/596/4jfmJrsQ5+w34hIiHdPU/fdLPLENsFXugpMKdyoU3PYYm?=
 =?iso-8859-1?Q?AJcjrbfxyOtpsU/BWk+r8k7aRMBxujvaej/uUhPyuwILPklplIi8bYX5x9?=
 =?iso-8859-1?Q?5fs3Hog3b60Oikvu1ENuJt+YTN6vQ8BR7K3QZeKx3rum7Ld9h4dWBSQpN2?=
 =?iso-8859-1?Q?gAjaN/a8uQJXNZ7YmSzJHbYATqYFwbuz9e/8fgsnmb0NODlyB9xFRbQdK0?=
 =?iso-8859-1?Q?CI11EZD1y/bNtpDfpkUKVs1vH2Nf3ZQk/hups8rH1QxjMvzxmqTqYbmQF8?=
 =?iso-8859-1?Q?nrBWb5/rZx7K4p8VUoH3WDXihzA3ki864746M6Lt2oapjJqDSX2kOL9BKC?=
 =?iso-8859-1?Q?Zgm9W5KeP9PYM+TayMbhmFwALIEo2cxy5bmx2Ww+A4P81jNRfJkTB/Jg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e62fc4-0bc8-4d9f-bfeb-08ddb9835f31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:13:24.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHpiS6YuToh4sdZTIlPZwSuXQ4wHZAgYfQBPVFSyV/Myf1w438sQzPrwgmCV+3fjUf9N43har7r+yyl8qF1mGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

On Wed, Jul 02, 2025 at 01:00:26PM +0200, Christian König wrote:
> Hi everyone,
> 
> v2 of this patch set. I've either pushed or removed the other
> patches from v1, so only two remain.
> 
> Pretty straight forward conversation and shouldn't result in any visible
> technical difference.
> 
> Please review and/or comment.
> 

I'll take a look but heads up Thomas is out until 7/21. I know he did
some concerns on v1, so might need to wait for him to get back?

Matt 

> Regards,
> Christian.
> 
> 
