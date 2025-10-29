Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C0C179D8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C53510E6C9;
	Wed, 29 Oct 2025 00:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpSV56Ta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA2710E6C9;
 Wed, 29 Oct 2025 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761698772; x=1793234772;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jngUJmHwB/xySAyAgNWFhTI7znfl33+N94XttRLnboU=;
 b=WpSV56TaqO6oLzfoa+WPOmW1uUrztKVhTNqTelEOD9sLYmplGo6fo55F
 LNqMjVfA5Gl5KFtU9bQ1sD+g9IBi58DH38MxhhI8GlN+bwmNsfFZlMgst
 fZykPX+BFSLNSG+LqeaZlcriQfQKNJJiCUxbA5mfKD/jKA9v/etB13/0M
 +Ej/sX5FfxxSSlwD7wlFfE2jz1pAA1Si/OrdKBvvw6EmrN/GHrO/NFKsa
 TvfghZlbCZUmzCV28DK0QGBFkpL64iwMR3Dpod/Llm/Q9ZphEK5Clgwdx
 ecr0/W7WpgUu+XGWFkBkWz1v3wP9ltzepLSDDev9JIcWd+h/98EVrpDLO w==;
X-CSE-ConnectionGUID: EuJLnNWNRY+n4B0Xc7ccfQ==
X-CSE-MsgGUID: 75Xy4mEXSReOj8pJ48HuOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63713008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63713008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:46:12 -0700
X-CSE-ConnectionGUID: dHslkDg1Q+yZvoUpRWwxow==
X-CSE-MsgGUID: q0l2SAuQSYGm54jf3eVK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189862186"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 17:46:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:46:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 17:46:10 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 17:46:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+IIViJXuPXKVr7ZM+cM73ZRnrQFnL2xIkiF5UCY1c6nTfaEMclc9tAARZgFClMdu8aKSO4rf8U9mt7VvpSYmh1waP5rMrtlGWyih6SNK/BJkGx6CqZQLcEUf2utlH5bK/PCBWrFcQcts/TYbupoNM+WnoDrB1Wc5bhXevuHvXYw3GwzTBDXbqB+MSGhUx3bhkG35U6dqDXobG9gj/1QIxdllGZeSr2iqEQNSZHqpZwR7ytY91X+uKSBwHJ3ZqJcjmRY2WJDUiwVghuH0Z1S/HQe0Y6Pc9JvUhI35EGzandDuOCug9QEPlpsKYNdtEFOwdOKj+LORF1YIbSQxn+Eew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J4NRA2+3YGFdFuSYa6JOl4jjWgmc6E1DmshdQwz8/4=;
 b=F9RZHmh7NvB6X2OXCRNWKH1+R4gahpOrCL3IF08QMuuuFafGTkM8gGOSQ+7VNMSe8JElgXnQO9VbKlfPnhbm+pEUiljFQH2wi9/wC0MVHme0N4MMD5pIRpH5VAqQRrUOefb3rUXLixub/HnP+8o4BocYrWGkYaiEtvXfdRYWtgTIIV7N+HcQoKjV9QuMyO13Z4zue5UimSWFHn8GzZEU03FVhj6Fs21NODTf0/R4aM7JVTbfzPElP/FKc5jY0S4wdZN3zgjGx46bDnCQ8pr4LiKkSWP2X87AANVrGuR11ML5xsoXoov1vEVI2/6BntHFNgXDYmfd9ZySODRfPlthqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 00:46:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 00:46:08 +0000
Date: Tue, 28 Oct 2025 17:46:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 03/15] drm/pagemap, drm/xe: Manage drm_pagemap provider
 lifetimes
Message-ID: <aQFjzTpZwYaytZqB@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: b240aef6-0075-42f3-8fae-08de16848c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEh3dXNraWx6OWZZQkFoQVZvYlZTSlFWNFFuanlCa1BBck5rTTlHK1VMdWpu?=
 =?utf-8?B?SWYvSWpzTEFZOXh1M0hnNFliL3JJV05Gb1AxNG5xN0d5M1Rmd05LRlR3cGsv?=
 =?utf-8?B?SFpia2RXdzR5WnRWd1VJcTZLNVNuekVIalgrSnVIS1ZPT04wb0IwRFcvdXFQ?=
 =?utf-8?B?WTVXTHZYV3Z4a0NzNFZ5ekNMZEJIZmYveGJuNGhLM1lWMUVXbzB3NjBUaWhR?=
 =?utf-8?B?MTk4b09hV0tVTUxrODJ4Rk1COW11d0VRbmJhbTlVWFczNVBvZCtIL1E5cC96?=
 =?utf-8?B?Y1dhOTNtb0RJaWl4NGkrcHhGRVMra1YwdE1icW5rRElsODlXdXZXem1Td0xk?=
 =?utf-8?B?YmFGUGV1dUN1VU8vbVgzRVNPQ0VMR2hvVVp5QTBxUFRNT0R1V2h6ejFLdkRR?=
 =?utf-8?B?bzJudk92TnFWSXluWGJsMzFZTnlsV3Qzemh3MjlwWmIwc3Q3T0xJd2dnTFZQ?=
 =?utf-8?B?cUgxZmpKczNnUjkreFdWZGVISDc0ZGxWZk1GMDBENU9DZjZoMWt2WjNIa25Z?=
 =?utf-8?B?TXZ1TVQyUVF3L3BGV1pnN05DQit6NGtoSktXVHF1UzVWWFNuVGptTmlmQi90?=
 =?utf-8?B?NWVnS0ZNUzRUS25XV054a3JNU2E1V3paZllhVTZCUURIUk5XTWN6YWlBZVAr?=
 =?utf-8?B?RnNYdk54cXphYXZOTEtHaENEeGRlak9UMnhNMFVWNjY3SjFLRzd6enRZWlRI?=
 =?utf-8?B?QWNpaWpmcTQ0SVlPTkR5bGhIcmN3OXU3b3llNm9SZEpyTDlyWGhwU0FOaFo1?=
 =?utf-8?B?Sk1SQ0tTbWpXcm0rNW1YVkZWQXE0czNZaXVOSk84eEd5TmtqVFZiOTBqWThH?=
 =?utf-8?B?TVZXNlJPR2JNNnZVNHZ1R1JZbFY2MDMvbDNhWWFGZ2FGYW1JWFRDaWFTN3dq?=
 =?utf-8?B?LzVGdFplaGJuSmwzeU5RT1JHYUhDaHptMlpKODRJRVhnSFZHcDE0ZGdWbVlB?=
 =?utf-8?B?dXF4UVYvUlVESGV0SUpyemRsN1N5djJweXNzdjZxa2doNmJWY2h0ZEhCU3Mv?=
 =?utf-8?B?WXVXMTg3akFKb2pnQklRZURCcWlHZ05QRWN4NkJ4aDBpanBGUzNVM0lqYkdq?=
 =?utf-8?B?N2xOdDBvTUFjYjZnZVcxa3NsbWFsWXloR1dBVVByZXI3UVdIUWZWcVNudnJj?=
 =?utf-8?B?UTU0WTBEM2w5ZGx3bzBIQSs4ZFJyeDlQcDRUSDI1SFg1NGQ0TzllQzE3ckE4?=
 =?utf-8?B?ODJLeEpyVGNsSVZ2N1J0UHMvSGorVGpwTnJWQmFnL21KcE50d0czU0FFMGgy?=
 =?utf-8?B?TkVKQ0FBUU1yWGN1Z09MaGJGbndMbDQ0NWd3L3JYQ28zenJGOWl1UEpzcWFz?=
 =?utf-8?B?eXFkSStNajVBYkpkNnpoODdmWWRQYmJPK1REWFlBeWlML0ZUWGRETXZOcVVa?=
 =?utf-8?B?TDlsM040SWpmWmszdGhjcWxOMWZIM1RvZ01NNFRKVWNnU1JFTFNSKzJYQjJx?=
 =?utf-8?B?SEMxbkJ2eHJUVTdOR3hXWU1FeWZYSzJFK0ZadEtUc3d0MWlnNXdHOEs3M1Nx?=
 =?utf-8?B?dG1ER1YyaHZEbGkvT214UWZ0R2ZGWkZCbkNEY0MxbjNTRExHS0U0Ym4wZnd0?=
 =?utf-8?B?K3psMWh3dXZFNGdmdVZsZktrSFMvb3QrYzBOVGx4SXFjdWFUT2NaVm5SQURy?=
 =?utf-8?B?TUE2VXJBL0lxcjBFSkU0TFBqUjB5a1RCMWxSeUFERWRIbjBiNW8vOXVaRzVu?=
 =?utf-8?B?d1JTQ1FYN0o5YlBDV1VMUzVmWSthYVVDR3RSdXlXRVRJZnk2YUhLQ1NDUXli?=
 =?utf-8?B?NXZCN1ByeEt2d3R4b0lTamEvM1gvclJSY1pyeGhkb3dkcTFwSm5NeFNSNnVJ?=
 =?utf-8?B?Y1Bpb3lyclppNVZQTVIwVHF5UFF2NFdhSU1IbnFLR0FNeU1ydUJnNEQvdytE?=
 =?utf-8?B?TU9aWGhWNm8zUVNqclNEbVpiZlUrL1FxVHkrWW5UTWVVV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RGOVhEVzY4Vk1DQmE3Z2xlakE1UXBCREVKN2dCRnl1MFRkQThXRGptUGh3?=
 =?utf-8?B?Y09Rbmt6T1pvajFQUStSamZCc0ZtcFc0Y2o0RDJOQjhXWkk2NGtlbDZ4am5x?=
 =?utf-8?B?cG9na08vTzgvZ3BhcHBoZVBpY3p0ajBYL0NVbXlGclJ5SFpJYmVqSXJ3WGp2?=
 =?utf-8?B?ZUloSDl1QUk2WnBZRUVaYmV0WVp5VlRDMnA1dlg4V2xGR2RmOU5ONmpiQVNt?=
 =?utf-8?B?S2dnS21nMi94S1Mwek9tdmpKQW1BdmlmTGxhcysvSEc2OEVRcno5cWNUV1h2?=
 =?utf-8?B?SXRPajA2cEkzL3ZQVUhMdGlwVWZ5RStwd0ZLTzZOZWhsR3Rqb3NJeVRHU0tS?=
 =?utf-8?B?dDFjWGplUTZSbkl5KzE5UW1pTUl4TnRnUmRBTmhYUjMyUW04akJjekpHdllU?=
 =?utf-8?B?N1d6ZFBzVjFYYXk3elkrdUI4RGJhQkFLblBpQUJBay9WQ3FBVEtaYmJEaU1n?=
 =?utf-8?B?Rjl1WnJUdS80a0hxYWJ1VjVybG9ndjQwMnlkOXc4R1pneVRjUjg1aGx6dytO?=
 =?utf-8?B?TU83SHAyYjhoN3VIL1FWVkhZR1BBY0Y1azhjYk5yUjNTUDh5dTFPaHFmbEM3?=
 =?utf-8?B?cjh3OXNLYmpZWTFxYXF0UmhWL1F5NnlKaGJpWFZZa3duZ3ZZVGZobXRvZGxk?=
 =?utf-8?B?NGI4ZzBJdzk2OGlNeEY1MncwenJadHpKNWhKVndJVjVHZHpFY2ZiKzh2cEUr?=
 =?utf-8?B?T0JqR0FYVTNQTG12S2tTZko0RlQ1SERhSDBpZmVsMVE1cm83dFdXMzg0ZnJh?=
 =?utf-8?B?K2Q3dzFrS2F1MzBIOUJ1NnJYNnN4VTkzSEpqNWNCK3M3QWV0RDYzRFM3ZkY1?=
 =?utf-8?B?djhrbmtuL0ExQzN2b0lFOUdQY2JmbHdMd1JiRnB0MzlVVklZc1I2b0pyN3BZ?=
 =?utf-8?B?YXdnR1ptTUcwOE1qTjhnMDhCQm5YNFJFakpqdDB2RzhnVHM0MGRQNXN1eHh5?=
 =?utf-8?B?eFNreERUR2R2OXlWZDZRQW1lWGYrYW5pa3NZbmhXOXk1WVdRN0VVTk1iK2hM?=
 =?utf-8?B?bEtzSXNNRExTMVpXdkhjSWJDMTduRENLWXJuWWExdTROQkpSdEFkUmFYR29k?=
 =?utf-8?B?cHo2Tzk3eFF3Z2N6RUIwdU5wbEZ5T21WRmRBdjNTdzQvbkpHNkxENVhSdG8v?=
 =?utf-8?B?WFhmbkJWdmhSRS9XSGN6Y2swaURreUkxSFRYWmVXODBMaEx2dG5LMGRucGNm?=
 =?utf-8?B?dTdCeWhFczZmRlhYa1FpTk1ZSm9kcVlxcFpUZGxiM0d3OFQ4bnhKcVpJdldn?=
 =?utf-8?B?QzlHTEo0UFQ3TzNNR2hKSVUwSmxPOHVEcjFIYkFNeG14Znd6dnFCUnBvTU1Y?=
 =?utf-8?B?U0FIMFlFSllBOEpiTm01NzNqRDB3aWp4K0k1U1FOc2ZUWkVkQWpzKzRnWkhD?=
 =?utf-8?B?UnBkZWZOaVdvQnhsRjYrbFl0RzNGbXBMcVRlMHRNN2puQTVXU2d2ektwM0dX?=
 =?utf-8?B?VnZqWGxDWTVPeFZZcnI1UjZwdHprck5xdVgvWmZaQTJWbXZJMzJEZnpMZVh5?=
 =?utf-8?B?RzdpZGpHUWVCZnpJYStkUm9Cai9hc2RMRDFtYTZaQkoweFQ1V0w0ZThmcE1l?=
 =?utf-8?B?eldiNVhmbE5YWDlRSEhhV3FSaWw3VkFabXlzZjNZbndka2MxeGl0QitrSnNN?=
 =?utf-8?B?OVdwbGFLY3QwRjBVR215eGprVWh5YWJQT1I1OUpmQ2pjenNuU1ZFelBDdVAz?=
 =?utf-8?B?N3B5dHVYQ0FESTVOTnpHYVdsR2RjQ0p3ZnJWVm9GUDJOaTZtWUdXWmtSR1J3?=
 =?utf-8?B?WC9yUklteHp0N0dIWWI2TzdwMGtGOElzMlo5TyswRzBFVDZLMDdDTTN3YUw3?=
 =?utf-8?B?Tm5aTGNpeDh0QWVHZ3pMYTZjdDdjWnIwU0JiTHFWblYvTlZ2UEtUZ2gzeW9E?=
 =?utf-8?B?Y1pTaTRaamMxVHFwRkdyM2d4S1VBL1p6NDEyYkd1em9rMTdaUXJScFFKSjRs?=
 =?utf-8?B?QkNBS1daVGRrQVdZOEIrVGhDRlAwdXBWbGVEZFpEL3ZNRzZKNFhQcWRXQnF5?=
 =?utf-8?B?VzlTL2Vtc2VrRW94QUEzTGllVnVjREk3M2xBbWlYU1RsajNxSDZiRzdjQjJU?=
 =?utf-8?B?dlJzQjFQYlozNXFGbk1pU3ZBd2YxTWUzZUZUYzNYK00ySjdsL01ZUU52Z3NN?=
 =?utf-8?B?elkxOWdnTS9lSE5VWjhmRkxBc1BTOW9uNDZQb0dBRy9CMUV2NXIwUmR6dUlU?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b240aef6-0075-42f3-8fae-08de16848c5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:46:08.1173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3dU2ANvFd8rCmTtrCokQR/8R/o/FPsRA4oqw1LzT9/IHwwKXmfT5nh0tde8pNqVwL6kLXjmhnhQeSlizWUMqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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

On Sat, Oct 25, 2025 at 02:04:00PM +0200, Thomas Hellström wrote:
> Even if the drm_pagemap provider has released its reference on
> the drm_pagemap, references may be held by still active pages.
> Ensure that we hold a reference on the provider drm device and
> modules for as long as we might need to use the drm_pagemap ops.
> 

Just to make sure I’m understanding this correctly — this is intended to
guard against the devm action [1] running while a device is still
holding references to another device’s pages, right?

[1] https://elixir.bootlin.com/linux/v6.17.5/source/kernel/resource.c#L1993

> Note that in theory, the drm_gpusvm_helper module may be unloaded
> as soon as the final module_put() of the provider driver module is
> executed, so we need to add a module_exit() function that waits
> for the work item executing the module_put() has completed.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 101 ++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_svm.c   |  15 ++++-
>  include/drm/drm_pagemap.h     |  10 +++-
>  3 files changed, 117 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 173b3ecb07d5..fb18a80d6a1c 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -8,6 +8,7 @@
>  #include <linux/pagemap.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_pagemap.h>
> +#include <drm/drm_print.h>
>  
>  /**
>   * DOC: Overview
> @@ -544,16 +545,92 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  	return -ENOMEM;
>  }
>  
> +static void drm_pagemap_dev_unhold_work(struct work_struct *work);
> +static LLIST_HEAD(drm_pagemap_unhold_list);
> +static DECLARE_WORK(drm_pagemap_work, drm_pagemap_dev_unhold_work);
> +
> +/**
> + * struct drm_pagemap_dev_hold - Struct to aid in drm_device release.
> + * @link: Link into drm_pagemap_unhold_list for deferred reference releases.
> + * @drm: drm device to put.
> + *
> + * When a struct drm_pagemap is released, we also need to release the
> + * reference it holds on the drm device. However, typically that needs
> + * to be done separately from a system-wide workqueue.
> + * Each time a struct drm_pagemap is initialized
> + * (or re-initialized if cached) therefore allocate a separate
> + * drm_pagemap_dev_hold item, from which we put the drm device and
> + * associated module.
> + */
> +struct drm_pagemap_dev_hold {
> +	struct llist_node link;
> +	struct drm_device *drm;
> +};
> +
>  static void drm_pagemap_release(struct kref *ref)
>  {
>  	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> -
> +	struct drm_pagemap_dev_hold *dev_hold = dpagemap->dev_hold;
> +
> +	/*
> +	 * We know the pagemap provider is alive at this point, since
> +	 * the struct drm_pagemap_dev_hold holds a reference to the
> +	 * pagemap provider drm_device and its module.
> +	 */
> +	dpagemap->dev_hold = NULL;
>  	kfree(dpagemap);
> +	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> +	schedule_work(&drm_pagemap_work);
> +	/*
> +	 * Here, either the provider device is still alive, since if called from
> +	 * page_free(), the caller is holding a reference on the dev_pagemap,
> +	 * or if called from drm_pagemap_put(), the direct caller is still alive.
> +	 * This ensures we can't race with THIS module unload.
> +	 */
> +}
> +
> +static void drm_pagemap_dev_unhold_work(struct work_struct *work)
> +{
> +	struct llist_node *node = llist_del_all(&drm_pagemap_unhold_list);
> +	struct drm_pagemap_dev_hold *dev_hold, *next;
> +
> +	/*
> +	 * Deferred release of drm_pagemap provider device and module.
> +	 * THIS module is kept alive during the release by the
> +	 * flush_work() in the drm_pagemap_exit() function.
> +	 */
> +	llist_for_each_entry_safe(dev_hold, next, node, link) {
> +		struct drm_device *drm = dev_hold->drm;
> +		struct module *module = drm->driver->fops->owner;
> +
> +		drm_dbg(drm, "Releasing reference on provider device and module.\n");
> +		drm_dev_put(drm);
> +		module_put(module);
> +		kfree(dev_hold);
> +	}
> +}
> +
> +static struct drm_pagemap_dev_hold *
> +drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_device *drm = dpagemap->drm;
> +
> +	dev_hold = kzalloc(sizeof(*dev_hold), GFP_KERNEL);
> +	if (!dev_hold)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init_llist_node(&dev_hold->link);
> +	dev_hold->drm = drm;
> +	(void)try_module_get(drm->driver->fops->owner);
> +	drm_dev_get(drm);
> +
> +	return dev_hold;
>  }
>  
>  /**
>   * drm_pagemap_create() - Create a struct drm_pagemap.
> - * @dev: Pointer to a struct device providing the device-private memory.
> + * @drm: Pointer to a struct drm_device providing the device-private memory.
>   * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
>   * @ops: Pointer to the struct drm_pagemap_ops.
>   *
> @@ -563,20 +640,28 @@ static void drm_pagemap_release(struct kref *ref)
>   * Error pointer on error.
>   */
>  struct drm_pagemap *
> -drm_pagemap_create(struct device *dev,
> +drm_pagemap_create(struct drm_device *drm,
>  		   struct dev_pagemap *pagemap,
>  		   const struct drm_pagemap_ops *ops)
>  {
>  	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +	struct drm_pagemap_dev_hold *dev_hold;
>  
>  	if (!dpagemap)
>  		return ERR_PTR(-ENOMEM);
>  
>  	kref_init(&dpagemap->ref);
> -	dpagemap->dev = dev;
> +	dpagemap->drm = drm;
>  	dpagemap->ops = ops;
>  	dpagemap->pagemap = pagemap;
>  
> +	dev_hold = drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dev_hold)) {
> +		kfree(dpagemap);
> +		return ERR_CAST(dev_hold);
> +	}
> +	dpagemap->dev_hold = dev_hold;
> +
>  	return dpagemap;
>  }
>  EXPORT_SYMBOL(drm_pagemap_create);
> @@ -937,3 +1022,11 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	return err;
>  }
>  EXPORT_SYMBOL(drm_pagemap_populate_mm);
> +
> +static void drm_pagemap_exit(void)
> +{
> +	flush_work(&drm_pagemap_work);
> +	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
> +		disable_work_sync(&drm_pagemap_work);
> +}
> +module_exit(drm_pagemap_exit);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 6d2c6c144315..f6ee22da2e95 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1437,7 +1437,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  unsigned int order,
>  			  enum dma_data_direction dir)
>  {
> -	struct device *pgmap_dev = dpagemap->dev;
> +	struct device *pgmap_dev = dpagemap->drm->dev;
>  	enum drm_interconnect_protocol prot;
>  	dma_addr_t addr;
>  
> @@ -1457,6 +1457,14 @@ static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.populate_mm = xe_drm_pagemap_populate_mm,
>  };
>  
> +static void xe_devm_release(void *data)
> +{
> +	struct xe_vram_region *vr = data;
> +
> +	drm_pagemap_put(vr->dpagemap);
> +	vr->dpagemap = NULL;
> +}
> +
>  /**
>   * xe_devm_add: Remap and provide memmap backing for device memory
>   * @tile: tile that the memory region belongs to
> @@ -1482,7 +1490,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		return ret;
>  	}
>  
> -	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
>  					  &xe_drm_pagemap_ops);
>  	if (IS_ERR(vr->dpagemap)) {
>  		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> @@ -1490,6 +1498,9 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  		ret = PTR_ERR(vr->dpagemap);
>  		goto out_no_dpagemap;
>  	}
> +	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
> +	if (ret)
> +		goto out_no_dpagemap;

I mentioned this in first patch that this was missing, maybe move this
part to the first patch even though this will get removed a bit later.

Matt

>  
>  	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>  	vr->pagemap.range.start = res->start;
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 2c7de928865b..5cfe54331ba7 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -9,6 +9,7 @@
>  #define NR_PAGES(order) (1U << (order))
>  
>  struct drm_pagemap;
> +struct drm_pagemap_dev_hold;
>  struct drm_pagemap_zdd;
>  struct device;
>  
> @@ -130,14 +131,17 @@ struct drm_pagemap_ops {
>   * used for device p2p handshaking.
>   * @ops: The struct drm_pagemap_ops.
>   * @ref: Reference count.
> - * @dev: The struct drevice owning the device-private memory.
> + * @drm: The struct drm device owning the device-private memory.
>   * @pagemap: Pointer to the underlying dev_pagemap.
> + * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> + * device referencing.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
>  	struct kref ref;
> -	struct device *dev;
> +	struct drm_device *drm;
>  	struct dev_pagemap *pagemap;
> +	struct drm_pagemap_dev_hold *dev_hold;
>  };
>  
>  struct drm_pagemap_devmem;
> @@ -206,7 +210,7 @@ struct drm_pagemap_devmem_ops {
>  			   unsigned long npages);
>  };
>  
> -struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
>  				       struct dev_pagemap *pagemap,
>  				       const struct drm_pagemap_ops *ops);
>  
> -- 
> 2.51.0
> 
