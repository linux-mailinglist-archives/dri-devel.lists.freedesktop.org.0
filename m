Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8288A9E8C4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCC710E1E5;
	Mon, 28 Apr 2025 07:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="H4K8ojtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1C510E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmaNThclFJXfPIg+TN7J65fY2qcqEtPSGgG6w3phxToe0Uum4KcUSuiHP74t0gL1CeQSTo0/S1jLvDnY45W9EORSNvSGscR1kjQgQddP7LNkL8WfEc7f0JHThZAJMhMKuWXhm0M9QdnEIpfMP+mZXdfXe6x1WGB7ELQk4seNMsScX/tvDMayNfYB6DB6w6a6lXIt8Vrl7VZun0z+Z4j4mhoQbt+u2wLVY58lDsMN3vzpznE4TWdePDQnVuXBs4pyZnmMYiCtRCl3gWUwxnV3ARkEKRDmxr8yOOYefjZdH+Ut5tXX+y7X6Vsl1NqVm5Sk9QiGzqsq/6uOnQaCVphkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3saixAML2VUGusm9AYcp6Yvl405I9RHeRBGZnM96/dU=;
 b=G4WMGZmj2wUlA0JurIwx5cMPjPqFfNYv7wanNzY0mqEzOaAi8CgCb6TQT6Vbs0+hNUH9aXOo50JAjCjoCYQDvXQRpqG+FVBhvhOFFvDmsS3yVb6uuCt/AaMZ+90oK7lhzJwazijUS5j6kzRh1QfqY48kln0QakfEUpDORnr9gKO0a++ZRT+kIIe8e7FCFJhw6xwB3jU+pgoIPNTLnVeONhOSt7eDMSTm2GvEOhFDRDTYxIjrjacxQiopotIifhYSPgv2obNnk23kwP8qPV3kB8fpaPNaOexhQ0fF9rIEGTdN/jKWAtfHGUJ7Yl0vwvXZl3jfIxLWN8ch08fEs48/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3saixAML2VUGusm9AYcp6Yvl405I9RHeRBGZnM96/dU=;
 b=H4K8ojtIt4TZLSzIqUkXZ0c6U2YlPav4r6cLPaKf8ABpIe12u8LovagXAzkfaTFepFgLSbrwKliPQfMMTANrYJYFnWB+bpnjWmnjxYzYVBoi6RTzQ9CHH8Z8j9a/JXUUyiZ4KSlVYKaKggRED6/g1zAcb9tjENLDkSXdcpchxubOoPrXDJ+Nqw2IqcTgp1P6mTizcEs6NzLlRckf2MVK8lIhaFk+YLjqHcYYGqvBPNBiP4MRVWfler0JbqkkrrgjKlhWS/08Zyms0j1UEk+8Xf2daRVkXRwr9moc5NRrq+AF27RzojZIodny0iXnpLEVVhQjxKSnsvwyYOjGnsMWjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6979.apcprd06.prod.outlook.com (2603:1096:990:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 07:04:22 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:04:21 +0000
Message-ID: <b077248e-8af5-46be-89a5-100da3ca35ba@vivo.com>
Date: Mon, 28 Apr 2025 15:03:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-2-link@vivo.com>
 <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <63297d3f-5e37-411e-8150-108a03a01a89@vivo.com>
 <c752a31d-e7c5-49bf-8722-8eeaf582a4d1@vivo.com>
 <IA0PR11MB7185FC46BE53F16BA6A9C7C9F8812@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185FC46BE53F16BA6A9C7C9F8812@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYBP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::30) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 332e716d-6918-41e1-200c-08dd8622e691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVI1WnJIaXdpYndvdURlaGJpVE9kb0F3MlBISzdTOGk1UkMvTUJZMHNReWVO?=
 =?utf-8?B?QmUwRGEzUEVHdjJQNCtCZkF5NHd4UlorTnFHQUpNSXdWcmF2T0tKWWxyaW1Q?=
 =?utf-8?B?WFdSZ1NXdG4vYlhNYWdOR3h1SzVNdjZOS2dXVHVPRFcvVkk0OUpVTENEaWZI?=
 =?utf-8?B?dGtiU2NHMFpPb0s2M0s0cGcvWkVVWWFOamVCTldvMW5KNGtOQ3UrYmR1NVFV?=
 =?utf-8?B?YnpxaUJFblhuRWJPV2hQenZjandKUE4vWU1pTm9jUE92YlQ2Z3ZjQTBwdFVV?=
 =?utf-8?B?bk9QK0hoRkxjWkkzZTVuWVE3TDcxWGozRUZ3aUZ3UDVyNVZITEpEZ3NiWnFN?=
 =?utf-8?B?V3J3dy8zSHN4SFFMQVlnWFFKSXBUUjd2VWE1ZmY3alJGRis0eW93Z2YxcnpN?=
 =?utf-8?B?cFM2d213ZVNwcEJQaU1Ka05jdkVDYVZtcE91VytjbXhrVVBmQnJRNmw2VDVp?=
 =?utf-8?B?cGRmVHBQZ3pSOUJYUGMxWHl4N1o3aVdoc0MyQkExRWJQaldBRkhMQUdYQzY4?=
 =?utf-8?B?OGdnK1JNREdTbnpkNVFqdTNJMDVkMUZLQlJUay9HcnhwcldiYm9IeGxSYTZG?=
 =?utf-8?B?Y0hCOFo2T3F0cW9menRSdDRWRndxZ3N3eFJLU2J1enIzU3FkRVA1aHJMNXhk?=
 =?utf-8?B?ZlNHemV5WTQrTnhTWElmM0hpbGNrZko1VWc3Y20wZ2YyZHVYY25ySWdaSUtR?=
 =?utf-8?B?U2wwd00vbGpmYU9kRXVZbU4valY2Z0cydWUrWEZ3T1I0ZmpIeUd4YmtmUy9Z?=
 =?utf-8?B?dms2WTBlRXRZT3JHOEErcHlPMS9XWVFwanIya2U1YVdHVmFDSzVMYVVoSmxB?=
 =?utf-8?B?UjVYVytRcEUwSWorM3lZaS96aEczLzkzWjlYa3pJekdkNTlWOENwYmpUVzcr?=
 =?utf-8?B?b0ZwemNXa1lnc1hLb1h3K3JSNmc0Qmt3TklnYnU4VzdWZVMrUFFWdGxjZ2Rp?=
 =?utf-8?B?WkZCM0RDUlFib2VLRWFpQWE0ajBnNFdaRUpOZmlSbm9vY0ZYdEx2RkRMSTF2?=
 =?utf-8?B?WUc3dnhUME9TU09nWnFSbUJuQUVvck9PR29nSGVBL2lzQU5kRnZZL0lWV2h0?=
 =?utf-8?B?WWNrRWxjKzVMejQvSGNiOTJCSXM4eC8xYVUrYzR3UElsYlRLLzBKWGtXTXBh?=
 =?utf-8?B?WVdjVE1QUnU2elVXYVo2VWpLSHhKMXpOM3Q0SmNBSjVBNzdvbEVTV2RIemcr?=
 =?utf-8?B?dzNoQjU0NG1ZdFFEK2paR1BnMmtKWkp4YVdyZ1dkTjVGK243TThsV1pxVVYv?=
 =?utf-8?B?akV2Zkc0YXJtbGg3RjNrL3hYZVBla251UmRFL0VWVDFKRzZaUkE1UFYzdysr?=
 =?utf-8?B?by9aRFYybGVYU0tORmpMUmVUYXNSZmRLL2E4MGwyd2psS1ZHR0libTRZUk5Q?=
 =?utf-8?B?bTh1QXB0aU5Uby9sdzhPNW5yOWJsbUpJT0l5cE1QUFU5bytRTTVZTVpSanE5?=
 =?utf-8?B?WE1xYU96a29ETk9LK2IrUE9vbWJaTmIzN3dvblZZenJCOUYxMHJUNVBLTG12?=
 =?utf-8?B?RXU2cy8wQm9DVWFEb0kzMzIwOUkvcG9BekJQaXc4aDhGMWd6SWVZRG4rZXlv?=
 =?utf-8?B?YXAxSS81dGVFYjVrcjVLbXNtYTlPTkowK1dnZ2w4RDFBRHVWNlJhQTVlQVNj?=
 =?utf-8?B?NDRpV0RxMEFVTFQ3dEI3V0FRRDBCbm1UYmMzbDlnYlVDQ0sxS3FqOFpodGZ1?=
 =?utf-8?B?bkcwSEhQbE8wbzVqcnRoOWdYQTdvajFXbWw2KzNEV3k2dVJObjA1cExUdUsy?=
 =?utf-8?B?RkIwcUYrVnJGS0MwajU4d2I3WmVIK1NPVGcvR01YUThtSjJqaFRkZ1Btc2xh?=
 =?utf-8?B?OEhUVzNtTjFqNVkxSzNsMmJlYlZVY1RTZ1J3QUdzOUxVeDFVaTBoSkVhK1dl?=
 =?utf-8?B?a1c4MTFkRXJWYXNrelNtWVRiNUVCRjhMSHVOTVZPQUQ0Y0R6R1ZlU2xMNEJO?=
 =?utf-8?Q?ysRXd1aRQvQ6raFMjO0gLibUE1+GX47b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2Z3VU9FRGE1TDliS1RlUXZESVFlNEt2dk1YUjRndnZpcEpTL29TWDN4SkxU?=
 =?utf-8?B?bUFxMnY4a2JnTDNiMWNTYktPQmN3ZlZvQzBDVklsYUhPS0Nqa1Y2MGpRUS9P?=
 =?utf-8?B?d1VLSzRxSFExQ1poQWJMaVNUbmp2QVM1eGNwTmNFdFpvVFdZck1CN09iN1lG?=
 =?utf-8?B?U05FYjJtM1JqakxUUXZlK0VNQnFGMEk1dXlSVzVCTWpPRm9iaDVQQTIxWjRy?=
 =?utf-8?B?ZTFuMWZ4TUg3cnUzSkZRbkpIbjJaQVdKT0MrYTZ5Y3NuWGo0YXM2b3pkWVYw?=
 =?utf-8?B?T2JMY1pBUnZuQ20xN280b1E2SEd2TkhObVZDbzdKK0M4RUlsb1dXM3I0cjFS?=
 =?utf-8?B?WENCOTUzak4vaUJLczFtekdITmp5N2N4UnZrOVpjZGtURGwrbjhCNHMzM2lM?=
 =?utf-8?B?WE16cm90N1kxOXAzMlljSmR2QXRCQndDNFlyMFRMT1FVYmFGZTBGL0hjUC93?=
 =?utf-8?B?Wi9GYnVObUk4bnhIUk9Rb0dvOUpMbVU1TGk2U091VkdHKy9RcGV2N0t1Ni9Z?=
 =?utf-8?B?MEFiMTFmUnV3Um91VVBFdG5JbFErTEdiWXZ5bEdneVFnVlRvY2Q3enM2U2xL?=
 =?utf-8?B?SjRPcXgxckZ6Qjg3NWRYeVRla0tvL3NuRDhaeVlRYzFxRm9uU1M5NDhYRGZJ?=
 =?utf-8?B?R2x0eE5mYnRpSHlFYlZBWmc0SHVtZy9aSW9pTmVZZ3ZhSU5odVU1TWxrNW5v?=
 =?utf-8?B?R1B3UkEvWU9JbXVpWVZhWXUwRFVFNDhsUHVoWWNJcUZjdEVMSVdKQ1c0QUVS?=
 =?utf-8?B?WDhUZlpibE9GWWJkSFFmcXdmditFSGd2NWE5cGNBUmFYbm1QOC9mcjdKdERD?=
 =?utf-8?B?eDVJR2R1L1VUWWlxS1J5MmxUM0FJRWE0di8ycGkvcStZUThKdkFPVHVrOStI?=
 =?utf-8?B?M0p2WVRJbWZSNzJsSExTSHh0WTFFVC9wM0hjVkhGci9oYUVDT2tlblJqdDVQ?=
 =?utf-8?B?N0sxWGhMM0Z0bFFsUVoxTUhNTWdmV1l5cFV1YjNyUlh4NUtObzdKSUZYQTd2?=
 =?utf-8?B?dlNydkRzaytteitFYzhocGk0TTVyVnJqajVWTHo5dEpiQVhNTWR0YkFjeWc5?=
 =?utf-8?B?UnFRM1QrU0g3ZnpnOUhMUHpQYkljUThxU0dwLzBuY1ZYelJOWnJzNzUzTFQr?=
 =?utf-8?B?TDdWY1Fra1ZZOURWb24zOGtaTVFoUW5XOENjQmtIYzlha0Y4NVBzcWVpUDB2?=
 =?utf-8?B?VlMwUTVlb01YN2U0UWNLVG80alhyOUpaWHE5K2tFMGFFT0JUbEsvVjFqbVRL?=
 =?utf-8?B?dmR2MjdoY0VsM1RheGxUSUZLKzJzZTRQb3YyOSt4YUFyRm44T0xXNXJaSXkw?=
 =?utf-8?B?eDFVcUpJYTBhSmIyMGIzSjA2WksrVWs4R2xjd0d0ckcrcHZZVmZIY0h3Wm5l?=
 =?utf-8?B?WDdjVmV3MFNWS3dReTNuNUFVYXN1WGZPUTBabGhaUmNZczBBWkJOOGNscFp0?=
 =?utf-8?B?TVI2bGJFQXlSUDNHaldTbFJJcGpWTVI5M1NpZUU3cExlWU5Vd0pCUStjL3o0?=
 =?utf-8?B?OC9ZS3hhcUFkSTBFYzlkdXhQREkySGV0V0xBMkp1ZjhTUll1OElKcU91VEoz?=
 =?utf-8?B?WU9rcFN4ZVRsazd0Y3hnaDhLZGlCb3FITTZVQ1dCNlVVVjJSb05SUS80dDRF?=
 =?utf-8?B?QS9RRWp3MExCYW84T2UzK2VFSmlqSE94UHRKT2ZpaVRkN2NVREZqRGF3Sm5t?=
 =?utf-8?B?clZQV0xlYThxN05BY2RXcld6eUwvbUNIM056aDA4b3FHYXdQODI3VUVGOWdD?=
 =?utf-8?B?Z2JCeDgrYVlDUWRaZDdUY2svTnFFQW4vWHlNdmhFMjYxNWE4UmtDU1B6dXdO?=
 =?utf-8?B?K29zMGNIWkRoNDZRMDB6ZUZRQWQwVG5jZ01LMEJzdHVjbC8yTU1zRWN5Z3J6?=
 =?utf-8?B?aU9aa3l5Z3NuczBscmFuTGhUY3Q0Qzh4c3M2K1VDWnNldTl3YlB0SGlkNGUz?=
 =?utf-8?B?bW56ZHZJSXZnSHlFYzVpT1MrZkpLNlp2ZlNoa2hnNWozWVAyUEN2dzJEQ25C?=
 =?utf-8?B?WlFUdzd5ZXlBTTh0Um9HSWZnc1dLVUZiSit6TUJ1eFRMalRsZllHd0kwbS9L?=
 =?utf-8?B?Rk5PTWhZTDF5cmo1WFMvMWIrM0xrMzczUWpFamd1OFdOdFlPNHJRTXJ1cHVv?=
 =?utf-8?Q?0/lVlty6sJn8swBOoTMsdBw2w?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332e716d-6918-41e1-200c-08dd8622e691
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 07:04:21.3638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoO/CtrIOFZMC15nseFlwhpGAIR3YwhtB73Wik/SDQcq6aTdA5WtmCO4jVN4OYw2RUeN2hrDF3VVkW6VVaFL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6979
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


在 2025/4/28 12:16, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: Re: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
>>
>>   From 38aa11d92f209e7529736f3e11e08dfc804bdfae Mon Sep 17 00:00:00
>> 2001
>> From: Huan Yang <link@vivo.com>
>> Date: Tue, 15 Apr 2025 10:04:18 +0800
>> Subject: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
>>
>> This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.
>>
>> This given a misuse of vmap_pfn, vmap_pfn give a !pfn_valid check
>> to avoid user miss use it. This API design to only for none-page struct
>> based user invoke, i.e. PCIe BARs and other. So any page based will
>> inject by !pfn_valid check.
>>
>> udmabuf used shmem or hugetlb as folio src, hence, page/folio based,
>> can't use it.
> Please consider having a commit message like below and resend both patches:
> "We cannot use vmap_pfn() in vmap_udmabuf() as it would fail the pfn_valid()
> check in vmap_pfn_apply(). This is because vmap_pfn() is intended to be
> used for mapping non-struct-page memory such as PCIe BARs. Since, udmabuf
> mostly works with pages/folios backed by shmem/hugetlbfs/THP, vmap_pfn()
> is not the right tool or API to invoke for implementing vmap."

Thanks, that's clearer, I'll update in v2 version. :)

Huan

>
> Thanks,
> Vivek
>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
>> Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-
>> 816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca
>> 8
>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>    drivers/dma-buf/Kconfig   |  1 -
>>    drivers/dma-buf/udmabuf.c | 22 +++++++---------------
>>    2 files changed, 7 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>> index fee04fdb0822..b46eb8a552d7 100644
>> --- a/drivers/dma-buf/Kconfig
>> +++ b/drivers/dma-buf/Kconfig
>> @@ -36,7 +36,6 @@ config UDMABUF
>>        depends on DMA_SHARED_BUFFER
>>        depends on MEMFD_CREATE || COMPILE_TEST
>>        depends on MMU
>> -    select VMAP_PFN
>>        help
>>          A driver to let userspace turn memfd regions into dma-bufs.
>>          Qemu can use this to create host dmabufs for guest framebuffers.
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 7eee3eb47a8e..79845565089d 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf,
>> struct vm_area_struct *vma)
>>    static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>    {
>>        struct udmabuf *ubuf = buf->priv;
>> -    unsigned long *pfns;
>> +    struct page **pages;
>>        void *vaddr;
>>        pgoff_t pg;
>>
>>        dma_resv_assert_held(buf->resv);
>>
>> -    /**
>> -     * HVO may free tail pages, so just use pfn to map each folio
>> -     * into vmalloc area.
>> -     */
>> -    pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
>> -    if (!pfns)
>> +    pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
>> +    if (!pages)
>>            return -ENOMEM;
>>
>> -    for (pg = 0; pg < ubuf->pagecount; pg++) {
>> -        unsigned long pfn = folio_pfn(ubuf->folios[pg]);
>> -
>> -        pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
>> -        pfns[pg] = pfn;
>> -    }
>> +    for (pg = 0; pg < ubuf->pagecount; pg++)
>> +        pages[pg] = &ubuf->folios[pg]->page;
>>
>> -    vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
>> -    kvfree(pfns);
>> +    vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> +    kvfree(pages);
>>        if (!vaddr)
>>            return -EINVAL;
>>
>> --
>> 2.48.1
>>
