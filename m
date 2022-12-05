Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E571642396
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 08:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BB710E0F6;
	Mon,  5 Dec 2022 07:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::720])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790810E0F6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 07:30:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/Ri83uPiOwWi4OxshvmzopX3voViOx2/tM56sdRp8mfBpIoTaM+OZ7+PclfvZ/41RPxydaSJBbMcW+MHIsAlGBdG4Xf9eOzBMjXWhxhWqVdnUtxc00sXCQcxGLnchfagvqJXayhZ/CjixLJIGl7+QKeOf73SFBtx6kfqWxwu88H00SAyMmt+sMxrcMBSjJB2JS0jzk0DgJu4ocqPD41FL3HVqy2lFRmaMGigHPkkWeEntPfXo/Sfr6gyuFseQwYkJ2x+gm00Z5DSxR7VH4SHOB9a7Sqiv2JrFRex5gj9dmd7CcKzU++6vhlzKJUVcJPb6FGifzsTeErNzbhuuKb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/MqAP7DXk7ReGQiBfk/kPPcNhXnXG1lJE7q1WURXIg=;
 b=g7WJv19dPu6o7gtF2oH7+nd+hsx3eVMT24hsEQFDUhMSir5sMKysVIg7wS7wk8Jd3d5PEGtntbAQzhWTkpwEHIZwW93mlF38Dgs/agfOC7jpLJoFesn+RinF24ydEBaj006Ro2y1lDpuMZjMOYAjGsVYsFn0mbY0MSByvQSKa6Z9E/w2U4v5eY5NGjCvir6S+4oUKV7VgCW+emGvg71ry7Ug/k8GpDxtQfozcdLO6l7DlWnbe9rOkkE6KwoG8TmQ9Hr4ZgS1QYqP2j9Ax0wpLd2Tcm7rvspJ69z+4kgZrq45tuQM1WhkNSUOvOhwTa0QoHNzW07PBRdKJXLImXZ3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/MqAP7DXk7ReGQiBfk/kPPcNhXnXG1lJE7q1WURXIg=;
 b=JXnK76NTgG5au9Cxsvl/mEh4vrcnv5aOkO/fsS461S32I+2jXl+RU2lTkvVELi6+ObAlYatB0WHqnEQygvLobcb0tPLPE8ZEBQhc3SW4mmK5ZDo6uPXYDUy8uZRdLpUJW07VwdyFh8bNJnxce+tXrWjRFucbulPhqIEr5MoX2Po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAWPR10MB6829.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:339::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 07:30:54 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 07:30:54 +0000
Message-ID: <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
Date: Mon, 5 Dec 2022 08:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Marek Vasut <marex@denx.de>
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
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAWPR10MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: f55da63e-0046-40db-311f-08dad692a4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmDmGBlKQXnhTFeSCIFr3eknJJmRrYjKptuOx5NhuCOAn0SM+J9SFh9rQza1C4xAPKmnyMgxyN2cu/6HRkk/BkNyv2B71LhG6khujyZc9AdWx6NiO5Gc0vfcgnT2EVM/zBHYkbQmv1ZdKMuNzjGJgUiQZctfA2myNRgc4JbgQGuw16OmVARc4Y4ytY3IQQVn+UDvCOqTKf/Ai4Y94pVuJNoESMmaGihv8QT1zKpr7vemDsxfqun8vDFszBlRAcdt9aQdOnv2YwkDoMKuJGKIXj3sf4z9PttWmDM+2U2xfSlv7HRdw+/viY/bM6I4mE24/1J4BkwI6YfJjgJu78zQnVV7oGVd1XdvR52q7t5hYMsT1EYohgL6GnGoISEo6K6taBqxlivmYXK/LzhVzBqjQ5gB/ZXctTVqsghmMttv1UstewL3pu7V60kn3BVbRVImGdsL7EIqyptJTugOKv5qiHX7hmLgCDIXR0bUji+sFtJi4dln2+p4ZpNwmDVXSeuocIBpZkQTQpd93jFz09p5e256C+Bdv9pZZgBms+DfEh0Mk7PO5lsmlC5CrT4FWbu7WnP4xQ5oJWshTi6KvszCeidTFceSkijFZUHSpr5nNUrNoU9/0VGGGnwRaJG9rjBX3Lvz8DjVClrikvkmSrOJOol7/16Iw+15ccD1fxIe5/g3hQYayu+6SpzwouUZ05hE0CLoeIwMbULoEEttvoJiWzuk5sM9WfD84fQhXKZMt6z/jE41LZpIdpfngkOkWIdn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(451199015)(36756003)(31696002)(31686004)(38100700002)(86362001)(8936002)(5660300002)(41300700001)(4326008)(2906002)(7416002)(44832011)(83380400001)(66946007)(66476007)(966005)(478600001)(6486002)(316002)(66556008)(54906003)(110136005)(45080400002)(2616005)(8676002)(186003)(6666004)(6512007)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFF1b2ZIU3c0TW1vUFh3alJmeDFYRFRmVEl0WU9EcVJScjFpVmJMeXZCQ2d0?=
 =?utf-8?B?dkJmMmpXOFEvWEJDR3RuR2NXSlQrcVpxUkx2Y2hJV0dLdDJ2QTN6cUZjcnhW?=
 =?utf-8?B?bnUzWXduNzFLUUlTb1l4Y3piZlpUbnhmQndVWU53VVVqaWJKYVBOM1lQOWli?=
 =?utf-8?B?MTJLZXpYd1kyclJ6SGp2RUs0d2wyTDFzMVNVcHhMMXpUUC9TSnUyTnkyOTZD?=
 =?utf-8?B?VStBeFV2Zi9PeDJFd0lLZklJNWpYZjV2dU9CMVY2K0diZk9lK0l0dDN6VDBD?=
 =?utf-8?B?d095ck82Zk91VE1WL3dkakRRZUw2TEVwdll0UEx4L2NrYS9RYlJNczV6Zldh?=
 =?utf-8?B?RTE2eTRFWnlEY2MwUWRwYUhWZ0dSZ3I4YXFjQkloR0w0eXpmc3ArNHpJZG14?=
 =?utf-8?B?NXJXcEFxWEhBYjNkZ3FNdzBqbUIrT1NYQmhDL2w5VE8vamFhSDZCYzF5cDRO?=
 =?utf-8?B?MXQxT2lBQmRiR0lzUkt0Nm1kcjZDaHRQYjNFaWEwc0hKdEFZRFRORUtTY1ZR?=
 =?utf-8?B?RWt4YUVTalpreEh6cGs2c1ZsKzcxM2FSR1NQakhmSVBBV3ZkdW8vNmMrc3hI?=
 =?utf-8?B?NERhK3YrT1pzZTRIajNKZ2hZeEpYV1NlTnRmT2Y0ajM2OHFONEdJejlCdFFR?=
 =?utf-8?B?elJKQ0x2OXRoN0FnalE0WUV4OVdtbE8zT1dyeDMyNlhRME9uaVBXUDQ5Rkw5?=
 =?utf-8?B?OTV2NWdNYzVZazdpMmFQOW1sRXQzN1owcTEvcWEvaE5nSGpHblp3WUJQRTVp?=
 =?utf-8?B?d2tpbktBbW1nWTBYTUJDdGlTQ3hlcmNoRE1nRSsxdFM5NUxJdTNtNERGSnh0?=
 =?utf-8?B?bEpRay9kdmhSRTdNQTlLU0xKOHpuU2QrZUlSQXRKRnpVMWtraEl6QTZmdDlY?=
 =?utf-8?B?WjFCOWY5cDFONEduWkFqL3ZPd253RXBPMEI4c3htOXp6dHlGcUdVemt1Mi93?=
 =?utf-8?B?V2huNHRqK1ZmT0hjRVBOa2VpVGJDVVREZm5pQTVXWjk1eWh5dlhHZzhkd1BW?=
 =?utf-8?B?WHdwejVEOHhFVEszOEQ1bGsyVGxGMzVPU1llRmhyN0JzS01LdDFHdUd4NkJx?=
 =?utf-8?B?c0k3a0ZTVlhXMVYyN0ltQTBIV3BSbzhrT0drRXJlRUg4Z2VseGVsTWxwYnJ6?=
 =?utf-8?B?VGZld1NVQk9rZmp6eEFvb0FGYWlxcmdTYW9Ldnd3VEtEZWhqanNBOFBVY1Rz?=
 =?utf-8?B?WE0waHMvUmlhSDRyTG5qOHM3S3hvMTIrcnNQQkhKQ0ZmMVVSRStlbjFLalg1?=
 =?utf-8?B?OUZyQll4Z2V2VkFKdG11Zk1GQnE2QXV0ZHlKWFFhSSt5RHVXZEh2SkFtd3ha?=
 =?utf-8?B?Z1ZzVnF2WFVva3FDaisrOW5BLzNXRnJoVzhhazdPWWorK0lLajFCdEc2MkU0?=
 =?utf-8?B?Y01iMGNyaDlPcjZ3SjhCYjk0RWJGcEtPbWZHZUZnMDhtbk1hWEswbU5CL1Iv?=
 =?utf-8?B?VTFsOWNPS0dXbkkxL3dOakc3UXQzNUJTbWx3bnkwdExTY0dqY1NhWU1QbmZr?=
 =?utf-8?B?dms2WjFUK0RRNXRUQnZYSklhakpvVEo2VUVncW1HRi8yRE5jOTRrcXNiK0VW?=
 =?utf-8?B?MU5ZMElZTStuMlViendaMEhPRUM2NDBjOEJwS0M1VHM2R2RWZlZWLzlCQnNx?=
 =?utf-8?B?RSttU29IK0JjWUxIcWsxTjYrT0h1MlExOFN5L292VXQvemRpZzVRMnZkd2N0?=
 =?utf-8?B?VnJlU3o5cjZBT2ZFK1g5UE5LWjZram1MbEN6cUlrY2RHZ3k4MHdhc0l3YXVx?=
 =?utf-8?B?VDVXRndnU0xFZWJvL3NxSkliamZBQXVycVZUMnNKLzA2UWtmdEcrM0RJK3U2?=
 =?utf-8?B?V0RtaTFoRFVVN24vK0xCYStNQ0RLUXpHVjlydEdxQUlUTHErZmZ1WTcxeXFQ?=
 =?utf-8?B?T0wzUklsN3REOFoxRGRTam9lMUhoMFkvbWVEZVJuMzFvbFM2SDBWWWJZUnRX?=
 =?utf-8?B?R2tjMTRZTTV5dFJIekUwclViRGk1b2JvMys0Q3R0cWtrMlpCQXdtMHU5YWh5?=
 =?utf-8?B?QU5PelNITktVZmpxcEhrczVXZ1BrNURTcEU2ZlFPd1BuZzZhY0p5SWxiRjN6?=
 =?utf-8?B?d2VYVmVDbThzUC9iOXU1Qm45WisrNWM5Vk8ydWtwUzdnaWtwelQwSzNiUUxz?=
 =?utf-8?B?T2xrdkZDUnZUNzBEVTNVZVdLVmtQK0V2am5aRG5aWTFkTjhqdmRENUFtVVE0?=
 =?utf-8?Q?/bzGzrYJDuM2HyOzx1jkWIIwHsg7VTeu2vMczKcxF9eV?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f55da63e-0046-40db-311f-08dad692a4df
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 07:30:54.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYoAhQsiDIHB9dyfgxHai5riQMgHOib16IYbJQT34/rHMYomGcrRqdw8ihkKX4M+Lx5/Pw28KzReJM1Im0OWa7XqtfuY+NWakDlRGKwCCdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6829
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02.12.22 15:55, Dave Stevenson wrote:
> Hi Marek
> 
> On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/2/22 11:52, Marek Szyprowski wrote:
>>> Hi,
>>>
>>> Sorry for delay, I was on a sick leave last 2 weeks.
>>>
>>> On 28.11.2022 15:43, Jagan Teki wrote:
>>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
>>>>> On 11/23/22 21:09, Jagan Teki wrote:
>>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
>>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
>>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
>>>>>>>>>> DSI host initialization handling in previous exynos dsi driver has
>>>>>>>>>> some pitfalls. It initializes the host during host transfer() hook
>>>>>>>>>> that is indeed not the desired call flow for I2C and any other DSI
>>>>>>>>>> configured downstream bridges.
>>>>>>>>>>
>>>>>>>>>> Host transfer() is usually triggered for downstream DSI panels or
>>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>>>>>>>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>>>>>>>>> and enable in order to initialize or set up the host.
>>>>>>>>>>
>>>>>>>>>> This patch is trying to handle the host init handler to satisfy all
>>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>>>>>>>>> flag to ensure that host init is also done on first cmd transfer, this
>>>>>>>>>> helps existing DSI panels work on exynos platform (form Marek
>>>>>>>>>> Szyprowski).
>>>>>>>>>>
>>>>>>>>>> v8, v7, v6, v5:
>>>>>>>>>> * none
>>>>>>>>>>
>>>>>>>>>> v4:
>>>>>>>>>> * update init handling to ensure host init done on first cmd transfer
>>>>>>>>>>
>>>>>>>>>> v3:
>>>>>>>>>> * none
>>>>>>>>>>
>>>>>>>>>> v2:
>>>>>>>>>> * check initialized state in samsung_dsim_init
>>>>>>>>>>
>>>>>>>>>> v1:
>>>>>>>>>> * keep DSI init in host transfer
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>           disable_irq(dsi->irq);
>>>>>>>>>>       }
>>>>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>>>>>>>>> flag)
>>>>>>>>>>       {
>>>>>>>>>>           const struct samsung_dsim_driver_data *driver_data =
>>>>>>>>>> dsi->driver_data;
>>>>>>>>>>       +    if (dsi->state & flag)
>>>>>>>>>> +        return 0;
>>>>>>>>>> +
>>>>>>>>>>           samsung_dsim_reset(dsi);
>>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
>>>>>>>>>> +
>>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
>>>>>>>>>>             if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>>>>>>>>> samsung_dsim *dsi)
>>>>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
>>>>>>>>>>           samsung_dsim_init_link(dsi);
>>>>>>>>>>       +    dsi->state |= flag;
>>>>>>>>>> +
>>>>>>>>>>           return 0;
>>>>>>>>>>       }
>>>>>>>>>>       @@ -1269,6 +1276,10 @@ static void
>>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>>>>>>>>           }
>>>>>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>>>> +
>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>>> +    if (ret)
>>>>>>>>>> +        return;
>>>>>>>>>>       }
>>>>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>>>>>               return -EINVAL;
>>>>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>>>>>> -        ret = samsung_dsim_init(dsi);
>>>>>>>>>> -        if (ret)
>>>>>>>>>> -            return ret;
>>>>>>>>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>>>>>> -    }
>>>>>>>>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>>>>>>>> This triggers full controller reset and reprogramming upon first
>>>>>>>>> command transfer, is such heavy handed reload really necessary ?
>>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
>>>>>>>> DSI. If this is a real issue for you, then maybe the driver could do the
>>>>>>>> initialization conditionally, in prepare() callback in case of IMX and
>>>>>>>> on the first transfer in case of Exynos?
>>>>>>> That's odd , it does actually break panel support for me, without this
>>>>>>> double reset the panel works again. But I have to wonder, why would such
>>>>>>> a full reset be necessary at all , even on the exynos ?
>>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checking
>>>>>> whether a reset is required before calling it might fix the issue.  I
>>>>>> agree with double initialization is odd but it seems it is required on
>>>>>> some panels in Exynos, I think tweaking them and adjusting the panel
>>>>>> code might resolve this discrepancy.
>>>>> Can someone provide further details on the exynos problem ?
>>>> If I'm correct this sequence is required in order to work the existing
>>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
>>>> possibly fix the sequence further.
>>>>
>>>> Marek Szyprowski, please add if you have anything.
>>>
>>>
>>> Well, frankly speaking the double initialization is not a correct
>>> sequence, but this is the only one that actually works on Exynos based
>>> boards with DSI panels after moving the initialization to bridge's
>>> .prepare() callback.
>>
>> Somehow, I suspect this is related to the LP11 mode handling, which
>> differs for different panels, right ? I think the RPi people worked on
>> fixing that.
>>
>> +CC Dave
> 
> Yes. I've just sent out a v3 of that patch set.
> 
> Hopefully setting the pre_enable_prev_first flag on your peripheral's
> drm_bridge, or prepare_prev_first if a drm_panel, will result in a
> more sensible initialisation order for your panel.
> 
> Note that host_transfer should ensure that the host is initialised, as
> it is valid to call it with the host in any state. If it has to
> initialise, then it should deinitialise once the transfer has
> completed.
> 
> Dave
> 
>>> I've already explained this and shared the results
>>> of my investigation in my replies to the previous versions of this
>>> patchset. The original Exynos DSI driver does the initialization on the
>>> first DSI command. This however doesn't work for Jagan with I2C
>>> controlled panels/bridges, so he moved the initialization to the
>>> .prepare() callback, what broke the Exynos case (in-short - all tested
>>> panels works fine only if the DSI host initialization is done AFTER
>>> turning the panel's power on). For more information, see this thread:
>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fe96197f9-948a-997e-5453-9f9d179b5f5a%40samsung.com%2F&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Cc770caab3f274d9b50d108dad4753e1f%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638055897263056680%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=1YV551YUhXQAjE4Cg0nAtMdMksWzMtscH49O83iKHRo%3D&amp;reserved=0
>>>
>>> Now, the more I think of it, the more I'm convinced that we simply
>>> should add a hack based on the HW type: do the initialization in
>>> .prepare() for non-Exynos case and before the first transfer for the
>>> Exynos case, as there is no way to detect the panel/next bridge type
>>> (I2C or DSI controlled).
>>
>> Let's see what Dave has to say about this, maybe there is some further help.

Could we agree on adding the HW type based hack Marek S. proposed as a
quick fix?

This patchset was tested on Exynos so it's likely to not break any
existing setups. And for i.MX8, this is a new driver so there's not
really a requirement to have all setups working/supported from the
beginning.

Also having one or two hacks (marked with FIXME) in the code doesn't
hurt. As we can see there are drafts to fix them in conjunction with
changes in the DRM framework.

This has been pending for months and in my opinion if there's a chance
to get this into v6.2-rc1 we should take it.

If everyone agrees, Jagan, can you post a v9 which does the host
initialization in .prepare() for i.MX and on first transfer for Exynos?

