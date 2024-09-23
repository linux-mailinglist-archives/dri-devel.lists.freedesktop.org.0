Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0F97E6C2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1387910E090;
	Mon, 23 Sep 2024 07:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="VamGx9S1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FDD10E090
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 07:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkOCv6QtL4waxUMyia52NYlbi/01b5wQm45HsnT+5mozTUkvXDoIERPI/Xunu74PqrhTnbIS8merWiylhkl7guRx1KTZzTekmUtLws4No7TKLQim2NLlsljlV7OZvXcoPBcmvThwFGAvOMhhap4PtL3jMWP1rHlwG5TwCi0lHU54p/lcJ2vHDaEvyuONVt4ayBA+lnmy8uGauA9g96xdOfb/rnbQUXRBrAUIWHAQQFwQxYA9G9xd7FqFcMIL1EUtxcPfxKa5xtB4zJhWBmu/Uq7XZUW2fymhL96djzv2n2QCn9FjXScB6cpE5uL9ZtQB7ZiCRZGB3zOy0H1I2OmUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppj9xmuaFenMdlRnYYl3M0Lrm0YLGUaxmoigD5SlCbs=;
 b=iC1Zv822X0TyvfrVSfrRXaP2oTyGbjZcUuQ479DvEHHALppord6KBZpOJ61/1qiF55/7b2Jbs9HL1MGhe8KtFmf354QB/jiy2hUJ8YCkZZLzZz5czhLZUzKv/036zv5Ggo9uFxnGQTiRCfCnfYnzAaoXhDyPeSPr7/An9R04qBDawGOO8sVT3295SAeUQk8kgUCa2eBzxZtN6ue0uROJDkbNaFEb+2TqNgvxs4P9n/LUD0KB7Ug0EFbxFHUtNzcvztGHj9RzMPlgnIcfWzee8YcqjR2EkDyD3qIjPwNBAfd8f/sQfiG9O8mVzcWZwzMRSqoN2oYBYdXzMKS7KwLkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppj9xmuaFenMdlRnYYl3M0Lrm0YLGUaxmoigD5SlCbs=;
 b=VamGx9S1SGWXLHLtop15T/b29b9zF0VPUwSvTDEYnKLe3rNIZspB2Q5W/EIYLtRv91CLLlo0hulJLa9yOs+gsoF09kAnR2WhOVWjSYGJhczKVQxCZ/ZExQ30QHpF+9ki84dAqP2xvkL5jIlLLGUQCZD0t2jngfbmpMdAkvzhSwYHH2zdb8bexSO6HGMdG5sUUa5z5pDTtgHIBfdA/LMbYy9Fj7e7hsCODqle46UwetELt5dnRYGdYQ/fMATtxbHuqJF9BFOhltYhZ3+r6g+A8Yvr6t3EGdwdp2m6r4m8S2fCiUyAioAHSMLk4H5YJ4LwY8oiLhAeOv3PHsdYYHT+QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB7827.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:628::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 07:42:29 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 07:42:29 +0000
Message-ID: <9b0e99f5-554b-428f-856c-cc32f4520c73@siemens.com>
Date: Mon, 23 Sep 2024 09:42:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
 <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
 <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
 <5bb0459a-ec3a-487f-a9b5-28ee643a1215@ideasonboard.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <5bb0459a-ec3a-487f-a9b5-28ee643a1215@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: daa42d53-e491-4d9a-96f2-08dcdba346d0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWdGTjcyZk96TVJqeVpLekI5RUdQQnFxSGx4MHpzaW9LMkRnalpQek9YSWR3?=
 =?utf-8?B?c2hrVmM5N1lNQ0p5RUxBVmFweFQyY3NQakNDeENRczRSdzVHTXBPN0txbys4?=
 =?utf-8?B?VVZNc0ltME03Q1M4UXdTaDU4R3dZNFZaT1k0ek14N0RBWW9wb3FzZnRiWms4?=
 =?utf-8?B?MXoyekI0SzZZajRBQTBoTXBYS1JvRG15OXc0ZHMwVnhHbVkzVzVndHo3Z2RH?=
 =?utf-8?B?bHVoYVZWYi96M3NzREVPS1pFQ29KNGJkYkU2Uk9wVEZjdCtqeXVvSG1lbnRt?=
 =?utf-8?B?Zi90QmxmbVlIQWFERUtnanFzOXExZ0VIM216b3pjbVBuRVY5cDcraEIrd0w5?=
 =?utf-8?B?bmFWRjlPYmU5c0dreHMzZGhNOGJsM29tLzlXN2t6eGNEVTdTYXdjekpwZlNU?=
 =?utf-8?B?VHdHWTlqUGtUU2txM2hIanlUNjR6R2RtNldRVTBTZUZtcnE1OVYyT2xDcHoz?=
 =?utf-8?B?R0I1ektxcGlPWmVNNzQ0VFJPK0lBZC9wb1BMS09FMjFWdlJDcGl3ZXkzUHgv?=
 =?utf-8?B?Y2lJZ3NpNi9XcFBBZFlEcWVKZ2JmQTRzNnFFWDlRMEkwcTRrWTdqUDdtNmFU?=
 =?utf-8?B?SFozREFURzI4ZnpjeTRNUHNnaXI2aXRLaFhVZ0ZDNHlzYURYS3p0QU16VVVu?=
 =?utf-8?B?TFVtbm5JUFlWSmpONTMwK2tIOUVzNkFzTStQNmZNZFhlTWI4REU3cmRzZ0FW?=
 =?utf-8?B?cVZvMytVMldmWWViVEllckE5S3l5Tm1hS3M3Vk1Sb1BxTTQ0S2xONlVTU3NM?=
 =?utf-8?B?L0VSUUlsdHhlT01JVUNXdHd3YWVzeFRRcEw3ZDFHR1g5bmh5bi9mcE1vNkU2?=
 =?utf-8?B?YmEwZ0VoWFRFbW9vWTJQQUxISm1Lblh6OWRsMUIzVU1mSFBBRTNwTDYvT3cy?=
 =?utf-8?B?N1RTa2lsSVdBK2dKTmdSU3VYZjJYdnNmS1EwbW9kaG9YcXlJakJ1eXJWT3pH?=
 =?utf-8?B?bVdNVmVZUVlGdjVYcTl4UmV3QVFCVUgyTUJmdjNLZm5SSU5IVkxseVB0V01W?=
 =?utf-8?B?bG16YU5QU2R2Q3kwT0xIRlVjalpVdGtxbk1iQmFDUU5RTkJlTC93aytUZTZy?=
 =?utf-8?B?aUFFeCtQU2RweEphSzh6ZWJCNXlvdlBYZ1MyelI0VmE1a1A1cEJoanYyZ2ZR?=
 =?utf-8?B?eG9HNTRjb0ZENHpIUnlaRGpjVkxtM3NXK0hqRmcvYWM4cmxTQjh1elcyYlM1?=
 =?utf-8?B?L2pGYmsycDRqOTJINFkzK0ZRYmd0S0NWYmttZ3pqZ2FHSFI2d29TcFJNTUM0?=
 =?utf-8?B?Wm1rMzRxUXlVWHNUdzBkR2NQRHY0MVl2YTBNUGI0QjNZT1AvdjMxTS9nNi9M?=
 =?utf-8?B?aFgyL0RaQ0dQOUNDMG1TSUd2NkpoVUZhLzNXTElrRUpKcnRrMkZ0bE9BWXJE?=
 =?utf-8?B?d0dLenNidG1nSTFCVDlwZ3JoOUsyc2tiTnJHM1NpYU5QTk5DVUxDZWdnUGxK?=
 =?utf-8?B?bFp4NUVwTENOL3lORUhpUm4vU09FR1I3d1hLZFBWUEg1NXE5RXlRTjRncmpF?=
 =?utf-8?B?Wk1lbk5NV1NnZ200T2JJTGdMbmNUaGZHMUdERnV4ampCU1MrdXlhUlVzUUhu?=
 =?utf-8?B?RTZXaG9uSGk3OVVYSDhtNUV6RmtzR2lXbWJJb0FYZGJJNEMxN3hJTWd6S1Q1?=
 =?utf-8?B?ZXBGc0FLNElwZjBxcDVVZVpqVTZpSGFVTjQ5OHg4OG9TSG9ZbytYb291bDJx?=
 =?utf-8?B?c2hzOTBka2VJRlRGdFVicnFWbC9DOXZmRkFOdE9mVmp2Q3loUnkxZWpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlplNEdKVGlmOStsdEhab2RqTFNDc2xZQ1RhbHBjMVJja3dIR0o1cm5pZHZD?=
 =?utf-8?B?blFYRkxGK0pQL25TR2JMaWpRWEs3UkVLL1UxT1JObldYWTloYWpyYjhUOGMr?=
 =?utf-8?B?MWhGSHkvNkhBKy9uQXc4alZOUmUvMS9QUXovU3grZzVtQlJvSm4xOEhPM2p6?=
 =?utf-8?B?cnBNY1FURUo2OVp3WDJCSHJvakh1Ny9xbE1iUzdFaXhleWIyeTZTQTNnUGFH?=
 =?utf-8?B?NlRxUFI5bmdpOUorZ2RWZ2FiMHIrMkc4RjlUcFBVangrNWhPOFEwbE9jYkVO?=
 =?utf-8?B?OGJTT3JmYzdLNEZTVE1NZzREUUNUVXlpT0dvVEQrV2UyYmNTT1ByVnQyUDhS?=
 =?utf-8?B?Nnl5NEV5UUg5V3BuTVhKWXFGYS9qVFlpY2RUMDZ2VER5ck8wcklXYm03RXZl?=
 =?utf-8?B?ZXJDNlplVS83MitmeGFwb1FzaDI5YlhKTjdOQlBTMTRlUHVNRHZDNzVpdXdy?=
 =?utf-8?B?L0Z2eDJtTGlUZzMvV0wzS09BcTZxR0xKblNHNUZkaHpBU2JscVd4Z2oxUXRT?=
 =?utf-8?B?Z0dwTDFOL1FtZ21qRWhrVmtDTGVNUWhvaUxiOE5DY0hrRHhEb2h4bHN2VjY1?=
 =?utf-8?B?VElpTXpwRnpEVEhMZE9BMGdPU1ArQ3lXOTN4cjZPTEtvUWMvck1Xd2ppRXBW?=
 =?utf-8?B?LzJRb2tFL1NPY3djWm5USUExOVM1NVI0WHhjUHJCL0FHRWluRnZNL2JHREll?=
 =?utf-8?B?M3ZESlBLdGVYblIwcTlVVytBSzNyeHJmbW90Sm9VTnJ0bXRrQzNWMFVQbVF6?=
 =?utf-8?B?ckdzRzVORHg3OEJvbHU5dE0zbFEyVFpsZ3RsRG0yQjM5cEpwYWtBWmlSbHRR?=
 =?utf-8?B?NXAwTW9WbnBjZXpTc0VMVVNLZzhrK2ZMNjVBNnYrNG52TjNNSzdOK3kxUWFz?=
 =?utf-8?B?ckxLN2doV3A0UXRsbHA0dERuVEZDbVF3VHpRUHcyMmFtTVpUK3dzRm1heUsy?=
 =?utf-8?B?WmJmZkpMbTBSNkVzdElhb3JwQ21FakFUQm42cWpudmxxUkJ3bGZYZVk5QUIz?=
 =?utf-8?B?T1NLSDRRdUlJSXl4Z1ppTlhxcjViSEd0NS91cEJvWWhjZUw0RFBBMWVaWFZp?=
 =?utf-8?B?Z0Fpa0ovcm85dUJNVnhBdlgrR2NsQWtIWTc0OGE1czVkUEJ0WUNKMldtUTNu?=
 =?utf-8?B?UHN5RU5KYW5zNGFHbnovS0NWR1NNNjlXWXZzQ1Jrd3REbWk2a09FL0x0aXI5?=
 =?utf-8?B?bjJuRzllYzk4L0s1TU50SmY5TDA4V2NzQmpCbGx6SEg5cEpwRitDZnRjdHJO?=
 =?utf-8?B?VlZaMTlwbnRoN1VORHRxQlZjQkovTzY2RXlVcU1iNEZnaG9EMTJWa3lLWGt6?=
 =?utf-8?B?S2prdVlkd2RWNmFjczFpbGsrb3JsbWlzYTQ5N0V5Ty8xd05QYkZkRWNHc2lh?=
 =?utf-8?B?eWlLUmQ4MldPZ0FMVkZ1SDBiVFlTTE1JOGp1UzJ0alNlM0Z6RFM0QXVONWZL?=
 =?utf-8?B?d05FdEg5bHhIWHVoSHZrZTJOU3BFbE1hUkZiYUh2eEZPN2llaWxHSWIySkc0?=
 =?utf-8?B?ajRYU1AxN1FaWldxeWgweVhkU0cvREMyVGt4R0hVQmRNSWQ2MnFxcXYraFd5?=
 =?utf-8?B?V3RmRHo0NHE0eE14VzBFM3hVa293UWtCeEpUUGc4c0JYTm1yWUIwVmNXUW5t?=
 =?utf-8?B?eU41YXcxc1pWYXFvMzZNY3krUHM5UjBLUjU1LzZYZmFrWS9tdUhGOHJsWEZx?=
 =?utf-8?B?K1RWblNReHFiSEsxa0VxazBBN1lJSlE5T0lac0o3ZWZXQWtqUHlBQ0tJbjUx?=
 =?utf-8?B?L3BxUmdxNFNibkN2Vy8rMzlBMzIxczZVMEVJUFFVd0JMTFdYaTBFTzg3UHZD?=
 =?utf-8?B?ZTZWM0JLNC9rRFdUYkUrTXFrdjJBWlhVSXpjNlJ1Y1c5ZXdQVk42K2dCdytz?=
 =?utf-8?B?ekF0S2ZQckcyMHZ4ZGpKak0vc2xaOHV1TCtWMyt2NlJQdEdPVzJFSFJ6amtL?=
 =?utf-8?B?OXZlUEZHWDFSbEtGNSs5bnhSK3JnS21lZG03dDFEd0REZ2haVjAveVBpbEE2?=
 =?utf-8?B?dUVTZ1NtQlNUNjdaMUZITFltcnFKUmsyU2tXK0k4ZThQY1pBWWFwOG9uRHdX?=
 =?utf-8?B?cFlNVDlPeVdLRmV4bU1pckdMeHpMQ2VDaTAzRU13eVV6NFR0MHF5cHZ5bHhu?=
 =?utf-8?Q?PPxrBjGXT9satFD5J7S75ECU+?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa42d53-e491-4d9a-96f2-08dcdba346d0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 07:42:29.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5PgVczKkjDsLfJsT95y8eH54Vf0gnXJubS4JOzeWSiqm+WvGxix5JMBZHZWCMhhK075rsmxJ5dmuKJjJlF3aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7827
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

On 28.08.24 15:32, Tomi Valkeinen wrote:
> On 26/08/2024 22:35, Jan Kiszka wrote:
>> On 24.06.24 12:17, Dmitry Baryshkov wrote:
>>> On Mon, 24 Jun 2024 at 13:07, Alexander Stein
>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Am Montag, 24. Juni 2024, 11:49:04 CEST schrieb Dmitry Baryshkov:
>>>>> On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
>>>>>>
>>>>>>
>>>>>> On 22/06/24 17:49, Dmitry Baryshkov wrote:
>>>>>>> On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
>>>>>>>>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
>>>>>>>>>> On 16.02.24 15:57, Marek Vasut wrote:
>>>>>>>>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
>>>>>>>>>>>> Ok. Does anyone have a worry that these patches make the
>>>>>>>>>>>> situation
>>>>>>>>>>>> worse for the DSI case than it was before? Afaics, if the
>>>>>>>>>>>> DSI lanes
>>>>>>>>>>>> are not set up early enough by the DSI host, the driver
>>>>>>>>>>>> would break
>>>>>>>>>>>> with and without these patches.
>>>>>>>>>>>>
>>>>>>>>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>>>>>>>>>> and DPI, so
>>>>>>>>>>>> I'd like to merge these unless these cause a regression with
>>>>>>>>>>>> the DSI
>>>>>>>>>>>> case.
>>>>>>>>>>>
>>>>>>>>>>> 1/2 looks good to me, go ahead and apply .
>>>>>>>>
>>>>>>>> Isn't there any way for the second patch to move forward as well
>>>>>>>> though?
>>>>>>>> The bridge device (under DPI to (e)DP mode) cannot really work
>>>>>>>> without
>>>>>>>> it, and the patches have been pending idle for a long time. =)
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> My local patches still apply on top of 6.10-rc4, so I don't
>>>>>>>>>> think this
>>>>>>>>>> ever happened. What's still holding up this long-pending fix
>>>>>>>>>> (at least
>>>>>>>>>> for our devices)?
>>>>>>>>>
>>>>>>>>> Neither of the patches contains Fixes tags. If the first patch
>>>>>>>>> fixes an
>>>>>>>>> issue in previous kernels, please consider following the stable
>>>>>>>>> process.
>>>>>>>>>
>>>>>>>>> If we are unsure about the second patch, please send the first
>>>>>>>>> patch
>>>>>>>>> separately, adding proper tags.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks Dmitry! I can send the patches again with the required fixes
>>>>>>>> tags (or just patch-1 if we cannot do anything about patch-2).
>>>>>>>
>>>>>>> The problem with the second patch is that it get mixed reviews. I
>>>>>>> can
>>>>>>> ack the first patch, but for the second one I'd need a
>>>>>>> confirmation from
>>>>>>> somebody else. I'll go on and apply the first patch later today.
>>>>>>>
>>>>>>
>>>>>> Thanks Dmitry!
>>>>>>
>>>>>> However, would it be okay if I instead add another patch that makes 2
>>>>>> versions of the "tc_edp_bridge_funcs", say
>>>>>> "tc_dpi_edp_bridge_funcs" and
>>>>>> "tc_dsi_edp_bridge_funcs", that have all the same function hooks
>>>>>> except
>>>>>> for the .edid_read()?
>>>>>>
>>>>>> The dsi edid_read() will remain the same, and Tomi's patch - patch
>>>>>> 2/2 -
>>>>>> will only fix the dpi version of the edid_read()?
>>>>>>
>>>>>> The bridge already has the capability to distinguish a DSI input
>>>>>> from a
>>>>>> DPI input. This can be leveraged to decide which set of functions
>>>>>> need
>>>>>> to be used without any major changes.
>>>>>
>>>>> I'd prefer if somebody with the DSI setup can ack / test the second
>>>>> patch.
>>>>>
>>>>>
>>>>
>>>> Now that my DSI-DP setup works apparently without issue I could test
>>>> patch 2.
>>>> Since my setup does not use DRM_BRIDGE_ATTACH_NO_CONNECTOR (running on
>>>> drivers/gpu/drm/mxsfb/lcdif_drv.c), I can only say
>>>> there is no regression.
>>>
>>> Let me send a (non-tested) patch, switching to drm_bridge_connector,
>>> then you can probably test both of them
>>>
>>
>> I suppose [1] was that follow-up, just not leading to success, right?
>>
>> Now, what's next? I'd love to see the regression we have for the IOT2050
>> devices finally fixed, even if it now only requires a short downstream
>> patch.
>>
>> Jan
>>
>> [1]
>> https://lore.kernel.org/dri-devel/20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org/
> 
> I have to say I don't remember the details for this anymore, but half a
> year ago I said:
> 
>> Afaics, if the DSI lanes are not set up early enough by the DSI host,
>> the driver would break with and without these patches.
> 
> I'm not sure if that is correct or not. But if it is, then, afaiu, this
> (the second patch):
> 
> - Fixes the issue for the DPI-DP use case
> 
> - Doesn't cause issues for the DSI-DP use case without
> DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per Alexander's test)
> 
> - Shouldn't cause (new) issues for the DSI-DP use case with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per my code review and guessing...)
> 
> The third point is somewhat concerning, of course, but do we have any
> setup with DSI-DP and DRM_BRIDGE_ATTACH_NO_CONNECTOR that works now? If
> not, maybe we can just ignore the possible issues, as this fixes
> problems on a setup we do have.
> 

As Dmitry asked me during Plumbers to revalidate if our setup still
needs patch 2, I just did that over 6.11.0-next-20240923 (where patch 1
is now included). No surprise, it is still needed for our iot2050 device
series, otherwise the display remains black.

Jan

-- 
Siemens AG, Technology
Linux Expert Center

