Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC38AC4E44
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EDC10E46B;
	Tue, 27 May 2025 12:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGMa9yfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEB710E4BF;
 Tue, 27 May 2025 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347709; x=1779883709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7x27nvPMamiwAFnLJ4HNoq6PeruwSYFz1B5n7a1TyEA=;
 b=lGMa9yfgQcXVIFXyN0huCDCYV9/i3O66M8ftiaY67xIKxIFZ/YrI9rOX
 Z7Rtm4dRjoikR7vY0fG32wGRKZ9vV9vjsbIK976s0klUM/EQc7kAFCHml
 VDnMNR57VQW30fbGWXBpgA/ZTp5HoBPCkzMRXoVHYfGm8Pk4QLTsxZqfa
 eJt49qpn5Ppll0m5lW+wjka3gwdnbpgH54C4bzaKNdobh3YwfvNy0BECw
 G2qRj/1HL5V4qWutaaqOuWRb1vnnBQJ6QGGMcb2px4iWz9sZJFDTpBE1s
 rp8RAEgKb9lGkOm0XxoI//KMSSRLGyQwoEzbMp6UT8gviSV8EwjymRimN Q==;
X-CSE-ConnectionGUID: 7jXGk7XqTWuPud8kYJk1Hg==
X-CSE-MsgGUID: e4IhfSwTRSuTqMWIU+y/Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60965497"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60965497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:29 -0700
X-CSE-ConnectionGUID: FVP26tt2SPa4slmi7tcLeQ==
X-CSE-MsgGUID: pXKMz1h/SXKiwhHXY5A6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147660690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:08:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 05:08:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 05:08:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 05:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTCF5a5y0WF+bsaZhFbVgYe+T57SVor3XWtzg0NNYK5NnHZV2c5vR7hKJRXvDZEUeEBsXxP5iY+uB71fmypi9fClq4jUSPO0oQ1IUlLBkQ3Pr4gHFz/JUeVF5aJDeMM1rBApenfKn1gcCwILLPTlie5OK9GIbqGbHTWm+naidcGaZfgKQrW16HBdMooEid084LylrdqNCmn5IvxABh5Ys+cOgH8cpmvle9VfqJLsi+yEr9xpGiu4gGEVAb3f/WOygPNB4rlRLgHPrADf6y1lYxXCIO4w6RRDXvUd1NkgvrnVRthfbgJnQpIkvW63zTzwhHLa88POfNnmAmr0QYWT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLepjD4leasReweot3v83n/c8WyOI/L/zXrWKrMXMDM=;
 b=jGTm3zHm7zoWHyDOwJPdjBy4C8rIu2ZNotCPDq69LszGHCbd/iLyx++xoG23ZLQoLtfkca1MLdXSNDrMsrxUTYlW+wz1mnrIswSNfvM3lQC+FqsHPfLdkj3cMhmBGOPyT2B6cIs25bVVhHKdtlcoYQbE+42MLtSP4LYXtih/5W3INH0H+yJzAgbaiYsgIfGNLDrb2Fb6VQyQpkLgsgZsgmESb3GthVktWRjieuZY8beuNian+q+sO6fmKdqUJ81t7V2Ct5B3mfgX9uHTEBQyfz2vips63UOIT1oSY0EK1r/vjm8McS96Mbr71ggo9ABGPlluUzljQWk5DXiLRRqxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 12:07:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 12:07:50 +0000
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
Subject: [PATCH v9 1/6] PCI/IOV: Restore VF resizable BAR state after reset
Date: Tue, 27 May 2025 14:06:32 +0200
Message-ID: <20250527120637.665506-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527120637.665506-1-michal.winiarski@intel.com>
References: <20250527120637.665506-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0054.eurprd03.prod.outlook.com
 (2603:10a6:803:118::43) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b73149-268b-451c-84dd-08dd9d1719de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2QrVCt4cS9KeWU2ejR4ZzdqRUNUaGdlTUxERW1hL2JZSHo0K1BTWWxhQnVO?=
 =?utf-8?B?cUtQY2VrUThKb0JBZjZoMU91aEFKUTVpZ1g0VWw5K0hlR2hqODcyaWZCNmZx?=
 =?utf-8?B?bmtWWjdORzRzdmlzTW1ldkd1RTR6c1V2WEJrL2NXSUcwN1ZBMWlxcmRVVWd2?=
 =?utf-8?B?RndId00rR2t1dm1ydUdRTlhFU2J4ekVpZUthdk9OdWgyaDdIc3BnRVZnK3Ex?=
 =?utf-8?B?MXhvaUNJSUxTUnZaVEQxV04xd3ZVMWkwek5ZRE9HekZucWJyWmQ5ZnJ2ZU0r?=
 =?utf-8?B?NU5taUJxaWw5MENCQXpXcFQzSFp4RHl1QnBTb2xRc1lHSGFsZDk1UVBCaDZE?=
 =?utf-8?B?WEZZTUFJSTBTS0NCMFo2bVhQS0k1Y2VuaG1YRHB0VVU1ZDBNLzN3WWM4WklN?=
 =?utf-8?B?Q1JIL1I3bTN3MEdZbmxTcUpxZG5sV1d1SHNQemtJeHdja3hFQlkvbTB4dFJU?=
 =?utf-8?B?TFdnUE5vajRIbGN6MThqUk5QMDQrek1rT1FtV3g5c0s4YVV1ZmwrbXEzZjVr?=
 =?utf-8?B?WW1BNHNYVndvT2ZKeDRyekVuRlpLOCtjeUVRSlFJMkQyY2dYRzYwVnowby8y?=
 =?utf-8?B?dnpLUUQzb2Z4bVJsWHloWmFyWWp2TEZUaExMRktRTWNPc0JYUm9wTXpBQU9j?=
 =?utf-8?B?M2VaMlRtL2g0VEhDYUo5Q3RFVFdHN0MwYlRIaHBjRmZMRDBGS2ZRNk9KcDNq?=
 =?utf-8?B?dHkrM3RURmNXYVVmUXVJT1JnNURSbTlvc2ZrcWp1Y2lPZ2wzQ3pKSWZQZUQ4?=
 =?utf-8?B?ZWZkU3dNNFV6aEEyNnhxaTZHTGdlQ0s1REw2b1J6U0ZGV1lXL295NUExRWpT?=
 =?utf-8?B?L2ZNQUR5dkdNV01uU2w5M0NlVnM5Vk1EM3RkMlk0Rm9hcGNpdUpNc0VnL1NX?=
 =?utf-8?B?M3h1M3EvTWdiNEdJQlF4VFV2NkVSL1pGWnROYnBMSzI2MXhyNWZlS3RqNHkz?=
 =?utf-8?B?MVROMzIxK1QvNUVxUnFmTFd6UDRuMWJaMHpmc25pOHJIWlp6WW8yY21iRCtk?=
 =?utf-8?B?MmhKZ3BPK1BOTlBsRWcrUmE5a2k0SW45WGJiZi9ET0lJMHZXVWZvbnhYVHV4?=
 =?utf-8?B?elpqam1kb3FPS0h4VHBVT2hTMmNabU9sd01hNlZCTkw0WmRidERBQ1RLdTIx?=
 =?utf-8?B?b0lIQnBSNkdsbzBrTlUvLy95Qjl4cVZYME5qMitjQ1gvK1VTbnJMZXpTc0Ru?=
 =?utf-8?B?NldvNVoramVvMUR3ZDFCWm9wZ25nNkloUVp2RkNmVmxTZWtCcW9MYU9reU4z?=
 =?utf-8?B?MXhUak44ZFFtbEdqaVI1VmFWWGk4QmhKamNHbmkwREtiWnV0RmR4NUR0ekla?=
 =?utf-8?B?Zmxoam9XNnRhelFEU1RmbTU5VHVjM00rb3FEMUZrQ3hSanI0M2lnMEIrWlQ2?=
 =?utf-8?B?OGpZTysvTiswTDdBdVlXeDlqei9WaHJ2OXc2ZzRodWh1NTlLQkU2QVAwNnli?=
 =?utf-8?B?bzNvMWNKd01pdGVWTUZKUG9UOEZxbzBzb01yQTNJWm51SytJS0NBY3JUeGdQ?=
 =?utf-8?B?amlxNE5ybU1xM09jZWx0ZFMxdDNaRWtva2FFZ2JISWtQZkFXTnNIQlhIclVM?=
 =?utf-8?B?SXF6QTJUM0hNZ3VlRFA0Mkg0TlJ4OE1jUjlleDZlSlpGWGRuaFFBL2dWYXAy?=
 =?utf-8?B?eHJLR1N4cm1zZ093Q2xrZDNyZHdMeWJKTWxJRldjM2lOb0VpcFR6SW9Za1Jv?=
 =?utf-8?B?U09wTWN5WGxBUnNWTkREbUFaaEJ0SndkelpFVFgxSkVVaUhkNXJ5NHkzazJW?=
 =?utf-8?B?aXZPRTBHZE5zSGsxV0owejVMQk53YUpQa3UyYU1tUGtkSncvZmxvU3BMaURu?=
 =?utf-8?B?c3E5VDlRSU14QVJ6OVhvY1lqUGdBTjQvajB5RmJQNmhFcmFJVmVLUVhaNnNV?=
 =?utf-8?B?TzFTU3dFY0dVUERkTDQ2azNBOVlKYzl4WjdKaW1RaHpHUXM0cW1mcGk3R0hs?=
 =?utf-8?Q?zNREsF1JxdA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhOWHFRVUpVd3FjWTZNZk9LWi9mSXJMNUlIUDFCQVdZWnQ1SWRsMnExZTZN?=
 =?utf-8?B?ZTFtUHVhSXozYUU4clJ3dzIzSm0zWlBLQkRJZ2wwWkdjNmphb2xyMUtQeWxC?=
 =?utf-8?B?MzlEQzd2ZWhEYXE1b3FURkNscHpURzRzeVZKTndxMVlKL3BrZ3RVYWhJSmNZ?=
 =?utf-8?B?RER5Q0RXQjNzalA3cmoramVTZm1RWlNwQTQ0UHU0Y3RWblpmd25tRkI2dWZw?=
 =?utf-8?B?bG1ZWUZCb2hTQ3Y3MU0ybC95d0toejhzTlZhbVE0dHQ3RzlyMHp0ZmRCWkNH?=
 =?utf-8?B?UTlJbktNZGR6Qm5jR3NIV3BQaHlaZ2RCOG5iekVINlljUjgralR0ZDVjd2JC?=
 =?utf-8?B?TDE3b3JrUGZUWXFxai9meURIUE9KQnZXZWpsRFFBYXhuRlpaTTlHOXRMS1NO?=
 =?utf-8?B?S3BYM0FvLzUrOHU1OGhaUTRta205VEk0WHNUbG5DemZZQjFBMHlYWTd6R0gv?=
 =?utf-8?B?QnFMK1NaaG4yd1IydjQ5eE1tQXdrMTZiakRCOWZPbUNNVDEvUGdTemhVNU5D?=
 =?utf-8?B?OVZ6YmFwY3pmUXZicVZZeFk3YXNtMGpmQ2pyenBDT1VldjQwTXB6Nm1CREV3?=
 =?utf-8?B?MTVsVWp4VFR5eFk2K1ZmV21CRWhubjc0VWR1KzNkczFSSXltUkZYV1FQcWdL?=
 =?utf-8?B?M2lQT2Q1aHNYNm9mNkxteXdPTDB5bnhFcGZ3dDd3OEw3NFlyVi80cys3di9K?=
 =?utf-8?B?QjdxcFowRDBGdXY3M1FPbGpscklyd21EdVIwcFBOZCtVM29YNityaDZUSTJ0?=
 =?utf-8?B?R2FJT2xlL0pyajVGLzdhY3ErbXFGZ1dvMitpUnBmZ0xJYTdLN1VZSXcweHFT?=
 =?utf-8?B?RDBlSnZMTUZudG1taUdTQ1lCWmhoKzMzS0tIcWhPLzFJaEtQZzFlUk9oTC9o?=
 =?utf-8?B?ejNWWSttWTUvR2o0YlFTT3lteFM0K3luVDhZUFFUOGJVT3dEa1pLMDl5SGkr?=
 =?utf-8?B?a2JGREpMbkIxWTRRdDI3RmFVMkJSVm1pMU5jNFlXeitjU1B6UklJbi90UG1O?=
 =?utf-8?B?elJ6RHc5Q2NuVThqUjJoY0J0VTBFWXBNaVBVT3pEbHBlaWNwS1RscEIrcFZz?=
 =?utf-8?B?WC9GNW4xaEtjdW1CVytGcWhxMFdFaldXU0ZOK0hzeDRBTEZTZUlSTzhWelpO?=
 =?utf-8?B?WW9nTW0vV3h6blpNc2NPOUZQRG5sakYwZlBjVndycG9PazNBQTFEcVFkMGpt?=
 =?utf-8?B?ZkhMdEptUnpEeFJ6S09YYmhYc2ZEbVl5YWl5emlxRzRGeWhEM0I0eGg3b2Zn?=
 =?utf-8?B?eVd6R2ZTT0NyTmVqcFhKT0Q4NHFsRWZpNDBCbEIwcmg5QVk3UlNxZGhISDVC?=
 =?utf-8?B?d3p6OXlEdFQ0KzNWK0J2VzBWY2NKUmxnSTZyNGh3dlVUR1pvWkhqcjFwN0lM?=
 =?utf-8?B?MUxFdWF4NzJwMnFlNFJvY0plUUdWeWFZWFI4L21ZRkRnQVVzZlZZcUlUR3I5?=
 =?utf-8?B?ZEVseUFHbDVjbTU1RHRlUjRpSUNyMS9FczRuV1pVMVNtcndpS21QcUxreUUr?=
 =?utf-8?B?Y3M1akNWaXo0eTBUNkhETzQ5V3cxSXVmellXTkhYMmREVU9qVytXOUpoM2RI?=
 =?utf-8?B?b1l0WHJicHIvOFY2enJGNnhVdnVxdVhsWWVkR2U0Sk15MXA1VFVYeGc4N2NN?=
 =?utf-8?B?RGdOMzdBTXhBWXV0WVFhL2N6M3pFeXArS0dRMDM0bzFia25nUVZNZk5TdTM4?=
 =?utf-8?B?Q0xTc1luSm9TS1Z4M052eFpONXpwWnJkSXVKUW5IV2E1c1MyenBUU2loVHl5?=
 =?utf-8?B?eFRvZTNzTlRmUFE5cHZPbWVWYmtaK0tQTzdabzRobzdRU3FORnQ3bUtmRDl6?=
 =?utf-8?B?NzZ1OVdUbC8xc2hpSEs4ZjBxY2RVMGNoa1VDV3grTzFONkhQQUdCWmg4b3FS?=
 =?utf-8?B?dUo2SzMxcVN1dVFldlRhSU1xTkhSdkRKcXdTeWpxUjFkNWxUaDl4U2xrUlkz?=
 =?utf-8?B?SUh3QXZFT2hzeUh0ZkxPZEhDcFRTcFo5eUhmV3NpTHhjMXdCbkZhb2dBVVNo?=
 =?utf-8?B?eXRKZ09mS3lEOExGbVlRSWZLNStCcnRwN1VkTG00bTF1QlFDdHpWS1Jra0Rv?=
 =?utf-8?B?ZndsYzdoL0pUeWtNSXBqOTN5UXJQaHFkVnZPZkpPbDgzYS9RUDlKY2FnUzNK?=
 =?utf-8?B?ZGM4RTd5ZWtlRkUyd1k0VkJrdkJFc1k5QWJCSUUrMEhZeFMrY0ZVbXEyMkF6?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b73149-268b-451c-84dd-08dd9d1719de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 12:07:50.1633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZh20Qyp9iWY2Z1dinqD6r2itUJSO71oInsEJpv2SVB7AzVuaAeg3Q8qBKuD+hPl/7/lc0DhXDHrNmPnWLyAaYlHGop7lSPS/+Z3Ethffuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

Similar to regular resizable BAR, VF BAR can also be resized, e.g. by
the system firmware or the PCI subsystem itself.

The capability layout is the same as PCI_EXT_CAP_ID_REBAR.

Add the capability ID and restore it as a part of IOV state.

See PCIe r6.2, sec 7.8.7.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c             | 30 +++++++++++++++++++++++++++++-
 drivers/pci/pci.h             | 12 ++++++++++++
 include/uapi/linux/pci_regs.h |  9 +++++++++
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 10693b5d7eb66..10ccef8afe145 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2009 Intel Corporation, Yu Zhao <yu.zhao@intel.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/export.h>
@@ -850,6 +851,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	pci_read_config_byte(dev, pos + PCI_SRIOV_FUNC_LINK, &iov->link);
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_END)
 		iov->link = PCI_DEVFN(PCI_SLOT(dev->devfn), iov->link);
+	iov->vf_rebar_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_VF_REBAR);
 
 	if (pdev)
 		iov->dev = pci_dev_get(pdev);
@@ -888,6 +890,30 @@ static void sriov_release(struct pci_dev *dev)
 	dev->sriov = NULL;
 }
 
+static void sriov_restore_vf_rebar_state(struct pci_dev *dev)
+{
+	unsigned int pos, nbars, i;
+	u32 ctrl;
+
+	pos = pci_iov_vf_rebar_cap(dev);
+	if (!pos)
+		return;
+
+	pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+	nbars = FIELD_GET(PCI_VF_REBAR_CTRL_NBAR_MASK, ctrl);
+
+	for (i = 0; i < nbars; i++, pos += 8) {
+		int bar_idx, size;
+
+		pci_read_config_dword(dev, pos + PCI_VF_REBAR_CTRL, &ctrl);
+		bar_idx = FIELD_GET(PCI_VF_REBAR_CTRL_BAR_IDX, ctrl);
+		size = pci_rebar_bytes_to_size(dev->sriov->barsz[bar_idx]);
+		ctrl &= ~PCI_VF_REBAR_CTRL_BAR_SIZE;
+		ctrl |= FIELD_PREP(PCI_VF_REBAR_CTRL_BAR_SIZE, size);
+		pci_write_config_dword(dev, pos + PCI_VF_REBAR_CTRL, ctrl);
+	}
+}
+
 static void sriov_restore_state(struct pci_dev *dev)
 {
 	int i;
@@ -1047,8 +1073,10 @@ resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno)
  */
 void pci_restore_iov_state(struct pci_dev *dev)
 {
-	if (dev->is_physfn)
+	if (dev->is_physfn) {
+		sriov_restore_vf_rebar_state(dev);
 		sriov_restore_state(dev);
+	}
 }
 
 /**
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e39a2a5df587f..5eb9a7558998b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -486,6 +486,7 @@ struct pci_sriov {
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
 	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
 
@@ -710,6 +711,13 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
+{
+	if (!dev->is_physfn)
+		return 0;
+
+	return dev->sriov->vf_rebar_cap;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
@@ -734,6 +742,10 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 {
 	return 0;
 }
+static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
+{
+	return 0;
+}
 static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a3a3e942dedff..f5b17745de607 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -745,6 +745,7 @@
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
 #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_VF_REBAR 0x24	/* VF Resizable BAR */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_NPEM	0x29	/* Native PCIe Enclosure Management */
@@ -1141,6 +1142,14 @@
 #define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
 #define  PCI_DVSEC_HEADER2_ID(x)		((x) & 0xffff)
 
+/* VF Resizable BARs, same layout as PCI_REBAR */
+#define PCI_VF_REBAR_CAP	PCI_REBAR_CAP
+#define  PCI_VF_REBAR_CAP_SIZES		PCI_REBAR_CAP_SIZES
+#define PCI_VF_REBAR_CTRL	PCI_REBAR_CTRL
+#define  PCI_VF_REBAR_CTRL_BAR_IDX	PCI_REBAR_CTRL_BAR_IDX
+#define  PCI_VF_REBAR_CTRL_NBAR_MASK	PCI_REBAR_CTRL_NBAR_MASK
+#define  PCI_VF_REBAR_CTRL_BAR_SIZE	PCI_REBAR_CTRL_BAR_SIZE
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
-- 
2.49.0

