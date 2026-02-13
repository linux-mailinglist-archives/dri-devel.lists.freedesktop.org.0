Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGJJA3J+jmnJCgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:29:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFEE132475
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 02:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6477C10E2C5;
	Fri, 13 Feb 2026 01:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="Iog7vNMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA34E10E2C5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 01:29:16 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61D0QQGI3531359; Thu, 12 Feb 2026 17:29:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=5AQuXh7HmUZwQwJ7URmAjaHUEZPqZ4k8ALZU5kUyByc=; b=Iog7vNMz9okX
 mm3jK+4Y8uRTZu3E2TCZBHEd09KLpJCqslazJAaC0yUalGJClnaq5K8PFlbAe+B5
 8cPHGe7JJ8sNuwXFL/xAdIPavc8h5gwRmzovatm+ndzmJ3j3AbHEzUqA0MqXdxTV
 wNPzmf8jFNtg1aixOP0GDLcNGX216M5XPlZaya6SPzkhsV/VllJnNawOaw6Ls20r
 G4PQInIjBtoS0/7vXrKJWCvwTF8Y+KkKDOQWaWeHORUbLC8lkVbwT10JLpoJxzvK
 Y0PRUtMHfLUlbTlu8h3lz0CCPWIyYK2g+F7SMF5SV50TB2jRcrdm48HBszUc6RWe
 rCgH/dGE4w==
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013011.outbound.protection.outlook.com
 [40.93.196.11])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4c9sdpre9j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 12 Feb 2026 17:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7NYlKyU63Ey4I099lXg+DGeiD2tKnqYJzU8DNwijkWi1RszgIHyhqXeYmBz4cKtv9BbDE87G+OwHLilHabqEPaj4y3tsBgVqzI3cuUWBV44JxQfmOsye2JhH/iYGxeivJ2c5P0sB8QCfNJyUoAix7vsH6KpWhhuweW0Egu+YyCPOnEV20w+8x5fQ6mYd/y2hh5SB5T5QPg9pF1PESVOHyXqZa12axI1soDidPUh/Tzg8NuKEdGjfgZxInca4b6iMktX6Qy/gkHzjH6Gq7hSvl2WxHNo0DTtOC1OOgn9gYaNMGm9Ws6+InZHudYRMwZTiCcrxPDKcY+yJR5Wawwjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AQuXh7HmUZwQwJ7URmAjaHUEZPqZ4k8ALZU5kUyByc=;
 b=dO4+Dt6Wy1NvMPMf2mhNonozBUbNpFZVeiYDIwN195gUWy+I9ozsz8NxoMpKeXn+QqG7OMil5UhO29rnNaHiBquSZNMK1dYm7Fx/aSM6KJn/2ap/AMLihiuJj44x5kNtLwB/DDDbaxium33HkqslMEen/2vdYXhHZ7m2R4QSgMKi2pvpzy2wpRNrpqSiVNBWX3vkiDWp3aoYOKdSMfqSprQux99RI5lpY8Ue3eyMTdrDNvUj7LWAMmzxOTgpMKi1Qy1bAcw3GbKGz112LrVOCWpNg1l67bXJWHevEKC+lImoEKZAcNW4k5KijUrd++aDOnZ93/TMdVgu+u1H22LflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by PH7PR15MB5713.namprd15.prod.outlook.com (2603:10b6:510:279::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 01:29:12 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::444a:f42c:1d70:40b5%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 01:29:12 +0000
Message-ID: <09baeab9-6aa8-4de4-a200-3091bfff1867@meta.com>
Date: Thu, 12 Feb 2026 20:29:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: drm AI patch review hacks
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0360.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::35) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|PH7PR15MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b39b587-73bd-49c6-5c4e-08de6a9f4af2
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmlySi82dnhmL0NZTHEyNFcyaUI1TmQ3QXVCNi94bGFlQ3FHdDZMQ0ZHdG9h?=
 =?utf-8?B?U2xuNDJwanBZTHBXcGRvMzUza1hla2VwdEFSUjkvK3V6eUR2bGJoQWdWdW4x?=
 =?utf-8?B?dDR5MnM0a2V4OWw0UjA2MElzTUF5SFlncjBNaSttbk1wMVhCZndPdklXak5N?=
 =?utf-8?B?cWREZ2FjWFo5dW1HdEVESzVkcnhZNE85bzlqQmdTTnFlNmE4REw3eFNuekZD?=
 =?utf-8?B?V1BIR2FLY2tlWEdyeEpFUUFOV1V5Ly9kbDJHYXRUQ1lJMDVpS1JhQkNnVXhm?=
 =?utf-8?B?aXRseFRZbkw0U2FYcldDUVdkMWpzVG5yaWpwakZ2Zkd5bytLUUtVdGdaWnJn?=
 =?utf-8?B?YWhLa1pqVzJtSXRobmFzZ1ZTb01NNUVEazJidmRPaHdtbUxVZ0FzMlNHWm5H?=
 =?utf-8?B?T1pvMWZRR1JOVGNwclNYSWpUNDl2OFd1N21RSWpUTEc5U3V3SExBRHo0d01l?=
 =?utf-8?B?L3VpOStiV1kyVnMvK2w2ZDNBYXI3czlaMG9HaE5Nd29ySTRxeUpRSmpoSkcv?=
 =?utf-8?B?dk0xUDl4WkswbGNtSUxHZ1drWUFYcmw4QjJEU1VKRXZ0RVFpWUd0OXZlYVJh?=
 =?utf-8?B?L0lVTXJacU5KVElpcE51dDJDenljRkFKeFVpUWp0K0U0Q0pKNUVaRDY3SDEv?=
 =?utf-8?B?OXQzNnlHSDhEWmEvakc5azJUK0NDYlBydVdvTkRrTU9oYVhaZ1hQL3UyTHlQ?=
 =?utf-8?B?Yzd4OXdtcGJaVmZMM2lyUU1qUGVBS2RwamF1TVVOQWRhZ2pYSFZDVXFNTVdB?=
 =?utf-8?B?ZXVEYXhDbTIwdzE4cGsyMXhiZXlTRDJQa2RQOGQ3NVRHNE9sektXVDBjQ1kv?=
 =?utf-8?B?enc5UURBUkFxNlVmTVBPOWFiQWxRR1YxQ3dReUV5eld6TkN6UUZoc0Q2bFJj?=
 =?utf-8?B?ZU9Sa0g3U2JwRExjeFhFQkhOODNVNWhoOTZIdkw1WmNnT1I2YWwvODZJYVU0?=
 =?utf-8?B?U0dJVEdRUG5RZXR2aC9scGVNb3RqeExrZXY2SmRuWFRVWXR0RFVocURrdFMw?=
 =?utf-8?B?Vk9NN0s3VlVwQkFnbzFBYzNDNWN0blRzZitHeFg2akJNWFhmYjEvNnl5TGRK?=
 =?utf-8?B?dERLODRCTE9uUjJaMlRBWS94d205TzYrQnFEaG1adFNxRnR4R0E5WUhKN2ls?=
 =?utf-8?B?Yy9vdG9rWTAxbkppVzUvM1ZQOUg0ZUxaU0tqWi8ySEYwOXY0VjNGdmV3Y21S?=
 =?utf-8?B?V1dUUktpbEZjZ2x2bVFOVE8rWjAzMUtMZmpCb0FnSytTVWZsdUg4OXVMa0hY?=
 =?utf-8?B?NUJIUHJTZmttd1dWLzVGMnJoSnI5d0tDeDJFRWIrZWVSRytrMFhmRXFtNkdC?=
 =?utf-8?B?aHJ4Zjdha0tZQ3NBN0hIcFM3SGJQN3k5R2JrOVVBQmNoYWw1QVBmOFF4VkEw?=
 =?utf-8?B?SGt4VStVUkFjcVpwWmsrdzJDUkpvQm5sL2QveCtOQTY2UXpCemlMcjdkTnVL?=
 =?utf-8?B?UUNTQy9xQ1o1VzBxNXhWZGUxOW9uVnJNdStWSTJKcmdvL3A0eDg3WUI4ais5?=
 =?utf-8?B?VEN3NnhUWE1ub0Q1b0o3NHJDMU9hTjE3b0w5V3kyaUVzMVJsZzBxRnI4NFRN?=
 =?utf-8?B?ZE1lY0NhQjdNSXJ3OHc0ZzJ0eERMVFRodUtUdmdzTGJWMmEvcXduNm9hVTdG?=
 =?utf-8?B?NGdRRDA5SkNLZ0ljWGZ2N3FJMkJnS2crM2lhUjhhN2ZVQVJJR3J2T3pBRVNk?=
 =?utf-8?B?SUlTVkowMU1oR2JkSWgrTzlIbnJ3VGd4TUJkSjR4QzIvWUtYajJZYzRjSE9r?=
 =?utf-8?B?MjNKWW5vcnFzK1NWUzdhVlFNemdtMXVjVzdNWTZOdjRjWHR1U3ZubjRzSWhv?=
 =?utf-8?B?dkp2eC9RaWRCbVRqQmVoWHJlYVFldmdBdDJ2dWxJNkxsbnhaZVk2b0I2ZFlO?=
 =?utf-8?B?bmNsaFE2YnVHVmlzVTBzYTdtNDU0RFE4QW02eGQvalBYYlNRNENlaUZ2V24z?=
 =?utf-8?B?MFNwSUhHMm0vZTFvMVJOK2VxSUR0SHY5cFNZY2ZuRTVWVW94bmU5QXlhU0dJ?=
 =?utf-8?B?SC9vdlVqUU9kSUlGaEdNdUJSVWRYUU5ldGFzaDBQanlHNnZHMlRpL1EycC92?=
 =?utf-8?B?UUdiSmU0MkhiTENldHRVS2YvRmZXSmhFQ0oxV2VlMTlxcnFwYUVXN21XT3pS?=
 =?utf-8?Q?VYCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR15MB6455.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkR1RzdiWWo0OURlOGRQNDlWVVRYeGZJZXVtUkpJRXB1SXpFRjhIRjlIZENl?=
 =?utf-8?B?azN1NzdReGxKQlRsb3Y3OGNzWUhDL3FnRlh1MGNuUkRYeGU4N2NHNGdVbktX?=
 =?utf-8?B?eEY4ZTdHcnVsMHdjQ0FtNHN4S2NKVmg4d2c0a2ZIS1hhNXM2eityR01pNDY0?=
 =?utf-8?B?VHhuS3I2Qk9SM3dCTWVldUFlM2JGd2ltYUQxSTBpMHhoTFNVcHpHK3RPaUdW?=
 =?utf-8?B?RGMwVXE4RktBb0FoZWx6c1F3d2lQcHJyQ0lJNGp5RVRTZGhJWDl0VnR6L0Fx?=
 =?utf-8?B?QVZFTFp3a1pGNjVOVC9IM1I5RGg3SXp1R01VbFRjUDViQ1pxQlIrUnZCRUNm?=
 =?utf-8?B?V3FwSW9iLzBiOUhNaDFUSVdkcWw3THkyeFBkQk10QTRiY3plcGp0TkQza0l1?=
 =?utf-8?B?V3ptc1FQaGtycUZQeS96a3lQOHJBcUJ1M3FFL1F2eUlXZFJvalUyWXZ0NmR5?=
 =?utf-8?B?UVhJc3pCdjlWbjJrcmdXS0VlVHJxM2ZPYk8ydTZvdS9xcVhpSEFKSXZQRjdy?=
 =?utf-8?B?ZHZ4NFhMcEZabnlRemlSd2xwclljbXZVYTVWM2lYWW9ub3cxdWMvL1JNRGlV?=
 =?utf-8?B?MDZxdHNnOGJaZlk1YVIxWHRKNjBlV1kvOTdVeTVuWWdjZTY3Nm5BS01DWGdy?=
 =?utf-8?B?S283aWFESm96MThjNEd2RCtpVlluN3VGaTl4eEdwWEFxRHFHVmVLSGNOL0FH?=
 =?utf-8?B?dU5jTWZXc0t0eGdwMmJZbkNyOVJ6V0w2dUtWaUdhMklDREk0VUs5bDdYTytZ?=
 =?utf-8?B?RmtkWjNiZW4vRVovUGlPRmFKZ2trWVRqbG9VUWJvSzRoWGtaOEhkUGhHNDdJ?=
 =?utf-8?B?eTV3cjVpYjV3L29Yei9LWEJyZ3N6UThkNkYveW02NWZkMUlaQXlUM0VKTjBv?=
 =?utf-8?B?MXczV2IrYng2QnYyMEpPSUhmaFE0OXg3NWFUYmJRZjMrQ3owekpNSVFqTkY2?=
 =?utf-8?B?QlNoT085bnIwNnkzeUY2WWc1WnY0MnBWNldBb1hQM2d4YmR6YjlIVGVJT1ZE?=
 =?utf-8?B?Wm04K1IzcEFhSUl0bWdjWTBWWmlJbFNoMHlMYnU2YnlHeVdWMDhxVkU3aHNI?=
 =?utf-8?B?YlNnZmhEWmpCZXQ3MjMyZHYvS1V0TUxIOHZvUlArQzN1YWxTNlg0LzVEQS9M?=
 =?utf-8?B?QjNWWXJ3WVZSbUMwdjNBaEVZSlNlNGJXd1NFalB3VTVWRWxrOEswR0txWXFO?=
 =?utf-8?B?TGEvVytmZ2NQWEt1bmJHNjlIc3BkNk1Sak8wYjU1UzN5M0hRNTFWaTY4bVZB?=
 =?utf-8?B?dEp0Y0M1TjlYZkFSMGZsdkJLZDk4enlIVlNPcUNYVmxBZUZOaXA2aDBZVjhW?=
 =?utf-8?B?cUZjNUhzQzZUYUJzeUFYNWRQRUlLbjEzajJnZ3ZBckt0RE1XRjVINGhjSkhz?=
 =?utf-8?B?Nmd1dmJDR2hJT245S0ZPcVM5L1ZsMzhkK3FydVV0cGRNZ2RqZmpndVhCS0U3?=
 =?utf-8?B?VERMejNmZURwa0kyaXBDK3Zud2tFSWJ6OExqeWI1WWludnZJSHBWY1JFRU95?=
 =?utf-8?B?bkIxSUdZOVBxM0VxTGNKbTdVYWRPU0NCMnp2eVcwbDNGTzZtKzJ6aVE3WnNK?=
 =?utf-8?B?dEt6anUvdFJYbUVZTnJDQ0Q0a1Y1VTVFOTFNU0ltMUVTL1ZzYm4xYU1NZjY3?=
 =?utf-8?B?RTQ4Y2paUFFVa2RkdWZqOFp2RHFoM0hTUi9UV2c1OXhPNE1oWTVCb1QzSnYv?=
 =?utf-8?B?Tm02bjdEUTlyNEdWRHlVOVlkcHpCendYWWdCVWRNNmJCQlRoMTllREVESldm?=
 =?utf-8?B?cWF2RTB5SUJmZ1ZTNzg1L1psU3BNYmd0RWFGNS9ZRVpaU1YvZC93TmlqTEVS?=
 =?utf-8?B?KzNPeVNqNEN6ai91UURvSXFmUS9LTlF3YjE1Ynd0dUNFMW8rS1l5OHZNRDND?=
 =?utf-8?B?OU96eHk2RW83N2ZGdXRkNWlSb2xiQUpybzhxc3VNSEorakZQQllZVmVEZnNp?=
 =?utf-8?B?dHZPRUZkeFN0Zjhmc2s3OWtNenlybEQyRWw3QWloM1hLRUlQS0FpK0ZVVmwv?=
 =?utf-8?B?YzA1b3kzZkl5ejhqcWowcGNhUjBHRjUvTnBPWitjc0NPWGIwVE5NcXMvakxZ?=
 =?utf-8?B?eURoWit5Z2xTZzNkMWZrL091Yi9hTUpTWDRHZ3o2L3o4YUJiUlpySk5oL0FB?=
 =?utf-8?B?NG1OWVUzY09pT1k5VHBLSmpBRS9UczdKMUhSQ0RYT3FnOWFhTVh5dGZ1eksy?=
 =?utf-8?B?V2hmMmtSNkJkTC9LT2FuOGxlOUt0Ni9Wa0U1S1ZnUy9RYWpoUHJ3OWlEbmE1?=
 =?utf-8?B?RWpCN3RBcXYyY1lVRmQyblNNWTlJamNFQ2ZaK0xUWGsyZ1pvUytCZHM1dXN1?=
 =?utf-8?Q?LtoUvnFvHnyPrcXVeN?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b39b587-73bd-49c6-5c4e-08de6a9f4af2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 01:29:12.3918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n05lYISYu7h+ucNvnVQCzHf51lZv0T1tM58XOgdWk/sqUPsAi9BStuclMMeSWW7J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5713
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAwOSBTYWx0ZWRfXwc77Me0fX6M0
 QWDCHSuAp/ql0QUmNwx8GiTBxg0hWDzSjrtRh+ViytuzbhaOo9z7EiMXaVw3wP95Kuorsru63lC
 c2mVFzjdcYBl9w7NFfocSs9QK0iYaOWEbxuy1ZKiaRibuEQK2qpA5Dml2vhm7q330dMMwwq4HzT
 C8+uEzUdxU3pvUgwvpcdmxSMgj23Veai9WLHF5dmvq0VOcdx0yJU0WXC63WAX2mZJesm0cqWCDn
 31tp1wAvidF+IH6SF1MCPf8p8x9X1D22ahuc78oKij49jgDf76EdsKNh0xUbOAJ79xYDaM7T25+
 HHHGXxj7BbJv/Cof5gk4by65JFEoq5+sOkNw6O/R1WIOHZTUqqUSO3V1SNAek/4cq445NYaUVE3
 yaoseJjIH4pV3UoeNvyy18paVFfq8QmeBe+aquma3uPV7/O51LBF/bH0Dnf3lfV/ydJipR3Urb2
 djQnGlHfzi/rW1pu0ew==
X-Proofpoint-ORIG-GUID: vJsBE4MQGToY-iPaDNlfIZNar9aLORix
X-Proofpoint-GUID: vJsBE4MQGToY-iPaDNlfIZNar9aLORix
X-Authority-Analysis: v=2.4 cv=R9YO2NRX c=1 sm=1 tr=0 ts=698e7e6a cx=c_pps
 a=+o5UappCifC5MfkOrb/nTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=e8O0uTMVAAAA:20 a=Us0PHfqXZTW8KF3rQ5cA:9 a=QEXdDO2ut3YA:10
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:mid,meta.com:dkim]
X-Rspamd-Queue-Id: 6DFEE132475
X-Rspamd-Action: no action

On 2/11/26 2:44 PM, Dave Airlie wrote:
> Hi all,
> 
> This came up at kernel maintainers summit, so I've been trying to see
> what I can piece together, and have a small demonstration that may be
> useful to some people.
> 
> I didn't want to pollute the mailing list with AI patch reviews, so I
> decided to set up a public-inbox that the reviews are pushed into.
> This isn't currently automated, I'm just asking claude to pull the
> last 2-3 days of patches and review what is new every so often.
> 
> The workflow use lei to pull mails to local PC, use review-prompts +
> my own prompt to try and review a patch series, both as a complete
> work, and per-patch reviews, then create the reply emails and put them
> into a public inbox git tree for publishing.
> 
> I've no idea if it's using review-prompts properly or at all, this is
> all very vibe coded so far.

Speaking of vibe coding, I took some commits with Fixes: tags and ran
them through claude to identify subsystem specific knowledge that would
make it more effective at reviewing.  The results for drm are here:

https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/drm.md

I'm happy to adjust of course, this is just a basic starting point.

-chris

