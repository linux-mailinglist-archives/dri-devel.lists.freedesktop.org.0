Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEuSNcTdpWkvHgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:58:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102061DE85E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 19:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6448610E58E;
	Mon,  2 Mar 2026 18:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeGTGnAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FFD10E58E;
 Mon,  2 Mar 2026 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772477886; x=1804013886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k85SXxA54F8xA11wCWPrjJpJwxtZFDsXhh204h9a5dE=;
 b=MeGTGnAx4P2lXhK6j5Z/7ImS3Sm8oq8QqNijNo6NuVHnNHFIVkwRjvxh
 E6kQjCUjYsI1wKTFAiF9tvPxwxnOricTBcmerZhIYtIBsRFncz9oiJ3RL
 IP4UFh9IoDV15e/c0mBul4MzL/TZDM67znC61d5kfBxW3S6fPSWmhgLCg
 4vduOFLhCNOxkHlEKX9no4KkrCpOAMcfbNdK00+mJ1UW9ZGvQOIyFAoN8
 eti98ifnIWjIS3i/6MN4rUL7zTJP2WUazL0PfNAkFyocyFYx+Cb9a1516
 u1FDDz8ba1puTsc5HommuYB/bEYD0e3Es2H3ffx/ABo2u27BzqsY38SZ1 A==;
X-CSE-ConnectionGUID: Dy3yUEd+SMa89j38vWiuNA==
X-CSE-MsgGUID: m4ZblPqdQQKvH8bbX6+9zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84848232"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84848232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:58:02 -0800
X-CSE-ConnectionGUID: trRY+5brTUmpMObwjrR5zQ==
X-CSE-MsgGUID: yhLEOr9DRYCEZ7MTmmv2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="244750109"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:58:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 10:58:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 10:58:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 10:58:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGAbaeVMmediRpEKqZEZFvtRqRM/q+nmODzrFq05Rfa1rPDgU1zdSTSRFhDsoWF+lsgCpl6F6Ta2lXHCW1lPU+/AkxV8dRDfXq9qWKaC0CxrBMuaTjWiaRQXTsuDoaxC3W/pyHciafk1gEIxzXpKjg0+5BDiRujQx41tqikMlZWYDQZrkMM5qevVjY0hey5VfjWzWDQntSGWElIKqouMd1qgdzzXudCIZhF9UaW4IkWMLAL8y3CeqRy2EXfapIaoTF1SCvMdH5Cu2TSsAya80CLT5uFyntJCFS4b7FspbZhVePBLhwkdCvs36B+i6OpUiOlsCt8TJF7FJ9YXLhGtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiZ5aYZuBNiQzlu5ItFNv7uDnz8b9X0WRLOvWM/arIU=;
 b=tEkFHovpkI8M1L/FVEpibt+oMbe4xvczP7XuuWICLoQ8AwxzxHDxys4sdrWmgLiaGcD7t3F+P1hT4sFlSz6CzSzU4/FwqilskDzyztTXFNG5FX65WiVsVXUKjFWyzzilxFETKCqlD+IYipS28EIgd4/yknwsolhpzoZ4JweA8qxIO4zuy9Afibv2ZpTBxv22Pfh73xdCCb8olnYUOCQS6WYC0xheagaWe68gysCtwJJqVlT7jPqJ8JjIZ1C0fA5WEp+WOo1p6qH1E0tcQ5v4KKiFzIEuGW8d+pfVZMZP4Id3/NbifzFqbzJ1c0i1j/wXH8bntDdUbLIvwoJ2tDbyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 18:57:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 18:57:58 +0000
Date: Mon, 2 Mar 2026 10:57:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/xe/userptr: Convert invalidation to two-pass
 MMU notifier
Message-ID: <aaXdsiRlux/cZ6WC@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302163248.105454-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 3935f7ba-f73b-4739-5257-08de788d9e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: F1OQdNIUlbDYjLvcWJ9v8br+AZXunN0klDKu011xB7uq83w0MbzE23jJdNFbOx0PbHJfFcp3pBibnvdLGcLkc/xq3dG4hBHx/djh7dLL8xRmZxEg85BLb8xFgMROLweSBjJWaZ1NnKMD02YWOGeV8xFjjizfPLDnOdeGDssJ5Q/0YfTFrfaH1RViSpzY7ggTuhrTByylq+bYe36xBne1CZk8WxShPEdNDgexV3PfnHh+nm4ErlegibFgjKg2FphHqf67rbQra9a789aMOk6XAXBzxsetvSeJDXAX+rVeg4B1OT9mds6RIhd7/Y18dwYnosghNbFKBCQiQ5LIdCb3vF0TbqynJqEb8cZpUlGMZoQXSy1el7cNUI4yimIMy3vbN7pAz4khlFElQtOywZgrsL2fa8MfAzgugIrpYgPCEbt3YXUmlTdVVtiuSq+A54L8dMhX8mA7PLBYdJu4SWsEGIVZ1Xkl9NCZsQQDs1LZVb5O3CSYKrG4F5bofLnIdYyYBg+UGOgvIAPqxNipnfP0amyXM/zUSNcxQsf5qTeLAZJa+5V0oLqWFWKSyylQegp5SA6nvru0bxvZ2YGEyAyWc9tGI+hDXrHWsfUJybPzzU7kWl25pCUEt2IcInXhZzDiUSBFQ2Z1Vzwvd0ZnYYDl5M07rL0rgT78rlME0FuxGaD10WjZIHuUeho9ddPzqcN0Z+DcdNBsIJ/qCkcdgUA1FNuexTKj+tMLL5M71LReR14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UyUKsRezdd45n9NVEo4knUaqTk4H3YIFMTzfpDmAL0fHFvoKOxeRc5Ig1h?=
 =?iso-8859-1?Q?ZzBwO9blIMHNz9VJDbmynGCIu/dKqPUJiFHu5n+fPb8xRev8CfGAPV2d5J?=
 =?iso-8859-1?Q?reQWPlTyHEGEmy/LxfvDkLjW7/24CXdN0E16i781b4zd8NJ8C93g1VnaDK?=
 =?iso-8859-1?Q?Hm/lc1xO40Vu+AcUqwO1aTxJYuog9R7R+CFZtvOM1hM+QVoIiI7j+5dLL4?=
 =?iso-8859-1?Q?xTLqlH4IW4h8/SlqSu+AfG3RpbKp23nf+VwvzdJP+B5kzShdcyE1TMl1yx?=
 =?iso-8859-1?Q?OuIERn2UOuRXJlRZJucVDmauU91EK2BG+BPBKeyK8GzaqT7y5edN28DvOA?=
 =?iso-8859-1?Q?GgkcXDolUD3/fqYJKeJRpKgH4nIhRrMzMu5qW7p6TN5TJDJCdqXAW7S/FO?=
 =?iso-8859-1?Q?Ukti2NdDzBA1K5xhtFPVq41Mm976iSRJ0hzZs7FxZibFg+OvG12lVcmExm?=
 =?iso-8859-1?Q?Te++QzUUAN/wqqIHuIjgOlw4nXHyXEIS0JYcw9uWpoIp2x8RU7wNKGEi1U?=
 =?iso-8859-1?Q?8RMuSvMbGXKoL/kULLsc4hGM/5Rj7Xe5ib4chMPI4KkId+cQx8mxQdMW3C?=
 =?iso-8859-1?Q?763LvKuRf4wSHmUUcHtKp0ClOnSKWGVFNO4irK186NOUqjCTAs3Z9yF/Sa?=
 =?iso-8859-1?Q?Mb+hlIbmGDMhuXHZ4jQnNLJL+qJ5ff4Gfs2T2By/zxM7pnvR8ZnmsX8ugb?=
 =?iso-8859-1?Q?W2H6m7+gM4xtEfHfpBxPktWnuQZsR03V4ZZfHl7K8Yr/JY9PF56F6CCXK8?=
 =?iso-8859-1?Q?j2moiv/6T98Q14atS6XzHYYiIoRd1wkzxoYG6lwruPXTJUuEeIcJE2Huxn?=
 =?iso-8859-1?Q?FkTW3vAWmUQsr6co6mzaPSIkwqaEoQG/VfkgA6+Fho8vpigYGWkzqJRnzv?=
 =?iso-8859-1?Q?1hw9oBIlIedePQYUPTkOvgzmENzkHXtZOI3vyCPjXNuUXd8XTSuICiwr0f?=
 =?iso-8859-1?Q?4pmIBAwUWKB01iuYCEbMmFqEPwEgpr3wDVq+eYwc7N9fpWwfeQA/F+vRwP?=
 =?iso-8859-1?Q?6UlVEBgLCdNNxe5PbI9o3T0IT9eiTZ7LhXDGpmkUH2uHxNtV+/+4B4zysE?=
 =?iso-8859-1?Q?c4v1mJAwzGLIDQ6NkCdehLN6PUzo9kYQ2cSmX7BhyI89bwoa/p3kLS67O5?=
 =?iso-8859-1?Q?f/t67vrZV20HRYL3JKfDmhE6nUlQSjtQI6ickaIUBlKiQomv2tAEfl8lK0?=
 =?iso-8859-1?Q?ddfKSW6kh43b8coetj3+VfVH8wNLEqywwD9LjY/KceBVd8pWuAtYiR95BY?=
 =?iso-8859-1?Q?64XURQU4W/L3P1UI6gb2aa530p9e9hjgH+dIgOC13GV+LKuhzQO6/NEoni?=
 =?iso-8859-1?Q?fG2FrP8pB3V3v9DUxJ2Qu3MODoZrgDagufubMJpB81BjB2dD2JjSihM7VZ?=
 =?iso-8859-1?Q?N6PZc8vkVXMRAzskhWwVhdC49+EXNmnL57cGW8dL1uynDOsygo6o3H35Od?=
 =?iso-8859-1?Q?3FIaAwknJX/CRcBbckyzwAZYPTHkNcsW0ziWTr1SZBqqWi9X9EB8zJIoeP?=
 =?iso-8859-1?Q?daG6J+t1jaMRnMLlhRknZy8sWvhulK4mvTeFmVOgTv3dyyEO0m/ZCmLplo?=
 =?iso-8859-1?Q?ppFQpCWDW5r3XE+AB0UAMBWC83YAqVf97UuEZN4Q2wuSTj1KYCcJl6Hn7L?=
 =?iso-8859-1?Q?BUyswHdVcuBY+29oG96UATAgAF6ZKYYsfjIWKl6ZYnbaHkJY9nJlk1A+AB?=
 =?iso-8859-1?Q?fZS6VDyVKlCooqtNWMX6IMmq4wqCSDPcNMsaFZ6G7Yle2heTk2ed2YtNAg?=
 =?iso-8859-1?Q?6nptRAg9W2cug/1dsIp7I53sF3jQm+azpQE2UzcjmRJpNfpYPugVc+QK2+?=
 =?iso-8859-1?Q?RxsXYXV98LrNR6rxGcZyYA6u/nLya9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3935f7ba-f73b-4739-5257-08de788d9e86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:57:58.0334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOSOuZQLdb6kuE8uLrl2lBPco2SXR+CmZw6j6MLsB+QUDuY46VCBTqle44+gZITSKzAOyqCpG88p9Ffd5kkr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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
X-Rspamd-Queue-Id: 102061DE85E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:32:46PM +0100, Thomas Hellström wrote:
> In multi-GPU scenarios, asynchronous GPU job latency is a bottleneck if
> each notifier waits for its own GPU before returning. The two-pass
> mmu_interval_notifier infrastructure allows deferring the wait to a
> second pass, so all GPUs can be signalled in the first pass before
> any of them are waited on.
> 
> Convert the userptr invalidation to use the two-pass model:
> 
> Use invalidate_start as the first pass to mark the VMA for repin and
> enable software signalling on the VM reservation fences to start any
> gpu work needed for signaling. Fall back to completing the work
> synchronously if all fences are already signalled, or if a concurrent
> invalidation is already using the embedded finish structure.
> 
> Use invalidate_finish as the second pass to wait for the reservation
> fences to complete, invalidate the GPU TLB in fault mode, and unmap
> the gpusvm pages.
> 
> Embed a struct mmu_interval_notifier_finish in struct xe_userptr to
> avoid dynamic allocation in the notifier callback. Use a finish_inuse
> flag to prevent two concurrent invalidations from using it
> simultaneously; fall back to the synchronous path for the second caller.
>

A couple nits below. Also for clarity, I'd probably rework this series...

 - Move patch #3 to 2nd to patch
 - Squash patch #2, #4 into a single patch, make thia the last patch

Let me know what you think on the reordering. I'm looking with the
series applied and aside from nits below everything in xe_userptr.c
looks good to me.
 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_userptr.c | 96 +++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_userptr.h | 14 +++++
>  2 files changed, 88 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index e120323c43bc..440b0a79d16f 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -73,18 +73,42 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  				    &ctx);
>  }
>  
> -static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> +static void xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma,
> +				    bool is_deferred)
>  {
>  	struct xe_userptr *userptr = &uvma->userptr;
>  	struct xe_vma *vma = &uvma->vma;
> -	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
>  	struct drm_gpusvm_ctx ctx = {
>  		.in_notifier = true,
>  		.read_only = xe_vma_read_only(vma),
>  	};
>  	long err;
>  

xe_svm_assert_in_notifier(vm);

> +	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> +				    DMA_RESV_USAGE_BOOKKEEP,
> +				    false, MAX_SCHEDULE_TIMEOUT);
> +	XE_WARN_ON(err <= 0);
> +
> +	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +		err = xe_vm_invalidate_vma(vma);
> +		XE_WARN_ON(err);
> +	}
> +
> +	if (is_deferred)
> +		userptr->finish_inuse = false;
> +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
> +}
> +
> +static struct mmu_interval_notifier_finish *
> +xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	bool signaled = true;
> +

xe_svm_assert_in_notifier(vm);

>  	/*
>  	 * Tell exec and rebind worker they need to repin and rebind this
>  	 * userptr.
> @@ -105,27 +129,32 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  	 */
>  	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
>  			    DMA_RESV_USAGE_BOOKKEEP);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence)
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>  		dma_fence_enable_sw_signaling(fence);
> +		if (signaled && !dma_fence_is_signaled(fence))
> +			signaled = false;
> +	}
>  	dma_resv_iter_end(&cursor);
>  
> -	err = dma_resv_wait_timeout(xe_vm_resv(vm),
> -				    DMA_RESV_USAGE_BOOKKEEP,
> -				    false, MAX_SCHEDULE_TIMEOUT);
> -	XE_WARN_ON(err <= 0);
> -
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> -		err = xe_vm_invalidate_vma(vma);
> -		XE_WARN_ON(err);
> +	/*
> +	 * Only one caller at a time can use the multi-pass state.
> +	 * If it's already in use, or all fences are already signaled,
> +	 * proceed directly to invalidation without deferring.
> +	 */
> +	if (signaled || userptr->finish_inuse) {
> +		xe_vma_userptr_do_inval(vm, uvma, false);
> +		return NULL;
>  	}
>  
> -	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> -			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
> +	userptr->finish_inuse = true;
> +
> +	return &userptr->finish;
>  }
>  
> -static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> -				   const struct mmu_notifier_range *range,
> -				   unsigned long cur_seq)
> +static bool xe_vma_userptr_invalidate_start(struct mmu_interval_notifier *mni,
> +					    const struct mmu_notifier_range *range,
> +					    unsigned long cur_seq,
> +					    struct mmu_interval_notifier_finish **p_finish)
>  {
>  	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
>  	struct xe_vma *vma = &uvma->vma;
> @@ -138,21 +167,40 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  		return false;
>  
>  	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> -	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
> +	       "NOTIFIER PASS1: addr=0x%016llx, range=0x%016llx",
>  		xe_vma_start(vma), xe_vma_size(vma));
>  
>  	down_write(&vm->svm.gpusvm.notifier_lock);
>  	mmu_interval_set_seq(mni, cur_seq);
>  
> -	__vma_userptr_invalidate(vm, uvma);
> +	*p_finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
> +
>  	up_write(&vm->svm.gpusvm.notifier_lock);
> -	trace_xe_vma_userptr_invalidate_complete(vma);
> +	if (!*p_finish)
> +		trace_xe_vma_userptr_invalidate_complete(vma);
>  
>  	return true;
>  }
>  
> +static void xe_vma_userptr_invalidate_finish(struct mmu_interval_notifier_finish *finish)
> +{
> +	struct xe_userptr_vma *uvma = container_of(finish, typeof(*uvma), userptr.finish);
> +	struct xe_vma *vma = &uvma->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "NOTIFIER PASS2: addr=0x%016llx, range=0x%016llx",
> +		xe_vma_start(vma), xe_vma_size(vma));
> +
> +	down_write(&vm->svm.gpusvm.notifier_lock);
> +	xe_vma_userptr_do_inval(vm, uvma, true);
> +	up_write(&vm->svm.gpusvm.notifier_lock);
> +	trace_xe_vma_userptr_invalidate_complete(vma);
> +}
> +
>  static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
> -	.invalidate = vma_userptr_invalidate,
> +	.invalidate_start = xe_vma_userptr_invalidate_start,
> +	.invalidate_finish = xe_vma_userptr_invalidate_finish,
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> @@ -164,6 +212,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
>   */
>  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  {
> +	static struct mmu_interval_notifier_finish *finish;
>  	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>  
>  	/* Protect against concurrent userptr pinning */
> @@ -179,7 +228,10 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
>  				     uvma->userptr.pages.notifier_seq))
>  		uvma->userptr.pages.notifier_seq -= 2;
> -	__vma_userptr_invalidate(vm, uvma);
> +
> +	finish = xe_vma_userptr_invalidate_pass1(vm, uvma);
> +	if (finish)
> +		xe_vma_userptr_do_inval(vm, uvma, true);
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index ef801234991e..4f42db61fd62 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -57,12 +57,26 @@ struct xe_userptr {
>  	 */
>  	struct mmu_interval_notifier notifier;
>  
> +	/**
> +	 * @finish: MMU notifier finish structure for two-pass invalidation.
> +	 * Embedded here to avoid allocation in the notifier callback.
> +	 * Protected by @vm::svm.gpusvm.notifier_lock.
> +	 */
> +	struct mmu_interval_notifier_finish finish;
> +	/**
> +	 * @finish_inuse: Whether @finish is currently in use by an in-progress
> +	 * two-pass invalidation.
> +	 * Protected by @vm::svm.gpusvm.notifier_lock.
> +	 */
> +	bool finish_inuse;
> +
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
>  	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
>  	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> +

Unrelated.

Matt

>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
> -- 
> 2.53.0
> 
