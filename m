Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD7A790C9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE3310E7E6;
	Wed,  2 Apr 2025 14:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIcH1sqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0110E7D8;
 Wed,  2 Apr 2025 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603130; x=1775139130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S1jC0Lmjg22Iq2xHGaQKQ4cSnZc+qzdwjPAR/8Q3DCI=;
 b=YIcH1sqaaeR7GtHvbu/8bIJtCIpfz1pxe/beKq0PjNdb1Gy+wzwoLweL
 JnyQ2hdlvop6uquvksgQG74fWYeUZxwNU5hw28KAqzEcGSr2NL87Cjuu/
 ooJ7IW+c0EWvLqFsxR923gXLR15XpYIaPpTouHC5eUVG/sv2F+IOhmj2n
 2kqHnmgIWR/53oh8pgtzSYNBOfVYuPy7XRvf0fV1Ms8CSV+YUdsWRt3gy
 CCv9S75d0VkYzryJ/tF7UUPGe/fZsYunJYduGToXFBiMb/d6bRIj+GGZJ
 zBu4PahSoCDeUwKmu7lC+eupH5//mw4u7DDPe+BljA0Purd9jTvPE9R1v g==;
X-CSE-ConnectionGUID: 3CC7MXNrTr6skrm+7c/WgQ==
X-CSE-MsgGUID: tKUMx5JNQtKJIq9v1A7Buw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677154"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677154"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:05 -0700
X-CSE-ConnectionGUID: zzfVS+2TQtyBUfGYpDrAOA==
X-CSE-MsgGUID: P54R2dcwQDOWJqrTeTylJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620420"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 07:12:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWVLmBO7Zxc3537vFpbGF6abXutVoev5o6+8SuyANV3dt1mQlnp4Rxucz+XqwX4kV9kEHccTTEYgc7zcKUXgbuDbCACJmCC11RJ+XAwcicV9g9G0nzYvvNLGp8F/sjIgZUBKD6dflexMQgrKuoZusparE1cojG3G6PrGphuyXUFUDGWY2SASd2T2YJRqE45glMc8M7ySVxJpCFm8W3/HhUbwrz1fvcaXvwrKIHYBf6t9dbo9BIawE/KpCA4jVQJjWahwtKOY4zRmMud+ny8Lr6bF5WOPN9o2h76T5s6VxC+551cHvzO9ZcStODAz/BbMSny1wChctd+JVkf5FkInFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+WX4f30IsXc1peH/jKONYDsfguRJ8HmiN0jcQiIz+s=;
 b=LemrCJWmKKatigUFTseV4XU7jwgxu9gPfPJlAaNge6lI11Rxjh8Vd8fkMKS+L68KTLq5BcisRXuJjjqh5fsqRYx+7mjW4YoRhhoXa7rC5pSrnuY/6eJzfTCQ+g03ASnRs+u9mZqabmPeGPkwEX3kdKY2Xt3rkcU9/cmVgWgClTPqGxwNKNhNT/6Qhldj8/bygPeysyuqqZ5Sb4/gldULpLpWElJAUDa1ADn8CwDpmOHyPDPeyz+6f3CdcYNg700R4FFOdojMBvSZuU+fFIKeogciBJlxmKYAUHrEOIjDWwHJdrOxkYWESEIVDx6GpLyhS7SRjnWtTT6AMqVsDE3aiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:11:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:11:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Wed, 2 Apr 2025 16:11:19 +0200
Message-ID: <20250402141122.2818478-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::34) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c2cc56-f4d2-45f7-6978-08dd71f04e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1hHTHJQMVk4OFlOaEl3MHVYQk54bTZqREcvMEpuczFFTkVjb01CRnllaU5B?=
 =?utf-8?B?L3RuZGo0aDMxU01hbDRZMFBrcTBEb1JKM2RldlFyc0dVR0pZdVRQc0JYM2NF?=
 =?utf-8?B?VDYxZitKL3EwS1pUZEU1Yk5GR3IvazY3Tkd5eGpxN2pUTUprUUI3ZlZHSDVn?=
 =?utf-8?B?K0J2TTZub05mb2ZCZjdtdGZGRk5zZGx6SmliQkFGTXc0WHlFc0UrT3hqWS9k?=
 =?utf-8?B?ZlY0am1BM2cwYzcyUDdENi9DbStVUUtJdExQSTVPNE5kRUtFWHpJZXozSC9L?=
 =?utf-8?B?TnZ4WnliWm1weXJaN1czekcvN0UxRDVLM1NNZEEwc2tYNDI1UXNScWNPWWxI?=
 =?utf-8?B?ZUxaV3JUYkN3NldIVXlBUEdtU1l3L3ZkMU1TUnFRMEkrVHoxT3hqK0xTNEJm?=
 =?utf-8?B?LysrZUd6RVBPWEVrclJlZlZ0VGNaRUcrL3YvVHBSU3Nxc1Z3UUpWejBWdjNQ?=
 =?utf-8?B?dTg2MGxnbHdFM05QMkVTUkhxZ2NBdlZaSEtEdzk5S29sYzRwdHM3Qm4rMkFz?=
 =?utf-8?B?QVV1ZDJhRmwyejRyTEZBLzIyQVRsRFVCMUNoWWRjUXRKamNBWnFEbW1xMXo3?=
 =?utf-8?B?MHZyTS9xSWU4Q2ppTDBkOGs5eUxWK2tJVlRZcmwvcWpWZ3NOeVVYN0w1QXdo?=
 =?utf-8?B?d3FGa01xNEczR0RRdGsxMTdwNFpMMXdDcWVRVnhUeGZUaG9CNEtWck5LTnhT?=
 =?utf-8?B?ZmZMTTUreXZzeW0raktpSDBiaXhFd3UxYmpLdXNaY1NiWnNsSGJTcExIeGwv?=
 =?utf-8?B?SnNpYnVuaG1WUVpnMEU4U0VNTk4ycXZrS0l6ZkF1MHRMcVdFWGRsRUxFUG04?=
 =?utf-8?B?a2NSaHhwY3JWSmpBUzVtNHc0YWZwZHRtQ2VzbUNxZ1p6L3QwL2o4Ni9aa3JQ?=
 =?utf-8?B?b3AwZkFmdENSNFdRajV2aURZcDAxSlZ3RGxkKzNBSTc2dnBhR2JISjZEdGhu?=
 =?utf-8?B?d1lBQUN1ZE1nak9qc1lUbmx0M0xZT0wranR5U0FEMHdhRFdyWEtNN3BDVmY5?=
 =?utf-8?B?MW1HSWtyb0pla2xEcGwyd2Y3cjhuRCtVWGJHRDdQYm84SjdSaC9vVkpPWDVs?=
 =?utf-8?B?RHIxMHFqQ0w4VHRMN1FkdDUwMDlzblZFaUZaY3BpMkg4TW8xTFE0YUdITEZ2?=
 =?utf-8?B?MFQ3TW9GeFExWjUzOWpYazRpSERyTDd4UCtEdjZITXAyZzdSajZIS0lLeVAy?=
 =?utf-8?B?eXo5NFNxTVNIQlVHRXJCZ1B0bHdKdGozQ3NxK0ZwNjhJUFJSOFZDSzFaOEUy?=
 =?utf-8?B?cW1BcG1XYUFvT3RoZG1uRkRrSUxCbHNYRzVFL0cxUC9BSFpEWkFmTXV4anpn?=
 =?utf-8?B?WlRtYXUwekZmVDBFZ1I5cXVoQ2pYVjZZSWdjQURPdDJFMjJqVndRcFdvcTEz?=
 =?utf-8?B?Y05vUjluL3FSZVczYmliYmNWaWE0TVRVdU1mNDBzWGM1cFpzTFlIY1Q0QWo2?=
 =?utf-8?B?MUMzdGhKWGxHY1AwL2J4b243ZU1sOUpDbzZMZkNKRURaeHY0bHFjL1RrZG8w?=
 =?utf-8?B?RHgyeko1MmpKK1R0YUY4MmkzeVFJc1dPSXZ0clVqNjNKdGVmQXVGSHRZcEVV?=
 =?utf-8?B?MG5jOVpjQ2NjVXJ0SHV3L3prQUVHK2JPRTdmYWRXT08xdmVzeVozYXpYUXNQ?=
 =?utf-8?B?VXdQcDY0Vk92TW0wVXJrdW1PUEhKWVVpK29uYS9pZGlWMCsvb2dSWmMwK29r?=
 =?utf-8?B?TnBiczlDcnh1a3BmaURlUThOZ0c0dGlXZDFHVDE3bnFoM0hQVWlJYXZ1bjdC?=
 =?utf-8?B?Lzl0dHlXaFJpMlBDck1oQzhXaC80TVZoMVdyUWI0S0RjRnRXSkZwcUJneVBW?=
 =?utf-8?B?K1RrWTNFSjhFekVZQ25TUFovWTRxMDNNYW5sUlpHWW9HUXdMRkhjVEJ0RWtZ?=
 =?utf-8?Q?XllnRNPinNsCa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWU2cTZuMVBuVEpkSTBQRzB3UHdYSVE0UXpWN0htaGtPTlRWZGI1OER5RnVm?=
 =?utf-8?B?Tno4NlRHU3hyU1Y0cTBJUStKWFZQNVc4cGxzcldJN0w4ZDA4dElWMDFJeWN6?=
 =?utf-8?B?ZDY4ODZvbkR5Z1JQcW94Ti9iZGEyVXl2WkZ0S3dML2xkV3FwSEpJTm1MTFlN?=
 =?utf-8?B?Z0ZIdUMyNWdjWnM3QktIMDY2enJrYlFPOUlQMWxDZmlRMGhsWU54dy9UR3E0?=
 =?utf-8?B?dHA1aGVHclFrY1NFQUtZNm5SQzZtcWV5ajFOS2FtNE1HRDNaK3FRSm9YWllo?=
 =?utf-8?B?V3B4NWlPNUtTalBhVzM0b1NBRVlTQ3ZTQmxsVkVWUkZxVVNYV1JRdXc2SE54?=
 =?utf-8?B?blRBNVQwK2I1cHF3U2VtT0RRS2hldEFhbGVSWHBYcitCQkxyNlFsQ3dEcGRI?=
 =?utf-8?B?a3V6TGYvZ1N5Mm9LUDE5M3NyRTNlaVJNL2laTnloSWJBUkQrSlBVQ24vV2Rh?=
 =?utf-8?B?dFBTWmNUT1JhbVRwUWp4amdLem4zZzZwdFBzN1REcnVUMWN6QnYxTWYwTzFi?=
 =?utf-8?B?cFVxZWRucHVBYmhrT0ZSVXV5K1RrY3ZURDlMUWxRNWxOazlkdEQwdkN0UnFn?=
 =?utf-8?B?Q2IzTkZBZ1pBTlJtRVVrT3lhQlpoUjZ2eEt0aXdpR2lxTHZBcldURGhiSHZY?=
 =?utf-8?B?eGVlMTFra2dRazRqRmJmNk9IVHZDam1pMFNYRFpYU2h4aGQ1SVAxQ3JTdUJW?=
 =?utf-8?B?WGw0VUdNdWQ4eWMzSEprUjBmVHhYMXZjMGU5YUZnT1lIRlVOdzNXVU94MTh6?=
 =?utf-8?B?YVVEUUxiZWhPcDVNYmhEelhIK0NDQnBZVlNDamM5dTMzNW85N1ZrWGIwM2Rw?=
 =?utf-8?B?L3BUeFExU0hySWdvVU5SMll2MGlXTUdnclpkQVlCTnAvNGxxVUdVdk8zS1l6?=
 =?utf-8?B?RW9MbElUcmlGS1BKRkRCMVcycXJ4QXdwRUhsMGxmUjNZV3VSaU80T0J5VURC?=
 =?utf-8?B?ZXlIVWlwZXlDdnJGK2ZyYlpNT0pWZGowUmRKYkhHbHlkVVBOeVYybHE5Ulow?=
 =?utf-8?B?YTdjU0VBNmJrTGp3ZVN0UGllUldVbkEvVmxZWi90anAzb0hha0FWTmd1VWxB?=
 =?utf-8?B?VWxDSU82TnBXeC9pNzEvUTZwK3EyaFVtSHExQ3RVOVd0UXcwUk5IZTBYZDZG?=
 =?utf-8?B?cGc0QlpCTThqOWFjZEFlN0FXdDhFNHBSWXE4SWc5QU5raHhNamRnQ0F0ZGNB?=
 =?utf-8?B?RC9VTFN0VFBZUFYwREZmazVIcFhKeUV0eGNkaWZZQ3pXTUdFSVJYUDkwQkhF?=
 =?utf-8?B?Skc4Snlod01CS1hGdkR5YkFCS1poZnpCL2tweDA3bkdReGJHU2svdmJOZjRy?=
 =?utf-8?B?WHBxUFFVYVNiTFdzek81RG9Qc2J2ZUJZQmxWeTByV1VBOVJiRE8vOHpoUlB5?=
 =?utf-8?B?QzZMNzlITWpHV25odkF0aDllUHVsYVIzS0dJbS9Bck5XQzNma0xIc0UrOGFx?=
 =?utf-8?B?M1BsOGZVRlYrd2RaZUdpdkdTN0VhckVFMjlHbWErU3M2VDB6TGJuK2xaSW41?=
 =?utf-8?B?eCtTbi9jTis3MHpuM0txREw0M1RBR1E5OHZpQ1NGQit2N2pPWVloVFdINW1I?=
 =?utf-8?B?M3RraDBkaTFwa25QZkRQQjR0QkRHa21ocUhOYndXMEpueVFSN3oxc0FTWjFF?=
 =?utf-8?B?azYyVVFOcUtQNkF2V2Q0cEo2L29HejBBdkhwZG1kNEplb04xSHAwVjRJOHp4?=
 =?utf-8?B?THgyYkpVNGt4eTRDOWxJYUcvR2MzYllWQkFab0t1VVFPZE56aTB5dndnT1pz?=
 =?utf-8?B?M1RRMXc1N1EwRzAyWmZsVUJjMTNuWXpsR240RkkwZDBrdHlsN3pnRmVMNitO?=
 =?utf-8?B?VVBBcFEvMmkyeVpTSm9YakM0RkI1b05GYys1R09aMkhkNm92ekdRNW1YSkZ1?=
 =?utf-8?B?dnRPVjE1cmRIZEV1cUNoYXI0WWZRSFpXNHk2akFRY1RpbkJxdW55bFZ1ZWFV?=
 =?utf-8?B?ZTNYY3RPU2NYTEYzYTBHTndWTmNqM2prUlowc2xwL1h3ZmIxR2NYbU8vT1N4?=
 =?utf-8?B?WldTSnhxRllSaFAyV1hZVVdjdG5oalNpNTZ2Wnp6Zlk0Rkh2ZmhjUTJhdmYy?=
 =?utf-8?B?cGRUVVVnaWpjSGpPa00xcndtQ05uKzFWaTRtc0FJRGMweWJaZ09BaUF2cGFQ?=
 =?utf-8?B?T3I2L21OSXM5UkNLUGZvMVVzM2hPYy9sdUVTSXJndS9XbmpMRUt6b3k3cjRU?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c2cc56-f4d2-45f7-6978-08dd71f04e5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:11:50.5394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4oprYbjuKh1g4ocI4O7Qm1Jn0sbYmCAdOPQ/rrpVA+jmLz/KiACx1ndeikADeP0kH+eaitKpAew4PpQsK0CvZT5knH6KsWDG0RdqCJuzDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

Similar to regular resizable BAR, VF BAR can also be resized.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR, which means
we can reuse most of the implementation, the only difference being
resource size calculation (which is multiplied by total VFs) and memory
decoding (which is controlled by a separate VF MSE field in SR-IOV cap).

Extend the pci_resize_resource() function to accept IOV resources.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       | 10 +++++++++-
 drivers/pci/pci.h       |  9 +++++++++
 drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
 4 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 3d5da055c3dc1..fee99e15a943f 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -154,6 +154,27 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size)
+{
+	if (!pci_resource_is_iov(resno)) {
+		pci_warn(dev, "%s is not an IOV resource\n",
+			 pci_resource_name(dev, resno));
+		return;
+	}
+
+	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+}
+
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	u16 cmd;
+
+	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
+
+	return cmd & PCI_SRIOV_CTRL_MSE;
+}
+
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = virtfn->physfn;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24e..6878e3b1e3fcf 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3745,7 +3745,15 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pdev->rebar_cap;
+	if (pci_resource_is_iov(bar)) {
+		if (!pdev->physfn)
+			return -ENOTSUPP;
+		pos = pdev->sriov->vf_rebar_cap;
+		bar = pci_resource_num_to_vf_bar(bar);
+	} else {
+		pos = pdev->rebar_cap;
+	}
+
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f44840ee3c327..643cd8c737f66 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -689,6 +689,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -722,6 +725,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6657cdd06f67..d2b3ed51e8804 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -423,13 +423,39 @@ void pci_release_resource(struct pci_dev *dev, int resno)
 }
 EXPORT_SYMBOL(pci_release_resource);
 
+static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev,
+						  int resno)
+{
+	u16 cmd;
+
+	if (pci_resource_is_iov(resno))
+		return pci_iov_is_memory_decoding_enabled(dev);
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+
+	return cmd & PCI_COMMAND_MEMORY;
+}
+
+static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
+					 int size)
+{
+	resource_size_t res_size = pci_rebar_size_to_bytes(size);
+	struct resource *res = pci_resource_n(dev, resno);
+
+	if (!pci_resource_is_iov(resno)) {
+		resource_set_size(res, res_size);
+	} else {
+		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
+		pci_iov_resource_set_size(dev, resno, res_size);
+	}
+}
+
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 {
 	struct resource *res = pci_resource_n(dev, resno);
 	struct pci_host_bridge *host;
 	int old, ret;
 	u32 sizes;
-	u16 cmd;
 
 	/* Check if we must preserve the firmware's resource assignment */
 	host = pci_find_host_bridge(dev->bus);
@@ -440,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (!(res->flags & IORESOURCE_UNSET))
 		return -EBUSY;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	if (cmd & PCI_COMMAND_MEMORY)
+	if (pci_resize_is_memory_decoding_enabled(dev, resno))
 		return -EBUSY;
 
 	sizes = pci_rebar_get_possible_sizes(dev, resno);
@@ -459,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	resource_set_size(res, pci_rebar_size_to_bytes(size));
+	pci_resize_resource_set_size(dev, resno, size);
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -471,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	resource_set_size(res, pci_rebar_size_to_bytes(old));
+	pci_resize_resource_set_size(dev, resno, old);
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.49.0

