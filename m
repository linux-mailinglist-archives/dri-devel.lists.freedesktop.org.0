Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C102CB06423
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1610E228;
	Tue, 15 Jul 2025 16:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="bHiof8cr";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="gPPEQXvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1730 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 16:17:49 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AB610E228
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 16:17:49 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56FF06b8384273;
 Tue, 15 Jul 2025 16:48:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=+gVMnTRI9zc/OxwdVNvgboqmS8WQRYZEDLhPdte83/o=; b=bHi
 of8cr2zx/UxzpzbmM81z9B4WTWHB76UISjCEU73CW7M1ozajVVSxexWWunLGLYKF
 y//oSVS17hdHUEv7pOQsDZxSgF6ts9rhZWBuB9/5XuyIP3OZ0WJAAvtIoJdlFFeg
 7znbCmafLM965MST3cTO9jozIE3iwNbM3vCDDm59VfmWfFad46OWls1bw5ztS6HO
 1zbnCCGFuZDwca1CL4s6CZU2n22e40UhJJaq5BOv2ZZg66anOC/A+cFpxVi2rfuK
 gSK7tTxJb1hNUOSRrtLHutrnKGD1IgZYcyPMlcNegG2IjPo4yDtl034J7Ar9SXwY
 +/VJ7vVNTPVjIcASLTw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021142.outbound.protection.outlook.com [52.101.95.142])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47udynu0rh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 16:48:38 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMeF87pwzox8j5M9HQoeLQWWUWdllMbA47c0uFHO1iBA30eOg5ZAYjP0XRjTqH3LC6RUwsQI3/XpeWmMpAEtjGgjydlAaR5XugCFjFqH8P+bSdq8OdUSYq3rVcImSk75BzJA1vJbvRpJiVvu5WeCUNWpECESwuCKUQBf6B/EgQOxuEVaWT6uQZDpRolOcXltDL1hov2tuObeC3ykndx4V8cChBAqZEkd6pbwDpCrFAlnlYCMhepfQQzCdiQda61iR/TaEf74ibCLr3ptIKVb+zNSucDvQBvWY1IxcTvITdUPFeGWi8zu7s8p+HM3GxLTxWXD2QzBoxYdcYnfcH0oZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gVMnTRI9zc/OxwdVNvgboqmS8WQRYZEDLhPdte83/o=;
 b=ADW1ZntQy/amHVPnxnRhV+Q6PvMzyRBKQ0wjrflCKgas8BZqE2IW7HjXUwW5x+RHDsiRl40DZmfS9jr59AZBtD7hoETM7u8viCEKrQUBBQ8oWxA77DL1XDqUI6VfnRYWPIqBBBSsQyo/Ki2bryd97P1D39HbXkT8nl23pq0c6s81LyGXmLcMD0ggSuixS7F7vuo3JiyKkrjMEY/c36Xj26btHppLusB6+ngogp0yna1AoD5qFEH3UwjvWabUjqqIw9eVG8/2YEjxbkBAaDiv9OpH4WmtPD9FWmf2VZ22bFElSxSSuFVwcj/K/4UzZ8vYkinmzYEYQuQuUDIMe13yhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gVMnTRI9zc/OxwdVNvgboqmS8WQRYZEDLhPdte83/o=;
 b=gPPEQXvtnX/A1BkJk2BZTuIDgHuGkt9RWXquiszMKOdrMJPchD7GDH+6expaYS6m0WtQfHmBEGbHbX3bSNP6ZToFIa63x6Gs73mEIlggzFPQi64ywyRZm4+nE1ELA6tdPX5i2gFENsJ+t/6JsVGvjm03EGSWoG0aDjKz7qMrWiQ=
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::5)
 by CWLP265MB5522.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 15:48:33 +0000
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2]) by CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:48:33 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/imagination: Add and use FLEX_ARRAY_CHECK()
Thread-Topic: [PATCH 1/2] drm/imagination: Add and use FLEX_ARRAY_CHECK()
Thread-Index: AQHb9ZXj695Pzh5uaECGAvih+NMAqbQzVKeA
Date: Tue, 15 Jul 2025 15:48:33 +0000
Message-ID: <8be967cf8bdb9317d6f3bd1f1175b49486c4ccc9.camel@imgtec.com>
References: <20250709-flex-array-check-v1-0-8adeb0bf0cde@imgtec.com>
 <20250709-flex-array-check-v1-1-8adeb0bf0cde@imgtec.com>
In-Reply-To: <20250709-flex-array-check-v1-1-8adeb0bf0cde@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5009:EE_|CWLP265MB5522:EE_
x-ms-office365-filtering-correlation-id: b109e8b3-2530-453a-4579-08ddc3b70dd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aVBoZ0QvVnJCUUVoV1JoZGJJNC9vdmRvcTY1OFBMTURQSC9UTW43MlJrQ1U0?=
 =?utf-8?B?NWxDb2EzN29jK3VtQWNaREhDL2JVK2ZJQjRLbittcmsrMXlyWFN5cVF1Wkwr?=
 =?utf-8?B?ODJkN2JqOTVjNmtjb251RnNWUE52SXM1ZVZSVjI3VHRuUDVib2N1Qzd1Lzgz?=
 =?utf-8?B?SW12eGY3b2tNeXZFNEZhSkZJczBKcTRCN00vckx5Y3ZjdTVZM2ZIWFdRR29x?=
 =?utf-8?B?MnBlYnBPZzdQMDF5U0pyOGdZRk1wWndNaVVKNzE2bjc2TU5PaC9QVkJocUNk?=
 =?utf-8?B?SlM2djd2WWdmY3lyeGlsNmtoSXdYY2FtQ29nZlkxQ3lwazAzU3pXR2IzNjVm?=
 =?utf-8?B?aDJRR0ZlUVpzaU41UExQRGF4dzJwbFhJR2NwRWRJY0FYS0FFMEs3ejVkcVRO?=
 =?utf-8?B?eit2UmwwYmViUEI4Nzd0aUhWT0ZLMHhjNFB2cGhxekIyK2FwcktHU0ZvOS9s?=
 =?utf-8?B?VUFMejRYbGI4RzIwYUlsR0JlZDNXbG9aUXFQYVc1ak53bkt5TjdDc3c0T3pv?=
 =?utf-8?B?TkxnRFpEd0wvT2lmWGlLQkNPaWt5SWhWTVA5VHJ0YWdHOUFyL04vRzNSK1dl?=
 =?utf-8?B?eW5qYkdMQmU0WnZrVytDZi9xeTZ3dmQ1ZTZlVTJ5WTJMS2lFNjBZcE9yRkxn?=
 =?utf-8?B?bkMxRnN2Y3J3TlZSYVRUbnkzNDdRZlAyWjhsQWU3TTZkYVF4cXVib1Z0eTRn?=
 =?utf-8?B?L0F2ZlNId09SN2FXYzBMbmFRQktRYTRxbzZDNGVETjNLS1BrNkJkYkthNTVV?=
 =?utf-8?B?UEpldldTRFY0ZGxmK1QwejlUdXp2T3E2NHc3VkM0YkdyUjdaNWlReXp4Tk5S?=
 =?utf-8?B?QzFaMFFKVitSQ3lTM01JMm53emVLWHZHcmxqNUVSNk1QQkliTWkrTDhRVVR2?=
 =?utf-8?B?eWZ3bjFZRGdDWW10SmQ0WFhFODdNd3dha1VwM0g4cEtuL1h0RWNzaXE0ZXFQ?=
 =?utf-8?B?RTM3MWFnNFRIVXNHdTFyVTV5cnZKdGhDd3NZelVXbW8veVByVmY1aHNMS044?=
 =?utf-8?B?VzBhQVhBUlFzdkZNa1hEWG54L0Z3STljMlBURlVjL0N6UjBQWjBQeEFJYXVG?=
 =?utf-8?B?YjlwNXdEcmtvOE9YMVhpZVA4L2U3b2J0OGllUE9heWNxdzliYm5xTWNzeElC?=
 =?utf-8?B?NHJXdElGTkQ5M3QxOFdRL3JDazl0U05pdFBtd3lva2ZXWWRWUVBzWjZCQkRW?=
 =?utf-8?B?YUl0MGxhZzArQUxJT0d6WXZnNWMydnR6dHZ3Um5udGFFdG94emlCN1ozT256?=
 =?utf-8?B?TjZCWmhoMzhNTHFsSGF3cWFtc0pUQk00ZWsyam9lL0NoUmR6c1FsRHB1dXRQ?=
 =?utf-8?B?NmM3L1NrclNTNzdQcXhFVGc3RDdFbW1YMHgybFFwZU50UlhKRXkwZzhOWDRH?=
 =?utf-8?B?TjN5ZDdBT1BHZnBMZkNDcSsvYTNWcEFiWGJ3ZTlOc2FYNXlsVmJTcG9uOUNC?=
 =?utf-8?B?Tkx5NnNyWlZpNU1MVEkzbW1IamdwWkZtMzB1dzJsL1FCTzlUM1JiT1NYTDJ1?=
 =?utf-8?B?VXRFRVhBbXVyaDNCalQxN3ladG9pbXcxTEloZGwzdmVSYzVHaXIwS0dIb2s5?=
 =?utf-8?B?UHV1NVIwZmRKb3VyY3R6RXJtbWxsTU1pN3h0R05PSVZoQ1lMVXp2ME1YQk9Z?=
 =?utf-8?B?MzRsaTlhZUNyYmVsOVROZ1hFelhDK1M3K3l0bjVVT3E4SnZlMFczV1VEY1hs?=
 =?utf-8?B?SHVNb2VPaWVtT2F0cXV0aU11OHhKVlM0aGp5SUN2T081VEJ4cVRTdTlyNVBD?=
 =?utf-8?B?TWMwWmN0cE5VRThzWmRPVys1enlaMlpPYnBqMHVEc3hjYk5qcFYrUE5rWUs4?=
 =?utf-8?B?YXBwb2xISkxGaWJ3WFhKNGp2OGF3aENmRHJOeGRPOUdwUGowYnNaMkxDRlhH?=
 =?utf-8?B?YnpBb2FydmlmMEpVUGJZNzBZUVdoMDUrWGFrUlBMNE1ERHg5QVB0b3Z0dUdw?=
 =?utf-8?B?dG9RWVZUKzliTUF3di9oMjdHd2dvZktweUtTRndvblYvazAvVDNrN1Z0T055?=
 =?utf-8?B?a1l5Q0E0WHR3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnRTZnNxaEVSWXBTcjRMdkVTWUUrem53YW5ISUQ3ekVHNHZsb2VUWWNYNVM1?=
 =?utf-8?B?OUxBd1RZNWMwQkh3UlpFclhzUkRUSUJGRlZUZmNlMWk4eGZ1bWpMOWdqMnZZ?=
 =?utf-8?B?QldZM2hZYjRJOTk5WDNSWEM5b0pxdHR2MjRZdnFJY1MrdVpXb3pYWURtcmhy?=
 =?utf-8?B?NG5jM3hiNG9YSGlOa1Z0bDBHbGFTc0I0bUFFbUFYVjR5VEpLYmdCUGxYQnpW?=
 =?utf-8?B?T3B0RkdBZERHMSsvNDh3cjRPWlRjckxwMzI1V0lFclNaQmN4eWx1bkxHUmNR?=
 =?utf-8?B?Q3Avc1UrR2xGc09sQjBEcnV4UmhrdzRqWlhtU2RSV2d4Mk5VUUpmVWN5aitI?=
 =?utf-8?B?K0YrWlEzdnhpbTV4Z3JocFJxelJxSEt6TGIvcGdubkd1S2Vkdm4wWVBPMGl4?=
 =?utf-8?B?Q2lzTDJGS3dPejNTcDIwTGJ0Z0JtQmFvcm9SSUhHdWx6b2Eza0dQeU4yM3da?=
 =?utf-8?B?TkdRakUzbjUyaUxmYkNyTE9vSmhtUVpHWlBpUmZFOVR5eGQ3NkNuN0J3OG0y?=
 =?utf-8?B?TS8wLzlXZkxnbWppVFlyc3o2ek0zTHVFNlJkWEpmZnpac2cvU2VwUUFnaXc2?=
 =?utf-8?B?bHY5cXcxZ0hneWtsL0hmTmpEVE5yK2grYk5yTzIwVUk3OHd2dGJzWWpqTENw?=
 =?utf-8?B?OU9DeUR4c2NMdVdmdnhJZzhNQkFRczNFRTJTaXkwTTFmREtLaGZyZ0tJTFp0?=
 =?utf-8?B?dmJjd2NGaVZUYTBuRmFnTFFMNVZmV0hPWDR0QUl3OG9sNHB5eDEzcHZrZ3hw?=
 =?utf-8?B?VzBVZnBLTVVrTkg0NlppQWMwUGpXVFNqcWtPM3kvTTc3SDBkRXpkK3NYdTNF?=
 =?utf-8?B?Qm8xWWdZT0RkdnZybEc5eEduNnFxWjBIdmgxYW5ESlY4eVE4VFVFajFzVjZD?=
 =?utf-8?B?Znd2NFRlOUk4MHpjVHgxaU10K2JEOFNFRTY2dGp6QzFHdnNSc0c2WUhvaFVu?=
 =?utf-8?B?L0VJTEh6Rk1vVDdyTEM4WUZpMjdmVkdZbUxmYXBFdXpTTXNQa2YyVlMvR09I?=
 =?utf-8?B?b3dYTEdzVEFrT1B1emJweXlGYmFuMUNaNnRKaHVKMHRKYys0U2UzTUVyc3Az?=
 =?utf-8?B?TUJkUUpzQ3luT1hQUU55eWRzUFI5OUpXUE1RN2FscHpLYWdQVnlsUCtRdDU1?=
 =?utf-8?B?Q29BK0ZaaWVCM3lYMmRkdUtNRFVmamIvcUlFYWZORHE1K0lSaTBVL2FHYitM?=
 =?utf-8?B?Ykl3SmFxblZKN0Z0Z3puOVA3bnA4UWQwRisyVktpR1F0SWlYNi9HaW1PRzFy?=
 =?utf-8?B?TE1JK3FaYThjOG5xVmlJditlM1F0d2RSWGRqN0hnM0JMM2tFRE1henhNNXJ1?=
 =?utf-8?B?cEMwaEQvOXZQdE1SR2NsU0Z5L3lXWGlRS0x3d3IweFlndE9KMVExNkRrNTNT?=
 =?utf-8?B?cm8wNEQzRTNoTzhMNk0yNDBiMmh1TjdSWDloMEVya2EvYWdVOS9pRXhSQ2F5?=
 =?utf-8?B?V28zWDVuVjI1VzVmRXNCWlVQZ1k5WmVnWWhWK3pla3FmL2R0cmU0OGdRZ1ZU?=
 =?utf-8?B?QlNheVFRYmVMQWlwbmhwKytrQW0rajRZM0l1bFZQc0svTXZONXl4a2kyVDF3?=
 =?utf-8?B?SHFGVm8xVzVQWUVDdHQzbzBKUjAyK2xvUTQ2M0REdHEyQVd0cURNekJDeXlN?=
 =?utf-8?B?N2I0MnBRSlgvZnFpZ2xXMCtncjJ3UzMyK3A3QkYxckNISFN2WmJVTDM4UEQ5?=
 =?utf-8?B?S0gwekNMV0tWS3pXbWFVaUhNQzcwWmJqYkF2Nkh6OXg0K1FwSkgwcU13eGpK?=
 =?utf-8?B?cy9SQWNmQmJOZzZnQzloaDJoVElralk2SHdXei9MMEZLbDFMMzFLS01mTW50?=
 =?utf-8?B?SjIrRFlMT3gyTkw4S3Fia3RtekxaMzQ0aFJBVWc1eGNNNzdxZTR1UnUvMVA0?=
 =?utf-8?B?SzVOVXlxT0FtanorNlcycVIzbUxnLzFhbGRTejdrM01oc2lQY1pSekRQd0lT?=
 =?utf-8?B?VjZ4QWhsMDcyRFdNL3BtNGJxYW9NUmxyaDJpZmhxRVBhTXR1YWRyZnh5bVJK?=
 =?utf-8?B?TkRZUTd4TmI3K3NBUUFjc0c1TENJWDk0aFRTOGZ3Rm9kYnh1cTNVY04va3E2?=
 =?utf-8?B?SGE0dDZiczBJZkxTcUZnQVpleEl3VUM1WVZXU2R5SWRTWDBXTkJtUXhubXUw?=
 =?utf-8?B?ZlJ1bzRCeUZ6M29PMGY0WDVCbzlLYVhTNHpNZXNBdnVYWkh5YXFNSmN0ZElv?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDCF8470DDF36D4DB3D85611D3836D9B@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b109e8b3-2530-453a-4579-08ddc3b70dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 15:48:33.4730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o81pm8+UsnMKThmD+oJc+tvg7Z/+EkY1fMf3IRLlLUaijGAD/w8ebdIeBn/0Lh3jCFHqIid+uL/aEEodf4SKpN6G6jB3Q1F4HRB484qPTk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5522
X-Authority-Analysis: v=2.4 cv=IbOHWXqa c=1 sm=1 tr=0 ts=68767856 cx=c_pps
 a=GwulDlvyJS+gHpL3b5V7Dg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=70l3bJO0AEUvdpY19D0A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: HVCDDsQnBFX12MenG2jgKxhc8terUpW7
X-Proofpoint-ORIG-GUID: HVCDDsQnBFX12MenG2jgKxhc8terUpW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwOCBTYWx0ZWRfX4j1A9Uc68VAW
 5es42k7uWRrNk21YZWsqG4KgEtAodO7VTdHb7taa8OFd0H8hlifQgNVzuqXwJzE0zz5L3II3eVu
 ZGe0s8RmbiWIRYdXzd+4ThB7+Ri57qN4DsB2fvBXj6/15O3y9YE59rrr8gvfOa8yozRDFMB7cIM
 S56mZR4PP36rhPrbD9uLEgKAbOjab8BHqRMZw37VmJwrOBFJAItU0GvIhcq94oF6BxoYrS9qTNw
 P+m47FkqPLHkCnh+Ne8uQLSVkSoQW7guFW4hov/89cBr3+LmqoddbawN7r6g/BhhJTuTxoyScKA
 b2KrAzz/8PXKuE5WyRw+00LkZMmBno5b+732/rETNC/LZp15jIv2JvGLH5CeFbjwvNq8pOuEd1C
 RMDgnT1e
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

T24gV2VkLCAyMDI1LTA3LTA5IGF0IDExOjA0ICswMTAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
SXQgbWFrZXMgbGl0dGxlIHRvIG5vIHNlbnNlIHRvIHVzZSBTSVpFX0NIRUNLKCkgb24gZmxleGli
bGUgc3RydWN0dXJlcywgc28NCj4gbGV0J3MgdmFsaWRhdGUgc29tZXRoaW5nIHRoYXQgYWN0dWFs
bHkgbWF0dGVycyBpbnN0ZWFkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBDb3N0ZXIgPG1h
dHQuY29zdGVyQGltZ3RlYy5jb20+DQoNClJldmlld2VkLWJ5OiBBbGVzc2lvIEJlbGxlIDxhbGVz
c2lvLmJlbGxlQGltZ3RlYy5jb20+DQoNClRoYW5rcywNCkFsZXNzaW8NCg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcm9ndWVfZndpZl9jaGVjay5oIHwgMTkgKysr
KysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3JvZ3VlX2Z3aWZfY2hlY2suaCBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfcm9ndWVfZndpZl9jaGVjay5oDQo+IGluZGV4IDUxZGMzN2U3OGY0MWQ3YmRmNDVkMWY0MzRk
ZDFhYTViOWVjYTcwMGEuLmU3MmY0MDY0YWYxODdlMmJlM2UyNjcyMmUxZWUxYWM2MzIwODdkM2Qg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcm9ndWVfZndp
Zl9jaGVjay5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcm9ndWVf
ZndpZl9jaGVjay5oDQo+IEBAIC01LDYgKzUsOCBAQA0KPiAgI2RlZmluZSBQVlJfUk9HVUVfRldJ
Rl9DSEVDS19IDQo+ICANCj4gICNpbmNsdWRlIDxsaW51eC9idWlsZF9idWcuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9vdmVyZmxvdy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3N0ZGRlZi5oPg0KPiAg
DQo+ICAjZGVmaW5lIE9GRlNFVF9DSEVDSyh0eXBlLCBtZW1iZXIsIG9mZnNldCkgXA0KPiAgCXN0
YXRpY19hc3NlcnQob2Zmc2V0b2YodHlwZSwgbWVtYmVyKSA9PSAob2Zmc2V0KSwgXA0KPiBAQCAt
MTMsNiArMTUsMjEgQEANCj4gICNkZWZpbmUgU0laRV9DSEVDSyh0eXBlLCBzaXplKSBcDQo+ICAJ
c3RhdGljX2Fzc2VydChzaXplb2YodHlwZSkgPT0gKHNpemUpLCAjdHlwZSAiIGlzIGluY29ycmVj
dCBzaXplIikNCj4gIA0KPiArLyoNCj4gKyAqIFdoZXJlIHRoZSBsYXN0IG1lbWJlciBvZiBhIHN0
cnVjdCBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlciwgdXNpbmcNCj4gKyAqIFNJWkVfQ0hFQ0so
KSBpcyBwb2ludGxlc3MuIElmIHRoZSBzdHJ1Y3R1cmUgaXMgbm90IGFscmVhZHkgcGFkZGVkIHRv
DQo+ICsgKiBhbGlnbm1lbnQgd2l0aG91dCB0aGUgZmxleGlibGUgYXJyYXkgbWVtYmVyLCBzaXpl
b2YoKSB3aWxsIG5vdCBtYXRjaCB0aGUNCj4gKyAqIG9mZnNldCBvZiB0aGUgZmxleGlibGUgYXJy
YXkgbWVtYmVyIGFuZCB0aGUgImNvcnJlY3QiIHNpemVvZigpIHZhbHVlIGlzDQo+ICsgKiBjb21w
bGV0ZWx5IG1lYW5pbmdsZXNzLg0KPiArICoNCj4gKyAqIEluIHRob3NlIGluc3RhbmNlcywgdXNl
IEZMRVhfQVJSQVlfQ0hFQ0soKSBpbnN0ZWFkIHRvIGFzc2VydCB0aGF0IHRoZSBmaW5hbA0KPiAr
ICogZmllbGQgaXMgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIgYW5kIHRoYXQgaXQgYmVoYXZlcyBh
cyBleHBlY3RlZC4NCj4gKyAqLw0KPiArI2RlZmluZSBGTEVYX0FSUkFZX0NIRUNLKHR5cGUsIG1l
bWJlcikgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArCXN0YXRpY19hc3NlcnQoZmxl
eF9hcnJheV9zaXplKCh0eXBlICopTlVMTCwgbWVtYmVyLCAxKSA9PSBcDQo+ICsJCQkgICAgICBz
aXplb2ZfZmllbGQodHlwZSwgbWVtYmVyWzBdKSwgICAgICBcDQo+ICsJCSAgICAgICN0eXBlICIt
PiIgI21lbWJlciAiIGlzIGluY29ycmVjdCBzaXplIikNCj4gKw0KPiAgT0ZGU0VUX0NIRUNLKHN0
cnVjdCByb2d1ZV9md2lmX2ZpbGVfaW5mb19idWYsIHBhdGgsIDApOw0KPiAgT0ZGU0VUX0NIRUNL
KHN0cnVjdCByb2d1ZV9md2lmX2ZpbGVfaW5mb19idWYsIGluZm8sIDIwMCk7DQo+ICBPRkZTRVRf
Q0hFQ0soc3RydWN0IHJvZ3VlX2Z3aWZfZmlsZV9pbmZvX2J1ZiwgbGluZV9udW0sIDQwMCk7DQo+
IEBAIC0xNTcsNyArMTc0LDcgQEAgT0ZGU0VUX0NIRUNLKHN0cnVjdCByb2d1ZV9md2lmX2ZyYWdf
Y3R4X3N0YXRlLCBmcmFnX3JlZ19wbV9kZWFsbG9jYXRlZF9tYXNrX3N0YXQNCj4gIE9GRlNFVF9D
SEVDSyhzdHJ1Y3Qgcm9ndWVfZndpZl9mcmFnX2N0eF9zdGF0ZSwgZnJhZ19yZWdfZG1fcGRzX210
aWxlZnJlZV9zdGF0dXMsIDQpOw0KPiAgT0ZGU0VUX0NIRUNLKHN0cnVjdCByb2d1ZV9md2lmX2Zy
YWdfY3R4X3N0YXRlLCBjdHhfc3RhdGVfZmxhZ3MsIDgpOw0KPiAgT0ZGU0VUX0NIRUNLKHN0cnVj
dCByb2d1ZV9md2lmX2ZyYWdfY3R4X3N0YXRlLCBmcmFnX3JlZ19pc3Bfc3RvcmUsIDEyKTsNCj4g
LVNJWkVfQ0hFQ0soc3RydWN0IHJvZ3VlX2Z3aWZfZnJhZ19jdHhfc3RhdGUsIDE2KTsNCj4gK0ZM
RVhfQVJSQVlfQ0hFQ0soc3RydWN0IHJvZ3VlX2Z3aWZfZnJhZ19jdHhfc3RhdGUsIGZyYWdfcmVn
X2lzcF9zdG9yZSk7DQo+ICANCj4gIE9GRlNFVF9DSEVDSyhzdHJ1Y3Qgcm9ndWVfZndpZl9jb21w
dXRlX2N0eF9zdGF0ZSwgY3R4X3N0YXRlX2ZsYWdzLCAwKTsNCj4gIFNJWkVfQ0hFQ0soc3RydWN0
IHJvZ3VlX2Z3aWZfY29tcHV0ZV9jdHhfc3RhdGUsIDQpOw0KPiANCg0K
