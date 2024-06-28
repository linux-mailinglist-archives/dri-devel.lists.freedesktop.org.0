Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2291B62D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 07:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDDB10EBB2;
	Fri, 28 Jun 2024 05:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="le+yOBsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262B710EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719553134; x=1751089134;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YEoOYmO2b7s/axvFr9PvmezntEovHTyIREwr3krX+EE=;
 b=le+yOBsPMXWa0h4ARzlAhJQdXETiCfxs6O8QkRKO6Ld8g9Q6eXWNbWG6
 dbGqxVnhfSuQj7H1lFfX48yayH6nQ47pMjpmZ2D1Ku4UBeD2C4v3507mz
 VqVNJKunxdqlTxPm/oBr4iEKQEWwXh6HYZgSE2B3XF8REKdxX0EsgmPXe
 BH0K2AAfv0c37sYSuZBKcsZVXsU/A3sdECjIxJnR5vyXhGyyeMGHVuAX0
 a5j1UaPy/0GNcxf3JOlqD3GjBLO3C3gRimViEEOeEEDI968VpXfib4Apg
 RJ+4qPdW1/4t2ynzk8xEvnro3tJoJV5knVblFiGyCjD3/DW05p5JLVl5c w==;
X-CSE-ConnectionGUID: KFqYLIP2RCuT+lbzcTie1A==
X-CSE-MsgGUID: qYNSbxzlQ4O9GIaiRVVHcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16861461"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16861461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 22:38:54 -0700
X-CSE-ConnectionGUID: d0xwzdU1TyGepQlMmA9vcw==
X-CSE-MsgGUID: FK2rX8agTGerUdAh2RY7mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="44686213"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 22:38:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 22:38:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 22:38:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 22:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMpWH0IvsGtvHKj8c42GNVP+6q6nN/vc+EZ4e+fXJ0cSpTZtl/sSXQ7PLOEV1NXwNUW30QuWcTPigIWXwrTUfd2gAXKDve93nC0oVZDLU9+Bjeeb0huBrNjqhIp1gxTa0SdNgVn3NhTqsAciD8L+VRFpFZj50VRoNGHw8NlCY0XUfIoLYBm0msNS/uRpat+fnlevJrSHb7JeMe79rvTojZqv6JLrp5i/81mfGbsbXCtV6C2p/7FpV2doGFl9J7iLUiS16X5PnFUuXgwpRcTRV5W4XDXIj/FxTAA0lH4VR4ht+5G4gAL/fnAgzbaEwDIBOmvrXwM75F2Qy7Neh/iVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W28ESqACq/qUjeMzbnmpSz43drohUxgvI9k0pmNNIQ=;
 b=k+ERN+FCCBMEsXLIqIpGAwC21jPT6LgcYT69PYC3FMD3WdunR7v/O5njFgXlqmyi6OXs4qXXKVF94hF7cLAQgbpkW1VO/6HEJmC5xoxuAE5iMMdzCe4eKowXLA6Kg9Qwu7+PMJdYUca/yOyUfNyVzShC81jSD/+aICul+8Ww2AGrpbZ+98zHNzTk35WQEd33VopEahFkHzp77L9TeCUdXqxcfKFOMU/WppJtMjkrwc50y9zPcghX7QexKumL/oDxJD5JY30y+1BJ5fdzsWDP3DhqW1lz2MybxaI80rhYUUZr+9mdT2Zzxa/FpiBNazjcvQ1FZIkLvQKgSmgp+2LPfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 05:38:49 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::d244:15cd:1060:941a%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 05:38:49 +0000
Message-ID: <86dbf286-bb0b-4beb-b26f-a74562b0ace8@intel.com>
Date: Fri, 28 Jun 2024 13:42:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Kalle
 Valo" <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <iommu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-16-baolu.lu@linux.intel.com>
Content-Language: en-US
From: Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20240610085555.88197-16-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To DS0PR11MB7529.namprd11.prod.outlook.com
 (2603:10b6:8:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7529:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b24fbad-50b0-48cc-8d64-08dc973495e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGZjMGtDOENNMHNCd0YyTHVmTUZ0VTlFYVdsOUQzQkZ1R1RRQTlaV2JDY08y?=
 =?utf-8?B?dEovYVhYT3JqcWwydC9ra0M5WFZQa1FMMG0xRDdPaDY2VGpvYXNqY1ZEUTVT?=
 =?utf-8?B?Q1oxMkdOTi9QZm8vRnkyYnJTZVltT2JlZVo1MDhIMGs4cUVBZEJwa2Y1S2wz?=
 =?utf-8?B?dy85ODlyTzdka0c0WURtajJ1ejJNeXlBUitLLy9yMEhCNno4ZmhiQWo0NjFu?=
 =?utf-8?B?NXJVOEVPRjlWTW5CZ00wN2kxTVRlTFl6TyswR3RDdEJqN2tLTkVwc3ppYTQ0?=
 =?utf-8?B?bUYzcmo3RDd1VVUwNDhkc2ZyMlBuNmVuMjFBYjUwNkxMQzNtQUVRbXBjcnFZ?=
 =?utf-8?B?clFNQzhDblZibXBoeHhoTWdhTzlvb3VnRDUwZWRDdEM0N3g0VmhBazBWakcz?=
 =?utf-8?B?YWFBNUNhb3dzdUJWbWhiemEzTGx3U25YU1kxcHo3NHhhUkU0VDc0QS94Mk0w?=
 =?utf-8?B?M0ZzUUJQTkhjTGoxbWpETmZPT1ZqR3cyTXMzM3hVTnBXM3YwM2ZTL0lRUUgz?=
 =?utf-8?B?cmtnb3NvSGlEVFVJS3B5QkxmNExiM3padFhubUIydnJzK0QvTnFvZEx0dmxz?=
 =?utf-8?B?Y1dXUTVrMjA2Q2IraUZpeitpMndqUGVGMkI0M1pnN2hjQlg0L3NLQkp5MFlv?=
 =?utf-8?B?UE12cyt6S2RBdWlQaGZKQlJKSFp2YWhwNWt2NFBRS1NoL0wvOC9PNURmYkZY?=
 =?utf-8?B?Sk9DRlQrTisxVjJJWHJqcFRuYzA2Sm1VU3pzcDBnUm5zaFUxck8rcmlYQ2xz?=
 =?utf-8?B?UWlDSDZqcjgzMXJ2ZXBUM1Y0dk0xeXhMcHJyL0pCczVvQUd2a01BVHhhQ3l0?=
 =?utf-8?B?dnRVSkpxblFSZUZXaGExNmsvL0J3TFZwZ2tjTFpnL1Q0TWFiSk1zMkhVL0Fs?=
 =?utf-8?B?dysxRXhVOXBmenNNYm1BQnVwTmozYkFOZFRNR2xaYXFhVXhiTmNicy9jaUNQ?=
 =?utf-8?B?Qm93OEFBaHBEMGMrTkZLNW14Y2hmQjVpSFBHeWhuWTYwVEIvUUNFL0RMZHF0?=
 =?utf-8?B?WTNXL3hMcXVBbGZnd2Z2Z2hxVjVoeUhvWkxpSkNISm1nT2VaaDI4Um1FOTFN?=
 =?utf-8?B?S3B4dVNaREs3WjlHY1dwbVZnWWlWSDVpdlJmYk9sT0J3c21sRjZKc0lEbGpw?=
 =?utf-8?B?cTdhZnIvR2o1OG5HOTBjb0VSSTBaRWVYaTJCazllMytyWW9JbTBkaThXSlZn?=
 =?utf-8?B?Qk8yS2RRdzdnM3h3RmQ0NUlBRUVWbVI2TE96YUFTUmg2SzI4emNnN3Y3K1l4?=
 =?utf-8?B?N0pxUmgwTlFtaDBkYWdVbmtDRkZ5SEdpWVJqWDJuSG54bnRjZTNPdSt3ZXFN?=
 =?utf-8?B?V2I3dFpkQ2dJakJXQWJGUnAvdzNTM3hGbkIyQXZsaS9ibWhJUDNqTE9mc2JS?=
 =?utf-8?B?WFMzWHhKenFsdHZYaGVpdGIzaExleERKT3ZCTUkrRVprakRXUTVHSzd4dFI1?=
 =?utf-8?B?QURxRG5JN3lzdnVxR1VZdXpjSFhibWRzMmV2elpXdVBWNkxxSUVvTzU0NmlO?=
 =?utf-8?B?OVRZem9oR0xXL0lNUEhtb3IvSzJOcXVSVXhHaSticFdCbGdtWXdiLzZPSmVN?=
 =?utf-8?B?amFPSVR4emlTLzE2aWVVNlIxVHBzcGRHck9iZHJ0UjA5R29KZ2dET1hYb2FT?=
 =?utf-8?B?QmFkcEt6N0I1bzI1VlFVeHduZmJ6RkxHSTJmUFdaUFhBc3FiTHRCVDhoS04r?=
 =?utf-8?B?MDJITHFxSXl6QUtad2FBQXBUVVIwc2Q4V28ySHZTUGRTbVhwRlFSNVVKZFlH?=
 =?utf-8?B?aU0vd1hYVEdJa1VUVkhmU1lmUHVQWDU5anpVS0Y1NDdTeExnbDZZeVhRUGpw?=
 =?utf-8?B?U3RtS3ZuTkF4TG9ETUVoUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7529.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZsS3VXZWNoaDBRbUM0cTlvQ3dxRlptTFFUSHpvNWdCU2pqRmMxbWxOUTJ5?=
 =?utf-8?B?ajlSbzNzdTRoQVU2R2NuMWhxQVhMZWtSRUdZcTI2cGZLQThhdWhVTHJDeURG?=
 =?utf-8?B?YUcrK25VWVhBNlo1d0dHTEYxYkdHbnUzNFk5QWp4d0dFQTZLU09Db2RKQzRU?=
 =?utf-8?B?NzRaWUpaak52a3JPVmlGR3dSZy9TanJDUFhCTE5ZVzJqK3pFcnhSRU1OdXd0?=
 =?utf-8?B?N3VSS0hhTlYxNlJDbzBkYnJxWFFOT0pFaFZ5c2dkSWRzV3R0MUdDNXRnM1I0?=
 =?utf-8?B?ZC94UWZGN0J0cll5a3NnZmM3UUR3VXZJTVhKYitCYno3bWdjdWFkNWxrTEhQ?=
 =?utf-8?B?OTg1OFQrN0NnTG9uZWJMQXJvVmEvSGU4QW01RkJOMjFGTEl0Ly92bWE5WEsx?=
 =?utf-8?B?MnQ4RFZaaWE0bFFvbUlvNlNHbmFZMEl1OWVSZ2dsL0dZVUpKeTJqNHFCZUxz?=
 =?utf-8?B?QnZ2QkVmN3NXeS9BUnA1WjhCa1k3VjJGQVJmRXBDQnRXODhOOUJCSWxyMVpM?=
 =?utf-8?B?M3pBaHI4RmIwZ0tmMGJPS1lqSXFxYkdnWSttOEhTcjJPOUhiNUd2cnpxN3E2?=
 =?utf-8?B?ZmNpWEJEMWgzUFIwYUxTd053eHMwOTNJMkJnZWFjRisxUk1IaUJiMVYzbVpP?=
 =?utf-8?B?NHNGSmVyZGNwMWRJUmxHSWljS2xsbG5XSGlFcFFsUGcySmFMaGpvaWcvYmgx?=
 =?utf-8?B?citzTGFPQlBJRVNvb3BlTkJIZ3ZQbWNLZTJlbWd2VDFLNVYrN2cvdnNvcCtB?=
 =?utf-8?B?THRuZ2xxVi8zNGh5akRTcFpTSjVwUWhpOHZ2cFZCWmFGd1VHTTBiamkyaFdZ?=
 =?utf-8?B?SHU4TmFRZ1Y2c0lTcEhHK3RsT0VZazRyMG0yamZMNWIwV2FBN1hGYnNzUUdB?=
 =?utf-8?B?QmRFaUo3d29nZU1HN2hERExPVWVYbTM3dVRWTTZrQkR6L0dVZkJiMUlvMFFU?=
 =?utf-8?B?QmNnaDY1QzlOMXFHb2xmWE9RQmpaeDhmaDE5TXl4K0R4RXprdGE4MEhyKzFn?=
 =?utf-8?B?QjJUU3Vjd3Q4ZDRWWG9BRmszdUVpOUtmWGZ3bmhmcTM4eWZFYWdkUHhMT2lx?=
 =?utf-8?B?TGpxYktQTGd2bVZCV2ErWUYzbHFEUjVSY1ljY3BMTnhKcFNSMWk3a3dkOG4r?=
 =?utf-8?B?WEkrSmJBWEV3Sllqb25KU1Faa0hSQlN0TGMyazBJK0orOVN3V0FWdzlERVJM?=
 =?utf-8?B?bFJwZktOeXQvRmdlTFBDUldpWDhYZ2NNdkNGb2xGWGlDR21BSlE4TVRMQ04w?=
 =?utf-8?B?djh3cmVEUFlBN3VWSm1QWUovVllGSHhOdUJnYVE0MlhJN2wwTDBzMUliSCtr?=
 =?utf-8?B?NGxVelg0TzRtTk8wYkRURlUyWFA4VlhMYmNHaG00MHVydU1wTXdCMHNkYlNl?=
 =?utf-8?B?Vll1aFZPNHNZODBJTWtXMTFJVnR4RGZaZWx1UStUNVFsbmtCbFhRUzU1ejBz?=
 =?utf-8?B?WFRQTm5OUjFRSDBPb1VQT1hzcTVxajBqSkhpdms1V0hNNnBSd3hySmhCV1lT?=
 =?utf-8?B?M015eDg1bldZdW1tL3ZNd0U3dUVaNTdZN1NVa3dQQ1pTLzJYcEIwRDJvZVZP?=
 =?utf-8?B?akg5eFkza0twTUtqMVdIZjd4VE83WE9VOGZTYVI5ZVluU0tVUFNSbnJ5dGp1?=
 =?utf-8?B?ejZQaXErTVVWbllLQUFCeDZXdFB0NnFmWFF6UW00SGxPYWFjRGdJVkg4MEd6?=
 =?utf-8?B?NDdxMTBKOWNNUjViR2VhZFJCMmwvUCtqTWxWRVozTmdUU1FtTC83S3FoL1dY?=
 =?utf-8?B?TW8rcXFFdDdWQ0kzd0xsVzhGNXQwdlJWNXhzeVZoOEhzU2pERHV4VytsNStT?=
 =?utf-8?B?MXl2KzkwdU94RFJwcE50Q1dodkZDSTk4K052SVFkT1VUT1hWTHF0aHd5Wlpq?=
 =?utf-8?B?S0FiWVgyN2dTVCt1UkFJeU1uczAxTzZhRDJMRlVDSTBNN0pROHRpbExTYW0w?=
 =?utf-8?B?WExqeFlUUG9hSHRVcTJiMGlEUnoxWVpwOHdJV09rSzR6Nm9DUzFKcGtNZFI5?=
 =?utf-8?B?U1lRRWMvMTdQMTR2TCtaUVp5YU1yb3B4WEJCN3ZBR09jcTAwZnB5UjNCVU1l?=
 =?utf-8?B?czdHRnh4eTJHTkFibU0yQlhzWW90bWIyTEgxQnB6aW9FajFMbWFyVjlQRERF?=
 =?utf-8?Q?LsCVlIeH2PmahTpU9+brdv+8s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b24fbad-50b0-48cc-8d64-08dc973495e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 05:38:49.2141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udhyw9ZadozxLHZLXJSTQwV/olWwA4PUjOBJ8/AjKq7KLRkJ8tHRhH8Q9eVs/6q6jnDcE64urnVx0bcy22tcrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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

On 2024/6/10 16:55, Lu Baolu wrote:
> The domain_alloc_user operation is currently implemented by allocating a
> paging domain using iommu_domain_alloc(). This is because it needs to fully
> initialize the domain before return. Add a helper to do this to avoid using
> iommu_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>   drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
>   1 file changed, 78 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2e9811bf2a4e..ccde5f5972e4 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
>   	}
>   };
>   
> +static int iommu_superpage_capability(struct intel_iommu *iommu, bool first_stage)
> +{
> +	if (!intel_iommu_superpage)
> +		return 0;
> +
> +	if (first_stage)
> +		return cap_fl1gp_support(iommu->cap) ? 2 : 1;
> +
> +	return fls(cap_super_page_val(iommu->cap));
> +}
> +
> +static struct dmar_domain *paging_domain_alloc(struct device *dev, bool first_stage)
> +{
> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
> +	struct intel_iommu *iommu = info->iommu;
> +	struct dmar_domain *domain;
> +	int addr_width;
> +
> +	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +	if (!domain)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&domain->devices);
> +	INIT_LIST_HEAD(&domain->dev_pasids);
> +	INIT_LIST_HEAD(&domain->cache_tags);
> +	spin_lock_init(&domain->lock);
> +	spin_lock_init(&domain->cache_lock);
> +	xa_init(&domain->iommu_array);
> +
> +	domain->nid = dev_to_node(dev);
> +	domain->has_iotlb_device = info->ats_enabled;
> +	domain->use_first_level = first_stage;
> +
> +	/* calculate the address width */
> +	addr_width = agaw_to_width(iommu->agaw);
> +	if (addr_width > cap_mgaw(iommu->cap))
> +		addr_width = cap_mgaw(iommu->cap);
> +	domain->gaw = addr_width;
> +	domain->agaw = iommu->agaw;
> +	domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
> +
> +	/* iommu memory access coherency */
> +	domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
> +
> +	/* pagesize bitmap */
> +	domain->domain.pgsize_bitmap = SZ_4K;
> +	domain->iommu_superpage = iommu_superpage_capability(iommu, first_stage);
> +	domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);
> +
> +	/*
> +	 * IOVA aperture: First-level translation restricts the input-address
> +	 * to a canonical address (i.e., address bits 63:N have the same value
> +	 * as address bit [N-1], where N is 48-bits with 4-level paging and
> +	 * 57-bits with 5-level paging). Hence, skip bit [N-1].
> +	 */
> +	domain->domain.geometry.force_aperture = true;
> +	domain->domain.geometry.aperture_start = 0;
> +	if (first_stage)
> +		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw - 1);
> +	else
> +		domain->domain.geometry.aperture_end = __DOMAIN_MAX_ADDR(domain->gaw);
> +
> +	/* always allocate the top pgd */
> +	domain->pgd = iommu_alloc_page_node(domain->nid, GFP_KERNEL);
> +	if (!domain->pgd) {
> +		kfree(domain);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
> +
> +	return domain;
> +}
> +
>   static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
>   {
>   	struct dmar_domain *dmar_domain;
> @@ -3695,15 +3768,11 @@ intel_iommu_domain_alloc_user(struct device *dev, u32 flags,
>   	if (user_data || (dirty_tracking && !ssads_supported(iommu)))
>   		return ERR_PTR(-EOPNOTSUPP);
>   
> -	/*
> -	 * domain_alloc_user op needs to fully initialize a domain before
> -	 * return, so uses iommu_domain_alloc() here for simple.
> -	 */
> -	domain = iommu_domain_alloc(dev->bus);
> -	if (!domain)
> -		return ERR_PTR(-ENOMEM);
> -
> -	dmar_domain = to_dmar_domain(domain);
> +	/* Do not use first stage for user domain translation. */
> +	dmar_domain = paging_domain_alloc(dev, false);

this is not an apple-to-apple replacement yet. You need to set the type,
owner and domain->ops as well.

> +	if (IS_ERR(dmar_domain))
> +		return ERR_CAST(dmar_domain);
> +	domain = &dmar_domain->domain;
>   
>   	if (nested_parent) {
>   		dmar_domain->nested_parent = true;

-- 
Regards,
Yi Liu
