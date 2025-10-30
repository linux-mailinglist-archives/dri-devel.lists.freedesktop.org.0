Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C5C22453
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C066610EA6F;
	Thu, 30 Oct 2025 20:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4L0u9Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7E110EA5D;
 Thu, 30 Oct 2025 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856413; x=1793392413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U/dUSpVjZSZRFeVnKG3XWZD8/sCVLzZvlNKzcRMJDbI=;
 b=i4L0u9Hcu8D4uTAz1whYsBxJi5IPmub9CwdwtVTbP6h7ApkRMUbDjrYo
 6hHKxT7LimIAWoMGnHT2tTLsbTomn7gGgjjZs6ST1NxyLK4vFMmrZq1Iu
 Ovz928L/n8utfVvm+aymvkGcXcrSd76AAfBIjWxBZiuxEhJixzoZl5BvK
 LViA2KCCWRS8UpcwNNbzgcKkZTmb1pHWM7b5Sk4Uy940RygBsBtrAT2VV
 XHCcXJT3HXqv4tsmh7ezI3xXxubq9QaPkzL8mIX2uPiNr1uYHoGDm7/mg
 scveDz5OvRzjMFf/3cH3HXQ9gsLyT0j4rQwNaC4GUvQwQPtRB6NaRuqKU g==;
X-CSE-ConnectionGUID: WpmmgxQlQt2QPZIgyXpCnQ==
X-CSE-MsgGUID: uG4QXfhIR++B1qvKhPH/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74304292"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74304292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:32 -0700
X-CSE-ConnectionGUID: TxMv5+VmS9iep/1qLj+7FQ==
X-CSE-MsgGUID: xZDRmUHxRr+47aCVAi4xGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223284441"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugTvWBtsx1SSP5J8wUgvc4dbp0rXzB0O93aqKmxz6NTTAghPA9MnlE2b/KAZl55lt+SpyJ+GaHQUHcpK8VXnoL3wiKsVdiFCjPsHH+BdukfmjXwKYxmdXOv2y9YDNcR1N4CN/GNX+MmXIVmSRwh3Oli5XWCKTgKsbSRgg6vAqkYy3TV+xyBtAjsyGvlNEzsPPMI2fpxHc1fCc5kzrZ8bmG5GATbg86nzfSjXThlntecgWv6GK3nTd3FCUWOnlaW6xTg+gRjWMwxqfsReHWAWxn6dMAUkSBH5SX7Wucnw60heqGbj+5mBqqssy0eZfNIh0KhCX6jkJGQELk3Y+CLW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2zPNXQXxDIuapx7K1efqJZlqfbqiPRy6x/z2JvP3uw=;
 b=FC0KP0F5f7//94ViyM3EV7R6OTviLt366SGgETH0rvW2vnBnF38X+Ehr3LYRHxnve3OtlAhW2DhOkprYpZwJAp1VqpmDkNTlLDUtE5ZPqcZJ/QNBQu+LnDqWYZlz2TdG82wnCjTvqB+aI+Z3jr8A0GgGJF8Y+dF18s7yTLA5Rk9kyHbIT8pvAWURTbmQcFncfisAnKorZiPyiQrcTN2Au7CXkPVeZwG8Y3HWhDa5OqZbJxu2bTi7BnpMF3fD5k+k0KdZF8Tg5+gUV2muTpVn7h1vSNclTfKmd6RR8menkYnNHDMci/Ps0zm8rxJEmJI6krt7Qpeg0yJVM1GyvD483Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 18/28] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Thu, 30 Oct 2025 21:31:25 +0100
Message-ID: <20251030203135.337696-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::47) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: c424d4eb-8ea9-43d7-5361-08de17f39432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1JVTWdteDdiZU4ydmRvUFJ1QS9jZ08wa21rZjVpMlVjeFVyL01PVFVQRXcz?=
 =?utf-8?B?cmNMeDVtRWt4eng5dUhGK25iL043WWdRenZBbXgwUlhJUkY1cmZpMEdSYWx0?=
 =?utf-8?B?NHlWT25XRGZadUhoWktGUGVSbWVVRVA4U2Z5U3Ezd3hMLzJ4WUNVZzV6ZFl0?=
 =?utf-8?B?ak9Qa0pMRDM1MFJFMmJ3a0wxQnNKOXR4bVRIMHhBUnBPb3pqaUdnczJvK3Yv?=
 =?utf-8?B?K0VpWitpbVRPYnVFWjJDUEZ2Z08vaFVSZDhTVmpQYWFuQUNuWFdvVytaZGVm?=
 =?utf-8?B?c0RRdGloWkFsbVJqOGR0Y21aOUVNUkQyVHZ3QnFVRmFSM0dhdkxxMEVLSHFq?=
 =?utf-8?B?S0pmWGV5NHBGb290MS9HUHcxTDF1S3d1UzBNQ2tUU0ZWdWxIS0tvcll3YlJV?=
 =?utf-8?B?MGxxQkJ1Y2JxcXJhSTBXREdxOWFLUzdUZFBWbExjQkFDNGZnSWpKV2ZPTEVW?=
 =?utf-8?B?SmRMZXZOeDlaTTNtaTFYakd2RytVbWFJclZuVGRoK0swdzhSdUdyNkVFN1Uv?=
 =?utf-8?B?MzFSVFBscEFtN00vby9zUTBCS1gwczRxUEhlelFETnZqd0VaV3VBMWY5THUv?=
 =?utf-8?B?RU5BZUF3QTBkWTg4QzExclN6NEkxS3NsMXBzYzl3Njl6VXVIWFM0RDBvZ25N?=
 =?utf-8?B?MVFRN2NBT3M4RmwyV1RzeklpempZVUtLbzJISXF4Q1BQMTk3amY0cG5QbTZw?=
 =?utf-8?B?dGpaOXB2MmcvRlZQaWd0czZ1cDgrOFoyWkV1ckczZkZraWZMUDdBVVpZVTh0?=
 =?utf-8?B?TEdjVmJHS0RyZWpydmx5WnhHQmdMLzJEQ3ZzWFRUYmpzaDM5d2cwTWN6UG9t?=
 =?utf-8?B?dXVKMm00c0NVSmdRN2FVVTJsQ3VGV3Y5MmRmVjJPSVRBV1ZmdzRQOXQ3SURw?=
 =?utf-8?B?NjYwN1hKZlQvVDBKeXVjakF3K2JLNmZQbjF6aU5YN1dWNG1xWVh4enJPbDUy?=
 =?utf-8?B?T0ZudlNTQW9BazRDR2pVem41RnJnamNOWFhVVk5jS2tqTWJFQ2VHanNCZlYz?=
 =?utf-8?B?R3F4ci9MVzNETVdZTmx2Z2hQT2V4ekRmaXVQbXpNdlVpMTFraGdtZ1dkZC9l?=
 =?utf-8?B?MGI1MThEY2RCQXVsTFRQWER5blhZdGFTTWJDbTRWeGcxSHNWSWFacEp5cDVj?=
 =?utf-8?B?VUZ5a2Z2S1p6RjNEbUQ5dkV0Z1RNWldaL0hXTmdMTnJzOWJtZytXU1Y3bmlE?=
 =?utf-8?B?RjgxSUdDY0crMXdnNjVkMmNyKzRvUHJoY3pacEhneUc2Tk1YUUdld1VVNzRY?=
 =?utf-8?B?blRLdERPVm9pSXZzMHRpYk40SjAvRDVGMnBrcDBhNE1pZjJOWTQwNGxvTmxl?=
 =?utf-8?B?eUJlU3IzbDhzakV4NGhyelN2emh0eWdTdEJIbCswb256OEhKQjBITzJOY3M5?=
 =?utf-8?B?dFY1bDVRTFU4bncvaEZpaFpNdlhieTM4cEcwTVdKU0prN2NndXczK2VJd1ZW?=
 =?utf-8?B?S1FYTmNwUFhEMzRoeEhRT2p4N20xV0Q3V1Y2NUlCOTQ2NTR6ZEs3Z2h2akkr?=
 =?utf-8?B?Y3p5MHZFMjNUT0JhMWxsbHlxOVI0ejdFOVRCQnluSnBvL3lrdDY3Z1BlaVc1?=
 =?utf-8?B?R29KQ1BHUjZUNmd2UkFpYVRPNnVtNmw3Si9rS3kxaEdBbTBXSFAvSXhqRXRy?=
 =?utf-8?B?YytSZjZycmRWS3kxcGpZWkw2U2ZKZ1Bvb2NJbHhBVmh0Q3pMMGNWWlR0a1hh?=
 =?utf-8?B?WWI5ck52ZWFxRHc4eDZKUXB6cmNEQk43aFZUd291azRiaXBrWGtEbFV3US9F?=
 =?utf-8?B?Q0RMekkrT0RwZHNlRWRoVldYc2p6U3dmV1c3ZlFmUm5SODdJaTliKzVLQ3RE?=
 =?utf-8?B?VzVJWGloSHVnRmR4OE83WEh3TEpEdHZOVnVyNndGYWtIS3pHdzZncnhxTk5D?=
 =?utf-8?B?dDc3Sy9USnFyTnh6cG9qK3lzWEVRcndLbDVtM1o5ZDRzOXJ6RkIrVG9WdytC?=
 =?utf-8?B?QitodXY3M0hhSitUSmRacWZXWHZERjNzZGN2cGN5VDdtdlN6MEtKQVh6SGlv?=
 =?utf-8?Q?PRO7yah3duivgxANvImjE8o1/JKTGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1FCc0NyRXltUXlvRnd3K0VYTG1TYjFsYnV6TGVnWGRlTEtWOHc4aGRzV3M0?=
 =?utf-8?B?LzRwZnA0WUh2dDVIemFVb3Q3K3RLR29pN2xWd3pNK1psY3FOSDVOTEtMK0lF?=
 =?utf-8?B?Wmk2bXZqb2ExTFdoU3RsY2RsU3JSdkliYU1Kd1dpZjI4cEduU1ZIWHJBNnVw?=
 =?utf-8?B?SGttNUJENEU4TnFNY2NXRU5KdHZSUCtpczlQb0hoMjIzY1hKeUM5d21Xbkhs?=
 =?utf-8?B?cVFBeWRiN3hxdUtNdks2SGpJTVZ1NUJpYXE0ZllBaHVTYStYekdLaitRaEJt?=
 =?utf-8?B?S3d6NnRVbkhZSnNuZjIzb3U4YkREZzVUdHoxQ1AzR0hwVlZhSFNpVzFvU3FD?=
 =?utf-8?B?ZjhhOTVzc0FzL3Mzc2FSYWwxMGV4cVZQWFViUGZVNHRFbkpmYkJ5WWpQQS9S?=
 =?utf-8?B?dDM2blBBeXltR1ZzMEw0akMycjluMGVFUEtCZ0V5cUJnQXJ3RDd1QTRFUE5V?=
 =?utf-8?B?VXBtdEFXOU43UXIyR1ZaWGUzZktlNHRVWldaVnEwNGY3SytQK2I1am1wcGtu?=
 =?utf-8?B?ZG9pUUxKSE9FanYyS2J6UWFodnFRbmxMamkycDY2cTNneU5SNE9xa0NXclV1?=
 =?utf-8?B?QXcrK2tqaDhlMUFQVkVIWmNuUnZLQmF3RFRsTy9UTVpUaDhSUW56dkdHcUlN?=
 =?utf-8?B?THQ3cEk2MUJKM3lVMDFSS3F1dzRsemhjakxjQTg0MWtOZG9WSTAyWHlrdXZj?=
 =?utf-8?B?UzY4K2FqNjYreGFPODkyczVLdHAzNE9jUVZlcFdBMDNPTFd0dEQ1VTJ4UGMx?=
 =?utf-8?B?dkZVcE5VVFhIM25oVXlZWG5BR0QrMUJXZHRHR2VPV2RPRW5SR0dUT3pGcUZJ?=
 =?utf-8?B?eUNOaXJLc3ZvdVZiNEVFU2IvUGNycWlERUd2Yk4yMytVRXRHNjNJbWZqMlhM?=
 =?utf-8?B?N3pmNVhNblpXd3gyL2FRV005ajNkbm83TzBja0Q2UFhqQTVBSjN0Um91RGZJ?=
 =?utf-8?B?YmVtWlFXd3dWWVd4R3VvY2N5bnNXVVB0bnFTd0ZiVi9TMUtvK0FNU3ZhbDFY?=
 =?utf-8?B?MEo4VHFzRnRKV252Z1ZtSEkwYTQ5dWtEZDBPVUdGUFl2dExEZzRYbk54UHdI?=
 =?utf-8?B?SUQzSThZWjM1NFZKS1JHczhrbkhYZzk0KzFnWFphUnB4ZWhXV3YyQmc1d3dS?=
 =?utf-8?B?dE5ER3NXWENEaGM2bGRjRGRpcWpKbzNNRWpVOFlyWGR5em04RWowUCs3MDRB?=
 =?utf-8?B?N1hsZUg5emZuOXFRVU9jN3dzRXJvWlVuTmE5dUJHTUpjT3Nkb0x1a1pSeTEy?=
 =?utf-8?B?aEl6WDNzVHJhNU5KZ2xLQm43ZXExRUVSTC9wWjJkUitIRXZoVFdITXUwaTIx?=
 =?utf-8?B?cjgzSWl5aU1DSU1TZWpiVU5rTXJZREdCN2RDY2pwaEM4T2w5eDh4WlJnZzhP?=
 =?utf-8?B?ZFhxV1l5SFA5MXZ0OWVEamZzRzBvdjFTZk9LckZCZG9NWVVqRjcxTEN2K0xw?=
 =?utf-8?B?SWR3bnNxQVlVYzRNSDVhTmpCOVJsOWZyTFR4UmN6QXUzcnZaQmhST1VGTnQ5?=
 =?utf-8?B?cU1ha1ZUaCtvd0pZWGFPRWdETVh4YWhxVjBUUFpndXRFVGR6OWs5REFIaXhy?=
 =?utf-8?B?M001MnpKb0FGYi9WZ0FPSitjWlp4eERQMGEwdnJsc1UrWjIyT0kyQ0FtRVZN?=
 =?utf-8?B?Nm1Sa3F0OEdwemMxTmRNU1FPdDZKTTRXZUw0dkU4VjdEZFNQdkRjd3psZW9m?=
 =?utf-8?B?VFE3Q3h1U0kvZnFNaHJoUTBKYmphZSswaW1vRWlSRnEvQ3RkS0E5aUUwME82?=
 =?utf-8?B?dGZuZytaWk1yeU85aWRZa2dYNUwvZWRRNlYzNzRqUWpNc3E0bzkwRVdaWjFE?=
 =?utf-8?B?aEdrWkVIOE84ZjN2Z09SWEZSeVRtVG0yZS9SaUJxbXpZWHhzTDU1WUlSSk1I?=
 =?utf-8?B?S0ptUngvL0JKU3JYT1VmbzJkMzhqb2JlMmhIbC8vR2l4eXpJTmxjSG51OTA2?=
 =?utf-8?B?blNzNWp5Wi81N2R6eTJXTUttZFV1L3o4QTZmMWFIWTd2b05WNnB4YldHTnVt?=
 =?utf-8?B?bWFJU3I1Zk1VRHVrd2FYekhqM3ZQV3MxL0FiWDZCWkRUVGVVWTRXTE9oVjlG?=
 =?utf-8?B?enlLWXM3SktoMkwwcGhKWDE5dzVyK2hiVGtkYzAwUG9VV1hFYXRqelhBaUEw?=
 =?utf-8?B?cnpmZ20wZng5YkhmTlZ6UnNtdTZDaDVLa1lWZnlQcEtwV0xHeUROZ3RhUTN1?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c424d4eb-8ea9-43d7-5361-08de17f39432
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:26.5260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjIOWBRPHGi2x9pEk+FlTC6hGlWIiDCelPJT9ARpajzyXNKVL6ZgsjdFfVKNL/PUvEV6SekARBXBc65GNF5TwI2edDXUCk92DgtNuqQQW3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 113 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index cb45e97f4c4d9..e7ea9b88fd246 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -860,6 +860,16 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GGTT)) {
+		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_GGTT);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1066,6 +1076,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	xe_gt_assert(gt, data);
 
 	switch (data->type) {
+	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
+		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index fbb451767712a..6f2ee5820bdd4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,9 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_ggtt.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -39,6 +42,106 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+static ssize_t pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_ggtt_save(gt, vfid, NULL, 0);
+}
+
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_migration_data *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_ggtt_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
+					   XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GGTT data save (%zu bytes)\n", vfid, size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_migration_data_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_migration_data *data)
+{
+	int ret;
+
+	xe_gt_sriov_dbg_verbose(gt, "VF%u GGTT data restore (%llu bytes)\n", vfid, data->size);
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
+				vfid, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -279,6 +382,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -340,6 +450,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GUC, &migration->save.data_remaining);
+
+	if (pf_migration_ggtt_size(gt, vfid) > 0)
+		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, &migration->save.data_remaining);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 66a45d6234245..bc201d8f3147a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -19,6 +19,9 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_migration_data *data);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

