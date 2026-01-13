Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E1D162F2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 02:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2C10E447;
	Tue, 13 Jan 2026 01:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1lPnxjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2363910E2E0;
 Tue, 13 Jan 2026 01:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768268438; x=1799804438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3gaDhVOrpNOEATNp4K+ZNhbH0KfD9E7hRYbbAAsSXaI=;
 b=k1lPnxjLxXi20vcJUZ7LJIYd9fNlZl8P3f7pnT1fm+UxHgKPqd/iLJqe
 bI3SFWxf7NuOvri2w6QaPL5gR7eCPKadX/bjQV/DTtVVeaU/lEhEryn0J
 UA4y3MbL2TrCFuQtASaapXjKEBorhiLOlJ7whecVfnvJv0pXUL2Pm3uqE
 2PMquw41bftid7SsjdWgbRuny481KXtDoIU+NGHUttMP3kNKX2GS3xsnJ
 2K36V9uLx2GT90g3xjXdh5DAYrO76/G+hxQoXgUGsYEjhWfUMrBeLGToI
 nsfVNfmQr3YAI6q42eOLDkVh/ChtpBtHwBiRb7sXyoey6wn7fzd2Fw7jH A==;
X-CSE-ConnectionGUID: q3ufRmJ2S1SZ1ZHp0DdCCw==
X-CSE-MsgGUID: qiyleQYTTyWlDHVfKnqvmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72131624"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72131624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:40:38 -0800
X-CSE-ConnectionGUID: XLyxTLxsSsWZnOywjKqwdg==
X-CSE-MsgGUID: nmH1Hou8QrKZifSAt4NLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209308912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:40:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:40:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 17:40:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:40:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkCxmOuDii/7n/PbJuWXmcEVt0uHM+ear6hUsNVd9ey5mnVw/YyOQE+75RypXdI4GIaAqH+g5e06kGb4XoYQhwTJzHm/cglByMcXKYwJ9PZj2IYpYGffTeOKtNjh53zehQecBTvWiejnySFVDso8Gl782magxN6igcdU3MCBxYqOoDEL6gcwaqX7kGP7rnbe+Nz3imOVTbU8jTsZ1elhZ7LVsJZVdZAdYw/jbJeBlpVe62+fQ+sShMcIJ9i3C1icRGsEyd61lOR3ooN8vz3Gd5aG7kjn1G5Mw6n6/k/z6SqD2Y42SgAbV9F7VZBBHUb3HfsDx4jstbbHplzUnBqbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TjTbQy9lVgTTd0baORzDZaf8hCfe/gT32VSOGPEpGk=;
 b=cvKnlADYtqaLQeGZjCFazKi9U8IuVt1Fxg+PDaltLhbxk+dUEutAtfclYXm/nQ2bygZiw+q0NETxifk8LdFQjwyh1YpZawMcqfJJVpSZaDVq5NICfVfdsG8dGXlo/YFJLUR10npnjq8oaB3N8yGYZiGLUnzS1Wf4EDNj/vOmNnH4aEPLpMe9fY18gxquu3vzHThPOUV+J6HaLvVdhej9CWGzzCybVAVS+xPxhe+enLELML96ddw00dRQ8SqPrZAxuEXZDhvZFRJdgKpxcqLq9Z2xCXVtlNdLY2Y/R8EI9PyDhZDiJgQ0pQrbYNG/VUiTZBQVH35/ItMwV7AUak7miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:40:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 01:40:33 +0000
Date: Mon, 12 Jan 2026 17:40:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Balbir Singh <balbirs@nvidia.com>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Zi Yan <ziy@nvidia.com>, David Hildenbrand
 <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, <linux-mm@kvack.org>,
 <linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
Message-ID: <aWWijsq6CohElWVV@lstrano-desk.jf.intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
 <k25qmqrfmhzkls2ngdaq4wdk3xtl3epv4z3dvukon5yj2cb2hl@yci7xdpvauh7>
 <aWWQhOD8g8oLz1vX@lstrano-desk.jf.intel.com>
 <ntawk3mmrg2qihe24dk34pevtlgj3cdxnshau3wgyi5lygtuvo@jcsz5hmt4xth>
 <aWWaxakpRiapWw5X@lstrano-desk.jf.intel.com>
 <bgbjzeqbvdrlusnt2gexc4joosukgxddca5w5zzq6dz44rjkfq@nt2qd7eu5cak>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bgbjzeqbvdrlusnt2gexc4joosukgxddca5w5zzq6dz44rjkfq@nt2qd7eu5cak>
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c9a153-37b7-4980-c415-08de5244be0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d05yeURlY2VVMUwvVjRLU2tvaDFseE14VUVQVjk2OGdac0crTWx6bjlzTnBj?=
 =?utf-8?B?Z2NkcXZQdzdvT2RPbkJQem5TTzRpcmRIWGlMakVrUnhRRklpRWpuV1U4QUYx?=
 =?utf-8?B?N045REx1cmtmRGJrQUd5akw4UTNUaEhyNzVNL1ovdWRUcFVTSkt1QUloRWFR?=
 =?utf-8?B?TFFTa0dhUHU2RHNpNHRualQxM0xSY2pUek9xMkZkcFI4Qi9naXdNQU1zV3RW?=
 =?utf-8?B?VVZESUhmNVNuMHpiSVVjTmJVeEVnTEhIRWJzT3BhMnlHSFlkZXJpRWoyejdv?=
 =?utf-8?B?Q3NPNkUvTGRhT0dPZUE2VGxtbTFmejI1WmFNdktvakFsNmVIZTdoU1hwYnRS?=
 =?utf-8?B?NDZRb09GR0NqN2s1T2owRzdtZkkvYWw4WUhCL0pJVXc5a3UzMmFjTlpmUVVo?=
 =?utf-8?B?cFU3OFFPU3YvTDNETklKVXBWajd4TWNnS09jZGJTUVRrNUdQM0ZRb3kvVDEr?=
 =?utf-8?B?QytseUg4RTV4aXB0RVpVL1E4TFhKQUkyT2JLTzhNM0tlQ1pXS0JDOUFRYXdN?=
 =?utf-8?B?bkc3aEV6eDNUZDE5VjBWRElRVTVpYStZM2N5cjFWb3RsQVh4OEhsWldLVCtC?=
 =?utf-8?B?ek1wWmZDVU54T20rckY4OW92VDFuc3N5T21jcW9EVW9HUkJ3WStGU2hzTXFm?=
 =?utf-8?B?TUJlcmVRa25XTSt4S0M2aGdmeVlYQ2JtMHR6cjZtTWltSk5Kd0trR2hHL3R6?=
 =?utf-8?B?Nm16STlGZnJvbG5kQ0ZBTUdYaW1KbDBIOXhjUGFmTU05UlB0dVV5bzZhMmhy?=
 =?utf-8?B?MWowd1JNUmp6VWxDOG9wTEJ2NDhIdkc3aStvTzhNdFFpQXdFc2tXYWFGRitv?=
 =?utf-8?B?TFBJaEV6ZU02cys4Q25IelFtcE1jWTdHMDJ5RnNXa1pCb09pSEtXb0FSK0Q0?=
 =?utf-8?B?WHBRM1NGMXpHdm4yUXFrZWluWllObnhkbTVVUGFUTjU5MHpoZHFvMEQ3SEtj?=
 =?utf-8?B?cCtLd3dhQ2JNTDA5YXQxWk54UFZRUS8vRHRNbUJ5R2xGQUdPTUVIUWlndTVv?=
 =?utf-8?B?OGIvbnZ6d2M2U3BOTTNVc1M1VUNZK05mRlo1TDZKdTg2MkNSYXRZNFpDUS84?=
 =?utf-8?B?TFBwdzU1Rm1zRHo1OHppTnJjc1kvSlA5NkJIeUFHY2dLV28xUkNsbVBGUXY3?=
 =?utf-8?B?bktRVXord29zNU1LKzdqbHpHODYrRzR5M3VTVlhSTWxPdk1ZaVlIMVRCVWNm?=
 =?utf-8?B?bWpYb0E1SmpJbHp1MTdhdERzQW1zZTRPZGI3U2lwK01nTGczM2N5TEpoRGxB?=
 =?utf-8?B?TVRWZ2U5R3JhSTdTalBCR3NaUS9yQWQyUi91WTh1S3BLMis3UXh4WEJOaWlk?=
 =?utf-8?B?eUU1T1MzcXVVTDVpNytqczdweEIvMDArcTJ0UEZxSlREZ21XNXozeFlUOXZG?=
 =?utf-8?B?Q3FHZnhFTkZkbC9FNGV1SG5tdHBnTU10N2EwQUxQRjBBMTFRUHlXbDRFMmo2?=
 =?utf-8?B?eGt3NkJyVlpGeW5renMzV3dJa3dacGZ4SGVZbHZrb2MrM2lBZ1hpakw0M0JS?=
 =?utf-8?B?Tkl6Y0JOUU92dDdsTXl3aU13RzVYdi9oUFZzU0oyZE1rMk5DRGJYMlRWWjFj?=
 =?utf-8?B?bS95MGtzTXgrY2x3ZzhlWmt2VGpPTXh5bmZKQ2wvMUZxYUdvbTZENFpXZ04z?=
 =?utf-8?B?Q3NCS0FBWk4reVR3WWgwZUlqYU00a3kzUG9NMGZlaVNSbWREY0tvNlJsSW9C?=
 =?utf-8?B?M25SYUt6RTlYU1A1VXp5SHZRK2lsaDlRY2ZtRk1YQzNHWlBSdmFsRWJSOGtj?=
 =?utf-8?B?b21reUFkeEdkR09QOFRyRGFHbUV0WmkvVk4wRWNPd0l1YnB2SytLcEVzMUlP?=
 =?utf-8?B?RFpaMjZ6OWVqRmg1aVZSWDdDV2dUMUE3bk5KYU03RmVSbFBYbUdhL1JWV2d2?=
 =?utf-8?B?SXkwM1BYZUNtSEFMT1VSR09Ba0ZoSmgvVXdLQmdpdG5zZFZreXUxVmk4Y0E5?=
 =?utf-8?B?Tmk2MHhqN2s4MmNUb241aERZMm8zeU9pMTRxaitsbnU3VU5VMmxBQWw0YVlZ?=
 =?utf-8?B?NWF2cHFFVWp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFKL01tZW4zb0pnYWRMVXdSbEZQZnZqdnRGQkd1R25YalJ4TUJ3NDdvRWZl?=
 =?utf-8?B?d2IyME0zbThnaDdmMWthZHhYYTZKWXkyOHRRNFdIaWRDaDloYzgwOEt4c20r?=
 =?utf-8?B?dWlmV0VhOHVxYlpxcnV5dFJZdTFCRVVyeTFzR1hZb2p4WXFRUEU4TXIrN1h3?=
 =?utf-8?B?RC83elNpczlIYkRzSWNjZHMrN052K0ZIWkxOSDBwY3dZS0lLWk5EM216Vmtp?=
 =?utf-8?B?cXdNalBlbG5RU21oQjFCenBUaERIM3BUSHljaUlUc3NMREVJZ3hkYzRsUnRH?=
 =?utf-8?B?QkZUWHRubmlodG5BazJLYjhvdGh6SFg3clZZNXlrUXZ3d0ZvVnlEVlNadUtx?=
 =?utf-8?B?ZUd1SzZ6aUh3OXRXbWJJQndIcE0rN2dlc1BjTWIybmQ1RXFsT1pSUWNOb1J6?=
 =?utf-8?B?UngvcFlwV1JrRm1mRkdQRGNPbVdJTldRODdSNUVYUDgyNFl4enkzbmlUSk12?=
 =?utf-8?B?VVlLZC9EL2dwUjZxQXk2d05PNDd3c2dzT3hTMWdNQk42KzdpYXN5UWlCcGZH?=
 =?utf-8?B?RUJ0VE5FL0M4ZGduRlp5S21wTzRPeW9sYXBsSmlYcEtLRXljRnB3REVZTXVu?=
 =?utf-8?B?Q2M4SERKTVJjUExCTDRPdHp5bVpxQWdKUVV3MGhYYmdNSmRZY3NFOTBiQjhK?=
 =?utf-8?B?VjRzTzhLRDNJQVVYc3ppTEFvaWpFaU5YOEpmRXFaNm03akVsdUFlelJWaEVJ?=
 =?utf-8?B?dFF4TUlzbHl6OXRCVVorVW5vZU02WGxiVWVLQm5iRGQ3Z1pGZTlXUVQ3S2tj?=
 =?utf-8?B?ejB0MXd6aHdPVVlGMW9lWE1MYmZEemJuZjZueVRyNnkwUTZYaEVLRHNoVFFy?=
 =?utf-8?B?ODZqK1RXMDlYRmUrYjVpOFNJcjVqM3h6aWZtc2xoSG9lQTZ6dFJDR3o2dyt2?=
 =?utf-8?B?b01QSUJXS3RGSnl5bjZnU0pvRGQrWVA5Z0tMemtzbHVYRWRZdnM1WUJVSUI1?=
 =?utf-8?B?WVB6eEI5T1B5d3FvTXdUZXdYZG91aEl3dklFQ28zZVU2MS94ZklCTDBLRUdq?=
 =?utf-8?B?NWFKTnBHeDhIYlBJMVJUVHZINEFjR1pyUlhvNlBVeFlDQ1FEWmVZbkU2eEs5?=
 =?utf-8?B?TjJ6NjFHdHRDRjB0akx2TTZOR1k4azd0Q1JZYnlwOTVQenBibjRiZllzbUdR?=
 =?utf-8?B?ckZ0R0hGV1lDcEpheTcrSll1K1JnaEVic1Q2enBCdDNsZ3hGaDdGcGpIWWdK?=
 =?utf-8?B?VVpEUExvR0orMW5Gci9sOExjeWpnR0RId2tqYmYrUkhzb3JzR2VteWY0bGhq?=
 =?utf-8?B?U0MrcWo0Q29PS2h4TkZJalh4L01uWU51ZDhqYmVwaGRucmZPdTVTbm1QN2RD?=
 =?utf-8?B?WHlFTms5R0FJWWtyeG1BRFhUanlWQnQzNmJ4cVJRVnJhMGlVa04waHdhZ0pJ?=
 =?utf-8?B?RlRXNXdndkJQdGVqaVVleHBRYVBMUUpVcWtQOXFEc25wbjhpNTlPTXgzc1N3?=
 =?utf-8?B?WStEb2dmbDFSOEY1S3NMRjAyT3lnQlBQSzFDd2VQQlVRakcwM2hBV0RTb1RH?=
 =?utf-8?B?ci82NG5YbTB2WjQrbExPNDhwSkNhWXhPdFova3BjU09MNjBKK2V4c3JpZDhV?=
 =?utf-8?B?L0x3ei9TRmRlUERYcjR1SytZRGRPNFNUWnpNM3BaZ0QrQWluTTNHbllKZWdp?=
 =?utf-8?B?TFZRMVNzY0Uxa2FiRmhzVitRTGdlampOcHNzVTgzck9lYlV1R3FhNGFmREVW?=
 =?utf-8?B?RHhZT2F2U0JPSTd1LzFyNXJncVA1VEExczJlV0Q0aDY4Q1dZRlhIR2kya2Q0?=
 =?utf-8?B?cDRub2U1OG0zR2lwbnl1M2cwTmx1RVBqMFBONVhpRUM4Z3JOcGxuUThWNTNZ?=
 =?utf-8?B?c2oxWXNWeDRkSGVRM1RzZmxKc21peWMyMjg0ODR5blVibkJkWXIrM0lSMnIw?=
 =?utf-8?B?cDZWVExCZlhZVTNhNHp5L0FTcjM3SmM2N2F3U0VmTFA4VVdXcnR6WjRsVTZL?=
 =?utf-8?B?eEtvbTluSmZYWXBLTTJ0ek03ZXBsT1hkOUNzSHgrK3VqRit0cTJKWUFia1Fz?=
 =?utf-8?B?Nkw1bStrUUNBenBNNkU2T2VMVkR4cTJVbjR4cEFON0d0WHp2UHE3U3VZSGlL?=
 =?utf-8?B?QWNmd0lMLy9VQllMa2pud3FzZnFKdklMSXhNeFZqRkgyTUtqQTlnaWVpeXlr?=
 =?utf-8?B?cy9rSVhmWGhCd25zZ1VBOHM4R2pBWjliNDY1V2R5U1VrZlQ4TlN3aWJVVVNB?=
 =?utf-8?B?VWkxaWlKSGs0d21wSUlrc3pBTDNRWHJvUmQ4bi85NG45RHEwaWpETGd4TWxa?=
 =?utf-8?B?U0gvZ243eGd4TEJ5Uzc3UEJrL2dlN0J0MUlBT3FkTzF6SnpGSlR5SG9Pd3Jh?=
 =?utf-8?B?amM4OStWNTU0RHhia28vRG5lSms0SDhIb0NCL2VES1I3cGpUV3FBZ2NPcDI2?=
 =?utf-8?Q?5MGRQ46JHaHCmEH4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c9a153-37b7-4980-c415-08de5244be0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:40:33.4378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 584Ymg7XCsO4G+BMdjd8Ba04683AIUXmdyQeUBpPmauTo/FMbNpHOQPkTXGMNQzcT/tKcqWXqCEuJP0qlMkhrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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

On Tue, Jan 13, 2026 at 12:35:31PM +1100, Alistair Popple wrote:
> On 2026-01-13 at 12:07 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Tue, Jan 13, 2026 at 11:43:51AM +1100, Alistair Popple wrote:
> > > On 2026-01-13 at 11:23 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > On Tue, Jan 13, 2026 at 10:58:27AM +1100, Alistair Popple wrote:
> > > > > On 2026-01-12 at 12:16 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > > > > On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
> > > > > > > On 1/12/26 06:55, Francois Dugast wrote:
> > > > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > 
> > > > > > > > Add free_zone_device_folio_prepare(), a helper that restores large
> > > > > > > > ZONE_DEVICE folios to a sane, initial state before freeing them.
> > > > > > > > 
> > > > > > > > Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> > > > > > > > compound metadata). Before returning such pages to the device pgmap
> > > > > > > > allocator, each constituent page must be reset to a standalone
> > > > > > > > ZONE_DEVICE folio with a valid pgmap and no compound state.
> > > > > > > > 
> > > > > > > > Use this helper prior to folio_free() for device-private and
> > > > > > > > device-coherent folios to ensure consistent device page state for
> > > > > > > > subsequent allocations.
> > > > > > > > 
> > > > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > > > Cc: linux-mm@kvack.org
> > > > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > > > Suggested-by: Alistair Popple <apopple@nvidia.com>
> > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > > > ---
> > > > > > > >  include/linux/memremap.h |  1 +
> > > > > > > >  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
> > > > > > > >  2 files changed, 56 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > > > index 97fcffeb1c1e..88e1d4707296 100644
> > > > > > > > --- a/include/linux/memremap.h
> > > > > > > > +++ b/include/linux/memremap.h
> > > > > > > > @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > > > >  
> > > > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > > >  void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio);
> > > > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > > > index 39dc4bd190d0..375a61e18858 100644
> > > > > > > > --- a/mm/memremap.c
> > > > > > > > +++ b/mm/memremap.c
> > > > > > > > @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> > > > > > > >  
> > > > > > > > +/**
> > > > > > > > + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> > > > > > > > + * @folio: ZONE_DEVICE folio to prepare for release.
> > > > > > > > + *
> > > > > > > > + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> > > > > > > > + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> > > > > > > > + * must be restored to a sane ZONE_DEVICE state before they are released.
> > > > > > > > + *
> > > > > > > > + * This helper:
> > > > > > > > + *   - Clears @folio->mapping and, for compound folios, clears each page's
> > > > > > > > + *     compound-head state (ClearPageHead()/clear_compound_head()).
> > > > > > > > + *   - Resets the compound order metadata (folio_reset_order()) and then
> > > > > > > > + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> > > > > > > > + *       * clears ->mapping
> > > > > > > > + *       * restores ->pgmap (prep_compound_page() overwrites it)
> > > > > > > > + *       * clears ->share (only relevant for fsdax; unused for device-private)
> > > > > > > > + *
> > > > > > > > + * If @folio is order-0, only the mapping is cleared and no further work is
> > > > > > > > + * required.
> > > > > > > > + */
> > > > > > > > +void free_zone_device_folio_prepare(struct folio *folio)
> > > > > 
> > > > > I don't really like the naming here - we're not preparing a folio to be
> > > > > freed, from the core-mm perspective the folio is already free. This is just
> > > > > reinitialising the folio metadata ready for the driver to reuse it, which may
> > > > > actually involve just recreating a compound folio.
> > > > > 
> > > > > So maybe zone_device_folio_reinitialise()? Or would it be possible to
> > > > 
> > > > zone_device_folio_reinitialise - that works for me... but seem like
> > > > everyone has a opinion. 
> > > 
> > > Well of course :) There are only two hard problems in programming and
> > > I forget the other one. But I didn't want to just say I don't like
> > > free_zone_device_folio_prepare() without offering an alternative, I'd be open
> > > to others.
> > > 
> > 
> > zone_device_folio_reinitialise is good with me.
> > 
> > > > 
> > > > > roll this into a zone_device_folio_init() type function (similar to
> > > > > zone_device_page_init()) that just deals with everything at allocation time?
> > > > > 
> > > > 
> > > > I don’t think doing this at allocation actually works without a big lock
> > > > per pgmap. Consider the case where a VRAM allocator allocates two
> > > > distinct subsets of a large folio and you have a multi-threaded GPU page
> > > > fault handler (Xe does). It’s possible two threads could call
> > > > zone_device_folio_reinitialise at the same time, racing and causing all
> > > > sorts of issues. My plan is to just call this function in the driver’s
> > > > ->folio_free() prior to returning the VRAM allocation to my driver pool.
> > > 
> > > This doesn't make sense to me (at least as someone who doesn't know DRM SVM
> > > intimately) - the folio metadata initialisation should only happen after the
> > > VRAM allocation has occured.
> > > 
> > > IOW the VRAM allocator needs to deal with the locking, once you have the VRAM
> > > physical range you just initialise the folio/pages associated with that range
> > > with zone_device_folio_(re)initialise() and you're done.
> > > 
> > 
> > Our VRAM allocator does have locking (via DRM buddy), but that layer
> 
> I mean I assumed it did :-)
> 
> > doesn’t have visibility into the folio or its pages. By the time we
> > handle the folio/pages in the GPU fault handler, there are no global
> > locks preventing two GPU faults from each having, say, 16 pages from the
> > same order-9 folio. I believe if both threads call
> > zone_device_folio_reinitialise/init at the same time, bad things could
> > happen.
> 
> This is confusing to me. If you are getting a GPU fault it implies no page is
> mapped at a particular virtual address. The normal process (or at least the
> process I'm familiar with) for handling this is to allocate and map a page at
> the faulting virtual address. So in the scenario of two GPUs faulting on the
> same VA each thread would allocate VRAM using DRM buddy, presumably getting

Different VAs.

> different physical pages, and so the zone_device_folio_init() call would be to

Yes, different physical pages but same folio which is possible if it
hasn't been split yet (i.e., both threads a different subset of pages in
the same folio, try to split at the same time and boom something bad
happens).

> different folios/pages.
> 
> Then eventually one thread would succeed in creating the mapping from VA->VRAM
> and the losing thread would free the VRAM allocation back to DRM buddy.
> 
> So I'm a bit confused by the above statement that two GPUs faults could each
> have the same pages or be calling zone_device_folio_init() on the same pages.
> How would that happen?
> 

See above. I hope my above statements make this clear.

Matt

> > > Is the concern that reinitialisation would touch pages outside of the allocated
> > > VRAM range if it was previously a large folio?
> > 
> > No just two threads call zone_device_folio_reinitialise/init at the same
> > time, on the same folio.
> > 
> > If we call zone_device_folio_reinitialise in ->folio_free this problem
> > goes away. We could solve this with split_lock or something but I'd
> > prefer not to add lock for this (although some of prior revs did do
> > this, maybe we will revist this later).
> > 
> > Anyways - this falls in driver detail / choice IMO.
> 
> Agreed.
> 
>  - Alistair
> 
> > Matt
> > 
> > > 
> > > > > > > > +{
> > > > > > > > +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> > > > > > > > +	int order, i;
> > > > > > > > +
> > > > > > > > +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> > > > > > > > +
> > > > > > > > +	folio->mapping = NULL;
> > > > > > > > +	order = folio_order(folio);
> > > > > > > > +	if (!order)
> > > > > > > > +		return;
> > > > > > > > +
> > > > > > > > +	folio_reset_order(folio);
> > > > > > > > +
> > > > > > > > +	for (i = 0; i < (1UL << order); i++) {
> > > > > > > > +		struct page *page = folio_page(folio, i);
> > > > > > > > +		struct folio *new_folio = (struct folio *)page;
> > > > > > > > +
> > > > > > > > +		ClearPageHead(page);
> > > > > > > > +		clear_compound_head(page);
> > > > > > > > +
> > > > > > > > +		new_folio->mapping = NULL;
> > > > > > > > +		/*
> > > > > > > > +		 * Reset pgmap which was over-written by
> > > > > > > > +		 * prep_compound_page().
> > > > > > > > +		 */
> > > > > > > > +		new_folio->pgmap = pgmap;
> > > > > > > > +		new_folio->share = 0;	/* fsdax only, unused for device private */
> > > > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > > 
> > > > > > > Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
> > > > > > > that PMD_ORDER more frees than we'd like?
> > > > > > > 
> > > > > > 
> > > > > > No, calling free_folio() more often doesn’t solve anything—in fact, that
> > > > > > would make my implementation explode. I explained this in detail here [1]
> > > > > > to Zi.
> > > > > > 
> > > > > > To recap [1], my memory allocator has no visibility into individual
> > > > > > pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> > > > > > allows VRAM to be allocated or evicted for both traditional GPU
> > > > > > allocations (GEMs) and SVM allocations.
> > > > > > 
> > > > > > Now, to recap the actual issue: if device folios are not split upon free
> > > > > > and are later reallocated with a different order in
> > > > > > zone_device_page_init, the implementation breaks. This problem is not
> > > > > > specific to Xe—Nouveau happens to always allocate at the same order, so
> > > > > > it works by coincidence. Reallocating at a different order is valid
> > > > > > behavior and must be supported.
> > > > > 
> > > > > I agree it's probably by coincidence but it is a perfectly valid design to
> > > > > always just (re)allocate at the same order and not worry about having to
> > > > > reinitialise things to different orders.
> > > > > 
> > > > 
> > > > I would agree with this statement too — it’s perfectly valid if a driver
> > > > always wants to (re)allocate at the same order.
> > > > 
> > > > Matt
> > > > 
> > > > >  - Alistair
> > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> > > > > > 
> > > > > > > > +	}
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> > > > > > > > +
> > > > > > > >  void free_zone_device_folio(struct folio *folio)
> > > > > > > >  {
> > > > > > > >  	struct dev_pagemap *pgmap = folio->pgmap;
> > > > > > > > @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
> > > > > > > >  	case MEMORY_DEVICE_COHERENT:
> > > > > > > >  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
> > > > > > > >  			break;
> > > > > > > > +		free_zone_device_folio_prepare(folio);
> > > > > > > >  		pgmap->ops->folio_free(folio, order);
> > > > > > > >  		percpu_ref_put_many(&folio->pgmap->ref, nr);
> > > > > > > >  		break;
> > > > > > > 
> > > > > > > Balbir
