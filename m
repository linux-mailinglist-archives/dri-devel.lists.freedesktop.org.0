Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418698D51F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 20:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52412B6EE;
	Thu, 30 May 2024 18:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoU+FP1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567C612B6EE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717094858; x=1748630858;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZDKe405IlBaAvXIWRBuW0VR+IVe/ugr0KtOwH0m0HyU=;
 b=IoU+FP1GuEx8ND5VDyoCqfns6JrMWN4iXLMJYx78hykb09V/ngLvmG2/
 FvHwKmKJCOj+MqFSZPb4yHg9/ct8jRGtHN4WJzGPNkrBGpjrGWWXv/epn
 brqAXTrulmbL0GH2C9s4vHnbR38qTGahkCaawfwqqGnB66BCJQY1X6eve
 svAX4WFEgsyaKl7TPqJdYCEfegwhDMv11T4Iv8ca7XEvgeZ6WX3t9Jdmg
 +qv8tW0EorzepmiZVp+HM2qcJbZYy78KahUk/jSh8sQ4WfzQpo+I4JrgD
 FFfnPfsubor42T9nn8ZILxX8rz7RXe1+0Tu0K9El7bOfgHpdqSxkT0c4T A==;
X-CSE-ConnectionGUID: bguRdrRmROWSdjyA8ML2Vg==
X-CSE-MsgGUID: /64PAlVoSMi/m0d94CRMpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13737863"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13737863"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:47:37 -0700
X-CSE-ConnectionGUID: y5w3TH7pQbyAqFUtnxor8Q==
X-CSE-MsgGUID: 07qxLvLtQdarCdc4ftE5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="67099909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 11:47:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 11:47:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 11:47:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 11:47:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 11:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bvm2jbN7ugW2qDPE9TqTNqvWgxfuqZz6SYvbZuXtS1sqmmuCOYihp8SA0y4IUpU5+7/IpkthI9jQbs3VfdMEZwhbrJy4aXRmGCFQQ41mQTq1CZX3NydklGpNgdMaLJstaCz0RmhAXwH3EiAaoURnyskxEYBl825r0OoLlHyse34dWm42sLkbBaiqpk8U7H3Lsxq3MANsA+bAqXHLY/KbxO6sSAIYJzbPiYF34ohph+T8OsFjBUgg+clXsUiQ9gScMRgQ8S97VlbXFTqaJScDgKsgnv5h6SmyV9GfE0C1rVd8WsCchblUr3bKqr4P9z+Q+yOD6TMqbKkLtSymSSJSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8wg9UTQkOGF1x9kjqDB5qbXk91chsU9G8tUVLQV8QA=;
 b=bmnAr3MZvpwSBd5/djAGyIWZICqUbS9yIgl9GOOCShVNc7wGybq7QCBdX9JmcrcED1VRLsetpf1iIhF3MWA53H7GTLr1nsUc3O2qHTZeCnDX4iNoz5aicOrlSgKBl3U7YLv8fWfPOIVy7f+Siwnttn233zGjObFj3eO3J0RZY263Bh4HJumqzzdxpAvSo/z9m7oY2OMiRekz053NyUeL4ImgLZS4ka6eZEDdhrX/+Ndui2Var2OadZcy1Eu7nKldr7H6tsUZvXpMtgBe0GbaD6IXzW+VuW+gZ8dOGqk4eEMpJN0ta1OoVh3uGbt/oMQaxrM71b3xVVHK/isDDdyUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 18:47:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 18:47:28 +0000
Message-ID: <03d83dda-9609-477e-8b63-f33e7b46f649@intel.com>
Date: Thu, 30 May 2024 11:47:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com> <877cfbivrv.fsf@intel.com>
 <496d5b58-51c8-4176-a60a-d238f6407dd2@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <496d5b58-51c8-4176-a60a-d238f6407dd2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf092d1-99b6-41d1-0e2f-08dc80d8f45d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blRGT1ZaV0g4enRJSEZHdlc2Z0ZBNjR3NHh4VERLdHlOWnhqQXJyRXV5dUt0?=
 =?utf-8?B?WFZkQVVSNWhDZjEvQ0p2OVlDUXcrK25xd3ZWQmlSTG1SY0txK05INU9QT1hZ?=
 =?utf-8?B?YktrU2VwR0kvK0hJeVRWcUwraURvOUROT2FGbTRGRE13emlYdEdCNGVLWEl3?=
 =?utf-8?B?Ri9CdWRleEZ4S213U01TT0VsL2QvUmROVE1zMitLUDN6VlRab3h1eTU4WitD?=
 =?utf-8?B?bnZBZk5oOWk1MzZCclRrZjJZWWZ6K09SNGxVcEJLd0tiV1hhQ0RmbHlDSU4w?=
 =?utf-8?B?dzVFTkhCS3pQRERzbHpiblpVRVZ5eTZxNlNVS1ZCeHBaNHFOTTVQZ25ic0FH?=
 =?utf-8?B?ejdFa283elZBbHpDZUFadXIvMzVTNlFSOTc2dnRpSElDSWY3WjI4OHJjaTFv?=
 =?utf-8?B?MU9ISlBva095ZEVEcVhYLy9FZkhtQitkZDh6cFVOZnRCZDAxa2pSYXozZ3JJ?=
 =?utf-8?B?S0J6UlgzZ09UOTBDb2JyNi9CVk40bXJCVGtLUjZucEU1Q3pkeE1RTEh2U2ls?=
 =?utf-8?B?QzBwK2FRYzRDb294UXN3WU9rWHJXcE1iOTd4RmtzNXlITTVDbDhvN0FzcWZa?=
 =?utf-8?B?T2tqR3ZvWkh2Y20wTDQyKzdoUW9pS2F4cjMyTHd3WTJ3Y2plN2xIY1BOSWZC?=
 =?utf-8?B?UGpibW44emJaaENUU085UVkrTzhUb2FTVVZ3TnFETnpCRUFnaEVaNmFlYXh0?=
 =?utf-8?B?MTljQXhaam41bjErMmdXYVNQcVdGdVc4UzdNeU00VDZHOHFpWHFuT284OVZ5?=
 =?utf-8?B?bVVJejBXdnNLMkRhWGZHMWF2QkJ0dmViY0dJMlQ4SGdWWGNnVFNaK3FBendU?=
 =?utf-8?B?dUJCaGdOR0dnaGozYzRFWG1sQkdxWXkxZXlxdElqaHEzNDNBM1R0bS9MT3JM?=
 =?utf-8?B?bTQ5dlNSV2tOWnUzWFpRSmRGTVVrMk1LeDZQVU9MUE9lOWpqa0FnMmw1UGxx?=
 =?utf-8?B?YW4xUmVBVjNJc0VOWk5rbStoY3gwalFnVC80OW1UYnJQTkpRaEtHckY1b0xO?=
 =?utf-8?B?ZmVDRVpTTW5GQjhHYTM3ZjA0MllvYUtBNC9GK2dScm5rT1pKNmxNTHNMU0Fi?=
 =?utf-8?B?ZFExWWJidHF5cEovSzk0MVJHOGQySFBaWFhuSzROVGlUcnpCTTVhU1doOUJF?=
 =?utf-8?B?ZTV0YkpydFZnY05wTmdMaDI4Z3gxRVhSN3dZYWtObzRqL3B2dUtTSmcrTGtL?=
 =?utf-8?B?T05NaEFiQUVEWG9sdVpnNlQ0NG9WNUtuK3hUT3drZUZQL2loU292YnZiV3dp?=
 =?utf-8?B?dW1XMURLeTFGdEFYUGZWZENjcTNYclg4UGxWZFFBRDdsWlFHTVRVS0QwNU9L?=
 =?utf-8?B?c3YrK0l5QnQxbEZBNkRDQ0RZQ3lmSmtJMElveWFUblVBUnc1djhmUThjcy9n?=
 =?utf-8?B?cE44c2NvTkpMNGFzMiszdkNnUTBNd04vL3NUL3d0cTZGTTFVUmRyVnZKdjMz?=
 =?utf-8?B?R1hZSkdqU2ZMdVM2ZWlnZ3J6UWp4cGtaQytpeGtvWWxrRDBiTnlTcDBHRlB0?=
 =?utf-8?B?YmlXOEpTT2hRUVNQSVBmVVNQYlJ4c093MThQakFHd2E5Y1lzWWF0VXJvTGFx?=
 =?utf-8?B?K3ljcHdLZ1ZmbTc0K2lVNkJseXFEeDd2cFU5MVluenhGelFYRFBNVEVXbHJ3?=
 =?utf-8?Q?1oLTXbOit4nn4ahxEMRBhOzC4WJ4SXIX9PZTCeWEFgjU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTVFeXU2c2xBRmpyK21oYzRDRGpwbFNmMjcyRzdRZndCUjBIUml0RkVVQlVI?=
 =?utf-8?B?MXo4NkJxZmxLd3VFQkRjWlpvTjdIR0F5RERaUnZNNGZ3WE4zR2k4SUpoeW5T?=
 =?utf-8?B?UTV0NlA5SGdQa2ZzQzE2cytqZHllVXdmRFhjMERWeXl5QnAzTmhVYkpxU2li?=
 =?utf-8?B?UkFtNGpuVExoZzMwcnJmYmF3a0ZTdHMxZUlIZzh5dkZNWGRXUEIycitDODNE?=
 =?utf-8?B?VjVxUlRnRkpOMmY2N2g5ajl4WUxLWEVybWREb3R6aDFGR3paQTNZKzZwNE9R?=
 =?utf-8?B?Q082Q2pnc0NrNkhiejROcGZJd0xpc3dlN1YwWW9KcmV2TWdDdjZCZzZwMHFZ?=
 =?utf-8?B?N09FeTFBU1ByQ2JSbXRHMTZKTC96UkxHOGJ1WUdRSGEyWlNrVVhCeHhlV1JY?=
 =?utf-8?B?WnFnNmlxc01JUXZETmJyWG0zK2RwZXZmYnAybG5EdkNDVmVCcTlmeDE4dnJ4?=
 =?utf-8?B?cHp2QUdTYlFzRDVPYzNKc0lpZlNCOWtGVGhHN0xXOEkxUnVZWHBFOENEZDdL?=
 =?utf-8?B?V1dsM1JyZW5HVkRpTi9tSFNpTm1CZkwzUHZ5bDBGV2UvRDFnb1JxNGpKaHV4?=
 =?utf-8?B?eHZVMzJadEEvMEdEVnR0SjRPdVlxdEFYSmtOUHV2WURPalplV0JNbmhqSDFH?=
 =?utf-8?B?Wm9haUhyaDRkY1QvaGI5RXAxRTFFRlA2NXpYY3EvRHR2VDRTS3MrVHdjaXA2?=
 =?utf-8?B?OXlZWHovSy9aWVA2TnhaTVkxbzF3ejd1ektVc3NXS2JKNGFKV0kwbWJ0RjE0?=
 =?utf-8?B?Qjg1eHBBQ0NzQ05CcXlQZTgxbnl6YjdUQXdlQnV6NHU3OEtoY3N4K3NEM3Ro?=
 =?utf-8?B?MzJzTGhlWW1zTkxGclZNWldCQy9TWUZLUDV0UExXd3pZTWh4QzVwdzM5ZHZz?=
 =?utf-8?B?VFZOSkJ4RFpGcHErUGFBN0FoRkpSS0tsckpad1U5Zy8rZy92MGdNZVZTQ1JD?=
 =?utf-8?B?bXRDdTc5ZmpBd3NxMVNNa3ZVK2k1SmowdzVVZG1yZWFVTUNOaGF4bkV2emsr?=
 =?utf-8?B?QnJ0L3dJdzRTbi9nWnBQYTVCQnVsQjU5cUVHVzliTGtxaW5UQWwweGpxWVg2?=
 =?utf-8?B?bUpTeW4xdVpoRk55QjZvdzNXcXlHb1BqUkY5dmFNRlpkMFN6aU1DTFB2NXhR?=
 =?utf-8?B?WVV5aXo1OVZtdjRPK3VkbXJPeGUyWWVCbzNydG1lZWN6eWFBNXRmVG82WWx1?=
 =?utf-8?B?SExPTlpOa1FRZkRyVFQrU0dRQXVYOEVzN3BVZ2FHU3I1dmc5L0gzbWV5cVNX?=
 =?utf-8?B?QUdhbE9IRmMrVlZSY2tXUURiYmkxNnR3eDg3L1FqZWZGWURBdTg1bmpWc2N4?=
 =?utf-8?B?aFVYbXM4a2FZZGIrNVYxYUt0azZjTnNsRktXSk4zUDFEMGlNVVZGaU1QVXRn?=
 =?utf-8?B?T1hwaFZndWtUNCtaNzJnZ0hDT3BmeSswTTYvMndsVUlNQks5RjBkcGlreWU5?=
 =?utf-8?B?QnNLeFhGL25tK0xjSHpGM2lVMUtMT0orV2dWTGhQb1FqOVJuayt1WVNuK3J5?=
 =?utf-8?B?R3pPVlF6QWVkSHh4ZmtDclNjMXFBZWhxZndVeDZTa0ZYeGFnL2VSck1GZDl5?=
 =?utf-8?B?TkVqQTAvL0l3bHBVc3dHbEpCM0NwZUxwVnZVSzkvTk9qWlE1V1dZUDRQbGtq?=
 =?utf-8?B?RDZBMitET2FzdEN3aG1rRUhaM2x6VElXSkw0alBvNXEwSWN6UFFlWEgyV1dW?=
 =?utf-8?B?MkYyRGxwQUVUOHNnZEhiWUZBY01sVDBDTHNGRmo0MU1YVEVJZ1NZUFlyRkhI?=
 =?utf-8?B?TmNlMUttWFk5WEhpQXBZYlBOY2d5MXRYTEhBWTVReDZTU1NBdy90V2liVE5G?=
 =?utf-8?B?R1VJVDRUdERYemZwaS9mUmdMWklaWVZVOXplckZxdmpGTkpkd3FvMk91YVFl?=
 =?utf-8?B?anVYc0hXWU5Yc2tJYW96SmpLSVlONUlQREZtRFpWNS9DVGJrTGNhV3BmVVNO?=
 =?utf-8?B?WW5rZ1M1S3pBZFpzeS9ydjBNWVUwc3FtcXJmTlpLazQ0NXBlK0Fwa1BRcERn?=
 =?utf-8?B?M2lRdXlQMFN5bXJNMnNMaElGTmdNUjBBdzBDM3R3OEhLK2g4a040TjhzaXF2?=
 =?utf-8?B?M0xWcCtqc1R6ZzNjMGpUaVFsUXB4VG5aTGxRazdIa2pJWDh3MzlxSU9NeFhu?=
 =?utf-8?B?bEtydTNBckpTdGtIeG5BTDNhWWlJWUttU3FFaHdXWG04MzVoa3ZXYmNWS0Fy?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf092d1-99b6-41d1-0e2f-08dc80d8f45d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 18:47:28.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bf9shL3TJlHzoV29YLR0lWXURtUnsT81xh8caLNIcmZGsFnWgPMXD+bhhB9UhxlbZHd6M6oxVQAf9Es9jljQL24CfehN8GiypDVa3ZkW/BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On 5/30/2024 02:33, Michal Wajdeczko wrote:
> On 30.05.2024 09:49, Jani Nikula wrote:
>> On Wed, 29 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
>>> On 5/28/2024 06:06, Michal Wajdeczko wrote:
>>>> This drm printer wrapper can be used to increase the robustness of
>>>> the captured output generated by any other drm_printer to make sure
>>>> we didn't lost any intermediate lines of the output by adding line
>>>> numbers to each output line. Helpful for capturing some crash data.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> v2: don't abuse prefix, use union instead (Jani)
>>>>       don't use 'dp' as name, prefer 'p' (Jani)
>>>>       add support for unique series identifier (John)
>>>> ---
>>>>    drivers/gpu/drm/drm_print.c | 14 ++++++++
>>>>    include/drm/drm_print.h     | 68 ++++++++++++++++++++++++++++++++++++-
>>>>    2 files changed, 81 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
>>>> index cf2efb44722c..be9cbebff5b3 100644
>>>> --- a/drivers/gpu/drm/drm_print.c
>>>> +++ b/drivers/gpu/drm/drm_print.c
>>>> @@ -214,6 +214,20 @@ void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>>>>    }
>>>>    EXPORT_SYMBOL(__drm_printfn_err);
>>>>    
>>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf)
>>>> +{
>>>> +	unsigned int counter = ++p->line.counter;
>>> Wrong units, but see below anyway...
> it really doesn't matter as it is temporary var used in printf()
> actual 'short' counter will wrap on its own unit boundary
It should still match. Otherwise the code is ambiguous. Was it meant to 
be an int? Was it meant to be a short? Just because code compiles 
doesn't mean it is good.

>
>>>> +	const char *prefix = p->prefix ?: "";
>>>> +	const char *pad = p->prefix ? " " : "";
>>>> +
>>>> +	if (p->line.series)
>>>> +		drm_printf(p->arg, "%s%s%u.%u: %pV",
>>>> +			   prefix, pad, p->line.series, counter, vaf);
>>>> +	else
>>>> +		drm_printf(p->arg, "%s%s%u: %pV", prefix, pad, counter, vaf);
>>>> +}
>>>> +EXPORT_SYMBOL(__drm_printfn_line);
>>>> +
>>>>    /**
>>>>     * drm_puts - print a const string to a &drm_printer stream
>>>>     * @p: the &drm printer
>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>> index 089950ad8681..f4d9b98d7909 100644
>>>> --- a/include/drm/drm_print.h
>>>> +++ b/include/drm/drm_print.h
>>>> @@ -176,7 +176,13 @@ struct drm_printer {
>>>>    	void (*puts)(struct drm_printer *p, const char *str);
>>>>    	void *arg;
>>>>    	const char *prefix;
>>>> -	enum drm_debug_category category;
>>>> +	union {
>>>> +		enum drm_debug_category category;
>>>> +		struct {
>>>> +			unsigned short series;
>>>> +			unsigned short counter;
>>> Any particular reason for using 'short' rather than 'int'? Short is only
> didn't want to increase the size of the struct drm_printer and with
> little luck sizeof two shorts will be less/equal sizeof enum
Depending on the compiler, the architecture and what values have been 
defined within it, an enum is possibly (likely?) to be a char.


>
>>> 16bits right? That might seem huge but a GuC log buffer with 16MB debug
>>> log (and minimum sizes for the other sections) when dumped via the
>>> original debugfs hexdump mechanism is 1,245,444 lines. That line count
> if your capture relies on collecting all 1,245,444 lines then likely you
> have other problem that needs solving than line counter overflow
Have you ever used a full 16MB GuC log? And read it out via debugfs? 
Then that was 1.2 million lines of text that you read out. Did you have 
other problems that meant reading that file was a waste of your time? Or 
did it allow you to debug the issue you were working on?

The purpose of this patch is to 'improve' the fully working version that 
was already posted. Causing unwanted wraps in the line count is not an 
improvement. It is very definitely a bug. And now your argument is that 
we shouldn't be doing this in the first place? That's a given! Dumping 
huge streams of data to dmesg is a total hack. We absolutely should not 
be doing it. But we have no choice because there is no other way 
(without adding even bigger and more complicated mechanisms involving 
external debug modules or something).

>
>>> goes down a lot when you start using longer lines for the dump, but it
>>> is still in the tens of thousands of lines.  So limiting to 16 bits is
>>> an overflow just waiting to happen.
> but even in case of an overflow it should be relatively easy to teach
> any parser to deal with line .0 as indicator to restart any tracker
Wasn't your earlier argument that trivially parsing out the line count 
prefix from a debugfs file was far too much effort and cannot possibly 
be done by a developer. Now you are saying that coping with a broken 
count is "easy to teach a parser". The one single purpose of this entire 
change is to guarantee a valid dump can be extracted from a log. 
Anything that potentially prevents that from working is a fundamental 
failure.

>
> and it is highly unlikely that any captured logs will miss exactly
> 65,536 contiguous lines, but even then it should be noticeable gap
Or we could just use an integer count that is not going to wrap and be 
ambiguous.


>
>>>> +		} line;
>>>> +	};
>>>>    };
>>>>    
>>>>    void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
>>>> @@ -186,6 +192,7 @@ void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>>>>    void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
>>>>    void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
>>>>    void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
>>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format *vaf);
>>>>    
>>>>    __printf(2, 3)
>>>>    void drm_printf(struct drm_printer *p, const char *f, ...);
>>>> @@ -357,6 +364,65 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
>>>>    	return p;
>>>>    }
>>>>    
>>>> +/**
>>>> + * drm_line_printer - construct a &drm_printer that prefixes outputs with line numbers
>>>> + * @p: the &struct drm_printer which actually generates the output
>>>> + * @prefix: optional output prefix, or NULL for no prefix
>>>> + * @series: optional unique series identifier, or 0 to omit identifier in the output
>>>> + *
>>>> + * This printer can be used to increase the robustness of the captured output
>>>> + * to make sure we didn't lost any intermediate lines of the output. Helpful
>>>> + * while capturing some crash data.
>>>> + *
>>>> + * Example 1::
>>>> + *
>>>> + *	void crash_dump(struct drm_device *drm)
>>>> + *	{
>>>> + *		static unsigned short id;
>>>> + *		struct drm_printer p = drm_err_printer(drm, "crash");
>>>> + *		struct drm_printer lp = drm_line_printer(&p, "dump", ++id);
>>> Is there any benefit or other reason to split the prefix across two
>>> separate printers? It seems like a source of confusion. As in, the code
> it's not any kind of the required 'split', as both printers used here
> can treat prefix as optional if NULL, but rather a way to show how to
> pass two potentially separated prefixes, as one of them could be already
> prepared (like engine name or any other alias) or if the primary printer
> does not accept any prefix at all (and this a limitation of our existing
> custom GT oriented printers [1] [2])
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/xe_gt_printk.h#L66
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/xe_gt_printk.h#L81
As per earlier comments, my point is not that you should change the 
patch to remove one of the prefixes from the code. My point is that the 
documentation is confusing. You are explicitly splitting a single phrase 
"crash dump" across two separate printer objects with no explanation as 
to why. And as you just pointed out, there are many use cases where 
there would not be the option to split it. So it would be much, much 
clearer to pass NULL to your drm_err_printer example and have a single 
line comment saying that multiple prefixes could be used if allowed by 
the printer objects and if useful in the situation. Rather than having a 
bizarrely split string with no explanation as to why it has been split.

>
>>> will allow a double prefix, there is not much you can do about that
>>> because losing the prefix from drm_line_printer would mean no prefix at
> but why would we loose the prefix from the primary printer ?
I don't know what you mean by the primary printer? As above, I was 
simply trying to say that I am not requesting a code change but just a 
clarification of the documentation.

>
>>> all when not using drm_err_printer underneath. But why explicitly split
>>> the message across both printers in the usage example? This is saying
>>> that this is the recommended way to use the interface, but with no
>>> explanation of why the split is required or how the split should be done.
> the drm_line_printer is flexible and can be used in many configurations,
> above is just one of the potential uses that shows full output
>
>> You could have a printer, and then add two separate line counted blocks.
>>
>> 	struct drm_printer p = drm_err_printer(drm, "parent");
>> 	struct drm_printer lp1 = drm_line_printer(&p, "child 1", 0);
>>
>> 	...
>>
>> 	struct drm_printer lp2 = drm_line_printer(&p, "child 2", 0);
>>
>> 	...
>>
>> p could be defined elsewhere and passed into separate functions which
>> each have the line printing. The two prefixes can be useful.
> didn't considered that, but as stated above, drm_line_printer is
> flexible and can be used in many different ways, like this new one
And you really do not need to list them all out as massively verbose 
examples with confusing differences between them that are not explained. 
A single example plus a couple of lines of description would be much 
clearer.

>
>>> Also, there is really no specific connection to crashes. The purpose of
>>> this is for allowing the dumping of multi-line blocks of data. One use
>>> is for debugging crashes. But there are many debug operations that
>>> require the same dump and do not involve a crash. And this support is
>>> certainly not intended to be used on general end-user GPU hangs. For
>>> those, everything should be part of the devcoredump core file that is
>>> produced and accessible via sysfs. We absolutely should not be dumping
>>> huge data blocks in customer release drivers except in very extreme
>>> circumstances.
> if you are trying to convince me that we don't need any custom
> drm_printer that would take care of tracking and printing line numbers
> in kind of more robust way and instead we should be doing such line
> prints in a error prone way on it's own as you did in [3], then sorry,
> I'm not convinced, unless you just feel that it shouldn't be part of the
> drm yet, but then decision is drm maintainer hands (and also in the Xe
> maintainers who don't want to fall into i915-ish private solutions trap)
>
> [3] https://patchwork.freedesktop.org/patch/594021/?series=133349&rev=2
No. I am saying that your example use case seems to be implying a much 
greater usage for this mechanism than should be expected. I'm saying 
that it should never occur in an end user system because dumping 
megabytes of data to dmesg is a bad user experience. It absolutely 
should never be a standard part of handling a GPU hang type 'crash'. The 
primary purpose is for internal debug by developers only. If a use case 
gets shipped upstream then it should be an extremely hard to hit corner 
case for which we are desperate to get any useful debug logs by any 
means necessary.

As for error prone, I am not seeing how the original trivial (and 
working) code is error prone but this complex abstraction of it is less 
so. Especially given the integer truncation problem. I mean seriously, 
how 'error prone' can it be to add a "%d, line++" to a print?! And how 
much of a 'private solutions trap' is it to add such a trivial prefix to 
a couple of prints in a single function that is really a big ugly hack 
for getting logs out in a really dodgy manner anyway?

As you say, it is up to the DRM maintainers as to whether they want this 
support in the generic DRM layers. If it lands and it is functional 
(i.e. does not break its sole reason for being by truncating counts 
partway through a dump) then sure, I'll use it. I just don't see that it 
is even remotely worth the effort given that it is single use only and 
given how trivial the local version is.

John.

>
>> A devcoredump implementation could use a drm_printer too?
>>
>> Is this only about bikeshedding the example? I'm not sure I get the
>> point here.
>>
>>>> + *
>>>> + *		drm_printf(&lp, "foo");
>>>> + *		drm_printf(&lp, "bar");
>>>> + *	}
>>>> + *
>>>> + * Above code will print into the dmesg something like::
>>>> + *
>>>> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.1: foo
>>>> + *	[ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.2: bar
>>>> + *
>>>> + * Example 2::
>>>> + *
>>>> + *	void line_dump(struct device *dev)
>>>> + *	{
>>>> + *		struct drm_printer p = drm_info_printer(dev);
>>>> + *		struct drm_printer lp = drm_line_printer(&p, NULL, 0);
>>>> + *
>>>> + *		drm_printf(&lp, "foo");
>>>> + *		drm_printf(&lp, "bar");
>>>> + *	}
>>>> + *
>>>> + * Above code will print::
>>>> + *
>>>> + *	[ ] 0000:00:00.0: [drm] 1: foo
>>>> + *	[ ] 0000:00:00.0: [drm] 2: bar
>>> Not really seeing the point of having two examples listed. The first
>>> includes all the optional extras, the second is just repeating with no
>>> new information.
>> You see how the "series" param behaves?
> exactly
>
>> BR,
>> Jani.
>>
>>> John.
>>>
>>>> + *
>>>> + * RETURNS:
>>>> + * The &drm_printer object
>>>> + */
>>>> +static inline struct drm_printer drm_line_printer(struct drm_printer *p,
>>>> +						  const char *prefix,
>>>> +						  unsigned short series)
>>>> +{
>>>> +	struct drm_printer lp = {
>>>> +		.printfn = __drm_printfn_line,
>>>> +		.arg = p,
>>>> +		.prefix = prefix,
>>>> +		.line = { .series = series, },
>>>> +	};
>>>> +	return lp;
>>>> +}
>>>> +
>>>>    /*
>>>>     * struct device based logging
>>>>     *

