Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA66C526F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19C610E71C;
	Wed, 12 Nov 2025 13:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJRRxGXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C841710E714;
 Wed, 12 Nov 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953776; x=1794489776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+NhxtylLy7TfnzanuboPshugMKe4FqSCsalNbdreIz0=;
 b=iJRRxGXMY88iJJb2D4VBjuxupSj51hGv5pLgxJGtzckFT5fZjdVM0aQb
 /2DAGf1SpGp9M+F5oh6Ez6r/QVsnGusyIbIXfHxV90D32AWH7Su/gJ61B
 I/oPLAW1/9rGDXL5CaLoPt7oUJsqtZBgvKlLtFrXHHdnOb268IXpdQAVD
 oChFOx3wLMtEm8XbQEBuuZgXCWTDtQtx9dEelC0KSc3Aeh8uO9XBe1xjk
 X+bBdjr1C777yAOfXFcSqTNKx7pkGzdvVaQ5q263VPieSa1C5WcmQcgOu
 nfO6bi8pBI3OgJtaFhGPbI0BzUuZdrhAX6VClPRrLtc247XlcaqnSNh+N Q==;
X-CSE-ConnectionGUID: aJwl1lpNRGqGXmiUW/aewA==
X-CSE-MsgGUID: rKxBiYFDQ6KKgLB4aNhDoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64219403"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64219403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:55 -0800
X-CSE-ConnectionGUID: 26Wsh3PBT7WUXVV6zEV7Lw==
X-CSE-MsgGUID: KOIWqSCMRDe01WZSDXVb6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188508254"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:22:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:22:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thu0wC5mAp2dxiaNbUeTFIpaG3HJ+eP/WUX6mEWRWBHPi0vZuIn1O9cWpNkR60BvySbCia6Hoeaz0y2qlZHWyhqNbhRbivUFzUoeO0ChNnBEwCtlTbA8NAEJBjZ3XeIBV7Rn6c+G6D5ZjXdmEtcd2J7AuAJgkRmmvIVcRHiEND5Sji0P9pkrGdvFZX2cfYAKISHZso/hRJMEYxqgF5xfWbLW70/zhLlOI+KGKQzh5Aym/De7miT4VvDlJzHuxl08MEwB2HubiQ7da9bhwMGNWHjYbpPTSQLI3Subf6HAsIofM0EbJ0JSA/7mkx5N/rxERzfmqq/i5edQWWIHjraz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzzpPRQf/iX0LpgzKSCs2ND/kJqSwgnGmsHsdoLypYY=;
 b=XHOyc9Luvk7J/6LBIyM52A69SAw65/zt2Xmjxt2A1Cv5J6EQ/0Hit8MCebjdweI0YQaLX157SVyFd3RGosX2iw0EPm5PCVQDWaI94EAaREOhY9c68ry2STKARig62VpmtQT0BBK+x+y8CEi5vhqcELMC/owrvGyu7dZMmHL8FiDhFRu6S455eTtEOVVLq/Sl3L7PyS55YtiumsEX258WYNTgdbJvta+0YVsk0NpPT67mKgCNNYrI4vorYvXLcdIYvmXhhcyAniqBT1PUFrB3AeG81vcjZB0VlL2kquw5Zf6NgY8b1Yv1IjONpm0P8dbv1RTL2WqVveHeqHbQ/UjxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 13:22:51 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:22:51 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 01/24] drm/xe/pf: Remove GuC version check for migration
 support
Date: Wed, 12 Nov 2025 14:21:57 +0100
Message-ID: <20251112132220.516975-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::25) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 978f2141-2c29-4714-a6ee-08de21ee945c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHpaWWxzNi83VmZ1K1hlOCtYOEJUbllvVUU0Y2xvQjBZU1R0RWdFVmhma0FV?=
 =?utf-8?B?OTBOMXhjaSsrY1FYMlJzemZ4aW1qRW5WTDRFM0taaEFjWEtCL0szWnowcE9C?=
 =?utf-8?B?Q3d0VmR1ZVZpL2Nta3N3blBRUDdWNHpHWnZUcStiaVd6UHR6bmNxUzFIeEha?=
 =?utf-8?B?dDR6UnBrL3R1OEVzd0pjdjc1ZWlPZyt2V2N0TElOSEUxYWVvQkpNUVBsbldX?=
 =?utf-8?B?cGZ3eEVjcHpRdG9ZTFJOVTJ2bjBQZVErV3VKOXhFTkh6NGlzVm5TZUJMcVE3?=
 =?utf-8?B?WExJOERmRkxCeERZcTI4WHVHMnlRN1hEVDhicDJoWlFMNG1tamJHdlhTTEcx?=
 =?utf-8?B?RnZGT1o5QXpxQzFCR05kMGUwVXZLb2xyMWliUVZhalc5ejk0NllwY0V5UHBT?=
 =?utf-8?B?YTlQYzZzdXloZUdXTCtwVEZlVVFtSXo3Q3lnbkFZb2dsV0hWNVdCK2dYOGNF?=
 =?utf-8?B?cTNETDZRYW4yd1FyYU5udVVUNTBGNTlkSlBKQmxXdHdoYVR5MkVFWXFnV1Y2?=
 =?utf-8?B?K1V0UUNoWHJrVDJVT0hmNkZQcHB0VEhCd0huL2dNbEhRU3RLSWRudU54UHRB?=
 =?utf-8?B?aDNFZFZNMGZmNlA0bWJCdjdCaVF2VVorcW9VZEprN1dMQjRVUlZpR1pZMjc1?=
 =?utf-8?B?YUlQRWk1ak5lVWw1aFFzVmhjZjJQMnNCVUFlNnRmLzVWalJ5bTNEbFNZa0pU?=
 =?utf-8?B?dW0wUVRKbDBCRlVhZEYydk5nRDFQektpTnJjS0hmTngrRzQ1Q1RsbDkzTm5C?=
 =?utf-8?B?aWhsOEU1MjlLcHhCUEtwckJpNVF4aHNXVXI3WWkwRC9rRGpGYW9icGNYL3kx?=
 =?utf-8?B?WXF1Ynk1UW41RlBjL3pCT1JuN0tDU2hSN0x0U3YreUUrUUpYcnNJUnV3QzVN?=
 =?utf-8?B?TUlWbGdXS0xDMXoyZDdtYnFOK21Fa05vM1poeGtUd3FUMnNETTZYRnc1YS9s?=
 =?utf-8?B?aW9YR1BkcVFwNlJ6NHZXN3dNc0sweklhc292UVFpdXJQSk1GMUR0K1hmazhK?=
 =?utf-8?B?aWNZZFZTaDEwVk91WVk3dkhXRENuU1dVVHlBQTVkMkJMTzgyTVRURmJRZEJy?=
 =?utf-8?B?SFZlSWdqNS9aYmlmZ2VtTyt6aDBMYUdSQkpRcHN6Z2lvS3ZzMndIOUdEbDB4?=
 =?utf-8?B?VUw4K2Z5a3FDYlJUa0szUjdNREwxQnBudHFQUWhaUDZNR0NoZkZKZi8rdXZy?=
 =?utf-8?B?a1RtYW1BaFFNNmFZaURRY1BIbkd0Sy9LYUZKa2lkaDNLZlRFQ3ExUVVrTFU0?=
 =?utf-8?B?d1h0b3M4eDc2YUlzTWRhMEU4czYyUzlJZXNTeUpLcC9HeWtxQmF5d04xVFNH?=
 =?utf-8?B?VEdHTjQ5ZEtDWER3Z3BRMm5qeFZzaVU3c2R4ME5IQUFsZFhkS043cUgzS3JZ?=
 =?utf-8?B?Q2NCZDJkTEF4b29temxFV3pZdVM0ZjNzMXB2dGp5aXVKNUpPVldnSzNJVHZO?=
 =?utf-8?B?cnAyMXNPUXJQalppMFJFVkVVMDlzZ2ZZNnRwQ1FHTktnMUVCL09EVklmM29v?=
 =?utf-8?B?VThNRzhENEhTQXArbUxJNm9NSWZqN1UyZHZvU0hoVnVMeXlLZlI3WEFnaS9L?=
 =?utf-8?B?czBzeEtlT2diMlNxdy9vQ0VLY29xSVVVUnM3dFpLaEgrVjc4a2s0dWc5dlhr?=
 =?utf-8?B?dlBEdjY4WENZZ2lOazVFNTJ2UkZwYTVPTVgyYU13dzVVMEtEbG9Ec2tQRmg3?=
 =?utf-8?B?em11ZlJBUi9CS1ZTdzRLNVFFSWFsNmhlTngvRHdnS1hrRVFBVDlKMHhjZDVp?=
 =?utf-8?B?V2xiMWVnREFhZWZuQW9RWWFqcW92TVQ0a3NtdHZjcWNHTVVpVDNGRkJUUE54?=
 =?utf-8?B?ZFRWajI0b2pnQ2duWklKTjNVREhLbGtBa0ltRlprRlhXTWQ4MC9yQmh6MXU4?=
 =?utf-8?B?ak56cGZUbWk4cUtPOTlyUTFJSm03UFRhNFRsbUFydkx2aWJUUWIwTmZIRXo5?=
 =?utf-8?Q?dDccNNFRdz0WvVlU+DTigHC4KORDOFeE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGh4SWc4RjF2aVBVVFNWQ1czeDFQMGRxZk40QUNtdVpaZzJXcVUwUUdaTVNX?=
 =?utf-8?B?aXpWU21SdDNyTVNTeTVWMkRBdGVrZldHQzRhWkJYQkVSdWVTQUhPZGNhV25J?=
 =?utf-8?B?UDNxL0g2RHB2SlVXWGhxcG9nMUxkSGlXWE5MbU5ZbG94eWYwSkE0YlJSSVFI?=
 =?utf-8?B?RTJxZjhLclFRakE5aXJvM0lXeUd5Zm9VMGUyeE4zUzl3OFhrbCtaMHp6ZFhR?=
 =?utf-8?B?Q0hPWU1uOWM5am1VTXRKSVFoRUczK1JjYUJVc1hjbXkzSkVhVS90R3J2MmhR?=
 =?utf-8?B?NDFnVk1GS3l0bXJBcGx0dXQ2QVV5ekZIZ0x1ZCtWOWlOQ2xEV1lpVmI0RTZV?=
 =?utf-8?B?endCbE5ERXlNc205bjBzWnJrSUc2NEovQnRFOG9aQzR6ZFFVZnM2dnQ2RVZq?=
 =?utf-8?B?WWs0RTlzeDFHREcvWk8rMHRuWmZoYmhoSEFRV0dTa1hLZ3NGY25UM1d3Sm5l?=
 =?utf-8?B?U0pmUGhVbmszcy9NdjYyYjU5VFlmbS9hdTdJaERJVnk0L0V5NmE2ZWZ6ZFow?=
 =?utf-8?B?d2htTUxKa05HU3BBUzAxbWw1Nkh1M0xHMHFmWXpYc1M3ZDl4RWUrNFFkaWo2?=
 =?utf-8?B?SVFaMTVOL3Rvd2FmOFFneTNSRWtHbXpkcDBvR2Flei9Zd3ZucTdObkxPVHBQ?=
 =?utf-8?B?UlAzVGNiY3VXUEhsMzFndkdmTm9UWnFFQUtUWURKZmlERS8rTEJHUjg0M04x?=
 =?utf-8?B?ZGYyQ2tRbWYvWGxvVUVzWHFVODRZZnQvZXlERUhaOFlKZ0dabnJtNjRBR2dJ?=
 =?utf-8?B?WEo3ZWN1bXRKU0tMZE5zV3YzMTVhWkxBcFJhR0RIMmlZWW50MGpiemVnM24w?=
 =?utf-8?B?Mms4b1Y5ckVZb09udHdrNEpkcklyUTFHTHFsV1BZVjM5enlGYjQxUGRCZFV6?=
 =?utf-8?B?R1d0V1dkbTNNUzJJR0czdHJrV0dqVFRhc1VIcGEyUEU2dFBURkhkdXBueG9E?=
 =?utf-8?B?VGFiNTVyVTFLSEkvbjVsUitUakVmcllQM1JpUjRxRE1VTkRNdmFsQWlCeVd6?=
 =?utf-8?B?cDAzMWFvT1dQN3dJbGpCaU1OaHAzdWFRaWZzbmIxMS9xaGRzWklxMjMzcjhn?=
 =?utf-8?B?ci92U2xYNlFadFBZV255WFRpNi9iM1MwUmFJRzUxRFZXelBWTEpIQ1pWamps?=
 =?utf-8?B?VmdpMDBVUURtY3Rnb1Nub1kxeXNDaHR5QjgwbWhiQnpSMkdNZHNWYW5SdlJ4?=
 =?utf-8?B?R3d2ZmdzVVliSWVkdUM2c0xNS0xUc1o1TWh6dGVXK1lUSVZYN2I3bFpjNVBs?=
 =?utf-8?B?UkgzT2Z5WTh6T3VpSFc2RTg4dWFLVlBEUG1hNzk2N0dCU2ZBeTRpdTJzVGRP?=
 =?utf-8?B?YWRVdFJMOFVlb1VQekpWTGRTQUtUUDVVd2NFNHdTS29nNGc5cVNzejB3MU51?=
 =?utf-8?B?WTJ5Q3dZbXJoY0xCRHR4MFQxR1NjQWFZU2xjOWF5cmZCSHRXS01XMXYxMWVD?=
 =?utf-8?B?M212NU1jbEhCTzRMc0g1d0VuckEzQ2V4U2pmTi8rZEZGMDJCT2I5Z3pXd2dU?=
 =?utf-8?B?cEpsR3RsVEFFOGZvWVRLOFJyK3VhUmdpMEpqMjFwaDV3MkU5K3NIRCtvZHZ1?=
 =?utf-8?B?c0RKVHdJQUVSckVMZDN2eUZqa3lSOVBnV3kzZ1Vmc2U3NVZTeGZVdlN6ZTUx?=
 =?utf-8?B?Y3Z3QTVIMkZmZkVqMmlTMVdlMFpHNCtpN1dMYTU3V2RNbHYvbG9oQXgyQXRl?=
 =?utf-8?B?Ym43SHUrMzYrWkRWcFNtZXZVTXZYTGxncFQ4dnpyY24vdkY5MUoybUxPbE9R?=
 =?utf-8?B?dG0wUE1DaWl0U3pEVkh2UFA2dDR4WHZIRnFlZzdJc0ZlUnhkR3lTK09sdFlR?=
 =?utf-8?B?TmxORXNaT0VVWnNiTzYwcXhEWDBpNTdraW5zZE1SWlNVcUF5YmtFWjRLMTdu?=
 =?utf-8?B?TnJhQ290a2JrL2JYSjQzU2QzQlJXMnEvbHdpaGIrdlIwRnhrRXk5S0Jra1Z2?=
 =?utf-8?B?Vm1Vb0tnVmE0em5VT1BaeXRwbzc4UFVBTnJVbVlYNUFIUUo4cGhGb0czQk12?=
 =?utf-8?B?Zzk0bzJTVHM2bUptY2MrVFJZeFRhRW9VSEN4bTRYZVpnUVl1Y1AvWmdLdnNw?=
 =?utf-8?B?QksyNzRiaDBMb1dSMTE4eEpieVk3OVYwSEw5eldOcXFQNVB1dm9VVkxHNDVj?=
 =?utf-8?B?LzJHSlRybTVBek9mOWVwN1JVZEd2RmJycGV0SmE1bllsdDNsNnBKZldtOTVu?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 978f2141-2c29-4714-a6ee-08de21ee945c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:22:51.1061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXpQz04IwM4SKa0s46c+rnEh0tK2n8F7tic2Y2ympgKYnna/BVSliCd6ZiENkicMoblzkghy80XHaKpYQLsYj1qrzNkxwZMypItidzLaBDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
version to v70.29.2"), the minimum GuC version required by the driver
is v70.29.2, which should already include everything that we need for
migration.
Remove the version check.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 44cc612b0a752..a5bf327ef8889 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
-	/* GuC 70.25 with save/restore v2 is required */
-	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
-
 	/* XXX: for now this is for feature enabling only */
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
-- 
2.51.2

