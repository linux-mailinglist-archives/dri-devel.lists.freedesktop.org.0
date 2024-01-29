Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A5840C55
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672410E3CB;
	Mon, 29 Jan 2024 16:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2092.outbound.protection.outlook.com [40.107.21.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB0F10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 16:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvHCbFAws9Su673OevYSK+XyHNj94miGK6mUO061Sdaay6GigvnEYb+01UFyzwbg8Ky0nbRl1bCY5x0QMwTE5B1+WOtqaduM/adshP6XiD+TcmxWqiNgexD63mHZF6R7pJxJG2OgGnPXMgXEPDq4hBgSthZqBLkdUyNCubVKHS43uhLq8QkK6FCNdQDKhjItKSeRZOPJGqPErT7pnLhsBuu40ywG+vuXVnSnWVeC5/mpxR1HGU8F1tDvpa83DHbXZb6mVuTiUnjV5CSRJVVKaF2BlgR1c3MMcZh9B4iWZ3X+Mf1HYTeTsqyatfrSTw/yhGAOu2znuR/r5k7PODNBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW0f5NChj/C3XGpVC2DyoL0eEYoPNYhMSEbJ6vAWtOs=;
 b=bhcqkKvsBGYrj/D34Ad1oaK0biz1X0x1DG0ggyd3+ZanuzxChditljAVUbaSDsPK4s/VzwMQpRLr0ExPxxKFdwgfZYoANKpQhruy4081ZjLVlOrAqNHo1FPHVfq1flr5fQqqjy6uWC9Ga4PNyNkMysZZIbqzjYQfVLUGYsTwQJ3phD0TGKLY2x3MVoEkUX0Bho0iN6IYmYErWrgBHRxV0YQXJH2B0xGX8PAV6p6nrLANdoB/gQkpDJwoyw/ylJGswU97igWGmxL2ozEutOWtVuvNF8Liug+pVY9qJUiutcPyu8/leZjKPKDt8R4Ye14r2+I33KlOXaKZyYwFamp4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW0f5NChj/C3XGpVC2DyoL0eEYoPNYhMSEbJ6vAWtOs=;
 b=b8aiJBa8d83nUwFDtySpzQgoxrIi1t60/f1bZl/6tze1ttMuaFDa/vKiwv1ptpxV5po6f31NhW9Jjpxd/nCLSnZUN/DHUgTFQFltZu850zjUAlqpYY+W2gqv+DxRYHc5KhdGMVdft6JxR5Nitvkg1k6DflaJQIhgw8nNcbvHuCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB8135.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 16:51:12 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::44de:8e9c:72ac:a985]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::44de:8e9c:72ac:a985%6]) with mapi id 15.20.7228.027; Mon, 29 Jan 2024
 16:51:12 +0000
Message-ID: <021a118a-5ced-4bf9-b6ea-2a7b1980962b@kontron.de>
Date: Mon, 29 Jan 2024 17:51:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Dave Airlie <airlied@gmail.com>, Inki Dae <daeinki@gmail.com>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
 <49b26e7b-0205-45c6-b7ab-8424c20d3f6c@kontron.de>
In-Reply-To: <49b26e7b-0205-45c6-b7ab-8424c20d3f6c@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: ed45f619-7345-41c8-f859-08dc20ea7fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ae7QxEQtP0SBovqqPH3QUt9izu5J78UPcocWM+Ooh5iVARfdsdh4NhfC0WWEl7pa33i02iNNDTtmoNyQ1edbUoGhKluA7khZzDQ63E+pJD5uLmu4sUMraeHyyivrQplcoMlpxP35ckIB7sGeZPlLmmYhUqOcUdOqD3ySz9dzmVkiI4Oz56ZWW3TZWEnBVZsYnb/YjPCq2mNYxy7vy1vkVJwP9ADpqA78GFGZ2d+7+X+GR6hF56/alq+QQm9EJLnb/xpmlUc8ysdtqGEfnC5qCdXUbOql8ANpfBtS+GYW7rX6P6KYNvfhtDiGmDA7a1qbr3FDCB6ZZY1zWuBeua5ynLetjrJcgOHU40nfBOjUKTAVFoXrU3wGmWJ6espo0utx2WxVGXwsgXTrKM8Llt9tB12Q/qdCVyKPOrU76DM3mT0sdhnFWe5hANbtUcDEKmZu3mehridg+Kx8Sw23b1I+7GFChuDcwt07p/2DsDuxeqowhln6GAcUlbv7n6YWAXfL59jbcQO49P8H7xBM+Y5hQXjHN81+KphAeeVhQIXyDw6oxB0VBwQGjTyZ2efZYaeitVuTcpM5+SylTj0NIfYMSLab8xtdbPNTHauz0ckuWIBlY2ZYqmDxUiRxIhYiCTBoLuZwPuWgu2Ezat4HtnmYDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(26005)(86362001)(6506007)(53546011)(6486002)(31696002)(54906003)(316002)(66946007)(110136005)(66556008)(478600001)(66476007)(2616005)(6512007)(8936002)(4326008)(8676002)(44832011)(38100700002)(31686004)(5660300002)(7416002)(4744005)(2906002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURPOWFLUEVkU2FKL3JiSVZPR2VFSUhXakFORCtkZDZ1SFdTUENPVmZUblNT?=
 =?utf-8?B?UU5yb0d6ZlhXTEJ2T2pQTUFkRjFRcHNObk1FSy9KT2t6R01mbHhDNFkrT0Ex?=
 =?utf-8?B?K1Y1VjlzUzMxSUhzZHY1dkt1NlRaYVgxNUl4MVVEbUUwVlJCQVdyUm5FYUs4?=
 =?utf-8?B?VGYxVU5za29PSkc1SWt0TkhibGtOVkVxN2lOUUpqajI5Q2lZbEF0YkRXSm9z?=
 =?utf-8?B?M2xDY1JJeEhwdm9lQ1RjY1owbzdyb09iUEl6NGFYd3hkMXIxdUhqU0paSmJu?=
 =?utf-8?B?TUFUTnMwYUJYdVhCTkxCZjQySGhlUVVzZ2NvNUdpVjRYK2dhQkh2MmVqdnpP?=
 =?utf-8?B?Ty9vYitmYVBnS1o3enRLMUFMVStqV0Jvam4zZ1BNRVRWd0hVT25MbmlBQU1z?=
 =?utf-8?B?OWRsWEd1bHBDV3YrL05SRjNwK3krSXoxQWlOZU9Dc21uWW1IZkNKWWRmQVlC?=
 =?utf-8?B?VUhVVE1odGxoZFd6dXVyZVgrOVMwZTdTOXpEd2l5SlNLMElUeDVyWS8rTzFj?=
 =?utf-8?B?U3l6bnpmdC8vZlhJdEx0N05oWkpMS1VoMUxiemEvcW04TisyRW4yUlViYzBQ?=
 =?utf-8?B?Wk8xQ2NqNW1QSVF0eVZnWU16Qld2QUpWdXQza3BBZHJFYzRxb0FNbXlPYWx6?=
 =?utf-8?B?NWhScTlQcTlOaFBLdnJtZ08yQXlrdW5DY09yS3ZhU0tiQXFhWGVsVlVIMjFT?=
 =?utf-8?B?NWdObTVhYTlCOVpXd1ZVbGVOUHB3TDQwVnB0MTBGbGt2Yk02RjNpVTZBMk1U?=
 =?utf-8?B?UTYxK2RvZlRwVXR5NU5wT3BkYkFKS1psWVIxZlRBb0Q5RHBXeGkydDJJV3lv?=
 =?utf-8?B?V0EvRCtwYUwrcU9DSzcxcWN2Nmx6NFBKaEhISitJQnFseC82Q3piYUpZL2NT?=
 =?utf-8?B?aFJhUkJ5d1NFc0VZTXFMZ1VzVGZBWUVnWEw2RXdsTEVmQ1JUbG1UQ2NiYVFp?=
 =?utf-8?B?NFZ2YitLM3p5aWtOVTR0ZlhGcEV5VTZmYXpnUDVYaFFUTzhxL01PejZsbEYw?=
 =?utf-8?B?c1VrN3hmNVJtVU9uYjN6ZkVNR0tKM1NtTTMySURyUGtOWnFnYmI5TEk4ZzEx?=
 =?utf-8?B?SyswVlN4MXpkVXYvM0kyczQ2VmxObmQ4RHpLWEt4QS8vNjNmUEMzSmZDeFVk?=
 =?utf-8?B?VkxLbExLTG1XZ3NyVnhaZ0RQbzRQU3VVQ2Y4VCtsNjVYUUdEMFY5ZTArTHIx?=
 =?utf-8?B?ZEY5dGJOQ1dPREpxci8yU0w1Z20ranVNZUVwcTQvVUVVamZlQlcvY3U4SkpN?=
 =?utf-8?B?R0VLQmZoSFgvL2FRUlhKMmRVT2xPcHJWODVWbkY0VmNzL0pMc1IvYmZrV0Qr?=
 =?utf-8?B?cU9yMndONVlieXM3NGxoL01JN3k4TE90R1hQVWVKMjBSMk9RbHplNWEyL1FJ?=
 =?utf-8?B?QlhaUWpWQldOR3ZobGR6cHBKQThIUmJIS1RDY3g1cUhwdndqWjJ2NWNEdkVK?=
 =?utf-8?B?dzJydXBXMC9EeGJzRTRFaFptcERlYk5UanIxcHJpaTNUV1hta3Exazg0ZW5G?=
 =?utf-8?B?RVRhSzFkL21tU2V1TVpFdEZ0V2xyZEEyVUY1dWpkS2RLOWhYZmE2Sy9NS0pp?=
 =?utf-8?B?dDd5U0picXdzRjJaNGpYR3FIUDhpT3ROS0wvUEFRcDJkSDRNMW1ndHBoOGVV?=
 =?utf-8?B?cnk4UnVOUU5GUzlGYnREU1ZZZ2NNNG8wUWhyOFd0Y1hCQ0UvelF2ckhKSmRo?=
 =?utf-8?B?UHV1UTdrK0RRMjJ1MW54dlBySTFhNEM5OEdQNVhQckdxcHY3dnl0Vlh5U2JN?=
 =?utf-8?B?WTZGbUhzMlY2ZUN4cEFsSUVUWmgzYS9ua1UwbUVOMHNRL1RlQjVSSmZpSnJu?=
 =?utf-8?B?WEppYVd4WVdJVXgxeHQ3UE9ocHdxTXpYRDkraEprdTRMaUlnMjl3S1dKZi9C?=
 =?utf-8?B?aElrVEJNRFIyM25BaUNndDVqbmw2UVVHQkE3c3NUT3F5dDBhOVBINjlvOXRr?=
 =?utf-8?B?UGFWaXgvT0xKN0xJMGJCcUJjUGw1K0crSnRySXpnTVRnaDVoOWFvQjNudk5R?=
 =?utf-8?B?Zzd0TXl2SVJsbjA1NElIczNTWVJpTkdJRU5LOVhXQy9KdDNPOWg2SkptQUFi?=
 =?utf-8?B?aVdMRTBCcEF4Nk9qTDVuUEZuUkpYbm9QNUJzNWNVZWp5SXBXSFJPSWNSVDlQ?=
 =?utf-8?B?ZVZON1Q5Vml1bGhJc3VQaDhQRXlJa20va3hGaTZCTmprS0hSME9xUmc0UnFh?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ed45f619-7345-41c8-f859-08dc20ea7fea
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:51:12.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OICG7vJCgYINc3aw8OADTvuSjzrvhY9tkCBeXHVoZlj3O5DpUwYpLBN1rQw4nWW1gU45sO9Ba+NSEI23evjSPxC6iaLsI5btlP1kCQW2SGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8135
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Walle <mwalle@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.01.24 10:20, Frieder Schrempf wrote:
> On 26.01.24 19:28, Dave Airlie wrote:
>> Just FYI this conflictted pretty heavily with drm-misc-next changes in
>> the same area, someone should check drm-tip has the correct
>> resolution, I'm not really sure what is definitely should be.
>>
>> Dave.
> 
> Thanks! I took a quick look at what is now in Linus' tree and it looks
> correct to me. The only thing I'm missing is my Reviewed-by tag which
> got lost somewhere, but I can get over that.

Apparently I missed the point here. I was looking at the wrong trees
(drm-next and master instead of drm-misc-next and drm-tip). Sorry for
the noise. Michael already pointed out the correct details.
