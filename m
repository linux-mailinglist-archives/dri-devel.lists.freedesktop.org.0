Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E191863E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6C10E924;
	Wed, 26 Jun 2024 15:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWF84TQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE8810E924;
 Wed, 26 Jun 2024 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719417045; x=1750953045;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H5komSe+i9FtoS8K7RWCxdtNhtgNDuHL1VQiQbD0qEU=;
 b=kWF84TQNr0+oEuYeKbbVgMzYlOR7hyigO3iAufp3AyXAeUQ5eHoabwqI
 vLXszwccmJ/Urbm1FjCnjCXJSqKbXZsO5EtVoo9llz5u7aZa3t+b2ntQt
 WQ5fdkbw3bLlQzX7ml+y8l5IVffmUjiDTBzlxl3k9Ijyit19gm3utfc0G
 ts+Iz2c8HP6C8TCsmIjOGym00pG8PHLiGraqRRJhrv4hpzk6zlZUR+bDu
 c39tefjVOf0apnzosb5C/7gCVviPCFPfCPE5b18XEkr/lSZaapHrW0Gpo
 CCSH7D1ySnuHFWaEtU6FDMjppdtRkvjwjlz1X0v5pMCdx8EKthS8z5/3j A==;
X-CSE-ConnectionGUID: K7ByALuETJGqERZxcgQFDw==
X-CSE-MsgGUID: lmF1R9f3QmqWEDEptR9/Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16317831"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16317831"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:50:41 -0700
X-CSE-ConnectionGUID: MDv3nesrTG+9QOR5PhVp+w==
X-CSE-MsgGUID: KDJEzJnbSDmHUNG2/cjMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48654065"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 08:50:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:50:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:50:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 08:50:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 08:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa/gAM9u3UBtczh6Q89wStg68tQB0zGsU92EFr9jBbPgnAeWIP8h0Em8P0rdG6S1lSjZTQ5Ah9csTivZ4NkJSCmcOwpoZqSPT2OQlgsHJ/DWDgGqHzq2RNaiD3RTebJakT9DuinWqiAJO/30SPz0jdAHUwvYPx7KCwOMAenv3GUdADPOewPnP0/+gnta04IocqEeZF643NqvHl0QmoOyy8wL/kA5iJq99DIJ+yTFx+OtfYuo0xutmzvn+RKdlYyTV76SXJCLJNXHKznJdPCYGxfonVTpPclHQHSBFSNeC2+V+U7PQKskS1cyvhdEHml0PcTOv0TM3BIQjvVOuejpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JARQpxQA1aoasahBiijTqyt6aY55mAygOOegTTkm/74=;
 b=SHFuIKAjAdiFYDkHUznNca87q9Y4fR7z+RMh6k5rmDf+pGClDZYNl0Nx5+bX1oLApT5L5CheaSJS/kRwR9jMBxetip1R/eMKAtsz3bZ8emqT1TRuaPEtt92/Cacg+t5rLwdHgLZqWDzLCkTSS+qdPo630NfreamKL8PEquVSmQuzS04UHrfNfSlxD+rGpL8kZYVv4C4pizQRE96v/tRx7Wf7cIbUNCNxAVogk/bIlZ7C0+UNPoiy8xaTsxrUJPG5H2UqK9XesfDe7qPWJoEUzNB2RkXPQExFx5iKjYr6bYOqpvgIrT8h6oJKgxl+H6KLehPQ6axYWjCuJaJZIJAfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 15:50:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 15:50:30 +0000
Date: Wed, 26 Jun 2024 11:50:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Andi
 Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM
 to userspace
Message-ID: <Znw4wjbyUZ20y0mf@intel.com>
References: <20240626143318.11600-1-nirmoy.das@intel.com>
 <ZnwylM64-5HqQr4R@intel.com>
 <5871ef5e-50f2-4623-b3c2-8275d65aab17@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5871ef5e-50f2-4623-b3c2-8275d65aab17@intel.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c14b54-b10d-4e09-842d-08dc95f7b4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|1800799022|376012;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+P7j6SL5zPPnX7Dfbqmx5rAO7/+5nIsdEMUm4+RHRN8r7V3moGT+KUq53u?=
 =?iso-8859-1?Q?7JYKKGF9MRRGpjjOJws978eGo0bmdwpFfRfLp67HHESQgs/2cO8nggNFW+?=
 =?iso-8859-1?Q?v2WPRXTwEYtA3jiKB6qN3/N1UPMIXY99w09eXxeixNLzAoO6Pb6MGPCHAV?=
 =?iso-8859-1?Q?wSakkHi2URmX7kI2HNmxq2APzn7Qzq0RoCHYOFLnqC/MaXhyASB1Qk9TGW?=
 =?iso-8859-1?Q?SXx7MrTi1W2Fj404szPDAjEnQxtUfesdBa1g0VxzG4oX4CNTx7X/cd6I9n?=
 =?iso-8859-1?Q?kY8C0nAsf398aVqCRRzZES5ITiyzWJ21pvEqsGtT6G1p+ccSfCOcDeE+wQ?=
 =?iso-8859-1?Q?0HiMZtWfJe3TQpya8gfK+wPFM/O9P9yR4/LwbxHNNH586/AXxvAP5NQnnv?=
 =?iso-8859-1?Q?9UqYgiBtooqtxXgvXMjBWvlgBDlbjitAP0XW8IASL3sIdy/KFenfChDWUb?=
 =?iso-8859-1?Q?19ZuE2h5LMyk5UbaxOBYKXIiZkZ3WOdhQVZG52iDS4OAbhOsm/nnzwlgVR?=
 =?iso-8859-1?Q?LTW6KdDjFYLMSLXAnyRzkMluOFpOL/ETpjNyjuJsK/7ZWje/ejNbWR9I/W?=
 =?iso-8859-1?Q?obkccy9aLCm2h+XL2IazHfFCh9rt3qkDJVWy014L9WA6AwmvuNe81TCaTC?=
 =?iso-8859-1?Q?p+IQeBq7HoR9S6rht6D2n6D2/omUrzxEkUDb5L43+yTH30zwVR03WonTJ4?=
 =?iso-8859-1?Q?k8qYwQtljpJtTZdDs1val0U/GMFc4afL4HV3z48uptS3/wFQBs0Zr7QKL8?=
 =?iso-8859-1?Q?FRVMRSUtG3Fy39QgJFNc5rED9X/GBMqe5qwiY7xoQkfAzZ10X3BTN+aUJ4?=
 =?iso-8859-1?Q?tohgu2hPWCSD7f095XXwz89plDmgXsTpMTGzWYTwVJBTc4HpWb/D0RqQ3b?=
 =?iso-8859-1?Q?uS41Y+VfQZQvyxAYwDCSHYER9YVzt8vZbd6dWpZfWc4KGCY/R742ZPcaJR?=
 =?iso-8859-1?Q?Y5TncXN4cfvCG1AO+JI/8tcwTyHlYWGiHUOrKjOvoJSAsdRAIPmGZh/J/L?=
 =?iso-8859-1?Q?bDFtfYmzVrvoKFYUmE0I4ezgZHEQf1UXLiBGn1b1+nZopY0jiYsOgkzYh8?=
 =?iso-8859-1?Q?mwI2/ewqSVvR3lM1TSG0ZENJMeNA3bDkkHBuqhIQZyUjDgmLJsOjtyJnFy?=
 =?iso-8859-1?Q?W4AfIN/BtIaEWzHjyWUot/j39k8cJEsnHC381VfH8PAgvSC3CX83J3E7/A?=
 =?iso-8859-1?Q?dTJY8XoQwb9xrkBXqwu4YjqqCjy3DVce64NhuPGBlufE3uQjttKUIUK53J?=
 =?iso-8859-1?Q?GJ23QYBYJ8rCXIPnkG9QElP9Th6oTb0r7EaC4U7t/DPBddQ+nipwPfhkoW?=
 =?iso-8859-1?Q?IJPEkm+ZwqzenLRCaFmiLO84/HvHpYxZxVjC4uNMVSeoMtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(1800799022)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZrcKKJ+Umtx596ycqL55nw9Jr7dLBHW0iAHsauYhiaU2MU8QG7SzM85QwB?=
 =?iso-8859-1?Q?3WehPpxej7DUZ61RsAzhH9AGiyYRlFidxG1k8+5d1kcikQIEWUN/jLQiHO?=
 =?iso-8859-1?Q?quaYXUtLJpoxDHPEZxXf/+65BReBoQAl6RmQ778R+Gssj8Ob5WAJSNWgJI?=
 =?iso-8859-1?Q?8oOMyciaGia57K22JUb6dR3/OHepnLnw+z5sJ4K154pYSOxPOM/dlqO3ZT?=
 =?iso-8859-1?Q?61YaNb5uJE/FAkviUQvcXAtC21i3SNuIhCHh2+xvfcNjFThXZX1KapbMnD?=
 =?iso-8859-1?Q?zIZRG+l/j9it+lvoAnOfrwVoSuNKCwQhS9r6bVqnFwioDUg9TXkMbpOEaK?=
 =?iso-8859-1?Q?F8KvsbUGSl2OwRd81u0SsbPid9KTxCwgDeAfQm8ECDs08Wi/EGot51gxqR?=
 =?iso-8859-1?Q?OnWJInUCa/GTIwX9FYHClEVeb5KuzrRMx4hvxPtKDSmmSq7jnh92OrnZSf?=
 =?iso-8859-1?Q?Cw3jq3GyO45LDco0wkinGslvnuGFCt/VcEbwWEloA8CXZil2bE4/NurlK6?=
 =?iso-8859-1?Q?mvQr/lER9KzOlABl/5M2VL45QSc3Yo0noubBVK6jEqQjXqsveckLQwySSm?=
 =?iso-8859-1?Q?r3IGsL8UyOyb+V/E5ZpNPOJ6RvLzet2++Nt4YIXIJdGts3KKqnIuvUsUcD?=
 =?iso-8859-1?Q?RmKU5L1yJ8PF8Lf6CmHLel3CpNMarxoHK6KnE3JyOlV5cwDg0mcm7E0hin?=
 =?iso-8859-1?Q?TeiB3lvM8IdKrafxbRslntRDszwiOYu0SelJo6w6zlKOswsB6xLbBjvRRC?=
 =?iso-8859-1?Q?f2/a0m5Xc9lvvOoeDqcGLJSXUoaH8BhZG9u/WazeVOWRQzncQ2gy6A3/wB?=
 =?iso-8859-1?Q?wni83diaaLQUMQkWOdFP/C6NioLZkWDg2ycpRgejUMS4vZo7eCET9PVJgk?=
 =?iso-8859-1?Q?6XiDCCpwt++xWSQezY2vdDlP7+kBuIwKwGh6h65aTjqVnMBSJU5yN8pypR?=
 =?iso-8859-1?Q?cwIcmVci6r+DOyJ3mO7A7KYOX3EXUrEBYNOuegKMqHq9EK3FUArNKcViZ9?=
 =?iso-8859-1?Q?t05tSTnlAK+fbp1vLVtkT84M0D9AMODN+IfeJPPGBkpWnFaI9/Mge1gqm2?=
 =?iso-8859-1?Q?U8sQwbvLaiteMjB+1cmcQppyNNpIeh5rCaCp9Y/36SNitGiDyr0TXEhJWA?=
 =?iso-8859-1?Q?k5kX9khXq80MnDoa1z4mhWQQgyTukYvIJP9L58MIpIAIe9KHsJDWdycFAk?=
 =?iso-8859-1?Q?qKXzPRiuMIgODSmYoK32INSDqi0+8nid/95i18Dem3ULnF/njLC8dy7ZcB?=
 =?iso-8859-1?Q?V5Vkuf5J+t/6hg3K9Lb8UifdA/D++kDz9Ag9qltQ7InfWVy4HAuzGapaHh?=
 =?iso-8859-1?Q?QAjaS1gxVWpilb81k9W0E+8GXblUnVUMxKBAT2iedt7DopX7Im0l1iNblV?=
 =?iso-8859-1?Q?Yh8SDYNOr6gZoTJ2qZPS1cEbbj4ELbhCBRwE74DfbAG6EoWiNdG3XeTYAT?=
 =?iso-8859-1?Q?eFnKPk6qMwd9GTPHiARrq2l00NjSN8fwTOnt+ZPLFJHg4201iQRWy3fJwN?=
 =?iso-8859-1?Q?CKV6iW7ItMQCP51lEwBycKusxupCRpfd/gx2TN6c3z2zUM9UeZmSjcsina?=
 =?iso-8859-1?Q?AxBqRtLQkXdyawsxMRFQ5ofB3TfCoNQa+RoQrdLiRxxxhaQ71g+Y0jKCCZ?=
 =?iso-8859-1?Q?YjeqX+n3nM8AkQcxRBNHh1SXead+mV7qxY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c14b54-b10d-4e09-842d-08dc95f7b4cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 15:50:30.5971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SHInNA1yOPb7nYwc0d78ptMYAPBjCTKkPtq1HOS342WjycMzT6tWuAW018SHkcoiCoQRx/AIUnNmn8AUqFYpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
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

On Wed, Jun 26, 2024 at 05:36:43PM +0200, Nirmoy Das wrote:
>    Hi Rodrigo,                                                                  
>                                                                                 
>    On 6/26/2024 5:24 PM, Rodrigo Vivi wrote:                                    
>                                                                                 
>    On Wed, Jun 26, 2024 at 04:33:18PM +0200, Nirmoy Das wrote:                  
>                                                                                 
>    >We report object allocation failures to userspace with ENOMEM               
>    >so add __GFP_NOWARN to remove superfluous oom warnings.                     
>                                                                                 
>    >Closes: [1]https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936     
>    >Cc: Andi Shyti [2]<andi.shyti@linux.intel.com>                              
>    >Signed-off-by: Nirmoy Das [3]<nirmoy.das@intel.com>                         
>    >---                                                                         
>    > drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----                       
>    > 1 file changed, 4 insertions(+), 4 deletions(-)                            
>                                                                                 
>    >diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
>    >index e93d2538f298..4d830740946d 100644                                     
>    >--- a/drivers/gpu/drm/i915/i915_scatterlist.c                               
>    >+++ b/drivers/gpu/drm/i915/i915_scatterlist.c                               
>    >@@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>    >                                                                            
>    >        GEM_BUG_ON(!max_segment);                                           
>    >                                                                            
>    >-       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);                          
>    >+       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);           
>    >        if (!rsgt)                                                          
>    >                return ERR_PTR(-ENOMEM);                                    
>                                                                                 
>    is it really safe?                                                           
>    I don't believe we can guarantee a good fallback plan here if allocation fails.
>    __i915_refct_sgt_init                                                        
>    might end up in a null dereference, no?!                                     
>                                                                                 
>    Kernel is now returning  ENOMEM and also throwing a oom warning stack.       
>    With __GFP_NOWARN                                                            
>                                                                                 
>    the oom warning stack won't be there in the dmesg but userspace will still   
>    get ENOMEM as expected.                                                      

doh! I had missunderstand the flag. Thanks for the confirmation.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

BTW, what email clients are you using recently?
it is hard to parse your responses lately. Please check if it is really
sending/replying as text-only mode.

>                                                                                 
>    Let me know if got your question correctly.                                  
>                                                                                 
>    Regards,                                                                     
>                                                                                 
>    Nirmoy                                                                       
>                                                                                 
>                                                                                 
>                                                                                 
>    >                                                                            
>    >@@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>    >        }                                                                   
>    >                                                                            
>    >        if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages), 
>    >-                          GFP_KERNEL)) {                                   
>    >+                          GFP_KERNEL | __GFP_NOWARN)) {                    
>    >                i915_refct_sgt_put(rsgt);                                   
>    >                return ERR_PTR(-ENOMEM);                                    
>    >        }                                                                   
>    >@@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>    >        GEM_BUG_ON(list_empty(blocks));                                     
>    >        GEM_BUG_ON(!max_segment);                                           
>    >                                                                            
>    >-       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);                          
>    >+       rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);           
>    >        if (!rsgt)                                                          
>    >                return ERR_PTR(-ENOMEM);                                    
>    >                                                                            
>    >@@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>    >                return ERR_PTR(-E2BIG);                                     
>    >        }                                                                   
>    >                                                                            
>    >-       if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {            
>    >+       if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL | __GFP_NOWARN)) {
>    >                i915_refct_sgt_put(rsgt);                                   
>    >                return ERR_PTR(-ENOMEM);                                    
>    >        }                                                                   
>    >--                                                                          
>    >2.42.0                                                                      
> 
> References
> 
>    Visible links
>    1. https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>    2. mailto:andi.shyti@linux.intel.com
>    3. mailto:nirmoy.das@intel.com
