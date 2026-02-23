Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA+5G0y5nGkqKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:32:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B606A17CF03
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7274E10E311;
	Mon, 23 Feb 2026 20:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHVWUY5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D00210E30F;
 Mon, 23 Feb 2026 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771878728; x=1803414728;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f1Qb/2fXor+tRDehF/gbuauNfHhUSIgClpHY4tmmLE8=;
 b=jHVWUY5UN/fN/W39Hfv1ruElPPzqGIUSqd5zUkgIYOgO/QjU0IimUSsr
 Ou32pZ3P70Xi10EA/Z/CnYKIKZUn2tFGPTDhSg511QBYL10xvFZicWgVW
 Jn0VXvXAhwFTtgj8bWr7SMVtUDcrsf/AupiwRySbSLSg+e05bp7wfBFbM
 jF6Qe9tNbqEzgcO/rJySFNksb/Ipg8BYnChfvHoCDydmmMwcv5ZvXfKI1
 +Tpsgz8DFXLfIviRFU26YTqABH+IRQyL5RjvKEj9oNcGi2mccOSr8Nh5V
 CSs7NqJ19kaMEFmAE57krY6eorErvc/HlIRZiIRtBnyCffEPi6aYqc2D0 w==;
X-CSE-ConnectionGUID: CPgpAJK7QGafhjSjlRX8Bg==
X-CSE-MsgGUID: Zcjlyz7cSN6qJkGETnOwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72861066"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72861066"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:32:07 -0800
X-CSE-ConnectionGUID: CEk3/f/HSl+6KAFnDBnLhw==
X-CSE-MsgGUID: 2lX0lMJ3RKu3/WYQg+qnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220235354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:32:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:32:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 12:32:05 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVe09U+9b+g8FIqN6GMMPRd+lt+kpwCtptrYOBhdptcDytQ7bDgL/nssR1dNPFcVAFfIFOHGgTFKUlBIPDAgjC9opS3NoYHWgoHbtru59gjgJEr6hwGKub2cn6/vqPbaqVcv5hwgtIGO0NLCKlpYhSWgp7qda6aXnRxoUVYGh0gETRB9hfcqpCc1hgQI+t/ptTu3n2Jp22muKJZS5pH9q6ewcnNYkzkgCyxSvmRK8GGoPj8EZH7KsRa4ykB+M/0jMn8B+Z7f22KfOfnssepeYOKKmQAWkxB7t8qch5NqN2upZXhjPVGzqPnOj2C0rGdLmj5Gvt4EDJ+pOSn9lG4YmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhNSaIPRqNcx59z3v7cRkOMgWUKMqIG7qQqyGpjW+fw=;
 b=k/+Rmh1q2dpJvrNy/t8D/sfFzLrSIn02qpoFRqgF4YtBYk1F3lpV7SELiYlmThCTtG2cvvyeRMdFYsVAmPPI65Wk8F3tAET6LnugxaBnKpb8qBQrujOU7lC899CHCuepD0/WVPErVByelvOax8sr5XLfVUxN2BaDz+3wa/6+a8oyu8zWl6PH4l95kYJKFzZPKzt2+VkHkwW7BFRju3X2d2uJkmwzDWxIqvAo4bYzlZPdaI2Pxpf9FmaMrU9SEhpOiSyKXERja0HyOe6+p7qk2FqLj6N+hOCwj2ibXfn8ltEg0KEwyYRJiYhuhpWBmIBpwUZQgbBt3fsl6iEj3/NFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 20:32:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:32:02 +0000
Message-ID: <5d56b0ab-ca4c-4a5d-adf6-245040b4888e@intel.com>
Date: Mon, 23 Feb 2026 21:31:56 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BRFC_v2_1/1=5D_drm/xe/pf=3A_Skip_creating_DRM_dev?=
 =?UTF-8?Q?ice_entries_in_PF_admin=E2=80=91only_mode?=
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20260223150951.1834063-1-satyanarayana.k.v.p@intel.com>
 <20260223150951.1834063-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260223150951.1834063-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 214bcd5d-6d76-4b3b-2445-08de731a99f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dENBVTg3UzVmZ2RlV1dSSm5Zc3F5U2tBelh3b3QzTFAvVzdVb1RYM3V6WFUz?=
 =?utf-8?B?N1RXZ3F0am55WUtISXhINnlUUGpKMnlZVFZtQjdqV3FoQU1uandxYWhGcXg0?=
 =?utf-8?B?ME9OVjlxZHFNUkxRdGVXa3dMLzA5SXM4eTc5cXdOVStDWFdDWjM3UmJKMW9P?=
 =?utf-8?B?VGJYeDZBamhSVEd6K2p6d1RUVkhRZFBnaDE0bXhvV1R1SGx4V1E4ZmJsbi9Y?=
 =?utf-8?B?OTdBTTduVnFzZDRlTVQwTGJnU2tTNktFK2ZISHhPM0JSN01XMG1rY0xKU3dV?=
 =?utf-8?B?OEo3UkZ3VE9PQXN5Rm5BY0NxaXFnQkg4WWo3dnN6c29ib0xhOXFSWkVpb0lI?=
 =?utf-8?B?bjVIblR4RkhmQm8rc3Zna0U3NkdZQyt1bTRHVVFYaHk3R0YxaE9TNm0rTTR3?=
 =?utf-8?B?ZEFoNmJibjhMRWExYmR5aEVUQ29NTCt4Z3gyamRaTXMzOWdkVEVtOUVERXlD?=
 =?utf-8?B?ZmJOQ2RlSnJ6YnAwdk5CZXNNT0NMdnZGZFhMYmNlTkNOZnBCUTBqYi9lZ1Bv?=
 =?utf-8?B?MEhEZ2lEV0NacWwvZEFXKzEwWERXR2F4T0NhaXRkWTRvczlLc0YzeXAxU0px?=
 =?utf-8?B?Q1EzeXpMM3NEM3VQNjFRTXp3cXFTeFl0M1MvZzdGWWNuSW4rOFRMbWNVK0lS?=
 =?utf-8?B?VVlmUlhNSjZKYmc4azdBeUgyVlp6UzgxWlVOZ0VlNHZJYTh0OExXMVB1TnIr?=
 =?utf-8?B?YmNqRjQzNDRjVHdhNFZab0NKeGJWS1lMa3UybGM4VVRuN2J1ejZyam1qM3dy?=
 =?utf-8?B?RWZ0SXMxY0M1ZWpWK1c2ekczU1Z0VWNiWlNDUklBZlp0Wk9peHlwbkdNaks1?=
 =?utf-8?B?Sm9jQjh1RngvTk5KY0E2TGlPYXh5ankzV2tkVFdPMTNpdmFSN2NzRkVXRFg0?=
 =?utf-8?B?M0NKRVBkMjl0RGs5TGlGaEhNWWwvT1RvSzlCUW5MTUx0aTlGMVU5cmVwNm8x?=
 =?utf-8?B?dFFUcjBmZXF3SHNiTFBzQmlPeVp0VGV6c3JheHNmMmpONTYzQVp4ZTQwY28v?=
 =?utf-8?B?d0Q4ekdjVnhzclVRQ0c0aVIvUFpzUnJKYUhNcFJIVVlUNVlUWFdtZGhmaTJo?=
 =?utf-8?B?WE41RzZDeXB0TXhRRWpCNVdUcnFqWjVWSGpJWU5tMUo4UnpuczBSZnZJTExW?=
 =?utf-8?B?Yng0K3I3a1lyalFGUFllQi9rTEJCY0JPYVdLVjFYN2RwM2tWVjlvdFFhYmYy?=
 =?utf-8?B?eHowNUUvemNnL1hFczFMQVF3SGhDKzR3YUJ2OGNtMFlVTHVDZ3pkS2RpZVNt?=
 =?utf-8?B?SXQ5VWlPaXlDVUtaYVU2Q2lYUjJyeTF0NFJUNnJyeWVFdVpsbE5vZVM2dW9i?=
 =?utf-8?B?UVZVMHJSU1lnOE8vNVRDUFJGSCt0MXNLUTRlUVl5RjBUVHdnNXdoZGd6aW1D?=
 =?utf-8?B?eDlXby9YM1lwVTBNWVJ1NGNKUGpNdndXRjlpSUNudEpKNTZjSVo1dlNTNjBy?=
 =?utf-8?B?eVZvczNsSVhGV09OUmpvWW5MenIva01vRU9Xa0hjVGp1MHdTamk5UktjMEZ4?=
 =?utf-8?B?WHBGcTdGSU91bmxaa0hqRDJRaCtkaGhFNXAvK0VEdUpiRzhwbE5VQTJPWCsw?=
 =?utf-8?B?dkVJT2w0SFdESmVKYWxkRytUYmVKbVVBMUtaVHpMZnpUVk1FOXBtenZHOERY?=
 =?utf-8?B?enQzZXY4Z1lGOFFjd0VWd3gwUE44QjV6Sjc5VEE3cWVBSDVaWVhvVWt5eS9z?=
 =?utf-8?B?OXFleGcrZldLMHR5bWJRNWdpdzYvdXdPWGdKSW11dVIvYVRyNlJYVWdNTDJt?=
 =?utf-8?B?MU5sNmZzUS9HZXhJRVRlQWV6cGpGS0Z1YjV1RW9QL0dQN0ZGZXRPVjdmQXN1?=
 =?utf-8?B?MUx6UWh4Zk5kdHRFd0dGZk5RUnV5b3NGK1lrbUROVkV6TVpLOXZ1OW1VZ1dU?=
 =?utf-8?B?Sm5ZYjJzQjllZEg4TDBWR1FWTG1vdy92S3hHSExXU3ZRdnFzdHRVUjNYWlN6?=
 =?utf-8?B?eGVFMEdoTEN0dThQYUlKanVlNXZyODAzMUpnMC9FaTVxaW5valBWbVdjMkNH?=
 =?utf-8?B?Q293RDhvMldobFczSUU0TTdBTVJiK3MwWGFMZ1RyTkFxMUZuTTV3NFRWWmM2?=
 =?utf-8?B?aEdTUW9JNEkrVHdNN2krWU9KSEw3NHdGZnUwSXl5R1NzSXRpNVZPSWRwcWhC?=
 =?utf-8?Q?/aJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmp5Q1BIOXJwRHRYeFk3bGZia0JHaW5OMDR4R1pVNU51VzhpUktIZCsrWExK?=
 =?utf-8?B?Z1kzNmZhRGhIUC9aSUgrazlIU3pCT0JZRVk3aTFjK0o3M3RwVDhsWi9VbWJy?=
 =?utf-8?B?c1E3bGpoV1RZTyt2RHRWbnhudlVSZFdGbkNXSkZLQmxVTWFEWEhjY0xGeWVD?=
 =?utf-8?B?dUEzVkppZTRrV1ltVms4VHM5T1JYZkM5UUJFTUNaL21TTmNXVlBtcGh2RTZM?=
 =?utf-8?B?S1NUU2FqSkpNTDYrVmIzcTJvcFVMWGlQVW9CWWtjbjFkMGlsbFUvK1VCc21W?=
 =?utf-8?B?RnJMcUNzMHREWElNemxEVlIvQmM0L3RoSUgrVy9ET0RybUVLemJzS2JZVnVV?=
 =?utf-8?B?dDhOK1o3K3dZVkwyRzdWNm4yMW4wRUdkVkUySm1xR3k1VzdOcFVnSkJIOEts?=
 =?utf-8?B?YmsvLzQzOGZyS25NRVAxSVRNclNMdTBKVEo3RWR5YWl6N0FWNG5nRDlIdHRU?=
 =?utf-8?B?QjBtQ0pTT2dBSjdKcDRTMGhhcEdXbG10K1hQdk5GR2NpdWVwcldXZWR2VEpu?=
 =?utf-8?B?NzMyTHlGbVJJcWJwMm5oOTR1eGdhMTFQY083ODZPdEdiZFFzRFRQR0swRnVX?=
 =?utf-8?B?NEFXb1hHbExZS1gxOVg5RzJnaEk0ZzJLK1UwWWtNMUVJS3lNelVwMzBjNGhO?=
 =?utf-8?B?YVdiSXBXcHdtcXEvR3BhdDZXYVlxL1NNWHAwK2lSYjh1eVQ2S2dKZVlRUjlp?=
 =?utf-8?B?R05jRklCQXZtWEdYMk5wb2I4SSt3em10WGxxa0FlNE9BOU9BVkNGamZ5SXcr?=
 =?utf-8?B?djhZaVdiL1JnRGh5VFgyOFh5ZWdlL1BtVUxWdThQNnhEa0M5dUlJM2dlZTdx?=
 =?utf-8?B?bUErZXhWbWpGT09wU0l4RFBlUUJTQXliYW1HT3phaVVWak9JeWhpREV0bnNa?=
 =?utf-8?B?Mm9tdmtvTXg2dHNwZ1dqQm9qTHlSSmhJbC9CZWQvVk9wcnVFNWQwQUFkbHhI?=
 =?utf-8?B?SG5qcWRISUg2eC8rQ3VKMnYxUXNyLzhBaXlROVFMN0RkWmJMTXlTR0tPbXFo?=
 =?utf-8?B?b1lMVU9rWkl2N2ZTcEpqa25QbEgvb2wxUmZ2QnhYNllmZFpjMGpUMmZ0dmZ6?=
 =?utf-8?B?a2xSWU9ENUQ3QXRacXYwb2VKcUI2RE13dGlaZU4wcEloVTh6YVNrcy9RZ3lq?=
 =?utf-8?B?KzlWaFN1Qm9mZGc4cXNUN25POVE3S1c0cEp3dVVYVnhZaHU4VWRQZ1JaRjcx?=
 =?utf-8?B?RkxZck4rVjc2U1cwRjJlRUFqeG9XU2hBTTNCaVZIbXM4T01SQ2x1VFMvUWZF?=
 =?utf-8?B?ZVZtbTJWT2gxTWY4cTZKdUF3bUZVRUUxemMwcGFCUmZIWjBaTWczbW55M0Rn?=
 =?utf-8?B?aS83a3NYeGRVdzhBR0RmcDA0bjNmdXFoTEtBNXRZY2c1aGdoL1JMUFF0Wnpu?=
 =?utf-8?B?WG0zRktpVG1ZTmZwdExrZ0hHUWdGME5FYmN2ZGlWV2d2SnA0VHFid2piaGtS?=
 =?utf-8?B?MGRva2FjTmQ3YUhCVVlQczVQRUduVlV1Z0JLeFRpaEFzOURqUHI2WjBhUXFB?=
 =?utf-8?B?am9YYXN0S3E4NUl6WklBY0hoekVYOS82SWZwVWNGUFBhU2VURkwxcGVvVTdQ?=
 =?utf-8?B?ZHRPckIyUm9HbW1sdWwxM3VoZU1MdXI0cFh0Z21KdUs1aXRzK0dKYUx4Mlp1?=
 =?utf-8?B?NGFnNzhSRDJDYmozK3Z2b3JrcVhud0taRmRIYXRkYVRaV1ZqZk01bUptS3NJ?=
 =?utf-8?B?V2RnZ3NSN1hrbUI2QVhkSnk0TTBOc0ZKUzh5a2dHa01qYkNWRGtCZkpyUHln?=
 =?utf-8?B?a0wwN3IxeVV1Ly9FL3h4dktrd0dhMUFWek9PaHMvMmYwaEozSGdkUTIxZG40?=
 =?utf-8?B?YTBXZUVRNmFpKzdqbElWT29YcFJzQmNpS0xXdHc2bWpRdjVic1RvaDJlS28z?=
 =?utf-8?B?dzdQYlJqbkRYSDVoOTVuWWFQRmFPYzUzeUx1bGZBSm9xNUxIRUZ0ckdidS9W?=
 =?utf-8?B?aTNqaXlxUm5nZC82MnNNSXp5T3pid2Z1SW5HL08xcE40WXdqeGpLWVlNMWxZ?=
 =?utf-8?B?OVFCOEVlNEdPQkZhOWEySXZBWnNTekdJQ0JNcTUvdlBrb3lFRm5yQ2R2QW9v?=
 =?utf-8?B?bFdQNHA5aVhwVTdwM05BK0xkQi9XWjFzMEw0OHh5ejdROW5uanNOUkI3RGNL?=
 =?utf-8?B?SlkrUDYxQkZkLzAzeE1CbjVWYnpuM1ZaVUZTajJGSjZxN3pFMENBNnY5UHhH?=
 =?utf-8?B?TkxPWXFwR2JXNWI3UncrSEJFYkc0ZUlPZTh2YVZ2V1hCM0FXbUFWS3ZNN1Q1?=
 =?utf-8?B?WEdhRHJYVGhiU0tkN0wxV0UyVlBUaGh4TGpEcU4wOXFiZ29hQlFnSXgyOWlH?=
 =?utf-8?B?RmRqaVZCWlJkUmxGMDZvdUN1WG8zaGRVUWhMVFpRNEFJU0g1MWdTbE4rdnB0?=
 =?utf-8?Q?Vq4079JzS4s72FSU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 214bcd5d-6d76-4b3b-2445-08de731a99f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:32:02.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WejZoAcanH2JIcHT9lWj2ga7TXw7aKOBbhgwQA7p+8K/Z+571m8Fsrzfb+3ryh4BESvFVFUjBKtOHUhuLaRtT0FCeiGANIvwHzOqWWsdrWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.wajdeczko@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B606A17CF03
X-Rspamd-Action: no action



On 2/23/2026 4:09 PM, Satyanarayana K V P wrote:
> When the PF is configured for admin‑only mode, it is restricted to
> management functions and should not expose a device node that would
> allow users to run workloads.

maybe instead of doing such massive changes, better option would be to
define a separate drm_driver structure with different set of ioctls?

as maybe in pf-admin-mode we may still want to use XE_DEVICE_QUERY
and/or XE_OBSERVATION or some other future ioctls for VFs monitoring

xe_device.c:

static struct drm_driver driver = {
...	.driver_features =
	    DRIVER_GEM |
	    DRIVER_RENDER | DRIVER_SYNCOBJ |
	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
...
	.ioctls = xe_ioctls,
	.num_ioctls = ARRAY_SIZE(xe_ioctls),
};


static struct drm_driver driver_admin_only_pf = {
...	.driver_features = 0,
...
	.ioctls = xe_ioctls_admin_only_pf,
	.num_ioctls = ARRAY_SIZE(xe_ioctls_admin_only_pf),
};

the only problem seems to be that we have to make this choice sooner
than today we detect PF/VF mode, but OTOH the admin-only-pf flag is
only available as configfs attribute so we can just trust that flag

> 
> In this mode, no DRM device entry is created; however, sysfs and debugfs
> interfaces for the PF remain available at:
> 
> sysfs: /sys/devices/pci0000:00/<B:D:F>
> debugfs: /sys/kernel/debug/dri/<B:D:F>
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> ---
> V2 -> V3:
> - Introduced new helper function xe_debugfs_create_files() to create
> debugfs entries based on admin_only_pf mode or normal mode.
> 
> V1 -> V2:
> - Rebased to latest drm-tip.
> - Update update_minor_dev() to debugfs_minor_dev().
> ---
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  drivers/gpu/drm/xe/xe_debugfs.c               | 18 +++--
>  drivers/gpu/drm/xe/xe_debugfs_helpers.c       | 78 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_debugfs_helpers.h       | 27 +++++++
>  drivers/gpu/drm/xe/xe_device.c                | 20 +++--
>  drivers/gpu/drm/xe/xe_gsc_debugfs.c           |  8 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 20 +++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  5 +-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 20 ++---
>  drivers/gpu/drm/xe/xe_huc_debugfs.c           |  8 +-
>  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 23 ++++--
>  drivers/gpu/drm/xe/xe_sriov.h                 |  8 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  5 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c              |  5 +-
>  drivers/gpu/drm/xe/xe_tile_debugfs.c          | 10 +--
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 14 ++--
>  17 files changed, 202 insertions(+), 73 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_helpers.h
> 
