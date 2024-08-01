Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6236943F60
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 03:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C3910E2F3;
	Thu,  1 Aug 2024 01:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="KtuOqTDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2042.outbound.protection.outlook.com [40.107.255.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BE710E2F3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 01:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfLeuOZAemKvAmNNdAUGUuh9W64kMVqXTXd54yJpQbWGvuufyM/zVSlfZviePlgMX2ta8lz9LSeZlm/GoA8tZKtH++xxHPASAy6zyfHu2rjL3w/idQzeDxBGEail65wHI83V9bZFZpsh18xwR0810yLwB7JQ1oU70vVg1zKhASMJx/fWyqQZ4fIa2E3xawAewszRGdcAVUoBfWoFdBF4Y9YyDxPyNODXXSBadQfOhponfUA+3aIPy7LdwOP+N5337MFA2pao2GQEKqfFEBSWOHj/Ie3WQEZI7TEjLEJl1mrUrWCPoC/ikN92c93iY5R9KPcFrZmP0rxe+XkYBGaltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MP4M7f9LqrzI3YhNxT/HmgZyCenV41ZxK5kOHXYKQZY=;
 b=EzqnxQESLzbcxK1jNKQr3guiX1+xGXw1p+j832HVvF9SLEz3ZNKh6Svuf/6LdSm2m0s+W+CRntrzfqgDo4MOsYGtG2G3nDMDz1W9JWg33dGd8s2qW1qsTUvrXc08o1CZHQH3p7ELh0O19ZMvr/5GzoXiOY9F2ctf58AUgkSjanWHcNFSLHtDHeHJ8/vgFrrJb4b6DqWD1jFtplf3cjuJJuFxDD5lrRD90AAFRw2b9xs6d7+fx5zvr363vqGzFoSAxGDHOHKGR1o1C9azOKrxiVvt+8/ZcwGE1iqTH2xUduacovbw77jnVpv242d/4BA0ak8j07OxIZVtw3Z5WD7JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP4M7f9LqrzI3YhNxT/HmgZyCenV41ZxK5kOHXYKQZY=;
 b=KtuOqTDOxJgI3QblsEei2WNG+3GF42yNohthFmgglq4eh8421p1hgZY1GQaO/JAo+s4wDoQieRUj3F4XuQuitnbhQc2hvjEtgd3OwmrTuEZ8qxfckrlxqw2B5Wsev/YmLZrbGbAINujLh1EJjzef7N7FDVigCLdD8ZpuTiEXg6B3ozuv0wvdyIJQEis1RgispO2FuLbuQFRDNsuDNMOKE9jhxFNk/uYqThk2ZgEMTAwD6I9Pzqxnjb+JEk8TqadGyzBhyyO/RrIDMqvruXt1WkT5NApO9ekLyd4B2+0+ev8YzyUAPBOr0xbWJUZn1a0Z3J4y0/y41mXfCHkJy1AI9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB5738.apcprd06.prod.outlook.com (2603:1096:101:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 01:39:36 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 01:39:36 +0000
Message-ID: <50a3b561-5946-45b2-954e-ea95050ba459@vivo.com>
Date: Thu, 1 Aug 2024 09:39:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] udmabuf: use kmem_cache to alloc udmabuf folio
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240731073752.1225177-1-link@vivo.com>
 <0fbca32a-d0e9-4884-9839-be1714543398@wanadoo.fr>
From: Huan Yang <link@vivo.com>
In-Reply-To: <0fbca32a-d0e9-4884-9839-be1714543398@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 943d2f1e-4c42-44ea-14a7-08dcb1caccc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0Ixb2VYbUNDc2VVZnFleGZVUFQrdGxpMlFtc3ZiQ0wxMTJWR2QyeE1Gbm0w?=
 =?utf-8?B?QVV3bURpeXhTbTNEdlQ0dnJyWFEvOTFiaGlSRUlRMlRGVUxuSUxVMU1PTGxG?=
 =?utf-8?B?aW42eFZQeTc5NEtTNTFnY2VUR1UzNXdQaHFOWTEyV003eGhOaDZ2dDB6dGRG?=
 =?utf-8?B?U0Fla20vUW41WHVXTXlJVVNwYWRzd1JsWnJScmRpa05aaGlEbjcvdmdFZSs2?=
 =?utf-8?B?WTJSN2ZMclVFUDZBMmVtN2I2akR2ZkpQNWhaaW5qUnQ0Q0lJTktiWFZGcFdX?=
 =?utf-8?B?cm94QmZCaFVEN2UyYU56SndOU0xVKzQ3N2NmTFNmTGJKKzZYQVJtcUhwWUxW?=
 =?utf-8?B?dHJJeUZ4WFdwd3Z0WTFDS1ZmN2g5Z040SFkvNUZQajVKUUErTG5DdkIwVUli?=
 =?utf-8?B?VHEwZ0VaKzdxUEVLUHpHYWdISXFKTldOcUtuaXhtMVg5aUtTU1FmZStaMmt4?=
 =?utf-8?B?VW1FbU1MU1NoVDZlakVXMnRYV2hiSDZJZHV5KzUzVHVaRlVlaDNmM0F0Rk1O?=
 =?utf-8?B?UHpTcU1hY1NMYzZsS3JRSmYvYWNYbXo4UGtLSHY4d25QdXlMaVJTQXRZaUU1?=
 =?utf-8?B?eHI2NWE1UlJTc1MyS21iYVNZMHVweUg1VnlxOUpNQmJJZlE4T0ZYQW5obkJl?=
 =?utf-8?B?Rit5OXdacU5qSDZDaUtINTA0ekljdUt2K2tRVjVDbU1LWTY3UjBxYnltSkJk?=
 =?utf-8?B?VEZQOWVaVXUvUkFneThEdWVEbThZZ2NaNFhwd2Y3VzVPQlV3cDBSbXJrTUR1?=
 =?utf-8?B?RlpmWUlFcWpzT1NjMVJGb0t4SUc4YWI3THhWMEt6S1YvL3J3QzV6QkVjNVRx?=
 =?utf-8?B?Qnc3TzlVZk5nclFLY2NJL3M4ZzR0QXl4N3VYL0tYQmN4ME90bVpjVTZFOFVm?=
 =?utf-8?B?UnY5YTEySUJCY1R0T3RJMWJ6VGdBZytIcWZZaXVoNFh2bjI1Y1FVMkpHRWNq?=
 =?utf-8?B?cjYvTk5YSFBnWDR3dFJTQUtMOXFNWVMxZElHTEpDekZHVXlmS2V0Y2FxNGxY?=
 =?utf-8?B?LzBQeU9wanlBS0l1eW84aXh6R3BTcVp0a3E5YXlCcmVuUDk4eW5QWjdxc2N3?=
 =?utf-8?B?TUhOeGJ4YmJiWGEvM0JrbTNEbFZtOFJCYndUdWR5QzlvUE8wOGdITjV5bG96?=
 =?utf-8?B?Wk84emhUMFlGcEJLOEVBU1pOa0g1cUZucGZ2QlFOOCt1Ymg2TlZPTy9yMlp3?=
 =?utf-8?B?K1pJVHZTMDFpclVwU0hwa1JscVM4WGJZLzYvd29lMWdnY1FvTXNoRSt3WTJ5?=
 =?utf-8?B?aGpUMVptMXBtazg5ZFFHT3d1UXdBYU1MUEkvYkxyNCt2eWsxNCtzanh5RXBz?=
 =?utf-8?B?V3BSNExwRkp1TlJnN3dqZjBuOFhLOUEvY05xRUFkYUg1aHRScGw4eXZyZ20x?=
 =?utf-8?B?SmZFNnM0eUtxN2dJZnh0QmtySlVKTHNaTVVLVGhLMGF4bGZubVorN3ZWd1c3?=
 =?utf-8?B?dTVSV0NORlZrSTMyMWRPajZJSWRnYjE3VGhwb0RkYi9Jb3ZiNzhtSFkwUlJX?=
 =?utf-8?B?U1QydkJOamJPK2ozR0JjaFdmcjNIenllVHFrWUJPSm9HZ0d4QmZDbWdaZmxF?=
 =?utf-8?B?YVRvWWpZSDY4UlFvNXQ5d3ZmTjR0T0VzRDdSN1Q5K3J6ejZNUDBBdDBFaXk3?=
 =?utf-8?B?MEYwUktoT3FxOGRmbWhvOUkyaCtNTGZLWHVHeWtQa2FyT21RS1MxUEFiWDJa?=
 =?utf-8?B?ZVNsYm01ZWxtZkM3cCtabm40N2wzbS9MajM5K2JXa2pTTURxMmhuamlibGR1?=
 =?utf-8?B?QUlPWUQvK0FXZXhUazQxbkRKZVZSRy8yTUI5RGpMdDZGSTFQZDVjcHllcDVN?=
 =?utf-8?B?Z25rbXJiZGpyVGZTbGdPdFdQQW1SWm5ieGVjL1NiWjArYnh2c0Y4aDlSZWhH?=
 =?utf-8?B?L25Za1hpSUdNYnNVQVhFcSt6QzRnTnozcUs5U3o5N0o2S0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFCWDR4dmVWVHJWNVFPUXdBWHREblJ2MEpHNGV4QXBnTnlxK3pXeXBWSnU0?=
 =?utf-8?B?cElmd3gxNHlOTFh6UjZ4aWFtRERyOWhHWE5zUVJrU2trM2xTNkx3ek1peVhZ?=
 =?utf-8?B?bWM3RlYybUxTSytpMGVFTHlOL2RZMEhiMmRkMWsrWDEvdUVMdjg2NlRrbkhC?=
 =?utf-8?B?WmlyWXE1dStwa243YjBaQ04wV3BIUTNNQnhPUm9yL3ZsTk9LRFdwYWxBajBp?=
 =?utf-8?B?VEpNUWJHUHhVOFl4Y0ZqY3krYndNTkdHSWNUUi94VEJGbG0xQVFPN0NmU085?=
 =?utf-8?B?M2E4ME1QOTZJQ0Vjb3RUNnVwMUV3NW1rbTlQU3oySWN4YWVBNnNIVFZBL0NF?=
 =?utf-8?B?a3dQV1VWNm5KU3VhNmNFWGpBS2ZvQWZqMGdNZDY1WDlMTlpQSlBINk1UeGR0?=
 =?utf-8?B?ai9lWTVtWFJaZEhvRXdnS0lxdDJwV21nZkN3ckMzYVpkdFdLRkZuSVBDQTNI?=
 =?utf-8?B?TjRVb0wxVFc2R3M0aUwvdXJ6V3BrOFRTQzNLb2lpNytDVE5vQW9ycmpPYUpX?=
 =?utf-8?B?bnhMcmJ2TnBiYXEwOGxqQ3NJbnV3eE42cVpid28vRkRlYW5YWHFPWVBqbGZN?=
 =?utf-8?B?UzZxNFU4MXRCYlFkbUpyWDhXeHFiNEpQNVdVck9HRUFvTUg3dXBBQlM2NE9T?=
 =?utf-8?B?ZUlYZmVLRW9UU0lNNjBWOTBKZFVCV2kvZlFYMlNvY3lwdXRmcVFPd3QxUWpC?=
 =?utf-8?B?M1VBbDMrS25Vbm1XTUVORXdsd0FwVk0yYnhrbHV5Q2pEbUlhSTdDK3R4R0Nq?=
 =?utf-8?B?eHdReE1WV3ZhaXB1K29hS0cxcFRCemY5eTBla0t5ckFFYzM1VEF2c1ZzRWVj?=
 =?utf-8?B?ZW5GSVo5U00yVzB2WngwdHdOcExnaThnVGV3WVZlM241RThBYkFMcXBSc0xB?=
 =?utf-8?B?UVRmT2xzUHUrQS84UDBQaFBHSmRWV09DNmg3WnVJQjh3c2RnV0k0bjIxV013?=
 =?utf-8?B?ZHFRSE5adHBya216bjBJNGdoQzQxTDVIUTJyRXh3VWZBdnBJVGxmbld0Kzkz?=
 =?utf-8?B?VG82Q3dLQ1N3UkZQUVNpNGY2VDFTbXc5Qm4wcyttaVJSTUUyZk9VYnI5YXM5?=
 =?utf-8?B?aVcrMm5LZ2FNNGNuOWFVTnhxY081eVkxWHJZRDhQbktWWXk0YkdBR0NRRThP?=
 =?utf-8?B?VkJxeE5oTUx5SkZTYzRTelJjUjl6VzNibysyRk9yUHFJUnhibzdDaDVtUnNE?=
 =?utf-8?B?cU5odWtpTmNFcWJueUZqVWFIMS83TWczdE05WmxwSlhGMi9XblZ0eWFsRi9X?=
 =?utf-8?B?NSt0bUZQaUFRaUk1NDJWajAxM3NHVkZWN2w1Z1MyRlc4TVJkUmY0Wi9xbSt2?=
 =?utf-8?B?Ums1ZmJVMW9lUStjcmtpMlJXSzMzUFZHNkNSNktqK2hnK3g2WVh4L1NnQ2VQ?=
 =?utf-8?B?NkFjR1NkVS90UG1WY0NSc3V5T3BPeG15VVdiRVZKUCsxT3ovcTgrcXFudFZM?=
 =?utf-8?B?ZWg3d0UvNVlQMUMzek05ZFpFQkRPUFNVWnJiRmNLRGlkRGVCWVZhdTUvbmh3?=
 =?utf-8?B?RG9XNnpUdS9naUdQVXBkRW0xaTVTcHpYeS9WREZYa2ZnK2tBcTRIYWQ5aytS?=
 =?utf-8?B?TW1QYU5sRWFqdjBZai9UYmErcVRncDNYam5zbkFHY1ZaQWI3Uk5CNFBTV3ZW?=
 =?utf-8?B?Z3Q5djJPUkFxbHBPcVNCMHZsNHBHdXN1a2NvL1AwMzlucld6MCtQWXJHNUR3?=
 =?utf-8?B?WUtJOEg3OUVZQlpkc01JdmsvNThUbVh1bjhuOUphUyswaU5aTk5Vd21JeXpi?=
 =?utf-8?B?eTNzVkIyMGJ3OW5tcFFmNllic2gyU280cXVrYjk1azJaMGU3ZERhcVRpcWFl?=
 =?utf-8?B?cEUvZGJRelFUZWtsVkFlZ3JmUmlXd2FMSnppZUd2T0ordmhWS21vRWtwcU5x?=
 =?utf-8?B?bXF4TGJUQktMQkw3UlZpcytROVdUL3RGcUVZNVhRMzlyTVRVcWlwVi9CZXdQ?=
 =?utf-8?B?V3RjVDgyWWRVaHJoSzVmZFNnM3RHWkhxR1NLWDFEdnRTaEFUdnlPc3BRY0VZ?=
 =?utf-8?B?ckwyMWVXcmtJcEl3RVYwa3JZbnNGWlBlNHlFRXNnWG4xcTFCV0NRTGFKYkgv?=
 =?utf-8?B?Qm0zeHRMV2lLOGZWY20wM3JFd0svWTBYMlhDMzBMZDV2bWxQOGpTeEhVaDVG?=
 =?utf-8?Q?yrIvE5ZVTKT60nBcPu14ioP11?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943d2f1e-4c42-44ea-14a7-08dcb1caccc8
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 01:39:35.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5boSIwUQpWRu+RKAx96RJAxypMZfoFcp4wW4x0QKlKxanOX5Wq+yT3hU6MNVm721Aq01zmlQ+b47lBu6zIFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5738
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


在 2024/8/1 1:11, Christophe JAILLET 写道:
> [Some people who received this message don't often get email from 
> christophe.jaillet@wanadoo.fr. Learn why this is important at 
> https://aka.ms/LearnAboutSenderIdentification ]
>
> Le 31/07/2024 à 09:37, Huan Yang a écrit :
>> The current udmabuf_folio contains a list_head and the corresponding
>> folio pointer, with a size of 24 bytes. udmabuf_folio uses kmalloc to
>> allocate memory.
>>
>> However, kmalloc is a public pool, starting from 8,16,32 bytes.
>> Additionally, if the size is not aligned with the kmalloc size, it will
>> be rounded up to the corresponding size.
>> This means that each udmabuf_folio allocation will get 32 bytes, and
>> waste 8 bytes.
>>
>> Considering that each udmabuf creates a folio corresponding to a
>> udmabuf_folio, the wasted memory can be significant in the case of
>> memory fragmentation.
>>
>> Furthermore, if udmabuf is frequently used, the allocation and
>> deallocation of udmabuf_folio will also be frequent.
>>
>> Therefore, this patch adds a kmem_cache dedicated to the allocation and
>> deallocation of udmabuf_folio.This is expected to improve the
>> performance of allocation and deallocation within the expected range,
>> while also avoiding memory waste.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>> v3 -> v2: fix error description.
>> v2 -> v1: fix double unregister, remove unlikely.
>>   drivers/dma-buf/udmabuf.c | 19 +++++++++++++++----
>>   1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 047c3cd2ceff..c112c58ef09a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -24,6 +24,8 @@ static int size_limit_mb = 64;
>>   module_param(size_limit_mb, int, 0644);
>>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in 
>> megabytes. Default is 64.");
>>
>> +static struct kmem_cache *udmabuf_folio_cachep;
>> +
>>   struct udmabuf {
>>       pgoff_t pagecount;
>>       struct folio **folios;
>> @@ -169,7 +171,7 @@ static void unpin_all_folios(struct list_head 
>> *unpin_list)
>>               unpin_folio(ubuf_folio->folio);
>>
>>               list_del(&ubuf_folio->list);
>> -             kfree(ubuf_folio);
>> +             kmem_cache_free(udmabuf_folio_cachep, ubuf_folio);
>>       }
>>   }
>>
>> @@ -178,7 +180,7 @@ static int add_to_unpin_list(struct list_head 
>> *unpin_list,
>>   {
>>       struct udmabuf_folio *ubuf_folio;
>>
>> -     ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
>> +     ubuf_folio = kmem_cache_alloc(udmabuf_folio_cachep, GFP_KERNEL);
>>       if (!ubuf_folio)
>>               return -ENOMEM;
>>
>> @@ -491,11 +493,20 @@ static int __init udmabuf_dev_init(void)
>>                                          DMA_BIT_MASK(64));
>>       if (ret < 0) {
>>               pr_err("Could not setup DMA mask for udmabuf device\n");
>> -             misc_deregister(&udmabuf_misc);
>> -             return ret;
>> +             goto err;
>> +     }
>> +
>> +     udmabuf_folio_cachep = KMEM_CACHE(udmabuf_folio, 0);
>> +     if (!udmabuf_folio_cachep) {
>> +             ret = -ENOMEM;
>> +             goto err;
>>       }
>>
>>       return 0;
>> +
>> +err:
>> +     misc_deregister(&udmabuf_misc);
>> +     return ret;
>>   }
>>
>>   static void __exit udmabuf_dev_exit(void)
>
> Hi,
>
> should a kmem_cache_destroy() be also added in udmabuf_dev_exit()?
Yes, thanks for point this.
>
> CJ
>
>>
>> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
>
