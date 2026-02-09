Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOXoG3IbimmtHAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:37:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368E1131C3
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8573910E442;
	Mon,  9 Feb 2026 17:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tF0kDTDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261510E43D;
 Mon,  9 Feb 2026 17:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB/OVJT1Dh51woqGlO4YBYbQeHVvVbLbETzmlhG7AeFwAWDo34fH6/ytoAt47zt2/EVmNFh6/Y2TiZrk+WXgsjCDIngoGh3U+lPdpKd1tIJ2YAgYyAtsWUEusT3UyLL5itC6znwVNj28eFNQipXhAw7X4ZRd5AczIe7ZgRnD+E8apIH/hgi+1lHDUSg2fpACP5B4gknUkQds3+kqUcHzV7buMSwowgibLoouX9yI+bKBZfbmrOLpZn1qrNWr/2Dga4iEUFyvc3YjE2I4mMLg1KmOwkcZSd4gidirmNcCXESNxrF8Ab6PdjM/znJb5VlYGINBs5I0zHNHq2aZfin/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTWEU3qcO4JOvT5dVLqytyyRZF0nHPeQDX88H0WsjvM=;
 b=lAeE0FKxFtotxUl9SJfdTx5IahbCILS6U/wMJhcY3qD9++pU/ONqaOLqdSNycC51Y41xgPqZg1+7eOp7XoZOzpwm26gswDWAWhPYL3EvoctHtKzTHSjnuxDP7y+OpV4fz3+VnSkeZRvn+DFMKVLVO1ysije4n0Bh6rO3fIlpKCrKZj0iZ+YcN5yW8Hw010Vu9s4nyeL+mKM0ipV8qdKfeOOo5v8b2+vVAsLgsqk7naF19gg0W3MiIN1AHvuTl2mHusapcLDOj9JnH/sVUUmUHE534FWY2ykbw5S9wTo2Dr92BHURI+Pf4mTeH/kIkNYGZAX7K9cCfc47/JiAw209RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTWEU3qcO4JOvT5dVLqytyyRZF0nHPeQDX88H0WsjvM=;
 b=tF0kDTDwG8LSV9u0ObWO5PA3avUHs2N+3MukwuE73ErOhsk/v55ZkKCUuOp5hpa6QRK0nPOrXMe5cREQk4vzZNQNTeWh1fTXxHxT+9dUXn0V9cES8bzPAlg3uxfBq6rAmenezg6KO7CjB0n4x8XqGrtTP1hci8Ew9W5ox0VdVp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 17:37:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:37:41 +0000
Message-ID: <a57d14cc-75c4-42d5-8ee8-be6e2640186b@amd.com>
Date: Mon, 9 Feb 2026 18:37:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: Felix.Kuehling@amd.com, Philip.Yang@amd.com, Ray.Huang@amd.com,
 alexander.deucher@amd.com, dmitry.osipenko@collabora.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
References: <20260206062557.3718801-1-honglei1.huang@amd.com>
 <da75eadd-865e-41fe-a86b-ed9d9aa45e5a@amd.com>
 <8ba8e4f2-89f2-4968-a291-e36e6fc8ab9b@amd.com>
 <f296a928-1ef6-4201-9326-eab43da79a84@amd.com>
 <38264429-a256-4c2f-bcfd-8a021d9603b2@amd.com>
 <451400e6-bbe0-4186-bae6-1bf64181c378@amd.com>
 <0eaf1785-0f84-45e5-b960-c995c1b1cf1e@amd.com>
 <a31082ab-e0f9-45ea-9a8d-cfdef39fc507@amd.com>
 <648e06d1-b854-466f-bf13-0c36ee2c36a1@amd.com>
 <9c7ab1b2-1a78-43d7-b4a7-5bc561158380@amd.com>
 <410040f0-d7eb-4a35-9e4b-54a3517a5cfe@amd.com>
 <bb62077f-38a5-4d1f-9a8d-f63e35ae1f10@amd.com>
 <cffdd191-2fdd-4b5d-abf2-4cf77b96b681@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cffdd191-2fdd-4b5d-abf2-4cf77b96b681@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0306.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dace76-15e2-4c41-9e38-08de6801ec9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|14052099004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vy9lTzlpV2VZdHArSG5sMVFHbzUrdmtDVjI0SmhudnB1QVBFR0RFaHZLM3VG?=
 =?utf-8?B?K2U1SlNUcHhXeDBWWnB4OTU2eDJkeDVqbFpLMjBmTEZqNGFxTjhWaElDZXRX?=
 =?utf-8?B?bTVQc2o0RDVjajIwYU1acU5uUDQrSnBzTWRvcEE3QlJndWs5OFdieUVWUHlC?=
 =?utf-8?B?MzN5ZUc4RjlDaEZ0ZFhUbWx6dWU5OTUxcHlId0RsRkRnYXRzcDVMb2pUT04v?=
 =?utf-8?B?aG1EK0tJR3pBaTZiU0xiNFlWZGlyRndkdjNvZ0dKcEZLNmlRRmJlb0RyNWlX?=
 =?utf-8?B?enQwQ3B1dlI1WVo4RVBqajF0OHVlaDRnQXNzbW9CQ280RkFMYzROcXFTVmhU?=
 =?utf-8?B?c2ZFY2ExWGw3M1hKZjNwd0pKblhJUHhQQjlzUW9DTDFhdDlSUjIycy9iQ2hn?=
 =?utf-8?B?RzhTSHRYM2tKRUo2QUF0ekVreEFrNWhSOHpBYzVFdEZmUWpUQi9TdTMvY3dS?=
 =?utf-8?B?dHJINEJaZ2drOXVzTE5odkRFZXNMTGxsK0VNZVN1K0I2OXBLRVZ1ZzhOMGcr?=
 =?utf-8?B?b2k4bDhzZXpkaFZTY2hmNVphYW5sOWNkT3cydDBFTnBIWTFHdW5hdzZpQjk5?=
 =?utf-8?B?RWFKR0ZJWWgzMkpWbXdjTnZkRGljSWpBT0dzMmc5aWd3R1ZQbnpFVE5Xam9m?=
 =?utf-8?B?eDFWbFEvV2gveWxUZllUaUNRV0NYTW9VbGZ1a0NHWUc4cjJhbmhKN0R6QUFJ?=
 =?utf-8?B?S2NWNkM1RFpERzFDUFluT0FmYnVma1RVNHZYTHVWSHpUN3EyanNBRDhoUnlU?=
 =?utf-8?B?c3hTOHNwNGdsbWkyUVNPUWJpcmE0RkV4dG9kRVBSa0tXWmdxcS9ma2FlUncw?=
 =?utf-8?B?TFlvUnNoajFhUkx2dXVkbVlENWdrTGpNQ2VFU2xJVjQ4eWlVcDRERXFnQnc3?=
 =?utf-8?B?eUtnWHBOYkFFYjlFZU5FczlITkVTV3hobWl5ZkZRNnhvL3FnYWRtaDhicXJR?=
 =?utf-8?B?YVo5aXlkSlc1U080bitUcFBpbVpmMkZKdHRTdUYrZVBWbEZNZ040NWYrUE5r?=
 =?utf-8?B?d1VZbVl4VE9KcU5vNkFWbEhiN0ZQR1dFcTdJWWFsczN3dEVuQklwNkdQZXJV?=
 =?utf-8?B?aGVzTXdCcmV0Z2hmZGZZckVCL1Rqdi81cWg4d2k1V3NpOTFHN0txdGxnangz?=
 =?utf-8?B?aVhFSlJWazJrQTN6TEQwcmpuSGNjcTJ5RENUbGJuT3ZCaXBpTXJmTVkzYXA3?=
 =?utf-8?B?ZzIvaUpWUmN0WTlmK2Mzd2Njem9OUkhGQnQ4bi85anc4UmpxYWpJT2E5Mm9j?=
 =?utf-8?B?N0poSEN4TElZV0FDcFhuT2FXUkRTMWl2emlOMytHZTRocGJsdzJsem1YUlpu?=
 =?utf-8?B?WUlnZmRTL2JsOUNvNHdsRUlEZTRFeWtuZmxNQkIvT2hPSmJRYURwTENDcHFP?=
 =?utf-8?B?WVNIaDRaWjNQVW9ObkRyaXNpaXJOTC9hM0p1THd6akNsWTJDYVJteFBqMnVZ?=
 =?utf-8?B?blFLbFlsNSt2UlRYWlVnSDFFeXE5Y0o3SlYzVWpHeDZkcjdPeU1ibnlVeGhF?=
 =?utf-8?B?amZnZnM1QW8yN24yRi8rY0FPTFpTd3ZTL1BvU251R1ZSVGxrRVBnN2dHSGZC?=
 =?utf-8?B?QktPUGV5MjZScGk3bG9sMGh1WjhUeTRlSFNMaUwyTng5eEgzdk9aMkF4Mmsy?=
 =?utf-8?B?NTBlemw4QVNZWHl1OE1taXl6NU5Dc2txSFB3NXAzZ1JPMTJxcHhSSnBjbnho?=
 =?utf-8?B?bXprbS91aysvRmtZN2VNU0VvdXlxa0dQcmp2U1hiR2lsLzk2elJkVFRLZlVa?=
 =?utf-8?B?MHBXY0N3MERFcFFyVWhlMUNYNFhPSUFQLy8zZUJsR3R6VWJMaERBam0ydjRS?=
 =?utf-8?B?Y3pEN1V4OTc2ZDUrYitWV1AwNWc1czVVaUNoUWxpUksyWDFJa3VYQjhzYW1S?=
 =?utf-8?B?TlpkMElwY1BYbkVGNC9UdXBOUnJoWHVuUGxDeDNKRjZCMHUzRnhtNFBYbVFz?=
 =?utf-8?B?RGNhY25WeUswS0ZyeVNxNHc3eXBaQitNdXlEMW5KWk1oM3d4VndyNmY0ZjZS?=
 =?utf-8?B?MWl2elBEWSsvaFZzNk96L3RQaXFpNnppbUZHSDloQ2dCWUVVMDR1azhJd3F6?=
 =?utf-8?B?TXNQQTBCT1FoaGdUL05jb2tGMGFDNFZySjJyYU5wUVc1ZlZnd0V3aTM5Z2pM?=
 =?utf-8?Q?M6H4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(14052099004); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVI0TVh3OExLRGNFUGJHMjI1V3BENFBwWUZ0alJvNFlDQk1MV05OSVFHMnVp?=
 =?utf-8?B?ejA3YzdxeGlSdUF5VXFUVTNTWlVtSGM5REUwNzZKSWRYTTZiWGVBWW9Pd3hH?=
 =?utf-8?B?eGpWcjBySVdsL1VMMFR3UytwbEE1WEtxT1hhRThHeno0M0dkMXpEeG04UmdJ?=
 =?utf-8?B?aFlVOUNyczgwYktMNzdtakM3WitVNFZkKzd0dlZTUDBqKzF2R3llUkNTWTkx?=
 =?utf-8?B?dFpsTXlrUzVoS0ZjbDF2TnRqZ1hDQzNpSTNOTHdnUlc4akVFcGh4MXgza3Bh?=
 =?utf-8?B?RFI0a3lVMnpyWmtaai9oVEpGNW1IZFdRM2txUEFXQndxTGZWaE9mZDNXMSsy?=
 =?utf-8?B?dzZtdHdxeWpxcm93czJEMDBxOGFTRURKS1c2MWhZcGlROHJvMHlCZlZXSFBt?=
 =?utf-8?B?QTBuZGNnMHB0ckcvRmVSRW9SZjZncU0wdUNsZ09ZRXBiQ0I3dllCeG9pUW1q?=
 =?utf-8?B?dGlHbVRtbm5mMDRCeXZTRHhUdjR1WmRRUjZBR0lhcGhaRzJkcXNUUy9BYmdS?=
 =?utf-8?B?ZzFWTkFjZW0yMXdYMkdBbUNBaGZrYUJwOE5CY1BiWnZsc2lFRmc0Q1hpUUUy?=
 =?utf-8?B?Y2taZVFyMHFHN0hrTnMyaXYzZkJqSGJMS3FwREtNNlFyd1oydzI1dHJpaW5P?=
 =?utf-8?B?QlBnMHg0SkNjSngxVG5vVmY5SE1yZFRQUFNtMEJUeThqcmVOZzBpYytkOGVM?=
 =?utf-8?B?N0RkK0FwSG9xTDZ4cHo0TmVNckpTYmVjK2ZzYk9LTndyQ1E4SHh0aEUwbTdj?=
 =?utf-8?B?YU1iQTA2NFJXUXY1RFlLSitXNUdlVlRZSlpHbXliQlhhUmlyLzZBbzFVUjJP?=
 =?utf-8?B?ZzhDSU54MXpoM1RnM21jVFNOQlRtUERKbTVtS210U0t6UnYwSVJXNUZuNml3?=
 =?utf-8?B?RnprVk1iUEpCZXVTaUtCYVBVa2dxTHpJb2tCNkNoWVNOQzNEOXBjWXc0cGE0?=
 =?utf-8?B?WXJ6VU5GRC9tdGwzREdlK25RVXRGTExuU3ZUUnpTTXpEY1BxR2paS0VEbHRD?=
 =?utf-8?B?R3Jkb25yS2N1bUJZYnZUbERRYWVHbFlJV2JUTnZiOGZNYW10Q0RDMTRRTldY?=
 =?utf-8?B?YnJ4c3dUVmtrODdXM2hvb0swUDNtUmppMkVOemZyUEcvbFB6V2hVNUxmTk1k?=
 =?utf-8?B?WnFNb0JzRThKaVRSTnhOSlI0SytCYVlVUFkxckNOYVJwMW1HQStXdUhqLzQ5?=
 =?utf-8?B?NC9mU25LS3drdTM2WHduQThBejNpekdlM2V0bHBOaUNZR2JFM1duVUZZWDR1?=
 =?utf-8?B?MkNEcHd6eXY5YmVsWVludlhQZkJQcTJFZnl4Z3VsYzAvb0JQcDdMWWlZckMr?=
 =?utf-8?B?Q3ZYeDk5Q1RHWlVLVStyb2lub205UXJXbjNneTJVVXFJV3I3emZUbFhaZC9O?=
 =?utf-8?B?cm5hTGxLbXBzdmJ5ZWFPK1Y2L1NBZXo1cWhBMXB1aHlCZE1uK3d3Y0pUYXR3?=
 =?utf-8?B?N3dwV3NFYWdaWUFrZnJORVlmOEhRLzhNcmw1V1ZsOXY5SGdUWEJSN2tiQ3o4?=
 =?utf-8?B?NzJnM2ZLN0dNa0l2UlJueWR5MEVrbHExcDlZaHdNdFZWanJVK3dVandqV1Zq?=
 =?utf-8?B?WC9kMEtHR3pIc0cxN1BvS0s4TWIwODBKVHYyT0ZHbjRUckdnWVUzck9qNk9K?=
 =?utf-8?B?TEdmcXUySWhrRm1VVFMwaG85R3hQREliMzREL1EyZ1R0UjRMenNpQ0xMWUNo?=
 =?utf-8?B?MHRGUlU4NXpyQkIzV0FXanFBSTY3dk5Oa2ViYlpLSmVJWndYWVhCcVN6ckFz?=
 =?utf-8?B?Y2o1VnM4TG1EVTVCWS9rNmpnVHhYOTk5K3RwUHhaR0tsSWQyd0RxZTJQbUdv?=
 =?utf-8?B?cUhBeXFqTHpmY1RHOHdTc1lKSGZscGkvU2NLNDhZb0owSHZNNmNrU3Awelhy?=
 =?utf-8?B?OE9jckJmVldoOVlGakZsc2Qyd0VtSkpoNlJqMkxxUVBESmdkZS9icFVaYjVG?=
 =?utf-8?B?b3VVZ2hYSm9ZdVJ6ZWtLekdiaE41T1BiYWR1OUFnK2s3TnQrN1BBQ3NzcFY0?=
 =?utf-8?B?NlpsV284eHhjVUY4RnVEcFlDSkdDNDMzdnNMNzZvUFBYbzI1VmpFM2NGaTBs?=
 =?utf-8?B?VUwvUDRvaDJhTm9GNWsxL0dnTjN5QmVZYzRFNnlabzd1K0p2Q3BRU2lvU0I3?=
 =?utf-8?B?cjRrOWYwQnJoeHhsUWZ5OFo2R3lOZjNKaGlHMWxTUkk5TlpvSHk4MDVwQXFK?=
 =?utf-8?B?VytMZW1yOENkeGhjZGFxcFRENWovVTNYYVNNdjZNbDNSQnNheXZpU0pXMlpD?=
 =?utf-8?B?WGg4YmFBUnVwMWhQdk5ENGpNNnpyWU9veFhUL0ZWdG8wVkM3RnBHN2JmVGZ6?=
 =?utf-8?Q?W5UiRQcAcGG0k5vALn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dace76-15e2-4c41-9e38-08de6801ec9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:37:40.9822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH+WANBrXOQdJH7YZ/v6iWzLF5jtKkkmeRXai4lsldiO/PDp5zzhWHbaOnEFuHiV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kvack.org,linux-foundation.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 0368E1131C3
X-Rspamd-Action: no action

On 2/9/26 16:46, Honglei Huang wrote:
> Agreed with you that with many ranges, the probability of
> cross-invalidation during sequential hmm_range_fault() calls
> increases, and in a extreme scenario this could lead to excessive
> retries. I had been focused on proving correctness and missed the
> scalability.
> 
> I propose the further plan:
> 
> Will add a retry limit similar to what DRM GPU SVM does with
> DRM_GPUSVM_MAX_RETRIES. This bounds the worst case.
> This maybe ok to make the current batch userptr usable.

Rather make that a wall clock timeout.

You will also need a limitation on the amount of memory mapped though this, my educated guess is that something around 4MiB (1024 userptrs) should be the limit.

> And I agree that teaching walk_page_range() to handle
> non-contiguous VA sets in a single walk would be the proper
> long-term solution. That work would benefit not only KFD batch
> userptr. Will keep digging out the better solution.

We already had issues with applications which unknowlingly of the overhead tried to use userptrs for all memory allocations.

If I'm not completely mistaken we also have a limit of roughly 256MiB you can map through this without running into massive problems on the graphics side.

So that will clearly not work in even in the short term.

Regards,
Christian.

> 
> Regards,
> Honglei
> 
> On 2026/2/9 23:07, Christian König wrote:
>> On 2/9/26 15:44, Honglei Huang wrote:
>>> you said that DRM GPU SVM has the same pattern, but argued
>>> that it is not designed for "batch userptr". However, this distinction
>>> has no technical significance. The core problem is "multiple ranges
>>> under one wide notifier doing per-range hmm_range_fault". Whether
>>> these ranges are dynamically created by GPU page faults or
>>> batch-specified via ioctl, the concurrency safety mechanism is
>>> same.
>>>
>>> You said "each hmm_range_fault() can invalidate the other ranges
>>> while faulting them in". Yes, this can happen but this is precisely
>>> the scenario that mem->invalid catches:
>>>
>>>    1. hmm_range_fault(A) succeeds
>>>    2. hmm_range_fault(B) triggers reclaim → A's pages swapped out
>>>       → MMU notifier callback:
>>>         mutex_lock(notifier_lock)
>>>           range_A->valid = false
>>>           mem->invalid++
>>>         mutex_unlock(notifier_lock)
>>>    3. hmm_range_fault(B) completes
>>>    4. Commit phase:
>>>         mutex_lock(notifier_lock)
>>>           mem->invalid != saved_invalid
>>>           → return -EAGAIN, retry entire batch
>>>         mutex_unlock(notifier_lock)
>>>
>>>   invalid pages are never committed.
>>
>> Once more that is not the problem. I completely agree that this is all correctly handled.
>>
>> The problem is that the more hmm_ranges you get the more likely it is that getting another pfn invalidates a pfn you previously acquired.
>>
>> So this can end up in an endless loop, and that's why the GPUSVM code also has a timeout on the retry.
>>
>>
>> What you need to figure out is how to teach hmm_range_fault() and the underlying walk_page_range() how to skip entries which you are not interested in.
>>
>> Just a trivial example, assuming you have the following VAs you want your userptr to be filled in with: 3, 1, 5, 8, 7, 2
>>
>> To handle this case you need to build a data structure which tells you what is the smalest, largest and where each VA in the middle comes in. So you need something like: 1->1, 2->5, 3->0, 5->2, 7->4, 8->3
>>
>> Then you would call walk_page_range(mm, 1, 8, ops, data), the pud walk decides if it needs to go into pmd or eventually fault, the pmd walk decides if ptes needs to be filled in etc...
>>
>> The final pte handler then fills in the pfns linearly for the addresses you need.
>>
>> And yeah I perfectly know that this is horrible complicated, but as far as I can see everything else will just not scale.
>>
>> Creating hundreds of separate userptrs only scales up to a few megabyte and then falls apart.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>> Honglei
>>>
>>>
>>> On 2026/2/9 22:25, Christian König wrote:
>>>> On 2/9/26 15:16, Honglei Huang wrote:
>>>>> The case you described: one hmm_range_fault() invalidating another's
>>>>> seq under the same notifier, is already handled in the implementation.
>>>>>
>>>>>    example: suppose ranges A, B, C share one notifier:
>>>>>
>>>>>     1. hmm_range_fault(A) succeeds, seq_A recorded
>>>>>     2. External invalidation occurs, triggers callback:
>>>>>        mutex_lock(notifier_lock)
>>>>>          → mmu_interval_set_seq()
>>>>>          → range_A->valid = false
>>>>>          → mem->invalid++
>>>>>        mutex_unlock(notifier_lock)
>>>>>     3. hmm_range_fault(B) succeeds
>>>>>     4. Commit phase:
>>>>>        mutex_lock(notifier_lock)
>>>>>          → check mem->invalid != saved_invalid
>>>>>          → return -EAGAIN, retry the entire batch
>>>>>        mutex_unlock(notifier_lock)
>>>>>
>>>>> All concurrent invalidations are caught by the mem->invalid counter.
>>>>> Additionally, amdgpu_ttm_tt_get_user_pages_done() in confirm_valid_user_pages_locked
>>>>> performs a per-range mmu_interval_read_retry() as a final safety check.
>>>>>
>>>>> DRM GPU SVM uses the same approach: drm_gpusvm_get_pages() also calls
>>>>> hmm_range_fault() per-range independently there is no array version
>>>>> of hmm_range_fault in DRM GPU SVM either. If you consider this approach
>>>>> unworkable, then DRM GPU SVM would be unworkable too, yet it has been
>>>>> accepted upstream.
>>>>>
>>>>> The number of batch ranges is controllable. And even if it
>>>>> scales to thousands, DRM GPU SVM faces exactly the same situation:
>>>>> it does not need an array version of hmm_range_fault either, which
>>>>> shows this is a correctness question, not a performance one. For
>>>>> correctness, I believe DRM GPU SVM already demonstrates the approach
>>>>> is ok.
>>>>
>>>> Well yes, GPU SVM would have exactly the same problems. But that also doesn't have a create bulk userptr interface.
>>>>
>>>> The implementation is simply not made for this use case, and as far as I know no current upstream implementation is.
>>>>
>>>>> For performance, I have tested with thousands of ranges present:
>>>>> performance reaches 80%~95% of the native driver, and all OpenCL
>>>>> and ROCr test suites pass with no correctness issues.
>>>>
>>>> Testing can only falsify a system and not verify it.
>>>>
>>>>> Here is how DRM GPU SVM handles correctness with multiple ranges
>>>>> under one wide notifier doing per-range hmm_range_fault:
>>>>>
>>>>>     Invalidation: drm_gpusvm_notifier_invalidate()
>>>>>       - Acquires notifier_lock
>>>>>       - Calls mmu_interval_set_seq()
>>>>>       - Iterates affected ranges via driver callback (xe_svm_invalidate)
>>>>>       - Clears has_dma_mapping = false for each affected range (under lock)
>>>>>       - Releases notifier_lock
>>>>>
>>>>>     Fault: drm_gpusvm_get_pages()  (called per-range independently)
>>>>>       - mmu_interval_read_begin() to get seq
>>>>>       - hmm_range_fault() outside lock
>>>>>       - Acquires notifier_lock
>>>>>       - mmu_interval_read_retry() → if stale, release lock and retry
>>>>>       - DMA map pages + set has_dma_mapping = true (under lock)
>>>>>       - Releases notifier_lock
>>>>>
>>>>>     Validation: drm_gpusvm_pages_valid()
>>>>>       - Checks has_dma_mapping flag (under lock), NOT seq
>>>>>
>>>>> If invalidation occurs between two per-range faults, the flag is
>>>>> cleared under lock, and either mmu_interval_read_retry catches it
>>>>> in the current fault, or drm_gpusvm_pages_valid() catches it at
>>>>> validation time. No stale pages are ever committed.
>>>>>
>>>>> KFD batch userptr uses the same three-step pattern:
>>>>>
>>>>>     Invalidation: amdgpu_amdkfd_evict_userptr_batch()
>>>>>       - Acquires notifier_lock
>>>>>       - Calls mmu_interval_set_seq()
>>>>>       - Iterates affected ranges via interval_tree
>>>>>       - Sets range->valid = false for each affected range (under lock)
>>>>>       - Increments mem->invalid (under lock)
>>>>>       - Releases notifier_lock
>>>>>
>>>>>     Fault: update_invalid_user_pages()
>>>>>       - Per-range hmm_range_fault() outside lock
>>>>
>>>> And here the idea falls apart. Each hmm_range_fault() can invalidate the other ranges while faulting them in.
>>>>
>>>> That is not fundamentally solveable, but by moving the handling further into hmm_range_fault it makes it much less likely that something goes wrong.
>>>>
>>>> So once more as long as this still uses this hacky approach I will clearly reject this implementation.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>       - Acquires notifier_lock
>>>>>       - Checks mem->invalid != saved_invalid → if changed, -EAGAIN retry
>>>>>       - Sets range->valid = true for faulted ranges (under lock)
>>>>>       - Releases notifier_lock
>>>>>
>>>>>     Validation: valid_user_pages_batch()
>>>>>       - Checks range->valid flag
>>>>>       - Calls amdgpu_ttm_tt_get_user_pages_done() (mmu_interval_read_retry)
>>>>>
>>>>> The logic is equivalent as far as I can see.
>>>>>
>>>>> Regards,
>>>>> Honglei
>>>>>
>>>>>
>>>>>
>>>>> On 2026/2/9 21:27, Christian König wrote:
>>>>>> On 2/9/26 14:11, Honglei Huang wrote:
>>>>>>>
>>>>>>> So the drm svm is also a NAK?
>>>>>>>
>>>>>>> These codes have passed local testing, opencl and rocr， I also provided a detailed code path and analysis.
>>>>>>> You only said the conclusion without providing any reasons or evidence. Your statement has no justifiable reasons and is difficult to convince
>>>>>>> so far.
>>>>>>
>>>>>> That sounds like you don't understand what the issue here is, I will try to explain this once more on pseudo-code.
>>>>>>
>>>>>> Page tables are updated without holding a lock, so when you want to grab physical addresses from the then you need to use an opportunistically retry based approach to make sure that the data you got is still valid.
>>>>>>
>>>>>> In other words something like this here is needed:
>>>>>>
>>>>>> retry:
>>>>>>       hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>>>>>>       hmm_range.hmm_pfns = kvmalloc_array(npages, ...);
>>>>>> ...
>>>>>>       while (true) {
>>>>>>           mmap_read_lock(mm);
>>>>>>           err = hmm_range_fault(&hmm_range);
>>>>>>           mmap_read_unlock(mm);
>>>>>>
>>>>>>           if (err == -EBUSY) {
>>>>>>               if (time_after(jiffies, timeout))
>>>>>>                   break;
>>>>>>
>>>>>>               hmm_range.notifier_seq =
>>>>>>                   mmu_interval_read_begin(notifier);
>>>>>>               continue;
>>>>>>           }
>>>>>>           break;
>>>>>>       }
>>>>>> ...
>>>>>>       for (i = 0, j = 0; i < npages; ++j) {
>>>>>> ...
>>>>>>           dma_map_page(...)
>>>>>> ...
>>>>>>       grab_notifier_lock();
>>>>>>       if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq))
>>>>>>           goto retry;
>>>>>>       restart_queues();
>>>>>>       drop_notifier_lock();
>>>>>> ...
>>>>>>
>>>>>> Now hmm_range.notifier_seq indicates if your DMA addresses are still valid or not after you grabbed the notifier lock.
>>>>>>
>>>>>> The problem is that hmm_range works only on a single range/sequence combination, so when you do multiple calls to hmm_range_fault() for scattered VA is can easily be that one call invalidates the ranges of another call.
>>>>>>
>>>>>> So as long as you only have a few hundred hmm_ranges for your userptrs that kind of works, but it doesn't scale up into the thousands of different VA addresses you get for scattered handling.
>>>>>>
>>>>>> That's why hmm_range_fault needs to be modified to handle an array of VA addresses instead of just a A..B range.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> On 2026/2/9 20:59, Christian König wrote:
>>>>>>>> On 2/9/26 13:52, Honglei Huang wrote:
>>>>>>>>> DRM GPU SVM does use hmm_range_fault(), see drm_gpusvm_get_pages()
>>>>>>>>
>>>>>>>> I'm not sure what you are talking about, drm_gpusvm_get_pages() only supports a single range as well and not scatter gather of VA addresses.
>>>>>>>>
>>>>>>>> As far as I can see that doesn't help the slightest.
>>>>>>>>
>>>>>>>>> My implementation follows the same pattern. The detailed comparison
>>>>>>>>> of invalidation path was provided in the second half of my previous mail.
>>>>>>>>
>>>>>>>> Yeah and as I said that is not very valuable because it doesn't solves the sequence problem.
>>>>>>>>
>>>>>>>> As far as I can see the approach you try here is a clear NAK from my side.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 2026/2/9 18:16, Christian König wrote:
>>>>>>>>>> On 2/9/26 07:14, Honglei Huang wrote:
>>>>>>>>>>>
>>>>>>>>>>> I've reworked the implementation in v4. The fix is actually inspired
>>>>>>>>>>> by the DRM GPU SVM framework (drivers/gpu/drm/drm_gpusvm.c).
>>>>>>>>>>>
>>>>>>>>>>> DRM GPU SVM uses wide notifiers (recommended 512M or larger) to track
>>>>>>>>>>> multiple user virtual address ranges under a single mmu_interval_notifier,
>>>>>>>>>>> and these ranges can be non-contiguous which is essentially the same
>>>>>>>>>>> problem that batch userptr needs to solve: one BO backed by multiple
>>>>>>>>>>> non-contiguous CPU VA ranges sharing one notifier.
>>>>>>>>>>
>>>>>>>>>> That still doesn't solve the sequencing problem.
>>>>>>>>>>
>>>>>>>>>> As far as I can see you can't use hmm_range_fault with this approach or it would just not be very valuable.
>>>>>>>>>>
>>>>>>>>>> So how should that work with your patch set?
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> The wide notifier is created in drm_gpusvm_notifier_alloc:
>>>>>>>>>>>        notifier->itree.start = ALIGN_DOWN(fault_addr, gpusvm->notifier_size);
>>>>>>>>>>>        notifier->itree.last = ALIGN(fault_addr + 1, gpusvm->notifier_size) - 1;
>>>>>>>>>>> The Xe driver passes
>>>>>>>>>>>        xe_modparam.svm_notifier_size * SZ_1M in xe_svm_init
>>>>>>>>>>> as the notifier_size, so one notifier can cover many of MB of VA space
>>>>>>>>>>> containing multiple non-contiguous ranges.
>>>>>>>>>>>
>>>>>>>>>>> And DRM GPU SVM solves the per-range validity problem with flag-based
>>>>>>>>>>> validation instead of seq-based validation in:
>>>>>>>>>>>        - drm_gpusvm_pages_valid() checks
>>>>>>>>>>>            flags.has_dma_mapping
>>>>>>>>>>>          not notifier_seq. The comment explicitly states:
>>>>>>>>>>>            "This is akin to a notifier seqno check in the HMM documentation
>>>>>>>>>>>             but due to wider notifiers (i.e., notifiers which span multiple
>>>>>>>>>>>             ranges) this function is required for finer grained checking"
>>>>>>>>>>>        - __drm_gpusvm_unmap_pages() clears
>>>>>>>>>>>            flags.has_dma_mapping = false  under notifier_lock
>>>>>>>>>>>        - drm_gpusvm_get_pages() sets
>>>>>>>>>>>            flags.has_dma_mapping = true  under notifier_lock
>>>>>>>>>>> I adopted the same approach.
>>>>>>>>>>>
>>>>>>>>>>> DRM GPU SVM:
>>>>>>>>>>>        drm_gpusvm_notifier_invalidate()
>>>>>>>>>>>          down_write(&gpusvm->notifier_lock);
>>>>>>>>>>>          mmu_interval_set_seq(mni, cur_seq);
>>>>>>>>>>>          gpusvm->ops->invalidate()
>>>>>>>>>>>            -> xe_svm_invalidate()
>>>>>>>>>>>               drm_gpusvm_for_each_range()
>>>>>>>>>>>                 -> __drm_gpusvm_unmap_pages()
>>>>>>>>>>>                    WRITE_ONCE(flags.has_dma_mapping = false);  // clear flag
>>>>>>>>>>>          up_write(&gpusvm->notifier_lock);
>>>>>>>>>>>
>>>>>>>>>>> KFD batch userptr:
>>>>>>>>>>>        amdgpu_amdkfd_evict_userptr_batch()
>>>>>>>>>>>          mutex_lock(&process_info->notifier_lock);
>>>>>>>>>>>          mmu_interval_set_seq(mni, cur_seq);
>>>>>>>>>>>          discard_invalid_ranges()
>>>>>>>>>>>            interval_tree_iter_first/next()
>>>>>>>>>>>              range_info->valid = false;          // clear flag
>>>>>>>>>>>          mutex_unlock(&process_info->notifier_lock);
>>>>>>>>>>>
>>>>>>>>>>> Both implementations:
>>>>>>>>>>>        - Acquire notifier_lock FIRST, before any flag changes
>>>>>>>>>>>        - Call mmu_interval_set_seq() under the lock
>>>>>>>>>>>        - Use interval tree to find affected ranges within the wide notifier
>>>>>>>>>>>        - Mark per-range flag as invalid/valid under the lock
>>>>>>>>>>>
>>>>>>>>>>> The page fault path and final validation path also follow the same
>>>>>>>>>>> pattern as DRM GPU SVM: fault outside the lock, set/check per-range
>>>>>>>>>>> flag under the lock.
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Honglei
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 2026/2/6 21:56, Christian König wrote:
>>>>>>>>>>>> On 2/6/26 07:25, Honglei Huang wrote:
>>>>>>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi all,
>>>>>>>>>>>>>
>>>>>>>>>>>>> This is v3 of the patch series to support allocating multiple non-contiguous
>>>>>>>>>>>>> CPU virtual address ranges that map to a single contiguous GPU virtual address.
>>>>>>>>>>>>>
>>>>>>>>>>>>> v3:
>>>>>>>>>>>>> 1. No new ioctl: Reuses existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU
>>>>>>>>>>>>>          - Adds only one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>>>>>>>>>
>>>>>>>>>>>> That is most likely not the best approach, but Felix or Philip need to comment here since I don't know such IOCTLs well either.
>>>>>>>>>>>>
>>>>>>>>>>>>>          - When flag is set, mmap_offset field points to range array
>>>>>>>>>>>>>          - Minimal API surface change
>>>>>>>>>>>>
>>>>>>>>>>>> Why range of VA space for each entry?
>>>>>>>>>>>>
>>>>>>>>>>>>> 2. Improved MMU notifier handling:
>>>>>>>>>>>>>          - Single mmu_interval_notifier covering the VA span [va_min, va_max]
>>>>>>>>>>>>>          - Interval tree for efficient lookup of affected ranges during invalidation
>>>>>>>>>>>>>          - Avoids per-range notifier overhead mentioned in v2 review
>>>>>>>>>>>>
>>>>>>>>>>>> That won't work unless you also modify hmm_range_fault() to take multiple VA addresses (or ranges) at the same time.
>>>>>>>>>>>>
>>>>>>>>>>>> The problem is that we must rely on hmm_range.notifier_seq to detect changes to the page tables in question, but that in turn works only if you have one hmm_range structure and not multiple.
>>>>>>>>>>>>
>>>>>>>>>>>> What might work is doing an XOR or CRC over all hmm_range.notifier_seq you have, but that is a bit flaky.
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> 3. Better code organization: Split into 8 focused patches for easier review
>>>>>>>>>>>>>
>>>>>>>>>>>>> v2:
>>>>>>>>>>>>>          - Each CPU VA range gets its own mmu_interval_notifier for invalidation
>>>>>>>>>>>>>          - All ranges validated together and mapped to contiguous GPU VA
>>>>>>>>>>>>>          - Single kgd_mem object with array of user_range_info structures
>>>>>>>>>>>>>          - Unified eviction/restore path for all ranges in a batch
>>>>>>>>>>>>>
>>>>>>>>>>>>> Current Implementation Approach
>>>>>>>>>>>>> ===============================
>>>>>>>>>>>>>
>>>>>>>>>>>>> This series implements a practical solution within existing kernel constraints:
>>>>>>>>>>>>>
>>>>>>>>>>>>> 1. Single MMU notifier for VA span: Register one notifier covering the
>>>>>>>>>>>>>          entire range from lowest to highest address in the batch
>>>>>>>>>>>>>
>>>>>>>>>>>>> 2. Interval tree filtering: Use interval tree to efficiently identify
>>>>>>>>>>>>>          which specific ranges are affected during invalidation callbacks,
>>>>>>>>>>>>>          avoiding unnecessary processing for unrelated address changes
>>>>>>>>>>>>>
>>>>>>>>>>>>> 3. Unified eviction/restore: All ranges in a batch share eviction and
>>>>>>>>>>>>>          restore paths, maintaining consistency with existing userptr handling
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch Series Overview
>>>>>>>>>>>>> =====================
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 1/8: Add userptr batch allocation UAPI structures
>>>>>>>>>>>>>           - KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH flag
>>>>>>>>>>>>>           - kfd_ioctl_userptr_range and kfd_ioctl_userptr_ranges_data structures
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 2/8: Add user_range_info infrastructure to kgd_mem
>>>>>>>>>>>>>           - user_range_info structure for per-range tracking
>>>>>>>>>>>>>           - Fields for batch allocation in kgd_mem
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 3/8: Implement interval tree for userptr ranges
>>>>>>>>>>>>>           - Interval tree for efficient range lookup during invalidation
>>>>>>>>>>>>>           - mark_invalid_ranges() function
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 4/8: Add batch MMU notifier support
>>>>>>>>>>>>>           - Single notifier for entire VA span
>>>>>>>>>>>>>           - Invalidation callback using interval tree filtering
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 5/8: Implement batch userptr page management
>>>>>>>>>>>>>           - get_user_pages_batch() and set_user_pages_batch()
>>>>>>>>>>>>>           - Per-range page array management
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 6/8: Add batch allocation function and export API
>>>>>>>>>>>>>           - init_user_pages_batch() main initialization
>>>>>>>>>>>>>           - amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch() entry point
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 7/8: Unify userptr cleanup and update paths
>>>>>>>>>>>>>           - Shared eviction/restore handling for batch allocations
>>>>>>>>>>>>>           - Integration with existing userptr validation flows
>>>>>>>>>>>>>
>>>>>>>>>>>>> Patch 8/8: Wire up batch allocation in ioctl handler
>>>>>>>>>>>>>           - Input validation and range array parsing
>>>>>>>>>>>>>           - Integration with existing alloc_memory_of_gpu path
>>>>>>>>>>>>>
>>>>>>>>>>>>> Testing
>>>>>>>>>>>>> =======
>>>>>>>>>>>>>
>>>>>>>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>>>>>>>> - OpenCL CTS and HIP catch tests in KVM guest environment
>>>>>>>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>>>>>>>>> - Small LLM inference (3B-7B models)
>>>>>>>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thank you for your review and feedback.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Best regards,
>>>>>>>>>>>>> Honglei Huang
>>>>>>>>>>>>>
>>>>>>>>>>>>> Honglei Huang (8):
>>>>>>>>>>>>>         drm/amdkfd: Add userptr batch allocation UAPI structures
>>>>>>>>>>>>>         drm/amdkfd: Add user_range_info infrastructure to kgd_mem
>>>>>>>>>>>>>         drm/amdkfd: Implement interval tree for userptr ranges
>>>>>>>>>>>>>         drm/amdkfd: Add batch MMU notifier support
>>>>>>>>>>>>>         drm/amdkfd: Implement batch userptr page management
>>>>>>>>>>>>>         drm/amdkfd: Add batch allocation function and export API
>>>>>>>>>>>>>         drm/amdkfd: Unify userptr cleanup and update paths
>>>>>>>>>>>>>         drm/amdkfd: Wire up batch allocation in ioctl handler
>>>>>>>>>>>>>
>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  23 +
>>>>>>>>>>>>>        .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 539 +++++++++++++++++-
>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 128 ++++-
>>>>>>>>>>>>>        include/uapi/linux/kfd_ioctl.h                |  31 +-
>>>>>>>>>>>>>        4 files changed, 697 insertions(+), 24 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

