Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D42AC44E4
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 23:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8410E400;
	Mon, 26 May 2025 21:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMKWxPCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B210E3C4;
 Mon, 26 May 2025 21:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748295881; x=1779831881;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=g2dq0XPvnhR1Amx4YxlbVLd+m2WZrb4Zs331i3A6xCs=;
 b=XMKWxPCqUIdIgdj+/x+shnbk1UhlTeOe5RQuOGSzlgy1P9bHQdxdYcun
 Ai9UWg6sjN1UWzvQQZgC2Hc/1uCHGOByivsQpjBxUL5LbRN4qYrq4TrPJ
 lCpBJ+gYO2Iv+z4YgmrZIcW/0TMkvHWwpo2nzPUBKvM967c0RFENwKZPB
 pif//9SeZcf2oGl8uGVNdjhrtShU/5V4oItbAlOPCbj5vAMCgjYicQzbj
 gXO6PGdxCHD9ArQZF5gWgVUnRWvH7ocYbGzzaXbkQQeQ5hZbY16tflU0O
 mkeQtLyHJC6PaGB4xAJMwvp34Sv/aiMzsdN8OmXKw/yva45yayDDWqcZO g==;
X-CSE-ConnectionGUID: qTMkikp2SGennL2y+GqRJw==
X-CSE-MsgGUID: uQx0uJDIR5itVwu+Dm1cZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="75667627"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="75667627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:41 -0700
X-CSE-ConnectionGUID: oNoDIiH8Sn+hdezgpMesbA==
X-CSE-MsgGUID: uC5tVNgDQ1uWyeuEMhzlJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="146412649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 14:44:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 14:44:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 14:44:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 14:44:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWR5uiICPqMf4I0xXvcfZvI/XW7pTZgqn/xRVfmTCofv5XKZ0mgGvnWWUu29tu20CHvXz24QqWm53aSyYlLnd0z+B+3wGtvjbZPzPY2oTJ+2bCdjCdR9y0z3UsrlRD3xhXZH3+tE1BUaD+Jqj5zD6lCUdx68s98xm3wj+UILlI8tNTWoqJVrDyhgsGYZcK0LhVJDISWqq4t/ehCjWc77mUutTeWcuNXxZjCB0dITW8VAMjDEZ1kBiGEE5gBKFJfvFDEYqbYLbGG0yt8/AwSsivL10L9X3JZmksR4R/rRYqOL+PX/IR/SrEr3o1WBV355S9ZTdtgyxaEExpguyCbUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok7HwypShamelDqIYmtclbFAYfBVIaEHnCw4hC8AuDo=;
 b=KzeLtCJPZ6CIFTdQX8jYycVSiqLY/W/tSQfOa3Ys+TK0+Bb9tvWBAG4AOE93jnFIx9Z5ajUNOAQc9bldHOWVzg3U0dqBKeIzUB1dDcMnyzv/HGJO0xEX1FaLYkWkEjTLsdGVMLRzr4+YC063kCEBnT7dT54IOyFius2+gVxGepgoHbPbqTxh611ExL1q3gKdUN3wqD2wEgl1IUXl4upAbcmffrvkj6tafxsftG5zWlKpIecvfB0y04H+xwHllKlV1wSfEGfXxBfK50Gz3UcP9VTkTKj0l8aCzmgorqsSr6lXbEiwKdQ5ONNqXn+/Hb9Go/e/ODJ/SCGT9Ac4lT5sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.24; Mon, 26 May 2025 21:44:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 21:44:10 +0000
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
Subject: [PATCH v8 0/6] PCI: VF resizable BAR
Date: Mon, 26 May 2025 23:42:51 +0200
Message-ID: <20250526214257.3481760-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c1a892-d7ea-468d-8aa6-08dd9c9e72a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1JhM3ZnakoxV1pYUkNIRXdrMTZ4VXdjVk5GZUZlTmpRbkFqenZBc2twSE91?=
 =?utf-8?B?cWxZckVNN3h5M3lsL0oxazBLblk4YW10ZllMZHlYakJycG9icnhLend3NHNt?=
 =?utf-8?B?cGpuTkVtUTRmUEM3NFhXZC9LQi81SDY0bzVsQnEzajh2RTB3R0djb1FKcVox?=
 =?utf-8?B?TEhNc2hHNzkwQnUyaGtzL1YrZ1lrVjFOVzdKOTJoT3ZMSVJ2S3ZPdXEwdEtq?=
 =?utf-8?B?NHk0V0pkVGlWYlZWbWVxS1A3Rld1QUIvRzhLcVJyNUJkWk1wdHd0WnF6dWxY?=
 =?utf-8?B?K0h2VWl1eVRPLzYzNlNoSjNqcThldXQ0bHdWSms1Y21McXkxRFNrcHdLeTlN?=
 =?utf-8?B?SXR4aFU1TGxyTWJBczZ1bEZzMEhhZndZaDlSTHJBWFA5UkZYZ2dsd3FkK0Q3?=
 =?utf-8?B?RDgrZ2o3VU5TQmsvUm9oN3RVNTBuRmM0eGpiMGpKQmVkOVg1b3B0eHJOeTd0?=
 =?utf-8?B?S243Nnpwa2dtOXRUcngxbVF3RWgvNEVDUUpkWW9wamZWRlNzd0tBWVM1ZCtP?=
 =?utf-8?B?WFI1K2tuNzdqL05FemJ6elpKRDl4QkZDQ2FUaWZmZkk5aGdvLytiWVJ5Y1M5?=
 =?utf-8?B?SXBhR1kzUGlaMXJIWklRS0pFeG5NaHZLNDJwNThXaS8yWSttYzZSZno4amc3?=
 =?utf-8?B?TXpxKzdjYm50MmFzazNZU0VqcFk0UVN5S29IWWhzVXR3eDd3ZE1XeEZFUy80?=
 =?utf-8?B?MmVONXozeFJ0UEEzaE9Ub2lPZXhLRkdwT2lCQ2dBZFlMbFBGajhpUkFCcTBD?=
 =?utf-8?B?REdWRjRqTlJma0NnWSs3dWNQSm9vYzRzaUtsQU9HRk84SG53OWVXOFJRYVhv?=
 =?utf-8?B?ZjZGRHJ6amc1MmpMY3FVTk5wTjEvdWRWbTB4dVF5L0VMZW14cklBV1dUWEIy?=
 =?utf-8?B?TVZHeU1RNXZqenR6K3R1SFRUdmxCNHJrK2NnV1Z4bERLcjVsUTZlM2Nrcmpt?=
 =?utf-8?B?RDBhWEdhM2I5RXhFQ29pMjBVKzdYNUhWKzZhQzNhR2hUY0w2R0cvRHU3ckxk?=
 =?utf-8?B?aDM4QUdiVzJZRDd4aWhFeDNBbTNETDIvVEF2THVDN2s5S0NuM0ZtZTlxUXZX?=
 =?utf-8?B?Q2VlakIvVno0SDV0eHZYSGJORHMwNVBrNEVrWW1taU03Uyt6YWpUaGxDZU44?=
 =?utf-8?B?eTdBWVlpVEp2aFNPTzhFOFZaTzhja2xNc0JwelB5MmJ5S1A4aUR1UkkzQUpF?=
 =?utf-8?B?a3BOWitQS0RobW1Fc3dCNko3VFVxUHFpNG1ZclQ3ek5NVWZYdWlWd3B5d2Mw?=
 =?utf-8?B?dk1zTDltTzhPVXVFYUxKMjArd0lGVml1TTkyM3AvamNMVm9ZK3d3MnllRGpK?=
 =?utf-8?B?ZWZwUWI3ZFVmcnpESDY5bFlHUWliYnlBMXROUSt4bHdEc2xXYUtqSXZobkwv?=
 =?utf-8?B?akZXRUVTamJlNlZLallBcHQyT1FwSnZWSHdpdVhDYWZROGtyVHQ2aHorVjM2?=
 =?utf-8?B?RUZjSDN0VlJyVThFdFEyOXFaUjdzUlQvYmZmQ1g5T0JOYlhqOXNueld3RU9X?=
 =?utf-8?B?dVlWdmVodDVmOVh3Njh0YjN6LzlKV0FYdncreWxpdjNVUk93eGQ4dVJhWVZP?=
 =?utf-8?B?Q3JrWVR2QjBTN28zeHlYVDFqTDUxVmZXMTY1Wjk2VWZVWWtvRDRmRTFYWElh?=
 =?utf-8?B?Nk04c3RCdjIxZTVRdzVGU0FoQkk0d2NHMmg0S2lhdjRmbWVsV2NOSkVoNFdZ?=
 =?utf-8?B?bFBzVG5WTVFHaUtBQkNVbXMzRXI2Mno5cXlLQzlNUXVlM0R1V0xpb1R4NmVk?=
 =?utf-8?B?N2hXcXZPSXRsbWtZckR0OHRhWm9DK2Qxek04UEhYUEYrNUVYRnhiMkNsZHlO?=
 =?utf-8?B?a3dSMER4TkFsNEFSSzhjVTdzZFRidHp1bG1id3JIZGlmMCtSYmQrMTV2WGht?=
 =?utf-8?B?akozdUE3bUU0YzdSQkNZdHl3V0pVQ05BNzBpUnJVZHZId0lqRTVSOC8rdjYz?=
 =?utf-8?Q?enSHXzy34r0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWoxQ1ZQYnFCKzZOa1FWV2pBYVg5aUt4QzB3WXdJbzlrc1F4MTZ2VncrQlJF?=
 =?utf-8?B?KzNhRjkyRmJDRm9Kb0dYT1dWVUc1L2lmbWxyUUdaTldRWFdKbmJ1REhaanFM?=
 =?utf-8?B?TzdVdUhqNVhDTFNteXo2TGVudnZ6UHhyKzlBS1Q0WEVyam0vUTdDU3p1d2NZ?=
 =?utf-8?B?d3d0UjJVay9HRjI1WUpzNnhEc1ZGdm1kcDU4Zk1od01pYVlObkJWZi91UFRi?=
 =?utf-8?B?VXYxMGtrU0MyRWE0ZW9Jc2JYcFJjdjBOSGQxM082KzJLcU5na0VLTFFvUmVO?=
 =?utf-8?B?RUJKMHBWckVzYVJXdXlLZFhLVU9vY0FvRWt0aU11S3V2ZVd2NnBOU0JZT1U2?=
 =?utf-8?B?ZHlac2YyZWE0UkhwNEtpYnB4VTd6bEtNMXJSRzlwN2FWZFUyWC9POEJ6UkNx?=
 =?utf-8?B?QTdkQ3NhdFFkZUJpd1NjcUdWdXFaNVFGRE1uSE5hMVBPcmJNbTI2MVZ3NTd0?=
 =?utf-8?B?NCt3UUVFZ0FoaE82THFrQVJ4Y1BXVk91YS9VclNyTHdOWG5yOGQvZmxXaUNH?=
 =?utf-8?B?TUhPNmwrdktuQi9Uam5namZoNHhHbUoyTWlKTmhFR2pMbzE3OWZjb3dQelRi?=
 =?utf-8?B?N3QyTUlUbnZETUo5aXYrYktJRGI5SnpzYmxFai9kdG1hcUlHUHhTT1BaMHR0?=
 =?utf-8?B?eGhEYXV1WEhOa2NxZmxKaDZiT0JYQURETnpkMU1CV1NHQnlYNlRkV2daMUpt?=
 =?utf-8?B?TERzakdlOTFSdi9lUkhHL1AyQ2lSKzhwZWRpZUJSb3QrUndmZlRUZUpyc0Yw?=
 =?utf-8?B?ZDNaakE0ZjZrdHF6WmlwdC96a1EvaGhMVXVVQVA4K1ZhM3YyOGhuckRUSU4x?=
 =?utf-8?B?THBZaE9udm1OS0dXbkg4cGxsZ3U5T1M4dG0vd0NON2I1dWt5eDc4SExMZzhO?=
 =?utf-8?B?U1JldmxwK3lPdTZUVWszbk5YWk5CdmFXbkx1MWNaTXB5ekFGNWQzQVd6QlNp?=
 =?utf-8?B?Zk9CRVNydER5U1VtTmlBZWN4bkV1WlZ2RzRjZjg5Q1Q3U2VKejhPVi9nMEpu?=
 =?utf-8?B?OEkwWlR1eXcxaE91YXgwTFkzSXo3R0c5SUpzQ1N0V1EyaEZkSjJaRW9Ga1g4?=
 =?utf-8?B?Zmlzd1BVRmpuNW9YMFVweDJJYjFZSlZpZ24wSVd6Sm1nKzNLblM2SmRlNWk1?=
 =?utf-8?B?NWdrUUFraTNQZmNQVmJoNEVwZGFzK1c4OFZHaWFHVkZhK21NRDdZTDBNWEIz?=
 =?utf-8?B?UWZSREZSOFp1N0pHMk1YT09HNytjMDdycktVWUxSclZlb0x3ZGp5b05XekVU?=
 =?utf-8?B?a1doc0RoaTgrbEtOMkNFNittVmp1NkkvU2dtTkVvNkcvRExuZ1RWc0tlUEF1?=
 =?utf-8?B?NVFkdEdxR2VkVnRRaHZaMjVFUlpya1daYlo0NnM5d1dxQjVNTkZjSUJ6YThR?=
 =?utf-8?B?KzJtUWdreUQrbmY5RURtY1N2ZURZWjZwNjdIV1I2K0hLOC9kRjFJVmtpL1V3?=
 =?utf-8?B?MHVjbzFqb3RMK3UvVHgwYVM0TU1vVFhzQWJuZ2dRRHloWWRscGN0QXZKdExN?=
 =?utf-8?B?V1d1ak8zY1hrK3ZmeVJkSVVkdEs0eW1kV0NJc1ovaFdxSy9zRXJtWGh1YzVm?=
 =?utf-8?B?OGVPKy9CNUpmV0FNV2pWZzFLSHFvNDVOOSsrOGp4UkRpRjFkWGc2czJrNUUx?=
 =?utf-8?B?cFBtTFpTS2JKdWo3dW9QV01hdCtMb3JRTnBTUHdmZjg5QjNnUTFGWmVBUW5O?=
 =?utf-8?B?LzBZNzV6bkhuNjZaT0NsWTJkOVlvSjczTUZiQzFLU3VQK3c5Z3lzRFlxSnZ3?=
 =?utf-8?B?c2szc1BXbjVMTW0vclh3VUsyQkJXK1Q2YVZWazFlMmtCN0Z5d2JRQ0FkZW5I?=
 =?utf-8?B?Y2FtM05lTjJOZDJrVXFOVk9FbzdhNmxnVjJKOEM2MGE0dEJJZ09SUzBQa2t4?=
 =?utf-8?B?NEMxcm5BL1V4ZEpqY0pwVTBFcHF5dGszTnR1a21uWng3VWZpNlYwZnBjV0VO?=
 =?utf-8?B?YWlSNldWVXFEaE43ZlV6VitCVGhsenRaOVBRWVZ4OUQ5UXpWWFMvTUJHYTg0?=
 =?utf-8?B?ZjJSbDRhMmt3eVdoSXByRXZwSjZYcTRUU2FJbG9vUHNYd3JjQlpkL1dsdG1D?=
 =?utf-8?B?YWZYZExQemppeVFhdHB2YjdYMUs3dDFZUG9CUFVtNzJLandPNnExU2JRNElo?=
 =?utf-8?B?Z084N21OSDZBY0xETWE0YkRJRlU2SEFqaFNaeFNRN3IvTm1DZVdZMEJuNm1r?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c1a892-d7ea-468d-8aa6-08dd9c9e72a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 21:44:10.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxsxSRhdHIl7OdGncPyd/iqAsYm4dcudpNySvAf3MCMm/zeFEdsGn7KYcLaASMModNlTYJ/mPk0YIV54p3MaCQ7XqPAqB3miNHf4s6FsHGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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

Hi,

Another revision after the feedback from Ilpo.
Missing includes and variable ordering were fixed.

v7 can be found here:
https://lore.kernel.org/linux-pci/20250402141122.2818478-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v7 -> v8:
Update variable ordering and missing includes (Ilpo)

v6 -> v7:
- Eliminate the loop in pci_iov_vf_bar_get_sizes() (Ilpo)
- Use helper variable for indexes (Ilpo)
- Kerneldoc formatting (Ilpo)
- Refer to latest PCI spec (Ilpo)
- Commit message wording (Ilpo)

v5 -> v6:
- Rebased on latest pci/next
- Cache the VF resizable BAR capability position to avoid multiple
  lookups (Ilpo)
- Use pci_resource_n helper (Ilpo)

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (6):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 153 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |  10 +-
 drivers/pci/pci.h                 |  29 ++++++
 drivers/pci/setup-bus.c           |   3 +-
 drivers/pci/setup-res.c           |  35 ++++++-
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   9 ++
 9 files changed, 250 insertions(+), 18 deletions(-)

-- 
2.49.0

