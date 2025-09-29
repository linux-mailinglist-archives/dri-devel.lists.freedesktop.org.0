Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E5BA8245
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710D10E219;
	Mon, 29 Sep 2025 06:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlNM9wPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130FF10E20B;
 Mon, 29 Sep 2025 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759127817; x=1790663817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NfxpcSIFs0iwVtiX2rGmIEsDAtqwfxxG9LZHe5g/M+s=;
 b=SlNM9wPh3EzsEG5vjJseGvknFCox3DRWs+iM2T14Dso52I49UbMWJEuh
 V0lgbo2jh07wGfdD0Qgs3jc1aGhE7EiMBlkWhoWdNIgPmtSt/NDF4d8Xm
 bEnYwTHbqXRu2JDtRiv7fxG2Q9vJQ775nq388IaYjPrPhOCogJrfWzJj1
 G4PjlpgxYaMaqPmW/InGRnOe6PCcA/kj+O5FGRzU1VI2E1ppdfqrePANr
 QAVeOGe13KOEpe/L/6Ph7DG4wBSGhIFB8Ir+/cWc3KGt3EQlz8/sRrZXV
 G4GfNkRezUcUC4Al/4Y3vPSnuF10o6x7mp8NAZqGWFpGEpXfwgcfZ4pcL g==;
X-CSE-ConnectionGUID: GNVwlYoVRrC2d0EpBT2TAA==
X-CSE-MsgGUID: 9r8gYpXGRX6+jAcaMIlRcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61251958"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61251958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 23:36:56 -0700
X-CSE-ConnectionGUID: O/mSN6TQSxqXe4NyOfPeUA==
X-CSE-MsgGUID: ewxbIpH+RLSSUO/lLkhRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178216612"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 23:36:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 23:36:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 28 Sep 2025 23:36:55 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 23:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPpoXcZkwgoO/P6I0yq88JLaKgxYD8BG+oLOo9Dx6EPLUFolrOb40Iuk/VpYYvgcbedsgjjHmZmIsAd/xST8ekLjFdkCGJW8sXYLPjar4ddLd9I3xhJB7T7mlJ7b6zeS6e09+g9MMK4CGgHxiaNKJuvxq3fAd+KeCrJS/KH2bq3hKDF5JcuvZbd3bUCugVlDX06kBUGAE1bQ9BmkijTiffVIkOhvTwtaCnJii2xIk9SuVxHNIg90UTz6BLM7ymVDHiI2YR1WfPXsbzGAHwv0goCt4U+vRSwZvkV5nhF7w9IHaTO6Xj+SEeNOH1lCzrHjOuzgmaFLdR/nyQephP+xHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf4Vr6VdtgOF68TT3fTVg+t3vbZuk7vxn2+Vl7S2h9c=;
 b=hU6aJ3MjWahQgQxkU8kLHZNwdLlOBDBSqJhUlq+J0HvH2T2v6ps6vIKeJfYbUkOzujF/LSGCZkH1JTVOLbFBNlmDYXnJx6ieQq6kmE8/onO7Mb03KtqTTGDEPys9daaKK2EVQ/vayxVqgVx/nPechmTo4y2mjMahjTzj+CeF6e/PMPChFDU02brMVZy3ZHX5VfJuTMIb/yVeUqnk5FWMw09YLsgO5exyC8ResfOE7HtuV/ZesRTwzjW5bhM/ssX+/Lu3pyXriqotqvJ5KYDdMZL5kQZRv+/KQrBwh6ASkp+l1NJx5WYO6AEt44NvCWPXdflh2iUdAP4z3hOV3IXrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH8PR11MB9481.namprd11.prod.outlook.com (2603:10b6:610:2bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 06:36:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:36:51 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>
Subject: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Date: Mon, 29 Sep 2025 09:36:44 +0300
Message-ID: <20250929063644.533890-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926211236.474043-3-imre.deak@intel.com>
References: <20250926211236.474043-3-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::21) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH8PR11MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 9822b867-e88e-4286-aaf4-08ddff22923e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEFCdkFRUXFuR21XVDV0ajJpZ1lxVnhPblUrQ0lwVTdidDJjcmhPLzU0NHpO?=
 =?utf-8?B?RUlEYnh3WnhWdUwzSjdWaE4zZy80c0xTYnVEVnhkLzlkYStZZ3FSaUpkRHBO?=
 =?utf-8?B?TXl5RkorQ0RHSkR4VVIzS2VhQmZFMGgrSHIwMUpPRU92L0lBZi95aFkvTDBN?=
 =?utf-8?B?M2tRaUNRdmpLUzFvdEoxLzd3emlUcU5VNW1rQnNDREdNM2E2cG9ieGo1Y204?=
 =?utf-8?B?RGNKaWJCeDdzQTE4L1ZrVSs2NnNuRW1rL3lXNzhlT0RncDFyTXY2eTQzZUk5?=
 =?utf-8?B?OGd5SW5UUUpvMU5TZWUrRDZwWHpURUNVOTVXMzhBdmxvMXE3U04wYXlqbW1l?=
 =?utf-8?B?MEtYWERIa2txMlRBcHVpMlExYUh2ck9lN3J3Q0xzcFI0MUR3Q2Nqc1hJa09E?=
 =?utf-8?B?WmpDMG52amFoL2JzcDRJejIyV3RibnRkbE5xMzZQT1dGMUk5UHBoR2d2V2pI?=
 =?utf-8?B?eUE2cjdURGhPVGNzNEtibjRWenlIYXFyazZnLytHMXRyL3FFY1prcytqaDZW?=
 =?utf-8?B?eU84bllxY1N6WVkyTGhFVS9pdC9QVlFselZ3N2M2T1JtNlR4V08vNzNyMWlQ?=
 =?utf-8?B?T3FJT1duS2JSRjI2N3V0RXYxNTJja05FS2NzdVBQc1h2bGdORmJldGp3U0dq?=
 =?utf-8?B?c21TSUdYZ1E2UjJHTU55QXBJM09SazNRVmhVN1U5RjQvQmV0Z0dIdVhndWph?=
 =?utf-8?B?WC95M2FzM3RDS0RzQjkvamVlN3JJUEl0bTQxaUF1UHozRTZrVmVYeHU0VmdD?=
 =?utf-8?B?Nmt6MVZQcjdBZGZuNUREMkl3b2gyY2cvWWNKdTFuQ2tpcGgrQU9jSmZJSkYr?=
 =?utf-8?B?UWdyN0kvalVBOGZiR1dsbngzTGw2UUVPaVNZYU10MXNSRlN3dWYyRHRFKzRP?=
 =?utf-8?B?ZG1LSi9wVWE2OWN6bG1LMWlKc1ZMRUZJbVNQR2djVktUMUFTaTF3Z2FyOGVM?=
 =?utf-8?B?NEQ4Tm1VRE5FZGNmRkdCdll1YUdCRmV6U0phSWpWSWpPQVFpV25PakV5Y0Vo?=
 =?utf-8?B?K2QzOEhHdlh2TEtlQTJVQmdzVldFeGllYUV1ZDhIQTVnbTBmbXljZ1VJU3JT?=
 =?utf-8?B?TFdLM2RMZ3FTS1NNbnpxVWU3RHprSmsrcG1zYlh0UzNuZy9oN3FiVThORloy?=
 =?utf-8?B?MEx5eC84b3FvTHZaSlptSU95ZEVvd1oyTVZoMmN0ZlBzUlZvcGtSV1E2cW92?=
 =?utf-8?B?NFAzMWVMb1ZzZlNnWEVsdDE0UVl1WjdZSHc2eTZlUVFIOVRsWGVJVVFBNzZW?=
 =?utf-8?B?L2lzZEltekdTbFNFaVppd2lZdzYvbFU3NGgvMlhCd0VyWFAzaW1lekNXdWZB?=
 =?utf-8?B?b09oZEZLV0J3UU9qTlBNNUZ5NFJCajd0Rm5FQzNjUUhhTjcwNmdIc1R5dGUw?=
 =?utf-8?B?bkJpbFJra3RWTlkwdFpucElweWRacldrcjdMc0lmNmxDQ1dzMTR5bGlMYVJl?=
 =?utf-8?B?aHZ3WE1JTVpWUW1HblZiTzFBbytHeFFMMVNadStlamw4RUdNQ1d4bFJSdjNr?=
 =?utf-8?B?ZHdHN0t0TXNhQ05sanVKbDgwemNVd0RoQUJKR0Z2S2Iwa2k1SlhNU2ZIazJw?=
 =?utf-8?B?WFF0MHZ3RkRTMGIyUlNXY0g0SFlUZDFUVEpDNXFkWUtmNUlNc2RkUG9Ccm4x?=
 =?utf-8?B?bStvbTdUaC8xTHhOS0Y3azBIRXFlbWZuSGd6dExNOGdpT0tpMTljT3J5cVp3?=
 =?utf-8?B?elRZb3RwZmliUFZUTHJVUWh6MUVWR3dmR2ora2ZlV0lJUlUyQmczeWt0WlRF?=
 =?utf-8?B?cHZKNURHNnBXdTZrcVRsUzFTaDJNSjRBTG1nUnMyUVdXQ0pwd004dUNaRUpY?=
 =?utf-8?B?U2pDYy81YkRHbEdVZmJnNmU2aXptcFQ0NWFZLzhnSmdlc2dUSG1ZTWZXank0?=
 =?utf-8?B?WTFLai9ESWRHS2RpQTR5bjEzRm9kK2xjZUx2MUNNcGM3Vm1qVzZZTS9oaTEw?=
 =?utf-8?Q?rBi0o88CZt/C7+PXerxnqkBjPy+i9fok?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzk1Z2JpU3E2NHM2T0RpRmppQnJqaHh4d2NKekZTamE5eGpQbGpqS1ZRTlYw?=
 =?utf-8?B?Z2JldXZ5T21TS09oNkRvQU1qZnM1anFhc0hwWE9vZVZoSWk1WUJxYlNwTktv?=
 =?utf-8?B?YThOVXNWRGk3dmQxZkQyMjlMRVlTcFIvZ3FkWDVOZE1jZkM0V1JIeU5TRW5L?=
 =?utf-8?B?TklaZFQyMU5VdkExUXIzZ1FQQ2xyeXFBcVZUNFVpWmt4c0Q4N3h2TTRYdHA0?=
 =?utf-8?B?UHkrYlNLT1htK2l5MkZOL2M3ajZkL1JuaGZReVJIZG5rNjRsOUwrNUwvTlNv?=
 =?utf-8?B?MTFFMUkrc01UMkJ3RE8vVDAwZllEb2NSaDcySXJZTWFMYThqWjVFbERpVWIx?=
 =?utf-8?B?eVRGdi9WelhBMmVRWVp1SmpMamRkUjBqNFJJckRZaEQ1cmFFOGczSERnYms3?=
 =?utf-8?B?dnJQTGM3ci9pUkNLWWFjMnJMdnl4Y0VRNjkrc3pTMTU3OW1tQ2dwY1VvdG42?=
 =?utf-8?B?VWthbTREMWxCR0FFYVJqNmlaODFhcnY1WmJPSkNobkhDSU9MRko1SW51YjV4?=
 =?utf-8?B?aUlNRVNDS2ZuNDVpQ0orbmk5TDJxbHZCTmJ6M3NyYWVrRnFwdnpQdDEwWFVY?=
 =?utf-8?B?Y2NSUmx3TlFHcUNFaUR1b1M1V1ZVM0pSbkRkVUxuL29FRXFpUU00S3ZXRW8w?=
 =?utf-8?B?WjNSQXZ4WTZYT1NsdDRKcHJFL3Y3cTc2RExFcStkb1kvNlFGSWh0V0U0cTB0?=
 =?utf-8?B?ejI5ek02WjYxdGVudVhUZTVIdnBQNkYzU1Q2ZnhrVzE4R3VLRHI1a3p2Qm4z?=
 =?utf-8?B?SGtENEFBY01IUVN3VGE4R0hXcWhoRE9jRExTcVJSL1NHaEdXSFFaRG8rdCtX?=
 =?utf-8?B?NW5ZRVpEd3RqcVBmQm54WXgwM2dCM3FGS1h0L2lpVUtWeG8yVi9pVzhxTS9h?=
 =?utf-8?B?YWMzYm1pV2R6WHpMMGMzT1FhVFB6VzVHRkM4RmpuVnhwd1BnYjgrdTJNV0R2?=
 =?utf-8?B?dGZXRWExbjVrVW1jKzNjWDJQbVFvR2hjQjV1b1ljZG80dG5xR3hCY1ppSXhi?=
 =?utf-8?B?aE55c1B4ek5PNW9XWlplM0QyQ3I2WGdXaHJvREc3Y1FTM0xBNGc4cTViV041?=
 =?utf-8?B?MnJLOVdOYlJndVRDbjVLdTBxV1VLK2ZRRi9rWGp2dnJDNHRiYjYycFZibE5s?=
 =?utf-8?B?MTNaaSsveXRqWllETGk0TnJTNFNVR1A4RVVRM3ltRDFSMU5wZGRDMkc3YlNj?=
 =?utf-8?B?VkRhRnBmWHBRSmI2WWFzaFUxNEc3RU53cnFFaExUbG95QThnS2N4OVM0blhJ?=
 =?utf-8?B?cThtTFZtdnZzKzRUTkFmSmowVWdPRWVKR2JHVWcxVVdibmhNZnNZbS9aQ1BY?=
 =?utf-8?B?Ui9KdVNrWVFmODBpalNwdmFHanljTnZycjJrcE0wYTRySjhWdkE4Ukh6R056?=
 =?utf-8?B?MEtZWFdoNy9STFBjZmU2ZHlxKzdiWWVjZk9GYUZ4dlJOanJUUEMyemVUc05B?=
 =?utf-8?B?c1ZKaFI5YW1SUmZ4NHRPWVk4Nm1lM2d2dnhxWTB1S2hBRkRzQjF0bTlwNU9i?=
 =?utf-8?B?RnNCeGhWQzFCMU9kZmhJRVdabkJsSVhWZGNLYlp6akRGNzZpMSttelE5OFEr?=
 =?utf-8?B?elY5ZUdlMzg0ekpZTHRzUTd6bm11UGNhRStzZ1BndkEzT3lFa3BZVEFnLzJS?=
 =?utf-8?B?ZG5LR1dMMGlOZUgzQ2FUVjhqWGNuQnlxT0d4Z1ZVOWJNWTg5T2NWcTFtNlNW?=
 =?utf-8?B?dCt4dlFVME01MDlVNldodlFoV3o0N3pvRWVZQkMvRzFJUVZ4L3ZodVc0S0xn?=
 =?utf-8?B?L0htR25RclJJTE5oZjFidXFYS0xtZXV6bGhZczBGMnYxQ21OWDU1WEVhL3g4?=
 =?utf-8?B?VFNWcElIU2RiL1JlS2poenFQZ0RmUWw1djFCMENNN2VIODA5RU8wSXZPbmVC?=
 =?utf-8?B?cVFhdHZ6MFRGYXkzN1ZqdFZacy9yYmExVk5Mb1pUc2VKNWhpVEpPL2N1aHAv?=
 =?utf-8?B?aThMY2V2R2xGbkRLcUtVT2FCWGQ4NjIrSEtjREUvaHNsdHR0QmlPS0V5SWNi?=
 =?utf-8?B?OWU0b0VFdzMzQ0xwSTVOYmVKbkI3dCs5c0FMVHg2N3dwa0xjNXEweHpQMFdm?=
 =?utf-8?B?QytQQlhGNlhWcXFFbG5yQU1oazgzZ3lmYzFQeENWVUZLaTUwZmsyRFVaR2tv?=
 =?utf-8?B?YVNWSFJ3YmZVWlp0RkJ6ZUtOd3VqeFNzYlRSb1Q0cERGQWRtdGlIWW1ETGla?=
 =?utf-8?Q?NullbH9nlRax8JM+97xAu0hElwEUEzA+E1BrospZ+wCW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9822b867-e88e-4286-aaf4-08ddff22923e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:36:51.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zry2s/QSo+zpu6wANikrBT03FZ/eBTVvZL6UzceUYweLu2zhN4VjeexqZqYqFMoVu0/SAXNulIHJFyDqXEOPVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9481
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

Add helpers to query the DP DSC sink device's per-slice throughput as
well as a DSC branch device's overall throughput and line-width
capabilities.

v2 (Ville):
- Rename pixel_clock to peak_pixel_rate, document what the value means
  in case of MST tiled displays.
- Fix name of drm_dp_dsc_branch_max_slice_throughput() to
  drm_dp_dsc_sink_max_slice_throughput().
v3:
- Fix the DSC branch device minimum valid line width value from 2560
  to 5120 pixels.
- Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
  name to peak_pixel_rate in header file.
- Add handling for throughput mode 0 granular delta, defined by DP
  Standard v2.1a.

Cc: dri-devel@lists.freedesktop.org
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
 include/drm/display/drm_dp.h            |   3 +
 include/drm/display/drm_dp_helper.h     |   5 +
 3 files changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1c74fe9459ad9..6084ca7fbe263 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2844,6 +2844,162 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
 
+/*
+ * See DP Standard v2.1a 2.8.4 Minimum Slices/Display, Table 2-159 and
+ * Appendix L.1 Derivation of Slice Count Requirements.
+ */
+static int dsc_sink_min_slice_throughput(int peak_pixel_rate)
+{
+	if (peak_pixel_rate >= 4800000)
+		return 600000;
+	else if (peak_pixel_rate >= 2700000)
+		return 400000;
+	else
+		return 340000;
+}
+
+/**
+ * drm_dp_dsc_sink_max_slice_throughput() - Get a DSC sink's maximum pixel throughput per slice
+ * @dsc_dpcd: DSC sink's capabilities from DPCD
+ * @peak_pixel_rate: Cumulative peak pixel rate in kHz
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the DSC sink device's maximum pixel throughput per slice, based on
+ * the device's @dsc_dpcd capabilities, the @peak_pixel_rate of the transferred
+ * stream(s) and whether the output format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Note that @peak_pixel_rate is the total pixel rate transferred to the same
+ * DSC/display sink. For instance to calculate a tile's slice count of an MST
+ * multi-tiled display sink (not considering here the required
+ * rounding/alignment of slice count)::
+ *
+ *   @peak_pixel_rate = tile_pixel_rate * tile_count
+ *   total_slice_count = @peak_pixel_rate / drm_dp_dsc_sink_max_slice_throughput(@peak_pixel_rate)
+ *   tile_slice_count = total_slice_count / tile_count
+ *
+ * Returns:
+ * The maximum pixel throughput per slice supported by the DSC sink device
+ * in kPixels/sec.
+ */
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int peak_pixel_rate, bool is_rgb_yuv444)
+{
+	int throughput;
+	int delta = 0;
+	int base;
+
+	throughput = dsc_dpcd[DP_DSC_PEAK_THROUGHPUT - DP_DSC_SUPPORT];
+
+	if (is_rgb_yuv444) {
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_0_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_0_SHIFT;
+
+		delta = ((dsc_dpcd[DP_DSC_RC_BUF_BLK_SIZE - DP_DSC_SUPPORT]) &
+			 DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK) >>
+			DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT;	/* in units of 2 MPixels/sec */
+		delta *= 2000;
+	} else {
+		throughput = (throughput & DP_DSC_THROUGHPUT_MODE_1_MASK) >>
+			     DP_DSC_THROUGHPUT_MODE_1_SHIFT;
+	}
+
+	switch (throughput) {
+	case 0:
+		return dsc_sink_min_slice_throughput(peak_pixel_rate);
+	case 1:
+		base = 340000;
+		break;
+	case 2 ... 14:
+		base = 400000 + 50000 * (throughput - 2);
+		break;
+	case 15:
+		base = 170000;
+		break;
+	default:
+		WARN(1, "Missing case %d\n", throughput);
+		base = 340000;
+		break;
+	}
+
+	return base + delta;
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_throughput);
+
+static u8 dsc_branch_dpcd_cap(const u8 dpcd[DP_DSC_BRANCH_CAP_SIZE], int reg)
+{
+	return dpcd[reg - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0];
+}
+
+/**
+ * drm_dp_dsc_branch_max_overall_throughput() - Branch device's max overall DSC pixel throughput
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ * @is_rgb_yuv444: The mode is either RGB or YUV444
+ *
+ * Return the branch device's maximum overall DSC pixel throughput, based on
+ * the device's DPCD DSC branch capabilities, and whether the output
+ * format @is_rgb_yuv444 or yuv422/yuv420.
+ *
+ * Returns:
+ * - 0:   The maximum overall throughput capability is not indicated by
+ *        the device separately and it must be determined from the per-slice
+ *        max throughput (see @drm_dp_dsc_branch_slice_max_throughput())
+ *        and the maximum slice count supported by the device.
+ * - > 0: The maximum overall DSC pixel throughput supported by the branch
+ *        device in kPixels/sec.
+ */
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444)
+{
+	int throughput;
+
+	if (is_rgb_yuv444)
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_0);
+	else
+		throughput = dsc_branch_dpcd_cap(dsc_branch_dpcd,
+						 DP_DSC_BRANCH_OVERALL_THROUGHPUT_1);
+
+	switch (throughput) {
+	case 0:
+		return 0;
+	case 1:
+		return 680000;
+	default:
+		return 600000 + 50000 * throughput;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_overall_throughput);
+
+/**
+ * drm_dp_dsc_branch_max_line_width() - Branch device's max DSC line width
+ * @dsc_branch_dpcd: DSC branch capabilities from DPCD
+ *
+ * Return the branch device's maximum overall DSC line width, based on
+ * the device's @dsc_branch_dpcd capabilities.
+ *
+ * Returns:
+ * - 0:        The maximum line width is not indicated by the device
+ *             separately and it must be determined from the maximum
+ *             slice count and slice-width supported by the device.
+ * - %-EINVAL: The device indicates an invalid maximum line width
+ *             (< 5120 pixels).
+ * - >= 5120:  The maximum line width in pixels.
+ */
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE])
+{
+	int line_width = dsc_branch_dpcd_cap(dsc_branch_dpcd, DP_DSC_BRANCH_MAX_LINE_WIDTH);
+
+	switch (line_width) {
+	case 0:
+		return 0;
+	case 1 ... 15:
+		return -EINVAL;
+	default:
+		return line_width * 320;
+	}
+}
+EXPORT_SYMBOL(drm_dp_dsc_branch_max_line_width);
+
 static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 				  const u8 dpcd[DP_RECEIVER_CAP_SIZE], int address,
 				  u8 *buf, int buf_size)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index cf318e3ddb5c5..e4eebabab9759 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -258,6 +258,8 @@
 # define DP_DSC_RC_BUF_BLK_SIZE_4           0x1
 # define DP_DSC_RC_BUF_BLK_SIZE_16          0x2
 # define DP_DSC_RC_BUF_BLK_SIZE_64          0x3
+# define DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT 3 /* DP 2.1a, in units of 2 MPixels/sec */
+# define DP_DSC_THROUGHPUT_MODE_0_DELTA_MASK  (0x1f << DP_DSC_THROUGHPUT_MODE_0_DELTA_SHIFT)
 
 #define DP_DSC_RC_BUF_SIZE                  0x063
 
@@ -1686,6 +1688,7 @@ enum drm_dp_phy {
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
 #define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
+#define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
 #define DP_LTTPR_COMMON_CAP_SIZE	8
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index e438c44409952..df2f24b950e4c 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -211,6 +211,11 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpc[DP_DSC_RECEIVER_CAP_SIZE],
 					 u8 dsc_bpc[3]);
+int drm_dp_dsc_sink_max_slice_throughput(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+					 int peak_pixel_rate, bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_overall_throughput(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE],
+					     bool is_rgb_yuv444);
+int drm_dp_dsc_branch_max_line_width(const u8 dsc_branch_dpcd[DP_DSC_BRANCH_CAP_SIZE]);
 
 static inline bool
 drm_dp_sink_supports_dsc(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-- 
2.49.1

