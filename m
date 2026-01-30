Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNXfLgudfGn2NwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:59:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22DBA454
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 12:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7348F10E35C;
	Fri, 30 Jan 2026 11:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="u77Bl346";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="GwecHNnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2DB10E35C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:59:02 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60U7reln1930486; Fri, 30 Jan 2026 11:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=/QaUgya6MmZv3DUZMkpkB/bF/
 zW6rVDw6YhjyXXrE8k=; b=u77Bl346QeRWhNlCkdgA0JzM9mSAHW+/0bbV97CJg
 kNqOcuhHlAi4ReHmW1L7xW4/r2bvbh6uT2drkagMiAduxEM1zDMlpCGylmMuTRn2
 pvrdOddlEmQ3WdU+RWNoensHqaEXL+ujFa1ENDGoJm71eR/oSFkpXey6L6bd4kYN
 7QFThHDmYYOSWFRgzue/TGlpN9mDneK+UQLxppFiqvWjBqS3CYXNBY43MdSIwJqA
 eS0+ggpZ3+dUUWC0RW0vrhvkjhVqCMoN1cdZSYGy9gc5Wf8Bp6Kqjd7EOSusim/C
 4rekoxR5C+30IViUB/VMAh3odpR9vidIccMZI4pSCH8Bg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020099.outbound.protection.outlook.com [52.101.196.99])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bywt892ve-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 30 Jan 2026 11:58:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TticOL+9L9+vaIiqjHcLhdrLORKA90lHZYQqL4pRcGZcsvDHRKhqFnrICad5w2wV+TE9seVC7CzV4Ca6qV5VThZpjGA7mu6WM4CathQGo4aBrRIBgC4eh3AgrbrPeSim4LeIfZ/dbwuGRtb+7Kuh4+lRwS4BmxgO7/gL/Br88o+5wt4VwGhwSbjQgXr7PSDZT3+McmecXeGK1u6qdnh3Pxzi0Gbsdck7DWDHcErpgFGvn5PpesEEFBg7l6+p5b1Pr+ahGI0roRH/QPJn/JumAuoaXDgFlraMzDA6OppnSpoSp5xDkd8u+sPxaFIyXScE+ujb6ZopoJ4BASh+xd08TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QaUgya6MmZv3DUZMkpkB/bF/zW6rVDw6YhjyXXrE8k=;
 b=p1MEzRN/2vP9QXridSjCkMhOo45YMtfHkGfj59RsNErzt7lwVL8tIhfAwYlX4HK6WH3ZSGC32VaK7iT/EAPVHpJmLKqS1iUbqTRJ5hiGHcZ9qO8LwkopaecwOzggCowOyxJKQ3qpOZyAXSAG4+4An0sHl3uYpuejt77SUnyODrdrfJvuPhx3FfBGuoW706CL8s81upFMe9LIg6Tdh2PzRU/1lkgUqd1CDWRCfN08fm0czB1Rlku7JLHUryf6i5STzxcUgWHbAFINGoENWpNJIWroODV0yeON4vBjb8kfvg4hUzy8t4oELl9Q6vCEg29Zv+I6IlThyun/Vz22juClag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QaUgya6MmZv3DUZMkpkB/bF/zW6rVDw6YhjyXXrE8k=;
 b=GwecHNnDOyxGNy8+z3POa9xFqSG/6Qg/WHOgkju2a0BARcckE9cK80SlB0Rci5h5nAu3J1+3yJ///IynZ8wSleRe472UE8H+ol6TqlsBOKCtftdZxsxLv3dPt1j2MUBEyEvnJyiGJCeSvzmpJ6wKDaWY6sszgwLetYGIYzKrmJQ=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by CWXP265MB5717.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 11:58:40 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 11:58:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta
 <Brajesh.Gupta@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Topic: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Index: AQHcjHbf7UVtw86Y80m0+TpPUaR1YrVqdbIAgAAw64A=
Date: Fri, 30 Jan 2026 11:58:40 +0000
Message-ID: <9c817fca-dbf0-45a5-9c4f-f0022f756f8d@imgtec.com>
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
 <848896564152798716484225d49df14255cde64e.camel@imgtec.com>
In-Reply-To: <848896564152798716484225d49df14255cde64e.camel@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|CWXP265MB5717:EE_
x-ms-office365-filtering-correlation-id: 3e954365-4b73-4754-28cb-08de5ff6e89a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NlVkYVp0N0RnUm82bGE1emR5bnFGd3pUUnZ2UXpSN3BmeCtoa0JNT3IvMklt?=
 =?utf-8?B?SVBnUFpGYlJNakNyZExyOW5aakF5aUZ2S01Ha2JlS2FuVmhPOGRnUUlLZjF3?=
 =?utf-8?B?OHNCb2ZNNHdxQ09CREk1ZkxnWjkrU09KUkRHenRIcGdBVk5pTjdwUHBPc0RH?=
 =?utf-8?B?dUU1MDJIbTdINGpVUExxRWJ0b0l5OVV4YW9pT3RvV2xrWmRDcTlqeWpSR0Y2?=
 =?utf-8?B?YituVzJ4ejJsYnR3WjRkdjBrRjdwZjVETWJ1emZUQk1GaVRKYzNyYythMmxH?=
 =?utf-8?B?TmNaU2NuRGtSbGhxM2NZSTdsZ2tUK09VNDIwWGRyN05zZ1N3VGpCdXBEejRi?=
 =?utf-8?B?dGQ2SUJVaXp6SWlpSWhBNU5tQ3k0RUZTMnBVS0ZuT3oyV2pQYXFKcDY5ZEJW?=
 =?utf-8?B?dENhQmM3cE5FVHJLR0F6bHRSb0VSV2QwSVplQ2RGN1dTejZySkdYK1dmbzh1?=
 =?utf-8?B?ZDVKdzFabXQyVmE0L1RhK3Y1d0VlSm1YSk5DMC9lSWlYWTFWR052a2NqdU5L?=
 =?utf-8?B?VEJkckNpMm9JbzYxMno0MFJFQ0g1cXl2SVFYY3BwNm5TNVlieVFlVEprUWJu?=
 =?utf-8?B?MU1jdmVzVGJPOGd3cTFVeGJFSkVsUmZoS1l1MnBnYklPMnFCSFpHeU5uQ1dH?=
 =?utf-8?B?Z01JS2NLcjJPSEgrQ2I5dmdlUlk3V2g1RXo1djBNQjlGNVBJOSt4MlliRCtO?=
 =?utf-8?B?cStrTUtBUW9DU01oVDdSbk4vSHJnT3RacDlkVnhrTCttZ2dydm9TTkprZWJD?=
 =?utf-8?B?S2Z4Q2V3S0cwcWVXbU5DVE5Jb3FCeVcwQ09QcWoyZ2R2SmxEL0FJZ0h0QXdm?=
 =?utf-8?B?dVk1K1l3UXVFMGFKMndCamNtNWprWWJ5ODMyTWxKc2xsYzFESXRLSkg4MXNv?=
 =?utf-8?B?cXZnY3VsRXlsVlFlOUZQbmxtR1BnN0lJQzZ2RDlYbG15UDVIUTN0cUJKWWtZ?=
 =?utf-8?B?ZzFTSU1mU0lueDhybzlreGVTZ0wwd09CM003am90WGJQdkpZY3hsYXo1ME56?=
 =?utf-8?B?Qi9xdVZhR2k1NWlGclk5V20yZG5aSEh1Tmxjc0UwOG8wdWRQZVF5WlR4aEQz?=
 =?utf-8?B?S3FRdno2em82MjM4aFpuUDZ4UXJmelpOY1F3a1dDRUVYWktTTlA0MldnRm5k?=
 =?utf-8?B?N2RHa2E1NlkrYWRDYW8vKy91T3o1RkxlM3F3OU5CbGIzRVUxcERiK2dWNDF1?=
 =?utf-8?B?cTBpRmM1YnVoK3Z6UEQ0TmIyMnZaTEJKUVYya0NWSTJVVUo0Sm92K0V5VDRi?=
 =?utf-8?B?d0ZoTVdwajFPRERuNVBzdHd3T2tZUG4yUi9iVjd3SlB6TmhrT2p0WFdqZGpr?=
 =?utf-8?B?UVNQUGZvK1k2cGZ3ZzlpUDdxSEtZVGt2Ym5lL0ZUNGNqVE1SbUxkekdwdmxy?=
 =?utf-8?B?dXVQUTVsekZHdGswbno0WkRFQ2UrVmtweFZQTmVWL0FRRHEwS1FaUFBEMlMx?=
 =?utf-8?B?bUZ3UkZDbmpDK3htVitCZXowWE90d1hrbjZrK1NFMmVTMlIyOG41TFZpS2Zl?=
 =?utf-8?B?SmluZ1lGMWZYRTJUYjRJbEdja3VBMC9CV3FDTGJNK21MalM3bHB0YlJOdVps?=
 =?utf-8?B?WkZQSHlJbytMY2VLVEZoVk5RQzM3aXcwSm1BNkt5eHVjUDdkRHRRbXFPc0ZP?=
 =?utf-8?B?OXhJV2RtUFg2VXFrT3h3UG9CdysxT0RNN0pySURTWkpiLzdabjRRbVc4aXVa?=
 =?utf-8?B?WXkwOWhLTENYVlRQb0dTQ2JPeVo2OG1oYXdRTytPQmZtVmhQN1hLRXVlWlNR?=
 =?utf-8?B?cHFRb2lLODdyck8vQndWa0gzeU1UeTlZKzdVbno4TzI2U2hHNmZ2NkYxUlJM?=
 =?utf-8?B?amxSeHRSaGV6ZXpIMllXWWxBT1hwU3FyUmtMRklZQ1ExY2I3N2pMY21iU3hY?=
 =?utf-8?B?TjZnUE04dnh0c1NvNFN6dnRWNnVZallEMWdRcC9tY1p5aHgwaHRhZ0N1TkVL?=
 =?utf-8?B?TG8rMUVwYWgrZXF1R2s3OXZkeTR0OWp0ZnpZZmsya1ZUck91cXJSOUF3aSsx?=
 =?utf-8?B?c2dnemZXOW9KWUZSaWtIYW1vMTVkMEtmTjlmeXZCbWJ2RDFzbFhJNktxMFox?=
 =?utf-8?B?S21ldmNFOVFVd014V0I2SjJpSzRROGZBWGpma2tCS0dLS2NDamNPQzF1V3ZS?=
 =?utf-8?Q?EgZlp6FvQ7zhzItvvAGp7yqQQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0t0TlErbFJETVpVSjNTNHhIQnhad1VKOVRhWVFWYWxXSDgyQngwOFdqWUc2?=
 =?utf-8?B?NWNYajhUOWF6RHpFZXJSeGpkYTRyMXhBZlQyOHhwVnd1cTVkWTFtVXV3RERs?=
 =?utf-8?B?ZFZ3c3c5bnE3cHJMZFZsd0tvRUdLM0xGTFhDQk1sTXA2RzdGZnk3VitObFgw?=
 =?utf-8?B?NmpIRjNCM0M2VVZYeXQ3bDExWDRsejRoNWNITVRsTk5KYnVRckFKNit0ZnBQ?=
 =?utf-8?B?cEs4VVp4QU52Nk91WjZrdXZqR1Q1RDMyV2U2YUR4eHkzWFY0WmFKem4xWkp5?=
 =?utf-8?B?SzZkeGx1MTkyZTIyMmxlaUdQSUQ2S0lLU0d5YUZ4eExmVFZsZmQ1THZUekFr?=
 =?utf-8?B?M1BBVGI5amJZT1Z4Tkt6V1RrY2Z2Ulp4VEFqdnB2cHlEcmJ2UGp5NDFmVURS?=
 =?utf-8?B?cGE5bi9IeVR5b2ZRMGtlQSs1VzVZb1Z2REUxYlArd1p0Y09zN1BhUytKc0hD?=
 =?utf-8?B?S0ZEVW80SmRaNnlYbDN4U1VmV04yNXl6UzZIZDZFSENkT0JMM2owVUIwQjJ5?=
 =?utf-8?B?WURURUJvWWpuaFZ2VzQ0TUM2UmhRVXZYSWZlYU9kL1JGdUQ2OFhkZnRHb3pN?=
 =?utf-8?B?WTlrMDU0ZGVNdThjbW51OXJmLzh0d2hmM2NaMEtJQU82RENvZ0hWUkFLOFJK?=
 =?utf-8?B?aXpONUhLTXVVNHg2UUxzV3dyb3V3SFdHTkpacWlrY0NjV25rZG53K3NQN2l1?=
 =?utf-8?B?RkQ2MXB0cjVNWTl1L3NzcWo0N241MEQ0TG45YkJCZEQ2dWw2anhyeDg5c2VZ?=
 =?utf-8?B?ZzJpUWw2NEpOWnFndUd6clYxejgxZU5za1IydGkwWXZYYStIMUNraENYYVcr?=
 =?utf-8?B?dWRpWUwzc3pFdklva0EwTllRZUJmc1JPZEZScWtJMkZWMGhvbDI4ZjVTSXdo?=
 =?utf-8?B?am1QZTM3ZEovUlVpT0s5V1crUTFEVnhGSTg5L2plNUhXTEYzVDIzdW53ODV0?=
 =?utf-8?B?NHFlbVZEVzg1M0R6YXVBdG5jcXZ1aDdRdkUzMXVhdzF1VU03RUJqWmxCS2t0?=
 =?utf-8?B?azdLV1FZMHVLWFpxWjRpYzFCK05kUTZXTWttdlU3Qmc1Wit5WXNwRDdmdUxp?=
 =?utf-8?B?RWk1MXRZT3FrMnczZEVWUFJBTzllNForTkIrN2h4ZXhLRU9aU0lzTUV3NEg3?=
 =?utf-8?B?bDRTby8zd2FoOWR6Nzd2TEE3Qy9HYXZVNEFkZEdsQ3NlSUJENGh6WUZLcmJD?=
 =?utf-8?B?dHk2cCtPNmxtbW1nNkVhak5qZVVKNS92akV1ZjFGWHZzYkJvRmlsb25rSm9U?=
 =?utf-8?B?bmljejJ6YXhaOUdINlRvVGxRRUxHYTlEUHd2YTkvR1Q2RitsZEZDVHVjRWJG?=
 =?utf-8?B?Z1JxamFaRHZjQ3ltK1F5a0lhaVBXenErWFZXR0t4UStsZ3dZcUZuUmdDc2J1?=
 =?utf-8?B?WDZVTjM4ckk5bHVCemFpc2h1VU5kdEFrWVZJY2xUSmRpWjVXaXJvOGhGUVFI?=
 =?utf-8?B?a01kSmVzN0FkZlFDY1lNTW85aXRnbnlZUzVBVFU4MkQzNW9CQkYrL3IzUjRi?=
 =?utf-8?B?OVJrNE4xTWdvNkdmVzNWaU9aTitVWVdZaFl1bXRZeTdQMXVqRjljbHJ6TUFt?=
 =?utf-8?B?V016S2VpTDFYbHkxMmRLZ0FvYUJ2R1grRytod0U4Y0V1R0xqNGpVMGVLZk9I?=
 =?utf-8?B?cXRObVBKMHhIb0ZUWVhNd1RoMDJTYmxVMHByN1VURUl5bVAwM0xES2dVcGJi?=
 =?utf-8?B?OFd0bGVOUWtud0hxa2ZvSW5aYkVzNzlNNDBYeFBERWhaNjZ5MnUrM2xZaU9Y?=
 =?utf-8?B?cjA1djJERU5jdzRtU0hWSGxhQkZkTUZMcHBoc0Q5S21oZHhiY0V5U1VJUEF3?=
 =?utf-8?B?clpYcEwvd1FUb1FCQTJVM3pqR0FYV2RJRUNkTWhSTW1Bc2M3RG5BcUFjUEtq?=
 =?utf-8?B?T3puSHc2THJqYVhBUVlZZ3dzcENyd1c2UGc1NE1YOVJCTVJtR3liZW1wOXlw?=
 =?utf-8?B?VFBadTZhRmloRlZPUlNpT0piMTBrSDhHalRJajBaT0NlN1FOYTRvRStXaGpp?=
 =?utf-8?B?cmVKb0o0Z3d6VzZ0RWNRUUpjenBUT2Y0aVdYaHRwR3JFNFBpaVdEWktxeVJS?=
 =?utf-8?B?TExMVW9qckhQSC9PRmJKL0RvcUhGMnozNkJBdHVIM3F4NWV3dGxLaUZQTU9r?=
 =?utf-8?B?eFpuWVVCeHZWM3dqb3p3SXE0QWlkMVFodVE2SGM1RDhtcFV5ZWVsVkNPVXFm?=
 =?utf-8?B?bEM2OENJVWxrREJyR2piTmZFOWRkOFNNWXlzOVl4MGp3UHdQRVZCSjZla1pY?=
 =?utf-8?B?QVVDMUpLUEZRTDhOOXNlVUw1eW9FNTRWS2xqcC8yODBjOUdBckxsMVRJbjVv?=
 =?utf-8?B?OWdoNlpvUDlRZVc4Y1NoMzBJNWJCUnZQWjVXc1MzSDBxQXRBWjBHQ1F5VHMv?=
 =?utf-8?Q?pbL/KJgT+RSHTYO0=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zi8JqEUlQU3WlAGd6psSCVyC"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e954365-4b73-4754-28cb-08de5ff6e89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 11:58:40.1830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZriA9ZLUu6Ee6YJ4k9DHaXe0mW16+SReQnrvPd6TG2r+ca5rzCZByeUPO/F4Za4SIuvQwIp+JyogMuqOXFvC2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5717
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OCBTYWx0ZWRfXxs1ILAL4ndrc
 M5dBsztqfmSs88oSD8rojs1NoSQtpCYAqdcNdghDEAFWsMUSVPVmPcdgaaAeced0nA8kt1vXe9K
 ozpyMcuSKLLXm5QxISrbgQy5lCLpDVQUuF+uZnV6VPw8QBy2q71Rybyh8yAISAMrqlROauZJtpT
 ajk2kY0bRhJ+tIs+3L5UEfp3sktR09GqJDLTNQ2n/aqCpFDHZh2QJfe5V4juExgSpbDuTCci/bk
 pOm+LszNQAlwuqdhe3hPLuOJUyYx+VHwtB8xf5LxzHsduIhsUzR5x6G0wEAn/HiUlWp5j6CdcHM
 eovMD6rXQGobEPAgJ1uJkXgnmP39xFHtuaZOe5Gft0lXmmI6VKwLbq4HOjYYDWupzEdkJni8jb0
 GoAviWkrHHS6gN/MPOIJtkiXc2r+9U9WoJqgBY0tc0VeizpxVBWO1BZnEIP6zOOhv7MoCRxjd6m
 scrWAy1rsgkZ+3uvk6g==
X-Proofpoint-ORIG-GUID: JRLw0jj_n6IT_ZmwNxflpWU6K5hYjwo8
X-Proofpoint-GUID: JRLw0jj_n6IT_ZmwNxflpWU6K5hYjwo8
X-Authority-Analysis: v=2.4 cv=X6pf6WTe c=1 sm=1 tr=0 ts=697c9cf6 cx=c_pps
 a=vLRwiXW9df4xC8AjbIh2Jg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=SXsdRCy8fkby9kUbKSMA:9 a=QEXdDO2ut3YA:10 a=oksrgtOMY_RgXMzP_TQA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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
X-Spamd-Result: default: False [-4.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux-m68k.org,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alessio.Belle@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2C22DBA454
X-Rspamd-Action: no action

--------------zi8JqEUlQU3WlAGd6psSCVyC
Content-Type: multipart/mixed; boundary="------------0fELYI0mCM9XqbjfN9LbFWBO";
 protected-headers="v1"
Message-ID: <9c817fca-dbf0-45a5-9c4f-f0022f756f8d@imgtec.com>
Date: Fri, 30 Jan 2026 11:58:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
 <848896564152798716484225d49df14255cde64e.camel@imgtec.com>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <848896564152798716484225d49df14255cde64e.camel@imgtec.com>

--------------0fELYI0mCM9XqbjfN9LbFWBO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30/01/2026 09:03, Alessio Belle wrote:
> On Fri, 2026-01-23 at 14:44 +0000, Matt Coster wrote:
>> This helper handles the attaching and linking of the entire list of po=
wer
>> domains. Besides making pvr_power_domains_init() simpler, this also la=
ys
>> the groundwork to simplify supporting the varied power domain names us=
ed in
>> Volcanic GPU cores.
>>
>> Note that we still need to create the links between power domains to e=
nsure
>> they're brought up in a valid sequence.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>=20
> Reviewed-by: Alessio Belle <alessio.belle@imgtec.com>

I'll leave it until Monday or so to land this in drm-misc-next, just in
case anybody has any concerns or comments on this approach compared to
Geert's suggestion (linked below).

Cheers,
Matt

>=20
> Thanks,
> Alessio
>=20
>> ---
>> We've had this patch kicking around internally for a while; it's been
>> held up by discussions as to whether we actually need the dependencies=

>> between domains for the hardware to behave currectly. As it turns out,=

>> the answer is yes.
>>
>> Geert sent a similar patch[1] yesterday which didn't retain the
>> inter-domain links and suggested we just send this one instead of
>> reworking his. Thank you for the kick up the backside to progress this=

>> one! :)
>>
>> [1]: https://lore.kernel.org/r/194465eda54d1f852a9226cf691ddc5aa208e0a=
3.1769097977.git.geert+renesas@glider.be/
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.h | 10 ++--
>>  drivers/gpu/drm/imagination/pvr_power.c  | 80 ++++++++++++-----------=
---------
>>  2 files changed, 33 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/dr=
m/imagination/pvr_device.h
>> index cfda215e7428e..d51c57cf93323 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.h
>> +++ b/drivers/gpu/drm/imagination/pvr_device.h
>> @@ -152,15 +152,13 @@ struct pvr_device {
>>        * @power: Optional power domain devices.
>>        *
>>        * On platforms with more than one power domain for the GPU, the=
y are
>> -      * stored here in @domain_devs, along with links between them in=

>> -      * @domain_links. The size of @domain_devs is given by @domain_c=
ount,
>> -      * while the size of @domain_links is (2 * @domain_count) - 1.
>> +      * stored here in @domains, along with links between them in
>> +      * @domain_links. The size of @domain_links is one less than
>> +      * struct dev_pm_domain_list->num_pds in @domains.
>>        */
>>       struct pvr_device_power {
>> -             struct device **domain_devs;
>> +             struct dev_pm_domain_list *domains;
>>               struct device_link **domain_links;
>> -
>> -             u32 domain_count;
>>       } power;
>>
>>       /**
>> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm=
/imagination/pvr_power.c
>> index b9f801c63260c..a0834c550a852 100644
>> --- a/drivers/gpu/drm/imagination/pvr_power.c
>> +++ b/drivers/gpu/drm/imagination/pvr_power.c
>> @@ -593,14 +593,16 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
>>
>>  int pvr_power_domains_init(struct pvr_device *pvr_dev)
>>  {
>> -     struct device *dev =3D from_pvr_device(pvr_dev)->dev;
>> +     static const char *const ROGUE_PD_NAMES[] =3D { "a", "b", "c", "=
d", "e" };
>> +
>> +     struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
>> +     struct device *dev =3D drm_dev->dev;
>>
>>       struct device_link **domain_links __free(kfree) =3D NULL;
>> -     struct device **domain_devs __free(kfree) =3D NULL;
>> +     struct dev_pm_domain_list *domains =3D NULL;
>>       int domain_count;
>>       int link_count;
>>
>> -     char dev_name[2] =3D "a";
>>       int err;
>>       int i;
>>
>> @@ -612,46 +614,33 @@ int pvr_power_domains_init(struct pvr_device *pv=
r_dev)
>>       if (domain_count <=3D 1)
>>               return 0;
>>
>> -     link_count =3D domain_count + (domain_count - 1);
>> +     if (domain_count > ARRAY_SIZE(ROGUE_PD_NAMES)) {
>> +             drm_err(drm_dev, "%s() only supports %zu domains on Rogu=
e",
>> +                     __func__, ARRAY_SIZE(ROGUE_PD_NAMES));
>> +             return -EOPNOTSUPP;
>> +     }
>>
>> -     domain_devs =3D kcalloc(domain_count, sizeof(*domain_devs), GFP_=
KERNEL);
>> -     if (!domain_devs)
>> -             return -ENOMEM;
>> +     link_count =3D domain_count - 1;
>>
>>       domain_links =3D kcalloc(link_count, sizeof(*domain_links), GFP_=
KERNEL);
>>       if (!domain_links)
>>               return -ENOMEM;
>>
>> -     for (i =3D 0; i < domain_count; i++) {
>> -             struct device *domain_dev;
>> -
>> -             dev_name[0] =3D 'a' + i;
>> -             domain_dev =3D dev_pm_domain_attach_by_name(dev, dev_nam=
e);
>> -             if (IS_ERR_OR_NULL(domain_dev)) {
>> -                     err =3D domain_dev ? PTR_ERR(domain_dev) : -ENOD=
EV;
>> -                     goto err_detach;
>> -             }
>> -
>> -             domain_devs[i] =3D domain_dev;
>> -     }
>> -
>> -     for (i =3D 0; i < domain_count; i++) {
>> -             struct device_link *link;
>> -
>> -             link =3D device_link_add(dev, domain_devs[i], DL_FLAG_ST=
ATELESS | DL_FLAG_PM_RUNTIME);
>> -             if (!link) {
>> -                     err =3D -ENODEV;
>> -                     goto err_unlink;
>> -             }
>> +     const struct dev_pm_domain_attach_data pd_attach_data =3D {
>> +             .pd_names =3D ROGUE_PD_NAMES,
>> +             .num_pd_names =3D domain_count,
>> +             .pd_flags =3D 0,
>> +     };
>>
>> -             domain_links[i] =3D link;
>> -     }
>> +     err =3D dev_pm_domain_attach_list(dev, &pd_attach_data, &domains=
);
>> +     if (err < 0)
>> +             return err;
>>
>> -     for (i =3D domain_count; i < link_count; i++) {
>> +     for (i =3D 0; i < link_count; i++) {
>>               struct device_link *link;
>>
>> -             link =3D device_link_add(domain_devs[i - domain_count + =
1],
>> -                                    domain_devs[i - domain_count],
>> +             link =3D device_link_add(domains->pd_devs[i + 1],
>> +                                    domains->pd_devs[i],
>>                                      DL_FLAG_STATELESS | DL_FLAG_PM_RU=
NTIME);
>>               if (!link) {
>>                       err =3D -ENODEV;
>> @@ -662,9 +651,8 @@ int pvr_power_domains_init(struct pvr_device *pvr_=
dev)
>>       }
>>
>>       pvr_dev->power =3D (struct pvr_device_power){
>> -             .domain_devs =3D no_free_ptr(domain_devs),
>> +             .domains =3D domains,
>>               .domain_links =3D no_free_ptr(domain_links),
>> -             .domain_count =3D domain_count,
>>       };
>>
>>       return 0;
>> @@ -673,31 +661,21 @@ int pvr_power_domains_init(struct pvr_device *pv=
r_dev)
>>       while (--i >=3D 0)
>>               device_link_del(domain_links[i]);
>>
>> -     i =3D domain_count;
>> -
>> -err_detach:
>> -     while (--i >=3D 0)
>> -             dev_pm_domain_detach(domain_devs[i], true);
>> -
>>       return err;
>>  }
>>
>>  void pvr_power_domains_fini(struct pvr_device *pvr_dev)
>>  {
>> -     const int domain_count =3D pvr_dev->power.domain_count;
>> +     struct pvr_device_power *pvr_power =3D &pvr_dev->power;
>>
>> -     int i =3D domain_count + (domain_count - 1);
>> +     int i =3D (int)pvr_power->domains->num_pds - 1;
>>
>>       while (--i >=3D 0)
>> -             device_link_del(pvr_dev->power.domain_links[i]);
>> -
>> -     i =3D domain_count;
>> +             device_link_del(pvr_power->domain_links[i]);
>>
>> -     while (--i >=3D 0)
>> -             dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true=
);
>> +     dev_pm_domain_detach_list(pvr_power->domains);
>>
>> -     kfree(pvr_dev->power.domain_links);
>> -     kfree(pvr_dev->power.domain_devs);
>> +     kfree(pvr_power->domain_links);
>>
>> -     pvr_dev->power =3D (struct pvr_device_power){ 0 };
>> +     *pvr_power =3D (struct pvr_device_power){ 0 };
>>  }
>>
>> ---
>> base-commit: 15bd2f5d52de890f745ac0c60a44cd27d095bb0d
>> change-id: 20251201-pm-domain-attach-list-ef4ec12a9271
>>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------0fELYI0mCM9XqbjfN9LbFWBO--

--------------zi8JqEUlQU3WlAGd6psSCVyC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaXyc7wUDAAAAAAAKCRB5vBnz2d5qsMLp
AQDQO+6PG4wtNcaXVnkCRgBPVTaZNgHPSbPBbhREFa9RFgD/TdVoMoloa2Qrc4zT14ST0y7+cOYw
O4lZ3hsYXNQRzwc=
=O2ba
-----END PGP SIGNATURE-----

--------------zi8JqEUlQU3WlAGd6psSCVyC--
