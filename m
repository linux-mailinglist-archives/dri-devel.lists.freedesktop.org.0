Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OOWHVAwoGnUgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:36:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6861A52DC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AE410E029;
	Thu, 26 Feb 2026 11:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwGuyXjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BA210E029;
 Thu, 26 Feb 2026 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772105804; x=1803641804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0EfWTBDRT58geaTF1WuJsFZj5nc2noPwoFMocSqbX5E=;
 b=lwGuyXjVah/A/8qt2QdEQPQHkIbY5RTDrjStmylzqEugpzrKIRO03pfr
 EEFDLgqziNWv1zcdIGlQnI05TEXXiAqFQdKCgdZ2Ik0UHvGQ0eYdzj4KG
 ue+L9p75Np78iYEJWVPcqK8m+dOL/JKdhKDsyY9Hq+GxGaDH3PBLevZk4
 qqSkh+yJ8eq7Z3QyNwr2AQNgScIhdDfV6QmoYnh3OR9TQbQxPwSFOCDWH
 ilKdI7No95LRpEC9Czjpo6puWopsAIJ61lgHkyhstn38d6pDKviOJHQP9
 TGfnylFhchbGy+xMvakLZm9LV6z2u2aGICOpspo1K8U4NGeisnjys3onx A==;
X-CSE-ConnectionGUID: OdJirbk2Rz+kIFJlMWlcJw==
X-CSE-MsgGUID: 0ft/pznsR26vn5TSfqBXrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77032031"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77032031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 03:36:44 -0800
X-CSE-ConnectionGUID: TIoOQxhwQZa2lPMfVrWDkA==
X-CSE-MsgGUID: ZmsuyWt2S9qmj6oHCR0uvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="244132220"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 03:36:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 03:36:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 03:36:42 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 03:36:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnMfQmua5EXs560j7ASV+omhV7TtuKqkuWCUXkMfdTpmVV7Y1R3/wtQjdc13aPFBi+qbpwwdbFX7rvt05Wew6at5pN7DT6SvM8VVaBiJxMTa+oosulartrU+NGZuH2wnRL3jN8v7Xv8dQKGFwdR2yy4SJaFb8nerVioY+1QmBXz8utn7ffXRJnWoG0WfBqHz2P5DD3Ruenucs5KkzZt6RGZdnChYCrjpqo4Oz5MFXPVQJXZvzahaTsvdjcjzjcWWfaU/VcfGG0Xk8gpIqnr7z2ampeBvb5mDCi1BEGk6Wl00kapdbnble/N/a3UdhQQzsyBVhnBKNxhSve7Bso/8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3xyWC/y+LqkMt09whE0GXRU8ahbdnsCwKzWeZWyswI=;
 b=Q+KQUqtlZj73Xwwibs4/2R8Zsi8N/WLxCkWDGgN5E6i0gQfnD2GLoUqMUpD3cVDE+X2x5Wt1KcY3SBQFLTn+WiaQ0+vx2SOCTqUowmwcd5oK5KlzOirswrIt/iAT0ANUTiMp6c/eHA146umXPBnu31WBRmd3KuwCgC3oT5nozudTT05kdZPjf6CMZVVDLmU1vozJVnq2ELPxvaD8kvS4kV6q6IhNaf2j8Dn0d7v+l/ryHzwHbNSfIAFMZH+FFcqSP9U23ZSSzUBV+Xab6vHeBU4GCNvz+6TxCGs9xI87ai+cXYEG52URYdRfxkIDgxv5ytyd1bOjxn7gEi3UdarTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 11:36:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:36:35 +0000
Message-ID: <811e941c-95d2-43ef-bd56-c58689b410a3@intel.com>
Date: Thu, 26 Feb 2026 12:36:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/xe/pf: fix kernel-doc warning for SR-IOV VF
 restore function
To: Yujie Liu <yujie.liu@intel.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kenneth Feng
 <kenneth.feng@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>, Yang Wang
 <kevinyang.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou
 <tao.zhou1@amd.com>, Gangliang Xie <ganglxie@amd.com>, Candice Li
 <candice.li@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-6-yujie.liu@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260226030038.1182961-6-yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0046.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: d623cfd8-0c7c-42ad-b92c-08de752b4be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: aEFZgr5dkOMNYxp4dJZWRvSAOIUSxFR4VWTB399FU57oi9maDkUWgSDeLIZ+5+lAlMUq6rFpLEjbWwT6AG1YG0pgjsrj3FdFp5TiGgHdG041wiQEOHAbdkdyZfUWab77Gm9EAKdx31yjFn59KhGetflOQwM9RVFbSo59V3S1HsvEn/isqSMLOfVw3IfsKPf2y2QR5OyB6dLFw10XT5ZK7X03TE3kO/dgSO5vbmJvUQxUUlN+oXVXF+B2J0N5KXvnoRrHdy1jeCyfKrzfaJbsueMxV5C+sKNu9zEsBjA/xM3aUd42Rz43r6cwJ6d3Ckza2qcxIlkwWU3C5ygevv5TkKbLVMjGU1SohhLQ2yZRZ2tNokSz29Cs+nAv9AQ85iUfsoAgnUefiaAlA99ziOscQaCloFe3wxbrhoDxuo7pSL0o30NLgVCwZik9ZZhtigU+Kj1CctBvbTxidhziFaiEqbCIl3aCVeMKTAQyG8D8zpHxTrNZFX0iZzkkH3FgQYjaVvoGM41cGHpyIYBTlcwPm90bukc+WvdXemBnpjFIHWZ6/UAt5f+rKNVYCI9pCVEqvWTZ6owvDhjtC5DWE6BjPsaksVVRznPPDf7LD4/hxasraBT3vfRlF0xMlvAvv2+NYe1hoqPdyMkmUd27bq5Uc22WKEftaTAfduLuzLY7XFwq35k6zJd4uo1+uGcPtXkGI4gE/4DOQ+IvTM4EYstmMjlVI3H2eE0kMfvddVFx9sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R085V2NmWlZEUHpTa1hyMFhmN1kycmhQTm1VMm9pNVhEME9IZWNUS1pkUk5n?=
 =?utf-8?B?UXNSLzRSUnhzdG5zUi9HVDk3b1RKQU82QnBKZGI2UmR2QmtjeGxjajBkbkpI?=
 =?utf-8?B?cmF3TTZMRTE2bjZsSkJDMFptSEtyZkpKcXpBMlRITWV6VjdPTjRUTWh6WENV?=
 =?utf-8?B?VEFHR2NFSUxpaENSQXBLK2JsMHFvL2hyZWlmYlVUNjVrR085bUpDUUR4U3lm?=
 =?utf-8?B?L3RCVGszOHFySjU4eEpjOGw4ZHhCdThrK1JOb3lubGk2ZXhKNktlQVZyTXgr?=
 =?utf-8?B?Q1l1ZmhWenJKN0lCdWIyUzlxWjBITDVvYVFXeDJ1L2cvRlFOUlZFbDRFSjFo?=
 =?utf-8?B?bngwU29ZdmwwbENyclY1M2c1OE1oR3MyYW9abi9ZcVRMdTFFeEJkY0oxUmhO?=
 =?utf-8?B?RFN1ZW9SMzk3YUxDUDlONlRSS0RKL0h4eE40OERQZWdNWDJXZFEyQXplRG53?=
 =?utf-8?B?U3lKdUtCV0Y1dHRSaHdjSW9DcExDRHZXZzJpR1I5T1pRbzhyeDhCb0dlTmty?=
 =?utf-8?B?TVlFVFU1TTVheWUxN2l2Ty9VcGpiUjFIUFlaM3o3UWlpTmxTOXpnREhTQ0M5?=
 =?utf-8?B?ME9peWJ3RHF4YjBQZWZHN3lDZkpnVnVXY3JBSzFjUVVvK3ZuaCt0dUpZTnV3?=
 =?utf-8?B?a3ZWMTdYeS9uQldXbU5lMVF6UlUvVW51SkFNYjBOZFI5d1VCVEZZa3R1N3Bv?=
 =?utf-8?B?dGUxMWdHTzFERm1NQzJBVHh6RC9ZMTczNFF4Q2hWR3RHUVNkWTlQbFEzV1JF?=
 =?utf-8?B?MmUvc1dEY3VWR1JCd1RzdlYvMVZETEpkRkMvQVV3ZlIxb2ZTNkdWL0Z6cnVE?=
 =?utf-8?B?OVVMT3dOMU5OTERlVitNb0F3VjRJQmNtQWcwMHpVWHZsZWt4cjZNMFlaWmx3?=
 =?utf-8?B?eE8rVDlzVDlNRWN3S0cxTDd2b1B4VHR2MEtteGF2MXk3Q0hCR0grcmZMT2Ro?=
 =?utf-8?B?MG9WKzNyVVNZQWd5SitrMGlNdFAxRnRCSUlPc1VFeTNBWEQ4dnhNbitDRElz?=
 =?utf-8?B?bHlVOEw1SHdTSXFld2psM3dXTFZzbmEzczJMNk1VVWRzckJBL0RtNGlBelJk?=
 =?utf-8?B?Z2dDRFFPeWx5bjkvc3dkYmxOV2pZNzdxQnUwSyt6WUhPYy96emJUQnkxRWE3?=
 =?utf-8?B?THRtb1hENzcwMkVBaExvbWswSXdGb2NwdTJMaUJOOU9jVWNPMmxXTmptblRG?=
 =?utf-8?B?eUNGUkh4TDBoZFdqRCs1MWpHL1lWR3lWM2FLY3dvNUVHWDBTSDZ5V3lGb1Uy?=
 =?utf-8?B?VmoxWENNT3JBeXJZYzFOVDUwYmtyUXlWRG4xUTZpbUtodGVXUWY4VUxTMyt1?=
 =?utf-8?B?VGU1NURLL3l5SmQ5Tm1UMXh2NjVKQWJIc0FHSWhHUDIxM1dZa1p6MEx6dnF3?=
 =?utf-8?B?NTZHMU5Nak5jWEhuWkxIZ2E3QW9uUHlNbWN4TEFzVlFVNzhFQ3pBdzBZOWhE?=
 =?utf-8?B?Um5IRHhWaUc2OWkwYllnY3BpUHR2N3N6eGxGM2NqbGFIUXhONTJ4bHJ5VUFu?=
 =?utf-8?B?ZnhKc2FLczZvb095S1FaMnd3Z3FzMGJ4ak84M2NBWmdRT1pCbzdEOEl6aUg2?=
 =?utf-8?B?bFBMa3Qzb3F0QmZqK2hGSmh4d3JqYTlMSk5MKzNVclB4UFM3eVBnY0RqTm9y?=
 =?utf-8?B?a3plWDVmVjdpM21zUDV5U2hiektMTm8wVkNQUUFCOEpOeUFSRmFPNWJzcWdK?=
 =?utf-8?B?Y1Q2NVc2aWVQQXY2ZnhESkpETnFBcVkxdkFmczNHOE43L2xPVlY2b0IwdUkv?=
 =?utf-8?B?azgvMlJlSHJzeWtQei9JYlFyV1ZaVFRhcjlUOWlxblgvbldTTzI4N3p1eTVw?=
 =?utf-8?B?ZlA5dE1hTTUwN0t0ZVNjUUlqVU01c2g3WGVKTkhEZUhKemU0MDVVdmJtTUpM?=
 =?utf-8?B?WHAwcGh4OGNFdUJyMTFKb1FnZ2VVem5PS21lekpsdzkyOVhhUkxPNnZtWnd3?=
 =?utf-8?B?Z2FZZlNiRm5hTExCTFJwK04wU0JsN2ZObFdSWnhGUmtvcWlXQ1M2bnRBTTRx?=
 =?utf-8?B?ZlJXUm51aHNQdXlRd1A1S0VwRktjeCtoQjhLWWRteWFrN1dnN3lqWWhUcmhh?=
 =?utf-8?B?L1I5Wk5Wa3kzVHlkcWJtTmkrNlpsREc1VWsxZHBmanY2bmcwbFB6a0ZNdGJN?=
 =?utf-8?B?NTMxaEJHVnU3dkRuaXVlR08rQmdTYS8rQVFESVl1WWJBUXVXa2FDTlMxMmVs?=
 =?utf-8?B?SEVXeDJiOS9NeWw2di9yTVRPTUMwWjRFMGh6NGdqYmJuQ09IT0xtRjBVcEho?=
 =?utf-8?B?K09nQ2JVZEFlSFVQMURPdkhhOU9qRzErdzF1Z1Rka2o1emhEOGNqYk9oTDIx?=
 =?utf-8?B?eHlWTUJTSll3L0pqTG00UVIzTEcvRjhlWHNuWVBqT3FSQ2V1WkU3cXBDajFq?=
 =?utf-8?Q?7PoSkQgbjxf6IF6E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d623cfd8-0c7c-42ad-b92c-08de752b4be4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:36:35.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93Bt+GC6jEv+p2yQWm6MKb4xLfaGLDAi+/s7pj212rSeQmDEsthTcznAJVMSPhIhxPf4ffWn/CvabJ9IUPHyob2k2Wvua+28NGN0d7uFsrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.wajdeczko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BD6861A52DC
X-Rspamd-Action: no action



On 2/26/2026 4:00 AM, Yujie Liu wrote:
> Warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:1261 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>  * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.

this is already fixed, see [1]

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/b47239bc30ef85e70b93e357ce76b205baac3b77


> 
> Fixes: ed46ff0d51e4 ("drm/xe/pf: Add save/restore control state stubs and connect to debugfs")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index bf48b05797de..5cb705c7ee7a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1259,7 +1259,7 @@ int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int v
>  }
>  
>  /**
> - * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> + * xe_gt_sriov_pf_control_trigger_restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   *

