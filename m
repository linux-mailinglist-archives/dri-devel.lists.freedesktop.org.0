Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B219F99EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4214110E0DE;
	Fri, 20 Dec 2024 19:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAMfxTLb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60AF10E0DE;
 Fri, 20 Dec 2024 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734721443; x=1766257443;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+y4rQX9kyH5aCExnVWs3p5EAvBgFKWcwdbJvkI5of/Y=;
 b=BAMfxTLbHqxnHmfYl7RRkgU1b3btBUeaDZPJ55LnxmY1Qdz91zO3TgdP
 JPMKEHD4KNmfvhRHfZAyV9ARIFPJymJrOfBoVikKDtRMZWBpkwb50l4wI
 U5GRlwWu6GyOttoNoBvG9Wcz1cp6q4QF5Y31yL9MQZE1VlUn4j8tj/SrE
 sIj+0e4z5C/edr12q+q6vSQHseOTb4NBswfiF8zX2p0FKjb2x5HUvWe1L
 2Ou34/oA2RqzGmDTYSAPDKqxzxNgwyYNLrWYg4WzVU/xumfMsw1xE3dYi
 opCnDsZgpuBtzI9ki7Ba3PlGPd+UJTxYCjYgitUnTAkI2xPlhOkRHY3wk w==;
X-CSE-ConnectionGUID: EuowF3zdSyytkLzzLtsqIw==
X-CSE-MsgGUID: iRt0IfPeSYSLx3c+yF5fVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46699630"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46699630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:04:02 -0800
X-CSE-ConnectionGUID: wjIfqTfUTgeR3bC7YyQnWg==
X-CSE-MsgGUID: 5RDBUnvxQ1SZDVc1rfj0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103576264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 11:04:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 11:04:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 11:04:01 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 11:04:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xsi1JLh9cjdURn+dlGCHTMFF4TjcAWKgfDRhzntzZ7MNCsy4DYGmVsp+1brQBtAazs7Y2o9iHrKkznYRYKg4dKZfF8If3eVGWklOPKdZ+aMK0p+DTNc02L97VR9PTngv6IBI/Djq6nCc9ujqqRJOWbCXOk9SoF+PO9UAUX4fGVijaXcOxTPotuMPS7HQUfhsqlHskwn6GnwLX3fJAiVMGsjwrKJ4WTr3UVWhsvGpRhq98jc/GE+5NPsMoc8Xi9twKZug22Cz03o7dVKQL2maVompXSd0X2Udzf7/nWXGYAWVLz4fCUxsg34z3JMGPkKwYwlJ8jACIIB7DfNMUOls7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZDPM5lnRO2nVMlj2Rf0VHNAUg2xH1/K0ZsoKhztV14=;
 b=afbr4fFMtLqiV8iJLc2pHqHQe6rhw3yz7dfvIQ3MBEbp2GPCjbWdl28KJXtA/kXMKso7rKgp3VVWgcHgZKmeP2EAr2zJcKbrVgRZ+zBwW0TeUiZare8b2z/rxxT52NP9NnqkABHfGHUFAn0N+P/yX9MCCCZA/h5FKZykndY2sVErkjUGvEdFUll5h3FPWuv07UiE75R91hIinJ8fzucdyg/O9xCSde2tjYcdowHtqeTk6vBKzKs2cJWKtt/oYXMENOR+h+GLU+tFzKQIWyhN8ZKWy8a63qoudWYyBvzktoPvLmNhEMEnJ81C+FdXNzn5CW0xMcOzSDzlhI9MUg7AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 19:03:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 19:03:51 +0000
Date: Fri, 20 Dec 2024 11:04:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 05/30] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Z2W/wxq3aW9zww70@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217233348.3519726-6-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dcfab0-9677-4a08-6581-08dd21290a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bUMUrDbenEcQyuc6r5lGmB6VBeyDrIbMkIpH73uSDJ5C/PRuVXVRZT8uSP?=
 =?iso-8859-1?Q?zswsBpGo9h4oRSn4W7iNl8HhUb670NSKFOVM+XeC7baXk/jLvUcQ8gMQ+3?=
 =?iso-8859-1?Q?bq8z4bvqPjqLUUFuTamfcfch3Io7XxbrnjLGFzNu4E7J3xinKR7XhAQXV0?=
 =?iso-8859-1?Q?JSDna8WfkkMIonDGcF4LgvMW8eNP5CtD91cZR4KV3fbClXta7RF/bmq5N2?=
 =?iso-8859-1?Q?aeK0WUE0yL+zqNFa5PuFX40pNq+EWDp+0/oWw/3yKqAEFS1pfG1ONgs7CI?=
 =?iso-8859-1?Q?MhecHxXNPgxXbTfcyjDpu6EFOBR4pEN6WIxb7zEtIW7hJPj6gM8yBhB04F?=
 =?iso-8859-1?Q?qpDbxDL6gIhkYhQuFnrpESOt31O5TP00wiEaYgl/S9LoD9Gl2jFrG7zkuo?=
 =?iso-8859-1?Q?ASVTvT0yNkPlwXWMVxjiX7t2w/WBvRIazIO0YdVSEUy/P0fsM+u4afWSwj?=
 =?iso-8859-1?Q?Iunaxz5w9a2vyw6RmBjhwlh5gNyBbWJGMxUogEAQYG4wQo1YG2pByAbsRx?=
 =?iso-8859-1?Q?lDQV+iJjDFmcHK1QAyH8DC/fXveAFKLETy2Igfb89E+iqCLdSMF4waBm+t?=
 =?iso-8859-1?Q?FTkEMjPchREhDEGId82HzDMpWVCnv+oV44BTFJo47rtitVMZG39mzQ5rPM?=
 =?iso-8859-1?Q?FTGcuT3PuxwSyki99Pqa7K1/jzKDF2zorMgMj0an3iiFFdm7S4Z4hgM264?=
 =?iso-8859-1?Q?EjYs0cgjdpezdFEPyudbyPYSq1c9qSixSXRmlzbrxXcXbVP2ASlwpk5Bsc?=
 =?iso-8859-1?Q?hmWAyQk9TVw7kcHG0scE1JrDkQVCAvM1zbaCHtjJ27FJ5hjkhYDw8VoWfI?=
 =?iso-8859-1?Q?CmHNrOmM8DRLm60Y1kXdA+FmnU8Vrp4+l8P2S0w730UjluxjpTVtZuru6p?=
 =?iso-8859-1?Q?4yqjLPvG3HjwZLxjR1MoujJHi1Or6xFOb0g0IafJJw31d/64M/Zy0/QNhJ?=
 =?iso-8859-1?Q?P1KKKRb4pe4C4A4bhWd88FnS2ifllc5CvQt7CXdWo+IzNQ3h0lc5XFSq9t?=
 =?iso-8859-1?Q?jCHMKud6+nhv8QOomLa4jqZ8IrOZUkz4SHp9qGj6o650HdajTjKcstfD9e?=
 =?iso-8859-1?Q?nVJcIg+6zXNGQeEesdUNwjMfscCY7Z/pFDwW3I7hC2OtWTBDEE3hEjR8zZ?=
 =?iso-8859-1?Q?EYRLLYB/FcBNdXdm2Bgd5LIaQmglGmdWcI/6UMGnbKAzQ8Xf4DK1+pkirO?=
 =?iso-8859-1?Q?Is9/BEjmW17XTS4dU0MMoHbBedXOcQ3gf8mJFHE+Rqh6T5acxila+gAiAL?=
 =?iso-8859-1?Q?xCUGBvm/G0a+D2E40+UVhgHj0mCvVIIo/9L3Inawaj/R6U5mKYRYPO8VTO?=
 =?iso-8859-1?Q?I9tXXPKxnC9gnD+tdbW7XuTqR3FAN/XgtvRQmU35buM+A5sladbkUFotDb?=
 =?iso-8859-1?Q?iP7hsVqwYSaWn0D6KqMDMEHYeIV4pHtZibOwoxuIKIgBEm+zXPLpKGwOoC?=
 =?iso-8859-1?Q?NK/vQipwp196AE+K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IbDCH9tdc+PWGLWLZVMLYtVAvnKHwN7uaMDqRR3/yKiyTPde4wG75yEKbY?=
 =?iso-8859-1?Q?5wBDFGXVxk8GmWwPsBjD7ZmYEPhswuxZCjj9EGW9NNoCFbt4patT5CcLY5?=
 =?iso-8859-1?Q?v3sVtqTQv2BYgwp5RPkxF5v1SvrKKtjyNvlgxcFPMMj/mGz4ehb8husxe7?=
 =?iso-8859-1?Q?mk/H/kb8/haV+wtjuO58ckkgpQqKQ/m5sA1kovRzs2G8p9P9+i40o8391h?=
 =?iso-8859-1?Q?GVfGwcMX6mnMEeZDgz497mELVAq2FKIEIOhbHMKeyE2aVmYRQx/e9wZBKn?=
 =?iso-8859-1?Q?iUhT72srJ5gR4THzZR6wbz7eI9q0b6wK1wU3in25XWxilU2DjPXLPadr1K?=
 =?iso-8859-1?Q?dGq9U5x6o0hwxAa/EKHND1ZccR2tXPcG0p8S5p2s/BIjNGvLH4GFCBv/bg?=
 =?iso-8859-1?Q?m0Cg1FAQqg83cPT5+77sbYLWG2s5qiFmxnA7xZMscYXlSGtd+ZZETb1ncc?=
 =?iso-8859-1?Q?B6LvPL6Yo2RZODEsxsI8mwUecCr0E38ULAxQ81YpHHG1ymL+dQoeTAQ2js?=
 =?iso-8859-1?Q?csNsrHgh1mxRFLC4CVd3vsL/vOu9O/JkjH2mIeUQTzJvieS8KudqPqy/0r?=
 =?iso-8859-1?Q?XwpgUHyd6uiW3HV1BcRG7ri776J9q7iCKbkPt9PCoiBwSAWlJDTy1sdkgE?=
 =?iso-8859-1?Q?aCKtBvDOS0ZCNlPMhSTzfzVwczzqluerZEGL2OPBm5nWG8U74w9qaLusSq?=
 =?iso-8859-1?Q?dk8vocjayYqLk0YdWTFz6FWDAqA3//VCebihui12oPSM1mY2JB0u2Wk8iY?=
 =?iso-8859-1?Q?ttC6OytcFiORghJOKs1bvDZgL7JHvdXVqF2sggm/TuURCLsUT9w5N/3Qp2?=
 =?iso-8859-1?Q?gSW+5Mg7NPviN94cwvCAEGuN0JYkIo3CP2AwumIxLSqv1S/xrDPkZ2TZOQ?=
 =?iso-8859-1?Q?8E+GyftGxJf4aE+kK9vN3kXry/y/T1zM9IERL1kH7RF/PB4EmZzZqnv/nv?=
 =?iso-8859-1?Q?7JWKNvrU6glhGUSutj4ifjPZ3F252LjxK2GhpYxaI+/W1yMAGJmhlzyHh5?=
 =?iso-8859-1?Q?Q1yk86+Bj4ON4FAGgAGw8ma9XywLIFMGeGAg56CSZoSrT+tjQOfgvL0C1y?=
 =?iso-8859-1?Q?b20YT2N5EeAqG/I0izr93EdWBbhYH3WVNLKGbyv0hQ0cDy4/R2VgmaEmz+?=
 =?iso-8859-1?Q?MlnIKBS6D7PCBTsuse/jpFeZ0R4Y7aeoRBfl6D+jFSzwqDDmjP2s5oXL7J?=
 =?iso-8859-1?Q?qD7mV9M87RADU+VBWNg7MhACk+5wGcZ7LUSXh/EywhuRog0Bzq6lc7UZN7?=
 =?iso-8859-1?Q?Rq85M0YN04LgkB5bhTATQpbe44jG/n7XuYneNClTELzanOgVoD8JMS2VgJ?=
 =?iso-8859-1?Q?gCkQtoPE1lzvzAxKuYZ7AJVmtS6xvO5SehwZDvMERekOxwdVzV/6wm6jjB?=
 =?iso-8859-1?Q?UkmxP7elPJPtmWQ4Csyt1GyVw2cPjam5KBhAnoIVboZLpJqrl2IoSaQG9G?=
 =?iso-8859-1?Q?oIZ03YHl+QiS0BW1ryeLvCU1SMMjeJQmGKSUC8+IrYlRkwpw9UnT5fn2Sf?=
 =?iso-8859-1?Q?Ngi0d2G5NJBFkCg4dxGfktH+t1edtfVhBqm5DTrMma9xu5CLOt4lOAMVLu?=
 =?iso-8859-1?Q?5aFemePPuyXerU37k7IRnVTSdGDPmuBUsbfAxM1+ssXXUjI224A/uXUqSN?=
 =?iso-8859-1?Q?Z0L421kuvKJ39/OSZazRfXpuSnXkH6iE8aHHpct+KW+QoKTydDhhvpLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dcfab0-9677-4a08-6581-08dd21290a9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 19:03:51.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xePRRqG/6iJQ2oJ/IlPkK4pdedGqeZFIecN6TMj1143A7QVKeyhI+RXF0SaquuufR7oGwo0Ykb8l4oiZaz5q2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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

On Tue, Dec 17, 2024 at 03:33:23PM -0800, Matthew Brost wrote:
> This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> sharing of memory between the CPU and GPU, enhancing performance and
> flexibility in GPU computing tasks.
> 
> The patch adds the necessary infrastructure for SVM, including data
> structures and functions for managing SVM ranges and notifiers. It also
> provides mechanisms for allocating, deallocating, and migrating memory
> regions between system RAM and GPU VRAM.
> 
> This is largely inspired by GPUVM.
> 
> v2:
>  - Take order into account in check pages
>  - Clear range->pages in get pages error
>  - Drop setting dirty or accessed bit in get pages (Vetter)
>  - Remove mmap assert for cpu faults
>  - Drop mmap write lock abuse (Vetter, Christian)
>  - Decouple zdd from range (Vetter, Oak)
>  - Add drm_gpusvm_range_evict, make it work with coherent pages
>  - Export drm_gpusvm_evict_to_sram, only use in BO evict path (Vetter)
>  - mmget/put in drm_gpusvm_evict_to_sram
>  - Drop range->vram_alloation variable
>  - Don't return in drm_gpusvm_evict_to_sram until all pages detached
>  - Don't warn on mixing sram and device pages
>  - Update kernel doc
>  - Add coherent page support to get pages
>  - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
>  - Add struct drm_gpusvm_vram and ops (Thomas)
>  - Update the range's seqno if the range is valid (Thomas)
>  - Remove the is_unmapped check before hmm_range_fault (Thomas)
>  - Use drm_pagemap (Thomas)
>  - Drop kfree_mapping (Thomas)
>  - dma mapp pages under notifier lock (Thomas)
>  - Remove ctx.prefault
>  - Remove ctx.mmap_locked
>  - Add ctx.check_pages
>  - s/vram/devmem (Thomas)
> v3:
>  - Fix memory leak drm_gpusvm_range_get_pages
>  - Only migrate pages with same zdd on CPU fault
>  - Loop over al VMAs in drm_gpusvm_range_evict
>  - Make GPUSVM a drm level module
>  - GPL or MIT license
>  - Update main kernel doc (Thomas)
>  - Prefer foo() vs foo for functions in kernel doc (Thomas)
>  - Prefer functions over macros (Thomas)
>  - Use unsigned long vs u64 for addresses (Thomas)
>  - Use standard interval_tree (Thomas)
>  - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)
>  - Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas)
>  - Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
>  - Newlines between functions defs in header file (Thomas)
>  - Drop shall language in driver vfunc kernel doc (Thomas)
>  - Move some static inlines from head to C file (Thomas)
>  - Don't allocate pages under page lock in drm_gpusvm_migrate_populate_ram_pfn (Thomas)
>  - Change check_pages to a threshold
> 
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian K�nig <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr�m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/Kconfig      |    8 +
>  drivers/gpu/drm/Makefile     |    1 +
>  drivers/gpu/drm/drm_gpusvm.c | 2220 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h     |  445 +++++++
>  4 files changed, 2674 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_gpusvm.c
>  create mode 100644 include/drm/drm_gpusvm.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2f51546b0b88..5524cb1ed9dd 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -278,6 +278,14 @@ config DRM_GPUVM
>  	  GPU-VM representation providing helpers to manage a GPUs virtual
>  	  address space
>  
> +config DRM_GPUSVM
> +	tristate
> +	depends on DRM
> +	depends on DEVICE_MIGRATION
> +	help
> +	  GPU-SVM representation providing helpers to manage a GPUs shared
> +	  virtual memory
> +
>  config DRM_BUDDY
>  	tristate
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 19fb370fbc56..ca5d44441fb6 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -104,6 +104,7 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
>  #
>  obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>  obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
> +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>  
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> new file mode 100644
> index 000000000000..29ce2c7d1c8c
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -0,0 +1,2220 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright � 2024 Intel Corporation
> + *
> + * Authors:
> + *     Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/hmm.h>
> +#include <linux/memremap.h>
> +#include <linux/migrate.h>
> +#include <linux/mm_types.h>
> +#include <linux/pagemap.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_gpusvm.h>
> +#include <drm/drm_pagemap.h>
> +#include <drm/drm_print.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct Rendering Manager (DRM)
> + *
> + * The GPU SVM layer is a component of the DRM framework designed to manage shared
> + * virtual memory between the CPU and GPU. It enables efficient data exchange and
> + * processing for GPU-accelerated applications by allowing memory sharing and
> + * synchronization between the CPU's and GPU's virtual address spaces.
> + *
> + * Key GPU SVM Components:
> + * - Notifiers: Notifiers: Used for tracking memory intervals and notifying the
> + *		GPU of changes, notifiers are sized based on a GPU SVM
> + *		initialization parameter, with a recommendation of 512M or
> + *		larger. They maintain a Red-BlacK tree and a list of ranges that
> + *		fall within the notifier interval. Notifiers are tracked within
> + *		a GPU SVM Red-BlacK tree and list and are dynamically inserted
> + *		or removed as ranges within the interval are created or
> + *		destroyed.
> + * - Ranges: Represent memory ranges mapped in a DRM device and managed
> + *	     by GPU SVM. They are sized based on an array of chunk sizes, which
> + *	     is a GPU SVM initialization parameter, and the CPU address space.
> + *	     Upon GPU fault, the largest aligned chunk that fits within the
> + *	     faulting CPU address space is chosen for the range size. Ranges are
> + *	     expected to be dynamically allocated on GPU fault and removed on an
> + *	     MMU notifier UNMAP event. As mentioned above, ranges are tracked in
> + *	     a notifier's Red-Black tree.
> + * - Operations: Define the interface for driver-specific GPU SVM operations
> + *               such as range allocation, notifier allocation, and
> + *               invalidations.
> + * - Device Memory Allocations: Embedded structure containing enough information
> + *                              for GPU SVM to migrate to / from device memory.
> + * - Device Memory Operations: Define the interface for driver-specific device
> + *                             memory operations release memory, populate pfns,
> + *                             and copy to / from device memory.
> + *
> + * This layer provides interfaces for allocating, mapping, migrating, and
> + * releasing memory ranges between the CPU and GPU. It handles all core memory
> + * management interactions (DMA mapping, HMM, and migration) and provides
> + * driver-specific virtual functions (vfuncs). This infrastructure is sufficient
> + * to build the expected driver components for an SVM implementation as detailed
> + * below.
> + *
> + * Expected Driver Components:
> + * - GPU page fault handler: Used to create ranges and notifiers based on the
> + *			     fault address, optionally migrate the range to
> + *			     device memory, and create GPU bindings.
> + * - Garbage collector: Used to unmap and destroy GPU bindings for ranges.
> + *			Ranges are expected to be added to the garbage collector
> + *			upon a MMU_NOTIFY_UNMAP event in notifier callback.
> + * - Notifier callback: Used to invalidate and DMA unmap GPU bindings for
> + *			ranges.
> + */
> +
> +/**
> + * DOC: Locking
> + *
> + * GPU SVM handles locking for core MM interactions, i.e., it locks/unlocks the
> + * mmap lock as needed.
> + *
> + * GPU SVM introduces a global notifier lock, which safeguards the notifier's
> + * range RB tree and list, as well as the range's DMA mappings and sequence
> + * number. GPU SVM manages all necessary locking and unlocking operations,
> + * except for the recheck range's pages being valid
> + * (drm_gpusvm_range_pages_valid) when the driver is committing GPU bindings. This
> + * lock corresponds to the 'driver->update' lock mentioned in the HMM
> + * documentation (TODO: Link). Future revisions may transition from a GPU SVM
> + * global lock to a per-notifier lock if finer-grained locking is deemed
> + * necessary.
> + *
> + * In addition to the locking mentioned above, the driver should implement a
> + * lock to safeguard core GPU SVM function calls that modify state, such as
> + * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove. This lock is
> + * denoted as 'driver_svm_lock' in code examples. Finer grained driver side
> + * locking should also be possible for concurrent GPU fault processing within a
> + * single GPU SVM. The 'driver_svm_lock' can be via drm_gpusvm_driver_set_lock
> + * to add annotations to GPU SVM.
> + */
> +
> +/**
> + * DOC: Migration
> + *
> + * The migration support is quite simple, allowing migration between RAM and
> + * device memory at the range granularity. For example, GPU SVM currently does not
> + * support mixing RAM and device memory pages within a range. This means that upon GPU
> + * fault, the entire range can be migrated to device memory, and upon CPU fault, the
> + * entire range is migrated to RAM. Mixed RAM and device memory storage within a range
> + * could be added in the future if required.
> + *
> + * The reasoning for only supporting range granularity is as follows: it
> + * simplifies the implementation, and range sizes are driver-defined and should
> + * be relatively small.
> + */
> +
> +/**
> + * DOC: Partial Unmapping of Ranges
> + *
> + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by CPU resulting
> + * in MMU_NOTIFY_UNMAP event) presents several challenges, with the main one
> + * being that a subset of the range still has CPU and GPU mappings. If the
> + * backing store for the range is in device memory, a subset of the backing store has
> + * references. One option would be to split the range and device memory backing store,
> + * but the implementation for this would be quite complicated. Given that
> + * partial unmappings are rare and driver-defined range sizes are relatively
> + * small, GPU SVM does not support splitting of ranges.
> + *
> + * With no support for range splitting, upon partial unmapping of a range, the
> + * driver is expected to invalidate and destroy the entire range. If the range
> + * has device memory as its backing, the driver is also expected to migrate any
> + * remaining pages back to RAM.
> + */
> +
> +/**
> + * DOC: Examples
> + *
> + * This section provides three examples of how to build the expected driver
> + * components: the GPU page fault handler, the garbage collector, and the
> + * notifier callback.
> + *
> + * The generic code provided does not include logic for complex migration
> + * policies, optimized invalidations, fined grained driver locking, or other
> + * potentially required driver locking (e.g., DMA-resv locks).
> + *
> + * 1) GPU page fault handler
> + *
> + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct drm_gpusvm_range *range)
> + *	{
> + *		int err = 0;
> + *
> + *		driver_alloc_and_setup_memory_for_bind(gpusvm, range);
> + *
> + *		drm_gpusvm_notifier_lock(gpusvm);
> + *		if (drm_gpusvm_range_pages_valid(range))
> + *			driver_commit_bind(gpusvm, range);
> + *		else
> + *			err = -EAGAIN;
> + *		drm_gpusvm_notifier_unlock(gpusvm);
> + *
> + *		return err;
> + *	}
> + *
> + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, unsigned long fault_addr,
> + *			     unsigned long gpuva_start, unsigned long gpuva_end)
> + *	{
> + *		struct drm_gpusvm_ctx ctx = {};
> + *		int err;
> + *
> + *		driver_svm_lock();
> + *	retry:
> + *		// Always process UNMAPs first so view of GPU SVM ranges is current
> + *		driver_garbage_collector(gpusvm);
> + *
> + *		range = drm_gpusvm_range_find_or_insert(gpusvm, fault_addr,
> + *							gpuva_start, gpuva_end,
> + *						        &ctx);
> + *		if (IS_ERR(range)) {
> + *			err = PTR_ERR(range);
> + *			goto unlock;
> + *		}
> + *
> + *		if (driver_migration_policy(range)) {
> + *			devmem = driver_alloc_devmem();
> + *			err = drm_gpusvm_migrate_to_devmem(gpusvm, range,
> + *							   devmem_allocation,
> + *							   &ctx);
> + *			if (err)	// CPU mappings may have changed
> + *				goto retry;
> + *		}
> + *
> + *		err = drm_gpusvm_range_get_pages(gpusvm, range, &ctx);
> + *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed
> + *			if (err == -EOPNOTSUPP)
> + *				drm_gpusvm_range_evict(gpusvm, range);
> + *			goto retry;
> + *		} else if (err) {
> + *			goto unlock;
> + *		}
> + *
> + *		err = driver_bind_range(gpusvm, range);
> + *		if (err == -EAGAIN)	// CPU mappings changed
> + *			goto retry
> + *
> + *	unlock:
> + *		driver_svm_unlock();
> + *		return err;
> + *	}
> + *
> + * 2) Garbage Collector.
> + *
> + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> + *					struct drm_gpusvm_range *range)
> + *	{
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		// Partial unmap, migrate any remaining device memory pages back to RAM
> + *		if (range->flags.partial_unmap)
> + *			drm_gpusvm_range_evict(gpusvm, range);
> + *
> + *		driver_unbind_range(range);
> + *		drm_gpusvm_range_remove(gpusvm, range);
> + *	}
> + *
> + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> + *	{
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		for_each_range_in_garbage_collector(gpusvm, range)
> + *			__driver_garbage_collector(gpusvm, range);
> + *	}
> + *
> + * 3) Notifier callback.
> + *
> + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> + *				 struct drm_gpusvm_notifier *notifier,
> + *				 const struct mmu_notifier_range *mmu_range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
> + *		struct drm_gpusvm_range *range = NULL;
> + *
> + *		driver_invalidate_device_pages(gpusvm, mmu_range->start, mmu_range->end);
> + *
> + *		drm_gpusvm_for_each_range(range, notifier, mmu_range->start,
> + *					  mmu_range->end) {
> + *			drm_gpusvm_range_unmap_pages(gpusvm, range, &ctx);
> + *
> + *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
> + *				continue;
> + *
> + *			drm_gpusvm_range_set_unmapped(range, mmu_range);
> + *			driver_garbage_collector_add(gpusvm, range);
> + *		}
> + *	}
> + */
> +
> +/**
> + * npages_in_range() - Calculate the number of pages in a given range
> + * @start: The start address of the range
> + * @end: The end address of the range
> + *
> + * This macro calculates the number of pages in a given memory range,
> + * specified by the start and end addresses. It divides the difference
> + * between the end and start addresses by the page size (PAGE_SIZE) to
> + * determine the number of pages in the range.
> + *
> + * Return: The number of pages in the specified range.
> + */
> +static unsigned long
> +npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (end - start) >> PAGE_SHIFT;
> +}
> +
> +/**
> + * struct drm_gpusvm_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @destroy_work: Work structure for asynchronous zdd destruction
> + * @devmem_allocation: device memory allocation
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up a device
> + * memory allocation upon CPU page fault and asynchronously releasing device
> + * memory once the CPU has no page references. Asynchronous release is useful
> + * because CPU page references can be dropped in IRQ contexts, while releasing
> + * device memory likely requires sleeping locks.
> + */
> +struct drm_gpusvm_zdd {
> +	struct kref refcount;
> +	struct work_struct destroy_work;
> +	struct drm_gpusvm_devmem *devmem_allocation;
> +	void *device_private_page_owner;
> +};
> +
> +/**
> + * drm_gpusvm_zdd_destroy_work_func() - Work function for destroying a zdd
> + * @w: Pointer to the work_struct
> + *
> + * This function releases device memory, puts GPU SVM range, and frees zdd.
> + */
> +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct *w)
> +{
> +	struct drm_gpusvm_zdd *zdd =
> +		container_of(w, struct drm_gpusvm_zdd, destroy_work);
> +	const struct drm_gpusvm_devmem_ops *ops = zdd->devmem_allocation ?
> +		zdd->devmem_allocation->ops : NULL;
> +
> +	if (zdd->devmem_allocation && ops->devmem_release)
> +		ops->devmem_release(zdd->devmem_allocation);
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This function allocates and initializes a new zdd structure. It sets up the
> + * reference count and initializes the destroy work.
> + *
> + * Returns:
> + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_zdd *
> +drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> +{
> +	struct drm_gpusvm_zdd *zdd;
> +
> +	zdd = kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	INIT_WORK(&zdd->destroy_work, drm_gpusvm_zdd_destroy_work_func);
> +	zdd->devmem_allocation = NULL;
> +	zdd->device_private_page_owner = device_private_page_owner;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd structure.
> + *
> + * Returns: Pointer to the zdd structure.
> + */
> +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous destruction.
> + */
> +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_gpusvm_zdd *zdd =
> +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> +
> +	if (zdd->devmem_allocation)
> +		WRITE_ONCE(zdd->devmem_allocation->detached, true);
> +	schedule_work(&zdd->destroy_work);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_put() - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd structure
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
> + * @notifier: Pointer to the GPU SVM notifier structure.
> + * @start: Start address of the range
> + * @end: End address of the range
> + *
> + * Return: A pointer to the drm_gpusvm_range if found or NULL
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
> +		      unsigned long end)
> +{
> +	struct interval_tree_node *itree;
> +
> +	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
> +
> +	if (itree)
> +		return container_of(itree, struct drm_gpusvm_range, itree);
> +	else
> +		return NULL;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
> +
> +/**
> + * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
> +	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
> +	     (next__) = __drm_gpusvm_range_next(range__);				\
> +	     (range__) && (range__->itree.start < (end__));				\
> +	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
> +
> +/**
> + * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
> + *         the current notifier is the last one or if the input notifier is
> + *         NULL.
> + */
> +static struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{
> +	if (notifier && !list_is_last(&notifier->entry,
> +				      &notifier->gpusvm->notifier_list))
> +		return list_next_entry(notifier, entry);
> +
> +	return NULL;
> +}
> +
> +static struct drm_gpusvm_notifier *
> +notifier_iter_first(struct rb_root_cached *root, unsigned long start,
> +		    unsigned long last)
> +{
> +	struct interval_tree_node *itree;
> +
> +	itree = interval_tree_iter_first(root, start, last);
> +
> +	if (itree)
> +		return container_of(itree, struct drm_gpusvm_notifier, itree);
> +	else
> +		return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
> +	     (notifier__) && (notifier__->itree.start < (end__));			\
> +	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
> +	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
> +	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
> +	     (notifier__) && (notifier__->itree.start < (end__));			\
> +	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
> + * @mni: Pointer to the mmu_interval_notifier structure.
> + * @mmu_range: Pointer to the mmu_notifier_range structure.
> + * @cur_seq: Current sequence number.
> + *
> + * This function serves as a generic MMU notifier for GPU SVM. It sets the MMU
> + * notifier sequence number and calls the driver invalidate vfunc under
> + * gpusvm->notifier_lock.
> + *
> + * Returns:
> + * true if the operation succeeds, false otherwise.
> + */
> +static bool
> +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
> +			       const struct mmu_notifier_range *mmu_range,
> +			       unsigned long cur_seq)
> +{
> +	struct drm_gpusvm_notifier *notifier =
> +		container_of(mni, typeof(*notifier), notifier);
> +	struct drm_gpusvm *gpusvm = notifier->gpusvm;
> +
> +	if (!mmu_notifier_range_blockable(mmu_range))
> +		return false;
> +
> +	down_write(&gpusvm->notifier_lock);
> +	mmu_interval_set_seq(mni, cur_seq);
> +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> +	up_write(&gpusvm->notifier_lock);
> +
> +	return true;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
> + */
> +static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
> +	.invalidate = drm_gpusvm_notifier_invalidate,
> +};
> +
> +/**
> + * drm_gpusvm_init() - Initialize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @name: Name of the GPU SVM.
> + * @drm: Pointer to the DRM device structure.
> + * @mm: Pointer to the mm_struct for the address space.
> + * @device_private_page_owner: Device private pages owner.
> + * @mm_start: Start address of GPU SVM.
> + * @mm_range: Range of the GPU SVM.
> + * @notifier_size: Size of individual notifiers.
> + * @ops: Pointer to the operations structure for GPU SVM.
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> + *               Entries should be powers of 2 in descending order with last
> + *               entry being SZ_4K.
> + * @num_chunks: Number of chunks.
> + *
> + * This function initializes the GPU SVM.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure.
> + */
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    unsigned long mm_start, unsigned long mm_range,
> +		    unsigned long notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const unsigned long *chunk_sizes, int num_chunks)
> +{
> +	if (!ops->invalidate || !num_chunks)
> +		return -EINVAL;
> +
> +	gpusvm->name = name;
> +	gpusvm->drm = drm;
> +	gpusvm->mm = mm;
> +	gpusvm->device_private_page_owner = device_private_page_owner;
> +	gpusvm->mm_start = mm_start;
> +	gpusvm->mm_range = mm_range;
> +	gpusvm->notifier_size = notifier_size;
> +	gpusvm->ops = ops;
> +	gpusvm->chunk_sizes = chunk_sizes;
> +	gpusvm->num_chunks = num_chunks;
> +
> +	mmgrab(mm);
> +	gpusvm->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> +
> +	init_rwsem(&gpusvm->notifier_lock);
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&gpusvm->notifier_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +#ifdef CONFIG_LOCKDEP
> +	gpusvm->lock_dep_map = NULL;
> +#endif
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_init);
> +
> +/**
> + * drm_gpusvm_notifier_find() - Find GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + *
> + * This function finds the GPU SVM notifier associated with the fault address.
> + *
> + * Returns:
> + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> + */
> +static struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
> +			 unsigned long fault_addr)
> +{
> +	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
> +}
> +
> +/**
> + * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
> + * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_notifier structure.
> + */
> +static struct drm_gpusvm_notifier *to_drm_gpusvm_notifier(struct rb_node *node)
> +{
> +	return container_of(node, struct drm_gpusvm_notifier, itree.rb);
> +}
> +
> +/**
> + * drm_gpusvm_notifier_insert() - Insert GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function inserts the GPU SVM notifier into the GPU SVM RB tree and list.
> + */
> +static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	interval_tree_insert(&notifier->itree, &gpusvm->root);
> +
> +	node = rb_prev(&notifier->itree.rb);
> +	if (node)
> +		head = &(to_drm_gpusvm_notifier(node))->entry;
> +	else
> +		head = &gpusvm->notifier_list;
> +
> +	list_add(&notifier->entry, head);
> +}
> +
> +/**
> + * drm_gpusvm_notifier_remove() - Remove GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM tructure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function removes the GPU SVM notifier from the GPU SVM RB tree and list.
> + */
> +static void drm_gpusvm_notifier_remove(struct drm_gpusvm *gpusvm,
> +				       struct drm_gpusvm_notifier *notifier)
> +{
> +	interval_tree_remove(&notifier->itree, &gpusvm->root);
> +	list_del(&notifier->entry);
> +}
> +
> +/**
> + * drm_gpusvm_fini() - Finalize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + *
> + * This function finalizes the GPU SVM by cleaning up any remaining ranges and
> + * notifiers, and dropping a reference to struct MM.
> + */
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0, LONG_MAX) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		/*
> +		 * Remove notifier first to avoid racing with any invalidation
> +		 */
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +		notifier->flags.removed = true;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, 0,
> +					       LONG_MAX)
> +			drm_gpusvm_range_remove(gpusvm, range);
> +	}
> +
> +	mmdrop(gpusvm->mm);
> +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
> +
> +/**
> + * drm_gpusvm_notifier_alloc() - Allocate GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + *
> + * This function allocates and initializes the GPU SVM notifier structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM notifier on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, unsigned long fault_addr)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	if (gpusvm->ops->notifier_alloc)
> +		notifier = gpusvm->ops->notifier_alloc();
> +	else
> +		notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
> +
> +	if (!notifier)
> +		return ERR_PTR(-ENOMEM);
> +
> +	notifier->gpusvm = gpusvm;
> +	notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
> +	notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
> +	INIT_LIST_HEAD(&notifier->entry);
> +	notifier->root = RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&notifier->range_list);
> +
> +	return notifier;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_free() - Free GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function frees the GPU SVM notifier structure.
> + */
> +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> +				     struct drm_gpusvm_notifier *notifier)
> +{
> +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> +
> +	if (gpusvm->ops->notifier_free)
> +		gpusvm->ops->notifier_free(notifier);
> +	else
> +		kfree(notifier);
> +}
> +
> +/**
> + * to_drm_gpusvm_range() - retrieve the container struct for a given rbtree node
> + * @node: a pointer to the rbtree node embedded within a drm_gpusvm_range struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_range structure.
> + */
> +static struct drm_gpusvm_range *to_drm_gpusvm_range(struct rb_node *node)
> +{
> +	return container_of(node, struct drm_gpusvm_range, itree.rb);
> +}
> +
> +/**
> + * drm_gpusvm_range_insert() - Insert GPU SVM range
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function inserts the GPU SVM range into the notifier RB tree and list.
> + */
> +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier *notifier,
> +				    struct drm_gpusvm_range *range)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> +	interval_tree_insert(&range->itree, &notifier->root);
> +
> +	node = rb_prev(&range->itree.rb);
> +	if (node)
> +		head = &(to_drm_gpusvm_range(node))->entry;
> +	else
> +		head = &notifier->range_list;
> +
> +	list_add(&range->entry, head);
> +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> +}
> +
> +/**
> + * __drm_gpusvm_range_remove() - Remove GPU SVM range
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This macro removes the GPU SVM range from the notifier RB tree and list.
> + */
> +static void __drm_gpusvm_range_remove(struct drm_gpusvm_notifier *notifier,
> +				      struct drm_gpusvm_range *range)
> +{
> +	interval_tree_remove(&range->itree, &notifier->root);
> +	list_del(&range->entry);
> +}
> +
> +/**
> + * drm_gpusvm_range_alloc() - Allocate GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @fault_addr: Fault address
> + * @chunk_size: Chunk size
> + * @migrate_devmem: Flag indicating whether to migrate device memory
> + *
> + * This function allocates and initializes the GPU SVM range structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM range on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_range *
> +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> +		       struct drm_gpusvm_notifier *notifier,
> +		       unsigned long fault_addr, unsigned long chunk_size,
> +		       bool migrate_devmem)
> +{
> +	struct drm_gpusvm_range *range;
> +
> +	if (gpusvm->ops->range_alloc)
> +		range = gpusvm->ops->range_alloc(gpusvm);
> +	else
> +		range = kzalloc(sizeof(*range), GFP_KERNEL);
> +
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&range->refcount);
> +	range->gpusvm = gpusvm;
> +	range->notifier = notifier;
> +	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
> +	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
> +	INIT_LIST_HEAD(&range->entry);
> +	range->notifier_seq = LONG_MAX;
> +	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_check_pages() - Check pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @start: Start address
> + * @end: End address
> + *
> + * Check if pages between start and end have been faulted in on the CPU. Use to
> + * prevent migration of pages without CPU backing store.
> + *
> + * Returns:
> + * True if pages have been faulted into CPU, False otherwise
> + */
> +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> +				   struct drm_gpusvm_notifier *notifier,
> +				   unsigned long start, unsigned long end)
> +{
> +	struct hmm_range hmm_range = {
> +		.default_flags = 0,
> +		.notifier = &notifier->notifier,
> +		.start = start,
> +		.end = end,
> +		.dev_private_owner = gpusvm->device_private_page_owner,
> +	};
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns;
> +	unsigned long npages = npages_in_range(start, end);
> +	int err, i;
> +
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return false;
> +
> +	hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> +	hmm_range.hmm_pfns = pfns;
> +
> +	while (true) {
> +		err = hmm_range_fault(&hmm_range);
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq = mmu_interval_read_begin(&notifier->notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (err)
> +		goto err_free;
> +
> +	for (i = 0; i < npages;) {
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			err = -EFAULT;
> +			goto err_free;
> +		}
> +		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
> +	}
> +
> +err_free:
> +	kvfree(pfns);
> +	return err ? false : true;
> +}
> +
> +/**
> + * drm_gpusvm_range_chunk_size() - Determine chunk size for GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @vas: Pointer to the virtual memory area structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @check_pages_threshold: Check CPU pages for present threshold
> + *
> + * This function determines the chunk size for the GPU SVM range based on the
> + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
> + * memory area boundaries.
> + *
> + * Returns:
> + * Chunk size on success, LONG_MAX on failure.
> + */
> +static unsigned long
> +drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_notifier *notifier,
> +			    struct vm_area_struct *vas,
> +			    unsigned long fault_addr,
> +			    unsigned long gpuva_start,
> +			    unsigned long gpuva_end,
> +			    unsigned long check_pages_threshold)
> +{
> +	unsigned long start, end;
> +	int i = 0;
> +
> +retry:
> +	for (; i < gpusvm->num_chunks; ++i) {
> +		start = ALIGN_DOWN(fault_addr, gpusvm->chunk_sizes[i]);
> +		end = ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> +
> +		if (start >= vas->vm_start && end <= vas->vm_end &&
> +		    start >= notifier->itree.start &&
> +		    end <= notifier->itree.last + 1 &&
> +		    start >= gpuva_start && end <= gpuva_end)
> +			break;
> +	}
> +
> +	if (i == gpusvm->num_chunks)
> +		return LONG_MAX;
> +
> +	/*
> +	 * If allocation more than page, ensure not to overlap with existing
> +	 * ranges.
> +	 */
> +	if (end - start != SZ_4K) {
> +		struct drm_gpusvm_range *range;
> +
> +		range = drm_gpusvm_range_find(notifier, start, end);
> +		if (range) {
> +			++i;
> +			goto retry;
> +		}
> +
> +		/*
> +		 * XXX: Only create range on pages CPU has faulted in. Without
> +		 * this check, or prefault, on BMG 'xe_exec_system_allocator --r
> +		 * process-many-malloc' fails. In the failure case, each process
> +		 * mallocs 16k but the CPU VMA is ~128k which results in 64k SVM
> +		 * ranges. When migrating the SVM ranges, some processes fail in
> +		 * drm_gpusvm_migrate_to_devmem with 'migrate.cpages != npages'
> +		 * and then upon drm_gpusvm_range_get_pages device pages from
> +		 * other processes are collected + faulted in which creates all
> +		 * sorts of problems. Unsure exactly how this happening, also
> +		 * problem goes away if 'xe_exec_system_allocator --r
> +		 * process-many-malloc' mallocs at least 64k at a time.
> +		 */
> +		if (end - start <= check_pages_threshold &&
> +		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
> +			++i;
> +			goto retry;
> +		}
> +	}
> +
> +	return end - start;
> +}
> +
> +/**
> + * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @ctx: GPU SVM context
> + *
> + * This function finds or inserts a newly allocated a GPU SVM range based on the
> + * fault address. Caller must hold a lock to protect range lookup and insertion.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range on success, ERR_PTR() on failure.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
> +				unsigned long fault_addr,
> +				unsigned long gpuva_start,
> +				unsigned long gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct drm_gpusvm_range *range;
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	bool notifier_alloc = false;
> +	unsigned long chunk_size;
> +	int err;
> +	bool migrate_devmem;
> +
> +	drm_gpusvm_driver_lock_held(gpusvm);
> +
> +	if (fault_addr < gpusvm->mm_start ||
> +	    fault_addr > gpusvm->mm_start + gpusvm->mm_range)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!mmget_not_zero(mm))
> +		return ERR_PTR(-EFAULT);
> +
> +	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
> +	if (!notifier) {
> +		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
> +		if (IS_ERR(notifier)) {
> +			err = PTR_ERR(notifier);
> +			goto err_mmunlock;
> +		}
> +		notifier_alloc = true;
> +		err = mmu_interval_notifier_insert(&notifier->notifier,
> +						   mm, notifier->itree.start,
> +						   notifier->itree.last -
> +						   notifier->itree.start + 1,
> +						   &drm_gpusvm_notifier_ops);
> +		if (err)
> +			goto err_notifier;
> +	}
> +
> +	mmap_read_lock(mm);
> +
> +	vas = vma_lookup(mm, fault_addr);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_notifier_remove;
> +	}
> +
> +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> +		err = -EPERM;
> +		goto err_notifier_remove;
> +	}
> +
> +	range = drm_gpusvm_range_find(notifier, fault_addr, fault_addr + 1);
> +	if (range)
> +		goto out_mmunlock;
> +	/*
> +	 * XXX: Short-circuiting migration based on migrate_vma_* current
> +	 * limitations. If/when migrate_vma_* add more support, this logic will
> +	 * have to change.
> +	 */
> +	migrate_devmem = ctx->devmem_possible &&
> +		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
> +
> +	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
> +						 fault_addr, gpuva_start,
> +						 gpuva_end, migrate_devmem &&
> +						 ctx->check_pages_threshold);
> +	if (chunk_size == LONG_MAX) {
> +		err = -EINVAL;
> +		goto err_notifier_remove;
> +	}
> +
> +	range = drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr, chunk_size,
> +				       migrate_devmem);
> +	if (IS_ERR(range)) {
> +		err = PTR_ERR(range);
> +		goto err_notifier_remove;
> +	}
> +
> +	drm_gpusvm_range_insert(notifier, range);
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> +
> +out_mmunlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return range;
> +
> +err_notifier_remove:
> +	mmap_read_unlock(mm);
> +	if (notifier_alloc)
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +err_notifier:
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +err_mmunlock:
> +	mmput(mm);
> +	return ERR_PTR(err);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
> +
> +/**
> + * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @npages: Number of pages to unmap
> + *
> + * This function unmap pages associated with a GPU SVM range. Assumes and
> + * asserts correct locking is in place when called.
> + */
> +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +					   struct drm_gpusvm_range *range,
> +					   unsigned long npages)
> +{
> +	unsigned long i, j;
> +	struct drm_pagemap *dpagemap = range->dpagemap;
> +	struct device *dev = gpusvm->drm->dev;
> +
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->flags.has_dma_mapping) {
> +		for (i = 0, j = 0; i < npages; j++) {
> +			struct drm_pagemap_dma_addr *addr = &range->dma_addr[j];
> +
> +			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
> +				dma_unmap_page(dev,
> +					       addr->addr,
> +					       PAGE_SIZE << addr->order,
> +					       addr->dir);
> +			else if (dpagemap && dpagemap->ops->unmap_dma)
> +				dpagemap->ops->unmap_dma(dpagemap,
> +							 dev,
> +							 *addr);
> +			i += 1 << addr->order;
> +		}
> +		range->flags.has_devmem_pages = false;
> +		range->flags.has_dma_mapping = false;
> +		range->dpagemap = NULL;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_free_pages() - Free pages associated with a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function frees the dma address array associated with a GPU SVM range.
> + */
> +static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> +					struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->dma_addr) {
> +		kvfree(range->dma_addr);
> +		range->dma_addr = NULL;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_remove() - Remove GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function removes the specified GPU SVM range and also removes the parent
> + * GPU SVM notifier if no more ranges remain in the notifier. The caller must
> + * hold a lock to protect range and notifier removal.
> + */
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range)
> +{
> +	unsigned long npages = npages_in_range(range->itree.start,
> +					       range->itree.last + 1);
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	drm_gpusvm_driver_lock_held(gpusvm);
> +
> +	notifier = drm_gpusvm_notifier_find(gpusvm, range->itree.start);
> +	if (WARN_ON_ONCE(!notifier))
> +		return;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> +	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_range_remove(notifier, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	drm_gpusvm_range_put(range);
> +
> +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> +		if (!notifier->flags.removed)
> +			mmu_interval_notifier_remove(&notifier->notifier);
> +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_remove);
> +
> +/**
> + * drm_gpusvm_range_get() - Get a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function increments the reference count of the specified GPU SVM range.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> +{
> +	kref_get(&range->refcount);
> +
> +	return range;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_get);
> +
> +/**
> + * drm_gpusvm_range_destroy() - Destroy GPU SVM range
> + * @refcount: Pointer to the reference counter embedded in the GPU SVM range
> + *
> + * This function destroys the specified GPU SVM range when its reference count
> + * reaches zero. If a custom range-free function is provided, it is invoked to
> + * free the range; otherwise, the range is deallocated using kfree().
> + */
> +static void drm_gpusvm_range_destroy(struct kref *refcount)
> +{
> +	struct drm_gpusvm_range *range =
> +		container_of(refcount, struct drm_gpusvm_range, refcount);
> +	struct drm_gpusvm *gpusvm = range->gpusvm;
> +
> +	if (gpusvm->ops->range_free)
> +		gpusvm->ops->range_free(range);
> +	else
> +		kfree(range);
> +}
> +
> +/**
> + * drm_gpusvm_range_put() - Put a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function decrements the reference count of the specified GPU SVM range
> + * and frees it when the count reaches zero.
> + */
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> +{
> +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
> +
> +/**
> + * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected be
> + * called holding gpusvm->notifier_lock and as the last step before committing a
> + * GPU binding. This is akin to a notifier seqno check in the HMM documentation
> + * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
> + * function is required for finer grained checking (i.e., per range) if pages
> + * are valid.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
> +
> +/**
> + * drm_gpusvm_range_pages_valid_unlocked() - GPU SVM range pages valid unlocked
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid. Expected be
> + * called without holding gpusvm->notifier_lock.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +static bool
> +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> +				      struct drm_gpusvm_range *range)
> +{
> +	bool pages_valid;
> +
> +	if (!range->dma_addr)
> +		return false;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
> +	if (!pages_valid)
> +		drm_gpusvm_range_free_pages(gpusvm, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	return pages_valid;
> +}
> +
> +/**
> + * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are mapped for
> + * DMA access.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
> +	struct hmm_range hmm_range = {
> +		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> +			HMM_PFN_REQ_WRITE),
> +		.notifier = notifier,
> +		.start = range->itree.start,
> +		.end = range->itree.last + 1,
> +		.dev_private_owner = gpusvm->device_private_page_owner,
> +	};
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct drm_gpusvm_zdd *zdd;
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long i, j;
> +	unsigned long npages = npages_in_range(range->itree.start,
> +					       range->itree.last + 1);
> +	unsigned long num_dma_mapped;
> +	unsigned int order = 0;
> +	unsigned long *pfns;
> +	struct page **pages;
> +	int err = 0;
> +	struct dev_pagemap *pagemap;
> +	struct drm_pagemap *dpagemap;
> +
> +retry:
> +	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +		goto set_seqno;
> +
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return -ENOMEM;
> +
> +	if (!mmget_not_zero(mm)) {
> +		err = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	hmm_range.hmm_pfns = pfns;
> +	while (true) {
> +		mmap_read_lock(mm);
> +		err = hmm_range_fault(&hmm_range);
> +		mmap_read_unlock(mm);
> +
> +		if (err == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	mmput(mm);
> +	if (err)
> +		goto err_free;
> +
> +	pages = (struct page **)pfns;
> +map_pages:
> +	/*
> +	 * Perform all dma mappings under the notifier lock to not
> +	 * access freed pages. A notifier will either block on
> +	 * the notifier lock or unmap dma.
> +	 */
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +		kvfree(pfns);
> +		goto retry;
> +	}
> +
> +	if (!range->dma_addr) {
> +		/* Unlock and restart mapping to allocate memory. */
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +		range->dma_addr = kvmalloc_array(npages, sizeof(*range->dma_addr),
> +						 GFP_KERNEL);
> +		if (!range->dma_addr) {
> +			err = -ENOMEM;
> +			goto err_free;
> +		}
> +		goto map_pages;
> +	}
> +
> +	zdd = NULL;
> +	num_dma_mapped = 0;
> +	for (i = 0, j = 0; i < npages; ++j) {
> +		struct page *page = hmm_pfn_to_page(pfns[i]);
> +
> +		order = hmm_pfn_to_map_order(pfns[i]);
> +		if (is_device_private_page(page) || is_device_coherent_page(page)) {
> +			if (zdd != page->zone_device_data && i > 0) {
> +				err = -EOPNOTSUPP;
> +				goto err_unmap;
> +			}
> +			zdd = page->zone_device_data;
> +			if (pagemap != page->pgmap) {
> +				if (i > 0) {
> +					err = -EOPNOTSUPP;
> +					goto err_unmap;
> +				}
> +
> +				pagemap = page->pgmap;
> +				dpagemap = zdd->devmem_allocation->dpagemap;
> +				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
> +					/*
> +					 * Raced. This is not supposed to happen
> +					 * since hmm_range_fault() should've migrated
> +					 * this page to system.
> +					 */
> +					err = -EAGAIN;
> +					goto err_unmap;
> +				}
> +			}
> +			range->dma_addr[j] =
> +				dpagemap->ops->map_dma(dpagemap, gpusvm->drm->dev,
> +						       page, order,
> +						       DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev, range->dma_addr[j].addr)) {
> +				err = -EFAULT;
> +				goto err_unmap;
> +			}
> +
> +			pages[i] = page;
> +		} else {
> +			dma_addr_t addr;
> +
> +			if (is_zone_device_page(page) || zdd) {
> +				err = -EOPNOTSUPP;
> +				goto err_unmap;
> +			}
> +
> +			addr = dma_map_page(gpusvm->drm->dev,
> +					    page, 0,
> +					    PAGE_SIZE << order,
> +					    DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
> +				err = -EFAULT;
> +				goto err_unmap;
> +			}
> +
> +			range->dma_addr[j] = drm_pagemap_dma_addr_encode
> +				(addr, DRM_INTERCONNECT_SYSTEM, order,
> +				 DMA_BIDIRECTIONAL);
> +		}
> +		i += 1 << order;
> +		num_dma_mapped = i;
> +	}
> +
> +	range->flags.has_dma_mapping = true;
> +	if (zdd) {
> +		range->flags.has_devmem_pages = true;
> +		range->dpagemap = dpagemap;
> +	}
> +
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +	kvfree(pfns);
> +set_seqno:
> +	range->notifier_seq = hmm_range.notifier_seq;
> +
> +	return 0;
> +
> +err_unmap:
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +err_free:
> +	kvfree(pfns);
> +	if (err == -EAGAIN)
> +		goto retry;
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
> +
> +/**
> + * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> + * security model.
> + */
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx)
> +{
> +	unsigned long npages = npages_in_range(range->itree.start,
> +					       range->itree.last + 1);
> +
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
> +
> +/**
> + * drm_gpusvm_migration_unlock_put_page() - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_gpusvm_migration_unlock_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function unlocks and puts an array of pages.
> + */
> +static void drm_gpusvm_migration_unlock_put_pages(unsigned long npages,
> +						  unsigned long *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page;
> +
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		page = migrate_pfn_to_page(migrate_pfn[i]);
> +		drm_gpusvm_migration_unlock_put_page(page);
> +		migrate_pfn[i] = 0;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_get_devmem_page() - Get a reference to a device memory page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_gpusvm_get_devmem_page(struct page *page,
> +				     struct drm_gpusvm_zdd *zdd)
> +{
> +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU SVM. It
> + * iterates over each page frame number provided in @migrate_pfn, maps the
> + * corresponding page, and stores the DMA address in the provided @dma_addr
> + * array.
> + *
> + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> +					dma_addr_t *dma_addr,
> +					unsigned long *migrate_pfn,
> +					unsigned long npages,
> +					enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> + * if it's valid and not already unmapped, and unmaps the corresponding page.
> + */
> +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> +					   dma_addr_t *dma_addr,
> +					   unsigned long npages,
> +					   enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to device memory
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @devmem_allocation: Pointer to the device memory allocation. The caller
> + *                     should hold a reference to the device memory allocation,
> + *                     which should be dropped via ops->devmem_release or upon
> + *                     the failure of this function.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to device memory. It performs the
> + * necessary setup and invokes the driver-specific operations for migration to
> + * device memory. Upon successful return, @devmem_allocation can safely reference @range
> + * until ops->devmem_release is called which only upon successful return.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> +	unsigned long start = range->itree.start, end = range->itree.last + 1;
> +	struct migrate_vma migrate = {
> +		.start		= start,
> +		.end		= end,
> +		.pgmap_owner	= gpusvm->device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	struct mm_struct *mm = gpusvm->mm;
> +	unsigned long i, npages = npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_gpusvm_zdd *zdd = NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	if (!range->flags.migrate_devmem)
> +		return -EINVAL;
> +
> +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> +	    !ops->copy_to_ram)
> +		return -EOPNOTSUPP;
> +
> +	if (!mmget_not_zero(mm)) {
> +		err = -EFAULT;
> +		goto err_out;
> +	}
> +	mmap_read_lock(mm);
> +
> +	vas = vma_lookup(mm, start);
> +	if (!vas) {
> +		err = -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err = -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err = -EBUSY;
> +		goto err_mmunlock;
> +	}
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_mmunlock;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	zdd = drm_gpusvm_zdd_alloc(gpusvm->device_private_page_owner);
> +	if (!zdd) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	if (!migrate.cpages) {
> +		err = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages != npages) {
> +		err = -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   migrate.src, npages, DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] = page;
> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> +		drm_gpusvm_get_devmem_page(page, zdd);
> +	}
> +
> +	err = ops->copy_to_devmem(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind devmem allocation to range and zdd */
> +	WRITE_ONCE(zdd->devmem_allocation, devmem_allocation);	/* Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +				       DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_gpusvm_zdd_put(zdd);
> +	kvfree(buf);
> +err_mmunlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +err_out:
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
> +
> +/**
> + * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for a VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @fault_page: Fault page
> + * @npages: Number of pages to populate
> + * @mpages: Number of pages to migrate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the RAM migrate page frame numbers (PFNs) for the
> + * specified VM area structure. It allocates and locks pages in the VM area for
> + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> + * alloc_page for allocation.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> +					       struct page *fault_page,
> +					       unsigned long npages,
> +					       unsigned long *mpages,
> +					       unsigned long *src_mpfn,
> +					       unsigned long *mpfn,
> +					       unsigned long addr)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +		struct page *page, *src_page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		if (fault_page) {
> +			src_page = migrate_pfn_to_page(src_mpfn[i]);
> +			if (src_page->zone_device_data !=

if (src_page && ...)

This pops once the Kconfig issue Himal raised was fixed.

Matt

> +			    fault_page->zone_device_data)
> +				continue;
> +		}
> +
> +		if (vas)
> +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +		else
> +			page = alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			goto free_pages;
> +
> +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +	}
> +
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		WARN_ON_ONCE(!trylock_page(page));
> +		++*mpages;
> +	}
> +
> +	return 0;
> +
> +free_pages:
> +	for (i = 0; i < npages; ++i) {
> +		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		put_page(page);
> +		mpfn[i] = 0;
> +	}
> +	return -ENOMEM;
> +}
> +
> +/**
> + * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
> + * @devmem_allocation: Pointer to the device memory allocation
> + *
> + * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap lock and
> + * migration done via migrate_device_* functions.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops = devmem_allocation->ops;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err = 0;
> +
> +	npages = devmem_allocation->size >> PAGE_SHIFT;
> +
> +retry:
> +	if (!mmget_not_zero(devmem_allocation->mm))
> +		return -EFAULT;
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	src = buf;
> +	dst = buf + (sizeof(*src) * npages);
> +	dma_addr = buf + (2 * sizeof(*src) * npages);
> +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> +
> +	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err = migrate_device_pfns(src, npages);
> +	if (err)
> +		goto err_free;
> +
> +	err = drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL, npages, &mpages,
> +						  src, dst, 0);
> +	if (err || !mpages)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(devmem_allocation->dev, dma_addr,
> +					   dst, npages, DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_unlock_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
> +				       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmput_async(devmem_allocation->mm);
> +	if (!err && !READ_ONCE(devmem_allocation->detached)) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
> +
> +/**
> + * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified GPU SVM range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> +				       void *device_private_page_owner,
> +				       struct page *page,
> +				       unsigned long fault_addr,
> +				       unsigned long size)
> +{
> +	struct migrate_vma migrate = {
> +		.vma		= vas,
> +		.pgmap_owner	= device_private_page_owner,
> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	= page,
> +	};
> +	struct drm_gpusvm_zdd *zdd;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct device *dev;
> +	unsigned long npages, mpages = 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	unsigned long start, end;
> +	void *buf;
> +	int i, err = 0;
> +
> +	start = ALIGN_DOWN(fault_addr, size);
> +	end = ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped */
> +	if (start < vas->vm_start)
> +		start = vas->vm_start;
> +	if (end > vas->vm_end)
> +		end = vas->vm_end;
> +
> +	migrate.start = start;
> +	migrate.end = end;
> +	npages = npages_in_range(start, end);
> +
> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> +		       sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> +
> +	migrate.vma = vas;
> +	migrate.src = buf;
> +	migrate.dst = migrate.src + npages;
> +
> +	err = migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i = 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page = migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd = page->zone_device_data;
> +	ops = zdd->devmem_allocation->ops;
> +	dev = zdd->devmem_allocation->dev;
> +
> +	err = drm_gpusvm_migrate_populate_ram_pfn(vas, page, npages, &mpages,
> +						  migrate.src, migrate.dst,
> +						  start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err = drm_gpusvm_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
> +					   DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i = 0; i < npages; ++i)
> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +
> +	err = ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_unlock_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> +				       DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_evict() - Evict GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function evicts the specified GPU SVM range.
> + */
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_range *range)
> +{
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	unsigned long start = range->itree.start, end = range->itree.last + 1;
> +
> +	if (!mmget_not_zero(mm))
> +		return;
> +
> +	mmap_read_lock(mm);
> +
> +	/*
> +	 * Loop required to find all VMAs for the corner case when partial
> +	 * unmappings have occurred.
> +	 */
> +again:
> +	vas = find_vma(mm, start);
> +	if (!vas)
> +		goto unlock;
> +
> +	if (end <= vas->vm_start || start >= vas->vm_end)
> +		goto unlock;
> +
> +	__drm_gpusvm_migrate_to_ram(vas, gpusvm->device_private_page_owner,
> +				    NULL, start,
> +				    range->itree.last - range->itree.start + 1);
> +	if (vas->vm_end < end) {
> +		start = vas->vm_end;
> +		goto again;
> +	}
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> +
> +/**
> + * drm_gpusvm_page_free() - Put GPU SVM zone device data associated with a page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device data
> + * associated with a page when it is being released.
> + */
> +static void drm_gpusvm_page_free(struct page *page)
> +{
> +	drm_gpusvm_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM (page fault handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> + * It retrieves the GPU SVM range information from the faulting page and invokes
> + * the internal migration function to migrate the range back to RAM.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> +	int err;
> +
> +	err = __drm_gpusvm_migrate_to_ram(vmf->vma,
> +					  zdd->device_private_page_owner,
> +					  vmf->page, vmf->address,
> +					  zdd->devmem_allocation->size);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +/**
> + * drm_gpusvm_pagemap_ops() - Device page map operations for GPU SVM
> + */
> +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> +	.page_free = drm_gpusvm_page_free,
> +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> +};
> +
> +/**
> + * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page map operations
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> +{
> +	return &drm_gpusvm_pagemap_ops;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
> +
> +/**
> + * drm_gpusvm_has_mapping() - Check if GPU SVM has mapping for the given address range
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @start: Start address
> + * @end: End address
> + *
> + * Returns:
> + * True if GPU SVM has mapping, False otherwise
> + */
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
> +			    unsigned long end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> +		struct drm_gpusvm_range *range = NULL;
> +
> +		drm_gpusvm_for_each_range(range, notifier, start, end)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_has_mapping);
> +
> +/**
> + * drm_gpusvm_range_set_unmapped() - Mark a GPU SVM range as unmapped
> + * @range: Pointer to the GPU SVM range structure.
> + * @mmu_range: Pointer to the MMU notifier range structure.
> + *
> + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> + * if the range partially falls within the provided MMU notifier range.
> + */
> +void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> +				   const struct mmu_notifier_range *mmu_range)
> +{
> +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> +
> +	range->flags.unmapped = true;
> +	if (range->itree.start < mmu_range->start ||
> +	    range->itree.last + 1 > mmu_range->end)
> +		range->flags.partial_unmap = true;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
> +
> +/**
> + * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory allocation
> + *
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap we're allocating from.
> + * @size: Size of device memory allocation
> + */
> +void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> +			    struct device *dev, struct mm_struct *mm,
> +			    const struct drm_gpusvm_devmem_ops *ops,
> +			    struct drm_pagemap *dpagemap, size_t size)
> +{
> +	devmem_allocation->dev = dev;
> +	devmem_allocation->mm = mm;
> +	devmem_allocation->ops = ops;
> +	devmem_allocation->dpagemap = dpagemap;
> +	devmem_allocation->size = size;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
> +
> +MODULE_DESCRIPTION("DRM GPUSVM");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> new file mode 100644
> index 000000000000..2fb6980d0cf1
> --- /dev/null
> +++ b/include/drm/drm_gpusvm.h
> @@ -0,0 +1,445 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright � 2024 Intel Corporation
> + */
> +
> +#ifndef __DRM_GPUSVM_H__
> +#define __DRM_GPUSVM_H__
> +
> +#include <linux/kref.h>
> +#include <linux/interval_tree.h>
> +#include <linux/mmu_notifier.h>
> +
> +struct dev_pagemap_ops;
> +struct drm_device;
> +struct drm_gpusvm;
> +struct drm_gpusvm_notifier;
> +struct drm_gpusvm_ops;
> +struct drm_gpusvm_range;
> +struct drm_gpusvm_devmem;
> +struct drm_pagemap;
> +struct drm_pagemap_dma_addr;
> +
> +/**
> + * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM device memory
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (SVM)
> + * device memory. These operations are provided by the GPU driver to manage device memory
> + * allocations and perform operations such as migration between device memory and system
> + * RAM.
> + */
> +struct drm_gpusvm_devmem_ops {
> +	/**
> +	 * @devmem_release: Release device memory allocation (optional)
> +	 * @devmem_allocation: device memory allocation
> +	 *
> +	 * Release device memory allocation and drop a reference to device
> +	 * memory allocation.
> +	 */
> +	void (*devmem_release)(struct drm_gpusvm_devmem *devmem_allocation);
> +
> +	/**
> +	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
> +	 * @devmem_allocation: device memory allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * Populate device memory page frame numbers (PFN).
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
> +				   unsigned long npages, unsigned long *pfn);
> +
> +	/**
> +	 * @copy_to_devmem: Copy to device memory (required for migration)
> +	 * @pages: Pointer to array of device memory pages (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to device memory.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_devmem)(struct page **pages,
> +			      dma_addr_t *dma_addr,
> +			      unsigned long npages);
> +
> +	/**
> +	 * @copy_to_ram: Copy to system RAM (required for migration)
> +	 * @pages: Pointer to array of device memory pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * Copy pages to system RAM.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_ram)(struct page **pages,
> +			   dma_addr_t *dma_addr,
> +			   unsigned long npages);
> +};
> +
> +/**
> + * struct drm_gpusvm_devmem - Structure representing a GPU SVM device memory allocation
> + *
> + * @dev: Pointer to the device structure which device memory allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device memory
> + * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
> + * @size: Size of device memory allocation
> + * @detached: device memory allocations is detached from device pages
> + */
> +struct drm_gpusvm_devmem {
> +	struct device *dev;
> +	struct mm_struct *mm;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct drm_pagemap *dpagemap;
> +	size_t size;
> +	bool detached;
> +};
> +
> +/**
> + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> + *
> + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> + * These operations are provided by the GPU driver to manage SVM ranges and
> + * notifiers.
> + */
> +struct drm_gpusvm_ops {
> +	/**
> +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> +	 *
> +	 * Allocate a GPU SVM notifier.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> +	 */
> +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> +
> +	/**
> +	 * @notifier_free: Free a GPU SVM notifier (optional)
> +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> +	 *
> +	 * Free a GPU SVM notifier.
> +	 */
> +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> +
> +	/**
> +	 * @range_alloc: Allocate a GPU SVM range (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 *
> +	 * Allocate a GPU SVM range.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> +	 */
> +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> +
> +	/**
> +	 * @range_free: Free a GPU SVM range (optional)
> +	 * @range: Pointer to the GPU SVM range to be freed
> +	 *
> +	 * Free a GPU SVM range.
> +	 */
> +	void (*range_free)(struct drm_gpusvm_range *range);
> +
> +	/**
> +	 * @invalidate: Invalidate GPU SVM notifier (required)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @notifier: Pointer to the GPU SVM notifier
> +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> +	 *
> +	 * Invalidate the GPU page tables. It can safely walk the notifier range
> +	 * RB tree/list in this function. Called while holding the notifier lock.
> +	 */
> +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> +			   struct drm_gpusvm_notifier *notifier,
> +			   const struct mmu_notifier_range *mmu_range);
> +};
> +
> +/**
> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: MMU interval notifier
> + * @itree: Interval tree node for the notifier (inserted in GPU SVM)
> + * @entry: List entry to fast interval tree traversal
> + * @root: Cached root node of the RB tree containing ranges
> + * @range_list: List head containing of ranges in the same order they appear in
> + *              interval tree. This is useful to keep iterating ranges while
> + *              doing modifications to RB tree.
> + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> + *                 removed
> + *
> + * This structure represents a GPU SVM notifier.
> + */
> +struct drm_gpusvm_notifier {
> +	struct drm_gpusvm *gpusvm;
> +	struct mmu_interval_notifier notifier;
> +	struct interval_tree_node itree;
> +	struct list_head entry;
> +	struct rb_root_cached root;
> +	struct list_head range_list;
> +	struct {
> +		u32 removed : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
> + * @entry: List entry to fast interval tree traversal
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @dma_addr: DMA address array
> + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> + *            Note this is assuming only one drm_pagemap per range is allowed.
> + * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> + * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> + *
> + * This structure represents a GPU SVM range used for tracking memory ranges
> + * mapped in a DRM device.
> + */
> +struct drm_gpusvm_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +	struct kref refcount;
> +	struct interval_tree_node itree;
> +	struct list_head entry;
> +	unsigned long notifier_seq;
> +	struct drm_pagemap_dma_addr *dma_addr;
> +	struct drm_pagemap *dpagemap;
> +	struct {
> +		/* All flags below must be set upon creation */
> +		u16 migrate_devmem : 1;
> +		/* All flags below must be set / cleared under notifier lock */
> +		u16 unmapped : 1;
> +		u16 partial_unmap : 1;
> +		u16 has_devmem_pages : 1;
> +		u16 has_dma_mapping : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm - GPU SVM structure
> + *
> + * @name: Name of the GPU SVM
> + * @drm: Pointer to the DRM device structure
> + * @mm: Pointer to the mm_struct for the address space
> + * @device_private_page_owner: Device private pages owner
> + * @mm_start: Start address of GPU SVM
> + * @mm_range: Range of the GPU SVM
> + * @notifier_size: Size of individual notifiers
> + * @ops: Pointer to the operations structure for GPU SVM
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> + *               Entries should be powers of 2 in descending order.
> + * @num_chunks: Number of chunks
> + * @notifier_lock: Read-write semaphore for protecting notifier operations
> + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> + * @notifier_list: list head containing of notifiers in the same order they
> + *                 appear in interval tree. This is useful to keep iterating
> + *                 notifiers while doing modifications to RB tree.
> + *
> + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> + *
> + * No reference counting is provided, as this is expected to be embedded in the
> + * driver VM structure along with the struct drm_gpuvm, which handles reference
> + * counting.
> + */
> +struct drm_gpusvm {
> +	const char *name;
> +	struct drm_device *drm;
> +	struct mm_struct *mm;
> +	void *device_private_page_owner;
> +	unsigned long mm_start;
> +	unsigned long mm_range;
> +	unsigned long notifier_size;
> +	const struct drm_gpusvm_ops *ops;
> +	const unsigned long *chunk_sizes;
> +	int num_chunks;
> +	struct rw_semaphore notifier_lock;
> +	struct rb_root_cached root;
> +	struct list_head notifier_list;
> +#ifdef CONFIG_LOCKDEP
> +	/**
> +	 * @lock_dep_map: Annotates drm_gpusvm_range_find_or_insert and
> +	 * drm_gpusvm_range_remove with a driver provided lock.
> +	 */
> +	struct lockdep_map *lock_dep_map;
> +#endif
> +};
> +
> +/**
> + * struct drm_gpusvm_ctx - DRM GPU SVM context
> + *
> + * @check_pages_threshold: Check CPU pages for present if chunk is less than or
> + *                         equal to threshold. If not present, reduce chunk
> + *                         size.
> + * @in_notifier: entering from a MMU notifier
> + * @read_only: operating on read-only memory
> + * @devmem_possible: possible to use device memory
> + *
> + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> + */
> +struct drm_gpusvm_ctx {
> +	unsigned long check_pages_threshold;
> +	unsigned int in_notifier :1;
> +	unsigned int read_only :1;
> +	unsigned int devmem_possible :1;
> +};
> +
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		    const char *name, struct drm_device *drm,
> +		    struct mm_struct *mm, void *device_private_page_owner,
> +		    unsigned long mm_start, unsigned long mm_range,
> +		    unsigned long notifier_size,
> +		    const struct drm_gpusvm_ops *ops,
> +		    const unsigned long *chunk_sizes, int num_chunks);
> +
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> +
> +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
> +				unsigned long fault_addr,
> +				unsigned long gpuva_start,
> +				unsigned long gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx);
> +
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			     struct drm_gpusvm_range *range);
> +
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_range *range);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> +
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> +
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range);
> +
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			       struct drm_gpusvm_range *range,
> +			       const struct drm_gpusvm_ctx *ctx);
> +
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				  struct drm_gpusvm_range *range,
> +				  const struct drm_gpusvm_ctx *ctx);
> +
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx);
> +
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem *devmem_allocation);
> +
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> +
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
> +			    unsigned long end);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
> +		      unsigned long end);
> +
> +void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> +				   const struct mmu_notifier_range *mmu_range);
> +
> +void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> +			    struct device *dev, struct mm_struct *mm,
> +			    const struct drm_gpusvm_devmem_ops *ops,
> +			    struct drm_pagemap *dpagemap, size_t size);
> +
> +#ifdef CONFIG_LOCKDEP
> +/**
> + * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @lock: the lock used to protect the gpuva list. The locking primitive
> + * must contain a dep_map field.
> + *
> + * Call this to annotate drm_gpusvm_range_find_or_insert and
> + * drm_gpusvm_range_remove.
> + */
> +#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
> +	do { \
> +		if (!WARN((gpusvm)->lock_dep_map, \
> +			  "GPUSVM range lock should be set only once."))\
> +			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
> +	} while (0)
> +#define drm_gpusvm_driver_lock_held(gpusvm) \
> +	do { \
> +		if ((gpusvm)->lock_dep_map)	\
> +			lock_is_held((gpusvm)->lock_dep_map);	\
> +	} while (0)
> +#else
> +#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)
> +#define drm_gpusvm_driver_lock_held(gpusvm) do {} while (0)
> +#endif
> +
> +/**
> + * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, take lock
> + */
> +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> +	down_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, drop lock
> + */
> +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> +	up_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * __drm_gpusvm_range_next() - Get the next GPU SVM range in the list
> + * @range: a pointer to the current GPU SVM range
> + *
> + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> + *         current range is the last one or if the input range is NULL.
> + */
> +static inline struct drm_gpusvm_range *
> +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> +{
> +	if (range && !list_is_last(&range->entry,
> +				   &range->notifier->range_list))
> +		return list_next_entry(range, entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range() - Iterate over GPU SVM ranges in a notifier
> + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> + * to use while holding the driver SVM lock or the notifier lock.
> + */
> +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> +	for ((range__) = (range__) ?:					\
> +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> +	     (range__) && (range__->itree.start < (end__));		\
> +	     (range__) = __drm_gpusvm_range_next(range__))
> +
> +#endif /* __DRM_GPUSVM_H__ */
> -- 
> 2.34.1
> 
