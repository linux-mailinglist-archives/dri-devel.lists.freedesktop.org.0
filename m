Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC4909317
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D70310E278;
	Fri, 14 Jun 2024 19:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI4p8SqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5B10E266;
 Fri, 14 Jun 2024 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718394791; x=1749930791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tvmPy+zeeTPNhG0chxwKAH1FGj+ykTq474jwZBB3Fc0=;
 b=FI4p8SqIBWuyRauxNXoJmTiP7lqJ7OZ+M0vBJyUqXn29TtpnNdX3mwJt
 fSs0xOfJtp//ZpZJ/BOPT3gVwrShh6eG/WhZGoF8BbdTR3N8isLlBj1YK
 db8cjPMy8CaWgjCt1gbKevOpKSJmwD2jxdc5E/uMmeG+KU8HuLJqXGHko
 iZK89nK9FVw1pK6FXwsfOyfk+3OPKh8YTIEM9IoCV+pTlIQOVHlQuiDsu
 stO4jplvfXWe5t+37bGiaIpu7tqvIMDjro6m+4e3qhkKKAZdj9jruTS17
 TTqZBjXov5YcDddOq6CJFlhOy5XS4FMKus7XNm8sbI/h1C5kjmLi5xZpf g==;
X-CSE-ConnectionGUID: 0ZX+tIXXR4W/Jhz9u9lwEQ==
X-CSE-MsgGUID: O4Qsh2d6T8aHHzEF14qWzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26699071"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="26699071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 12:53:10 -0700
X-CSE-ConnectionGUID: uIptPk7CT7Or55f2YqiyLQ==
X-CSE-MsgGUID: Xd2fzOKWQCu+BhC0mxhx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="41314940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 12:53:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:53:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:53:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 12:53:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 12:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP5W1hi3uEzuzsMGYiZcDd81mFLq44MXLB00R+3mTks59mlV6uJKyZ6VWoe1R+Cekabx+2J17WLA+QeL6jVpRYVNkcS2yQqDunk8usYHsd05dCtdqLBxoB5RDbpGcLOqmYulRHIY5YI3IJxtnVriOsUR3WXyfM/5hAWVGwx/PStH11hSETRIC56EdD0jw1B0tKCYtqSQdNyx1m78/rBNoCliGWTWOefSP5/UCYwSOkPBPCVbK96O5Qwn6KAemn1mwY0nNiTbpwLbWVm3r181u7xa6rhlq0ylvxrIW838/GMJyb5fXbn5sFYVzbJoLVL93P34WpzJi0RfzQHTRMs+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xwn2NU7E5TycFKPX9qs4zD0ZK6oEQ3c1z3zXSTmSb14=;
 b=UcunBBMnAhBZm7F+V92FAkw/BDM6QanP4RcpdaSqciHCDnvnrcRojgQbgnk/CzvITZlfj2Nnw8i+1i/aDUL9fMsqa++bLyN67k7xeNRvSCbhh6q0hUCX8ORbXzb/uCwMrCj4Uqy8L4TswxwDTwTq6NTJZxi2O2JfZMTuCGKG88NosgxG/Qj/pi3yUv11pwdsgKwbWc06EdegoFes2CjbYo0VeoznBTb4jE0qGW9imaItR8JSqe+RTD2IXxOOHzItFs+7KkKQHAA5EbIw0zkUAuugaoBNE/59jB2wTQpVt+KgIvS3FuG9TCmp2Tp0Vwvqawahii4m/buvafYgmX/Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 19:53:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 19:53:07 +0000
Date: Fri, 14 Jun 2024 15:53:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>,
 <suraj.kandpal@intel.com>, <jani.nikula@linux.intel.com>,
 <sfr@canb.auug.org.au>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Message-ID: <ZmyfoMYRfKJv16KD@intel.com>
References: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240614042558.376983-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240614042558.376983-2-mitulkumar.ajitkumar.golani@intel.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c6fbb6-9959-4502-2fbd-08dc8cab9c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BCJUnuj5Wp9+XOQ0kaFup2oW+h+clLZz/Ug0BcdtD1oh199RLCgW9C44sFeC?=
 =?us-ascii?Q?HQMCBc5wkU9ujQge37dBIGrxh9LmtA7l5ccSbu962XePsh2GlTlCIoPolVtc?=
 =?us-ascii?Q?j8vOJFC5Evj/cuvkKhK7mTbyGBeueMLpEJiz995VXisIu5eMHD92h/xaSliF?=
 =?us-ascii?Q?8ggkGzfiiyrP++/25w8hgo1pWTjElFd9b3Zh1i5E69qcULswpA74vKdI2TL4?=
 =?us-ascii?Q?9rioinVk1Ii7cZeNAC5hQ1V82zIYxYmtneAsENi8SEmrd8qNy3OUwFBOPOZk?=
 =?us-ascii?Q?pUq7VJhq9xhmivHOjptMN2Chi/n2Y1nxAIlVIgRET9ghmK6J9Xgp/Si8FT07?=
 =?us-ascii?Q?RnoBItrIuHo4uDte3ukRuxZrVLkRw0u3p/NGmSV9InAs4JbWR2gXus8SA2xQ?=
 =?us-ascii?Q?G4n0EEnClnMey4kw1H7TQzO2QELk7AG93p8hLMoDZGwFoBME59LOUm6yfESr?=
 =?us-ascii?Q?pOdSgQqwc9iS0RyxKvJktjWmxdb/0EYfj6yeNMVgU0cnHn2c0ovjvSitoDu6?=
 =?us-ascii?Q?ygN7UU0fBtL0PlNyeuj2+sOmYUaMepqXZ8L3ev3y+5JdFwpuOl6oL9kdoSUV?=
 =?us-ascii?Q?W0xgQmXW1RLO/RMbXuxH6djbNULVNNH89c+K5IzM7X8p2DMUBhHidRDuhRwW?=
 =?us-ascii?Q?/fecNnS2YDRBfGl7KoBUyE7InXfIwdkeaumIWEaAzdtvt61Pc6dKnbp/b8Vx?=
 =?us-ascii?Q?cZa3S4GBO052kGw/s4vYw/Ltt1Y2tgkIVLDqayXYBXkVROm4/zLKIbX/TaQe?=
 =?us-ascii?Q?UO1c9QF9d87KpQw2WdqjPDAi6XWE1xdAqDWfzpUdwjHPDmGQu5lMXsDExSJC?=
 =?us-ascii?Q?zxjXqLZPwHa8ayzxyL5JgrDIDZ2evn9p9NVi+sWZ3PMGXLFVkHv3ZgcJgK4r?=
 =?us-ascii?Q?T5u5rQERXWokl8hXHVx1yAWCoBD3RdKOSr5fKHqZoZX8EMtfvZJSrx5ye4Dj?=
 =?us-ascii?Q?PUA6uXfKFYTcRdYVFvldL3S/vhnxx2Yu28epTTCQ2zntV4pXcDaH/u/91oEY?=
 =?us-ascii?Q?DS3EkZsrMoZUyAf1dWiAsSbq9tWj4Fq2SDydXE4WOk4oOEp6o58W+hhjGz5x?=
 =?us-ascii?Q?IhAohL14vj8HUtpC4FDL5wvf0Oq2+3uD/4PmFf7rWjO1gMYFwjBz5C4O95Cc?=
 =?us-ascii?Q?5XEWietExwKTcVf7v2u9DM4y5FRyEiju+GedZcGzXR56qPQNgwDGVrprXh8/?=
 =?us-ascii?Q?Kj9/bXkzde0Go3LfhvC4qIAihg3TRPRQzI5CuK4OUtc6rRYJ4TUSipl5rgDU?=
 =?us-ascii?Q?K40O2g1gzwSl855PSZIOdH42fgkkPKQCGrACqegF0AH1ak3lzMHjRppUHpct?=
 =?us-ascii?Q?YdfChHzzb42/6M09fFzHKgPv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1MbVGGp4nara9xg8GyKHSv3Tx1349wKh1SwSbpttrescCOXcN7U5JUtBdZv6?=
 =?us-ascii?Q?yiKxxZHtnM95o/RBfzADy3U3MNDfRb9XsYjtDfnCLokST8B6qfDvfyQxWVeX?=
 =?us-ascii?Q?mbEsU+CVSwIOpCsy1vRDe4dPhkfBrgkfWu7EL30BOhi5KjDd8JSPNA/Co1Ww?=
 =?us-ascii?Q?ZLxCnO8JQQkqs/8SyXorjUEYsnnCRuvWQRInCQIJdAKUVFfis8r0uJiv4ZwZ?=
 =?us-ascii?Q?vtxQy7ENKM1Xhs9oPfz0YAg7AliQR9bz5QyqLWxCnlkE+KDYNaMEPyog2WLQ?=
 =?us-ascii?Q?+8gIjAC5L7qiJEeRfPtFpCFg2+PQyUXlprCafzgXYdMkdeWHdzazxh8t/e4L?=
 =?us-ascii?Q?fGbXWgp9bCuMyS3gbF0VGJZKVKVUnJAIy4TGTKzEwFRIsDA0LjHsEcEEdGkJ?=
 =?us-ascii?Q?zw0owGsTmS27FNEQ6p2Ug+3f6R89aFVrCv8b89IL640p4vUTszkCh5flKULK?=
 =?us-ascii?Q?mnFTzgjgOtUEUlsKJ/Rme3Rr0qaekWOwTe3LZYTiISmJDoLRBI/MyWOnnN8p?=
 =?us-ascii?Q?I0cPKVSMIj5F8K3t799oNseawNJARiv3sRzZoDZdSfiSZbu9CeWSZ05ZO+6u?=
 =?us-ascii?Q?IJ+ci1fFWahpdZHnTAGK/dxcJvFeYaPVTioNYDxR6XC+rZjrIOWVkYjwnAcQ?=
 =?us-ascii?Q?lHkQ6rGG6zeHwoCr53Bh8XOoiVwVSPKfPG4KFF8h2XBqQ8fPbHUEs5nuFUrJ?=
 =?us-ascii?Q?s8sJkZriZwd5HU2vnyjyB5cG057SbBBtDiuk4t2/4pDWCtbCWNW4G+Qtb7PN?=
 =?us-ascii?Q?SvU8U1FEpmbf9aplh9Xfet4DPW7mKtBJAfIjdK4Dn61WjQCCtGi4HEgn/PF2?=
 =?us-ascii?Q?CXrAkBVsuTMJg/fJvhkTD0w7JO2ioMzBtG4Lm+fK00r11XUg+0qF5JFFztCs?=
 =?us-ascii?Q?eewKNVhxUATyD8Pd4CdbqaeGzhQ2m5mSgfwKDBxJFyAUPk5bniWf5qfjbkQ9?=
 =?us-ascii?Q?hxVY148mPbY5xq5v11tp3ISPTw7CbxKRJpWsjYWF6/jmb2lbnYthp1NxlP5t?=
 =?us-ascii?Q?0yfkbAVL4VbyAvCtCakLrEd5ML9gFUaDOabTtfglKkenG1SHl7+CirqKUgq0?=
 =?us-ascii?Q?BxxYoPnlfiFOU8FGne8LJtp+sGvTWYjRz1pTJmBV9Ul+HoSXAq7KuTwd/Rn0?=
 =?us-ascii?Q?WovT6z9ENwuqPMiGFF9IJQYcYc3xyS1sUU9YB5s3Br9QCISNCXEtDnTiRk8c?=
 =?us-ascii?Q?EwEuDEfe5PiYheq5U3CJr8dndKahpVGBdTtB6PLaNROJWEIHR8shIKsqIf+r?=
 =?us-ascii?Q?ODPwEt1fecjdKjI9JzpHco6QvPx9U75lMTZqVR356ag3fvLwuQ8zShIDevuP?=
 =?us-ascii?Q?G1zgksg+1c8u7BKrqQ+n+Lifm53i6ZnsQDaWGGY/mO0ibGUfCxPEsFFjQr42?=
 =?us-ascii?Q?yiPWc80IbqCjZJmK54YneHT6dTEIhHMjfyvKzCCv9qEEOa8AetFswrqwIkku?=
 =?us-ascii?Q?+yx7/5Odn5uz2coPL3Ip9KR0Ny4UnoZTrBGYt2Wl5rEODWAI+dqT19Z5lGYc?=
 =?us-ascii?Q?sn3p8OagFlxt7MRMRBs9HVGGX/xw1BxXhisf22uo6YyEvA6uzmM+Jak4goFv?=
 =?us-ascii?Q?nFJ1oa856N1vm+aZQ4C3IPlDhE6znrgqXrA3EqrUJXhHvSt4gNuJ/1gF23Ti?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c6fbb6-9959-4502-2fbd-08dc8cab9c63
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 19:53:07.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWTj+kpnWSPuwWJ2B1gNGzDQ1JBE7vQYCB2Y8pEGuxE1l8SAzndUfA/4TLrwVVw6XCOpmT0ta0IabAFYk2xLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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

On Fri, Jun 14, 2024 at 09:55:57AM +0530, Mitul Golani wrote:
> Describe newly added parameter target_rr_divider in struct
> drm_dp_as_sdp.
> 
> -v2:
> Remove extra line from commit message.(Lucas)
> 
> Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  include/drm/display/drm_dp_helper.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index ea03e1dd26ba..7f2567fa230d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> + * @target_rr_divider: Target refresh rate divider

Maarten, Maxime, or Thomas,
the patch introducing this target_rr_divider is in drm-intel-next.
Ack on adding this through drm-intel-next as well?

>   * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
> -- 
> 2.45.2
> 
