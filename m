Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83788C136BD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738CB10E5A5;
	Tue, 28 Oct 2025 08:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY6OrScb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF74410E5A3;
 Tue, 28 Oct 2025 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761638578; x=1793174578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dPyJluflW1cX13d6TUYkYnCB3DGns9JDY0SOGOYh260=;
 b=LY6OrScb/OfUchuzbzOnU3iSzL+qjYar8DtsOV3ZS3RHcz1Xqg39gjrO
 hgD08Fr5l7gstqZa6Z8IDbT/OTuDtebyD7DAKIMyNSDgg5h9ZXy8MFkN8
 JtJdDRVJ6nNaaL+HV3oHIBjLQOzD2wUOkwIKKJsUlAVUafx2mbwjf0wNH
 +W9HQVjP4sb8OmMizMXePg9eaw/MM3cX+eZ3GOcDi3fuwZ/HwZq4tNs+u
 y5+CfyrKc1RZPxpZ3vduLfwG1G1WTLVbZ4uHIeBc12QeKSudN9QOao09F
 aaNe/eBwoYbPM+WRivL19ZhJu0aabDl3sTRELKNW1pVdYBJwVd0U40D5D w==;
X-CSE-ConnectionGUID: REZCBYJ3QfWwVPzyoLRQwA==
X-CSE-MsgGUID: fc5Xl9/lSuSH0epQoEuLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66347584"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="66347584"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:02:58 -0700
X-CSE-ConnectionGUID: mqPaP0NRQTS4wAZLrAAAWw==
X-CSE-MsgGUID: bv+6qNAkSqWtoQRdExhuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="208876381"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:02:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:02:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:02:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaRU3Hy0M6k+65CEGK55FxDsyWSLR3w03NkG9hVEP5Jk5V/t6aO8VYKdN4tOgfs2kgQlhEkt86px6D5RlIQ4Zh6VnY1vguI97bRpGgAXwUG6ti5c6ZlnorpRyHVwe5BYkeo8FGgoMeETCuL7Ioci0rRfeGy5qGND2ov/pIdTknqhGM3iDTkgud4+WWSUiZw6/kQbSKFysAlBSwKEN7Uwabn2O6uyCgVmAwuBjBGNFDBZTudlHbrYyBrUgcmrRpyFZOttAFrXdFPjcAV/eELY3ZhfuRlSuWvdS0oR8tEbQGFqq2iRYAhaxWexbyXjzOglNzUThWvqfqt9OAxmd5jUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkSQU7Zy3HxZc7r8nQ46jltG1vVNB6pxBfOl6V9Jdec=;
 b=iHL6i1TAIMcaoDog5UiFw5i6ueo4SiqDiIK3R1NCM583aELsfp7Uvpm+0A99ddwfgzNdU5U1kJelAkXi3Z3prLqy4nvUj+VjLKtg/d+ArErsB2XMptOfLC/GA9VaLlyMuwAQaxf7YXmpTAW9RFpXQOCiAtCPEEzIcCiBKltI43RGPag1/UVtSHuugonaJ/jpJ5MBFBrBCqzaUblHY5XVK74k8cNeph8JPf5rXY+w3s5LQC/3fLXiLNb71gcrurZYdqRpchf1IQGN/dKFcsvBwsOktQtlQe2rJXdeQYThvpWM/FaaDhjIa26P6j0/gEMoEh9Qr5qOihIadTH1IiHlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 08:02:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:02:54 +0000
Message-ID: <3ebd02d1-2a91-4510-8bdc-e3edf7180e18@intel.com>
Date: Tue, 28 Oct 2025 09:02:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/26] drm/xe/pf: Add save/restore control state stubs
 and connect to debugfs
To: "Tian, Kevin" <kevin.tian@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Yishai
 Hadas" <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-4-michal.winiarski@intel.com>
 <BN9PR11MB527672ACB8C157B343DD17DF8CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <BN9PR11MB527672ACB8C157B343DD17DF8CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbb4af1-d3bc-47a4-7433-08de15f865e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkdZdWpadzZ6cTM5b0U3VGpSaDhVeHRGUHdzQUZTUmpLMHc3MngvMzFzWXp5?=
 =?utf-8?B?WWdoTXNvaFJDcFVFUUZhTmVQNDBKQ0V4TXZyVzhCb2tWUkRZcjhsTmcveGZw?=
 =?utf-8?B?bnZaWHA1Nk5lbUZwemxLczFKZ1RVU1pDSVJzNWR5azVFeEk2UDFsd2dvdHVG?=
 =?utf-8?B?UWdxRlgwWHgyMXRDTXg2Q1JKTFR1TE50NHMzU3R1ZVVmazc4Y0JJYm5TcGJQ?=
 =?utf-8?B?SlN6alk4eTdKWGxvUVpoUXY2c3doeVFxWVFlYW5ZeFF6UjF4cGovRXlWTFl4?=
 =?utf-8?B?VUJQZXUwZHhneXFXT1BUaHpOcmIydTdUR0ZKNWlDdTNTckYvanNkd0FqNC9o?=
 =?utf-8?B?cXVlajhoTGdEb1dSSWJRcEJnTWNlQjdrWWZLVUVmU1ozM3pleEpHQWthOVhU?=
 =?utf-8?B?Ykp0bVc4bjF6UkZTRGp0eGpETzB3eTNVTzVEdGg5YlZKOW5UZ25iM1laTmIv?=
 =?utf-8?B?TjIyMXA2S1dBTElFY2JxMk9TNmxKQ2t3VDBHVi9HemhkejVGV1piT0FvWXRz?=
 =?utf-8?B?eFplTWxjTDhHOEtaZFlJQWZmcWZObG03U3FHbzVpZ1VBeER6dzgxY0t1blVN?=
 =?utf-8?B?d1FsZ3Z5SzUrN3BHK0hrTjlDN2ZjR0FuZXFGdWlNSWJoM2wrczJEb1ZiL2FY?=
 =?utf-8?B?SjFHeDg1b3piRnJrejVIK0ZueTVlaTNZb0I5QXFIRTh2Y1NzTkpvVE9SUmtF?=
 =?utf-8?B?OVBLY2MvQ0Z6MmhrNGNJaDJVbHJuVkFQVGk2Snd5WThwYm5nY3NOaUY1NDE3?=
 =?utf-8?B?OW9kUlJYK09XcVBYL21Qc3ZSWVM4T3NCMnZMWndydzlIWUFkRzNBa2ZTV1ZJ?=
 =?utf-8?B?UFRlTzgwanpKUW1Nb05XRDcxVHV4L01EMkRVMEZaR08zZU50ZUdiWHJuWGxQ?=
 =?utf-8?B?TjZ3TEg3cnB5dngyQkxVZU5naWlRSUdiRmd1dkk5Rm91MFhnL1BUY3VtZSsx?=
 =?utf-8?B?S1BEM3NsTDQxMlcyQzQxMGRwaUl6Tkd5cDllQ3d0cFdiVEoxNG90cTJkUlpj?=
 =?utf-8?B?clpPWjB6N0swMEJ5S016WmxBZHpCNzRYS0N1eTRLa24zUjYzTFVrZ2xPdlBH?=
 =?utf-8?B?eVM0TEpSMlIrTzJLZmpMamZGRkZBc1JoWE14RUJiZ3JzS0M1RkV2V1hwMVNp?=
 =?utf-8?B?SWhoZW9qUDZUSy9HQkJBaVBjZEJMT2drMVV3RjhMbzJieDdSbkxISHRVYm4x?=
 =?utf-8?B?bUlzejZrYjFmQmxMelFURm8rVXdVLzdvQ3REbVFRUERId3h2SVB6dURhYys1?=
 =?utf-8?B?ckZEYWYvZmZkanY1bXFCR290SUI3SXR4YUtDTDRwK0RwZFR6M1B5TkRNZkR6?=
 =?utf-8?B?ZFExNFdNVHlIMnhoMisxNEhJdHBZSkU2MlM5elFoK21VbW5TZXQyVVg5MEo4?=
 =?utf-8?B?aEVYWVd1Z00ydFBTSDU1cE00UmkxQnZRS0J6T2ZROGtCZUo0MXRMazNFYmQ4?=
 =?utf-8?B?ZjV1NDNjV1RBcHdVL1YxS3BWZjl6U09sV2VML3F2eEVwOC95Y2FMNEhLaHh6?=
 =?utf-8?B?YnlFajJGL0hCb0NYdTg0bE5jVGVGRVp4YkMzRzdVSVBZeWFVcGNPSU00RVZj?=
 =?utf-8?B?alRIN1orMDZNRHUzbnkzVTFXYSszTGJzTUNNOWFtRnN6QWxYbkFZekdRaG51?=
 =?utf-8?B?TWxYZ09WNXhTR0svWktaRWx5ZndzOTNpN3duOU96N3IyVFVydFR6Mzd5UlVG?=
 =?utf-8?B?OHJ1ZjZEeDVjclNQQklzT09qbHVYVUEwWmdTZnJiNXNNdzVkckwrNmtUamYz?=
 =?utf-8?B?VkladGo4a2hQRGJIQk9wTTFuakxZcFZwVGd4eUdPMEhjdjkwTStpc2Z3UFlQ?=
 =?utf-8?B?MFRXdS9DbmhDSjAvb2dIOFpXN1lQeEtBdXQvNUZTRGVzZmQyekpZbmE2ZUhr?=
 =?utf-8?B?TTlUMUsyUnVwbmN1d0xBNWVCZlNUelJZeWdoTGFwWnhJc25uM3pJZG5ZVXl6?=
 =?utf-8?B?anpZZ216NDlzbUNsOVhidjRqeWRZUmhzUHhwOVRIaVIyMUFYcVlpbklRRTF6?=
 =?utf-8?Q?TPJ2BMUb0VHzrlbYsQcdncJ9s3UOgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdCMk5XT0d3YlpnOVBodk53M2V2R2Z4ZmxVcTJpeDhTOHNPMFJIWnp1VmY3?=
 =?utf-8?B?cEM3anV2ZHNzRWdDZGpLU2FMUldGRjJZRUI4M0NXVVl4Mkcza1Vzb3M5VndS?=
 =?utf-8?B?azJseFJhblVIWExoK3ptYVpwYXdnTitoQXBicU9FZHA0c3FEaEtlUnd5R01h?=
 =?utf-8?B?NG1SOEErSkY5c1d1SGlUelNvRTBWcmdIQWVTYjNSd2xvb1dsaS83SWhkQWh4?=
 =?utf-8?B?S1hLMUN3MFdaQ3NiSWVCZTVnQXFsNE1qdm9UUHh1czVoME03NnlRRHFNVWF4?=
 =?utf-8?B?dW1RTnlOL1FrZWtHQzVpRVdiMjFNOXpiMk4yUVJVb1RYbmRxT0d3elFLVEU3?=
 =?utf-8?B?UjVNcm91U3BwTForNDhiaDYyMnhIb2RqYlByamFDOFhVaVNJODNYdCt4UzB6?=
 =?utf-8?B?ZTc5UkcwekRHUUlZYkRQbVUvZjQwWGhhZDYxMDQrR200cDlFZXhaWGxvSjV1?=
 =?utf-8?B?Qk5PdXZuL0NYdFd1QkFWTm1xVnRhM1gzQlpYb2JhL0gvNVRVbDZGM3p1Tjhy?=
 =?utf-8?B?d2tYMDhtNUJPaTBYOG5EQm1nRFl1WElUTlhDK21CMXhHTHFRdTVoVTdoR0lw?=
 =?utf-8?B?VkZ4ekZjY3dQOTNqNFRHdHdvWCs2Mkw4WWpPa2ptSXdWM2pCeGhTNnRIWEVK?=
 =?utf-8?B?bjVVNnVEVm5IWEs1UnRnVDgrVkFFcGtpa0hlcld3U3gvV1cxZ3E5dnZyOW8w?=
 =?utf-8?B?RDMycTJxL1JVNnhveGk1TkUwRU1WMTBWdFVPRlBaZkJCdjFFU2pqajNzY2R0?=
 =?utf-8?B?emwzOUthQU4rb2w3cVljZmN2RTBtT3FMb1ZqZnE2cGRtY290Rmc1QUREcVMy?=
 =?utf-8?B?bVNUbHRUUWN4MkRUUTFRRFhTT21UbjBPUm5teUZ5QTN2QnBJdFVTZzNQc3Ev?=
 =?utf-8?B?Tlo2SGpqS2NLR0N1bTNkMnFmalVvTXI0V3ZmVGdya1pIRjAvS0xVdGV5enBX?=
 =?utf-8?B?Unk2ZjU1WHR1YjFTcXFaeGdpVHROVzc5MGFHcThkYlEwS3ZRUEIyNFQ5ZHpY?=
 =?utf-8?B?NmRESEx2SXNPTDB3dUlyYVQrNW91eVgvR3NhSVk2aU5EQUtuc2hDMFRHSklk?=
 =?utf-8?B?T2hHZTkrNmRaQ1RQZHloaXVMV0N0TkZqeWxjK0owRk1tWVJUZVhIMW5nMDIw?=
 =?utf-8?B?QkovUE5wRGl4b2cvOHBXUWpZeWxwWDc2WDVYQklQbXJqcjMxVWFZMmYvQWl1?=
 =?utf-8?B?S21rem9mNmhmclBKL3Jqbklqb05DWmdNWmhZa1pVMjRkWWRNZ0MyS0VhWjlO?=
 =?utf-8?B?dUxSeFQ2UXlCS1NwM2FibUNvM0xzaXlGTzVCZjR4TFEyVERhZDA3ZngwS1Bz?=
 =?utf-8?B?ZVN3WWM3ZFRzK1JhVGRRYm1lN1pFL3FWcVJtdnhFUzdpQlErNmpXdGk2b3hr?=
 =?utf-8?B?UVdVN3RId1RhWVFGQ0RlTGdrekZDellMbE5lN0xUWno4M0VkSDF1TXByQUdJ?=
 =?utf-8?B?ODdvRVNMcXhDNnErZW5WMk9zbDByd3FIbUFwYkhxTVYyb3lsWW5MUy96MFJr?=
 =?utf-8?B?RHQrOFJoOVpTczJVWGJKaWpFM3E1RHNZQjlmL1R4Ump2djR2V1BqOE9zb1FD?=
 =?utf-8?B?UHNBYWZ1V1MzR0NDcG8rZzFBYkg2ckpOU2toZ1F1VWlicFhuMWJlU3FuKy95?=
 =?utf-8?B?dHczNVNQMUxBNmw1TnE3dGROYTRLL2gvVTBCeFdqWVNxZlZxYzNYTE1UdnVC?=
 =?utf-8?B?L3hGZGVyd1NVczFsUXJ3b05tcW0zVlluSnYyYjlnMGRmUTNTQXlmS1UvaXZJ?=
 =?utf-8?B?L0l2VGxRZnNFMDZMbmxhWDhFdllRZUxLVURsTWFpMXFyV3hleU5tYkJBeWFi?=
 =?utf-8?B?MkIyZlZDVERZeWhIYm90YW5vbCtIVzNwdWczMHBtTExkMXAvcURNSEFZMGt1?=
 =?utf-8?B?UHRlVEhLTWZkcHBMeWpkNGR3MFNsN0doV1o5bUtqUERoT1RLUitrUDJia1Fq?=
 =?utf-8?B?M051c3J2ek1MdDh2eklyRFNkVlRrdlMrSDdDa04vMlJyWTFqZ280em5YZ2hW?=
 =?utf-8?B?c3hQZzlIWWVNa0w5TVI1cFY1NVA0RXZTNHBBdVBTcXlscjNqRHZ1ais3UDJi?=
 =?utf-8?B?OVh2OCtVdkxJdWJxNFJmS3MyZkliZmdlRDkxb0tmWmwzdzRPK1JBUzAwU2ho?=
 =?utf-8?B?dTJDczUyN3ovcmhIbWR2WmtSVlg1T3o4cFNtaklBLzBaZHhKZFJvcnluVlJj?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbb4af1-d3bc-47a4-7433-08de15f865e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:02:54.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTXzAi7a+yBhc0BgGuhIIScoiBbImfNqyMtoLv5D8SzaRVa3UYC6v3y3XTSRdRalgpBIICDR1pWdyuP4WNkjjbmd/rrxbiSxz5dtDui7dko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
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



On 10/28/2025 4:06 AM, Tian, Kevin wrote:
>> From: Winiarski, Michal <michal.winiarski@intel.com>
>> Sent: Wednesday, October 22, 2025 6:41 AM
>>
>> +int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int
>> vfid)
> 
> the prefix is too long. xe_gt_sriov_trigger_save_vf() or
> xe_gt_trigger_save_vf() is sufficient. 

on the Xe driver we name functions based on the sub-component name

xe_sriov_vfio.c
	= xe|sriov|vfio
	= Xe driver | SR-IOV feature | VFIO interface

xe_sriov_pf_control.c
	= xe|sriov|pf|control
	= Xe driver | SR-IOV feature | PF specific | control

xe_gt_sriov_pf_control.c
	= xe|gt|sriov|pf|control
	= Xe driver | GT-related | SR-IOV feature | PF specific | control

and only functions from the xe|sriov|vfio component will be exported
for use by the xe vfio driver (hence the vfio tag in their names) and
other functions will be internal to the Xe driver

