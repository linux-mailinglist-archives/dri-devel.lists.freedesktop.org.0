Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EC9A37E0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD22A10E8C2;
	Fri, 18 Oct 2024 07:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb+4DM1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556B910E8C2;
 Fri, 18 Oct 2024 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729238313; x=1760774313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J5UaCnl2um78+GkdvyZcZr+5lYlej19u3Ua+JioeSQ8=;
 b=Pb+4DM1tvOBMuZfBeC7u6Z/ijbCIA3Ic27sY5heatwtG6Z6itUb1VAdY
 HoSva9wDQEYOCvaZXwjjkifCWIm7yzh9VQomD0xX8KFHqX6nAvRWfdK3y
 nCg+870g9oC2R+46VRH33ve2JuxvFk83S7ZFSTks87gPu4jGAIYG6rjYi
 W4terEFBA90EmCmmM8wC9vlzmYkQzpiBD7BjLIbrzEjPQe8Bf0hTfYnsb
 55aBeIZ9HWPcaaZuY2o/ODQFgr3cp7v2hMwvvNicAHHulRm7wanK1juWX
 OSjvxrHjCQHDSY5MEpKGpr5bpK0GNqGj6Pfvb8e2h7MH4oMo2O5087Fkc A==;
X-CSE-ConnectionGUID: 7C2PuLO2S5umkMIwcsjLcw==
X-CSE-MsgGUID: pHChXNXtRlq8XWFQUq5Z4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="54172300"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="54172300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:58:32 -0700
X-CSE-ConnectionGUID: 27H+ydSKREW58y95WQD/EQ==
X-CSE-MsgGUID: dFqPXo26Ql6JwQa4qlrVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="79218112"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 00:58:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:58:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:58:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 00:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4M615+tu09ii3Gpcbz/PoVnncCaNoFEO3nqQMaPeeIXHNOYruiP8fQU/WFTx3aryaZxSBdHZhlYDQta8HFhkpmLee+qPYB3Kk+DzZmigpdIdXR5uAWJzwJZkBFcugT53pWGTGkZFOQsxFae2UfHXN3x2yB2e1yw7C45oTmRsRHCwroBI/f9yrkZeKTiAlAi/E7G4W0p8JKYPSXNHbHkUVgREX9vXziRGd+Ij57T5mN3QSW4rQ4VLS0MXMO6s0HzS5pEG9fsWm4ILcZGBhRFCXo1QMGjVtWY3NI0QwhuwQW34n2tUD1yDVhEQ6ly4+9eHF0zFrJJmJwIaPp5Y3Olww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1vOlylog+8FzFavWPCAAbuvmZedhDl0CnxYiBJkJDs=;
 b=I7U+7gdO74ojDmlxYIXYBLymqzISDGl5t+Yr/Mi+RTxFOou9FXX4k8gWBT1A5v2GIgxWISSHaJoABZTNt2iBQvlElZaDR5mx/Hwn7ise3dTVzXozDKgUja2XbpY0yhNOVL2XOKXD1SXpkvqMuR339f67VSAdyDtS1ZOdBlIRe4OsyCaTkm64rT9kjDPUfZkDfAzoio4VXywwXhy/speSYlw4zosIwSsVd1UHiBC69ddxSu5ZT3xeVgRLmz4HzW3IiAQUyXaPYhXnEvLvC/BltZO9cnj/tMlncjeN8mr+HVzUdBt7iqqkT2qblMz+3wZOL9ZnQyDO1HpRqDfRjtZsfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7536.namprd11.prod.outlook.com (2603:10b6:806:320::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 07:58:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 07:58:28 +0000
Date: Fri, 18 Oct 2024 07:57:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxIU8plILbA+F1Cl@DUT025-TGLU.fm.intel.com>
References: <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
 <ZxGxr76OcW4bJ/Qi@DUT025-TGLU.fm.intel.com>
 <87zfn2lz6z.fsf@nvdebian.thelocal>
 <ZxILP39RTgPEgEPK@DUT025-TGLU.fm.intel.com>
 <87v7xpn9lh.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87v7xpn9lh.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ea8fc1-f75c-4221-f3fb-08dcef4aa69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hg9e4SHg/g2UqcZStVw91FRE8vfC+Wi5i/H84At4o3Wx8OZZHxgg0mTIm8ih?=
 =?us-ascii?Q?bwy6n7CewTAVxVrGAwfAqxepddnfuHwCGoZmcIVcfTl+MTIEKhS88SL0QaOE?=
 =?us-ascii?Q?PFWF2IFEEwnfoLbQ5JkeLgtWTf4pJsiMnYfUGJXORVBceJixrciutOqAnyRN?=
 =?us-ascii?Q?M6hLjrEZDg9t1QhIr21GO75UYcO4yhZZD/9t6zQoX59VWYNwPZVs0PbqS3Jh?=
 =?us-ascii?Q?s20n7/AOTzRHL/+ec1NbtkhCrLt7EDEq0otZbHF7s93wduPypWPB30eLgmD3?=
 =?us-ascii?Q?k3BhsGxCF82ghpRWRYQYpZWySL0mvBWlwPRQsu+WnWbDPiXINOkSmaBuV+mj?=
 =?us-ascii?Q?1lwd+XmI6PFpeDMJBnGieP3n5veADRftDdYvXFSBzuyKFgYhxQdH7SQhLbwh?=
 =?us-ascii?Q?waybAjUzfrMcaJc4Lkj56fysqkvc8iNlE2+0j4OtpnnsmNNsU41halEIIlAg?=
 =?us-ascii?Q?K9tGfVFvXiTRWvFLGTdL6LDVbJzM38X+S1wmSX3xzqfWA0He1H0WmVD5lkJ/?=
 =?us-ascii?Q?Jcyjbs8Ol5wYkWuKTAGNoIFHP64GVkGHXEVv4MlyEnlGIPfT2EIyHU8zSHUq?=
 =?us-ascii?Q?lWCRr50WbFvjjZjrZFxs/ntoC9Kz6HQFragxf9+s6v9OkZrVM1irAoHQAAR0?=
 =?us-ascii?Q?oAp+zKa8qNSt+E2n/9fWblm9KzLmnxu6zoLotc4s2oVC28UzqeWKRKNKyG/0?=
 =?us-ascii?Q?qW4HhGutFh2ClRN2itoo5GsCNOF0w2S39PlR7Y166UED5iibFVw43raivEy/?=
 =?us-ascii?Q?6YZrQqUKBT0oGrs5bVoBgdFqG8eyHKnxf+zh0iGeGo8wmGhAuIvuH1Dv81G1?=
 =?us-ascii?Q?gB7sDMfZJGpmFxDrecy+qGz16LDcT95yZRIFbusLB+kT7trf0SS0owzAPf6t?=
 =?us-ascii?Q?pyr/dENGaCXBi7beBc+QQZ/OGyeNa/br8lP1fe8KOWwU9YBoNddn1MB1lqF0?=
 =?us-ascii?Q?MX4I0ojDAnhI5y3BesfrfU8GuNS7YJnlO2wJIV1nPkFQYpDdOuf4u3o1+Ex6?=
 =?us-ascii?Q?7LQq8PmG4spBU5ABwNIJ1bjhKvFGKOdWF9o59TqXEQjQPTvoqx3hZbONtZDH?=
 =?us-ascii?Q?tjWjIv3T6+53NulN+a1WJxVYQVlDGYe2/VUmq3WGHVkQbB2F6d3erbTvg62i?=
 =?us-ascii?Q?FCCCbLj0cIH1PzDnIFPbhPwDlK7u8htU5pvfPnmpt7tOsqtW74sOBDuM+nhI?=
 =?us-ascii?Q?RAZgG5psBOopCv3PdckbRSz1p2XCavLMPYFt3YOrBS9xeLwvNv9WwFuffSbC?=
 =?us-ascii?Q?jDiZ+pZYWQ/aRJPYgDXIvNhEAUjogVcEuT7jNYeyXw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6legQgUQzzd39qP7WL+JYrSvhOIGw9twIVgNhgXpfWhh8RTuji6yuf4IdhF?=
 =?us-ascii?Q?znQVEFJvR//guq4pqL50GQCUtbtiwb239muxPDaADjk0Dqv+xmrE3XHW4Rac?=
 =?us-ascii?Q?aaEnqKPlmI7BHRUdhck9YTZ17wZ4XT5oZrwir69VSpdGu8ytrE1e06ualBJ9?=
 =?us-ascii?Q?WS+H4iFFYSgufvAL42XNwKqJTvWpfawVllRlR4xVJoN+w1q8I/0NWsHp0fQc?=
 =?us-ascii?Q?4+VfUOuLxrtYt4zgATIaoq01QWVoYJy7qznymFrCtfd9CyM5QRlHR9m0TdYn?=
 =?us-ascii?Q?fsHPKhC+54tMAmOLIcEmX/WllaLrcySgbP8SFpOt/rQOj6ytLne5Lx6I625j?=
 =?us-ascii?Q?EVmbE7PRvLiy50sCgKIE3moUNa/j4IcnbtGiPY6xpiXsCzw+wfVT0ts20MZS?=
 =?us-ascii?Q?MlmOMRNLDX7X6hIL0x3AtG6mIKQ6E03IH7fylA0Lkffs6ZiG4bSBRNbSmn54?=
 =?us-ascii?Q?C52DOhQcuGmBtZbyEWc1i1ZxVd88Ubp3M/MKssISj/7ONRBBBZTKY9EMKS9M?=
 =?us-ascii?Q?EAqlmiIo7BX6cJr2xrrHjqYFfMnecbRJbd8TVLggJYh2enQlU/oGZ87atl8m?=
 =?us-ascii?Q?7cJc3gWaX/6T9ctfHnkefK4+0OreGOyRVtzg35s6EPR8qo2hsB4wuN94lbXf?=
 =?us-ascii?Q?u4q6OluZoa/6/BqkzmjVV9Rfkg5EDJYzwMZNse8u6u7ZETh73KTMwpHClCmM?=
 =?us-ascii?Q?E64+IIoXwqhXbWz67xmOG4lp4xkTNwP/6lc1hMxJqTcVm4e/q6FtnkBeja3p?=
 =?us-ascii?Q?AofJ/Tae6EVFE66w3ZxIJTSENuxQthylhNXMJUazCbG98DMQzPZS3eq77Yq8?=
 =?us-ascii?Q?LZ22v1axCHNO5nYW3Y4Tk0hEdkwQtINiONeORSjfs5mHldakX4r3zMT7y4gT?=
 =?us-ascii?Q?33xSYI2QF+oIto+pg9qk4rsLOfzoZ0KocuzvV+ONAK1GR0+LstiGyekDsxeZ?=
 =?us-ascii?Q?3uXdEqQqtQkDSd5HYTvnJQND+VmbnFQsFM/LPRndOzXQIcx24S2DiEkmt9xi?=
 =?us-ascii?Q?n6ne7PIbTZ5XPyVzexM4U/oGFgKAvPPlwS8gLVIQIU/ODP5B/GSrFbs4PGSK?=
 =?us-ascii?Q?7bTKSBmLjAl+Bc0/+ZfQvnbZTMxYk09GL7tsEDP50auy+PXeZwkwlET/QMwK?=
 =?us-ascii?Q?TEZafTyG6503B9sMW20m2K84gdQ4Lgxo4JnpduN1SwGt+o3Cla0rEyvA/9O8?=
 =?us-ascii?Q?Av08+dEfYr1JfGd3Y1V0gsXh/hWgu3N2QOlepIIuSCzWVXEvRsAVudXldxlH?=
 =?us-ascii?Q?G6N4N6zrk5zYrzO7ciWCOF1xsCphGPyhVTall3G7jfByJNUr8XaB02Lg5Uyr?=
 =?us-ascii?Q?sCNdqE29T4tZIy+1hlvgp16AWrPQOIuRwjEOWUQLwoZkXSnroJLSl2Q2ps4e?=
 =?us-ascii?Q?684y6x5qq/2IJUieRXCF1cg4WzhgVA/+QcsqTg3xctF8DQX0LFqvigLYxoiT?=
 =?us-ascii?Q?gJFZ6nigWgL3J6upGZHqCErypABYABIWgoSo7YDBYQtBKXo7eb2A5mJsvdlg?=
 =?us-ascii?Q?snFCa9FNVnnPUJThfOFue0DF095g4FMRVH3UtE+2EIgYzFgO7o5cl7KMQ+SY?=
 =?us-ascii?Q?3aDw2YPdXDC7S30Wd3VfAp4bH+HTfMeF7VGkolVw2pEs8jUYdFBnHhMHOb9F?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ea8fc1-f75c-4221-f3fb-08dcef4aa69e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:58:28.3123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+Qp0SI6Om435n+in/AT/c+WAgVdhRexq6qvPdxS39NaosuaDaUdTC3zV+xh1oS+oi5VBAHL2O1UaQYWC/uY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7536
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

On Fri, Oct 18, 2024 at 06:34:13PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Fri, Oct 18, 2024 at 04:59:05PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Fri, Oct 18, 2024 at 08:58:02AM +1100, Alistair Popple wrote:
> >> >> 
> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> 
> >> >> > On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
> >> >> >> 
> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> 
> >> >> >> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> >> >> >> >> 
> >> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> >> 
> >> >> >> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> >> >> >> >> >> 
> >> >> >> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> >> >> >> 
> >> >> >> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> >> >> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> >> >> >> >> >> 
> >> >> >> >> >> [...]
> >> >> >> >> >> 
> >> >> >> >> >> >> > > +{
> >> >> >> >> >> >> > > +	unsigned long i;
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +	for (i = 0; i < npages; i++) {
> >> >> >> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +		if (!get_page_unless_zero(page)) {
> >> >> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> >> >> > > +			continue;
> >> >> >> >> >> >> > > +		}
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +		if (!trylock_page(page)) {
> >> >> >> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> >> >> >> > > +			put_page(page);
> >> >> >> >> >> >> > > +			continue;
> >> >> >> >> >> >> > > +		}
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> >> >> >> >> >> > 
> >> >> >> >> >> >> > This needs to be converted to use a folio like
> >> >> >> >> >> >> > migrate_device_range(). But more importantly this should be split out as
> >> >> >> >> >> >> > a function that both migrate_device_range() and this function can call
> >> >> >> >> >> >> > given this bit is identical.
> >> >> >> >> >> >> > 
> >> >> >> >> >> >> 
> >> >> >> >> >> >> Missed the folio conversion and agree a helper shared between this
> >> >> >> >> >> >> function and migrate_device_range would be a good idea. Let add that.
> >> >> >> >> >> >> 
> >> >> >> >> >> >
> >> >> >> >> >> > Alistair,
> >> >> >> >> >> >
> >> >> >> >> >> > Ok, I think now I want to go slightly different direction here to give
> >> >> >> >> >> > GPUSVM a bit more control over several eviction scenarios.
> >> >> >> >> >> >
> >> >> >> >> >> > What if I exported the helper discussed above, e.g.,
> >> >> >> >> >> >
> >> >> >> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >> >> >> >> >> >  906 {
> >> >> >> >> >> >  907         struct folio *folio;
> >> >> >> >> >> >  908
> >> >> >> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >> >> >> >> >> >  910         if (!folio)
> >> >> >> >> >> >  911                 return 0;
> >> >> >> >> >> >  912
> >> >> >> >> >> >  913         if (!folio_trylock(folio)) {
> >> >> >> >> >> >  914                 folio_put(folio);
> >> >> >> >> >> >  915                 return 0;
> >> >> >> >> >> >  916         }
> >> >> >> >> >> >  917
> >> >> >> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >> >> >> >> >> >  919 }
> >> >> >> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >> >> >> >> >> >
> >> >> >> >> >> > And then also export migrate_device_unmap.
> >> >> >> >> >> >
> >> >> >> >> >> > The usage here would be let a driver collect the device pages in virtual
> >> >> >> >> >> > address range via hmm_range_fault, lock device pages under notifier
> >> >> >> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
> >> >> >> >> >> > migrate_device_unmap.
> >> >> >> >> >> 
> >> >> >> >> >> I'm still working through this series but that seems a bit dubious, the
> >> >> >> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
> >> >> >> >> >> would help me a lot in understanding what you're suggesting.
> >> >> >> >> >>
> >> >> >> >> >
> >> >> >> >> > For sure locking in tricky, my mistake on not working through this
> >> >> >> >> > before sending out the next rev but it came to mind after sending +
> >> >> >> >> > regarding some late feedback from Thomas about using hmm for eviction
> >> >> >> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
> >> >> >> >> > doesn't work for coherent pages, while something like below does.
> >> >> >> >> >
> >> >> >> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> >> >> >> >> >
> >> >> >> >> > Here is a snippet I have locally which seems to work.
> >> >> >> >> >
> >> >> >> >> > 2024 retry:
> >> >> >> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> >> >> > 2026         hmm_range.hmm_pfns = src;
> >> >> >> >> > 2027
> >> >> >> >> > 2028         while (true) {
> >> >> >> >> > 2029                 mmap_read_lock(mm);
> >> >> >> >> > 2030                 err = hmm_range_fault(&hmm_range);
> >> >> >> >> > 2031                 mmap_read_unlock(mm);
> >> >> >> >> > 2032                 if (err == -EBUSY) {
> >> >> >> >> > 2033                         if (time_after(jiffies, timeout))
> >> >> >> >> > 2034                                 break;
> >> >> >> >> > 2035
> >> >> >> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> >> >> >> > 2037                         continue;
> >> >> >> >> > 2038                 }
> >> >> >> >> > 2039                 break;
> >> >> >> >> > 2040         }
> >> >> >> >> > 2041         if (err)
> >> >> >> >> > 2042                 goto err_put;
> >> >> >> >> > 2043
> >> >> >> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> >> >> >> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> >> >> >> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> >> >> >> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
> >> >> >> >> > 2048                 goto retry;
> >> >> >> >> > 2049         }
> >> >> >> >> > 2050         for (i = 0; i < npages; ++i) {
> >> >> >> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> >> >> >> >> > 2052
> >> >> >> >> > 2053                 if (page && (is_device_private_page(page) ||
> >> >> >> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> >> >> >> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> >> >> >> >> > 2056                 else
> >> >> >> >> > 2057                         src[i] = 0;
> >> >> >> >> > 2058                 if (src[i])
> >> >> >> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> >> >> >> >> > 2060         }
> >> >> >> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> >> >> >> >> 
> >> >> >> >> Practically for eviction isn't this much the same as calling
> >> >> >> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
> >> >> >> >> probably shouldn't be looking at mm/vma structs.
> >> >> >> >> 
> >> >> >> >
> >> >> >> > hmm_range_fault is just collecting the pages, internally I suppose it
> >> >> >> > does look at a VMA (struct vm_area_struct) but I think the point is
> >> >> >> > drivers should not be looking at VMA here.
> >> >> >> 
> >> >> >> migrate_vma_setup() is designed to be called by drivers and needs a vma,
> >> >> >> so in general I don't see a problem with drivers looking up vma's. The
> >> >> >> problem arises specifically for eviction and whether or not that happens
> >> >> >> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
> >> >> >> issues there (see below).
> >> >> >> 
> >> >> >
> >> >> > Ok, if you think it ok for drivers to lookup the VMA then purposed
> >> >> > exporting of migrate_device_pfn_lock & migrate_device_unmap is not
> >> >> > needed, rather just the original function exported in the this patch.
> >> >> >
> >> >> > More below too.
> >> >> >
> >> >> >> >> > 2063         migrate_device_unmap(src, npages, NULL);
> >> >> >> >> > ...
> >> >> >> >> > 2101         migrate_device_pages(src, dst, npages);
> >> >> >> >> > 2102         migrate_device_finalize(src, dst, npages);
> >> >> >> >> >
> >> >> >> >> >
> >> >> >> >> >> > Sima has strongly suggested avoiding a CPUVMA
> >> >> >> >> >> > lookup during eviction cases and this would let me fixup
> >> >> >> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
> >> >> >> >> >> 
> >> >> >> >> >> That sounds reasonable but for context do you have a link to the
> >> >> >> >> >> comments/discussion on this? I couldn't readily find it, but I may have
> >> >> >> >> >> just missed it.
> >> >> >> >> >> 
> >> >> >> >> >
> >> >> >> >> > See in [4], search for '2. eviction' comment from sima.
> >> >> >> >> 
> >> >> >> >> Thanks for pointing that out. For reference here's Sima's comment:
> >> >> >> >> 
> >> >> >> >> > 2. eviction
> >> >> >> >> > 
> >> >> >> >> > Requirements much like migrate_to_ram, because otherwise we break the
> >> >> >> >> > migration gurantee:
> >> >> >> >> > 
> >> >> >> >> > - Only looking at physical memory datastructures and locks, no looking at
> >> >> >> >> >   mm/vma structs or relying on those being locked. We rely entirely on
> >> >> >> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >> >> >> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> >> >> >> >>
> >> >> >> >> I also very much agree with this. That's basically why I added
> >> >> >> >> migrate_device_range(), so that we can forcibly evict pages when the
> >> >> >> >> driver needs them freed (eg. driver unload, low memory, etc.). In
> >> >> >> >> general it is impossible to guarantee eviction og all pages using just
> >> >> >> >> hmm_range_fault().
> >> >> >> >> 
> >> >> >> >
> >> >> >> > In this code path we don't have device pages available, hence the
> >> >> >> > purposed collection via hmm_range_fault.
> >> >> >> 
> >> >> >> Why don't you have the pfns requiring eviction available? I need to read
> >> >> >> this series in more depth, but generally hmm_range_fault() can't
> >> >> >> gurantee you will find every device page.
> >> >> >> 
> >> >> >
> >> >> > There are two cases for eviction in my series:
> >> >> >
> >> >> > 1. TTM decides it needs to move memory. This calls
> >> >> > drm_gpusvm_evict_to_ram. In this case the device pfns are available
> >> >> > directly from drm_gpusvm_devmem so the migrate_device_* calls be used
> >> >> > here albiet with the new function added in this patch as device pfns may
> >> >> > be non-contiguous.
> >> >> 
> >> >> That makes sense and is generally what I think of when I'm thinking of
> >> >> eviction. The new function makes sense too - migrate_device_range() was
> >> >> primarily introduced to allow a driver to evict all device-private pages
> >> >> from a GPU so didn't consider non-contiguous cases, etc.
> >> >> 
> >> >> > 2. An inconsistent state for VA range occurs (mixed system and device pages,
> >> >> > partial unmap of a range, etc...). Here we want to evict the range ram
> >> >> > to make the state consistent. No device pages are available due to an
> >> >> > intentional disconnect between a virtual range and physical
> >> >> > drm_gpusvm_devmem, thus the device pages have to be looked up. This the
> >> >> > function drm_gpusvm_range_evict. Based on what you tell me, it likely is
> >> >> > fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
> >> >> > using hmm_range_fault like I have suggested here.
> >> >> 
> >> >> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
> >> >> fine for this usage and is exactly what you want - it was designed to
> >> >> either select all the system memory pages or device-private pages within
> >> >> a VA range and migrate them.
> >> >> 
> >> >> FWIW I have toyed with the idea of a combined
> >> >> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
> >> >> migrate_vma_*() process but haven't come up with something nice as
> >> >> yet. I don't think mixing the two in an open-coded fashion is a good
> >> >> idea though, I'd rather we come up with a new API that addresses the
> >> >> short-comings of migrate_vma_setup().
> >> >> 
> >> >
> >> > I think that would good. Here we actually need to lookup multiple VMAs
> >> > and have a sequence of migrate_vma_* calls as it possible for VMAs to
> >> > have changed after the driver range was created. It might be nice to
> >> > hide the VMA lookup from the drivers with an API saying collect and
> >> > migrate all pages of a type in a VA range much like hmm_range_fault. If
> >> > the range spans multiple VMAs that would be hidden from the caller.
> >> 
> >> Ok. I wasn't really considering multiple VMAs. UVM and Nouveau don't
> >> really have a requirement to migrate across multiple VMAs but if that's
> >> neccessary I think an API that hides that specifically for working with
> >> migrate_vma_*() might make sense.
> >> 
> >
> > We can run into multiple VMA scenarios if a user does something rude
> > like this:
> 
> fork and mremap were the other "rude" things we've had fun with. They
> basically mean you can get references to device pages which a driver
> can't track with virtual addresses.
> 

Yes, I've tested those two and are fun as well. But both are COW which
hasn't turned out to be too difficult.

> > mmap	0x000000...0x1fffff -> fault migrates 2M to VRAM and creates an internal range to track
> > munmap	0x080000...0x17ffff -> now we have two VMAs instead of one and the range has a hole in it
> >
> > In this scenario, which we believe to rare / unsual, we just evict
> > remaining VRAM pages to SRAM, destroy range, and fixup on next GPU
> > fault.
> >
> >> > Matt
> >> >
> >> >> > Note #2 may be removed or unnecessary at some point if we decide to add
> >> >> > support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
> >> >> > now though. See 'Ranges with mixed system and device pages' in [5].
> >> 
> >> As someone not very familiar with some of the DRM layers can I ask why
> >> having virtual address ranges with a mix of system and device pages is
> >> hard to support? It seems to me that in practice it might be quite
> >> difficult to keep a VMA range as exclusively all in system memory or all
> >> in device memory.
> >>
> >
> > A few things that make this difficult are:
> >
> > - Our (Xe) bind code would need to be updated to support this
> > - TTM / DRM buddy allocator doesn't support freeing / reallocation of
> >   individual pages rather aligned chunks of initial allocation size
> >   (e.g., 2M would be common allocation size).
> > - Spliting ranges would add complications
> >
> > All workable problems but since we are writing a new common
> > implementation trying to keep it as simple as possible for initial merge
> > of the design. Almost certainly at some point we will add support for
> > mixed ranges to the common GPU SVM layer with a driver choosing if it
> > wants mixed or non-mixed ranges via a flag to function calls.
> >
> > wrt to being difficult keeping exclusively in system or vram, in
> > addition to the above case the only other case I have found in which
> > this occurs is CPU and GPU faults to same address range racing. This can
> > cause hmm_range_fault to grab a set mixed pages. In this case again we
> > do an eviction remaining page and restart the GPU fault.
> >
> > I don't have real workloads yet but I do have a very aggressive test
> > case that intentionally does things which could break the design in a
> > highly parallel manner and the design as work. Is it ideal? Maybe not.
> > But getting in a simple design which we can build upon is the current
> > goal.
> 
> Taking a simple approach first definitely sounds lie the right approach
> to me. I was just interested in the background because it wasn't
> something I'd run into (though we built on top of something quite
> different to the DRM layer). But I have often thought that the
> interfaces we have between core mm and GPU drivers is still a bit too
> low level at the moment and is calling out for a slightly higher level
> common implementation in the middle so am very interested to see where
> this all goes. Thanks.

The idea is build something common which other DRM drivers can use or
perhaps even pull out of the DRM layer eventually into a common device
layer for SVM.

Matt

> 
>  - Alistair
> 
> > Matt
> >
> >> >> > [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
> >> >> >
> >> >> >> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> >> >> >> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> >> >> >> >> >
> >> >> >> >> >> > It would also make the function exported in this patch unnecessary too
> >> >> >> >> >> > as non-contiguous pfns can be setup on driver side via
> >> >> >> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> >> >> >> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> >> >> >> >> >> > in [1].
> >> >> >> >> >> >
> >> >> >> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
> >> >> >> >> >> > migrate_device_unmap?
> >> >> >> >> >> 
> >> >> >> >> >> If there is a good justification for it I can't see a problem with
> >> >> >> >> >> exporting it. That said I don't really understand why you would
> >> >> >> >> >> want/need to split those steps up but I'll wait to see the code.
> >> >> >> >> >>
> >> >> >> >> >
> >> >> >> >> > It is so the device pages returned from hmm_range_fault, which are only
> >> >> >> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
> >> >> >> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> >> >> >> >> > MMU invalidation which takes the notifier lock thus calling the function
> >> >> >> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> >> >> >> >> >
> >> >> >> >> > I think this flow makes sense and agree in general this likely better
> >> >> >> >> > than looking at a CPUVMA.
> >> >> >> >> 
> >> >> >> >> I'm still a bit confused about what is better with this flow if you are
> >> >> >> >> still calling hmm_range_fault(). How is it better than just calling
> >> >> >> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
> >> >> >> >
> >> >> >> > The code in rev2 calls migrate_vma_setup but the requires a struct
> >> >> >> > vm_area_struct argument whereas hmm_range_fault does not.
> >> >> >> 
> >> >> >> I'm not sure that's a good enough justfication because the problem isn't
> >> >> >> whether you're looking up vma's in driver code or mm code. The problem
> >> >> >> is you are looking up vma's at all and all that goes with that (mainly
> >> >> >> taking mmap lock, etc.)
> >> >> >> 
> >> >> >> And for eviction hmm_range_fault() won't even find all the pages because
> >> >> >> their virtual address may have changed - consider what happens in cases
> >> >> >> of mremap(), fork(), etc. So eviction really needs physical pages
> >> >> >> (pfn's), not virtual addresses.
> >> >> >>
> >> >> >
> >> >> > See above, #1 yes we use a physical pages. For #2 it is about making the
> >> >> > state consistent within a virtual address range.
> >> >> 
> >> >> Yep, makes sense now. For migration of physical pages you want
> >> >> migrate_device_*, virtual address ranges want migrate_vma_*
> >> >> 
> >> >>  - Alistair
> >> >> 
> >> >> > Matt
> >> >> >  
> >> >> >> >> we're talking about eviction here so I don't understand why that would
> >> >> >> >> be relevant. And hmm_range_fault() still requires the VMA, although I
> >> >> >> >> need to look at the patches more closely, probably CPUVMA is a DRM
> >> >> >> >
> >> >> >> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
> >> >> >> > as argument. This is about avoiding a driver side lookup of the VMA.
> >> >> >> >
> >> >> >> > CPUVMA == struct vm_area_struct in this email.
> >> >> >> 
> >> >> >> Thanks for the clarification.
> >> >> >> 
> >> >> >>  - Alistair
> >> >> >> 
> >> >> >> > Matt
> >> >> >> >
> >> >> >> >> specific concept?
> >> >> >> >> 
> >> >> >> >> Thanks.
> >> >> >> >> 
> >> >> >> >>  - Alistair
> >> >> >> >> 
> >> >> >> >> > Matt
> >> >> >> >> >  
> >> >> >> >> >>  - Alistair
> >> >> >> >> >> 
> >> >> >> >> >> > Matt
> >> >> >> >> >> >
> >> >> >> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >> >> >> >> >> >
> >> >> >> >> >> >> Matt
> >> >> >> >> >> >> 
> >> >> >> >> >> >> > > +	}
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > > +	return 0;
> >> >> >> >> >> >> > > +}
> >> >> >> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> >> >> >> >> >> > > +
> >> >> >> >> >> >> > >  /*
> >> >> >> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> >> >> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> >> >> >> >> >> > 
> >> >> >> >> >> 
> >> >> >> >> 
> >> >> >> 
> >> >> 
> >> 
> 
