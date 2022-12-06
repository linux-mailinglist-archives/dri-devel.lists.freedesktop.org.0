Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1EF643F3D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 10:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FE410E303;
	Tue,  6 Dec 2022 09:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2111.outbound.protection.outlook.com [40.107.20.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5010E302
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 09:02:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0Eg7dw63JkT34StXAkLSrxmcbb56jYYtP7svnLxPHDCnK39KX0TOBq95m0w/juC9ev43BDitfsBG1S4vXciUGwhY1s6/3fKueyYVVfDDmnF0KhRlx75jwPwTNOoxO1HAEzdlup5RwViTArEtgmNfBvBgPMHtHSovK061KvIxChqL/Q+M2aA6zlwCDtTc8Vml0NMNEziLFE28gO3KcTb5My2O6mw5ab0Umr2XXwNGQ4dke9QPuhQpyx3oTQG6fukiRXTxmcISmXdeFN66grelk4WjDw/83SlRLYrgD+rH+DHnMLbP2lidqrirY/b3Vz1Br/1xFxi7ZfkOnpa08J5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfPXk19Bs+xLLX7caiizIDlSkr10I2bR8FHCttCehS8=;
 b=WW6NZnXWTXJ6JmCsZ7Q2ilQO5VnMqF4QfPMd03eOZ+OONVomF288R7r3dnhDkSYtNoaWohVwPRUIlRfqNzOA4z+Y3loycgvh0/iB2JW7sbaxf8qBzI5Qs0l0mKRAsBL0ITs0OLl/u7RNbsYWH6XkEYahe4SZvwnMjcrpy44M12P74lAw1jTqGCxgJKmybx3p01x0YXCg/G5rOMahV62ZlUGHdvbMH6yNJw66btB7FrCkFPZd7AwECfbp9eab7SbghniUu9NMEiCPP/TK6UeGIC8Sd0Xn8AyilzE+oyDMmtz888MLC4iatU/Rqd9/scIoi5P8CViGGESHD8Ft8SBgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfPXk19Bs+xLLX7caiizIDlSkr10I2bR8FHCttCehS8=;
 b=dJ4BtFuFAT5xPQSBO810zuJRraFKdJOnxQEm7Rc1IvilUo8VyiLZ8hnYXDyuE+bYmthN2vJDvlImErsRumU5EQB/+osBZG3gHwKU8kKQe7vBwa0LB5zVv5+EQzBfkBmxfqNC5Lbp1qjNrdkYwRvFLPMURWrQw738rnNiFxEGzl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB6820.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 09:02:06 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Tue, 6 Dec 2022
 09:02:05 +0000
Message-ID: <fcef073d-3046-2714-d87c-4c42d6a4bce0@kontron.de>
Date: Tue, 6 Dec 2022 10:02:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
 <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de>
 <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com>
 <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
 <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
 <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
 <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
 <e32280e4-0c8e-f823-051b-8d0802d6fdb5@kontron.de>
Content-Language: en-US
In-Reply-To: <e32280e4-0c8e-f823-051b-8d0802d6fdb5@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS8PR10MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 0362281f-45cf-48f4-b9eb-08dad7688c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBIHkjemMrOj8Z0ALQSB47wsDaRcuVRO23EZOA4iwCRO0KUMcyPajl2v0P27iQX3p7lm1O2s0EMIuyMcMQhGo9RRllv05DyYFdco7gbKYc+go8yp8Sy39C8exBExTb4j/NeYsOyT+tfboHSRuMXZxApMCPERingxPivzJNJtH9xsK9D8vEBaW7jnSWFxuH+Q1DO7KiU31RKszpAttL8DL6SM6lLdWdZ8UeuhHr04r+72o1XwwMFX6rtKUGnzViBpomlBzoLoBcsNc5zfACM2taA9EjWZCPZGXSA7IntWQSRW0ZkpOpAwFG56C5+D4oabry+YQHC87ACjjrrOsj77fklbTG/ynj4MfjJRwjL3C+gRK0JTk7xNyorkLtBEDSmuzk3jYA1KCTTW19ZLECrcOlgFnOOdMXloyA7cBlSTnoIck7S7uVUD5v5PTKYNA/afTl214bFSpKD2fDeo+HakjXm3Z9yD/FaPh0x7SWC4nfXZv3G21l8RaorZ+h+Qsu5G/DsEI1tkcGkE3+Noz2vR+KbY00At116PdQ6hYoTu9BV7yfxeZKcf0CN7ALDf8OEcfHZSLsCKPTSo2VLA6BcjfokZ7vNUpU7qsDLA/CsZyBYtHQphQGmMjuHzlKByAuAGWxti9qj3MJ2k15Y9ht+Fjp25L3Ht+6gXyzQ9z+HoDu6Z9h2ODdNE5AjDB+TZ8+dKv08m4pDJScJ+4gRI/MJpwrXFycj8lcHKFDbYsdUXHqY9+HdBQg9RIztrrirZ+c0c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(478600001)(31686004)(6506007)(53546011)(45080400002)(54906003)(4326008)(6916009)(6512007)(26005)(966005)(6486002)(66946007)(66556008)(66476007)(316002)(8676002)(2616005)(41300700001)(186003)(8936002)(86362001)(5660300002)(30864003)(2906002)(38100700002)(31696002)(7416002)(36756003)(44832011)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlhSVhOcXVjOVJMeXQ0Q05xZzhnS3FpQXVveUhzTmdHV1hFSFluUldnYXh6?=
 =?utf-8?B?RktwMzFWVnBzY2UxY0MyamMwcGpmT3VOTzgxNmx1ZzFUaWE5Z1g3ajVYaWlh?=
 =?utf-8?B?eU1TeUV4ZVd0OFNwYTd3ZWFNUUVIU1U0RzRsVDg4MVYwM2dlU0NYcWg4czFN?=
 =?utf-8?B?WXpnQk9NVW1NcStJSi9KT1EwV0RiTlRZVWJXQ2VvTGx2MWtoL1R5RnRZT0ZK?=
 =?utf-8?B?MERVdmdzZXVsS1ovdmord1NCbG81ZjdNUlgwUHBvdlNNR3BwMTFtVUdrSzJU?=
 =?utf-8?B?NXdhS0pjaWNyR09hNHE2TlczdHo0QzJ2UzEreGpIQXNRalBxZHZ6QmdwUC92?=
 =?utf-8?B?bXBjZCs5TDJ3T0lwL1BvYzVNUmdIUEhlL29tUm5aREVac2RaYjBBZ3d6ZjUr?=
 =?utf-8?B?SlMwdjNxUUcwdmpEa0ttUDg2cjRxWUI2THZIajhzaTZVdWE3cjg4ZTQyVC9m?=
 =?utf-8?B?Y0tvOE9TMDVhMDNxYzU0U003K3VqR1gweElwOVBxSXFyUW1iUHBjSXhPRzBK?=
 =?utf-8?B?ZFAxU3QwWUVqUUd1eFJsTGl3eFR0ZlUxUjdrdjBYU1lZQmlyZ2paMlk2RGU1?=
 =?utf-8?B?RTF3anB5cHZZdTRvWlRGMVl2NENWNG9vOGh0bk82WTYvN3hJTzhzb3A3L0di?=
 =?utf-8?B?d2htZWVJYm5GWlhPUkJoaXU4cEx3SFFMUXluaWtjT1ZpeGJXTTVXUWxsOWx4?=
 =?utf-8?B?S0xNNTBnWGdES0VBQTcxMlFGZGJsd1lCYlBtK3ZCNzA3ek4yUTU1NjZyczEy?=
 =?utf-8?B?SnJINlViZENQWlJWUk81SEZqOG5pWTl5M1NUWmhLWFRtTVNjVCtFNGZrL2R4?=
 =?utf-8?B?cXhsRU9VeTRiUzBweEhENWpXQkozekRiM055OWwyV2E2V2djR0JyWEY1ejdu?=
 =?utf-8?B?OU1hNUttQk5yK0xYYlFvNVJLMmlrZTQ2ZmdveHNhRGlSOUtuYjQyd1BFTXNB?=
 =?utf-8?B?NUhSVFVQR3l1U1drL3pGY3lIeEh6MVZDaVRuZUhXYzZsd01VRGdYclduWVRq?=
 =?utf-8?B?ZGs0cHFkTkxBZDQxQ2t6NlpCTzV0T2dRS0hXWUhTZHFOb2lJNkxGbm0zdjlq?=
 =?utf-8?B?eUtKQkNCVkxBQ09YcTh6WlFrbEprM2NaRGF6VjFwYi93WVowQ2RFd3R1VHdK?=
 =?utf-8?B?REN6dzlWTXNSSGtSNVFtTWFta1p6a2RQdnVoQWo5MEpZMTBINlRBTGpRSnB2?=
 =?utf-8?B?dlVBcXpFMER3WnN4Q0dGN1BkZTZYS0JsemtSOGlvVmRGZGxyRUNjbTRnZG9P?=
 =?utf-8?B?eXJ2aWVQZEFTN2piSXlOU1NoT1FxOUpwL1JQK3M3TUZsaFlWUmQ2ZFFoTnY0?=
 =?utf-8?B?RFV5dkJoeVVVbFQvRWEwcERsaHJBaHhvb2dlMXZjek5Fak1kZjNDNkxkS1ZG?=
 =?utf-8?B?MlBqMFMxOG1aS3pqTUtMMjIydWtZdDhZZlA5ZEJHY3VGTnR0K29DSXFxMUo4?=
 =?utf-8?B?cFFrajJQR2k5Wi9TVHVnelFUTVl2ZGVBMmtOb1pOY3NMZ0lNcmJ6K0J6TjFJ?=
 =?utf-8?B?dVBzcFpFQ21HMFdrTHR4MGVJQjBpS3NWYWN0bUJuYlR2TFk0ZUJWYW40SzFr?=
 =?utf-8?B?UGh4WG5pZUs5SWRVRmVYL0FOZEdGaTMwclJGVDJ5V3hQSkhWRElvZXJyK1ZS?=
 =?utf-8?B?K0hROW1GdS8xUHJFdFhTVDczbFN0REhtV3FwRFpyRytzU2pMYTlYSkl3NThF?=
 =?utf-8?B?VWdPVDJaN2VRV1VhVDFZK1kzb3d5UmtwbWx1NUU5TTRCSWlWMXRSMXhlS2p6?=
 =?utf-8?B?UWZ0TGtjSGo4bXh1a1BlRldoT3JjL2l3dld3VVVBNlVqdW5oYUN3Nk56MzZj?=
 =?utf-8?B?UXU0RjJnRmxra0FFcmI0Y3pBQmxsdlJMQnRySnZBUGswbTVJRTJQZ3NoZjcx?=
 =?utf-8?B?d3FQVXM0OXFRSUVteTIybCtIL1UzUjZkZFZMcXphWkNjbmFBMGFNRm9pQytY?=
 =?utf-8?B?dnZKY2VWUzlpRjJHZUlqZjFyUVZtcXZ0bkFTL0JiaElPcy9sazFYcjV5QVlZ?=
 =?utf-8?B?R05aSjVEM05weUJ4QlhINU5QRDBlQ01SamNDSk56UmxtYWVjZDExV0d0RHVm?=
 =?utf-8?B?bE1sdGhEUjdORXVBbmFTMSttaGRIZmhhdmZMN3pyQWJSZHFkN2k1YUJrMTNs?=
 =?utf-8?B?RFd2d2dSUG1CZnprVzVMdTVzZGtvSkxWTDhZZStKYjJhS3l6cDNRak54QVdm?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0362281f-45cf-48f4-b9eb-08dad7688c53
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 09:02:05.8633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUBCwUIjbUdMCh8rciTSa9xlXYqjP1SkIkZThS4kcDQ50PUNSVp/ixisVn4OfVjvZ1nwsJ6O/1QiVmFC5++rjjw1hxjSeQwAwbkW9597iVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6820
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.12.22 16:37, Frieder Schrempf wrote:
> Hi Dave,
> 
> On 05.12.22 16:20, Dave Stevenson wrote:
>> Hi Frieder
>>
>> On Mon, 5 Dec 2022 at 07:30, Frieder Schrempf
>> <frieder.schrempf@kontron.de> wrote:
>>>
>>> On 02.12.22 15:55, Dave Stevenson wrote:
>>>> Hi Marek
>>>>
>>>> On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> On 12/2/22 11:52, Marek Szyprowski wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Sorry for delay, I was on a sick leave last 2 weeks.
>>>>>>
>>>>>> On 28.11.2022 15:43, Jagan Teki wrote:
>>>>>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>>> On 11/23/22 21:09, Jagan Teki wrote:
>>>>>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>>>>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>>>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>>>>>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>>>>>>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>>>>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>>>>>>>>>> configured downstream bridges.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>>>>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>>>>>>>>>> and enable in order to initialize or set up the host.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>>>>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>>>>>>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>>>>>>>>>> Szyprowski).
>>>>>>>>>>>>>
>>>>>>>>>>>>> v8, v7, v6, v5:
>>>>>>>>>>>>> * none
>>>>>>>>>>>>>
>>>>>>>>>>>>> v4:
>>>>>>>>>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>>>>>>>>>
>>>>>>>>>>>>> v3:
>>>>>>>>>>>>> * none
>>>>>>>>>>>>>
>>>>>>>>>>>>> v2:
>>>>>>>>>>>>> * check initialized state in samsung_dsim_init
>>>>>>>>>>>>>
>>>>>>>>>>>>> v1:
>>>>>>>>>>>>> * keep DSI init in host transfer
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>>>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>>           disable_irq(dsi->irq);
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>>>>>>>>>> flag)
>>>>>>>>>>>>>       {
>>>>>>>>>>>>>           const struct samsung_dsim_driver_data *driver_data =
>>>>>>>>>>>>> dsi->driver_data;
>>>>>>>>>>>>>       +    if (dsi->state & flag)
>>>>>>>>>>>>> +        return 0;
>>>>>>>>>>>>> +
>>>>>>>>>>>>>           samsung_dsim_reset(dsi);
>>>>>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>>>>>>>>>             if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>>>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
>>>>>>>>>>>>>           samsung_dsim_init_link(dsi);
>>>>>>>>>>>>>       +    dsi->state |= flag;
>>>>>>>>>>>>> +
>>>>>>>>>>>>>           return 0;
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>       @@ -1269,6 +1276,10 @@ static void
>>>>>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>>>>>>>           }
>>>>>>>>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>>>>>> +    if (ret)
>>>>>>>>>>>>> +        return;
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>>>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>>>>>>>               return -EINVAL;
>>>>>>>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>>>>>>>>> -        ret = samsung_dsim_init(dsi);
>>>>>>>>>>>>> -        if (ret)
>>>>>>>>>>>>> -            return ret;
>>>>>>>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>>>>>>>>> -    }
>>>>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>>>>>>>>> This triggers full controller reset and reprogramming upon first
>>>>>>>>>>>> command transfer, is such heavy handed reload really necessary ?
>>>>>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>>>>>>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>>>>>>>>>> initialization conditionally, in prepare() callback in case of IMX and
>>>>>>>>>>> on the first transfer in case of Exynos?
>>>>>>>>>> That's odd , it does actually break panel support for me, without this
>>>>>>>>>> double reset the panel works again. But I have to wonder, why would such
>>>>>>>>>> a full reset be necessary at all , even on the exynos ?
>>>>>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
>>>>>>>>> whether a reset is required before calling it might fix the issue.  I
>>>>>>>>> agree with double initialization is odd but it seems it is required on
>>>>>>>>> some panels in Exynos, I think tweaking them and adjusting the panel
>>>>>>>>> code might resolve this discrepancy.
>>>>>>>> Can someone provide further details on the exynos problem ?
>>>>>>> If I'm correct this sequence is required in order to work the existing
>>>>>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
>>>>>>> possibly fix the sequence further.
>>>>>>>
>>>>>>> Marek Szyprowski, please add if you have anything.
>>>>>>
>>>>>>
>>>>>> Well, frankly speaking the double initialization is not a correct
>>>>>> sequence, but this is the only one that actually works on Exynos based
>>>>>> boards with DSI panels after moving the initialization to bridge's
>>>>>> .prepare() callback.
>>>>>
>>>>> Somehow, I suspect this is related to the LP11 mode handling, which
>>>>> differs for different panels, right ? I think the RPi people worked on
>>>>> fixing that.
>>>>>
>>>>> +CC Dave
>>>>
>>>> Yes. I've just sent out a v3 of that patch set.
>>>>
>>>> Hopefully setting the pre_enable_prev_first flag on your peripheral's
>>>> drm_bridge, or prepare_prev_first if a drm_panel, will result in a
>>>> more sensible initialisation order for your panel.
>>>>
>>>> Note that host_transfer should ensure that the host is initialised, as
>>>> it is valid to call it with the host in any state. If it has to
>>>> initialise, then it should deinitialise once the transfer has
>>>> completed.
>>>>
>>>> Dave
>>>>
>>>>>> I've already explained this and shared the results
>>>>>> of my investigation in my replies to the previous versions of this
>>>>>> patchset. The original Exynos DSI driver does the initialization on the
>>>>>> first DSI command. This however doesn't work for Jagan with I2C
>>>>>> controlled panels/bridges, so he moved the initialization to the
>>>>>> .prepare() callback, what broke the Exynos case (in-short - all tested
>>>>>> panels works fine only if the DSI host initialization is done AFTER
>>>>>> turning the panel's power on). For more information, see this thread:
>>>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fe96197f9-948a-997e-5453-9f9d179b5f5a%40samsung.com%2F&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Cee7b57ee420e45a73b1d08dad6d45306%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638058504671330145%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TQIIKNa4OVGP1dZo3tM%2FOMO3dlXrjLr04U%2FJFhd2rAs%3D&amp;reserved=0
>>>>>>
>>>>>> Now, the more I think of it, the more I'm convinced that we simply
>>>>>> should add a hack based on the HW type: do the initialization in
>>>>>> .prepare() for non-Exynos case and before the first transfer for the
>>>>>> Exynos case, as there is no way to detect the panel/next bridge type
>>>>>> (I2C or DSI controlled).
>>>>>
>>>>> Let's see what Dave has to say about this, maybe there is some further help.
>>>
>>> Could we agree on adding the HW type based hack Marek S. proposed as a
>>> quick fix?
>>>
>>> This patchset was tested on Exynos so it's likely to not break any
>>> existing setups. And for i.MX8, this is a new driver so there's not
>>> really a requirement to have all setups working/supported from the
>>> beginning.
>>>
>>> Also having one or two hacks (marked with FIXME) in the code doesn't
>>> hurt. As we can see there are drafts to fix them in conjunction with
>>> changes in the DRM framework.
>>>
>>> This has been pending for months and in my opinion if there's a chance
>>> to get this into v6.2-rc1 we should take it.
>>
>> My patchset was sent in March with no one seeming to care enough to review it.
> 
> I wasn't referring to your patchset but rather to the Samsung DSIM
> bridge transformation patchset.
> 
> My point was simply to not try getting everything done in one big step
> because this will fail. The patchset this refers to needs testing on two
> separate platforms which is painful enough (thanks to Marek for covering
> the Exynos side!). I think we should focus on getting the DSIM bridge
> transformation merged and accept a few small hacks that will be taken
> care of in the next step.
> 
>>
>> If the situation is that your devices fall into the same camp as those
>> for vc4 (the host needs to be initialised before the peripheral), at
>> least verifying that would be useful before rushing into a hack.
>>
>> Your other comment references using a TI SN65DSI84. I know for certain
>> that falls into the category of needing the DSI bus initialised before
>> it is brought out of reset.
> 
> I'm actually working on this right now and when I received your message
> I was about to start typing a reply to your patchset.
> 
> The SN65DSI84 works with the i.MX8MM DSIM even using the default order
> of host init after peripheral init in our setup, but this configuration
> doesn't seem to be stable and occasionally the bridge doesn't come up
> properly.
> 
> We are still in the process of verifying if the reversed order fixes
> this reliably. But regardless of the results, without the reversal the
> initialization sequence is way out of spec and we need to fix this in
> any case.
> 
> See here for my testing branch including some follow-up patches that
> improve the initialization flow for my setup:
> https://git.kontron-electronics.de/sw/misc/linux/-/commits/v6.1-dsim-mx8mm.

To recap my thoughts on the two hacks for the DSIM bridge driver
discussed before:

(1) Passing null to previous bridge in samsung_dsim_attach()
(2) Always initialize host on first transfer (see this patch, 06/14)

My wild guess would be that both could be fixed up properly in the long
run by the following changes:

* Apply Dave's patchset [1]
* Set pre_enable_prev_first flag in the downstream bridge drivers and
  fix init flow if required ([2] for ti-sn65dsi83)
* Fix DSIM init to keep data lanes in LP11 until enable() is called [3]
* Only call init on transfer when not already initialized and deinit
  after transfer (tbd)

As that route needs proper testing on the affected hardware setups and
includes changes to other drivers and the framework, I would suggest the
following for the v9 of this patchset:

* Keep hack (1)
* Make hack (2) dependent on the platform (Exynos)

As this is what Marek S. already suggested above, Jagan, can you send
the v9 with this change included?
Then Marek V. can test on his setup and if everything looks good we can
move on.

[1]
https://patchwork.kernel.org/project/dri-devel/cover/20221205173328.1395350-1-dave.stevenson@raspberrypi.com/
[2]
https://git.kontron-electronics.de/sw/misc/linux/-/commit/7769180e6bbdcb2e42c2b39cda5127efc21d3653
[3]
https://git.kontron-electronics.de/sw/misc/linux/-/commit/e6aba93de1189432dcaac17d969546a92541dc87



