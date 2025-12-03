Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE30C9F163
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C63E10E7D2;
	Wed,  3 Dec 2025 13:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BPZPCcBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273ED10E7CA;
 Wed,  3 Dec 2025 13:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyYvHxMXaFmHCdhmzPUY2G/+A8Z3pBQnMR4djj5P7d2Q8/8lBY6ZjrDSHMKsPuqm5j9Ce0VjnFZxp/juX8N5M6LndMotwYGAn+V/scCFaAq80yxr0IBE/UQNcCx4Sdak9IzRanFXPUryOBLIUpJe+azppTn+lz8yCg1++vWuhi0KYCv8y2+2VAFv71rFBaqSrP5sseVSptsXb6JMR2jOTtwdKFSnndMJVN3ZP4ZoHcKOkRsPku8H3cq+l19mTThl6W0lOVxWhDB/OzKUb6dmLRCMc8UDfKY0OaXzvhwAZPDzuudKyPSo7afoEOMYFdbCYA2zTdZilzZDDuHdsgWYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta4+B+OGBdjsQl/IsAoKX+q9RDsQHMp/0mxmbbVLwZM=;
 b=LFqBHe+fI6lEiag6pZ6ET65AyCqe3Ejcv5E+r0Vup0YD1sKBO8ehSD+RyYZgsb+eekBjr47wBF0lvZu7yJUHLUQlhEzZd+jZydwd/dmgCu3ETiuRcs7nh34XQ8cJGwGnnSS5BDNeM/4s8TgNBHEttii1zvx6fV2OFR5vjTHsofnKtqesxNgzbqBtbR+RP6OE2zMokm2KDgEsV23xNDBSl5yTyUmm4c/thJfchljfpw5SWpWRt+4HgDQhIJSQBZXgmnMxvwOlnbd2HzaiIaqcOuQ82e1W5/obOYUwotJJHOMKyqjCQHFS4Aj9sn+yWJh8EvFVVEzknAgMqwvkHPCNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ta4+B+OGBdjsQl/IsAoKX+q9RDsQHMp/0mxmbbVLwZM=;
 b=BPZPCcBxoKRRfoX8K2gkSwWbIUmq6FyRcZrArhe0ephNjeKYMQTR/ypbithh+DJIlBe0vzFlC3Jj6W15FOL9PoTnsA0c+UhXnBfuoG6gn80Nz+XWDAg7UNRPOwbHvfhmAqm69JEpCBQYNdlpj14O/VV73sAhtNQ++4hbvnX/q7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:13:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:13:15 +0000
Message-ID: <188a99e2-77bc-40b6-9d87-073a19497e20@amd.com>
Date: Wed, 3 Dec 2025 14:13:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] dma-buf/dma-fence: Remove return code of
 signaling-functions
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-9-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-9-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3d8f69-5e6f-4cac-7b9c-08de326db80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE53cWFHUy9mSHBHbE02eXBCVlBUdDl1akRZblVDdHllQjZ6Tmd6RXJqdVB1?=
 =?utf-8?B?OHBicmttNGFuWlphK3VYZUxyV1gva1pvOWpPOTVDRkZPbGFtNDhBV3lWcXRj?=
 =?utf-8?B?d0hZb3RIVXhlMU12UWU2QmVjYWo1djE1bjM0UHRJQlROSXQ1ZEg3NnV5WFlo?=
 =?utf-8?B?RUpueUljcHUyUHkvZDJWVVdHUVFLYmRaT1dXUVJKUjArMkdQUlk1MXcwb29w?=
 =?utf-8?B?T2Q5OEpWbi9kL2pNTVNKdHoxaUM5STROZjZyUzdSRE5ldGpjcG1pN1ZPb1Z1?=
 =?utf-8?B?NEFRNTEwKytxbWpnT3R0ZmdUVTRmWjhlb2dMdm1OY2FsaWkwamVzOE1aQVdn?=
 =?utf-8?B?Ui9uV1lCUm45QzRjenNXbzZvMkowYlZRMFJaZ05jUVNhdGJJUXpMSTlvL08y?=
 =?utf-8?B?WWxYQm9BbTRjWlJtTzFwZklZNVBBa2lWNEF3Z3VRWkY5ZTJOZ3d6aHNITzZ4?=
 =?utf-8?B?SlJSNC9FcU1rZHNpY3ZYbElraG56VVNjRHF1NG9YT1dXMzZER0lDcEM5aVVO?=
 =?utf-8?B?bU9sVWZHMVNabzJSR3RnVWtVSzJzdUFmT29YSzM4ZzZ5K2NXbzF6NkJ3bnE4?=
 =?utf-8?B?SVRzNElmNkNjU3psZTVpbEdtbHZtUitHR0VqQWE5cXhLYWpPZERZbFc4WGVV?=
 =?utf-8?B?NXFidEx6YVFYOEVLQzA5QmlkTjdqVUhyY0tHRUpucHZaL21LTy8rdkJsajU4?=
 =?utf-8?B?Z002dHVGVXh5ckRQYVF1aHdhTWh5K2d4Wk5ESHh1aWdxWGd2Vkd0QkJvZGdJ?=
 =?utf-8?B?SEYyN21UR0puY090TXVyYjRyYXVWenAxa2pZSWg5Q0JQRnB6NUIxbHgweU8r?=
 =?utf-8?B?dDFVV0VGemJlZXZwUGxXOEFqbjhZVkVXdjVpR041ekpCOXE0dVBvamZreVky?=
 =?utf-8?B?VjFwUDZsSy9pL0xtcnVkSUZzaUxuaTRxOXVJN2lzdU56cmRhMXdvWGRGS0ZQ?=
 =?utf-8?B?SWMwd0k0K3hqZ2RoNHZVcURKMVpqZ2pHd0VUVkx3aGpmRDA1VS9WOUNNZmJG?=
 =?utf-8?B?QlZPb05YNUlzM1poRTNqQWs2MjZRRVNCUGNvVDg5V2UxQXYwd2J5dmNFRFBJ?=
 =?utf-8?B?SU8zdVRrYlNubFVKNGg5QlNBUlF1c0dsR2huM0tjbVJ5b1VQV3p4blpxMGRG?=
 =?utf-8?B?RmtPMTllZ3hJTDE4Y0gwMGlaSGpzWWZRVDlidDQ0SVVPdEFmUU1BaFMzOFpM?=
 =?utf-8?B?SXFkYVVJTDhuSGNibEZzNGMyQWpwdTZOd3A1M2NrRnV5QVRVVklKeWFiUERt?=
 =?utf-8?B?alF1RFNJcm1xRTd0NEtLUFdJWnE2Q3ROWUxpbnIvQ3kwTHY4Vk1EaStLNHBo?=
 =?utf-8?B?ZGxpbG1Bd3U1V2hheTh6T09uSG5DNHVNTGdCcEZlc1pQQStJWVgrOWdEVnpZ?=
 =?utf-8?B?WEo0RjliL3RQcEZQc25nUzU4M3RnWUNBaFZMQ2UzeDNlWUZaaHozc0txRkt0?=
 =?utf-8?B?NEhrZG9RbkgzWXFiU3BSTEsvaFp1ZUEwcGlTZmtGc2FYZ2RiSFpmemN2MDVT?=
 =?utf-8?B?YmxJM2NBNmU5cUhvdVFXZHdjVHl0MDNUdmwzWXNQOU43L0FhT1BTR0xtbXRp?=
 =?utf-8?B?d09meER1TWlEcDR1eldHb1JXTGprUmRRN01PUElCNjh6dHNNWmw5YjVMd0J2?=
 =?utf-8?B?Vkh0NXhkOFN5QzNOSGtrK1gvVkIxdzhIK2IvMGFOQldHa3FMcDBQT3JYYTJ1?=
 =?utf-8?B?OEo5TUFoYk5MZm01Zmd5WENINE5pYittNE9hU01zS0c4cmNJN0Rvb1dudnV3?=
 =?utf-8?B?Sk9lam1KVGo0cVdaVGlmVmN4YklCQlYyTmlQMVRHRVZLRTVMaktnaDEzQWFB?=
 =?utf-8?B?anFjalBJdFdIYzVGVGxaWnVSZEhscUtudy9kWFZXMC9obnA5Q3JMTkw4WWpp?=
 =?utf-8?B?ejVsK2s2dUJXaXh6cDR0S0Zpc29vclcwdExBQTlSdUFHWStBYzBsOTVkcDZJ?=
 =?utf-8?B?K3B1Y2t3SG5qUTA4T3hyc08vaDlNc2JMTWVaK01Uc3dKTi9KWDVTNm1kZkVv?=
 =?utf-8?Q?RXw1aBqdlPzMM21lJl+zxL7kFP1soI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3B2SVZoNlo4bmhSZlBsdmQ2OEhwQkloR2xFbkFNOStocHU0WnhTS0UyWWVL?=
 =?utf-8?B?V2pYditpSEllemRaQ2Fxci91ZnFWaWJnRTZmRGd0YXdYbTlZNGVBSEtCaGYy?=
 =?utf-8?B?em5XNkZ0cUFsTGYzTFZrR3EySjAxVEN3SzdKVy9DZjRmZlVXMzlFMHQyeDd2?=
 =?utf-8?B?MHczdXVqSVhoK292enRMNVdDakFtVEUxZnpMUjVlMk5pZzRXYlIxSVYzeHR0?=
 =?utf-8?B?YTh4eFFtcXJIazJOZlg3REJEMVdmRXE4VHNhdGpXUVYvc2t1TjRhV1RzSDlP?=
 =?utf-8?B?NUpzTEFyblpMS1JUemZnWjFLRXd4OXplTUpIZ0VYYlpIWC9CcUFYSSt5TXFr?=
 =?utf-8?B?Sis0ZERnWUhtbHQ4TExVbVEzN0tCMjFUSlNrUkVBNXZoZ0dBQy9UZmhYTDJB?=
 =?utf-8?B?VG5KYVJXaGJKeUxtOTk3czM3cnJkeGRZNXZZNkdFUUs2L1JSdnl2MHBMd2RI?=
 =?utf-8?B?ME83RW9FQjJUYU85R3oxMktlVk1WQllveStHbnduc2FQVTkxRlBRN0M1YU0v?=
 =?utf-8?B?UGpYVk1aZTltWFFqWnM0YzdWaFZVRUNKZS9YMWMxWkM2Y2FUaWo1MUpVK3h1?=
 =?utf-8?B?T0lqRlNIb1kyS2RSekduNnJWblB3Q0hTcTR3N2poRExReXpHUW0vRWhlQW9y?=
 =?utf-8?B?SENud0R2L2t0RjllS0FSUTRnS2I5ODBPVjltQU1QNElpSi9BK0FBK1ArREtO?=
 =?utf-8?B?Ky9KQXlZV1RRazZKUVNTVVZIR1h3SGd2eGtmaXB6V05BNU1VWXNJaGhuYUd5?=
 =?utf-8?B?OGN6ZG9VQ3NLWUR0b3lPcC96N0RLWVdsdnVWTG9mZ0c4WFdYb3JmaldWWElG?=
 =?utf-8?B?SFVZbFVTWk9QNkRaeTI5R3RMNldRbDVRMGVHb2c3eHZRMVFqN1F4d2hiZDg4?=
 =?utf-8?B?SnR4MlVvQ3ZScnpIWXZXWmw1VEFNbE1Eb1o5K050WE5OMFMzUGl6NW1oK3Zx?=
 =?utf-8?B?RjZ1MWlsY1piMW1TQUx1T20yVTN6TGFmU2xLQVh1NWdJTlA0bzFwSXl6U2FQ?=
 =?utf-8?B?M0JKQWpNL2hBbzZoZE9YM2NjWnRqMFZjZnAwb1I5U3dQVjhGS2dCUnd5T2lB?=
 =?utf-8?B?NlN0eXV1N0pONHBFUzFCZEFzdVkxb2VxZ29QQjJXa0tNM3J3VjIxQzBiVG42?=
 =?utf-8?B?d0VvU3IzVG9pV1lFcVhITndmcWI0OWEvK0IwTUo0S0VvNStveVh2TWZhRUpp?=
 =?utf-8?B?dmZyeFkxSWd6c0l4RGRkbUNXODhVUXFUN1h5b1BveUk4MXI0bUJIMEVLWTN1?=
 =?utf-8?B?bEZpTFB5bVlHUndxTTE1dGlMeE40YThBS1VtWFdtY2dxQmlYc3lQUVJXZTJC?=
 =?utf-8?B?Y25ZVUxWakFIY1RxSU1GK25YVk1rRzdoRkhmYWErWlpEaVRRRzdyYnBMRkJZ?=
 =?utf-8?B?RjFxZXBoZVVKaStFOHV1OUpjWG5DNTArajdhdlR4Q0NYNC84dGNnQU9LOUow?=
 =?utf-8?B?ZCtYZi9zNHF3RldHWlV6eHVyUGpBc1RUbHlxUU95bkdQc1lIaUJqdnJ2K2Ja?=
 =?utf-8?B?YXJqTGQ5RHhKY1MxdmZNVzZFZlNzdmlNRWwyVkIzNVZKblZEbGRPaWZJQXpX?=
 =?utf-8?B?WmQ2WjUxK1VyUnFhNzgyRW9QRG5HcWExbzFGeThYR2Z3YmJlTzVRamlNNW1C?=
 =?utf-8?B?dnIzblpUVkZDSGF0ZE1BUWVwSlpvZjhNSnppczlUMmEzU0o1WUdPTS8xM0Mw?=
 =?utf-8?B?aUJtSDdHWmI5ckh4WG5NdkZRMVJkaDhoSVNRV0lxbGRYZmpiWFFtUC9vd2U3?=
 =?utf-8?B?K2RsdWE3TWZ5SzdUdjNuTDZZZ00vOTA3T0RlbTZMeWplN1BmWS9NWVJCSGdn?=
 =?utf-8?B?cWRGN01JRm9mRzNKUHNUSHhhVzVmSjRIL2RlemdOdzExQ1VaamZkRnBnVDEy?=
 =?utf-8?B?OE9LdDk3cGRLVG8zVkk3a05GcjkzVUZuNGxucDBsWjdsRVlVdkZoR0piMUM3?=
 =?utf-8?B?ajNBQSszQ3BkTFBNMkhUdERvMlhUakR2RkplZXZwaVBwRTB3Zlp3YWk0Nk42?=
 =?utf-8?B?ZG9qNmpzZDhUL1cxa045UHdMMDVMcG14cWprSmV4OEgvWHlrcXloTUhaMEN3?=
 =?utf-8?B?aXFkK1VSaFlybjNzbGVQT3VCZnNrbDNIZmVZMi9RNDJDa3hwZkdnRDNteS91?=
 =?utf-8?Q?fleg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3d8f69-5e6f-4cac-7b9c-08de326db80e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:13:15.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ocr9buocon6aJ5sCyNb5TIvTIsh5qsD0gA84UvezWfA1iZdemOSKmI7I93lxkkH1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
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

On 12/1/25 11:50, Philipp Stanner wrote:
> All functions used for signaling a fence return an error code whose sole
> purpose is to tell whether a fence was already signaled.
> 
> This is racy and has been used by almost no party in the kernel, and the
> few users have been removed in preceding cleanup commits.
> 
> Turn all signaling-functions into void-functions.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 40 ++++++++++---------------------------
>  include/linux/dma-fence.h   |  9 ++++-----
>  2 files changed, 14 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 146de62887cf..529a44371b35 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -360,11 +360,8 @@ void __dma_fence_might_wait(void)
>   *
>   * Unlike dma_fence_signal_timestamp(), this function must be called with
>   * &dma_fence.lock held.
> - *
> - * Returns 0 on success and a negative error value when @fence has been
> - * signalled already.
>   */
> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> +void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  				      ktime_t timestamp)
>  {
>  	struct dma_fence_cb *cur, *tmp;
> @@ -374,7 +371,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>  				      &fence->flags)))
> -		return -EINVAL;
> +		return;
>  
>  	/* Stash the cb_list before replacing it with the timestamp */
>  	list_replace(&fence->cb_list, &cb_list);
> @@ -387,8 +384,6 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  		INIT_LIST_HEAD(&cur->node);
>  		cur->func(fence, cur);
>  	}
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>  
> @@ -403,23 +398,17 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>   * can only go from the unsignaled to the signaled state and not back, it will
>   * only be effective the first time. Set the timestamp provided as the fence
>   * signal timestamp.
> - *
> - * Returns 0 on success and a negative error value when @fence has been
> - * signalled already.
>   */
> -int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
> +void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>  {
>  	unsigned long flags;
> -	int ret;
>  
>  	if (WARN_ON(!fence))
> -		return -EINVAL;
> +		return;
>  
>  	spin_lock_irqsave(fence->lock, flags);
> -	ret = dma_fence_signal_timestamp_locked(fence, timestamp);
> +	dma_fence_signal_timestamp_locked(fence, timestamp);
>  	spin_unlock_irqrestore(fence->lock, flags);
> -
> -	return ret;
>  }
>  EXPORT_SYMBOL(dma_fence_signal_timestamp);
>  
> @@ -435,13 +424,10 @@ EXPORT_SYMBOL(dma_fence_signal_timestamp);
>   *
>   * Unlike dma_fence_signal(), this function must be called with &dma_fence.lock
>   * held.
> - *
> - * Returns 0 on success and a negative error value when @fence has been
> - * signalled already.
>   */
> -int dma_fence_signal_locked(struct dma_fence *fence)
> +void dma_fence_signal_locked(struct dma_fence *fence)
>  {
> -	return dma_fence_signal_timestamp_locked(fence, ktime_get());
> +	dma_fence_signal_timestamp_locked(fence, ktime_get());
>  }
>  EXPORT_SYMBOL(dma_fence_signal_locked);
>  
> @@ -498,28 +484,22 @@ EXPORT_SYMBOL(dma_fence_check_and_signal);
>   * dma_fence_add_callback(). Can be called multiple times, but since a fence
>   * can only go from the unsignaled to the signaled state and not back, it will
>   * only be effective the first time.
> - *
> - * Returns 0 on success and a negative error value when @fence has been
> - * signalled already.
>   */
> -int dma_fence_signal(struct dma_fence *fence)
> +void dma_fence_signal(struct dma_fence *fence)
>  {
>  	unsigned long flags;
> -	int ret;
>  	bool tmp;
>  
>  	if (WARN_ON(!fence))
> -		return -EINVAL;
> +		return;
>  
>  	tmp = dma_fence_begin_signalling();
>  
>  	spin_lock_irqsave(fence->lock, flags);
> -	ret = dma_fence_signal_timestamp_locked(fence, ktime_get());
> +	dma_fence_signal_timestamp_locked(fence, ktime_get());
>  	spin_unlock_irqrestore(fence->lock, flags);
>  
>  	dma_fence_end_signalling(tmp);
> -
> -	return ret;
>  }
>  EXPORT_SYMBOL(dma_fence_signal);
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 0504afe52c2a..d4c92fd35092 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -364,13 +364,12 @@ static inline void dma_fence_end_signalling(bool cookie) {}
>  static inline void __dma_fence_might_wait(void) {}
>  #endif
>  
> -int dma_fence_signal(struct dma_fence *fence);
> +void dma_fence_signal(struct dma_fence *fence);
>  bool dma_fence_check_and_signal(struct dma_fence *fence);
>  bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
> -int dma_fence_signal_locked(struct dma_fence *fence);
> -int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
> -				      ktime_t timestamp);
> +void dma_fence_signal_locked(struct dma_fence *fence);
> +void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
> +void dma_fence_signal_timestamp_locked(struct dma_fence *fence, ktime_t timestamp);
>  signed long dma_fence_default_wait(struct dma_fence *fence,
>  				   bool intr, signed long timeout);
>  int dma_fence_add_callback(struct dma_fence *fence,

