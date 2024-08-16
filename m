Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306519553A3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 01:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3F310E863;
	Fri, 16 Aug 2024 23:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nADywBKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0970E10E860;
 Fri, 16 Aug 2024 23:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723849662; x=1755385662;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xhH8nQYs0KYRCrD20k9uozybr9l5wmSWc2CD4gDU/qg=;
 b=nADywBKO0gq+lII2atPiyaQo7jmgsX3VIAXNsq7BWfR/ZJb7VpYXYLTu
 DiYAYnJPP4AA0WTZIV4uW+leGU3qJwKb6L6JrRRT+6H0OUEsVQNXF/Fl2
 Y750KmFw9bnFBUXDjoMd20+TTPrQqb/Uvg7HhE91GUYrDWh5tXXjeU7QX
 oWZIq+vcIPteQviM+mOGTH9WUzCrDDSubKXl1cpQpHhqPC/ExXXI/ft9D
 rFs3nwIUDAKAYgOUuNKPKIXO0FcbWPlHLBlQFRkK5OCRvBEPKeqEcz0Cy
 5TMy+kkidlvOsh14+dQkRGViyZmDmNgYai1Il4/F8Vihs8TalDEkuGYzW g==;
X-CSE-ConnectionGUID: 2ozRjxDdQKilFfo1NYuZyw==
X-CSE-MsgGUID: I8RgyAdeSCOpvLTDtwCe+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22036028"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22036028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 16:07:42 -0700
X-CSE-ConnectionGUID: T1Sv/F9ETTiMY0S1eqPg9A==
X-CSE-MsgGUID: oJMLth0nTGq4Kuv1P801lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="64640322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 16:07:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 16:07:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 16:07:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 16:07:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 16:07:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk5Ee5ZjoNqgCpS23QRJCgS0fabJxE+jqUaI98PBfSeMCum4ElJp1A6hQscel2KrHLe5VONM70K29VbVVLIIPaub2N3n+rfLEP9H5WxdmZNLGoGGI2nNXoV7iVipz4K08+/QKrcRqwHYp7PimJY3cXkYBfhZS8Do1Jxczn+FneyE4xxsjEkCcwJmtSBpeQgxSGpFI8yXTkq93ZRY6bkPCjWdJW475h6WU+N4+h48CaNdSkIA4TgARVt+AS7zVOcYsjtEg/yiBh+ZS7P/WszNwyuHD5o9B1+pBVl5Qm2z2kZzyJhvqBk62RosTwHIBZsZ1TdyNbn2eoi60psvRqrysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxGNkXPD8KhQHE+BoQyzU38cOxhkyeXeabfqH7lEIps=;
 b=IP/DQ+X5oXVXTiJMmVlwXLSrt8KWPbObtcwRPVQI5bMRe5sHZ5cWmE0ett9qO/zS91qPwaqFql+82kN5tREC8l4XoCBr95tCkrIZaNhFkPq01Cs+4fnHuuixZp24JwkKHixUjwASfrKNTTp24Hx4tM+pr10UtMJEUKGCmdmt2cvrvsl6aL5YG/s8onGxy9F0Av9asene368iRPpJqBB/fafGdAUQBCqjqJsq5E0A5F4eSK8u5L8nI0kItqNDDk5rjGC5OvMQLUcKkKRAMuWoo/OTZ2i/hOSImyXLH5cw4wZ9lhNRfLM+APITCzRIkyCMsAPWMqy/ZCPb63fgBg5HIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 23:07:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 23:07:36 +0000
Date: Fri, 16 Aug 2024 23:06:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/6] drm/ttm: Add a shrinker helper and export the LRU
 walker for driver use
Message-ID: <Zr/beOYRvNNy6IGT@DUT025-TGLU.fm.intel.com>
References: <20240816133717.3102-1-thomas.hellstrom@linux.intel.com>
 <20240816133717.3102-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816133717.3102-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a90c488-44ac-4b02-b83e-08dcbe4837d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pGZxGuY5AfN8EoRD9h7bMs2ClJe1MP641psg1cMRvgT21YJcrN+g6/wUSr?=
 =?iso-8859-1?Q?l6/g36d2E7Lk+/hzdU7Qc4/FPgOP2u/pETo3/jE0mc0vAY7A0ZJ1/RqVMu?=
 =?iso-8859-1?Q?AzHlDFdCdZixJM3GSWSSMd79zqE5fJ2wUuk408w5BbK9vaPEcgKNZOJlW3?=
 =?iso-8859-1?Q?axNBpgb+1x+1XC1htaVMXFSreiR0seqIc5rkCijco1t9EWmEJXOB1Qh7OL?=
 =?iso-8859-1?Q?R00ch+CGKCeLpsP2yag+p1hVg8+MclpNoRJWOV0y874EFLjSPyuNhyFoqu?=
 =?iso-8859-1?Q?K0v7jrZ2E783NtPCsi39f4wIHpZgTVqjOUSMg3sqhvTIEYLDrLGPyg+tGa?=
 =?iso-8859-1?Q?PbJJfhB7XlKrU6wmRvO0kcWgen9wM+tvXFeqc9q3/Q3IIEbvujBos2zELA?=
 =?iso-8859-1?Q?fujNutfqpWHtfPqxe+18GXw4d9OL9ZZ8wFtURHGPIcXO014tPnH1uYwaH+?=
 =?iso-8859-1?Q?jO3bI7i2f2v4k6HprheRM53KVuuFYgjAWDWrbEHsg8fMxWtnenvZDAe7cA?=
 =?iso-8859-1?Q?dOoqaXW7SsKvLuikCayfMJvxoh6P6cas0Q7ZItFODXpe8GHvZB9667KJ7e?=
 =?iso-8859-1?Q?D3FsPWKYRwFHUfH6ID3F+iyCCNpT+to5MQlEaOfFbfeQ/wq9SrYbK5x7zn?=
 =?iso-8859-1?Q?0MVRcpetcc1WwszrF0pPNS6xpPCUy+HrxjqDyMRbySAuFHU8+w6/swho9J?=
 =?iso-8859-1?Q?s4e23LQ1B14rC5Cgqvehdcv8u4AZ36rHPhNFnizYMzfmoLe01hXA4Armi2?=
 =?iso-8859-1?Q?5HZGPbEkZLoNUzu9KtX0U72X1+1GpzBk3m42RFsraZ+y70g3CjaMiUkbFe?=
 =?iso-8859-1?Q?MVQQTx0NSQgFv7rUOanOe83/zrSv4IMcME0SvdgD4QVEl+uMlYT5IrMLZy?=
 =?iso-8859-1?Q?AczZOTEC8R4eiy94SCrd1IUQmqFDrvmFA5bsVvuHLI+ngqNgHnQfliuQkU?=
 =?iso-8859-1?Q?WE+to9fwGDVc8B8hK9G3qj9SU7+wUiv8kPBFWeuMSFCb7S8ZGdS4pIC8l8?=
 =?iso-8859-1?Q?O7trvsJo/Mx4sXgTPqqzXQY+B4JKtiVXkbtmYbAJOiu9SFASpt31xPQsOi?=
 =?iso-8859-1?Q?D5UBeBa6g1YEn87ZxjlctxMsxocatJkrMPGZi+wpqpRLXm/PGZ8nWhODz2?=
 =?iso-8859-1?Q?UynwlYlqei8h5v8dv9SbgYT27ZEEmSvxte799kYmD6XlpOcZWfPEhQrVP2?=
 =?iso-8859-1?Q?biPCQK9Y85V6eHVeN0aCFa3dxidv/GhOvEUvVlWD3wthb/CTWxrphwjkK/?=
 =?iso-8859-1?Q?85cIbscaI3jdFSP/QT1RXGZLs0O8Q2c1X+TVa1b3edfVP8vvlhrX4USCQ3?=
 =?iso-8859-1?Q?dQk/lTMNbNHBWhRi5+SXrjJNZsAcF13D0MHs5Y65USqZ0sc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jwlyfyWg8thNHdEbduUtummh49m/9O/TzYqijsxd1lFm0ocgTEqfaYgnTp?=
 =?iso-8859-1?Q?gSdsEIkc6HaprIP/ZeD0vDmpzIpmw1vg26h0JfEAcbMNWrCbhK+Ew5dZJn?=
 =?iso-8859-1?Q?T8kPRpKmhSMliyIgE1AfciMOp9ux2xXdCbtPQGwF+esah8Ixx3Z1Vzt7Ju?=
 =?iso-8859-1?Q?z1qEhuWbclYZC6ARZoOgsQXpXMGTbbXnEhG7RNwyayH5zan64PtqnlfRqZ?=
 =?iso-8859-1?Q?9YI2PT8PezYZTtiaMJh2dWsWXg+/QdVBhqDxS1U45wn52iUnnN6DN0hzCH?=
 =?iso-8859-1?Q?2Z2aaREP3JGPMzCyiZbm9M3w40pdGZLbgNzoJhuw1LAKdnG5y/P+twISJe?=
 =?iso-8859-1?Q?6YV3wbeXTR3BXAMcA2kkAQALNno49prL6daD/z0g2MGyIFmhtvd1zfXbAp?=
 =?iso-8859-1?Q?kBnLefElyZaCAD29Vq+YDMQF/sm1YaJeRIDOhKto+Qnj07WEJUMCWr7FPs?=
 =?iso-8859-1?Q?j/LtRfKUViOQ6QomJMaUSY9T8YTzyF1IGbBXb/MUn5RhkiOkzE7p1d7a2m?=
 =?iso-8859-1?Q?vE/k+HX79K86ahqdEFZFYdLrH8DJ5Sx5g4nF2qas7mMEMTbB+17psysQod?=
 =?iso-8859-1?Q?0JvOqa16GP/WZr12eFeIGBW3UsJ3aHKILif5HmE6pcYEWamF8T9VFiRQNH?=
 =?iso-8859-1?Q?WfGbRmojxa/4qjQlFME0I0gNlf7FXqj6VIuexrUw4XmyqIpwM28eNbLhfU?=
 =?iso-8859-1?Q?mZjXmFflp+fymZI+hpHTND5fdL4QWCxM4Yu1BaawCEKSvbykfZTQk34Oer?=
 =?iso-8859-1?Q?7S1ik49VRGtTXVEue9z8yd7J5cS6YADfhcmW/LUua+kaIemcx9XhYIx2ee?=
 =?iso-8859-1?Q?0Or/ooWXYMTNgofGDW2J9eDXsl+JEpsDCaawcD4UmpNUetLBHGHg3xNveH?=
 =?iso-8859-1?Q?Pj3L8rR+aK9B1joNqfflnjMEvPUxzwzPhWubnbgLOWsPtKVu3Wky/7qFJA?=
 =?iso-8859-1?Q?d0ty/INqYr8HsWnAiTIATH8DY4PLVEUZV+edfrqFwMP9dVMdZaoXX0h2IA?=
 =?iso-8859-1?Q?ZlNBJwYEiUIrlQj1afNt5LVtRwIMvhJztx4Y9J/h3bO1ZWk7Z8XipP6Qkv?=
 =?iso-8859-1?Q?yNy7BvRzf+EGiVMVt0cNCIkrOAnjarg0GnvVlWhQ9sLOTCexqhPv6JkiXn?=
 =?iso-8859-1?Q?asw3wAdrNqNVZb+V0958/Wd9aO51PRFezxJNy+ma3MjNfxg718xCTX46ig?=
 =?iso-8859-1?Q?cw0ldfWmLKY0joXcpPT4UPLL6CcPHQw4EcGW2OncfUIUGhrp5CnO36kdI3?=
 =?iso-8859-1?Q?NJoW+CLp5cL+QUrbUZiquJH2XL5s3qADH/AB4FE4msVV7t8EBkXmfdF5wy?=
 =?iso-8859-1?Q?ohLWMuMzRiju81V3gWF7wCAsxymwmQosCTYpuFO1wxfq60AkJ6wDxZm3A3?=
 =?iso-8859-1?Q?Dqq890fiDf0XIcqn/SIodhCI4fNGf07/rEN4Etv3Ln6QoRBwk6qorcMD+Z?=
 =?iso-8859-1?Q?GJi4mzWNOePR5zmbVwLcglFWfOgCrCuRaMS4uJPsIR5bqnqCaGWFn4ZRpE?=
 =?iso-8859-1?Q?pVGmm2DFOXq0FarVLWrukRMtw5FElvswZ78vSLu6amZO1ydiSGaBEtPgo5?=
 =?iso-8859-1?Q?qHm6GpcL0bU3hirqIko5WKVIjRoPciSUdX29fsNBhnfnQf0Loz7tTE5m6R?=
 =?iso-8859-1?Q?Pbii9gdsl9TgCRxfBMkYJVz8xHni8Gmdi+Qbuf/epqo7ugkb6axY16dQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a90c488-44ac-4b02-b83e-08dcbe4837d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 23:07:36.4607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTILLzlblDILvjJsyFe8wBTgki08TNabmxX6K1BLQKg+Fierkrb0wG3elcww9pKAGhEPiiA4TaQa7hub0xtm5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

On Fri, Aug 16, 2024 at 03:37:15PM +0200, Thomas Hellström wrote:
> Following the design direction communicated here:
> 
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> 
> Export the LRU walker for driver shrinker use and add a bo
> shrinker helper for initial use by the xe driver.
> 
> v8:
> - Split out from another patch.
> - Use a struct for bool arguments to increase readability (Matt Brost).
> - Unmap user-space cpu-mappings before shrinking pages.
> - Explain non-fatal error codes (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 65 +++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h          | 17 ++++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..3490e3347de9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -919,3 +919,68 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  	return progress;
>  }
> +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> +
> +/**
> + * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
> + * @walk: The struct xe_ttm_lru_walk that describes the walk.
> + * @bo: The buffer object.
> + * @flags: Flags governing the shrinking behaviour.
> + *
> + * The function uses the ttm_tt_back_up functionality to back up or
> + * purge a struct ttm_tt. If the bo is not in system, it's first
> + * moved there, unless @flags.allow_move is false.
> + *
> + * Return: The number of pages shrunken or purged, or
> + * negative error code on failure.
> + */
> +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
> +		       const struct ttm_bo_shrink_flags flags)
> +{
> +	static const struct ttm_place sys_placement_flags = {
> +		.fpfn = 0,
> +		.lpfn = 0,
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = 0,
> +	};
> +	static struct ttm_placement sys_placement = {
> +		.num_placement = 1,
> +		.placement = &sys_placement_flags,
> +	};
> +	struct ttm_operation_ctx *ctx = walk->ctx;
> +	struct ttm_tt *tt = bo->ttm;
> +	long lret;
> +
> +	dma_resv_assert_held(bo->base.resv);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return 0;
> +
> +	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
> +		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
> +
> +		/* Consider -ENOMEM and -ENOSPC non-fatal. */
> +		if (ret) {
> +			if (ret == -ENOMEM || ret == -ENOSPC)
> +				ret = -EBUSY;
> +			return ret;
> +		}
> +	}
> +
> +	ttm_bo_unmap_virtual(bo);
> +	lret = ttm_bo_wait_ctx(bo, ctx);
> +	if (lret < 0) {
> +		if (lret == -ERESTARTSYS)
> +			return lret;
> +		return 0;
> +	}
> +
> +	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
> +			     {.purge = flags.purge,
> +			      .writeback = flags.writeback});
> +	if (lret < 0 && lret != -EINTR)
> +		return 0;
> +
> +	return lret;
> +}
> +EXPORT_SYMBOL(ttm_bo_try_shrink);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index d1a732d56259..479ada85cea1 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -229,6 +229,23 @@ struct ttm_lru_walk {
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target);
>  
> +/**
> + * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
> + * @purge: Purge the content rather than backing it up.
> + * @writeback: Attempt to immediately write content to swap space.
> + * @allow_move: Allow moving to system before shrinking. This is typically
> + * not desired for zombie- or ghost objects (with zombie object meaning
> + * objects with a zero gem object refcount)
> + */
> +struct ttm_bo_shrink_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +	u32 allow_move : 1;
> +};
> +
> +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo,
> +		       const struct ttm_bo_shrink_flags flags);
> +
>  /**
>   * ttm_bo_get - reference a struct ttm_buffer_object
>   *
> -- 
> 2.44.0
> 
