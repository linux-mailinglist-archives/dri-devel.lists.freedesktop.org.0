Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA68B0C345
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA3C10E51B;
	Mon, 21 Jul 2025 11:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="XaF6VIFl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XaF6VIFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A599E10E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:39:40 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RT1cRkNA9BClc2Sr+ifsIQnHtMm/WBda8IYQp+X+oJn5xPXWnRDGvbuAllEB/ihBylDTb5YRbc33Sily1AEiIh26otbDzEQu8ebYCF4zaR5qKg69QC35//ra7v+QmIo0dBtlJin3cD/bkcAbTzDXstbtU6Byw/udCIlQmLUmJYnFaSR7CemYm+/F+RKBd9ZmuMmhhB89z8ehuqRKAT5bMeGPof2fqD/9plY8achspC7fWjX7+XiGWyCqH6sEmqUTq3l3sqFn5Wqxh09TAygYZecDcWv6QC7SI4hHJOnux8RdAN/RbusGwb3992Gilte3hEZ1tNVgWgEXqfiWGh9Lkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv+XFqYdmfpRhf9qZaVsY5uh5lBkTlALrr8pc7FcfUs=;
 b=fXMkxgJVhgq6sZULcxRoiGtQkbmY6UOLVaP2Fuzx29MPV4KWDrrV8mJm/ZKm4FMTIPdcDU7ede0whelEbhT5RVCrYRIoUKrl9zWkMMbvAHd+hB/fOLVnESUfahOfGrCb+BP8+PFY1xbjmAyMOqVa3+9S0WwUTNO2S134A9sqfb3lomlnTPJ4PQB8I4QUpK3BiTHnuogUnAZmog1mlbbJFh7rURVyTyG8RvgMs29itqvz0UOuIrIAqnpbNW2iX/e95cwlYChBlu7EQ5QdY8zsnTc/XmCrOFjpiVg5Lxg2SLBL/3Liu2VZnVsFvMYI8wo1odUzGluos4827mpls10hnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv+XFqYdmfpRhf9qZaVsY5uh5lBkTlALrr8pc7FcfUs=;
 b=XaF6VIFlRdYr5QroTvP/sO72UM+2pG26PCTyl8/Kat//zd17iMFVIhDglm17rsyDA7QBpg2zsJqueeMSyVzSSTYa7zJAJaNdH3s5SnSCY5j68RsdXdE+T99oDuVuurLesbLPXsdqX3STjLBQ2Jrs1a4UqR7Ter6cW0zWg7v4TCw=
Received: from DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) by FRZPR08MB11162.eurprd08.prod.outlook.com
 (2603:10a6:d10:13b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:39:38 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::8f) by DUZPR01CA0023.outlook.office365.com
 (2603:10a6:10:46b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:40:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 11:39:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHd8jfPyDlemr6HCLQfPCpUVqV1il05YXLMf30/LqQD9DAZXD7RCeiJUi6x9bAi0J5W5a1iEhSdB098QGZ9kv+AQBRgiDq1T2YhM5p5StX2GdQAoGoSTGbQH5wD4iAt4DJrOiGLxB6ogRnwwU5Dz4Wsp6jgMiKECXeFrz4uU4LUgLW4pKSFLE9/LsWRxk5w7SyLWwSYW1aS9qE33/Bb1EBLI9UwtacmMK9JmYBYY1Gqhq2TYK3XjdSgiaIHPbNKAcGhb8A83gch5HqnBF4F56hwa0uU6DQ0htuF8w8pwiPLCVI+1Bj5qgj5PrgvXqimpTVvlM88/BqzB29nE4FyeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv+XFqYdmfpRhf9qZaVsY5uh5lBkTlALrr8pc7FcfUs=;
 b=sN3/qjPUrLU3BFjhX1hJuiDgA5lVZRt/nPVUFruakDVTmqSCupEDTDhGXLqJGQPB5/XrYtt6KRCBX2lJ/tZl3VbblRYL501S/60a1BZrWrhEozOTR+HEhZfKISAKT7iHa7JXG4ko4wax+cHjBL4HOuXaLgvKwzV0yjq1iduEIFa2n37mUg2Gwc4QFYhQ80uNZMkOK+kxPIV7kbkB7bIzTPmJUq/DHtyRHvSNEmbTV8oiZmP2eHnJGSnrfoeIPJT09GsmJbtLNpZi2xE0pRdL5xeF+4oyjCr7PjxObR8+sk5ql8ZreZpmzDCQBykC83CDC4l0rrR+JaxMlDtIc2vSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv+XFqYdmfpRhf9qZaVsY5uh5lBkTlALrr8pc7FcfUs=;
 b=XaF6VIFlRdYr5QroTvP/sO72UM+2pG26PCTyl8/Kat//zd17iMFVIhDglm17rsyDA7QBpg2zsJqueeMSyVzSSTYa7zJAJaNdH3s5SnSCY5j68RsdXdE+T99oDuVuurLesbLPXsdqX3STjLBQ2Jrs1a4UqR7Ter6cW0zWg7v4TCw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6135.eurprd08.prod.outlook.com
 (2603:10a6:20b:29f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:39:03 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:39:03 +0000
Message-ID: <8cfa87a9-7b82-4d24-a0ae-7a9cc1dad15f@arm.com>
Date: Mon, 21 Jul 2025 12:39:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-7-karunika.choo@arm.com>
 <a0481aed-825f-4ba9-b112-df7891299015@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <a0481aed-825f-4ba9-b112-df7891299015@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6135:EE_|DU6PEPF00009529:EE_|FRZPR08MB11162:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c9c3c3-aeba-4e23-7189-08ddc84b44f6
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?b2poNWtZVVlKdjdseG1aREh6WUFhSVJwcDN4STYwWUpiWVRGa2s2dkg5RzZV?=
 =?utf-8?B?RTJ0bHoyY25TMVJ3eWNwMm91emZMRHIzcURmdFhnVGxaS3BzU0ZFQlJOU25M?=
 =?utf-8?B?dE5rNElhSTdRRVR3K0toZG1GbTRhdzBobGpUK3RkVHZmcHdqcytEWTJwQjUv?=
 =?utf-8?B?NE80ck9rZkpVUndqS2E3Uzh1Q0RFSkZkU0hDM1JwQW9mSWNsVWYvSXFGMDJ3?=
 =?utf-8?B?WGt3cW92ci9vQzV2cDhvU2cvbUhRbVZpTkF0Yy90ZDN2ZHk1eUorRnpWRzFC?=
 =?utf-8?B?RWhXbFNqWE83OHI4ZmdXV1NaYk1qYlNpSzNicG92MWhJTVBpMFh1dHVxRlo0?=
 =?utf-8?B?V294NU1WbGFhTDczaDNVZ0QrWVJBZUk1Z2VQY2FjRjg2L3JaS21ZYm1pVFc2?=
 =?utf-8?B?WGVxdXdyYlhHaWNaMUVTS0Q3VUEwOXdiTEFlUmIxb0UzdmFQMkpablZNNEY0?=
 =?utf-8?B?MDROdUZ0R0ZNRFRabFl1czlJTVV3WUFsaUl6eXFsRVduWHRxUThSVm5XQitK?=
 =?utf-8?B?NG96K1A1VUlOOTZSVURTTkFyVjlnNzdPaE42MGpKM0Q0RlFkekxtWTBxeG5H?=
 =?utf-8?B?ZDdkTXc3RXJENEJ6QTU0T1NXNnZZcFh1WUlhbmVCRm8zZ0tKWTgxWEQwLzRG?=
 =?utf-8?B?ekNabTBCUHFxalF6OTZ4YnBzNjJRR00zMUVFSlJxajZDTytxb1dReWlJZ2sv?=
 =?utf-8?B?UzlpWSt3ZHpzVGljbmdIcHVpOFdPYzBBWlhjdlhwMUYrT2dHN1UycW9aZkEy?=
 =?utf-8?B?ci8zSWV6R2xUSjNvZFFMc1EraEw5SnhaTWsxdzZyMlQ3UTNYNGRlQWljUWF3?=
 =?utf-8?B?WThmQlJLQ1NLRlhhRVFxeXRUOE9qcGFZV2d6SEFFZFZTeXFSem5xLzJqRFVB?=
 =?utf-8?B?MUQwZkduQ0N3ZE1WVjlLMUhpTVJ4N2taa0tlczc4NUhjR2dabVRmZlVLN1RV?=
 =?utf-8?B?L0dFSExnMmJFSGlBOW92Ni82UjYzK3hvbWt0eEhqMjRxelVxcCthTVp5c2x1?=
 =?utf-8?B?dElLYWtudnkzWVhzTkg5QzUrRkNDNGt4NmZ0U0hLdlFnKzRSZUtMNG9iaDhR?=
 =?utf-8?B?YU1VRUJiOVBTRHBzT0UwSVF4cUo0ME1oSjJsbmRudjF1MXRHZjNQazVhYzc1?=
 =?utf-8?B?bDQ0SG00VHdleDdwMDlzazIrdVZQM0R3b3ZsRndXcGZaVENPOHoyM3BCZk1K?=
 =?utf-8?B?bFI3V29lTW9ZMjQ3WlhFYWNQQUNIVHJZWXdFRUdaSGlQVFpPdjBTN3k0YllP?=
 =?utf-8?B?UkR1ZzJWdmhydmhFV29YejU0cC9BQ216ZGVaeTZmaTdHMldJeVpINUQrRXUz?=
 =?utf-8?B?c2Y4NDhPQVZKb3NnaWYzNllmWDRHWGxRK0lYRFdiU095VDd4UXR6aHVUSS81?=
 =?utf-8?B?bTd4aFRyVnQvcGhXUHpMdVQySEp1V3ZEOGV3cVZYZzNObndIQUlMQ1dEaVl5?=
 =?utf-8?B?dkFxMFQzd3VhS0FNVTlrYkNOd29VRnRsVzVxZEZzenNiU1VHUVNISDN4bStG?=
 =?utf-8?B?OGM3Y3ZjN1J2eFViaGJiak16ekRvakhmT0xBOE5oWGR2eXNxdzZuNDB4OUR5?=
 =?utf-8?B?R1NHZ21sRlpyV1pUczY0QjNaSHRHSjZ2OHRydmVBTkVMemVwbGdSSFFRVzJZ?=
 =?utf-8?B?bzZtY28rN1JndGtRYys3NG1jYVZybi9QSGc2VG9uQ1FoZDFlWHl5QnBCZjZj?=
 =?utf-8?B?eGNwL3Rad1JUOVd0NW14UWlMU0dMY0JVYThDQTQxRjR0bG5rdld6dW1QUG5G?=
 =?utf-8?B?TjlKRDlRUGdMcEh2NFRwTTN0WjBQRjFxdU10S2p3d3pKZzBMUExkRW01bEMx?=
 =?utf-8?B?WUFHVnV0VjJwdThwVzFEMmdpUWM3VTUxK3NFQ1VDMDVUU1ZLeTlOMTZqck5Q?=
 =?utf-8?B?c0FybWJ1aWZPY3BIY2E4VkZ0M2Jzb3p4VWZqcTBsYmE1Wk1OYitYSFRvYVM5?=
 =?utf-8?Q?URTuYjGt4/M=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e3e2b6d5-2593-4cee-ce12-08ddc84b3169
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|36860700013|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU5nWUdMaUNONW1lMzB1dlZKVlBEcnNPRnVxbmxXdG5DOStkeGI0YXhaeEov?=
 =?utf-8?B?WlRBVlpVYXBrc0Fwc1kxODFvdHYvTWorWXV2a3FyM3I4TU05dTRqVlBQajAr?=
 =?utf-8?B?OGZQTTJhOE5tbmVmMUxIeCtSUWNBeTFtNHVIWnROTDJ6bGpaWnc5bk9TRVI5?=
 =?utf-8?B?QzFpYkZRUWJ2c3hnWHZKWHNXNXhMM2hLQU4xZzZUZFA0SmZaZXY2aDhmYSt6?=
 =?utf-8?B?NzM5UnlDL3VBQkdDaWVJeXRvYXlWRnIrWmJBZ1A2eDNJWXdwN0NudVBpTTF6?=
 =?utf-8?B?Z1hvT0VuQUpLMmgwdlUvZ085Yys5MjR2TTYvQ2p0YmdnNThXcVlobkdmL3lI?=
 =?utf-8?B?OUlDUlYrZEtnYitOdDcra2hGSVdCTFJGWXlqelpsQnRqbGgzOEN4RTQ0VWNR?=
 =?utf-8?B?ckRubFBUdzQrbjlWNEwzNHBHR0FOeEUzbVQzMHlLUnlGcDJ6Mmxrbit6c2hv?=
 =?utf-8?B?OExKaHZBWGIyeEtQMGZKTk9YdVhOSzcwMTA0Q2JFMmRKbEFhR1pNQWY1ZW1y?=
 =?utf-8?B?VkJqZWwwUS91S0ZGMGhzMFk1TGVVaW9TeEh3aU9UV3hZQjBxb1hIamdFU1Vs?=
 =?utf-8?B?L3FGamFiRzhTSW1WWExXTmx3ZW5UckZtcmgvcXN5MGxsaHIwUHU1MjEvK3JW?=
 =?utf-8?B?Zm1UaXRkSm9mbGxPMFR1c0E5cWRyV21kYnpBTU1UaERQNkZJZ3lLcHlDSzRO?=
 =?utf-8?B?T1VqV0I3bWZYYkRFQmdJZ3JRYUY3VG9VV1BlY3grbmRBd0plaTBaQzJzS29Q?=
 =?utf-8?B?Zzlra3NMQWhrYnNTcHFueVNzNytrak5TalRLaVE3L0ZCaTBMU3F1MkVveVdB?=
 =?utf-8?B?ZmxlNUJxbzl6L21Ra2ZFdEVBa25vRzYrTUd2cTV6M1dWV0tnMmI3cUduN1RH?=
 =?utf-8?B?a0JkQnU5NHRvUTEyUERpMWljZTJneUNOaHdkaWNDNTR6akExQVZ5eG55K3cx?=
 =?utf-8?B?bWhXZnNFTlNwNFhRcU5NY2NBVnhFck1RUzcwQ1JoSXdmdU9kcCtaMWVRTVdZ?=
 =?utf-8?B?azNSUmE1L3VjQkpKcHNFKyt1MW1MUTlEekJDTFU4TFZ2MGdCQU9HaTl0TU56?=
 =?utf-8?B?dWJnRzc0c2tJd3FKYmx4SGtpbFdvSEZVU0ZWQmZCeFh1L2xaRnBQSVdEN2t4?=
 =?utf-8?B?WUdBYWx1bXhYcU1pY1RvS1I1aTVLRTRTdTZiRTZqQUdGVnNDdFNEcDJldmUr?=
 =?utf-8?B?N1hIR0VwUGp1SXUycnMydDBxWmFSaTVBZ1ZHSmlOb0daSWFjelZuUmFLeThS?=
 =?utf-8?B?elJpWkNGTnl3UFpYVkRaU1ZsdkxsMFBUSksxVXdqcFNrYXZFRnlUTWVIOWZZ?=
 =?utf-8?B?OWZld0d3TVJWbngrRmdmTlZOZVZiTEtYTVFhT1RNZzQxVVhEdjlQUlA2ZWZz?=
 =?utf-8?B?Y3hiTVk5WkFOSE9zckV3cFJ3a0lpOUdHYWxMTHo3aEFVUEhRTFpNY3M5Tjg4?=
 =?utf-8?B?ZUR5U3N1aDU1VzBYWnZBRHNISXZQUkQ2UHVwbzh2SkVYRDUrbTBzcnEvek9v?=
 =?utf-8?B?eXF4VzlRd3R5N2FLREtIbkhoSDhkbkpZVHBabEV1Sk5BWkNxczhuUFE2alVS?=
 =?utf-8?B?NzBGNjdtTTFiK1psaGczRmRzOWE3NGhOd3RDQytacDYrVm1PbXhPRkNGY1Ji?=
 =?utf-8?B?U0JwcnoxVUZ3b2xVRFdHaldoNjNUSVRiSUtCa0ZHbkdjRDU1SGFKdlJiNStq?=
 =?utf-8?B?QkcvRElzaGhPeUhRY2M1REJtaGQ5c0s1NzNaRFhJRDFQd1VJN0lGaldLMTBP?=
 =?utf-8?B?K2FJODk3N2IwVC9GcFZ2TEJZL3poQmJEYWRFdFJ0THNuR2syM0tQdmw5KzVE?=
 =?utf-8?B?VEFlMGdUa3lYYXRYU2tFMVN6dU9sOXAreTVGZFh2WGtEWStvSmEvVUZRenB0?=
 =?utf-8?B?ZVM0b3l3LzErM1UraU5tQUlLbWVkUmlDMi9kSTRrMUJCbWh2R0xhWkVhUUpO?=
 =?utf-8?B?QnRhdCtjTk9sTGFlUnphRTlZUG9ReEtrRDZ3b25GZXBKTFhydTV2YzZuTy9T?=
 =?utf-8?B?a3l0MmEzTGltczYzUUQ4Y0U1NXFpekVDcUJsVHloRG40NjFmM2lzSU0yYUJW?=
 =?utf-8?B?VzA3YzA3SlRwVVNiV1N2Qm9WRjFZYllncFRGQT09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:39:36.0394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c9c3c3-aeba-4e23-7189-08ddc84b44f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11162
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

On 23/06/2025 11:23, Steven Price wrote:
> On 02/06/2025 15:32, Karunika Choo wrote:
>> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
>> Mali-Gx20 onwards, this patch adds support for performing cache
>> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
> 
> NIT: s/GPU_CONTROL/GPU_COMMAND/ (also in the subject and below).
> GPU_CONTROL is the register page.
> 
>> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
>> feature bit.
>>
>> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
>> and Mali-Gx15 GPUs for consistency.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> 
> I'm puzzled by this patch. You're introducing a new feature bit which is
> always enabled on all GPUs at the end of the series. I think this should
> be reworked to either:
> 
> a) Remove the feature bit and change all GPUs to the new GPU_COMMAND
> cache flush mechanism. This should allow a minor code cleanup too.
> 
> b) Only opt-in new GPUs where FLUSH_MEM/FLUSH_PT are unavailable.
> 
> In particular this patch as it stands does two very different things -
> it enables a new feature to be used on the new Gx20-onwards *and*
> changes the existing behaviour on older GPUs (which has the possibility
> of causing regressions).
> 
> A third option is of course to split the patch - add the new feature bit
> but don't enable it in the first, and then the second patch is just
> enabling the feature bit for existing GPUs. That makes reverting in case
> of problems nice and easy. But there's also no point having the feature
> bit if we don't expect any users of the old behaviour - so only do that
> if you have good reason to think we're going to add a GPU using the old
> behaviour.
> 
> Thanks,
> Steve
> 
Hi Steve, 

On further inspection, this seems to be a change purely to align with the
FLUSH_PA_RANGE workflow and should not have any negative effects if the 
Mali-Gx10 and Mali-Gx15 series use the same mechanism.

I have updated this in v5 and enabled it for all supported GPUs for now.
- https://lore.kernel.org/all/20250721111344.1610250-6-karunika.choo@arm.com/

Kind regards,
Karunika
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>>  3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index f5127a4b02dc..5ec9d7f28368 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>>  static struct panthor_hw panthor_hw_devices[] = {
>>  	{
>>  		.arch_major = 10,
>> +		.features = {
>> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
>> +		},
>>  	},
>>  	{
>>  		.arch_major = 11,
>> +		.features = {
>> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
>> +		},
>>  	},
>>  };
>>  
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
>> index 1a3cbc5589fd..2bb372fe9d4d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
>> @@ -16,6 +16,12 @@ struct panthor_device;
>>   * New feature flags will be added with support for newer GPU architectures.
>>   */
>>  enum panthor_hw_feature {
>> +	/**
>> +	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
>> +	 * via GPU_CONTROL.
>> +	 */
>> +	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
>> +
>>  	/** @PANTHOR_HW_FEATURES_END: Must be last. */
>>  	PANTHOR_HW_FEATURES_END
>>  };
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index b39ea6acc6a9..f9ccc8627032 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -29,7 +29,9 @@
>>  
>>  #include "panthor_device.h"
>>  #include "panthor_gem.h"
>> +#include "panthor_gpu.h"
>>  #include "panthor_heap.h"
>> +#include "panthor_hw.h"
>>  #include "panthor_mmu.h"
>>  #include "panthor_regs.h"
>>  #include "panthor_sched.h"
>> @@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>>  }
>>  
>> +static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
>> +				       u32 op)
>> +{
>> +	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
>> +	u32 lsc_flush_op = 0;
>> +	int ret;
>> +
>> +	if (op == AS_COMMAND_FLUSH_MEM)
>> +		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
>> +
>> +	ret = wait_ready(ptdev, as_nr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Explicitly unlock the region as the AS is not unlocked automatically
>> +	 * at the end of the GPU_CONTROL cache flush command, unlike
>> +	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
>> +	 */
>> +	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
>> +
>> +	/* Wait for the unlock command to complete */
>> +	return wait_ready(ptdev, as_nr);
>> +}
>> +
>>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>  				      u64 iova, u64 size, u32 op)
>>  {
>> @@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>  	if (op != AS_COMMAND_UNLOCK)
>>  		lock_region(ptdev, as_nr, iova, size);
>>  
>> +	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
>> +		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
>> +			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
>> +
>>  	/* Run the MMU operation */
>>  	write_cmd(ptdev, as_nr, op);
>>  
> 

