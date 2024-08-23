Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1095D380
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0D10EC7C;
	Fri, 23 Aug 2024 16:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4M28MyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C7F10EC7C;
 Fri, 23 Aug 2024 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724430730; x=1755966730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h2+229BVJU+UiOo3vj6Wrs8aDgmRzIvkGL4XAcpcLOc=;
 b=P4M28MyX6/o1cywWTEAZyU1bUnawnZnQF9sptHz+0D+h1r8PJxWkcHqg
 9Nd7GM4VZqKrKPDa8K3xsZx/ZS/GeCyphQ6+qv8/Z8HZzQFI2Qe+0etQv
 DrF4zd8Q5JqwXwuOdU5Qv+BQi+WrU2mcOE6ThZ5OX2YSTUQzdAhZ4veQP
 Q+2xEJz76Zy7DrSGBo9CNLWqekh9Bs4KcgvAmIfsZiGwf6G2WUsUwQqKK
 iANqqNOvOw6L82d1B32irPmF/NvxBI5sUpbGCjaaRnr+7FZjauNP6GSxi
 l/p8mcsiNopO2DcPl5RPpoQHv8rWv5vspwMkb6fHqKp8k99rpSKLO7FwX Q==;
X-CSE-ConnectionGUID: PVZc8KaZS02fMgD6tELctQ==
X-CSE-MsgGUID: f4+aZXp3RCGHTOAeV8ONMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22431907"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22431907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:32:10 -0700
X-CSE-ConnectionGUID: UWCzwZ38RUqy84x0YEkY4g==
X-CSE-MsgGUID: EyoAYP8VQsCqrQwMTihdSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="85016419"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 09:32:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 09:32:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 09:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qImQjT1/bBc9IwpvF0mv756ZiDeo652FWC/F+mT4Gy67mzIpY9T+tJdGs5QFAfMzxw8/HxU4VVMlex+/KM4f1R/e4ySIiAteZn4FKCbi2/Ww2pkxBGFXYsKT7m3Ti49Ia24QjU/NpKzfTdrf4pKKPJwBWcCp3dxbvquDs1FEeJCCLvTNftZUSxXt5HcYSOB0qgkJvWfecOiEzF9bZqJaS2Id9xtSEuEMNWdx5UTEEb38B8hATl+MaMRRTqDW9xSoPsc28o0cOaElc7icxrXDg+cvXU/16vL7k3vm9ftsBrmnsBm2dWcItfUDOOgrRy5Pacy/glFT4YHq5pfVSWrvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMryctnD0MU+hbcuBpnw8n1e5n9ng+fjtD4HApMOmus=;
 b=ZioCxkmgBP8Zp0JMl99YBFE3fHmTFjaSQ/IQM+bcyXsBaEGvsdIlfTD+fTjhJsT4w2jN4xeHa/v+G9IaaObJXs5w9+65jPNYtMQLSGl5kFF/TU/2vsh6RFUdbgqInwUXPNc0nhWn54IXUls4/flKM8GT+XN4QuX9baQDAKOPEEh4uhvcuh/3fUUkImPTolEaSDeat8Bws+MpRjXGBB8PHEIEScnbtG57013dLNcaPv+MXOA+nauepFvyk8O2a7Jrmm1N0TRsIYXemdpbnie7cQBv9QM/V77jWRTtaTqWnwAuZlTBW7+eqZMTpmSU4Nsv+R9bFKvcSWQuRnFWEsCp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Fri, 23 Aug 2024 16:32:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 16:32:06 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser
 <contact@emersion.fr>, Matthew Wilcox <willy@infradead.org>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, James Zhu <James.Zhu@amd.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Alex
 Deucher <alexdeucher@gmail.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 3/3] drm: Expand max DRM device number to full MINORBITS
Date: Fri, 23 Aug 2024 18:30:48 +0200
Message-ID: <20240823163048.2676257-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823163048.2676257-1-michal.winiarski@intel.com>
References: <20240823163048.2676257-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1358ac04-3482-4876-703c-08dcc391205b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1JHdjFPM0pPN1I1SFY5UDkvUWNrZDVNMjI3Nmc5VEdvbDZlYk92bURIaEwr?=
 =?utf-8?B?TjFSbERNQnRMcitDZHoyWkRHRm02YUZtVVVoOTJiQncrczJMaENLMnFmZ2RT?=
 =?utf-8?B?QU9ZS3JreC9yNzRUQWJ3QlcxV3FwM2ZITTRFK1I1eElwR2VBYXg0clpJbGlj?=
 =?utf-8?B?Q3QrNXpyUGtKUlhWQUdyWllFQjg0Y3pxRlFNbDQ4UnFVVHlWcXR1ZXd4dmow?=
 =?utf-8?B?ZjlHUEVnYlAvMFVsSDRwcHAycG9GejJ5eVBVbDhYd0IrczlBVzM4dHNJbGZr?=
 =?utf-8?B?MWI2a05ORWdGVHZpb0dCRUdOWjBWbEkrUTA5ek8xcXJZLzQvbjdFRUIzaVJ2?=
 =?utf-8?B?eWJ6UWZROGNSNW53MEREbHl6Vkg4TnZBUnNWeTdDN1hDczdCWDE4YUg0Y1NL?=
 =?utf-8?B?b1RGVU1YSTRIaURBTDlET2tDZ09UMTNpM3B1a3FRSGkwelB5VHpvTFVmeDhz?=
 =?utf-8?B?dkRvejNOUWptY2YybkpmMDlKaXZBT0daeEhvVlh0MUZYMU5Pc3htNXF2dUp0?=
 =?utf-8?B?M3kwdkUwMXg5SWZhV1FKNmgyLzlIcXJZRU5nYndZbjNtanpqa2NIVWR1K0d0?=
 =?utf-8?B?aDUvbGN3c0oweFhrU005Zk1kYlRMdHNNVVNjU0tnNGd0TjErQ2ZlQ1Frell5?=
 =?utf-8?B?d0gyY25tNm5BM2JVTTZKWndsejJCQUxGVWxkamdNVUJrQm85VVNQWGJLK2R6?=
 =?utf-8?B?N2Fpc25SVTluZHdYUlZYOWJWbUlLNFdhUEUvU3JUelJqbEkybUhqRUQrVC85?=
 =?utf-8?B?MG9teUh6T1F1dytxUkEvcW5QYTQ2OVppMFJVQXpHM1lmMVVoZE1Yc1RtaHBL?=
 =?utf-8?B?OUhDTzJIRTZUcFVyN3c1dWY3NjRweVBYZkpxMkNMTC9yTU9nbi84cnk1bTkv?=
 =?utf-8?B?ZkdqemYreDBCTUs1Q3pBeFpPQ3JBWXhpZFBNMzFwN0RVVjk0SVpqT3oxT21H?=
 =?utf-8?B?RDJhRWRDWmxBTVF2bHZPNG84bVZKaVVaeFhpVXg4Yk1BZUwxMXhsSjBrMlFD?=
 =?utf-8?B?enVWVmVDcHNIYVZFYVhMSTltL1JPLzc5dVVWM1NkT3YyeVVVdGpZR281UHkz?=
 =?utf-8?B?M1FxR2g2LzV1cFhBYW1OODNtbWFCb3ppVGhtaVRPRVVEN0VxK0tBb1lka29K?=
 =?utf-8?B?eTlIaytXMFZoWi9zTTZXeTVBWklGcFV0azVXYm1XbXRBS01FQ25wdTNlQXpC?=
 =?utf-8?B?T2pvK3ZTcUVVWUdlb1NINGN5ZmpkbXJiV2lXcTZLUkxQUzJPTU9kUlRjamZJ?=
 =?utf-8?B?ZkdNUjNlYU9ucmsyZzNOcUFZM1hTTzl0T2dtYUF2b2FlYjBWTDE3MjlSekQx?=
 =?utf-8?B?NjR6amd1QUhHYmxoT1l5MVdOMW8zQTJsRXVPQUg0elZSOHowNmNDNXBST0dy?=
 =?utf-8?B?MWVmbW53NWwzaHhGY3UxRmJVbFNSbFJTZDhiOVh1ZnA1a096N0cxMUZQamw5?=
 =?utf-8?B?NVpRdUduZ0xCU0pSSEVJZHBTRUI4QWg2ZVJCbXpFbEEycXlCbzl5SDltVy9M?=
 =?utf-8?B?emNSSithRkRXUTMxUmR0MGZTUEdDTkdxOSt2UDZvekpiMEFZeGZkeHN3T0gx?=
 =?utf-8?B?bklOd1VKYTV3SE9FUjNvcHZab1FFVDB0WHQ4OC9KaHljTURULytQdzZIbStI?=
 =?utf-8?B?ZTRIZWFpandTNWN6Y0FWMjRPYzdwcGJaUHR6Y0lDZEkyZ0VjM1NlZ3V0VmRF?=
 =?utf-8?B?ZDZjQnI3RjFsRGdJYlB1TVBnOCtMZDRHS3NpMTNLNHU4MkhPS2xtVWFLUzVr?=
 =?utf-8?B?YURFQTRzV2JRM1dlM2tsbWxRUzVBa3RQaUFNT0V0Q3RPVjhkNEdCQTA5WHhX?=
 =?utf-8?B?V1V3RlV1cUlwcTVjZEFjQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlSSDcxZUFrN0xOc2lGTWV3dlJCcjBYbFZ3MnhHUHhZRit6bUc5azNSVE0x?=
 =?utf-8?B?N3FXQkU5TkJkTjVVN28xUlVLRTNCQlMxOG04VXNRaUo5TTg1Uzg0cnNubHo0?=
 =?utf-8?B?WnRERVNiRGtIdG4xenJhU2FBMVoxSnFoSGJkQU1iQmt6YUVjYWxzcXFiSmlF?=
 =?utf-8?B?V2poRnJXTHB4UVJTYVB0d3MyT3pvYmRiOGc2bXM0Z1ZQcVU4WDFqaXMvMVdt?=
 =?utf-8?B?eDhNcmpvQmU4ZXdHUUlBWlU1WkJqSmIvL2xzRFovaStNTy9xSHJ3eE9ka2lm?=
 =?utf-8?B?aHgyZzNROHAveGtHRWNOWmhJT3hqcUlVSndpVXIwMnhGL0UvcGtsb3BHWlEx?=
 =?utf-8?B?enlhWTVlTEh5elgxRkFtSm1iV2djeXViS0piQ2NPek14RU9QWVR5NU5zREhQ?=
 =?utf-8?B?NUNFMWhPQjdXNHRoQ1J6Z1l3VjNSd2dNUHlmUVlnU3dzZTNFenk0eFl4THBX?=
 =?utf-8?B?aThtbHN4eTlXcDlvR3NoUy9ZOHFBeTR3Q0JCL3pUTFVBaSt1N0VVcFBGbzVW?=
 =?utf-8?B?eGpSKzJJSld5WFlLdTZkVEY0b1ZMUmlNQ2xuRFlaY0Jib1NLUG5GaHFYK1dV?=
 =?utf-8?B?MnljTll5Q2NHUTU4bE5yMHdLeFd0SXVsYzJubWhXM2tBT0c0dVZOUmFnMVNP?=
 =?utf-8?B?ZzExdm5ZK2hxZkh2eS90RVZ2R3ZXa1BwY0xJUVViNVdSZ3pSdWFOVGtMclNh?=
 =?utf-8?B?MGROdFB2K29pSTdRMXpkR1VpTjBuZG03TzhqUDlvMkZqR1NOT0N3K25BaHox?=
 =?utf-8?B?dVJLMDFmNlV6dFpySFhXWk9SVVlQeXJBeVVqK1FZZXBkdlJlQ1c2Slp1Q3Nz?=
 =?utf-8?B?dU9sNTNEZW1wQkFmTTdJeVJBeGVadm1Ic1RDUWszOUVzRGlXcGJEQ1ZHeTNZ?=
 =?utf-8?B?Umc1TEc3TjhlNmFmTi9IZU5LTWdZRmZjaFhyQnhUQzBJaGlsd2Z5bmpyb3Nq?=
 =?utf-8?B?ZTQ1a0t3L21LZzZnanVocHowTEc1QnFIejRpRklyZGhrUnlURnBGRS9ZS3lS?=
 =?utf-8?B?bEkrTHYrUWlhZVVNR1hIeWtyTHRqNHd1K0RtZ3laZmxvZlp3RnI2a0lEWmxR?=
 =?utf-8?B?OERlQWdlNXZRbzJ2VG5OQkl3NDg5cVZ5c3Fxc1QvTnkxSHNqSSt4T2pCQXpi?=
 =?utf-8?B?NUFKbVhCRjVxWUdxbFBmSnFCaU8weTliQmY2OVBBQWZEWEswM1RrZnAwcFZP?=
 =?utf-8?B?dzl1S1Y0eVZBclJ3b2RqQWVieVdJNlFRVkpiaG11WEpLUmw4NnR2MHFCQUpU?=
 =?utf-8?B?RDZtYzdzZ2tqd2Z2RGVYSlZCRzFtTUZUZ1hPeHlydzVxUnpqbERqbHp0SEpY?=
 =?utf-8?B?aTBVUlVuYi9aK3Y2L0pRVjJ3SkJwOFkyRmR1aHBCbjlXRzdDQmRrN3E5azRL?=
 =?utf-8?B?VXZhUHc4cHBWU2xGVGdTT0N3Y3FVbU42K2RyeHRkM3RZSWtRS29XZkwvRTFW?=
 =?utf-8?B?SEEycnBVN0gzNDFaajlhOHZGSEdGZ2RDQml0S1BuZWFaUVhvZ3V1UnVvVGxs?=
 =?utf-8?B?dnJOZEdzYThEVHVmRUlSNmtUMDRMOFI4d013bWduU2EyNTNhVGZWSXNCUVA4?=
 =?utf-8?B?ZW9OT3NLYU5pWGdabm5oaEVVNWlVNEd6bmxNQzFFd3lMQWlPQVd5bnVMaEk2?=
 =?utf-8?B?b1dHNWFjL2xldExBbU5JM2Y3VFE2anYrVGdvWnVza3pKNk80TlVXcnIrdXp4?=
 =?utf-8?B?d29RRkdjbWViNTRxT1BWUnBlUTZwa1VyaFlPR0hjckdKOGFOZWhrNU0vNUZa?=
 =?utf-8?B?VUYrSVBEdnl3MVd4M3NpVlBndzFjZlIzRzVKbEdpZ3IxS2M4ZzNjNHArT2ps?=
 =?utf-8?B?YVVLc3NXTkZLcmV0N29aQ3ZTUzJwNG1QRTlNOWhwQmh3dnVGemNYN3d4ZXFT?=
 =?utf-8?B?WmFlbCtYVmdxUkZCc1crWUZESm00eTFNVWtmM2MxSzNaWXVuclV4QzBHZ0Nv?=
 =?utf-8?B?WHArSkNpdHNianBlV1FVQUdJNkRzajMvdHdzNFJQRHRqZkJKZjFmQko1cGxp?=
 =?utf-8?B?NGROT2FqTGxJczdwQ0M0ZlMvTEZhbEdCS3dyUVdVaUhFbGJNczl6ME5DYjR4?=
 =?utf-8?B?NXhXcElXUUk4WUNVZk1uVThaZG1TeXBKUk5TakZYYzVNNmhrSFhGYk1ENUtS?=
 =?utf-8?B?cXRJUFArbS9ycXNrSjdBSUZPSVoyc2tGNERmcVFiMWZsVXpRN3lDcmJyQzhj?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1358ac04-3482-4876-703c-08dcc391205b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:32:06.1711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBWYO/Ne8glyRGisTU0h/dcZkQs5SMeMq1DggDDJKOCAov4uslPdhAnVmRhUDY1irc4it0dvAQx9mCGeFJRkNHOW3WqTEHvthlYNXwP+Kyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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

Having a limit of 64 DRM devices is not good enough for modern world
where we have multi-GPU servers, SR-IOV virtual functions and virtual
devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
numbering scheme where 0-63 is used for primary, 64-127 is reserved
(formerly for control) and 128-191 is used for render.
For minors >= 192, we're allocating minors dynamically on a first-come,
first-served basis.

Acked-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7e0fa5a2a3182..c734e6a1c4ce2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -121,10 +121,19 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	xa_erase(drm_minor_get_xa(minor->type), minor->index);
 }
 
+/*
+ * DRM used to support 64 devices, for backwards compatibility we need to maintain the
+ * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
+ * and 128-191 are render nodes.
+ * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
+ * Accel nodes are using a distinct major, so the minors are allocated in continuous 0-MAX
+ * range.
+ */
 #define DRM_MINOR_LIMIT(t) ({ \
 	typeof(t) _t = (t); \
 	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
 })
+#define DRM_EXTENDED_MINOR_LIMIT XA_LIMIT(192, (1 << MINORBITS) - 1)
 
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
@@ -140,6 +149,9 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 
 	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
 		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
+	if (r == -EBUSY && (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER))
+		r = xa_alloc(&drm_minors_xa, &minor->index,
+			     NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-- 
2.46.0

