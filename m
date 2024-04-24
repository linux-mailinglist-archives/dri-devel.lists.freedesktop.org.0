Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA0A8B0FF4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD3810F857;
	Wed, 24 Apr 2024 16:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsYGNRvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36D10F857;
 Wed, 24 Apr 2024 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713976529; x=1745512529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AWv4QIynspPAjKTEAAm/je+jibUz1Mamk5ZH3cKFLWE=;
 b=YsYGNRvTlZnUgjbc/DLkSM1k6XUDpS6BO/rbyB7glAVsTV3VwC2C3zLx
 6sn+XrWI8oJGrIuZcOIXShGVSbIS7OMldylrnfeW0QpdEbOB7Z/W/vgsu
 LlhzyfGxgOmGN5XJX0IPxJN9Coo+rOIWoJzV+pWvdjHG7/IFLlBO+sxn+
 TBnGKS/mg1JiV7c/OcCIAap66knbgmMiInKuNuw5Mz5U0EAxPbxV7vsov
 DBzlfzV6tT/QK1NTESl+3nY7pC2iTxeoOw7gHwlrMpIZXMUZFylSLDtei
 5t88fYOHsiF1xlmANIxm3lI6cTuNqR61hN69jmxHGuADcQbgVm9Om3jLK A==;
X-CSE-ConnectionGUID: /7+rBEt9SmuSOdr5xlsXEw==
X-CSE-MsgGUID: 8AAb0ZJ7Sci/pyMfldPLWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20170489"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="20170489"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:35:28 -0700
X-CSE-ConnectionGUID: XoV9n5PWTM6iSgoDxn3n3w==
X-CSE-MsgGUID: 61Oq/x83SxSjpQO9MR1sYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29571257"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 09:35:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 09:35:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 09:35:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 09:35:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 09:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr385CJJsd6dfPyiFjUjcU2YY/N7dGjQWYF/5jTH8afq18agq1x86Ubw/R0L3NFzZptRd6dBMf4mWKxXzkIooX2ooqaZeOPcdN/V87eLV86IFfkd+LMAkIaiWm5UurnkB5bmZ7SshogBpz39Qa+rPnydxhOGjKHqnnOZK7gPOew1m0wWw8Yf6DVhWW3mKt1iuFPTx4gBgYU1G4SrtniLId5ZQu1LeeSaWw4s2y4/hfY1JfC5KKO0+jslREn9A50Y97XCtTQI6y4ouY87kczBogY6QmdMhpQ5UNDqPQyB0kZO/47NredXdfY3HfgBIBuYgG6QtEZFKL9J+vmCTyxhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zxAWUfxjeomzW+bzUHFnN2jq/X4MrnGaA6zaRqZDIw=;
 b=V8/H4V2yPgw4sgdA7T4H5givK+zqPCMl+xPqqtqcpOr4QMIuOj4kkDQyE8IVrl0V1Gg4wfozXnTYStXxTM3ysEXsRdSITMTXOBFx7gfWG1I2Om5axJ6m953Nk/6IqrFog+ZBh20qV4t3L3ohny1O8NyW9eIqLrJPDUIZPt4BRMmm5/yTliVSKvusmhyNsfddm4zG85v3OTjmSoADcIhY4CYkpGtWHGerxyW7ENhfh6W6ktbEVAz6VA7FqpWp0AHkoZuK2d0xiHBc1xExIArhGFK4pmFT26fUmydih+oZaLARhsTgRUhJJLfXDHOUeqNHlvsLLY+bw8x0wjbHIgHnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 24 Apr
 2024 16:35:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 16:35:25 +0000
Date: Wed, 24 Apr 2024 16:35:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Zeng, Oak" <oak.zeng@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <Zik0xY55VBXbgJxs@DUT025-TGLU.fm.intel.com>
References: <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
 <20240424135754.GK941030@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424135754.GK941030@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: e35ca6d3-fad6-46ab-0392-08dc647c8abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XfqWzzwusq7xEljBvVzMD5FMhEj4w2UC1OMpimC45JKe3UfqpvCK7XFyGKMm?=
 =?us-ascii?Q?iEn+smBrH15qD2KDKzwus6Tx6ZuKsOOn1OXo3p3SecpDOZg3fwR8b0cZkFt/?=
 =?us-ascii?Q?NsN3thb1hMOvBBjSIHZuAxe7C9lpjkhHmzz9v4cWEGE7MSAimLaW+qnl4hbn?=
 =?us-ascii?Q?XhuAabf4L9uLu25kMDLOG1icagUNXWZZUs8EUlZtUCgWAdLUole0SAfwM3al?=
 =?us-ascii?Q?upgrOE+NLF4h6ifgud6ER9yq9bNCM+C/A1qh1iyZ7x9tU/0HtGA1D6UM6mlz?=
 =?us-ascii?Q?RJQBtx5HeACMdEx1H5uEvTlGT54oqJwONkELjrnxvqzzjnxyjAjAbyjHmXDE?=
 =?us-ascii?Q?mCvvUbE0ROcNeTuyo6u8dGwyUUdr1tpjQzpB4OCYGk/fAy8Jn4GPTi9RTVPy?=
 =?us-ascii?Q?RYWmzLPtTE7syg/ZSIhR04vtpljlDJN/245pmkMjrMcHY5fY2c+CRvwy7d5k?=
 =?us-ascii?Q?8FgGhF0b95/oEyWuODlvM6gz3anpUtop+3CKQ0fzwqkBccr7lygZ3wNZGF+I?=
 =?us-ascii?Q?SngMz+/D3NL4OrkW7k8ONee8huBkBUzfUVZuHvZ38PKUJ8NCBSHo8j8KsRSR?=
 =?us-ascii?Q?cSZhcfGuC6cIDXYaOrCBSrl30Vn39KChh8R+6InkpikZ0azNX5OLV3scE4bH?=
 =?us-ascii?Q?x8qszRfT+Djlmqu+AKIovajdMplQvBa3u8ESAooTbQrId/Zuj4K7cq5j9koD?=
 =?us-ascii?Q?TFts4aLBbS30YanUZkjqN91hqlOnv81qEelxyMM6RKInDO57N3ARwcbZvk+Z?=
 =?us-ascii?Q?to9zlOmhjRCP3+U7AkTx27FTKRS1J0EfkWr2wg774V6FXtqE0s617QoP5zzV?=
 =?us-ascii?Q?Em5y5b41wfONBmzuNuHuX8UEfURNGbb1R0O714hX/W5cWCWMaTvJ/dJa4Gbg?=
 =?us-ascii?Q?JGTiKY8RW2mxs97iwYoqTuYdEAmNhVL1U4YaDQ3JEPn2v6iaPDCD1TH+qiE8?=
 =?us-ascii?Q?6r3o+RpC4IZpXFA1/F0gx3rgSVhV+1pKgROCo2oTyvdMZNj4j68C0VufBUMi?=
 =?us-ascii?Q?aZvGGN/HsmH12w5j6Tgg8oXvEoRFJ37yYWOPieGUv7QVlgFpyzqBIbVaBzPh?=
 =?us-ascii?Q?mEqH+Q7bKUFUN2L/9ihI1/u+k+woNwFHzQZsUzzWrSSELYGLbucns0935Xpe?=
 =?us-ascii?Q?Rth+YgHn9r0M8IhNXPIRcjV4j0XuiI2kTmgaYZs1d3zmcS2Noez7aQGlkY1L?=
 =?us-ascii?Q?OJ8LyZLRbO7CIBkcWQBoV1CdCtsmB3HCE4uTX/yjZceDkt6Tyss/CCop4Gmb?=
 =?us-ascii?Q?RLWRRUkjhQuu1hiFvizOvypchXFGJS099jmX8kHMsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e59GQE5VzJOdKPzEZRA8BvNQ94xM7PVIEUDWh9SxsFetJ0v3y3nCLLBpEwNe?=
 =?us-ascii?Q?tBaYUmop70lcfABg/26RgM7xiW+DeyVf2ZxvMc/hUovSua72xYsg6ZbCKTgp?=
 =?us-ascii?Q?JqoZ+NcfUKvUut8HRTZXMOF/7UthyEjcWlYAVRFHDZiQ+RsFJHCVjgPpSNmp?=
 =?us-ascii?Q?6epM36aNYjsc+tSWPUzE7gGQBKTKh2eSAzRhWI1dxM3OZ6b8+eccin+T3TkQ?=
 =?us-ascii?Q?rAfYTLzQHBIc5ZVE3Y4OwpxV4D146c4gvvOotv8+wkLVV6Vz0YiZ2HODEd5v?=
 =?us-ascii?Q?uvjXMUWwtnAtWR5m8s+EZUvs6GcizD+rJ7exuIe81Wvrfpbx7uma2REsjZ0D?=
 =?us-ascii?Q?+ZYUpHHIIezvfN5fj2Mw4MtXdXcu/a8ur9UP8fHTa0upT/EFwqt7aCU3lexS?=
 =?us-ascii?Q?X3QsKGqLLeAIOYLCntzmCC2s5fUdKxGIuWWjU6+kKCFqvRAEZGJQpE9qUueX?=
 =?us-ascii?Q?5w3Qb6NPn/1eIdDYS88Rtyb7g793AGqueVwT9TQ2ja0EIvEDjMP0+LihCwtX?=
 =?us-ascii?Q?1SXT6qVh49Q7PtnBVtjbO6TKDkMQsH1IOpZAajWrEqj9aFdX4pXt0j2W5cUj?=
 =?us-ascii?Q?J8lz3uD8ZGORwWaOSLGKxOm0QOoQOYT1L739Mqaz5AIZVNptF/t168vrpGQ+?=
 =?us-ascii?Q?FTLGu1nZW/91HjUtxp4a68s7UngGJpMPJb3Ow+ZAnzKhFRK8ZyMTOr8FgR/g?=
 =?us-ascii?Q?N53rhwje9GhC8o0tqu/4BkFBWzreT/7Oukt3GCjdfIgtUYU47s4T+OolO2Ds?=
 =?us-ascii?Q?j7531EFb1l7I8aAY+MA2vIsm8JP8JUDTVNNPzdiecgO9PeMnnCMy5FPs5Ytp?=
 =?us-ascii?Q?8LKOO7mFDoeZmvuHX6cj12sso377T/mm/c1lh4XZv4AYUpRO55GRAgYl7CIW?=
 =?us-ascii?Q?81KadCia4cs1nQSvW69IZyig5Mh0n2JIvhNwkG/fIPy4j2zpElK7BXxzVdHD?=
 =?us-ascii?Q?AOiQ2Mh6hExsJ/YNXMYn+xgE9+tyVlXBZYw9kM57QgUhNwPIcROu0JE2J81I?=
 =?us-ascii?Q?3UXigwI2el6+ajcBFhwUmzjJ+rURjuSu8UwKCxdV3jmIIO+d+7XW9jrksWLj?=
 =?us-ascii?Q?jbs1G1Vg+/yI5GMSBjRrflNMzv+JlZuoniMgNEGbVXhhTMV6kl+CB4J1rw32?=
 =?us-ascii?Q?PpY+/9yoKwlRtD0tnaXakc2yr+l7FQ0MhPhMT1pWM05mYfBckObVHKnMzdDo?=
 =?us-ascii?Q?3B/Oz2aN6VCSa05R4dRnn8dKc83zjDPJ0F9IR5c6DGZhXlcNce+dyduJNMAl?=
 =?us-ascii?Q?EiQ7wYfoDz5YlA+Vca2ahrc3bQI1UqPVLxQ8AVwDDnP6i5MjjTmuMyqbLk5U?=
 =?us-ascii?Q?0I+7zOy2d3vhfVQW+1eXhWA5gAdK7d89k7rwDubqi2/Fmgwipaoj2rn0VOU3?=
 =?us-ascii?Q?hb0SqzqF4HzS6HqTZ7RPkwsrsM+noqZLhJ31usj+vf6cfApIEizUYqriuCh2?=
 =?us-ascii?Q?f1wBYGfGaqTRhOVlCwYxfhRINRwnKURwjtzVaS6Gf+Rz8xBft3sZWk1Bzpdq?=
 =?us-ascii?Q?Tk4ef5QiLGm6hNDmbUWH21MaEN/2F10hTjNeWdgEU+kgekNyrpucIBzLlevB?=
 =?us-ascii?Q?qOx0Rl7GMbHP7mRiGgydEPZlfgDa7QZlrN66oyMpl9FmsIx4AuPsbRdqjpev?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e35ca6d3-fad6-46ab-0392-08dc647c8abd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:35:24.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxwtZ0NlqoIiTw0OjRejPsz9BljLiTR5qSrpulH+Uvg/ov1wp5GcmsRoU93OPB6bMFcIFkR6+ApCLjdUGtfxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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

On Wed, Apr 24, 2024 at 10:57:54AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 24, 2024 at 02:31:36AM +0000, Matthew Brost wrote:
> 
> > AMD seems to register notifiers on demand for parts of the address space
> > [1], I think Nvidia's open source driver does this too (can look this up
> > if needed). We (Intel) also do this in Xe and the i915 for userptrs
> > (explictly binding a user address via IOCTL) too and it seems to work
> > quite well.
> 
> I always thought AMD's implementation of this stuff was bad..
> 

No comment on the quality of AMD's implementaion.

But in general the view among my team members that registering notifiers
on demand for sub ranges is an accepted practice. If we find the perf
for this is terrible, it would be fairly easy to switch to 1 large
notifier mirroring the CPU entire address space. This is a small design
detail IMO.

> > > > > > This is not what I'm talking about. The GPU VMA is bound to a specific
> > > > > > MM VA, it should not be created on demand.
> > > > >
> > > > > Today we have two places where we create gpu vma: 1) create gpu vma
> > > > > during a vm_bind ioctl 2) create gpu vma during a page fault of the
> > > > > system allocator range (this will be in v2 of this series).
> > > > 
> > > > Don't do 2.
> > 
> > You have to create something, actually 2 things, on a GPU page fault.
> > Something to track the page table state and something to track VRAM
> > memory allocation. Both AMD and Nvidia's open source driver do this.
> 
> VRAM memory allocation should be tracked by the mm side, under the
> covers of hmm_range_fault (or migration prior to invoke
> hmm_range_fault).
> 

Yes, the above step I describe is optionally done *before* calling hmm
range fault.

> VRAM memory allocation or management has nothing to do with SVA.
> 
> From there the only need is to copy hmm_range_fault results into GPU
> PTEs. You definately do not *need* some other data structure.
> 

You do not *need* some other data structure as you could always just
walk the page tables but in practice a data structure exists in a tree
of shorts with the key being a VA range. The data structure has meta
data about the mapping, all GPU drivers seem to have this. This data
structure, along with pages returned from hmm_range_fault, are used to
program the GPU PTEs.

Again the allocation of this data structure happens *before* calling
hmm_range_fault on first GPU fault within unmapped range.

> > > > > The reason is, we still need some gpu corresponding structure to
> > > > > match the cpu vm_area_struct.
> > > > 
> > > > Definately not.
> > > 
> > > See explanation above.
> > 
> > Agree GPU doesn't need to match vm_area_struct but the allocation must
> > be subset (or equal) to a vm_area_struct. Again other driver do this
> > too.
> 
> No, absolutely not. There can be no linking of CPU vma_area_struct to
> how a driver operates hmm_range_fault().
>

Agree. Once we are calling hmm_range_fault vma_area_struct is out of the
picture.

We also will never store a vma_area_struct in our driver, it is only
looked up on demand when required for migration.
 
> You probably need to do something like this for your migration logic,
> but that is seperate.
> 

Yes.

> > > > You call hmm_range_fault() and it does everything for you. A driver
> > > > should never touch CPU VMAs and must not be aware of them in any away.
> > 
> > struct vm_area_struct is an argument to the migrate_vma* functions [4], so
> > yes drivers need to be aware of CPU VMAs.
> 
> That is something else. If you want to mess with migration during your
> GPU fault path then fine that is some "migration module", but it
> should have NOTHING to do with how hmm_range_fault() is invoked or how
> the *SVA* flow operates.
>

Agree. hmm_range_fault is invoked in a opaque way whether backing store
is SRAM or VRAM and flows in a uniform way. The only difference is how we
resolve the hmm pfn to a value in the GPU page tables (device private
pages a device physical addresses, while CPU pages are dma mapped).

> You are mixing things up here, this thread is talking about
> hmm_range_fault() and SVA.
>

I figure there was a level of confusion in this thread. I think we are
now aligned?

Thanks for your time.
Matt

> migration is something that happens before doing the SVA mirroring
> flows.
> 
> Jason
