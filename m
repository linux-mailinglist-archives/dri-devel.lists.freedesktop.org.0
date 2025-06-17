Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7318ADD054
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0C910E728;
	Tue, 17 Jun 2025 14:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJW9w+1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BBF10E727;
 Tue, 17 Jun 2025 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750171650; x=1781707650;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DCuu1OcSEc6Ltce7yjhzX9MRUcNQiCI5q+PHL1HIOfE=;
 b=SJW9w+1tQuZK828TccpPGBjXTqAeT1JjD5KkU7fL5V4xJ7qmw4MZikhw
 v4dGPWif+wBWE+b+hYAaj5hEpkDLYB71KzgKokGAZx+rC73ipN+uawvo/
 6VmQ8ZUnCjWlXtHyHElbyNSTfsKJwm3EvYYmFeijYtrNpYOUd1+oFY7CJ
 MKQjkEHwxs1mop/ZtdNdnd41OWoNYPzxTMr36L8Lb7EOpJHZTId88GlWG
 Ibx+jmkqSgZLhrXsq+JYwgcd4wzignKPh8eSJhAAwEsqgqwsr0CwVgtwP
 o0cXI/13Mx5XNsOyUha6nRrIX01TKAtK0E1T7b3cNfHp108iTuu7nk/tv g==;
X-CSE-ConnectionGUID: zyEA6KBuRUWGtQCalswTYQ==
X-CSE-MsgGUID: WGMXFy9PRPq3HaLKjQBxSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="74890560"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="74890560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:47:28 -0700
X-CSE-ConnectionGUID: 8983aR9XR4+ZkeWwcin4CQ==
X-CSE-MsgGUID: JCER5UY4Q3mKTtsJvrZYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148790207"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:47:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:47:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 07:47:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD7Qyc5jcbUlie6qSWm1o4p1kqPzlA11CwJUOJUxIUnexlNm+friWvT40o9AbROrfVOzzA6D+/MozR/+QaJSgciyPhDJM2Grh7kyisv57zCX9CZYk1SIYimzh473DKAsPBtCLAIMYPm+dr9ZlQ24CQatWBb3eC2EeJfMJduhzIgZ2Iwkt7+KjBZe6CYU9Y6AFJQ9k2N1e2oVnd/zfM3Ki4eLpKZNhAT2BkYTTF3jb+xQoIAS+3MS19laGAZ6VnSFw3ebI7DGxEYc/Ki8AIC8D7Y0lpwgypk7YEi3GM85nCxv0XGk3XlXFIHjbh45HZzERTs5H98M4/hpysqNycR0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWWQqkY3nek94Di8InOCZmEb7t3ZGKP/NBgxTfEeRCg=;
 b=A0pyhGAvckSnBeEd67Y/iPJ+6/P8PpIpQMHGvLtICCKmWxMilyxwIsCpsKHIbnJOWgoB8SKGr9Z5BpAfVhem1k5s1dYOTpBDdiXFezfS5w7AeGLPPgG3Zqs0fnqRT8owVd7Ee5FCK2sSe7UlsAzUXK3Gx0zzIOwrKpbcymXs+lFnZaGItp9HWgqgZiFmwaVUTXUDrxRFK2R0jWXHC21PXrs+F9fDm0SZwk0nYPFd54b2ko3RNTNSSz/yYUfYBw7rs5ZGjIwwa/9UQST53WCcon81M2Ca9F8J+xuit6g8SAu7qRfRxfGIXbz8Y8JtY5d++oK5Co1G6SrCdT8iknWDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH0PR11MB5218.namprd11.prod.outlook.com
 (2603:10b6:610:e1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:47:23 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Tue, 17 Jun 2025
 14:47:23 +0000
Message-ID: <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
Date: Tue, 17 Jun 2025 20:17:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, =?UTF-8?Q?Felix_K=C3=BChling?=
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
 <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
 <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: c76bbecc-61e4-48f1-a7a1-08ddadadde9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVEzcmF4S2g1UEFTVUFROFFvQjFIM0V1ZlJLQzRZOHJjczQzdGZFSVUrc3ps?=
 =?utf-8?B?enlQZEhOQkpHTlBhbm1aVnJuSXRoVk9YNUhPeS9CTTBqc2F4Zlh0Y2FkclBR?=
 =?utf-8?B?NkJ2RzNNZktnK2xhQ0l2TU91d283N0RDdlM3bEtzK1UzSTFnUG5DZHd1TTVs?=
 =?utf-8?B?WWVVRU5QMTR6ZjR3WldNcmtRSzlKWTFyUS9PUmdTbUo4S3hJY1lrVkhUbDNZ?=
 =?utf-8?B?V1JMOVpWK0RyOWxqa2xOSlNvcEhYSjdIeS9FeVVITkRaZlMvN0RNRzhsK2p3?=
 =?utf-8?B?RDdjR1BjVXMybE1ncWRPR1djSUkzb1V2UXg0RTFkTSs1VW5tTnJSUmdpZHZJ?=
 =?utf-8?B?MDg1NUtqeDFLMlJDT2F1OTRnRHBkYmVGWVl6NHZpMEY1bTQ5UGpWRm9lb05k?=
 =?utf-8?B?amJwY0xQeUcxaXNMaFVuZlhTeU1xVkp1TTVVTkZPL2ljMnFtZkp0eXN6R2dv?=
 =?utf-8?B?Q0pMQ0FOTHJFKzZGL3ZoYXAzZEpEV3B4alNrbEErazJRZ0xFb1VzK1hWTEdM?=
 =?utf-8?B?cmplY1BIRXRYTm16VUpLSEYvdzF4ZStVUWRKUk5WZjZmdE51N045dzNYbVV5?=
 =?utf-8?B?ejZqTTlFS1owWndPSkRUb3Bhd1dOdEtXTG5OV0FLd1ZoTnhKZkNKNW80ZVRw?=
 =?utf-8?B?WEFJUDRWSTJJOGVtdStXK3lDK0dXcytwd0NkbWphTmJkRDVRODBBbXVxc1p0?=
 =?utf-8?B?NTlzeXEzeExRZ2gyZlR1Z3pWRml1SVlZV2VYV2ExMzhwS1RQUkZMQ0dsSzJm?=
 =?utf-8?B?SG5rcW90Sk1UbFJrVHdxMm5sOHNVMzZqOFVOTzRzcXlsR0F1VEEvT0RrSUdr?=
 =?utf-8?B?Z0FQSnVlNVFxR3JFUE1vSlRlV1RTdkNIY2RJM0RBYnVwRDBUTGRlQkM5MHFs?=
 =?utf-8?B?Z2lCK3JFdjJnY1Z1eVpyYWthZ3I2dUppUlNCRWhDRU9mbDBRakg4UnpaaW9p?=
 =?utf-8?B?bm9tZG1yL01QZmZXaHpkcjE3M0VyVGh3eEdYd3pMS0JrN1VWRlI2NkhkRzFR?=
 =?utf-8?B?MFNMeG9ybmpwa1NzRFF5VkJXM3dSaXVZeCtJQ0VpQnhYVFZGQWVhYXFxbDhU?=
 =?utf-8?B?MncyT0ZlejY0bFlSNHhDUGpNaWxpamFFS0VsdVRQc0ZhZHZIUXgvbXltM2hS?=
 =?utf-8?B?Z2FSUlE1WkJTeHBzSnlVNVJFU0NYa2Y4SmtrRjRja3JDRnRpU0JVVE5iQk9Q?=
 =?utf-8?B?VVBuY0ptU0J6ZS9tTUR1cjMvb1FYdEczeGYwdCtHb3I4Z0RNdTVpSGRjVDdV?=
 =?utf-8?B?bnhkVmp6VXdnY2d6ekRkcnd5RXpxbTR0ZnJac3lzY0M4L0tMTmwwV0hNV21D?=
 =?utf-8?B?U3NLTHA5SWljWEpYbzZsQmxEL0pyZ09iRkloT0tpMnhydU1GOXAwYXdxKzBT?=
 =?utf-8?B?QXlVZzdnbzVFeFQrem5FWnBTc3NGeDFjYlVDeWVjZHo1bHF5ckliYkJLZG9k?=
 =?utf-8?B?cnpVdlZHM2xYaXFaeVl5bENvdnRuWXNNSGxDdzladGZySStqREJnNXplT0FG?=
 =?utf-8?B?MCtleHMzWCtwVU45V2sxVUV5dXAvcWxGZE1Jc1daYmZkemh4YkdnTTN3OU4x?=
 =?utf-8?B?U0hZT01td0xKVnZSZW4xaUZLRVUvRDQwMlRiWEtmSmh4S2owUXVNZmhCRFNn?=
 =?utf-8?B?eFh5aVFMMkQ5VWErVS9TQnJNelhCc2NNNFdzbTlzWnNtN3h6QUs5c24wTjdS?=
 =?utf-8?B?QnhRc3IxYVZ5R3FITm9FUTNab0FXaU9tWXZjNytqclRjSlJLTWREcGg3UGhP?=
 =?utf-8?B?SWxMbi9hdXVwbUgvdWZGWElMaG9yKzVKc1RtOXRVOFIxOTFOenE0QnhaYzN0?=
 =?utf-8?B?cHRUeHhMOHBkcFN0bzFvYzlETHQ1ME5NeWZ0ejBLcDFPN0R6anU1YjRDYVpz?=
 =?utf-8?B?NCtmNExUbzk1c0FBS1RmUnRjVHR1UW0rOUJyWXBoSjkyWkZOK3l5OVd1NHY1?=
 =?utf-8?Q?S18aLCMOoow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFphaFp5UVRKOE0yT09uSHVFb0RrWCtzZkt2VWRaMEFqMXlIaTdieFY4ZkVG?=
 =?utf-8?B?L2Q4WEQxemJMOUJGdmsyWDRCa0JjamFGSnh5YW9BUS92QVNMd0FXRmlZZ2Zt?=
 =?utf-8?B?bzVkeE9Qd0dLU1dSQ1dEQy9KWHhUZE1oRU82UFp4ZDBrWUFaR050VXFiOU9M?=
 =?utf-8?B?YUpFWTZRWmwweksrQjFmbzFEOE1XSFhDcnQ0ek5Cd0tyUjVudDBtaHUzaDB0?=
 =?utf-8?B?T2huMVVVVWIrQVRDNVFCTW5uRWh4UHhOZ0NZSENUeEI3VW41ZGQyRm9jbjZl?=
 =?utf-8?B?QmdBNHB3OTEvVHdRUndzUnNKN0d1cWFjc2wyYmoxQ0ZJQXJZTlEwbHhkZmRB?=
 =?utf-8?B?VzlRYXozWWxwRHhCdHZsL2hCNDA0cWg0SVlkWm5RMGJsYTcxazY5SEtiMUFZ?=
 =?utf-8?B?WUFWMzc5SUJjQ3NRRm5YZVdnbnlqbkxHVFA1V0xaZlc1S0duWWNVbjFuaDgy?=
 =?utf-8?B?MXRrVlNCMTA2WFJIak91WkpNOFMzMEU1SWs2Z3QyWkZvYWhYd3lKOVJXTEVC?=
 =?utf-8?B?SFdjUDFzS1pid01OeWFhdjRiZytHN3FKdHcxV1lDWTh6QmpoUGF6RUt6N3A1?=
 =?utf-8?B?YVVla0RkaGZaSTRodG5Na0lzQ2hhWExub05zVW9hamkzU0hiR3dENGVKZGVk?=
 =?utf-8?B?S292LzVLZVF6eGRUS1B5QXo3Yzkyei9DODIrZmM2djRvQ0xmcmk0bDhKbkpJ?=
 =?utf-8?B?aE9lUUtQTXpGcU5rQW1FdGN0djcwWE1ZdGZrN0V6SGRtYnpRbmt1cXBoRzd3?=
 =?utf-8?B?VWRBRWlzTmFRangxeFNrMFZIVHBwTzJQanVVQ0hUWDhmM29ydzMxNkRQbllv?=
 =?utf-8?B?MWZ5RmlHU0wvSmZnRmlhaWowa1V5L0pZZ2hnK3ZiUldueTVyWEVpaU5lUHRi?=
 =?utf-8?B?dWI3RlB2cE96MERoYlV3dHhRZUw3T0lQVUJBTlBNR2p1dDdFYTA0VU5jb3BI?=
 =?utf-8?B?TzJZYlNqVWtHUTU2SzNPazd5R0lZbGFnTTdyU3FTK00wc3A4RDdxajJmNVJ3?=
 =?utf-8?B?UEV6cjljYy9Qcyt0YzlKUnlIRzFNaXpzOEwwa1FnaHhudnFXQ0pZRlRCOWhI?=
 =?utf-8?B?UzRiWjZZMkg3em5rV0tybllqeUF4cWFqUjBadVBxWmFvQjBmYm9vMFFQUGZ2?=
 =?utf-8?B?OEJuVzkyczJOeFE5bXkvNHVob1p6OE04RXFUU25RSjJTYi9oaEJLWFF5SlZG?=
 =?utf-8?B?SFd1TkVyenA3QlhraVo1QTc5S3FXM3kycmVKbkFycjZla3VaVmVtMHc1MGFN?=
 =?utf-8?B?dmZaamJ1WDhQODdtTU45Q0ZwQ29jQUdvUm50Qm54dUxrUEhwcFcyallKelN3?=
 =?utf-8?B?d0ZmQmxlZHF5aEk0WTVrczFsQ3Y2RTR1bkkzS2k1T2R5MVJYZXBVN3djSTh3?=
 =?utf-8?B?cC94WDl5SnNzNkVub3hJZSt4TGJTd2FEMERJenlFelUvVmlNOTZmVXlMeDlS?=
 =?utf-8?B?WlFqZHFYR3VLelhNUG53d2hIckp1Y3craDhGcjFZbndCeml3MTNmbTJhdmR6?=
 =?utf-8?B?NUtpZVpwNHY3OXZaWUxRMlVlcmtrbGcyemZtZ1MvYmlOT25ncEw1UTRpK1BX?=
 =?utf-8?B?SW5ycWZVVU1iUlRMN1hTY3cxbmVXVGRMdnhXdkxyMDJ1ZnRCWXNDaERoelUx?=
 =?utf-8?B?QUVFcUpwdUNrdlp4TG45Nk9hVHZTOGx1Yms1ak9KeHJHazB0Y3c5SkhHbnJD?=
 =?utf-8?B?Q2NJMDhteXcyM3B1L3hSSk9PUXVlcXZ1Nzhwb0FkVnVHK25PRmcxbFRybmtF?=
 =?utf-8?B?aVJ1cHRuZllOSks0cTJzaE9YTm42ZlBpNFdlbU1mc0I0V2ZqWWExZlFsaS9n?=
 =?utf-8?B?ejVCaFJpZ2hxT3MvRE8rcmsyc3c3L0QwaXBMV25oaWc2em9pajI0SjlxR2hh?=
 =?utf-8?B?bFZTenMvTUZGOG52UFFCc3ZWUURaZTZxdzJtZlhyTDF1enhES0RmRmw3cnJZ?=
 =?utf-8?B?dHBEc0hGVmYvRW9ua1dIR1FKc1pYYmpsTjN5MnlXY09RNXdtOEdBSXZmaXBC?=
 =?utf-8?B?YktWSkdycURCWENOQ1NpVkREdE43b2ZtZmFzejRIaVhadTNOK3p1c3AwSEcy?=
 =?utf-8?B?bUVMS3FERTlSRmFqSXdqMG85UTdFVkREU1FUakNxZWxaSGlqdmJCNzFOVXIy?=
 =?utf-8?B?dmVpRi91UDdhWlVxUms0MnRMcXRRRkllT1lzbUdad0RYYUtINkxvQnc5WmlG?=
 =?utf-8?Q?b2M/91kuzmjDnu9O4szDcxU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76bbecc-61e4-48f1-a7a1-08ddadadde9a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:47:23.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA1T+euUsxpSQteo0BpXJiA9doY+9h7Ak8fuQ4vAyyR6lqf4BWj8m+tLYJXLK/MCN67y6xAk8LOWh8MWg4dBVqihBz/tdduHJY9oNn/CDm8=
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



On 17-06-2025 18:41, Thomas Hellström wrote:
> On Tue, 2025-06-17 at 18:25 +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 13-06-2025 19:32, Thomas Hellström wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> The migration functionality and track-keeping of per-pagemap VRAM
>>> mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
>>> This is also reflected by the functions not needing the drm_gpusvm
>>> structures. So move to drm_pagemap.
>>>
>>> With this, drm_gpusvm shouldn't really access the page zone-device-
>>> data
>>> since its meaning is internal to drm_pagemap. Currently it's used
>>> to
>>> reject mapping ranges backed by multiple drm_pagemap allocations.
>>> For now, make the zone-device-data a void pointer.
>>>
>>> Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure we
>>> don't
>>> pass a gpusvm pointer.
>>>
>>> Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
>>>
>>> Matt is listed as author of this commit since he wrote most of the
>>> code,
>>> and it makes sense to retain his git authorship.
>>> Thomas mostly moved the code around.
>>
>>>
>>> v3:
>>> - Kerneldoc fixes (CI)
>>> - Don't update documentation about how the drm_pagemap
>>>     migration should be interpreted until upcoming
>>>     patches where the functionality is implemented.
>>>     (Matt Brost)
>>>
>>> Co-developed-by: Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>>>    drivers/gpu/drm/Makefile             |   6 +-
>>>    drivers/gpu/drm/drm_gpusvm.c         | 759 +---------------------
>>> ----
>>>    drivers/gpu/drm/drm_pagemap.c        | 788
>>> +++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/Kconfig           |  10 +-
>>>    drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>>>    drivers/gpu/drm/xe/xe_device_types.h |   2 +-
>>>    drivers/gpu/drm/xe/xe_svm.c          |  47 +-
>>>    include/drm/drm_gpusvm.h             |  96 ----
>>>    include/drm/drm_pagemap.h            | 101 ++++
>>>    10 files changed, 950 insertions(+), 873 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/drm_pagemap.c
>>>
>>> diff --git a/Documentation/gpu/rfc/gpusvm.rst
>>> b/Documentation/gpu/rfc/gpusvm.rst
>>> index bcf66a8137a6..469db1372f16 100644
>>> --- a/Documentation/gpu/rfc/gpusvm.rst
>>> +++ b/Documentation/gpu/rfc/gpusvm.rst
>>> @@ -73,15 +73,21 @@ Overview of baseline design
>>>    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>>>       :doc: Locking
>>>    
>>> -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>>> -   :doc: Migration
>>> -
>>>    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>>>       :doc: Partial Unmapping of Ranges
>>>    
>>>    .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
>>>       :doc: Examples
>>>    
>>> +Overview of drm_pagemap design
>>> +==============================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
>>> +   :doc: Overview
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
>>> +   :doc: Migration
>>> +
>>>    Possible future design features
>>>    ===============================
>>>    
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index 5050ac32bba2..4dafbdc8f86a 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) +=
>>> drm_panel_backlight_quirks.o
>>>    #
>>>    obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>>>    obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>>> -obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm.o
>>> +
>>> +drm_gpusvm_helper-y := \
>>> +	drm_gpusvm.o\
>>> +	drm_pagemap.o
>>> +obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
>>>    
>>>    obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>>>    
>>> diff --git a/drivers/gpu/drm/drm_gpusvm.c
>>> b/drivers/gpu/drm/drm_gpusvm.c
>>> index 7ff81aa0a1ca..ef81381609de 100644
>>> --- a/drivers/gpu/drm/drm_gpusvm.c
>>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>>> @@ -8,10 +8,9 @@
>>>    
>>>    #include <linux/dma-mapping.h>
>>>    #include <linux/hmm.h>
>>> +#include <linux/hugetlb_inline.h>
>>>    #include <linux/memremap.h>
>>> -#include <linux/migrate.h>
>>>    #include <linux/mm_types.h>
>>> -#include <linux/pagemap.h>
>>>    #include <linux/slab.h>
>>>    
>>>    #include <drm/drm_device.h>
>>> @@ -107,21 +106,6 @@
>>>     * to add annotations to GPU SVM.
>>>     */
>>>    
>>> -/**
>>> - * DOC: Migration
>>> - *
>>> - * The migration support is quite simple, allowing migration
>>> between RAM and
>>> - * device memory at the range granularity. For example, GPU SVM
>>> currently does
>>> - * not support mixing RAM and device memory pages within a range.
>>> This means
>>> - * that upon GPU fault, the entire range can be migrated to device
>>> memory, and
>>> - * upon CPU fault, the entire range is migrated to RAM. Mixed RAM
>>> and device
>>> - * memory storage within a range could be added in the future if
>>> required.
>>> - *
>>> - * The reasoning for only supporting range granularity is as
>>> follows: it
>>> - * simplifies the implementation, and range sizes are driver-
>>> defined and should
>>> - * be relatively small.
>>> - */
>>> -
>>>    /**
>>>     * DOC: Partial Unmapping of Ranges
>>>     *
>>> @@ -193,10 +177,9 @@
>>>     *		if (driver_migration_policy(range)) {
>>>     *			mmap_read_lock(mm);
>>>     *			devmem = driver_alloc_devmem();
>>> - *			err = drm_gpusvm_migrate_to_devmem(gpusvm,
>>> range,
>>> - *							
>>> devmem_allocation,
>>> - *							   &ctx);
>>> - *			mmap_read_unlock(mm);
>>> + *			err =
>>> drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
>>> + *
>>> gpuva_end, driver_pgmap_owner());
>>
>>
>>
>> fix doc passing timeslice as parameter.
> 
> Will fix.
> 
>>
> 
> 8<---------------------------------------------------------------------
>>> +/**
>>> + * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct
>>> range to device memory
>>> + * @devmem_allocation: The device memory allocation to migrate to.
>>> + * The caller should hold a reference to the device memory
>>> allocation,
>>> + * and the reference is consumed by this function unless it
>>> returns with
>>> + * an error.
>>> + * @mm: Pointer to the struct mm_struct.
>>> + * @start: Start of the virtual address range to migrate.
>>> + * @end: End of the virtual address range to migrate.
>>> + * @timeslice_ms: The time requested for the migrated pages to
>>> + * be present in the cpu memory map before migrated back.
>>
>> Shouldn't this be present in gpu or cpu memory map ? We are using
>> this
>> to ensure pagefault can be handled effectively by ensuring pages
>> remain
>> in vram here for prescribed time too.
> 
> So with this split, drm_pagemap is responsible for migrating memory and
> updating the CPU memory map only, whereas drm_gpusvm is responsible for
> setting up the GPU memory maps. So if it remains in the CPU memory map,
> then nothing will force the gpu vms to invalidate, unless the gpu
> driver decides to invalidate itself.

Thats true.

> 
> But looking at this i should probably rephrase "before migrated back"
> to "before being allowed to be migrated back".

The confusion for me is that timeslice_ms does not represent the time 
pages are required to stay in the CPU memory map, but rather the time 
they must remain in the GPU memory map. We defer migrate_to_smem until 
this timeslice has expired.
  >
> 
>>
>>> + * @pgmap_owner: Not used currently, since only system memory is
>>> considered.
>>> + *
>>> + * This function migrates the specified virtual address range to
>>> device memory.
>>> + * It performs the necessary setup and invokes the driver-specific
>>> operations for
>>> + * migration to device memory. Expected to be called while holding
>>> the mmap lock in
>>> + * at least read mode.
>>> + *
>>> + * Return: %0 on success, negative error code on failure.
>>
>> s/%0/0
> 
> kerneldoc prefers "%" before constants, no?

Thats correct. My miss.

> 
> 
> 
> Thanks,
> Thomas
> 

