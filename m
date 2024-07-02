Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB4923FA8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 15:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2210E5F8;
	Tue,  2 Jul 2024 13:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCxdvnez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A264510E204;
 Tue,  2 Jul 2024 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719928589; x=1751464589;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ehHGXQHVlF3xzkSN06A39sdFmGoaXZYYLnMlKSjsY08=;
 b=jCxdvnezsWB2x79yMuNjWchgzwMEaFw9eiXQJ8u1Sivp2VNOcE3ELDig
 JJKEU80APfNMlbsg+9ZlHOEk0jk+ExmEqxrWxxJ2njpm9ksoIKX1xuK3B
 vMce4RLeJ1sOISXsWpVHogFCMJ/podkbHECvuUSwEoMhW/68kSJzQ+fnP
 jcbeWw47hLJPJQ/Bl2Ja0yaGUjsKCXxGssdXikO5OTvgX6cLk1kuVOz5I
 yOpCcM6arwPac6z8f7985v2p7mYmuwH1H4wPxmoEMrVtb1YLSw2Cnz76t
 2NvGqDp1z/zap0fTBr9G4WplM9rUA72PrK1ES2zxaNhmZkEhw2bx7U+YW A==;
X-CSE-ConnectionGUID: MQISxIDiTwiHdSbbm0go3g==
X-CSE-MsgGUID: WWUfVKH3TaGSn/jxueNnWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20916268"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="20916268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 06:56:29 -0700
X-CSE-ConnectionGUID: uRryv0RXS+a9qF/bZCjVNg==
X-CSE-MsgGUID: Ywb6ZbzzQje0U8yhB4GF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45804434"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 06:56:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 06:56:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 06:56:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 06:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wga1oioZM82sTNJ7W1xR6soMNyFnLwOYDJg/WQPDi3+93XfFnVs84Mf80hJ1+kbwn3le0eyrIfg7+2oQXssbCYPGHpaKuyIKsPkOvYilOlqOUYn3ykgEhh6yQrLlLEclO58dRJjTii6mI/xi8zLfNmDrY2Cz2vOFn5PGbUlvdd81viKjTuUoQ3wn6u/6ebM95LuRJ/NX5MUy0nxe/qE7guPil62ZA4b7VI23tz4eJQoG49ZO0UeuH55yLj0JvjnI1EfRaPIe2zR1ysj+VQdjLU31VEhVDQ9fVgvnMQB1BdxrDuu8HgeQSGXXmVxbEGbTelMKCF+dNMQ7OFYzYU/Oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehHGXQHVlF3xzkSN06A39sdFmGoaXZYYLnMlKSjsY08=;
 b=NSYPqb6+eZ8X8+3G8eGO1Euq5Fg2Bm1U7qGNaWXzn2AQ/KeqYBQjOcq1mwKaY2zhB42lwRF2bodftQof6/AgfKwKxV2dNBzSWAqnGxHEMcbzaYTOHm/IEJSb1BcqJe24JNCncNkSscqvc21xYvXIivo+A52i9k9OO5NMZCZp64PZ3nHCO3w6bM+oUNpd0RZRzun+AWwPeutaLd8WL09riZbULPfYLv6fk5FjgH7UmMuwx2qfy8HkLexWH6LC1k5THLnqISqObZKzHLWu6bTopyRsfIMWC4rQ+H1gEtNbxv3os72SJgf2PSe5BgAvnH2j5KoSdb89SUtsjI7WW+cLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 13:56:20 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 13:56:20 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Yu, Effie" <effie.yu@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Thread-Topic: [PATCH] drm/xe: Use write-back caching mode for system memory on
 DGFX
Thread-Index: AQHawmdCSDRyjP4pTkWfMbn1jQspzbHjimmA
Date: Tue, 2 Jul 2024 13:56:19 +0000
Message-ID: <0c43e1651530083c26d3e5b16f1a55df9889f618.camel@intel.com>
References: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB5870:EE_
x-ms-office365-filtering-correlation-id: d24f3d53-4f5e-44b7-0be0-08dc9a9ec038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnVudFZTVzhvMjQwZzZTWitnVjNDMnB6NFFocDZpU3kwYWNLVVkvMUszRXc3?=
 =?utf-8?B?WUREV0xqQ0tEWTYxOVNrdkJyTzN0V2xCazJ1R1JLK1FCRkJDU09IN2xmd2ZQ?=
 =?utf-8?B?a3E3SmxqL0lKdnJqRFl1V3R4eHp5czlkSlZJUExhVFZKRVVSckhXTTRtV2cy?=
 =?utf-8?B?TCtCeG1YSnNKZWZjLzRpK09kMWxheGxGR3hqRUJnNVNRRldKU1lZVy9ObEdB?=
 =?utf-8?B?S09MQk9SRjhOWnVsTG84RUhicHp0bStHNEhVY3RxVlA0SnQxb0dIZ0NoTWF4?=
 =?utf-8?B?RTU2QlRCcSs3blVEY0M0UUsxaU9JUmNYTU1wa1dkalJmeFlaQldmVUpvODZy?=
 =?utf-8?B?ZndEZmJqWS8vemNBQ29aR1RJSEhnV0l5Y3ZZMlBZLzFqWG5uS2wvZ2dVK1Bo?=
 =?utf-8?B?WWdITDN4NzRTNUdnOUltaW1DMWxmOTM2THdpZ2Q1eTdhZ3p1WXdmNUo4akpN?=
 =?utf-8?B?cUdORWl1NkhlUzNtZndGRGdkV3lLc2dQRnRoM2o3T0JrV0ZOMmJQYjc4Z3kr?=
 =?utf-8?B?U0d4VTEvMVg5aWltbkdEUWRSeFpzbElLMnhwWURCRSt6aWZrbHFsLzRaMnlo?=
 =?utf-8?B?RmZwNWpDbllLT0hINmNGUFJOZTFqK2JFeWpQdXIydEd2aTdtSldrNGI0TGNt?=
 =?utf-8?B?ZUhFRTl2bUpVUUhPemJJRGpVS0Nzc0JzOHVuVG0zZmhGcklsK3FHUHpJNjlJ?=
 =?utf-8?B?QXptR2VSdERDQ1JqbFNvWXF1V0RwbjlzSjZHcklwMktjcGJYaXZKOFhrL29S?=
 =?utf-8?B?MkVkWVpESWgyQ1FjSzJGYzh0ZTB0VUkvOGF5SDRrT3FhRmxyZjY4cldLUkZF?=
 =?utf-8?B?WEprOGJiZzNMTlp3QjR2SExlK1lmZHlkT3hDQmFjSUF4MHVhbHZYbEk2TnNs?=
 =?utf-8?B?SkV2MElZWDJ5YWROc20vbTQwWGl3YlN2N3J6REJxNmc2NkdlT0c0WGNVTmdB?=
 =?utf-8?B?QVFMSHdIbXR2c1cwWEdwZEQvaElaVFFSaUJaUkprNmJpd2F5SE1IZ1dUYWE1?=
 =?utf-8?B?ekFMdllZSmN2WFltNS9TN2RLWk5rTEFtcFQ2V00yVHJBaEN2SDlDYVRxRS9l?=
 =?utf-8?B?L1JhSytFM2Nld2JMYktPOTB2M3dOd2o0NzI5QUlhK2hnNUlhdldLdHRlTU1i?=
 =?utf-8?B?QWlMc2dzWEpCd1NtRlllL25aSHZvWUNCMTZSN0EzNGptL1F1MFN4QWNlN3BB?=
 =?utf-8?B?MnVwSktXNnJydzJ0a2M3YmdpZHVOSVNadmkvcytBYVlxcEN1TXl1bjkzaWlE?=
 =?utf-8?B?ejFZemNzTUtuSnVsSUNvT1BjVnFnVzJQRTUrT210emZkajJadWxFOTN3TXhQ?=
 =?utf-8?B?aEZadXp3TzM2ZS9VaHBiWHpweFpHcklpQjN0YzB0bjQwdFdmOW9wcVc5Q2xw?=
 =?utf-8?B?dlNycXRhQThZY3ptR3N1dVNjOExvRVA3MEtGMUJabDVEZmdjUjBMVlNlUFB2?=
 =?utf-8?B?NVc2ZG5yQjBFN1RXSFkzUE4zZ3R6a3JCRWVNWForaFlQaUJaOTZtTjVvbnJm?=
 =?utf-8?B?SUMxZlhhZjBlR1Y1dExzdS9tRHNjNXlDREM0RGtJbzBGenZrVEpKRnd1T3Nz?=
 =?utf-8?B?SlhRQzZiMVVZZ0JsanlHSTdUYjZnbFNmVExURVNiM1ZmQ0oycDExRmthTVY1?=
 =?utf-8?B?WXRHck9aMFFkOGJMVElQeTJrY045blh5ZzZETW5ZWVdhUjNtSnYvVzI0NHJw?=
 =?utf-8?B?bVcrQmtMVE13UU1ZL2p4ajdEQ2tNSnMxNmVaMDY4NkhzMDRJRUhJQmd4TWpy?=
 =?utf-8?B?TnM1VTQwdC9LcjlBc2ZxUFNtM0JGL0dLc2VIT051bW4xSExYZVpmRlpHUm91?=
 =?utf-8?B?d2hqR2E1dHhXQmYyTWhVQmhHdFNrSnBNa0VHaUU1UXYxRXN3SWtyWiswSk41?=
 =?utf-8?B?VlJiWElXbSt1WEtzT2dqczkzVlExY0tQOVpab1p2TTFQZUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmFvMzkrVGZ3QXU3ZTZIN3dqTHNOOEt3UkFsc2JVaTFqK05KV3p6S05Nd0xy?=
 =?utf-8?B?RWUxY0d2d3NwVUtvNnlraFRIbmx6S3pMYWsvUzM2cUFVNXhnemh4OFlsZTQ0?=
 =?utf-8?B?MlZWaWk3UVNsZ3p5cnJhS3dlWjVGMHBYNWN2ckJkV0FteTNVbGU2eUVxR1B0?=
 =?utf-8?B?RmtjazRyL25PeXk4MFk4cVI5OEFNSXRlcThHdlBxdTlHTWlXYzFRUHVXVlFE?=
 =?utf-8?B?b1lUMXRHMlMyeXd4QjZKOHFEc2MrS3dIeGZiWmRLa3lMRStoZGJPSHVTbEJ4?=
 =?utf-8?B?aVUvaExVM3lIWW1PdmZrS2VyK0JlWFpqZUxJYTVRYjltcEFoU0JwZk15VkpS?=
 =?utf-8?B?UlRQQ1RUU3hzQm9lTXBpK2wrWkZiUTNEKzRJR3VVQmxlLzVtMnZZcUdTUVBC?=
 =?utf-8?B?eG9KdWFWNkNrYmxyQzZWMURaS0Y2SjE2dXVUd1RxUjZTY250TDljUkU4UTRs?=
 =?utf-8?B?SWtaVVUwK09zaEhZY2tzUVNGSWxaTkhCTlcwNGUwZ05PMkRjUVVOazF6M1JY?=
 =?utf-8?B?NmZtcUdUaE9KZkVhSHVnK3FmVndIREs3bG9vWlg2Sk00N1NTRTJFK2l3aGpJ?=
 =?utf-8?B?OXpqbTdNcklhYTFKaEdjKzhZanlBcVlVUnUyWUVmeGVVdU1BSkxmeGE5UHhk?=
 =?utf-8?B?WDRzaWV2UC9udGd6c3dZblExYVQ1TnlWNllzQk9iR3J3Z21acnZFQ1Rrdmty?=
 =?utf-8?B?OGNROVZRUnlBT2hkWUdvb3NVcGNKRkJFbHAzdXdnY0NoOG5mSnhDQjFKY3Bv?=
 =?utf-8?B?ODJhaG1nRHlGd2R3YkZMMjhDbFBhWlo1YTRzbC9TeFpjWlZUKzI1Mm9LbWJY?=
 =?utf-8?B?dkxGVktLaWRnVm1pR0ZUMXA2ZnRoYXRtajU1MzBaTDhyNDlZcElTdkhlWFBW?=
 =?utf-8?B?S0pjeFFVSmxxQVcrRkx0NEtMUlFRWGUvcjUrUVBSTFI1QjA4UUk4Y0JWWXhK?=
 =?utf-8?B?Qkl5UDM2ZklzVDBZc2Y1SHJBaWpRdHNDL1I1dUs4YmRTNWhGN2pkRzFCaDlD?=
 =?utf-8?B?ODAxNDZrdktabFRDN29LdHVHeFAyNWllczdFUlhEOS9ienFHeE1TWS9VWTVo?=
 =?utf-8?B?bndaVmtSK3Bva1dvekNEWFN6K0MwRlF6UTJtb1JhSUY5eG81OGtQeW1UTW5Q?=
 =?utf-8?B?L2JMY0RvaUIrZXdLamRRelJnQTdVOERPbmpqMG1DZFRLSk4wZHJFeTVIUWoz?=
 =?utf-8?B?OGd2SDdycCtVVlkyMnFPejdtUkZqbFdOeVlVR3Z1YWNTRm9aazgxSDJKSWIr?=
 =?utf-8?B?Qml2SC83VHAzS2UvRE9rWWk3LzM5WTl5N1UzNTNtQndoVFErK3BheE53bG54?=
 =?utf-8?B?ZTVNcDJFM1l3MGlzYlFkb2VhL0orZFpmUFFmQ2tTR3YzbjZtRkJQaUtveS9D?=
 =?utf-8?B?Q3hxOVgxWStORGhYa3pqVXRZbE9Zb0ZoRmlLcXhIdW90ZG0zV1Y1Lys2djBP?=
 =?utf-8?B?Y25ka2lOaUtWWmZyZThnMXZSZVgzOEJwV3RXc3JRd0ordzNPSW9jQVllSUE3?=
 =?utf-8?B?VGFkazZrMnBuc0IxR01vMlQ5bVdGNlR6N0d6M1RhRjJmRUZiZ3lWRlV4Mnln?=
 =?utf-8?B?VWxmcXdOWnl4dEpFMzVhN3l2QktMWnVZM0pTMlIzNU5PVFlzSkVBVUxRNlZl?=
 =?utf-8?B?WVRHU29RanVaTzB6OTN4Vyt6NnB2ZmlhLzlIODVUYnRSb3cwZytUWlUzdHk0?=
 =?utf-8?B?MGtTSVNkb2JWdGswdG84VUFUVjNYUFVFUk1GZkczUFIwbnVFTUtIUURicG96?=
 =?utf-8?B?M0lsNDF2YjVseDdSOVlqbUx2ZUlUSUFvQTU0TEVRNlJYK2hYdFdRc2hDOVdL?=
 =?utf-8?B?WDl3Ym9UU3ZUUTlhQlFVd00ydlZ0a0pHWFJBMVRtM0RHbnpOSG12OHI2R0xY?=
 =?utf-8?B?VFdDbXZ0TThBY0xoOGhETk9mM0xrOW5URmdYTWxveWdzWkF4SGxGY2pJdDhu?=
 =?utf-8?B?bC9TVWdabm1XY3lMeitQWHRiVlFoVXRuM3pnanpsS3F1UmpJZzdqMHl5OUtN?=
 =?utf-8?B?Ni8yaXJhbFd4MzYwVVZtN2pxYTNqTGgwTG5LM2E3a3lBTHZPeW5PK1AxQnd6?=
 =?utf-8?B?czhFaDVOQVVnSkozSFBZWUhPdXVQa25PSnp1NlU4NzVKcnAyYUVCbHM1WWgw?=
 =?utf-8?B?bWM5czFEZnYxM2pHbXlRWG1JK0RtMWk1UE5lR3B6WUtjclpGZFdlTWdiV1R5?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21FC93A3D8A49C46BFF3A7321D7BCA4B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24f3d53-4f5e-44b7-0be0-08dc9a9ec038
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 13:56:19.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CE+s3sqxXJp0+LkpYtH7WW7Q9h2QdQs2PWriWbPOzMU1Tvb+Hxw5TnvHApbyzNRHqtL3Thw+YNJPk3eFb4wF+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

T24gV2VkLCAyMDI0LTA2LTE5IGF0IDE4OjM5ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gVGhlIGNhY2hpbmcgbW9kZSBmb3IgYnVmZmVyIG9iamVjdHMgd2l0aCBWUkFNIGFzIGEg
cG9zc2libGUNCj4gcGxhY2VtZW50IHdhcyBmb3JjZWQgdG8gd3JpdGUtY29tYmluZWQsIHJlZ2Fy
ZGxlc3Mgb2YgcGxhY2VtZW50Lg0KPiANCj4gSG93ZXZlciwgd3JpdGUtY29tYmluZWQgc3lzdGVt
IG1lbW9yeSBpcyBleHBlbnNpdmUgdG8gYWxsb2NhdGUgYW5kDQo+IGV2ZW4gdGhvdWdoIGl0IGlz
IHBvb2xlZCwgdGhlIHBvb2wgaXMgZXhwZW5zaXZlIHRvIHNocmluaywgc2luY2UNCj4gaXQgaW52
b2x2ZXMgZ2xvYmFsIENQVSBUTEIgZmx1c2hlcy4NCj4gDQo+IE1vcmVvdmVyIHdyaXRlLWNvbWJp
bmVkIHN5c3RlbSBtZW1vcnkgZnJvbSBUVE0gaXMgb25seSByZWxpYWJseQ0KPiBhdmFpbGFibGUg
b24geDg2IGFuZCBER0ZYIGRvZXNuJ3QgaGF2ZSBhbiB4ODYgcmVzdHJpY3Rpb24uDQo+IA0KPiBT
byByZWdhcmRsZXNzIG9mIHRoZSBjcHUgY2FjaGluZyBtb2RlIHNlbGVjdGVkIGZvciBhIGJvLA0K
PiBpbnRlcm5hbGx5IHVzZSB3cml0ZS1iYWNrIGNhY2hpbmcgbW9kZSBmb3Igc3lzdGVtIG1lbW9y
eSBvbiBER0ZYLg0KPiANCj4gQ29oZXJlbmN5IGlzIG1haW50YWluZWQsIGJ1dCB1c2VyLXNwYWNl
IGNsaWVudHMgbWF5IHBlcmNlaXZlIGENCj4gZGlmZmVyZW5jZSBpbiBjcHUgYWNjZXNzIHNwZWVk
cy4NCg0KTm8gcmVncmVzc2lvbiBvbiBNZXNhIHdpdGggdGhpcywgc286DQoNCkFja2VkLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPg0KPiBGaXhlczogNjIyZjcwOWNhNjI5ICgiZHJtL3hlL3VhcGk6IEFkZCBzdXBwb3J0
IGZvciBDUFUgY2FjaGluZyBtb2RlIikNCj4gQ2M6IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1p
c2hyYUBpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5j
b20+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKb29uYXMg
TGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBFZmZpZSBZ
dSA8ZWZmaWUueXVAaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPg0KPiBDYzogSm9zZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
DQo+IENjOiBNaWNoYWwgTXJvemVrIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCj4gQ2M6IDxz
dGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY2LjgrDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMgICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX3R5cGVzLmggfCAgMyArLQ0KPiAgaW5jbHVkZS91
YXBpL2RybS94ZV9kcm0uaCAgICAgICAgfCAgOCArKysrKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBp
bmRleCA2NWM2OTY5NjZlOTYuLjMxMTkyZDk4M2Q5ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4g
QEAgLTM0Myw3ICszNDMsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV90dCAqeGVfdHRtX3R0X2NyZWF0
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnR0bV9ibywNCj4gIAlzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IHhlX2JvX2RldmljZShibyk7DQo+ICAJc3RydWN0IHhlX3R0bV90dCAqdHQ7DQo+ICAJ
dW5zaWduZWQgbG9uZyBleHRyYV9wYWdlczsNCj4gLQllbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmc7
DQo+ICsJZW51bSB0dG1fY2FjaGluZyBjYWNoaW5nID0gdHRtX2NhY2hlZDsNCj4gIAlpbnQgZXJy
Ow0KPiAgDQo+ICAJdHQgPSBremFsbG9jKHNpemVvZigqdHQpLCBHRlBfS0VSTkVMKTsNCj4gQEAg
LTM1NywyNiArMzU3LDM1IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICp4ZV90dG1fdHRfY3JlYXRl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdHRtX2JvLA0KPiAgCQlleHRyYV9wYWdlcyA9IERJ
Vl9ST1VORF9VUCh4ZV9kZXZpY2VfY2NzX2J5dGVzKHhlLCBiby0+c2l6ZSksDQo+ICAJCQkJCSAg
IFBBR0VfU0laRSk7DQo+ICANCj4gLQlzd2l0Y2ggKGJvLT5jcHVfY2FjaGluZykgew0KPiAtCWNh
c2UgRFJNX1hFX0dFTV9DUFVfQ0FDSElOR19XQzoNCj4gLQkJY2FjaGluZyA9IHR0bV93cml0ZV9j
b21iaW5lZDsNCj4gLQkJYnJlYWs7DQo+IC0JZGVmYXVsdDoNCj4gLQkJY2FjaGluZyA9IHR0bV9j
YWNoZWQ7DQo+IC0JCWJyZWFrOw0KPiAtCX0NCj4gLQ0KPiAtCVdBUk5fT04oKGJvLT5mbGFncyAm
IFhFX0JPX0ZMQUdfVVNFUikgJiYgIWJvLT5jcHVfY2FjaGluZyk7DQo+IC0NCj4gIAkvKg0KPiAt
CSAqIERpc3BsYXkgc2Nhbm91dCBpcyBhbHdheXMgbm9uLWNvaGVyZW50IHdpdGggdGhlIENQVSBj
YWNoZS4NCj4gLQkgKg0KPiAtCSAqIEZvciBYZV9MUEcgYW5kIGJleW9uZCwgUFBHVFQgUFRFIGxv
b2t1cHMgYXJlIGFsc28gbm9uLWNvaGVyZW50IGFuZA0KPiAtCSAqIHJlcXVpcmUgYSBDUFU6V0Mg
bWFwcGluZy4NCj4gKwkgKiBER0ZYIHN5c3RlbSBtZW1vcnkgaXMgYWx3YXlzIFdCIC8gdHRtX2Nh
Y2hlZCwgc2luY2UNCj4gKwkgKiBvdGhlciBjYWNoaW5nIG1vZGVzIGFyZSBvbmx5IHN1cHBvcnRl
ZCBvbiB4ODYuIERHRlgNCj4gKwkgKiBHUFUgc3lzdGVtIG1lbW9yeSBhY2Nlc3NlcyBhcmUgYWx3
YXlzIGNvaGVyZW50IHdpdGggdGhlDQo+ICsJICogQ1BVLg0KPiAgCSAqLw0KPiAtCWlmICgoIWJv
LT5jcHVfY2FjaGluZyAmJiBiby0+ZmxhZ3MgJiBYRV9CT19GTEFHX1NDQU5PVVQpIHx8DQo+IC0J
ICAgICh4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID49IDEyNzAgJiYgYm8tPmZsYWdzICYgWEVf
Qk9fRkxBR19QQUdFVEFCTEUpKQ0KPiAtCQljYWNoaW5nID0gdHRtX3dyaXRlX2NvbWJpbmVkOw0K
PiArCWlmICghSVNfREdGWCh4ZSkpIHsNCj4gKwkJc3dpdGNoIChiby0+Y3B1X2NhY2hpbmcpIHsN
Cj4gKwkJY2FzZSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dDOg0KPiArCQkJY2FjaGluZyA9IHR0
bV93cml0ZV9jb21iaW5lZDsNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZhdWx0Og0KPiArCQkJY2Fj
aGluZyA9IHR0bV9jYWNoZWQ7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+ICsJCVdBUk5f
T04oKGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfVVNFUikgJiYgIWJvLT5jcHVfY2FjaGluZyk7DQo+
ICsNCj4gKwkJLyoNCj4gKwkJICogRGlzcGxheSBzY2Fub3V0IGlzIGFsd2F5cyBub24tY29oZXJl
bnQgd2l0aCB0aGUgQ1BVIGNhY2hlLg0KPiArCQkgKg0KPiArCQkgKiBGb3IgWGVfTFBHIGFuZCBi
ZXlvbmQsIFBQR1RUIFBURSBsb29rdXBzIGFyZSBhbHNvDQo+ICsJCSAqIG5vbi1jb2hlcmVudCBh
bmQgcmVxdWlyZSBhIENQVTpXQyBtYXBwaW5nLg0KPiArCQkgKi8NCj4gKwkJaWYgKCghYm8tPmNw
dV9jYWNoaW5nICYmIGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdfU0NBTk9VVCkgfHwNCj4gKwkJICAg
ICh4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID49IDEyNzAgJiYNCj4gKwkJICAgICBiby0+Zmxh
Z3MgJiBYRV9CT19GTEFHX1BBR0VUQUJMRSkpDQo+ICsJCQljYWNoaW5nID0gdHRtX3dyaXRlX2Nv
bWJpbmVkOw0KPiArCX0NCj4gIA0KPiAgCWlmIChiby0+ZmxhZ3MgJiBYRV9CT19GTEFHX05FRURT
X1VDKSB7DQo+ICAJCS8qDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm9f
dHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oDQo+IGluZGV4IDg2NDIy
ZTExM2QzOS4uMTA0NTBmMWZiYmRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfYm9fdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fdHlwZXMuaA0K
PiBAQCAtNjYsNyArNjYsOCBAQCBzdHJ1Y3QgeGVfYm8gew0KPiAgDQo+ICAJLyoqDQo+ICAJICog
QGNwdV9jYWNoaW5nOiBDUFUgY2FjaGluZyBtb2RlLiBDdXJyZW50bHkgb25seSB1c2VkIGZvciB1
c2Vyc3BhY2UNCj4gLQkgKiBvYmplY3RzLg0KPiArCSAqIG9iamVjdHMuIEV4Y2VwdGlvbnMgYXJl
IHN5c3RlbSBtZW1vcnkgb24gREdGWCwgd2hpY2ggaXMgYWx3YXlzDQo+ICsJICogV0IuDQo+ICAJ
ICovDQo+ICAJdTE2IGNwdV9jYWNoaW5nOw0KPiAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCA5M2Uw
MGJlNDRiMmQuLjExODliMzA0NDcyMyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC03ODMsNyAr
NzgzLDEzIEBAIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0ZSB7DQo+ICAjZGVmaW5lIERSTV9YRV9H
RU1fQ1BVX0NBQ0hJTkdfV0MgICAgICAgICAgICAgICAgICAgICAgMg0KPiAgCS8qKg0KPiAgCSAq
IEBjcHVfY2FjaGluZzogVGhlIENQVSBjYWNoaW5nIG1vZGUgdG8gc2VsZWN0IGZvciB0aGlzIG9i
amVjdC4gSWYNCj4gLQkgKiBtbWFwaW5nIHRoZSBvYmplY3QgdGhlIG1vZGUgc2VsZWN0ZWQgaGVy
ZSB3aWxsIGFsc28gYmUgdXNlZC4NCj4gKwkgKiBtbWFwaW5nIHRoZSBvYmplY3QgdGhlIG1vZGUg
c2VsZWN0ZWQgaGVyZSB3aWxsIGFsc28gYmUgdXNlZC4gVGhlDQo+ICsJICogZXhjZXB0aW9uIGlz
IHdoZW4gbWFwcGluZyBzeXN0ZW0gbWVtb3J5IChpbmNsdWRpbmcgZXZpY3RlZA0KPiArCSAqIHN5
c3RlbSBtZW1vcnkpIG9uIGRpc2NyZXRlIEdQVXMuIFRoZSBjYWNoaW5nIG1vZGUgc2VsZWN0ZWQg
d2lsbA0KPiArCSAqIHRoZW4gYmUgb3ZlcnJpZGRlbiB0byBEUk1fWEVfR0VNX0NQVV9DQUNISU5H
X1dCLCBhbmQgY29oZXJlbmN5DQo+ICsJICogYmV0d2VlbiBHUFUtIGFuZCBDUFUgaXMgZ3VhcmFu
dGVlZC4gVGhlIGNhY2hpbmcgbW9kZSBvZg0KPiArCSAqIGV4aXN0aW5nIENQVS1tYXBwaW5ncyB3
aWxsIGJlIHVwZGF0ZWQgdHJhbnNwYXJlbnRseSB0bw0KPiArCSAqIHVzZXItc3BhY2UgY2xpZW50
cy4NCj4gIAkgKi8NCj4gIAlfX3UxNiBjcHVfY2FjaGluZzsNCj4gIAkvKiogQHBhZDogTUJaICov
DQoNCg==
