Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4087EC122CC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 01:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39F810E0D9;
	Tue, 28 Oct 2025 00:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP/8jY/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB1C10E009;
 Tue, 28 Oct 2025 00:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761611709; x=1793147709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ncTHMO5ZuR8I22nJOcGkijgDRktytS9v5phAFl8g4KU=;
 b=mP/8jY/kVyu2owXuNbCLnNqWg1uPe7HTcVCDEMZArLtP6LG2Y3o83nMz
 18l2FrZUlv1i9XDWiTnufZrvKDoF8QgKxvtpx8EeBRvOAcnEOkI6kXUAb
 QiXW2YwT1H80Gbh91jH10vyVES7fizn/Foi9fxv8dikzvETTSTPe1i9up
 3U1lHewMSAtCn2QE7N127jNpIt3hFHnmbwnpCSdh9qcZzDzXYEJRoeQyQ
 FbdvsMEf3alrRihp3qjTc+1oO/OHtJvq+eqLqB/mrhac9qREfp9IH30XR
 l9nEmQh5t8HwEUc/qY5t8jDkVMlogvsIOzTXffPpMz3GyxyKSwQwRPir1 Q==;
X-CSE-ConnectionGUID: UU2OVrcNSvan7mqM0EN38A==
X-CSE-MsgGUID: 37LZl7FhRBabCT1AwGywDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74378849"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="74378849"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:35:08 -0700
X-CSE-ConnectionGUID: qOd5P9SMSiK7hJnOET1flg==
X-CSE-MsgGUID: K0ZJBUxuRW67vpHNKC5hKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184823032"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 17:35:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:35:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 17:35:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB2zaJ91kDjJLmfT9kkxFsLE2+0qdjsmf9xuGdcY5UQYffgwPBX+7yEwo+bTcFTMNe7lSwpG2Cn3XqY+3zjo68BUWIP7qHwRZMbh+HnvgdziReg6ko/DoGk26l1HEx1xz513m48LmrpoF+/XzOAsAk55sE3YmzLzNBMBVb1P8jqd2RUZR9jC54Gvl0x0yJTw7p/zx/6oDyK0Q/8wYZwvC7Yjyf1K5H2e7xGZMl7n4uyapOVrjsgtgfU1vE945qL1vIzn/1LJda7eq3fL1C1Dn0Duu4jn/3pzYcqpscu7jpV2m4ZrRbIYrKMFS4c5fkbTB+LGrClmNqEdV/EuUAOACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFO1ZJCy86dai61M7pV+/ihaqe34ogq+QUTant6HaiE=;
 b=uEXUv5OEzAvTPl0LVEYqKY90zejVEzNp9E6SLwB+qZacrATXMR2whRBOQyuWGAyIZkYKbtHl7jJ2HS2K9sP/cWZTYJMeMXCl8hMwbY2Wjp9/1Nkyfe4fJRhDYIBohNVXsf+cdd5ZfejoPwrOCoDoFFz8y3EET1a4Gkka9ifLj+5naLNDfdiNnzkwVg+pLlZHBKgM+/8kaInmuQ3hgSi65yWLs6B6AL0CkiGnKZTawM5S88t2YpbLuO5BjyRgRUxvr/OxGfHOooR/MLLG5xU7uZQRE8fy1HdSq+3v7hKXrpHe4gBAXu8vhuDkWWEusKj4f60G//yM35nUijgcOq3RUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9374.namprd11.prod.outlook.com (2603:10b6:208:581::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 00:35:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 00:35:04 +0000
Date: Mon, 27 Oct 2025 17:35:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Pass a drm_pagemap pointer around with the
 memory advise attributes
Message-ID: <aQAPtTOfcIinj4DF@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0354.namprd04.prod.outlook.com
 (2603:10b6:303:8a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b09be55-11c6-4018-2d1a-08de15b9d69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9Rd7oUayz/d1JkioyCm0Z2a0nTI0yguvX9Dd/4oTW7aEyhi5s4dYKYCw6G?=
 =?iso-8859-1?Q?r5I2LbI33TfGIVwVUiZHinlRvCROZGMpCRZS9gWVD0gYUdLAOXT2HYCrjJ?=
 =?iso-8859-1?Q?5q1Udb3NgdBA/oeOg54qD5PZTG+kc8ZcfLtdI3Nya9cnnti13NnYfDyJ9o?=
 =?iso-8859-1?Q?7Z/0UDRzEeyVbpbWs7oxgFlsNpy6UaUDCSKIOlAJAZpuowwlo2Y7iqYfeY?=
 =?iso-8859-1?Q?HFnX7jU43D+axZAjg40LQyjY9bFMSfmbJH/8AmB54tb9XTpr5xmHdK3s5+?=
 =?iso-8859-1?Q?XFo5iOvEHPvXlfvWSr2QvKgGt8zLx7VcDXyoRovWiad88gdaigPMo/jJSh?=
 =?iso-8859-1?Q?taAD8bVMnTdb8LLsC07Vil7SfkkS9SyK5vQnrYmdz7xJin5RlsQ0EESL/d?=
 =?iso-8859-1?Q?w2iok20dK9AsEq54bamB3uGUU3zCcC6Xc/2JLsFvfsGSlt9x8fM9DxAUDd?=
 =?iso-8859-1?Q?VrXCdw/L3czTZkXBRaLXLv7D0tKYSoIkoooFpOwpgcgMM6XuG+rdWoVSnt?=
 =?iso-8859-1?Q?51U48IzglkCTrb6zLvavEIxFzW3D2Zb4xHze6Mu9EXQxaibldm0WLKEexS?=
 =?iso-8859-1?Q?BncFIKKTgrHfs99pZCuipNgbAS5QhhYwhd6rIkpOJd1ucWxNdqKyJ3deMf?=
 =?iso-8859-1?Q?3kG6qCq4n2qjP4TKSMjUQtIe//0kS6id7JcYMj0jhThho1p3ldD26sFNMB?=
 =?iso-8859-1?Q?ofZyd6cdszad/AOOsGw8I38fhfQa45zFBhfUd6g8hsJx/4xJT25uXtb9S7?=
 =?iso-8859-1?Q?lOspLjvocCPW+iz1fVkhNDEeSssm09scd3nxo+X3MANvJ8a8deQ0d5VFK2?=
 =?iso-8859-1?Q?0mkzcFHsPPD7xNmu3BUM3p9adwvTg0zBSBFtSknLSo1U+JvkICzVjuQsIg?=
 =?iso-8859-1?Q?DxjFHho/lEIV6cWzspccb/kzs6SKqS8P3IJm1U/ZkcMp5lu4DXr2bRtc6v?=
 =?iso-8859-1?Q?2jDBuZF9Mwmw/NH1YFPUOlVn8xDpclkqWaSxeKm92VYSUBcw03FJpdR/qu?=
 =?iso-8859-1?Q?oa0TeZNoS54KtSqxKmWhfvBxQ65kCk2/tTZWzXakTPKq38pscnhnO0miJA?=
 =?iso-8859-1?Q?WwYe246nQw0uI+bzi7B/jOQW+8h6L5hT8JXbzDCvXT9v0ul/rAgK+IJXSW?=
 =?iso-8859-1?Q?wHoNvwX6kt5f89v01VC91ZMcvoC7QxEca/5idBM8bBedBQSNyBnrvX9ouC?=
 =?iso-8859-1?Q?7/1eVRkLjgFqRwlz32O0xa1rMI8PeSzrR4oMid4OKs14iL9r+vjIhEgwFA?=
 =?iso-8859-1?Q?4X621xEK8xeJrJPJbo2D5Fl0YhwAbD4xFD9Gmyyffw+qBRFZxvGEkw4+pn?=
 =?iso-8859-1?Q?37Uuo2H7Yyd/CzMkSuOTlPusVCYyuQ80mIGUPU4MP18ItchhLf0J1ggoGE?=
 =?iso-8859-1?Q?BcbJ6KrmSqxCZYhs9YtAMGo1ZSX4JCzurASE7zvgfcQnhuW4KWb+UkYn8c?=
 =?iso-8859-1?Q?gYjMtjXAE/b7dMvcNnbEzB1JGKjlVGzihK3tilKtzd8InPJ3RNTTyhUVh7?=
 =?iso-8859-1?Q?Di7Ho7ir8EhVBo+ZLdZAxf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nQMUC/obVGJb0TVYsncVJHD3PA2ESnyLq0bEsUI3WNkQOaDU/8xJby9xGj?=
 =?iso-8859-1?Q?CrC8aTwErWNqUZBAvggd7E+Gn2h1BIFLNzsXp2X3PC48Q2xA1I49LJgckR?=
 =?iso-8859-1?Q?LWwaLFyZ4+7aO2TM6qwmj+RbR65vpSTkdaF58bVAfeNvTK0uGdZ89tacTM?=
 =?iso-8859-1?Q?pSYD2rQ35kpbkSvxMRwY29mEcAo5zIE8NJer0ocIihXUYsHp2e+N96oY8E?=
 =?iso-8859-1?Q?RUAAvr8Qs+nlT7xLXkaZEUh1GoLfgtTQYZl4RqQ9vOa9zmdp4gSYluzsmG?=
 =?iso-8859-1?Q?NWeqZ9AIe11IDAtkCBwH6wpkHJKjjnI7xWLOd1Zrzn94vzYwiQ1pqbxaHN?=
 =?iso-8859-1?Q?1Ab/JFRdojaHv7jjOqw4YDafc0hF33WynvE+bRh44+sJz6NtBnosmV+lSv?=
 =?iso-8859-1?Q?7KdvG8LiKC6b+3cxQG6irPZTIse0rOSaa70dvzhoyWXMh1xlwiNHZ6JDUI?=
 =?iso-8859-1?Q?RG86QJ1iBLIdVd7IanMA+fhG+XuoPth09UYZlRv+PRG57nVt+c78ujXW0k?=
 =?iso-8859-1?Q?EmcdlJzYppWvoNx0+0lxvgmd994QCM5y2yFrtuEuMLLSfzKfvfGmepdzar?=
 =?iso-8859-1?Q?AoBS6uo1sWoFz4S/sGm6KPoYrPpcuk4LUumcbqQCK0b2j6l8D+srFyt72Z?=
 =?iso-8859-1?Q?SssdcyabjWj2I3tJ+GEa6yjvRJr3G3ERBNi2bgAoLeSAO+WLXwG5VyNzxK?=
 =?iso-8859-1?Q?dhz7+dcVJt9BPFVqSAKrQsPObiC/qI1TE90St10QeeOn9zM0PJehzDgEcy?=
 =?iso-8859-1?Q?xFzZUsF4IN5iapNRwV8GgPyzftYHf3hOXdD0QmcpQ3UenNZNDYNQQ7bDF7?=
 =?iso-8859-1?Q?uGVcg7Jz/NuxW5cGAVQ/lPO9E12m9px5rf/Yhcx5glOIs7DopTXvCnIDPQ?=
 =?iso-8859-1?Q?MCL9HCwXYNoizVLqDVYgRBt/p6AgKkgzQQoGVdnMX4km1nbo0+Y1ARSnf3?=
 =?iso-8859-1?Q?O7pUR2T8TB17Mb2Vd79kIlFgNT57DxrY2RghduceVxzIH8Z/1hiAxnwp2W?=
 =?iso-8859-1?Q?yQ/cr249zs9UqfQBRR+FlNxq/tp1quG6KWFKpQOoJmy3D6FNQCJ3Z7jDA5?=
 =?iso-8859-1?Q?4p5Ub78l6a7EBTDAPw6/N61B0F3m/otBdqeNfRqkJ0neI/nsLPNgv4S3V6?=
 =?iso-8859-1?Q?fuVmKLiKU36DUwpAegYv+oFywOGH2rfpL40/qr2C7viPGNirNIkHs9Ihy+?=
 =?iso-8859-1?Q?G+G1IvPrM0t/66xRXqPcG618QP41wV0x1Uu2fq/TOn4vZFptIY8O6QMKO8?=
 =?iso-8859-1?Q?hBPN041Xk1fOECsXdFBXT0K/SpndstlmZSiks//hNfbZa96JQ/0BnFW6lb?=
 =?iso-8859-1?Q?Eo6pyMHBH89WngUdyfZMB6EaUGzMjI3rgMlK7hrQmStTIFW5dFYRPwR/Ts?=
 =?iso-8859-1?Q?rsYfsVjjQdk+SPoyFFf6vkYQPZuZwMLDcBRIWejxQKFmhDb9eOh6jiN+VN?=
 =?iso-8859-1?Q?H6TcfE73Dt+WkEmBGUm4ZdymimNFHa6Mw5OWAVwc3ty/stfIvfFgYfoPk1?=
 =?iso-8859-1?Q?hC3msPB43X2GgsZc6gvt5BcSyJhhDljff16/QPElGV99341dZF4DKnmi5x?=
 =?iso-8859-1?Q?Zh5R2ITtVB1zcmwwyjBknjfU7SFXl93CK/JCMNitiJh9RMPopO7cFS9DaZ?=
 =?iso-8859-1?Q?S0ctJP2qcMS5qwSguL+4y0KGSxlBLHv7jbz7Xlz5ZzaicDEgzdHYHn2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b09be55-11c6-4018-2d1a-08de15b9d69f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 00:35:04.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPMDDBjcpmxk9uHqaYLPSv9NJ8ZlZ8JrV5slvF2KaYa3Fe7sKzSMyQI9e3bgbkV9sm5OrbRhzosIZ8s9Q4bwIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9374
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

On Sat, Oct 25, 2025 at 02:04:06PM +0200, Thomas Hellström wrote:
> As a consequence, struct xe_vma_mem_attr() can't simply be assigned
> or freed without taking the reference count of individual members
> into account. Also add helpers to do that.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 36 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h         |  1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  1 +
>  drivers/gpu/drm/xe/xe_vm_types.h   |  9 ++++++++
>  5 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d27e366f8e14..d27cedeaf70c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -330,7 +330,7 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>  	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>  		default_attr.pat_index = vma->attr.default_pat_index;
>  		default_attr.default_pat_index  = vma->attr.default_pat_index;
> -		vma->attr = default_attr;
> +		xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>  	} else {
>  		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>  		       range_start, range_end);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1dffcd9ab61b..3c3dc1b1ace9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -964,6 +964,27 @@ static void xe_vma_free(struct xe_vma *vma)
>  		kfree(vma);
>  }
>  
> +static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
> +{
> +	drm_pagemap_put(attr->preferred_loc.dpagemap);
> +}
> +
> +/**
> + * xe_vma_mem_attr_copy() - copy an xe_vma_mem_attr structure.
> + * @to: Destination.
> + * @from: Source.
> + *
> + * Copies an xe_vma_mem_attr structure taking care to get reference
> + * counting of individual members right.
> + */
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from)
> +{
> +	xe_vma_mem_attr_fini(to);
> +	*to = *from;
> +	if (to->preferred_loc.dpagemap)
> +		drm_pagemap_get(to->preferred_loc.dpagemap);
> +}
> +
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
> @@ -1014,8 +1035,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->attr = *attr;
> -
> +	xe_vma_mem_attr_copy(&vma->attr, attr);
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
>  
> @@ -1023,6 +1043,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>  		if (IS_ERR(vm_bo)) {
> +			xe_vma_mem_attr_fini(&vma->attr);
>  			xe_vma_free(vma);
>  			return ERR_CAST(vm_bo);
>  		}
> @@ -1042,6 +1063,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  			err = xe_userptr_setup(uvma, xe_vma_userptr(vma), size);
>  			if (err) {
> +				xe_vma_mem_attr_fini(&vma->attr);
>  				xe_vma_free(vma);
>  				return ERR_PTR(err);
>  			}
> @@ -1057,6 +1079,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
> +	xe_vma_mem_attr_fini(&vma->attr);
> +

Would it be cleaner to move xe_vma_mem_attr_fini to xe_vma_free?

Matt

>  	if (vma->ufence) {
>  		xe_sync_ufence_put(vma->ufence);
>  		vma->ufence = NULL;
> @@ -4221,7 +4245,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  	struct drm_gpuva_op *__op;
>  	unsigned int vma_flags = 0;
>  	bool remap_op = false;
> -	struct xe_vma_mem_attr tmp_attr;
> +	struct xe_vma_mem_attr tmp_attr = {};
>  	u16 default_pat;
>  	int err;
>  
> @@ -4314,7 +4338,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
>  			if (is_madvise)
> -				tmp_attr = vma->attr;
> +				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
>  
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> @@ -4324,12 +4348,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * copy them to new vma.
>  			 */
>  			if (is_madvise)
> -				vma->attr = tmp_attr;
> +				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
>  		}
>  	}
>  
>  	xe_vm_unlock(vm);
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	xe_vma_mem_attr_fini(&tmp_attr);
>  	return 0;
>  
>  unwind_ops:
> @@ -4387,3 +4412,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
>  
>  	return xe_vm_alloc_vma(vm, &map_req, false);
>  }
> +
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..d328d31afe8e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -411,4 +411,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..9553008409d1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -95,6 +95,7 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->attr.preferred_loc.migration_policy =
>  						op->preferred_mem_loc.migration_policy;
> +			vmas[i]->attr.preferred_loc.dpagemap = NULL;
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 4f9a6cdb5d02..70856d536047 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,8 @@
>  #include "xe_range_fence.h"
>  #include "xe_userptr.h"
>  
> +struct drm_pagemap;
> +
>  struct xe_bo;
>  struct xe_svm_range;
>  struct xe_sync_entry;
> @@ -65,6 +67,13 @@ struct xe_vma_mem_attr {
>  		 * closest device memory respectively.
>  		 */
>  		u32 devmem_fd;
> +		/**
> +		 * @preferred_loc.dpagemap: Reference-counted pointer to the drm_pagemap preferred
> +		 * for migration on a SVM page-fault. The pointer is protected by the
> +		 * vm lock, and is %NULL if @devmem_fd should be consulted for special
> +		 * values.
> +		 */
> +		struct drm_pagemap *dpagemap;
>  	} preferred_loc;
>  
>  	/**
> -- 
> 2.51.0
> 
