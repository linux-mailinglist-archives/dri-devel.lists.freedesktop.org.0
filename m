Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EC8FD304
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2A892A6;
	Wed,  5 Jun 2024 16:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vw4vGtlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B62892A6;
 Wed,  5 Jun 2024 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717605486; x=1749141486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6lE9ilHAzUB9q9rsctXeX6T9n6eQbK6rjr+jvt7L10s=;
 b=Vw4vGtlWallmTtZPzz8JpFyKFUBv7KjQPC4/1QGcYnx0f4/e81TmlCqj
 hGVl9PxaUMxPP+rSb8EB1mR0svk1c+Ay5QTQSElIivmF4FEbgoOEiMeG9
 ggKby/3lNaBlbXl73owYWQjC1WPDqQnMWEjKWl3NCdhny5xGa3PVU+0nG
 KI1nDS2/kpcNkwxQ/+g3mxtP6r/pXBqP+Af8j3wJKWTk7g8tv8izm0L7d
 O6n7z1oNo0XrrNsRY8OAjgvQzp25MOj0AKpuULEPvrDqCwKRazMjjekg0
 DxI/yaYgZqz/Ov+NhGcY+LKuj8zs+RzgzAH7mxYCdBQ30jp0QDJOPIcuL A==;
X-CSE-ConnectionGUID: 8xcP/olTSU6jMmncUkzO/w==
X-CSE-MsgGUID: ZlXcn2hjQ+exp5snptixZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14367443"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14367443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:38:05 -0700
X-CSE-ConnectionGUID: LcRn6jOIRBywCusbUg0ykg==
X-CSE-MsgGUID: Ah37bOg+RVqNgJgeGn5+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60841361"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 09:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 09:38:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 09:38:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 09:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLpXtGaXwekK47QkPsleKjc9RLrkRjbcXpa+W5QYuHvn0TwZg0LvQEukaSsW5gAh5lXBcf2HoZf0SklW+Qr4vJq+fwxAiVWZV5XDPnMuEgBELurE1qBeTGUufyyCOFD253mHRSO8MPDlHqSYXRRz8cfgY3m9JiH7cPD1eJEGouNcN9UnLSbjsxeePDuC6E+OmvLIlPM+fUWLNQWWJYyKbGX7vc7ge0NezoSm3w+jM7yYA+M8XVs3uDADZUVNAOWH/wjE2uI8a46jmNEjhD9IEvQfGDAkWdfa8rWS0RJol8W73hW24efaEpbVCiinoyWC7tTFKsjV2l2DvCf33kWrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcZowi/rXX+wneeZ5EWmxEP09tJjm58gwaAm+EM/8Rc=;
 b=cohRamWh5ucUyXx67uyGVIuYAMEpWYqs/t1/YXKclLLpTFX8U49qy5pJ3gPf9zMFIcHBFnK9RQG7WpPl9Rn2Q2LFz3IrRBkv/gtHy79FxSGoLmwTH4nxF36zRaN9rrTkPE31ZqxhRjq70/xSeWcSBrjTLqoNNMwU7PXkTVshrOa2+W8ejdjxN4YgUgNXvE5mKA3c/z++yrHg83ziZtiVozCgpyRCeDy1m9rYHJtjdqS3Sbl1x24nSIFfvqS6/jCw0gRBKTfEAz0jBqaesXGzoLAL1NllqYnTOMr3SdWZIS126g2QR3n42+UXp2/KUXda7cYhVQUa/mqCPO+krxy0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 16:38:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 16:38:01 +0000
Date: Wed, 5 Jun 2024 16:37:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
CC: <lucas.demarchi@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/vm: Simplify if condition
Message-ID: <ZmCUN0bb/d2NnftV@DUT025-TGLU.fm.intel.com>
References: <20240603180005.191578-1-thorsten.blum@toblux.com>
 <Zl9XnmJQMjeNDtko@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zl9XnmJQMjeNDtko@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 341d1f23-d214-4fa9-b2fb-08dc857dddb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DG/k0oqWWZrL7uwv1GXxM7OZSvdOh0WUPRzVR4+Z7fKh3I9+J7o2Kym05Wox?=
 =?us-ascii?Q?Fiy7C53+1bR2LkyiT5Ceab/uqsl/EdA+9Gp4gzeXRTWhdQd+GMGjPUSGJ/vT?=
 =?us-ascii?Q?oM25ZFjhiM2bxkl9BsnknvOjJ56EprPINCRC795DG63z62jGR14PTkG65z/l?=
 =?us-ascii?Q?p6p/FCCgeDRHYqq3FNSjr7ozDoqFUW2YvUWg+1GVwRKjAXomHPaeJW+Bi+Fb?=
 =?us-ascii?Q?xy8OGgBXv2WfcrEWyfr9mSrmMADqpoPwrA+oj2dhh4U6ed4B55LKpY6wIYhj?=
 =?us-ascii?Q?ws8NId17q7CZyYXoyPiQq8Q/ILSjCHctaSAr6m1sQUiRrslGgyyM9rZwM46O?=
 =?us-ascii?Q?yHOQ5R2YaTzpP1fpFOwIcQ3XJ7aPIzAjN4dpFmRFblrcBuWjnQBpxplbO0wU?=
 =?us-ascii?Q?CGdu0+hG/5tjLxSweCm15FGdqc6FE54rfxKPQS/2fE75x6jxer2PSUPMRc/r?=
 =?us-ascii?Q?FEXnAzHCwlpc3ELgofv1m9MnG+JpfzZb9hNe2wb4m7YAt6P8oiGkJRaFSBqV?=
 =?us-ascii?Q?DFBIcMav7aQch7feITI8cffBXAdaXIcbCciLJuK+h9R5xIHfol4CZ6t15qTZ?=
 =?us-ascii?Q?CIxmb2Nw6DQx68CU6OarBU/jghEyMEv/dpomeZllIzAeGWHokhu8Zee9UQay?=
 =?us-ascii?Q?QkuSrx/z1IqEvc2G0/wBP6HS2ud6etRC7oKv2TM0yHT5TWmlBqNlzGvJc+OM?=
 =?us-ascii?Q?mzuKfkHIQw1M5M/YXul2kGOcj2HwXpFBv31OWg8buM+45EIG4NQXRUb79Wti?=
 =?us-ascii?Q?Z3sDX5tYeklL0NSX8shuryIiYO5wKrb/cWt8IBohIigBa2XJT7Sz20MkNCWL?=
 =?us-ascii?Q?BPTgWaRAe/xPrIhap8FRmu8H+4YMuyQOpPIhYHbrdPM+O+xeTlq4Qs46LGut?=
 =?us-ascii?Q?SpYFOgjRXUGm+e3hnUwM6zzXsA/qDLXB0nBXQ0JqxY7mvxgiHEXHZDygnn/B?=
 =?us-ascii?Q?ZkcogRXUaiRqPe5JNLb5GjLvFv250xAAoZrqNx/urVWMShztuyfKI9kZhAZ4?=
 =?us-ascii?Q?BjIUoP3nNHOgk8jXkPh0TsVF8PX0BPTdMqrj0rZUfOtwrF8dwWwbyFz//Uqs?=
 =?us-ascii?Q?DAgxJ98/ptRF3AGkIXxdQgNxwU4fXZFXyPbQ1wLavM7QhDU35wr2/qjkCn3w?=
 =?us-ascii?Q?J3gk6r3xWZ/5x5wxLH3c2yR2TK6e1EurBMWN4yp4/bZlKLhLRZJ66Ot2lQJL?=
 =?us-ascii?Q?WjGSMPBXobc1//Ap7BJF2CQm1nvv2T4KyU0IFUhET4FScuMX9HyEdJBLEBnz?=
 =?us-ascii?Q?WLZPHvNdjhJpJJpDrrszutH+LuBsPHAzvi491/G0hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qVyYDM8RR3MrvaZxAHkw2vhjBy2DPL2ds020X/qmst7KZsLjOwBm2LDqaMgp?=
 =?us-ascii?Q?KYAS9XXXSLHZvQH3Ue3Ki/4pavpFKhrKaaGFlWSxvg0P1ZVw+uNO2M//19iq?=
 =?us-ascii?Q?YoSaBSej5ZeT1Ako8/Q3elpJ9evi9KUWIU/BOImA3d2UxlhFkGrwNztTLb9H?=
 =?us-ascii?Q?vy4Q6fn5vQuCQU9tIKBNnsvwTWgrSew9c0SIEGCV1VZfaBnf5Ay4zw5XSNcb?=
 =?us-ascii?Q?3IdgotytRP4nC4/VR4SFNHmnzRBFmgplKo1ONX62fDOv/cpotKpdVSAIrOON?=
 =?us-ascii?Q?eWLlnvB6Cgl3M3L/8VkIy6pcaj+FZa7zdmD9yqyyWwV8gg+FPNjfncDIrvan?=
 =?us-ascii?Q?wB2C7lAU7TKfOdVmaAnMWHXOfV71fakxMmkIcsu0LH54IqbFt9TrjQRC547g?=
 =?us-ascii?Q?nFlPOwNyOHwhp+MI3QV4dxO0IAbYBA06axvUjM/oGjclSC69Xi8JbU3R3t2t?=
 =?us-ascii?Q?diXB8eXEbLJm3GHJ5LsCji0nC2CSdRbyzjEkL/h3Bqg/WjC98REXKlKdzZz+?=
 =?us-ascii?Q?D6enOT9ZEsWuARkpnX3Mpt1K0FGM/ospsW/eXfVZKqJMAsXLkGg3HQpgPpLo?=
 =?us-ascii?Q?NSAuln1qKjTsulHCGx6RnDgtPl6nVOy0lbc2urWU1wVdoq3Iul77Vmkju70d?=
 =?us-ascii?Q?czuj04aSyF9errXA5ESHqfqohvB7EHCr0o9GBSJRbd/WpvWiujZr3gKF2zc0?=
 =?us-ascii?Q?DFuC29AWE4tX+o3QtlKgLIXeEstAzeUvmguLZ/mskQA335lxNazPW5RitoNV?=
 =?us-ascii?Q?E/Sv24B6PI/xeQxWiePlX0op3e9jNrPuv8JYsjCe0ZFFC+HDldry/cyADIqN?=
 =?us-ascii?Q?nlsc0foWcp8puYB4w6zMwzcLFfUBWeZo95+SIu859+rfQ5pJkBpnjwrfpvY6?=
 =?us-ascii?Q?6mF9OmsGFoDkh32Gqt+T6qWtM+J7o62uvxYy4R3K1q3eZLdj5jeEyZU6Iek8?=
 =?us-ascii?Q?N8HNExQbYkR58SuLLyioBQ9RyXu8hkFsxI/WBxxYRGtMoR5qlIPF92OYbRvT?=
 =?us-ascii?Q?tfyYR6hb+OS/l6saXj/2HtAhkJNt6K4RjRObYIs+d7hncfor2F3gDpL59grs?=
 =?us-ascii?Q?nM/1nNmjXcqGuHZFiJ+z45vqocLWwzQX+QsZBgY7qjjValUfDVDAIU0JbVje?=
 =?us-ascii?Q?gGl2CqmWByokRfwuH1TzfjOdwjy3ylGOK2Nkw1cKaklpIQXbdyqOWoIw/AqG?=
 =?us-ascii?Q?M9/x1CSzdl63yeDgMn7N5FJOgpx02vz2YSRQml1+nYncRW+JHGCH0qHG6o0+?=
 =?us-ascii?Q?KeLmt4XAq2VfIznzMaW13N2QGVUTG+RBtHdJGxQ3oBkcOBrW021R97jUPumr?=
 =?us-ascii?Q?Ddaxyai3EEjD4N2s+eKHn72nGnAxIQhWMlNCmprHq6IXwxo4IgPWtHu9Ayp5?=
 =?us-ascii?Q?YHlU5fbnWrElyBDBMHO9EskNWwn4JwsVkomckGMetT09VNQNvmQtZRemFg6L?=
 =?us-ascii?Q?lVtX0rf8GmBwIqGyd1ZNg167tWUj9+zxgFBSjftlS5Z5ut6w6hmsuzpdApBa?=
 =?us-ascii?Q?eHDBxJL9UYeK5Tts8xVpnm7/tom0BrZwCzCnwpbiCmtEtRAJzOTHLexC6Lpz?=
 =?us-ascii?Q?6o1zandmR+nTdxOQcYaqWGVWfTCxSaXynQBM6+w3XrL4NS/PSu9GxZLH4GGD?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 341d1f23-d214-4fa9-b2fb-08dc857dddb9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:38:01.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/OHdszbKoXPlqi0lXnNUdMcDyH0T3e6qybT2py4zaVO4ULDFfvKYv9S1xjw0HetsXmpqLTcZN8ANHWni+XrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
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

On Tue, Jun 04, 2024 at 06:06:22PM +0000, Matthew Brost wrote:
> On Mon, Jun 03, 2024 at 08:00:07PM +0200, Thorsten Blum wrote:
> > The if condition !A || A && B can be simplified to !A || B.
> > 
> > Fixes the following Coccinelle/coccicheck warning reported by
> > excluded_middle.cocci:
> > 
> > 	WARNING !A || A && B is equivalent to !A || B
> > 
> > Compile-tested only.
> > 
> > Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Will get this merged once our CI system is working.
> 

Applied to drm-xe-next. Thanks for patch.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 4aa3943e6f29..3137cbbaabde 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -85,8 +85,8 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
> >  
> >  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> >  		if (!q->compute.pfence ||
> > -		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > -						   &q->compute.pfence->flags))) {
> > +		    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > +			     &q->compute.pfence->flags)) {
> >  			return true;
> >  		}
> >  	}
> > -- 
> > 2.39.2
> > 
