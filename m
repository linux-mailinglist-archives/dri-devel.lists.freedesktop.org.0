Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8714D2D1E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 11:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6839110E41D;
	Wed,  9 Mar 2022 10:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130C10E412;
 Wed,  9 Mar 2022 10:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLXZeLLGTugrsWEGVN8JSXVZLl3i7RLleVETxjcOxIsLWnzLK+fGbp2BZXNKuJYkdL37cBpoWrudYjKo/BDE4ELhuFJwuCpMAOQtWdK0JoYLeAzVFNfHgT9nLu7dbiU7+kUAbnOCRtgbFu1fG4AKBjVOdpy/KImxUtk97ZoEVDa8Evd0Mrax2BnXG1Hx5GY4RGIOy4B5j/p9LZONkQ4Uh8JkMrv5r0lNOodrrS3dbQjB3CdiftgCjfTMYUY9t19LUoovkl/5o0pYSMIHC2u60EVAVRIxN6+OP6bysg9jPsUW9/fSP4pBbzrunpZJ3fA+ty3gtb1daS5njqKMOXRtng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9NkXykV14y26d4n1+TIC1HmfYIUsBZeMak9eratQo0=;
 b=MwXrRUqVU/KJ0MN1vi0xfQ3yA0USUBRB5HrqONJF2rRVqzFWDdfxqOeVhN1iMtQMwwDEk9TN9kA+xbdl/spCmHU3HGIj860rFvCjxxwX2pQal0v1/9cjhKJk5vX7+9qEINd9iNiAa1jj2mhyMny2Db+kK7ydDk21gei+kyWymjaaoQ6cyONez8ISeUPAabQOhvyh30PuaKJGtneANj0XL1fN5s9QgVX2GugDWFjGZnL89OhERznLjCrjiHeJ3LDg7u+ctmaFVA6ZfJjHSRSLWBEpXru28qhLEHw4Gd30i32BxeT4EgKYYU6SotBxFpTzQJMTwO3Eq1EJ/8uBce1d+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9NkXykV14y26d4n1+TIC1HmfYIUsBZeMak9eratQo0=;
 b=WuC/57UI4sCBIEa+94544C1VMrzCnqccMSwKjbMMmWJSOp0NuP2iOxsEBHsTz39aC4Gf62+mIoLhKDYAsSVXQWtugbZBEeS0mwebIJ04q/Du65dUaffhJGc4BkP80FYq97GDhkZ6IUapCr+Q5z+ynsfnKLUO5zYqUT0wcDz9ffI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 SJ0PR12MB5469.namprd12.prod.outlook.com (2603:10b6:a03:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:28:37 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::bd9c:14f4:486a:1356]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::bd9c:14f4:486a:1356%9]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:28:37 +0000
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simon Ser <contact@emersion.fr>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
 <DQGKSkEjxg-p9oBYX3hMa6fmY3Am2mAT4KBSQL_qsLGK0m85wehKp54s1IbobLSc5-FGbY67HrlWfQYO876bGgeObzY5eJF5UXJ1BktPilA=@emersion.fr>
 <1e2ad919-e336-cf8f-c675-0ddd62796a0f@gmail.com>
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Message-ID: <b4f209dc-73cd-b698-a7cb-478db1155546@amd.com>
Date: Wed, 9 Mar 2022 11:28:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1e2ad919-e336-cf8f-c675-0ddd62796a0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8eda9cc-9221-40c4-ae88-08da01b7926b
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5469:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB546909F7C0C055D098E4029A8D0A9@SJ0PR12MB5469.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgCc9NOuQK/A79NfI0xvINYHntCtKWh/Ats7/RYkc6ifcIJns0K1vbXKlCNU6+wIvVhExH6cGlZVYZ8xDRbWkn6y7k6/jThWkqwMzmoOyEQcbDyV/ufXutvDY/Az81UCTeMdfaAD5Qz6KouxaN+syZxbKNIPQGafpjnwPnEbEVp4VWRDXtAY68m8d6d1ZN8pwZE4puIwtmsnVcX2OIpuy0iV9cbXYsaUpa+E6/8IoQjId/Kohj+RetmKsIdispOaEiwRJdjYo77I38a3LeS5jHNONjh5mr0xNIJea+7vgNQwcAczkjlJJ8IumOOf8XospSSlBFnww4OyQ98f/Wntx1hq+ysPFhYM3AKiXcOKCUL30YjaT51Ik3gUYd3mzPZK2Dmuz9nlKyLL+ifi1MeJ6nX3Y+PxAMVOc8Lz70P8zo8LCc+hPo80FWYzP4s/J5j2U/oADZSJfzWxeU8RYGO73BdxpvQRD4WuK8oSoJNp/h8MpVDv8USOqXBISNsWuZrzcVUVYHRZ1cWCFFNcK84nt7BzN0jIEHFY7D8Nn5GwHk9bwPMF7Vv/z5qiwbDdcjiqQQO6jURjPJjl3hcAxd+KN46fE4uC4BlsaMfit5aSTNOkvSrUueS9MiOIHE5Kai04OxAsl2ZTRI2OLbhSKJBbc0DvMAUpvsJL1S2ywm9OLBQrbHBG7YEoXVR8+sSfq7nm9FYIdG3KyodrdaI7Lx7bSMZbr1/mvZ/EQx7YiCdIghWpWq8+9g/mY7OIhevEftvW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(316002)(6506007)(31696002)(6486002)(6666004)(86362001)(2616005)(186003)(36756003)(26005)(83380400001)(6512007)(31686004)(66574015)(53546011)(66556008)(4326008)(38100700002)(66476007)(66946007)(8676002)(2906002)(110136005)(8936002)(5660300002)(54906003)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXFPaHNnUmp0NDdTT2JiTU55SGh2a083b21jK1BJSlV2Q3Nxd3l2ejI1aDZH?=
 =?utf-8?B?RCs2a2ZwZEtWaW40empOMnRhNzJOTUZFdG9MYU1IVWk3Q0svRkFXTmdqcHds?=
 =?utf-8?B?TUdhMXEreVhRcEVUMENqTFpra1UyOTlPeWUveVBmSStPNWc0am5vUTg3UVFE?=
 =?utf-8?B?RWRuaVd0MG96YXBDOUxiSnRLWnlqOUdxZTJhM3NSYy85aWk3ajJTWlhNVlJS?=
 =?utf-8?B?WVhmQk5zdWk0bGpaeHZjdE10dmF3cWpSVWJBRnlJYkQ0bDRGcXl5dEk0MjNk?=
 =?utf-8?B?LzgwRTB4d0NUalZwZS9RZ0FEVDIrdE5GdS9YOC9jZVNuY0tOcmcrSVd1WUxv?=
 =?utf-8?B?bWlTT2U0VGdDVnYwODZ1TDBrS24rNmFsNUptcXQwQjBqNW5qMDZScFJ5U3d2?=
 =?utf-8?B?N0JiMDZXQ1kxREl1amZLd2JIV21qMm94SXlzYStLbGhzWWZuYnJKMGRxejEw?=
 =?utf-8?B?S2RPeXZuY1lqVnE2MHFDWXd0SFlPUys3NkhPelZxb0JKK2kvY0xUaXR5eWpz?=
 =?utf-8?B?YzdMTWw5blFRWkFzb1dWamNEeTlaaWFxbkgybVdSeXVVSnZiZE1SM25MN1VG?=
 =?utf-8?B?VzNpMUZhNEE3R1l1WWxHWGpZT1h6bmtlYXMxZlAyTWxsVWtwd2dsRm03LytF?=
 =?utf-8?B?TjMxblVhVXZNd0hsaFRaRXQ5Z0JaY082TTRBU3poK1VQS2kyYXZ6N05RQjR6?=
 =?utf-8?B?MU1na25HWTlTdnFHOFk5MzltenpTMmlPRnYvTUhYSE0vQ1Z2bDRpNkZCb05V?=
 =?utf-8?B?TGk3Qkg0K0JhZVFsTmZXeGdUMzRBSUxKRGU4L3RLUDZqRWo2OEYyY2RQV2Fy?=
 =?utf-8?B?cGJEbVJhMkxBVnVCbHJBaXFOaGdBYjhmM2wzcDNtdk9JMmxOL2diSzZ0b2J2?=
 =?utf-8?B?M0dRVjdtYy9ZNW50NDAwd3hYSmJrTGNLNE1MM0xVNjhMOTBnSmRoVUhkYkVi?=
 =?utf-8?B?cFMxUmJSbzB6MDYwT2Q0T0xTWlhqUS9JbVV0STVHWEpkWWVGWDNkNHA2M0RV?=
 =?utf-8?B?a3crZ2FRajZmajllL0hTMWg3enlQdGZCdU0zc0V1NDFGa3lUaWJNcjlLTUYy?=
 =?utf-8?B?T0dIU3VxZGFySFRTZjJwR3BDdVV2Si9QKzMzY0x6ajdRMlRlbHBNWk5Wd3Ba?=
 =?utf-8?B?cmNyU29ORnFTL3kxalpXcldpWHJOZy9xS0ZsbzlsU2JjdXBnVnMvT0x6UExS?=
 =?utf-8?B?enNLTEpPZmFvamNpUnVEVzREMUdqSmJZN1B1Y2J6bHFFZ00yTXlDblFncFVx?=
 =?utf-8?B?L2h0dTBlKzg2cHk5RzkyMTFQOXAvREtsM3RmUGp6NjlnM2E3MXNzcDFzaUNM?=
 =?utf-8?B?Z01WcEc5QnJsK3Y5UEU4REV1dHJydDZLcHJvN0dMNmVYaUl5TjJZREtHUlhI?=
 =?utf-8?B?eDF5bncrbkNDcUlMcU1aK0xXK1V5OU9uMlE5Wml4ay9iaEswM0RxbDg2UFlL?=
 =?utf-8?B?aDdFTWUvdlJNenJiYWNEaTFOMEFudXN1ckp0QlJiV3l0SDUxMkhvVFFBbENi?=
 =?utf-8?B?NVZ2aXlmNGxjK2VKYjZaWFdiTER2SUFIb1FUc3JNMHR1ZGhNT0kvOG9ySnVT?=
 =?utf-8?B?ZmlqcU1kMFZBTDhHYmgyUi95RmxJejRQdlU3MXR3bC94Rm5OdUsrcSt6eUtj?=
 =?utf-8?B?cGlIZDZER1hzNXZJbHJUWXM4ak9PdnZUeGVFcG5pRVk4eWdwNEMwU3FNTzJU?=
 =?utf-8?B?cExlMHJ1OVlITGZRb3M2aVBMakhLSnFIRVl5R2VTckQycXBCTmFPaWZLZ2Uw?=
 =?utf-8?B?NS9PdGlwbkw3Qjk2Tm1sejUrbWlIWXhFRlZsbWdXNmkralZNdDVSYm5OU3Bn?=
 =?utf-8?B?UjhqSFNBMS9CNUFqdkhqL1BaODJEOE82Z2h4RllqanhCYnRGWTZiNENoeDVV?=
 =?utf-8?B?ck9pK2Q4bTRralZKUW15eE1tdWJNRi9tenVjOHdVSlR1dWFGSjc0SmtJSTIx?=
 =?utf-8?B?bXRjZVFmRWtoY1c3eXpuaHo0bER3bkdoaktQa2w4SDFNRGpmSzBsWktkdTJm?=
 =?utf-8?B?TER6cVlvRVRZMHpTdkNONi9vak9FK29QZllVeVFLMHBZNFdEbzRtV2JVdXd4?=
 =?utf-8?B?eXh6OTYxYm5TcHJ3Y2dWblJPb2JGaXozVGU1ekMyM0djalBUNWdCS2srbzhF?=
 =?utf-8?B?K2tGdllZellZNmo0dURTSWw4ZFMzaXBSVmhKYkxGcExhVFdUYUh6bVZIQThN?=
 =?utf-8?Q?aTY6VJnNSdyvhQnTKeDPcHg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eda9cc-9221-40c4-ae88-08da01b7926b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:28:37.5238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umZGm5awFRkX35F6tAAT1+khz9cwWzueX0O741tkniqRYX/UmPXobIv0Y5cJKFgPvvu5u7ik/uoNSV9mRZYvDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/03/2022 11:24, Christian König wrote:
> Am 09.03.22 um 11:10 schrieb Simon Ser:
>> On Wednesday, March 9th, 2022 at 10:56, Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
>>
>>> Would it be possible to include the app parameters as well?
>> Can all processes read sysfs events?
> 
> No, but application parameters are usually not secret.
> 
>> There might be security implications here. The app parameters might
>> contain sensitive information, like passwords or tokens.
> 
> It's a well known security vulnerably to provide password etc.. as application parameter since everybody can read them through procfs.
> 
>> Can't the uevent receiver query the kernel to get that info from the
>> PID?
> 
> I'm leaning also towards just providing the PID and not the application name. The information should be as short as possible.
> 

Indeed you're both right. The PID + reading procfs should be enough.

Thanks,
Pierre-Eric
