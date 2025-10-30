Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B876C22480
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A3010EA94;
	Thu, 30 Oct 2025 20:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQJaQmK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EAF10EA7E;
 Thu, 30 Oct 2025 20:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856432; x=1793392432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cRTpLDZ1eVS4zp52aU6AfETpHhMBbg5zvTDZkvqkxHY=;
 b=iQJaQmK5lbvdWOQ0moyJBA0IgaJ6wbhKqQ30XW9RT7TRTKtGlPKLsW1F
 IHIEUcJvtIzHkSpQIPHiDI9lH9QYnrfCwphrwLNfNDAGSzMiefXvhDmwN
 Bcx8jERitDx06Kr2ZsxXBkXUsJ6sbwu8/NlLrKAXRp3iCdRuN657IBG+1
 8Xxg72E/UnI4R8ZTTXaPPm0x1rEMm8R0fgmsXEGx34PrhFmuHsj17LPhG
 FPahtI1arDypaIB4G9soE3n7R2hZBDo2i3mpeTNoQVpu0MXZ8TlPm/W4/
 FyEQHbX1mAU+s33jelyiTSP62aCVj5H6HB39A8e6L3ED5AT3SKo3PXVXU g==;
X-CSE-ConnectionGUID: gv+Wt4kmQC2P25NnR4goTg==
X-CSE-MsgGUID: YW+TUInETwy2gxTGyW84kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64162014"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64162014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:52 -0700
X-CSE-ConnectionGUID: 9MMuy90kRDGQr2x5XV5m1A==
X-CSE-MsgGUID: 0QHEBSZiSsC9hWrhCXHHTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="223284492"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:33:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:33:51 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQyymxzOiD97iN56A8IbIfPqEXx0aLBTet7wJHNweyNZCfa9Bxmf1/sEDOd9uol9qAzpzTHL9LPfl0mS8XyeLaNlKWOR2LIKYJFRQc5LAntXo1fMC2ViP9wfyT+LC2LcKjYdssPX3jhV4LUCfR3sKP2j4H2vru9ciYZNCNR6idtprByBlti5qrUnzaKy+hp7hNaiLfSXCnAGiWoHUhCj9oWFLf64XzkA88XWUqbW7SumaseBvP6Ebl9XucKwRCB0Q/Iy+A07Acs9bt4lDkeDElFMXsY2ojH6bBz1uhsfQG3wKrg2kZeLpYdi4r+Kln5YBWd35IRGyGrFYtbgxZl65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdwjkZxdyWSsYJ0eIFMPMthEffuog9/jcSviTtFT+5Y=;
 b=V+NhDpcO4KjRmR9fgS+3/igto9zxdyHNaYuwq1pcMbgYKUr7uU3RF0Yq67yta9iI2PLHa43tlE2+CTf5882QppGhxomgqU5c2zS47ush6+uvj8xx1ozxiRwN3YHa1me1vLuCVKzO+Ufpz1U30/+KGsaHRyh2CRYuLGNn+mcAWYQKYKylYrZpdCZtaNxOkvSP5cJi0LB2rqgGi49teFbQtlqKcBq/53utKETVQSu5lpvZSkwi9sPkv7FroXqNvhEFxq90lRrSONTK//2AUu2bSITWEpiyLVMng8Od66ajFnSK0cfbMqGw1SdRMpVkNLcTbDZU2UhoxDDOIE1If3p5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 20:33:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 20:33:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 23/28] drm/xe/pf: Add wait helper for VF FLR
Date: Thu, 30 Oct 2025 21:31:30 +0100
Message-ID: <20251030203135.337696-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030203135.337696-1-michal.winiarski@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0299.eurprd07.prod.outlook.com
 (2603:10a6:800:130::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d1fc58-d814-4326-dd8c-08de17f3a1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STZQRlJJeWRGV2tOMi92VkNjVFNxRnFYZmcrVkJ3Z09tbTFIVTZBQzFqU2Jp?=
 =?utf-8?B?M0dzT0Z3TklmbmFRTkM2S0Fybk5PeDljL2QvTG5ONU9iN0JpQy9iQUZIdTZT?=
 =?utf-8?B?N2ZDQXZkdUd3b2YyeWJQU09mNHF4bmRHUDJJZG1OSFRaNDdUQjJtRnBtNk4y?=
 =?utf-8?B?SHRObDAxRUFHWFB1M3VmbnJRaGh2QkRrSTNneHltU2xSY093dFlRMyswOXZD?=
 =?utf-8?B?T2N1QnJjUExMdGR0WG9SblVOdzVwVXl5TCtEaXlqeTNjZ0puVGpCWDI3K1p4?=
 =?utf-8?B?U0N4OG9EY2lTTDFGMEdXSWNWVC9Zd0lIenNKMkZRU1hUK1ZJSXg4SWxkeHBh?=
 =?utf-8?B?VnRVWHhCbFRraGtyRHlXdTdxZGpwaTZ1amRnQm1MelIwMXZrekEyMmpkYlcv?=
 =?utf-8?B?YnhoT2V0ZXpPWWtIME56cGVVNlEvdXlTYUJZMUg5Nm0ydGt5TXNCd2pHZ3R5?=
 =?utf-8?B?ZnZzU3VWZDI4NjM5SU9MZStJT0paR3l0NTJSdUVjMk9SNzFKSDdkbGJEZmxv?=
 =?utf-8?B?eHFnSytaRTkrMTlRRE9mVFQybjJsTnRXZmwxM1BKanNFTi9QRkwrRjNxa25Y?=
 =?utf-8?B?WEcyTFF3NkpmQlRXQVhUSXNBbkxZcWFMcGYwUkRGdXEyUXZoSVJObWFBSytj?=
 =?utf-8?B?RXlvb0VEQVlWTFFWS2pmVEdQQkxveXZwV2RLR1R3NWxxMGUxMVpSc0V3NDdZ?=
 =?utf-8?B?T0llN0MvQ1FFN05XQVVYVTd0QW9UNzR6cUdLWnZsN2VsTkJpYmtKNEZQd3pP?=
 =?utf-8?B?RjBSa0VUaFZ4MXVuNExwTXVlK2NUb1pZOE1ZZWF5c1ZGclZzS0Z5Z1FBTm0y?=
 =?utf-8?B?VEV1aElraDlabmdLbzh5SndBUTVRcFA4cFhNbEZDWUc4YkY2Rmk3WnplcUpW?=
 =?utf-8?B?Rms5RHllN0RlaXVKQzBQZ3p4MG1waXAzK1pzZGlqN1B0M0tmTjhJVnAyazVQ?=
 =?utf-8?B?QWF0TXl1T3UvamtDcWpMRTJjWE9Cd3pYRlNlc0RKcVh3SlIzVVk1MFJUbW5R?=
 =?utf-8?B?VkI0S0RTS2hDL3RrZjdrVTZVNzBFQlBKZC93NFBoTjI1ZElpb1ljSSs5MGFl?=
 =?utf-8?B?MDZwdThiVW9oQnBXd0RWSG1ieDRReGIyUDREbUF3K3R1VFpWY0srU3hJcG9l?=
 =?utf-8?B?U0N6TkRwRjhyZFkvdzVXRVpWV2tBazNMV3Z2em5VQkdJRzNDSC9xZ2Q5Q1pH?=
 =?utf-8?B?VXhxUlVmVnZrZXBiaEZUbGpRRDU4ZEtmaEJIVE9CV2EzcHlJd21KVE9yVnpH?=
 =?utf-8?B?M1VmK3dpZ2VNcVpSQnNpdjNJb1hWeFFjL1Jod1hPUkdzT2JJWGNaZHg5cmdl?=
 =?utf-8?B?Z1EvaklHcEhHd2wzdEtvdFBCQkFHZSsxYmdZQS9icTBkVjZKazZCQzVCWVJ6?=
 =?utf-8?B?bWliYm5PVHBpT01PdkZBRnRVRzgxQUxNZFhMck16RTNlcEwyZUdYTlhUS094?=
 =?utf-8?B?NnBvaE5XTVVPY0tyUHF3RFU3SFE4WmlZYjQwV0g1Y292NlljdjBTVWt6WG52?=
 =?utf-8?B?SWpMRXljdnQ2UlBack9uVEFBSzJkSVdleS9pOTQySGxoeUxBc1k0K09rZVNF?=
 =?utf-8?B?U3l0OEQ3ek9UQXVuUEYvWkpNTW1KZzhLV2N5QlVnUlIyRUVaWE1PZFVrR2V5?=
 =?utf-8?B?aWxTNitrbUFLWW9BR1RkS1NKbUx1R21qcmp1Y3MxWXorYVoreEs4ZHVZWm1l?=
 =?utf-8?B?bHkxMndrZEZJcjZFTUFTNXd4bXRuSVNLWVh1eXJWNkdMUkhyeEFlWG04T2xk?=
 =?utf-8?B?MzE1VGsxc3dpVnkvenlJTjQ4U21yYnZDM01BN3lZMTJnRjdUUVJVZmJmUjFS?=
 =?utf-8?B?ZVRTbERQTlJ1U3BlckthaHNDOG92dHIzbTNBN2djVzNtU3dlTkZTdjFzUElk?=
 =?utf-8?B?Vnk5NDkzZWFCcXBLLzVsMlVqWmY0c3JoTTF5ckNtM29lR3Rkb284Mkxqempr?=
 =?utf-8?B?dk1QdERTSUxtV0hZS2MxaFk2eEZDNEFQWlFKUkNoWGlUcDFHOWRiZmdFSTFV?=
 =?utf-8?Q?B9b6YOMJi9bmcGv+Cbo+W3LSoUAT7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pJeE5xQm1BQklrc2RvaEd4eG5wYnRZa29PRDJNSUs3UDY5SG5ycFlsaEU3?=
 =?utf-8?B?L3oyd2RLSTFBL08vYUMwOXJLWWRyZjdnU0xEbTR1dHAwWW5WTTZjRWhUOWpC?=
 =?utf-8?B?OGF5bGV0Ymp5Q09valBJekQvbkFic0U4UkVoNnNKV2ROeUVJQW1HTUw0T2hS?=
 =?utf-8?B?YkdaOXA1UVRPSHZTeEtPa2lvc3gxMlF2TExnUlZ0TmRuUmFIQ0wxdlJhbTVM?=
 =?utf-8?B?RXZraGx1U1NPRFpNTlpqMTdBZWx0aGszb3l2WklNMDBDV1pEWEN4OGxZTkhm?=
 =?utf-8?B?aDZveXZ6dUhuWUFaSlVyMmxlTlZrdnRVeG5kWXN0VXpQUEpPeWR0NDRGYkxn?=
 =?utf-8?B?alNiL2wxR2QrYnFyYk5lNTBkNDJMMitYVEtTQU5kTXdDeTYvN1phaU1pd09M?=
 =?utf-8?B?ME94VnhPODZHQVBrUytOcU9jdmpjUHB1TTIwK09iTlBhT21FOWFCbEtWcXpj?=
 =?utf-8?B?clovVlJNcGRwY2YxV3JMbWU4WE5aNlgwOUkvTHRYR0tFSll4eDA1OERCMkVv?=
 =?utf-8?B?V3NGQ0M4bng5T09IU2JVeDlUNm5rZFI1dTZVOFJDZmFZRnVVYWdmN0M4UGFv?=
 =?utf-8?B?ditySTJIeDFxWkdSNXlUYW1lYmtTTDRIY2JqWVJGcThmR3dGcDNYcXh2dCtl?=
 =?utf-8?B?OUtZTUNqQ0hKZXhGdVNCejA4QmF3aFVOV00xNWJjYyt1aVprcmdtVnEwNzhz?=
 =?utf-8?B?ZjBleUdEUEplcVdHU3dtdnVjQnNmSlJvR1Nqd1diNDg0WDV2TXdKZXZ4TmZ1?=
 =?utf-8?B?OFV4WTVwaWNnUEJkUHJTaDlKNGppWjh4M0VZdDVYSXQ4dlViVGN5ZzNOSVJ1?=
 =?utf-8?B?NWI4dWpOZm1KK0gvUFhPRk9EN1lvQU9kdUdpVnd6aUh0SDZMWWVrWDdVeVFS?=
 =?utf-8?B?NmNVRTV5N1dxdjU2b0NmTndYbVR6SmZ1Zi8xQTZxKzJjSU9hN3pjd0xSSlVr?=
 =?utf-8?B?TUo5RHpUL3JJc3lyVzdMeVgxOGcvQjMzV3lFKzIyMkEwb2ViZERvQVpoRTA1?=
 =?utf-8?B?LzRNQWs4TXE5Vk5LVzZSeTRRZjI0ZGFaSW1UV0RnSGtESWtBNkphWXkrZmVx?=
 =?utf-8?B?WktjRHBCcDdNN1RhQzJTVFBUdW9QRG55U0pDZVpUN1B1RXM5ay9IN1pJVURw?=
 =?utf-8?B?K2JKT0prYzVzRlZLelZBWG92b3RFVGVJeXFYdWE4ZVlCajFlL2VRZ2p3bHRu?=
 =?utf-8?B?ZXM5VEwwcDI0L3NlTUFxbWdiOUtuT1FBdHRvRTVsMFNUaEFCUCtabG8yeXp0?=
 =?utf-8?B?eGZuT1loS3c0UU4vVGxuZTZRTXl6d2E3Znh0Tm1MUnpKZmdTNkVWeXo5V21Y?=
 =?utf-8?B?Qmo2T3JuaGFmRUQ4RCtyUDltU2FuWC93UklmU20valBSRDA2MytzMnd6QldW?=
 =?utf-8?B?R08xVDNZY0ZYMjZ3QzNYWDBGQVNXN3Y0T3VJTFNJYk42djVJUjJhZ1E4VWR5?=
 =?utf-8?B?eS9COVE0cklLMUtBZmZFVWVjNlZsdVN5aHhHRzRCTklKUmViaC9uNUpmelVF?=
 =?utf-8?B?RXNuTzZkZ1ZuYlVGR1Z3UjRyc0JUK25XZm9IbUMvRGxqeWNRWHdla3pjYWc4?=
 =?utf-8?B?Z21LZkN4RjU1T016SFBCSjc1dEtWMlRtMkdWZXhIbTNZTmE0cmlxWGZnWDN4?=
 =?utf-8?B?SytYMis5MDhYVUJCWWRsQ01kRisweDIxeDZNMUJLeTcvMWV5cHh3S3ZHazlU?=
 =?utf-8?B?eTMwZ0xGWEduanFPZzgycWtMUnhoRmNJTTJ3RTR4alV2aGpQT25KaWE5WE0r?=
 =?utf-8?B?cVJHV0szYlhlaVNaTitGdllvT3RJV0hoNC9maDNua3lENitKK2lVbklseEd0?=
 =?utf-8?B?cWUzeTZ2K2tsUzVDeFJycVFkVlU5VFN4U3gwZlMxeW1ucXNJR1YrRWE3K3k3?=
 =?utf-8?B?Q3lXZlBiMXdabndsbDAyNi9CcVNlT3VDWW9JbGYyRG4vbVVzaDVhWTFpdHpr?=
 =?utf-8?B?ZVAwbklxek9DdUsyOHpXUElSb1Q0am1OellXQVp3SWxEcENkMXV2Mml3Qncz?=
 =?utf-8?B?NTNwbEZmMEY3QStINnJCRmpCY1U3SEJhVUUya0U0ZjFySzgwaHhyK2x1NGp0?=
 =?utf-8?B?WW1YdmkwRHhJZHBHNjhZRlhva0dRZmJPbm1tVk5oVkppcVRyNmdZSTlrQWUw?=
 =?utf-8?B?TWt6OG83YnlZODUwdW1OeHpWc0FRRGIyZ0VoWnh6c3Q0RVhBUWt5Y0lQdWdz?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d1fc58-d814-4326-dd8c-08de17f3a1e6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:33:49.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kwtxBSq9yMMPGAsG5THfsiuv4NuT4+LkHfbuZ6jf+v1ka3QGMHrsFuNVKQ/E1E0tpm79sdsvBANhIazbjMZAM22BERnZ+uR+tfWWLZ8/CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

VF FLR requires additional processing done by PF driver.
The processing is done after FLR is already finished from PCIe
perspective.
In order to avoid a scenario where migration state transitions while
PF processing is still in progress, additional synchronization
point is needed.
Add a helper that will be used as part of VF driver struct
pci_error_handlers .reset_done() callback.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index aac8ecb861545..bed488476706d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -123,6 +123,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 30318c1fba34e..ef9f219b21096 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
-- 
2.50.1

