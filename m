Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C00C261F2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19810EBF0;
	Fri, 31 Oct 2025 16:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMVePZnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBD310E2E8;
 Fri, 31 Oct 2025 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928298; x=1793464298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uB223Eq183aEjG8XyhxJf/QmR5r+a+chxlkN6pKN8rk=;
 b=QMVePZnmceVg5JDdFmiJlYHu5J98zUIfiiGLlfh6D1Qg1eSyNkj1Eqgl
 ksBUYGqWrL1ReTn3bWMz8FrGrGUPvOnT8k3syefIvFDKmh0tvnCaMiJcj
 gRmKe4Y5Fg6dgHJMysI/V0OOQ/ghIM2pJKbFxg2BUybhcruBAPh22q9mX
 +McYYXBVLUt11M3pMR+Ie41GcS+RAoF0gmRiWwQ0FA0n8CjqvBo0JwZJX
 kMjIrp2Q89vdsQYKlTAEzG4O+5349dDKSS+YWqr3bch8RsjL4iq9sQ+dH
 OXUwCyrO6lDpvOsPb+cQGvN7ggfeHCr+CFL9Va7u6ILichcOjkiUrIGtw g==;
X-CSE-ConnectionGUID: Kv9B9ajUREKEMGv5LpmAyA==
X-CSE-MsgGUID: 9Iyq/vvtS/mitMUbp0iXkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67748691"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67748691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:31:38 -0700
X-CSE-ConnectionGUID: QMNCcO6OTRCwBeOrClr9oA==
X-CSE-MsgGUID: 1NL7rkujTeG3f9chp1w7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186393951"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:31:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:31:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:31:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B97qsp5AlAApjT/cbc8nue71lBoTw8rL6cYV4VqmHnJpiLYjQHdRRomuLuL0JIEEQcKw4HNikphfU8bBCkrejIzchSyX2JDO1K6wCLNHt96nYP5idA9deHHIBkmwUo1r2PWe0Yc6+IQ3HP2/hOFOJL8kGOXATgsWxnyUSIqqMn7shR5GcCxhXUY060Xg9HAlRxpwhgfJIpGJPUBBbOYkRYQFZT2OCCFHmAcH3Co55mlyyY8kg4ss7CosTaLKZgWUhg4S5ZQwwLtvi2gf6rCh5+E5gXLpaa/AUsXzOoP7OA5FGTmWFR5mHmpnhKfWpOCR0M56HdWCwVfOK17xR6CViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIhkdRLsgCDHNXIslJFpCy3/n6EXyIYpdS7lKRbfuBc=;
 b=nhd20V4gNdoG/Q5QNIE5e9NsR3/ehtL9TiH4r/fLBqvdaqf9ArVRR/2hGIOKc0UcXFXQ53zDkjHfa8U6h8GlCjOV4LM0/Si/Fk97nIfsExYRN7jDWdzGMT6TsmgISL3zvw/u53NaW+ELtH7JpiyxwmqdMWWrmGx5ViXSXwVRYj9lesqMpu7HTe3uQT1VMXuO1i223MWM6qrpkRdHvzM02d8X9QgpmqL4kaUBUhNK8r1COufKuhpAMHa+Da9H3IySrxPvouMQHhZtGlAeLiZZv3SM3M9xY9D3MuXN+7d0qqmNASV8JbWoYY3EyrBfxhqfX8KR44M+/83Jmx9BmAwkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF1939049CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:31:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:31:27 +0000
Message-ID: <f39aed6f-1f40-41f8-b6a9-627c70e8119f@intel.com>
Date: Fri, 31 Oct 2025 17:31:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/28] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-8-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-8-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF1939049CF:EE_
X-MS-Office365-Filtering-Correlation-Id: 0339ed72-05d5-4ad5-726a-08de189af089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHl1TFBpaHdyVER5cjdXTk5xTmpoay9KMDZ4cmNlVStuazNBYkd0T1FFN3Vk?=
 =?utf-8?B?ay81cWRneHhZcjFwRERjZ1h2cTlWTHRyWmpydUsyd0RncEJ6SHRWekdtZFNW?=
 =?utf-8?B?TTFNZTk0N3dIQmVKVFYyc3BsR0sxWXNZVGNHMGZwd0xHTk1jbHFQZ2w0ZndU?=
 =?utf-8?B?dmVSSllKQjNWZnNNK2MwMm0wWGVseVF5Y3c0amhRU1dCbFByRndKWE5CeWpq?=
 =?utf-8?B?K2JoY3FpSFc3VjdKdElWTWFTUXBIYWplcnVSRXJOaVIwU2QvVzVlMWlVcDJ1?=
 =?utf-8?B?TGVLd2lPSEJYbi9leW04WXV5RFBNa1FXZklEUXMvam9NQTNIVTM1bEgwaGdv?=
 =?utf-8?B?d2kvZHRyaWRvTEVYNG9lRHVCTk14SjNucTZOUE53VkFsVzVMRVpyTWs0dGNM?=
 =?utf-8?B?RS9KeUNhR2N4QlFrYWZ2WjN6YTFtTzJySjE2M1VsUzFESG5IL0k4UTdsRFZu?=
 =?utf-8?B?RmVDT0xCRmxBQnl1L3gzU1hBWGJESDI4dTVPR0t4TGxRQmxiTCtsRURESjUz?=
 =?utf-8?B?Qk53QUhwUlZ1R2lwTzNXZkc2N1prRkFKRFBZYkxZSjhxbTJjWXpaMDBuaytD?=
 =?utf-8?B?YjBGSlByeGxTMEpYMFRpSmFWSTVPOGFseTlEaGdLT0ZPN2JwNTJGNGF0ZnVM?=
 =?utf-8?B?ZFJVbjdlei8yTGdHQmlqaVlkVE9zNkF5VnZnR0JYbm11aE5vSUZWR1NMSCtI?=
 =?utf-8?B?TnVlY0pZVUpQNmpDZXUvQ1Q5MUZVczBMWWEwcytDMS9JWTBsSW1JSzNIRTg1?=
 =?utf-8?B?YXRoczVUSU0wY0ZGdVhBZGVCYm9ZTUlrUmdTeUIweHdhck1pOXN0UndyUzJM?=
 =?utf-8?B?MVpmelNkSzQzcllodW1sSytsQ1VXUnZRdnU2bDdxK3dhRzJCemJ5VUtmN08y?=
 =?utf-8?B?QWZwZ0VIZlpMN1JiMUhtM0JjWkJSQmo2TUplWmhIdWkvUlMyY1o1clhwdm1h?=
 =?utf-8?B?T2hUc2VjTlVRWVFVejU2RmNoOFhmOGxwN0hRUk50YXFaRVlSSTAwbVdFMHds?=
 =?utf-8?B?L01PU0plM0loMEJFZytNeWYrTUhSNzdXY0l3RTlpcHFueGFsVW5vaFVJcHRi?=
 =?utf-8?B?dkhyY2QzTVRxaFI1VTdQU1JENDF0V21wOVpMZ2ZKVlRybjR2WTUxUENwWGsr?=
 =?utf-8?B?eE9DQ0UyUkZ4elJqbE9tSkV3ODNCYkZINjJNdi9XTjNaOGhIMHZLNTJVNmto?=
 =?utf-8?B?dEZDa1dUR3ZEeW9rUGYxdzcrQmdyTldPL2FDZVkrYjRyTTRuQ1JDcmgwN3Fh?=
 =?utf-8?B?NDZmeE9oeE9PK3NuYlNHaStoMjFlS1NpSmFHRFBEYjRSSTZ2eWxwdU5wUXRQ?=
 =?utf-8?B?NFlJQ0J0OVM3VEtBOU9DT1VMMi9YSjNzVFNYRTJqTzd3WTRuYXVaSkwvNElI?=
 =?utf-8?B?L3JiS3QrZkY0VWFJT3BrbVlRNXpNWUJqVWJzN3BzOXdSQWhjMzV5aUpuYzRE?=
 =?utf-8?B?YjdMRlFxc01yY1phZWpjOTBrRk5YS2tmMmJsZ3E4QU5ENlBNUXpORmozcDVO?=
 =?utf-8?B?bitUVHhraU1uNmQrZ1B3aDMra2FqTEU5RU43WmdQM1JBMVJKMzdaN0RNN1RN?=
 =?utf-8?B?aS9kbzlFZW13K2RWZm0vcytvUG8rWWdNNG03UXY0WWtBRkcxRVIzWFVVaEZD?=
 =?utf-8?B?OFBldGUzVTgxejIxK29SVmJtTmF3RE1LT1NIaWVLZmwxY0VSaDRxV0JUbExC?=
 =?utf-8?B?OGViclFqRXRVNzkwWjh6djRNcGRtYi9FV3Uzc3NseFNxWmplK0FDV2hCUmNv?=
 =?utf-8?B?dWJtNUhhcDl4c2hzVE93c3VBL1pMd3BKVysvbXB6UkppZmlJOHFLR2R3VytE?=
 =?utf-8?B?NDV0dGNKQlRTVmtMN2NGZEpsZmFHR0ZocmUzK2hGaU5oTkhVcElKZlp0RXhZ?=
 =?utf-8?B?Tm1JSFpNNFgwUU1LREt1c3VWWmxVaGlpM3psVGx1NHNneEJoaFBRd214WXZ0?=
 =?utf-8?B?OXp1dEZmenk2dnRxVytGOGsreDczY1RJSGtkTWZiTXVoYnhUZDI3QzNDMVV6?=
 =?utf-8?Q?tjkJZmyLGvfS7eaWUtpoVRybqBocDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBWU001bXFxbnZYT0JQNG43UDRaZjgyK2xWZFZMbVF1YUlIS3hLbWFlMVpt?=
 =?utf-8?B?bktiN1JWY0RvSzcrWkcwS2xRaHVmRUtLM0hjVko1dDJZTCtiNWJMdEZzSitL?=
 =?utf-8?B?MjU1UmlNTnVWaEtkeDhlYUxyd3IwcXhqVUIxaXFJbFJ0ekx6QnlIZ1RjajJT?=
 =?utf-8?B?bXp3UURWU1NGZ0ZtUzFFczJPZCt3UHVuVVpYWHRvVHFpeFpFelhYdkxaR1VI?=
 =?utf-8?B?Q1EySXhROFpidkZheEUrOTM0U2NvdUtSK2lMd0VoaFpWVXhxUm5RVGtXTzk5?=
 =?utf-8?B?LytidmVLWXhNQXhBMUt0VHpzcDBkaUk1Qno3WWc5bmF6M0M2REl5SVNGR3R2?=
 =?utf-8?B?Uml3bUN2RGh3TE1XYWIwNGs0aUJwSE51enhhaFVJUzhIUzhOOExQSFRmUTBD?=
 =?utf-8?B?S1g4K0Z0cStCU2QycGZ0aWNNdmJUei9EKzZvb24rSnJ2NFdDbWJPbEhYS2pt?=
 =?utf-8?B?RFNTWXBXNjdON1Qza09raFpLMFBRRE9OWDlHZ0x4ZlBPQklCZFZtMURhNHZP?=
 =?utf-8?B?L1YremhlRGM3djdURi9GbUxmR0ZoZE5GVVZodU1uWXBFd0Y5SlNRWXZwbitS?=
 =?utf-8?B?L0ZZMHNhdis3Q2h2b2swNDNPczhZY0FCOTNCUnpqQlJ4ZWF0TWxUQ1lTVTJa?=
 =?utf-8?B?ck4xdEVVOWVzRnJjZmxhbHBmaVJzV253TDBRWDhXamEyeHA0b1dyTmZhWkkw?=
 =?utf-8?B?NnhIc0hWdnZ4K1pHZHJGTDU1Q2Y4OUZ3Y2tIWnVUT0xqUHo3MmIwVzlTYzZL?=
 =?utf-8?B?R0JkWlFrR2tHNmt5YTJvcjE4a0I3endrQUVTbTc5aXZBN1hNOTROY3I3QkZl?=
 =?utf-8?B?b2lEQkJVcWk0RWNsMDVjM244alFJaGxHazlPcHNWL0ZnSXVnaS9xU1hWamNw?=
 =?utf-8?B?YmFHVUFwWnJEektiWGhwK0s3djFsTDVKYUJhQnBBcDdDczZoVzcyY3crbi9Z?=
 =?utf-8?B?MVFlY2V0UHd6ZFJvVk9LTHJXYUsyYVRUQ2JPVk0vMW9wbC8vZGYwUjNLQmVw?=
 =?utf-8?B?b2hMSGtlVDN6MUtJd01WVmFuVnJpdDRKcG5qaVcrNHk2Q041UUwxRXNsdEg5?=
 =?utf-8?B?YndiYnBVWTlKaVlZYVBURWoveGkyVDZJVUMvMlB4UW9sR3FmeTRLcHBUOUlH?=
 =?utf-8?B?M3BycTBNZFdiTGVidVVTelhRUWJuU3JhNWo0a09JVDhETVdIakdQOE9ta3R4?=
 =?utf-8?B?cGVaUnBvUVFhNTJkUEc2MDdEb285RE0yamxkcEVEMExocWs0cFQ4R1VOeWxE?=
 =?utf-8?B?aXZGaWl1eFBSU2RzWk9lVUpBVE51dUVwOWp4V0R5WVVlellQMFBpUDRMR2Fx?=
 =?utf-8?B?dGZYRFY1VFNsbkF1SU1BeC9sWjNmZ0VDRnBSUWJ4ZjErb3kxbHFOU1ZrWWo0?=
 =?utf-8?B?bEFhQmtab2RaWkZGMVBrc2tXaVRhNG5QY3pnMW53cjNzOXgyTnI3QTM0aGN3?=
 =?utf-8?B?K2M4ZVdxczI3cHZRazVEWmhLcktBek5FbGl1Tnc2YkloaEZZWi8rOXFpWE92?=
 =?utf-8?B?RUtWVEJJeU0vWlZLSlZaTlRPdkl5aDVXRDNNTDJFb0lPTHJ5Y1lpcUdmckZZ?=
 =?utf-8?B?a1I3M2pGeldNZGxQanlNSkFxYURMZkdoam5udUpsZ1NydEp6NUlHdk9oaUpr?=
 =?utf-8?B?MDB1MllraHVOOGRYUjkwRk9aRmsrQzNkcC9FY3BGZ3Fzai84dXd4azZoc2R3?=
 =?utf-8?B?V2hCQ1Qvc0FWeUFna1FHekY1QlAxVWdYazgxemhBK001Tnc1ZlNHcVJnV00y?=
 =?utf-8?B?ai9kQWZhdi9YVjNVK0k2N0U5THdnSkJqZzhtVG9VbWVkUVF2NXMvd0FoeUxW?=
 =?utf-8?B?T3lUQkNnVzdOOGJjdGZBTlFQOGVKWnJzcE81TUhlZG5PVGliUnpLVmZpS3pN?=
 =?utf-8?B?L3ZScmtDdGhNcTVYU3dtaFNPT2JOSXRYRGp2VUt5ZXN0bkVsaWVxSWpxTE5y?=
 =?utf-8?B?VjFoQVE1bnhiY1oxakxwZi9BaklVangzUUhzZFExTHZnbTFENjdwQ0s0QkVo?=
 =?utf-8?B?M3NJV2o1QXV0dCtSQlF5MUxuWWhzdzRvS2lQVU1RVEdNYkN1dEhiNlRKSEpp?=
 =?utf-8?B?OFlveW04WksrRk1pT3FoV2lvQVNCSmV5NG54cFN2Q1pjMk5lYjI3NDRWN0VV?=
 =?utf-8?B?TjJDRkd0RmNxc0IwRmhtMi9EVnBRdWlCdi9JVjhPaW1SN2JSV0s5ek1QTWFr?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0339ed72-05d5-4ad5-726a-08de189af089
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:31:27.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SivRBoiwFePWYkAdUBWYZh5LcsIciBjDr12/cnTiWz/s/Dq8rvj1XrS5n2KVwl2ypYBMaHAzRjaThc0wjzUAzpQxBGDVHNnkf+7rGlgSHnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1939049CF
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Add debugfs handlers for migration state and handle bitstream
> .read()/.write() to convert from bitstream to/from migration data
> packets.
> As descriptor/trailer are handled at this layer - add handling for both
> save and restore side.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 337 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
>  6 files changed, 445 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> index 2371ca3e6b9a9..a3f50836adc81 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> @@ -6,6 +6,45 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_sriov_migration_data.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> +}
> +
> +static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> +}
> +
> +static struct xe_sriov_migration_data **
> +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> +}
> +
> +static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> +}
>  
>  static bool data_needs_bo(struct xe_sriov_migration_data *data)
>  {
> @@ -42,6 +81,9 @@ struct xe_sriov_migration_data *xe_sriov_migration_data_alloc(struct xe_device *
>   */
>  void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
>  {
> +	if (IS_ERR_OR_NULL(data))
> +		return;

nit: maybe to be always on the safe side, this chunk should be moved to 06/28 ?

> +
>  	if (data_needs_bo(data))
>  		xe_bo_unpin_map_no_vm(data->bo);
>  	else
> @@ -124,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
>  
>  	return mig_data_init(data);
>  }
> +
> +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
> +				    char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +
> +	if (!data->hdr_remaining)
> +		return -EINVAL;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
> +				char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
> +					 unsigned int vfid, char __user *buf, size_t len)
> +{
> +	ssize_t copied = 0;
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_data_hdr_read(*data, buf, len);
> +	else
> +		copied = vf_mig_data_read(*data, buf, len);
> +
> +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> +		xe_sriov_migration_data_free(*data);
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **data;
> +
> +	data = pf_pick_descriptor(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	data = pf_pick_pending(xe, vfid);
> +	if (!*data)
> +		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	data = pf_pick_trailer(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	return ERR_PTR(-ENODATA);
> +}
> +
> +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> +				       char __user *buf, size_t len)
> +{
> +	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return __vf_mig_data_read_single(data, vfid, buf, len);
> +}
> +
> +/**
> + * xe_sriov_migration_data_read() - Read migration data from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested read size from userspace
> + *
> + * Return: number of bytes that has been successfully read,
> + *	   0 if no more migration data is available,
> + *	   -errno on failure.
> + */
> +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +				     char __user *buf, size_t len)
> +{
> +	ssize_t ret, consumed = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		while (consumed < len) {
> +			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> +			if (ret == -ENODATA)
> +				break;
> +			if (ret < 0)
> +				return ret;
> +
> +			consumed += ret;
> +			buf += ret;
> +		}
> +	}
> +
> +	return consumed;
> +}
> +
> +static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
> +				const char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +	int ret;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	if (!data->hdr_remaining) {
> +		ret = xe_sriov_migration_data_init_from_hdr(data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
> +				 const char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> +					const char __user *buf, size_t len)
> +{
> +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> +	int ret;
> +	ssize_t copied;
> +
> +	if (IS_ERR_OR_NULL(*data)) {
> +		*data = xe_sriov_migration_data_alloc(xe);
> +		if (!*data)
> +			return -ENOMEM;
> +	}
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_hdr_write(*data, buf, len);
> +	else
> +		copied = vf_mig_data_write(*data, buf, len);
> +
> +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> +		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
> +		if (ret) {
> +			xe_sriov_migration_data_free(*data);
> +			return ret;
> +		}
> +
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +/**
> + * xe_sriov_migration_data_write() - Write migration data to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested write size from userspace
> + *
> + * Return: number of bytes that has been successfully written,
> + *	   -errno on failure.
> + */
> +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +				      const char __user *buf, size_t len)
> +{
> +	ssize_t ret, produced = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		while (produced < len) {
> +			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> +			if (ret < 0)
> +				return ret;
> +
> +			produced += ret;
> +			buf += ret;
> +		}
> +	}
> +
> +	return produced;
> +}
> +
> +#define MIGRATION_DESCRIPTOR_DWORDS 0
> +static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
> +					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
> +	if (ret) {
> +		xe_sriov_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*desc = data;
> +
> +	return 0;
> +}
> +
> +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> +
> +	*data = NULL;
> +}
> +
> +#define MIGRATION_TRAILER_SIZE 0
> +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> +					   0, MIGRATION_TRAILER_SIZE);
> +	if (ret) {
> +		xe_sriov_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*trailer = data;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	int ret;
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		ret = pf_descriptor_init(xe, vfid);
> +		if (ret)
> +			return ret;
> +
> +		ret = pf_trailer_init(xe, vfid);
> +		if (ret)
> +			return ret;
> +
> +		pf_pending_init(xe, vfid);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> index 3958f58a170f5..7ec489c3f28d2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> @@ -26,5 +26,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
>  int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
>  				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
>  int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +				     char __user *buf, size_t len);
> +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +				      const char __user *buf, size_t len);
> +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index 8d8a01faf5291..c2768848daba1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
>  	unsigned int id;
>  	int ret;
>  
> +	ret = xe_sriov_migration_data_save_init(xe, vfid);
> +	if (ret)
> +		return ret;
> +
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index e0e6340c49106..a9a28aec22421 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -9,6 +9,7 @@
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
> @@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
>   *      │   ├── vf1
> + *      │   │   ├── migration_data
>   *      │   │   ├── pause
>   *      │   │   ├── reset
>   *      │   │   ├── resume
> @@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
>  
> +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_migration_data_write(xe, vfid, buf, count);
> +}
> +
> +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +
> +	if (*ppos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_migration_data_read(xe, vfid, buf, count);
> +}
> +
> +static const struct file_operations data_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.write		= data_write,
> +	.read		= data_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 7be9f026d80e8..8ea531d36f53b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_printk.h"
> @@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
>  }
>  
> +static void pf_migration_cleanup(void *arg)
> +{
> +	struct xe_sriov_pf_migration *migration = arg;
> +
> +	xe_sriov_migration_data_free(migration->pending);
> +	xe_sriov_migration_data_free(migration->trailer);
> +	xe_sriov_migration_data_free(migration->descriptor);
> +}
> +
>  /**
>   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
>   * @xe: the &xe_device
> @@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
>  	unsigned int n, totalvfs;
> +	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> @@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
>  	for (n = 1; n <= totalvfs; n++) {
>  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
>  
> +		err = devm_mutex_init(xe->drm.dev, &migration->lock);

IIRC all software data allocations/inits we are doing as drmm
only actions that interacts with or cleanups the hw (*) use devm

> +		if (err)
> +			return err;
> +
>  		init_waitqueue_head(&migration->wq);
> +
> +		err = devm_add_action_or_reset(xe->drm.dev, pf_migration_cleanup, migration);

(*) like here

> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> @@ -153,6 +172,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
>  	return data;
>  }
>  
> +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> +				struct xe_sriov_migration_data *data)
> +{
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +
> +	xe_sriov_migration_data_free(data);
> +
> +	return 0;
> +}
> +
> +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> +			     struct xe_sriov_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> +		return -EINVAL;
> +
> +	xe_sriov_migration_data_free(data);
> +
> +	for_each_gt(gt, xe, gt_id)
> +		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
>   * @xe: the &xe_device
> @@ -172,6 +221,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
> +		return pf_handle_descriptor(xe, vfid, data);
> +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)
> +		return pf_handle_trailer(xe, vfid, data);
> +
>  	gt = xe_device_get_gt(xe, data->gt);
>  	if (!gt || data->tile != gt->tile->id) {
>  		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 2a45ee4e3ece8..8468e5eeb6d66 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/mutex_types.h>
>  #include <linux/wait.h>
>  
>  /**
> @@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
>  struct xe_sriov_pf_migration {
>  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
>  	wait_queue_head_t wq;
> +	/** @lock: Mutex protecting the migration data */
> +	struct mutex lock;
> +	/** @pending: currently processed data packet of VF resource */
> +	struct xe_sriov_migration_data *pending;
> +	/** @trailer: data packet used to indicate the end of stream */
> +	struct xe_sriov_migration_data *trailer;
> +	/** @descriptor: data packet containing the metadata describing the device */
> +	struct xe_sriov_migration_data *descriptor;
>  };
>  
>  #endif

with devm/drmm clarified,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

