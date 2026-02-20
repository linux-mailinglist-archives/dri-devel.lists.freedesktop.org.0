Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLInEP77l2ns+wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:15:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8B164E85
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F2810E78F;
	Fri, 20 Feb 2026 06:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQZ2n5tI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2310E78E;
 Fri, 20 Feb 2026 06:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771568122; x=1803104122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Nw8x4SXuej5jvmhgAQZ4oYNG6SvvFNP/2FOhoEJshGo=;
 b=GQZ2n5tII0e12ogLN45MkvEUfinWmDH1ZopW4oDOMvd5Mc6bi2TUpxYe
 BYIzBGAb70J2BkohaaowOhhBrLndmQyLSpJLuF2hKbJtwb+jNEQopSwLQ
 10bdqaTndx13kthpw0X2+8Vz2hjOiRHWf0/7+U8KfmbpWSdqNz/71c2xW
 dyOgLjpmyf5LByB6imr5Z9G/36pbYL39JCknjN5jRdNdIDFbvAly3H6p4
 Urn4HyM665bTmh4VWAqa1wZiR2iSiy5uiOul17G+sXaI2HiPBUyqeQMFL
 0y1oeugNVBFhL8Q3tM8Zt5YklGka4Mn1/H3f+uTcegvMqhFU4MmA7UoNl A==;
X-CSE-ConnectionGUID: PojoxmM2SO6s6qLpj6+d9Q==
X-CSE-MsgGUID: 7FTiKkwfQQWFeimxWHiD/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60236334"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="60236334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:15:21 -0800
X-CSE-ConnectionGUID: I2SNTUpuSieymbSCIYF0EA==
X-CSE-MsgGUID: NFdWZ0NsSSWattRXmz671w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="212917875"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:15:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:15:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 22:15:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq3Z29Wsmw2+8dyOSYAG8L6th9gMvxvjOPx1mYrLv8rnrWnnY9zw/Md4MePgF0AzaFgbVnH2AIgfI0bfXICL4GaYUeAeZ8LwEFFbHFiEmc1AP2hiLyp0bv/EjEwlWVYCOPotNN4FAni4u7av35EE6Waus/BOJ+G3pnGQmEDS10OY98RJdc7fSlR3eKDqn8WKnwWFs6pAkBbKhZM7oenqkxYPJ2rpFdygld2/ApX5nTpGLk1/5rPkTcQw1NDlfXYhSsq1p4oZsyj2ZsSGp7WdZ3cZ6Pp5g+kcmdfvROklGf8uWao2yrC+ka+64PKR5S7bLiZv8wz27uQBL9C88JtPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3Qj4OimsvsSPc30jgKSCj7QyHeqDUVmyUAGyshSTtY=;
 b=G/QWeIqkyQxMQSO1POIaKpR0PcgpqxRuUyc8s3udxy7LdrPtSyNWs5zKNtuB6gzd66xBLE4Hfe3S9lYEdaDcxNwZF82Mm2WtRDalna/2BMtdq2zwjux4yzdEa2yUOXtMEVGSu1YKusp8RqKYCUkpk7QyG9mKFVk0IO3LS2TuzB/1D8qXxHhKVSsWfNNNpdAHgndMMUh3YzMtUZ8h09baE8gxL3aANmnen+EWESCs8trIf3b1Lgi6W0Zpip/hfthikaEYS2v8DknOfPZrodyXZLtGRNrPXoQdb639+fd8euynFkAQjkXS6Ca+YdnbALnvBgacsgFaoI1f5jpFcJ8EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB8783.namprd11.prod.outlook.com (2603:10b6:8:254::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 06:15:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:15:10 +0000
Date: Thu, 19 Feb 2026 22:15:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v8 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
Message-ID: <aZf7616z7z0MOykV@lstrano-desk.jf.intel.com>
References: <20260220055519.2485681-5-satyanarayana.k.v.p@intel.com>
 <20260220055519.2485681-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220055519.2485681-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c22738-8460-4b5c-e7ad-08de7047669b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mvWYwimX3YuhbFht+eNE058ze7Wsc0LglLdCp1lZ9PLpJnW6bKi1+lcgCL?=
 =?iso-8859-1?Q?J2+8ZriOgRNbx03Wrh7ECFgsT/6l5h3ya3ugg93WVYHG2lwobFPsIaIbeH?=
 =?iso-8859-1?Q?28kjyOEzOf99wyC1UjyNI3MVVdiUOAGmS24jNf3a0PRqoE7bEqEA/lD0q5?=
 =?iso-8859-1?Q?Effq0DlEG0+U/PeMiL+pZJh9jfNf0iYByDq2IL9ODM9YpCcHUJe50O7vHn?=
 =?iso-8859-1?Q?mM16pSYAQ3g/kzTQPfGJvvhn3plq08wVHMy1ffThtrBSBjaH3+6Ki0/Uo0?=
 =?iso-8859-1?Q?U/ZCBDLxiOyP++83+KQ9GnGXD9EpsO8Ilgp6/66UUF67NFZtL+UrhHrFDn?=
 =?iso-8859-1?Q?El8meFnAUWrl7RIyg2tEZ6/N1cDL6AIZXJHg3jycQLKGQwfzZ1JIRzDoSy?=
 =?iso-8859-1?Q?awGnBVQxGEqXH+kY9YoC5QovGPJKLYMro+RWh4gHCR0OwhgEkIY4hnit8b?=
 =?iso-8859-1?Q?T4blpBdpvfu5r3Tg3gFlytnBp3rA3aXGHJupV39esxYEqLJnZVpKm+X9wI?=
 =?iso-8859-1?Q?ohpCd4D18tANlwafRboiyDyUPQSBxTaFl3VYaLsQQDYiFqIqprUy/1COK0?=
 =?iso-8859-1?Q?w77cFZlgQISAEoRdJWmRKFT+pAy1zL9WKqjwcmVSM/XZm8Y8cbY5lGNmgu?=
 =?iso-8859-1?Q?IymHqdkcoKcYjxkWGohBIn/XLIYx7KKEmwcBRrYof1NbcXiAcMKfispoyD?=
 =?iso-8859-1?Q?HQrk3W175T8QKjWtFHsHoMNJOWGmwo58t6xcXr8+qbNtv/IPIKfJ7+rxeo?=
 =?iso-8859-1?Q?3x2ZMugA/+pZwKD/o7KUvGgNCShvj+8SjIXeSSGXtaAxWyb6tJJymkfXYa?=
 =?iso-8859-1?Q?4b6nB4XCyPK/2Z7U2+XvyRN0qGdsnmj4/xYjAxomHrDfrp+Chu/1H+jFCO?=
 =?iso-8859-1?Q?EnWjiEE6ma9e1C175leDqTDoDy6DIdPjKLkHveHplR+X6rIVNdcHJ6MCG1?=
 =?iso-8859-1?Q?pkX+v3dAVgeY0Vwz0zG0orcjSNMsyNDQROnqObYLCHY0+3CqbyF/0w5RRt?=
 =?iso-8859-1?Q?HawlSvqLnIr4AmLd7nYABHCoCT05q7qW9UwZ8lFIpq48cydw7H8rLVPYH0?=
 =?iso-8859-1?Q?SZnRRL3GododedJ4OKxGeboBmboE9qOb53BP9Ot+hfI6rR0TpsIx8+SFcD?=
 =?iso-8859-1?Q?rfU89kprLMu2rQBzKAkfmH7BqGIh4d1tv2zAJxqhhfv8UyA8EwYSxGAFAx?=
 =?iso-8859-1?Q?+G+eemxm5NUyoWBZXrQS0z+OGxT/ukGlRgium6cJs8ar6l7IdAM//J6A62?=
 =?iso-8859-1?Q?a78SVa4Vyw0RVfVGRg1GRYqRhKX4TjLkfcI1uWlJru03PO8aJjHEiBpb26?=
 =?iso-8859-1?Q?DjejBrwhzT6D3aL2tbxjWNmNbtMuVXsAH3eL4xeNtC6uMSrwkyy2n6DJGx?=
 =?iso-8859-1?Q?QEjfdfStrLLVp+f8mozzS93U7qvu3snDiZ3KG1u4cMJK0tfXtMmxCifE6b?=
 =?iso-8859-1?Q?UDHXIFsihV/0sLVLYF/1iE2lf8h/wHOqROfyCVd70cDlT0/gypxyN2LyDN?=
 =?iso-8859-1?Q?OZlGnHV44s8svJKcHGP69O1nCm83patl9QxskOehDmuGy96b4qJ2CggMmz?=
 =?iso-8859-1?Q?/I2lnGvUH3LYTyYU6twnBavZMekIcubjxF15h3cXV+m0XnTQ9wTGMBl6oA?=
 =?iso-8859-1?Q?gVPXWGUDFLkUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?btMU43Oxs66zfZMwG2iwi2p+IkmnU6jGaOvUESrQjnjIs7Dkw/ISl6fVMW?=
 =?iso-8859-1?Q?q0K4FPVPQZmYZY1LvNPUOyC+0R50MxF+8Y8QmU5v2/ohYPxhgp+s7PG2YB?=
 =?iso-8859-1?Q?GrCeHHg2GZslMJUQ+awwpDDYuodkMb9qNyfYhhvD/vyOq/se6HrTJEwyJQ?=
 =?iso-8859-1?Q?PN+Va4UASE74uXGARABQKwrzv4RMHgdu7PXFCKzDksrYF0WKWlOxaMkfpe?=
 =?iso-8859-1?Q?bHnzreCZrS5w15z6VeTWesAhQeAm9NFyD0rfIqL6LAf5UqbDs6zFCh2yVE?=
 =?iso-8859-1?Q?AFEIciJzKOxYYVi5Yn12qd0sM10peQBRNcXw1xUF4A5UatuCP5uAQULL53?=
 =?iso-8859-1?Q?oJI7IZG15cLsunAVBjCuva2Mwng8Hke0OCi4rovkSUAFTGyj2DTp4tAz4Q?=
 =?iso-8859-1?Q?PiNpvcciTSs+EvTaom5t84yeEzqIYXu2AQp1PQghZOzQzaq8bAZWN2oOPC?=
 =?iso-8859-1?Q?wVKj9SRWHUxeLmJKBaGBPGp8/72wEahrvDsYLkbVaVwInCRT3T1KSzzfWa?=
 =?iso-8859-1?Q?YFyXZnjVodT2PvD32OROn8DCJvZ2eo4gWdhsDj8JvYjhwrlxQQqcHm3Pjp?=
 =?iso-8859-1?Q?RCIXO8cz8aGt8b+yDH9oI7Dwq+FhYCbII0s0Vij4gPxnnvLcZ4/J2b1K+o?=
 =?iso-8859-1?Q?Z40oCyHjrSwfMIqutWF8QKlBpmkkQL/nIJCE/qn4WmjxZg/nPsROZ7OAXL?=
 =?iso-8859-1?Q?psF9BJypVHo37AVFIIgoheOcjwtwd0Nw22+PQYdJ9OzZkaaJ+1LpLeKxmd?=
 =?iso-8859-1?Q?n9V2vyX80PKhDu1wjqbGDU7TCFOmlC7/RQ6uB5jQI5jIJQ+Ga8tLzqQFPH?=
 =?iso-8859-1?Q?mx6kFm1TIGuJofXJtM17OzLCCynrP700OAKVfrvxWvSvS0/4MYxHiE8K4Q?=
 =?iso-8859-1?Q?luZY3N1OQxtwWmttzBBsrXLQS1mR3NiawTQ3ceGL1K3mvUJbvgArBe4Bte?=
 =?iso-8859-1?Q?A1o2tcTxtVVzHqZF7vKG7U7jMjryP8e3tHX8JOdCFVtBoRbdds5U68nD5w?=
 =?iso-8859-1?Q?1bv9y8ZYULe18692R12csM0K/GHuJUoiewA05pqkAwgkI7TpnmsBRo5dgs?=
 =?iso-8859-1?Q?LVFQ/1alQBEt1NWcro4DYufpgA2nUQLOA3I8HuzlzLFFvlqUBsDV7rw1ub?=
 =?iso-8859-1?Q?yRi2DMzC5jg0V2J7Q95LEusMk9yBrnYN9aTBzcNSXSFCXwgRp4cQ147HMk?=
 =?iso-8859-1?Q?u5NWbsfKmZRsM/XZ/acgbjVzXrIC95EjzzWv05hluuUegr+A9COoZPva2z?=
 =?iso-8859-1?Q?KnQWahIJuNuWaaxSgTiPhK4ANwePS0LkRuFPngQkVF0Sy1BQ3YYT9uFUOO?=
 =?iso-8859-1?Q?K/e9PWeLicRLV0zGCPGU8HmipEH5WTX1Ld+P9OZb1pU/d2+ZotxBYzWw7I?=
 =?iso-8859-1?Q?XyHYEuvjBrk9CJwXx8INGioKK5tDCumqbNaPEvFkazjj7SCcQHRJzcBtJv?=
 =?iso-8859-1?Q?+Bhfyh2dioIicrZ9ymNFSlF7o62FPMqGhB3PxjOSRZa7lJaeeS3edr3qNV?=
 =?iso-8859-1?Q?E1f0qSFOHsAeSuAmSCJtl8m7ceqamNO2EmHyLKu6x8cDAJdImuSxPKFYFG?=
 =?iso-8859-1?Q?1KcTxjYkH8xMI1JDIWmYjT1Bf45mtSzeRiAp/nkcHaTKRWCLQZUijCg2q+?=
 =?iso-8859-1?Q?vZ8NaV2TT0ZMbXJ16bFt7oxLNhcuCPiKmlHc61MPS+6IXy+BmlMKyNMqIl?=
 =?iso-8859-1?Q?uRCfQEQwXi7/vHqHOSOea0BDvkLY6ZBtepisB6uSYpaa0UQyw37sDdNAlK?=
 =?iso-8859-1?Q?QeOc/zfTA6QSyHVi4K2AhNpHh39iuFr+TV9y6TYzVcmeFIOxfs3/+xKVx+?=
 =?iso-8859-1?Q?ljqNKPyFezPUdkhK+wTwE8iqkHz5hkU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c22738-8460-4b5c-e7ad-08de7047669b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:15:10.1575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABsF4U8mCcH+xN9+nIOYQd8bnXR5EbGQLQCgwfsrddzJZ7XzgE/WRtusF3619p0FyyF1ySaRclNSayb1/JjHlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8783
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,lankhorst.se:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email,lstrano-desk.jf.intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8EC8B164E85
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 05:55:21AM +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using kmalloc()
> and searches for a suitable hole in the sub-allocator for the requested
> size. If SA allocation is done by holding sub-allocator mutex, this design
> can lead to reclaim safety issues.
> 
> By splitting the kmalloc() step outside of the critical section, we allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring that
> the initialization step that holds reclaim-tainted locks (sub-allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated memory.
> 
> This separation prevents potential deadlocks where memory reclaim could
> attempt to acquire locks that are already held during the sub-allocator
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> ---
> V7 -> V8:
> - Add missing sa->manager=NULL in the error flow in drm_suballoc_insert()
> (Matt)
> 
> V6 -> V7:
> - Dropped R-B to review again with the new changes.
> - Dropped drm_suballoc_release() which was introduced in this patch.
> (Maarten).
> 
> V5 -> V6:
> - Renamed drm_suballoc_init() to drm_suballoc_insert() (Maarten).
> 
> V4 -> V5:
> - None.
> 
> V3 -> V4:
> - None.
> 
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas & Christian).
> 
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
>  drivers/gpu/drm/drm_suballoc.c | 106 ++++++++++++++++++++++++++-------
>  include/drm/drm_suballoc.h     |   6 ++
>  2 files changed, 92 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..dc9bef3c0419 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -293,45 +293,66 @@ static bool drm_suballoc_next_hole(struct drm_suballoc_manager *sa_manager,
>  }
>  
>  /**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended usage is
> + * allocate memory for suballoc object outside of a reclaim tainted context
> + * and then be initialized at a later time in a reclaim tainted context.
> + *
> + * @drm_suballoc_free() should be used to release the memory if returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa = kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	sa->manager = NULL;
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
>   * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
>   * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> - *       the argument is provided for suballocations from reclaim context or
> - *       where the caller wants to avoid pipelining rather than wait for
> - *       reclaim.
>   * @intr: Whether to perform waits interruptible. This should typically
>   *        always be true, unless the caller needs to propagate a
>   *        non-interruptible context from above layers.
>   * @align: Alignment. Must not exceed the default manager alignment.
>   *         If @align is zero, then the manager alignment is used.
>   *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of size @size,
> + * which will be rounded up to the alignment specified in specified in
> + * drm_suballoc_manager_init().
>   *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
>   */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size,
> +			bool intr, size_t align)
>  {
>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>  	unsigned int count;
>  	int i, r;
> -	struct drm_suballoc *sa;
>  
>  	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
>  
>  	if (!align)
>  		align = sa_manager->align;
>  
> -	sa = kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
>  	sa->manager = sa_manager;
>  	sa->fence = NULL;
>  	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +369,7 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>  						   size, align)) {
>  				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
>  			}
>  
>  			/* see if we can skip over some allocations */
> @@ -385,8 +406,48 @@ drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  	} while (!r);
>  
>  	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	sa->manager = NULL;
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_insert);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
> + *       the argument is provided for suballocations from reclaim context or
> + *       where the caller wants to avoid pipelining rather than wait for
> + *       reclaim.
> + * @intr: Whether to perform waits interruptible. This should typically
> + *        always be true, unless the caller needs to propagate a
> + *        non-interruptible context from above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *         If @align is zero, then the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa = drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err = drm_suballoc_insert(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_free(sa, NULL);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
>  }
>  EXPORT_SYMBOL(drm_suballoc_new);
>  
> @@ -405,6 +466,11 @@ void drm_suballoc_free(struct drm_suballoc *suballoc,
>  	if (!suballoc)
>  		return;
>  
> +	if (!suballoc->manager) {
> +		kfree(suballoc);
> +		return;
> +	}
> +
>  	sa_manager = suballoc->manager;
>  
>  	spin_lock(&sa_manager->wq.lock);
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..29befdda35d2 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,12 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +int drm_suballoc_insert(struct drm_suballoc_manager *sa_manager,
> +			struct drm_suballoc *sa, size_t size, bool intr,
> +			size_t align);
> +
>  struct drm_suballoc *
>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t size,
>  		 gfp_t gfp, bool intr, size_t align);
> -- 
> 2.43.0
> 
