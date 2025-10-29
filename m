Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EBDC18086
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 03:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9AC10E6D4;
	Wed, 29 Oct 2025 02:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlifmAol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34A10E6D4;
 Wed, 29 Oct 2025 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761704295; x=1793240295;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5ZLdaSuXsl7XKQ9tjdQU147IMPzdiGwpZLvcsLdPC9E=;
 b=XlifmAolgxAr7DQms4quMmfno4fD0C/4UBo4NeADl0n73L1dIUw05WxO
 Y2q8nq5BQdJhFY7+nQYRheDGeb10A1+/mUgHoLEomcT/2Lfd5GIVx5TnF
 1fe6rd8Wt+kmSAKYpxG/IfGjuzJWrTLTqXxnLPcWtB5I1sSB4ItSy9++u
 1q8W0uBTO6pWDVuYaNYPOqNSkU1HTAEf2CqVKe9mQMrGZ8orrDZCGxQ1R
 2Mb4/HdV3TMsuEBS/1nqGGvMq7sY0KUaV+fcprk2M6kbvEP7mSmKGiGI5
 X4C9HzLJTpeUUqQd4Y5EWTsm2CKRDvSm9MsM7jOKbv8dT9ZJcj3QIH95X Q==;
X-CSE-ConnectionGUID: avNZ7A+1Q/iXToyKQ5nCtQ==
X-CSE-MsgGUID: rFYuVxdNR5OGkwtKXlH9kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86445067"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="86445067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 19:17:54 -0700
X-CSE-ConnectionGUID: AEyav6TiThCPIiwpem4OdQ==
X-CSE-MsgGUID: no63+vMNTF2HQF48XJWzgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="216172994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 19:17:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 19:17:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 19:17:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 19:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+j8yNke3vsc6roH8zi7VpwY7oxEUx/Phkr1co0Vr/5/24mnx0RsyuX6wRxUGuNM4DT5Q6wgmmiRwp5+nmiKQDQEHMVeaTXM+Jg7V/y9BpEc8wtCXmlgOiu2hDZcsNpcdqLOBmqLDGIBnCw9rccCLxqH98qtBBGjUvM+757XKHpcDXlGP5ONJA0GUGrp+BQqlCAH6E/HFS/dh+gqQO5Z6wkHEQ3WDKVmW/SnpIuvcVhclR5lxMnXI+jLeS/cbB4LOVD/4znrceP8hfsbRhAGVEIQkSR5eCOnuyxalK70YjEAZnOH0lrhY+7WwG58qSB2G7Oaka3IV3Q+vvQ55eL+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbgHDOgBiG/iivVMtX4m+s1PYkiRbA3TNWAbSN75N2s=;
 b=yorgTOZkHG1k7qs7UqbUESxSdlwvm1ZsDaSx2OU3MzBs3kCSU/6EtbukjubFY+Im2ztvzdfE6l63EItXH4Ftre+sHEVlb1l5sxhX4flM4RhTpTdYpvTxo3AJrggGRh5tONp/h3ZWYqBPfkoBf3TIGvJOYTgzVhNZeLiX46FmDQTu0N3f1N+fQLqUDXRXeeLRpWrFMqm7TWiUOOFjDszloD+7ZTIpOo69mIQnleA1Qoh3kfe8sgsoGPA5VjN+Cm5w6leGoXDD8X66Le4TRa0MhJm+2RrP8LY5mmlLzJfIE7gwU/3FwzgWOVLIn7X4nHetV8wEA/38PyddL3A8NYq2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 02:17:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 02:17:45 +0000
Date: Tue, 28 Oct 2025 19:17:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Support pcie p2p dma as a fast interconnect
Message-ID: <aQF5RkxXtW+6GIy7@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f6c2c2-6f6a-4d72-e8ab-08de169158c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?apYAL92QFL6ppUsGdv8kynWv1GJ0dFGXxMuo6DDqEpxnRTkGJwgNf6evq6?=
 =?iso-8859-1?Q?rEVfcuAbqMouPAcr4rLPvy5CEcn2j87NPSaekkOHXDzN6VUHN/tf0C0lcW?=
 =?iso-8859-1?Q?ydCXFeLHVX7Maeg7EXMeNTyWiEjXLIopB9aFFfTQUpe5cdgPr9bAbl7ASe?=
 =?iso-8859-1?Q?55SRw93FPomgKNX4xkQpUMd84QGESMM3SU0zHHxWVeseDdt2cvPTb9VMMi?=
 =?iso-8859-1?Q?hSwHWKgyB59oBJDdGjr757aLE6fq1s2AJa87+Z318WNdkubzZ4l3UNXqAv?=
 =?iso-8859-1?Q?4pzI4EMg1DmtMAdEG/nsuCH5dmX4lJQSy4luxFRHA0qH+4r3bEaisJUsJp?=
 =?iso-8859-1?Q?heeRX4OnJ52dfx7g9IJA5kQPZXJ3u3J79dTf/RZEGGQIIxkYw0SmxrU/nN?=
 =?iso-8859-1?Q?cMbSl8LyE79nDMZyJvCgRwf5PW2Lhu6OuEjA0TWwvOw2RJt/Tjv4Dz8hhy?=
 =?iso-8859-1?Q?1KwAYBkjQaJi1LZMdVdIG65QDxu5oHfeO2Qn2nmhmTWRU0Kgg/Tc33yfFa?=
 =?iso-8859-1?Q?Tpe1d0tc46GOlmSe0EzMN1GIr2/zkXjJOra/2YVzo/gyQsrOZMcRcVVPWb?=
 =?iso-8859-1?Q?fwKkwoKcyvD91cw3ZZ3RPnFonD2RitEfS/RxlEIbKBMj5pfgcjRzg/ibIM?=
 =?iso-8859-1?Q?RSHtWDXJCXlwbnTQboDdwcDR7trSN2pkJSI2i/av426a4lwGRRxZXIpcQR?=
 =?iso-8859-1?Q?s0mhjaMVIruGKYF1SYMzxP+JmRQpwEyokhU4rJVz/Ed+p/YmZxYt9hcFyr?=
 =?iso-8859-1?Q?qyKHErFNbJU9RkicqprGckOc9s+W39ryjYhJa7W3MW66//c2XamnUM4UxA?=
 =?iso-8859-1?Q?E/mYUTdAvWdAyc/A4a3C0ox7z0b9gR8YneT3tjHVezo+taQWGD1OWbiTux?=
 =?iso-8859-1?Q?t74tNscul/Cf7Q7zRv5i0pZ6AY4UOPfWdrCKFhkPbhDFw1NjYGcygsY4xl?=
 =?iso-8859-1?Q?fed+6IJQGwJxtqhNE7MQFYLItM0o1Gk+Hlc35hl1s9uPnQrfgLdlvtPs2B?=
 =?iso-8859-1?Q?YGcOxyAeIZomvYS7lJfTVKtBI4LYKJIfFX4B2Erzr5Z4Q5qZQQ1c0lV1zU?=
 =?iso-8859-1?Q?C1hzVJBba91rlJ0L1lbJiZOLkUvIZ1Q8H14mPBy110KZTnopnyRYOvk9hx?=
 =?iso-8859-1?Q?kWpStFyAxR7FkprCNCHBTs0HBpfnz/I1ZK0fgpZpG7JkxCQILN37L/W8Da?=
 =?iso-8859-1?Q?598VYM1ou5wpDUW287eGAAJtk1pfoPyHo1yecL8B7Xjc2BnY6OxxoHpJQY?=
 =?iso-8859-1?Q?AjJIKdzIm2swLr6epEBDkKhv4OmMG0d4dpx9w0VUOcnf6ehpm5LiUSF/cj?=
 =?iso-8859-1?Q?iGBxPz3/ymM0LdC4+8l21uH9flTXSOk2XRUXaekDHw3hUkhD6PB5b8DJPd?=
 =?iso-8859-1?Q?Y61tCPoD7qyB9SDnrnv0Xk68Dj+7a9GjvKH6yNwVCmd+F44IzN/PAL+daV?=
 =?iso-8859-1?Q?uCSdkOYpK8dgwNHj+UG45XAD+AtURzcuWm6yhZQIHpX+jCU3pDipR2oBlI?=
 =?iso-8859-1?Q?MuHVV7jIlEV+2qdts5q29h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/B+3gHTTEkGjWNyO7K/hPKGOs5JpS1W02fti+mYt6fllP/OQjBs7ttug77?=
 =?iso-8859-1?Q?ETTV3IUdtT+4bBez5lhq3aF6274qkd0yhX+ridsgRjWyuaeBLgkBe9mJ60?=
 =?iso-8859-1?Q?plWHZ2IC5HDGuQiiyomRZTlDv4Cx+Tc6/ySfB1G3g54REoPtB7sN7qAg2q?=
 =?iso-8859-1?Q?2zkIarkP9oYYpDPbYfrlrzlcPCI1MVCezteNVyWzx61TA/5dSjfhQqx/sH?=
 =?iso-8859-1?Q?O8c6Dz+q/9QucjFfP8a4rajYhFYKTnlTJQRXnbFXBsD5uoF2gn42eE/Ep2?=
 =?iso-8859-1?Q?jXbo/lhIda9T6k+8KQnWZ4KmkReHePSPLeCosaKqw4fcRk4bzfFFyczh3/?=
 =?iso-8859-1?Q?rd4S8U3IoX84W3FdxFCbV6W9K0BsYzHXk2QudCEdTF9jW9/dQ+ASMhQLkR?=
 =?iso-8859-1?Q?0IPyjn29cqyntvGiUZmfjvFkE3EDRFt/+XOknOxK2TYaFxDsZzWP9ZsbB4?=
 =?iso-8859-1?Q?MyWXCfAhwLMSCdAFuiETgSrZtYpUhaHijxM8FtMHcK6cDfRiTLk3WshVK9?=
 =?iso-8859-1?Q?noBYB71voDTDJxqpCdGrSz1gXKrgnE3Z/OsaunquN7Dom2b1Xi5WHcaIox?=
 =?iso-8859-1?Q?tvZbFjp8gw2TZrDmmOz4/0gB5W+DFNlP3WZOyVqLx76tZTnDCB9OFlV+G2?=
 =?iso-8859-1?Q?eXncq0HK8q80X8OjUFOL90MAp4AGSp2du33cy33yFf6JA7+f0tFx9NZLZQ?=
 =?iso-8859-1?Q?pROFNDgMQpdZTz4lWpEc95JBS1l4dtIpvGyeXZFil6oOKRQTOITxF8CRNG?=
 =?iso-8859-1?Q?qSpHE8SaVMto8PeYAOulI5yQKsL14IaTO1VOCHkQTbLpIkMQNbXf0fsVxa?=
 =?iso-8859-1?Q?lPKgw4EJXBEw6SdIKX2xYe+UAUaQotEs9FXDoKgVOBiI8/yUi461I1auP2?=
 =?iso-8859-1?Q?UAnUNHSog4QHtGZTP504TTLkquEPecn2wgMLx6GQ9feKzUS9zWbevyBDEf?=
 =?iso-8859-1?Q?8n4U11dUtbhi71IdkahYZ2yHUO8qktwX6KP71OddB/K6URFJQFVdZzK2nT?=
 =?iso-8859-1?Q?FKSLK5ALl7TBxPMG7szo8zNrHacfp3VwcbZ7vIFnRYXGyeKmOWskHlX45C?=
 =?iso-8859-1?Q?v/mjKpqKSljINf7KtOtQ+p5lwFoNG+pfSw498LH94gHv3qyGIfcDzeD+9K?=
 =?iso-8859-1?Q?/r2MGvmYEywieVemLEXCTNihYMKW2/nkrYilaR2Cgk3/Auqo1PDwP3XEvj?=
 =?iso-8859-1?Q?MPO/0VfH0QKvT1b3l/cX6yvkQDnTEaoXteTVyaQ5sZQvq51NKnadfbe4iO?=
 =?iso-8859-1?Q?FPZfd90TE9fAdMge25woRX0VNHEKvtQ4NTVq4V5POtbpdMfd9MOtnwDRa4?=
 =?iso-8859-1?Q?qNew4629aLY9Qq+2+1MhErcx+jPTdlAhHqZEHHitkdhG6BPrCOdHK9zdzA?=
 =?iso-8859-1?Q?GAYWtwa8f10h3f8jeSvtOCM7e25LDf8lnDgZsbDOSIIRyfw/a+in8wJ93u?=
 =?iso-8859-1?Q?g1HoJ1MR8GTGdI8Rj0+OhpCYabANdkhjYwWjM4iV8UUTftqYkHlwLurZk8?=
 =?iso-8859-1?Q?N+omMXPnjtoq+CFmWCLduy3XeUWvdTJJLaoos8LmSM6DAuT06zmrIheeWH?=
 =?iso-8859-1?Q?Y/i8jsRKDK8d4PSq3V8FJo4uR/6cE8KyQmCS/0dj6jNUAdT7ZsLEjq0fZm?=
 =?iso-8859-1?Q?eoTJSw/ThFKK+VGF2bPylza6WeIdEbd5/5cMjMEPM6JH+c35Ha4y+S6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f6c2c2-6f6a-4d72-e8ab-08de169158c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 02:17:45.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7WymCgQgKrkBoKqSdGWq/fzRTEZHt3HZOkFQFA2FQTjDTnyZgr3byX2x0rsFFhplhD+bcGiU/acJg4ZqEqZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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

On Sat, Oct 25, 2025 at 02:04:10PM +0200, Thomas Hellström wrote:
> Mimic the dma-buf method using dma_[map|unmap]_resource to map
> for pcie-p2p dma.
> 
> There's an ongoing area of work upstream to sort out how this best
> should be done. One method proposed is to add an additional
> pci_p2p_dma_pagemap aliasing the device_private pagemap and use
> the corresponding pci_p2p_dma_pagemap page as input for
> dma_map_page(). However, that would incur double the amount of
> memory and latency to set up the drm_pagemap and given the huge
> amount of memory present on modern GPUs, that would really not work.
> Hence the simple approach used in this patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 44 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_svm.h |  1 +
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 9dd96dad2cca..9814f95cb212 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <linux/pci-p2pdma.h>
> +
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
> @@ -442,6 +444,24 @@ static u64 xe_page_to_dpa(struct page *page)
>  	return dpa;
>  }
>  
> +static u64 xe_page_to_pcie(struct page *page)
> +{

This function looks almost exactly the same as xe_page_to_dpa, maybe
extract out the common parts? 

Everything else LGTM.

Matt

> +	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
> +	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
> +	u64 hpa_base = xpagemap->hpa_base;
> +	u64 ioaddr;
> +	u64 pfn = page_to_pfn(page);
> +	u64 offset;
> +
> +	xe_assert(vr->xe, is_device_private_page(page));
> +	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
> +
> +	offset = (pfn << PAGE_SHIFT) - hpa_base;
> +	ioaddr = vr->io_start + offset;
> +
> +	return ioaddr;
> +}
> +
>  enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_VRAM,
>  	XE_SVM_COPY_TO_SRAM,
> @@ -793,7 +813,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
>  	struct device *dev1 = xe_peer_to_dev(peer1);
>  	struct device *dev2 = xe_peer_to_dev(peer2);
>  
> -	return dev1 == dev2;
> +	if (dev1 == dev2)
> +		return true;
> +
> +	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
>  }
>  
>  static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> @@ -1530,13 +1553,27 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  		addr = xe_page_to_dpa(page);
>  		prot = XE_INTERCONNECT_VRAM;
>  	} else {
> -		addr = DMA_MAPPING_ERROR;
> -		prot = 0;
> +		addr = dma_map_resource(dev,
> +					xe_page_to_pcie(page),
> +					PAGE_SIZE << order, dir,
> +					DMA_ATTR_SKIP_CPU_SYNC);
> +		prot = XE_INTERCONNECT_P2P;
>  	}
>  
>  	return drm_pagemap_addr_encode(addr, prot, order, dir);
>  }
>  
> +static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
> +					struct device *dev,
> +					struct drm_pagemap_addr addr)
> +{
> +	if (addr.proto != XE_INTERCONNECT_P2P)
> +		return;
> +
> +	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
> +			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
>  static void xe_pagemap_destroy_work(struct work_struct *work)
>  {
>  	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
> @@ -1573,6 +1610,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.device_unmap = xe_drm_pagemap_device_unmap,
>  	.populate_mm = xe_drm_pagemap_populate_mm,
>  	.destroy = xe_pagemap_destroy,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 7cd7932f56c8..f5ed48993b6d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_pagemap_util.h>
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
>  
>  struct drm_device;
>  struct drm_file;
> -- 
> 2.51.0
> 
