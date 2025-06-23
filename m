Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8552BAE49F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8910E404;
	Mon, 23 Jun 2025 16:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ip7hJ1/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F6810E404;
 Mon, 23 Jun 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750695091; x=1782231091;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZjpccLDQ/m+S+EfH7pp3rKthO85iJBHLrOwiN0l20oM=;
 b=Ip7hJ1/H67NqG0bBS/M8YgYyrGh9kGbh+eFy1zbKWgDlwiGT3rezHFFk
 Mk7OSwTFVm/POe6jE3Mrp9nCbtMp/S2UGK8QmBUfiF9qtT55ogKS6xJ1Z
 x37Fct3uyBo9xoBz5j9iHSNOfztb1ewSk5ASMemCXNEr2stFP5KQ3uUhl
 v4+rAgazHtcuezjNtE0a3pXIb1FT9FODEPV7PDQ0jXbiF2w7ybui1Biy6
 PojZok3Ig/KYbpO3P1Bg9T/VoEAErxDBZIhGvGq1WF2sycjXY6DdoNLBq
 /sfRhzTBzW+dBD3JMAMQYL9FilkeDaS7Xm291gOZPqiLhDvpq+ldJAwHV w==;
X-CSE-ConnectionGUID: TlSDsYWETku817TDvvGq+g==
X-CSE-MsgGUID: An9808euTxSsRA+OnHyJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="78321309"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="78321309"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:11:30 -0700
X-CSE-ConnectionGUID: BqDUYJXIRzSfjPWzRKvWjQ==
X-CSE-MsgGUID: 1EUUK/agQrygmbDyNnPPlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151060688"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:11:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:11:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:11:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUsZHnZCa4pZ8P9gwCEy0J+ODLEqsNuUc5h2TW8vV9q3rMvw75YGVpaoi+a1rnG2Q9i4FVxg3sdjr5wCM9lALpW6pIxBlowwaONBKCyP2q+HpYUATQyPVfolq9N6MpDGiruKcta6jltA20bXk1CE4wX+E+rXcZtw0qAYwoUH8i5eHBAK8fGPb2j5S9XBYHzP30nIizbN1VSzuRdlKZKLb0G6rjnJRXErFUOuTqtpfqVLhpvMhtTBuaejAWYZlQrS5YTvmSWUHhck4yvSTgvmoqtKX0bK3CiXRqiYN5PVvI8jdeuBx8vsw3AUOBbRgS/g9O68VFMKyhKRoMOC/GT/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI08JwiDadoZripbFRE7vY9CS9C87ekgGv4V/V1KJtI=;
 b=K39h4ZiRb5XZvwt6j1+1qyl8vvF2Org/jdA/XV+UYHofDWri3UdDLcipknpqO7LZ8Vw7Tn8VaietSlCN97GaEmyT38ooZnC2DuJqGan47RUHM8JnDIXAihg8F8ZHtv57kUjhSz73fUe5fXiipCRDwwLa23Y6NsfTY2uqXv9N61/ePCJqIoKfhtqyZayrBxXWyNUg4+0QPF2U/MrnV13qHOSraE1eqi3GWDKuaezTdOEfps7NxPJuchLYhB+0DQTXkAUmenCcw5Ke00IbeuIokOzD3ddg8XmMcB9ONINxtUUI4V2fLbqbj9yiOyFBt/xqC8AunwMgfq/5rVf/q5yZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:11:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 16:11:12 +0000
Message-ID: <bb2f68ff-e7bb-40ff-94bd-8ac7cab422ed@intel.com>
Date: Mon, 23 Jun 2025 21:41:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 in rpm resume
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-7-badal.nilawar@intel.com>
 <2c4f410a-3abd-4abc-84c8-13e7e3b40a73@intel.com>
 <a8d2605c-930b-4eeb-8e4a-1aa9bbfbb960@intel.com>
 <6733693f-64b2-47fa-97ba-4ebba3edef35@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <6733693f-64b2-47fa-97ba-4ebba3edef35@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::22) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b82b716-552d-44c3-2a68-08ddb270928f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTNkQjRLOVVodHV0c05rOUVvOWJKWDlOWUpoRE5KWXM1RWREZ0FkOTQxck1t?=
 =?utf-8?B?WDYwNXpPK1Q0ejBzVnREUHRNOUpNTVdkU0JUdjRGYStyWWs0QTVVRkl2eGhv?=
 =?utf-8?B?cjZyVDdDM1pIUStEVXJSc0ZpZzBTYjl1eDlWZGk1WEpSb045NzBhMlhhdE1m?=
 =?utf-8?B?YThjM1hNY3IwQloralJkanRXVS9Yd3Q1b0t2VXZrSjBISjhuQlZPUjkxQW5u?=
 =?utf-8?B?VFlTaHRyUjh4SW0rbXkvS0FIUkxoWS9CcWttUEJGSWpYSjU2cmduUWJGR3ZR?=
 =?utf-8?B?M1FqTVVJOXFLaTdnZGVjT2gxM1hJU0ExdTU4RjFSWXo1NWN1aEVPK2svZDB3?=
 =?utf-8?B?Q2VyQkNseWcxZmJqNDlQM3Y5NkhjR1FhOEZNOXhyQlA5Tmw2YTZSQnVZeUFO?=
 =?utf-8?B?bVV5bVlqZ1ZMcFdvN0RFSThudHgzRmtqN1VyZzU4ekdLT2JxT3hlRFAvTm5o?=
 =?utf-8?B?TVIyVU1obVNCKzRDZm9TTnNENVd3cWxjY29PL0gzT2ZzaFc2R3VRZ1QwVGpN?=
 =?utf-8?B?TGc4bzZaenM3cFlUNXU2a1duMGhJaFNWbXFEY29kR1ZLY3RZb2dvK0psNUlh?=
 =?utf-8?B?M3RrSmlSZVQ3UWFMRkpNTS9RRXp5MmdRcHAwWkN3ZHkvWTNvMkNBVC8vMkVX?=
 =?utf-8?B?aUdwUk4wamdhMDBIcUNmeUZFK01YR1czR1Z2cmQweXBoZ1RuamZPcTFUcGYy?=
 =?utf-8?B?MWdkdy9saVRMT3c0Q0pURzhzVFFTSmhYbjQzc2hQbXhRNHJnWm5ibGVsRFlS?=
 =?utf-8?B?WnYvaE9pTmZ2MWc1dWUzZ1VySkgzbm9raUZnWG5wdlQyQ2EwbStMTXhwY2JP?=
 =?utf-8?B?MytZTVRVdWwvTVBpNm5Xd1BXYjRjaTRva0RsVkhLNnFJOGIwT0FPTG9kQWo1?=
 =?utf-8?B?eS9rWXhNU3FoRHlhTkM1dlIwcGlBaGx0eXJLZnpqVHVWK1pJSXB3MjlLUHpn?=
 =?utf-8?B?VkFrTEkwVUZKekU4UHZWczNOcE85b3N1cXIra2lJSnpCOEZwYkZKUHlGaCt4?=
 =?utf-8?B?UXk4OFBuRmNMQWw4eEtzSjE3VkVjbWx0d1AxS1BrY3l1eDkrSExhZmpXdFhx?=
 =?utf-8?B?V0JsVFdPOUlaZXBHMU9idFA2VWN1TWxENHo5Rlo2NlVRUFZXSDUxa2NZOHd3?=
 =?utf-8?B?N3hxOE5EV1o1ZjlRSnFkS3NHdzYwNDJlRE1QT3RSZEZuV09IUTBpS3VtaC9F?=
 =?utf-8?B?dWxYQytlQkFQcGRUajBuYk8vSzc3YkRsRllwMGFlU3h4bS85UE45anU5Q2pV?=
 =?utf-8?B?WlZxRmtTNHoyN1ljNm5ZWmdBbDJ3enBha1MyN3I2YmowNmp1bEVhbDZuVWlC?=
 =?utf-8?B?T0lpeXE4VHNFRXRLeUEzTHpNU0N3d1Z6d1FOUXdtMEY0ZEQ0VDk5VEUzNERz?=
 =?utf-8?B?VWM2UGlhaldTRmxNMGlESm1RVDB6RDBRUXhHeGRWR3V3bi9uUk8rQWJQaFRS?=
 =?utf-8?B?cGorNWpJL3ZSdkZMOHVBc3Vtb3IyY3U5NHNWNGhmMlhQQW8zUTlpN0NJNmYr?=
 =?utf-8?B?RUlwMk9LdFZKdDdWMVl3dXVlUnppR0dEbFNmT2U0VmdjR1FHY0MrdU9ibzVp?=
 =?utf-8?B?ZWhLa1ErZE84RnBRUFlBbFlyNDUxYXdjaWYrcE1UWUVvbGlQeWlnbE5zOFV5?=
 =?utf-8?B?TWduRHhRR1c3VE0veE1VaERjbjFZcXJzU1FnM3B1cFQ2Ym1hM0NmRUN5RnFF?=
 =?utf-8?B?L1UzT2hqS2NaQjhkVDhiR1V1eUV6MWtlaWh5aUQ4TTc3dHlhYzZheCs3VU5H?=
 =?utf-8?B?VDhvdVpGMVc5QTVPSVFXOTFES0xEWmNyNjV6OGtxaXZuYnArTjQ1NGtielNG?=
 =?utf-8?B?TTExTTNGclJXYlZvMXJEcDVJK1FBQ0tPK2tORnVNdTlpV3JMbkdrK1kxYTY3?=
 =?utf-8?B?UWk3OVFUc0FjZnRkNHdyTXp5Q1JQbXNXZ283SnhRd2ZrUFhrbWlNTk9XY2hR?=
 =?utf-8?Q?t7FrzKUobIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDNKK3d1ZmN2cHNtdklHcVNESDNlaGdzTmdUZGZYU0NDemxDNnQ4aVA2SGNs?=
 =?utf-8?B?dlBmalFLQ3YrWDRpZ0pJUnZtTWh6cDVOcWhlZW1IUHdEb1JTdXViZ3I3SU9a?=
 =?utf-8?B?OHFHZGZKQjZkWDVjclBHT2Y4cElKc0JpRFJReTlpdjFzRDZ5eE5jbGhHckNJ?=
 =?utf-8?B?U2JoZTJDK3UvaDhSdTA1WGxPVnNva2lGNFFQK052ck85SUJPbUhocFBmTEY4?=
 =?utf-8?B?eHI3VEdON1VCK1BTV3JRb3R3dUxwTUZKcGs3cElGZ1QzdHBablJmSGNGdWhR?=
 =?utf-8?B?WVZRVHo1ak9qRmVIRmt6WUZxRkVHb29yWVo1UGJJQmVkM3RqY2pVNStVNWNx?=
 =?utf-8?B?YzRNSlJEd0M4OGZ3MVYwYVppcFFMd2oyWkw5V3BIMVVJV1RlSXFXdG5PTGRB?=
 =?utf-8?B?MUJWQmIxQ3pNaGdLYjJvVGdSbS9pd201a1ZvQytkS3kwNEttVXZieFU5YlFV?=
 =?utf-8?B?dy8xdWRIT3Y2azRzVDA0Uy9ROGVKaGZvb0FjOGRwcU9zSXk0emVtdGtzeG9Y?=
 =?utf-8?B?L29KYkp6azNpSktPL3hwMjhRM0JacjlsaGxzSyttZEUyanpQL3ovSkZiRE5T?=
 =?utf-8?B?U1RTRmhkWVBTNkZZTHAxWUNmL3NTczJUVERDQmlNZm50aExmLzl1aW1Cc0pl?=
 =?utf-8?B?cWdDdkRVZDZ0ajR6NnNPck1VSzdtMlp6VU5YVWdoZ2ZuemdGNmhnUkF3RE9S?=
 =?utf-8?B?am91NnlXcjZpMGVFV2VMQU8zdEpDc0loMmVaY1dydndKMG5ldUpEclJmd0dm?=
 =?utf-8?B?blNScHFaRktoK1N1cnMrdDBiWFdMd1FiQmE5Yy80bnhWTUgwV25JVTVrVzhV?=
 =?utf-8?B?bStaZkJOMldPeUlseFNEaktQclNzR08waWhWZWVObnBnWGRQR1p2anE5b0pU?=
 =?utf-8?B?NXZmS3RmRWlLd1RjNndMNjd4eFdKU3Y2azREUHdhRUppVFVSZlNnOE1GK29r?=
 =?utf-8?B?YllPeU5ZcFM2RXNZYzJSZ1NDVGZqei9TOC9wNWlGWENyaWYzS0FORGMyTzJk?=
 =?utf-8?B?NGJYMTU5OVZHQzlYNzFqd3NRbjMyTWVyQmM5Nkd4UWlhSTY3V0YrWG1nQVlj?=
 =?utf-8?B?ZkpXNllKRTZycXFVVjdHQW9wNU01Wm9GNzM0S01Rb2NjVmh4WHF4ZU9xM2lM?=
 =?utf-8?B?NGpBRmZlMjFGMVlmSWh0a0ZhL2dZTXNLdmJBWlRiR1k3YkZiZ21hbFRZeGhj?=
 =?utf-8?B?dXZjZElsbWM5ajczM2pJY0llR3ZZb1dWRTVmZjQvRVVIcysvWU1iRGRiVnY0?=
 =?utf-8?B?VEZxYlY0bWNaV2dJbUQ4KzE1WDFWbnlkaU90c3k1dEpaOGZobjVEV2ZIakJD?=
 =?utf-8?B?WElIcy9mdGxZRDl5bG1yQllpeFpsY2JqWEt0N2dlYWlzVCtQam5yYUhKOTJw?=
 =?utf-8?B?Mk1UVlhnbVJNa2pObnp3SGNFNmlzcGpyN2NUMEMyOURRV0QrNG1FMTEyTGo4?=
 =?utf-8?B?VlI0ajJHb21TbnUwQnp0OVhCRXF2YzhYcm5SRU9NQnJGbHVlM2V4ZXRNRDF5?=
 =?utf-8?B?eXZBUWpndm9FNll4dk5hQlRGTW1tMzZSUjRLcTd2bFBJWjArSG5sOXFEaDRP?=
 =?utf-8?B?WVN2QS82U1FQRFpTTEk5YnQ3TkRDWXl6V0FxY2NRKzR2YWd3RHpBNFVZTnox?=
 =?utf-8?B?UVNMVGc1N05YQm1zRUpBakQxQXF2emtSMGtyUTkvRlltTVM0RU96V3Mwbkxh?=
 =?utf-8?B?TU0vMEhLM28yWE9mVHZBR0x3eG5pdVpxN05IY1d5RGlRa1Eyb3NualEzVUdW?=
 =?utf-8?B?bkdYRFgyVUs0MXkrb2o3OE1wNjNiamg0c1hZemZIWlBTMVNlemhLeTdVTldY?=
 =?utf-8?B?MEh2RDVHVnF2c25wdkpXbXZEZWZ3dlRsRDdHTnBHN0NOd2FON3JVMmRGTVB0?=
 =?utf-8?B?dU1ndjZyTUI2ODF6bGI3eDAyY0EwZk8xdDUyRkhwWnpHSHZpRHBZUWxKVHBK?=
 =?utf-8?B?RGxkazR1QkxUWWNtYW9sNVUzcElUR21ZOUVyREpaanQxN1pxWjZRYTdEeno4?=
 =?utf-8?B?Y1o3d0lWblMwNzhxRDVyZ0djd3VES3RXQUY3b0cvZVVWRHNXKytFeE9YL09H?=
 =?utf-8?B?TGZ6MzlERHpvTS9tVk5sQUZJWExGQ1hiSTQ0QzdXUHVtT3Fna3dLRVhUMlhs?=
 =?utf-8?Q?F7/lDErnPLp/anJrRztXd9d5B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b82b716-552d-44c3-2a68-08ddb270928f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:11:12.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3ZUaaT/f4ub5GgxqdTy2Dgqgn+B1OoNsvlmoWgNN1Tqp5R9djFv/K1DTyTnMge73IdI9UBKMVIkqQf2zmc8/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
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


On 23-06-2025 20:56, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 10:52 PM, Nilawar, Badal wrote:
>>
>> On 19-06-2025 02:35, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>>>> Reload late binding fw during runtime resume.
>>>>
>>>> v2: Flush worker during runtime suspend
>>>>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
>>>>   drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
>>>>   drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
>>>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> index 54aa08c6bdfd..c0be9611c73b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>>>> @@ -58,7 +58,7 @@ static int xe_late_bind_fw_num_fans(struct 
>>>> xe_late_bind *late_bind)
>>>>           return 0;
>>>>   }
>>>>   -static void xe_late_bind_wait_for_worker_completion(struct 
>>>> xe_late_bind *late_bind)
>>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>>> *late_bind)
>>>>   {
>>>>       struct xe_device *xe = late_bind_to_xe(late_bind);
>>>>       struct xe_late_bind_fw *lbfw;
>>>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>>>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> index 28d56ed2bfdc..07e437390539 100644
>>>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>>>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>>>   int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>>>> +void xe_late_bind_wait_for_worker_completion(struct xe_late_bind 
>>>> *late_bind);
>>>>     #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index ff749edc005b..91923fd4af80 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -20,6 +20,7 @@
>>>>   #include "xe_gt.h"
>>>>   #include "xe_guc.h"
>>>>   #include "xe_irq.h"
>>>> +#include "xe_late_bind_fw.h"
>>>>   #include "xe_pcode.h"
>>>>   #include "xe_pxp.h"
>>>>   #include "xe_trace.h"
>>>> @@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>       if (err)
>>>>           goto out;
>>>>   + xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>>>
>>> I thing this can deadlock, because you do an rpm_put from within the 
>>> worker and if that's the last put it'll end up here and wait for the 
>>> worker to complete.
>>> We could probably just skip this wait, because the worker can handle 
>>> rpm itself. What we might want to be careful about is to nor 
>>> re-queue it (from xe_late_bind_fw_load below) if it's currently 
>>> being executed; we could also just let the fw be loaded twice if we 
>>> hit that race condition, that shouldn't be an issue apart from doing 
>>> something not needed.
>>
>> In xe_pm_runtime_get/_put, deadlocks are avoided by verifying the 
>> condition (xe_pm_read_callback_task(xe) == current).
>
> Isn't that for calls to rpm_get/put done from within the 
> rpm_suspend/resume code? This is not the case here, we're not 
> deadlocking on the rpm lock, we're deadlocking on the worker.
>
> The error flow as I see it here would be as follow:
>
>     rpm refcount is 1, owned by thread X
>     worker starts
>     worker takes rpm [rpm refcount now 2]
>     thread X releases rpm [rpm refcount now 1]
>     worker releases rpm [rpm refcount now 0]
>         rpm_suspend is called from within the worker
rpm_suspend is not called within worker. First device will move to idle 
state, then via auto suspend flow it will be runtime suspended, all run 
time pm state changes will happen from rpm worker.

>     xe_pm_write_callback_task is called
>             flush_work is called -> deadlock
>
> I don't see how the callback_task() code can block the flush_work from 
> deadlocking here.

flush_work, as per my understanding, will wait for work to finish 
executing last queuing instance. It runs the worker from the same thread 
it is being flushed.  So how deadlock will happen?

>
> Also, what happens if when the worker starts the rpm refcount is 0? 
> Assuming the deadlock issue is not there.
>
>     worker starts
>     worker takes rpm [rpm refcount now 1]
>         rpm_resume is called
>             worker is re-queued
>     worker releases rpm [rpm refcount now 0]
>     worker exits
>     worker re-starts -> go back to beginning
>
> This second issue should be easily fixed by using pm_get_if_in_use 
> from the worker, to not load the late_bind table if we're 
> rpm_suspended since we'll do it when someone else resumes the device.

Yes this makes sense, I will take care of this in next revision.

Badal

>
> Daniele
>
>>
>> Badal
>>
>>>
>>> Daniele
>>>
>>>> +
>>>>       /*
>>>>        * Applying lock for entire list op as xe_ttm_bo_destroy and 
>>>> xe_bo_move_notify
>>>>        * also checks and deletes bo entry from user fault list.
>>>> @@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>         xe_pxp_pm_resume(xe->pxp);
>>>>   +    if (xe->d3cold.allowed)
>>>> +        xe_late_bind_fw_load(&xe->late_bind);
>>>> +
>>>>   out:
>>>>       xe_rpm_lockmap_release(xe);
>>>>       xe_pm_write_callback_task(xe, NULL);
>>>
>
