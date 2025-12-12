Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50983CB9343
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A910E8F9;
	Fri, 12 Dec 2025 15:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="iF3yXpQ+";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="BWZCtE9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [67.231.157.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459BF10E8F9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 15:57:09 +0000 (UTC)
Received: from pps.filterd (m0050096.ppops.net [127.0.0.1])
 by m0050096.ppops.net-00190b01. (8.18.1.11/8.18.1.11) with ESMTP id
 5BCFrOr63824188; Fri, 12 Dec 2025 15:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=m3ZoJphMxuaOHpWgD10VQsinXJsuyHhYeZ3g27mPzMw=; b=iF3yXpQ+NE+h
 66YUndBqAmA/8WA0SocbFO7AHEiKAC9rjS7Z1F0U17oZ1gM33LHovMAbDqSp2rWZ
 FfUVlAwI2u5l5Q/WN6FhMUerBnozYNpkKEjSjnBu/GnbvbMRYlCf49AmQ7DkyZkX
 VWPxlv2UaI2LFAIUyUtEBxzbdhC5KFziW5bpUJ4jNkf4f6MfOMLS3Lfhz7lPaRpB
 AWYiMKMhrFyRZ07BqTD4QRIdag+G+Um1fO/HPFSHPYY2ZtMe5D3d+5YsU6JOVGia
 6q5ASk73mz6WnxTGsIzEnXkzM90ndpc3HThw78gzplZQUAWblalmdgBkrVFCBRql
 oF7aQWkg0Q==
Received: from prod-mail-ppoint3
 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be
 forged))
 by m0050096.ppops.net-00190b01. (PPS) with ESMTPS id 4b08wvs595-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Dec 2025 15:56:58 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
 by prod-mail-ppoint3.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BCD5X0p014059; Fri, 12 Dec 2025 10:56:57 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.221])
 by prod-mail-ppoint3.akamai.com (PPS) with ESMTPS id 4aw2933ffm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Dec 2025 10:56:57 -0500
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-dag5mb4.msg.corp.akamai.com (172.27.50.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 07:56:57 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 12 Dec 2025 09:56:57 -0600
Received: from CO1PR07CU001.outbound.protection.outlook.com (72.247.45.132) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 12 Dec 2025 09:56:57 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRVO06XeH8KxqUsTyWy/MkCi7vksk5puxFNo5+RKo6OTHtaSBHIUvOvJeyyaT7OUFYNNcXOX0qI8jY/PJVews42A4S8GEnMFC/75hMboEDMNXFrHQW9VL7uuixq1nyBcXfHsU5P057AjcAim9kPHax/Fc/7NP6eX6eFzI+n9ZjokdOhuv6WUxOSmoJrvOYNQVpdkKuJBl5A4VzG5Pj7pm2Y2xY1fWCEfIBDfjzMQ3HaS5qjvDtMkvZKTGpe8c9xLRhO48mDGizbvBGWJJZ1EbWAmnWPP10R0xRkososfiXFu/XDYY7SFntrHnKlauuFkjBYt7wmXLKI2ZwROhzcmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3ZoJphMxuaOHpWgD10VQsinXJsuyHhYeZ3g27mPzMw=;
 b=AKnl6EmOPT20/vfGfoIQ4LqNaAagANfypsXkkOuWmEA8oVnB35Q61o5TDKBBM9pRrTcZLn3P+6gfuN9uK0N7WQcMQyc29n9jlcHGRGazuSaBO044p2UnUcmJot0m0MX5AVGc+dDO5/o/Ac4foFdp2oo+W0AzpBx0GLSmtjimVyOPWkQGFpqCjdXL9yTeH27uXkjkQKupD638XSJqPz2vFcdYWk7Ujam/feFTrFRI1Ak8f8n8FGr7Ecq2svo+t+UjhvDPQ1S/SsXrDCDkHR/90/xyUTET+mcsPGuD3kzftV4LYgpRIrD4y9nGwuJeh3s+EQ0UuqcbqP098UdlyBaGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3ZoJphMxuaOHpWgD10VQsinXJsuyHhYeZ3g27mPzMw=;
 b=BWZCtE9LCM+L+5MEvP3C7qBnwR8ILHqwcDjtd8US19bgDTk+tyQTwCcCC2101pQdG/dVjls19STZmgYEd4vr37S3rGXNvSATctysvnEnDwm4Vag7XbHdBjaFPP8MfHsyLz7bo7U5925/nbjsgbpQ1ZK/lVlWHk8qN2gcpzrYk0E=
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com (2603:10b6:a03:37b::13)
 by PH0PR17MB7648.namprd17.prod.outlook.com (2603:10b6:510:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 15:56:50 +0000
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36]) by SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:56:49 +0000
Message-ID: <5b3d492c-7037-45a5-a001-0064f14d5f81@akamai.com>
Date: Fri, 12 Dec 2025 10:56:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: <jim.cromie@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <gregkh@linuxfoundation.org>, <ukaszb@chromium.org>,
 <louis.chauvet@bootlin.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
 <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL6PEPF00013E0D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:11) To SJ0PR17MB4870.namprd17.prod.outlook.com
 (2603:10b6:a03:37b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB4870:EE_|PH0PR17MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: b91923c4-2f1b-4ae3-9f87-08de39970fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkwvNmxaYlpOZlhRT3JvVTMwYUh0TDBFcXd1OGZzQmVHTjRTL3I0ejFjaFkz?=
 =?utf-8?B?ekc4bGdUeFBEeTRlbm9zMzZCTEtVa1ozeFJDQmRISGVkV2pRT051eDl5eE1S?=
 =?utf-8?B?cnJCN2szWTFYRjlweEhQRVZOZGFuM0xUSzJxRWNGUVJjbktzK1NwS3V6cDBr?=
 =?utf-8?B?WExCMktiOGNLSmZSR3FuZEhnME1pWXZJWlR0Y1pQK1FQV3ZMOHFvcDlDQ01w?=
 =?utf-8?B?T21uK202WUk1RXRQdzBBU0VueXgyRXJqUnQvRWlpdFpjYkVNSEhmMmozeUh0?=
 =?utf-8?B?OWxiaVBYbk5Salk3algybHhuSityZmkxb2o3QktTb0gxS0hGL0JZRlVTRkJi?=
 =?utf-8?B?eXFTY2EzRmlDYUtIdUdpZUFaVUw5S1lOTm8xS2ZhcVpZbmFtS3JyWEd4bEhC?=
 =?utf-8?B?YUVqM3djR2lHeHROU1EzWVg5Mzg1cS9rbm5wdlIzTGw5bUltVzZOODFnbzRz?=
 =?utf-8?B?S1lHSXVtTUtVYVp1TkVNc3FxWjE3N1R0OS9lbEE2SUtDYWd1QnpZWDNkRFRE?=
 =?utf-8?B?MWZLakdNNi9CZ0ZIVG9LNGN5RkgxOGtLQlNQYmlzbGJtNTRaUFRmcTh2dTdY?=
 =?utf-8?B?Y0JQTTZmOFpxdjNXdW1sL3pueEI0dTJsb210NkdsdWpVd0pnaTg1S3E1SzZw?=
 =?utf-8?B?dFk2bjJUckhkZXJyeGR3QjBaU0N4S3JEK1lad2RQKzR6TFpmM0xVaDE1SC9l?=
 =?utf-8?B?VVlKSklNWDE5bnc2Y0tMVW55bXpOTDlTNms0WGdHVWJ1SlRndjZPYUgzR01p?=
 =?utf-8?B?MDkyV21wSGJPdHNKRElPakJmZkFQOUlxN2FPMkxzVHFyNGcyTmw2YVhNN3l5?=
 =?utf-8?B?a2kzeUpzNkZtODhNYWdReUxrQ0xrWGZVemJ6NzlmcVVNaVlWdnJWQXdWN0xo?=
 =?utf-8?B?NEh4dHhockVkVGRaSGl2VU5QNkUzZSt0WUFzYTVLc0dkQlZIZ25BbnNzTWho?=
 =?utf-8?B?b3h0R0lCQTlKdnlzVGZ1UU5yS3BreXh1Nk1yUDR3SVJzeUxwYnFwU0xCTVFF?=
 =?utf-8?B?L3FxbjRLelR0SEJjMUw1N1M3NTFBQjdBVUJqSzlMT2hWSGxnTGRsVXV1RURi?=
 =?utf-8?B?emRJWDlEcG4xYXJqWDJuenc0UjhGdGxNQjlBZlJPd2FmSzVGTndXT25lT3JS?=
 =?utf-8?B?NThWTGY3bTIrV0FrQzNpTWxaN3ArYjVNVExWdHhmMEhBam54clRFbnE2cUEw?=
 =?utf-8?B?YUVMUnJPK2Z4Ym5ocGVhaEQ5Qy9pYWlML291bXFGZnNzVzNXUUlacEFrMUo4?=
 =?utf-8?B?MWtkWjlrb2EyMTZyV1R5Zy9oNURLclg3RzJNVE81SkJRSmdNL3JYOFVTL1Bw?=
 =?utf-8?B?TzV6MFpvMUVNRzRUcXM0TE1UVnlLd1BWVExOQUZlcEhObEQrekw2eFhtUlFT?=
 =?utf-8?B?UzZuYmo0Vzgwb2RZT3JqUXdwcDU2Y2QweGpHTkxhaEVjeDBNVUk4Y29pZC9n?=
 =?utf-8?B?UDEyRE5tYWZ0bENjdm9ZQjBoZUlLSWgwUTd4MngrY1JNRTltZ0JhU0RMUDI0?=
 =?utf-8?B?cGhRNWpkVythcEw1SERuN3pUbVdVNHNEb21uSDFhZTdrQkZPZHhENEtiUURF?=
 =?utf-8?B?VFJHaXJPMUJ4dnZtR0k4KzVZQnhQcUplL1ozb0FBdks0bldibmtOMmxkRDgx?=
 =?utf-8?B?T0F4ZDJGdUx5Wk9oWE5tTWV6MmFwd0lkWTVDWmFIcm1pVWlZY1dnbXFHaGhD?=
 =?utf-8?B?Mko2ZVdmNnN4ek1sckpYcFIyUUYyaVRIQ2E3NExrdVdDS0pka0RqNlo5UEtX?=
 =?utf-8?B?NVY2Y2hDaDg5dVVyM2NFMllOemN4SWFrVGFOTUZhNmVza004VHkvemJqK1V3?=
 =?utf-8?B?TENKVkREVERHRDgyTDBMazJWOTVpYnNFdURGN2JLVDQ0Q1lQdHIra2gybjlp?=
 =?utf-8?B?N1N6NmhkdnRpaklCKzlrYkRVR21pOS96b2RlSjV4R2lPVGdsUU0wNGlFMlRv?=
 =?utf-8?Q?CThXXAHxRNBrDZOfbqlrYINiqGmF3/qw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4870.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNDdWUvT3MxQlA4emZqTVM3R0pyWUI0YzA3cFBjOFNsUnhvOS95dDUzWlI2?=
 =?utf-8?B?K21vbU01T1BwcWlGbVo5UCszRjhFTmF5YWpjZUExZkJoU0JDQUZ4aFVhRmY5?=
 =?utf-8?B?ZExMVWFHdW9DeWYyT1Npdzg2WjI2TThHOUh6T3grUmM4U29EWDY5OGdjZkFZ?=
 =?utf-8?B?MnhKWi9yeUVmSWpqQmh0Q3hJOUZ5VUFuT0g1Vi9yRE9PaWZJVnNHZVgxQ1dP?=
 =?utf-8?B?RlFyb1NSc1JNcCtoV0tBMVIydXJlWkhxMiswMkJ5TUUwRk4ydmNKOHR5SW1h?=
 =?utf-8?B?NTFxTEdqdzJmQlN0THNNUXZOemFsVnRwcGNRV2ttYnZFb3RkbWY0bEo3cEhm?=
 =?utf-8?B?VzFmQjl4eTRheUFpemc3bnRDWi9JQktIZC84Zkg3bTRXMVNKMW5rZ1BxY3hK?=
 =?utf-8?B?VnB4TWhNcnI1NTYxZ0lDaFk4S2JrTCt3QUk0bXhuVzVQNkFySXNSbFgySXMw?=
 =?utf-8?B?UHFmT1F6dVJ1Z1k0cTc3VjVnNzZRS0dvcFp4eVZMZ0dNaWFESlFwU0d3bHRh?=
 =?utf-8?B?YXM4NTdUc1orbzNTZXRXc2hGdFBqTGV6bGxWSEJKQ0dybkE1dWoxL2Qza0pj?=
 =?utf-8?B?ZlVCYkphRysyZTVUVy9KTkhvVWZQdjhRYjVQS3F0R0ZaSElrTUtwSnIxcWpH?=
 =?utf-8?B?WTF5U1QxS09DWTU3cnBIdk5XeWx6RlNBS1cweWRvcjBUd0c0SDlLeGhqbGp6?=
 =?utf-8?B?TGtJLzNkRXJCYjYvc3B5a2dDSDJmWEltTUE5ZWxWcnR2cmRtcEFJczhjbCtp?=
 =?utf-8?B?RnU4dXNQK2FmUFVMRXNhMDMrVWYrWStzclRnOWhZVUxjTXFDSldJQ3IzLzhm?=
 =?utf-8?B?NWVObjNsQUR4T1ZQcmZNVnhQUVFvZlk4UlFMbjNDcWVPUVNxWXBlTkI2emRi?=
 =?utf-8?B?VzNVL05VZDNDZjJ5UG1SWXBWeE02RVdWemc5U0Q1ZVlqTithdmdYVXpKa0RS?=
 =?utf-8?B?RjZqSjllYm9pWkFxaVEveTBVckV5V0lKR0lOb2ZjclA4MjF3TTJ4cTM5T0hD?=
 =?utf-8?B?TytXTzhKTzhSdXArZXM3UEs4ck9ENUdBZFZrNTNRa3N5RUdiRUlrL2ZNL3NB?=
 =?utf-8?B?N1J3ZXBmb1RlSUlRdUZTR3ZuckE1QXV1Y0wyYVgrTkJQR2I5RFNwb1VjcHQ3?=
 =?utf-8?B?UURPb0d0U1ZsOFZzOGNOSjlucDRqc3djMlNWMFZDVEtuY1pjUUx3MEZreWZN?=
 =?utf-8?B?YjVRbmhyb3lXZTVlcUVwbGR1MXZoYUFwenBMaDFzQzYwblVHMUN4L1MxZmF4?=
 =?utf-8?B?Wkx5NkJFQU9Pc0MvdTBZL1BIeHYwMFNYZTQyQmQyc0tGUlcxVzRwQ3FnbGs5?=
 =?utf-8?B?U21EUk1PZ1MrbzRsYVBxVSszUHJTUGw5aVhDZURoakRkay9JYU4yRlIySUgz?=
 =?utf-8?B?bFZtMG40UndvZlZ2YTZRWkxOS0xTc21lSDgyZ255OUR0Mko4Q2xvVVFsWkxF?=
 =?utf-8?B?anJSMWM5QTNOQ1l4UEV3cWdXZEQ1d1VZOGE5djZaS0xzVVZpZmYxR1lwMXVH?=
 =?utf-8?B?WEE1M1ZSaEsrVU9ub0J2Rk9rYkFDekluVGZVN2FDNWtDd24vKzRWRHZQQkoy?=
 =?utf-8?B?VWFNZys4Y2o2Rlg5WVNWeFpJRkx2dlBVU0hxWHJ0Q0wzNVZPUFU3dUlvSGFG?=
 =?utf-8?B?OUV1QWNpTzBydm5YaFIrTjZuSUU5UlRPUmZ5OUVLNUhjejIya08vS3FBejRO?=
 =?utf-8?B?aW1DeWVRRitXeURzRUN0VXVrN2pCWEJXWHBOWHFPQXRTZzR6SzFuSlZjQ1oy?=
 =?utf-8?B?OC9NN0oyZDFabzVkdW9CK09CaEZuaFI4VVFhQUtaR0JGSUt5cUNjcU8raENn?=
 =?utf-8?B?ck5LdFBNK1RaTzhHZEJjUndGVnhTY2FjVmJkck1jY2VqQWNFVGVsNWZDREox?=
 =?utf-8?B?RklvQjV4WGtCRk5BcmNZczB4TkhhbDlmUC9vd0RFd3JKdTRqUjZ1WHVXb3Br?=
 =?utf-8?B?S0o2QmwzUnM2Y0JsbktHTnBHSWZ2TVlkYXNiUHhYaDdoVzcvNkQvU2N2cjNo?=
 =?utf-8?B?SWRmbG10TEhNTFRKcEsxMWpzcUk3NnBnbGtkalhYSlE1Y09BSjQzMlpHcGNY?=
 =?utf-8?B?by80OFdIdVRHOENSYjluZ0J0bG82MkdaSVl1OFF0QW4zbmFXTzFBdDlwclR6?=
 =?utf-8?Q?7pI/nBvyeRSBjz+WJBPRQA/OQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b91923c4-2f1b-4ae3-9f87-08de39970fa0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4870.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:56:49.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi2wh4DKSWplgtN6iA7jIRO+y0FEN1F17zmVydYPjA3NQ8D1HeZblOLpfjWFdyGqX9kwmZmNPlC4B3WqOjB5yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB7648
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512120125
X-Authority-Analysis: v=2.4 cv=IZmKmGqa c=1 sm=1 tr=0 ts=693c3b4a cx=c_pps
 a=x6EWYSa6xQJ7sIVSrxzgOQ==:117 a=x6EWYSa6xQJ7sIVSrxzgOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=X7Ea-ya5AAAA:8 a=WYuLp17DyE_1gPJBkcUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: e9NksYsHY_5eJeB2QsSgrthM4lyYozzQ
X-Proofpoint-GUID: e9NksYsHY_5eJeB2QsSgrthM4lyYozzQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDEyNiBTYWx0ZWRfXz6PQLwVLl5ie
 yFlizEHekyTN79xnDUwzWl0HXpzQpyO0zpKFeJ732+lPiWi541jFFMW4D02XrFfYR+T3ZjfF4ey
 maEEermi34TcyBzwWiq0gqL/KZhLcO0S74M7QjpKyzzyOInYRXj37Ira+bj2+fI40nqkbMHZ+TP
 mn3WBA5LIoXwrmjWVy6XPsydO9vVZgy56Kr4076LskjyqYhDZs4OUlD8TYxkCYDTJ86s1yfmfh+
 S40LEGsGNOqZksVJWAH6fdYzzhxJvvA7dp3NtVupFtJ8mzMieCGZYLmYZKO1IJI7CZZW/WCtQmV
 LSs3TzC9VCkhBzelfnUEJxTDs2DJ17l1Nf2hPYI8+xTU2Cj2zAFopHY2fmM6/X4DUv55JUaBgcg
 wCKJsFJ5IBM1m25S/wm90JEqu1eSB/8Ql/J4kCaVcYYGgKL50hKzpiKKVSXPD0SYKeODnYzIsrT
 1SDlBJ9dcXtFFIUg5Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_04,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512100000 definitions=main-2512120126
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



On 12/10/25 4:12 PM, jim.cromie@gmail.com wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> On Thu, Dec 11, 2025 at 8:09 AM Jason Baron <jbaron@akamai.com> wrote:
>>
>>
>>
>> On 11/18/25 3:18 PM, Jim Cromie wrote:
>>> !-------------------------------------------------------------------|
>>>     This Message Is From an External Sender
>>>     This message came from outside your organization.
>>> |-------------------------------------------------------------------!
>>>
>>> hello all,
>>>
>>> commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
>>>
>>> added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
>>> debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
>>> mapped its bits to classes named "DRM_UT_*", and effected the callsite
>>> enablements only on updates to the sys-node (and underlying >control).
>>>
>>> Sadly, it hit a CI failure, resulting in:
>>> commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
>>>
>>> The regression was that drivers, when modprobed, did not get the
>>> drm.debug=0xff turn-on action, because that had already been done for
>>> drm.ko itself.
>>>
>>> The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
>>> in both drm.ko (ie core) and all drivers.ko meant that they couldn't
>>> fundamentally distinguish their respective roles.  They each
>>> "re-defined" the classmap separately, breaking K&R-101.
>>>
>>> My ad-hoc test scripting helped to hide the error from me, by 1st
>>> testing various combos of boot-time module.dyndbg=... and
>>> drm.debug=... configurations, and then inadvertently relying upon
>>> those initializations.
>>>
>>> This series addresses both failings:
>>>
>>> It replaces DECLARE_DYNDBG_CLASSMAP with
>>>
>>> - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
>>>     `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
>>>     the classmap so USE can use it.
>>>
>>> - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
>>>     create a linkage to the classmap defined elsewhere (ie drm.ko).
>>>     These users can then find their "parent" and apply its settings.
>>>
>>> It adds a selftest script, and a 2nd "sub-module" to recapitulate
>>> DRM's multi-module "subsystem" use-case, including the specific
>>> failure scenario.
>>>
>>> It also adds minor parsing enhancements, allowing easier construction
>>> of multi-part debug configurations.  These enhancements are used to
>>> test classmaps in particular, but are not otherwize required.
>>>
>>> Thank you for your review.
>>>
>>> P.S. Id also like to "tease" some other work:
>>>
>>> 1. patchset to send pr_debugs to tracefs on +T flag
>>>
>>>      allows 63 "private" tracebufs, 1 "common" one (at 0)
>>>      "drm.debug_2trace=0x1ff" is possible
>>>      from Lukas Bartoski
>>>
>>> 2. patchset to save 40% of DATA_DATA footprint
>>>
>>>      move (modname,filename,function) to struct _ddebug_site
>>>      save their descriptor intervals to 3 maple-trees
>>>      3 accessors fetch on descriptor, from trees
>>>      move __dyndbg_sites __section to INIT_DATA
>>>
>>> 3. patchset to cache dynamic-prefixes
>>>      should hide 2.s cost increase.
>>>
>>>
>>
>> Hi Jim,
>>
>> I just wanted to confirm my understanding that the class names here are
>> 'global'. That is if say two different modules both used say the name
>> "core" in their DYNAMIC_DEBUG_CLASSMAP_DEFINE() name array, then if the
>> user did: echo "class core +p > control", then that would enable all the
>> sites that had the class name "core" in both modules. One could add the
>> "module" modifier to the request if needed.
>>
>> One could prepend the module name to the class names to make them unique
>> but it's not much different from adding a separate 'module blah' in the
>> request. So probably fine as is, but maybe worth calling out in the docs
>> a bit?
>>
> 
> Yes. that is correct. class CORE is global.
> If 2 different DEFINE()s give that classname,
> the defining modules will both respond to `class CORE +p > control`
> but they will get independent int values (which could be the same, but
> dont have to be)
> 
> DRM is our case in point.
> I reused DRM_UT_CORE...
> because I didnt have a good reason to change it
> that said, Daniel Vetter noted that the _UT_ part doesnt have a real reason.
> So theres some space for a discussion, when I resend that patchset.
> 
> `module drm class DRM_UT_CORE +p > control`
> will narrow the query and avoid all the drivers/helpers,
> which could be what someone wants.
> class DRM_UT_CORE would select drivers and helpers too,
> so the DRM_UT_  disambiguation is appropriate.
> 
> I'll reread the docs to see if theres a bit more I can add to further
> explain this.
> Do you have any suggestions for wording to achieve this ?
> 


Ok, so sounds like DRM_ prefix is already adding some scoping vs. just 
the simple 'CORE' name. So maybe just something like:

Note that class names exist in a 'global' namespace. Thus, if two 
different modules share a common class name such as 'core' both modules 
will have sites enabled via: echo 'class core +p > control'. Thus, you 
may wish to scope any new class names to a specific use-case or module. 
For example, drm uses the 'DRM_' prefix, as in 'DRM_CORE'.

Thanks,

-Jason
