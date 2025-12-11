Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A4CB7360
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 22:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438C810E06C;
	Thu, 11 Dec 2025 21:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.b="JUzym6LG";
	dkim=pass (1024-bit key; unprotected) header.d=akamai365.onmicrosoft.com header.i=@akamai365.onmicrosoft.com header.b="XSH8x5Xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [67.231.149.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892FE10E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 21:22:52 +0000 (UTC)
Received: from pps.filterd (m0122332.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBEk0Yn1153119; Thu, 11 Dec 2025 21:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=jan2016.eng;
 bh=c+uWkg6NSnvy9RKbgD3NDHyauZ1QirPtAcNs+RPyUW4=; b=JUzym6LGfkME
 wb9TJ6vcqYSZSPPNLZYWDOhZmk4rNG9Vg4QmdrszehgNplx3ghtMpF3OfTKcLKgN
 ms6gZSwXT/8k4ZoejKqjXUO2lODKYELARkmQbSV+hUpQPZBJuOBL4IQE6BerIi7X
 2nN5HhwQqR9GLViPEMMUlzJEyKKzZQNF3DHvFShJdgwojO/p0ZPzwRcdBIyIhMMK
 snNbcwgxbYYK38URrv366oj1QztlGanMMiELfn1H0qvKAyg9IzWkVY8g5J6ehzVa
 CbsbYe5zM6ltOQV0byg8H1EWnicg+1A6fWjmh0VxvB+FD+Rs79ankKlw5WLwT69v
 pdYbwyzvxg==
Received: from prod-mail-ppoint3
 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 4ayw6r7tjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 21:22:39 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
 by prod-mail-ppoint3.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id
 5BBIB98i014059; Thu, 11 Dec 2025 16:22:39 -0500
Received: from email.msg.corp.akamai.com ([172.27.50.220])
 by prod-mail-ppoint3.akamai.com (PPS) with ESMTPS id 4aw292wr0j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Dec 2025 16:22:38 -0500
Received: from ustx2ex-exedge4.msg.corp.akamai.com (172.27.50.215) by
 ustx2ex-dag5mb3.msg.corp.akamai.com (172.27.50.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 13:22:38 -0800
Received: from ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) by
 ustx2ex-exedge4.msg.corp.akamai.com (172.27.50.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 11 Dec 2025 13:22:37 -0800
Received: from CH4PR07CU001.outbound.protection.outlook.com (72.247.45.132) by
 ustx2ex-exedge3.msg.corp.akamai.com (172.27.50.214) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 11 Dec 2025 15:22:37 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgSI6TrYp7MH6cRllrRdN4LxZ+0emjUvH7CGbPra8Oj0ZJuCucsnfIoSe9k5R3FfqrGVQT3C25CmQbf3sAIXVY1NgaOdO42d/EWVHgWG2Oy6Rse/QN7XbiOtkreSLDxX7Z1fKarfbV0Uvuly2IXgcdXDLPxRythSg9mu4bdlv3fJvLFC3XP1xmeJL18KG7lgXBpXWID24Jm8w0DlDN3A1ffCw3TioNc+3+PiQ/5m6lNxskMAObTJBbvUQylXcr3JvFqfG7kDeSJAmqlRl71qWSLK5gFSJ9jvkhGdsrf0tl1pwt6qRlKhGvDy2gTh4SdDHIvs0kclJIFB1ospl5xCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+uWkg6NSnvy9RKbgD3NDHyauZ1QirPtAcNs+RPyUW4=;
 b=yKeEOixTP0ebJDf6uYdPwwHzqMJM5ABd3+BV9RieW4AOcARQd6k1IObJLwdSnkGw3WgYQa30nvk24tvZHxN1w8ni8sCSfGhZPoDfHhixp7B3cEmNMyKB4+EHR2nzMegr1eMqkYNdJV3gL/znlBBWwp88E54Wxbh4WF4vePhTzZSQRfW/W0Jq1BkDSLm559z46g6QIDSAVWuGMDdsyuVwXqrqOSnCtT5hKFOwjqRrpyaOPH5vL9UCPdNzNL4n56OphyN0KBXXLuCFd14AgU2Kinorzk8etwht1izxzngs9mTFx4sGKMw6XWjDEVJBrY21/KnN1DXkxhNlhD2N5Q7KZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akamai.com; dmarc=pass action=none header.from=akamai.com;
 dkim=pass header.d=akamai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akamai365.onmicrosoft.com; s=selector1-akamai365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+uWkg6NSnvy9RKbgD3NDHyauZ1QirPtAcNs+RPyUW4=;
 b=XSH8x5XhswqStDToMpoYSvTFjhujE8NTxP643hJXTYKSnsAqNjSXvUcgbvOSI1UCZDuMDG7d1XZ1iqA/2TAayzC2Q5W31UFuvRX9wEHXESV1WZpijW7yUg0/PZlX6aH/3CrZHMnIRMotDeoHbtTt8k59nnzFUplr+9hFrlEzSM0=
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com (2603:10b6:a03:37b::13)
 by MN6PR17MB6970.namprd17.prod.outlook.com (2603:10b6:208:477::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 21:22:29 +0000
Received: from SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36]) by SJ0PR17MB4870.namprd17.prod.outlook.com
 ([fe80::ff21:c3fa:86eb:2f36%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 21:22:29 +0000
Message-ID: <cc2d32df-94e5-4f54-a395-36208d472c20@akamai.com>
Date: Thu, 11 Dec 2025 16:22:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 30/31] dyndbg: add
 DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
To: Jim Cromie <jim.cromie@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <gregkh@linuxfoundation.org>
CC: <ukaszb@chromium.org>, <louis.chauvet@bootlin.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-31-jim.cromie@gmail.com>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <20251118201842.1447666-31-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::33) To SJ0PR17MB4870.namprd17.prod.outlook.com
 (2603:10b6:a03:37b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB4870:EE_|MN6PR17MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 552d026c-c4f5-4fd6-167b-08de38fb63ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZ5c0ZKN0ZXajVnNXJFWUxHdjkycFk5UlRwVmV1VnBzT2h2ZHhmNWNCNGZz?=
 =?utf-8?B?eTA1TXNnQWoyT0pQZjZlQzNPYTFQQ2pSRkJMNnBob2YxMjRLVk9nZGZOM0pD?=
 =?utf-8?B?SERnSm9yN3JOVkZ3bndrUWZQUzZUR3Q4OGFQajBGZnV2WkxzZWFiek0zT3Fk?=
 =?utf-8?B?c2xmV0hZa0tGTnRHSkl3YXlSd2krN2EydE91OXJ5amxndlNVSzRubGZhN3Zy?=
 =?utf-8?B?c0VvaHJEdlBmT3dHdnNRTnl4Qjc4TldaNkNPb1IzWW5KRGRxbDM4S1lBa3hG?=
 =?utf-8?B?eTNlUHhxTGV2SlVnRDdmaEVmL1cvYjVPOG9WM0pwMW5EWlNBRjFSbndSb3BO?=
 =?utf-8?B?ckppNUlrT05WbkU4RWRjLzF4STQwbktIZGxhTnk5QVJJR0NJUFFuK2FVRU1P?=
 =?utf-8?B?QWVsNjVmZEtSazIybVJ1WmdkU1dlZFBaSHFuWERNUTZ1b2gzdlF1U09LTEYz?=
 =?utf-8?B?VU9vemRQL0ViUnFuQ2NOR1hpL1RWUmVhRGNsdFNRZkFIRHF0WVk2NmdlZVc3?=
 =?utf-8?B?UmxrTFdUc0ZvOFFVTU1ITjZBTWE2M0pKOWsvYi9lcE9xQ0I0SXF5VDJYTE9C?=
 =?utf-8?B?OWpEbEdTbW1NS2VpK3IwZEZIUDM0M1ducE5idUpwMGVRMDdCN1dUZ3dPaEEy?=
 =?utf-8?B?UHNXR3B0SE9DalJaL3NIUWcvb0JGbnY4cnBsWll2cVA0TXVnRW5IaURORHJP?=
 =?utf-8?B?dk94bmhvdFZ3MFZQQ09xMDMzOS8rQjk0S2EvL04vRXRQN1dwZEVYNWRYR1My?=
 =?utf-8?B?U2pRNmpiWEVOUndZcFpQUGhLL0t6d0ZBMk1jbE5WOEIremFCZ2loSGpqNmF4?=
 =?utf-8?B?S0c0bDQybkd2YUg2eGErZlJZVmtQYnVOdFROenFiaHo1RjBiT0dkeHZmWXAz?=
 =?utf-8?B?UDMzMENKNzBzZlpLZ1YvamR3R21jdjBiNVhDYnc4RGlEM3VuSE1VdWllczhv?=
 =?utf-8?B?VnRSeUdIQkF3TmlxbHRSY1d5MVE5NTJlTjJBeFlpV1NTZmxXNUwyaktHSXhu?=
 =?utf-8?B?aE1YaXYwYm9QSDRiUHdITzhhQThYRmJub2JFb3pZWWlwOGpteTNOSytRNUZS?=
 =?utf-8?B?RWkzdFcwTjM2OTd3S0Uxd243eWJNMXhOc2dBYklxTGFBZ1Y1d3dIODlIcHY0?=
 =?utf-8?B?ZW9hYjdhQWFrUXlFVFVORFRMRTRFL0I1NkdveS83bnoyZjd3SWl6Y28vdkJX?=
 =?utf-8?B?MnkzVW9OSWUyRHpNS21rSGlTeWl4cjZGdkl2T1VhdE1pTW5YSUg0bkFDeWwv?=
 =?utf-8?B?c09Jb3VuNTlkVFdpM2VyZC9KY2ZrNnhFTVd6R3BXQW9tL0N1ZmZhcExyNnVk?=
 =?utf-8?B?eDYxRW5qMnZsdnRubFpoQkZzQzRockxrTGZqb01hYmxnc1ZpVk81SzNiTGtx?=
 =?utf-8?B?K1FKT1lHbStmUHIrWmd1SFkxQWpnWEZhTitQZGdyQThqMGRyV2RqYlM4ZW5J?=
 =?utf-8?B?TU9hdTlzVTFqaGM2S2NaZUZHNEJmZk9QMytNVUgwTVBEU09BM1Z4UFU3REYr?=
 =?utf-8?B?cGROL09oU3V2aGtGeG9EMHVlUnMwN1BrNTdtT0xmY0ZmVTNVN21qanlGWlZs?=
 =?utf-8?B?bFBERFdvZThWNTBHSC9GbGkzbXdydVBDRUJLUnlqOWFtck5EeWdiNnNIbFkr?=
 =?utf-8?B?eHJxNE1UWnVEeGJ0d1RaSGFxWHpLZGw1OVFXb2pueVZDaVYwTHI0ZnJOZVU4?=
 =?utf-8?B?N2xiNkZKaDJRbVJpVkE5ajd2N3ZVeHRJSS9uOTExaUlQUGlpTll0RDUxeWYr?=
 =?utf-8?B?ZnNCNVlSaHVWUmNabkJxZkpzdlcvTWFMTHcwQzVKRGxOZEJiQ1N5RzQvZVF1?=
 =?utf-8?B?bzhxVDJVem9KUG1FZE5wT25qeEx0aThtUWx0S1NsbHJDRWE4cWdkd09lRTd6?=
 =?utf-8?B?dUx0YnpxSlpxN3JteDRWK0RGTW9GS3U2L21vV2NGdzBka1ZvN281R3lIY0JB?=
 =?utf-8?Q?LvQYld2S/DBe7jIucFvfDr6dFrjhILXz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4870.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3ZIVjhtVGdZdTVtNEpLS05pZUx2RmR2UU5ibFlSaWVud3dwUVU1eE5LQ1lB?=
 =?utf-8?B?OHJnYU5ZTGtOY0ltVHd4RGY4dERBTjRPdE1PWGNzQ2pncVhTbmhEL2RWVTdF?=
 =?utf-8?B?ZGF6NUJPS0MzUGxyVG03MWJkMFNkODJsV0RmR3cxYkNCOTYyYXZ3MTdheGYz?=
 =?utf-8?B?Zml2dkx2eDhaY2ZENCtlNE0vWnpsaTlYSXdqRzJXaWFvQkkvN3pnRDlZd3o3?=
 =?utf-8?B?NmtLVm42MXFsQTI1OXROWkFTdUQzeUE5alphb252MWhLTm5Za3FaMVdHOUhT?=
 =?utf-8?B?aWNiL2VNcHd6b0lzODg1UTl6NUZlS1loNkpqVlJ1ZGs3YUhXQWk5d3lLTkRF?=
 =?utf-8?B?YlNqc0JmSmFEY2tSZC82azBkZ3VPdWlDUUxNRGx6UUZuVS95c0JtTUE4MjQ5?=
 =?utf-8?B?bTNDU2diUHpPQ1RFcEQ4NTNEdkozdTFSVGI4cE5MQjh2aDQ2STJudk5PZVN0?=
 =?utf-8?B?Z0F5TkNtZmhWam11UnYzVS8vWE5FaUZqdmZtR215aUpzOFE3eHFoZjZTejVx?=
 =?utf-8?B?aHJLbjVRR1dXbjUyNFQ1cG1PMWU3UHVmY3pUa0c2cXc5UlZsYlVGLzJFbjd1?=
 =?utf-8?B?Q2YwNXE1TVgvUDViTVprdFZwZVVZbi9lNGJmc1JFZUJoY3NlOWtLVmQwRDVx?=
 =?utf-8?B?Z00yOXdkTW5sTGQ4UUc4L1VMbFZnOVlzakdZV3FOemY4NXFTdTFwYVByNEE1?=
 =?utf-8?B?Z3JGMk12cUlyOHI0U292R21xTklCMm9CWkdieENaQXR1djE1eit6dSswRjR3?=
 =?utf-8?B?L28rRHdONzluV2QrcGYxKzlueHhCWm1sZTBlYkpwUEpRWVdraERiMUUvQTNq?=
 =?utf-8?B?dDZxclBqaTdxTzdMV0tKQkhyL28zZzJWVmJJUDFtelhVeUNLZ2V6NzdWZU93?=
 =?utf-8?B?Z1B1ODQyMjgzNndSWWxWMVpiaUlibEF6aXp2Y3FQc1pJSUlTd3RBOW0rV2U1?=
 =?utf-8?B?MFVFMlV3Q3FXYVlPRHhtc2trU1ZKVURxMjd4cWxmN091MEJMMW5GQnRETjdT?=
 =?utf-8?B?NldNcmsyWDBzMnExcVJ5U1djOVpucWM2TmZQK0NvcHQ5L2lGdnZLK3k1WUJS?=
 =?utf-8?B?N3pvb25jektpQTNqVmd1WWdmc2VrcmdZUXR4MXgycmI3TnBKNFBrdU12dXZn?=
 =?utf-8?B?OFEzc1NtbTBFRVJhRmo0cHBjTmV3ODZ4aGI0c05ybm44R01TSzltVklLR2hN?=
 =?utf-8?B?azNBWU15dzg3N2lCakRBL0hSM0RBNHdEakR2TERJZCtFWFl2ZnFWWXZzOXBo?=
 =?utf-8?B?Y2lMNUFxaWlCbU5DMWNYVENLb3A4a2xqUHVrOGg1ZlpWdmZ1STB4cTY3OWtY?=
 =?utf-8?B?d0FUUUI2ZERQUTFRZytaSzdVYnhyMTIrL2QrTkNjNDBLZDlWL1lCY05wRTNW?=
 =?utf-8?B?SUVxekNWVHVNNnVBNm13OXhHdFA3NXBZKzRCOHJRak1rUnlHSGRtTEEwS1Y5?=
 =?utf-8?B?YytGZHpGUERJVmdGTmQ1MTlIbzZoRnpwSHdJV0cvbEs0ZlA2ZDFWS0FQcGc0?=
 =?utf-8?B?ckQxL0U0MUo3ZXljYnhna0hWdVBLOWRjYVkxWFJlSUw2Q3hBdFpFTUJHNUNv?=
 =?utf-8?B?b2hQeDRuaTJmSEdXczVmb3hRM0hiVWtWVGl3bS96eWNseTdoVk9CM0N0UnJh?=
 =?utf-8?B?U29Xd0V5KzJXK0dxV1RVRUhwcytDVjh0TDhvWHVUVS9SL3hFYzI4endvbTc2?=
 =?utf-8?B?VUMzUEd6VlFpVVhVbEczZGNDREFIS1dZRXhsYTRDRytXQlhhSlZFQ3lsRXMy?=
 =?utf-8?B?aGl2ZGtWdTFlVVZZek5jcUlSUFgzd3lhdzZGbUgzQ1BQOVJ3ajBLYitETWdv?=
 =?utf-8?B?aDcvWVFJOGdsV0NXUWowUDd2WkVYaXZFQ1hxWWVUVDdnYUZZRmRycHdoaTdF?=
 =?utf-8?B?akZZdjJHbzNvWGtTZ1FEZmlJaEVpK29oVDM3ZlJ4UCtyUDl2ay83OFg2VXJm?=
 =?utf-8?B?M280L3dwemwxbXNKWk5XTmFnYkZ2YWxzYlZ5TXdGSFpVVVovRmdFbTAzUFRU?=
 =?utf-8?B?aWZZZGNGSVpxQmFoMXhiT0pvcHl5VUgwRkVpV2g1M0hSVzNab2JmeE5nODJn?=
 =?utf-8?B?L09BTHJqSnFzRjZXUUcxYnFmODZUSmVrTVJPeG5WaktneUFYdnNxeXlWN2tY?=
 =?utf-8?Q?Qcb0pIPjuD/f9Dgmw4s5d9d0K?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552d026c-c4f5-4fd6-167b-08de38fb63ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4870.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:22:29.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 514876bd-5965-4b40-b0c8-e336cf72c743
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMkjt4tfkFsFRw0IfL6p8bhEl7uTxJheRusAhuDoi00dQG0/WHoePkLyaT6Xto4nUu/mnUmxBS8QXp1jNlpwxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR17MB6970
X-OriginatorOrg: akamai.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110171
X-Proofpoint-ORIG-GUID: d7RqS-iIL_inO1uPwKQ0uaZ5Sz3kawO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE3MSBTYWx0ZWRfX5jW2OHqO4HqU
 4ZwAuwCK3KmJ7nDxRejczlQ7y187o4xiLH0waALz0ETU0BKzli2HT9Rne6eOQiSyxBztIs1Dp7V
 IChk5l+Cnqjmhvamts+gjedI6w4Aj5j6/9dblzgYGVgLENf9VPzoviwNAMattPEjyjIBd0Ia6g2
 UQHYv2FIAxD4Kxu8p3eSdWtq8DyI+N/71DyLpwDbk+XY1vDzz5uulUdjiUou87Ael2XONgal3Bd
 pgn5OuH1dWycjgFfrVk2/lwf8p+SZt9DohT4fKUSMPqbPdB51hflgyaANvBtVd18rFGh+9M5NsS
 4f+AjxzT0ecMEDH4dCdF095hFF5oGTvBlfD/IEL49x5rmE4D4vc+6vUL7ZyiY/IUp0V+Bj8OCYr
 pVtFatfWPuYxnf5snKsZudhcH0tu3w==
X-Proofpoint-GUID: d7RqS-iIL_inO1uPwKQ0uaZ5Sz3kawO7
X-Authority-Analysis: v=2.4 cv=NO/YOk6g c=1 sm=1 tr=0 ts=693b361f cx=c_pps
 a=x6EWYSa6xQJ7sIVSrxzgOQ==:117 a=x6EWYSa6xQJ7sIVSrxzgOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=g1y_e2JewP0A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=zHErl439o9BLjey2v6AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110171
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



On 11/18/25 3:18 PM, Jim Cromie wrote:
----------------------------------------------!
> 
> Allow a module to use 2 classmaps together that would otherwise have a
> class_id range conflict.
> 
> Suppose drm-driver does:
> 
>    DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
>    DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);
> 
> And (for some reason) drm-accel will not define their constants to
> avoid DRM's 0..10 reservations (seems a long stretch).
> 
> So I dont think this potential conflict would become an issue until we
> have at least a 3-X-3 of classmap-defns X classmap-users
> 
> So drop this if its too speculative, knowing theres at least a
> notional solution should the situation arise.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> re-ref of an lvalue is fine.
> CHECK: Macro argument reuse '_var' - possible side-effects?
> 
> -v5+ less hand-wavy
> ---
>   include/linux/dynamic_debug.h | 30 +++++++++++++++++++++++-------
>   lib/dynamic_debug.c           | 19 ++++++++++++-------
>   2 files changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index b22da40e2583..5307be8da5c1 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -87,7 +87,7 @@ struct _ddebug_class_map {
>   struct _ddebug_class_user {
>   	char *mod_name;
>   	struct _ddebug_class_map *map;
> -	const int base;		/* user offset to re-number the used map */
> +	const int offset;	/* offset from map->base */
>   };
>   
>   /*
> @@ -235,21 +235,37 @@ struct _ddebug_class_param {
>   /**
>    * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
>    * @_var: name of the exported classmap var
> - * @_not_yet: _base-like, but applies only to this USEr. (if needed)
>    *
>    * This tells dyndbg that the module has prdbgs with classids defined
>    * in the named classmap.  This qualifies "class NAME" >controls on
> - * the user module, and ignores unknown names.
> + * the user module, and ignores unknown names. This is a wrapper for
> + * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
>    */
> -#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
> -	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
> -#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _base, _uname)		\
> +#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
> +	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
> +
> +/**
> + * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
> + * @_var:   name of the exported classmap var to use.
> + * @_offset:  an integer offset to add to the class IDs of the used map.
> + *
> + * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
> + * only be used to resolve class ID conflicts when a module uses multiple
> + * classmaps that have overlapping ID ranges.
> + *
> + * The final class IDs for the used map will be calculated as:
> + * original_map_base + class_index + @_base.


Shouldn't this be @offset here in the comment?

> + */
> +#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
> +	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
> +
> +#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
>   	extern struct _ddebug_class_map _var;				\
>   	static struct _ddebug_class_user __aligned(8) __used		\
>   	__section("__dyndbg_class_users") _uname = {			\
>   		.mod_name = KBUILD_MODNAME,				\
>   		.map = &(_var),						\
> -		.base = _base						\
> +		.offset = _offset						\
>   	}
>   
>   /**
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 1082e0273f0e..bf1ff29cca95 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -198,7 +198,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
>   		if (idx >= 0) {
>   			vpr_di_info(di, "class-ref: %s -> %s.%s ",
>   				    cli->mod_name, cli->map->mod_name, query_class);
> -			*class_id = idx + cli->map->base;
> +			*class_id = idx + cli->map->base - cli->offset;


Why is this '-'? Comment above says offset says:

"@_offset:  an integer offset to add to the class IDs of the used map."

Thanks,

-Jason


