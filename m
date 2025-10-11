Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87401BCFBDE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983D210E35F;
	Sat, 11 Oct 2025 19:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFPOIrC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F57210E35D;
 Sat, 11 Oct 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211723; x=1791747723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hQk+YzeAXgIVWePvsrovQS81bNHNYgiQztVCfNG3zvE=;
 b=PFPOIrC+Evx/XbWqXF6+ZDPcC9ecJ5ldyKvGALziw1pKPxmBPyg+9UPs
 AHgOOntOuIOlk6vWfW1n44TOggzF5LPtX3NE4YoXZON2MoV9I4JqIGInA
 +Cow6ElOWwQOGyIYijPWF8z/6REODMGiAL2bjEsLyN+CzCcuhFBcjK5TP
 FoDspcnj85Rle8gCFxmvDlBVvEmkc2IzghEYrDhNbow0FcIkFIn3qkPtA
 Vinoz+bg8hGsC//iQ+ZqfY8nxbA76b2GDBjiUHwTSFY6dZV7i54S9mB7d
 8tpFZzNMSlx40cFo31VAE/L3N/HXCGyGPMoVD6LHdZP2jL9Amesn0A/al Q==;
X-CSE-ConnectionGUID: xympEMnvSFmvffnty9TZZQ==
X-CSE-MsgGUID: aJMeXSTETF+GOdF3pwL3TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62294829"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="62294829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:03 -0700
X-CSE-ConnectionGUID: C2ao+M8RQs2PFn+4owiK+w==
X-CSE-MsgGUID: mUvZT13xT5mx7fhRFB4oBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181252981"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:42:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHH9L7KboSuN3VbtY2Fm76frZtF6AN15QY2WiFq7VUU3q5YxDGWaxSFrju2IZ3GdEDnnJaTKqp8mwdN+ZedvHKl1LGXoMP1eaH8Y13xNnTtKlguIwnWvxfIA2bSjnE3iptmdT7IBtCmf21FghIk7c8KW1NQttaui4JZMacMw8sE1gjlkL1II/8CNSPEJhiMMlA9HqaF7dXxIBM2yLKSqTi3pmaVnQI3B/6xcsXrUlekFgyUf/IrM/8WFeSUJCoHf0SfNhKiiIqypvgVKIxIier6w7LkRF7Lj0BPx39qfEbM3Xb2bXJsBt7QhB8FjiU5oQRYp9cXjMGTXtrlP7+k1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05VQ4nH8xrkytD9Oc7a4HAYEtJptn6c+ekCpNSr5dDU=;
 b=cqK9ivYKEcXj4+Lit/tG2QXbQHx1qNMAI3suAMwQtBR5U7bjTFX6ZPfKSzcr+fIxE1kxMcTtfQ8ZlDydKXC7SVliRA88XTBJ1WbVZ9pkNTeSSPVHJsGLy9Su0Aau6wHaCa5p6L8t1Q1CkLR1wcGO8rSz6pFaNMpSMZdVtOXDxKPazROFXzJJbdphKNMh4dWIfiiMxGCpiNCKTIpGsYPn+GEimo/OqzVPB3c1iCpErYvYtFPLcqEfpX7B/ydhE7vNaCRTC/IR1mqo4lPnVg5Es3QLriZWvbC4WH5iuwnfcpRMGk3fhrGy034k4i/2e36dayAujZ9zatyk/juQb5lumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:41:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:58 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 23/26] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Sat, 11 Oct 2025 21:38:44 +0200
Message-ID: <20251011193847.1836454-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 38389e64-09d1-4f0a-06a1-08de08fe3d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVllVW9nOHM5aEptTjNsbzNoYTBLOTBacmJ4eEc5eVIxaEZRWjlIQllFcVFs?=
 =?utf-8?B?bnhyWU0vU3U4RXR3UmM5ZWVMSE5uTThOYXlhdUhQZDJFTDhPME5FMUJ3L3lu?=
 =?utf-8?B?WnZjSVBzbXZoaEltRDNJd1A1R1ZEVFVaTUtQTk5JU2ExcnBGckl2U1drYkEx?=
 =?utf-8?B?MnNiUGFnU1cvbXdQdndSWW5BenRtcHk5RGN6YnkyZUdKOTl6MDJrKzZRVDBE?=
 =?utf-8?B?SlZ1djR2K1BxYkttV09SemlCdlYzSXlMdXU5TVAxa010TmwrMHZTRnpQUkk4?=
 =?utf-8?B?eEhiTWR1aEFJMStXNXZyU24vYTlUcVJONnBheGhqN2ViVi91bG5vQk5LY2My?=
 =?utf-8?B?Wjl4dDNoVElxV3RaRi9kQkRaNEZmZTRSb2UrZ1Q4c2RUUm93WDY2MWhyanVR?=
 =?utf-8?B?WXBNRGlkbGlZdldqZzVRb1pleGVLREpyTEpnb2NKOVBVMlRqbWxPSXNDZ3dY?=
 =?utf-8?B?RXN1dUJPTjI1QWdKU2gxVzVDNk91V3Exa1d5V0ZmSE9WUFV2d0l0NmFIbUtp?=
 =?utf-8?B?cytsbjZncWNmY2NtakhPOEdpcFc0anZaNkowVmhnZ0hDdWdvTzFDSUN2UFps?=
 =?utf-8?B?alRRSVY5dG5sMXp3aXZKU3ZFWGhqRXA1bFYxelFlSVZ0SVczeFZDQzNiNEE2?=
 =?utf-8?B?SjR2RG1IWGFlUk5xUHRUM0JuSDY2ZDRkSHo2SjhXMU1UYWN6UThuQkVGSVVT?=
 =?utf-8?B?UlZLS1ByRHU2NTlpeDJxMHlKTzJWSHN0UVB3VHdLcUtDVGVtOWZrK2prQTdV?=
 =?utf-8?B?UHI5a3NhTXM3NW1wRDQ1bzZ3SE04WjNXWHk4bG9qeFRudTc0SHp0YlVQOG1Q?=
 =?utf-8?B?YjBWSTllckJSSUkzWmJmRUYwSEtvQjBGTEgrQk9KenhsVk5jZHFCTlZWblhz?=
 =?utf-8?B?WTQ1Qnlmb0ZDclRkVjQydFhZbGM5L3NXb2FZeVVUb1JUWDNjYUdCSFJuRGx2?=
 =?utf-8?B?QjJYbDVOQk5sdlB4TmxHMW0wd2MzRnM1ejJIbk9rVFhUaW1WZnRkYkZEenhh?=
 =?utf-8?B?NjZ5MXRsb2NCWVVlVUl0amdMUmY0bFJyNnhYMzNMRVlkTWFhQWVtb0VzOEp5?=
 =?utf-8?B?ejF4NnZvZHlHTWV0TXFLY3U1Yzd4a1BUekFmZjNOeWpmN0NRS2xtdzdjYmlG?=
 =?utf-8?B?OHdpbFdHSlJlNTUvckxUck9JeHJ1anBmaWtGWjJGK0UwKzNvbVhkTXpURGRW?=
 =?utf-8?B?SEY2Nkk0WEJWdEpvZ0FiUTVadFpsUGtKWmlYK1N1a3l5UEwvVEtWMUQySng1?=
 =?utf-8?B?NC9XejFXcUNZbFF3ZVFvNzVIZEVSbnljZHpiN1QzL1lkaTJZUHUxa3NRL25x?=
 =?utf-8?B?YXZNVzkzQnlpdjRmVkxPMGpHS1hUU013TE5BTFRGOTZzM1l1R1VkV3VpOUY3?=
 =?utf-8?B?MnJKWEhnckdKV3JWUjhHREZkQk0zVFdoWkNXcmZPTngvM2dRNnFwY0Fxa21B?=
 =?utf-8?B?ZDkvU2Y4U1FYbHVnN01jbDEwMWdFU3g5Y0Vqem9QTy9zb3hGMEk4Y1djZUtw?=
 =?utf-8?B?dVdTaUNjQlZGZTYwbCtVTk81R1AwWHRrM25nMWlFR01sUWpjLzJBaUZqSzZs?=
 =?utf-8?B?a2tZcU9ORFV0NVBsbEJaUHFOQXYyRnRVTUQvbEsvRG85eFVHMERLbDNmNWZ5?=
 =?utf-8?B?eHR5dTgyN2E0NS9LWjFiZkEzYlVFeFF0MXJLZlhodGNIeWVMa2tsZ2xkaFRv?=
 =?utf-8?B?RXBlN0thbDMrVERXYTRQMHJ3aDdPQ0hYTzRxWkNueE03eUdlM0Zkc1R5bnJC?=
 =?utf-8?B?a1IyY1dueXB6TUxpUjlGc2dad1A4S0lJbUlwSURWcUVWbHNxWXN2dnJHWTl2?=
 =?utf-8?B?ODhZVVo1V2o5QkdPVDNTRlFLN2ZxZnJJc1BIZlc1N0tMcVVmdlQ5NDliaXZN?=
 =?utf-8?B?cDNPWG1Cemk5VUpWNG50b1hwVDB3NzVnWTZZSUhxNDBpVkpOelJadmJFMFE5?=
 =?utf-8?B?bVptMlFIUE0xeXNrTjdzcTdNR1FtTnBZLzFzc3RBNDVGdnJDZ3ZUNHU3SWZF?=
 =?utf-8?Q?QoZUZOnzN4Ew6XEHzifFPcKrHmSHXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWVMZDNzUXhWa1VrUVlNOVdGU2lYNDJCdEFnU1RaQlgvZElzbUZQbDdrZ2FJ?=
 =?utf-8?B?OFlXLytoTmI0ejBaSkQwTnFYR2Y5dmRERzJPWlNBSldIOVBZbVNqR0FWeFZv?=
 =?utf-8?B?a080UzZzVmNOek5sM1I0WXNqMktPc29zZERtUll5Um5oNFh5dVFCNXd5b25K?=
 =?utf-8?B?dUFUSEE1SEQzOVNsUkNLa1NiZFNTNEpWeHJ6cFFXc0IyWVNCa3RVRDdYK2Rm?=
 =?utf-8?B?TE14bVQ5L1oyemJBZ21jd3hnOEExMktGRE5US0dLYjV0NlNnWkVuNmNOUmVC?=
 =?utf-8?B?THhlUTVENk1Rd3NkajhPMEE3QWRJellkRWJhZHQ3VFArRXlvTTAwUGhpYU8v?=
 =?utf-8?B?bGpDUG8wcmgyVVFKWU1CaUh2ajlQQy9DODFKbkE3aUxCdTZNM3ZFd2w3cmFn?=
 =?utf-8?B?MUVObVUrdStpZ0VyZUd0RSthdzlSVkcxaGlJaXYyTS9UcXhQVU4zNzJEZ21o?=
 =?utf-8?B?T2JPbHR5dnM0ZkUvQ3QwZ25HaDU1bTRvZEorZ0dtaEFVUm5oWGdGVS9ybGlX?=
 =?utf-8?B?UUVCSzlqSlFNam9xUGpNa1NJdHZocXRKVU1qWHNHVGNCSGYwTy9KVFEvMUp0?=
 =?utf-8?B?ZnNlOHpOUlpPKzRJckp1Z0Izbk5CSGF2ZUNoenFnS2krNUVTaGpobGFHdnZQ?=
 =?utf-8?B?R0JmcVlMTENKZXF0OTIxZlBqUzc0UG0ycVZSQm5VbHMzSGxqdFlCellaSlpl?=
 =?utf-8?B?U3FSdWRNZGNhUm1oejAxa2REeS9SM2tQaHRwRVlIYzYzbWJmT3hyWUJieFk5?=
 =?utf-8?B?RkF4ZlV2ZmpFZVVsTlZxY1NEZkhVWlNCQTZEc2NabGp0RlNwT1NWeTZVVzA1?=
 =?utf-8?B?ZnhEQ0QyOG5OVithTGRpbitQdmZXdkJ0YThlSkd0RkgyTmh1anFlMWdSYXlE?=
 =?utf-8?B?N0ozeWEwNmhtMERMRloyUytsSGJKdGR2eVUwcStRNGVzdGJuV3gzaHhqbmk2?=
 =?utf-8?B?SDNCZzJLbWJaeGlWVDkzWElIM1huUVUyWFlFMDZhRUw1eGFKQldVM2tOOGtq?=
 =?utf-8?B?S1JXWEdZWUZEeHhyc1JzTXlFQ0dMUTJ0R0kxeDcxb3hjdWErUXFrb1lPclBY?=
 =?utf-8?B?RnFZSnVKMGRRYTdXb21VS1ljUEdhVk04NG9ETTJicmFQL0xGTEQyQ2F5SkVH?=
 =?utf-8?B?b1o4NFErWVJ3Wm5xMXJrNDkvSGdUeUR5MVFXTnZWUnRaRmhHMFM0N1hVL0Ji?=
 =?utf-8?B?UGJFYmFoVk9yMkVTa3Z0Z1BhM3o3WWhoQlgrODJpai9FaGJqaWJnU0NFMDUy?=
 =?utf-8?B?QmlPbnBmYlJaa05VTXlHVk96R1FHSlpVbUVEZVZ4MWlGNks3cVJoazAvWG0v?=
 =?utf-8?B?elc2MlZzblBzemRDMmpFRzh5WjJSOHRtT3JPQThVbG1PS3IzQlovTjU0U1ln?=
 =?utf-8?B?eGF4ZXdiNWNNMW9zZlludi92RitFVmE1U3NEQ2IyVHpjN0ZNMTFnSXJXZE5H?=
 =?utf-8?B?czFoNkd1MU90SWFxQ2RiL0hTSDNCVGc5SUQ4by96MThCNjBvMlpJdkRJUVJq?=
 =?utf-8?B?eTBlVUVRc3A1Vnk0SUlwRVo3UVJEZU8rU2R6eEZxeVZZaG9Fdmh0VmdhYmQw?=
 =?utf-8?B?QlllQVZiVzhrL05vMkh1RHNlUERocmNQUm0xUWhwZXBrMzlQcXB6WGF6VWlG?=
 =?utf-8?B?WGhzTGVhWUN0OGJSQ25LYmx0WGF4T1VlMlIrVUhiNDlCVHJQSnJ3ZXIxQkhG?=
 =?utf-8?B?ajJKd2l5dVdTaSszMmFaMWtjblBlRGJucWhKcGJLQXNyMk5wcmJpcmhrYXRS?=
 =?utf-8?B?MnVxQVNyNVc1WENHVHh1bFhaSVdrUlE4YUFEbEJJeENaYzI5dW5maXM0clpV?=
 =?utf-8?B?Z2pIZ1drdDFFR0dteE8wNkVoNTN6NmtreUx0d1grZzAvVGMvYWJsZ2R4amxl?=
 =?utf-8?B?VTFOanJzM0R2QlJiQ1lsdmt2Z2VHQXBDWTFudWZ6SzFPV2tsUHYyeWx1aHBZ?=
 =?utf-8?B?TGN4aEtnVytjdkVqRXlVTWFHek9TUUlvR3ZJaW9idkdkcFZJVERBUG5xSHFt?=
 =?utf-8?B?QkxxMEdYRHBkSzBBTm9RV2JNclR6Tm5MVGwrYUw4NmR6Q0Y0Lzc3bTJNSURJ?=
 =?utf-8?B?NW0xczlyT0JuZVBmbXcxakJpaVN5Wk1YVngxTytxUGg1c0l1WVJqb0ViQnQ0?=
 =?utf-8?B?SXByYStPanVHNWcwS2pZcG1DWUV1RlZKSGZSdDF0OGlGOG5VMG1wT09oYzgr?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38389e64-09d1-4f0a-06a1-08de08fe3d82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:58.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+5us4Khr1lnGLxKaUbTwtsoJhK2115xdXAiewJ/G/Eq4AcI2pHRcbVbCuN1+9gNGwrACG+NuEfkcuiAo2Smi62uMcgKAfPwEK18yEIcVzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 228 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
 4 files changed, 246 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 7f8f816c10f20..646914a3f7121 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -190,6 +190,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(SAVE_DATA_GUC);
 	CASE2STR(SAVE_DATA_GGTT);
 	CASE2STR(SAVE_DATA_MMIO);
+	CASE2STR(SAVE_DATA_VRAM);
 	CASE2STR(SAVE_FAILED);
 	CASE2STR(SAVED);
 	CASE2STR(RESTORE_WIP);
@@ -805,6 +806,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
 
 static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
+	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
@@ -861,6 +863,13 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 		return true;
 	}
 
+	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM)) {
+		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+		if (ret)
+			goto err;
+		return true;
+	}
+
 	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
 	pf_exit_vf_save_wip(gt, vfid);
 	pf_enter_vf_saved(gt, vfid);
@@ -884,6 +893,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
 		if (xe_gt_sriov_pf_migration_mmio_size(gt, vfid) > 0)
 			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
+		if (xe_gt_sriov_pf_migration_vram_size(gt, vfid) > 0)
+			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
 		pf_queue_vf(gt, vfid);
 		return true;
 	}
@@ -998,6 +1009,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
 		return xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
 	case XE_SRIOV_MIG_DATA_GUC:
 		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
+	case XE_SRIOV_MIG_DATA_VRAM:
+		return xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u invalid data type: %d\n", vfid, data->type);
 		pf_enter_vf_restore_failed(gt, vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index f8647722bfb3c..d7efe4a3bab92 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -74,6 +74,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
 	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
 	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
+	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
 	XE_GT_SRIOV_STATE_SAVE_FAILED,
 	XE_GT_SRIOV_STATE_SAVED,
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 43e6e1abb92f9..d0beec25bc86c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -15,6 +15,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_migration_data.h"
@@ -476,6 +477,226 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+/**
+ * xe_gt_sriov_pf_migration_vram_size() - Get the size of VF VRAM migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: size in bytes or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						struct xe_bo *ccs, u64 ccs_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	xe_gt_assert(gt, sysmem || ccs);
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		if (sysmem) {
+			err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+			drm_exec_retry_on_contention(&exec);
+			if (err) {
+				ret = ERR_PTR(err);
+				goto err;
+			}
+		}
+
+		if (ccs) {
+			err = drm_exec_lock_obj(&exec, &ccs->ttm.base);
+			drm_exec_retry_on_contention(&exec);
+			if (err) {
+				ret = ERR_PTR(err);
+				goto err;
+			}
+		}
+	}
+
+	ret = xe_migrate_raw_vram_copy(vram, vram_offset,
+				       sysmem, sysmem_offset,
+				       ccs, ccs_offset,
+				       size, save);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_pf_migration_data *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
+					      XE_SRIOV_MIG_DATA_VRAM, src_vram_offset, size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0,
+				       NULL, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	ret = xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_pf_migration_data_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_bo *vram;
+	loff_t offset = 0;
+	size_t size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	while (size > 0) {
+		size_t chunk_size = min(size, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+		ret = pf_save_vram_chunk(gt, vfid, vram, offset, chunk_size);
+		if (ret)
+			goto fail;
+
+		offset += chunk_size;
+		size -= chunk_size;
+	}
+
+	xe_bo_put(vram);
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Unable to save VF%u VRAM data (%d)\n", vfid, ret);
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_pf_migration_data *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pf_dump_mig_data(gt, vfid, data);
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0,
+				       NULL, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &struct xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
  * @gt: the &struct xe_gt
@@ -513,6 +734,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = xe_gt_sriov_pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	else if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 66967da761254..c6e6821042619 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -24,6 +24,10 @@ ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_pf_migration_data *data);
+ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_pf_migration_data *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.50.1

