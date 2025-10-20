Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9ABF1E85
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9037710E461;
	Mon, 20 Oct 2025 14:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+09qelT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A63110E461;
 Mon, 20 Oct 2025 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760971582; x=1792507582;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8LzMrK/RZX/hLBR9TWdFn0YYGoltIdGK7mePkxDV1y8=;
 b=n+09qelT/V1jeSN1uU3RzCVxF9NNwGmoVjoBfaX5rt5Jfp7KwVK1MA2d
 9/fKDrkdCB4Q6y7cuEHKYcBa15Y/A+8nGUsUSKr0gU6D9iy3zTxJLxOy5
 +NXoFio34CKCcHaHhQ4NEb+6ETgcU9y0b5BWkh3KhXy1YWR1Ci5c04m1t
 1N4SX4gW/ZPPTx+NpOzAntgakAA8GiqG5zGN+d1dYKNT5GC0sWLzOrL3L
 bRCpM4Nf+9ZqJ9T0QwHxXNb7HaP0G+Maky1fUwzQ9CvDhPRPa75AJk72D
 9LPsCG7/XCJArpwv3bh8dJuKRuVRYRkWdgY1Pzlj0s9gGTvC2wcnWZCIJ w==;
X-CSE-ConnectionGUID: d2M9datuT6uyUARBxXg9Lg==
X-CSE-MsgGUID: xCDDMarrThyFKRUS1GklkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62295016"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62295016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:46:21 -0700
X-CSE-ConnectionGUID: mvZYFqpWSTyhyeehQ3TJzw==
X-CSE-MsgGUID: 6SNYKRKkSbySpbxKQTghBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183361699"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:46:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:46:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:46:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBL5k5JkXauMZWVvErxW6qwIihGhoWoc/boFgKg1+ZLGNmEd7uqzrVyK5b+FN9tOu3aizQzLQBjeuJvpvwonvij0NKIOJa9YpJgjmevw1ZIzyBds9CcsAkNctEeJ2NPfDhmArtmOu/RxzMHgKlcYfTeP5w541G8h/bpauqlqRSt6He83BPzdcO42uGits6wRxp6ghqLl6MuSKH1coSWKQZ3gUkIILN0RrnJEXs19kmkgNZxw3erwfymQhh75AdsY7CJTVfuF11nE5bIC2Pm1BA+x03T+xlYeLF9IUHdgPj4GRvIWk45mwLoMLCm528+oxABx15TXfPE7ieUfSUuvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo3KNFdgwOoi5dF2qwyaTyoeAx0HfkKuprgfgk39E+c=;
 b=qsvZI//J24MHwUsWZEZWae2qUrqom1PkimtDpJC0PAPcnasHVX6l7kBGsI5hHz688eFujjH/8yr1UQ8wm8Bhy6bXvzPCfx1PWrpq6bM4T+W+hVRr+vB3vtcVSuq5DePGZxphn3PNc4EroM4FLxRqu4lvrqIwHYHVsryuSos+LYsBy54Cnpq4vJ33AmLpKP6jwO0Skm4J3ET83WWgjS9YLSD8Jx3ED7S96odpy3h9wJOjn6WBL4P99lxCXbcNgpsLsF5tvu2DJ9xmTIcn7kDkOpu3atpNcSPM1envvZ1IQC5pX/6G3H1OWyltHrDxNzeb9sJtDPU2dnPM8im0v3ZEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:46:15 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:46:15 +0000
Date: Mon, 20 Oct 2025 16:46:11 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 01/26] drm/xe/pf: Remove GuC version check for migration
 support
Message-ID: <kzrcinwordahjujlr2lzb3jpamfpgzozdqyxhd2fb6dcr3xoc6@h2ull7bqsnjp>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-2-michal.winiarski@intel.com>
 <8d7f5004-c38a-48d6-a469-f32e0ec805fe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d7f5004-c38a-48d6-a469-f32e0ec805fe@intel.com>
X-ClientProxiedBy: BE1P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f8ef55-28fe-434c-8a9f-08de0fe76bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUo3VmYrRkR3cWxsemVXVWFSZWlxQ0ZPeDZWaGlUa2RjdzFxeFNEeGFmV3Fk?=
 =?utf-8?B?QjBnaHV0cjYvMDltWFFwK0VaNlcrOXZQWmcwRXBabE8rY1hzT2p6WUo4RTlY?=
 =?utf-8?B?eVRQSysraEpCaUhwTVJnMWNrVjBUUkIxbm1wYTZkWkExMGxqTkIrbEduSTBk?=
 =?utf-8?B?Z2liZVpHR2lSVWZBeU1YM1QweERab2hpb1dIOVRoOFgwNkV2eHBRaDhHSHdk?=
 =?utf-8?B?Ti9mMUwrU2RqekNhUUdueUlsOVRsZzB2Vzh6K0tsQ3F3dVpoQTF1NEc5VnBL?=
 =?utf-8?B?b0grYUN4M2dqREY5NEl4YW1FR2NLTEYzSDlUY3VrUkdQNmZBSUtMYkxtdWli?=
 =?utf-8?B?NDNxSkpUaFhWU2N6TEVBVVgxU2FWejRhU004aFhtbll2OC9Hckg1YU41dC9E?=
 =?utf-8?B?TVZoNDdzZjViTjcvNnk0aFB0aEJhSUlvVHRTaWdNa3NjaDkxUm9Hcmx5UW5B?=
 =?utf-8?B?SncrVDBKbTVtQlluOXRjYUp3SUY4aVFmaWdOdmQ2OVdKRDA1dnZrS3dGWXNn?=
 =?utf-8?B?bGRNZ2t4ZTJnTDFqdmxEaXl3cThzaVNqTU05RE9QMTZRelpqanREMDdvTzVp?=
 =?utf-8?B?cXZ3R0hkKzNRd1BLS1BJNzVoR1NPWmMyWDcyTHUvaGJGMW4wdXh5ZUg2cEdZ?=
 =?utf-8?B?aFMvQlZwZzd6UDZwaEhOL0taallPb1lXODVHdG53bGZuaTZ2Ykdhdmp5c2pT?=
 =?utf-8?B?OWd3cTJ4a1k0YzBXV0lqMW9Sai9tUTdPallLZDV1SVk5YmV5ZGVRWU1YVkh6?=
 =?utf-8?B?aXo2OWprbjZLeEt5cVdMbDlDU1RKWi82SUNVVkJiUUlUTkxKWksrM3J5YUpJ?=
 =?utf-8?B?ZVFkb1B1Wm54MVBtcFZ1L2wzL2xIdFNCNFRJbzN3NmlKTUhFb0EraEhvSFdw?=
 =?utf-8?B?TnE4M2phN0V1S1hUOEVjVVZKU05HL1d5VHcrOG9MN1ROcm9uOGMyNlVWU0hD?=
 =?utf-8?B?N1JkQ1VBK3MzR25yR0w1LzJKR2pOR0JHVlgvZEJrTnB4cGJvNjJjTEQ1akht?=
 =?utf-8?B?Qk5qSVk3ZzI5L0RoU0FIZVMzNjRoelR2bG5vWkNaTFZVZHlCNUE2VWRHUkVP?=
 =?utf-8?B?T1J1SnRreHhnWXg0WVJGMnBsdTFXR1BhOFAyWVVVMndpZ0xXbGN2NTY5MjBr?=
 =?utf-8?B?WjQwbitOb2U3K3RkSCtoV25qZFhJelR2aXZLTW9kdVorOFc2TWtTOXFDM254?=
 =?utf-8?B?SU0vekRpYytOSHFIenk3STN3TXpDbVArSmtOMWhZNStDU1plTGFCMXAybDRw?=
 =?utf-8?B?V2VjL0FBdXJacy9YZU00anFURFRGZElTdE9Hck1ZbVN3OFRuTnVnMUt6dVVi?=
 =?utf-8?B?a0RXYTF1ZXIwVVhjTG95TGJBSUErWGZ5amNob0MwUmpDb2lYTnVLVWRUZ2k0?=
 =?utf-8?B?eWFuQ2F5SmZEMHFIUy9ta1RyY0dxMWJKRGhQNWlWbERJdkVFbjlxMHRPQlIw?=
 =?utf-8?B?MlZyYWtRVmJha25RVkNFYUlBVEtZMzNNcVU2YlZjSGMrMHcvY2VOSFNreUNT?=
 =?utf-8?B?cUlOVjBrN2gyeEV1Z0R3TWhZaTJiVHM5MW9BYnhWazdJb3YydTRkN05uWXUy?=
 =?utf-8?B?MVAvWWM3NDlGMEZvT3p5S2R6R29LbGxNQzJaQTk1VmtXWjNnVzZFVVhCUk9l?=
 =?utf-8?B?TVdzWlNTQytGc3lPRkZGOUpWaHJvR3EwZ0VwRm5hd1lvS2pXRksva1hKWlhi?=
 =?utf-8?B?a3pLQTFSUW1rUENzTmk5UVMyMG9NZElHTUM3RC9WcXlicW1ROEEzUjJ4elNh?=
 =?utf-8?B?TmJkWk9pdWYwSlEzUjFFQnJBMHhBQ21URFdBTFNTQ0k4UUdoclFXQ0F5U0No?=
 =?utf-8?B?bVFZNDVtckxURUFBdXhwaGtvaGp3Q3VSd1lnNFFaME1pbktBRExuK1NheW1U?=
 =?utf-8?B?QmliU0ltRlRtUjZZQ0xFYndneVk4ZjY0SlVzNVU1bGhZOWo5T3Y1dkZQY3dE?=
 =?utf-8?Q?Aa61bAsSdGN6+qeKnn8ZjL+aOTopgpuG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tEL3V1MzV1cTBBZVJ3T0dmdFNrS1FFWHBpQXg2emFNR0JsbWFtalo0MU91?=
 =?utf-8?B?WHk0U1RpazJxdzZ2MTBhVExtVHpTem1UM1dxMXFQcS90eWVKV0J6MDhweEgv?=
 =?utf-8?B?d2JxUTJOOXFBeEh0RXpTVTdpS3djeUVXOWRzbFRDYjdKRUtBR3VnVXJyKzZW?=
 =?utf-8?B?R0FScmJHQlJUcGFidFBuSHppOElpdHFDVXhwZkIwc2xrMTBYd2h1dzdEdXcv?=
 =?utf-8?B?THhpb2RqeEFuQWFJdFV4QzVZU2YxWmt3QUhrK29DUDdQOVBvNWh4TUpnQk1m?=
 =?utf-8?B?VkN1WjNLdXlMRjZ1d1ZGTm9sWHpYNEQ2MDFrK0NiT08valhvSXdPb0w3YmZN?=
 =?utf-8?B?Q0tSK3p3b0hUSWl5RXBOZjROZ1hxSlkweU0yckFnTWplYzJkanpyaUxLQ1lG?=
 =?utf-8?B?RWxlTWdTa0pRVjlLejNzU3UwVW1yTlRBUnZXN0pXSC8zbitRWngwcTZ6YzdP?=
 =?utf-8?B?TXhGOHI1MWZ0T1huWXQ0WHdNMEZtNVZ5dTV6a3VXOFNhUVkvdHphOEI2aS8r?=
 =?utf-8?B?akJXenUvMjUxVHhMT2VHTmZUcFJIVDUvTmg3Y1FabUVxdHVPUVJZSzJlQkh3?=
 =?utf-8?B?YnNCM2J6d3ErbkwrWlJVVFZ3bi9NUFJiZGdSSzR2WWNJdStHbzFOM0VNZlI5?=
 =?utf-8?B?b3lCRjZMaTZtM0Y3eVREZEhpOVd5bmZSbDV1Q3pjdlVvQVZxenJienpwVnda?=
 =?utf-8?B?VzJ4QWU5Z3lhdmxYWXJ5SXNRSGg3Yzc2aUY0Y2xwRGp6RjBTcTgrSEJNVmIy?=
 =?utf-8?B?WUpiR0xxWnIxaDlrVElpVlNHR0FtSGRNYTR1Q1BNY3NnNjZzR0NTUDVhejU0?=
 =?utf-8?B?b3o4L2FKMG45cWV0V2N5Vy9WR3E1dklkOU5hWEVxbW95N3RJdVp0YlRCQ1dM?=
 =?utf-8?B?djZ1TzdHcDZDZS90STk1bkVlMGVKV0RxSnNCaXcyTTVkZXlnL0IvU3FPaHBS?=
 =?utf-8?B?QVFVUm1neE9jMXl3YVRsSGhYSUZBMEFabnZiOFFRbE1mcHlUa3h4TmI2eG5E?=
 =?utf-8?B?cExaV1RlbThvMjg2TUg5THd4UnlmKzJDTnp1TFZocmpEZi9TYTVYMVRmYmZt?=
 =?utf-8?B?MzV1OWkxQWNzV0FZQW9MY2tKN1NMdkZwcGtUU09rd0lZOVoyMVRNajVLTlQz?=
 =?utf-8?B?YVhKaWc2RmlhT1NWakpsampWNkorUmtIZThOcjRxb0V4NkdwMy9xOVp1NUZX?=
 =?utf-8?B?aldGOEJuc1J3LzRPMWdEMHdBMFdTZGVaM1IvdmN2SmZvbUZjK1NYV3cwZE9n?=
 =?utf-8?B?ZDZyYzdVMHQwQlgzbW1qRzFDM1pXdXozeU0zZjJGQjNWNkJyWHRWbDA5SElC?=
 =?utf-8?B?MjRZV2NzSEhTR1VwVllQMWpRT1N0MXZaU0xtaGkvQVlXVkdwaUFQRm11WTBp?=
 =?utf-8?B?dng3RWVxU1V0RVduVTEwMDVkc01VWUlRNWFxOHduYThqTHhtdHVDMUd1SDhs?=
 =?utf-8?B?YkFmOGhpTHBXMkdlZ3hkYXdxTVQ5V0NkUmllelhXbm1sWjQxcktrUElxdHhj?=
 =?utf-8?B?a0g3eVpvQmVpNitON2s0WnQvN3lDbEFzaVp3T2xEMmhxYkxwaVROcVc0OHhl?=
 =?utf-8?B?OE1abGdwQkVBSFNBUFFYYW9pS2xYaFJRbzRhOE4rK1o1VU52V2dJakEvMDk0?=
 =?utf-8?B?YkxmcnF2bzB2STRTOHdKZ0NRTFdNRFlQWVpzbXZ5d2sxdU05d3Rna0M2c3lu?=
 =?utf-8?B?TWF4eUxIRUtXV205NC9zeC9Mdm9KLzh3UkZCUEZSR1hxcXhkNk5KSmY2cmIv?=
 =?utf-8?B?dFlQL2RiU1o0QUZKSWxNWjJ6SldZdUxRTjhMcEMrNFdIcEJJSVhlYWdDekxx?=
 =?utf-8?B?TE1USFNPanovNWRtM05vcUs5WCtDakJRU1h4Um1hc1pDdTlYdnRzVHZMTUw3?=
 =?utf-8?B?WkpZVUY0L1NHVHQ0QkVmWlREOVpQMTdydHV4N0ZvUHBWMEZYK1lYNXRBTU5M?=
 =?utf-8?B?TlFFNTIwQmZ0SHBiUVYraGdZRlVIVDg3ZUlxaE1jZk1nbk5NZDNjRHN3Ukk1?=
 =?utf-8?B?MG13S3pBTXAxLzFBOXBIVlhuMzY4aVd4M2ppR0N5YU1SNWFVTWdCb05paFpL?=
 =?utf-8?B?aFM2R2dyNUg3aGlQVHZUZjRPcXFWVWJKVElxcHJrRzJSeUdxZlJWVy9YWko5?=
 =?utf-8?B?Q2NmRmFkRWlZMVNVNGVrVUdnOU9yZWsyU2hlT3lrb25OYTFaVEZPYTl0TDZD?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f8ef55-28fe-434c-8a9f-08de0fe76bae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:46:15.5902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Adhey+O/0u3VJGTx0tnEtCqexvZUkXJ7dtHAN/ISJBJTfcDfIFpukHYyHd12a7SOo1ceo6rtFJFg6bk+PrrCPB92QeH/5o3kKcAmkJDowNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
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

On Sun, Oct 12, 2025 at 08:31:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
> > version to v70.29.2"), the minimum GuC version required by the driver
> > is v70.29.2, which should already include everything that we need for
> > migration.
> > Remove the version check.
> > 
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 44cc612b0a752..a5bf327ef8889 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  
> >  static bool pf_check_migration_support(struct xe_gt *gt)
> >  {
> > -	/* GuC 70.25 with save/restore v2 is required */
> > -	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
> > -
> 
> alternatively we can move this assert to guc_action_vf_save_restore()
> to double check we try that on older firmware, but either way,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Left it as is for now.

Thanks,
-Michał

> 
> >  	/* XXX: for now this is for feature enabling only */
> >  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> >  }
> 
