Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D981664C549
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331310E226;
	Wed, 14 Dec 2022 08:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2096.outbound.protection.outlook.com [40.107.6.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16E10E226
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcU7lCjzMMX4TucZeqq+26i20K7LEdiFJMAD5MkZg7Bl8FKbVBH2sgOVuQkGU7myh1Yc+cRGZMT2S/1+bRT8dBfuwrkMmhHZaexbdQuFToufNUxO18LpEmeuAw0+pU+wba/ljvMKxOlbl1fbNfncX6ZUpkTsbba+9dJhsr71O4K0T19eqKwZJFA+1wTWJ2UaidDNdJ59wd0OSSivCO6rQBEx5e0NAvqYBJLVzw9sAPYytGxrWy3eh0g3vhiYvs0P6pr4dOkUiaJFAKEY7a04vhr2UdXUR6KLjIqnm4M1NB/O0yKcYLixh9lTiL44Im1skUTopKFwXO/XOckDYSww/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1za8zi+89ASZKGoTqWqlZ1VhRpYl2Z5zJZuzjnF6Uxw=;
 b=l7ugUdyc6HtrpzDhyFFU9YVKrXPckoE8KnL4B8PjqL3D3B1ki7+sjSG7wqPU8zWzUA/2FHIcO0fZKATCdHlSAUbioH/XOSigLQ0lpVnl9+RTIERv4Do0ssuXKJUxdCQsMiZAnVrJzW+WVfCLYchDshnnPLG30CzjRVh53p6UFlUiDRUj8v0YpNiN10ceebIjIRk71sw1OGznggwkj2PLHGiIfhuf8z4jiQxHV2YttIDsxe5sn/HtE4dNwFwYV5imTU/XfahOFWqD0piESpb0nP/JZYukY+GEWKxZVxsYLQNMAIXJlppKzE1qVy2aYAjByQYucYhffH19h2Pg8J1jnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1za8zi+89ASZKGoTqWqlZ1VhRpYl2Z5zJZuzjnF6Uxw=;
 b=h80+vuRu1daGPpbZm44o/5OY3LJ3Pqm2NQFGUKBoxIyzV1GuF4dE8QR2xnNwPXzAZa9WWkNT++hKC58440kq4ydrSuq2azwf/Zhhf3x4c+DMAiaXedFzYLQPSfi84rscMlJAcOEYHoAmkpGEJiHSMO9h9t8YvT9uUaEKfxrXOSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM0PR10MB3667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 08:48:23 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:48:23 +0000
Message-ID: <57a46374-690a-91c3-28e6-d34d83b9d40a@kontron.de>
Date: Wed, 14 Dec 2022 09:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v11 1/3] drm: panel: Enable prepare_prev_first flag for
 samsung-s6e panels
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss
 <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-2-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221212182923.29155-2-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::13) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM0PR10MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: d44f04e5-eebb-4088-d5c2-08daddaff56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUCaToLSxyLJWG7BnqFCAnWCn8rdSkCAQ3HXy3DXcZxmBPJaqS+u+pXISmR8vo3jEaDc5aW/Y30se7AaOYRZ3g9gtIXKS64N7SKY9X59cSZqFZPaiukDohpk/Vh+u3DnJx5jNihcX5Y8Ca44E9A0P3Vv2JXEoeRaeylbj+raIvSpSYxp3NN4iQO9rK6k4h11v8swSctxw/XIzYX2G2fP40DfN9XO6uKNMe3IGjLMeL3CCKBQhBNx2SYMsX3rkEzgmZTjEVTNNvH8k5nXntweq6QupoUB2wl6s6GGofH7t/XTOrY0GP4VOJhnwCmsW7UQGsc4CcJU7Lsv1Wrxv6vtVwRC0dRRimM1UNHJy/YRYzZcYdbU7nO2GtnoXytNeDz3eAzmZVwrLIGBm3QRKUgRJFRRpxeuUoNCN7McT1aQzVOmWXJQx/cMcMRRZZJc6FJ3C0ALu9Fvt8AWEtng4WJuNnjKfJQWxUNQdFz63dl4RlmpGr9CBm92eS9PV5atX0HYbMTt37Th/FaSi8JyQ+RwDZZ1if2B5vmvv+gVKyjxtfU9JwiBR4W7lx9T2wsM3/sTo64LXQRIT3dUOXuEdwKY44zDaSaqZj9Q16K6aN8stga1J0XbozbCPvmeIkQQhlub4aD2V5F+XsP+YoLfNv55iWW/OCC0gjrKS0hwRtMqdwK7iJ1mQ0ECY7ISqh94caKDSazzY0EtgzdlxKSWqobcAtBt+GCkbu0ZN+kNXT5MvTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199015)(6506007)(41300700001)(44832011)(478600001)(6486002)(2616005)(8676002)(31696002)(66556008)(4326008)(66946007)(36756003)(66476007)(86362001)(38100700002)(2906002)(53546011)(6512007)(186003)(5660300002)(54906003)(110136005)(31686004)(7416002)(316002)(8936002)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dRTWNjb0NxcitUNDgwMU1RY2NGVzFVQzhmTytXdFUwaE1rdzFFZHJUS2h4?=
 =?utf-8?B?U3NpV1A1cnNFblpDQTNYOTJQb3lXaUxYMzBpV2MyRHh2aGtQMkROdkhGZHZr?=
 =?utf-8?B?ODNrQVQ0WERiWk5ncGpSSW1oYUIwTUFsckVqV2h3UVlUZmozanIrMWNsclFu?=
 =?utf-8?B?TEN0UVpoTlFYRkd3WlVzMEZQMUVMdnRqWkhWTHNmaDFJODFHUGJoYm9uVVgx?=
 =?utf-8?B?N1AzemkyeFRMT243aXBGendHNHBCRktRUGE0SXBZZkZqR2FYbzJHaGsvL2Uv?=
 =?utf-8?B?QU5ZWFNleWxTMm0vaUVETXJBajFZQ1k1Q2hYYWpYLzBCQkQ0eFM1YkZ4KzRM?=
 =?utf-8?B?c0o3MXY5ZlJ2NVJkLy9odGVUWlNXdjZvRHdyd2tQSHM0TjhzNUtIMitjZjJq?=
 =?utf-8?B?ejYxdkJaV1k2VHhSU3BTRmlSNGFsRFd0NEQzZCt4U0Y3REtOZDF2cmhGRkg2?=
 =?utf-8?B?dzZnZGN1ZHNYdENiOTdzdFZodzNhaHpBQnQwQ1ZFdHE1ajlkbDdVOU5ScXNY?=
 =?utf-8?B?UUJMNWdBdVZBZE0yVGJyS3VCdmQxaVMyNWZYSXNFSnhrdTVCVWtwNzRzazh1?=
 =?utf-8?B?YUMrUEhJT21qVkIvTGVRQlZiSzRBMjFtenhIbWVHcEV0d2pWU3RGeUp3UHBZ?=
 =?utf-8?B?ckt5TStKTEhpbGhubWxMNEYyWEJuZ3BNSjlrZ3VIUFBtWUg1a3JYQVF4b0Za?=
 =?utf-8?B?UDdXeFJUYnVaVmg0S0V3SFZ1ZHQ0OWJLMlBabENVTEdSUnlxbkNXRXZGT0Yy?=
 =?utf-8?B?MDdabVJ6WExtcmpjdUtPWGlrcVlSbCtyVGdWUi9MMElTdDIybk1JS2pqa09n?=
 =?utf-8?B?Y3lsTWhEYVVoZ2xnT2k3bnpMYW9yajczSzJBa3FEOEQ3N21sTksvTzVHSURJ?=
 =?utf-8?B?YklkbWZmYXArRE5TMWJ3ZjBiMzVnMkEwQ1lubElSWm5mMFR1UTh4OFpDYkVX?=
 =?utf-8?B?WitvcDZnRFBKNEk0MGRTcUQya2hSaUhFb3hEWGtNL3ZjVnJla053Njc0Tkth?=
 =?utf-8?B?UHpqclBYOXFIbVZiT3lYSUdMcm5yL3d4c1llSmlDWkJaNURUY1I5Rm9Lbk1E?=
 =?utf-8?B?cXNJaitRSVp4aXNxbzh2bUxUTDk1VEpFOEgyeFdRbzhWamZzWWFzNk45VitK?=
 =?utf-8?B?K0ZYOUprUDZsaHN0TWtQQXZoUW9tOWFqVVg2b3ZEbUhPTDhuL0ltYy91SUpZ?=
 =?utf-8?B?c29OQ1J6RGF6L2R2cXBqTlBYdi9yNmdaUlJCdjZuVzhucFRnMHZad0JjL2gv?=
 =?utf-8?B?VTJxOGt0TnlZWm40ZVRUVWZHd0xhRWM5eWpsUklFLzI1dW1HOUhKYmZuZVJk?=
 =?utf-8?B?Rlc1a3EzcGpIYlNmZDkxY2V5S1o5em8vUkdpamdpTVR0cmhLdnBiZ3hFUGND?=
 =?utf-8?B?OUk3MWlEVGJlZ0NGZHc4Skt2T3NmZnpVN2RlamlMT0dZOW56YWF6Znd2ektH?=
 =?utf-8?B?NW5sQ2oxYkpYUVhUMTdSOG52RHVUYXAyd2t3TjJVN1BneXhlS0pZa1U5TTgz?=
 =?utf-8?B?QmlzaTlSVUJDMThMZm1rU2hsbGNJK1RHSnNiYVl6bmcwUlJZRFBMNzRJWTlv?=
 =?utf-8?B?U0VBODdTZkVaUlVzaVFvT3dUUFcyM3RPUDdxM0xJcnNBSlVCYStYQ2I4YmZU?=
 =?utf-8?B?LzgvaTR2MUFvd2F3ZzFVNGhPQkQ4OHA0STdHL3ZyeDUvN2o4aUw5NVBlZVRO?=
 =?utf-8?B?aUdJaGgrU1dFcVExaDBUNjJicFFldk5EZEpZZzFpN1ZpYVdXNGFXVXRtYWM0?=
 =?utf-8?B?eHZ6L2JkbDE3d2pqa3ZrS1dyLyt1QjVPNlhjTVVXdWd3UXJVN2lRRjBHamI4?=
 =?utf-8?B?YjFsU0JKMlBiMmNLM2g0TGQ0WkRKZlBud1pCUnNTSWxYbjhaVUd0UkdhYjRC?=
 =?utf-8?B?Si96M3VvUzJxZ2xieEFac0I2SDhtVmRjaUJaejVzV05zV01JZ2dUWFplSGd0?=
 =?utf-8?B?bEVvV0U5OGRxbTZwUklRMGtsVW1uOFdCbWlqMTduMDdPWlZDZ1JiRUFlaGcv?=
 =?utf-8?B?N3lXM0ZUM09FNjY1Y3NaNzVEZ1YwbTN4U3JPT1lUdTMzNWVQcUV2a2VGL1pX?=
 =?utf-8?B?TnFndXdtOVZmWU5VcDB3ODVaQTNHSFhPcUZmclYzMzgyMmF2ZWZlL2ZsS1U3?=
 =?utf-8?B?TG5EcTBzQ1QvK2J4dTM5aUtNUkZHODRWUllReHZHbzB3SVlUSU9ubkpsc09s?=
 =?utf-8?Q?RD7Rj1xbeR7xFRh1FYjxt8AwHt41qYnWICN12J4kF6l/?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d44f04e5-eebb-4088-d5c2-08daddaff56c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:48:23.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3+H8p87yePWIOGtEdg5R0titE+tVedFu7dnZ64kvarghgLKUefCqk3Z2i9VLyWl5fw1G+zJIPyXfGUVeQkM36qu/922E2FBg6nHsQUl8uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3667
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 19:29, Jagan Teki wrote:
> Enable the drm panel prepare_prev_first flag so-that the previous
> controller should be prepared first before the prepare for the
> panel is called.
>    
> samsung-s6e3ha2, samsung-s6e63j0x03 and samsung-s6e8aa0 are the
> effected samsung-s6e panels for this change.
>    
> This makes sure that the previous controller, likely to be a DSI
> host controller should be initialized to LP-11 before the panel
> is powered up.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
