Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA3B94980
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E027A10E56D;
	Tue, 23 Sep 2025 06:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBBWg7Ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D4D10E0E3;
 Tue, 23 Sep 2025 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758609890; x=1790145890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zZnymWBhLcJw621v0GRyr8LHfppwoh5IykDEUE/usDk=;
 b=dBBWg7GeTpjodfujEzkRlSjvK08bInyIpEFHLb+QDharJHNPNEBEnLF8
 JrnLIttOnPzRmtOdWF+nRz1wIJko+eWCqp9YIkZSvQQ7qhCsbXqeQUPtP
 PUL/j0L3SqsCnawBHqKqsoGxk6hm/5BTUy01zyq6eFIKuyIJZL/6X1Dbr
 X8h1vbsw9VExWST1QRaWXU1swRR3i8YlkW547M5UqS3/feCPwSEqZJi1L
 /VD+oFqzy5q5tqNbxgp7aZ6Ca5HpMV+V/i/1Q8XCqgkB1q9GVpvOY3oTj
 82jJ+X5o8cz6a+ioSfscb+2R6oCBiWlGIYbTN/GgZMlKpsSCeejTFi3RX A==;
X-CSE-ConnectionGUID: EyzoEQF2R2u/qULVF0myAA==
X-CSE-MsgGUID: swqEB9AfSPafhBmO9SVohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64706739"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="64706739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:44:50 -0700
X-CSE-ConnectionGUID: FkJFF6C9TMSiStcS2aBkng==
X-CSE-MsgGUID: t4k7a6oCT2qf4D3rYTQxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="180980124"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:44:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:44:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 23:44:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 23:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGAoawHXJd2+d0jayQ6L+30D+1qQlVx2pBQDYpM7X2geWoEKaNL5EqOEiQVCG/qi+r7bthWnGAEan95uSz/tDy2+/wPG19A1AZXMICEja4tbPNcLFv3kIz5xm4UJEkW5dATxShJDltGJG+bwNuEIr2MEVCQhMpR8Ay6VpVEn8QyMM0Exsy7pABokakwvrJl1emBT/HsFqpRZ8jVmthRg+f1h9tBzha9D/WykiK15/qss66SAuBa0SrYOrhQwzSLLFlWHhIAktIv3LPaQ5cUodI2t8BP4j9Gd0uovZJ2I073o5e785u/SgUY6anASWb59LLXP5B3+N5aaDz18q4+JvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/omdZgOnqBd9Bj15Ts1lnZHa2aO0t0KF8SsV+CjU8M=;
 b=ZAsl+P4h/uKMj+SxTVytccMbWPSXyOFTXLb+pqlAwcXqybIK4qfzFZll/qbSSuLHzzDsMJVjv758U7cukuDpS1u+MOqliWnvEHfk+L0WbgzoXXHvVW+QoaStz9vV4fRWrdE+jn50z7JrKwYgxSdNOOHidtb4utpZPISGURE9D5s+knn4UShxjL2yuYk52mTKBFcLRFDf2Iw+P6jE64tSoow2EEMRhgVzETHFPLzP9e7wfLrsShvEBwQpQ1AKQ0Eau+QanXVRAGL6cwUDDcSbO8/1/UvjHxTSB9SR0RlJkmRH0s7Rg+ZmztlcYs0ZSWYkeUwVG0dHD8eAFAoMODJLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 06:44:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:44:41 +0000
Date: Mon, 22 Sep 2025 23:44:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
References: <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 81db4c22-eea4-4a3c-e284-08ddfa6cacb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVp3STBjV1FwcXUreWFjcyttOGttcmY1dkM1OWV3alh6Q09tVTVEZWYyQk1I?=
 =?utf-8?B?Z05xUWpoY0o3UEJzQ2VJQWNUYVZGbUxxNm1pU1VpN2QyeU9KTVZIVzNaUi8x?=
 =?utf-8?B?Y0gxQmN1dXJ1UUdzSTNXTHQ3Z1QyVXJnREhzblZHcFFGdjVRckFSMkpHU0Nk?=
 =?utf-8?B?ckdDVUVMQkN5R2pWK1ZuL3AyNW1WbFBtalZKcmtnSWtzUVpHNjhYYUpVbW9B?=
 =?utf-8?B?YTEvZFNzYWRoN29Xb1FkSXNmdHN4OCtaSlQ1cFlRMkdpUXgzdC9WRUZ3dk9a?=
 =?utf-8?B?eU1ONzc2WmdaUzFQMG5sK1RUSW03amxoS2RJcG0rV1FkZmtyVEppOGdidVRl?=
 =?utf-8?B?R0J4MGphUys4UFhyTDB1NVhZN3U5c25GTUJ0dHNISGFieHRMR2lWTHpXbVYy?=
 =?utf-8?B?bWpxQUlrN2YwRUMvbHg2Z1JzaHA4VXUwVlZtNDFaenpOMk5jK0JwMWh1WEM5?=
 =?utf-8?B?aXBKdGlmazhJR0wrTTlUcEdHNjZpaklEU21UNnFuaTVQNGxtWkp5VlNhVUl4?=
 =?utf-8?B?dGdaaUxrWi96NVdOOU1sb0pPdkpPUmxFWkxxbS8wbmlWZ3RjQmFpbzBsMFp2?=
 =?utf-8?B?WXhpMldYQWhRMGNHZUpyVENMWDdrUlFZV0tycURpQldBRXNjamhTS0tQd28v?=
 =?utf-8?B?NXlrcTZtQlRWeGg0ZzZZR25iSjg5a0RqWTF2US9PamI1c2Fpb1IybjlVN1Qz?=
 =?utf-8?B?TTdGWndrVk1XTkZJQnNDdHVBWEZ1NzllZ0NXUWUrM1ZkaEMzb1YySHE1VDN2?=
 =?utf-8?B?bjcrOW1RMmtjYnJ1UXUrTHZYQWE0STJPdkx1SU1uNTVVdjFzZEVyR1ZrREVO?=
 =?utf-8?B?TjI2VU1mMTJhS3g0WWRER3ZvU09BcXhLejF5UnRJTmorTGs5MHc2L3dHUy9p?=
 =?utf-8?B?OVN6NXlrOThsNFR2QVFRWTdwdWRWRmx5YllKSkF0ZHhLWFlkQ0EwUlZ0aFZG?=
 =?utf-8?B?L1Y2amgycU1tYVRoVlhSOTBqdGJoUUxNeWpSWERYOU83cG5mM3R5TDhudmNa?=
 =?utf-8?B?ZDF2S0E2N1RneERHRWNkQjNYaFJEU0FmNUVDVnFlL0RpRkJyUEl2a2ZJeVQ4?=
 =?utf-8?B?QVVXYkwyek00UjNDZTVDUzdROVl5UWdZQlJtM3NVTHh5Q0MrUGNiTHAwMnZG?=
 =?utf-8?B?ZlRXYWg3RklydWZIQlc5TG4vdHZqT3V2RkJ0Z2pEY1Q5eExmN1JkLzRUSTNk?=
 =?utf-8?B?aVN3ZlowWE5ldm9ibXBYNWVNczZpZHJPSmhWbDBSYnVpaVVCSTRrNVlXR1ZM?=
 =?utf-8?B?TFA4MTFGbVF0M2NiZGYwVVF4cDdaK2JVYWU3cTh1TUtTZkF0SmhkM3o1emxj?=
 =?utf-8?B?cEp3NFBRNDRXUWZFOU0va1RqSGpqeUdhN3RhVHNiMUpJdmRDd0dneE56WjdL?=
 =?utf-8?B?Q2N6OWJpQllkeUpualpYK3FkeUx2TVVETE5jdUJMUHNEUHROVk54YlB4eFFS?=
 =?utf-8?B?c1RTU0dtYXU2MGsvSEtMbzJsT0pyZytza0ZMWkFTQS9sdXpNNlNFeis5enpu?=
 =?utf-8?B?WExZVWJyUFN6SllHSDJkN1owZVROZHNURmFpYlhkY1RKMlhKK1ZvZ3psRW50?=
 =?utf-8?B?dkZ5UEl3RElmMWRzajRSbUlFWHZGcnNXZUlFbUtCTU1TUW9UWmZoYnZOQ25T?=
 =?utf-8?B?bUdXT01GMmM2bUo1dnozR0tLQ1IrQzRGb0swNVFzU1pwckNnN0toVloyK1Vz?=
 =?utf-8?B?bkg1NEtTMGFrYzFZekpvdjA1SWNLTDhpTjRrdG4yWjBDeHNHVi95YW5wMWph?=
 =?utf-8?B?Z3g3a1VOdFMyMk1GWExUQStrdWNGaGJpbjJ1bWpJNHhmUGRQbEdGYUcrZmtT?=
 =?utf-8?B?NlYvY21UN0dSUU1RTURnY0ZMTERXYjRSdmFaWStRK0hHbkc1TW5UdDhkS0di?=
 =?utf-8?B?ejRaSSs2VlUyRm5HdWdvaUo3eGQ1dVVqWDFGaWNILyswNTlINFpoMWVGdjhj?=
 =?utf-8?Q?A0lMDaLYIhs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFlGMi91VDhxVU1Na0xjekRQeWlmbzk3ajZCVXJiaXJBWlYrSVBCbERtQUQx?=
 =?utf-8?B?dDhHclhteXI1Q2tnTmhCYkpPS0JpVGtGYlhzbEtXWmRPazFVY0pmK1Vuc0lE?=
 =?utf-8?B?UEtaZUl0WCs5ekczU1U2RXg2LzQ2aVp3MTdyMjhLeTArL0c3V3VNczF2V1Nn?=
 =?utf-8?B?N0t3TzRLZi82MXE0Y0g1NWc3RFNyeDFhdlQyWXVlN1BmN2UzbmlKaXp0cGFp?=
 =?utf-8?B?U2RVQkQ0NEx3bmNYMjcyZGluTk5BazFINnBsVHN6WUFnaWhudzdrVThhNkZ3?=
 =?utf-8?B?OGplQjhXWWIrRU4xVmoxRGkya0c0c0dTT0hVV25pM1lBcEJaNWwvanBiSTZV?=
 =?utf-8?B?bjNoSEwzZDdQRG9QS056c3FpY3poN0ZhaUdOTVNBdGVtaVdNdVZ5SEN2N0hO?=
 =?utf-8?B?a1h3ejhMUlBtRURrd2t1MkJQdVRJWDNQMWhXcjhHODFDbWt1L2h6QVhGWHdZ?=
 =?utf-8?B?WkNHcktsd00yOTNDVEx1cU1rMG0zY0Y2Qnh5aEdVWjR3RjVnZW5mTUFpSDE3?=
 =?utf-8?B?TzZweU1pNWwyc3RGMG42cEpFUkI3RldnSjJQTUVFUU9JQlBCQjZSZXg1QU0w?=
 =?utf-8?B?OTFic3M3blRqSnJBZnpyWldlUUtTZTgzY0NMa1VlN0lIRDdpR0ZhUm9lMHN6?=
 =?utf-8?B?cWNEREltZjV5ZVRldGlvWnpHUzcxalBTSFZKVG9kbWVYOFFWU0FSK3ZKYnlx?=
 =?utf-8?B?cmJvQXBCK09tMFkrSEswRnJMbXV5OFM0bW9CdUJjUnJqbWdISUNLWHc5Vnht?=
 =?utf-8?B?Y1p0VUtLR3RVVVc0OGp4WXpJUTUzVi9YYkUwQVJqT24wSmtIK0NPZVF4YjhQ?=
 =?utf-8?B?MGxJeHd0NWNTWElBZVZBWmthSmkvMWVDdXZ2emxRcFk5MTA4c21jb1dGQWhO?=
 =?utf-8?B?OUVIeXhZN0NhcmVOaFlxbzlPdzVzY09pYmRqQUpLdytVUnNUUDVJZUVCaHpq?=
 =?utf-8?B?R2VsR1ZLakp4REdOQ3lWY0NuczJvV0Z5RGl1QWtESFl2cnM5bk9xZjc3eXRJ?=
 =?utf-8?B?MFBhdWVCRTV1dlhJT0ROSG4rNmZQc09NUlAzZVdJczE4NTZsdEF5dEdZUnJB?=
 =?utf-8?B?MjZPVVBINDFraTVZWWl2blkwZU5kRnl4ZlFCcUZiWjdLTVZlVFpsSFVjbUc4?=
 =?utf-8?B?NXFKN0VHV2hXVTRTR1JWRjk4dS9ZWHJ6UWMvVFBZUkxwV3J2UDJXbjNCUXIz?=
 =?utf-8?B?cVpIU0lnYXdVK1lQVjN0aks1eGVLMUtSNDIrNEtOcVlWQU1ueUg0U2wwaXVG?=
 =?utf-8?B?SWpJeXZUZ05CcC9EMGlXcnJSTkEzMElaV0k4K1RVeWpJc0FDWEpONVA0U3hP?=
 =?utf-8?B?RjE5WGI1QUZHY3hxOWlrNFl4M2JhSlFFRFNhSWpxQjF6ZFZYSkY0ejVERHlh?=
 =?utf-8?B?R0dHNXJURmVnYUlKNjVOYVZrWXpsWFpDK0RmdFFGaG9RcVBBM2dwdmwycjRp?=
 =?utf-8?B?R05oODRwUGFsSmo1RHpTMmxZMTZhUEFaVlE5K2xmV0cwL3dnUk8vZDlMTlc0?=
 =?utf-8?B?NUNCeXdpZ2NBNUt1cnpXVkczMzlQRUNBa2Jsa3NjY2U0eWNTT3pZTHQvc0hO?=
 =?utf-8?B?VkRxL2M5clFNcndNaFhkVG1EOUllQlBzNVFNbjN3NjdnUmExRnk4M2tsc2gz?=
 =?utf-8?B?eU04NjhUMDFPSmt3b1QxdGlIQkMybU0yRmY5RkNHeU9QeUROVFFVbHhoeW4y?=
 =?utf-8?B?T2ZBL1c2a3BJNC81SlIrdVVyZzJ4MnR1ZjRNbzV2Q2RKcm9DaTgzQVRhUUtP?=
 =?utf-8?B?SkJuUWpvN1o3bjdaLyt4dnNsODU1dW1IYTJMeWJ6bFlmbG5kVThCd2dqYTd4?=
 =?utf-8?B?Z2lNU3VaOVY4ZHRjS2lwUVdQdjBMWVR0Y1dER05TK3REK2hLS1N0aTU0UUFW?=
 =?utf-8?B?Umsva25lVTBJbWZEQ2t6dXpiVEpBa3g0ZVFmQTRreEo3a21nc0ZWMDhVcGRk?=
 =?utf-8?B?N09pbmw0WFArb1JvQ1hzT2krZzF1RHVzdk12Tk5xajZIcDlPdnhyUXdkWFJW?=
 =?utf-8?B?OEw3TS9wS2lkVWhvTVpGL2ZqWkZOUy9XWnFFbHNNN1VuZlZPRDRQQjVEL0Zs?=
 =?utf-8?B?ZU9LZWdhcjlBQ3FhaXI5OURkYVY2dFhWS2F6SHNKZCtKaU4xaHRhM0VFVjF0?=
 =?utf-8?B?b3hhb0p5QS9FVmV6dUk1R3JaVVRhTlJjclVVNnAwbTJKZTladEFQS0M2R0Vv?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81db4c22-eea4-4a3c-e284-08ddfa6cacb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 06:44:41.8649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzsBe/W5zM6OJ6GRJkQsGsQa/q1XHnT5IOhilmv4Bw6UVz9RYtkrL6xoZ2bU17PV39odDanLbgD5+Tq1jKxzJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

On Mon, Sep 22, 2025 at 11:25:47PM -0700, Matthew Brost wrote:
> On Mon, Sep 22, 2025 at 11:53:06PM -0600, Kasireddy, Vivek wrote:
> > Hi Jason,
> > 
> > > Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
> > > functions of Intel GPUs
> > > 
> > > On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
> > > 
> > > > Well what exactly is happening here? You have a PF assigned to the
> > > > host and a VF passed through to a guest, correct?
> > > >
> > > > And now the PF (from the host side) wants to access a BAR of the VF?
> > > 
> > > Not quite.
> > > 
> > > It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
> > > the VF can access some VRAM.
> > > 
> > > They want to get a DMABUF handle for a bit of the VF's reachable VRAM
> > > that the PF can import and use through it's own funciton.
> > > 
> > > The use of the VF's BAR in this series is an ugly hack.
> > IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
> > to never expose VRAM Addresses and instead have BAR addresses as DMA
> > addresses when exporting dmabufs to other devices. Here is the relevant code
> > snippet in Xe:
> >                 phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);             
> >                 size_t size = min_t(u64, cursor.size, SZ_2G);                         
> >                 dma_addr_t addr;                                                      
> >                                                                                       
> >                 addr = dma_map_resource(dev, phys, size, dir,                         
> >                                         DMA_ATTR_SKIP_CPU_SYNC);
> > 
> > And, here is the one in amdgpu:
> >         for_each_sgtable_sg((*sgt), sg, i) {
> >                 phys_addr_t phys = cursor.start + adev->gmc.aper_base;
> >                 unsigned long size = min(cursor.size, AMDGPU_MAX_SG_SEGMENT_SIZE);
> >                 dma_addr_t addr;
> > 
> >                 addr = dma_map_resource(dev, phys, size, dir,
> >                                         DMA_ATTR_SKIP_CPU_SYNC);
> > 
> 
> I've read through this thread—Jason, correct me if I'm wrong—but I
> believe what you're suggesting is that instead of using PCIe P2P
> (dma_map_resource) to communicate the VF's VRAM offset to the PF, we
> should teach dma-buf to natively understand a VF's VRAM offset. I don't
> think this is currently built into dma-buf, but it probably should be,
> as it could benefit other use cases as well (e.g., UALink, NVLink,
> etc.).
> 
> In both examples above, the PCIe P2P fabric is used for communication,
> whereas in the VF→PF case, it's only using the PCIe P2P address to
> extract the VF's VRAM offset, rather than serving as a communication
> path. I believe that's Jason's objection. Again, Jason, correct me if
> I'm misunderstanding here.
> 
> Assuming I'm understanding Jason's comments correctly, I tend to agree
> with him.
> 
> > And, AFAICS, most of these drivers don't see use the BAR addresses directly
> > if they import a dmabuf that they exported earlier and instead do this:
> > 
> >         if (dma_buf->ops == &xe_dmabuf_ops) {

Sorry - double reply but the above check would also fail on the VF→PF path.

Matt

> >                 obj = dma_buf->priv;
> >                 if (obj->dev == dev &&
> >                     !XE_TEST_ONLY(test && test->force_different_devices)) {
> >                         /*
> >                          * Importing dmabuf exported from out own gem increases
> >                          * refcount on gem itself instead of f_count of dmabuf.
> >                          */
> >                         drm_gem_object_get(obj);
> >                         return obj;
> >                 }
> >         }
> 
> This code won't be triggered on the VF→PF path, as obj->dev == dev will
> fail.
> 
> > 
> > >The PF never actually uses the VF BAR
> > That's because the PF can't use it directly, most likely due to hardware limitations.
> > 
> > >it just hackily converts the dma_addr_t back
> > > to CPU physical and figures out where it is in the VRAM pool and then
> > > uses a PF centric address for it.
> > > 
> > > All they want is either the actual VRAM address or the CPU physical.
> > The problem here is that the CPU physical (aka BAR Address) is only
> > usable by the CPU. Since the GPU PF only understands VRAM addresses,
> > the current exporter (vfio-pci) or any VF/VFIO variant driver cannot provide
> > the VRAM addresses that the GPU PF can use directly because they do not
> > have access to the provisioning data.
> >
> 
> Right, we need to provide the offset within the VRAM provisioning, which
> the PF can resolve to a physical address based on the provisioning data.
> The series already does this—the problem is how the VF provides
> this offset. It shouldn't be a P2P address, but rather a native
> dma-buf-provided offset that everyone involved in the attachment
> understands.
>  
> > However, it is possible that if vfio-pci or a VF/VFIO variant driver had access
> > to the VF's provisioning data, then it might be able to create a dmabuf with
> > VRAM addresses that the PF can use directly. But I am not sure if exposing
> > provisioning data to VFIO drivers is ok from a security standpoint or not.
> > 
> 
> I'd prefer to leave the provisioning data to the PF if possible. I
> haven't fully wrapped my head around the flow yet, but it should be
> feasible for the VF → VFIO → PF path to pass along the initial VF
> scatter-gather (SG) list in the dma-buf, which includes VF-specific
> PFNs. The PF can then use this, along with its provisioning information,
> to resolve the physical address.
> 
> Matt
> 
> > Thanks,
> > Vivek
> > 
> > > 
> > > Jason
