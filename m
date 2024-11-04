Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD99BB50E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1235510E436;
	Mon,  4 Nov 2024 12:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="JrJHFmZa";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JrJHFmZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BF10E220
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 12:50:14 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IQ2FU37zzkZiTa08JV+HbEFDm5q7gSjidRoHjcSeF2WqWmtTd3tedQBTGjVzLpmuNmxU+dKU8plQBwJ2aWeGsyy8fIRcxGeQbhUKfa8yHOTGVxCAw+Fy84USZAw7hqmjOZMmwYuottlrTOsSdcGYB9j9ZLITrgky3FyFEjRC2c9GUylYiAt/F/BujLx7UaSyg+dj84hYKkt86PQYlIQZW50vRaY3emfcgwEPrfP1Y5utbnBq64JqibYI+aR/Lh52FucFfafbzKVWRIp+/EHJu2iY0fcprul8xyd56HV+H61hftBHs+DFzKPFPrr0yPhuU4v4buyvTP+xWkCrk1sYYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJtQ4a/fhFnIGFitpfwjh8KCC402KZ5o94TTtAY7Xz8=;
 b=s1AspHWLKFHMqSRAYBdHyqeJQZnJsMUcWcOyaOjLqNK0ZTLfLkvBr1BO2lthZPrdpcfocTiH8vY2Jnt/9w1G8HUaOz6oA39Aay3dYT44s3Mqc4rTYCaPusa8QoX9HIBk4mb5Pdawe9HYaSZZKsm/0v13r5Kqy0PvIhuoi1aqnUQtx4JxIZEQyiQCsbNAlZ9RYXO++KS7A8U9f8z5p4Jm2lOuP7LCzqGSKz7QON4CoOLsDzAUyC8S6sXrBXh5zl0vAWP+RSMXEytwk8CQavf20hHRAhlT8aWT28B5zwL1Ky8MSAKc6SSW81hXbgjf41PFPw2etm0V+S89upSJDtXQUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJtQ4a/fhFnIGFitpfwjh8KCC402KZ5o94TTtAY7Xz8=;
 b=JrJHFmZaoEo80RlAVQ8vc94J/TOI+TAs5xMzKhCVOYIC5ZPMBbYE+YP8KJr3t9XWL820WSoVNiYFQM5u8vCO2J7G2tAyiXd/6YcuGBReC3jzgbfMgbyJlD2lZ5qsMeHY7HLr5/5Jyraj3qzWLlZsKDH4ARhqCkmYZ25yrp7DGgw=
Received: from AM8P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::31)
 by PAXPR08MB7648.eurprd08.prod.outlook.com (2603:10a6:102:243::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 12:50:10 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::a5) by AM8P190CA0026.outlook.office365.com
 (2603:10a6:20b:219::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 12:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Mon, 4 Nov 2024 12:50:10 +0000
Received: ("Tessian outbound 8223600b7a9c:v490");
 Mon, 04 Nov 2024 12:50:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3a3d43fcb79a414
X-TessianGatewayMetadata: 9GuFh0BAwVm/vAF63LwdUdneOMt3ejPT8cjmY9bI36aL/7gF9BOhaDiES54z2CkDocjMWNFILOFMz2i2AgkdzVYHcEDIWAsfgcBzSkOVJ+yrrGVbTvJEej//mendH+y6fApo9YEBwAj+769x1LGbV8W0liLC3+KvRo6lslFCvNg=
X-CR-MTA-TID: 64aa7808
Received: from L5acb42ce4646.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 303A742A-F4A3-4711-92FF-C81D73F65439.1; 
 Mon, 04 Nov 2024 12:50:03 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5acb42ce4646.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Nov 2024 12:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIuvfnKYqNuyzF+1ZLT570rrhTiaQ4OIc+2eP1JdAe8CNo9PPnCN7l5G5R2ebQjvYLnyZyhR3mVXJmMPvKL8BO8+A8ugm6kBW4cPe3xhOGxEbz01LUZSlRVtQoyg/6Oi9n9yQERcMIVJL4qH5rfTvKzIoE0w1hhJs9cGcByTL6XF7Mg9dFnEiJHFzH2VY3l5hrWIrOG1gCmlUmB0mwowiMTCmxHPYV8u8klTxmUeCxlU90/gzVQ+IPRTLZ+yjGyghzsxj7gGN3CQtefaz/DE1Ahzbh9FmG88VjxLgjlMaXZf8j8tVav4rhnymA8fpje4nVJ8PNC2pRRa5eooJPTvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJtQ4a/fhFnIGFitpfwjh8KCC402KZ5o94TTtAY7Xz8=;
 b=ppvbA8GmMeVfj0ZIwmDWDqxXeIG4+6ny8e6exERK89I0+aeVodSyRPDbe+uWfHFWXGFJGEymugwTKFPiKUD2oeoMZWIAkQtLA28RT+vl/gcUDJXlg7V+ANpKVhSAs9frL7Bx5UWphFbWPccciB1ZwNZjpIzFlqbC3hKFKcG58vkpQWsWYjiVuptptBsetkgM7e+rEllbSXDJU8oeQFl8xAbdLHWC/AUS9EKqMz36KGvN/y/N00oThCvd43PxBrvkxRUAZtMEqXucnPaRwowthjhKLZZYwfjIZseo6mHi63h0Qu6BViXvmL2QnY7/jJc42ZsWfhn4MJkmGAA/9rBW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJtQ4a/fhFnIGFitpfwjh8KCC402KZ5o94TTtAY7Xz8=;
 b=JrJHFmZaoEo80RlAVQ8vc94J/TOI+TAs5xMzKhCVOYIC5ZPMBbYE+YP8KJr3t9XWL820WSoVNiYFQM5u8vCO2J7G2tAyiXd/6YcuGBReC3jzgbfMgbyJlD2lZ5qsMeHY7HLr5/5Jyraj3qzWLlZsKDH4ARhqCkmYZ25yrp7DGgw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB9PR08MB9803.eurprd08.prod.outlook.com (2603:10a6:10:460::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 12:49:59 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:49:58 +0000
Message-ID: <ca33d9b9-683d-4c09-951a-1bc48287bdde@arm.com>
Date: Mon, 4 Nov 2024 12:49:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Prevent potential overwrite of buffer
 objects
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-4-akash.goel@arm.com>
 <20241024173935.6430159e@collabora.com>
 <40c9a0a3-81e4-4ecc-b9a0-d55523f5f594@arm.com>
 <20241104121646.687cae93@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20241104121646.687cae93@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::28) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB9PR08MB9803:EE_|AM4PEPF00027A64:EE_|PAXPR08MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8abd52-16f3-416d-9073-08dcfccf37af
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WTlSdXJ1Y29ESEw5dG1tVUwrN3Q3M2ZWMmt1cGkrNmVYcTR1SW5Mb3BERDhm?=
 =?utf-8?B?RnZyVm5FQkZRK0R5QTNCMTU2NlJjMStid1E0YzZJeDBxZ0dzUDVtRWFUN1dK?=
 =?utf-8?B?QlNXVDN4VmY3OWVpRVlBUXVleUtiZGJzNTgxMEZMeG03UkdlZHMzdk9mWll2?=
 =?utf-8?B?V3hOQTZ6TU5PWFQ1TjRnbGgyNUdUTVBCQnV4OHdreTJDTm42Zllka0hIZkJy?=
 =?utf-8?B?ZERnLy9peUNYdGRuRXVJeXZ6elVUWHFEZTBxNk5EMWU5MWxRQ2Y3OENuRW4y?=
 =?utf-8?B?S3RuTGErRkt6dDFnOFdXSXlpYU5BSUNIbG9MYU4vYzd3SGRpejJJRVRzVkw0?=
 =?utf-8?B?VFdZSTREcDlzNmVGNFhlektsTHRRaCtpZFJuQWJ4RWNDUXVxT1FrOGdLcEI4?=
 =?utf-8?B?bmtmN1o4d1lpYjVidE0vNzU3a1UvQlBVcCs1SE9OMlNRUkVIV1FJWkZBdVVO?=
 =?utf-8?B?WFJXdVpNbXQyNGFiand3NkN5WE9NaElEbkt4ZEY3bDlENzVTQ1N5bUpIMHRR?=
 =?utf-8?B?RnQ2bHpvSjQwMkJOU3paVkphU2pQNktReXlRZXc0S1FDWnhlUFVFbFFkSGd2?=
 =?utf-8?B?bVJtSkZRcStEaHNmSWJYYXhXUnV0d1ZvTmxGZFZxTEhMNFlINlUxZjZPckdE?=
 =?utf-8?B?WTYzaHI0RGU0VmtiSVVQV2IvaWlaWGFqR0VqMllqMkVycDE1aDRTTTB6NFVW?=
 =?utf-8?B?aHByRnZtVmxGRC9NTmpBVGZ3OWdza0FYN3I4eDhiL05LenI4SUJnbWEwdUc2?=
 =?utf-8?B?ZTlIMGtBanREVDU0OXJmZEZFdUZTMjlyOHRhK2hIdXVjRStqQ2x0V1FYazRG?=
 =?utf-8?B?aldoU1BxVFdDbzFrSjVjUUlSRzVLKzNRUEEvcnh6d0xNWFB0V29LbndqVU4r?=
 =?utf-8?B?NzNvU3h0blpzRjNuVEgvVVFnbStVek1pVmZKbCttenBCM3FBODk3VHJLbDlv?=
 =?utf-8?B?L0ZtYTRLMktQR2t3TjJ0MWpPczA2aytuamx0TnI5elg5aE9Bc0lraXRFK255?=
 =?utf-8?B?NW9pa2RFRFltQ280SG02UzdhNnVaS0tBd29BbnRyVkp3M1BBaDdqVHV0U3dT?=
 =?utf-8?B?YUQwYUFFakxSb25rRWVxWE1wck5PeEh3amlvL1BTaitrRXpEUU9xVjA5dERt?=
 =?utf-8?B?dlVObFZCM0xMWWhtNHdMcXhremhrQkx2V0JOWHNiUkxvT3lsWUt5NkVtRmsw?=
 =?utf-8?B?bHkxdC9Pa0ltQzYrLzFJWkJmMWljdExQVG1CVFlEVUdPT2NCRGlYa280UEVw?=
 =?utf-8?B?MjgzTjlXMTYzKzBaSjFlQnNsVlBVS0ttOXUrdVFZL1M5NkRsOTNkK2RoMjVx?=
 =?utf-8?B?ZmlNbTZ2RFh3VHFxeCtUR3JobVRFM2hZSFpKTnQ4TkFtTXJMMW90V1dHYUJE?=
 =?utf-8?B?Yk80OHBhNmN2bWRrOWVEb2ZxMlozczdXcWRoNmlWT1RpQkV3emtMbU1JV1lw?=
 =?utf-8?B?TDluekYxS01ONk1ySGs1Y28xb210dEtrbzZlcVU1WWoyOFlTc3FsWVIyZS9M?=
 =?utf-8?B?VVMyVkF1ZXRydW1DcU41NHZBanBDU21CNmxoTWJNRkF1REJERzNOS2pqQmJ0?=
 =?utf-8?B?bWkwc3Z2T3QwQXk5bFg1Mnh5NzFjQjdVc0l3OS9YWGNGWmxFNlVoZHlsd1RO?=
 =?utf-8?B?MzkweVI4Y1h6Z2JHVWxCSmpDZzFEMzNTNENhNVd1MzBGMmRHcUlKazhNbU8z?=
 =?utf-8?B?UDBEL0JNYm0xb3FiY0QwSXduQUNEVmE5N0ZQU2ozcnFkVXdVWTR2RFpBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9803
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 97b39584-670b-40de-80d6-08dcfccf309c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c09iUERKWmN6NEdsNzIySzFFS255bE1ZTGZTRElwV0hIK2tEaTJuZUo4RmRw?=
 =?utf-8?B?ZVBqVjI4VXFsN3daYUpQTERLV0t4ZUMwOU9IVDI0akYrZWlJR29QUnRUU1lF?=
 =?utf-8?B?UHYxSFBvRXUzOVcyNlNVY0FFTlBEWXF2UkdrRTR6aWxQcUtxamdZYXRmVndh?=
 =?utf-8?B?Y1pDbEhOY1hUUTNuTFJHYm4xekFqMzVzRjhHTjVsZTRJY29tUldoejVwY0xk?=
 =?utf-8?B?Zjg0WERybVRuQWo2T1VtOVcxWW5VazFUbTNvSlo1d1MwdDZrZ3B5TVdjTFg0?=
 =?utf-8?B?NTRjK1pSUjVPelVXTzZqQTdmQWdWbFFYNDRSQXBvZGpuNmdCU3EwdzYrdW9L?=
 =?utf-8?B?T2k0Ukx5WmEvalZyNWlyNDEwRUpRemtHMHpVMitiWUU0cTRJcDh6bFdvZko5?=
 =?utf-8?B?akx3M0Q2UjA2Y0wyUVJHK3Zoc2RDbTA1OFcvck1oZjhkQ1dpNFdqN1phWklp?=
 =?utf-8?B?cUE5TUQ3OXBxR2N3VlRTbzg5Tkh5cElrOWVvY083TGJWYnNnWElVYndxZkxF?=
 =?utf-8?B?TkJmTk0vYWMzSVlSK3pTNisyS0ZQcXlpRkRFanNuR2dXQlh1OE9wSm90VGxV?=
 =?utf-8?B?cVJMb2lQbjJOcEdBRFRUWUQwbHU1cEtwMWVHWC9nZ1J5ZFA1dEJKTzJaRlhs?=
 =?utf-8?B?TkQ5YklYbDI1OHdNYnpIbkpBdS9CVFRnTkZ3WkZwbWIrWkx0ZU1lUzl6ODRp?=
 =?utf-8?B?QXNlNFR2Zk55WS9OOHdXdVVUREtoeEVWL2Fma1ZQVWkyUFRDNEs0UG1GdWky?=
 =?utf-8?B?R1BoVmdCNkJEbDVUcysxcm5CeS9HUDMrQlVLSU1Qb3NacE4zZFM4T2FFNHdS?=
 =?utf-8?B?NXROOXNKRWtJTnBMV094WW1tcFRkMHBBT01UdURiakt6MzJLbXNUNnlkT1pK?=
 =?utf-8?B?V3RrMmxHTmQyUnFFM0UvZ1JIemZuajU1SXZUSk50azJPMm9VWi9oVTJJbGJK?=
 =?utf-8?B?VVloVUJUVkc0WEVQVUkzRldsUHFqcEZRdUw4YzlyUyt2K3VocENleE1jNE9V?=
 =?utf-8?B?aVRPajBLRjZWaklEWlFESWNvOEhEeDZVenpGbERMS3RtUEtBZ3V0SzhKSW5Q?=
 =?utf-8?B?akFIZFNobEUzaDZBL2JjV1BHZWhwZzBuUDNSTDRTQjI5bktLZmNrSnpTOGV2?=
 =?utf-8?B?RDVCTmVGLzJDdGMrM2lMNElLaU9CdTNSUk81bEtJdFcvbXFDRkovYitsTFBh?=
 =?utf-8?B?amhtZnhzdUtLMHpUTkNFWnRkSzVDKzhCdis3R2FSKzVjOXRweUZ1SlJMSldU?=
 =?utf-8?B?QVFkZy9vVCt5ZGRLU3k4NmtmRzNnbjV4Y3RWUE0velZIcDFXRjh2SEJ5UE83?=
 =?utf-8?B?ekNtakJjUWVTQWF4enZvRjVEOGFXMEx1d0NlcWlaQzF1MmRkYy95TzdNQ1Jn?=
 =?utf-8?B?MEVpTzBxb2o5ZEpFNnhuWkk5SVd5UjZQd0J5RFl0REdmNkY3T29NWURrc2l3?=
 =?utf-8?B?bEg1OVFIcmpIZm03L01KNDJzL3J6dXRlbTdsRHlhY0JWbHhmNGwxK2c4aFJr?=
 =?utf-8?B?NjlBUlhzaEh1WGYyWi9PK0NVU0tWL1BGMmVRMW44OEMyVHQ1Qm8zcW9LUEhB?=
 =?utf-8?B?UlNiN2VSaDR6c0hIWTdUZHFVL085M0piWE4yQWw1bU55b0I0aER0VEJQRmEx?=
 =?utf-8?B?VFpVMmdCcjg3MnhHQTV0c1h0bEtOWnNwVHZvUTl5a2NzOTdhZENFQm9lSWNV?=
 =?utf-8?B?NjVtbDVmMm5LK25pMDdkVkVGbEdJNFBscmM4Rndpekx2M1lEYjlIcmZibnV1?=
 =?utf-8?B?enhYSElKUjVSVkV5Nm13dlZockkydDVMWUFJa25MaWZqUlF0djdra1Z0MEJw?=
 =?utf-8?Q?e+R+GAJnvKAr9BahGhdeymPVFL6rSfSDXd57g=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:50:10.1825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8abd52-16f3-416d-9073-08dcfccf37af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7648
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



On 11/4/24 11:16, Boris Brezillon wrote:
> Hi Akash,
> 
> On Thu, 31 Oct 2024 21:42:27 +0000
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> I assume you also reckon that there is a potential problem here for arm64.
> 
> It impacts any system that's not IO-coherent I would say, and this
> comment seems to prove this is a known issue [3].
> 

Thanks for confirming.

Actually I had tried to check with Daniel Vetter about [3], as it was 
not clear to me that how that code exactly helped in x86 case.
As far as I understand, [3] updates the attribute of direct kernel 
mapping of the shmem pages to WC, so as to be consistent with the 
Userspace mapping of the pages or their vmapping inside the kernel.
But didn't get how that alignment actually helped in cleaning the dirty 
cache lines.

>>
>> Fully agree with your suggestion that the handling needs to be at the
>> drm_gem_shmem level. I was not sure if we really need to do anything, as
>> I didn't observe any overwrite issue during the testing. So thought
>> better to limit the change to Panthor and get some feedback.
> 
> Actually, I wonder if PowerVR isn't papering over the same issue with
> [1], so it looks like at least two drivers would benefit from a fix at
> the drm_gem_shmem level.
> 

Thanks for giving the reference of PowerVR code.
It is unconditionally calling dma_sync_sgtable after acquiring the 
pages, so could be papering over the issue as you suspected.

>>
>> shmem calls 'flush_dcache_folio()' after clearing the pages but that
>> just clears the 'PG_dcache_clean' bit and CPU cache is not cleaned
>> immediately.
>>
>> I realize that this patch is not foolproof, as Userspace can try to
>> populate the BO from CPU side before mapping it on the GPU side.
>>
>> Not sure if we also need to consider the case when shmem pages are
>> swapped out. Don't know if there could be a similar situation of dirty
>> cachelines after the swap in.
> 
> I think we do. We basically need to flush CPU caches any time
> pages are [re]allocated, because the shmem layer will either zero-out
> (first allocation) or populate (swap-in) in that path, and in both
> cases, it involves a CPU copy to a cached mapping.
> 

Thanks for confirming.

I think we may have to do cache flush page by page.
Not all pages might get swapped out and the initial allocation of all 
pages may not happen at the same time.
Please correct me if my understanding is wrong.


>>
>> Also not sure if dma_sync_sgtable_for_device() can be called from
>> drm_gem_shmem_get_pages() as the sg_table won't be available at that point.
> 
> Okay, that's indeed an issue. Maybe we should tie the sgt allocation to
> the pages allocation, as I can't think of a case where we would
> allocate pages without needing the sg table that goes with it. And if
> there are driver that want the sgt to be lazily allocated, we can
> always add a drm_gem_shmem_object::lazy_sgt_alloc flag.
> 

Many thanks for the suggestion.

Will try to see how we can progress this work.

Best regards
Akash


> Regards,
> 
> Boris
> 
> [1]https://elixir.bootlin.com/linux/v6.11.6/source/drivers/gpu/drm/imagination/pvr_gem.c#L363
> [2]https://elixir.bootlin.com/linux/v6.11.6/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L177
> [3]https://elixir.bootlin.com/linux/v6.11.6/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L185
