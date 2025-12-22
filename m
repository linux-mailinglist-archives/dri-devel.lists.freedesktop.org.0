Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE3CD5484
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A148A10E58D;
	Mon, 22 Dec 2025 09:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="d1NaNEOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B910E58D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:16:52 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM5lQSA2122051; Mon, 22 Dec 2025 09:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 PPS06212021; bh=VVb/uOfz6TSq6lDGQsmecPV+F9E3F/ie1/T6qHAJ+2U=; b=
 d1NaNEOTrlN2JGFOoJfh1lyKnuMfVY/IFVVqxPTqUdjbQb9WU78RT4WURvKwKrm8
 5Of9HGPWNO71S+bzhKZRCdk2AY8dUAWVitzIUH5Q2vd2FQ+KKVJQjA12ErcPxGx0
 UQnjXB51RPZKe6iAREBfLgOT8bKpwhV7W202KpQW0tZ4uWSwy1rdFm7sNLyo0hJ5
 N9J+ilXuy70Uqda2rSg6RXloyaYl/KJ3zIsAfRNzwRIF++M+ubYEkKofXuF/BZbC
 B4jnucf/rfvMul5kgBrA2FuwgfxGZwhZGRut/qqvcDpWWqik/25381Xq6PWzhvTv
 8/8AA8RmN33jZkb5KOoraA==
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js71k96-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Dec 2025 09:16:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVcWJpUZ33Gu/WzbupXpUauyeoPF4HIjdCZOhqRPaGxQ7vrP9/fS/vf6F5lUz4AtLmBEtiIwU/A/xMp6F9FaA6fbJp0URDx+5Tv01XV4ftHKKZBVTN37+JaYZoQBOYcCoioYDW82vQl5XKERjUdQH7x4q+vfttWbtaXAynAsepHSektyBsK/K2CiUskI92QD8J4BrWVmwZqoj0jRY5F1T8I2kcvrmu0Y3DOv8mD2vl4hEC7c4rGzw4cIMUYrov2GKKdGDiPZYzJY2Mrj44fGMO0yJ6HETx9IRV+tbOOOsqi7VZ5rk+NIIxUpfzk3jqM4Bb58LaCtev3x8bWP54T4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVb/uOfz6TSq6lDGQsmecPV+F9E3F/ie1/T6qHAJ+2U=;
 b=b/tmOeY114/L0Xn1pwR3TVG1Qu6tzAEX+4S8JKsUmUT39T2RaQwlp6LsC7nJsKp/996pJGXHnbP+F8BTVk/qPiDvHcAeH5ich2xuGKiyM0dRb6GDuUWtedHrNAg12cRmOWMmBUAzK+WxahHg2GNGJC2F4t18KozkEryDsXY0eYIWfB1vsgp6WuI9wL7K1jnIf85dbEQYeTpuzBHTglqhNBYWd4IPzKPbAYlRf9ySCTbgDzLGBnkttFfqDUV1YybEqTd4YWcKkrbjHY1fhNroAVBrpxDLjk4N84ARWwTfLUliPAgpXliUs5kqKXDKhi3U/0q0YZFW/SRd8Py4BOvvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS7PR11MB6127.namprd11.prod.outlook.com
 (2603:10b6:8:9d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 09:16:39 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 09:16:39 +0000
Message-ID: <ae174e98-1fbb-44f2-a3a7-5ef40c37a49e@windriver.com>
Date: Mon, 22 Dec 2025 17:16:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tests: modeset: Add drm connector
 atomic_[duplicate/destroy]_state
To: Alexandre Ghiti <alex@ghiti.fr>, dmitry.baryshkov@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250827084514.3364009-1-xiaolei.wang@windriver.com>
 <93b9e1dc-f8d5-4b8d-a7d2-27ba8e09dd54@ghiti.fr>
Content-Language: en-US
From: Xiaolei Wang <xiaolei.wang@windriver.com>
In-Reply-To: <93b9e1dc-f8d5-4b8d-a7d2-27ba8e09dd54@ghiti.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 444fc7c0-f2c3-4798-1dd3-08de413acfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmYwajlrNFVuNmtOMnRiM2V0WDNhQm41Q3RGWmNxdGtXNWdYSll3T2FhQURF?=
 =?utf-8?B?NUlEcnY4aEJYOVh2SDNLUkJLaEZUVTZpaUhOcVVyNVVGcTVJemZlRU91M0Z6?=
 =?utf-8?B?K3NmeXZMUjNlK20zRWlMeURuQlF5K0JrNEQxRGhyZDlyRTJLVVFEYUVGWk1D?=
 =?utf-8?B?THFieis5SURoeGJjRjFNb3p1MG5URXIzR0Q1TjBzaGFrRTd0ZVlnVTgyMUg4?=
 =?utf-8?B?dndkcmZESjlydE0vOTQ2NmpvRGlWNzNUcDNRamNBM1BBVzE3bXNPVUJIankz?=
 =?utf-8?B?dmZlUVR3TTE3T1lPZElvWU90RmtuVG1RYTdrQ1dxV1VIZ3Q5MHdpQkdQOVk4?=
 =?utf-8?B?b05IWkFKc2oyVlR3QjVWZmJvYStpSndZd1ZRR1Zjc043c3RHczU3UFJQbHZZ?=
 =?utf-8?B?dWp6NGV3aThjVyt5OU1xWEhmQTZ2ZFBBVlplNStiLzZqN0NCbGh0UFowbFJk?=
 =?utf-8?B?eS9aOFBBV1dIMkUwdnhKUkdvUFc2VmZxWmFBbEN0RzdyVmNvUDVEc2JNZDN4?=
 =?utf-8?B?SEJtRi92SjdqQ2xNYUJtREFwVGE0dCtES0FCdm9rUVNYSGc3dXNGclJSQmxO?=
 =?utf-8?B?bktQN1kxNldwcnFtUWFvYmJnWjRyd1FBS2l4TFZQb25pR1MremVOSEZCNWRt?=
 =?utf-8?B?NDF6QTZiTlVyZU1tbkczcXltemdZOTBUUUxPdDB5WlBtODVLdzI5MzVRZmQ3?=
 =?utf-8?B?Z2xZZEtzSG9WYXpzTWQ5bkVIbE5aL1FBbk1YalN1dE9TeW9KM0VvbVo4Ym9k?=
 =?utf-8?B?YTdKVXdiYSt2L1Y0TjZRMEVid3V1V1I4MzVGRjBDWm5wWlR1NklCRGNBWTF6?=
 =?utf-8?B?Uk5yQjM3d1lnRGJpTzUvUzQ0MlBKbWdmYW1hajY4WmtMQ3FnRTFId2ZzWlI4?=
 =?utf-8?B?QlZQZUh0Q1JiaGFaTlVYNTdWMmhVcFF2cVpNVzdMWDNWc3ovSzJBNzFCR05k?=
 =?utf-8?B?TWNpQzByY254WWxtekY3UG55N2hGUjlnVEVFVzdZWFErdU5NZm9Yd1Z4ZVFq?=
 =?utf-8?B?Wkg0ZWlHQnR6SDEzSUw4TUF1ZUhXN1d2VkZSTkVNbW9LUGM4bEduQmwvWTZJ?=
 =?utf-8?B?NzBjVS94QzhhU3JOUldVMG9ZQ2pSdUFXOHFLeng2V0pRY2UrUnlvcElySGpX?=
 =?utf-8?B?Y05SQ1NLbHZ6TnZ1TEdnZy9PbFl5SXZPb1E0NDdod3VkY21YUk5qTjRtQUgr?=
 =?utf-8?B?WVdmL1FpRUczRzlnWnMvcWk3SDVSdVlPWDltT3ZqL3FDY3U5Z0FIMGVVZHJL?=
 =?utf-8?B?Z1NLM25oRVVKY2hxWWxLeVBvSTk4Y0NxVmx6K1BEOExkMUJpdG9iSlBaWHFQ?=
 =?utf-8?B?ZEM3V0c2WkR3c3lhVHI3TnNnQmJaNGlkRXgydFlrS2lFTXlOTUFFcGpQZUNN?=
 =?utf-8?B?M0FTR1h1akdhTGc5NGZFa2l2bFVoNCtpN25rdTJ1S1pYV1VKNElsUUFPcDZt?=
 =?utf-8?B?bHdkR3o5T09jNGxIdXNJUnpxSTRTZGxlV0JkK0hYNVltVTNZNjhyOFZFOUp2?=
 =?utf-8?B?cU5rb3pCQ0dkSDExeEltdk5sN0ZRejl2MmNJK2dwK3hPWm1TdGc0VUxmUEx4?=
 =?utf-8?B?djlybjZzM3I2NGpVWUJJaUhUZHUxOXFFMDM3R1BLZDRvODVIZkpjbk1rYTQx?=
 =?utf-8?B?RytxdFMxVTB6cW5iSnBQTWZaUjhiR09UQ01sQ1BZMXVtSjVTelN0M2tTSFRL?=
 =?utf-8?B?RjlUZFlHWUNTTmQrbS9qMm5aclV0V0Z1YXJZZlJJRmQ5VkQrWmk3TjRiV3lq?=
 =?utf-8?B?ejJkVGxCalZFaVdhd0YwWEZvTEJVUjJhRG8yYlMzbFlnNVRJNFJYcE5GOWZl?=
 =?utf-8?B?d1h1eDRZZEd3LzN6eXJ4a0JsRTB0QXpBYzlsTy9BQmRlOHB0UXNRa1RsT2JQ?=
 =?utf-8?B?enhNa1M2N0s2b2lseElvZDl0blpTWmRCVGNLcnZWeDdSN1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0x5ZTdLMmo3ZEJleHlkVk5hVThaMkhNejJHWU9walBCazhROCtZbTh3WDdM?=
 =?utf-8?B?ZHEydFROeTdoalZrcGx2UnZiK2J6Ui9WRWFEVUxpT0dvR0VGUVJ0RnRDR3Zt?=
 =?utf-8?B?dVJzd2tPdTFCRDgwMzA0NVg1eVp4bzYvNkRaMHNSMWhQUlBqeWl3dUNmQ2xX?=
 =?utf-8?B?SDZvUDBVSlZMemN6QnRjdmh6b1k5YnVLNFBoMjIrdDNCbFNucFF1NENNMlRz?=
 =?utf-8?B?RkdxNzBrRUhhRXpacmVjZlZsMWxRSXZXSVppV1hvVE5qeFY5S1pJQStGQnRT?=
 =?utf-8?B?RjE1ak1TZVNCNWNYa0hkZEE0cldJYVVGRHcrVjM1bHRSRHl6cU5vRnhFOXNU?=
 =?utf-8?B?R3N4R2hGaG5YcmpRVUpmTS9BOTUweUpWc3g3OFR1Z0RFUFZHNUthbDhEWlFQ?=
 =?utf-8?B?OXJhSCtBNXZpMmdsMWRGbUhtT0VxTW1LdzJJYmRwdEdPRy9iVGI1b1UyUGgv?=
 =?utf-8?B?cVgyNHh0ZFJHREQ1ZGVOdUdzZnVXQ2FpbGF5TDZMTmM3NmZpT0dQUGlydmww?=
 =?utf-8?B?M1JvVTNteWY0YWNpdW5ZcXFHZjNPbmdPUDg5aGllRmtiVDBQNW1zdi85WDk1?=
 =?utf-8?B?anpCTGpNUmhPSWU0SkhKMkFldmZnc2hsbW5sK1NWaHRHSzFqQTBWYWQvZTRP?=
 =?utf-8?B?U3h0QyszeE1tbStDQmNQcmpUK2tvWlF0eDduQ2Jlbjd4UG5MdWNzVHdFUUlP?=
 =?utf-8?B?T1FaYUdvSldhWjBHWkxnejU1cUJtRitzZHVBeklvMXNGbUk0TFFOeEFuVzJS?=
 =?utf-8?B?V2pQbGFITEI5dUg0ZzJyT1hyenlUa3paWURZSDlMd0JnUE1pRGhDd3VuYlFP?=
 =?utf-8?B?NWhNa2lqdHZ0N0c5TkcvMDZHVDhVSnVyb2VjSzhoWUVkUDhueXMwaGRyS05j?=
 =?utf-8?B?OVMxLzJmdEo0djRLL0YxRzJmUThIQ2FzSXdpYnVCY09pWVB6ejdPaHdSUHVC?=
 =?utf-8?B?bUsrNWVxektDUzBSWGdMTFdFVXBxRWVjRm1pdkczM3ZhZVFWUFhWQ0lVMDhP?=
 =?utf-8?B?eE1FNm15LzAyMnJvNWNZRjB2ekhObXNVMVRrUmZIM0VGL2QrdXFGay9VUHN3?=
 =?utf-8?B?YmUzT0xBNVZORnNmamJuT0NVZENTOTFRUEhjQUJkTUFncWlSQ2pCMVBhaGl5?=
 =?utf-8?B?Uld0QURFeXVtZWJyZlcyUTNJeFF0V053MmswMHVDR2JYSGNiSFNJMHkwRG9a?=
 =?utf-8?B?dmhCNGwza3k0UkUrci9tdzZCN2ZtUEZxMTNmcU9YdFQ0c2xzamdPUWwvS08z?=
 =?utf-8?B?OXpETmZ1VWx3bjlZTkRZOVY5Z2xWU0JsL3RLVmVXak5VaFN2NEwvT0o1TVYx?=
 =?utf-8?B?bU1FTzNRYkxsTTF1OFRMdHhtSnUvN2cySksrZ3NHUDBwcE85UVpocjhVSDVo?=
 =?utf-8?B?VFRDNmVwSFR2eENEdTJIdGlaK0h4dUNLZkt0NzhsaXpLVVpKdjZMUkJad0ZB?=
 =?utf-8?B?MUhrMjcwS1lRQ1ZZYWhzalplOURZaU9Tbmd4N2RrNmNtVkVKc2h4T0ltd1Nq?=
 =?utf-8?B?SllMaTRrQXJ6aGpEOWdlZVJBajJ5ek1WZ1A1dXhseVlSTGhhaXUydlR6MjBS?=
 =?utf-8?B?U1cwN0x4K2oyOThwaFI2c2g2N2I1Q2pWcEFhckZmdndQZWNaMUk5UFJJYWpW?=
 =?utf-8?B?V3ovOWViSTFLa09pRlowaC9rLzhmMDZGVXpIdElBbmM2VEhwU2hHNUdhaEs3?=
 =?utf-8?B?SkNxTGkrbzJ1NzRIeFNGOEY3NHZYaHlKR3RPNnpIcVdqdmVoSGFmS3hsUXlz?=
 =?utf-8?B?TWxqWlEyeVprMHVnSHI4ODNvMExQbmIrYlNLd3czTnk1ZURwS1dEdExPa1BT?=
 =?utf-8?B?SW1aYVhnRm5PWVNhYnlneXBYa0Y1VjNDbVY0M3RvdWM5eVpTNkRqOEE2VklU?=
 =?utf-8?B?VGFGcUdQbGdPWGtWVkJJNm1RTkhUOUNQaHR3eVg0dWpjVWsrZTY1OHBlcE9m?=
 =?utf-8?B?MW80SnpLVlEvUDd5VXJDaTgzcE5qRGx0TTExZXFkUGUxTTRFT09MRy9TR2VZ?=
 =?utf-8?B?Wm5SR0F5VkhVRGtFdHJ0RnpJR3Rnd2d0TktLOExUTUxjaWpPSkVDVy8xUFQw?=
 =?utf-8?B?ancxRXR4TW9NdVNMcFBTWjJOV2ptMUdjT1VDeWJMSTNLTjQ3RmY5ZGpaRFJn?=
 =?utf-8?B?NUppdVhtZlJKT3lidW9mV2NxT3lucHRMVldzeld1ODdhejR6ZWswUXF1Rllt?=
 =?utf-8?B?V3hyWFlidGMweFlEOEtCVkhNN0lQeGNDN2FOM3JuYnRHSy81cXhxRG9EZTBj?=
 =?utf-8?B?MDI0NXhpYzR5T3ViTnlvY3FIOEpyeDZPcEdhTFN1aDhTeWwzN3BtU29GT3k1?=
 =?utf-8?B?SVB6SjNEaldxSFE2VGh1amlPdnlOdm5oM1hpK0hDcFgrM2MxOHh2ODZqbjJM?=
 =?utf-8?Q?iDYYOK+mviZAo/SE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444fc7c0-f2c3-4798-1dd3-08de413acfef
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 09:16:38.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJSteqEocHrCRRujbtMcUWIGuW0ERaX3Oq9Fa3bvWyhc+RUh5gOn5EgziA/SaPZzjheNAYNJHg6Mfi1/OGxUsF/nWY6+3/TC3iOwpPuKdAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Proofpoint-GUID: zOqJds6Cm3FWjTBGnj7jWQv7FYPPJqEU
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=69490c79 cx=c_pps
 a=iil3+hz40n0Eqb4YezF7BQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GaQpPoNlAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=h0uksLzaAAAA:8 a=v5HRY4-Fo_-zKAK5E5EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=xF5q_uoM5gZT5J3czcBi:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: zOqJds6Cm3FWjTBGnj7jWQv7FYPPJqEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NCBTYWx0ZWRfX+HSPLWEACInR
 BRXj/0pIT4s8vN0vob/+E7el5aS0DNO0dOLysw8kHhmn+BNo0/jiWZABoc/E4w8TLE5ZB86FeE+
 mNQ0479NWRzM5LDElnWWfYT+jLh8uNNy7P21o+zaPNnd9LI96x21ZZKVeX53oAxIh0RpLxfzshI
 Uy2E0Xvnv60XX9V3SA1Nuii91xRrZNyzV9nAUIhTyiAlHhadHaWY9FugXtsDiTI2zfnwWJ1gPt0
 VlzpIEYSuBRFe+xFDSU42DdNKcoleZVE6a2O1+O5pbrNFdytUETUrODVOnCjsrScDEINhbnjamI
 ua5q8a6r8tJ0BbLNWbhTj5qJx4OSY0oB5zj6fFr93p7P0clNlSIWLmJldYVN/jeIuBCMRm9Y+W8
 35agJBKe5wE9VLZCugG6i9J4zp1Bt8ixzgqvC+fQUUS5RV7kXwWBKIi8hY6+e4BDPa62P4gsCfN
 WvsrmuHZkxD4TpH3CeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220084
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


On 9/1/25 18:41, Alexandre Ghiti wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender 
> and know the content is safe.
>
> Hi Xiaolei,
>
>
> On 8/27/25 10:45, Xiaolei Wang wrote:
>> Commit 66671944e176 ("drm/tests: helpers: Add atomic helpers")
>> added the atomic state path, so adding the drm connector
>> atomic_[duplicate/destroy]_state is also necessary.
>>
>> WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/drm_connector.c:234 
>> drm_connector_init_only+0x934/0xee0
>>   Call trace:
>>    drm_connector_init_only+0x934/0xee0 (P)
>>    drmm_connector_init+0xe0/0x1b0
>>    drm_client_modeset_test_init+0x290/0x534
>>    kunit_try_run_case+0x110/0x3b4
>>    kunit_generic_run_threadfn_adapter+0x80/0xec
>>    kthread+0x3b8/0x6c0
>>    ret_from_fork+0x10/0x20
>>
>> Fixes: 66671944e176 ("drm/tests: helpers: Add atomic helpers")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>
>> v1: 
>> https://patchew.org/linux/20250811063403.98739-1-xiaolei.wang@windriver.com/
>>
>> v2: compared with v1, add Fixes tag
>>
>>   drivers/gpu/drm/tests/drm_client_modeset_test.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c 
>> b/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> index 3f44fe5e92e4..e702a27c2368 100644
>> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
>> @@ -12,6 +12,7 @@
>>   #include <drm/drm_modes.h>
>>   #include <drm/drm_modeset_helper_vtables.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_atomic_state_helper.h>
>>
>>   struct drm_client_modeset_test_priv {
>>       struct drm_device *drm;
>> @@ -48,6 +49,9 @@ static const struct drm_connector_helper_funcs 
>> drm_client_modeset_connector_help
>>   };
>>
>>   static const struct drm_connector_funcs 
>> drm_client_modeset_connector_funcs = {
>> +     .reset                  = drm_atomic_helper_connector_reset,
>> +     .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> +     .atomic_destroy_state   = 
>> drm_atomic_helper_connector_destroy_state,
>>   };
>>
>>   static int drm_client_modeset_test_init(struct kunit *test)
>
Humble ping...

thanks

xiaolei

>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex
>
