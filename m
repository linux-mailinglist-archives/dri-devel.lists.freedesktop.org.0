Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975CAC4E3D
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E95A10E3D3;
	Tue, 27 May 2025 12:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DG1gb6ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C8710E3D3;
 Tue, 27 May 2025 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347699; x=1779883699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9kW9LLCZgDwDe+QGDSEIpJNLpYqWuhWBOLPMVpmMEUk=;
 b=DG1gb6lsAgTJwmr+efAqo1C8QX/fkFF/yAV40YwAaNm0O6nO6BoCqPbj
 hXLnuDwp/bwKeqq2xtNXMpEyO4ENvmespc2RXzAkgU2LCnILld8ctetao
 +y24CUvYOZmyWigZbLORINb1y9Jnjr5B+3WVUXZh1D+bBFqLXTcOmtBUy
 j8Dh9uAYp4dC3c4ym6NRUsoiyrud1xVeLAqdevRNamEdwNR5+D63k8q0U
 Lz7zO+tG724stnSgRKN9J/XEm5NMjny4VP0oqMqM2P9SHnKrUU6gKE0Tu
 Kp9I9G3M5D8c1OkVTOvVKU8LeSEw5RbrdZpmLpi2Qo/eZJl8W6lD3dg3k g==;
X-CSE-ConnectionGUID: BCnhVQVoQ2eOmox2U/2OVQ==
X-CSE-MsgGUID: U6nwdg7oRZC6Sw/CRPlkjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60965455"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60965455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:18 -0700
X-CSE-ConnectionGUID: z3aDPjPRRWWed7mwLg/rpw==
X-CSE-MsgGUID: kNy4koQvQ/eb3+wzE4ixSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147660633"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wmuxo40nhOCcoPor+5MmMcSNU0y1Dg8yceUenUZ5IlAJwddLOw3rwMxzSWHZDr5yhk13/1+j8hPnrP1VJMTNW2ybla39vxZ8n/j3NErEPuIEfIJ7rmG/lNucRgHi1SK4Mu/8yunO1n1MNSm8VxUMQu1dL74O8y+ih3qk6EVF3tIGRgk8XvGI/sSgXy9iW34fFgl64WQXVZNhFI/D6ienTN5EtNcs8qzko2qu5atLhY2gEeJDxMU8eSkFjAUvvuh1DGR0hiC4UwPIk3iJqpYf9lemFDktX9irodKRDB6Ficob65k5tVDOnzLRLKDYU0HGVL+hVD94hxd4zVNgrt+5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hyrz9bbaZBD9CrBOQVH+8M/zaUycb6bo11I1WGdY88I=;
 b=PTVZzvAq+YHGknTIh5n7AqTXNj4A3jAvaA5AapFhTfXQOpczRaZR8AOPlXwgNfkdQmWvp43cZdPF/zZmDj4Lei/kasWhq5ATSvBgVQz3JZYdszJtdvy6bYRcQmpsuEwZOO8vjVM/CpFhWaHBB/Ta27YacqZfoT5wIMs10ysRUoKcp3xXMtmPkpURbVvwidO+69G8G41Xp3aUfg/tw0d7V35+eRjECMJZr5sRYx5MK4mXgDHr1edsNep5hq2T3qWe80pPdhyhkx5hmj/5vm0J8F85o2mermgJWbiYAtt6+9W3iYNrRbAjUGPeMNbYm5CeC2DIXOeJEcvU9UxsBvLSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 12:08:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:08:11 +0000
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
Subject: [PATCH v9 3/6] PCI: Allow IOV resources to be resized in
 pci_resize_resource()
Date: Tue, 27 May 2025 14:06:34 +0200
Message-ID: <20250527120637.665506-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0172.eurprd09.prod.outlook.com
 (2603:10a6:800:120::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b20ced-c395-44b8-5d2e-08dd9d1726b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkowZ05kSXVJRGJzOS93ZHRMZmcyZ3hDNlowT1lKSmQ3NnVNYWxHV3BrVGcr?=
 =?utf-8?B?TXJFNnV4dzRjR251NktZbVRLWThIaDBObVJLSktXbllzbXFvbUtOVm0yZWx3?=
 =?utf-8?B?TTJ1amVaWlVZaDlNYUgzS3l3NTRaMGVhQm9yNnd0VWd0MUtNSEsrOVdTMXNT?=
 =?utf-8?B?NlkvVnp3eUprcnExQk9OazZyUGdGZnVacnQwek1LcjZ0c3d1bjdOZWh2bzFY?=
 =?utf-8?B?RW81MGxYTldiejNiSDczWFNHNVcyVXlsaFN0bWZkdnVuMVE2ZUQvdGJhMGNj?=
 =?utf-8?B?WmIxZzdVUVcrZ0pjRWhiMWRwL0JjZ0lqcDk5bDR3VStmWDNQcDlqL0piUE4y?=
 =?utf-8?B?SWFFR003MFA0aW9LYWphaFNHUU1RSmk0ZXJ3OG81OFVQSlVRNHFzamtJZFFZ?=
 =?utf-8?B?UmVBa2c0ME5UOWQwUnFhQ3N0RWZkVVZrZzl2M0k3RGlUeTljZGpES3VmVkRh?=
 =?utf-8?B?RmVXQW8xdjU3Q2crc3J0T3JJZEwwVXlmMk5HaWV5Zm1KZDVyMFliNm9WRjFw?=
 =?utf-8?B?eXBXWjgxQkp1cWpISS9iQ0VTMHc4MldLTURvNitUZzJqWDYxbytVbnVHVGxs?=
 =?utf-8?B?V1FOUUt2VmQ3eGpudDBZbzhUWDNNYXlHWVpDZjR6Wm16dndldnNCVG4vOEhC?=
 =?utf-8?B?L1NHN3JobTM5QlFtSHU3bVROWTRJODQ2akQzY21HQjVZK0ZYSFFGWWlJQTZM?=
 =?utf-8?B?N3lSK1hqejFEYWEvalpmUDd1ZmhjT2NDYjl1cWFpU3E4ZVVvWC9NQ0tGUE9v?=
 =?utf-8?B?bk5UMCtWNmpEVFp6VDU0QkwzajRXWnRsMjJ0aytTbUNEQm9kcHQ4MkRuOTcx?=
 =?utf-8?B?Zm9qRGZvUi9EaVF5K00vMlJra2dRamxaeTFyOVZXaHIrWVdvYWlSTUR1Qklk?=
 =?utf-8?B?MnlvcEpiSVhwWk5hVTQxMGVCZ2k2WjBUT1RLWi8zYmVQcGozQVBEc05wSzhL?=
 =?utf-8?B?YytCQk9MWXN5NS83TkJuU3JkMG9wQVcwK0hqZTFCR0FXU0RGRzdydWo2YW43?=
 =?utf-8?B?SzczN2pmdFRaWVFjSDludmxkZHhzOTAwQ0ErV2dkWkhuSklvenRmUmdWY2ZC?=
 =?utf-8?B?YUpyQ3UwcW1JTjR5WVdXNEpYL2VONkpxVTFTSGF1K3NMVWhOM2xEaDI3Tnpo?=
 =?utf-8?B?MlVrZ29oTnBmOXpHbG1zZGkwV3pOM0VaZGxlL2FXRHZmeG9yZ2E5Q00rcTkx?=
 =?utf-8?B?ZXpoQUMwMXdkNHV6Y3U4Y0k2SUkxb2QwVXgzOWx4N3ZPYkQ2b1hKUWVuYmNk?=
 =?utf-8?B?WUx6c3JuRk9NaHR4VFl6dVdSSEpCemRUTDlwaGg1K0dvck9ESnZhNUZPWk1r?=
 =?utf-8?B?SDNobi92bTllQ3RoQTVhY1M3dDFYUy9BeDdhV2tDbUVyUzVnMVFZZDlLMFNl?=
 =?utf-8?B?RGhLNmVscWhiZUlYVnNBRjl6aFVoSWRZbEo3OHVQTXdDdUFkTXlZaTFjeTBH?=
 =?utf-8?B?TXAzUnAwdDFGUzNUYnFSbFNGKy92TGpCUlFWUEhKcGFwRGJWd3RQbE5Edytq?=
 =?utf-8?B?SGY1UXlIZzMwbzFTb0loNUwzcEVXaG5UUFh2dXVrUG04THN0VGZSZmNDUWJx?=
 =?utf-8?B?cWlsQ1BqWE9yZGQ4OExUdXExYldBb2pVQnZmeXlUZTVRV2J6MUtrQ0p3WHNV?=
 =?utf-8?B?aEdpUldmNitxYm1DMHlPWnF0YkdTRFdoRUdzV3FpMHJqamN0VjJkb09TN2xq?=
 =?utf-8?B?VDQ3VjVwM0ZRYnVWNTlsbldrRCtzUjdsUk9jNExHRkJGLytiejNzQi9uTTly?=
 =?utf-8?B?VXorVlNPNTkrcDJQaWl0Um9reGRWMVJTMExyQm5XV0xFdCtORnhzYjFLanFQ?=
 =?utf-8?B?WVFSYjU5Nm5XUDlYTmtjU1ZnNUt5dWpsSlpUK2JITFl1clhSM0pBNHd1Si9h?=
 =?utf-8?B?QTlKYVRaUm0vUVB5RXU2NDFoWWlGdHhiQ2RNMEZRWlhiMEdEdE5XVWwxcVZj?=
 =?utf-8?Q?d5E+IM3/KN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJxOGNldUhlbzFhVEMxVFZBRFFSaG44M0kzaEI0YzF4Z0NseFZGT3BOOGpF?=
 =?utf-8?B?cy9FcTlaenZUUDdjU3dHVUpHcTZFbUJKSGhkalpQYzNGTVhSZmZaaE1pV2E3?=
 =?utf-8?B?ZjZ3WG10OSs1UlZLUUNkVUozQm9HUm44SnFrS1VCcUtaSTJPTDlVVU9Ed3Ex?=
 =?utf-8?B?TERoY0xDRzlGbkhNZzNaV2djTi9Eam4yWXpoYXBJVTZDSE9IWm92TExVVS9n?=
 =?utf-8?B?SGtQZm50Z1duWm9HcUxCY2NYTG9XSEFOTk9OT0FyOFZHVnFnWjVuNmUxRXcv?=
 =?utf-8?B?UnIrTnY0cUdla2hOL09sSnZMNDNXRkFIdG5mN1daTkxrZUtOcGdrRVBtejFH?=
 =?utf-8?B?eXZ6aUlnb3VqazRlYzEwZGdOYkE5ZmpHRktrYk5ZVDVrUi9TczliR1RLaW1i?=
 =?utf-8?B?R3N0M2lka2dBYTg4dFJpUVh3bHpGa1I5U1Q2ZTlKVWw1NDB1MHM5VXdtT1l4?=
 =?utf-8?B?QnJaWEVlMmR2SU1GV1I1QzhMYjUzclkxbFA2WnZHUnl3SXYxUGJTT3JDTXVa?=
 =?utf-8?B?aEtnUGFmb0cxV2hFaUJSc3JrSmZRTXFJNHVDUExFeC9xSW5YdVZnbGNLOUZF?=
 =?utf-8?B?S3htL3NqY0ZMNGVDczdKOGtVZVFDN2JrdU1pREdIL0FsSzNQMjdJU2lKOExp?=
 =?utf-8?B?dkxnUzBsWlB4dTdmN1VMcE1ZWEFNOVFidHZvUHdyQTlTQ3BPL1hzWkI0dE9N?=
 =?utf-8?B?WkIxeWphckdIQWdZMzd0T0tzV2kybmVsaGg3OXJoWUhTMHVNU25yRjhMSldU?=
 =?utf-8?B?ZUY4eDk1eWtZdXpNaUIzNW5zd2JuRkoreW5VNEIwTnZiYVV3T3hkck9HczM3?=
 =?utf-8?B?NEErcWZ1OEFmanBzNGJ5cXhVK1Nsa0V6b3F3QmRaSkcxTWtCUXNINVduOHFD?=
 =?utf-8?B?MmdjWGdQOGRwVzZqNThBU1N4bkxDbnlhdGphNXYxQ2Fya0hlclkvc3RKNWdp?=
 =?utf-8?B?Q1UyVEQ0eHI1VVZOVGNHem1MMmNnNEhjaVQ5QnVMUlY1WVdUVFN0MVFzczVi?=
 =?utf-8?B?UGxQTnNsZnQ1Rk1ZQUNGdzQ4Und5cXoyMElkTHlFVzNXR0ZhVHNQSkY0VFBh?=
 =?utf-8?B?eWlBNUg0eHVIY3h1eXVKbVVEUTNxck51NHpFbjFEVDZuRFB1VXk1bVNzSG05?=
 =?utf-8?B?NlBOZ2toNEQ1dCtodDJSRGVJMmt1QlFVcUdKVXowc3ZjL3NRZzIxelNiODVv?=
 =?utf-8?B?NE9FN05kVHErZDU3WFBZaUNhOHZ4Tmtzd2p0TEthTjA1QlFUd2dsNER1YkpE?=
 =?utf-8?B?Vm5TU2FTd0xNLzlLV1ptQ3FWdTRiSmViRTlVb1cxcmRXVllySTFtSEJGNE9s?=
 =?utf-8?B?RzJWQk1ucml4YjdDVGNaaE9BZGlRWVZIUkJONXRDRUx1am5ySFRYazVkeVlK?=
 =?utf-8?B?WnBoSy9mVVJVYTJ2WURSaFIrdVdZR2ttSkp0dEhXZnduaHE5NTFNT2xHNHRI?=
 =?utf-8?B?TEZJczAyTk9zZXg3b0VrYld0WlNaQTVURmhTVm1qNFJHU2N4UGpSZDdEU2xn?=
 =?utf-8?B?UHBGZlNtM0x0RVBJK2lKaXlabUF3d1k1UkJQYVJYYzFXWEVINTBJaGhYNWFu?=
 =?utf-8?B?OEJhRjZnQWlFYVhMN0s0OTJDenJNSEswQlM5WW53RDZXVGdnY3pFUTdzd3Rw?=
 =?utf-8?B?dzB4WE8vak9md24zR09ubGRaR1ROeEMxdVo4L1FPQ3lDayt6U0x1UUppVmho?=
 =?utf-8?B?UjNHUk1zYWZIeTZmcWJFeVpDRFNMaUFWMTF1WTJzQnBPUlpQWUladkt1ZW5D?=
 =?utf-8?B?c0ZwMzB0NTFSbG9aTEJhbzZVNnpnUlNzZEZqUDdQYTZ3VzRWODNEMmF4NlY1?=
 =?utf-8?B?UmxqMCtXdWUvc1NmTUgzcGlZb2N0TGFtei9MS2dRdE5kd3V4V1d2K2EzMkVK?=
 =?utf-8?B?aTNGbkhXeitkREdpby9kdnI1czBlWEFoWUg5M0RLNW9PWHFlNmhIazNrOGRC?=
 =?utf-8?B?WUlpM0NQbTB6TFNVM24vZFcrZ3FMRm9NQVpveFhwci9JQ1FwLzdoMkUzVk9p?=
 =?utf-8?B?c2tWdUlCcTk3cXhBaGhlUm5iS0RkczMxTU1EWjlubnQrblE3elhwVnYwNHBB?=
 =?utf-8?B?R3FLT0c3VVRCOEdUOFlucGh4NmlucElBQ1EvdGNyamx3amVIR3A2T0dpMURL?=
 =?utf-8?B?SmZvSm40OHpKS1NhdGNwb3lxWnRmUWNEbjdZZDR5Q3lISCtMZWJTWVUxdzhx?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b20ced-c395-44b8-5d2e-08dd9d1726b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:08:11.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U38wYW4hMZTPbaLy21OAC4z6C6yMi7Vgk4DU23h6CLKmyL0dD7RCnZplDJA6vsjne4uvkJ49PUD9ResD4aJ4Mirff9KODjVKlJB1ShUYzoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 21 +++++++++++++++++++++
 drivers/pci/pci.c       |  8 +++++++-
 drivers/pci/pci.h       |  9 +++++++++
 drivers/pci/setup-res.c | 35 ++++++++++++++++++++++++++++++-----
 4 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index bdac078045525..852424cf2ae15 100644
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
index 9cb1de7658b55..77c414c79b5f7 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3752,7 +3752,13 @@ static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
 	unsigned int pos, nbars, i;
 	u32 ctrl;
 
-	pos = pdev->rebar_cap;
+	if (pci_resource_is_iov(bar)) {
+		pos = pci_iov_vf_rebar_cap(pdev);
+		bar = pci_resource_num_to_vf_bar(bar);
+	} else {
+		pos = pdev->rebar_cap;
+	}
+
 	if (!pos)
 		return -ENOTSUPP;
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9218f9037546e..5d7b22ae025bc 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -711,6 +711,9 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+			       resource_size_t size);
+bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
 	if (!dev->is_physfn)
@@ -750,6 +753,12 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
+					     resource_size_t size) { }
+static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
+{
+	return false;
+}
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
 	return 0;
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

