Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7874759E07
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9110E4F6;
	Wed, 19 Jul 2023 18:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333F10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inAVUxXGvogdsG9hq8W6wckaDX+N0iwTnFNdnzxZUwQ9GP2XdPcelSZHFEoUFYKxWei93L3B8d3uc3uqjbPLfkW89TdUzZ3+B4imFq6oH6I8IGMrYImxJ9kfs0KB5LPSJoJ4xTpv8bnt7dMcwAuU6Xjg4y5XLmX2bxjKBJHynepTca+ekuZ7Y1HnDoorkl23LaODliJ6zDMgMkzmGCbqJ3NcQ6DX+4TL8etBIH7ENVaIEv0GatydW+hMFoi79NOR7/BpgFvXpbex64s1gsNXdwVB9DjEJWvBvQ5ZLyonITLRXXHD5U1Eu7Q6+N6JYlJ8Om0+qiCR7wOms6gOvcAvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot+Rq2B+KBj1DCwbFs8/axYgWk50cTOePHBYyhuryFU=;
 b=g3tJ6wLjwwqbPoGdbyqnFR+zfuhjcod6Gl+jFe2jDe/roz5Sd4m9haiO4cLs6B0NqLdeTDGyZ/duhIAaYooFa2cATr4NvzubOnjsh+z434imuDInzdrzlkwstm0lmlNJItISXTT8s9n8dsOrjx8xhKKfLVJ+u1615KGNaIpS5TKh3nsvezLkiGy6HgN+cM58wQevPXAfskf9uDY82Pe9JnypFbIWXR1Z7KUivMVw2WAONy3FlVrePovL1OdxHJ6K/GRytGTxB4kJXQODvG5xrcxgb39EHKKG6BCVtTiD5OXdydR1/hgnHhx/LWHa7y89dPfj9y0kJuJBI5wN8ISQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot+Rq2B+KBj1DCwbFs8/axYgWk50cTOePHBYyhuryFU=;
 b=pwg+lJGl7pi2o5WVaGHEcO8UsFtO+/cgcoYtg9HZ7IOdloMcc6VT4rvyMttIs75KKSqf1Luz0AQSh94RK67m49wCMM4asgtRn2uDSnjZwPagJ9Z68ddm8CrjofyEPPbWQSxriuJW4K/l3rR3Z8P4bGEUm9EqQ4y660J3J+R/XVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.23; Wed, 19 Jul 2023 18:58:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 18:58:36 +0000
Message-ID: <a6212d8b-a9f5-a3c0-8e0f-a9a7658849ad@amd.com>
Date: Wed, 19 Jul 2023 14:58:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-CA, en-US
To: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>,
 Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <41efcbe5-e230-270f-53bb-90c703e9d3ad@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
 <4587c699-5a59-d465-01f4-1bc2fbef7a12@asahilina.net>
 <847159ff6d0c01cef2e6308848ea49a732248e42@linux.dev>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <847159ff6d0c01cef2e6308848ea49a732248e42@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::36) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb57157-ab37-40b0-8932-08db888a27db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5vJocBzR9Z3g5qTLY+bLi5t+zZi/dK/mEyc2tGfCJbtwf9+1sr3Ty5QdwEgSdEY8WkE9zIgUnRltDeDVir8nPxjh3CMZ7CV2NTmQMFBP2OtELhraOAzRiR0WHmq4LDLAneYkedwW53sOpj+0zFNRGTL/zEgj7wiEkLsgGT4saFsO0i/JW9iahKuZZleZbmnveqvAklc63T8thUKJLC1cCB9azsFNQI6sk9/sWcO38vJTWf38/U5ermG0R/bLsxKlOADIbT174da4hj3X7SGybgAz9ltWiPCXjcj7HZni5oVQvVIuAZzCrFaIOv9Z0y+CVOIbuaSiLgMKoMIf9Mg0I73ce6tow2F0R8RC2/osmrgEkT1VV0k6Gn127LR7/iiKQk5ddD5BOps4yCJsTrojK95BUIgki14U1xGve9UunzLX0043EcmXGZdbuP+UaHTBusxZ6FUgKmSE7VUz1igzmXerlc7ZSJGfED02CcBzFjjTFebUVsd6EDJjj4ThqTuZYJGoFZscPz8r8CYo9A/56FYiCQylgzJC3BseD1d7khH8qhT6tTIcnW6h3rSk2HynodoyrvoRMXihxYiobvpeZqB9eufgMb5TDU8BlVX9USILrGcIzHcsL1n5MSUwPDLbKolcaZgop1qCgu/9DD6zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(110136005)(83380400001)(54906003)(478600001)(26005)(6512007)(6506007)(53546011)(36756003)(31696002)(6666004)(6486002)(86362001)(186003)(2616005)(2906002)(6636002)(4326008)(66556008)(66476007)(316002)(5660300002)(66946007)(8676002)(44832011)(31686004)(8936002)(7416002)(41300700001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymt0ZmtZU0ZabnByQVMrTWxQM1hRRU8wRk8xV09UYTU1UzhXSFRWSkNWRzdk?=
 =?utf-8?B?R3kxWnE4dXJzM0VEMm1RdnZ2K3dvc1I2R0ppdUhadXJFUHEvOHUvV28vQzlV?=
 =?utf-8?B?US82MHpmdFp3ZmpTMnBVeFE3OHg4dFZkN0ZGaTZoR3hOZEszUnlwMktlVkVi?=
 =?utf-8?B?Wkt1YzJxSzRlSmdkRTFaV0xjVmFvQVp4UTVEQnNpdmk5bi9IaHQ0aHI2eFM2?=
 =?utf-8?B?K1d5VWxrdzFyZm1NTUFlWFpKNTBzV1B6OG5rYmVEc1hUditldjYwNm9wTHpD?=
 =?utf-8?B?MlArV3pXd3dYMmFaVlhZNHh4UGIvMGd1ZmpnK1NoRCsvcXJNejErSGFBUVd3?=
 =?utf-8?B?US9Yb0JWekN4NGhCa2M0dmpsWWhuMFR5V21mUmV0S0JKRHZGS0pwTVJyakFo?=
 =?utf-8?B?aXRwTmVSVkxpelU3UUw5SDliQkJYcUNqcU13N0E3ZUo1ZTBmZnBwNnAvbkhp?=
 =?utf-8?B?aldFVmZ6SElGWXhKVXNQY0ltOGlpWE40YzdQZk9Sb2Y3d1dXL1djQ0VYbWVZ?=
 =?utf-8?B?YUpYQ1JhOHpCRGsvYkxpTGs0bkRpV3F6SFVPQUF0dlRJM1hlY2VsYlQyTk9o?=
 =?utf-8?B?QlVqQUtPaUs0a004RFh3VTBsQTlsVTl6Q05VWmEzMFA5Wm9xR0Z5U0FsaVlZ?=
 =?utf-8?B?a1l2bG5LZFlGTFZaU3FDTm0yazdINXZjZXVrTnkzK0p6dUJqM0JadHFNWGJ4?=
 =?utf-8?B?UTlJdDRrV1MzMGNXWlBtenNNU0lVUHRSQ2Zkek5IR2Vta0tlRXZueDMxbUgr?=
 =?utf-8?B?MmpuQ290ZFB6TzRIVnlXY1dVaW5wNmp6cGNLOENKdkNKc2RFTDM1ekY5S0ZS?=
 =?utf-8?B?MHFnRTl5c29XNEJTZWwyRDgvTUxBL2dudUJESG5qSWZLZy9qTE8xNG1PTkc0?=
 =?utf-8?B?NXVQVGtRdEVqZDFyRHFCMGVaeTRkcWpNbGpFcHJJUTBFcTFXQzlmWndiV09C?=
 =?utf-8?B?aHhSaHgxQ0hqTnlQK3VSV1Y5MTJVeEh4UEE4MzY4R1BxR2F2ZjMrUXIxeFRH?=
 =?utf-8?B?clFQdUgwaDR0aXYvUC9lWDI5VWRodG9ITFgvRXZkNFhqMjJBZTExMjZLVXNr?=
 =?utf-8?B?ajlJQms1dExzWVZ2dDJ1T0xIK2xXWlpIRktraDVWUGVCNXNvRU11VVJWS2d3?=
 =?utf-8?B?MHZHeHkyTEN6SldkSVBPRUFYVDFRMFYzUmpDbVowaUx5VUNSM1MwT0trS1dr?=
 =?utf-8?B?WU1sNmJoSkJ1S2VvYU42UW1MZ1VNMURablhTd0dvRjhMelhCV2dZOTVrR3U2?=
 =?utf-8?B?dzA1OEx6eGIzWnBNOWw5YUM5d1dUVzRnSFNMazB1RzN6RHRoQVBTT0lDMlhV?=
 =?utf-8?B?ZHdBL29YajU2OXZ4cmxMNmkwZjNTM0p2Z2JNd1lSNFp4RnJVdHVJemZ0VnFR?=
 =?utf-8?B?NGVwOGYzS0tLTStRdlU3RVdJVTU0NDM0L2xRMjlMMCs2RGdvRGhZdzd5eWow?=
 =?utf-8?B?R1lpYjd4R1ZDekNFZlNOTC9Bek5mOHRpcUY2eWpjdFgrRE8zUjVaZEJVczcr?=
 =?utf-8?B?Q1hFbDVjVEhFcGNCUjRlWVhPM0plc1RjWEZTUnhNSHFJK3R5cHFyWWRwM3dh?=
 =?utf-8?B?UTFhRkpvditxS1V3TTI0SnJkQkMraGdRa0lMOEdPNitJaHhnUWZGYVUxZy9M?=
 =?utf-8?B?Zm4wVFBSSmpXWm91Zk8ranJsTUZhL0hmbjBSajlMRHN1NnZ0NTl4WWFQa2dj?=
 =?utf-8?B?bUZPSFJObW5EU2RubDJGSk9nV0FRVEVQc3ErWFg1NFMyNDBMZnpCOXVXdzVi?=
 =?utf-8?B?OUl4T0ZLWDlLR3J3YUpqTlkvYVhlMVJ4SHJrMm9nWnhGQ3F4b2RxTVF0V0o0?=
 =?utf-8?B?amVoaFRUKzVSa24yUml5STBxRTRISE5XSkVyb1N4Q3hER3h6UmN5QU41THl2?=
 =?utf-8?B?aTJuWEwyalFGUGlWRE8zMWVtSGQrWFZITHNiUHlEMkFJU0piT2JiaHA2RFlG?=
 =?utf-8?B?SG9aaTRLN2JuL0dZUnBjcS93WUxmeTNhRlFFNVpHL3h4UyttQWZ4QnlremJk?=
 =?utf-8?B?UGNJcDJ1YWNqbGx3V2VkbStWWjI4QnBZRkVNb2dldytwQ0VDc0JwQjdhclRN?=
 =?utf-8?B?OFAzNllEbFJUdjJXRXQ0ZWZkaVV0cU4wQ2tPdThaWjNuQ1JnVnVJNVRGem9W?=
 =?utf-8?Q?K/Bsov/2coNhhyfv8X/QRSC1d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb57157-ab37-40b0-8932-08db888a27db
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 18:58:36.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvqfhHoY0TKiDg6Nrxd5qiIrOj6+WRThKF2ysV3XiEge/Clm8TXBDWQteq0jEqgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-19 14:16, Konstantin Ryabitsev wrote:
> July 18, 2023 at 1:14 AM, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
>>>> Not sure about other drivers--they can speak for themselves and the CC list
>>>>  should include them--please use "dim add-missing-cc" and make sure
>>>>  that the Git commit description contains the Cc tags--then git send-email
>>>>  will populate the SMTP CC. Feel free to add more Cc tags on top of that.
>>>  
>>>  I use `b4 prep -c` which I think does the same thing? I just ran it 
>>>  again and it only added 'linaro-mm-sig@lists.linaro.org', not sure why 
>>>  that one wasn't there. Am I missing anything else?
>>
>> Not sure about "b4 prep -c"--using "git send-email" instead, but what is
>> important is to add the Cc: tags as part of the commit message. A "git log" of
>> drm-misc-next shows the proper format. Then maintainers add Link:
>> tag to the correct email thread, which is usually completely automated
>> by "dim" or by "git am", or both.
> 
> It's useful to note here that this is not standard practice across the entirety of the Linux tree. In general, Cc: trailers are added to individual commits when get_maintainer.pl wouldn't otherwise include someone in the recipient list. The "dim" tool mentioned here is specific to the DRM subsystem (the "d" stands for "DRM"). Since both tools work on git series, you can use it alongside b4.
> 

In DRM we use "dim"--it's just how we do things and everyone complies with this.
"dim" also includes the Link: tag (which "git am" can also be made add), and this adds
certain amount of accountability, which is a good thing.

This is why I suggested that a subsequent version of these patches, include
the Cc: tags, which would normally come from "dim add-missing-cc", which uses
"scripts/get_maintainer.pl".

DRM maintainers regularly use `git rebase --exec "dim add-missing-cc" ...'.

> DRM folks, if get_maintainer.pl isn't finding someone who should be included on a series of patches, should the MAINTAINERS file be updated to make it easier to submit valid patches without needing to know of "dim"?
"scripts/get_maintainer.pl" does consult the MAINTAINERS file. There's been no immediate need
to update the MAINTAINERS file.

Sometimes a single function or a single line in a function (as in some kind of complex calculation),
might be coming from someone who doesn't normally commit to the subsystem. This is where "git blame"
and "git log" are helpful to inspect and add a Cc: tag with that email to the commit message, and this
of course depends on the nature of the incoming patch.
-- 
Regards,
Luben

