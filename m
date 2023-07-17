Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18609755C6E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CDB10E1E7;
	Mon, 17 Jul 2023 07:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2133.outbound.protection.outlook.com [40.107.7.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E1A10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN8L/+mtZSrT9A4TBgdLBIxD0yxPqLmugtddszXF/WskfJuzFSUOB4+TOq66uXwNv7bbmGlYLWeo7bf3co+9jbWefaEayTjH8Ooe/KPLbwuSWeMLICBsogrpcjoOlPomXU27vH00LUQsm4DH0OJm+KeNw26Q3+PH6GQnIwGTguQ0ev8FaYHFcr56KSiw1x6fZ69RqUwLYSMHuCoG151E62GDR5uOTlwyyZHEgDezLkA1EylT3zqyXimbeYjF9Glup0MSLtWdILzMjqcJ/edOxmaIItBdron8VeSHKJUN6OFeXU+VInndxZ7f2OZg/Tp+SRyeN7Npt4WepYc1QaVlXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAshzTcfZAw3LwGxpBpizScQMompx5yjyGIpJQ/eOpo=;
 b=erX9CZbmhiyxfn19Q/nnHyrT8rRlHXr+t4rRUJ9vyZMPuCupJP3879fRLlsL1cqTMfnmqTphf6UCv8vggS9q2QBtU5lYUWnsYZR3BjwQ04qKJXhUgUhDp1/ScUfXj13BWkzBpUSe34A4fEj6iw9MEfvPQ6tpr6RDOcgWcBnE3BqSrK6Bw9xTO4wB1b7TuvK0DDV3rupYDmu4m8rI6FEyrA6o+PhrZJ+IK3Jjq1NzRozQplVMzo44OUKDTCq6fL3l8CKa0BeUC0Oochnb7GWNRnnVmlWctnqr01lLwTBt810qAq+eAdaBOFiQFmNzFZ9y2f43LUvWHAs+KxgPlKSMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAshzTcfZAw3LwGxpBpizScQMompx5yjyGIpJQ/eOpo=;
 b=SRF+fw6qRjZ4j7wQtitN8C/b+hL9+UEj4jmsvOgeLyOsYYmmumYQXVDmC7923k5v7XnV6vSDRXRQDpC/MG/y7rl8nNo0jYv/f4+GpbcKncEKYGlK1MWXputDpj6d2rVOvHiPym5mLQFkxAOQa88q4BLmpWBcIf1y1Q5+SSsTLyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6679.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 07:09:09 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:09:09 +0000
Message-ID: <298b02d6-135e-70f8-f9b6-8f960e9485cb@kontron.de>
Date: Mon, 17 Jul 2023 09:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] drm/bridge: Fix handling of bridges with
 pre_enable_prev_first flag
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230707190020.6280-2-vladimir.lypak@gmail.com>
 <7c4affcb-bcb4-5f4b-cc2f-bed2cad9de71@kontron.de>
 <CAPY8ntBWmfDPwPJS_z5tko7PUxHG9pVQ1DOKC3baGDCNzMzykw@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPY8ntBWmfDPwPJS_z5tko7PUxHG9pVQ1DOKC3baGDCNzMzykw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0130.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::9) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abfffaf-d575-4e8b-f402-08db8694b77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5YVF6krv0oXpW8tAtCHyfCdhI7WvtUSLrXk/L7ZXML9adKNDHWSqdPwAr8ufVFkVeiY3w0km1uNGQbQDb+L7sce/2s5M455Lps8GH6S7lkrDflOJZFpvtgqWPBw9td8MY4TXi4MnOZPZiuNMy9tjwZ3B3UunrxH52vU4Z7wrwZTkvS250OEaDV6Kqu29N2eNoBmCRbDu/OJnau9xI1cnH/cz5UCIOJ0KXcoJxJ/lNbiXOowZTq1y9lIg9lZQ994euD7YoPBJlKgql6cK8IEfKe4Gpc4E4VTUDkVYhnZelu2tNpQUw0x8HTHmnSJJ8R7u2q/ex/Mpprg2BNJgPF2EWNINOj5VUJSS4PmO1fQhB9YsgRiqTGeYrmaFUXc2j6u/UAgjlz7ygzrMxPcQnbilS+QRK4J2GbkbYLWY9tBKkAvKNxdCWTuYwJJhZL+FvOcn1JZQb4ozKUoDfcUqrWBgaSITxUrteozxGxxBxcZjCH8VI/dd8+BLomwRH3XnVUMpV01wnat1l6oP2+9z7h01rFirxcKDM/NL445b4wbdfnb/gSdZu8IZ4Y0Mbid5noNr8zp+y+0/vbjjlYXpXlwvl0RMB7BMG79K1IqVTl8RvWmhe9wWg52+k9tLbZAcRTUIXNwb4QyE8j2jHH5AVeEkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(31686004)(83380400001)(478600001)(45080400002)(186003)(66574015)(31696002)(2616005)(86362001)(6486002)(26005)(6506007)(6512007)(966005)(53546011)(66556008)(66946007)(7416002)(38100700002)(44832011)(54906003)(41300700001)(2906002)(36756003)(4326008)(6916009)(8676002)(316002)(5660300002)(8936002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVITjIxRFBiQSt0YnIxVSsrTmtFVjBwWDFoTEVGUCs0amNadlBucnQ0YlVV?=
 =?utf-8?B?UThKdzlWS241NDlHNVhwazlGYnNEaFhudnR0TlhlSjIyVGRtUWgwSG5NU0ho?=
 =?utf-8?B?ZXNyblVNQ3RQN0JzeTRSeDBXSlFCSHZNVW1BYzVodnFPVkJ1em5LRlhRdWhk?=
 =?utf-8?B?VU0wODRXWlJndy80OW5pd0hRTVcvaHBvOVVzWUcwMDFmQkMybEhLRU8yczhY?=
 =?utf-8?B?eWticHhJRGJkeitaSmIydzZSWFM5amUvcy9qVTVZblFDK3dpakVZS0xqQTBi?=
 =?utf-8?B?RTlpSVhYR2k2RURGNGY1eFFaSlcrRDlURVgzYzh1cVVXR0dPeFZ0WHAraGlX?=
 =?utf-8?B?bTVJQmZOa3U3Z25oQ0RqY0U3YTh6Wm1FcmtBd2F5SEZHZVNqNzl6elJoOGFr?=
 =?utf-8?B?ZU8rcGpxVjdsMnFHWktlNHkyNDgwbTNIMHlBTUZ2WDRwek1haVE0OGREa0pu?=
 =?utf-8?B?VndRdjBFMXh3RjltNUwwWSs4dVVtWFZRTXhYR1VYYy9PUndGeUNycElRUGM1?=
 =?utf-8?B?bW9WWEM2aXp6Uk9mVkRmTWdiTkRuSHREamdZNDB3cHhIZi9ZM2JuZ3oyL0cz?=
 =?utf-8?B?d0FLS0Z0VEpPTnNiYit6SGx1MkhNUlFmMFFhUzJKbkE1bXZFaTVQZ0lqMUNW?=
 =?utf-8?B?bUF0aUlySlJmVldHVWt6K201b0RVMVlSRS9Zdmc3NzdPYzF6WXBua0FuMFJn?=
 =?utf-8?B?YnNGVkpzVWxsVVdtNVJhM2s2RkhRcnp1QUQ3VSt2WFFRaC8xalVKMmNwVDAv?=
 =?utf-8?B?SGl5NnhTK0kwbXRkU0VOU0pqQ2h1TzdzRTdFaEdtWmhHRG4yUzNsRE5KWEo2?=
 =?utf-8?B?VnVRbmQrdUNhWWk2bzVyNWZKcTNiWnBjdGJ1Z1F6bDFPTEo5akVKZVhua2hq?=
 =?utf-8?B?Y01sZ3JqcTBMSEtNSjBaNXl4bytUWHZpTXdnaCtEdEUrcDZoVk9tcDg2elRJ?=
 =?utf-8?B?T1BuWjNFeWhaeXdLWjl2Nm9lZjhQcnFXTVhLeDU0OG5tcGcxek1aUlBOc2Fp?=
 =?utf-8?B?TkJ0MENBNUhIeTBVanRxbU42ZWM2STVBdVlKaUVWcFFlVWwyN0R0clJMbkdL?=
 =?utf-8?B?aG1paHBZM0NvYXh2eHJEZXFQTnVuRU1qRTlRYkxWdHNhVEpSd0x1V1FGSGUz?=
 =?utf-8?B?ZWZYNDV6azhERVRrYWhuMmVHSzh3TzFiS1QyMTU1NmduRWtONkxxVDMyOUlu?=
 =?utf-8?B?QW9ZQ3BqL3QrSFdvSThYb2MzZFFweEZWbklVbDBwR3BoMEZ2MmRjbmF2elVx?=
 =?utf-8?B?bWs2bHlIa05rYm9nQ0RvMXdIU28vNjFxY2loalAzMERJUXoyUFp3U0RqbkhV?=
 =?utf-8?B?K1ptbGticWxWek1XcHRxUGtyU2lCMVF0UFRsd242TUZiTCsxMm9VeGJaNzlH?=
 =?utf-8?B?MS9SMFpuUkVZTmU0TXVIVy9VTDFDQ2tWNUVTYW1HMGU3YWc5amJBZ3BBb3Zk?=
 =?utf-8?B?WDhYS2JObUxsaVdkL1Z1V3krcWtIcCtYVWVGdzY0Sm12ek95eVR0SjZGLzli?=
 =?utf-8?B?NGNHNVpaeGxzOG1wV3BsL3A2MVU4bkJYZU5waXZsaFAwWE1kbVltS0o1Y1FU?=
 =?utf-8?B?Mkh1ZDlCTGxMQUtPQ000UFY5eFY1dzFhZVp3N1MyVzZQbGpDRGpuUWVYUXd1?=
 =?utf-8?B?M2hia0tVT1NUbTE5R2hCa3pDWndBSFNtUXlKSmVHUzJpRlQrR05HMCtkMDdZ?=
 =?utf-8?B?aUxKZ2ZkRzlqbDc5M25UWEdJNWNCNWc2Zm9hZjIyazUyMmVIOWVVSlVTWUE4?=
 =?utf-8?B?c3FXMHJjbmM0ZzRXaStBZzJJZ3B6ZHdtWmtMY2wxWHlGYWpXN25zR1lwOHdX?=
 =?utf-8?B?cEJCNGxmQkxhTFNwZzlOam5rZlVSL0lIb3p0MytFcHZPbzAvVmVES2NBaFRa?=
 =?utf-8?B?UmJLcmpmaXlFOEJVZnQ4NldVNVpMUkQwVFduSVl0Q2dxWkhqU0R2T1p4L3g3?=
 =?utf-8?B?cnFwRmNacW9sdjlnQXE1Y25ZZ005ekxJcjZxcUVianM5M01hMjNUQnR2NDBL?=
 =?utf-8?B?QlJiQjVORUVrK3gvTU85UHpZVURacTRwU3hYVzJDdHp2NnNMT1ZydjZlL3Nn?=
 =?utf-8?B?YmRiRUlMWjZsTmlNcWJuMHZPaGNVYi9uZmFCY2JyanAvWlVTUS85OGp4UW5T?=
 =?utf-8?B?NDhJS05hMHQ0S3VMZ1F2V2RWUmgxS0U2elNmc2s4ZzJNSWNNdUdNcTdjYXlh?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abfffaf-d575-4e8b-f402-08db8694b77f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:09:09.6514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4pLosAfR3zVLj9y668D2aR5ySZb/vqSGnut+KCEP07zyZmwiNQ713n3JCCk2+WokorEem4lLTnfeecbVQDBAWwzwz1qXDeWfc7CFc2TxhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6679
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.07.23 19:16, Dave Stevenson wrote:
> Hi Frieder
> 
> On Mon, 10 Jul 2023 at 08:46, Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> On 07.07.23 21:00, Vladimir Lypak wrote:
>>> [Sie erhalten nicht häufig E-Mails von vladimir.lypak@gmail.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> In function drm_atomic_bridge_chain_post_disable handling of
>>> pre_enable_prev_first flag is broken because "next" variable will always
>>> end up set to value of "bridge". This breaks loop which should disable
>>> bridges in reverse:
>>>
>>>  next = list_next_entry(bridge, chain_node);
>>>
>>>  if (next->pre_enable_prev_first) {
>>>         /* next bridge had requested that prev
>>>          * was enabled first, so disabled last
>>>          */
>>>         limit = next;
>>>
>>>         /* Find the next bridge that has NOT requested
>>>          * prev to be enabled first / disabled last
>>>          */
>>>         list_for_each_entry_from(next, &encoder->bridge_chain,
>>>                                  chain_node) {
>>> // Next condition is always true. It is likely meant to be inversed
>>> // according to comment above. But doing this uncovers another problem:
>>> // it won't work if there are few bridges with this flag set at the end.
>>>                 if (next->pre_enable_prev_first) {
>>>                         next = list_prev_entry(next, chain_node);
>>>                         limit = next;
>>> // Here we always set next = limit = branch at first iteration.
>>>                         break;
>>>                 }
>>>         }
>>>
>>>         /* Call these bridges in reverse order */
>>>         list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
>>>                                          chain_node) {
>>> // This loop never executes past this branch.
>>>                 if (next == bridge)
>>>                         break;
>>>
>>>                 drm_atomic_bridge_call_post_disable(next, old_state);
>>>
>>> In this patch logic for handling the flag is simplified. Temporary
>>> "iter" variable is introduced instead of "next" which is used only
>>> inside inner loops.
>>>
>>> Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init order")
>>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>>
>> I haven't had a chance to look at this, but I still want to reference
>> another patch by Jagan that intends to fix some bug in this area:
>>
>> https://patchwork.kernel.org/project/dri-devel/patch/20230328170752.1102347-1-jagan@amarulasolutions.com/
>>
>> +Cc: Jagan
>>
>> Dave, as you introduced this feature, did you have a chance to look at
>> Jagan's and Vladimir's patches?
> 
> Sorry, they'd fallen off my radar.
> I'm having a look at the moment, but will probably need to carry it
> over to Monday.

Sure, take your time. I just wanted to make sure that you are aware of
these patches and the existence of a bug in the code.

Thanks!
