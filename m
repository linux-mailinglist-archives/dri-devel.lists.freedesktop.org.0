Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F8AEF081
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E982F10E523;
	Tue,  1 Jul 2025 08:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlDLAVAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EB910E521;
 Tue,  1 Jul 2025 08:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751357273; x=1782893273;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/zdY2GIxQQlnvBMHfz1raX8NidGojBNZcZFC2IpDJqs=;
 b=HlDLAVAp3GrYpJkznKZM0mhvl9N45cgoIyT+Y6VdIDTCuz1MvHoVc38B
 mYz3cUMiZ5UnsJTxmeZ09TEgP2xNxSDYrKiWXh6q5TsWC05SWqzJ5yf2y
 Wlwt4E/Wp2DHC+8OV2nqWBIsoOiRLq2wY713vQ/NIaukH3GulLMS1fCXq
 jwm71rc6sw4X2FRbgPadp9o1+XAiqpJJOSwRV3wH/xC1jy5ifULSYp8X/
 QbX+c8IW4JstLDCxnJKMt93awcVjv54QoNpTMiMikuRE4dQbtHqGuIqv+
 ZVNVKNamhJ5pn/jzLjf0Dk9NaE3zJ4eCeWzR7i5GB7azRCRzzC/E4tPcL g==;
X-CSE-ConnectionGUID: 0DohMsO7R8+L7WDpTmowBg==
X-CSE-MsgGUID: 69bPtB7mRrSAE5KDXzbehQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57412482"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57412482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:07:53 -0700
X-CSE-ConnectionGUID: C9Z4rY2NQOqkoslqEUAzzg==
X-CSE-MsgGUID: 2ebihP53Tcq5mpe/Sc2wcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154409465"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:07:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:07:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 01:07:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Edl6EEVaiTWiGqvkxXsgYJkyGbTU7i22CF0WLZMr8hl6MymwylfDZ6pXKa4Db6cWsONbc8UNi67t4IqEFORzjs4bA0O5v98a0vt5ZSeeZnr+Kr93M+zSwXsgvikGc8GeYws0AjcV6GfC/PE05DS0I11bPgmdwO0BcB1XLGrgJ/SadQeHwC4jQXPs+pceIItDkrJVmQWya6O6anfwsF3fbL16Jnki5N1sA18d081Fe1ROT4uiXOCqctSdVwdMQBydz/8QEp6tRQT1KUfTjITk69JaSySPPVCP4+bn9Qx3hIycKEqdWAAbWPSr+DzGPlimkuwhKYDhYSegc9PEDhPzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtHx5RSGnkoJoh2HA4TDGM6fOen8bCWkdKl29+LmHpc=;
 b=xFyAKZhJjENO7nG892SD/SM0T2prY4TxjEh4gYOed7PXHe1gsbPMumy8rC/5MQCV+26TvlnB+PYo0V7QzRBLeu8CYIwWJJYXvtvpzOnB9Trcq5p7QFwiLvE49KRpJZFXgbc0pVubOmLI6PFoZ4Ajf9USH2GfCqW8nyYNiZJehumjRaE4MVJAOvFoKTJZCkvW9cWhBWKmMNJdXVG020xjcgrRL+zE3Y3ipp5/6WKG4CJXjIFqgeti6Laub/3FRSdlHmZQk7OfLA87rFGjR6v8iEWMrUp49yrXGc2xnzZEynYefsNamWUA4J8lJ1H0xvNZt1xiDwYOo+RnGVdC9CbdDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 08:07:45 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 08:07:44 +0000
Message-ID: <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
Date: Tue, 1 Jul 2025 13:37:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062808-grant-award-ee22@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025062808-grant-award-ee22@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af210c4-02b3-47cd-b625-08ddb8765be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1YwK2hVL24rY3h3L1hoUmtnSTE0YTdrZytRR0pIOHBCQnhpeis2em1HTVNW?=
 =?utf-8?B?UDc2aU40eWN3RjBuV2JUc1R3SE12M0lWN1BjeDI2TzdOaTlkM0wveWpDNmNh?=
 =?utf-8?B?M21TUXREK2dzNlRsWUhWYnNwRWp0Z0Zmc0JLa3lvMFlCcS80SDBkMnhzalFM?=
 =?utf-8?B?QUhCNWVINWNkc3lUMS91TU5hNlJMSzdHaTZvNmR1VTMvV3k2TFQ3aVBqM1Jy?=
 =?utf-8?B?VWRvOXVwN1AyeWxQTnJYWWMyU2lyU3B1MHpyRXNXUWhhaVQ0a3lMWEF5ZU1q?=
 =?utf-8?B?eWsxdndvNE1aRk9wK1hkN2V6QktQNkZSQXR6a2EvbGs5ZFY1VG0zcEZxV2xM?=
 =?utf-8?B?L3NaUTNaTmFsaXQ4VnVOSVVuQkI2N0NQRGJYY0owd0FsZXVvNDlwNnZvWjIw?=
 =?utf-8?B?RXBxMXhDc2hiSW80SEFRMXJjb2UxOVNxTHByWE44RzNOak1IVUZ6N05PTTB0?=
 =?utf-8?B?ZHU2K2owSDFHUk9WdjJXNkVBdjlkODB3dXV1RzdHWDgvWWlscFljVFlDTWc4?=
 =?utf-8?B?ZzROOXpUdjlVZDNrZGFySXpCS0Fpc1BZaFJyR3cvODRaaThzMlBVMGRhWWpG?=
 =?utf-8?B?cERBY01qUi9QVWk2MFNHbUNheWtDZEZsYnZFSnA1UEp0ckx5cDB1R01xcHhU?=
 =?utf-8?B?bHRyMTVSU0w3U0FDYllzN0pJQVZEWlowM0FmbUliTXNVWU1BZEJCRHlXc0pH?=
 =?utf-8?B?N1ZkTFpsMm1Tb3VRTEkzcS9QMDJnNGtiVjNqa0IzTk5Gb0RKUUMwOHI5NytU?=
 =?utf-8?B?THFjQmJJV3lFN2tiOHBTVDcydklES3FBaEhqTmRHWk9CQlk0a0RJTllxVHIr?=
 =?utf-8?B?UVpabWE0UlFQK2pLZjd6YWtYelRVOWxXMEs0Rk5PNk9JZWZja2FvZUN4MVBa?=
 =?utf-8?B?dWxxVTVrYkpqNXZoNGFYZ1pZZ2ZzNE0xSXE0NDBIZkxtTzJaTDMwaGEwaW9X?=
 =?utf-8?B?T2VqZXFDbmlCTGJTTE5FdGlNUjA0allqT2Jsck9zWWxWNTdQeFBEUHBmUWJ2?=
 =?utf-8?B?TTU4N0hjbFQzOVZSRUt0ZGVkOERKRFFkZ3ZJQWZESEZYOVBGWktWK1RBMHU2?=
 =?utf-8?B?VlNreUxNU2RYZTU5dlFBaGl1bkFoaDdPaGFXSDdlRW1XUnR1SERFeENmT0ZC?=
 =?utf-8?B?aXNBSG1ZWTRRTWhVNWFQa3A0OEdGZUZIMTk5ckk5K25LaVU0bGlhM21WV1VM?=
 =?utf-8?B?QWJJZXZqYmNJOFdzQjNENXhHaC9PempTcDdCa2hzNWFBSmNLR2tyT1BBVEVP?=
 =?utf-8?B?QXZRWjVhQ3pVUzl3Vlh2UURBY3BqQW5Xd0lWVFJ0ZDFPT1BUVGhaNjNMSVJw?=
 =?utf-8?B?NjZUN0p5VER3eVNrUkNmWm1WNFl1b3paSnRhbTlWYXpwSXRBdVJMSW5tUjl2?=
 =?utf-8?B?RlJpWTJ1SG5rOERYSzU0bzJtR1A2OFM5RjVVazV2NEhLbmdjaXBtVEFLL3NW?=
 =?utf-8?B?MEVGcWo5bzluNlQybUZMOTdtQlNsZXN2RXN5eE0rb0djeVhhZk9oeGpEM3d2?=
 =?utf-8?B?a3VTcDYzVWhRRitYVUJKUHkrU1VORjNrTEpKVTBqamRLVjVZKzN0dlZsLzZv?=
 =?utf-8?B?NndDeVBQQVAvZ1d5bWdJVU14bEpDQWJ1NzZxaDlwYmY1aDhKblZ3YkFrWXNO?=
 =?utf-8?B?dU1IUjU5SFZrSm0yY1ErNjBTMVZrNlZhYXNibGs2aVp5U0M1ZEhlNUg2Vk9R?=
 =?utf-8?B?eHZWTjdoNFo4TFJFRzBpcnJVN2JLSXljUXNNdHRqTmE2aUN3OXMzeDVZdldz?=
 =?utf-8?B?M3lCKzNWUS90cDFBZmNYaWZLem5BQjMyOHdOeXRrazNkNDR0eTdDdExCQUdy?=
 =?utf-8?B?ZzhvNnBUeW9PcENpZFRJUkJuN0dOSkVYZDcySlpGRUR0bS8rdXJXVXVlRk5U?=
 =?utf-8?B?dFY4Mm5uVGxyUTFxZVdYdDQ5KzRsdXJIeUVIRVFZL2NPRTEzS1FDR3Q3Nmt1?=
 =?utf-8?Q?sbuW5CyL4ZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0czemJpY1JsUTFmL2I5V2lLM0VaeXpCS0FnNW1hckF3V2xiMzJneXhManZU?=
 =?utf-8?B?MXBIWlVpb1VwU2lTakdMNEVPRWQyUTRnMTNidzFCNlBwbUtFeW9pd2g5ZStB?=
 =?utf-8?B?eWZuZEh0ZXIrdXozdmROZXVXTHgwMm5tUEJyamczL0J2dk85MU1kTWlrUkN1?=
 =?utf-8?B?c3hkUS9nL052RDlxcEx5NWtTa3I1YTJKZy94ZTJIcVgvdVNWZDVBc3JLYTJ6?=
 =?utf-8?B?MitJTDNzV3lqR05pYjB4ZkRDMTdiRlV6RElyUG80QTNtQktkOXhmd1BlTnlM?=
 =?utf-8?B?Ly9KK0Q0UVNkZlhrS3hVL1draWJseG91a050SUVFRUdsTzVFWmMwUVI3NEV2?=
 =?utf-8?B?QWlMMGIxNUZrM09RVmZBT0tqUzFyZHl5dWJudWVSR2hOQ3FqMnVYM25kOVRi?=
 =?utf-8?B?N0lwZzBPYkFvTVpUWTBkL1kxVXdhQW9CeW1qSUNjSC9aY0JiUzFiT0Z5T0Mx?=
 =?utf-8?B?bVVHZWtJWjJQS2UyWEtrc0p0QVRINGIzSUhYYTR1c1diazBySEVyWldmSzIy?=
 =?utf-8?B?S2VGYU12U09TZ3pnVndmS0N4bm9kZjhMMm1PMy9waHVSNGMwdFFFTHIxMFdU?=
 =?utf-8?B?c3JPckhZdVFxY2Y1MHRJczBmNlpnd09CTG04QWxqNzF3b3YvSzJ1VWFzbnBJ?=
 =?utf-8?B?am9VelhkRkFKcEZUaG05MTdOdjBoNm1weVp1M0VhOEFwMzgxT3hOc2xLVlNo?=
 =?utf-8?B?QnVNYmo2RnE0VzhpL2pNYytRaWdtblJENnZKamlLM3I0QXF2a2JyRERiV044?=
 =?utf-8?B?VzJialRNZDRXNnJjem11SE83eTlwVmphM2pWcVZxRUM0dW1KZk5WdlFpaXBU?=
 =?utf-8?B?dXVHT2RzTklva2gxbmlBbkhRZEFJMWh3V2J2WjN4RWVWdXE4bG9kR3dVRjRX?=
 =?utf-8?B?ZmlRUnlsVzVwcllRaU85QkNIeWpZUVRXQkQ2RjF0bHNEU2xoKzY1NkxmQWV4?=
 =?utf-8?B?MUl1enl5N2twVFVHNGJRcUJXUVliN09SbFNCVnJwanNMRWx1eTdCTWRENzJo?=
 =?utf-8?B?MGpaQW1RZm9TZjcrOHpkMnNKeVkvZ0wwUkpFQmt2RXB3Ukx2dmx6L1pWMk12?=
 =?utf-8?B?RTVtVmFSc3hob2VXMTdhTDB1bjRkb1dlVEVFOWNrUXh3ZDlYR3hTUENnclRy?=
 =?utf-8?B?aFlXUVpTcXl0d1NUR3I0WkFQT1JiVlpXWW5vOVJ2d2dIQ3phN2w2cXlpODlq?=
 =?utf-8?B?TERyYmZpRVBBV01sWmlQWlY1UlYxOHB5VFQvZmhXZXgrNDg4NkczWjgwV1Vz?=
 =?utf-8?B?dEhKemd5Rk9ZQUpVTTJtSlhTNVJub3VoeE5lYklHSUU3WnpJY2ZyQnpVZnQw?=
 =?utf-8?B?Um9qZEZlVHQxTTVwRDdGNHI0K0ZTSW4rL0pJbFYwdUNLWnVFa3puWEpuZXlI?=
 =?utf-8?B?SFRLb3I0Zys4clg4VGFSRkxIa05SMGlPWGJFVDFuTU1SdVNacGg4dWd0aXdV?=
 =?utf-8?B?MUFiU0U3Wk81eU1XQVZOdEpqSlloaU1ka1Z3QlU1Y0s2T3lYV1RuQlFHeU5j?=
 =?utf-8?B?NlpUbmxMS3ZmOVFCQ2pCems3VjRIY1RZMFV4eTVScUpabXlDdFcvZ1dKUHVL?=
 =?utf-8?B?ekpQRlAzb0Vaem9raTRxYmt2YUF5SHJXYUZKQWNacmZxdXoyZVRIaENOUXpx?=
 =?utf-8?B?WkxqNFJVTnprNlFFdmJXWkFpckMycFBuRnJrY2xjdUNmL0FzL2ZjMkJUT3VI?=
 =?utf-8?B?K0ordWVqZEhpWTBNYmRMTEpqYURzZHJRVVRtNWt4MXpObDI2cnFITUZLQ3FB?=
 =?utf-8?B?Mkp5V3dYUlAvekl2SFgvNzlRSHB5T29TTjNBK3ZFNG1aR3UzMTVBUi90YkJI?=
 =?utf-8?B?MWtIajBaMVVoU3luVjdaWlN1K2g1Q1JjZkRjQktuWEtFdFpNdGpxa0lHWkov?=
 =?utf-8?B?UUpuWXBISUNrZ01pdWJucUJrQnAreDluUVdMV0hueWNNYThoMlpzQXc0Q2Iy?=
 =?utf-8?B?NnBxT0hTalB5a0taeWtPZ0gyNDFtRFpOam5scVpqaUNZYncwK0hQSkxKVUYr?=
 =?utf-8?B?QlJiTGl1UEJJZEJqZ1dqaGVOaVlmdkphT1F3dnFzaEhDcGpjWlZZZkVtcyto?=
 =?utf-8?B?RUoyb0pGVGJvOVpyRHVDYmtXS1N4MlFDRUlIZHVUVEEyeE1jY2xGZUJnamRa?=
 =?utf-8?B?dDljblRqUmhSNG9xekVWTDZXVEtWUW9mVUxCSTRERDdXMnljd1cwcXhYV1Zl?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af210c4-02b3-47cd-b625-08ddb8765be9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:07:44.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5qwGjQ0SqLJl0DKt8keVX8J893/WOAVd8oNkH0ccMpr16fuqzupPVjgKJ5PILAuRXSKt7lbuwMjo1ysBeJlkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
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


On 28-06-2025 17:49, Greg KH wrote:
> On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
>> +/**
>> + * struct late_bind_component_ops - ops for Late Binding services.
>> + * @owner: Module providing the ops
>> + * @push_config: Sends a config to FW.
>> + */
>> +struct late_bind_component_ops {
>> +	struct module *owner;
> I don't think you ever set this field, so why is it here?
>
> Or did I miss it somewhere?

It is set in drivers/misc/mei/late_bind/mei_late_bind.c

static const struct late_bind_component_ops mei_late_bind_ops = {
         .owner = THIS_MODULE,
         .push_config = mei_late_bind_push_config,
};

Thanks,
Badal

>
> thanks,
>
> greg k-h
