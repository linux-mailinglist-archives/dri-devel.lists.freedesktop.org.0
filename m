Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A597CF45
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 00:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2EA10E77D;
	Thu, 19 Sep 2024 22:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoZV4y5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4210E77D;
 Thu, 19 Sep 2024 22:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785520; x=1758321520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MSeyN4wI4jVrwrpXPBfwNiYCVHjQ+Ol9ePL96RONo8M=;
 b=XoZV4y5E4X4FmJYMer6hJKyjc/h3/+RqQ9aM3WR5Ey8iBBB0D+37RL8v
 lVvbYL56mq8GxzJi8s0l7AUGXmSjrTbZ3CoyUb0QlamOoY+I9r/RM0dvL
 oRdYFAGJ0NQXBpZUAybu7qe6D8awgKmkeaMBHzK+zLGydcs9nuqr6zLHx
 fO2cezOzMpfzHb0aSipkoM1SHDJ4AtsvGsz4LwsGaBAUnVojpjz4/4mUl
 6K3dk0PfJ0GkVb7s/yH+Zr/uQrOttnL1qQMRVf9OL2Z5Z/dN7+hFHTCll
 lfXTL/CgCOPDp1AXc32MJ4RGVZHVWWZNWPiD7HcXjL7fCwrYE92ECHmJf A==;
X-CSE-ConnectionGUID: OQuv7upzQq2j6XA5quA0nw==
X-CSE-MsgGUID: ctEPQxzJSwy/tztpZ7T30A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29514956"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29514956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:38:39 -0700
X-CSE-ConnectionGUID: Pn8z3yzwQTKH9IJ/iNg+wg==
X-CSE-MsgGUID: byCZeJhwRsKEo/WHBH5olw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="75061372"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 15:38:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 15:38:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 15:38:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRDtmc3qxEDj/GP5TG9fMRsl31OcYAPGAbSBHgiVAH7wP3x26yByo9BA9JDuXPXo+K8MODehFEOH0mLsekdzzcIxDzGXZL271G2LbkgX/51+enOAqxhSL2vyzy00KYVRtTGJU1HrLGAxWceOl27pqmY2fBY3N9SCTvqrB0lF2LXsEQhxEuaJuZ/lgqcKwFWAXXd4+lf7h1ZswBIIDSKDWpE/9tTcMvoUCUZKE6EEcSBCCb+5VTeIylp8AQbqnp+9I2ips+2NunCM5S/302lOXuioGyOvGYfSdPU4teC3M5fuHyGHjzdfJdJJa7UfDOEfYB+i+5tZuDzajceArZAY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdvethQQmrLnacOS1BtlWoV6+5D4782RcFBDMX3Og/8=;
 b=kJClbz9HiqsBHGHhbxBmZ1xY49D8s1w7+QvpsrMXpTIusdoDR1vNwR3aB6G6vyp+idXLKMcqn387VOTFWxf+UuBWgTgGQ0tpoBLWHaawdQHkFkDNpPiEdhNiRhLccQrwgzh8ZB1xEj82sq8ocO4j79Om6N54oATz8kcbNsA9hCA91P0a0N48RfSzkXaZ3vJ674sKbZpXnT/3QBdTLImoTsZYLmr7h7Uaiy/8mLyLjpXPIve+TRkBecUMgXNELKD+2DVoOuBgWeTgcDNtgfh8ossWH4jls7tJKWQQ3nual6mcBxZrVinWB0Jx4tWduIortOl2tuxizgnJHjG731AXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Thu, 19 Sep
 2024 22:38:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 22:38:35 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pf: Extend the VF LMEM BAR
Date: Fri, 20 Sep 2024 00:35:57 +0200
Message-ID: <20240919223557.1897608-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919223557.1897608-1-michal.winiarski@intel.com>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc9c587-ab64-4b4a-0a05-08dcd8fbcc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTNBaFh0Qklhck5iNmZhU0RPR0lFNnNhc0R6aFNpWGtvL0s5Qk5JcGlJSzBD?=
 =?utf-8?B?K0x1R0xYL29nbXBmUzdIVU9ZdGhQbmgvK1d1OUk4WVZsM2dNQUo2MDJ5cGFB?=
 =?utf-8?B?Z3o0MVdEdWhpc0o0UDNyMzZ1VnorbEpIZDNsVCtPRWsvOU9oVUNEWWY2QVJU?=
 =?utf-8?B?NWN0aGxDaGlwZENDeVlnbFc0cXF1Q1dkc3VFOXAvdldxZklIMmxZNWxsQmFJ?=
 =?utf-8?B?dmowblpHZVUrRUgyd2hqTnk3SGxZQjdUQnBKRUwvaGtiYjh1c3ZhcWJjY2ZP?=
 =?utf-8?B?WFJreGIyQldJSDBOZGxYSHRCd1o5ZjZzaWtPQUxkaWZPc2RQNU5ZYXJsL0VT?=
 =?utf-8?B?VENqSkVZV0lyYUZTMFdLZkpVL3JObVVIRmc3b0pSdWUveEFLNE5FdXhDc1Er?=
 =?utf-8?B?TVllOHRjU0J3L3Npc0QyOXR2dWVTa0FoT3N1d0Nvd2JocjN3dnhlaHRENDVO?=
 =?utf-8?B?aGxtUEJhRHBaUUxxY2N1OExuMTZCNTJBaCs0Ym0wa1BPMEFqOWxEZUVsTUdE?=
 =?utf-8?B?SjhUYnR3YmkwNjkrQnk4SUd5VGJjQjRndWZIZVM1MGk1UnRIZVV3UXdlOERt?=
 =?utf-8?B?dnV4ZXpPdTQra2FKVEI2WEkzWmI3TVhYRDFYSmt4aENSYVE4MTBWeEhCbzI0?=
 =?utf-8?B?akF3V2U4MUcwajBVd0tHUUVvRjVQdzRTZDRFbUVCOGsxWDdIZXUyeXJWUzly?=
 =?utf-8?B?dzRVUVIrWTUzUXJqUWRyckJVOFM0RHdkaUR3MXBzb3l1VTNENlhxWkpyRllx?=
 =?utf-8?B?T1FBY2NkVTNrakl0dzl5ZUtiMzRqWlZXNVJRS1MyUnk1R1dVOTBJT0pHOTFE?=
 =?utf-8?B?OHFPdk42SzdnNGFxTjV3VnQ3eXdieERNeW1GS0M2SENIQzYxKzVWQmxaZGpH?=
 =?utf-8?B?V1Z5TFpuMTNRVUk4aERYRDZyRGhiaWVDaWMvZEw1QU94R0t2R25LSElYRFVB?=
 =?utf-8?B?eXpkSlg1dGZQN3pCRTdZSU1vZEp3WFJTZUFyL01sOVJ5ei9JbHpqcWE3d0Nj?=
 =?utf-8?B?dWQ5Ym80MjNkWm9EdCtxZjBmRDR0UjhHUm93QUlZSlBtVmVSOVoxKzY1NXhH?=
 =?utf-8?B?L3hBdExaWndyN0Z4elU2YkJCcWkyZHo4bXZZVDhoTlVpSndxRi8yVUo1b2Z1?=
 =?utf-8?B?c3FYR3dHRUM2VTJtR2pTb1VZWk9jNHZrN1M3ZFFDTnRiNzloSkpXQlFaU2p1?=
 =?utf-8?B?clFrc2xabmVGYjEzQzlwRkhuc202NUV6ZkYrQzJ4clVseW85OWN3T2VIUE00?=
 =?utf-8?B?dVhCQ1hNaGtIZ3R3ajlNRXNKcWhjTE5yRFBKclB1aDdwV2F4cUY5ODZ5RWQ1?=
 =?utf-8?B?aVFWVDhoTEU4RFVBM1huell2Wk9JMXZuOUxTODZvMmgrRkJkUm9iN09CY2JY?=
 =?utf-8?B?T3VWeGtIeXNMQ0d3MUltbWxMNC9EclJTV3VBK0VNMDFHaGRqbkpFcEpxWnVV?=
 =?utf-8?B?NzBibGYzWjdzYTN2MCtIb3VZZUFrRDQzMVFkck1odmMzaExranZDck5TanZX?=
 =?utf-8?B?M3Z3dVg0ZGZHaEFTd0szaFVPdzhOTG1jWUtZbmhpa0htVCt5MUVRUEVpbU1M?=
 =?utf-8?B?alRadnc3dGF2SDR1azVzYXVSODRKV2lNMXZ5dlk1bEQzTEcrMHgwMXBMaW9C?=
 =?utf-8?B?TnFrRWF0RTgvWEY2OU56TkdHWFBRczRSWXk2b3gxc2psVGg4Y3prb0h4M3NY?=
 =?utf-8?B?bmRRbmVwcWkyUnRpdjlTU3J4dmZESXdscGxQeGp1Sk9LUXE5Vjc5RzFnZEpG?=
 =?utf-8?B?M253TWw3anBOTERVVUl6S2lLV25WQndhUitiekxmWXVzYWZNNnBQV3JMalBw?=
 =?utf-8?B?bWFxY2tYVnRmRWNnZkYzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJLYWRLeFhnM0FtdHYzaEc0bWVmUzNLaG81bTR6SDV6Z3A4enFwYndvS1p6?=
 =?utf-8?B?dFYzUStjSEt1emZYd2hkcUR3bjNad1FJQTRnSUc5RzE5STc1N29YY3pSYU1Z?=
 =?utf-8?B?a2E0RHRiOUZvRmNTMkpqNTNqSG5HSUtjZzdQZXlUWkRxTXl1R3o5VGp5U3Vu?=
 =?utf-8?B?UVM4WVdKd2ZOdnNlVmpBb3EyUm9vMjVNaDZITnNzTEk1TXM5Z1U0MmJZeWVW?=
 =?utf-8?B?OWdHZzF4ZXZWZGJrL05qT1ZDSndEUzc5M25rTmEvdmxwL3A4SC9UVTVqMTVz?=
 =?utf-8?B?SktidHVPN3RZVU0wb3drVkhGa3loK016QW9XMXU4S05MQnlYWlZ0RDNieDJL?=
 =?utf-8?B?eEhOanVDNGJML3cwSW81SjdJM0dwN3N1YUxCK2JUMTVPeUFic0QxczFYcjk4?=
 =?utf-8?B?UDJ1elNOUldGYVFMb1BTeHB6VVNtV0REczFLU0hPYlE4dzRYUTdXZXdjWUJm?=
 =?utf-8?B?OHJJVnBKR1ZTNnhrbm5LOEkwWTBWVExDVEluMFJzSCtXR1BXd0lwakFKVTVt?=
 =?utf-8?B?NHdxR21vWU9qeXRLZ2ExRWgzakRYWHVjOW5jbEhER21VRnNaOWdOSnVhaVdK?=
 =?utf-8?B?T1VsYmRtaTdIZEhqTjZOeFJkL1dBaVJFV3lzME9tN29XbnBxZFAyWlNhTGpC?=
 =?utf-8?B?cEFNZ0QxZXJKUTI3VWtBVy8yZGNIYmNWa1dsL253RGRsYkluZWZ3ZWJHcUpo?=
 =?utf-8?B?aFFkRFB6Sk1HQWFSLzIrSWFyZFdQYlAzdFhCb3d5d1BCN2tFSEFxem4xV2Nr?=
 =?utf-8?B?QkNTN3NhUFdWcXRFaXArejVBL0h5QkpWWnpuNjR0bEh3MkdJLzYybGszamNl?=
 =?utf-8?B?WkVqbEZjTlpLaTM2d0dWMmx1T3p5Q2YreXVOVTAxc3dzZXNDWHp2QUlBcE1W?=
 =?utf-8?B?T2lOenZiSXR6ZkljSWsxME9aREhOV1BrNkxyUUdRQ2tQaDFNM2JsZm50UWk2?=
 =?utf-8?B?LzR5UlBNdmJYTzd2NitTeFNiUGM1bUQrWlE1WGRDOUpEd3dUclo1NzI1UlBD?=
 =?utf-8?B?Z1YwS25hNFdEYUxLR29EaEswM25YUE9hanEwNEJENE5sZ1J3WjBXMk44RlVJ?=
 =?utf-8?B?TVhHYnYzbUxpTjFlSHNvSkRvZEpRRXhKcFFHa1dpRzVWMSttc0FVWGxmZU93?=
 =?utf-8?B?YVpybkdjNWw4d2F6T1o4bWRpNk5tRlhkNXcvZ3NGb08vR28rZWEyZWpvNitt?=
 =?utf-8?B?L0ZQNlJDVDluNUs3Tm5QNEI0elVON1FIWkpFMGtlWFhWWlVOYXRlOEFQWXd5?=
 =?utf-8?B?L2dhcHNERVd1TFdSN0UzK09VbEFqZitPZ2ZSeGhUT2xQTEdlRVF3K3ZGMmVa?=
 =?utf-8?B?dVF6Z2c5MnNMQTNaUUpjbTZ5SytFRzBjYnp0V1czRWJEbERhQkNzL3NQcUVm?=
 =?utf-8?B?anViekxQWE9nZThwU2ZKK0gzNmVoSHorUTJub0JabXE4Wld6L1YvbFhvbTkz?=
 =?utf-8?B?OXJKVFlUay9EWURicXZzTkdOY0QrdGwzd3NZSHRhY1hqVkw1eXlXT2lydnBW?=
 =?utf-8?B?TitSTHJpdUY4c0xiT2RnMEIvSXBxc080QkdDVzc1d3NRZTE3ZkFHRWlWbmJZ?=
 =?utf-8?B?UlZuejhWWmxLOCtmRGllQ1lKREdVZDFtM2tVdllMUkFQazdmODJWM1Q5cldn?=
 =?utf-8?B?RUd6V3lOYlljQ01meVByOFMxR0t2MmFBQjMrRFdGOTBSMG5ucXFreUkzQjNW?=
 =?utf-8?B?RHlIakFrUStReDVHOWlqOVpHOThGMHdWaXpXVEtaa1JyeThSV1Btb0FpYS90?=
 =?utf-8?B?QXBwREVJRDdFSDVCTnVkSTBsRHlqQ2Ixd2d3eTR6VWlhTTJ4SHBsNTZJRjM1?=
 =?utf-8?B?YWltZEJJOVJMSEI3YVJLa0dUM2tZcGx3dGVQa29YTC9sQnZsQUZqcXNQSFZj?=
 =?utf-8?B?cXh0d0orMzRKMkFOclRZSVRLVDNRcGxuNFdiQ002VUM5UGhSMGhuVGdwdEd0?=
 =?utf-8?B?aE4xbzAwbzZGLy9wcGllZDlib2tsUnd5WHpvZHoxcEZDbXJETFhvellpcDBp?=
 =?utf-8?B?M0FBTi83MDFvUXlyK0c3ckx3K2FURXFYaDUwaXE3N3pKQ1pUR3Y3RDNicXoy?=
 =?utf-8?B?R1g2Vno2OXA2OURSS3FuODFaeHhscE1nRFE5Rk5WVFV1WEhyR29XajhNKzYr?=
 =?utf-8?B?bTYwdERiUk12cmxBNnZaZm9zV3NScTBoYnpjL0pnelp1ZXEzUkFWVCs0S2ll?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc9c587-ab64-4b4a-0a05-08dcd8fbcc2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 22:38:35.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhWq5Ou/S9pCrLSw6dk7TVZ/fARnnh93WZuppRqFE6dsLQxQ3EBE9jFZ/CNj7knqx6gFj/dp8iZvvdalqbRRZg7gP8n6imqbziPbczEg950=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5824
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

Opt into extending the VF BAR.
LMEM is partitioned between multiple VFs, and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h | 1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 0f721ae17b266..a26719b87ac1e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -4,7 +4,9 @@
  */
 
 #include <drm/drm_managed.h>
+#include <linux/pci.h>
 
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_module.h"
@@ -80,8 +82,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	int err;
+
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	err = pci_iov_resource_extend(to_pci_dev(xe->drm.dev), VF_LMEM_BAR, true);
+	if (err)
+		xe_sriov_info(xe, "Failed to extend VF LMEM BAR: %d", err);
+
 	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
 }
 
-- 
2.46.0

