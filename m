Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE891C363C0
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E1A10E772;
	Wed,  5 Nov 2025 15:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4hA2EJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CDF10E783;
 Wed,  5 Nov 2025 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355457; x=1793891457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iLI8JrHHVQ2cYjhscbGAx5Lh+VTaODeQh/bwkTRrP8o=;
 b=E4hA2EJZlRH+5M+cz1XQtKuUPFO1pIKYhAwqPpuN/fp6OAzZoKZisFuD
 mUZtmkvP8l4CXj25Z3NL2m6YjzytN9c5PcJ8FyWaN72Kf654xPg098aWQ
 CCyhHQQYFwoEnt4aVRLo8wHqb74A4OoMWDfmxN+Kxk5U80+tmSLH7lIfR
 rx44vWzr9Y5yszgk9Hpvr/8ajywqzNF8F/QGC0g9p6FdNVPAS8bDTvIc5
 oq5qoTn7gNJFIm6tF1ZMeuBZXFUlJVgCoy+9T08Fze8UbMt8fKuqi5ICn
 3KZAZ7CWdAlqXOBKHwJrk+L8MFbrblFwmQzY0fXlvmRGiC6SEOD9y4qRk w==;
X-CSE-ConnectionGUID: uLVgmAaIR2qeLGer58k7cA==
X-CSE-MsgGUID: rfattD9ISmm3F9P8/AVktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67088184"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="67088184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:57 -0800
X-CSE-ConnectionGUID: cROY3iu7S1C9YJUk9XYCsQ==
X-CSE-MsgGUID: LquYTGl1Rta67UShdKY+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="224725349"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:10:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUBD6Du7pNPrif+ulboVWxf6pJfMTTCWgHKFdFNtzjaOXZnqppGBHSEskwFPVpxtcUbPhsKWBT8TT2AXjGafQAHUOIh2Qa2SFEZLZmtKndMdX6YJQ68VZ9216C6NFkJ5A8FbMzBlayD3TMF68cmwLYKuFR0PtTfChKG7FsnN57p9UWxQUxfvvzogTy9q6bTaca96E+zZwM8xzpL2uHAbh7Vap3AETIiRN2Oje9566+HDhGeXo3BOX5Rpr38S8RfOOSZaW2IaE/n9+L+sH3S8t0/qyAqKh0ySGbphTPzFrOcxZcaPWs5rEiR6CxPoP47epZtx3flOlwfZZ8qqDjA11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uqQJQhkv31wXmqP5UoOVV2fWguWHzqPsmRB5Q2ru+w=;
 b=pGxK8wAr6dkMqQdHwnKjhYufBQrwO0PgNcKlREoMV4bIZTVNLaQIIB8LCCj0v+UVAHBEdz3L7uJRb5PtWWkaHZorXDuG2flGRQkIqN+7tOc32bWgh5/PSNy9ukkhssDKPWZHsdtTa9ix+fx2C3zIuv4cUYnOGPh6GbAcyedUaNXyOokmN9SLpXlE909PBHWYUAmN2UrVJ+l3YBtq5VvbhQ1b6wWfTYvnVcHURdfy9hQ+CL9xLlgHbdrQARSgMWzh7a4my5dM2t/vGSgFrAP4cYHVQPiWaPIHWkoAOx06qW6qwRXdCcLktO+GvA/6DZVWc+h1wqwcQEBoyRmoph6chg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:10:54 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:10:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 02/28] drm/xe: Move migration support to device-level struct
Date: Wed, 5 Nov 2025 16:10:00 +0100
Message-ID: <20251105151027.540712-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f612888-39aa-4798-d7eb-08de1c7d8389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0Q0SmxCdlJhWXRySndPN3lZblJ1UTYvbGg3TVloYS9sQ2pHQnFmcjBjalpn?=
 =?utf-8?B?RnBIaGE3T1NpdVUvd2N1NWZ6dGFqbCs1Z1ZWR2JzK3BveldXT01pQmQvV2dZ?=
 =?utf-8?B?QzBTVTBzdTN5aGdENG9yZCs0MU0rZElzQWh6MHY2U1Jxd2hrQ0kxNmxBZlU0?=
 =?utf-8?B?aGYzd0tKQktPNFFrTys2QXloZWgxK3ZzYnhBa2RtWW80S1JoMnIyRDZJc1Nv?=
 =?utf-8?B?RlU0TXplRkdXWk9pNHE3WG5GWE50RzhjbFJ6THJ5VE5rOE1RRFNQNWtmR3oy?=
 =?utf-8?B?eWFKQW1INnpnblhvcVQva2F5L0doQXhoRHVXK2ViMGxqV0FvWDQ4VW9XVjQx?=
 =?utf-8?B?NEZabWhVOG55RHpKVmxxalIyR1RrbzEra3F4azJ4ZDRUaEJJbm1VLzQ3aElZ?=
 =?utf-8?B?TUdEcU9ZUnNkSm1OSWdlaTRsZmRrZ3NoWmdYelZ4dlJqKzZYTUcrRHJOQ3FX?=
 =?utf-8?B?RnhGZkhyaFZZR09IQmNnNUlXL3pROG5OdWd1VzNCN2xXM0gxNzBBclA2Qkhv?=
 =?utf-8?B?N1l3NkNzTDFDRlh4MkdPZFI5RVQxMCtkbzhIbEtDSnNISkpFRjUxNnBCZkgw?=
 =?utf-8?B?YytRK205eHIrQ0diYWpoMllGNVdBUlh1Z3Jxcjd0UnQrY1o5bnp3dGtjMVZI?=
 =?utf-8?B?MEMrdzVDWnhueUQyS2RoQnNLS1U2RzhtUnVBMnN4MU9BeDUzRUZGUkt5dFhp?=
 =?utf-8?B?UCtnV0pjd0VERThzTnZNRko2OENueG1XVk9oN3g1ZUNqemlZeWg0YStZMXN6?=
 =?utf-8?B?ZmJLM1ZReUJJTFpwclVGeHEyb1ZMcnErc1BONmowUHQxY0xyQnlTbmtpZFhw?=
 =?utf-8?B?eW1JNGtraFlLZGo0WDZOd0x6NDdLRXNhZVNZY09lVkxzUFZwRWZRd1FxT3Vm?=
 =?utf-8?B?VGRDTTJuRy9aYTlYMENsMHdOTldMSGJ6TnVrUnFPUTFhZE53Y2dUdmV2Mk9o?=
 =?utf-8?B?OENOZFlxRjZoM1JxQzRFejhOWmRUNnJ1SkJpUjlYY3NuUlIvRElVWWMxSVQr?=
 =?utf-8?B?OEtQT043Zm1QRm5jK2xHV3Q2elRWSWljV2djSmxITzErMElPK2QzdUpGL0VP?=
 =?utf-8?B?bWZuM2M4NDV2aTdJLzBKN1FScEVhQmJuaGRzUldONkhQak9qNzZNSUl0RVJW?=
 =?utf-8?B?Z3hBU09FTExGV2tvNDlkVHhINkloemZISUg3d3NucldacngxRit3STZrdGNr?=
 =?utf-8?B?WFUvdytpQTRSdzlLc05WY3ZWWWJnY3hJRlVMb2t5ekdBcnViWHVPOHE2M1NG?=
 =?utf-8?B?YjBTcVRyc3ZFL2dFQno4MDJBT2l3ak1sbEkrbFgyMUs2YUluSkQwOFh4ci83?=
 =?utf-8?B?UFRkYmxsT3J6eGdWUjVpOXVqWnlVUGU0cW1saklwR3BhdzN6SmtoOEFONVNH?=
 =?utf-8?B?NXdOd0dHaEFkZGlibmlncGlFdzRwc1ByZlNXSUJCamQ2MTFkQXBxRHNhcWpi?=
 =?utf-8?B?bGh5ekVnc050WkdDWWFTbXR3dC9vWlhwdzdPaWJRWXV1alNWbTkzN0dRbnhN?=
 =?utf-8?B?R3NjUDRBUmJJRmZhVTROL3p3NmpQTlVlS2R3VUxDR3N4clVZUUV0Z3BkQWtq?=
 =?utf-8?B?dFdPSnAvUUNEYktiV1RKVStyTzlHS0VRdUJvdW9XdVlLcHdXcDlXQy9pRjdL?=
 =?utf-8?B?S0ZHNmoyWnNnWDNCcm5ncWw4ZnRCZWQ4UFk0ZE90S284cklwbUpROVVUZ001?=
 =?utf-8?B?am14NmFyc2FTaU4zcE5yQ0JnWlQvdnVHNDlPM1I5VkovVnZybCtqYXFrY2tm?=
 =?utf-8?B?QjRqTUdYeVBuS1RaZzNGS1lYbW1Nd0l5RVJXMGx2WmllOXRYd1ZiRW9aUmRk?=
 =?utf-8?B?SHlFVUZvc1hLYzdPdmN0b2RlNHloajlHN2hxSTR1Z0hrYUNxT1pkb0dXbVgx?=
 =?utf-8?B?V0R2NUQ0RmMwTWowaWpqd0tpTHE5ZUtRelRHb2pGVHc1K1VhREk5Z1JHZURX?=
 =?utf-8?B?UXN3aDZLM2VPcm9Zd0t4TmpEM2FkbDVaMTNKWUNWdS9OeERrSjk1emNPYWZt?=
 =?utf-8?Q?dXyjJj4dzwpDKqZlT9ziCLO2z013Bc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzU2LzlycmdvSDBjZkVvZVF2LzY5S2V0ZnF0U0ZkazRQeGRaL1VCa1lNMnd3?=
 =?utf-8?B?aXZqNjJsWVZaaWhGL2pUOFZGQkkrSUVDcXBlOHNFWVlPWG9TSFZuUlhpUkxX?=
 =?utf-8?B?ajFhMnVnL0xydWw2SWlzZk5ONE8zY21zbERORzdZNk1IejlnVitBY3BaNXdy?=
 =?utf-8?B?Z2pOZ25SYjJ5NEdZeHlSbDBlU2l3TXJoTnNxWkJ1VzdEVW9MaGcxeWdGRUJE?=
 =?utf-8?B?cHZrMHRoVmJDWW1Sb2hLRzNTTUlkenE4SnR2aGw0NTc0a2o1bFhJWWlhYkRI?=
 =?utf-8?B?WkFyRDA5a21VNEdSUUk2SXFFci9GcElveTRRVHNERjdLQk1VNTFheWhBZERt?=
 =?utf-8?B?WDFDZnJBOTNxM0kvTjM1QnFrdHQ1MGM2aFBpd1FwL0ZUQ3pEaCtWVDcyalB1?=
 =?utf-8?B?UldrNFdjM3VYNXk5YmJFQnBaWklMV2R0blVVOUNBN0xpM3JISElIT2IvZnM2?=
 =?utf-8?B?VU1xYXFueGlMNFp5aHBvZTdERDdSSnl0RmVyb3lWWCt1SS9SVUZKczd3c041?=
 =?utf-8?B?eklkRGw3cXljRi9UbXhGcDlmUGNhWjcvdHpkYVBKdFRwS3V6R3dEK2VPcUw1?=
 =?utf-8?B?SnFydGxjeE93Z1NmTG9LL2o4bXZlcXZCTUxuQnE5R21vaVF2c2ZSTm9LS1Bw?=
 =?utf-8?B?dnkwZC9ySCttcUFxb0tkNkx0SUlJRzdEUllFRk54enFzUmR4QTBEL0w2Mmwr?=
 =?utf-8?B?VE9UcTRjaWEyRkFmenZZUzlXZ242OTVtQnZONzNHUGdMU0g5Q3F4aStwOVpi?=
 =?utf-8?B?dWFRd0VwdHFBTGttcVBOUWF1SGdHcUl0Wkd0MjMrZDFDWENUV1BQTWh5VXdm?=
 =?utf-8?B?UjVIM0JlL2cvWk8rZXZwbzBZVUdFZXI4U1VLSmJBV2hUSHl2a3BZK2tKVE5O?=
 =?utf-8?B?Wi9vaGQ5eHlVSncvY2lCV00rdmxLb244QmU5YnEyRUZBMWdobUpWdVNKd0VQ?=
 =?utf-8?B?QTcvVzVXTXBsblpSdlFWckxKc1U1MXpRdXpzUmx0N1FGNll6c2YvN2hTNjhO?=
 =?utf-8?B?V0duY0xybHd1RWJuUXIrNGhPeDdUVWZmZWFFamgwOXc1L0ZmL0xVS0lsOVdq?=
 =?utf-8?B?c0VUamtqT2M1dVpWcjQ3czVrSUNlWjh1UWZITE1SMXJlcThQWXVDcVZiK0Fu?=
 =?utf-8?B?dnlOWWhLL3hNK0p3YjdJNlNzSnBjNmJ2QjJzUHNXZkxrWm5NTnRTOWxzMVRr?=
 =?utf-8?B?WVJkZEhtaG9ISFZEK0VjU3A2ZkpOV1dRUDlmSW9iWXluLzArdk9mUUU1S1dk?=
 =?utf-8?B?WExraTRXNVh6Tjd2bUp6eEVxWFpNOEpXT1JQdDJZNzJKTWJqOHZtY3FPZmpk?=
 =?utf-8?B?QU1vZVJwY0hncUlzY05qaTYzd2xXNmNLS21NYnpSdCtNSklkZmwxZWVTaVJY?=
 =?utf-8?B?QXhGOXAxQ2NXWldySG05eE1LMWkvY1hLTHN4UlRkaW1pRC92Qzl3anBCL2Er?=
 =?utf-8?B?R2dtY1g4NDczcnVXUFkwaE41UExYUkVhRndKOVJraFBaMzJOS2FZUEx5UWh1?=
 =?utf-8?B?Q24wdWJqZDF0N2J1WWRJSlBBTFBsMjlKRWw1eUJoOGRDemZrNDg4dG1WaHlF?=
 =?utf-8?B?WWxaeEtFYy84aVp6MnpyOGpWQVNieWdhTWVJdDFxMVNvYUdBVFlDZmVxNmtu?=
 =?utf-8?B?ci9jUmNNU3dSRWFGYmxjTk5ucS8weHFjMkxQUjdnMTBHT2w5eEVQUWxkNmZw?=
 =?utf-8?B?QWo0OXdvZktDU016dUZRUjc1b2tMVmhGODJZN0VqeEZrdWlBWUlGNUl6UEFW?=
 =?utf-8?B?L2gzV3FHYkNOWGRRUmNoY3lRUjVtaTFzaExZZlg4b04vV2FDVFN4OGhXTjE0?=
 =?utf-8?B?ZjVCcG5ERU02NzQ1ZUd6dHpRME92QTcyUjFUK3Zrck5WSjQvNnluM2JuZ3hZ?=
 =?utf-8?B?REt1ZjVxMU1JN01EZms0Z0p2S1pmT3VWcSsrSzVqVlZaWUFiWXY0d1VyRTZN?=
 =?utf-8?B?RVVZVHZmVHd2VHBMV2ZRdFpCaHgzR1J6akdnNE4vWGp4TUVHVlBlcGRUR3o4?=
 =?utf-8?B?ditCVGFYZHp6QjNqR1pqSnFWdTh5MXBVQVdXcitwSEJndVJaOVhSNjZnYWQ3?=
 =?utf-8?B?K09oRk04WVc5TkZ5ZUk4bzdKallHL1N5YW44M1VKNEd4dlBiRkhTQXFybUNn?=
 =?utf-8?B?c2NKOGdSWlA1MjZ1dUZFZjBsZXkwTlMxbUhqTW5kdml2YzRRQ29oSlVRM2JP?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f612888-39aa-4798-d7eb-08de1c7d8389
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:10:53.8149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qd8kuUprzLdfbPQyAsURRtalDEncWf8zPETpjAdzPMUmeTbo2QGXOmePXKX9bGgNgd8dU30ze/aY7UoRICt4wjdFmsU+s8MKzr8AV8kvRcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Upcoming changes will allow users to control VF state and obtain its
migration data with a device-level granularity (not tile/gt).
Change the data structures to reflect that and move the GT-level
migration init to happen after device-level init.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 16 ++++++++
 .../gpu/drm/xe/xe_sriov_pf_migration_types.h  | 19 +++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  4 ++
 8 files changed, 88 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7b4ca591a4ae3..cb6b30fd8c2d8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -177,6 +177,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_migration.o \
 	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
 	xe_sriov_pf_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index a5bf327ef8889..ca28f45aaf481 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
 
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
@@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
 
 static bool pf_migration_supported(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return gt->sriov.pf.migration.supported;
+	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
 static struct mutex *pf_migration_mutex(struct xe_gt *gt)
@@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static bool pf_check_migration_support(struct xe_gt *gt)
-{
-	/* XXX: for now this is for feature enabling only */
-	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
-}
-
 /**
  * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
  * @gt: the &xe_gt
@@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_PF(xe));
 
-	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
-
 	if (!pf_migration_supported(gt))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 1f3110b6d44fa..9d672feac5f04 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
  * Used by the PF driver to maintain non-VF specific per-GT data.
  */
 struct xe_gt_sriov_pf_migration {
-	/** @supported: indicates whether the feature is supported */
-	bool supported;
-
 	/** @snapshot_lock: protects all VFs snapshots */
 	struct mutex snapshot_lock;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index b8af93eb5b5f5..a6023c2e4b12d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
@@ -102,6 +103,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_sriov_pf_migration_init(xe);
+	if (err)
+		return err;
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
new file mode 100644
index 0000000000000..8c523c392f98b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_sriov.h"
+#include "xe_sriov_pf_migration.h"
+
+/**
+ * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
+ * @xe: the &xe_device
+ *
+ * Return: true if migration is supported, false otherwise
+ */
+bool xe_sriov_pf_migration_supported(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return xe->sriov.pf.migration.supported;
+}
+
+static bool pf_check_migration_support(struct xe_device *xe)
+{
+	/* XXX: for now this is for feature enabling only */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
+/**
+ * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
+ * @xe: the &xe_device
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_migration_init(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
new file mode 100644
index 0000000000000..d2b4a24165438
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_H_
+#define _XE_SRIOV_PF_MIGRATION_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+int xe_sriov_pf_migration_init(struct xe_device *xe);
+bool xe_sriov_pf_migration_supported(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
new file mode 100644
index 0000000000000..43ca60b8982c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
+#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
+
+#include <linux/types.h>
+
+/**
+ * struct xe_sriov_pf_migration - Xe device level VF migration data
+ */
+struct xe_sriov_pf_migration {
+	/** @supported: indicates whether VF migration feature is supported */
+	bool supported;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b3cd9797194b0..b15d8ca2894c2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_sriov_pf_migration_types.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -44,6 +45,9 @@ struct xe_device_pf {
 	/** @provision: device level provisioning data. */
 	struct xe_sriov_pf_provision provision;
 
+	/** @migration: device level migration data. */
+	struct xe_sriov_pf_migration migration;
+
 	/** @service: device level service data. */
 	struct xe_sriov_pf_service service;
 
-- 
2.51.2

