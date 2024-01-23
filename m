Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD16838A82
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F4410E3DD;
	Tue, 23 Jan 2024 09:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150C010E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acCty1VJ8MuwcE/OeCeFTcrccOIVEvb1FY18vNPeoNs1k2TYSVV5yTtJdqDLgJvkE60a8G6XTrEVvJX9TYg77AAVnWKKlx8mkInDGXnIihRoYwI0IxH8jEkSAyUlCPz58gOrT1mB1nRa69rw40tZzbqSKfCkU/WTk/oNUc1cI+rI6pB47Jt2RC9V2Reu2vxWOMUvS+8nJfVI1Cn8JkSvql84bYwaoS/XEBed84Z9gXsKAvyqCZ5c/fvuu7KsYiJFb+ECGUfs7UF1ExMey4clI3RpvA1+ncWR1ilkyKkZvg4/FOHxYoZgOmzcwAjNf6GqNoFJGDNiF/swJvH+iMi4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhuNzd5UxWWigOnGotDK+pCCEkdG0ZCJ4XRgaeK1KYI=;
 b=XO4dZAKyutgZazgTTD+5pjMHdBVyT0sVv7VQurdVCiMpHlfHFpPOhO5VuRUTU2IEzPHyd2rNcM4uLjFxvX/ZMslSq/9A1n9mosDPjvw2oFtBdUvyKzMAcJUmPGofjc/+Uehcs2p5vRrNRl8Rgf1VDyMpU+S+hY8djpmpzdswdku4fRl9pD7AYQxv2iYgXW6kCKcaX3DHoRc2uHm1nOZam7zjrrk3RGQ3ZtNVgzMK7A6JgC+DRt6XdK+bJsRET6/r+ZSdapZHEMLCEH1l8CJoYEq8oNYwtGBzrk7AfMWNAGaxDoEw2kDqG6HmYQdcQl0xnVjz7kZJSba05Hgf+c36YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhuNzd5UxWWigOnGotDK+pCCEkdG0ZCJ4XRgaeK1KYI=;
 b=4nOkLjlaVgNmJrTuJiy9MB9efxmzq+tH1/r9cCnLUQ62DGNxFxXpekBe+VbGSSQA0eloLLcuNRT5ykmKQC09PCG/w0VQmBr2mCoQ0Wit7VLJ9qxP3Cev50mP0usN1fTWB5sFiui9cs8BLRBjqMvSxRLdpZfDQ2O87x3U30sOKDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 09:43:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 09:43:09 +0000
Message-ID: <c45df2c7-695b-42be-b893-a4f520d9e723@amd.com>
Date: Tue, 23 Jan 2024 10:43:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, Dave Airlie <airlied@gmail.com>
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
 <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
 <20240122203552.529eeb20@gandalf.local.home>
 <CAPM=9tyQ22nw4_u366EX=PnROYcWPD7ONRFpPEKxRvTZo0B4zQ@mail.gmail.com>
 <CAPM=9tyCN1ZhvCTjoKn-Yg5BhnrMae4E5Ci4_u7BZ2vv5gDnKw@mail.gmail.com>
 <20240122215200.1ec02a4a@gandalf.local.home>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240122215200.1ec02a4a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 5448cc9f-7b29-42a8-3b55-08dc1bf7b5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpuK/1gjjt2oqNP6WQ/pFwuwcdFhxktf6jziONAAdUN2TTiJQGuNpRkMpCwrF6vP8tzdVmNoOVyGZ8ZXhmXOjHy10ZyslPlYtfP5Vmxnqt2eEeLiDVNxg4LURz6C5DaBD5tfbRpvuaROCY8dIOEJeFS9CrfWGtLH2hL47XGEMg1i8WRjNkYJYkQknQsYPKOC4Hu+d64j31A/V0+xZu8RoXRZXNC94ohBmEe3L9FR4pVJPIBVha3JR/wHlDXCVgvx2oM2VyOe+qYumi773v88Oe6/8ORJLe1RU6PcVr86vFQKWQaCJ26VpDTsZf30oa2YxbkxxyRBfQWGeRJeplRRj9NPJA+xs5CZjVlhVK/FerpFjostcNCevbVUhZKsiTHm0/GjGxcZewpbPElvflC6VhUcwbKZtKmpTH3oHBrp7OGGtO75/XYvRDeOcl1V4Dx9x9UNC9SZicVZHqQcAxiMGPgIH07nzOpAQdJU6Aeh/mDUJvr8UqDlOoWnAswrwret+rL988Ft2kIMnlBAgxvCHOyQqnNsqbeU+5VR3ZJ04yMxt8ZDlgEBTqiKHjcHwQ4Er9T7d2F7A1vrRmkEIQDK3fmO1jjlX5zyGxwDXEFZZqHLsfWvrCqoH+lh7UaEoyLj5i7hmO5B6L5ri/+rcYWmtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(8936002)(4326008)(8676002)(5660300002)(478600001)(86362001)(110136005)(54906003)(316002)(6486002)(66476007)(66556008)(31696002)(66946007)(2616005)(966005)(26005)(6506007)(2906002)(6666004)(36756003)(6512007)(53546011)(41300700001)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VKa3hRTmp4QTRRc2ZlNFpmWkNDUXErcXBISHBDSDlDVkROdzhpdHFoQWN2?=
 =?utf-8?B?OFBwckE3ZlY0a1FteFh4TjB5NXZLQW43OS8vYTFEMlZTNVVuRVU4UmpkaWtk?=
 =?utf-8?B?Mk13THRQNDN6YmxOd29IZDNiNGs3YWpER08rM0F3RC84cHdOY2loMzM4UVl4?=
 =?utf-8?B?eWR5NE1BdjZ6YVpKTGVoY1E1T0RheWtyRnZRQzlvV1FsWUhINmhiN2NFbnVR?=
 =?utf-8?B?djEwQ00relMvOFRuVkJwOXhsYllHVktCaDRoUHQvSVhhazBvcXdPZENSQ1FE?=
 =?utf-8?B?N1lCbFN6ci9rZHAva2xUM3BxQnd2RVNwTUVIR1pLU2lrMHNBbkxiOUp5d3pR?=
 =?utf-8?B?RFlKek0wZmxHS0dUUnQ4YjNJdlJzTUV2dmc2Q0FTUGNudE51dUtoTDFUNFU2?=
 =?utf-8?B?Uy9neDVhUkcvNXlGZTU5VjUzVk5jQW93TDlpMnZLcVBoU25nekJLcEkxS0l3?=
 =?utf-8?B?U01maTQrK0hYeWNpK3ZvNGFDbEJOOVNBaWthNzBYSEg4U2NXZ3pVSkxoVmh5?=
 =?utf-8?B?YjRYcktaL2ZITUt2TzRvWW5naEd6UGFxeDRBYU1rY0RheUU0dkdnMlR1WFF3?=
 =?utf-8?B?WGRobUZjR3FoTGtyRU8vU3hjMVhDYks3REE2UG9ML2tMYU84M1FYcFhDUUtZ?=
 =?utf-8?B?VW5sV0FJWjZBTkJkbncvOEQ5SjJ2ME92STJjL0VMSnFnZ0wzLzJsb1NiQnli?=
 =?utf-8?B?WTNWQjBLaWdmS3o2VXUxMmRHcUtWcHpCZzFvalRNVkZ6cWJ3N29SbnVrK3lH?=
 =?utf-8?B?OXBjMmg3NWdDMnNmTW1TRTE5bWFpTGFSd09VamdPc2o5dndDcDlDM0dxZXVJ?=
 =?utf-8?B?MEZJKzJFbEtkMTJ6OUY0SnlVb2FqMVQxbVV5aW9lTE1WMXIvMnRaTGFaTnM1?=
 =?utf-8?B?RVMrKzI3dDF0dGhURVV3ckRkMk9oeUM2Q2Z3cnBLeFJwRFJKb2RwSkJzeTNJ?=
 =?utf-8?B?K0ZYdEgzWUlkVXpIOUhKaWhFb1NMcDRVa3BpcC9UcXlmcGdNY2lWREkyZi9q?=
 =?utf-8?B?YU81Q1dOT296TldUbUFpcG9EQXFPNlhpMzVScGlWYlE2bko0aWlQY0NiWHdZ?=
 =?utf-8?B?M0pqS3VpQ2ZJQUZSL1plNU5iSHR1TVNkQVNmL3hWSjQ4ZktxK2FZWEVBOWVD?=
 =?utf-8?B?UlFXcTh3SUlIWVppbytja0xxa3Aza3ZIYnhsc3YxNEEyeWoyWUxCN05vOC91?=
 =?utf-8?B?M0xyQ2UyR2VUTnlsNjJvWXVIeE4xSitweFpLQkRBR0lrTWVETDZZaXVWRldI?=
 =?utf-8?B?UjRRb2k4N0VrYkUyMW9MMEp1YnpHTlVrTFhvNTllZGkwb3RjN3dSNXVYekNa?=
 =?utf-8?B?THZhbngrMURSSEVldjlNUkN4RFdSTmJoZFFGaDZoOEswaUhNVE5yWDZWd3Vs?=
 =?utf-8?B?K0J6QnhZdHYyaWpMWGRsS2NoRFdvMEk3aHB6b1d6alVadUozZlN5VERiejJu?=
 =?utf-8?B?ai9yellMOTZidUtYMTFLejVaRkU2WmpDVjBEM0ErRWVXaitiM1FXdXo0bG1D?=
 =?utf-8?B?UG9pVko2eE9VOXozS1hnMlo4akMwZHdQZVljSTFza25mdEw4cXZaTG1hZmJa?=
 =?utf-8?B?cmVtWmJkaGhCRGEyTmk0MU4xQlQ5NGhCRVNJZ08rd09RcTcxNlplWHVtSXdW?=
 =?utf-8?B?ZkF0c1U3SUpoOHJQV3Q2NnhEY3lWN0xhbXBoU2xOdE5rbm1HenBBNm5ybnZm?=
 =?utf-8?B?ODFYUi96eXczVDF3L0ozSkExTm05V1BCOGtVcnZsditFSXVZL3ljbGFZa0cw?=
 =?utf-8?B?M21OMG9pRE1pd3RRQTk1cTBzdmhRWjdSN0VVcEg3RG5abVFnd1ZFU0tSWGw2?=
 =?utf-8?B?dXdOM0toOGVXOU80QXlON1VScWhISFBNSEZNVnJhWXA0aDJ4MVd0SllwTkNl?=
 =?utf-8?B?TXVPQUVHL29zTGFEa0JXT1B5MW0ycjJqVnJoSVFBTHk2ZzF5SFpPTWdiWEEy?=
 =?utf-8?B?ZTdqNkhLUnV0U09OSkpCRzlLSkFwSklZeFh4eUdXUGhHYzlzVzhia1JMdUFY?=
 =?utf-8?B?VFBJc1EzdGthY2tvR0ZaZ2xqckxZRXI5WkZPQ1l3dC9adlVnNFF2V0Vlejk2?=
 =?utf-8?B?MDJkd0tLRGRvc2tNaXdBLzlTYVpkQnVXK211S2UvdjlYVUFDQ0FPVFpjbzls?=
 =?utf-8?Q?6A+OifDqbI4yMjrzqzAwU668z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5448cc9f-7b29-42a8-3b55-08dc1bf7b5a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 09:43:09.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxW0o+6S5J1vmgDS54IFIzZsPjcA6V+WflT1UjJhRPfGA8YedmxRiAQ2GPildjZ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Fedor Pchelkin <pchelkin@ispras.ru>,
 dri-devel@lists.freedesktop.org, "Bhardwaj,
 Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.01.24 um 03:52 schrieb Steven Rostedt:
> On Tue, 23 Jan 2024 12:32:39 +1000
> Dave Airlie <airlied@gmail.com> wrote:
>
>> On Tue, 23 Jan 2024 at 12:21, Dave Airlie <airlied@gmail.com> wrote:
>>> On Tue, 23 Jan 2024 at 12:15, Steven Rostedt <rostedt@goodmis.org> wrote:
>>>> On Mon, 22 Jan 2024 19:56:08 -0500
>>>> "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com> wrote:
>>>>   
>>>>> On 1/22/2024 7:43 PM, Linus Torvalds wrote:
>>>>>> On Mon, 22 Jan 2024 at 15:17, Steven Rostedt<rostedt@goodmis.org>  wrote:
>>>>>>> Perhaps this is the real fix?
>>>>>> If you send a signed-off version, I'll apply it asap.
>>>>>
>>>>> I think a fix might already be in flight. Please see Linux-Kernel
>>>>> Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for
>>>>> no-dma-device drivers (iu.edu)
>>>>> <https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html>
>>>> Please use lore links. They are much easier to follow and use.
>>> https://lore.kernel.org/dri-devel/20240123022015.1288588-1-airlied@gmail.com/T/#u
>>>
>>> should also fix it, Linus please apply it directly if Steven has a
>>> chance to give it a run.
>> I see Linus applied the other one, that's fine too.
>>
> They don't look mutually exclusive. I can test the other one as well.

While applying the fix a week ago I was under the impression that QXL 
doesn't use a device structure because it doesn't have one and so can't 
give anything meaningful for this parameter.

If QXL does have a device structure and can provide it I would rather 
like to go down this route and make the device and with it the numa node 
mandatory for drivers to specify.

Regards,
Christian.

>
> -- Steve

