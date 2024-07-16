Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295C9323B1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 12:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944010E62A;
	Tue, 16 Jul 2024 10:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="OhD5dbDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2064.outbound.protection.outlook.com [40.107.117.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0ED10E626
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 10:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQEqoK++QgIZDChJuo2TC66UIX0GqyZf8CSUis7EGNwvvAb9hiUJZmRE+0WKGTIEfMVXgYHaIhov+Pc5hVrNgvvaSVwUCsJI9wG3RTo4A73ycbu4aBYhYr6OxTrnvu/ShmJIv65e5kbKc6PjVW+aI5M47ucbGBKxwSDJB+8idtQvswZMre4Fw5UaQWcYxRfOVG8BCrthZGt9j0xQP2RJj3gXGZsJpFYdFSMyObi8BM27Bug8Pjdrvhbn8iyuuuwJqyR44HpnHu0i2gFTFInx/QT+LrIqC5F7XnRuPkxjbKFAZiG5vE1yzRKLKfUUTqqUFE8NDQ+lS2qhpRh46faWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNqxdkREbRM04cyXKPDuLFH7D5TDZoGA2qzzvXgEa+g=;
 b=vMtkmFMAVce5cfX+fYyqKPQqrKsnhFcaRo9pT9cvMqIFCwmjB+JA1wPmJ7rF5H6/4D7GbqolZ4pgj6zwYtkZpN2uaXVdm41N2eO8VtPPePXM07Kz+Z+onWkM/+AgKwhZFnN/Tsq3ZY1YSVMLLj13Hpk9vSK5oE70qI9zYwb9k0akuMNGCWQ4jWIinBAQDsL2xrUOBPp5+4srDjhDFUA4dXkGLy+AbMWpcEfkjqtrZhWaEtFYqUE0rnanIDk1zbY6OIr84SK9JptcE2XLNZ+BjTBDBRoaDGyhY5brmewRG9y5vmicQeCVODry4+JDu6n7v/18INYvpW3XbgiSLS8zRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNqxdkREbRM04cyXKPDuLFH7D5TDZoGA2qzzvXgEa+g=;
 b=OhD5dbDe/UAXh1h4ksnTqIGx0dN3wwsMRpvjRzwm/VjnQ4B+mfTU4y5yGxydA6iWwD3sw2js80aGqOamad7wtvK8GkmgZrdHQFmlBVU29t2JnljZvdf8jfm7xdYvrbLzC7dvrWvPoomtlaxzhx8NJA3c25/tLN0X1ae3N0u/DEolTQewXRn3ayZmMJEJ1In/enAZgXucxF7Zk/Jq8wza9thBnRWII9/XYX9yhd+BuQqFKVpI9jXWAbsPXdpnHm+K/6E2C3QyE5xinAJKYQKBPwzY+VYdlYwsMnKM/ZL6+ms3lfRxfD1nh1JowB82i6DNYda5s4zlg5HX/MRqK4oIHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR0601MB5632.apcprd06.prod.outlook.com (2603:1096:820:c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 10:14:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 10:14:53 +0000
Message-ID: <b18ad853-90e4-4ad7-b621-2ca8a8111708@vivo.com>
Date: Tue, 16 Jul 2024 18:14:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
From: Huan Yang <link@vivo.com>
In-Reply-To: <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR0601MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de9c57f-bd04-4af2-f08d-08dca580224f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNqcVhkSmlPUWh1OFVkSWp1Z1JHK04zR1BTNWFXUlBjLzZRdFFLSjY5MFAw?=
 =?utf-8?B?V3F6NnNFb0N6VU5lOXkyT0QvclBWKzA3OXBiR3R2T2FkbVlmVng4eXNsL2dO?=
 =?utf-8?B?c3hEWTRQWDZrZkNKRnQ4Z1V0RTc0MG1wNitxajh0UHNacUNvVEs0NlpXL1Ex?=
 =?utf-8?B?Rk9zSHd5MEZTUGlmdEN4TWN4NzlTRlFQRkdPS081SjBKQVFRVUhrUjcxSXlE?=
 =?utf-8?B?UFdhZklpQzJaUk5QQzdRcWFJMVl0c3g1SUd5Tm5PWUJkN2FFUTRnR0ozVEZK?=
 =?utf-8?B?dkkxME95ZnlpVFZNcGZ4VzJxeFdvdU5IQW1aZitHQzA0aGNVMUZtTnZsazNi?=
 =?utf-8?B?QTdoZ3Q3MTE5eWx6dEtQamRLYlZFQndyM0gzYjZ4SXYyMFh4bWlPRE9kOTZB?=
 =?utf-8?B?cDRXcFluTmJrd0x3QlJBbHJZajNJMnAwRnU1YnVTcUtZVXdtQWxoLy93K01k?=
 =?utf-8?B?RkZRTHZYRVUwc0ZlbXg1SXBoTEJtd1lHa05WanUxUTl6eDZkbnYwTm05ZDRa?=
 =?utf-8?B?Tk5XdUI0WmdWR3N5S1BwUndwa0RzYkVsMzhRZGpHbC9WdTNrK0ZYY0JtQjZX?=
 =?utf-8?B?TFozeDlPMEZZc1FGUnExdVQxaUxtUnoyNUIyeURpMlBlNXFvdmFSYkRKU1ZW?=
 =?utf-8?B?Y2ZZekhVNWJ0WEtyOWlYSVV1YWc2QW50VXlBeDNvQzRPbk9ISlc4c2pzamlh?=
 =?utf-8?B?RVo4NWVkVXRuTUx1ODkramlkTUIyYndoWGZseU55QnYydGREZWJXTlo1R0sv?=
 =?utf-8?B?M2RpOTloZGZ6SEljWXYzck5KQzJFSDg2SzVuZThianRQM01CVnpFUG92R2lW?=
 =?utf-8?B?eTExU3c3WEN2UjB3dVU5b0M2L0hrcWQ3U1ZIL05QWUlxeDcya1F2NGs4Zk1M?=
 =?utf-8?B?L21EVGd0bm5NWktNQVozQlJ1cC9FaDdxTGxKelZ5QzBRK1RCOG1UbTM1eFg3?=
 =?utf-8?B?VW1zcEJVZHlnVUlqanRoUjlLa0p4NUpCbXBmL2VRRXg1WmZDOXhCNnVKMDVQ?=
 =?utf-8?B?dVpTREliRCtSaHd2NVljN3Y1WHZqMjVoM1pVRURqSGNNK3hDWFNXa1IxL0xs?=
 =?utf-8?B?TU5MTmJLbkFMb2ZGcXIxL1dKT0Z1UzJoVWhhUGtVajNQT1BmZmRvcW5BdXZz?=
 =?utf-8?B?eHZCUE1xbUVJUlhTaVZzUElwYjBpSVhIYiszemROOElWRVVVZk1FQmhURWNI?=
 =?utf-8?B?Z0JxaWNaelRhR0NJckFBU29pSGdOaFFxRlN2NzZ4T3dFa0NTbG9lRmxWMEVl?=
 =?utf-8?B?RUx0VDdJZit6ZnB0am9PU1c1VnpTMmE1M2l3ZThOZVlFQUVtRFBTNDg1Sytr?=
 =?utf-8?B?WW9HVTVwdFFXMm12ZGFHdDBIR3MrSHJ1VEwyMklFajFhR1RqeHVQNFYyeG9s?=
 =?utf-8?B?cVhGMDFueHNkT0x2dm5UbFhSVzBhVVFRVjhCRUxHbGljZWZ3VFY3bGlKMHVq?=
 =?utf-8?B?UmpUdTJYQ1dlWE1kN28xSTBNN3pxSDVIM3h6QXJsWjRKRUYrYUcxSlZTV0hV?=
 =?utf-8?B?ai93bFc3dFZaTlFLYjhlWGNVSVFCZUVwSVpBNUhvdXB3TkJUcXFUYitJMUpj?=
 =?utf-8?B?aTUxYStzVkdJdzBZTFVmMnNuRnFLR2tXd28zSlRNSVdMa3ZLTS9PVmJBd1o1?=
 =?utf-8?B?d1g2aWRkOXhqVndKd0JXOFludEN0a0lFQ2VNdmhsNy90V1UyS3pBTzNObFp4?=
 =?utf-8?B?WWNIbDVPcTc2emNiK05CT0FSbFZDeTlvdDJTcHhIMVcwZmhmWkRzbFNJaktH?=
 =?utf-8?B?YWNxMUFvVHJ2UWVjL1RHeDh0aEJSYmdBUXphRWp3Z0pnVTVDL1piQUdLU1Uy?=
 =?utf-8?Q?Q4LrsIBGKA7pVHHEuzI/EkQzH6zCStxmSKaIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZFSXJkeWw4N3NhaGlOMEVSTXpWZEdWbUJzM0wzRzBLaUNXWmI2OGllSTFB?=
 =?utf-8?B?SlBiRTlFRVdRQnhtN1AyUmJnNG9yeFY1b2NkSGt3SmtxTC9nOFNTWS8rekQ0?=
 =?utf-8?B?T0RBRUFVQ1o1VXh0VGVkVG5uWmtyNDErQjJkUXJ4SUhITVpSd2ZEQTd0Wlhy?=
 =?utf-8?B?ZDl1cHI2L1RTcUVQUkpKbDRhU0l1Nm1yQWxpeVhWdjBELzhrWVdwVnU2d0VW?=
 =?utf-8?B?S1pNZ1I4SThyU1RWaVQ0YkV1S1N5Tkp5YWZ2L05xQU9kWjJHdUN0OWZRdGNv?=
 =?utf-8?B?K3VQMmprWm5oeTJaZUdtOVo0WUppN1FlQi9ra1ZHWjluM25ZWi92Tk5kWm9T?=
 =?utf-8?B?VVlTMjlPTGxvYkcwd0xxSlJsR3dqSi80WTZEWlpNMGMvSWZKa09MTUFYOUhp?=
 =?utf-8?B?aFliMWI1LytvR2gzQTczbHNvYjhVeXI5MitObnllZXplOXJMZlprc1QvdnNS?=
 =?utf-8?B?a0MxamxWWEM3MW03V3lOY2UwaUtjTmxXWU83TEtsV1lxNEJHcGNnL0NYY0tX?=
 =?utf-8?B?bzlPTTZpOVNzbUhlZy9paXowaUxUM2NudzNKVFJRT0N2bHlNNzNtQUdiYUk3?=
 =?utf-8?B?UkJ0bzVYc200YXBKY1M0S085ZzRyQXlHVmQveHprM2ZmWEh3NHFZYnBpTmd5?=
 =?utf-8?B?QUt3bXFOL1MxR3ZKV0ZuL2ZsR0owaGxZR3YxT3NqcEJSeG9xcjJtbHcyeUNw?=
 =?utf-8?B?cWp3eTU1ZjY3a0dPRGZBLzlwMmcydlI1MElFMzhQamNBbnFhdnAxNDU3ODdX?=
 =?utf-8?B?M256d2JNK3VwWk1RT2huQXVtNWozdm02eXArWHNlZWlNLy9qR3BGMEgwbW9J?=
 =?utf-8?B?NDc4Y1hkeVZFaHZZRVFDRzNMNlpBTEJkY1lzN1h5MFhJT0hwS0I5dUdOQzFN?=
 =?utf-8?B?d2dsUVlOWTZFMytlc0lEeTFlK1BvTm8zaHRWbFordDl0ZmV6emxwaHJaMDli?=
 =?utf-8?B?dG42Mm9kKzVaWDdPU0xVU2gwRDVXYUJSN1hLMTM5SkZuZmsxcFVIZFBiSGlx?=
 =?utf-8?B?ZVV0UFVGZkVQQnpVNzRmdU5XSGcreWVNeExxRy9vOU9lODNCMUFFVk56T2FZ?=
 =?utf-8?B?dU1leTMyVGdFNGluWGdLZmlvcXRqeEdtUzJhS0t0WVRqK2NMNTY3UTZGL3U2?=
 =?utf-8?B?cjEzMlNReWE4RkovTHM2VHU0aGdWOU9pZlJwSGM3Ky9YNDErVWZmSHlVNWZ6?=
 =?utf-8?B?TEVIS216SitHSlYvbTAzdjladTB6QzNheFBKL255c1JtbXpUMFhNZU10TExw?=
 =?utf-8?B?dHovaGsza1JsRVNISVdnRUlxWGFLNEMrY09jTFE4bmJrbXhaT3NpSXk2MGsw?=
 =?utf-8?B?SHNSOVdTSS9hQmRYOFVIekx6bUhPQVlENmsrdkFCS0MrOXNnbXY2M2xacGto?=
 =?utf-8?B?Mm41WVQvbkd3VkhacDBzTE5nSTdFT3VNRXByKy9PM0swV1ExeGhsWUUvRE1h?=
 =?utf-8?B?ZjZQOUtCdTUzamtReXFTcGtUTWFVQVQxM0ozakFGaHpYZ1NMcithMmZkVmRu?=
 =?utf-8?B?TmJrclpQZmtsaVAxWXhkOEN2ZTEwUHFnTlE4TXEwdEJaYXlTaXhMSVlCanp3?=
 =?utf-8?B?dkNmdHkxTlpZMUduUTdha3JraWpYUTJUcXJiYWZFT2ZJaTlmNy9GelQvampG?=
 =?utf-8?B?aW52cFlvMURTS2FtRmtYWDVTSHpVazBjc2dCbW93MUdXRnVEZmR1RWlvTWlV?=
 =?utf-8?B?UU9maHBIblBjRVdwYVMvWkh4QTRJeEVlVVZxRkRFdHZYMXBMSHhVeDg4N1pH?=
 =?utf-8?B?dmJobTFjVnJla1Z5V0VCVDVHQ2NsMTdmdHhHZFJrNVdsWkZIN1lWSnlKOFRF?=
 =?utf-8?B?Ukc3VDR4Uzg4MUoxVlQ1R0pZNjl4ZVYwZjMvV2oxcG1PTGlpVVhQMVhCaEl0?=
 =?utf-8?B?MllYL1prMWN6eXdWZnFBYVB1TE54NlFuRlE4MWtadU1Cc2FkaXc1YzJLRFox?=
 =?utf-8?B?NTNsMGxUQlJjWUQyUFZSYkhab1V3QlV5cEtUU2lIME9IQytGbjR5Rytnajd0?=
 =?utf-8?B?WGlmKzBXYWorY3Jnc3JVb0hwUTJzWklXUUNkaDdkbm5PR2tkR2oyaDR5TGxa?=
 =?utf-8?B?bnVaM1hSeVMvbUo1YVdvOTVkcjlqdXZmUjJpeHN2cTg5Q2JXZU9tM3V1TU1s?=
 =?utf-8?Q?YqlLHi8ThsnVR2bHtqf9sO5xf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de9c57f-bd04-4af2-f08d-08dca580224f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:14:53.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuaqnuNSY8mK8F+3A9UZGVjxz5IEO08g3/q1fd2gKRaPHanDzuqIfUVgHHNe3Wzg7vJ5mKpvmYOV9ObtjiWVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5632
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


在 2024/7/16 17:31, Daniel Vetter 写道:
> [你通常不会收到来自 daniel.vetter@ffwll.ch 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>
> On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
>> I just research the udmabuf, Please correct me if I'm wrong.
>>
>> 在 2024/7/15 20:32, Christian König 写道:
>>> Am 15.07.24 um 11:11 schrieb Daniel Vetter:
>>>> On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
>>>>> Am 11.07.24 um 09:42 schrieb Huan Yang:
>>>>>> Some user may need load file into dma-buf, current
>>>>>> way is:
>>>>>>      1. allocate a dma-buf, get dma-buf fd
>>>>>>      2. mmap dma-buf fd into vaddr
>>>>>>      3. read(file_fd, vaddr, fsz)
>>>>>> This is too heavy if fsz reached to GB.
>>>>> You need to describe a bit more why that is to heavy. I can only
>>>>> assume you
>>>>> need to save memory bandwidth and avoid the extra copy with the CPU.
>>>>>
>>>>>> This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
>>>>>> User need to offer a file_fd which you want to load into
>>>>>> dma-buf, then,
>>>>>> it promise if you got a dma-buf fd, it will contains the file content.
>>>>> Interesting idea, that has at least more potential than trying
>>>>> to enable
>>>>> direct I/O on mmap()ed DMA-bufs.
>>>>>
>>>>> The approach with the new IOCTL might not work because it is a very
>>>>> specialized use case.
>>>>>
>>>>> But IIRC there was a copy_file_range callback in the file_operations
>>>>> structure you could use for that. I'm just not sure when and how
>>>>> that's used
>>>>> with the copy_file_range() system call.
>>>> I'm not sure any of those help, because internally they're all still
>>>> based
>>>> on struct page (or maybe in the future on folios). And that's the thing
>>>> dma-buf can't give you, at least without peaking behind the curtain.
>>>>
>>>> I think an entirely different option would be malloc+udmabuf. That
>>>> essentially handles the impendence-mismatch between direct I/O and
>>>> dma-buf
>>>> on the dma-buf side. The downside is that it'll make the permanently
>>>> pinned memory accounting and tracking issues even more apparent, but I
>>>> guess eventually we do need to sort that one out.
>>> Oh, very good idea!
>>> Just one minor correction: it's not malloc+udmabuf, but rather
>>> create_memfd()+udmabuf.
> Hm right, it's create_memfd() + mmap(memfd) + udmabuf
>
>>> And you need to complete your direct I/O before creating the udmabuf
>>> since that reference will prevent direct I/O from working.
>> udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
>> (same as dmabuf). So, must complete read before pin it.
> Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
> rdma folks would be really annoyed if that's the case ...
>
>> But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
>> need suit it.
>>
>>
>> I currently doubt that the udmabuf solution is suitable for our
>> gigabyte-level read operations.
>>
>> 1. The current mmap operation uses faulting, so frequent page faults will be
>> triggered during reads, resulting in a lot of context switching overhead.
>>
>> 2. current udmabuf size limit is 64MB, even can change, maybe not good to
>> use in large size?
> Yeah that's just a figleaf so we don't have to bother about the accounting
> issue.
>
>> 3. The migration and adaptation of the driver is also a challenge, and
>> currently, we are unable to control it.
> Why does a udmabuf fd not work instead of any other dmabuf fd? That
> shouldn't matter for the consuming driver ...

Hmm, our production's driver provider by other oem. I see many of they 
implement

their own dma_buf_ops.  These may not be generic and may require them to 
reimplement.

>
>> Perhaps implementing `copy_file_range` would be more suitable for us.
> See my other mail, fundamentally these all rely on struct page being
> present, and dma-buf doesn't give you that. Which means you need to go
> below the dma-buf abstraction. And udmabuf is pretty much the thing for
> that, because it wraps normal struct page memory into a dmabuf.
Yes, udmabuf give this, I am very interested in whether the page 
provided by udmabuf can trigger direct I/O.

So, I'll give a test and report soon.
>
> And copy_file_range on the underlying memfd might already work, I haven't
> checked though.

I have doubts.

I recently tested and found that I need to modify many places in 
vfs_copy_file_range in order to run the copy file range with DMA_BUF 
fd.(I have managed to get it working,

but I don't think the implementation is good enough, so I can't provide 
the source code.)

Maybe memfd can work or not, let's give it a test.:)

Anyway, it's a good idea too. I currently need to focus on whether it 
can be achieved, as well as the performance comparison.

>
> Cheers, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch/
