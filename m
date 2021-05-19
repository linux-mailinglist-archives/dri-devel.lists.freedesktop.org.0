Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46749388D32
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377446ED7C;
	Wed, 19 May 2021 11:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8A6ED7C;
 Wed, 19 May 2021 11:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7SSjdX681uCBniLz87Vsrs60d1Hzb8CWGL/Kym/TKcxwEOuYSoHUgCqTP0EWwWQUIWHshmqbMShhGpas9VdbCkYRop18u9Jy9zNgAUoL2Lu5tMn6yt77u3RMwBN1vEQLcP29KFLw7ur9i365sgYSlW2NCXXvSrPM9JJMvJvioe4VSDzf3xlIMbdvRNd/uFr51Z5t4dmCDa9f2nRe6xsdz5j1SgprLIC2R1PtnrrUFrG0qCScQ+gpjNP/Nynb/zyvgLBQ9z5AGdDzAo4gHZhn9HfyDDsWAByj2MmpTejbn4fx5S2O9ZSxuQTVf9nwEaQ10TJvBHkS0uHSaRMCTgnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iC/RhvSlcc4AHAteSIdN8oseR+ph1msPn9CVijghec=;
 b=YHUrEweEpt/hNdjrMED/RNh6vanlW/6LwHdeT1S6z8aD3L5OU9N/p2FQ9mVjNkN4sFlJ0IHB8/y+DRigKz6Hpj29VYbEZNZ0c6bLJc/yNvdMXdp/pa4BcthefW7nwhM9oYjaQfr22miT0dW60XKyZgN5JTAcO3/XvBu42Juj/AQMXHo5M7xhcOL73rpGxOzwz9NL0tHh2ASxP+/uqR78wodUADN5oRY6MnlIJPOJyCCVcuwAsBW74fV+Pc92JOwmZLWBW0k87uxBigEANI/mvUObxxtshxznFRYugbyoqUgm/JmHosV4KUy7mJC0WytX5Dwl2FE280T0zamehalN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iC/RhvSlcc4AHAteSIdN8oseR+ph1msPn9CVijghec=;
 b=frC3EO2A8Iv7yugCFODDcQhuLbMUxd6bUcKBdfmBPzNUED5G7ucqHbEKzdqvPoLkpoOCxlwqCubAKSvk44rxOxsEE6MTMBHY7EuxIhSj2ckA5mHkEBd3C9I6WRQ9nF/f9AlaawmKH6KA6SW98Z5J9XaQHM51DchXaSR2epQj1z8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 11:46:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 11:46:52 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
 <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
 <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
 <4a9af53a-564d-62ae-25e1-06ca4129857f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1622338a-d95a-fe13-e4a4-c99cb4a31f6c@amd.com>
Date: Wed, 19 May 2021 13:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4a9af53a-564d-62ae-25e1-06ca4129857f@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
 (2a02:908:1252:fb60:8e28:1d3:41f3:e15a) by
 FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Wed, 19 May 2021 11:46:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb48ff3-5e9a-498a-755f-08d91abbcb58
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440B8258BE5555990481A85832B9@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GKiAQ97qS1jVuJcYb6ewaqOTa1HfCf/6Tgi2hscpfVBqZIK5ENJDI7V1KC3eSOIgOgYuO5N1iKFRHdS+9Ggmd36xQLw1ej9Hix+rqKTXwguFwBX1d6G/w9H25iaBh9vr/AlVjttu0iyqF79crXq/8o91w61UkJbrI+g2mAvh0XNvb7WXMSyViyBpmLZ72u1gndSWZ35wTPrjuhjhGgU04bzKStOzp3iS2ky+HEbJ0MbZd0dN3YBOsnPH2xt5ozMe3FjJA0ePaIH8iaYDnyhntSuts6U4onDPimfyrv+QCZ2GmqcbwcpWXZBQXwgB7mRfzNlv++muikDFXrfZd5FR+NNvKUVuyAA7YtZqiLafZr78sg25n7wNyU+PAGJqnvqpdaQaUO3TD4fqVXjUCdMezCeNyo/WGH80R7J65ITDiRa0/tw/+oTWPVARVsNQJbKM0o3KJW1+By20y8XZqf45wZ6MPm2FZlxzJJXAqPPBIWVNZWCc2qziDXaCfhvsDavl7EtvAimm0TCDQtCO1pA6+vcxUAK7fAumGsHOOo2awP1nzTkt+b3tUBV2r9WfqpOgOcBvTdAxnt5hynY4VNsgdgwl3QucueDKft0QSraeZO+zpuwcu9YEs1eKerL2HOyIvArWkmeORoqLft/l1E7qRtiR6zhnvqBXEPDeBFXoTSgHZc1cb6Ey+SSYYZyys6GDykzX9c2sOOkwmrABDmnt7lqWbamkzjwnsx1k5WBQwzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(6486002)(31686004)(66556008)(5660300002)(66476007)(66946007)(2906002)(2616005)(53546011)(38100700002)(16526019)(186003)(66574015)(6666004)(83380400001)(4326008)(31696002)(36756003)(86362001)(45080400002)(478600001)(966005)(52116002)(8676002)(8936002)(6636002)(110136005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0l1UWJBckpuVzlLQVhBU0diMTFEQTZ6Z3YrbGg0bEkyRXB5V2FQWHFPOFIr?=
 =?utf-8?B?bHRPamxTcG5PY3B1RUI0T3pTZGxSYVZKUkdPdWdxZWZaMllOaHFZdFlUUkFW?=
 =?utf-8?B?eHZBWVdMa3FWVHV1RGtLcHNCeUFnRFNPOE5XUzJTQXBNbEl4aFg5NVpVZGVy?=
 =?utf-8?B?OGZHVDdhMG9EMWpkZVJvcDEvR0pFWXdManBkMGtrNEkyb3NlZTFQZWQ4R2Ra?=
 =?utf-8?B?S3FpODN0RUF5cnF0anNoWVNZam56b045bDJLdDBKUmhHRCtRb2RuUmFhMVVh?=
 =?utf-8?B?ZDBtZWxqdWpzeXNBUzhzTTVWMUhEUUVnRGR0N25GZy8yYnFNM0NWWDBLSXRp?=
 =?utf-8?B?aDZkcmtpZlprMng3OW9vZDhudmhPNlg4ZmpLNmVYbW5oeUpnWkhrS1NqVFRM?=
 =?utf-8?B?NFRQVlEyTWptcTB3NU5iQ21tZEF5bXJXbk5lVTIxeWJmRDR3WVdBZDRac1Rh?=
 =?utf-8?B?b1lydXFoVjlaMkJNeXp2RUtaRFBjT3JEbktoU0dlbjFQN25iZ2tVL3hlaDZr?=
 =?utf-8?B?VURCbFVNTXlDd0paRm9QUGZkcGpjdGFyVGVRRmczeTdzVndoSGI1dTJWSnpO?=
 =?utf-8?B?dmFvRVQrQ3pmR1R1VVFDMFNNTHJzekFxTEJrWHhwMmxOU2E3V1JvSTZQdFVB?=
 =?utf-8?B?ZHRxSnVTb2M3QmlLR1RrLzVWbmU0TVl4Zk9TUjJ6NnNpNTNzZE9UQXhvL2gw?=
 =?utf-8?B?R3RBd2F4L2Z6dlgvajBSd0ZSOVh1K2trckNGbk5jaU5KY3F1eUlSbTQwWkRU?=
 =?utf-8?B?eVRwenBTd2lTSU45RVBnTk13TjlhNGJvUitnYWlXRVQ1NEFTek9XZ2x2cXFR?=
 =?utf-8?B?Qks5ZWdxQkNaZGFrVm5MbmN4V2Z6cTZQeWpXR2phQXp1MEFSVXlkeXRJcUpX?=
 =?utf-8?B?Uy9iSWx4VHNubVFWTUdNbEs3ejViT3JmOW1aODhYVmF6UzI0UkpZUWhwb2Yy?=
 =?utf-8?B?anBWR0h0M21GSUEvZWdkU3lnOEQwMWs1VEhYZThqeEQ5aEhmS1lVNmJ3M0ZK?=
 =?utf-8?B?U2wzTFJDckxOTVZnZDVxWjdMN29zR0ZjL01WY3U4TVY4Zm5GSG9VTjVzSndB?=
 =?utf-8?B?SERiWDFQQVlhbTBJby91WktRc0xnQnB0QmpxdFNZM0dWa0lJMHhpUXFCVVNk?=
 =?utf-8?B?ZFpPYUQyNlhMSTBTdGZleC9EOWhDVnBlaExrSmFleXp2TE12TW4zeit1TnN5?=
 =?utf-8?B?eSszdEtqZmQyVjhsRlYySG9McVBwWmJUUmN6bWdwODhPUWs0OXBGalZPeGVF?=
 =?utf-8?B?VjhOS2ZvN0pFd0c1ZFZPRUpoNkJST0k2WVF0c2xtMUJNVkkzZll0cWE2SzFq?=
 =?utf-8?B?OHM4eWxhRWNDQnBRdVVYMjVzNktRbU9aVHBncjU4TWhKNWdDTW1BTkdRKzVV?=
 =?utf-8?B?b1FOQ2FQUnM3ZXF3Qk03MDFCTVZtMEdZS284VXUvT09zOENuQzd6RjRxeUc2?=
 =?utf-8?B?ZWx0WUM0VlBHeVI3ZkNmNjh2VTJxdi9GT3JNaDNiZStneHZVbzdINUM1ZkFB?=
 =?utf-8?B?dS9MZnV6VWhlTGVPNlBsQTJpZXB2UFp3d0QydkFKYzlvV3JieTRnTk5DTWtI?=
 =?utf-8?B?ZTB6aXBqejAwWkpQM0RadnEveHhCM2NQTHJGMW5zaEZ6Sm56emNIZHhqRXdV?=
 =?utf-8?B?TkJqbFRVRTl3K0NTS2NWY1FNT0dNaUlmeHdQYmNUZkdJY0JNdG1BWUM3QTFK?=
 =?utf-8?B?MWErMmhtZm1vdEFEY3ZQVXpkMzhzOFpNMURxTlFlb2JWN2VhcjZnSW9USHpq?=
 =?utf-8?B?ajdIM1IveVRINEZZd242L2E3RVZaWWE3V0hGK1JPSmRVRTJaa3lZY3ozTFVF?=
 =?utf-8?B?TEtEb25oYXlHMVN0WGxncmFnRnVMTENobkdLQXRXeDNZTUxySkRGZ29oSWl1?=
 =?utf-8?Q?X4JHq+BYZUOjJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb48ff3-5e9a-498a-755f-08d91abbcb58
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:46:52.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aA5OD6mFKWU7wC8iy+mwtJFMz4ieDoOwkeSBzcFv1xdmaHcnGczTrbqWPtzkNt7w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 13:03 schrieb Andrey Grodzovsky:
>
>
> On 2021-05-19 6:57 a.m., Christian König wrote:
>> Am 18.05.21 um 20:48 schrieb Andrey Grodzovsky:
>>> [SNIP]
>>>>>
>>>>> Would this be the right way to do it ?
>>>>
>>>> Yes, it is at least a start. Question is if we can wait blocking 
>>>> here or not.
>>>>
>>>> We install a callback a bit lower to avoid blocking, so I'm pretty 
>>>> sure that won't work as expected.
>>>>
>>>> Christian.
>>>
>>> I can't see why this would create problems, as long as the dependencies
>>> complete or force competed if they are from same device (extracted) but
>>> on a different ring then looks to me it should work. I will give it
>>> a try.
>>
>> Ok, but please also test the case for a killed process.
>>
>> Christian.
>
> You mean something like run glxgears and then simply
> terminate it ? Because I done that. Or something more ?

Well glxgears is a bit to lightweight for that.

You need at least some test which is limited by the rendering pipeline.

Christian.

>
> Andrey
>
>
>>
>>>
>>> Andrey
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cce1252e55fae4338710d08d91ab4de01%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570186393107071%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vGqxY5sxpEIiQGFBNn2PWkKqVjviM29r34Yjv0wujf4%3D&amp;reserved=0 
>>

