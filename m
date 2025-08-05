Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF2B1AC38
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 03:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787EA10E054;
	Tue,  5 Aug 2025 01:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="n2ofKkeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F2F88A72
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 01:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgujcwYKOzGALUoY+Dz/Xcc4TWnrUBdpLyFukWEvgcAdfuuzAJkYEbf2yN6QGbVx331UPuoHChhbGCqo205SM1TmDCw/SzEK4Plv9sR0aloAWEhh+cksdvufWPW19M3IAOzOoGemRGz1PiwfZ5Ns5KWUbEdZj9DB5OexNaaJjf95ukJqCK5JA0Oa7RK/Kboj3soG5KQanm+7F0ghOG6rvKL1i2wJVDHZ0amFgzpOVJ6ZNw0Ou0u4Qj+/9uo0Cwu+LoSn8JxDg73jcBIUiBNB0D8SxlPs1nUASa3in5W6lMkHA4e/N/BS1kdczi0OHgrXq6Uic0ipbkjw4Wcpxa5hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh3cki8b/vdNbl6oQKmqoXkjlna09qCOnBfuxAPRHgw=;
 b=nQ5jC+nrylkDEpgBYVxlfzRS0lbB4E4JhII+N4Z68YlVr0QIzcAJCH8Q3pmSiuWVo4LsKch8DE66BJ/knbXSRbhvFS3QpgxBFIY4jjnLGIhXH1Ny0wkInfM+6l3YyUIiLVM1CFY39WtTb3ixAoK8DR3ydr1IfAtK1qDTr/T4Ow7fLLc1dR+A/OqwpTS3/Psod+A0nztY7K6k4lFdDpZBdLQ9juDvhuNvSaeSyThQcvG8Nk4Ti/5PzbQ0qLhKqu62g0Z8xg1HS+hnF9xIxBlQuPDmlAYPppitlfbGy5dpguEQXaSa2KaGK3oJ/cbhBKkCEpkgCMJXOvCvYX0/uJI69g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh3cki8b/vdNbl6oQKmqoXkjlna09qCOnBfuxAPRHgw=;
 b=n2ofKkeDxOXfWP0w8aCdlvttt3i+dN5svN+mqLXRjKwAAiiTjaFq3F/X8ak3ooVTtwo+AU2azHZ3YfL4vaRtCb7HB0DxJIwaXivivvRSqqk4b6qb6a0rjb02F1lRIWXoxIcnEBDpyU2N2PQNxnGMDHYJ24z3abiqEYEuPOQmvSTd3ESbNtNHmKlTyIlPz6z06I8I/D6PHlthOH68ZQE3gXiy1teHR5NsMvaX4163LwNj6CEqBfK3/gr1r/BDsAF+JB+HZPvI7NnifBDTgpDP4BKNAa9M2N4bUXrNuuiRSHQChZZlfK5/0fQytE95zSths3hiabahkfNf5fMBag5iKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 5 Aug
 2025 01:48:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 01:48:30 +0000
Message-ID: <647f4a16-cb25-46f7-95d7-4c049e6c145b@nxp.com>
Date: Tue, 5 Aug 2025 09:49:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for Waveshare DSI2DPI unit
To: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB11037:EE_
X-MS-Office365-Filtering-Correlation-Id: ab22a5e6-c4d5-43df-7463-08ddd3c22d81
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|19092799006|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0NaencyNUZSUnNuRkppZHFvOThBeE9tbXlRRzJiOERCV0ozUWo3bHJ4cElj?=
 =?utf-8?B?RWl6RldocG5LK3lRL2FIOVBZN01oMUFjM01kbkpGSHNmZU1mZXRkeTM0QjQ4?=
 =?utf-8?B?U05kN2tQMkpidXpzTVprUTFsZVh2NE0wOHdhajZ1WldnQXNQREI3dDNuOUNZ?=
 =?utf-8?B?SUU3bFF2SU52NDZCdnRWaUYzdmNjbDdWcjlWUktUZjlIU2x1eFdDaG5rT3gr?=
 =?utf-8?B?dmtLbmZBdHFFMDkxSVVWQmVteWRaOTgzSG5zbkNRZTdVRGlaeW5YM1pvWHA5?=
 =?utf-8?B?azdQc3ZGSFRGOXB2WWVVM1pqcTlQbkRSTHA3WmJ2bVBDZXdScC9JUnh2WGdw?=
 =?utf-8?B?ZjBGZjJoenBuL1VRdGtQVU5ndm5ZZmFMek92SGlvN1YrSDBpMWRDNmhsaTR2?=
 =?utf-8?B?UytCQWlQdVdBdzVVMEp5MHEzVjlCMkxrUnYrWU1QK2t3bU1WZm9rd0F5dDZl?=
 =?utf-8?B?U2p6Wm9uRFBtVjgrMkNVK0JIbnAvUWUybWJPOG1MQ3RmeWNNcmtVd2dzaUJs?=
 =?utf-8?B?NW5IbjlGK1F6MkZSRDN5cStDUzVOUzZ1K0UrUHIwK3BLTlpwUDhKK3dVZkFu?=
 =?utf-8?B?b1VtQnBMcG9ta1ZtT0NPSlNNWnVMdUcyK1lNSUhjM0tVR09OalhXWnVXUmp4?=
 =?utf-8?B?WVVUaTJmdHlTaXhpZEt4aGhBdStFTkczMGc0eThLT0xpSk4vZis3ckVmNTFL?=
 =?utf-8?B?cnlKa0s4aEw4eWwraFM4OStuTk40c2RGQllvQUEvejhYSVhKUmw5ZVQvMHVE?=
 =?utf-8?B?b0R5SkNManJmejBDQjhwcVlWd1dFZzg0QUh6Y0c0Qlp6ck5WZmFVZ3ZuY2pi?=
 =?utf-8?B?N2RFWVgrQnp3dXJxK0ZPMGhHWWwwRzlyWS9pQ3FPT0w3bDg5bmRpQXEvRVB0?=
 =?utf-8?B?UmhVYUJCWnRjWTR3c1h2M2p4MnQ3QzMvT2U1anl6M0FDUHAwbjJUV1JxTzQ4?=
 =?utf-8?B?MkdlVWZGbEVUTStnVFNldUovT1oxQTJ0T2VqTU9NQU9oRWlqVEg0QWtDZjhM?=
 =?utf-8?B?cDRnYzJVWDV2Zm9MYUFDWWM2UGRwYkZKK09QZ0ZEcEpEVll3SzZoQzhVQWxJ?=
 =?utf-8?B?YzFmd00ybit5ZFNqaDUySjFBUXB1RnhJNmhreEIzUWswR0J4SUR2NGVvd0hO?=
 =?utf-8?B?dWNad2s3dUFCQy9ScG9wMXJhNzJQVzJIYU1qQzhMVnJ4RDBzV3ExOE1kWFcw?=
 =?utf-8?B?Nmtza0VCZGgySXJ1SlBUMzlEZ05xaDhjNnhnam80QlNGVlB1K2ZuWm9iRWtV?=
 =?utf-8?B?ekVUMWZZMDBXbWc2dUlMRjBMb0h3SkZ3SUZPMHZQZnNrRXBURlJZanpZLzRa?=
 =?utf-8?B?dGhFKytWNTVjZXM3RlIzMUorOEJNYzlWR1RFb2szT2VOdWJJTVFxMDFhWkhj?=
 =?utf-8?B?bHhGbzV4bmora3c4citreWVVWFoxZ3lERzNCWVN3dy85Z0xFNXozUm5PQWE3?=
 =?utf-8?B?M1BCRXF1bDN6R1l0STRaVDJMdS9iS3dxOUVwd3RrQkFEYXNHU3JtTzBkV3Iz?=
 =?utf-8?B?MGdnZ3VPWW5xK1hsVG1pbmhWYUJ4TmFWUkdROWxBSmNKcGMyS2hVVnlTOUUz?=
 =?utf-8?B?eWhXRFRJQS9NbWt1M29laU9ORW9vV1hDMWlObTl1N3JOQTA3KzR6NzRuQ1VK?=
 =?utf-8?B?N0tnNkU4U0NESnZya0ozYmpVQUtMcVh4RjVPdzJ5ZWQwQU1IZ3JzUDl6Yng0?=
 =?utf-8?B?ZDZneEVEczlydCtVYTFpUzQrWFZ1cm52Z2l2cXh6S0svQXYzYlhnZksxMzQx?=
 =?utf-8?B?UFdkT1k2VjYvZXpmaVBuNTFqSFZOVjk0MlBuNkZBS3hKS3hNbjg1UExWMWRZ?=
 =?utf-8?B?VW5vSHRkc1dJejRIaE0zV1BrR3JyU0MwU2YxcDZ1UnM0blk0S2ZKUEhicUJB?=
 =?utf-8?B?ZXlxU1pHSHRLNk1kYTViRGFSYUlVaE5rZ1ZiekJoSkZtTEIxUWI4T3hyT1Fy?=
 =?utf-8?B?RWlaMVZaWGhoUGEwbWtrTlJOWHhTZnM0Wk9Zam0zMjVnT0NtYTF1NFZNZm5q?=
 =?utf-8?B?akFzWnczdVVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(19092799006)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmx5SW1sVG1ZZXZxcmluZ1cxUlFsb0luU2lkSnlKSEtyamJDbDNaM1JHWnZq?=
 =?utf-8?B?Nk1EclZHLy9vSjFNeldITE4wUzRIeVVkSm1RQjhURk5VajJnYjlpeFBsQ2Nj?=
 =?utf-8?B?eWJGTGlwWXo5ejhqZFdoNzlGbDhVM3lwblFPVkJreDU1bkhOSXNHZkZCSHda?=
 =?utf-8?B?K2ZBNFFPUVhyeDZKdU51OEVscXBTSHFYMEVDRXR0cGFOeHA0bWJwVmpKLzVK?=
 =?utf-8?B?dGUrZkpDZlZFZTJxcTRQazRxTWorMkd5ZUkzNDdMN0pvQ3M4cnBMYW93Q1Bq?=
 =?utf-8?B?bVNqekllWnNaVnZOMjVLL2hmeFVoTEdwTGtXWUErc3BrSFcwR3p3cnUyVVBU?=
 =?utf-8?B?VjFpQWZvbWViVzkvOFQwRXBNcjM5SUk5bW1MeEZ2Uk8xSmZUS2NRNXJpNDRD?=
 =?utf-8?B?Wmt3d0VwYXZWMUFUR3IwR1VKdk1WTTRlRTlTUUlxbU5qVGVnbVFxdXM2MGU0?=
 =?utf-8?B?YmhTRDF1d0RVV0w3M2w1Zi8zWGErYUpEbFFHdzcyU25mdmVHS3E1QXZZN1FF?=
 =?utf-8?B?ZGFKSVZKL2oxci9UT3lOUEx0WWN4aFVEUGFYQ3RQOHNVY0ptRzhsbE10K3lQ?=
 =?utf-8?B?UlNxOVdkWEQ2bXhhdGRBdFRhZDlTUmhtcWNoSnJHNDhLcW53L08rOE9OWXBa?=
 =?utf-8?B?eXRobFpSazM5VzdhUldmV1doZmNjcldHRjNvVml4VmVydXNTWVUrak9leGN4?=
 =?utf-8?B?by9uSFpUdTJ3cDh4WXhxZ0xhTU5ONlAyS1U2eTl0SXNtYVNpUElYWENOcHQ5?=
 =?utf-8?B?enRWb2Y5ZVJweDBLdVdUSEh6S0ttUmJCcTJLQlhkNjFrNnN6cVhET0twNkNn?=
 =?utf-8?B?cS9ob2VkcWd2SkVuR3pobi9ZcE9qbld5ek8yK0hLWHJZZHRSNGV3bjBaNjBF?=
 =?utf-8?B?ZUY2djg4ejJwQXlKSWVaZG1lV25zRHpaNW5BOTFpZWlKYWZneE04NURMU1J1?=
 =?utf-8?B?Q0IzTUl5OFdpVW11NjNGVmw2QU1xOXZ6SmZXcjF1M0tEWFBQc1FROVlQNVg0?=
 =?utf-8?B?VW1IWDQ1TmJYOFVYdFMxR1BWWUJTVmtyTW1mb0xIYXpSa1BNczJHbTlwUHcy?=
 =?utf-8?B?ZTk4VGM2a25mQVR4Uk9HMXhXR0tjVHpnRDRtVnlLRlVRa01CS1Vyc25pSHFH?=
 =?utf-8?B?aStVMkgyTDlZOHRMTUZOTHRFa3A4a2RjVmN1K09RV2lKUkpKNUcya3Niemc0?=
 =?utf-8?B?QTN2VFZiRDZYS2RyWTBRL056QXBqQWJWcTB4Si96OXRPWXA3em9CWGtRdkRN?=
 =?utf-8?B?RHBTMHN1ZHQ2R0ZrVk5oL1ZHMDdDelJsRnVRcVhlVGcxQkt2WkJLczcwRmR5?=
 =?utf-8?B?ZTV6Rzc3L3UwV3ZJQkpRSjRUZXAwdVVRNUZFV2lvY3UrcGljM3BSTVp5SE9F?=
 =?utf-8?B?K0N4TU1sMUh0eEpFMytrZC9CYnhodm5Dem5EOU1nZnpYUlF0d2oxbUVHc3Vk?=
 =?utf-8?B?YXgzdlJsV0psKzgwbWxHSUtjY1V5NlBjUSsyVHpzS0tDYmttNkhoMjRtaThS?=
 =?utf-8?B?TEUraTBkT3FjTWhHclpWRm5LeHdBUG01dFFUaXhjWGwxRHp2SkdzNER3Ny9C?=
 =?utf-8?B?THlyR3lSSEVRYjY4ZytlSzRxbWtnWjZSSExKS0JnOEh4YnZ5TDE1eXl2b1o1?=
 =?utf-8?B?VDYwUytvekVLZDJ0WUpPVWNzT0l2WDRSODh3UnZjSjBjNlBJZDBMdGp5aDAx?=
 =?utf-8?B?dVVwdlo5VnNQQlRBWFhmZ0pqOGF6RWkyOHFzajVZelQ1VjBxbUdTMFZFVU8x?=
 =?utf-8?B?OWdJZ0ZEYldtUFFJeU85WXlPcE1zS1VQeEwwcmZQTlhNbzdRQXV5NUFkUkgx?=
 =?utf-8?B?eDRidmp2ZkV6VFZGZS9LZWFNejh6U0ZzcWxjWTB6TmFqNkw4eUJISyt3TDZt?=
 =?utf-8?B?NE03RTUyTUZ0MWdtV1JxbmJsTzFZWjkxY1cxdEpNQzNKYXhia2NTeVlGNlp4?=
 =?utf-8?B?OVhDMm1idEJsY3loeFBtZXZsY0Z4QS9vZ3lObEE4cFZ1VndPeXM0a0NaS1ZW?=
 =?utf-8?B?RmdYdWlHbkxtcTYrYnBRRk5LYnNWOHpUTVlKUXNhR05kQW9EQjVRT0tXZERk?=
 =?utf-8?B?VkN2S2loS0FBQVQvY2V2UHR3STN2MXk0NG5FeUFmSUFtL3Irem5yOHBRMzNS?=
 =?utf-8?Q?8jvEMIbh2T4qk2BvFKJ6i0s8+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab22a5e6-c4d5-43df-7463-08ddd3c22d81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 01:48:30.2616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvCDM3trcGHbb7REopLd93ShdfxiHCrZYA+Wn7/1HuMUCDC1R1scQ6Xp1NxFw/Ib4wf2Us4M8e2EfUtg/L1RJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
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

On 08/04/2025, Joseph Guo wrote:
> This patchset add support for waveshare DSI2DPI unit.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

I provided general idea and conducted heavy review for this patch series
in NXP down stream kernel. Yet some comments on patch 3.

> ---
> Changes in v2:
> - /s/i2c0/i2c/ in patch 1
> - Add Review tags
> - Link to v1: https://lore.kernel.org/r/20250716-waveshare-v1-0-81cb03fb25a3@nxp.com
> 
> ---
> Joseph Guo (3):
>       dt-bindings: display: bridge: Add waveshare DSI2DPI unit support
>       dt-bindings: display: panel: Add waveshare DPI panel support
>       drm: bridge: Add waveshare DSI2DPI unit driver
> 
>  .../bindings/display/bridge/waveshare,dsi2dpi.yaml | 103 ++++++++++
>  .../bindings/display/panel/panel-simple.yaml       |   4 +
>  drivers/gpu/drm/bridge/Kconfig                     |  11 ++
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/waveshare-dsi.c             | 210 +++++++++++++++++++++
>  5 files changed, 329 insertions(+)
> ---
> base-commit: 0952d89c3acf6590b89bcfb8505595d7c0e6f367
> change-id: 20250715-waveshare-dad93ea9980f
> 
> Best regards,


-- 
Regards,
Liu Ying
