Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435AE6C205A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 19:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549D910E2D7;
	Mon, 20 Mar 2023 18:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CAN01-YT3-obe.outbound.protection.outlook.com
 (mail-yt3can01on2108.outbound.protection.outlook.com [40.107.115.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC010E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKbMmI2GEngf8HNc4bHpV712GjlyMWXqK4aKMxKC/h0f69XeAFhHEYzwniGjLhOO9GZU++wSA7Q4ZwVjg8kUIqOFxwQJdItfO+wBYOjPuVZKt18nSHr1gWslQakjSmKqLrLD7KCraB2hgeSZQ5BA4AcMO5XldeGnkhmmhOtEQ5b0GtxWGOXiy37+IL2mPZAwb44tW2uF0QTLznTcwnKIjeUaCKqhMZTEy0IEq0Jj4K7dWkGyVpdkaxvz+pRtppO/LgWK7WEAwekdYOj/x91fmFlAxyL/ZAYFM7sDR95opvdbKs1cR0c5Kwj7qvGr9cAYQasHUezuoamRgWpDdt9+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUJB1i0KYo0cKGiWNm7Iovhc8JGkxra+ws6YFiON1o4=;
 b=SlodpHpwkBVzcP8iCcqql1Ad14+ikg0e35J0hTHYnMC4YYYR5YKcqmVIIF7bsHcrOZ47ug5HzNADy2yqncZK4qxhrbOrdPI/rPQgqtPVG9J2JcuGjZ4+Mfm0VV6yAHmo3IVLjdwkpPG1N2eBcJx5hkd52OoSv7ys6pZ6R9RCh3uqQY8OKn2M+47H5uvQ/10msp9ni+kAzdDMBhPzgJsZHYlFw5ffwDJK1F5GqO7rNkLjSYkbhVD8LSrHvR3/6UyKAXRpMY0NrEadcomVAVbpP6ehqZqznrFwwIF/GZQTTTFRoCevrjn0zynV17Nrl1cfT+R8VIxa5Hl3gGofYz5aKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenbrook.com; dmarc=pass action=none header.from=lenbrook.com;
 dkim=pass header.d=lenbrook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenbrook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUJB1i0KYo0cKGiWNm7Iovhc8JGkxra+ws6YFiON1o4=;
 b=Hii1pci+2QSnh395SKgn9pyf30bT/nN5m3CNDbSbgloNDsp8z/BBSUdynq+VnNzr4cr3b8Pb7cmzgDlHdN8kEub3fJRybRGlOv32GPCKtyWVHhgsJ4aQc84llLJo9iErPcz7l3wZLf1rvwP/UQwOfu4Sbc4e5OnoetET2UCfNFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenbrook.com;
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::12)
 by YQBPR0101MB8862.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:59::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 18:51:15 +0000
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2]) by YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2%3]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 18:51:15 +0000
Message-ID: <b488edb8-ba78-5a6a-55e3-7b95d704bc82@lenbrook.com>
Date: Mon, 20 Mar 2023 14:51:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/bridge: nwl-dsi: fix packet read ISR handling
Content-Language: en-US
To: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230318223621.4239-1-kgroeneveld@lenbrook.com>
 <afc44c13-0863-d1de-df03-30b83f5a015a@linaro.org>
From: Kevin Groeneveld <kgroeneveld@lenbrook.com>
In-Reply-To: <afc44c13-0863-d1de-df03-30b83f5a015a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0250.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::22) To YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB9670:EE_|YQBPR0101MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caf8bdd-e19c-446e-bda3-08db29741526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIBwf1cqGSRBdQPbZ/re3W5eRX5pPD3apQwKOYTOELv3ZqCW69ayhgXNqugVvJ0UDkiV/RtxA6XfBe0h1cIPGA3TLv5mrPSk7TdnyHPhwVJ0rrNFXCgtJmc98fR2TgrixmLdd5HOkjtJoh8CZRQh6qXoZBADmOqF0ZgN1bBlNKPuj0I9drH47JRP7o4uD6p0ZwAVcBm6f2fvbDKg3L7koGypInkrY67uPbJqR1rxuhmn7Z+kqQAVrR9w/7pQmSoO3RhY7ASipmiDUlq91GSGsTn1bjUONx1lcEWZbMiAbZkThJEsOvbE3pCJX1LZG/drOwHNTqWR4EM1giSmuo7OilLrDsyzyUgHo5j7K8b+usluCCsR7ELg7kzeMl0QG8yanXpDPExkDFsMZ7DItkKgQQ7FW8MnxErxivsgaMcavhRPti+IB7Jg175Czyud0O2F0uG+XuxoDHS966jBXwhpTwwyW17AvL9wDP3XNenLhLN1vEmmyVbRJ0iaslIf57joPSPM9xqT6H68WX/z6PB9n/Rh4yiQZQzWTe6zJz77DB2n2+rGivteyjoUp5dJyHwPcDxcxiIV2paN7+Qsl0kwgQaYnPQK97cb5g4GSuPQR5SZgziaV/eTbhb06TpxEZz5nSgZwtb8PX1CE7rm+r5/k8wIadF2LgF7HxWF77wC0kzpI7uNcDK/GiJg4IHGKD0NhANAbvT8sIH7C0n/SStaHdKJYrpjU5Had0ZjnmxSaDs+ECmwrul1sclbIPGtkfiu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39850400004)(366004)(396003)(136003)(451199018)(31686004)(2616005)(110136005)(6512007)(478600001)(6486002)(6506007)(316002)(26005)(186003)(5660300002)(53546011)(7416002)(31696002)(921005)(86362001)(38100700002)(8936002)(2906002)(66946007)(41300700001)(4744005)(8676002)(66476007)(36756003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1FhcFNtV3BSbUZDckR2THM5UWZCSmdtTERiMFFWNGNxek1tbGlZbE5TVm1n?=
 =?utf-8?B?bDZaZlhmMytoMkVieUNCaWJCK3dvMmdnLy9pMmgzL3BoSlp2MWR0bmdTYTA4?=
 =?utf-8?B?ZjQ4bE1HaU5TSEhiY1BnU1RCOThFY0dvNHBUN0FQNkVmclc2WjhKdVZEcUNl?=
 =?utf-8?B?OE5ZbEhLbDVGeTFKNnBlMW10bkZwaGVlalFLazBQbHBDNWpORDI3eGNUQUFm?=
 =?utf-8?B?TVFMQTN4NlYwb29rekZUamtUWDJGL3VES2k5cStxWTE5T1dkN2NhSjNQQUNQ?=
 =?utf-8?B?Z3pyQnhIcUljTXdEV2N1S3RKRU5OSUh4amRSa1ZGRGVxZ004eWlhUXVxL05t?=
 =?utf-8?B?UTlRYTVWMmJXUVFOVG1nWXFhMUkrMFFsTXhhWkFQdDdvTTh5WUwyY2FMUE82?=
 =?utf-8?B?bWUrMFE1Z3VrbXlJTXB2TWVoVThLQUp2aWJwRng3d2h0dUM5SVlTbWpmZnFF?=
 =?utf-8?B?T0dmNlpIV1ZyQTNraUZ0czdHL0VvalVmUXJJTFJpNGdqTGgyUllqdkNDR1dp?=
 =?utf-8?B?NlhORmNBVVVpcXprUmQwYmVEeUJtR0IwdTNOMHk3SnEvYWRlVmhKN1BRWm5n?=
 =?utf-8?B?cHBhRHg4dlJNcDF3NStudEtHMVZNSkx1c0g1K1ZUbnJWaHJtaVZxaFkwRnNp?=
 =?utf-8?B?bEJaYVpldHRKSmpXdm5YMnZ3am04cFpTTzhSMWFURUlCdnhuL3MzWVNQTEhk?=
 =?utf-8?B?Y3drUmFuSTQ0Nk1lZElrQ1BlQjJsbUxybURORFIwNHkxZmUzaTJGNThrdGs3?=
 =?utf-8?B?aW5DRkg5bGZjbXMrMkdIbUJ5N0hVWTh3aFQwRUJ0THBzL1pUN0xqc01mOFdk?=
 =?utf-8?B?a0lyb3RxUU5qWjVjanRrYWlsWWdwMU5ydVJnVGRSb3BOK0dLWmxJWkh3UTdB?=
 =?utf-8?B?OTJkaTBDc0g1anpWTExMK2JMT1J2bFREYStXWUV5TjZ2czFhY1dTVDFhOHVT?=
 =?utf-8?B?MHFlVnNLY1BRY01EWk52OCtPSysyZTA3MTA0YTJEVlhDYVJYbHhuT1RXQlZB?=
 =?utf-8?B?UFErTUdqOXByMmJmRDJvTmVDaUxlVGw2Q1A4R3FXMWdRc05kYnlYTUlzNm1W?=
 =?utf-8?B?Unhmd1ZXbFY2bDBTRTNiZXpsNWp5MWZRMnpFWXFWa3E4WFI2dTU0Y3FIYVQ0?=
 =?utf-8?B?Tm50TVNSd1U4NElkTmVDMGN1cnMxN1BPMURnQmNvRDdHamlFQjdWSjZyZXE5?=
 =?utf-8?B?cnBjd1l1cnA3YVo4eGg1VGhFUEJ6THZLa2NSUGlFLzVhTk9kSzlsV1pzS1Qv?=
 =?utf-8?B?Nzl4MEd6QWY0Mm9RMWNxblFiNnd5NXc1azh6MHZQY2xLVDhhNFpqS1lYTE1F?=
 =?utf-8?B?RG1RZE5IVlpWTVFGaFhleWRSeml4YWlZZUg3Qk9sMWMwaE9xQ1JiNnh0ai9J?=
 =?utf-8?B?Ukh2K21USnRGMFl4UU5qVTVRRWhLZktiRVpKM2FVSHh1alZFUDUyeHg0bTJ4?=
 =?utf-8?B?SW5SSjhkTXFJdjVNRTlqZ0c2elJGVUtCVmhIMDQra2lxZ3VrL3F0VlVacERv?=
 =?utf-8?B?R082czl6YVZxYlY2WUFmbjBMS09oenRYcC8yZVhSZS9aS2JkelQ1bDZGWjhR?=
 =?utf-8?B?VG5sMkUwRk8yU21DRWtSN0JEWXlTT2UzR3YydGxFYnNUMVRkdW5qUWFDaW0y?=
 =?utf-8?B?bFN2cjNLMnMrNE5pQ2E4TlM2MjlySDZJSVR4SS9HMG1FaWhtNHBmZ3A2Vi9S?=
 =?utf-8?B?K3lqVTYraXI1aDRrRHlkTjZEVUowalF0Tk0xdEdXcVBmekw1c0UrQUJzajhE?=
 =?utf-8?B?KzdVb0UyTEtiQU14c090aHVGRERBOWVCT0RpdTFGOUlHU1k5M3dsbzAzdDFx?=
 =?utf-8?B?K0JZMXJ2RUQzMzhtbVpncVkrRzg4dldTcEo4TUUrckxGR3EraVVzbDB5WFQ0?=
 =?utf-8?B?cWtwRU9hV3pCZGJDejErN08zNGxhMnlhcmNSbk9YV0djemU4UUFtYk9hb0dC?=
 =?utf-8?B?UzdESGtCalBqc3NhTkxxVkFJYkZPTlpqc2lhY3l0OEpRQ2lsQ0tpdWQzaDQz?=
 =?utf-8?B?NjZPNWRBRnY1V1poYkVvR1JvdHgrUS9vMzdOUmdlVGZ1OXlCbE5LVWdNL2Yz?=
 =?utf-8?B?VzdrS2tKTzk5RFdHbTVtWmUyTjJBNDVscUpUSU05V2EvaXJuZjlicUxlNE90?=
 =?utf-8?B?WUpCaUxWbmU1NDF1TkgzR01oVzM2dE14TFlhcTZyMjFTa2dYTzBPd3FjMXBV?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: lenbrook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caf8bdd-e19c-446e-bda3-08db29741526
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 18:51:15.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3089fb55-f9f3-4ac8-ba44-52ac0e467cb6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkeJ3l1nbKzN5Xi8WD4QuG3E4o05JTfnG1KnVb28W96Har4ZvtfnLTSt+bpS6+7saSdnZwva0oHfpRVnuFb+7OK6LTd6PXvgY3ZhW1nB+yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB8862
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

Hi Neil,

On 2023-03-20 06:44, Neil Armstrong wrote:
> Thanks for the patch, can you provide a Fixes tag ?
> 
> Neil


As with my other recent patch I did not think of adding a fixes tag as 
this bug is not a regressions but has existed since the first commit of 
the driver. If there should be a fixes tags then it would be:

Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")

Kevin
