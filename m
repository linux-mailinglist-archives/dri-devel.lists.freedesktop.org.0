Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B958EBCC497
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9B310EB8B;
	Fri, 10 Oct 2025 09:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFETXmZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074D10EB82;
 Fri, 10 Oct 2025 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760087878; x=1791623878;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=Ll6kZpp3tCSPfv527p/FkDym+YGUajefBlNn/gFOrOU=;
 b=WFETXmZmFo4pMkGBnOCIEThWxedmCmEgQE//L7PzWTZYcX4oO5ruxUvS
 wHla8tcbcB2C1ToOQwRxmRymOdbJNniOTr7tKAq1A4NXcBm85AjyDarHD
 ELg9q+N2LOH4L3ntT/fzUqwpfa2NqDHsMgsrQMLA4cJ3KPb9xxhT3avMe
 wIBwRkim1eoXfhsRI5qMQtrrjIsOU5k5YDmZiKzmny3cknGEzLygtQm1F
 5ac8yBcWxc7gDK8o3q9uaobSpuI/i7QLrhoXGA4Lc6TXTpHOyoiYS6l7N
 JzcLRXsMhPuMc/vC3YFHeJd9x6n/RU3oBkM0I8fQpJPcNQnHMTP1bHGRq w==;
X-CSE-ConnectionGUID: m6NSX/5HTbqwWngVdIzYIw==
X-CSE-MsgGUID: 5DlLyRgXQceoHUqb/5U46w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66160939"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="66160939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:17:52 -0700
X-CSE-ConnectionGUID: bBEYXTfiQUyUHWXFiS+rlQ==
X-CSE-MsgGUID: MyEvg1z4Rzi2RFi9i2E8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180883170"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:17:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:17:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 02:17:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAwG7Msgg5t86VdkrkElMcVo54DXfhagG9dcxJ5qSwsUdTlTIg/WCVAbbWpeNG3ua1Jt08hA9QqRII0QClGKKq3a0WjPrxGw0orOIC4fbS0jcAgl6r65WJteEhkX5jQX7HRKA9F4JghjbaX3Ni8gUMWUgMFTnye6hQMFM53Fb9XAFVXwUAz0T6SLbvteB7yDBDePDyAVrKBt+i3+XsaNfbEX3+HKBCjLetIzbCAnFVWBvj8hF/vC4ekCtBgwbpzSfmjDWQaCaqa7V2QFagxKug8l/5nlBoNU/BQYEEWRfRQJ4U3Egtj4PGhOPfJRc1ZtClkLyLgopCw+IL+768rZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZY7tBGuZLSRaIyqAy+JmNBNrICeJY2tDhVoYD+oyXo=;
 b=oacSUNwMDTdl17FzHzb3TwnYfPIdsyfs1pIe9diPJEqsxzSS3+5H2PXyeAfaGyHUregqqEMunHnpigCZ2WYqiuJkHkU+Z71/cvTgNNmh7qbetSF1SZDAv4lMDxOOuQKf385YIVB9BHkJpVi0MXOLNidjxpyAkoDdT83z497ZY8HfQeJh5EwdKhToWGAjB1gvknPDGUsxhIFCeofJ8uU0KP/UOZS54AQo1bD0bzaeN07WuUsNPEOBZKr8cvq5VJMf6dfHPQmiv7HPpZGKssT0s8FHKsgMtjeEDkFN2q4+80wx8pAUZZV7UmEN3UOurADuKz9/V9K66YVcXjA0WU/2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:17:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:17:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Oct 2025 09:17:44 +0000
Message-ID: <DDEJ2QIU62PE.VUT8ML7W7F89@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Avoid lock inversion when pinning to GGTT
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251008161258.3568573-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: BE1P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::14) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 065a974d-5626-4bdf-d39f-08de07dde209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEhiWlU2ZTFQbi96WWZHTytIVitZckhyR3JCVGV2RzA5S2lGVTQrUm1xRUpK?=
 =?utf-8?B?NE1lVjBmNnY2RnhYckR4Umd5QUVPdTZuS01jM3JkUS9SeTNhck1maTNycStL?=
 =?utf-8?B?ZGxrU2VON2p0L3d6RzlKWXNlWG52T3BTbW1LWTU2NVBqbVp1WTIzb1RBVmIw?=
 =?utf-8?B?ZGthNUtjSHJaM3VFSU1IWG9HRzVORmoyZitndkVWL0ZMb1ZqTGlNeGJqVnQx?=
 =?utf-8?B?MFUxWEJhZHVraUdZeWRFRFkwSFM3Y05PRStYN2lzU2RJWEptOXR0TVo1N2xh?=
 =?utf-8?B?NGNEbmJzdEtHM2ViclR4NXhuUkordUZySndxM241YlNtZ05uQnk4T2F4VThy?=
 =?utf-8?B?SjRpU1R2T3E1dW9xMHduNmhrUmtjT2o2K2hlUjBYbEd3cVpyM05vQ3Fvd3NW?=
 =?utf-8?B?a1ZzTzh5R1ZSeklJNkpTaFBnSzVZQzFsSTRnSDNBMy9BcGtTZW1KWFZTUndQ?=
 =?utf-8?B?TVZNREpsM0lrMEYyZ3E5eis1dUtWRWpHTExSTXU1UGRJOVVZN1VEelB6eWdC?=
 =?utf-8?B?Ujh4c1o1QVhzVlBha1M5dVVDTFcxWlZkQi96UlZqbEoydGIyemROS2dYQTJh?=
 =?utf-8?B?KzN6NGNhWGJLWWJ5aWplUVZvRzlkZk1McWdSUWR1OUtJRFo5VmdWdzhDd2tH?=
 =?utf-8?B?bW01REpobTloYW1ZU1NLL3k0ODQ5cHlQTjFZQTM4NVkxOW5ZKzBSRjJzbkxJ?=
 =?utf-8?B?YlkyODZvTnpDNmlyeld6bW1jQTdpOUJZRzJEaXhLNGl6OGJPL2NmdFpzSWNl?=
 =?utf-8?B?VEhLdUtDdWUxSzFEcDh6M3RPQ3NtTDQ3ekVHRGZqRVFKL0hjZmdJYkNic0ZS?=
 =?utf-8?B?OUNZQVYxMCs3T2tYNzhOQm5ybmxUTU9mdHVsU1VkdXlxWSsyaEQ5ZWtVMCt3?=
 =?utf-8?B?cVVLdkRYN2t3VWk2UFRJOGJ4ZXJPK0xSSzdEK1ZpMWdjYlZrRzBUN3pqNTg3?=
 =?utf-8?B?blZnbGpIcjUrQVl0YXZLWnBSK2I1MDAzRWhJdGt0U0hibjFCVG45SlFoMCtj?=
 =?utf-8?B?UWhxZDVnNUxtUXpoTklPTEpmVUdqZnlBQVpLTjhaN2FuKzZ5MnEwYitFOG4w?=
 =?utf-8?B?Rk5MV3p3cjlydVBrREtqRngrR002MlowMk5aWVVIMWx2em0rMEppVTd2UUZL?=
 =?utf-8?B?Q3RYb3E1OGlZc0kzOXR0TW9UaGZXQkhKb1lZVjlLdTAzOW12UXJtTHhIR014?=
 =?utf-8?B?UEpHWkhwUVZmY3JJVXJiaDFpM21HTk1rQVpDUkNTYmF5YkxIZ3hJd3ExbGdo?=
 =?utf-8?B?UnlCNGVkQTlpajAxVUxQbS9KOS83cEJvNFhodHMvMC9RUnlVWE5SZ3VTMU5h?=
 =?utf-8?B?dFhHSWZ4Y1A3VTlNM2hvU0JKdUloa3h1SkpWT0IwVHc0RUY1M3lRL2NTcnl5?=
 =?utf-8?B?Zlh0MGNNZWh6Vks5T2VKQ2xrSXN3TXhBM2hSeVFQK3QwdmFiWTZvallhNW1J?=
 =?utf-8?B?QTBDSFFYUzVFVlVTN01EQzYyY3Q2emNhRDR4cEhLZmgwMXF2UlhQZ3VqNElL?=
 =?utf-8?B?ZjNKdSszTjh2TWF2NENLa2NCUEF1cTgrZFlwYS8yN2E4bTRqZlN3bStVbVZ0?=
 =?utf-8?B?TG1OM25MZWJBbFM1M0o3dGVBejh1YjJIa0pmNmRkdUY1OHNBVmxzUGh1MWNK?=
 =?utf-8?B?RVFnZXRxYjhjbWljSlhmci93dDd1QzgyZWdTNmdmTUtFMHhMMXNxZG9xVU9G?=
 =?utf-8?B?VjZzV3gwYWNaOHpKRXVJMHFtd2pCNVlaT3o2R2FDMnZvMjdRRGNvRFFKQXVY?=
 =?utf-8?B?bXpsZzNudHJlN2QzekFsNkpWMjQra1R5V2hndkgrWnRJdTAxT1lFRkcyQ0pP?=
 =?utf-8?B?TGZVZlpFRUR3Vlh5RFBNbng0V2t5UEROY2tqdE41a2p4cWdaeFA2WE1tZ0pJ?=
 =?utf-8?B?OXpiT2tvUytFOFo4cmZaNENHZHR0OWF4bWtXM1ZsYnAyMmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNvTWJLL3ZaRVphRXFraDg1dU5mMGtsR1dSNzZhMjB6YmRKWXRVblNKOFdV?=
 =?utf-8?B?RHJDbjNlc3ZtK1NqaFBudHJBVXVJa0VFbkRTUUxQcC94dTk1N2xQRlQwT041?=
 =?utf-8?B?WklIMFR3Ty9sWHBwK1kzaTVxWXV6Z1VoNUtmMVRMUW5yWVBqTEpJSzhpZjJ4?=
 =?utf-8?B?MlJQdHhkRjdkRzNDY2E5amJ1ZFF0MWd2YVhSNmQrK0h0M1F0SHREeGN5TkZu?=
 =?utf-8?B?eXVJeHVmbzNqT2NVakVJZ0FHS3hYUFliMm1CclNBQnFCQkxFT0R3M0NLMHcv?=
 =?utf-8?B?V2lQTVNIUk1nQm9kMndzaUEwT1A0cklBNWhlWWtVem1UMVhVL0E5akI0OUtt?=
 =?utf-8?B?eW5xUmx6NkR6SzdRUmVpY2xoN1hkR21vSDV6eVBUQlZoWmtqWmJqMHRKRTgx?=
 =?utf-8?B?OTFJRk4wcUdLYkJOU2tjR1hzYVpHT0g4eit6MmZIUjJucEZrY3dQWTRSenYy?=
 =?utf-8?B?OTNVRWcrMnB6VWhBVEMyazZGaHRyY0xmdlg2TkpFNEF0OVNXWDJEV2ZOMGpY?=
 =?utf-8?B?bnBWdEhpbjdMa1dlMzZWRmFybkdidmdkV05QZGFHajhzNE5aL2E4ZlBXV01S?=
 =?utf-8?B?V3BIdG1nbHFrbVVvbndGQUlKOVVkdncrU2xHSjJtVllVRE9Lb3h0eENaNXZt?=
 =?utf-8?B?NzR5US9FZlhHNWcvUDAxQk0zb3lJM0w0VDdkRWV0d203REJ4dktFOXhuSlRV?=
 =?utf-8?B?dXNaUHdyMWZzaVpnMGxLRVlSamc5emtOQkpYN2lUeEY5UFRJOTk4NmZ2RWFW?=
 =?utf-8?B?U0xDVHhkaXBmU3FEQnM4WXNQRCtyS3pSdFFER2pMdGFPV0lXa1JLMlBvUldq?=
 =?utf-8?B?MjZ5SlQyYmZNeTROVlhHb0d3N3JIa2pXUU9aeUNMb2Q4M0lEeE5JRWtNTGU4?=
 =?utf-8?B?SDRLOVZVbHFEclZCMTZXcHRhaHpjWmFlWkM2YUtidmVNRFQydXNrZ0xIQjVl?=
 =?utf-8?B?TVcycVhBVTJiT1Z5Q0dObUFUMStnRHhrb0FlRFJHWnFhcmVZR2FJaEVjVk9V?=
 =?utf-8?B?c3hxVjdMVXdaYmdCSUF6OGs4eEN2OVBWUzNUb0F1eFUzNFk1RE82aG5QejBk?=
 =?utf-8?B?Q2gzSEd0dTJiM3h3NlMrbG9LQ2xsNm0xbytmTiswQWo2Um9ORnYremRaSGtC?=
 =?utf-8?B?OGM3WHFNeEk0RVBCeXYzb0NYaVRxNm9aZnR4TTg2THZhVG1lYzlVTVNyZUNj?=
 =?utf-8?B?cHFjanFrTVhjUnNFYkhQTHh2bStuZXFnNkZDMm5vaFIvd1RKaTBjY0pzOTFG?=
 =?utf-8?B?TUpaZUcvaWR0cDE1VWprTm1teFY4NnpsZ3djUHlYWmZQblVPeUduQmZYMXMx?=
 =?utf-8?B?Vlg5SFBTM2orOGVudDJncUdDRWk0bzkzY09XWWRtdldQMFpRcWwxd0JGdGt5?=
 =?utf-8?B?cTcra21lclcwb2NuVlUzNU51MTUrZkVrb25qaTg3OHAvOEZsS2lQSGtCLzRV?=
 =?utf-8?B?a2g3VFZ1S0tHaGZ1ZFB3cGlEYWgwQXAxcFU3L2tnYzJ5R29FOU0wZHR1d2lB?=
 =?utf-8?B?UmN5Q1lIVEJOcllBM3pvUEtadVIwVUFueGVLT1gybExsNytKYkcwZjBhMUJN?=
 =?utf-8?B?TkxnTG81bnZBUUhYYzllWllBRE8xS1NCL3cvSzByVDdFMEsxK3Ywb0xFeHN6?=
 =?utf-8?B?ajd3SW5XTzQrMCszSzRzYXVGN1NXejl0SS9qOTRPVVlOaXBnVHI4NjRBVGNt?=
 =?utf-8?B?dmdQcnMvQVdmamRKRExvZWNKTkxoVld5dGtuZjVKdmxPNUNmby9LdkpoTmVK?=
 =?utf-8?B?NkVlTlpXb0IrWFhxNUJPS3dnb043SnhLTS9uZkZlbVp4T0YwM09BZHpublhh?=
 =?utf-8?B?K1VkQ0UxN0lFejUxY2FCSVZ6THdTWVYydXZuenZTUWhGUUgrcmM1ZCtCZkxq?=
 =?utf-8?B?YUxRNjBnakVPYzdKU3d5OFhWTnNvcWRlaUdSRFBaSS9IRWNWejBrTk1TUEZM?=
 =?utf-8?B?RG5zVDBsazRMeGdyeWxPYkJSK1NqYmFEemQ1NnlSK2J0Y0c5SEVzWXN6MzAr?=
 =?utf-8?B?b0NZamtNb0V4MG9JeVlsc2VjUWowNEQzU25wejlheVZ6bnhsd3dTaTlLaFFZ?=
 =?utf-8?B?OFBuc0lqYkdTTEczU052VmdlRjZmMGlseko3b0JYMmZjcGJIMmtlZ1pnOEpP?=
 =?utf-8?B?Y2lhMzdrOU5kM1RISlY0eXVINGtVbTZHNjlKVjByR1AyWXpjNXJ5blpHOFp1?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 065a974d-5626-4bdf-d39f-08de07dde209
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:17:49.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXSVMlzF0QO8EgeUXpPVNW+qKSVoTKaJWcnE5KaAH2Uz9spwT5m4P+KpzpiI44k0xeM0OMsMUThilu6Vp3MFFNJJk3YCLvS+4Es0HqCoJr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
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

On Wed Oct 8, 2025 at 4:12 PM UTC, Janusz Krzysztofik wrote:
> On completion of i915_vma_pin_ww(), a synchronous variant of
> dma_fence_work_commit() is called.  When pinning a VMA to GGTT address
> space on a Cherry View family processor, or on a Broxton generation SoC
> with VTD enabled, i.e., when stop_machine() is then called from
> intel_ggtt_bind_vma(), that can potentially lead to lock inversion among
> reservation_ww and cpu_hotplug locks.
>
> [86.861179] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [86.861193] WARNING: possible circular locking dependency detected
> [86.861209] 6.15.0-rc5-CI_DRM_16515-gca0305cadc2d+ #1 Tainted: G     U
> [86.861226] ------------------------------------------------------
> [86.861238] i915_module_loa/1432 is trying to acquire lock:
> [86.861252] ffffffff83489090 (cpu_hotplug_lock){++++}-{0:0}, at: stop_mac=
hine+0x1c/0x50
> [86.861290]
> but task is already holding lock:
> [86.861303] ffffc90002e0b4c8 (reservation_ww_class_mutex){+.+.}-{3:3}, at=
: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
> [86.862233]
> which lock already depends on the new lock.
> [86.862251]
> the existing dependency chain (in reverse order) is:
> [86.862265]
> -> #5 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [86.862292]        dma_resv_lockdep+0x19a/0x390
> [86.862315]        do_one_initcall+0x60/0x3f0
> [86.862334]        kernel_init_freeable+0x3cd/0x680
> [86.862353]        kernel_init+0x1b/0x200
> [86.862369]        ret_from_fork+0x47/0x70
> [86.862383]        ret_from_fork_asm+0x1a/0x30
> [86.862399]
> -> #4 (reservation_ww_class_acquire){+.+.}-{0:0}:
> [86.862425]        dma_resv_lockdep+0x178/0x390
> [86.862440]        do_one_initcall+0x60/0x3f0
> [86.862454]        kernel_init_freeable+0x3cd/0x680
> [86.862470]        kernel_init+0x1b/0x200
> [86.862482]        ret_from_fork+0x47/0x70
> [86.862495]        ret_from_fork_asm+0x1a/0x30
> [86.862509]
> -> #3 (&mm->mmap_lock){++++}-{3:3}:
> [86.862531]        down_read_killable+0x46/0x1e0
> [86.862546]        lock_mm_and_find_vma+0xa2/0x280
> [86.862561]        do_user_addr_fault+0x266/0x8e0
> [86.862578]        exc_page_fault+0x8a/0x2f0
> [86.862593]        asm_exc_page_fault+0x27/0x30
> [86.862607]        filldir64+0xeb/0x180
> [86.862620]        kernfs_fop_readdir+0x118/0x480
> [86.862635]        iterate_dir+0xcf/0x2b0
> [86.862648]        __x64_sys_getdents64+0x84/0x140
> [86.862661]        x64_sys_call+0x1058/0x2660
> [86.862675]        do_syscall_64+0x91/0xe90
> [86.862689]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [86.862703]
> -> #2 (&root->kernfs_rwsem){++++}-{3:3}:
> [86.862725]        down_write+0x3e/0xf0
> [86.862738]        kernfs_add_one+0x30/0x3c0
> [86.862751]        kernfs_create_dir_ns+0x53/0xb0
> [86.862765]        internal_create_group+0x134/0x4c0
> [86.862779]        sysfs_create_group+0x13/0x20
> [86.862792]        topology_add_dev+0x1d/0x30
> [86.862806]        cpuhp_invoke_callback+0x4b5/0x850
> [86.862822]        cpuhp_issue_call+0xbf/0x1f0
> [86.862836]        __cpuhp_setup_state_cpuslocked+0x111/0x320
> [86.862852]        __cpuhp_setup_state+0xb0/0x220
> [86.862866]        topology_sysfs_init+0x30/0x50
> [86.862879]        do_one_initcall+0x60/0x3f0
> [86.862893]        kernel_init_freeable+0x3cd/0x680
> [86.862908]        kernel_init+0x1b/0x200
> [86.862921]        ret_from_fork+0x47/0x70
> [86.862934]        ret_from_fork_asm+0x1a/0x30
> [86.862947]
> -> #1 (cpuhp_state_mutex){+.+.}-{3:3}:
> [86.862969]        __mutex_lock+0xaa/0xed0
> [86.862982]        mutex_lock_nested+0x1b/0x30
> [86.862995]        __cpuhp_setup_state_cpuslocked+0x67/0x320
> [86.863012]        __cpuhp_setup_state+0xb0/0x220
> [86.863026]        page_alloc_init_cpuhp+0x2d/0x60
> [86.863041]        mm_core_init+0x22/0x2d0
> [86.863054]        start_kernel+0x576/0xbd0
> [86.863068]        x86_64_start_reservations+0x18/0x30
> [86.863084]        x86_64_start_kernel+0xbf/0x110
> [86.863098]        common_startup_64+0x13e/0x141
> [86.863114]
> -> #0 (cpu_hotplug_lock){++++}-{0:0}:
> [86.863135]        __lock_acquire+0x1635/0x2810
> [86.863152]        lock_acquire+0xc4/0x2f0
> [86.863166]        cpus_read_lock+0x41/0x100
> [86.863180]        stop_machine+0x1c/0x50
> [86.863194]        bxt_vtd_ggtt_insert_entries__BKL+0x3b/0x60 [i915]
> [86.863987]        intel_ggtt_bind_vma+0x43/0x70 [i915]
> [86.864735]        __vma_bind+0x55/0x70 [i915]
> [86.865510]        fence_work+0x26/0xa0 [i915]
> [86.866248]        fence_notify+0xa1/0x140 [i915]
> [86.866983]        __i915_sw_fence_complete+0x8f/0x270 [i915]
> [86.867719]        i915_sw_fence_commit+0x39/0x60 [i915]
> [86.868453]        i915_vma_pin_ww+0x462/0x1360 [i915]
> [86.869228]        i915_vma_pin.constprop.0+0x133/0x1d0 [i915]
> [86.870001]        initial_plane_vma+0x307/0x840 [i915]
> [86.870774]        intel_initial_plane_config+0x33f/0x670 [i915]
> [86.871546]        intel_display_driver_probe_nogem+0x1c6/0x260 [i915]
> [86.872330]        i915_driver_probe+0x7fa/0xe80 [i915]
> [86.873057]        i915_pci_probe+0xe6/0x220 [i915]
> [86.873782]        local_pci_probe+0x47/0xb0
> [86.873802]        pci_device_probe+0xf3/0x260
> [86.873817]        really_probe+0xf1/0x3c0
> [86.873833]        __driver_probe_device+0x8c/0x180
> [86.873848]        driver_probe_device+0x24/0xd0
> [86.873862]        __driver_attach+0x10f/0x220
> [86.873876]        bus_for_each_dev+0x7f/0xe0
> [86.873892]        driver_attach+0x1e/0x30
> [86.873904]        bus_add_driver+0x151/0x290
> [86.873917]        driver_register+0x5e/0x130
> [86.873931]        __pci_register_driver+0x7d/0x90
> [86.873945]        i915_pci_register_driver+0x23/0x30 [i915]
> [86.874678]        i915_init+0x37/0x120 [i915]
> [86.875347]        do_one_initcall+0x60/0x3f0
> [86.875369]        do_init_module+0x97/0x2a0
> [86.875385]        load_module+0x2c54/0x2d80
> [86.875398]        init_module_from_file+0x96/0xe0
> [86.875413]        idempotent_init_module+0x117/0x330
> [86.875426]        __x64_sys_finit_module+0x77/0x100
> [86.875440]        x64_sys_call+0x24de/0x2660
> [86.875454]        do_syscall_64+0x91/0xe90
> [86.875470]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [86.875486]
> other info that might help us debug this:
> [86.875502] Chain exists of:
>   cpu_hotplug_lock --> reservation_ww_class_acquire --> reservation_ww_cl=
ass_mutex
> [86.875539]  Possible unsafe locking scenario:
> [86.875552]        CPU0                    CPU1
> [86.875563]        ----                    ----
> [86.875573]   lock(reservation_ww_class_mutex);
> [86.875588]                                lock(reservation_ww_class_acqu=
ire);
> [86.875606]                                lock(reservation_ww_class_mute=
x);
> [86.875624]   rlock(cpu_hotplug_lock);
> [86.875637]
>  *** DEADLOCK ***
> [86.875650] 3 locks held by i915_module_loa/1432:
> [86.875663]  #0: ffff888101f5c1b0 (&dev->mutex){....}-{3:3}, at: __driver=
_attach+0x104/0x220
> [86.875699]  #1: ffffc90002e0b4a0 (reservation_ww_class_acquire){+.+.}-{0=
:0}, at: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
> [86.876512]  #2: ffffc90002e0b4c8 (reservation_ww_class_mutex){+.+.}-{3:3=
}, at: i915_vma_pin.constprop.0+0x39/0x1d0 [i915]
> [86.877305]
> stack backtrace:
> [86.877326] CPU: 0 UID: 0 PID: 1432 Comm: i915_module_loa Tainted: G     =
U              6.15.0-rc5-CI_DRM_16515-gca0305cadc2d+ #1 PREEMPT(voluntary)
> [86.877334] Tainted: [U]=3DUSER
> [86.877336] Hardware name:  /NUC5CPYB, BIOS PYBSWCEL.86A.0079.2020.0420.1=
316 04/20/2020
> [86.877339] Call Trace:
> [86.877344]  <TASK>
> [86.877353]  dump_stack_lvl+0x91/0xf0
> [86.877364]  dump_stack+0x10/0x20
> [86.877369]  print_circular_bug+0x285/0x360
> [86.877379]  check_noncircular+0x135/0x150
> [86.877390]  __lock_acquire+0x1635/0x2810
> [86.877403]  lock_acquire+0xc4/0x2f0
> [86.877408]  ? stop_machine+0x1c/0x50
> [86.877422]  ? __pfx_bxt_vtd_ggtt_insert_entries__cb+0x10/0x10 [i915]
> [86.878173]  cpus_read_lock+0x41/0x100
> [86.878182]  ? stop_machine+0x1c/0x50
> [86.878191]  ? __pfx_bxt_vtd_ggtt_insert_entries__cb+0x10/0x10 [i915]
> [86.878916]  stop_machine+0x1c/0x50
> [86.878927]  bxt_vtd_ggtt_insert_entries__BKL+0x3b/0x60 [i915]
> [86.879652]  intel_ggtt_bind_vma+0x43/0x70 [i915]
> [86.880375]  __vma_bind+0x55/0x70 [i915]
> [86.881133]  fence_work+0x26/0xa0 [i915]
> [86.881851]  fence_notify+0xa1/0x140 [i915]
> [86.882566]  __i915_sw_fence_complete+0x8f/0x270 [i915]
> [86.883286]  i915_sw_fence_commit+0x39/0x60 [i915]
> [86.884003]  i915_vma_pin_ww+0x462/0x1360 [i915]
> [86.884756]  ? i915_vma_pin.constprop.0+0x6c/0x1d0 [i915]
> [86.885513]  i915_vma_pin.constprop.0+0x133/0x1d0 [i915]
> [86.886281]  initial_plane_vma+0x307/0x840 [i915]
> [86.887049]  intel_initial_plane_config+0x33f/0x670 [i915]
> [86.887819]  intel_display_driver_probe_nogem+0x1c6/0x260 [i915]
> [86.888587]  i915_driver_probe+0x7fa/0xe80 [i915]
> [86.889293]  ? mutex_unlock+0x12/0x20
> [86.889301]  ? drm_privacy_screen_get+0x171/0x190
> [86.889308]  ? acpi_dev_found+0x66/0x80
> [86.889321]  i915_pci_probe+0xe6/0x220 [i915]
> [86.890038]  local_pci_probe+0x47/0xb0
> [86.890049]  pci_device_probe+0xf3/0x260
> [86.890058]  really_probe+0xf1/0x3c0
> [86.890067]  __driver_probe_device+0x8c/0x180
> [86.890072]  driver_probe_device+0x24/0xd0
> [86.890078]  __driver_attach+0x10f/0x220
> [86.890083]  ? __pfx___driver_attach+0x10/0x10
> [86.890088]  bus_for_each_dev+0x7f/0xe0
> [86.890097]  driver_attach+0x1e/0x30
> [86.890101]  bus_add_driver+0x151/0x290
> [86.890107]  driver_register+0x5e/0x130
> [86.890113]  __pci_register_driver+0x7d/0x90
> [86.890119]  i915_pci_register_driver+0x23/0x30 [i915]
> [86.890833]  i915_init+0x37/0x120 [i915]
> [86.891482]  ? __pfx_i915_init+0x10/0x10 [i915]
> [86.892135]  do_one_initcall+0x60/0x3f0
> [86.892145]  ? __kmalloc_cache_noprof+0x33f/0x470
> [86.892157]  do_init_module+0x97/0x2a0
> [86.892164]  load_module+0x2c54/0x2d80
> [86.892168]  ? __kernel_read+0x15c/0x300
> [86.892185]  ? kernel_read_file+0x2b1/0x320
> [86.892195]  init_module_from_file+0x96/0xe0
> [86.892199]  ? init_module_from_file+0x96/0xe0
> [86.892211]  idempotent_init_module+0x117/0x330
> [86.892224]  __x64_sys_finit_module+0x77/0x100
> [86.892230]  x64_sys_call+0x24de/0x2660
> [86.892236]  do_syscall_64+0x91/0xe90
> [86.892243]  ? irqentry_exit+0x77/0xb0
> [86.892249]  ? sysvec_apic_timer_interrupt+0x57/0xc0
> [86.892256]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [86.892261] RIP: 0033:0x7303e1b2725d
> [86.892271] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 8=
9 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>=
 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8b bb 0d 00 f7 d8 64 89 01 48
> [86.892276] RSP: 002b:00007ffddd1fdb38 EFLAGS: 00000246 ORIG_RAX: 0000000=
000000139
> [86.892281] RAX: ffffffffffffffda RBX: 00005d771d88fd90 RCX: 00007303e1b2=
725d
> [86.892285] RDX: 0000000000000000 RSI: 00005d771d893aa0 RDI: 000000000000=
000c
> [86.892287] RBP: 00007ffddd1fdbf0 R08: 0000000000000040 R09: 00007ffddd1f=
db80
> [86.892289] R10: 00007303e1c03b20 R11: 0000000000000246 R12: 00005d771d89=
3aa0
> [86.892292] R13: 0000000000000000 R14: 00005d771d88f0d0 R15: 00005d771d89=
5710
> [86.892304]  </TASK>
>
> Call asynchronous variant of dma_fence_work_commit() in that case.
>
> Fixes: 7d1c2618eac59 ("drm/i915: Take reservation lock around i915_vma_pi=
n.")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14985
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Looks good to me.
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian

