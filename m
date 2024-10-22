Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD59AB5D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143D10E701;
	Tue, 22 Oct 2024 18:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVAj3Oa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65B10E709;
 Tue, 22 Oct 2024 18:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729620791; x=1761156791;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MDxXIbOBwLL+fCRNOC92H/3o1xstWZpCWMEzStywS10=;
 b=ZVAj3Oa9kQm4Rhn4ClmjhGU3Kf56Rsl5YAZ76eO4kxl5F13QdU5tPsbH
 2PuRwzRRlx8G5rpxnsdcq0NRDizMcZiQWWvH943fui/ecKMrs05bhjoth
 1MjQ8m756tEeZdGRiHdvK4+SOCjSAJn2ZT146T/DtXKcEOOJEEkGRRfZg
 EiCMAvf+1PRK2Dl7ur9j5a0fjrt+2TiqC4J4EAdmgeRVz5XE/qSrjqe9c
 PwqZX16Kqf1ZNo33Wdap2SzdQDGmJ7fGe+kfyDg47OGVL92UwE++vi5eY
 bGHnrK067m/nFPUGtaTq5HzWsoznbE6lmwd+O+WNFS1xWqAOU8Ai7DcSl g==;
X-CSE-ConnectionGUID: 3jT6gbq6Q9iBnpzknHBmWA==
X-CSE-MsgGUID: gQfavo0vQT+6QqfiKTeZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29279321"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29279321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 11:13:05 -0700
X-CSE-ConnectionGUID: +co3Cs9MTnumDtr0/ANzhg==
X-CSE-MsgGUID: nzDB+xkYQYeN2kCV+8+iQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84564499"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 11:13:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 11:13:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 11:13:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 11:13:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+hrzB0RKUu8hURvTDBSfWkyxxTQhmuenHmlkkYWx8FSpdRN8aKYiCP+HG67HQkroiGh6AP4qOLMBWMnO4JQYUjnNNcidKxk3ncXtVN/RQ0mQskA4ErYRR1pQsEWErp7m+O8/Nbn/WE8V3s4iB2m7u+DkPj1MQCZCo0fqPUqPjm3IB0oqZIVnB0Ey+py99ZKWbDjsN+cVmujF3zqIy/L8YFRKA1Zlt6XGVntQrAJX3yg1ReEHPaW7vxQWYnbAKh5vA0uGUuozmxRCVqesou7nx/qrRshQuH7pTYf3yOCjnuUbrZ0zFVVu3jqvx61NvD5OqKD8B24vwdJrYRqrbM0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXrLeGA5DpCjOEhzzKeBy+U22tHK1T/zVQhlJ2H2FWM=;
 b=x5F3moIPcSDQl3C+lQffQ+TWUfIxoH3mHxyujYm/oKWCXaX73/OEomo5Nk0Ua/Oi4R6sBS1E8CycyziuPYgEABlm+hUggvpQEDlg8xpaQnXBYGAISApGHyL0b6NgSUuKN6C/9Nw68jTAaUdppRsfDyGCfpQhafabs74dZyHJzt+ZY4FDU6c2IsqKI1DPaIj3NS07RrFaWHXvd5q+o3BBCru02YZwasm653iDvwE4TdqiKQFjIh1F3kXzCvaUuhwolH2rWqw/NH2QXJi0atnMDqU98QaDw+9P22vS2OQjkoFcF637wj+D8G+kxPHpJUBs2xfaCpKkM8FHC7kz+0r1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 18:12:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 18:12:59 +0000
Date: Tue, 22 Oct 2024 18:11:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: [PATCH 1/4] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
Message-ID: <Zxfq50e+uXfcsark@DUT025-TGLU.fm.intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-2-matthew.brost@intel.com>
 <a5dd3b1d6b8da184ed16f5653faca95163b79340.camel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5dd3b1d6b8da184ed16f5653faca95163b79340.camel@redhat.com>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 787dfaeb-0a1c-4d1a-2b09-08dcf2c528ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AfnoTxMzNsZZG9coiEL0pgYTBsIfiVpIrVZaMRZ7m5J9gT3pFaJQs3X499?=
 =?iso-8859-1?Q?TqWn+OHZp+ea/MRAuPLnuqSCIi+RuN9kaLsItVEYr/hpgW1HeiQHr/yiF2?=
 =?iso-8859-1?Q?NGxOUNINwHn6QSec38wSK04LfFtrMggYW8XLoQs16+OmOD/xdTOQ0Z6mqn?=
 =?iso-8859-1?Q?F0Lw37nWpe7XVPL/g1W1LqRMnXCLeIzxosniH5QUDDwzfid45xZVrc22ok?=
 =?iso-8859-1?Q?yxT4NkmvDAudx9lh+BiBDYcJgRKNsOKvKldVrekASri5dKVQKwToy8aS3D?=
 =?iso-8859-1?Q?28XHQQgWMtzZgJeCwnPqo55lWw0QAASBBFJGDpNDoW8ScO/rDQiIWgBQEj?=
 =?iso-8859-1?Q?B/j1DPCz8HXzGkCasCTqixPHHtTU5suEiihauJQLifC5qGFnxb+1pWiljh?=
 =?iso-8859-1?Q?9ckfN5xs9Uf5JhvX47250EQFpxC1lMUKETMP5wyR/+h/wGi/ljI4HTYLUJ?=
 =?iso-8859-1?Q?E5S7g/I4fXD8mRnKj2RQeSti9bIILtX2UHj4ihFBl76l3xtscYQLko0N29?=
 =?iso-8859-1?Q?DfALdVPQ+y6Heq4a6m0HFVemCTZaqjQgninfQPzVWC6k056f54obTTSyu4?=
 =?iso-8859-1?Q?6jchj+1mmcPs6o+d2GQY9OIxquIMH9+pWtnZZOiw0Vd+PI8TSAbXDXcM0J?=
 =?iso-8859-1?Q?PejNqVfAkKSORA06ubvlIGe9i2wHz8o7YYbfYMAnJwTzGgWMoVGODQYnid?=
 =?iso-8859-1?Q?4Oi5MyhEZD7ICwepKOdUFsMdLFi7hhcelSCiAwdIi3rGijGSof5RjJ9yYV?=
 =?iso-8859-1?Q?nI6C5nJ/NJ4PVfAkYdkjEHEPVQLy0G5EjwqHJhPv19Qi5FGM0x7oZE7fxq?=
 =?iso-8859-1?Q?ya4ydY2cM9JLN8EB9gUT/gsoYOhdivBZcEXou+kXM3Ux8wX3DCMcF3AWIG?=
 =?iso-8859-1?Q?CWnGkchlox7A95CAX8JLyrlScYUzHwGCv6ZjulqvO5Nyo+4V9qCUu6pRc+?=
 =?iso-8859-1?Q?zHSU9rLX7dSWhse8TpK9OhG1CNQWt3gK8dbbN37ajgBbiG4xDAV5rddxEi?=
 =?iso-8859-1?Q?ua3PAdKVdl2GTrc8ksiMLTjwJuMqS+9hIe9ef56pabt3Ngvxk7MwPAQLph?=
 =?iso-8859-1?Q?wZ4nQKVYZjaudZbNFqbVm4s7U9lJDIS+oLusQqx1U9hlXs+hMp5l9VBMAo?=
 =?iso-8859-1?Q?578Vht+uffbHtuTMkb5RqHBtL3P7fyqBfxQkxpalYQkPHbF1Naj9YNYErS?=
 =?iso-8859-1?Q?pB2nz5L+cA2AfsjT8MZ+vmQp1fa0EX59psXUY9ho6UAr9j/Qw4ZzDDHcRT?=
 =?iso-8859-1?Q?EHX55jbNsC07FioYtupSF0oxHokznc703MlZnZ0LQcO7306JxRRNi04duL?=
 =?iso-8859-1?Q?aDU7xbCrNjGYgBq51hNiDeLAKOkTlHvGQsjfbvAW1iEFaJrzp78nAfPB3l?=
 =?iso-8859-1?Q?XM65r95oN1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GUJdTHXZM7UqsZDe9EAZwsO+xfJkd3/zYsok9De0wGlv0kEYYu2XBckfbV?=
 =?iso-8859-1?Q?32u3wkhtQ5+4/DTCFXIBgTbUXRPOqleGrWbG9ElO53A9mORSuMVkP+Mgui?=
 =?iso-8859-1?Q?n3SBa41Ysa+L8SYvRxA6mxfHFmACEgU4wC80ulKOKOPuAXpTezitqiMvZc?=
 =?iso-8859-1?Q?MrCYi90fI5riLqguLDqxitjUX4xNmA0opc2J64UtKOmd+XoFnbasjvrdIF?=
 =?iso-8859-1?Q?RLjFJSGkLQDosqlIhPXR79+5bN8frt6nNg7OQLp3pL8LlbVuawQEVs2pYb?=
 =?iso-8859-1?Q?vFFEGHDkhP552bf4JGwiTFcOKPuArKMksIcR1cfgiuBEUVwy4R02yV7K3C?=
 =?iso-8859-1?Q?49R6yailmH0uX3yJW7ZTnIQsj4uv27Z7+AXYOl40uQm2olYkZCuFZbQO4b?=
 =?iso-8859-1?Q?cANPKg7WIngW7PRfJqbvZa3qge/BkC6Wz8Zmt+HzvcE7myjrtzl2uUD0Dc?=
 =?iso-8859-1?Q?95a1t37zRGRiIQRl5pmIhjpHXgnwC1Or8Y9/vcffWLGvmzP0elZIEqrPR0?=
 =?iso-8859-1?Q?H7D8BRH88TomXyAbcdAegEkgnlrIxdDc0X6kKiAMpM/oCvunmvfrMZoJWh?=
 =?iso-8859-1?Q?KXdIWEuoSYzr3QqAigvVjQuEj6t2vM3nt3Lak0vNejeYJfRFo0HR3WiFF2?=
 =?iso-8859-1?Q?NioSqNx5LiBI/SHSc6xw+P/51HuUSOGqw04VNo2xhw8G4g2gqk7WqcvGbs?=
 =?iso-8859-1?Q?l1DVCH2ZuROrV38RRk2NZfMvGAh8lFVmfaF2w3XghMUzAZkVqj2IbfAQNL?=
 =?iso-8859-1?Q?Od+HT0SepY35YAxL5If+2dzXfG2dyS9kUU3k9f+FppzluofAo6a/dLOA8G?=
 =?iso-8859-1?Q?Q9fUh4ZvJi1yshGFEJSyNGoPSmjdTnKsLixmeSXRxttwOpJI4DE3u912f3?=
 =?iso-8859-1?Q?weGFi8s4SS0l1wQ/hj8GvVAKPjvRvUkIIqeGfyjMpCgRj44sIyBVMTOXgz?=
 =?iso-8859-1?Q?sd1CoICm9I/OF1w9FqLxvNdlsGDiqHyrhF0Fqh+qKi0Lxk0jvx68O0iVQf?=
 =?iso-8859-1?Q?Wc3YHQheNwF9isiXvZw0e+WyHxN79q1keFnX+MB5xgtss9PQZXmpZcliA2?=
 =?iso-8859-1?Q?o26039UrPdJXjEpxHTEYUOtbM1rsS9rjNg8iA9Sf9rkaCARItWxcr7XBPc?=
 =?iso-8859-1?Q?3GfMmZsymorpMCEsKeLARAiR+au02rfX5duRtGnr9vQefRPwVVUeNTotr7?=
 =?iso-8859-1?Q?vhTYX/0o+Sd+qBT6CkQEZwtArzQLX1WNbkskgWWwrdXtCi12Tc5X+6XV55?=
 =?iso-8859-1?Q?E4eiAz72awIpJSwmfyws4NgrZotDoSpOVtlzll/0qq41PYBeukpenO51op?=
 =?iso-8859-1?Q?oP2xLx/CS15ENRJ79qTEHlD7VdVPdxj3ZvnFFkka5Hm6Ds/tUMuBOvSKsy?=
 =?iso-8859-1?Q?E/3k1JZ6A42IehUklc1HBQvjcZvb/AkOMUrzTXRm5V6Ys5kRz4GEsdBX9Q?=
 =?iso-8859-1?Q?QJFGwqdZ5vgnEWDccUajuxSYEzbUiy03P3WiJjaVZlxSlR2hkI8enMmDlV?=
 =?iso-8859-1?Q?gphNooI58MoXiDxQr0CTLNCkWjYT6eWGegYNglmrxpWWFdBO5QPQT5z8aj?=
 =?iso-8859-1?Q?2u2LchlHC5UJgQM0RRLiGe9cV6LUuqN/KgFBHCcVpiq4rOoWzDpcffgxRS?=
 =?iso-8859-1?Q?85rmDz8sqfz6sab8/L/2hlCULdTo8H5qtrTS5jHhcB5wYJY5q8/s75+A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 787dfaeb-0a1c-4d1a-2b09-08dcf2c528ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 18:12:59.0217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+4MTAMdbOzVV14zlOUVd7oZUXApOSWLKGTO+SIj8COaelbTTFQ73RG/tdKbNdMxU9s1dNDPzJvbIMNgHHcflg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
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

On Tue, Oct 22, 2024 at 04:19:18PM +0200, Philipp Stanner wrote:
> On Mon, 2024-10-21 at 10:57 -0700, Matthew Brost wrote:
> > DRM scheduler work queues are used to submit jobs, jobs are in the
> > path
> 
> "scheduler work queues" is very generic, how about
> "drm_gpu_scheduler.submit_wq is used to submit jobs, [...]"
> 

Sure.

> > or dma-fences, and dma-fences are in the path of reclaim. Mark
> 
> s/or/of
> 

Yep.

> > scheduler
> > work queues with WQ_MEM_RECLAIM so these work queues can continue to
> > make forward progress during reclaim.
> 
> It is just *one* queue (per scheduler) really, isn't it?
> 

Yes.

> If the change above is applied, could just say: "Create the work queue
> with WQ_MEM_RECLAIM so it can continue [...]"
> 

Now you are confusing me.

> So for my understanding: is this a performance optimization or is it a
> bug? IOW, would forward progress just be delayed or entirely prevented?
> Would be cool to state that a bit more clearly in the commit message.
> 

I can make that a bit more clear.

> Work-queue docu says "MUST":
> 
> ``WQ_MEM_RECLAIM`` All wq which might be used in the memory reclaim
> paths **MUST** have this flag set. The wq is guaranteed to have at
> least one execution context regardless of memory pressure.
> 
> So it seems to me that this fixes a bug? Should it be backported in
> your opinion?
> 

Bug - yea probably a fix tag then for backporting. Will add in next rev.

> 
> > 
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> 
> btw., how did you send this email? I couldn't find Luben on CC. Added
> him.

git send-email...

I may have forgot to include him on the Cc list.

Matt

> 
> Thx,
> P.
> 
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 6e4d004d09ce..567811957c0f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1275,10 +1275,10 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> >   sched->own_submit_wq = false;
> >   } else {
> >  #ifdef CONFIG_LOCKDEP
> > - sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> > + sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
> > WQ_MEM_RECLAIM,
> >          &drm_sched_lockdep_map);
> >  #else
> > - sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > + sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> >  #endif
> >   if (!sched->submit_wq)
> >   return -ENOMEM;
> 
