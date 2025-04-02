Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4050A78C91
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329D10E743;
	Wed,  2 Apr 2025 10:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQFmjdj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3457D10E743;
 Wed,  2 Apr 2025 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743590636; x=1775126636;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xqjBa+GOh5YnU2xOAJ35dbpaIq9U45tC4hBY3VwZ4Mk=;
 b=eQFmjdj/3c5jqf6ISxQ/wCfGRSXrh3QJJid0LPhqCeq45fwPUOrwtm8q
 jEkAWMNreIiPAJusg5WRooRzCxNw1TgM/dnchsENS4hGQ0DFol3tTQyge
 3pEW0+Sw55KPiS7UK4QqS4DC53dhqnQHd+7yFU5LN6HutSU0zJXKW0D+U
 DtJh4v/DYLluInz/90FNgo3J4dmuMVu9ApUMhX+Cm9moAo/yWR8oy6M62
 jgjBzKzduXnrMuO/it4tbBdb3mPuCJ0HwfsK9QFtfxg2ejH2i4Cd59Q/B
 ZjPxo7HsUf/6FI2iO+JKu4usRDh58P9MWng3TZLyGhwP5+9q9YGlQALqp A==;
X-CSE-ConnectionGUID: /g26sUdGQES+MM1xYo5d9A==
X-CSE-MsgGUID: jTo16rqQTgadgejl2XY3Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="62347925"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="62347925"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:43:55 -0700
X-CSE-ConnectionGUID: xhItt+I2QlGgYPNkR8bOJw==
X-CSE-MsgGUID: 7yJEg+4GSuCzAM3PZlWPhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127172039"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:43:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 03:43:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 03:43:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3vX0wIt2K6viBi0iK0TJSNDy35+QFGL7IZxcWWdiUm17zXkoR1Yx4DLq7G0M/jNIKvolfVeYLJVBkEYUKTbrS2POfPCEAnz8vw0y3XMevMOoDWPD/MYodY8+AURh2S9k3D7dRekMBWwMov/sxVazSIJsApaWsYJ8ToXQRZLIUaJ8lOrsephCGc+uNl5I632uvcWVd9ZOLc5JrGMlzHpYNaZQJvVR7+GD0nso/SliONRXZWnM0SH4i2bFOM59X3NZiEy2sMz/RM361+BLXjSAQJRdfNqxK7TxN3ug4fbTCVlNNs8fx4/fGClobOvNKjfalJrnSt31O0lzwe21H/rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9WTUgR4uOVOVcQQ1iJP3GZRes4vxohs96YFcc11jdQ=;
 b=tEOeIWlZ48Mk765stC2lKLdFedKt2avoK0TsQ/B7Z1QeV5diiXobAt4qvj1WfNSv0QkPEdMMsVL9fwAjrwdXwT4mdsyoJZdLkYC84d4fpaWGPz2B9sAjJWpQx8sj/0no5qcoCXiVDWA01kRwx8E32MF18f7fLaiub142o4Sn6cUe/+daAimt1ro/E5xJaGG6s4RH7505kBnlJpbFtyLE8kY9jd2N+zf38hy8biOnCW1lfE7ZP0vTH40g/UFKcKmyaKJ57AvoYLccbAH+B9vI8iAdf+EHlaOaWO0MBYAgpOPLWH8D7Ujr6WcTXjrqdqQtIqOa7ndjvFyV7MOtKPkALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 2 Apr
 2025 10:43:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 10:43:51 +0000
Date: Wed, 2 Apr 2025 12:43:48 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 5/6] PCI: Allow drivers to control VF BAR size
Message-ID: <fnisbg2bng3f5rkcoc7duzi34g7hghcqgzzehc5v6yb772kdj4@rcjs4mftf7s6>
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
 <20250320110854.3866284-6-michal.winiarski@intel.com>
 <7374beef-46ed-ab53-ccb5-48565526545c@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7374beef-46ed-ab53-ccb5-48565526545c@linux.intel.com>
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 585a605e-1e74-4699-abb9-08dd71d341bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2M3Smd1WTdhYmZ5RHByOTdDM0F1NHJRb0hUQjFZdjJSaHZmaW5UOW9PV3Fa?=
 =?utf-8?B?ZlBVR3dZMjcwbHdPbWlDMGtPZWpwVmJacUQ4RU5PVlRqZ2xjaGdUZUswcCtt?=
 =?utf-8?B?ei9WUlhxU09QRi93cFZaYndrS0IrbWFETGY4aWs5NlVNd1R1eTRyc2Rab3dr?=
 =?utf-8?B?emw4K1c3UXc4akxFZ3FEREpyZnlxbWNxUVFrdGljY0hETmZobEFYaGNCQzV4?=
 =?utf-8?B?emFERVRHOE5oZ2xoY3lRL1NkNWZvWUVFNnNLa3Q1SW54TitlOU5rYkRCLzlO?=
 =?utf-8?B?UFVVclJzOHhPSVNnc0tXNmpuSlVjbG5BMGF4VnZ0WEFtdTZFcW9qSWN1M1k2?=
 =?utf-8?B?dTNhWUxoS1ZMdFF2WU9UTExWTjRpUysyZFlsMmdpc20xajZkYlZtWFkySk1v?=
 =?utf-8?B?R01mM0d2TlNaTDVuNDBROHM0ZjVlVDVlSWYxRjlWODZYN1B5d0xYT1RKbjhm?=
 =?utf-8?B?ZGpKMGF5TFF6NFBkNXMvL1NsM3pTYWlDQ1RaNDBKdE0waTJSd0Y5M2RnSTA0?=
 =?utf-8?B?Z0FuS0RuNGRROStkQ0tPbFAzdEc2cWF4ZnkzZjdNUjYzVk1EWWVLQk5Fd3Fz?=
 =?utf-8?B?NllINjlUNzNEZGVLYkphSnQzUjBULysrc1IxSnZiVmZoYWJ5dFJrQVZnSHky?=
 =?utf-8?B?TDduRUZyTWsxTm1FZUtibitVZFJlSFV2WlF2K3NWbTlBWW1VS0tYZ1VzZGRW?=
 =?utf-8?B?ZnpTM2ZLVEYxaFlaRWdZZW5JczFleENLQ3dMNFRGZlE4YTBlOHhCbld5ZkZk?=
 =?utf-8?B?QkRqemluN0dSM1Z0NCsvMzNPbGtSYWJCZ3BWenU4YlJoRGE0WXlvakI4ckk2?=
 =?utf-8?B?c2JGbjhVQU5VZEQvWWppTTIvcTVQMlJ3cG1jOXhxSDJJWnZEVFdleFE1dS95?=
 =?utf-8?B?eGxKTlZhWDFybWtnbWdDeStFQzVDM0pIajZoblhQVk84cllNMmFDUmZYeWsv?=
 =?utf-8?B?K3k4dTdheWxiWENZUEJleEUwa24wTFdEcFNBU3pHNVhNODNTTDBQeWRpNm9X?=
 =?utf-8?B?QTJGd2MzT21hWHBOczhkVVdvSHhiLzVxZnVHT01lWmowUm5LYkg4V3hFc2la?=
 =?utf-8?B?WVdKTi8zdGtUaFdRUjVPMWM4alhGSlg1Yk9LVlJSSWVUYjVZRng4SDVVdkts?=
 =?utf-8?B?ZXpweWtaYnIxcHJjcktiVlVCNzIrc2xXRUJzaDVReDE5M2NkcUdUbmR6SHho?=
 =?utf-8?B?Tlp3ekNGc2wydDl5Z1BWbmFHYmQxNnRDc0dvL3NHeXpOM3Y3SW1vbUJEbFYw?=
 =?utf-8?B?TmxyWWVpZGVhK1lzSEJ1RjZhMTF6bzBWR2g2M3pBSXkzaVRGdEZYeURxYVZl?=
 =?utf-8?B?eHZ1U0VQS3hFY2FYUnlpenRqWU1rTStxajQ1VFdTNFowaGFKeW10alZZOXBu?=
 =?utf-8?B?QTR2cnNhd1FXc3BPYnU3VlRRVTE5VmlKNHM2V0dhQmg1YjNrVVdQUFIzSFBv?=
 =?utf-8?B?LzVDK29EMHBDL0IxWFA3OGM2c1J0Tzgwdm9RamlLQjg1M0hYZVNqb1dEa3Vh?=
 =?utf-8?B?b2RaQk05QkZjZGE2VVpDaVFMb1JDTmFCQk16cVAyTzI0ZzRUU0c1NDcwZEMr?=
 =?utf-8?B?RWFhV1dUZC9jUGpHQnlVa0x0UmdwUG9neUNXczJFazhjWEQ5UkxaQU1GVzF1?=
 =?utf-8?B?Z0VZelU0aWNkMVNBOEpKUlZhWFJRUFFiNDk2Ly8xMHVqMEJ0WWtrRDYxZm03?=
 =?utf-8?B?ZTNYRVlUYnRDZXZSZFMxbzB0djF2OVNHT0pCek5CL3h5TmFleG9kY29Ld2d5?=
 =?utf-8?B?NHQrWFFvWHFxaDEzV0VLNGNkTFVKZ3lycncrVUE0Tk8wU2tVM1lQWmYxOTBK?=
 =?utf-8?B?OHRxb3FtemU5U3dSb0p2Y2ZISWl5Q1NrMWNPK2dtblFYTFdBL0tMa2JUWWZK?=
 =?utf-8?Q?x6+NClU9OGa2I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3VHeUVPa2ZmWVZrZ1l2UHcrME9lZHJrWlBEdUx1SHdqQUdwcWRmcTYyM0xB?=
 =?utf-8?B?R3hqUzlrUDA0Y2ZVVWN1RlpDKzFILzI5bjhIY3o2aUdhSjdkMTlnTGhvWXN6?=
 =?utf-8?B?cm5KQ3ExaWRQTGtJTitMYjZGZzhBQlArT1ZrWERWMndndnlobjBqTW41dzRR?=
 =?utf-8?B?dmxHc2JDc1pxQ1JTRVFCMjgrUG8rQXYvSGt0a1VPQmE4VktEb1dwM3FqUWUx?=
 =?utf-8?B?NW5LRjRVZG00THNiY3l5WlYyaXVYbUdHN09CS1hZNzNhVERUZXR0dXphTXVj?=
 =?utf-8?B?SHlDL09sR3NXcVcxTlVqeHBGN29oRmR0b1k1dVZ2eEU4Q2t0RThUcWhmdE5Y?=
 =?utf-8?B?djBHUlBrQmloa0xVR09Zcytublo0WGp0LzVPRi9leXI0djlVa3Z5N1FRMHpk?=
 =?utf-8?B?MVdCdngwTkRPVU4rVUhsZ2o0ejdtNGNnbjBLSzdsdVhyOTZLdlh1dmlrbktx?=
 =?utf-8?B?dXA2WlBKZkt2cE9YVXpNampwS2Z0S1hYZXdGMWQ3R0ZQRS9RNDE4UzlIV3FI?=
 =?utf-8?B?anJRbnQvUjVoeUJpeE83aVgvM2xReERUOWx5amNZRWhPNnpFdGNKMUNzNVpl?=
 =?utf-8?B?aVZXMTVHMGM1Mkp4bjRXVDZROHNvajkxVGVkUUZQUWNlVWgxVEs5RkMxcGxO?=
 =?utf-8?B?MXBkNnNMeFArMXhNSlpNVDVsZHR6Z0xVWkZSMUpReEdBU0xFck4zYTBzdW9u?=
 =?utf-8?B?MnR4dzNPK2JQWjczRHFyaXVWalVQZ0VaOHlHL0FjTFVCcGFkNXlhTVdGNWdB?=
 =?utf-8?B?QjBiUjZaSnVxdERZSldSdWNQSFFmUnY0RFhSMzdteDBCRERsV3UvM09vN0pO?=
 =?utf-8?B?THZIRzBlQmx3bm5VU0RLWTJnakZ6RUFkbkU0SDlmMFlabnBhdUhWYzJYQTB2?=
 =?utf-8?B?ejQ3K2FtK3hWdHZJYzJhOE0yOEw2SHFWUXhKUDNybkYvbHZyR1RkSTVqZ3VU?=
 =?utf-8?B?WWI0ZkhvNE1ybU1ZSW95OFZKQ2dDZ2xiK0IxYTF0OXVUbElEVGdaT0pkamFQ?=
 =?utf-8?B?ak1GeHhyUjBoS00wUXdselNXVXNyU2t1Y2FNR2ZBMzhOVTcxTGI3aTBJTUp3?=
 =?utf-8?B?d0c2L3lHa2tFUnU3cnRQWTdURHcyNVl6NEgrZzVzN0RMTlFzSmdJS3V2ZThX?=
 =?utf-8?B?bG1seWNtWmRhWDNzMm91L2VCOU5lSGV1K00wWG80dkMxdVV3UkFHSW5FRXNH?=
 =?utf-8?B?Z09iM1Z0MkJ6YlNPYjJXYkQrQkpDS2h5U3d2MFdYc0dFcm8vSUtBYmdWN1J0?=
 =?utf-8?B?S0RGZVpiRnhLdFVoYVVURTFzZkJWcEhGUXpkQXhrTXphaFg1TzZwVGpxQWNV?=
 =?utf-8?B?Rk41c3dEeDRsbjNFR1ZCM1l6WUpqZ1ZYZkpPV2FVdUJlaWZ3VWhLRCtPZkI3?=
 =?utf-8?B?ekZoTmdvZitDdnJDQ0pWTFdVMWFhaTRFM3p4encrUUdZZFM4K1F3cWRBcVlz?=
 =?utf-8?B?V1ZBV2lhWGE0L1V5Z1k5TUF0dVY5d2dtZk1tWnA0U0NWbVZWSy9DOUsrTVVh?=
 =?utf-8?B?Um9wTjNmaEtydUM2Q2RMNWwzNGpiV2c4V1NCYUplMit4anpXUGoyaE5XU1J5?=
 =?utf-8?B?MzB1MTJBRDJ6VWM5RkREZktNS1JNMHZJY1RtOGJkZmpBNkRhUkprVG9GMEhk?=
 =?utf-8?B?aEtFcVlpd0E5TjhSVDBPampteEh6RG01N1pGVE5Edkhzelg0NXJJUWRkR1or?=
 =?utf-8?B?S0ROR0RyVWtnVktUSzh4VElCU1I5ZmhKSGF2b3dIM1hPWDNFVU5LbEp4NmMx?=
 =?utf-8?B?Y0xrZEN0TUxEbzN2SjJqSjh3T1JwSlZNb3ZSS3hZWkF0aDhwZlM3eXZ1UlhL?=
 =?utf-8?B?RGRSRklTRUpMRU9manpmWUxUR1hkUGlOeUp2RktCT2ZyNy9IUFBHeDlRNFY4?=
 =?utf-8?B?OGptRTJwZVJRRWR0T0lXR3ZhV0VlWG12d3BVMGFrMEgyRjNXM09xclVNN2dN?=
 =?utf-8?B?cEhsMGxiNWEvL25rYmtCSU93bEdDOXRCSVg5Yk1jbzJQb1FGc3BiZFc2bkZZ?=
 =?utf-8?B?ci9ETEs5MnZ3MDV1ayt5a1VlT05IMktJQkVWV2c4MTNwRDdmbkxYMXJkNjl5?=
 =?utf-8?B?QWJwY2hVdlFwZTJ3Ym9KbXo1YWFvUVZZeldCT0VKVTdxLzdVSExyb1JERGdB?=
 =?utf-8?B?ajhKejduVjh2SkVCLzgyUVdxMFh1SmVWL2Vhc21HTlF4UjZaUE4zQnJTNXNG?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 585a605e-1e74-4699-abb9-08dd71d341bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:43:51.3234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVhCGvPUuUgn4dVHfsU1SHnWXimYEdddW56mDzh+J4At3Cnyn53DyKAzh60rMbY8qIiUhLCnAY/GV9FibLlbFD5Ko47sFWu6c9pnRjvdpF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

On Wed, Mar 26, 2025 at 05:22:50PM +0200, Ilpo Järvinen wrote:
> On Thu, 20 Mar 2025, Michał Winiarski wrote:
> 
> > Drivers could leverage the fact that the VF BAR MMIO reservation is
> > created for total number of VFs supported by the device by resizing the
> > BAR to larger size when smaller number of VFs is enabled.
> > 
> > Add a pci_iov_vf_bar_set_size() function to control the size and a
> > pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> > allow up to num_vfs to be successfully enabled with the current
> > underlying reservation size.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c   | 78 +++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pci.h |  6 ++++
> >  2 files changed, 84 insertions(+)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index 861273ad9a580..751eef232685c 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -1291,3 +1291,81 @@ int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn)
> >  	return nr_virtfn;
> >  }
> >  EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
> > +
> > +/**
> > + * pci_iov_vf_bar_set_size - set a new size for a VF BAR
> > + * @dev: the PCI device
> > + * @resno: the resource number
> > + * @size: new size as defined in the spec (0=1MB, 31=128TB)
> > + *
> > + * Set the new size of a VF BAR that supports VF resizable BAR capability.
> > + * Unlike pci_resize_resource(), this does not cause the resource that
> > + * reserves the MMIO space (originally up to total_VFs) to be resized, which
> > + * means that following calls to pci_enable_sriov() can fail if the resources
> > + * no longer fit.
> > + *
> > + * Returns 0 on success, or negative on failure.
> 
> Return: is the correct kernel doc style.

Yeah, I just blindly followed the style from surrounding docs. I'll
change it here.

> 
> > + */
> > +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> > +{
> > +	int ret;
> > +	u32 sizes;
> > +
> > +	if (!pci_resource_is_iov(resno))
> > +		return -EINVAL;
> > +
> > +	if (pci_iov_is_memory_decoding_enabled(dev))
> > +		return -EBUSY;
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes)
> > +		return -ENOTSUPP;
> > +
> > +	if (!(sizes & BIT(size)))
> > +		return -EINVAL;
> > +
> > +	ret = pci_rebar_set_size(dev, resno, size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
> > +
> > +/**
> > + * pci_iov_vf_bar_get_sizes - get VF BAR sizes allowing to create up to num_vfs
> > + * @dev: the PCI device
> > + * @resno: the resource number
> > + * @num_vfs: number of VFs
> > + *
> > + * Get the sizes of a VF resizable BAR that can be accommodated within the
> > + * resource that reserves the MMIO space if num_vfs are enabled.
> 
> I'd rephrase to:
> 
> Get the sizes of a VF resizable BAR that can be accommodate @num_vfs 
> within the currently assigned size of the resource @resno.

Ok.

> 
> > + *
> > + * Returns 0 if BAR isn't resizable, otherwise returns a bitmask in format
> 
> Return:
> 
> a bitmask of sizes

Ok.

> 
> > + * defined in the spec (bit 0=1MB, bit 31=128TB).
> > + */
> > +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> > +{
> > +	resource_size_t size;
> > +	u32 sizes;
> > +	int i;
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes)
> > +		return 0;
> > +
> > +	while (sizes > 0) {
> > +		i = __fls(sizes);
> > +		size = pci_rebar_size_to_bytes(i);
> > +
> > +		if (size * num_vfs <= pci_resource_len(dev, resno))
> > +			break;
> > +
> > +		sizes &= ~BIT(i);
> > +	}
> 
> Couldn't this be handled without a loop:
> 
> 	bar_sizes = (round_up(pci_resource_len(dev, resno) / num_vfs) - 1) >>
> 		    ilog2(SZ_1M);
> 
> 	sizes &= bar_sizes;
> 
> (Just to given an idea, I wrote this into the email so it might contain 
> some off-by-one errors or like).

I think the division will need to be wrapped with something like do_div
(because IIUC, we have 32bit architectures where resource_size_t is
u64).

But yeah, we can drop the loop, turning it into something like this:

	vf_len = pci_resource_len(dev, resno);
	do_div(vf_len, num_vfs);
	sizes = (roundup_pow_of_two(vf_len + 1) - 1) >> ilog2(SZ_1M);

Thanks,
-Michał

> 
> > +
> > +	return sizes;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 0e8e3fd77e967..c8708f3749757 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2389,6 +2389,8 @@ int pci_sriov_set_totalvfs(struct pci_dev *dev, u16 numvfs);
> >  int pci_sriov_get_totalvfs(struct pci_dev *dev);
> >  int pci_sriov_configure_simple(struct pci_dev *dev, int nr_virtfn);
> >  resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno);
> > +int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size);
> > +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs);
> >  void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe);
> >  
> >  /* Arch may override these (weak) */
> > @@ -2441,6 +2443,10 @@ static inline int pci_sriov_get_totalvfs(struct pci_dev *dev)
> >  #define pci_sriov_configure_simple	NULL
> >  static inline resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  { return 0; }
> > +static inline int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
> > +{ return -ENODEV; }
> > +static inline u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> > +{ return 0; }
> >  static inline void pci_vf_drivers_autoprobe(struct pci_dev *dev, bool probe) { }
> >  #endif
> >  
> > 
> 
> -- 
>  i.

