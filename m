Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F89EACEBD3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597610E7D6;
	Thu,  5 Jun 2025 08:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feKD4qB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416410E7BA;
 Thu,  5 Jun 2025 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112144; x=1780648144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dm3b6wVLmvF3QEWRzFb4yNTUY/UFI5v/PTQJ8vn1kuY=;
 b=feKD4qB28U2B7tb+/l3L2MZS8VvAJJ9/+7BaFNvaabcg1ISWKRyEf/oT
 bIpuvtvU3HC5Sj4Ncy9AwSQouYIpuveciHj1FWGQeNzgrx54ggnM4l2iz
 ubyi8NhlJ3yloaOoT2E4iFWwfI8MpyStK8uPgSiS08C2zVMWw3KozJEZQ
 CstesScJCAAAPBJLA3CRe6gaTRFK9iaAt3g8nJgujqjMsgG9MFQGk11V6
 ye7Tb+OP+eO1FRHHPg0yFXq433DhyeleypncFtHG8Cw9dARJ3LA2WP4Lv
 0+gLzl/i80ALJ7jsqXHAjhBbUog/ihuqRI7+iqWKwim2XmZYwnl0Ory4p A==;
X-CSE-ConnectionGUID: 0kS8Va03Rwa9ChABvChYQQ==
X-CSE-MsgGUID: vGiJOXFsTKGeLf5qenB6oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68771598"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="68771598"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:04 -0700
X-CSE-ConnectionGUID: ZK8cbcvoSd643R8MzcqGSw==
X-CSE-MsgGUID: DwOg4z0xRuCRQuAMgovq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="149274060"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:29:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 01:29:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 01:29:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 01:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5/ZdfxjkgzZaJRuYzKDo8UB15Uzx4V6/DSSVFLqQAgzCHKwMWRMsuHM/iSM/4CckGZx4fNze5EXmNwt+hF/sxlwsSJAW00fUxlvGtxEcGme97qrRZMORbMa9f6RLyK/hTm292xZ9JKLhIWr/2gBvZuJF3LHtgOM2uf+FOltutWSgfYl8OPRMWHXih+FT6MKJaGElOx0bqv7qgmYDiPeKqdajXUiNpZCZemJcVijNOl0w0Qz1BCpBiHgdN/BCVjnohTpdIXfH+d4dm4+F1+JEwJC//vM3hADMznsyEdsQZOrwlK0OltgstL/Qf6pQ6sEHZqYzoKjdgDvnitgihGmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CRGpi6NWFjBzdpZpTeI5QyE6/Pr4rCrZ7JNqy5c384=;
 b=rAAO34sil34thM7Q2ljExNsZ7UkDVYLe2MgISE0x/e5Hzn/lCIabUC4uCq2cX/CBdQt/0fVBs7ivm8ofu21ES5uaqHVMV23o4TXNiQ4wRus76FGErAuK08i+FewwE4T4dcIQt/88WxeyqOXj8i/Yplq/Qe08pqnRE2TlYZin8iEWWdqNeKtQFgsmj/0yadwB3UtVob0iwIAfOSHFa1b5i17i5veawsI9wS1V2RcG+XnEECttPF9TGgSZLKOkZh5yz9NW5fQB+Blc2H7vFxy7iQ+B3D9fTdtEmn+OR8hG8K1BGRJC3QtSzk/6LlU9Y3yFdzmWFjmlLz7yzZPqNWyP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:29:00 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 08:29:00 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <stable@vger.kernel.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3 1/5] drm/dp: Change AUX DPCD probe address from DPCD_REV to
 LANE0_1_STATUS
Date: Thu, 5 Jun 2025 11:28:46 +0300
Message-ID: <20250605082850.65136-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
References: <20250605082850.65136-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: a8192764-f453-42bc-b5cb-08dda40b05a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aG4rR21IcDk3RkVqWExBZ04wK01GeEw2eHA2bDNucmtudWZZNnZOSE5sL2FY?=
 =?utf-8?B?MjVmWjBidWtZc0JkQ0JSSE9RQll4NS9jd0NOWDhNTC8zVzdNR29NOVRjMHYw?=
 =?utf-8?B?V21uOXJVUHJGaGY0ZmI4OEt3Umk3U1JXZXRrakRJajhhelYwUkpReE5CRm8y?=
 =?utf-8?B?REtqQ3FiVXpXSU84Wk5LU3ZoSUVpZi9VK2FiVjduN0FPS2NjWi9FU2JCeTJB?=
 =?utf-8?B?cmRLOFZWdVVoYk5KOXVNOHYrUnZUN2RIcUZPMGgvMHlFMlhEK3BuT3JhUnlZ?=
 =?utf-8?B?akYvVzRYcmNVRU9rTXh2V1V5aVFvNllKME10Z3ZuOUp1Wnh4VFJJUzh0OEpq?=
 =?utf-8?B?OUJDZm15aWhpQ2RHN3Q0eXkvaWJUc1RRUDlNNDIxM0NxMnJzem4vTFBjc2M1?=
 =?utf-8?B?L0p3d3BvLzhJN0tyYnF6NU1jbEJxQVkvMWhJMHYzMWROZ2RndGJNMHM1VXN0?=
 =?utf-8?B?NGhvek1aTit4dzA4dXJjcGFWcG1FTXpKMTR6c0tOekp5d3J2UHg3RWpkQWNB?=
 =?utf-8?B?MFhYN0dzZ29ONldUY241MlJDVEc4cEc5MlZXSEdZbkYrWGVtYXBiQ25EdktI?=
 =?utf-8?B?VFgvMkw5ejVxSUU3cWxaVENmS25WV0o1enhzQUQ4OWFkd0hvVzd2M0dLdXRB?=
 =?utf-8?B?WGlGT0VTWE5qL2xLVnNYODg4ZTk5U1k3VE9QaEZwVnRCa3krK0tGb2J0bXdC?=
 =?utf-8?B?MUg3eGNJNWVGdkVnN05Yc3V6NHdGTms2T0E2eWVhL1Z5NVkyNDFFNFVYb2lQ?=
 =?utf-8?B?aDRlM1hqWmpwY1d6ZmV6Z1Brd2habG5yRXErWjBOSFBwZjZCMHBzNFU5UFBJ?=
 =?utf-8?B?OHkvcFUzVGpzRmRDVEJBM1llZ3V2MFp5QmlBajRTSzRybmEwT2lTYjhNeVFv?=
 =?utf-8?B?TjBlWWFyTVE5OVpGZjBlUnFmUHhSWHBodEFkSUhMUmY3UDFlUDJLU2UxSXE4?=
 =?utf-8?B?SnZ5QS9ZNUVsU0Z3NVljR3kxUUdoSmsvMHVMUmdZNjYyaHljUWo2TDZYeUJY?=
 =?utf-8?B?NlN5dEFnT2dVMGVaMWZPdUJLTmd1bVhsZWZFMVZGNzNxRSt6RzQwUHZ2V3d3?=
 =?utf-8?B?TTc3MzVMVExqeFlNczE5U01kenkwOHFQZW5QQjc4c0dtYjZkZFpFNUFlckcx?=
 =?utf-8?B?Y2g0Q3hQcVpmN1BGR0l5YmR3Q3E1VG5DWEVtbS9kUnN6RnloL2xpQmJWYzEz?=
 =?utf-8?B?ZTFKUDczSTdoUUVEaDhxSzFiaUE3QTMyNE5GcU5vQlRkWUhXUmlSZDV0UW5a?=
 =?utf-8?B?VVZ6Z1VVN1Rsazh5Sy8wM2sxWWtvWVhZWkcxWmNWcEZJWkJyL01LUHB5cG93?=
 =?utf-8?B?MDFqV3N2YWdkajNxaXU0emZHdnNvRXgwNzNOZnlwOWxNb0U5OEcyaFhoMmJJ?=
 =?utf-8?B?UU43NXhMNDNpNXBrTVlqWktObFVodFY1cE40dC9VUk45TC96TENDMjNLVVZT?=
 =?utf-8?B?Mm5hSEw3MWJtaWlPODBHdWtBRGZGRTdseVp1Tkw5SmNmMnMyNjEweGRrU0Q0?=
 =?utf-8?B?MkVQeDI5ZnRJYXhXY1pud1QzcmVUVEtLcnJyMC9nSWVPM0tFVjlPYUQ4NXhB?=
 =?utf-8?B?MXczMFNiaS9mL1llUGkvVlU2Si8vc1BORTlBRDZET283SWZqL0FCaW9nUE1Q?=
 =?utf-8?B?REJ6NTFwOUVjSU1IM29rTDZiV1Vqeklqcy8vUzBibVh5b3IrcVFvQ3RpdHRX?=
 =?utf-8?B?Z3htemVUUFNNVFdzTXA2MEZjSmNSVkJ5TjN2bVRTZ05mM0tjU3NMdStvdm53?=
 =?utf-8?B?YW52QXR2a0dRN2tZZmVvOTYwZGg3QWNTNGpBYVlDUEFZNW14b0M4OGFzelBT?=
 =?utf-8?B?c0tVNlFWK2VKWjFIbHBmbFhHYjBpTzZVZjQ5SnV5UVN2QXRzQ1JpbVZpVTBs?=
 =?utf-8?B?VGYwYVh4TFFqZ1BJWFVNTXlVaUlUYW8rejJyUFB2K3dIYjJxK1E2TXZYblZ6?=
 =?utf-8?Q?zetE4xP+mE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRsM2I0OEgwU2wrMXRpYjhOSm1xODR0dGpoek9vc1F6RFpJRUFzVkdLVlM3?=
 =?utf-8?B?ZlU3NEhqNnV2VXA3Q1l1VExydXBaN29FT0loNGxzOWMxK3p3VDR6UnRUdXhI?=
 =?utf-8?B?Vm5nUUZMRWxiVklQV0g4RHBoa1IxRGgweFNna1oxTHpzODVNZlpQbEtoQXd4?=
 =?utf-8?B?UU56Ymk3ck1aWEs5akUxRk5HaStNaXVUZUVicG8vM0hPbGhFSERGUzlxR25i?=
 =?utf-8?B?SmFaWG1WOXlnMnBCaEtDZ0VXSzM0VjJDVmtlUTFob3RLTmNpSUFsMmsyOS9o?=
 =?utf-8?B?ZDVFelZ6U3gzU2pYNW5yZXdmSTlzWHczVVQ1N3gvV0txbmRlbmdRRTlKM1VR?=
 =?utf-8?B?QmJGaXZaNFU2a1B5ZDJZVmJkOFErQ1JxcUx0Q05tTDBFL1RZYVdQcG1HMlJB?=
 =?utf-8?B?RVFVNjBJQlpEcXgwMU41UmoxZnFCQTFXUzFEanFNd1NjbUhkRVMvS092b3JM?=
 =?utf-8?B?TEZkOVlQNDB5OFJyVC90VlJkQ1lUd0JwU3VkQVBvWlJhQ1RrNUxzUUljZlla?=
 =?utf-8?B?cUxVMzRaTTJOM0NRNEIzZ3hiMWdnUWhYNGVEWVRJbXpIdGs2MENtMEZHUTBq?=
 =?utf-8?B?dTQ2NUpaaThRQU5pbkFFekUrajJpWEN6NitzdFZhQ3NyeVlWUVR0alJKb3VC?=
 =?utf-8?B?WlhMZHFSUVZ2UldYbVZGME5KcThsTjc1M2IvdTR1MmlXQTJBNXZlMno1U0NF?=
 =?utf-8?B?TlhwYzVqYlhPZGhjRjY4aDhyREdqNmxrUVlwK2FQenpNQlBtWGEvREFUMTho?=
 =?utf-8?B?aEozRnpqaElTN0tyd3hiYXNSNWJrRUd4VHFrMitVZHVKRUlxNURLT2JOWGFv?=
 =?utf-8?B?NEEwK2JHSzdiZDBSMmNTdk5HWjdBNmZ1VlZ3SXZ0KzRwU3lNQjY1eFFSVFYz?=
 =?utf-8?B?QW5oQmlzSHh5dkZZNDgxVVNDUXJwRXJFOXlZdjlkeDczU3ZaUW5QbllTTmhP?=
 =?utf-8?B?OGh6YzBBbTJETW9JNzJVZkNWNTYxaVBJb2dRbWRSdjAvZ01GLzFXbFRIaU43?=
 =?utf-8?B?M0hKYStrbWxYb3dHYWVzd214bk5Gdmw1ZHd4cmFobElrM3A4dGhPZTByT3F3?=
 =?utf-8?B?U0U3cDRkSmJjMENSSjc3dmY0ZjF3MGFHMGtLeGs0UmFZQnlWWDA0N1Z4Y2x4?=
 =?utf-8?B?eU9ab1N2RWI4Q1kybGRJdjVVNVJDUHBtR3JnSTZjU01JVGZhMWNCdmE2Vi9q?=
 =?utf-8?B?em4rdkRHblpGZkMrS3RrTFNaaVVHaWFSeWVhY05NZmU3SXQzY0F6VHc2WCtn?=
 =?utf-8?B?ekF4WWwxcXRFSlpWU0Q3YzlCRjMzR3hOcnY5c0xFT2t6cHRaMkU4VnlaRTY3?=
 =?utf-8?B?RUYxRjlCNnEvbGlTSWd5aEVBWnNGK3RnTlpiVWpJZTF6azdDRUo1azR1bjdx?=
 =?utf-8?B?aFFKK0pKNm5HdjNZNklEQ0toYU5LNnFkYXVqV1lzT0dGTmtTcE5Mb2g2bTJk?=
 =?utf-8?B?dDRCaXNPTm1rcUJpTzhQTWdid2dIS0s5ZGlUaTVyTzN5OTRUQXM2SkVWMEpm?=
 =?utf-8?B?NXlsZXVxZzZsaFBOS1IrNENBUzJpdEhSU3RFWWFiUzRzY2tsNHNSNnhWenZE?=
 =?utf-8?B?SXpkelJhcjlSNW8yaUJENDdEckZMcFRUeWVqWEYyTmFSNEpzZ0lFQkZ5b28w?=
 =?utf-8?B?dXhCdTRENkw0N29IcWt0TVZoQmVyV1VqTU1Ta3EyWWZ4Kzh3UzJMZElXQm8v?=
 =?utf-8?B?VVBwMHJJSVd0WU8yRUlVbE5sSjljd1hoSkF4L2x5dU1Jb1Vwd29udVR4a090?=
 =?utf-8?B?alhqOXppS0hRVm5naDlFVTM2WURWSnluZ3M1bDROaWZFSVNRVWx3Uy9iY2Nu?=
 =?utf-8?B?M05UUDM3d0J1bXB1M0pSdmFwcjRNWXgzaFM2ZjdkV1B3ZVN0TlJ0TTRpUzJU?=
 =?utf-8?B?M2xwRDZ2SFRpenYxS2RibldobkZ5Mndxd2JrSXNHNWtJeVpRaEljNzNHcHRH?=
 =?utf-8?B?cVpMVkdjOGw3Y05kcWFuWjREdmxuZXRQMUg4b0J3Yjl0eE1FZElvMURiTDhI?=
 =?utf-8?B?UGV0YnBSN1hwV1hTRzZvcWxscUdOcktlRzlETFU3L21jeXBNcHNQYmhrcmYv?=
 =?utf-8?B?My9NT0JqNzNhVm1mV2N5OHFucWwrdStMUVNBZ21pckRXWFpXUUdWT0M3R0dE?=
 =?utf-8?Q?1phQSrSHMmi2dCZAEjuY9nJLT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8192764-f453-42bc-b5cb-08dda40b05a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:29:00.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WdPkKzTzms0C0YkF1BGjA0tVCKq15pSgEl5KVDZnZ/Sj3cEpsUW+WK3jHQ33BzlVQpDQ/980If8It65Mm9bgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
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

Reading DPCD registers has side-effects in general. In particular
accessing registers outside of the link training register range
(0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) is explicitly
forbidden by the DP v2.1 Standard, see

3.6.5.1 DPTX AUX Transaction Handling Mandates
3.6.7.4 128b/132b DP Link Layer LTTPR Link Training Mandates

Based on my tests, accessing the DPCD_REV register during the link
training of an UHBR TBT DP tunnel sink leads to link training failures.

Solve the above by using the DP_LANE0_1_STATUS (0x202) register for the
DPCD register access quirk.

Cc: <stable@vger.kernel.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a27100..dc622c78db9d4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
+		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.44.2

