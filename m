Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579FC97BEB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36DB10E2B1;
	Mon,  1 Dec 2025 13:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="P1nPcnB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F071D10E2B1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 13:57:20 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B18K2rt2298667; Mon, 1 Dec 2025 13:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 PPS06212021; bh=HE3s9QIACQG1fiH8cN4j8D2H0YpQkvGC0pCMANkZ+eQ=; b=
 P1nPcnB8TE5/I6/oq1UJWuv3pDvVIuf+EYWJ8wubbs5fHrSzWgNUnWDC87qs3pSY
 YTJ+bWx9Yj8RDx14xihC+7kay2eYorWxUXf3O8NTNb4ldcIkKjPXWVrGgGjhUHUU
 y62mj/QpaVkKaEptq7gImPLo9xLCmzspyfFhip4cuhiDk18CfZ0exQqDpHKgmwVs
 XG2Lrq6NonJrj4ojUgLW8XRo6QsO+9rtzkWSSWfwT/BsDTaDDlncVYhEkvXehE8C
 syYckK+/wk2zE51MxJOFX+be6hIaadAyNAD2avgVDL4SHSLITT0zMy8pFnoxQ6IB
 gF94RLe+TAxaY+DOhEw0QA==
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69v2q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 01 Dec 2025 13:57:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlU5W3i2BSu1wzqhLYbbJBDv3q+nlO4AeqpozEmCcs3SQENGQrjU70WkPw3gwHWnuNQs912lNqaOapc+J/86Qez6IvU/pbWpgPHAd1y1jYtf68w4kQzJrvXEEL0WYZlHUPljb5KcglKd0HMvu21SvcuFb8NLEV1RkIguongdWycwLziIc6WjUvInhx4fFf224m+yfhVSSYCmM4pDlc9ST4liEAzmy5Zv69ff9dbYUojIjXWLT4X0d41/TLR6wtSm+3AIfenBFaX34VsIFOEUHOjfkYiokl9Ho++ZcuvA/bnGJ+esRZhqR3vdWPVTD4P2fZfl3xtU/URJuCwzrnEcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE3s9QIACQG1fiH8cN4j8D2H0YpQkvGC0pCMANkZ+eQ=;
 b=S6QJOh3agRX1HfE8xzawlzmVSAfeZoGhS6tj+pazsmIFN0PuczYURmPGmadCRG4Bq55mS5u9bGBbUvzFeF58O/P3MZD8XdR4RPuBfH6TZsOXtaDtY6L9xiwUY+kHd9EG6Sh98xi1VpzN3Aol3/+gBCQ1eFCFVKCjBw0024JS7lBh4YZxk+4awthEt+iZ+Jr5ok4AhkMgkhouQT6mRTeKDI8h3YB+uXBshK0rUg/uJ7mysYduZsgAYf7NjrWAfAn15Jx3ZBylC3sFZZl4KMplRZ847T5+w0Ijh27YAsz3ed2wdCUJ/c53Xu13GT3E2YY6IZS+2ARlOtLcvzHfccx+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by IA1PR11MB6540.namprd11.prod.outlook.com
 (2603:10b6:208:3a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:57:06 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:57:06 +0000
Message-ID: <6ddf6dc4-82f2-49e5-b71a-c4574bfbce24@windriver.com>
Date: Mon, 1 Dec 2025 21:56:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: set the V3D GPU sg segment limitation
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, mwen@igalia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
 <a4787977-8249-484b-8ed2-c243e0a74d21@igalia.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <a4787977-8249-484b-8ed2-c243e0a74d21@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:54::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c96f68-a9f8-4643-3266-08de30e1832a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGdsZU1KRWUrWW1ubzUxaVVrVFBXaHIvakpNTTJvWXA2VlBSdThRMWlueUZZ?=
 =?utf-8?B?c3FDY0VpV1FGTklldUplTGxlR3VmOW1IZHo0bU5LTjBPaWZXVVBDUFVvSmVn?=
 =?utf-8?B?dnlDU2E1UkhlM2V5bjdXdlRza0ZDMWVSSGFYY0tJaks2QmdYWjE2L1hOZ0xq?=
 =?utf-8?B?cXVnMkcwYnJkR09RK2Ixenh1UndmbkJ3ZnU3OElPcE1pYVFSUG9nSFNVWitN?=
 =?utf-8?B?b0tuTEkwSG4xajUwTlRPekgyQm1PelFBT1ZqcEJ0L3Q4SitwZEI5dDJHdS9H?=
 =?utf-8?B?TVNOQnAwcjRvcVd6VXJIVnU4Tnd0SHR3TW1UdUtPUHJPOFBWRC9hRGllRnFw?=
 =?utf-8?B?anFaTE5md0lNMjlFT3kwUmR2THpuYS85VmtmL1A1anhXOHVOTWE1Q05HNmh6?=
 =?utf-8?B?OHVTdk51dGs2STdqc1dqVi9UaDB0REtoQlpHVmxYbDJBWnBCaGhTZjE1aDNl?=
 =?utf-8?B?NUdRRExzZHZNeUZsYmg2UG0xT2xnTXcwNjhvN0FHMmpkK0VpVG5lc2diZXN0?=
 =?utf-8?B?MzRDamVIaTFpQ0hLY0YrRUFiNlJWUzdYcXBhQUFnMGJSVlc5a3hMS1dhMkUw?=
 =?utf-8?B?QzEwV3A1U29lVzhlcjhMYWFCRzVCWXNEMzZFWkh5YVVxY1hBL01MMlpDL3NN?=
 =?utf-8?B?UHpERUZIZ1hHd1hCeEhGVnhBcXJvdHRNYVBldG1Dd25tb2JhY2R6dTU5Ujlx?=
 =?utf-8?B?eWZDcTVWd0YyMnFiR0V0eG9LSFZLWHU3VXQ2UkhWQkdnYzZHaEc3LytEWW9t?=
 =?utf-8?B?M0Y4QUJ6Y0tjY2dyRk0yV21vMUlscG5wNms0K1dGTWNvaWR6azdmY3NOUkxn?=
 =?utf-8?B?ajNIMEdETkJ3eWRwaFZsWDlRS1VESzRBeW4wNmorRGRIZ1dxNEk1S3FqZ1ky?=
 =?utf-8?B?L0J1YnlRSDNtclRTVXZ6eERUOGFodWJFTjdVQ01LVC9CMjJwSUxGL3luUGhw?=
 =?utf-8?B?TVh0d1VweUF1QXl5NERNQy9iT2xoUmNHbTlDZ0s2UUY4SXUyalA5NHFnTWFa?=
 =?utf-8?B?Rms2VWgwL2k2cThyWmp0MDFUTlAyY3U0VUZEYWhuRFNvMWttaXdiZWwzZkll?=
 =?utf-8?B?ak9lOUdqZDZ5bU55Wm0zYlJNWjhZNzFZQmk1ZzBEYnhDekJwUHo2T1dmL1JL?=
 =?utf-8?B?SU9TWWRwUUVZTDJvS2VSNmdLSllBVWtWelY1ZDZqZC8wVk44S3Fua09OaERM?=
 =?utf-8?B?VXUvaWtNdDBVT0lnRlc4TTBxMjM4dkJ3eHhTOTlSRE5DQ3F4VFlMdVFZOCtN?=
 =?utf-8?B?cFFySFdXOCsvMmRlNmRQZnowZWJ1b3k0amdVMjNTZXplUWI3eXhTRUV2ejRS?=
 =?utf-8?B?L0pwcUR4dmZRam41THhOUTgraFZkOXR1aWZWMC9hb0k4eFdCVUZ5dVlrZzNJ?=
 =?utf-8?B?TUhOS2pvd2RzMThWOHZ5Z3kxbzdheFQ3eG8zUmMyb2hpaWZLYWtITUd0dGo2?=
 =?utf-8?B?RVV2VFFIU0tCVUFsSm1FVWxkd295cVN3NDBPMGFkUktNWjdMNVJURmZVYnM0?=
 =?utf-8?B?SS9BRDNRU2VweVQrcFhzcitHMkNOYjJHbmRvK05xN2h2ay9qZ21lTldIN2pr?=
 =?utf-8?B?OWNaZ3R3aTVrYXp3b2l3TlF4NGNVUjNDVmhOb3U5NWlXZ1NDZDZIT0ZsWUp2?=
 =?utf-8?B?cVlvVTZjQTBDWlYrZnlwZDVta2ljTFMwbDY5SW9qWjZ2bkdQZE1UZ1MxNU83?=
 =?utf-8?B?L3hTbEVxNDJsUm85dDNnNkpDeC9VaXBSMGZTVGRuWDl5YS96OUlTNk0vdUxv?=
 =?utf-8?B?UGVSY2VnVFJZR2pRVnFrSlNUS1FUMFN0VUFuakV1MjhPRUpoNElRM3NvVXdQ?=
 =?utf-8?B?bzRrRXg2U1JFTjI0cjhDR1pqclhtV3JLcFdWVzBxZU1VRVJIYkt3WS82VkFk?=
 =?utf-8?B?NCtWbFBzQmhaSmtDWHhJWngxSWN0cEszSUJhbXI4M2tja1pXNlIzTnJaOUl5?=
 =?utf-8?Q?JwnipYMuoAbRaLc5XN+25wcZNIKz/KuB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGMzUzMzTHBkaEkxN29VdGhJZlpNRk0xVkJaVThwTnVYOVY0Q1J0bHdOdFh4?=
 =?utf-8?B?cS9XdlZCVVpjMXhGVFV0UnZLb1RyOTBaRlUxT3dyZUhNWjVURjJCTkFtOXM2?=
 =?utf-8?B?djdpRU53eU5mWWJ1cTNTd3FuYURpcG95Vk1UZGdzYmNhQVdWdFZ4MTNLeUtk?=
 =?utf-8?B?TDVGd05QdGRKWDgremJldG1BdXBraE1oVWRmRUFzUnRtdi9pSE1oMkl4U1VE?=
 =?utf-8?B?VVU4bWYvMXN0T2NqdVNJODlxVjYrZTFSRGExT2xCVmpDdUZJYW5zcDFTZkR4?=
 =?utf-8?B?QmRlQnlBVy8rY0dWekZRNFY4WThVNDA4WDFJWnNUQjJjUVp0NGJ6dlBYb2do?=
 =?utf-8?B?WkxSWU15Vmw2aGlGOXkyQk14eGdOYytWWnNKMTZTaDl2cit2aXRiaU8vazJr?=
 =?utf-8?B?eVRHYmhuYVp0Rk95Qjl0cmRSY1ZacEZzK3lrdDR5QXh4MWpodDZtRzlhZ1Vy?=
 =?utf-8?B?QVVMQmllRGQ3S09sT1RLV0h6QjR1ZjZqOEkyTzBVK1ZhczlXNytxRDFLSXdT?=
 =?utf-8?B?VnJWSHVuSHdBR3VCb2drZmJldCt5WFdQTWhybFpicno4UE51Y01ncGNzT2Rh?=
 =?utf-8?B?MUQvTlhGM1VneVNrc1dhUmRCbXJBeFBkQWpkZ0Z6blBmaUZsRCtFL2RLRTFJ?=
 =?utf-8?B?NCsyRGd5RlNBZUUrbkNFY2F0TWVVV0tZRW42azFSbHN0VEd2RXhjdklvUnFY?=
 =?utf-8?B?MUVwMldTRlRFMDNRaTlnWWVQRWVCZE8vdEk0NFpBMXFEVXlQVEloTlNsbnhC?=
 =?utf-8?B?NFp5Ky9xbk1yVGlIS1hIS0JuNFFTSm40UDg0Tk1ZR2xmUTY5Tm5jR0RYVkx5?=
 =?utf-8?B?R1F4SWFyeTlHVWZsak1pUm15K0xUbW5BRVdwRkFWUlRVWGFqb2dXOVpxK1Rq?=
 =?utf-8?B?TzU1M29GMU4wbk92WTZ4emNBTnk4RU5URG1tVmNVSUZTWTZ2a1VkemlldCtr?=
 =?utf-8?B?VFRNRHBVWXYwc0ZNUGUyT0ljSW9TU2h5M2JsQjM0WE1EK21BMGJpeU9Hd01j?=
 =?utf-8?B?Yklxcjd1V1lOL0wxTWpzWEZ3SW0zb0hiUFlaZjY2MlpDcXJBOUViOUFpdzZx?=
 =?utf-8?B?UW92TFdDdElGSzVCU3MydE9wNkpVU3F3Q0JlZmtQUTZHZFRkRjBzOUlwTEpX?=
 =?utf-8?B?ekYvRm5OMGlPWG5aZCt4TVlnaTVKQXNXMmlkeExRM3J2MnAyU1N3cjUwU2k0?=
 =?utf-8?B?UXlrdlBXbWwzdzJNZDgzcXJhNFJ4K1ZyeFA4OTJRekg4Z2JYM0xGRGk1VkhC?=
 =?utf-8?B?QUxiZThXL1VuUjFhQ1dML3JvTmFCcVR6YTNRVFJSaGxZbzh6MTNOYnFhR1Uz?=
 =?utf-8?B?RmtoVTVRZkRFTGFYTi9jQ0VoUWRWaTc1K04yNExHbGMxaFd4Y2l0MXNua051?=
 =?utf-8?B?UmdjMzFjSXptcFRpY01URW1zTTlGOW8yQmwrWmY2Y3lFbnA1bHhDUktLYVZB?=
 =?utf-8?B?a3E3WHIrWnlGaHlVNnJXOXlGalkxMmh2Q29KdzN4djJnclNiTTFidFlCRXN1?=
 =?utf-8?B?VllFdWliNlV0ckJrWkJabHcwbGxQOXNuUWdtVFd0MEp3NDErV2ZIZlFBcEpw?=
 =?utf-8?B?dnNFdVA0aGE2MlEyVUwwK1BBRHRDTGREMXQ1eFhCNmIxeUlxcko4UjROWkhk?=
 =?utf-8?B?eHhQT1lORDhBelZ1ZE1PVHdTdDhjeXFUUGt2cXI4cmpBMnZ4SDFCYnIrOFUy?=
 =?utf-8?B?NmNjQmdkamhvalM4eXdVOVdmd3dYbm90M2ZCZlZkeGU1SmZXNm9Jc0ZDM3pI?=
 =?utf-8?B?dXhPdjdBYnc1OHRzSE9obUZvSXMwajVEczhzUVFvL2EvRHl3ZVhmanQvY05Z?=
 =?utf-8?B?dExSWEI1RndqSHltS25oM245MEhmR0R3aUM1VHpZZWF5THVDS1l5UU54cU5p?=
 =?utf-8?B?eXlWeGVXVzF1eU5NMlRvTVIwc1VVRHpnYmp3Q0hIL0VZTW5tR09yeXlnSHAx?=
 =?utf-8?B?V0JQVTM1WXhRdXB1SnlmQUJLV3R6VCtJSDhHeFp4MVVEVDFKWTdEaUtZRStq?=
 =?utf-8?B?Z29UNFprN1hXU2JGZnNUVVZLZlhSSVNVVnlheDFrd2FCVDJzZWpLYllNZ2tv?=
 =?utf-8?B?SC9SVjhzQm5UY3lZMUtLb0hUTFAxcTB5UkJnK201UFdzck91WFVrdjlrN0JQ?=
 =?utf-8?B?N2paemFnMFQ1MEhUcHZCSWtZdXJFNnU1Q2dqemZXckhyVEg5ZEd1Mnl0eU5J?=
 =?utf-8?B?QmIwbFBNZFEveGJ4YTFGYTU2WGwzMmt4MHZxU1B3WHRSS1owYmdjUFZhVldp?=
 =?utf-8?B?WmRjbkZYMUFtaE9lRjE5VndpT3JBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c96f68-a9f8-4643-3266-08de30e1832a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:57:06.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHo0fk1jBfID9nLdveZMNO3hIU4qgbHlpHYiZY9eMmxpIr+fIk3esrDR+Ng4rlJP70wb3mr+CC8jb6TcExp4063YHDUA+EBoAPwl3rqt9sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfX7K+7SB0iJSzi
 1ZL1wwmIU4by6qI9nzybPh4UOt7KMyZncVdR7FNds/Sftn9whqfums829m2ba+x6S36av9/qFuo
 aOFzf1qOkQd9apHvZoNDs7KY+/GJNFaZARgqKzuvBgfo3Kor64HdfsrPqM653dTQ0HpnToKmCry
 cXnsKFuPHkbYtRoomyM0nPJBCBlb0+sYYr35BMcktrbTYuhBUGGDIHIoab8VDo/cQbAyXZ/Y3Xh
 bjwFSxpIOfRDMbIeSGlX3XilGPx01nnXUtidZGSqRTm+OKm3WNgtenzrVrXUXBD4NsHPuJKHTak
 xR1idnEdDXXPJA1hhjbk5fMFwzt4uARV/d2DoqlwaIJVkP6JJUlDcCuyG7WXN3HZP1kJ32KSSXs
 PiRIO5tdyf0iTwKBzwX3qHUCuPuZvA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d9eb5 cx=c_pps
 a=QuE5qaevU/mtxJv9VH5uOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=DLjE3IdbuaE4IdLkge4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: I5JkGuim8BBfIvusQ1orP7DI5O7Rk52B
X-Proofpoint-GUID: I5JkGuim8BBfIvusQ1orP7DI5O7Rk52B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113
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


On 12/1/25 21:35, Maíra Canal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hi Xiaolei,
>
> On 13/11/25 06:25, Xiaolei Wang wrote:
>> When using V3D rendering, the kernel occasionally reports a
>> segment size mismatch. This is because 'max_seg_size' is not
>
> Could you mention that this only happens when CONFIG_DMA_API_DEBUG is
> enabled?

Yes, I only found that when CONFIG_DMA_API_DEBUG was enabled

thanks

xiaolei

>
> Best Regards,
> - Maíra
>
>> set. The kernel defaults to 64K. Based on V3D's addressing
>> capabilities, setting 'max_seg_size' to the maximum will
>> prevent 'debug_dma_map_sg()' from complaining about the
>> over-mapping of the V3D segment length.
>>
>> DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
>>   claims to support [len=8290304] [max=65536]
>> WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 
>> debug_dma_map_sg+0x330/0x388
>> CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
>> Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : debug_dma_map_sg+0x330/0x388
>> lr : debug_dma_map_sg+0x330/0x388
>> sp : ffff8000829a3ac0
>> x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
>> x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
>> x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
>> x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
>> x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
>> x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
>> x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
>> x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
>> x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
>> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
>> Call trace:
>>   debug_dma_map_sg+0x330/0x388
>>   __dma_map_sg_attrs+0xc0/0x278
>>   dma_map_sgtable+0x30/0x58
>>   drm_gem_shmem_get_pages_sgt+0xb4/0x140
>>   v3d_bo_create_finish+0x28/0x130 [v3d]
>>   v3d_create_bo_ioctl+0x54/0x180 [v3d]
>>   drm_ioctl_kernel+0xc8/0x140
>>   drm_ioctl+0x2d4/0x4d8
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c 
>> b/drivers/gpu/drm/v3d/v3d_drv.c
>> index c5a3bbbc74c5..f4da7a94e401 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -377,6 +377,8 @@ static int v3d_platform_drm_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>               goto clk_disable;
>>
>> +     dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>
> I believe I'd
>
>> +
>>       v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
>>
>>       ident1 = V3D_READ(V3D_HUB_IDENT1);
>
