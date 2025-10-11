Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB248BCFB99
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224A10E348;
	Sat, 11 Oct 2025 19:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nccnxo3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CEA10E348;
 Sat, 11 Oct 2025 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211665; x=1791747665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FMdDT7XvRKd38v5wgnm1AnOwPqKE1jSK6mt2DgT6pnE=;
 b=Nccnxo3LaywUTXCkWN9Oy2hTtNV4FwlLq3h+uNr5pcCisvpBHfjFZQ/q
 4hjZ6BxZegWcMggDJpE47rsaIFHeDq9j5suxfxJsdstwBa43SeoX/7pS6
 aocDfZCfzIBebOVxC3/e3ys901n3EUlDzqIqMEqj3xOOnBgXgEa4h6wDr
 CMmVvCWWcG9ntjR5Pf0OXQ38Ymz1E1+slU82Qk85ArkQzdrYOBuzHycCv
 m8H6bGzSgP+neTiMbldDuLZRX/svMkfBxYuzezQeJ9wmvpB88ZP393p68
 VXTf2i6sLbzqPC/NI2zMqpWjNT/fjvLZN43j3CPEgFTiRPgGI0Lh2ewUL g==;
X-CSE-ConnectionGUID: cuj864LlSn6ooVQzxBAncA==
X-CSE-MsgGUID: td3kh28qRsqVuVRHChNNow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62342178"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62342178"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:04 -0700
X-CSE-ConnectionGUID: sBqa6jICSSC0KTE2TDNO7A==
X-CSE-MsgGUID: 9keG+y0yQP6eeljgUkawdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181661680"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:02 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYMD+rITrAOJRfpwopc9j2pEuqWE38U6rKhL3VTT4hy2bWxUMZtQW4bBFMpcm6ihF/UkvMTY7f3NM1INGCdN7+uANi5/jdSAyzmWppvSvc8HH+THRZ5ZwGpNC9qpdj0C6wH/UbyftGy9VmHR7cvAXxuZHfekuDOfG1cWECzHWpukaXxkc/Xw2ccC1zEynFfnX+ftAPmpmeqs/8Yidwlahf4IZV/U3jjylqiKFjt/8iYavNIeGLujvbnu6aoqn+IGvD5J60WXhYsSxJgPrb7aBdvYMlUaMDzNjDz6pB80c4OCsrRfCW6qGHGPY0NMcB2+CSa4BRQ5xaZzzPYPL3HSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saDosN6s2qFI++ZpXan/3HWpvsvhZ8YQrxwHAT2bRAs=;
 b=NZNEBTClZUbusLrSnmvy4FGTiNvt6y6SgEdSsAAoQ/NjFwj79jQkpUuyGHF3YNo0fGISIOt6wLhNJPbZQ0KN4GN5CEmUEIMe32yRhVqSpv4B0sK4i4lhdqL07ivxeJxPbNg3pkeenLhomvn1jd8xOcv7K+vVjACiugs7RpreVmzYazp72Fu1tlCGaADdarUDJN+2m6MzUCTYP02sgrXlJbTj5OM++j3j2sJcU9jVbuZS/dPIykXQfDM+BBmQnm1SIMpi7S5pYcA/T/uX1Xo+dcbjiQdu+4VZJ0L4GMLMkKLZDejOLqwZKScMOT+DIncC+ExcaYllsfxRk8Q30F6Bag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:41:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 10/26] drm/xe: Add sa/guc_buf_cache sync interface
Date: Sat, 11 Oct 2025 21:38:31 +0200
Message-ID: <20251011193847.1836454-11-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: a59ff207-e596-44f8-d983-08de08fe1b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2pkY0dnRE5Yazh0TUU0STRnNXBNKytHVWtJYmh5dWl0Y2hCdDhVeW9FNkdX?=
 =?utf-8?B?MEFpZkV1VzA4bWNQZWVWTWxXdUtKeXRmZkowSC92UTNjT1AvMVJCTDhmaU9s?=
 =?utf-8?B?T01oQ3dPdzB4VDRBdTNjTUtvUmFUMG50WXQ3YlFZMEltekZrbDVQdnY1cXdt?=
 =?utf-8?B?YXhSNzVQRXlXc0NGSmRzR3d0RkFsVmVRdHFBU0NRYmlUc2txRHhKQnpwNUV3?=
 =?utf-8?B?cUR0aTc5NkNXNm9ULzhNbmhNem5vVFhCU08vSjlUMWRybzRYMkNHTXZYQW44?=
 =?utf-8?B?VkhJZzdXdTNxdnV0bWpZUVNnYmE3SzdJQzJNWXNETlZwZ1dmSFFzUVdvV0hs?=
 =?utf-8?B?NHhhWE5IMld3SWppa3lLWUR0QzNYYUZnR3hZOGRpYWVUbEJlSnI5MmsxU0R5?=
 =?utf-8?B?K1NSRzdCREw1SE1kWnZlQkpXdGF6cnhWeUN3ZUJXeGdUdjVXd05CR3BkVHBi?=
 =?utf-8?B?cGwzQTgreEZqSTBTL1pnc2dIb0pVOU42Skh0UHI2NGNONFJjZjFpMnovR21l?=
 =?utf-8?B?eW1jZk9hQm9aRUw5N0h2RnRkUUFEVFMzNXl2aFlCc1BKR0VYdHNQUXd0RHhH?=
 =?utf-8?B?bW9PZzdHWGxvZDYvSUhiSFNVWmd5U0NtNmd4S0ZWVjJiSktlbDhpTkw0Zk9K?=
 =?utf-8?B?Uy9XNU8yNWdlbE9uYnFST1dGNGwraFI5MnJmNlFGTm43QndnV1FzMlNkaGJM?=
 =?utf-8?B?aVI4OTBiNnlRUmpmcEdRZUZxVS92Z1hNblpLZ3lpQlVJdUFPQVBnU3VVeUQ3?=
 =?utf-8?B?UkhpaVRycFdXREJ0QlJaZVdYcXBWTEs5K0lhSndQTjFNNVpZanRtOXp3Y1Er?=
 =?utf-8?B?Y1B0QTFuUHI0bnpMdFBJMVBSNGx6Wk0yM0hEMWRNdDZqbjgxVzRrS0I1L2s4?=
 =?utf-8?B?dGpBZEY1TmlnajEwZEdYajBPWFFKVnAyeTZvTS9xenI2dVdodUJrS050T2Ns?=
 =?utf-8?B?TUVVdTkwSi8xVy9JN1FsRWF0eFVvTlZPVUlwa1FWbWU5aGZEa1c5Vjd0M1dR?=
 =?utf-8?B?a3hPREUwRHlnYm9QSlVQZm1EbTErcjVVVlJmQTc3amhDZkQxeE1EOEtqMDhB?=
 =?utf-8?B?WG5wQ1J5d0Npby9iV1R5RGRUQ2w1Y0had3NjOHZsdHdoUjQ5NEFzSndSS3hO?=
 =?utf-8?B?RGwrN20xTE9TanVjSkZUMXFVd0hOdkFHc2tuMENocXpWRTJid0pCSVc2d3lu?=
 =?utf-8?B?NkFHczJYVm53dVMwQnl6YkkwRVlVci9Lb24xOG9COVlzbmZHZXdZMGNYZG41?=
 =?utf-8?B?R2pFbnNVeW1BT3prMjRBemdRVkxjS1RmQ2ZOVU1qZUR3aEFtQmh4aGRnWFI5?=
 =?utf-8?B?eWMzQ2VqQ2JJMzJNWmxJZ0lJTlJWWnE3MnhuWXova1l0T0RpbEFYRWkwTlpT?=
 =?utf-8?B?MjdLUzFheGx2K1cyejZYZzdlQUdxSXZLaVZXM24zekpHMy96S0lIN3MvWFRm?=
 =?utf-8?B?eWhobks5V20zWlN0VzRjRWxyc0F2d1d5Ti9GL0xZMmpNUE1kdWFlN1RhNUhw?=
 =?utf-8?B?Wk5MV2JxZkMydm1UN1ZJdldLWjZZc05ISXdwSTVaTFIvUG9ldVRmOWFHQzR3?=
 =?utf-8?B?N210SkZGVWNUaWtvdXJyeHBXMmU1VGFHQ0RWaFNZL2lkV3orenVuc0V5Y29M?=
 =?utf-8?B?bThuWTZHTkFoZUpkcXJ5UDFhMTNOaGtIL3BYbHExUU5BQ2lvSXVxaUpKNGcz?=
 =?utf-8?B?Q0FHaDJJMHlpKzk2N3J6QXVpMHRNTXBuaVdZNnNxY1FNZURDV1hpd1czRTh5?=
 =?utf-8?B?VHNVaERWZVFORFo1L3NDS3lVTk1tUkpJYS9KVGV2Uyt2cVoyWTVXalJleWs2?=
 =?utf-8?B?djRMWTIxb1FyYjZJdklITmg2VTJDVnN5ZUdVYXpzMmtqVGtld25ORnpNRFRL?=
 =?utf-8?B?S3dlUzNyMUZCN29HeVkxMWZvaGF4MFptY241enp6Z0pYRHlOc2hBbnZVTWg3?=
 =?utf-8?B?VTIvMnpKZjZ5SW04Qk9la0JPY1JLbnJSa21zbUdnZFlXaEp3QjIxZ1pGT0dr?=
 =?utf-8?Q?JNsXsRwBLiEJJxJFsZ6x8CKSP6Tgwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZSMzNtVy9kTG5JWkZWV2VzSXRkY1MvWmRxZXIxVC9CdnVNY0ZqU2dEWmZ1?=
 =?utf-8?B?K20vOWlMR2x5SHJRZjdxWEEvVkJWeVd3UUc0TlRaT0htZFpObmpPcGEzSFpS?=
 =?utf-8?B?MG4vSnovUXZEQ2h0WXJxcDh4cG94cWU3L0VKc3ZYUjB1bmZ1YUlHcWV0MHR6?=
 =?utf-8?B?ZGtYQUd5emFxRXJhQ0Z6eERNV0ttMWlrbG5xNHR0ZHU1QnFWV0w4bzRaR0F5?=
 =?utf-8?B?c3N3bDR5aFVLdytYdFRHZ0RaOGoxL3JBOUxwZ3hMQXVoM0crTGsvOEd4OWY4?=
 =?utf-8?B?MmdhSGF3bGZOOWcyUjJ3cGU0bE5JaExxTFJhbTIwcllYdWI2YjQvcWdTS2dZ?=
 =?utf-8?B?anNOb2dJc1BRYURGTG5GVzlWcHpnVUhiTTFwVDVXbkZ3blRMdUNwa0lHcGVZ?=
 =?utf-8?B?akxFUGw3bk5ZZHY4bHFkOXNQSWFjRmh3MTdzVEJYSjIzZ1hhK1BINHAyaXQz?=
 =?utf-8?B?YVZieHkvOEl1Yk9sVjU1Q2FwRnFVT1dDckpIK2N0aGxtM3NqTVllcTQycFRt?=
 =?utf-8?B?RndLQkZ3b0RNd1NHY0NvYXd3dUZZbmdqVjRnWDZaeURFTlo5bGh4RzZmQ3Fj?=
 =?utf-8?B?UnhwemQ0dkkyVFYycUVPZVBmbXlVRzRMTEpTUDIxQWs2OFAvNnZjMDFJTWxu?=
 =?utf-8?B?bkllTE9SNmljSXlxZVhvaHVNVUpjbEZSbzE2YWExRUpOUUZueEhBZHl0ZTdn?=
 =?utf-8?B?RHArVWZpTzVsbWxTUXVpWk1MUEtJYllLbmpyaVg5OUpMNzMvK0dJUGJiYTJm?=
 =?utf-8?B?c2FBVlBDeUl6eVJKZXpveG5vS1JuellmcVBlY2g2cjlaWVFVTkNrNHV6YWs0?=
 =?utf-8?B?MUpBdS94dGRCeXdsSzhoTjdiVnM4Y216UElXR00vUWViaUh6Y0pUbVFuRk5F?=
 =?utf-8?B?bnRtMzBXTTlxUzNtcnpRTTNZZ2d1Q2Z2YllBZG1DSXZVdzQ3Q1pKWTR5R3My?=
 =?utf-8?B?OStIOEoxTDVnVGo3eE1GbFo3TlUzQ1AwVTM4NW00UU5YdFVUZWRoOXdjbEVl?=
 =?utf-8?B?RHFzNWIyQmZBNzQyMjArQVJaeHBRc2xGT29XN3NYeTJsRWxDVG95eW5OVFZW?=
 =?utf-8?B?Sk02M0xnT25uYTZHYVlwNGtOR2xSY2Jmbk9nZHBOV3h0YVNENk1uaEowRjNJ?=
 =?utf-8?B?dlhIa3IrckIxc293a1poYkZlaTN5NVJ1U1pWMlNKS0VQVXdiUjhhYmFvVUFv?=
 =?utf-8?B?SE83QTczRDhlemZGcyswdTFUdlRCL1BqakV6SWlockhJRDFIU04wYjN4V29p?=
 =?utf-8?B?d0VqV21MZ2pqWWVUalNZcWVjRFZEZ2R2dkl4blBmaVJpMXNEbWdzcVlybjlv?=
 =?utf-8?B?N3RCdlh0Smt5ZXQzTzA3QnhBMTJmeGFUbllQVE54V3NEY01XZFRuNE5IMCt0?=
 =?utf-8?B?aEZGQVUrRXBRYUo5T3gzcjJsdllFdklUdFJGdHhMeGQ0VUNkcVMzQzl0QWg3?=
 =?utf-8?B?WXNkOTdRNUU5RTRyMElqcmJGZFdJeVV6aGIzQktyMzVQOTNrbnZpTXhUR2li?=
 =?utf-8?B?bWNJNDJCMkU0K2tPcjJaNm44cktHVFRyNXgzMmtIa292MlJPaEpkUlRXcTJE?=
 =?utf-8?B?cUtreHFxSEJFdDdFQkl3Z0w1WStFVm9BSnh5MkY4Q0pPaGJZVUl4U01KdDNm?=
 =?utf-8?B?bGlmcXVpekRBWmtpVnVrbjlpUEtMQ2dmYWJqZW1kQStxaExXdG9KVDRLNFky?=
 =?utf-8?B?cTI0eEN1dnlqemNUbjFTVDRwTWNsZWU1dzRzTFVmR1QwSnQ1ek1CR0ZFTFJv?=
 =?utf-8?B?UFpCNXV6OFliQ2IrUFh5eEd1djNBMjdjdlNHZEdDYjVvN01FaG1PU3Z2bDRM?=
 =?utf-8?B?Zk5sM0hWa0ZWY1ArQzNtNkRHQkhiK1duSW4yM2pmSmZoYkUyTnJnQlBoSWFQ?=
 =?utf-8?B?bW9qTGNGMUt3TVFpcUo3RWwvS09SbDFhUTVCMFJ2bXV2NUhZTGVnSVlwMThu?=
 =?utf-8?B?MC9aaGFScFFJS1R6cUVFRXpJUnJLRkxUd3Ayd3V5ZVdJKytPZkk5RkJ6NFRF?=
 =?utf-8?B?SWdsL0lnTFNhd0VjWGYxU1oyMzZFTklvTkovQUY1NkZLUG11cWhxcmxxS3c5?=
 =?utf-8?B?QzlsRzZJQUZ4MnAwVllML3JPaDRXbDA3TVMybHZKZ0tEeXRRdUc3VUxpSkt0?=
 =?utf-8?B?UUkzZ3orbFllYW8xZEk2VjMzVzlFNkJvbko5bHVCTzNaVHRXTHR3RFhBVkFP?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a59ff207-e596-44f8-d983-08de08fe1b49
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:00.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQFMLI0zPPRKZ5UDwQLj4AXIYOWIe6gFAO+pEG6nSoX1XgbGAnSkhtI9cWvwwEztw6cN+Jn8k/u2fYkEKJYQutOsHBJiKDLRIIS6vx+HfKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

In upcoming changes the cached buffers are going to be used to read data
produced by the GuC. Add a counterpart to flush, which synchronizes the
CPU-side of suballocation with the GPU data and propagate the interface
to GuC Buffer Cache.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_buf.c |  9 +++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h |  1 +
 drivers/gpu/drm/xe/xe_sa.c      | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sa.h      |  1 +
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 502ca3a4ee606..1be26145f0b98 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -127,6 +127,15 @@ u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
 	return xe_sa_bo_gpu_addr(buf.sa);
 }
 
+/**
+ * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
+ * @buf: the &xe_guc_buf to sync
+ */
+void xe_guc_buf_sync(const struct xe_guc_buf buf)
+{
+	xe_sa_bo_sync(buf.sa);
+}
+
 /**
  * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
  * @buf: the &xe_guc_buf to query
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
index 0d67604d96bdd..fe6b5ffe0d6eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.h
+++ b/drivers/gpu/drm/xe/xe_guc_buf.h
@@ -31,6 +31,7 @@ static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
 
 void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
 u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
+void xe_guc_buf_sync(const struct xe_guc_buf buf);
 u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
 u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
 
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index fedd017d6dd36..2115789c2bfb7 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -110,6 +110,10 @@ struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size,
 	return drm_suballoc_new(&sa_manager->base, size, gfp, true, 0);
 }
 
+/**
+ * xe_sa_bo_flush_write() - Copy the data from the sub-allocation to the GPU memory.
+ * @sa_bo: the &drm_suballoc to flush
+ */
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
@@ -123,6 +127,23 @@ void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 			 drm_suballoc_size(sa_bo));
 }
 
+/**
+ * xe_sa_bo_sync() - Copy the data from GPU memory to the sub-allocation.
+ * @sa_bo: the &drm_suballoc to sync
+ */
+void xe_sa_bo_sync(struct drm_suballoc *sa_bo)
+{
+	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
+
+	if (!sa_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, xe_sa_bo_cpu_addr(sa_bo), &sa_manager->bo->vmap,
+			   drm_suballoc_soffset(sa_bo),
+			   drm_suballoc_size(sa_bo));
+}
+
 void xe_sa_bo_free(struct drm_suballoc *sa_bo,
 		   struct dma_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 99dbf0eea5402..28fd8bb6450c2 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -37,6 +37,7 @@ static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager
 }
 
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo);
+void xe_sa_bo_sync(struct drm_suballoc *sa_bo);
 void xe_sa_bo_free(struct drm_suballoc *sa_bo, struct dma_fence *fence);
 
 static inline struct xe_sa_manager *
-- 
2.50.1

