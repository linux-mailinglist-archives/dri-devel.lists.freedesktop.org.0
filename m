Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Sk7+IqfljGm+uwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:25:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6F127610
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1007D10E648;
	Wed, 11 Feb 2026 20:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="Vswb5WP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9469B10E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:25:05 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 61BKBRiN4146880;
 Wed, 11 Feb 2026 12:25:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=wr4tog0ilGrHXNvW+Pf3BNtW9KsxA6V75Ew+r2sQJ5s=; b=Vswb5WP1vA2N
 SeG+RBbDy6H6xJinsfUYM2RaQGoLEC6UUsdnfHaf1HfMIHPpLbvOR3PMQ9gzflcM
 WLZ9sDuxc55p0Ue300uKx4NW/gob0QT0mTaEHKZp6TY1EwWjqOyGU7386odni3kv
 wgp8I6f0XZQpH+NDDV4UUxks8YWM911b2ZpcocsQWMwYBZm8V+M4gRbSWqTm8lOx
 dQlsD5N6jyCIqMQMEsXPHC50Ph2zuQiuUnDJjghka1xkvcFnqAsrdEY0OU1OYb5u
 hVMdjfGArKwltWu4DzCeHk03c7FQlJdsGPTxnzzuyNExxFcXScYViejl6ZVv3NN6
 R/Ry+04gvA==
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
 by m0001303.ppops.net (PPS) with ESMTPS id 4c90kar661-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 11 Feb 2026 12:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idZjCdypeg45ovSmWkPWYsMvebrlPm9TdD16R4EZu81zHTrjcMCljA3XVJRWUX812lSC/l8xHVITLn2cgfh3eFa69E2vF8bdUJEwVGjDZMkvzwPV0+rBU8OyNqf7oKXIK1wSQ2AixVdFqkAnxtAB545+WsU7MqMP1iQldN+s0+foH3EbdM+sF2NBe/p/KAG4Y5US7hs9XT363nOs+gP3qj0XvwKSuTYIqdtt8tU87qcmli77xCKh6mW4BZQoNM0UIc+FjcsMW8rZmsReDSC9XsY4Ya4ZCSt3fxGdbjZDjvr+IeJmG/6pKPmSB6aXTcRiVMifjZ/ZKDPriU62JDjHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr4tog0ilGrHXNvW+Pf3BNtW9KsxA6V75Ew+r2sQJ5s=;
 b=SqigjTHIGWsyWMnJMDAk9hiop0xyyqGNNG7jgP+Q/kMf5qqQ6YLrVV9SlqBmxbfqLCALC+K7jphrrWxcXw0g1y3xAVHAIo+69toZAtSccN41/mVWSoZPb8R1lgMWk5Lwq5E5bVTN/98ZgqPvoXT+OSyBjBiE33cjCg4h3XzKhHft2TF1QkDBtb55w3iK9YhZxxeKDhjo+ZENIQaOWLqYxMUC/K47KMyGm6dMzuR9OJBoxXdcVW4bcrQDJWIi/VqZTB9xP8OWxaXaq7Vh+wMOGErXfORkXLa1HHOJvo3U0bQxqT4qGKI+bukMlN9cJFI/bjtN9ibDgt65QXAaA4Ilrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH0PR15MB4230.namprd15.prod.outlook.com (2603:10b6:510:2b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 20:24:59 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 20:24:58 +0000
Message-ID: <d1603a67-8956-4d01-97bb-e9b6f17a76b0@meta.com>
Date: Wed, 11 Feb 2026 15:24:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: drm AI patch review hacks
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>, 
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
 <CAPM=9tyPS=B9WEwn8BydwfpY1qLY+umUQxsJBbXT13nqxK1aTA@mail.gmail.com>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <CAPM=9tyPS=B9WEwn8BydwfpY1qLY+umUQxsJBbXT13nqxK1aTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30)
 To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH0PR15MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 847a8d51-ade0-4546-ac04-08de69aba075
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVpZYTYvS3ppdGZ0LzQ0eW9ab0E3MmJpMjZtWWtWNE5YTUxxVFMzSkxWOEZp?=
 =?utf-8?B?cUdNdDNyUUUzc2VmM3RTQlhmUTNMd1NWTVMxKzQ1bDhlV0ZienAwUVc5Njdn?=
 =?utf-8?B?VTJWdm5oSnJaYmRMZ3RWUlpTWGJqcVdhQlBkRjV5ZzJ1QUxTTEFNclpaT2hK?=
 =?utf-8?B?WmZZSUMzV2grSUVaTDN4dTVVaStRNkVRVThOK0ZhRHVKdGxuMkQzQUxINGZC?=
 =?utf-8?B?czYwK1RBM0dYVlR1enVCaFhNV3VXRmdoYmpBaEJkT0ZtaWd0OUZkVzJCSlRa?=
 =?utf-8?B?dkdFcUtBSnRJaitnQ0tIOU9CZVFFd0NWekMrL0ZGNlY5ME5sL0I5Q1JZL3hx?=
 =?utf-8?B?anA2anc3eE5qMGxLL012VTF6S0xwdDdRaEtiRlA4Q3ZaZXVVTnJZNTlGTERz?=
 =?utf-8?B?ak9HRFh5NG9ZSUtzNXU0dEV2UzBBNHhXMktuQ2tkYU9tc0N1emJSelVNUnp4?=
 =?utf-8?B?TXVOUzMvck0vUDgzWGgyZkNQdnRveEwreDlCTDNNNFdPUWwvNnM4YXR1YzZI?=
 =?utf-8?B?Q0lOSk1hMXAzRkZZclhZUnp4Tlp3UG1HZ25GaE42aFFVVUM4U0YwL0Q0WUJJ?=
 =?utf-8?B?SFVyNnpKWjBEWWs5eEtiZHZoRkpmelR2Ymk0c3gvOVVVa1ZKaWF2MHQ5L2xp?=
 =?utf-8?B?SDhhYjA4WCt1ZURScWhrL2FjSlFzalpheGFTMkhlSlh0eWwxRE5GYXVxMlZ6?=
 =?utf-8?B?SGNxUjFudGVNSFRqcDFoeDZtSGZrN21zS3kzMkZnNEt3RHZHYjJpbHNQR2Zk?=
 =?utf-8?B?QVl5N0RCb2RxeHdLaXlzVWVkNEZzMkR5VE9hWDRhSzhzS205WExtZDFvRXJn?=
 =?utf-8?B?b1pNVWJkNXkxSVdjMVoxbm9hdWJ0T1RaY2t0QTdpTVRFRmJDcklRaDVxZm52?=
 =?utf-8?B?OGh5Sm1qbDdHT092Ylp5TS9FSWdIMUx2RFVqMmFPUHpNSm1STE9NVHRsczdB?=
 =?utf-8?B?VGFyWXI1RytpL2pIMk8wM2tjV2REb09KenFzYzZmUld1QWFQVmhJQnI4K1VL?=
 =?utf-8?B?c042TFk3a2tiNUZmenZvRTNkUWtzV0poeHNCVndhUVdWL0p0b2ZvYkpIWkNU?=
 =?utf-8?B?Q0pvZXZTUXIxWWQyTTRMTHRTKy9IQzh3b3Z5TVE1UkRValdXZDYrZjY0TU4r?=
 =?utf-8?B?NjZBcFM5blhDa1k5cldtN0xLYnVoQzlCNTRKYkVabkREa2ZIK3JVM3d1Qyt6?=
 =?utf-8?B?SGJMZXV3a0ZvdzAyTUlYeTZqS3B5cHJvUURmYlFBZVEzVmJkRTJPWFJvRTFP?=
 =?utf-8?B?Rm9VQ2pMS2xoeWhWSjJ0b0REMWZjcUpsWUd1SHNxSDlTaWE1dHo3R2tHaHV6?=
 =?utf-8?B?bXp4UHhoZ1hkTzh4SEY0d1JXS1VpWUVvcGZ0d0Z0MWxxcVdYUW53R0V1VjZN?=
 =?utf-8?B?eVF4b0MvN0dHVng4Zk1KOUxVUlQwa1k1Z0xYR05ORWFHV1NNa28yWnlyTTRm?=
 =?utf-8?B?S04xSW9wZ1RWKzNhanBVUGQreWRZWVNwYTk5Tmk0M2YvQXpJUXlURGlHSFpP?=
 =?utf-8?B?OVFiQlRXdWhHTUd0ZWlkU2x3U2J2QlBYZlI2ZVlpS2lwS0pKQ08va1pqcjVq?=
 =?utf-8?B?aVdialJJTmwvem5vZWJLQkpuci9YMnZ4OWpqaTJjU0lyUlpIMkFyQWpQbllS?=
 =?utf-8?B?aC93Mm9tSjc3YldhVG0xRDFjYm9MZW9QZldzSFZqUDFIY0tWOXBZaXVBYjFD?=
 =?utf-8?B?Q3ZuelNTTkh4QUVxRjRNT1RERTk1c2M4RnVrdkZ0WVErZndGYXFYQkRQb3oz?=
 =?utf-8?B?aU9objNybGxta3N1OTFoMG50UEJQc0lKci9aeXl2MjF1SWFoRVVsV1JRa2RQ?=
 =?utf-8?B?SFV3eGxXS1ZBYVJydU1QeS9FUlFUaXdUdmh4QUkwK24zK2pzbXcweE03bUVW?=
 =?utf-8?B?L0hyRjJhUWVOU0l1WlhSWk4vOFZjUmp2V0RobVVvbTAwUHFOWWpuN3ZnTWhL?=
 =?utf-8?B?ZW5TVHdnUHFMUVdXbUluWVBUbVh5eTRvbDZPRHVZZVFXSUM4b1RSeFFGT1V5?=
 =?utf-8?B?aE1xYzVtRngxVjQvVlgwakwyYjY4R25sQXkzUDBxaXRjV0JqOU9NRjI4NVMv?=
 =?utf-8?B?ZExxRDkyZTBHQ1g1MkE4VE5obGFXaUZtOEVRdmJsekRPbmdaTkpPRURxR3pG?=
 =?utf-8?Q?U7FI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR15MB6455.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1NHZVFMKzFLVDVqeHpYcEpKT0xRcU5FSFdvd3VTMzVnRTlXTEJHY2E3b1ZT?=
 =?utf-8?B?SmUrT25iOW0xZFA3MmhHa05DeG9kaC91NmdsMU5ieU9wWWl1NWJqMFJxZ0JQ?=
 =?utf-8?B?SWlpMWJIaUVNR2hJekc3REVFYUUvdVk4SFZQcGthVjFIU2RBYUEyUHFpOVZp?=
 =?utf-8?B?VTcxY0taVEJnWkFQclB4VlI1QTIrQi8vS1NhaXh6QWYxalVNNE0vVWlRV0l5?=
 =?utf-8?B?NFV4cWxMZzJSRWR6a2l4OWtLdkU2dmpSSGxqcjd1RnNjb2hSb3RDWStRbCtv?=
 =?utf-8?B?K3AwL1kwMFUrK3FWQ1dqYkU1RzVscWh0M1hSWDF6SXZHZVk1ZXFSbUgwbFpH?=
 =?utf-8?B?SUpiUzZBMnkydXJuWmYycWNaVHBlVG1sZzZkVVp5K0tQcnRONDBqbDl6Wmkv?=
 =?utf-8?B?SWthYWZFNVF3eTk2T0NrTVpsR1RvRmxEVGxkalJGQUl3d1B6UFVSMm9HYTFh?=
 =?utf-8?B?SEFFOFVMZHpPSVpNdHBFNFh0SzZJUmxhUEpKMWZxaFEvM2ViTmUrNUVTdG5z?=
 =?utf-8?B?UTkwT1k4WTdyT2R1OHhYWHRUZWlXaU5PcUNsUGp2UnIzekJTN3lxYlF4L3Y3?=
 =?utf-8?B?Z0grVks5bGhhQ0I2Q21iRUtrTkdLVnRxTlZNVTFSemsveWNDbmZYYlhzQlBz?=
 =?utf-8?B?akU0ckZJQTFsd1poN2kvTlJCbFZYQkZvWDNsZnZEWjh3ZUw5Qmh6OExlNS9F?=
 =?utf-8?B?U1h5WG84Ry8zbmRZdnNhWitLcS9xWUdwYlY1YWVJTkxERkFjcStEWTJjUTFP?=
 =?utf-8?B?bzc5Yzhnb0xlNzZ0b2I5NTVLRGVEbm1oVkpqRjRSUFNtMnpxS3o5azFHemtw?=
 =?utf-8?B?QWE5RXVTV3hPNWE0ZW84WTI0NU1yTTh5Uzk5czhDTVNHc1Z5ejh0K3EwWTE0?=
 =?utf-8?B?V3J3Z25EamlEK3RCVVEyeVdUNUtVbEwyU2tFMEJ4K1FQK3N0TCt6Skd6bHlN?=
 =?utf-8?B?NDhycnk2WVdzdVhuMVZUYzFkdmFYWHB3MUgwdndzaURUQWozMzJKcmsyT21o?=
 =?utf-8?B?alliVDdCbzd2QkxMMXpJZHArWC9UdWtDcENVaUxnK0JDTWxPRklNVUJRaUFX?=
 =?utf-8?B?ckNJcG1nU24wN00xZGtyN0FtMlRXKzkxVGxYQ053anRXM3RaZy9vVDV4dFFJ?=
 =?utf-8?B?QTZiTE1XQmg2NG10R29jTHg5NGI2bm1QQWo0bHh0ZEFJUFdIdFB6ZVBjK3Bl?=
 =?utf-8?B?YWJFTVQ5WStSSEZzTkRIRjNNSEZrZ3lrZW5DTkd5TFZnWnlqSmFocGlHSVhh?=
 =?utf-8?B?OC8weDNTUnRIRDdZZThEZWJrYnJGWjZSM2xkczVxSGMyUVZxZkhkZlprMVNk?=
 =?utf-8?B?M1VLOGtOT2ZBSVJ0VE9pZWpicXppYllhdkJMbE4ycVJsaUd1Z3ZKNllGc01P?=
 =?utf-8?B?aXFLbVJFQmZsU2hmRHFNOUk1U21IejRxREhNTVJjSWc3ckFBWFNkdENleGc1?=
 =?utf-8?B?cW5PQStpakRmR1R5ZkhTQkhUaTNWVXEwdTdacUYxZVFZam9jRG9DdHYvbFpi?=
 =?utf-8?B?cXNHWSs5dVlXbHlRTGhsaW5qenlCMmUxR0Ywa0p1NFRxL3pYbVRGZlord01x?=
 =?utf-8?B?WTJYeWRaL2ZaRnBRWDJwQUJmYTVqbGVjcEhQNDdHbkxwMnprWjYrZ1E3aTRx?=
 =?utf-8?B?QkwwaFMyT1A0L3BNRm1QVnc2blhUaDFoaHN2Y0xUUXV6SG5yVThSNVRKREJM?=
 =?utf-8?B?a1RPUXdRSmNSNFpBTVIyMlRMdEg0bkgwUnRiM1VtTGV6Z2E1RzZWaEdrRkNp?=
 =?utf-8?B?K3hScjY2dDJUM3RWcDR0UjBBTmRTWFZOWFdSTXpFUEtzYzZmZCtuakFYQU1z?=
 =?utf-8?B?cWd2ZTZGdjVxRm9LYVFRSzlKeFFHaTVkT2xucGtCTFJPV2VFL1JSSThVOWo1?=
 =?utf-8?B?cjJqSzlqTEMyV0ZBTmtLcWsrSmRXeENXNXZRbTJqVUJRV002U3VaaHNVZnEz?=
 =?utf-8?B?MWFnenEzNm5KbERja1llcWhnbVc2aHpzcmhrQlQrbDFSSVEvSWtJclFDc0Er?=
 =?utf-8?B?bWxvOU1rQ1k2NE9zeVFDQm05Nm1UTGpJZldtL2tCdkJabGJLMXFZc3g5clBr?=
 =?utf-8?B?OVU3d3NIMGVFdDRhTWJZTGgzcTJWOG82eE1VVEVLQ2xKaXFKcXo5a1ZEbmkw?=
 =?utf-8?B?Y2NLdU5QUG9EWE5uMVJsdE5OK1RwWEFXQlNYdnFVZ1hma05JUWJ2QXQxYXA0?=
 =?utf-8?B?blRRNDk5S094OXRUY3loVnVvOGFWMGcrYzB3WFptL0NyMHFDVW83OVkzM213?=
 =?utf-8?B?blA3RWtITTVlM1NVKzJPemFFTTVYZFgvUlNWVjJBaU95WUErcGExUnMrc1da?=
 =?utf-8?Q?OZWizh4vwhFUYax7bE?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847a8d51-ade0-4546-ac04-08de69aba075
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:24:58.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVLryIghb7wXtFe8UkgsmzJsvZTl6UuNBJwwNvoEUv4dzF+UGPoDv7YZQdP7IqOW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4230
X-Authority-Analysis: v=2.4 cv=KrVAGGWN c=1 sm=1 tr=0 ts=698ce59f cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=UCT24_SCnVdoDbV4YGYA:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1NyBTYWx0ZWRfX3Fa5QUB5+yZp
 gpI03lFEWh6lSvApVdo9JYRKyLlIalOQQrXj5YJe9rSiM3bUVT9VZCgJi1iZrRjzE3xLj1BUpFB
 UFuPnqp00f+SGvRrCCj01hZUa3Jg1w7T9QAyOJvDIjvhlY2bB2aRGIHM/KZUauYTrzlgop+Y7Bi
 s8ueWKNxZBUoBj9CG2LQ3bMTfaMM1NqCROb4IiC8pRGTiL53ATngQNOyxrVdlsyndaXPhUr+m5a
 827nHptGEUAWxBcpINVC3fqb/Lf7/0pU+0EumcOYlXAiuaExnELchiV3yEgD9/OqkxLaNGg5vea
 K++SWjYFnr+S4CyLxinNaSYmOPWtoqyGEQCSV7XjOClGqxnqPP85S4wYhTWlisvSO+TG2AjsShw
 eYycSBzVl2+08dEEVxSdtmSRPzmpOrS0TEm2NNY4W4EXXyN0xtgGthQyAbj8cnP9+/gF1lqCL16
 JFk4G5iAiDvvA6GL+qg==
X-Proofpoint-GUID: cjxBBhuHRcLLsAjyhiykwJ1mz7TkmXXk
X-Proofpoint-ORIG-GUID: cjxBBhuHRcLLsAjyhiykwJ1mz7TkmXXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
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
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:dkim,meta.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,false-positive-guide.md:url]
X-Rspamd-Queue-Id: B9F6F127610
X-Rspamd-Action: no action



On 2/11/26 3:05 PM, Dave Airlie wrote:
> On Thu, 12 Feb 2026 at 06:02, Chris Mason <clm@meta.com> wrote:
>>

[ ... ]

>>> This is also just an experiment to see what might stick, it might
>>> disappear at any time, and it probably needs a lot of tuning.
>>
>> The output is pretty different from netdev/bpf:
>>
>> https://lore.kernel.org/bpf/?q=AI+reviewed+your+patch 
>>
>> Which might be what you want so it's fine of course.  But it looks like
>> it didn't actually go through the report generation from the review
>> prompts, so I'm worried it didn't use the rest of the prompts either.
>>
>> My stuff should be creating a review-inline.txt which is the lkml
>> formatted review.
>>
>> I'm happy to try things out here if it'll help.
> 
> My plan over the next few days is to refine the code to make sure it's
> doing this, my prompt asks it to load the patch and the kernel
> prompts, then do a review across the series and individual patches,
> 
> I'm guessing some of the results aren't making it back out the other side.

I had to change the prompts a bit, I think my original instructions were:

"read prompt xyz and patch abc, review the patch"

But sometimes claude would read the prompt and the patch and then follow
it's own review protocol instead of mine.  The current /kreview slash
command is a lot more reliable:

Read the prompt <path to prompts dir>/kernel/review-core.md

If a git range is provided, it's meant for the false-positive-guide.md
section

Using the prompt, do a deep dive regression analysis of the top commit,
or the provided patch/commit

-chris

