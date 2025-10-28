Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34410C142A9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6B10E370;
	Tue, 28 Oct 2025 10:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTptUGFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E4810E1D9;
 Tue, 28 Oct 2025 10:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761648407; x=1793184407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o1PyFavr21c9iDsW+p407G/eCP8Yrj7Cr9dxNfXK5X4=;
 b=ZTptUGFUqqlQC4nkqKN5DndIpKHsi7b9c+gFaY3SZDl41LD8KSTFMGps
 XqZW7upw4ogiaw5RC02fHBgcKVPG4q2pXbPQqzWRdqGXACuCiBkRmyRQI
 lN69hevFZSnr72zNSA21BAaLexZIYI3EteOcuLDG7BS28V0Qt5kCdR4Op
 jQBDfj3W3Vwg/faKyqAo9IWJZh0/12BH0EExINTTlPlW76DbOaJRFg2mP
 HHWRbBGXgvtrt4WNYbXswy88LXdovYVfDb4ue5ZaNtXBB6gP18m6bR0Tf
 xFYAxVvJP0sLmYReZQV9dmR0OG2XhT/lbveL79ph+hhV7nm4xGGqw7H9A A==;
X-CSE-ConnectionGUID: Q2Yjf4VXTfeiy46FMjg2CQ==
X-CSE-MsgGUID: o0rUr0F0S82XNs6ZA8ySfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67387818"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67387818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:46:46 -0700
X-CSE-ConnectionGUID: 5spgch72ToS+KA/xXKeh3A==
X-CSE-MsgGUID: IhPYhDL8TZSOttsZjAZT/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="208909729"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:46:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 03:46:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 03:46:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 03:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/QKVuREswnCgYYXsSjAcWWf/c99bZKKMLhOXFlmwD4jO1b/LcYjof+y06OcFjC33pMn15EVWCdbY0SVRa/xev83SC3JcZW+nLeTCSHIXtdXBXbI3vNDm6GWhoHE+Nb6cg6bqJhqDIcwpYQXyw9r6gQ3L3PH/Mf2TK2sUMrfAh1iP1Pmc9HM9hGEZCmzmjY1ppCN3ZxkVeLffMpo4tYej6keofH3f8uJIUGU2jJSe1S+TdW0yZ1jLhKooo98G37fjwQdEUO//4fZ0inwlfVZ69DOWbBlnxQgZCWqLdsbWwM+OPScgV1qiM2Yt6rFm7h9nUYOKDaKdswIeRGOViBP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3XqrNQ4l/yu/WWSUdC6dUmXxC3JUmxYWEvUj8iJzDw=;
 b=kh7ZNnv/JNT+B0uolv0X69RrIfrOGAjVwcf+KhHlriy150XLPn5SyBaByrJ2K85CPx8u5F9C/aqesqL1giDzniXhb0VP8V/hX7NNQFfTN/qYhzV15fPtT0T1kBDMirefN59gDN5nyEHLCq3JMSt49RQ+7SmohOgW6CDanJzSCzfRNb+Cav7zhI/PQbEbitkazynJNQCYQ4jx1f6+yKL0eDScGPzy/sCH0VkoEYyWSsEuzdqq6D8Py/wL50ZWwoP7SQnGLBB2Qm3hdvVmbTPDXcjQTbnj+w8kTkLuLpcosI1RtQZAdki/FFMlvhlowbq3o6RM+rmVjLGrd+t5AvXXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 10:46:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 10:46:42 +0000
Date: Tue, 28 Oct 2025 11:46:39 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 11/26] drm/xe/pf: Increase PF GuC Buffer Cache size
 and use it for VF migration
Message-ID: <smbbl7zs7ix7ue33k52i225nwycnh2psxwc2ohqysxbvwubm7f@v5wilk7eulc6>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-12-michal.winiarski@intel.com>
 <687d4d54-09d6-4e30-921b-66c0e9bd0d51@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <687d4d54-09d6-4e30-921b-66c0e9bd0d51@intel.com>
X-ClientProxiedBy: BE1P281CA0477.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b25afa-6db1-4a31-4127-08de160f4805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlV4NWhxTk85VFdydnkySkZJaEZPQmp6dkNxaTdzUzFCdTY4WURYZWlqS252?=
 =?utf-8?B?QlQ1YVJ6aE1LRzN1RUlDQTRrMFhBMDZOMUV6Z2VMdUJFV2VjdVJ1VDRJWkd4?=
 =?utf-8?B?SWRKbnR2RXl5TFdKQStpMC9PZDNYMkZxVk9mcHV1YkRMSFJIaHZucXkySkxW?=
 =?utf-8?B?Vmx3VzdtelhPS2Y5amRNK29EZDFqL0g5bTAzT291QzdkbHppYjE2UEZ0dWpn?=
 =?utf-8?B?ZkVHd2UyRjBLK1Q4SFpPRnVHVXVPTHZLVys3QmpQdkErZHpHdTQwVjdSZW9G?=
 =?utf-8?B?eFZIZWg2bjcxcG1nNWxYcEE1Q0VLZG1DWkhMeUdIOXJoT0xpenViUnkxUU55?=
 =?utf-8?B?bVBHSjVoKzdmMmhqZUpVUUlPSUZwQndVdS90WE92TzhQZVVBQ29WRDJOU0F6?=
 =?utf-8?B?d2E5YmJSZXZiS1ZsbGdXNWRmc3A2YUhoSnZTd1VRcTVWTHJHeHhVeDdscUtD?=
 =?utf-8?B?bmZPaG0ybE4xc3lZRUc3Ujh3UmNpZG9seGQvbjhWYlZsV0R4d0MxSEtTYzh5?=
 =?utf-8?B?UUMvUEI4VGpQTFNvbnZQS3IyMUdSUTd5WnJEQmJuNUZuTnd6UnFCczR6QVFH?=
 =?utf-8?B?M3JSQVNhM0s4ZlpPUUw4K0tDdkFEOFF4dzRpMTROemt0NXJMNTUvZTN1RUJE?=
 =?utf-8?B?b2xUbVN3cUV4dnJPQVpmdXdVRGxGdTJ1cEwzUlNWK2NHSDB6a055V3FEVUJy?=
 =?utf-8?B?Zk5XME5uZTdjeFNOczgvRm5CcC9ERDZLV1Z6akR6eVdMOHdKdnlKMUZuUVV0?=
 =?utf-8?B?RCt5UGVjOVVJQm82cDh4aVkyMU9hQjNMQnVHVWVwY1RpMER2cmV0RXVGellw?=
 =?utf-8?B?Qk5IK2liRFE2OU81b3UvY2ZXRjVsTU1KRlFTMlF1MEpqYzg4YmR3bklERG8r?=
 =?utf-8?B?OFFJbFFzTHA4YjdmNjJ4V2NSQTNLRjB5WWxLNzQ2d3dHRmw3dGUxczlzK3RX?=
 =?utf-8?B?MlJOa292NGVXRzByQzlvbnJzZENDS2d2TGFSS0cvZVkwY1B6Q3RlVU9ZSU1M?=
 =?utf-8?B?ZDJEOHBITHcvdGNGSTBBQ3FlUjlXeXdlZzMvRVV0aGU3amNORTN3UzgwYnZu?=
 =?utf-8?B?Vy9WSDJ0c2tVcWNNVlNHc2NDRE1UMU15aFdFQ3Y0ZTh2SlYxMEFHNVFXbEIz?=
 =?utf-8?B?OXpnRFJEdks0WWJNWXpJR3dDTU1weFNXVVh5YmtlanFKU09TY0xUSUUwb3Mv?=
 =?utf-8?B?d29zTVZBZFVHOGlYOWZnZ3dJbmd6RncyVFQyL0U0eTQwRklCYzg0OHQ0VHFR?=
 =?utf-8?B?eGJJejVTOVJVaFpCZnVQTUhQMEZaeXpVOFEzSVFQVjFTNWJHbXlKUU5XMy9n?=
 =?utf-8?B?b0UxcW1adjhEYzVxL1I1Y0xzN0ZwN3pPeXVLMHJyODE5SllXRFhhdU5VZ2RB?=
 =?utf-8?B?eVkzcWpXdVpya2NJVEpVWWJKMFg3VndmUklkcnZraVpnU1Mzb0hFZWs3Qk8x?=
 =?utf-8?B?MWNtWUswRDVvbGNRL2wxeWk1Rnhoc2NhR0NEbTNCSjJtaXNsUjgwL3l0QytE?=
 =?utf-8?B?a0VTSGVPR1NYVDhNa1FQS3pKbHVNdFliZGhlRFRVQk0vdVBmUHRwVXI1L1N0?=
 =?utf-8?B?MlBFdEtadEVuQU4zSGxESkR4RTZDL1RXKytVb01YVUdOZWhYS3R0U0J4d1Ex?=
 =?utf-8?B?cXdOT0hJYkIyTEQzUHJXWll4bEZMSzZtcVRQeEY4TVFMZUZNc3FFR3kyUmwz?=
 =?utf-8?B?dGNUalFiQmt5MkZwR2ZKNTV3d1FCRC84YW9TS0pmNUV3RFE4RWZQdkJGZHF4?=
 =?utf-8?B?MEJobllzbVN5TSt3R3ZuK2NKSXg0TDIwaWdPbkVuRFNXbUpIUU1CQXQ5b3ov?=
 =?utf-8?B?MXFGTExldy9EUXBYOUs4WWxmSEJpL09aQWpmQ2E4c3pUS2dTMGxaRFdxWXJs?=
 =?utf-8?B?VDJTdG8vQjdHNUNoYUZEZTdGTVh1a01kZHIvL2o0SkVXVkdGc29YVisrd09B?=
 =?utf-8?Q?DBlyIknlRXIMi2aYtMdylbH4WY4b3Mvi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnB5ai9uRUduVFY0SVk3c2pneTluRDFBWlV0YUpoa3F5ODRTZDdvVEY5WUo5?=
 =?utf-8?B?UHZsck9kN1ZxWVFVRjVJSHhtTmtiQjNWTlNxMHRrL1k3anJid2JjeWMrUXlB?=
 =?utf-8?B?d3NZOWU0dzNIZU9qbjI3blZjbzBBZ1lEWjFLUkZLVFZ4dUtVOHYyck1aT25U?=
 =?utf-8?B?ejIxNk0rVmFjYWhacVJ4eWNqdkwySTVLRDJrRVdBZk5LUk5NY3hhbkNzVUFs?=
 =?utf-8?B?TWRNblVmWmFKWWdTbDlJNjhGaU1YQUxqV3h2dEhJQU5pY0R2NFFXTzcwWWR4?=
 =?utf-8?B?WlA0L2ZJZmZ0VjhkblA2TCtERCtFYVM3ZnpES2FtQjN6Y1BoZFBoM0VYaFhC?=
 =?utf-8?B?aUtRQ1pCRGlteGRHaEpnZ0syeVBwN3lEUTBCYUxHT1Q2TDhXU2Qyd3Rid2Ez?=
 =?utf-8?B?Y282T2MzNjNYYTdFRHZ3bERidng2ZEFHd0RsWHRodUhNUzBlK1R6ODlUVkxw?=
 =?utf-8?B?UVp2dHUxZ0xhRVZlRThZZ1RYN25NYVYvaE9nZUNOWUdUclNVVmFZZmVnVm5E?=
 =?utf-8?B?YmRVbFRKNWNXOUUxdFhmajAxOU9IdHVrS1BWRjFxQkl3c3Y1ZjZNUElTOXFE?=
 =?utf-8?B?eC9NZnFraFhlRTN1bzYxVnJPVUEzN0N4NzRCOFpvc2d0WnFVOU9ZeGZkcXJ3?=
 =?utf-8?B?bzVzVGwrWVdRb0M1MHhVWHJzSys5UGUvcTJ4emkwbFNxWEpPMHJUMlpUS0RO?=
 =?utf-8?B?VUl5VGpvRnhwWWRnM3E1T2Q1bWo3bFY2cGJ5K3pMeUlwYURFMm1iby9QQ0Ri?=
 =?utf-8?B?bjdyNWlnRWU5Z2NpSG03RTRwbUY3OHFPNU1GeGxxd09ESjZVNzZSUlk2VFdk?=
 =?utf-8?B?UjBObjhFelEzSzhjS0twM1dleTJXUlRkVUxKb0NWWEFrSWRiV1ZoSnQxVVJ3?=
 =?utf-8?B?ekZJNGFSWS9NcVBDWllQbVRYbEowclVwUk1tWGlERHBjYWhVQVVWQkV4SEdY?=
 =?utf-8?B?MlZSYUdtL2NBWUNYa3V1OFVwa1JXblQrZVhMM1ZubDhMbVJoU202THJUWFFG?=
 =?utf-8?B?ODgzMUlPdStLUFF4eWZ0NVZjRzU0QXBpbnJ5MUFOcUUrZm0rckVTNmpzMlo0?=
 =?utf-8?B?RjdkVTdJQnlyNm5QSkFpeTBwcXIxa2ZTR0RZSUxRWXQvMFZPdjBrOXRUaDVY?=
 =?utf-8?B?c2JOMFZUNHU5TUlVVjdNeHZCWm5ydmdSeDFibFgyRzB1NERrRXhtR1BhdU5n?=
 =?utf-8?B?SnN4Ly82NjJ0TUk1bGJJd0hncHZHeDRod25WZDVrZE9QZ1lvcmhEdlptU2t4?=
 =?utf-8?B?K2IwTGV6M1lNdk1pZU9JWXV0MEZyY0plaWJvSWp6N1dsdDR6WXdhbGVqN05G?=
 =?utf-8?B?bTl3cklpQVQzRmtUZWtYZXlHUHFzdmNESmtIVVQ5R0xBeGxCSWFpNkZwK0k5?=
 =?utf-8?B?cEtHNS9sSkIrbTVBakxXWThPYnArYlRqbmJkMkloZWMzdFN5ak1KenlYOGpC?=
 =?utf-8?B?Z0t3NW9ZNmlOMHEyMEZMZVMrM2dXN0llcGZ0S2NOTmxTUXBSVkxnT0NDVjJq?=
 =?utf-8?B?YmFpVU1ydDQxSlRSeDExbDMxUkl5ZHJqNVJwZW80aWNvdWQ0TGQ3dGNkRyt0?=
 =?utf-8?B?YStUb1lIUEJqRWNDNm1Ld1NsUUExV1ZqN1ltSnhJYWVSOVdnbm5SNWVLaG0v?=
 =?utf-8?B?NjdUVXVaQVExcVVTVHNrVjZySDVqanllV2RwWGJ4SWxudVEvczdobUZvRDcy?=
 =?utf-8?B?S1RiZktkcEVndlBVVUM2SW5tc1BtREV2Qk9BcnZtaFdUemdoVmRZU3lmK29Z?=
 =?utf-8?B?bnRsdC95eTZzcE1ETXhRM0ZwVEhPMlRzenlNRk83RDJMWXhQU0VFNFcxSmlK?=
 =?utf-8?B?RHpYZ0N5Zkx0ekNXUkFZdnM1cVZnSW1wcUZKNFBkV3M1UDRjRXBTeC9TR1Vy?=
 =?utf-8?B?ZGlRazROMHdiYXZ1MjdRQ2l4VDNrb1FvdlExS04yLys0RGluYm1yc1BJRmVK?=
 =?utf-8?B?N1I4clFGYWY4bFRWbEJZYzh6bStiazRSWm8zYWRNZk9BSzI2SzZPNzlnMkpE?=
 =?utf-8?B?OVVvSk5MOFZsM1FLYXBKUWNyOHlCbTBMeDFGZkJBandxSmY0UW1RN09IWmRz?=
 =?utf-8?B?bStVN3RWSHAyS1YvWUtmbVZqWEdaRDdqRGFjSVJ0WUZFNGlvN2RpVHJEOFBJ?=
 =?utf-8?B?N2ZoOTN3di9oOGNkVVpYNUVoVXdjTmZLQmpoY1lPSlBtUWFZUFVoQTRzTTNz?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b25afa-6db1-4a31-4127-08de160f4805
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:46:42.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6g5diAbR7uQrL512wZmKujtDetuvMumF3uwE7iBI0IZLYm8Bh2pIGcdxFyBABtrNyywBKmdTkHr8Obn7wHCdl3RS4KoXB/fhJSBb16guccs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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

On Thu, Oct 23, 2025 at 07:37:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > Contiguous PF GGTT VMAs can be scarce after creating VFs.
> > Increase the GuC buffer cache size to 4M for PF so that we can fit GuC
> > migration data (which currently maxes out at just under 4M) and use the
> 
> but the code below still uses 8M

Yeah - turns out we need more than 4M (I did my math on one of the
structs, but there's actually additional data present), so let's just
stick to 8M for now.

> 
> > cache instead of allocating fresh BOs.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 46 ++++++-------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
> >  drivers/gpu/drm/xe/xe_guc.c                   | 12 ++++-
> >  3 files changed, 28 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 4e26feb9c267f..04fad3126865c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -11,7 +11,7 @@
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > -#include "xe_guc.h"
> > +#include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_migration_data.h"
> > @@ -57,73 +57,55 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
> >  
> >  /* Return: number of state dwords saved or a negative error code on failure */
> >  static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> > -				     void *buff, size_t size)
> > +				     void *dst, size_t size)
> >  {
> >  	const int ndwords = size / sizeof(u32);
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_guc *guc = &gt->uc.guc;
> > -	struct xe_bo *bo;
> > +	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
> >  	int ret;
> >  
> >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> >  
> > -	bo = xe_bo_create_pin_map_novm(xe, tile,
> > -				       ALIGN(size, PAGE_SIZE),
> > -				       ttm_bo_type_kernel,
> > -				       XE_BO_FLAG_SYSTEM |
> > -				       XE_BO_FLAG_GGTT |
> > -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> > -	if (IS_ERR(bo))
> > -		return PTR_ERR(bo);
> > +	if (!xe_guc_buf_is_valid(buf))
> > +		return -ENOBUFS;
> > +
> > +	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
> 
> hmm, I didn't find in the GuC spec that this buffer must be zeroed, so why bother?

That was found during testing, GuC actually expects the buffer to be
zeroed.
I'll ping folks to update the spec.

> >  
> >  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
> > -					 xe_bo_ggtt_addr(bo), ndwords);
> > +					 xe_guc_buf_flush(buf), ndwords);
> >  	if (!ret)
> >  		ret = -ENODATA;
> >  	else if (ret > ndwords)
> >  		ret = -EPROTO;
> >  	else if (ret > 0)
> > -		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
> > +		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));
> 
> nit: given this usage, maybe one day we should add optimized variant that copies directly to dst?
> 
> 	xe_guc_buf_sync_into(buf, dst, size);
> 
> >  
> > -	xe_bo_unpin_map_no_vm(bo);
> >  	return ret;
> >  }
> >  
> >  /* Return: number of state dwords restored or a negative error code on failure */
> >  static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> > -					const void *buff, size_t size)
> > +					const void *src, size_t size)
> >  {
> >  	const int ndwords = size / sizeof(u32);
> > -	struct xe_tile *tile = gt_to_tile(gt);
> > -	struct xe_device *xe = tile_to_xe(tile);
> >  	struct xe_guc *guc = &gt->uc.guc;
> > -	struct xe_bo *bo;
> > +	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
> >  	int ret;
> >  
> >  	xe_gt_assert(gt, size % sizeof(u32) == 0);
> >  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
> >  
> > -	bo = xe_bo_create_pin_map_novm(xe, tile,
> > -				       ALIGN(size, PAGE_SIZE),
> > -				       ttm_bo_type_kernel,
> > -				       XE_BO_FLAG_SYSTEM |
> > -				       XE_BO_FLAG_GGTT |
> > -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> > -	if (IS_ERR(bo))
> > -		return PTR_ERR(bo);
> > -
> > -	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
> > +	if (!xe_guc_buf_is_valid(buf))
> > +		return -ENOBUFS;
> >  
> >  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
> > -					 xe_bo_ggtt_addr(bo), ndwords);
> > +					 xe_guc_buf_flush(buf), ndwords);
> >  	if (!ret)
> >  		ret = -ENODATA;
> >  	else if (ret > ndwords)
> >  		ret = -EPROTO;
> >  
> > -	xe_bo_unpin_map_no_vm(bo);
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index e2d41750f863c..4f2f2783339c3 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -11,6 +11,9 @@
> >  struct xe_gt;
> >  struct xe_sriov_migration_data;
> >  
> > +/* TODO: get this information by querying GuC in the future */
> > +#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
> 
> so it's 8M or 4M ?
> 
> maybe wrap that into function now
> 
>   u32 xe_gt_sriov_pf_migration_guc_data_size(struct xe_gt *gt)
>   {
>         if (xe_sriov_pf_migration_supported(gt_to_xe))
> 		return SZ_4M; /* TODO: ... */
> 	return 0;
>   }

XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE disappears from this header
as a result of previous changes, so the size calculation can be kept
static.

> 
> > +
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 7c65528859ecb..cd6ab277a7876 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -24,6 +24,7 @@
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_vf.h"
> >  #include "xe_gt_throttle.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_guc_ads.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_capture.h"
> > @@ -40,6 +41,7 @@
> >  #include "xe_mmio.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_uc.h"
> >  #include "xe_uc_fw.h"
> >  #include "xe_wa.h"
> > @@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	return 0;
> >  }
> >  
> > +static u32 guc_buf_cache_size(struct xe_guc *guc)
> > +{
> > +	if (IS_SRIOV_PF(guc_to_xe(guc)) && xe_sriov_pf_migration_supported(guc_to_xe(guc)))
> > +		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;
> 
> then
> 	u32 size = XE_GUC_BUF_CACHE_DEFAULT_SIZE;
> 
> 	if (IS_SRIOV_PF(guc_to_xe(guc)))
> 		size += xe_gt_sriov_pf_migration_guc_data_size(guc_to_gt(guc));
> 
> 	return size;

As the cache gets reused, we don't need to add anything to the default
(we should just replace the size with the new requirement for the
largest object size).

Thanks,
-Michał

> 
> > +	else
> > +		return XE_GUC_BUF_CACHE_DEFAULT_SIZE;
> > +}
> > +
> >  /**
> >   * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
> >   * @guc: The GuC object
> > @@ -860,7 +870,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = xe_guc_buf_cache_init(&guc->buf, XE_GUC_BUF_CACHE_DEFAULT_SIZE);
> > +	ret = xe_guc_buf_cache_init(&guc->buf, guc_buf_cache_size(guc));
> >  	if (ret)
> >  		return ret;
> >  
> 
