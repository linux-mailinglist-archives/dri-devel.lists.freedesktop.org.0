Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E45BC6BEB2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 23:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBE110E536;
	Tue, 18 Nov 2025 22:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhYBYL7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C334010E536;
 Tue, 18 Nov 2025 22:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763506796; x=1795042796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JlkWxPepb6J1oLPwacKE3/z0mGjLFFSUXYCRRHlutf0=;
 b=DhYBYL7XoAkUbssLNCVrULYZB5uUd8BC3+zO23XX9qtzycbZ94JVxuQ5
 KxvDzV3XN4pk9bgvGkKZZlNMLOiEZzF5AZf1YH/mkBP3auB83S26br9Ga
 ZgmMXi1r4Nie3TbeySGC2pdnMXXzFKCrtAf/qaGTNQuWdjXC8tZQvfSgV
 kgjrGFVhDQvM39G3j1jexnnnoM+CgEQmH0SS2cRxO/6bfoGZQFdqXltHi
 X3InBNGoKEev8BbOCzO35+Gkgqu+6wZ0k6vMNn4NB4Lnamr7YZxG7m7xI
 BJ3XqVtBEhDvsir4LPdCKIIzML6mVAjqZdr7C9WQ6XxBREEdYf4y/ymf4 Q==;
X-CSE-ConnectionGUID: vRmo/MYQQqWFwt8OoHGWXg==
X-CSE-MsgGUID: cq456P3nQxCeqOLykzSS2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65440503"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65440503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:59:55 -0800
X-CSE-ConnectionGUID: KQlOUJblShSVRZmFT2AzHA==
X-CSE-MsgGUID: dlHtH87oRFa2RDMsbGv4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190916983"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:59:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:59:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 14:59:54 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:59:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMfLrW7qIF4dO1pc9FKS6Cz7iM80ksC5EQ9/UgXvh27ANXvDbLXgEwk98dVbvzKBYYHu+0I7Nk2wFVbqcQHekkJ4pP9zMOOB4SaLIeWnInV+Ogj+u4hiNkrE9a9iWqB/Uaj+HmWN7YQkl+KEV25OMp1GCQc9QMazaOxWpUfm1vM1qtK+PTxbiafGmOlAAZaLJHx0gg9gZASWIZ7SG+eeaHvhHUI8AFqRI2s231TXiOhdaims6Q7lUc+ZsR9oSCzi8f1DpcI/B0xzc3fjH8TrPs0+atL9xOG8EHOlYLeX5N/QbTkh/UhoUOmCAjFEFMfH5yQ3Ob5h/H0LcjjwFgwJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BnCM3M7wXpwdpw4eX2zBSDKtZVpA9gC3CuuNRpQhUM=;
 b=zAaj893f/KanNq0vMZsWefCZvauLdkM9sr4ok2kKcebK/xwNAX62qcOsx0mRtuYzvUszJXLmqXGv5eVmnnm8Ssv35C7IaO+fpLhlKth0uUiEip9JZKYGNNe0UczC0Z/gjuedU6MQ7vNFag/LnRa8FVGmso6NkRvEMhZznGziqhb8VVX4ZdKIvCHFYFmecLS4g8WQny8JlRsZ98c/Q82qB12qzeswseuR9KdRLeCCGzgPICI6PkQWqlP1W8rIEpg+TF93zx115INo3iy85vsCOrlzV3tNrcyrxkkN0rMfooA3GV91uqTRYujWT34Ap6tjublK0783iDS01Wx+SNGUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 22:59:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 22:59:52 +0000
Date: Tue, 18 Nov 2025 14:59:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 5/7] drm/xe: Do not deregister queues in TDR
Message-ID: <aRz6ZaXcrv7pfeRS@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-6-matthew.brost@intel.com>
 <aRwVMM_RKyx1CKEI@nvishwa1-desk>
 <aRy0mFGX8sZ/CtDs@lstrano-desk.jf.intel.com>
 <aRzi1FH62llswW_C@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRzi1FH62llswW_C@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:303:b4::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: b838884b-a488-491b-2650-08de26f62eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6w6u5mPOZGHwqg5esssyhJdVfMa5ytW98aRM27vmY509e8lvqundm8zBzqeu?=
 =?us-ascii?Q?03C1gppMIXcbJosvvvA5iF6Fp06BVvq7mEYIy2hssMSa0msV+STm1hNKPWYH?=
 =?us-ascii?Q?eQWbjQSteuyqBFEpcYZD4ttuAZ1wRFBInAQX/OzQh34GNwgWoRbUGpybScIi?=
 =?us-ascii?Q?Wzfc31zx2PZYf7cjHdNCb63CraRB6XN/Ah2V3taPX6vCCh3nECDbnHyFpiSd?=
 =?us-ascii?Q?JssE2Hw8mO2Ej6qvu1sz8Cnp9QjbkLRWHNPR2Sd0dNtKPDG5dnwHRPG4gRyZ?=
 =?us-ascii?Q?rX+N14iXjzHFLei3uZrYWlfTZyRU9Pq6vWx3cQVNHC13wwRvSSWLM4d+z59s?=
 =?us-ascii?Q?1qpLrWmVryF5Gtb2YFXuWggoEaeQQh2nlPvvP01waSkiO4/U2eejE/1U4FIL?=
 =?us-ascii?Q?Ip5X63Oj4mk/QwA14tzBgOn5UTnzEWIhLkllIN0xk8WyOcK5jBJHDVVuGUKi?=
 =?us-ascii?Q?o3WewU3w8MYyJ9fRXLgbPIKgtwWh+cIwfWnMevUaI0BdAUlbJ83KrqiQ2ZeB?=
 =?us-ascii?Q?9zQWAGFLPCcBa/CpHJMCtzJBdiVLCUEvGs4m56sB8xryOu51abCn1KwSOAas?=
 =?us-ascii?Q?bpCT6NbVXy5+3RMqWMcJnOZlWzR+6nd/S9aoARU99WuIMMlJ9gqGbitQNiCj?=
 =?us-ascii?Q?juQqkUgNOIFFzdAlqiWjkKL1EdDKokFBTo6q0alMSgkCwhK79+K48cDzqsZ2?=
 =?us-ascii?Q?RcCBiGLliXCxDiealtCwaK1AqSj3nkHbubjYXKTegm83ZWdimGA3qLeIwh8x?=
 =?us-ascii?Q?ZCddlCwlFRDHcgHNJAQddPJNxRhYSRA5QtfQEyJElNRrvohgCtl4AVknKb4I?=
 =?us-ascii?Q?nnHLkoJtV1zEYmsM0c01K1MdTpVYYsL4A9LJmRJqIF00U5MEtwEhpMh0gaCN?=
 =?us-ascii?Q?iMGIb9uqSF7ZDOXLI7ixNoEhNXs+2jcCz1lJ3nunM4OZ0LR804ZhSkoDXlr2?=
 =?us-ascii?Q?zOwhuSxiFml1KJI+EJMvadpnXQfE7DJiMXZhAgZ+Zd25J9LM5i/mxxbEOXFF?=
 =?us-ascii?Q?WZ8j0cTd1tuXjyx14sBKFxgCRx7O2PE/KdRf1TtEOBIbORnIcHDA6G1vZXGX?=
 =?us-ascii?Q?ZU05F0arrgQ8OyJNfzaOKBj7mPT5K321OCSpZ8EjCnZbmg0ZqqyxNq9mPyTK?=
 =?us-ascii?Q?0b703ATdzAuWQZEiji2t736+Y+lUMLQ46uoLNYiIOSWqRr/fLUXTz/7Yj9Ev?=
 =?us-ascii?Q?epAtj82CIsOEn4ES7jWyVJ20PybY/iln+t8h7nuivihR8u4xt2gxH2pDE9Nw?=
 =?us-ascii?Q?aucmeRasHNPQclVG5BJqefkowgZUkk1yf33r0cL/JMgeTWQZ2vytJdQT+nYQ?=
 =?us-ascii?Q?B0RKDoJ+W2U38lEwlDBar/FINmy4sCzjsgS3zRdHk/fGAyaLAnBtCMaStcwl?=
 =?us-ascii?Q?W2y0KdEW3jxQzp+Vc0S57aX3pKvbHOPwOSKwIuwqfGx32r7fvnU1tcu6sAh7?=
 =?us-ascii?Q?FfADj7hNXixgyZys/caurGtvsQu/sGZz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xt/v83xai/UikB8YyArfLtSQ6mOn1r8ysdrKpn60Lq/38MV+afmplzT5BI6b?=
 =?us-ascii?Q?PE7bPgzDazDoHErkyay3AJexIhDBGG/T9mazO3bbIYkPCFOZJc5uIDr5bOxb?=
 =?us-ascii?Q?oq+Vi3ZBoHK+AAiwcFXuP1mhpv5ja2CreICH3dKQcB5i5gnJEKzDON4g6lGS?=
 =?us-ascii?Q?LwIo0omk7fTZAJvv8FY7ANmp1ckiCUfE3NvjsldmcJ6N8nB/Yv6osBzp92Pw?=
 =?us-ascii?Q?TnvjR9qJz/w2xGm6gYJ/RiO2++GN1MxJH6mJNUMpnvqh1w2sy+Dx7ZOBFtci?=
 =?us-ascii?Q?rp9e/GcEgd/Mclwp5iLCPPdluSp44xPxwaLc6+qwczy9RDNrD5Q/+eoykMJC?=
 =?us-ascii?Q?kSnnDLRp9ycl93DyTFa6TzAkhLOXhLV+Zah99JO7zM0JmngTDM9yc6QqWnPB?=
 =?us-ascii?Q?HStd4l3HcnV6bdHDzSmPVPif0zeItugCnwwMAlkgTN8OwEYsBmPRJq28fp93?=
 =?us-ascii?Q?mD7RHqOSE0FFqtFlmwvWdMJeUO31LXimWQ1ceZVmDomLaF4KJvCLpku/U6iQ?=
 =?us-ascii?Q?mN3FVf67qoaIdwZKMtvibt7Gw3V3saFyX8ilzaMhFyU4U/D4Ob77ISPflJcF?=
 =?us-ascii?Q?zDuGekVPCnOFET2jai4Ehfw2vbiXwEaZPgkx0AT+/Hl5F0r8/UUg3qE52Lcr?=
 =?us-ascii?Q?ARM5lOh3U1II7Kn4LubX4KU6rhNW++lRSl6YbxgdPaPAZBoiIsx2Y9WyJy/p?=
 =?us-ascii?Q?A2sVaCHMs+rz+60x60p+wSOwG5FsrZtG+qXlRtx5ebhd+4faptAmb0PTpUHC?=
 =?us-ascii?Q?/YGBlf5yZJ9JG42DShp3USylMVTtVCJOKjLVvno5e0wn5LVaTuTG0CYg3X3g?=
 =?us-ascii?Q?oDBGR83SnPC9Kelwk2anXGgYA4L9Ka67pbdWaQoUd8bpmEmdEfSMdlrEFN5F?=
 =?us-ascii?Q?q82+enSAIjNKTfECuHd9q1O13XAvoOWeNws9Jgz7TQqcUd6x+lESWCtRAd5e?=
 =?us-ascii?Q?w8dSHPYWYSem8IxV4L56WfG86EXs/3pIwUzdjRupEnx1cTCnH5Vm+UHKn3Qi?=
 =?us-ascii?Q?IK8uJ/ddo9f0rN4ezsX8p/U7cjvYcx8vDNEqZlKU07/SEFuxKrFx2mWGcI+N?=
 =?us-ascii?Q?bllIWyq0tEQXeHIx/dX6fz/D/QUXPeAjZWEfesZEF9NF1ko18UghSN+ubYue?=
 =?us-ascii?Q?5XnAEC4ux9k9bLJLJOYr0Xw9mZ3zhfx5WJf+KQArTGdozjFHP3St4evB0vxe?=
 =?us-ascii?Q?1mE77WblrkUqybPFS/MQKyrB4CQMc8eTYZWXh8eT1RtgbuW13klj/7zbLFc9?=
 =?us-ascii?Q?NBm30pJZ2m+aPeW0Dz3E5V/UqcoYEbT+8M6WdQuZaI6l4uQNaOB7C4QsLfwt?=
 =?us-ascii?Q?XvxiLJVJO/1P23QiAmDBC7uv2ku0eyOtaO28LeaqITnEjL2fAwKPzJ2FiJZS?=
 =?us-ascii?Q?DFtzxWsg+Rok+40q1NWHHXPs11l1eoe6gLVS+20vRgsF8iXuAXu2Fipa4CEd?=
 =?us-ascii?Q?hhRNzzkYQdOuAfAGQEo1Gkv4HwRqCOKJRcB3LGGt1argWXuWdLgN2YKCeLUP?=
 =?us-ascii?Q?wavtN6hqUcNbx9jH3wFuvFMcTwo6vZNfB3L9kri1uvLimGRBa9FKO0SW4sZr?=
 =?us-ascii?Q?D5yc7QpCPju/idWFMCq58HI7MmQ+LB2ShYugCSZLBA0z22twIc4v89auWWSU?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b838884b-a488-491b-2650-08de26f62eea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:59:52.5508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EcFRAGP6CyM4WoI0MbVduDmlX6VUt+h+mQLzDUeoNVVvl2ladkI2l2RtdH07BJHPDV4fCcTqmTBjs0jtnYuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
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

On Tue, Nov 18, 2025 at 01:19:16PM -0800, Niranjana Vishwanathapura wrote:
> On Tue, Nov 18, 2025 at 10:02:00AM -0800, Matthew Brost wrote:
> > On Mon, Nov 17, 2025 at 10:41:52PM -0800, Niranjana Vishwanathapura wrote:
> > > On Thu, Oct 16, 2025 at 01:48:24PM -0700, Matthew Brost wrote:
> > > > Deregistering queues in the TDR introduces unnecessary complexity,
> > > > requiring reference counting tricks to function correctly. All that's
> > > > needed in the TDR is to kick the queue off the hardware, which is
> > > > achieved by disabling scheduling. Queue deregistration should be handled
> > > > in a single, well-defined point in the cleanup path, tied to the queue's
> > > > reference count.
> > > >
> > > 
> > > Overall looks good to me.
> > > But it would help if the commit text describes why this extra reference
> > > taking was there before for lr jobs and why it is not needed now.
> > > 
> > 
> > This patch isn't related to LR jobs, the following patch is.
> > 
> 
> I was talking about the set/clear_exec_queue_extra_ref() and its usage
> being removed in this patchset.
> 

Oh, the extra was needed before to prevent the queue from disappearing
on the final put or by a GT reset while a deregister from the TDR was in
flight. It was a pretty hacky W/A to this odd UAF case. I can adjust the
commit message with to include this information.

Matt

> > The deregistering queues in TDR was never required, and this patches
> > removes that flow.
> > 
> 
> Ok, thanks.
> 
> Niranjana
> 
> > Matt
> > 
> > > Niranjana
> > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_guc_submit.c | 57 +++---------------------------
> > > > 1 file changed, 5 insertions(+), 52 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 680696efc434..ab0f1a2d4871 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > > > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > > > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > > > #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > > > -#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > > > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> > > > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> > > > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> > > > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> > > >
> > > > static bool exec_queue_registered(struct xe_exec_queue *q)
> > > > {
> > > > @@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > > > 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > > > }
> > > >
> > > > -static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > > > -{
> > > > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > > > -}
> > > > -
> > > > -static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > > > -{
> > > > -	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > > > -}
> > > > -
> > > > -static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> > > > -{
> > > > -	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > > > -}
> > > > -
> > > > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> > > > {
> > > > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > > > @@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > > > 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > > > }
> > > >
> > > > -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > > > -{
> > > > -	u32 action[] = {
> > > > -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > > > -		q->guc->id,
> > > > -	};
> > > > -
> > > > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > > > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > > > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > > > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > > > -
> > > > -	set_exec_queue_destroyed(q);
> > > > -	trace_xe_exec_queue_deregister(q);
> > > > -
> > > > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > > > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > > > -}
> > > > -
> > > > static enum drm_gpu_sched_stat
> > > > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > {
> > > > @@ -1326,8 +1291,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > 			xe_devcoredump(q, job,
> > > > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > > > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > > > -			set_exec_queue_extra_ref(q);
> > > > -			xe_exec_queue_get(q);	/* GT reset owns this */
> > > > 			set_exec_queue_banned(q);
> > > > 			xe_gt_reset_async(q->gt);
> > > > 			xe_sched_tdr_queue_imm(sched);
> > > > @@ -1380,13 +1343,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > 		}
> > > > 	}
> > > >
> > > > -	/* Finish cleaning up exec queue via deregister */
> > > > 	set_exec_queue_banned(q);
> > > > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > > > -		set_exec_queue_extra_ref(q);
> > > > -		xe_exec_queue_get(q);
> > > > -		__deregister_exec_queue(guc, q);
> > > > -	}
> > > >
> > > > 	/* Mark all outstanding jobs as bad, thus completing them */
> > > > 	xe_sched_job_set_error(job, err);
> > > > @@ -1928,7 +1885,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >
> > > > 	/* Clean up lost G2H + reset engine state */
> > > > 	if (exec_queue_registered(q)) {
> > > > -		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > > > +		if (xe_exec_queue_is_lr(q))
> > > > 			xe_exec_queue_put(q);
> > > > 		else if (exec_queue_destroyed(q))
> > > > 			__guc_exec_queue_destroy(guc, q);
> > > > @@ -2062,11 +2019,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > > >
> > > > 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> > > > 		clear_exec_queue_destroyed(q);
> > > > -		if (exec_queue_extra_ref(q))
> > > > -			xe_exec_queue_put(q);
> > > > -		else
> > > > -			q->guc->needs_cleanup = true;
> > > > -		clear_exec_queue_extra_ref(q);
> > > > +		q->guc->needs_cleanup = true;
> > > > 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> > > > 			  q->guc->id);
> > > > 	}
> > > > @@ -2483,7 +2436,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > > >
> > > > 	clear_exec_queue_registered(q);
> > > >
> > > > -	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > > > +	if (xe_exec_queue_is_lr(q))
> > > > 		xe_exec_queue_put(q);
> > > > 	else
> > > > 		__guc_exec_queue_destroy(guc, q);
> > > > --
> > > > 2.34.1
> > > >
