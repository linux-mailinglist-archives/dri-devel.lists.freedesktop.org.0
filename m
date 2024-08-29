Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA9963BBA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02410E380;
	Thu, 29 Aug 2024 06:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Jwud5f1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062.outbound.protection.outlook.com [40.107.255.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC6C10E380
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oura1+KcdqqZW1roXYNJ4Ns4tdeXWpQ1t0RmmTiAMHeUg+nDjeHXln8Y3XPPv9SJ5YB7QD+V/UNSSqTRH5RHQ/Cgudj854JmDY/J7E5vJQ5uBtARel+qBcTPFz2K4ogrhs0uQ816FUaNolmilcn4D7dbcqOwVCuckhftCPW/iu1pwlUE4XxLvdGGDD05e/VV+8BioRaycPq1ISupzmBlwZ5FcMQwpEO3m19oBJMui3PDHSa2/+XnZ4MwWHz1i0PjA1nh3vy+zSHBrUwKm7yxwLmfeWhrklRi2TKYeAucIoBoSxuD1KQjT4036i2Hyn2hCYJHyOv8OFYT51prRbuInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXiArJkHOVeBjnw6LhYxjtGhJW300DCEkuMmQ8RyAlo=;
 b=VGl7oPMXFF8yvhJ/VLevc/LDTCS86WREp/mdmSDIRyzMTz2xfzYVooITWI5rzKUIq9O+ci0HH10lOqyDhvkml2ecqRuFPkWulRnWhf5li+3sWtlIv7K/93iIwAFknZmCL5W0IzG1W91VuZRU4T77mbk3xMgzifxIuUwGnLPY8cxJLVVpcfnJWU/wn3DdRDMfTIcogPz+QI0a/YjSNQfHv/QP+TgSm2/J4Px3cDWyNggGs+dsGbhj6YeSG6jLCqNwQ8+jtUli+PZGP5DkonA5DCondPPE8c4bK7yjyW7Ksvymm7tjB0A7HAsWLf+o9p+m9zebjrET30jiGPOw6rmmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXiArJkHOVeBjnw6LhYxjtGhJW300DCEkuMmQ8RyAlo=;
 b=Jwud5f1HQjr8OsZeLcCXSWQTwUd23eYixhL4TCKcGGsJCHkE9epVzWS7as9tIMBM0ZmJLeTsBKcbWO2A/hKq9A+Q0VjzQplOvZcRRIqyw8s9uq2LJuIUmb6ua2lEeLmLJZ9HquSoJJ/AFu05CvubMIY/d/kTP3tApd4M0H0oIvWlUu7kh72qkQnSbBv46lVYnWWfVj/M/OVQErcPBAv2m8k4trwm4A+ivNPU9Kj24N26hwlKuJUw0o57uqPnKL03CWzp+eDoEfJQimwyRjM5vKoJG7JJHYezTSN1ATU/oCJZ3QNEO/Aq+LgYcyHJb+BAfs6ey7TW4N3DNPFjM/v/Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB5689.apcprd06.prod.outlook.com (2603:1096:101:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 06:35:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 06:35:53 +0000
Message-ID: <34b3b1e9-353c-4a31-9e09-d4ba5d28eb51@vivo.com>
Date: Thu, 29 Aug 2024 14:35:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-2-link@vivo.com>
 <IA0PR11MB718571990B58A16756C15E2FF8962@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718571990B58A16756C15E2FF8962@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ad7da7-6f12-4989-73e4-08dcc7f4d498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3V3MzAwSHR2b2srYmV6eWdwSkI2Z0FmNWl5Y3lTYVd4bElBMFo2RkpVMVNz?=
 =?utf-8?B?ckUzNmVjamVjM0wrTGtVQXpEako3MVRvZDc1bDdjV2ZuRWpteS9vVzR1Tkdh?=
 =?utf-8?B?d3ZOTDNHQzhsR3dCOTFQUVV2blFoYkJxMUxsVVFTZTYzSUtFdEYzRFVWaFJt?=
 =?utf-8?B?Vjg2VzhnOW9NVS9ac29JNDUvZjlhc2xHRHprb1JzUlQzZWMrVFVDT2taZVdy?=
 =?utf-8?B?cUxJbGFmV2I1MHJSNzhEazgxeVdMOXJ0VXM5UUp3S1p5KzZGOWVjb2VjbHFE?=
 =?utf-8?B?a05Lb2JRMFIyRUFGY2hMblB1eE9lQ2pVN1M3OUE5U3Ywb3ZiQUR6aHJrSUJE?=
 =?utf-8?B?VXhsK2RPaS9WbGFlRGRFelZJMEYzdmFBWk5wazNSNW4wZUM5c2NvSHdmTUxE?=
 =?utf-8?B?c1RHekgwOHRSRjJDTHNmVjViem1sSEJxdW9wNjJPbFVwN2ZqTU9KbXhaYzNC?=
 =?utf-8?B?UXJHeGhyTk41VVpxNzlUQ25XSFZ6alAwSUg0Z2N4MVdRMnVDdW5LN0hiblJl?=
 =?utf-8?B?N0VUbHNZOGZGOTJ4bUQxc3dTbDBxM0llSmNPQnppKzF5QjhlaGF5S0QwK2Yv?=
 =?utf-8?B?YWdXTHNLeXZ2ODBYTHJwVUNFS25NYnFXYXhwMjN3TDZPaHVibCsrVVcwMTR1?=
 =?utf-8?B?NUtGaC9teFZNRVEwV05jeCtTV2Rjb0hwWSt3cThId25pN2ZRZVJoWTQ5UUFk?=
 =?utf-8?B?WXd3aU9qZ1hMTkhzSXVOQmpCWGVjZlBrL24vQlh1V3ROdVhxei9vN0IrN3Fk?=
 =?utf-8?B?ZUhqNElqK1UrZDF1L3FUV0RVa05VZlY1ZXRZU2VnSnBrZXF3MFFCejNzdUVt?=
 =?utf-8?B?d2NvcXhacUROQUlwSlFWK0NpZmxEbmxZL1NKVVpMUE5PazlneHJ1U2xieVUw?=
 =?utf-8?B?a0FHb2pJQUM5dHhsb3hPaURmQjJLajQxUzVVRTB0eUM3blBOR3lCalhmNmZh?=
 =?utf-8?B?aVNFTE12WXhiTjhGS1hGMU8yVnF2NDNZZ3dCNzdpcU90c3VQb29INkxhR05J?=
 =?utf-8?B?dFYxMW5qYTcxL3RHNkQxVkNRSitwNGFNdkw5bWhNWjdoT3V4alNQS09iaksy?=
 =?utf-8?B?MUlUUlFjTWYrdHVKaUhNVmN6UUZMdlNEZytuUVBleXRWUHZCM1hjUko5cmRo?=
 =?utf-8?B?clpENHN4cEwwUnRWNHlOUi92dDcyVVZMcUJoKzF5ZHJSMTN5Q2g1WFBoTDVs?=
 =?utf-8?B?TjZqaVJxRE81QU51NWhNUmJUMWFoN3ZEUThOY2tEWnRHZDQ0Y0xRQ0tsUG1t?=
 =?utf-8?B?M3RESldDRTAwU0tETk12T0hnSWpQT0o2MmRFQ1I1QVV5QnpRRysxcWRYb3N2?=
 =?utf-8?B?YTkwUmNwK2pHWnNVL0hCcEhsQzVBTTFaOVYrKzc2Rkt5OUE5RkdRNzlFY04x?=
 =?utf-8?B?V2NLUHBxZ3FIcHR5SnpNeXB5NXllR1R0N2k4WlRQNnpnN1NjVDM2RUZ4NFZ6?=
 =?utf-8?B?MXpKUVBHNTdsVE1yZVA5bGxQTWdVeVhWQVpsSnlWWi9hUytkK2Era24xZDhR?=
 =?utf-8?B?emJ6TENXNElzRkI5T3B2WmVraWQ3Z0pmZTZaZkl1cWRsZFhSTkNBMy81NHJi?=
 =?utf-8?B?TWl4bHRhQlVXcHUza2RSSnd1V2dXZ2xBRktJeWNOVVdhL20xWDFEdFJpekFV?=
 =?utf-8?B?VU53eDFuTndadFY4bDlDOTFaMmQzWGZhUXNOWGdmblUrdDJuMEUrdnh3MkYz?=
 =?utf-8?B?RENGVjlXNFRvMkNYVjdiSHZhSjlxYVRnMFFiaVVQQllSNVNKWlVpalI3OTR6?=
 =?utf-8?B?dXRMQjJQSFRmMk44d2lPMERUU2ZIZHhtaWg4YlozTng4Q0VmVE9ubDdBaG5h?=
 =?utf-8?B?MUo5aWR4VVJXdUR5aHkyREN4Rmx2a2l0QjJQSGNTWmVodG43TG94SnludVNn?=
 =?utf-8?B?ZnFOakZWVVQxelQ0ZDBSTkhSbS8zM1A4bGhobkZPeEk4eEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VVS01Xd3dtcnFXSHN5ckdHQUlDckZoZ3BUR1h6WWZmYUpFUWtwWHh3eDgr?=
 =?utf-8?B?TlQwWVFjUmo4bkQ1ZlYrTkg5WU90d3dxTUV6OGNDbEp6Tjk3eUM1UCtTNFY1?=
 =?utf-8?B?ZUZaWTQxOW5SWmxJalFkakJRTVBHbWU2L2lpTUxBQ1J0SSt4K0NwOXNaT2li?=
 =?utf-8?B?dFBGQlpVNFllZWpibG1CZlR2Q0ZXbmZzOEtoaEhvQWpQZW11SE1kSFgralM0?=
 =?utf-8?B?dlNVUE9oRkRqWDVoR2tzRWJXTFNRNE5wMnZKOXBRYkpmV2E3eDJ2a3VvU1NX?=
 =?utf-8?B?Q1MybXpXK3M0emFUdXcyWk15SGxXeFNpSFgxWVo4K2J4RjVGaENkM2FVYW94?=
 =?utf-8?B?ZVFXbXVCdFBBVzZ2UVRVMUx0YnRUdW5qbVh6SjZjNS9Ca0Y2ZVNXMmtWRlhF?=
 =?utf-8?B?RUxQWlhjcTFmbm5GUDdaUzRMVThJWm1JV3I4amxYL3dIS1g1MlExaTZvSW5L?=
 =?utf-8?B?c0JQd0pDVWZSdU5oMTZzYmEyYTd3NG1wNzVvdlJXejQ3NG9vWXltWDgxYXpO?=
 =?utf-8?B?T0F1dXh2OWw2TFREZUNadkdTcGg3SlZ2WEl4Wmh1UWVET3d5RFpSdkdOREE1?=
 =?utf-8?B?MmlQT2srQ241aFYvc0J1ZitxRUJDNlE3S1ZPcW1JaUc1YVplOVJhYkxCcVli?=
 =?utf-8?B?SER4Ym56V1FHMmFvUUtQTTlQRmNOL3ZvcnczRnRydjhBNVRyUnRhS0ZMT2xx?=
 =?utf-8?B?YWxKV1I0dVF2eXoxMDBRT0V3aHAvOEhKTXBTem1qUk5FRlR4NXRPTDZxcHpm?=
 =?utf-8?B?QmVxMmdjWGF1NTArUzFTY0hlSFNKUjlYNzFlR21LN2RzYmlsYzhUK2VNd09j?=
 =?utf-8?B?bTl6Wlo4eUUwdEY3cHdVMGZ5SHZaa2xna0hBOE4ybG15dkxpak5lWjVocGU3?=
 =?utf-8?B?QytUcXhmRitJZ1FzRFdVRWk5T0dTL0ZIdWY4MzNERmliQlhQT0xhQ1VlQnQ1?=
 =?utf-8?B?ZUhKZk5QNExXVVl1cXNtTmdtSXdrZFFNTmpxalBpRWtZR3FLbngyWTFtMzM5?=
 =?utf-8?B?T2M0NXB0bVdoVHhTY0E2QURuN0dpbTNORW9YVEFyNjR3L1oyeGhQNm9iL1kv?=
 =?utf-8?B?eDMySGZSb2JtRlhBeFJnZFJtOTgvUTFuNDBVNnhtOHYwMmRtWkNDbUxMN3pl?=
 =?utf-8?B?NHRGdlFrRUoxSW1OTnYwU0hjalJ2MHhJTVhjd1NoVUZDNUU5UjI0aDNFbUJZ?=
 =?utf-8?B?RFA4TDJUT1p1ODhxV1Fvak4zYm9yUTlZb24yNnpuWEJsaGU2VzRZWnBxQ2Uz?=
 =?utf-8?B?NHB1TXlsdk4rNlVJak94MEVGTkthWW1MamMyNWtSaExiaGtwUE1qWG5lbVE0?=
 =?utf-8?B?aDgrRXNLMVNPSE01V1BjNitJamxXbmRVQTBYdlNneW1ZTUFldC9lZnNhenFY?=
 =?utf-8?B?WlFLVHpSeEZ2eHJsbWZwMklTbEFyZkJsa2g4aHVXZGw2OXYybzE2MGpKbGRo?=
 =?utf-8?B?WWJyUTJKaG9yb0p0aitPWEtnVXNNWmlGaWthNGNEY1dBNExzRlhFMWtmdTAv?=
 =?utf-8?B?R2FFYTFzS2xSRTdwRitTVkJMbHptN1JkTU84a3VTamVMbGg1RWZtVFJkczU0?=
 =?utf-8?B?NjlvKzhHakp6ckpKSHorL2NFS0VQdEo1bmNqaFhOd3V0bnAwV0ozVmZVUkdQ?=
 =?utf-8?B?S21ybE94cFoxTnhhZW1EV0k2cjhiNDN3WGZoelJJanNLVVRHV2pZSkc0R1Bi?=
 =?utf-8?B?NW9JZnR4dkg4TkppbzR0YlFnRFlURytwb0VJd0pIVmhFc3BrYk10VExNdnpQ?=
 =?utf-8?B?Um9mRVdyRDE2UngvVmtwVm05bHlaNnhHMmJ0R0g4OEwydm1PeDEvV21kUHF2?=
 =?utf-8?B?UmpGaC9pNmgzTGtsbjNCZVUxWlZKZU04bFplMU5QNkJWeGtJazRHRGhPa2VJ?=
 =?utf-8?B?cHhkcmJyMTJ3dEdqa213cEVNN0lBR3B0dDBrbmhFNk45cEMvSDRwa2gxL1Zi?=
 =?utf-8?B?YWFLTHQwQnhuOFJDL0UwQ0dmRVJMSTdRZCtiVmZrNkhaUDU2U0MwWG53S2pa?=
 =?utf-8?B?RWVST1pUemYvYy8va3JuOVhBblQwVk5YdFBZSFcwc3AvU0lLMlRkZUNSZHpM?=
 =?utf-8?B?UmVSU3pqN0dLMTJ0NzY1ck93Q3JXVmtxZlVvQzFENHhuNGJLWGMwNFplTHNE?=
 =?utf-8?Q?ZNx67JLVh4wKlioPZ1I3vDYvk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ad7da7-6f12-4989-73e4-08dcc7f4d498
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:35:53.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1AloCbfy0kp04An7g0dy6ACtqxv6H+vFtry7O4CjFA7nbwEPy4FZqqbb2vUdik3b0e8P/IKC0sBkQNF/Wp/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5689
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


在 2024/8/29 14:08, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v4 1/5] udmabuf: direct map pfn when first page fault
>>
>> The current udmabuf mmap uses a page fault to populate the vma.
>>
>> However, the current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically.
>>
>> As a result, the page fault has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> when creating a large size udmabuf, this represents a considerable
>> overhead.
>>
>> This patch fill vma area with pfn when the first page fault trigger, so,
>> any other access will not enter page fault.
>>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..0e33d25310ec 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -43,7 +43,8 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
>> *vmf)
>>   	struct vm_area_struct *vma = vmf->vma;
>>   	struct udmabuf *ubuf = vma->vm_private_data;
>>   	pgoff_t pgoff = vmf->pgoff;
>> -	unsigned long pfn;
>> +	unsigned long addr, end, pfn;
>> +	vm_fault_t ret;
>>
>>   	if (pgoff >= ubuf->pagecount)
>>   		return VM_FAULT_SIGBUS;
>> @@ -51,7 +52,28 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
>> *vmf)
>>   	pfn = folio_pfn(ubuf->folios[pgoff]);
>>   	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>>
>> -	return vmf_insert_pfn(vma, vmf->address, pfn);
>> +	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>> +	if (ret & VM_FAULT_ERROR)
>> +		return ret;
>> +
>> +	/* pre fault */
>> +	pgoff = vma->vm_pgoff;
>> +	end = vma->vm_end;
>> +	addr = vma->vm_start;
>> +
>> +	for (; addr < end; pgoff++, addr += PAGE_SIZE) {
> Although unlikely, I think we should also check for pgoff < ubuf->pagecount.
Ohh, yes.
>
>> +		if (addr == vmf->address)
>> +			continue;
>> +
>> +		pfn = folio_pfn(ubuf->folios[pgoff]);
>> +
>> +		pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
>> +
>> +		if (vmf_insert_pfn(vma, addr, pfn) & VM_FAULT_ERROR)
> Shouldn't you store the return value of vmf_insert_pfn in ret? Otherwise, we'll
> return success when the above call fails.

If anything wrong in there, let it report when it true access and then 
report. Not in there.

It's pre-fault, 'this' page's fault is already dealed success. No reason 
to report in it's fault.

>
> Anyway, I am wondering if it is more optimal to just iterate over pages instead
> of addresses. Something like below:
>
> +       unsigned long nr_pages = vma_pages(vma);
> +       unsigned long addr = vma->vm_start;
>
> -       if (pgoff >= ubuf->pagecount)
> -               return VM_FAULT_SIGBUS;
> +       WARN_ON(nr_pages != ubuf->pagecount);
>
> -       pfn = folio_pfn(ubuf->folios[pgoff]);
> -       pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +       for (pg = 0; pg < nr_pages && pg < ubuf->pagecount; pg++) {
> +               pfn = folio_pfn(ubuf->folios[pg]);
> +               pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
>
> -       return vmf_insert_pfn(vma, vmf->address, pfn);
> +               ret = vmf_insert_pfn(vma, addr, pfn);
> +               addr += PAGE_SIZE;
> + }

Maybe mmap with a offset? just start from 0 not too good.

This seems clear, but is it not good to handle insert pfn error elsewhere?

>
> Thanks,
> Vivek
>
>> +			break;
>> +	}
>> +
>> +	return ret;
>>   }
>>
>>   static const struct vm_operations_struct udmabuf_vm_ops = {
>> --
>> 2.45.2
