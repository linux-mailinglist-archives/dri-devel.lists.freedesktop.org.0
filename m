Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF36B54A6B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC5010EC04;
	Fri, 12 Sep 2025 10:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKpEelCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0EF10EC03;
 Fri, 12 Sep 2025 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757674359; x=1789210359;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KVoZtSZaMphMPXtzglr3SXL8e6m2DhzBz/AVgVmVLeg=;
 b=jKpEelCYjUc7y2cyG6NHEdwWh0U6CCcP8bkhTftNZYU5pjAtcov7SU4e
 /iC/l3VkB4fL9xyABm70/yF5tCHjoRqgtRdFBln8QjOoDK5xoIOhw28+I
 a5X3zcs5yigvMTQxCa0cMlV6qwI4fThuUT4UHEEyHG4kRPKfNIJKPHmWV
 ob0hEBySXW+IiadZv/hdRVxKvAyFU2PjyX8uF7+n6zf5X2RLymAVWAzXi
 eNJDzlFRsrRm2PYjiFS13pNI+e1K0WC5HR7VyfygNm0uQLS/kxDGVPX8z
 Zul0RfmwkTVP+N9uBO/tIjga8cTX2h2RuXPu7Q1ABwYpG087ksvj+iMY5 g==;
X-CSE-ConnectionGUID: wgRl3bsQRSWdi8ubzwI6qA==
X-CSE-MsgGUID: o0b6bpnFRIuRLBS0aI/88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82605582"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82605582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:52:39 -0700
X-CSE-ConnectionGUID: tGxs42K0RZaKtVoqo2uKrQ==
X-CSE-MsgGUID: rYiUNSSJSkOzR1CgA+1ssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="177974682"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:52:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 03:52:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 03:52:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.74) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 03:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7+qtBZPhGLo3eFzM1PVsG84H1lcd/tzX/1FHsJYTaqDkfOqQnAn7qX+jIaQ9H7USLOOoCz81PK/46ja11PC1COguKyLOzKDYHA5BnGYc94iDPzjNhlbZCIzh8WqwxZwgH9xoULjW23xKDzfFiBa3nLoC6tUno2hG1iYyPsBQtjnvB87Q2bulOnHtGU9wfQFfPd9pSlJbugbSX86ynYiUoDPFL9Y7IFzntkKbwl6n1K3ZyfMk7pGOxUDeeo4zvM26lS7uWW369FOlm4pQYxwAVYnfSRetlsW4fETar82uGrCBIhQrfWNb4N9LbMvJnOwnc7e3MY1V5M5zH/+MeQZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PyhI9fgEi4DerF0DXokPAIS7qTl0tYmbj5QKcWipmk=;
 b=ngkofnDfCpS+BcOjhh8aBYsZXG7OzP7XyoU3ebjmBLrAmNx06GLI6zpDdFyxXx3NZ7QU5aWTgzqPqmuJtm8O0/1mBNiu4FJDl6gu8OpYH/OHwiZGi0vJVkKq5OUI/G5p9usittoVUvOgU4SNIoauHdvfeHVBeaH3n0yvgQGC3YtbuXtJpG0OZWKiAwqaH9PGnGadC/Pxh7MrzjhOH0j8bTjwUub2IYrW3/xyFb0fYTW/i4qWOTtgMmD5OaSWxiTrDUOAWtQ10Fun1mqsWSOE2y08p5pnMzif5ZeRNMLKbpoEiflXfck0XTjdQbLwSzWV52oEbrm8MIilE+Xs445YEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7346.namprd11.prod.outlook.com (2603:10b6:610:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 10:52:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 10:52:30 +0000
Message-ID: <f8d8e838-2577-4565-bf57-2bf670a73c98@intel.com>
Date: Fri, 12 Sep 2025 12:52:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/xe/guc: Fix spelling mistake "sheduling" ->
 "scheduling"
To: Colin Ian King <colin.i.king@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250912074330.1275279-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250912074330.1275279-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b2e67d-d67b-48f0-edbc-08ddf1ea78a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q253d3pwMWhYbUF0RDBUSm5YR0xYQUZwaHhVaWFYSjhPRURhNUNuWHdhenJk?=
 =?utf-8?B?T3BRM3ZpSDRnNk1CaDVObHpEZkMyczZaV1d3eVUvNzRnc3JoR21DL011eWtK?=
 =?utf-8?B?OFNpR0NuNllnRVljQktEK01KcTQrbVgzeFc1RWtUelQwOUxxUDF6czhuSVM4?=
 =?utf-8?B?M3RWR3B1ZldOTjUvTitNUlNaMVhIaFVuY29vU3VSS1NVa1hGVHJRbnE3MVBB?=
 =?utf-8?B?OGVHeWRGek14dE1HMExVT0tJcnYvMk5EN3kxaDUrMVpyN1RjVDdQL09JUTBa?=
 =?utf-8?B?OUQrc3R3RXlMUE80WjlaVEtPMVJqek80U1BCenpUb0txUUF3Q3RxKzAwMlVr?=
 =?utf-8?B?aTgzVVhVQ29iTzVlNEpzZUdUZWtFS2prNG9yMGsyVCtZbFZnaVQwbExiWXRu?=
 =?utf-8?B?ZzNkd1h4dmZtNUl3alM0UkxkUVYvMlFORUpJV1dVVnQ1TXNmWjNKekdVTHJh?=
 =?utf-8?B?SExjZ2Z1ejc4WC8wa0QrTWxCS25GMkhnazdRKzVpdVhzZnEvNjBFcW0wQmE2?=
 =?utf-8?B?TG1qNlN0eFp5NTJTTGd4ekova3VuYzJVVURJbnVXWDZ6cGFnRmE2eFhpQmJG?=
 =?utf-8?B?bHlNc0wxbjM4MjJTQ2lLUWtFRk1SWTA5TTRIYVd1QW9MWU56N1ZhOXgzejJh?=
 =?utf-8?B?QVF5NkdsYVhOeDd4dnpRSFRRNXBQNm14WXZ1dXlCV3c5elpDOEVDMkFBQmVI?=
 =?utf-8?B?aEx5YzdXSjdFZlcxVnNpaTVhbHV6bXM5Tm56NU1CZjZVQXJzaUFmUFlWSm1q?=
 =?utf-8?B?Sk8yZ2d0c0Y3dlVuVlYvS3NTdHp2VXUzQXQ5TUVNcU5pWEhGeDJLQnV1dGVV?=
 =?utf-8?B?cEY4dmlTa2tZNm1kWm9YM2s1T0NHamJmWDRYenNINkp4eWpLN0ZKZUVLUkM0?=
 =?utf-8?B?K0lRakRlUi8ycExzaHBrQW5EUUJmVGZsSzZLSEcxZmxWMENNWlY2THVQZ3lk?=
 =?utf-8?B?QWhsZ2kvRnNHUTljL2RUeHEramd0WTZTMzNXZ1lRbmpnVTlUcnorVVk5S0tX?=
 =?utf-8?B?TTRJOURVWXFwMVllWTc5ZlpjQXB2bDlQZWFtK0JrS3lKL3J2VzhEdDlBR2Rw?=
 =?utf-8?B?Ykg4Z0NNUGlPTmZUUkhpbjU0UDBiOXVZTWtnTG9iOUlqQndoM0lRRW5zaWsz?=
 =?utf-8?B?SnhQbUVBaUwxMFdFV0NTWWVzcjRUR3VLU3F2VWF0UUxyL3F3bXJZRmNCdTZ5?=
 =?utf-8?B?Z2NkMFRyU2xIYWRJTEpZTWlSWlJuajV6MjlTbDNiY1QrWUROTmlYRXhFQmov?=
 =?utf-8?B?bDRwc3RIcTZCK0xJM25qWXZ5Vk13Qi8ySVc1NHlVdmo5ZEVrS1c0K0pQMkx0?=
 =?utf-8?B?cWdKczBaWUhGOCtpRXp1MlpYSTVlUDdCUENmQVRPMmNIRldSN3VSUVZmaG9a?=
 =?utf-8?B?cC9FN25yUlh1TzJITFNtaWs2VDB2ekxZaStuS2FEMnIvV09rNWlCY3BObzZz?=
 =?utf-8?B?YzZyTlo1ZGluY2VZbU9rQXdmbExZcTRSbHhGODVUNDJaYzhiekx0N2g1NUFW?=
 =?utf-8?B?Q2JuRnY4MU11dTRxdGg4N2JQUGlJdUhSdUFXa1Y3SmdyWHRpZjVoV1pnQmc3?=
 =?utf-8?B?RUJ5V21BcnN2WTd2QnB4K2hKZ2QwbGxqVGUzR0YzS0dDcEpSSW5yMDZ4MVVj?=
 =?utf-8?B?cnAvVnVwV2loTlBjejZuUEl4ME5maVJibCtpTklTN1hkSUFsbDJwcUdTVVlW?=
 =?utf-8?B?VTZjYlJjRFRyZDQwZysvTlpPWnRFUElibmpiVkRBak5SYW54ZHVlUzB5RkU5?=
 =?utf-8?B?YXQ1N1ppL3RwcDhJblRWYkhaQkRST29UbnhLTzZWa0p1Q2xXZFdVdUxXUE5S?=
 =?utf-8?B?QTNCc0dQT1cyUFhURmxBZ2I0Qm5yUGNTUFpLeHBKUnNoa1VjYjZieU9MdDVO?=
 =?utf-8?B?U0NPTTRDeVc1RXBYd2U3aWY5dkZEZHRSdGMvUnN4RTY5Znc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmpDSUM2L3ViVGRlSzAzQnZwblZYbWlrelJqR29pNndrdE52RklKamRDQmhX?=
 =?utf-8?B?T1JrNW9JN2xxK29vK1EzaEZ5UnVaakZwZThhZzZ2NHFyc2RNUlpnaDloNVVR?=
 =?utf-8?B?RE5nZFdORHRQWTUyU055bnV6dlU2TFljNXFKSDBodXJUSmlwR1FGdnNVdEJm?=
 =?utf-8?B?UW5sYWVBQWt5TXpsenpHNzJ6TndYcTlMNTRGSmNPRlAyeDh5R1VKUHhYdmt1?=
 =?utf-8?B?SDlGZHRuQ3pnanlSR2RqMFRrdmFoaVRhUGNVbjNLcjFiSEZVdmRXZ25EZjhC?=
 =?utf-8?B?Vy9zUjJraEVJTzNYaXNDcjJLMXFRVFdTS3YvS01ZbkZQK05jLzJaNFhLZ1RO?=
 =?utf-8?B?d0lEaSsxa1BTV0ZUNkJMVDhqcUkzUHV5UGNaakRtS21SRVREY3JmQ0EwNSt1?=
 =?utf-8?B?NWN1VTd5UG1aN2Voa3JmaUNlU2lyL0lsQ0IxL1VaUXQ2LzVuMFNzc0lwYUE1?=
 =?utf-8?B?TEthY1Urc21xVFpvYUlHMlozQkI2M3ZCcUtVUlhxYzlBRE1kU1JET1ZYUGZl?=
 =?utf-8?B?SjJkRVJhbkVXc3NXT0lmbkVSczZCcmowTG1tVWw2Yis1YzI1ckJmZkdITWQy?=
 =?utf-8?B?ZTJVVWMrTGF6VFViQWhuYTJUcm4vcFlGdCtjZEtVbFY3cWoyZnpjYU1JS2lX?=
 =?utf-8?B?aEdLekFVYm1iOS9YTjRnK3BuWGpvSWxIWHFnT2p5N29jKytzbE1mNFdnOG1u?=
 =?utf-8?B?WFdVSzB5TXhjTUxLTDZKOXZsTXg1UENoaWp6TWM2T3NUbEhCNTNPU2hyWXNk?=
 =?utf-8?B?blRNWWJoMUg4MmFyU1pUOXFuS2p6RmQzU0JxZUZKRmlPY0xqS0lpWWJQbzg1?=
 =?utf-8?B?M0xwN1BmZHZlaHBiV2tJcW56bE9WRG1NL2xRSnpmZmF0V3hmYlorRTVHeEJq?=
 =?utf-8?B?cXR2N1h2eE4rM2JXUklyYnR6bm1rRzkwTjdIRUZOWUpsTHJjYS9RalY2KzJE?=
 =?utf-8?B?a3N4YWZ4N0ZIeUNvYzVNdWVMV0pUckVERVVxOTdQN0dzRVFHSGFWbDRkaUho?=
 =?utf-8?B?L2hWaFQ4UmIwWko1MUhCK1ZsYVlMUEovZVIzLzlHaXBBVHo2SVc3VHI1REN6?=
 =?utf-8?B?UjBweWxOa2pqVG5hMWRpZys5YlYyWi9ucUNTWGVGWUQ5NkJDbTJOOU11RXdE?=
 =?utf-8?B?cWtWME10QkJxM1hDQytlZUk2RHRsa0xrbEdmRzljZzBFeXJydlVNTTdrMTd5?=
 =?utf-8?B?QTBGQVg4bzJpY1J4MmlhU3J0c0N1aU4zczd0SkpidGZsbVFxSHZqMGhOeWNH?=
 =?utf-8?B?M2lWcVpzNDRKSHQrNTlDZ2E2SjJHTUdJemFqdUU5dGNXS2FlZGkzWVcreFRw?=
 =?utf-8?B?eHpuWDZJK21odDYvenNRMXdHQmFLTzRrekZOTDg4RHp5QXdqb2tyT3pqek8z?=
 =?utf-8?B?VDFwYytHRzRzazlPNkdncnUxMmFKQlZhUlhGK2RhbUJ2LytVTmxlVWtqUDl5?=
 =?utf-8?B?bXpGZWRoT3VCOTBuNW9rTVc4aDJDRE5oRVQzemEza2c0VXFhOEZsNmxOU3pj?=
 =?utf-8?B?VGd2VDdaT3Q5anhlVjZGTXRncmN1U0NXcUNleDdUbG85dG8yb2xjQ1NFdXd1?=
 =?utf-8?B?Tk9mdVYvUlFXakg4UjRGaGVjU2l3SkYrbmVqaVNiQnF0SzBNbHZuenhZTVhE?=
 =?utf-8?B?d2kxaEdYaEMxaGRTMXM5bzBuVnNpOXRIcmtJWjB6TzdKV25vT01zdXJvRjRX?=
 =?utf-8?B?a0pmN2piWTlSdjRRTGVDS1pKNnNKbUxkbjlRMVc5SGRQRE5ZYTJzWjczWXU4?=
 =?utf-8?B?UXhxalFTY0FGbzhtbFFvaVhLZmtvclNXOTFpR0Nta1A4RHF0bXQ4THAweXV1?=
 =?utf-8?B?Q1ZBd0lPTW0xcFVkYUlOdFdBT1Z2SGozMUZmczhQU09qelZPNXVXcjZ0NmRv?=
 =?utf-8?B?U1RsbldhcVRicUhPRjJmbklaYlduam5iUzczZjhyUis4Yi9EL0l5QWJQNncv?=
 =?utf-8?B?WjdoZit1ZEJaY1VSNkk1akVhZkxUcnRFcld0V28vYm44ZnB1UzIwR3ZTeDdL?=
 =?utf-8?B?VUozekJNdGVQU2gxTjY0Y09hejRZTE5kQUJJMmIzbUNaSnlMdTdWNVVqS1or?=
 =?utf-8?B?ZHdxUVNoTG5sQnM2d2xPYThwN1ZJNjExTHNMRU13Q0s4WWluUzlwbVlDZ1NC?=
 =?utf-8?B?SmxzLzg3VVd0MGNEWngza3pzZjd4eGxjTDZUZGg3dnVzRGJvTDFVR0IrR0di?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b2e67d-d67b-48f0-edbc-08ddf1ea78a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:52:30.8010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mWmT+OAV6YLaaXyNBryVtFDMFrFfCAPoYO75Pwmc4m4sD7TwMnuIxeVCi1iuJPIrAblL2BTfNayqKSvoYzQ+JFnBNu+HY3qnsc8wd+57l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7346
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



On 9/12/2025 9:43 AM, Colin Ian King wrote:
> There is a spelling mistake in a xe_gt_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

