Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD91BAA1C0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CB010E245;
	Mon, 29 Sep 2025 17:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTPsiB0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EA910E245
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759165958; x=1790701958;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DqCMOnTCaeTfdovYXaRWNZdfptXoig3zNGxycFDdXhE=;
 b=mTPsiB0rhdvvt2Waw3fJogeax/hq1EhzMKstB3VXnZUh8MwrzLiyBiDs
 9bQsMMeCWIi+TXAdwNZo7vLLXc3A9Q+8Hw+Zp4ZBAtgrOEn1JPAxNjoie
 UTMIRH2fFyBkTLpfUENUjddgT0C6G+1IB29VjYdZpB33mlfRay4Eej/iG
 r9d6FjvHmLRV7bqRmU+UwKa56i0Kn4yfrjUX1ylYPh1MfZ2vC8XYWOxZq
 53Xfb/Ce4GCqwwwrDUXpLNYVh9ASfGLXBZGI48NjsULFAJOpwCi1AtcIi
 qBJtRYOECpt+HOy/IN/z2pq70nV1MrFbnWSVB7WLlFIWWzfRlYQBQGbi0 A==;
X-CSE-ConnectionGUID: qrcMyc3WQSal/DgmzMafDQ==
X-CSE-MsgGUID: 5W4xgruTRaKeZ4sPhUMdkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65230395"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65230395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:12:37 -0700
X-CSE-ConnectionGUID: IaS1VwI3TtmssEAnc1Vbrw==
X-CSE-MsgGUID: Y2/w0iULToKAYJ32P/0vSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182569380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:12:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:12:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 10:12:37 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:12:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXg1XNGC4ByJtPpA0rits4aLpsn1J+aWcJ6dBTKuJiVK5qOy5BTuQtXeHvvcdfeRO6qGey4u99QYzuVt0z8cNWy/yfqTZpYH4UxeUbsNKVCJL1PftQIbBubwO4Nw2BNMbULTHauLDTdJL/LJ/cghM0YSL7ZBuGG2ftGi+y/Ih5toGmzlIylMfXA0ngtp9NO0oWvvykT5xQcsVGYVdlRkfyQLarn+r5hNVlYYK7qGciPml19zaNLDaM6oy4rCO9ShmP9ALClvA/XmA8y8yXXjklCGZeC+GIOuXPpouOjqvaV2nQC7NTGXufGhMAsJYMIY52PdWc5rZbaV04PmXw5pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4GLqTUuOIa2DfaKCDr17fNtmtRidv0TBixrpBA96Yk=;
 b=JjN8LaF67dETJjd/A8Xipn2b5jrBa1quUomECyIRghvsgY/bUB3+QWxXvPaAR8nBFaKf3+uxwGDlsOx8JkdkYWMal+SPCH4Vf6x72Zw2RA7kHmjSnfBDMgKgSewOP59PALuIoufT5FGs9FE9NLY8YyZKky8JpoJj49KILJGoMIpi6e2BHEVFhfj5CRQ2j0Yz47KzTA9O3qJMrATUp2A+FEAbCkHnceu5jUg268PdOS4Pis5I2bQXdEIsqDvwU52JDD8u2V6ruSofq1aqH1inD+5s3SGsyNux5zYC2lV2DVhD9QQNhyzpq56IeUqJwopgQaKDfQRx4+xCSu2fIS5IWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 17:12:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 17:12:34 +0000
Date: Mon, 29 Sep 2025 10:12:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Mandate usage of drm_sched_job_cleanup()
Message-ID: <aNq9/6Ks2N3A1hDu@lstrano-desk.jf.intel.com>
References: <20250926123630.200920-2-phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926123630.200920-2-phasta@kernel.org>
X-ClientProxiedBy: CY5PR19CA0104.namprd19.prod.outlook.com
 (2603:10b6:930:83::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 025cc17b-37e7-46fe-b0f1-08ddff7b61a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2NqcUZVUElLSFFtUXAzcXFTZnZic0RTRGhIb3hhbTA5OG9oa296MWFvQTdE?=
 =?utf-8?B?SFZtaUJVQjBjQnZkZVJoanc5ZVVmc2t6bmdUWTRqYytPVXpIZ2xRR2Z5TXU0?=
 =?utf-8?B?UUlnam5ybkkwN2xLYlMyV1plR1dJVXQ3b0NyZkF0Kzk4NDJtMmIvNkxjbTkx?=
 =?utf-8?B?enh4aGVZSGtRa3NMTjRoTUY0S3VxaTFHWkFZaXNvYTB6OEJVNUc3LzExUmJV?=
 =?utf-8?B?TW5lMjN3ZW05a3gwWDZMZEhyM0F5VERSbWVPcUUwbzUrelZZL09Fb0hqa1BR?=
 =?utf-8?B?Z0FXTDdWb0tjTzI0RGE2em8vWGZidzllYmhFMjhhMVNTR3AweE5rWlBKTjNX?=
 =?utf-8?B?RGVnTlZ1UTVhaDJ1bnhRTXZYOFgydzFCTlVabTRtOXhlMk9CYWpFWVJUanZq?=
 =?utf-8?B?WGsxeTlJNHl2YTdBR3IxUHpyeHhQWFR6MUZleTdueCs3b0VuL1drNFBkUTM0?=
 =?utf-8?B?U1pQN05BVHM5SVpocXBqY2JjeHF4MVlVZ1NEa1Y1MDNnVWVReTFYRUVWbW9v?=
 =?utf-8?B?eDBIUVpxWERnN1gzbW8zaHhpOEJhVTR6KzFYU2k2bFpYbDNNSG1uSU9PVmpp?=
 =?utf-8?B?N1FVWUs2NXduQ0d3bS90dHJJV09uVnFZTTZmU0duZ1hYRXppR2hnTHp5Q2JX?=
 =?utf-8?B?NEFhTGZOUThVbDZwRlpaalJJdXo4ZDFhd0hzVldOSkQybHljR2JIUnRiMzRu?=
 =?utf-8?B?REwySGtnSUxOLzIvMFFaZTRQMlQyU2RCdWtIUUJua00zU2ZCQVF1aWZZQmpz?=
 =?utf-8?B?STI2TGZjRndNZ3l0UVhFako3MXpLVWNoVkptR1gzTU91SjNOSXl2ZC9hcG04?=
 =?utf-8?B?cDYyVWZlZ2ZyUTEvRHdJNG4wekxmdnBoK2pQblBxVi9HSjErWDRiVXVkSDQ0?=
 =?utf-8?B?cW9qek5rNWNRK0JVY3NTV0drdWUvZjdMSHVlbFpRMFlheURsNzk3NTc1MDBP?=
 =?utf-8?B?NHViTllRRkMyUWpSOUU5S1hMZXg2YUtOWjhYMHd6dEhrZGFkdDNkOTVxaDlS?=
 =?utf-8?B?Y1J0NmVEVXJWMEhDclU2VWlvZ3hFWXJXNWZTT09IZXRsQ21vNllGZXF5NEcr?=
 =?utf-8?B?Z3V1aVFQWTFmc1kzQm80ZFUyV3FBa0RkUkJtUE5QNmFhZUIxalY0akNJY2RK?=
 =?utf-8?B?STM1dXo1M3A2STJGWDI0OFhjTkwwcHFDSzFGYXVrUjZQWDUyMktNZDJnbDVE?=
 =?utf-8?B?bFpreWw0R1UxOUhVSnNaSjJ2Uyt1UjFyWDVwajNTTHJySW1jSFFEcWlLcWM2?=
 =?utf-8?B?VGlpZE51S3ZrZm9VU1F5NU55VHBWaGE4WUFpWk1KSWdzNnFyS0dNNHRoRldM?=
 =?utf-8?B?Qzl2RzFHK1pabi9qVFBSdFR1VmVNWTBaMWcvNnhkVDVrN0kzMEpqTG45cnRO?=
 =?utf-8?B?dVc3UzZwT2RwdWJvRGU4bGVsSmZVZVB5d2xTdC9ta0xBRzhDZEwxRGVpcCsx?=
 =?utf-8?B?QUlQSTBMRGN5Mi9SWHNjdXFWSE1lN0U5cFRya1RCdmFYb0hwcE1RcTJ4L3B4?=
 =?utf-8?B?UmRGYmh4MVhqYU4xRUQyUlNlZTU5U0JuZmNncWRoUzJ3QW1oYXl4RkYwQzVx?=
 =?utf-8?B?L2JlYVo2eXJDSFFpQXd1KzhGWHM2ekEvUDExbE5tckx5T1o5WHByQ1hLcHNR?=
 =?utf-8?B?citYZGpJYVFnWUZCZlRmZ1QwMnBZWmpvWEhZa0NaT25WUkUwL0s3VW1VcFgv?=
 =?utf-8?B?MDluZ09JTmlPd1BheFljcjk5YU1OOFZldlVEbkVPODl2NGZlSTdZeWF4SC96?=
 =?utf-8?B?UlM1RWl3ZmJHUmR1Z083NDVOYlluUmpXYVdhQXJYNlFuenA5bE1ZU2d5TFor?=
 =?utf-8?B?dkZReXh2Y3VxWmdXODBrc25vUk9lNXNZNGhwVHBLbFYxUWtGMEc1S1FjMndl?=
 =?utf-8?B?eDRaL3grY25tMjVhVWc2UzJBOW1uVWFkdnFYck1zSFhHN1ZKa1QzQmpDOTlp?=
 =?utf-8?Q?VCADhj6HpEldOTmDpuru03xKCK9YzG7e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW1KMG1RdWs0NGh3YTRuVUV1NDQrRW05MXhEc0xNVm9uQlZmUWtMUzdHVWNX?=
 =?utf-8?B?VVhXRDkvQVJTMVVrTzdqeUdBbE5KRVNwVzRvd0I3czZsQSs5NWhqNnNSbkQx?=
 =?utf-8?B?ZWJlMDNnVFNYM0p3YjkyL05BRkpqbmVkb2pZbmpRWkR6ZTkyaUFXWHh5NHZw?=
 =?utf-8?B?L21QZ2pZZCszWXhNV3VKd0xmL2p6WFFpdldYWkhGNmNrSlBhOGJpd0tXWnlo?=
 =?utf-8?B?cmFHWjg5MUU1QW1mWE1xbDNrRUl3Q1BqcDVldEtPNC9Nc3N3UXBTQjlWcnky?=
 =?utf-8?B?eS9hNnNHWkJva3F6Z2tlWUpVL3UwRnJnUHFjOGh6NFp4aFJRQS9CaHh6WWVI?=
 =?utf-8?B?YlduN0d6QWYxTDRIejY2S1ZtbWd5SmRJVm13NFJ2Uzk2RGtaSkxEd3FDUmVu?=
 =?utf-8?B?RFVEazFUalFrWTB2Qm5PUWgzMXAvdGNzaWk0OFFHKzFiRHBQdVFqZE1PNTVV?=
 =?utf-8?B?OFhwS3VYdDlTS0FkVUNhT1BOSzMzWjZsUndYYlFBZDdyNjE4bkN0SElGQTM1?=
 =?utf-8?B?SWdGL3ZyMG8zSDZRWlZNcHRHdWNwdFZXTmNmUXVUenhxY3JqNExRNzdtcm1t?=
 =?utf-8?B?R1kvWFV0bjdGdnkxT2M4M3N5dVV3cCtkcGlmOWlpL2JYSDUxRS9DNTViK0xj?=
 =?utf-8?B?TTlZSWdCV1ZrVjRabkdqYXFkaDVqN1FaQUdFSU9YdHJLRHlXYkFMWldRMTly?=
 =?utf-8?B?bkM5YnczL1ZvSlhvSVIzOWVOUnl1NXR5eGtsS2VHOG1iNVBCT2NjQlZVbHlX?=
 =?utf-8?B?dnJNZU5FM0UvT0wxTUYvSmk0ZjdySHVLSFZ5TkpXd2huMkdFZ1Y4NHRrMFM1?=
 =?utf-8?B?UGJvRHZVNzhWVk5ENnpSNWkyZ0MzSmxNU21JUDBEdmJ3ODk4N0QxSXFQY0la?=
 =?utf-8?B?QWFWc2s1TUtFN2FQZGExYzhyZHUydUFnWXdtMXJCNmJaZnIwUE5Uc2xKejJ4?=
 =?utf-8?B?VmhERXAxVmppdDU3WDRNLzdDeFNQQmMxNC9odzJyNEFTd0t0cHdqMWkyR016?=
 =?utf-8?B?ckpIRThoV1Vva1I3bFdRako3dDM0K2dpVkdpMFBBajkrUHByYU5pcDhYU2NO?=
 =?utf-8?B?emd6cUNlQ3ZqcGdDTnloeGdaUXB1SkRXdGpnVi9XaVdDTWJzbFNoOUtueDdS?=
 =?utf-8?B?QlY5SVpZSmVMbU0zbU5nMjRnNFhYYWNrWDQ1NzFjQXFaT2duR0NuRmd3T1pB?=
 =?utf-8?B?alYvTmtvSFJJR29KRzJNYUpTRlRKL1VTUDh2VFBwMGhIVk9KN2g5a1RPYXFN?=
 =?utf-8?B?YzZ2RmxNQUFibWVINFdOb25LUHdidVpQRDI1bk1tQlAxWjlzMG0vOGhuNkp1?=
 =?utf-8?B?Tkl5Nzg0YmRSWVlwZjdEMlFQYjl2STBtemNseDBnTGI3dWZkRXRiTDA1bHRC?=
 =?utf-8?B?TStzVTlBeTZiU1ZBeEVIQkJFRE5RWHhWeXY4UVo1TEp3OHphYk5Sb2lETVVu?=
 =?utf-8?B?anNnM1VUT0pHbXBvc1pXZjh0K2I2ZXdvT0lPcEUwdzZTZVkxZ2dQUUkyTmtz?=
 =?utf-8?B?NHltM0EwbXFLVUpNdnFBUTdRTm9xb1dXaGI1R2ZXS25SL09UTDdXdnRMRzB1?=
 =?utf-8?B?b3ZVYzhxU1lvK2ZCdnZkc2NZLzVKYkN4bUkxN2orUzFCVTRNbm5ReWtkQWRk?=
 =?utf-8?B?WDd5RTUzSG41YjNNbmlPbWZ6dDM0VXBIdS9rK3R5ZHo3RWdSZCttZkJDL0VB?=
 =?utf-8?B?ajVXdWtFU3JxVW41Q1BYWWhBUjNhSU9zeTdkVjRKY0NBM21GVVhySzJKeUs1?=
 =?utf-8?B?R0F3QWgrMmFMZjlOcGpMRVFTd2hXRlV2N3NaSTNoeVozSVR1WWtEdFlhTVhJ?=
 =?utf-8?B?Znh0Ylh2bVJ0WUx4dWtRNXozdDBnK3RUNUlmOWVaM3poN3FGTGMwaDd6M204?=
 =?utf-8?B?dHNWTjRmQWVKN1h1WGJWNlcxNkVJWldJa2J3enlsT29RQnNxR3A0OWhVUlkw?=
 =?utf-8?B?NW54eHBqSkxmckNuU0NvamRjU2VkRlpOWUpuU0F2YU9DVzZ3L0E2cWNHcC9F?=
 =?utf-8?B?OXJvMGVoSzJFOWRWdFFScEw5SUt4bTE2YjYrZzhlZHpjaFpicHFUb3dkQ3Ny?=
 =?utf-8?B?NzBYdlJPQm9tdTdMODRESjNlV3E4UjAzM21OeFNoUStRdFVKN1AxVHNNbXhL?=
 =?utf-8?B?Z3dkMG41M0hvQmVEYmplV2JGOUN1b3luSHVSV1hkS1JXcFpYNkRidnY5MDN6?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 025cc17b-37e7-46fe-b0f1-08ddff7b61a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:12:34.2511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5fDFoooD66M2gtaFV9gJU5t+/QCYUkVNUImovOnSgo5Dsba6bmzLOqYuQtr+uHvR4HL3J+MFEayNNS283C/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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

On Fri, Sep 26, 2025 at 02:36:31PM +0200, Philipp Stanner wrote:
> drm_sched_job_cleanup()'s documentation so far uses relatively soft
> language, only "recommending" usage of the function. To avoid memory
> leaks and, potentiall, other bugs, however, the function has to be used.
> 
> Demand usage of the function explicitly.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 46119aacb809..0a9df9e61963 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1030,7 +1030,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>   *
>   * Cleans up the resources allocated with drm_sched_job_init().
>   *
> - * Drivers should call this from their error unwind code if @job is aborted
> + * Drivers need to call this from their error unwind code if @job is aborted
>   * before drm_sched_job_arm() is called.
>   *
>   * drm_sched_job_arm() is a point of no return since it initializes the fences
> @@ -1038,7 +1038,7 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>   * submit it with drm_sched_entity_push_job() and cannot simply abort it by
>   * calling drm_sched_job_cleanup().
>   *
> - * This function should be called in the &drm_sched_backend_ops.free_job callback.
> + * This function must be called in the &drm_sched_backend_ops.free_job callback.

I believe both the existing documentation and the new version are
incorrect.

Also, the free_job callback is probably misnamed. This ties into a
statement made during your XDC presentation today that confused me. The
DRM scheduler only holds a reference to the driver-allocated job from
the time run_job is called (i.e., once drm_sched_job_arm is invoked)
until the job’s fence signals. It does not own the responsibility of
freeing the job — the driver should manage the job’s reference count and
free it as appropriate.

For most drivers, the only reference is the creation reference, which is
transferred to the DRM scheduler after drm_sched_job_arm and released in
free_job.

So, I think what really needs to be documented is this reference
counting transfer. drm_sched_job_cleanup is actually associated with
drm_sched_job_init — meaning drm_sched_job_cleanup must be called if
drm_sched_job_init was called. This is typically handled by the driver
through reference counting of the job.

Finally, I think free_job should probably be renamed to something like
sched_job_put to better reflect its purpose.

We can discuss this more in person on Wednesday at the workshop or grab
in the hallway.

Matt

>   */
>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>  {
> -- 
> 2.49.0
> 
