Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819C919FAC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 08:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441610E0F2;
	Thu, 27 Jun 2024 06:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lRK3sZe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0710E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL4lYBfdq11US0uFE8u3uFyD1DmALQ6Y8Z8sBQHranNx6Qwtvn16HxOlniOFe2zI7kgrt2q9rBC8IkxbqqMhKyb8McjL9cRpmCHvRYn2YUNK2Zyok9VKp4GayxTeMqYMuXCkgR5NVDSasUpsiJfZ+olIZWKQGgKBjb2IyYn+mQ3eme9BX6+iKTudQDvURK2rL1A79hV7towknhLAn7VdHkWlIsS1xh2/683ZQt3NdgOnkBvgsUwttCWTcNGI3MzmlOma8tg0iOYKgv5fQUlFm7rEnr6xyNKAdemByNJk8zbkiNM6DcEBuFPt4Us7+FJAe2udFQmRz23VXW06GKbBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak3qtKiezV5RzRokj7/sfSKkVFJIvGj7jIBqMrXtu80=;
 b=Ub8io2TqnvMyXAG1tS1nfWgNSBfKV9oIO2tGxmUay5dSdNGw6a+zQzGojBvc5LTvOoqp5ljyNK7PJvq5gRY7+ho48lGlqx4ggaGT6BtdHkldllNCyerrtKOxRQcPebC6JcQsdchwcAZWMGsFjwCOmnCcNHquByavtwjfcj1Gs72sFPXvTrMU+2wpWR+Q0qP4S6OODXudETIYo5Hiiy6F0pQXG8RAbD1crCbKf2/7v9Ruv3Xzx9xFpuieUK5kyP9In2iJfEV10a9/mVhFTivVxqfZEMf9bUjiV2XDUgfVgNpYDTAkYVd8WibLivdX94lu38z/jeWuIkJOvUter+f4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak3qtKiezV5RzRokj7/sfSKkVFJIvGj7jIBqMrXtu80=;
 b=lRK3sZe1n6TU6G1ijwD8aJ/PKJvmp5FVK35NVCAfjnR9w6xeKatq6wjpkOKEZfp3CPj+Vri+vPV/zutQz4e39GKjqPG5yf/KZ4LCZ3MGJgRZB4eTZDhsclb5k2WpR8+babO7GnkouxYu55FI6tfv628fdIFhDwb2192nGnWZrQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 06:57:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:57:51 +0000
Message-ID: <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
Date: Thu, 27 Jun 2024 08:57:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: d852d205-bfa1-44e1-af8b-08dc967675f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnYzWkVCYTB6NldoN1dzNFJVdWRscU5vR3NkZW50clg2ZUtwMjkrdG1rZjFl?=
 =?utf-8?B?cmNDL0FtaXlGUHNPb3lnRVdXR0xvdjdQcUdsUjFVT282WHZSS1U1U21oeGxj?=
 =?utf-8?B?YXJ4czBVekI0WW9kU25YQ3lNWXhjSzdiZVZQZWQ4MGxBTmhlZkVGK2FVMVFK?=
 =?utf-8?B?NlhrbkUxWTBMajZ0bGZHQ2hNVERUSFZsM1ZPUWVqTnR5dkROcGVMV0srNmdN?=
 =?utf-8?B?SXNjNEJVbWlDYmozMDY2aHNGNkd2WUs3T3VwdFVCQ1R3U1YvaDVDUkp1SFAz?=
 =?utf-8?B?K0VzNXo0QzdVZzN6TWlZV25GQ0tBcG1xMUZ5N0VITExxdkxjZ1hlcW5XMFUr?=
 =?utf-8?B?Y2FyMWpnZHVxOEpDSm1rRElEcHlMcDgrUTMvMFBDYlE0bGpXeTY2UXpXbWRW?=
 =?utf-8?B?MlpWVGdKTEY3YzA5ZDI2eVhnU3pudTZGb3NhR3ZQMDBXRVkwUmFhRzFHa1Nr?=
 =?utf-8?B?ZXZ3aGZQVGp1RlNOdUR5cXdHRklOR3pwK2NjMDhMV29GeW0rUWZ5dHJCRVB6?=
 =?utf-8?B?RDBBSUQ0QW55Q3p4M3luWlFsYmZHMnJmUnd1MWJpUnlHK0RIeWIxZkpqMjlX?=
 =?utf-8?B?UEJKTEVmZXVkV29wVFJtaW1XQjh4N0w5NFpnb01GUlhoT2ZGQWFha3RSRjl1?=
 =?utf-8?B?RERLY1FadHpPbWhlamRMR3c2SkVyZDlwVW9sZjFFK3ZIRUxNdERRbDg4SzEz?=
 =?utf-8?B?M3lRQnF1cStJSHY1ZnlWa2lod1daR20zUkFHak16UG1kcEhrd3J2NVVPZnAr?=
 =?utf-8?B?RmxDVE5Xa1gvWHE1RHc2MU9EaUM2RnhNdXo5K1VSRWRvb3Zsb1Yra2dYSFNF?=
 =?utf-8?B?QUh2OGRGcmhBT2Mzc0gvN0lXRlVhVXlwQXg3UTNoWXRSMUs3RUNpdGJQc2lF?=
 =?utf-8?B?OGdHZTdKSDUxOHFkTFdqVFpOanIvcTNoMXFscjdvTy9adWhSM1JuTnpjUVJk?=
 =?utf-8?B?MG10ZWl2S0JUSS9GZnNRZmd3SURhOUpwN0lXb2o5YlJtRWg1VUpvMHlYMk1F?=
 =?utf-8?B?MXIrTEJPTGFhVmhkNUk0dHNxdUtYSzlCSVRpSW9tRUl4MEh5WFBKYVcrVjBv?=
 =?utf-8?B?Q2Uwb25IbHdjeDQ4OExISjJIU2FNNDJHVXNtNWlEN2dXckkwbXlidUtOc29l?=
 =?utf-8?B?NURXSjZTa3NyMFExdDkwUzVRclF0czFnMTIrTkx6VThnaEFCclEwRDZzQ0N3?=
 =?utf-8?B?cDIwajFDL21PdUprNXlLbW5rUGw3UFRiR2l3UnMyaFJ2SndhQ1Jjd0UxT1Jy?=
 =?utf-8?B?T0MyY1VxVjBWWWl2cEswUkZNOEpkbjFXMXRONnVEZXpmRlVKM3lPczA1TGM4?=
 =?utf-8?B?TmtFNEpPc0wvWjdhd1hPdWY5NitIMnVnck1lTHE3UVhVUmNiREVpMFJNYzBp?=
 =?utf-8?B?SDZFbGs1QmJqUEJjSkJYTEtCZllZTFgwUzA3WXQ3R3RzWUtXdHR1Sy9iYU9V?=
 =?utf-8?B?RTU0WWoyL3FIL2lZY1RsZG5MZ1J6U0tUOHN5anhGalFLTkFiSE5OQVFMR0tz?=
 =?utf-8?B?bU9CNG5IK3N5VkFQWElKNGdwaEh2L3o4SnlPVFE4Ny9FbjYrbkxSRWpoRDVG?=
 =?utf-8?B?Nm5SbTN1amY5SElrRlRWQmFCNjY2d21nb2RPaTdPOWU1U3hIa09LVHo4elJM?=
 =?utf-8?B?bTljNktCNkp0eHE3ZUZDZnhBSUxkN1hPd2xSWWtnQVhyUk5DejU3MGdQMk9y?=
 =?utf-8?B?UlJqeUhXZUhaTjJ6djdTelIveDZ0SFJjYzJoMDl6ZE16MFFyZEgrcU1rc0l3?=
 =?utf-8?Q?g9/dQ27YrpRtA2IOYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9kMk8xdlVjS1YvR1QwNGVFMjY3ejd3MVRYclZnYk1ETW9qOEpxenBxOTJL?=
 =?utf-8?B?Y2d0V2RCNmp5SGF5eFZHbzZBdFRzWWdZa0NrQnJxQ2dwKzZDcnBLNEJncWZD?=
 =?utf-8?B?cEFDekZ1QWw5OFJGazRKQWZ2b1ZxRnZSWkl2eXZUUm1aNmNyOFBHNkRYa0lY?=
 =?utf-8?B?YllGNzl6dXNuWDFKWTRxTlJTRmwrOGlPZ0x1NGo4QldNcTllWCtQeXlEN3NK?=
 =?utf-8?B?N0EyQW4yRGdub3pRV214MlpieVZJaWpDcVdLM1E4RnpaaCt2b09vZU02NFhZ?=
 =?utf-8?B?SkNwakJUOEhxaGRER1dndVZHTEV6L3J1YnFDbWZyUkdWUklrSFN3QzZZVWVx?=
 =?utf-8?B?TTZiRnNreWlHSG8yMi9pZ1JGaEVXbDNVSXc0dG1uNlZpTnhWUW0yTXp6N0hB?=
 =?utf-8?B?dzEwcS9RN1pCK2J0OEFkMm85K0hXZnNRV0ZHSlp6ZWhickxRUTdDTzViSExq?=
 =?utf-8?B?TDRKNVRBNjh2WnQrUEZSNHE3ZHlFMEVPM1drWnZuWjBNbVp2a0lsbXNZTGEx?=
 =?utf-8?B?aFdZL0lGZWVyUHJhZld2MUxlUUwwQy9lQ1dXQ1NiT2VvTkVzN0VBKzlQTSta?=
 =?utf-8?B?a2RUMVdvMWVVOGYxeE44WFh4em81ajBpOHpwOGlIY0FkbzNDSnMwa0RNekdm?=
 =?utf-8?B?ZU84RWVueWZxTnYrdTJBTnU0WVZRNUo4SHUzbGFDQWhUaTI2QlM1clN3SCsw?=
 =?utf-8?B?ZFJGNmxqNnBZVFVQb0hXaVBORHJHMlBrRkRVbVJxK3ltL2dVTHFTajFaNi91?=
 =?utf-8?B?NWtOc09jZlhSQ0I5MXdGeUtRT01FL0tNamd0L2RoQnJRR2grZWNNWjg4QXEv?=
 =?utf-8?B?YVlySEpRQTd0b1RSUy9nYTIrV1B2RUhxcmZJMWRJaDZpbitLU2pjMGg0MlY3?=
 =?utf-8?B?U3h6UjRZY2MvZ0VHY1BJQjVCUmtpSXpxZVcwOXNtVWpheFg0M2M4UEhTczN1?=
 =?utf-8?B?MzduREtzdjJRVjIvNUNXUE9CN1c0NFZtYWVvWXJzdllQQXY1b0cxQVpqSzcz?=
 =?utf-8?B?Z1poaUJva0pVMU4vVVNqeWNOaTB0ODFraWo1dXZ4V1d1Y08wUnlBVWxXN1Jz?=
 =?utf-8?B?R2J6cnNCaEFGMDZmR0VVSHFad3JVemRNcXF6bzl2KzFSU0NoWXNvWksrajBQ?=
 =?utf-8?B?VE1ORzVCSDUwNkNuMytmQ2dWYXE4b0pSTU04REdLRTRzYWVhV0VKVjFJMUZ1?=
 =?utf-8?B?T3Zjb1Z1TjBBQTVTenpNUjYxQzNHeWcwZldQQlNpdDJVTkRDWmhhdXptdjBY?=
 =?utf-8?B?WUpOS1BaWVAxNnVWai9WU0RmRzU0NVQrZ2dLeSttVWNUY2M2OWkwc3JlVTUw?=
 =?utf-8?B?NzlSMVl3dDBJVTVoaUtHeXg5ZWUrN2xqeGFzUTJzWmdXdTc3UWFXZlRmTTU1?=
 =?utf-8?B?TVk5U2V0c1U5amVGMVNTckVXcnZHSU5QYmtiRGgrb1hoNk5Ecm13alJoQTRV?=
 =?utf-8?B?WjdKSzRkdWhDNlRjU0p0RGZpa0VUNXlHUk56S2pyZ2tZNndjUi8wLzRsVFQ0?=
 =?utf-8?B?ZEI4S1NXU3ZmbFJFeFVyb2w1SURkT3VwRTVXbE5JVkRRck1kLzA2VTluUzZG?=
 =?utf-8?B?QStkZGNiZkFMTEhPU2k5V01XWlYvQTRqNk1BdnlnQ2RVeGtkUVFXMlRpZk81?=
 =?utf-8?B?cnovb0NnbVQ4YitPRSsraDI1QVBnUThKRXMwWDhKZGZMSThkR2JsWnBYRUhR?=
 =?utf-8?B?YlFUcmZ4cHgvME5pRlc1QVo3RU0zVWJxNSsreWlnM3VhSC9FOTVMc0hyTGM4?=
 =?utf-8?B?OWNIcU5tZCtnamZxUHhYU1UxVjVxV1RBeHh5WllEaXlwS2hZTmpqUGhDOHNI?=
 =?utf-8?B?bVVVQU9tNEVveXZFVTBNUjdiQzE2alREeVBFSnAralZNMUpCNlZPL3BvK3lo?=
 =?utf-8?B?cHFNeEw4dStGbi9TdUYvZTBrVit1dnJwaE9oVTg2R3Z0Q1VIempzRFM4U1JS?=
 =?utf-8?B?TG1mMjFMY1JJMzVrRHl1TC9IRU00NTJPQnN4OUlzWDVsRTljb1pqQU1nSTV2?=
 =?utf-8?B?TVZxUlFDWWorcU9sMWNaRG1nOHk3c0RxOVVrNGowTk1Dd2IzOEVnVU1BQVo0?=
 =?utf-8?B?Tkc5UFF4SjJoNkJXYktobytJNVAwWk81MVFDNHRDOVBKbkJvZ1lYaWVxeGx2?=
 =?utf-8?Q?NMw3HdG7Fa60OAVOVrmONffKU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d852d205-bfa1-44e1-af8b-08dc967675f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:57:51.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5um54OoMyTl8IJBagi8C2YlNgtV09gGKcs1C66dAMOmjAZ8A/hoHAfY6FU5J8d77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129
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

Am 27.06.24 um 05:21 schrieb Jason-JH Lin (林睿祥):
>
> On Wed, 2024-06-26 at 19:56 +0200, Daniel Vetter wrote:
> >   
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian König wrote:
> > > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
> > > > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > > > > 
> > https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > > > I think it would be better to have the user configurable
> > private
> > > > > > information in dma-buf, so all the drivers who have the same
> > > > > > requirement can get their private information from dma-buf
> > directly
> > > > > > and
> > > > > > no need to change or add the interface.
> > > > > > > > What's your opinion in this point?
> > > > >  > Well of hand I don't see the need for that.
> > > > > > What happens if you get a non-secure buffer imported in your
> > secure
> > > > > device?
> > > > 
> > > > We use the same mediatek-drm driver for secure and non-secure
> > buffer.
> > > > If non-secure buffer imported to mediatek-drm driver, it's go to
> > the
> > > > normal flow with normal hardware settings.
> > > > 
> > > > We use different configurations to make hardware have different
> > > > permission to access the buffer it should access.
> > > > 
> > > > So if we can't get the information of "the buffer is allocated
> > from
> > > > restricted_mtk_cma" when importing the buffer into the driver, we
> > won't
> > > > be able to configure the hardware correctly.
> > > 
> > > Why can't you get this information from userspace?
> > 
> > Same reason amd and i915/xe also pass this around internally in the
> > kernel, it's just that for those gpus the render and kms node are the
> > same
> > driver so this is easy.
> >

The reason I ask is that encryption here looks just like another 
parameter for the buffer, e.g. like format, stride, tilling etc..

So instead of this during buffer import:

mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted", 10));
mtk_gem->dma_addr = sg_dma_address(sg->sgl);
mtk_gem->size = attach->dmabuf->size;
mtk_gem->sg = sg;

You can trivially say during use hey this buffer is encrypted.

At least that's my 10 mile high view, maybe I'm missing some extensive 
key exchange or something like that.


>   
> > But on arm you have split designs everywhere and dma-buf
> > import/export, so
> > something else is needed. And neither current kms uapi nor
> > protocols/extensions have provisions for this (afaik) because it
> > works on
> > the big gpus, and on android it's just hacked up with backchannels.
> > 
> > So yeah essentially I think we probably need something like this, as
> > much
> > as it sucks. I see it somewhat similar to handling pcip2pdma
> > limitations
> > in the kernel too.
> > 
> > Not sure where/how it should be handled though, and maybe I've missed
> > something around protocols, in which case I guess we should add some
> > secure buffer flags to the ADDFB2 ioctl.
>
> Thanks for your hint, I'll try to add the secure flag to the ADDFB2
> ioctl. If it works, I'll send the patch.

Yeah, exactly what I would suggest as well.

I'm not an expert for that part, but as far as I know we already have 
bunch of device specific tilling flags in there.

Adding an MTK_ENCRYPTED flag should be trivial.

Regards,
Christian.

>
> Regards,
> Jason-JH.Lin
>
> > -Sima
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

