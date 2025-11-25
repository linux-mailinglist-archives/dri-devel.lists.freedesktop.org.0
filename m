Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48241C8572E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270B910E414;
	Tue, 25 Nov 2025 14:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVfBdKRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6A410E2A4;
 Tue, 25 Nov 2025 14:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764081506; x=1795617506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=suhiYgwgjngTIXOXxwLbu/npSzxPM5guptkUZ0Z3sBg=;
 b=kVfBdKRceLXIRIRV1afkRsbjLzFFNzUZCYEUqIyCcHI6BfxFiTdH06Ks
 wjWMbnLukvcxv8YWisneWAcacdD5szFr295+Wor9Bk8UDu6cin8QSNrKl
 Acsex8fK5wkN2UKjorxnFb3Jdp5wI2Q4M2B9UlUfagMBPWPfZKtpAX7Ux
 A2zebwHl7CpfpMrkhV8Eu/dIzvo4qd5hjxyXbi2TqTwZVMw2RbLHaJPXt
 UMfTMQUIf+wGfB+fvmNirVyv3dwLPggNm5MV+X+MYlFsRMSIS/9fyTh8V
 i2rUCEklC38t/CtIRz2j78LpafLQOZSFWCoFpk71j5Gco/0psyRP50EA4 g==;
X-CSE-ConnectionGUID: ciRyuwTOTxSNZBMY4wZI3A==
X-CSE-MsgGUID: dTeEm0oGQGmbNgN1NbajNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66144006"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66144006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:38:26 -0800
X-CSE-ConnectionGUID: OkIz81+5QAmB4PSVqwvplg==
X-CSE-MsgGUID: JRgghTAlQDGwwx9lltssag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196813989"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:38:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:38:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:38:25 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:38:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/IKstBrmY3MUA5RsdaJ99iC4noX3l3terPlW2rXEi5isQZkLf1jz+baWF4/TmYSjTxFt8Mor/+PF1UPl987mE+Y+49F5fncLJyC0J4SCQbMA8flMThMhBfbcWA8RGjib6VHT6y3NAOMeY5lk6xeNFp7hEUhIr+zYQqBNanagtk/cECZAIhTFlMREeLFkIpHZyCQzg8JDwPtDOYoO1CEm6rSg/YKxAKxDTQibpl4Bsbsyeq4u7ubT72L5r7f/VE9CSHx+5TRm/9WrLaTSRM3wZ3kW3SNqxNXKlN8Q49NSC5J5pzoJamTm1CHN3Fu2eQW1zMB5Ccvisx+j7Cj5CbIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blq6Tsc1L5/Uyd/Q+A0+oGSn59Qn0j+ArZF8wtmj86M=;
 b=DcpCLBQHEHyxorExAyYuvQu5rzRMwSjFMXHJdCTqo+YMDEm70ESdfEpJMb8G7FhshFda4ueP9YUI1UJ93eHYDvmmqUtZY/wJyeL6kuadmIHBt/Mooyh8OH1ZkTKROAXtcKKJSqpGLxESxik5kB+IoNGkXpq9hrXPeOJ/NlGwe6aSH1BklbfxXoXBevBDEgG7Z61fMtiE5EBhAeGPH6QsX5G7/br2WqiRL8s570bnht2QW7CL+sijOWjwp/29s5WGeP1KR8WKAKpFhbAzDHU2QGg94vCRwD5dxpOvRV5ijalwKNK3OZRh4vH2FqGi/ZyiufaOrP/uz6aINCbuWfGWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 14:38:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 14:38:23 +0000
Message-ID: <c4ff85ca-58fc-4f96-ad6a-808ba06c08fa@intel.com>
Date: Tue, 25 Nov 2025 15:38:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/pf: Export helpers for VFIO
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
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-4-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251124230841.613894-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 440260a9-118d-48f0-4af3-08de2c304914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHFCOXJvN1czbmhNZllYM2oySjFxbHR3Ym1SREVjTXc5cnVDZVpTZmJoZC9u?=
 =?utf-8?B?dDY4U2ZhR0dNOTlEbEkwd3JiYWVmSmdvKzgyam1Vck1IWlRJQWd0STVPUnVQ?=
 =?utf-8?B?MVA4YVF5Q2ZYT1Y3Z1d4MENqS2ZPN3hsNDJHUWN3a2g3SHMzOThWZExxdlVM?=
 =?utf-8?B?U2ZCMUk0aVllOG5oQ25NUU5hTE13bWdEcVpUVzVNdEtLWVM4ZzlZcTVIUjFN?=
 =?utf-8?B?b3BEeUJ6UUZIeXc1YXdQa2llM011Rk5maFJJSG1CM2R6RkhXOGg5emc5VlhZ?=
 =?utf-8?B?TmxKL0FNcG8vWGF4UFovdXNzRmdDUG9tS21tam4wbjllU2hGTFhvVFdDNm5U?=
 =?utf-8?B?OFFqZFd5VGNuTWZsUGZnc0Y4M01iTzYyZVljRTJ2MUlxTE5FN1lNZlUrL3E0?=
 =?utf-8?B?OEQ0cDF4dC8rcVZCL2FWckNZM2c5MFRzSWYxMGxiQS9MZURvUm1qeDR2c3R1?=
 =?utf-8?B?cjQ1ZE1zMGhVbTdaYzY3NkNLRlJtOFBIV2tLS3djUFpvTjVlQjM4WFpWTzNt?=
 =?utf-8?B?Q0NTR21NOWFwVWhHOFVtNWlGTW9TbW5RVG9UNHlXaTVJQUxZekthOElFOEN0?=
 =?utf-8?B?ejNTVDN1Z2hBTm51L1BYSVpaTHp2L1djSENhQTc5QTNrUmVuTnJEM0wySEJT?=
 =?utf-8?B?UnVKYzdGbHp4cStaNHR3clpuM2NNUTlDQm5DTHE3eWw1YXFrcHlROXIxNkVt?=
 =?utf-8?B?WExGQzcvbDZkM0lKeUxwYmFBaW5sMm12ZzVVaXJJQmJVUEtrV3NWUVNndGw4?=
 =?utf-8?B?eHpkaFNER3lVV21MZWNYM3JwL1hoWDJJdUFVKzBxNU5VYlV4T1JtYkg4TnBG?=
 =?utf-8?B?ZmQrcUEyL3VHNE5BeFFocTlxYVhGZ3NlNDNlQ1Vpb0RyeUczVzVWd1pFT3h6?=
 =?utf-8?B?b2hob1pLZlMzTm5WTDFmZU1BcC9EcDNVWXNGRFcvU3dsYU1pVUNGTjJnNWUr?=
 =?utf-8?B?TDhHZHB3c01odGFZTzBQMTRYVmtCWDhDd29VOFpvMldoc1BZS2QwMlp2RFcw?=
 =?utf-8?B?VUp4WCtBRzlzNW9ROVdlTThaeE1EbEpkZXcwSS9TNWg5S3pXZ0Y2UEkyT3NC?=
 =?utf-8?B?aUF4V1BBWURQYVRQRHZYekgxdnN0MjV3WVNIK1BUcVJCMlpUZFRtbGpkUXdr?=
 =?utf-8?B?dVJQYjRiL3JtUlBXeWQ5aTNkVlFadU55WEQ4OWZybXdvSjRQQjlRdkpIS3R1?=
 =?utf-8?B?MHpaSFBwcHZkakErV2dtcFd2WW4xTktmaVZqaE0rSEVpQU4rMUhlLzBIdGJE?=
 =?utf-8?B?d3ZVNDNDSzFiOEFUUm9aWTNYdnA3bHdqVU4ycjIwKzdPSXVmeUJyUE5FN1B0?=
 =?utf-8?B?Y3pWRWFnWnJobVFVaVZNMm03aG1CMHo2eE5XUkpkellyTjJCankzWGVEVFAx?=
 =?utf-8?B?OUp4MDZYOHZBZmd1Z3RGc1JNRy8xWC8wU2hPUi9kcFh0M1kzVzl0Y2tKbTVr?=
 =?utf-8?B?WVV2UEdkTVRINDFhdmIzQnN2bUxNZVpwZkc1Rk1oOXU0RDdHZkxwOTdkZkhP?=
 =?utf-8?B?V1BHNU1JalNPUFd0eWcycjJGWWFYR2NSK2FmbzJ5MldrREdVVnhnK012MXZO?=
 =?utf-8?B?S0RtSk8zUzBXcmNhSytUOUlDd3A4NlcwRVQrZi9ya3lhY3N1ZHd5b1RGbjV0?=
 =?utf-8?B?WmNtbi8wUlV3eElmY0tyd2Z4QjNYUlh0M01FSkNKMHd0c2MwMWFtYVF2KzUv?=
 =?utf-8?B?bEk3TVBncEhvUEFTR2wvNGRxc2Y4VnVXVGM0RXBqNkJzV2lDSS92RC9vZnFt?=
 =?utf-8?B?SVlib2Y2cDZDU2FtSjFrS0lCc0JMLzNSRVJVcCtZUG9PTSs0VzZqbi9VaXpP?=
 =?utf-8?B?Q1EwWG1JZGJrT0tITENweml4VDVwS2pJZVU4VVdHTGtFeFFyQUMvRjdaZERp?=
 =?utf-8?B?TWpzYmc0R3pkWWl6bDhjdk9YaVpaQW9HTC9kZC9uUDJXYlVEMFNxc2tRV29Q?=
 =?utf-8?B?VWJvOXpYR1kvSFNEeHNLN3ZGVDNLOGVISlU5OG5ORWZTeW9Rd0IyQ2tzUmtO?=
 =?utf-8?Q?/YXDUcCTuKz99EXQTDBVLJwr8BNoBg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdLaXhjejJDVTBkRTRLMHFPb1I1RlpFaFNiT2IzdE5YMmNiN0VBYW9takxX?=
 =?utf-8?B?SmUvMmY5eStSWlU5TW82SVc5YjJIa1RZbFJzV2RoTVZFNE0zZkJTc1Q0TUFM?=
 =?utf-8?B?dmZ5MzhabTB2ckJ1WFUxNkRwd291bVkzcEZXNjQvcUswL1J0WHh5NTZGcGs5?=
 =?utf-8?B?R3I0ak9LYWZFM25kcjl4SFBiRG5La3lEQ2RQeTNBL29LNlJqTUI0Mlc1dXpC?=
 =?utf-8?B?cGNHR3FtSkxiQ2xtTHlXNkhlS3h6c1pLN2VQTUxITEZzLzVLaDF6ZHBJV2VO?=
 =?utf-8?B?azhqcjBuRGhwOTdGQTdNZHVWYU1kdzNJVjVsOXF6NXVVbWoybGtrUXVmYTV4?=
 =?utf-8?B?N0VqUkdCTzQ2ZzdIREFJUGVXK25qS0dMdnNybXhqTVNiNGNwUldqWk5wbU56?=
 =?utf-8?B?K3ByOHIwVFhKNWI4aldkK3V0bWtibGhveGtMWWpmTi9WSUVDdzc4RTlWYVBv?=
 =?utf-8?B?cXl1RVo0TkNoTG1UZEhjeGgrKzEvUmhuWC8vWWIvWUh5ak9zajdaSXdqdmtP?=
 =?utf-8?B?MFVXUzdaOHBwcDRYaTVyamU0TG00UVZ1L21DYjZhNDBxa3QyaVVzayt5d04x?=
 =?utf-8?B?R0E3ek5NREk3OHRod2E5WERUUGNPNGl3Rk83Z1Ayb3VXb3NsT3hiWURVT3FN?=
 =?utf-8?B?YWlJSXJKWU1JR0czV0JRVys4eE4yOHZvelE1MGtWUkZrL21SSHNuSnlKelR5?=
 =?utf-8?B?LzBZNllDQzZjU0xtUS9ENng4NXlwY1FpTXRYZzB2b2dRbDg0Z1luelVZV0xr?=
 =?utf-8?B?NTRlNElhaDFJRmhQRDZuWHlKUDVWcnk4eStpYVkydVM5UHYvdy9LOVM1SmRx?=
 =?utf-8?B?UG1nR2twMEtreTY2TEdBR0wwKy9VaUxubkc4WGxkb0d6ajZ3TklnU1lTT0Nx?=
 =?utf-8?B?Tk1acXpyazc4NkxYNGRyckZRa2plZ2tyQTl6UzdPOFdCSkRHekxLbzcwVUhP?=
 =?utf-8?B?dVE2Vjd1TGYvZUlRMEIycnpUR1gvNVBOREJ6dXRyVTdGbDVib1Z6dU9pbTBW?=
 =?utf-8?B?ZWZmNDcyQ1V6eEJhSldEckplb1YyM3c1ajc2QXM2Y2dlRFhPeFp5aFRRNGxM?=
 =?utf-8?B?UlhiTkMyTktFWGNQTTVneVRNY1c5UElTeE5ua2R3LzZhcVZrcUhXZTdmaWpI?=
 =?utf-8?B?cEFidHZhNi9mbXZUZHdWd1BJM09IYXpJd2ZtM2R1UGRwQzFkZlFzMFBsT2Vp?=
 =?utf-8?B?R04rTmNpRkxiK0Rxam5jWWdTYjJXVTNJenQvWHBJWU1kWVd2Tm5ORGFudjJ2?=
 =?utf-8?B?TFBuMHZLMWlncFl2cWVlUTFNbHlWNVBhRWZ2eWxHTFFYZm9zc3U2UUUwekIz?=
 =?utf-8?B?bW1NOHE4aExoVWs1TWlGRkt2TmFWWGluQmFQYUpPcmt3WlhLZi85L1A5dHdR?=
 =?utf-8?B?V2p1UURPVkNic1dybzByRTRVaWlTVjVxcCtnYlYvaEF3azBLZnRyNm9SWHN4?=
 =?utf-8?B?Uy9YYUN0dUw1NUJobW14VUd0K09iNGFMSXhiOGZwRERHV0F4MW4zNjdCdXkw?=
 =?utf-8?B?RVplc1FsYXRPZUhRVUR2QVJsczBIQUp1cHBDcFVCMzVuYVRhYTVjRElDek9q?=
 =?utf-8?B?MnRrVHVzSXMxdm15V0hFVTd3NGlaSk9nTnJmVm8wOGVocUF5NWdVQVlNMVBj?=
 =?utf-8?B?NFVsTzdsSDBocXlWcnVISTI2NWEzcDh0UlN0Zk42dUJIZEJaNEhxc0xMNHYr?=
 =?utf-8?B?K0JnKzB4U3llVk14ejBDTmFkRmtNSkxlaVd4R3VkUkFBTFRXUkREVWVIYTZY?=
 =?utf-8?B?WHdaTWxKVHpDcDhhZWRnelhIZVBycHlBK0lvbERjcGR6N2lISi9td28zS3dN?=
 =?utf-8?B?cTh5UUNEai9aU3lCd29Jc0FzSGtDdnVnVUpRRlh5T2hBcE5MbjBKS3lNck5p?=
 =?utf-8?B?TWRlcGF2VHBFMXZiUGU1eHRHTldCdnVleWNiUGJmRk5sWGRNdzJzTHIyREd2?=
 =?utf-8?B?ZnYybEErYTVNY1IvTm9acmpZOW5RMldpYTM0RkNzSUV3Q0RtcTR6ZUFtbGJL?=
 =?utf-8?B?WDRtZStESlgvajdxcEI2ck51NXpmVmZGcXVpNEtnUk1RU0NrenJWTERsQmNq?=
 =?utf-8?B?ZUdTb0tVbHo5TU91MEp6cEduclR0UlY1VnpYNkd4OEhOa2VsSUoxQ2MxajBr?=
 =?utf-8?B?dmFmOHdQU3FTS3NnWExqUGpPSThqMGUvZ3ovbnJVY2RTYTRFbzU3UXJGdHNE?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440260a9-118d-48f0-4af3-08de2c304914
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:38:23.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqnnqdJfXt/8KIPd6VGZo5RcyYvYajsEHBmrlhnetewOdKhU1iUaItcC7dcJLdd7lxGTrQlG8nYZN72pBpb9HZNSQo2C+WIgFE4NGODJ2+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6231
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



On 11/25/2025 12:08 AM, Michał Winiarski wrote:
> Device specific VFIO driver variant for Xe will implement VF migration.
> Export everything that's needed for migration ops.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vfio.c | 276 +++++++++++++++++++++++++++++
>  include/drm/intel/xe_sriov_vfio.h  |  30 ++++
>  3 files changed, 308 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vfio.c
>  create mode 100644 include/drm/intel/xe_sriov_vfio.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b848da79a4e18..0938b00a4c7fe 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -184,6 +184,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf_sysfs.o \
>  	xe_tile_sriov_pf_debugfs.o
>  
> +xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o

hmm, shouldn't we also check for CONFIG_PCI_IOV ?
otherwise, some PF functions might not be available
or there some other implicit rule in Kconfig?

> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> new file mode 100644
> index 0000000000000..785f9a5027d10
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +#include <linux/cleanup.h>
> +
> +#include "xe_pci.h"
> +#include "xe_pm.h"
> +#include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
> +
> +/**
> + * xe_sriov_vfio_get_pf() - Get PF &xe_device.
> + * @pdev: the VF &pci_dev device
> + *
> + * Return: pointer to PF &xe_device, NULL otherwise.
> + */
> +struct xe_device *xe_sriov_vfio_get_pf(struct pci_dev *pdev)
> +{
> +	return xe_pci_to_pf_device(pdev);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_migration_supported() - Check if migration is supported.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + *
> + * Return: true if migration is supported, false otherwise.
> + */
> +bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
> +{

hmm, I'm wondering if maybe we should also check for NULL xe in all those
functions, as above helper function might return NULL in some unlikely case

but maybe this is too defensive

> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +
> +	return xe_sriov_pf_migration_supported(xe);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_migration_supported, "xe-vfio-pci");
> +

everything else lgtm, so:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

