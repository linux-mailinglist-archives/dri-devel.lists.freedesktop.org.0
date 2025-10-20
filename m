Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AFBF1F24
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACFE10E2A9;
	Mon, 20 Oct 2025 14:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MB7d67Z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224D10E2A9;
 Mon, 20 Oct 2025 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760972217; x=1792508217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TNZYESKspGIYbWycjPP5FN7gqKTqvSYInHZ4o3I3nFA=;
 b=MB7d67Z+Z00INT7jAXY+i2D7mK3hXlJ+gvVAJrfJs6lAV3qZlEg+Nfxf
 Plu8VTZZMfc6YpwLuvV8pZn7YtXq0LX36T7084/T0Dj8XLS3V7EOpfGFK
 5x9CQv0Wb3jrsgQYvzNGWZOZ0tbCLJmNJ6l6EpjTYAi15IeFHlA+3a4Bk
 sOrfRCs9nG9k5tMn2pzFvLPNLwPbbTrPuNCX30Xw2DoUjVuj/cDw/eyXO
 0kbMsNPzZvqGI+e589MltOay2ltjly6RbjtSyZioJWGQOIYQVVmZh7CPh
 YHCw5oE9zYIOCih5bWk/RWDkaM1q7O19ZOPr4NJyeMiGPwTVKFYKYjRmG Q==;
X-CSE-ConnectionGUID: SxlrMSfvR2+Ow2CK48TA8g==
X-CSE-MsgGUID: je+NeCcNTmmXthyRYK71OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62295631"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62295631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:56 -0700
X-CSE-ConnectionGUID: sCXbu1ZgSua4y3FIgU1bkg==
X-CSE-MsgGUID: YNqDUcPITqGut4ZUU6aAWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="188443634"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:56:55 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvAWhjgkBxMJu3OCaJCZKPNxO17EdJSxTgJaJoNf/mBdps7s4+91cRKOE3y7nBgw5GvMxDxEBJhbPMIwsHp6IZjaUH0VlexW4qQ5S3mHYwSmvSlAXgzequK4xqPko0yk22scPRVcJKEbbDkPPyzoOefCtnK6eu+yDDHMHhNLCrojhj2F498ack5bAaJr8gqGENt1Kc+0xDuLHyXAP+7Emae2RgMHLhaB60eioMYTNVLFI8Z7tjxZ9iK1HdIKOjcwHXjrpJxhlkoA0GzVuQEPDmOOJYBn6IuQKe/fvkqWBCukKM1jsvi23SbdoWJimmjIqVV1ZiSyFReiNS5qT9lJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9eAP9kZ886NJJ/mnPziTn2JQ+9tDh8bW34kLhVufdo=;
 b=pu8jq5Cy/n+YGFGPnHLm5WUY7MyEoP17gGzjKixKWW2+ZVTMpqB22l3rjqD2gFsqsB5FbubPO4lX4P2r09RSduA9gLhQLsDKrHsPpGNZGJAt6ERTdDU6XASuIRIS5RX93l7MSgvHqpH4HQywd6KRAdcl8rIw6pznGrzC6QzaJxQD2xwpnwIc41jGh0agLhkqjl2439nvLNjx7om9TjuPmJhyhy2SPKfSt99iBlsKXTSuOFWvrFziaUGTOep4M2+awLj/EJOWMCioKVdDkwk5Udu79ymF6oPe7Be4tPYtUABfi6CoV181eqqy7tyzpW4nDs1oBbfh+SYqF6y31OKlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF49E43CAC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 14:56:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:56:53 +0000
Date: Mon, 20 Oct 2025 16:56:49 +0200
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
Subject: Re: [PATCH 05/26] drm/xe/pf: Add data structures and handlers for
 migration rings
Message-ID: <n5kn3e42kr4titmdt2re4n7g5f6zdycoitzgcqys66hbs3s2di@jtotrbyeh5qa>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-6-michal.winiarski@intel.com>
 <2f39ed42-57b0-41fc-8577-d7a73814bb95@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f39ed42-57b0-41fc-8577-d7a73814bb95@intel.com>
X-ClientProxiedBy: BE1P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF49E43CAC1:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f6e17e-6249-4a5e-d4c4-08de0fe8e830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHIvU29peTBpRU9Bc0lFODJSQnNBRi9iZFhxZ0gvLytGYXg3Tk9SZmZDb0Q1?=
 =?utf-8?B?RVhPVlNSRndCRGlidkNsMUlrdlduRUEzcno1cHY2cmxybUJDVnplOGJKUDJh?=
 =?utf-8?B?UlBqTlF1LzlKZ3hHUkMvWi9CSklGdEdGSEJ6UFhWYXFla2NOZW5yOW1yY3k1?=
 =?utf-8?B?TkZTMUEvcnpEcXpwTkU4TVJoTTQwUDNYQnh5RHcvb0xsUGRNTDZyUFlUaGxo?=
 =?utf-8?B?eVRqS3hvZEdVTnkwT1hVdVZxbk5GWmVUYkRQNWJpOWhCZlU0L29pYlppdFdG?=
 =?utf-8?B?cEdDdXVnM3dlWWRjQno0blJmb0JNQWlSdXdXWXV6SGtodFcwWGhpbTJKL1M5?=
 =?utf-8?B?dmVYVVhnSVdmNU43N3NwSGU2U2xZcjNvWXNBajJudUp1VHhFZUFQVm1HOEx2?=
 =?utf-8?B?WnFxbjQ1Snl0RVJtK1QyZUp0aWZTVEtkbG9rai9wNmZoOHRzUVJKRUdnTHRO?=
 =?utf-8?B?dDhGVHJUeWZobEpQT2I4bGUzaVdvNUhsZjh4di8yaWNucXU3S0JYQjJnQWNU?=
 =?utf-8?B?QmRLWTJiY21aWG9XK1dWQjNOL3VTR0JiYUUrRDFNUmdZNkVBcVRyWkpDRGgy?=
 =?utf-8?B?TTVhaGRFMzZEM3J1d3J5ZlJvbUtMRHA2b1JLYjUyakE2ZCszTnkwRGd3TVNT?=
 =?utf-8?B?Kys2elBEemJCNkE0RTdYd3FUOHlBSVZram1WVmFWbUdBbG03MkNqU1V5aWhW?=
 =?utf-8?B?c1kwcjRUOXRuZnFod29DYlRKaWdjcnBHRTRqSFJRY2h5SGRjMGhRek83L1FR?=
 =?utf-8?B?UGtlMTZua2hsNmZzUm9CRUsraW9qdUcwd0xNeW1TZUZ3aFg0RW16R0VLcE5R?=
 =?utf-8?B?WDRUQ0NtT1BQT0hmOC9EVk81K0c2L3dQbXNVRkUxME9pTFRSMUVzWlkxbjg5?=
 =?utf-8?B?YVQ4TFJRbzVkd3JsRlZOWkplVmxxbjlvRjZTbldQLytpNitERUI3TlFyN215?=
 =?utf-8?B?aDNsR0RBakVMcW5LUHlpbmN0MmQxQnQra3BXS0c0Zzh3Q3RJSWdpaE9vVGk5?=
 =?utf-8?B?WGN4UTl0aTZZdUNDY29kb2VKZHN5TThuTldmZytXcWMrUnJsR1NMQ2FmZWhi?=
 =?utf-8?B?N2srajN3eGJoRFlRZEVZREJtb0hrdGdkWENpSnFndHhwbVIwbGc0N3gwU2Ni?=
 =?utf-8?B?TUNra2JTVjdCeHMyQ2ZYd1hGTDErZGRLNDdoL3ZPeFNpL3I4S0F5SGJyY0Fj?=
 =?utf-8?B?dGhIbklnbWF1cElFeG8yMmdaaGZYbGx2YlBkWlJnMnVWbGZWbGNPTHU2dUpV?=
 =?utf-8?B?bnRjbFlXd0o5TG5RY01PamNvdTVvc2ZvcVdqT3h5ajF2WkgxWVduamRqK3pQ?=
 =?utf-8?B?UkQxektPSnF6cFRtbnFQU1c0WkpyMGpUb1VRU0wrSHc5OTUveEtMY0JzUExN?=
 =?utf-8?B?akFNNTVBRlg5SVQwcU1pY09tNXlaMG5weHVxay9QMWhjTWM1UVczM3k3eEFB?=
 =?utf-8?B?dEo3VDNURkZEL0gveTBqVmdjNjZBeWIyYzdRVVUwQUYzU0tuZXVwaXI4YW43?=
 =?utf-8?B?RC85b0NyZHhIU3duemRSNUFxZGR0UkpkNmpMTXVqaWZhc05WbVRYMzZVd1BE?=
 =?utf-8?B?OVJQRXhZQTZQOER5OGJoRlNldW41UGtYRXUweDhYMVN0UG1jOWhTV09WcCto?=
 =?utf-8?B?SmR1ZXdBKzdRd0NlT2J0ZDQwOS80V212aUJJeEU2bUY1VkF3dXVNNVVCYWo2?=
 =?utf-8?B?YVJIcGZDVjhDbnJrRUk5QU5aaG9uTUVkZ3RwbmZoQ1NZVDZVL3Fvc2dDczl5?=
 =?utf-8?B?UGhTaHF0MSt1blZUZHNtYzRvSGZ1S01NcWZzYlBLa2RrblBqWi9mTC9YeVBu?=
 =?utf-8?B?L2ZDMnF5dGs2RThrMDNrcGkyNkl2TjVHQnZqU21hYjk0T3hlQml1Y1V6ekp0?=
 =?utf-8?B?VmVGUW5YWjRXTWZHSjVldU9LTU5ETU9kWDRhWStYdTMwcWhJYy9WMW41RDdI?=
 =?utf-8?Q?/Uf5zmhBnI01cmr6s9ul9JeH++knIpPt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3UreWRERHhOM01EdEU1R252RG5OVWNNZGNvd0tqWUFtRm1xVnUwcklvN3hJ?=
 =?utf-8?B?VjYzUTJ1Q0JJUXZ5em1YcWowSXN0Ylc1dTFxd2xQcEJaYy9uUURYYmtxdi9R?=
 =?utf-8?B?S0svT0JwV1hvSXNTa292d3RYWWxWemQvZFZpbk5tWDREaEJadW9nOFpWR2xp?=
 =?utf-8?B?TkViTTVxdytvWTJNcUh1N1NGcHNJOG5zQzVlWEtjdnJDQTF2VVJzM3NMRllh?=
 =?utf-8?B?Z1dUYndxM2hnQ0gwMFJzVDdDZ3BsSzhsWDczbzhibUlWcHJQSjNySXppNFF1?=
 =?utf-8?B?Smc0bTAzc3A2VC9CVTVaZWd0WUhvMkM5emFqT2o1a095eFFnV1Nob2RkcllF?=
 =?utf-8?B?ekdTZ01KOTlYMzVma0VJcnZaRGQ5dC9USFdzZnpKdk11M3B3bk10Rm9RUHhF?=
 =?utf-8?B?STRBQkNsZytoUzVzR0xqMHVmamkvbk92aDUraWlyL09JY1dWWHAwYzNnV2lz?=
 =?utf-8?B?cHZGeUFvYXEvQVJxbzl6NzBvNktkclVNaUlYOUtVWG9rbFU2cWR5bXFhZUN3?=
 =?utf-8?B?dWkvbTRjNUdQVTQ2cmJxbmpWd1Bac3NkYWtmYnBmQTBsVUpyWnJyZ3RGK2hj?=
 =?utf-8?B?SlkxNHFjSk84MkdwNFZpSk42UmR2akdrY29GMWtaVm5wNUJxUWlRRTV6aU9X?=
 =?utf-8?B?eTl5US92YlE0ZHE0aHh0dXhMKzFYUWE1T1R4bEtQazlzTmJnV0xlNEpXeUJt?=
 =?utf-8?B?ZWFQd0x0ZEY1U1BxcVY1N3dUMnFrSVBVNlNzdTFqOC9DMGE0Mk5UOWNmYVIy?=
 =?utf-8?B?ZkNMZ0JXellyeGE5OCtRcmhZYlltekZSY1VtWHkyRmZtWTdQb0tQckxrbWt1?=
 =?utf-8?B?WmtobWhGK2tiM3Njb0k2WWw1ZjRNbGZmSFhEVmdSZm1Kenhtb2cxNFUrTnVP?=
 =?utf-8?B?QVg3Y3RYZVV6Sk5KZzc5S2lsSStwTG1mNVV4REVnQXNYUnd6cG9vbVNsOS9h?=
 =?utf-8?B?TGtZQ1g3QmJtMkQxSG5HTENkRDN2Mjh5cExNZVgrcnJJVTlEejlQQVc4cFBZ?=
 =?utf-8?B?TDRWQ0JyTkNNSjB4OXlrRDJvc0lGSjJSaHhZdHp6Y2JzcFpES0tXeUZhNlcw?=
 =?utf-8?B?ZERIUTNNMXNRTEhZWUlCUVRiczV1UDNxSmtaWDZ5bk9udUJWbzY5eVpVb3Uv?=
 =?utf-8?B?WFRCQXdwSzkyd2d2b0tYTDIxQ3RLa3I3am1lYStPQk96ZHlNbTJ0WWkzK0ZF?=
 =?utf-8?B?WHpRd2FiL2xjcVNUUVJOa29ZMHlUQ3Q2Y1h2K2VFZ3lmS050WVYrMG8vckc1?=
 =?utf-8?B?TTZuRzJ5Umpua1dQSXY5TnZybWxvZUluZ2RZK25yeFhvbUtqNmJGVTR0MjJG?=
 =?utf-8?B?TVVpSlFiRDgwaE1KalFuL01wa2dMa0NKQW9aV2ZJOFNXeWltY2tJdTBSSjZr?=
 =?utf-8?B?cGpNNktjR3dhQ0xXK0FDeXdHeHgwTFAvS1NaSHZXS2pzY2RBT2xEVGxnSWNC?=
 =?utf-8?B?SFdTcHh6NkVhVk84bG1HYmpDbTJBRnVmMFpTSTZ5VU9idDdQa2xJaU1WbXlz?=
 =?utf-8?B?MTZneEdXamowdVdFcnIxNUpWMVljSWJiZjhWZFVwTXk3ZTU4RGhQN0VkK2F5?=
 =?utf-8?B?QkR3aEM5alFacEdlMEQ0RldValdBaHY0UmRWV1V5V2wyYTZMdFJOQXNETTkv?=
 =?utf-8?B?NXhyQnc2ZTEwOTloWm1MU29Vcys5aFNMUUNBVXdFSkxOUDhCS0Y1QnhSMnVR?=
 =?utf-8?B?WFRLT2hwU2QrQ3BTcG05SFJ6bk1LOU53L2pvNmNVTmVyc3hkTkR0ZmxjOG9T?=
 =?utf-8?B?Mm93WEpBUGxiZGtPZ0Q5SFJ1THhodm1sNi9Na0hmeVlVeTJ6aXcrNEU0QWpS?=
 =?utf-8?B?b1hpNFVSQmcyNW1FbmgrWnRCakd2VTdsWVFic3RpRXl6WE5Qa3hpZW16RFJT?=
 =?utf-8?B?c2tXRmJCcGZJY3dESmlobS9kcWVVcWg1K0NzZGorSWg0Yk8vNStUam9hRllT?=
 =?utf-8?B?NkRsbnJ0Wk5uVEpROTd1eFdRNVptNlo5TkVEUVpvQ20waGFjRjlNSjRTd24r?=
 =?utf-8?B?MHdsWG1jUHkxaVNGTmY5ZGhKa0w5QmRrL0xEc0JsdXM4dUZnWFVyR1JCM3Z6?=
 =?utf-8?B?dmtOcnljS21zUElaV2o1UWhpNnM1L3ZzbWZPR2E5N0hDSFRQd1IxQkJjc044?=
 =?utf-8?B?RlM4SW1zSVQyZE9sbjM5cVdWeXlndTRKODVocHBiVFlWeW9iVzI1K0xxcHJI?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f6e17e-6249-4a5e-d4c4-08de0fe8e830
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:56:53.8834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88Xhfg8Ln+uN+EinSkKEln7cnMTAe0weVtB9vcmkvsiT9a6EC73aSlQtIlbTUu4WFID8xHK08qm9WAQnrNuN+6VfaISubYx9CkknHNSf4uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF49E43CAC1
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

On Sun, Oct 12, 2025 at 11:06:59PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Migration data is queued in a per-GT ptr_ring to decouple the worker
> > responsible for handling the data transfer from the .read()/.write()
> > syscalls.
> 
> ... from the .read() and .write() syscalls.

Ok.

> 
> > Add the data structures and handlers that will be used in future
> > commits.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   4 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 163 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   5 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 147 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  20 +++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  37 ++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
> >  9 files changed, 390 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index 44df984278548..16a88e7599f6d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -388,6 +389,8 @@ static bool pf_enter_vf_wip(struct xe_gt *gt, unsigned int vfid)
> >  
> >  static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +
> >  	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_WIP)) {
> >  		struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
> 
> we can declare wq here

It actually needs to be removed from here - we can't use WQ from
non-migration related PF control flows.
The state machine will be modified to match your suggestions from
later points in the series.

> 
> >  
> > @@ -399,6 +402,7 @@ static void pf_exit_vf_wip(struct xe_gt *gt, unsigned int vfid)
> >  		pf_exit_vf_resume_wip(gt, vfid);
> >  
> >  		complete_all(&cs->done);
> > +		wake_up_all(wq);
> >  	}
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index f8604b172963e..af5952f42fff1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > @@ -15,6 +16,17 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf_migration.h"
> >  
> > +#define XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT (HZ * 20)
> > +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > +
> > +static struct xe_gt_sriov_pf_migration *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return &gt->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> >  				      u64 addr, u32 ndwords)
> > @@ -382,6 +394,142 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is empty, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_produce() - Add migration data packet to migration ring
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + * @data: &struct xe_sriov_pf_migration_data packet
> > + *
> > + * If the ring is full, wait until there is space in the ring.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_pf_migration_data *data)
> > +{
> > +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
> > +	int ret;
> > +
> > +	xe_gt_assert(gt, data->tile == gt->tile->id);
> > +	xe_gt_assert(gt, data->gt == gt->info.id);
> > +
> > +	while (1) {
> > +		ret = ptr_ring_produce(&migration->ring, data);
> > +		if (ret == 0) {
> 
> 		if (!ret)
> 			break;
> > +			wake_up_all(wq);
> > +			break;
> > +		}
> > +
> > +		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> > +			return -EINVAL;
> > +
> > +		ret = wait_event_interruptible_timeout(*wq,
> > +						       !ptr_ring_full(&migration->ring),
> > +						       timeout);
> > +		if (ret == 0)
> > +			return -ETIMEDOUT;
> > +
> > +		timeout = ret;
> > +	}
> > +
> 
> 	wake_up_all(wq);
> 	return 0;
> 
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_consume() - Get migration data packet from migration ring
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * If the ring is empty, wait until there are new migration data packets to process.
> > + *
> > + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> > + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
> > + *	   ERR_PTR value in case of error.
> > + */
> > +struct xe_sriov_pf_migration_data *
> > +xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	unsigned long timeout = XE_GT_SRIOV_PF_MIGRATION_RING_TIMEOUT;
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> > +	while (1) {
> > +		data = ptr_ring_consume(&migration->ring);
> > +		if (data) {
> > +			wake_up_all(wq);
> > +			break;
> > +		}
> > +
> > +		if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> > +			return ERR_PTR(-ENODATA);
> > +
> > +		ret = wait_event_interruptible_timeout(*wq,
> > +					 !ptr_ring_empty(&migration->ring) ||
> > +					 !xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid),
> > +					 timeout);
> > +		if (ret == 0)
> > +			return ERR_PTR(-ETIMEDOUT);
> > +
> > +		timeout = ret;
> > +	}
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_consume_nowait() - Get migration data packet from migration ring
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Similar to xe_gt_sriov_pf_migration_consume(), but doesn't wait until more data is available.
> > + *
> > + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> > + *	   ERR_PTR(-EAGAIN) if ring is empty but migration data is expected,
> > + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
> > + *	   ERR_PTR value in case of error.
> > + */
> > +struct xe_sriov_pf_migration_data *
> > +xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_sriov_pf_migration_data *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data) {
> > +		wake_up_all(wq);
> > +		return data;
> > +	}
> > +
> > +	if (!xe_gt_sriov_pf_control_check_vf_data_wip(gt, vfid))
> > +		return ERR_PTR(-ENODATA);
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +static void pf_gt_migration_cleanup(struct drm_device *dev, void *arg)
> 
> no need for the "pf" prefix
> 
> and if this is only about ptr_ring, then it could be:
> 
> static void action_ring_cleanup(...)
> {
> 	struct ptr_ring *r = arg;
> 
> 	ptr_ring_cleanup(r, NULL);
> }

Ok.

> 
> > +{
> > +	struct xe_gt_sriov_pf_migration *migration = arg;
> > +
> > +	ptr_ring_cleanup(&migration->ring, NULL);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -393,6 +541,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned int n, totalvfs;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > @@ -404,5 +553,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  	if (err)
> >  		return err;
> >  
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 0; n <= totalvfs; n++) {
> > +		struct xe_gt_sriov_pf_migration *migration = pf_pick_gt_migration(gt, n);
> > +
> > +		err = ptr_ring_init(&migration->ring,
> > +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> > +		if (err)
> > +			return err;
> > +
> > +		err = drmm_add_action_or_reset(&xe->drm, pf_gt_migration_cleanup, migration);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 09faeae00ddbb..1e4dc46413823 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -9,11 +9,20 @@
> >  #include <linux/types.h>
> >  
> >  struct xe_gt;
> > +struct xe_sriov_pf_migration_data;
> >  
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_pf_migration_data *data);
> > +struct xe_sriov_pf_migration_data *
> > +xe_gt_sriov_pf_migration_ring_consume(struct xe_gt *gt, unsigned int vfid);
> > +struct xe_sriov_pf_migration_data *
> > +xe_gt_sriov_pf_migration_ring_consume_nowait(struct xe_gt *gt, unsigned int vfid);
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> >  						char __user *buf, size_t count, loff_t *pos);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index fdc5a31dd8989..8434689372082 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/mutex.h>
> > +#include <linux/ptr_ring.h>
> >  #include <linux/types.h>
> >  
> >  /**
> > @@ -27,9 +28,11 @@ struct xe_gt_sriov_state_snapshot {
> >  /**
> >   * struct xe_gt_sriov_pf_migration - GT-level data.
> >   *
> > - * Used by the PF driver to maintain non-VF specific per-GT data.
> > + * Used by the PF driver to maintain per-VF migration data.
> 
> we try to match struct name with the sub-component name, not use it as per-VF name
> 
> if you want to have struct for the per-VF data, pick a different name, maybe:
> 
> 	struct xe_gt_sriov_pf_migration_state
> 
> or just reuse one that you plan to remove later:
> 
> 	struct xe_gt_sriov_state_snapshot

I'm trying to avoid using word "state" anywhere in migration data
related codepaths, as that's used to denote device state on VFIO side
(which translates to Xe PF control state).

I'll rename it to xe_gt_sriov_migration_data (per-vf struct containing
the ring) and xe_sriov_migration_data (actual data packet).

> 
> >   */
> >  struct xe_gt_sriov_pf_migration {
> > +	/** @ring: queue containing VF save / restore migration data */
> > +	struct ptr_ring ring;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > index 9a856da379d39..fbb08f8030f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
> >  
> >  	/** @snapshot: snapshot of the VF state data */
> >  	struct xe_gt_sriov_state_snapshot snapshot;
> > +
> > +	/** @migration: */
> 
> missing description

Ok.

> 
> > +	struct xe_gt_sriov_pf_migration migration;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index cf6a210d5597a..347682f29a03c 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -4,7 +4,35 @@
> >   */
> >  
> >  #include "xe_sriov.h"
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> > +#include "xe_pm.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration
> > + * @xe: the &struct xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: pointer to the migration waitqueue.
> > + */
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return &pf_pick_migration(xe, vfid)->wq;
> > +}
> >  
> >  /**
> >   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> > @@ -35,9 +63,128 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >   */
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> > +	unsigned int n, totalvfs;
> > +
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> >  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	if (!xe_sriov_pf_migration_supported(xe))
> > +		return 0;
> > +
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> > +
> > +		init_waitqueue_head(&migration->wq);
> > +	}
> >  
> >  	return 0;
> >  }
> > +
> > +static bool pf_migration_empty(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static struct xe_sriov_pf_migration_data *
> > +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data *data;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +	bool no_data = true;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		data = xe_gt_sriov_pf_migration_ring_consume_nowait(gt, vfid);
> > +
> > +		if (!IS_ERR(data))
> > +			return data;
> > +		else if (PTR_ERR(data) == -EAGAIN)
> > +			no_data = false;
> > +	}
> > +
> > +	if (no_data)
> > +		return ERR_PTR(-ENODATA);
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_consume() - Consume a SR-IOV VF migration data packet from the device
> > + * @xe: the &struct xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * If there is no migration data to process, wait until more data is available.
> > + *
> > + * Return: Pointer to &struct xe_sriov_pf_migration_data on success,
> > + *	   ERR_PTR(-ENODATA) if ring is empty and no more migration data is expected,
> 
> can we use NULL as indication of no data ? then all ERR_PTR will be errors

Will do.

> 
> > + *	   ERR_PTR value in case of error.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> > +	unsigned long timeout = HZ * 5;
> > +	struct xe_sriov_pf_migration_data *data;
> > +	int ret;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return ERR_PTR(-ENODEV);
> 
> this is "PF" function, we shouldn't get here if we are not a PF
> 
> use assert here, and make sure the caller verifies the PF mode

Ok.

> 
> > +
> > +	while (1) {
> > +		data = pf_migration_consume(xe, vfid);
> > +		if (!IS_ERR(data) || PTR_ERR(data) != -EAGAIN)
> > +			goto out;
> > +
> > +		ret = wait_event_interruptible_timeout(migration->wq,
> > +						       !pf_migration_empty(xe, vfid),
> > +						       timeout);
> > +		if (ret == 0) {
> > +			xe_sriov_warn(xe, "VF%d Timed out waiting for migration data\n", vfid);
> > +			return ERR_PTR(-ETIMEDOUT);
> > +		}
> > +
> > +		timeout = ret;
> > +	}
> > +
> > +out:
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_produce() - Produce a SR-IOV VF migration data packet for device to process
> > + * @xe: the &struct xe_device
> > + * @vfid: the VF identifier
> > + * @data: VF migration data
> > + *
> > + * If the underlying data structure is full, wait until there is space.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> > +				  struct xe_sriov_pf_migration_data *data)
> > +{
> > +	struct xe_gt *gt;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return -ENODEV;
> > +
> > +	gt = xe_device_get_gt(xe, data->gt);
> > +	if (!gt || data->tile != gt->tile->id) {
> > +		xe_sriov_err_ratelimited(xe, "VF%d Unknown GT - tile_id:%d, gt_id:%d\n",
> > +					 vfid, data->tile, data->gt);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index d3058b6682192..f2020ba19c2da 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -7,12 +7,18 @@
> >  #define _XE_SRIOV_PF_MIGRATION_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/wait.h>
> >  
> >  struct xe_device;
> >  
> >  #ifdef CONFIG_PCI_IOV
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
> > +int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> > +				  struct xe_sriov_pf_migration_data *data);
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
> >  #else
> >  static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> > @@ -22,6 +28,20 @@ static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> >  {
> >  	return false;
> >  }
> > +static inline struct xe_sriov_pf_migration_data *
> > +xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +static inline int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> > +						struct xe_sriov_pf_migration_data *data)
> > +{
> > +	return -ENODEV;
> > +}
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return ERR_PTR(-ENODEV);
> > +}
> 
> didn't fully check, but do we really need all these stubs?
> likely those functions will be called from other real PF-only functions

We don't. I'll remove the stubs.

> 
> >  #endif
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index e69de29bb2d1d..80fdea32b884a 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
> > +#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/wait.h>
> > +
> 
> add kernel-doc

Ok.

Thanks,
-Michał

> 
> > +struct xe_sriov_pf_migration_data {
> > +	struct xe_device *xe;
> > +	void *vaddr;
> > +	size_t remaining;
> > +	size_t hdr_remaining;
> > +	union {
> > +		struct xe_bo *bo;
> > +		void *buff;
> > +	};
> > +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> > +		u8 version;
> > +		u8 type;
> > +		u8 tile;
> > +		u8 gt;
> > +		u32 flags;
> > +		u64 offset;
> > +		u64 size;
> > +	);
> > +};
> > +
> > +struct xe_sriov_pf_migration {
> > +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> > +	wait_queue_head_t wq;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > index 2d2fcc0a2f258..b3ae21a5a0490 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >  
> > +#include "xe_sriov_pf_migration_types.h"
> >  #include "xe_sriov_pf_service_types.h"
> >  
> >  /**
> > @@ -17,6 +18,8 @@
> >  struct xe_sriov_metadata {
> >  	/** @version: negotiated VF/PF ABI version */
> >  	struct xe_sriov_pf_service_version version;
> > +	/** @migration: migration data */
> > +	struct xe_sriov_pf_migration migration;
> >  };
> >  
> >  /**
> 
