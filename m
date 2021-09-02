Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CFC3FEAE0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 10:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FD58976D;
	Thu,  2 Sep 2021 08:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96258976D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3Bh5BM155a5ViJVt+CLrZUK/UkVvV8xEdIxFqkKWZIwDlq2ECbNq4bd8y4LmNHonY/tJY8hQkqfJelxLZQu2lFIftVVP+6vyrkgPV+rPN8vgXVE0/Qy/Xa0G2BozIqMxgnwkLA6Q03wJ3pBk8U4m6E3UDTr1JkCxEUOv0egQP+ljdYr7zT5xms6p2j+B1jur9qEI7SfwmQ9hPzxxjH05EM/zQcIzoUTH9d9qSXEa+YM0d2eL78xRb0ZjeBqHTSzUuKeA5GbY0ZRfN1AN/m+N90HKtEptp0i1i9+pltXU+uYrcKYRcrlOQSGgrl2cH6FCKSqnE/QNTDfTsreCNumfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=88LUEYD00A19pUUsQF13FobaYWXSdIRkLDUMyBtILxI=;
 b=UlQMt0bv4c6cbTeGf35tAl0a0KrhLPbw5IB8q/6FoXtRT5N1lJlPnHZzinnzVGh8QUf3vh1oZBN6DTcsNHDUsIX/WzOwRw+gyOOUTJkQAa0vHtym1tqVyorwqCxVkyHqlnESxXLlOpbud/eAiYEzb6/IiEKBc3tHXIMYzI7VIC/QXOBAPJKJiAOcd9G4fqNIZSLAkjX5fw4B/C7t0XF8bZWEeieAnBzbdSYA/l0dw4zCTRGrj0RXrVdKyq3HgSv7+nAkEc71hmxkNpo6P0kXl5oCtJ6fH16eZw/OeEESJsUCIWugrNGf0yz5wYnyIUobqjhpMHQhHO6jY9kgFPd9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88LUEYD00A19pUUsQF13FobaYWXSdIRkLDUMyBtILxI=;
 b=v75M4Ilvk5bAMwef/CT+NdUN0J3TJ/lNaMv2DA3WXTojhGV1mAPlI+jBSNUmiecNgBWquye8HRnQBW9BFbvTwdtu+Ly8ER6fIbpHP7rDsvJq6u46B6f4Kp36ujiRAt/Q4vcmquiVDahsZLKC1325+4XcoOElk7P+Z0FRjfNXHL8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3184.namprd12.prod.outlook.com (2603:10b6:208:100::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 08:56:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:56:42 +0000
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
To: Johannes Berg <johannes@sipsolutions.net>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
 <288a2d4dbcb1e6b0fbeff6da86569aa92df09202.camel@sipsolutions.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4e4a4c2-6729-4964-edc9-8e06733207a9@amd.com>
Date: Thu, 2 Sep 2021 10:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <288a2d4dbcb1e6b0fbeff6da86569aa92df09202.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:eecb:a21b:e309:246]
 (2a02:908:1252:fb60:eecb:a21b:e309:246) by
 AM8P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb1e388-ac09-42d2-9341-08d96def952b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3184348D99EAFA338E2121E883CE9@MN2PR12MB3184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kxob7+ddY0ZGlmI4bcqZHmlnoJ5YoBmpN6xZXGv3dCJBsYvIm8NVE21/F+Z9Va4S3RQ/xvouLjhrodgyATXTeEqjaVTUMhI8nufh0zFDYTiqilQLKuDft/bk+dWlrEzgGKM/iJIRPnsw/I5FucDVDpZ/0974U168FEgL1jRaH9mOqE8ghfsmIpQBODdNhKCf+XNeEFdqBNhCco/7D5/XitNG17O34oP+0ixBulynIUhLihSgj+zAIQnc4IvUl88kDCFykW2ytPgLCVSQry57MwDUsHdZFugqIrbuiuStE1H9ZVCMg+c8a0LTysFVb8Bj4mZHUdEQS4M7u8p+TtsM9gIs3OG+4jr/Rxw7Va1QAdnkCqSwfuWZ6jY5Xesudc0y9Hu1ru/eZsQJSxKXYZQAG757FbmLZXwXjUVqgH5VKpSf6bwyueNhsqDTYDsWwooRRM6Y0ywW+J8f+OhZfC/JmmJ48XWOq/iU08AukAd0kwKN1gErUXOChW53uFAv5VUcPv6BMB5sA/OtoCJbQwWv7Nns+oRn9P03RizjgA43a8OqIgUk9yedRXy/OIudbykZz/oZq0olLiXPyMzoFYL2C86i8X2IBFUvfA0AvF39sYatT46KEt9xLwHRq5vual49GCgW9WD8pSmp7Fbr5mRjkvQ1OG2/C4J89+3Setelc1X/UaiFT12TU9N/YxjTv5JHnSAQsLFzBuOeKwytpmrJHeaO/2Q74kugrspczFS5lUaZO7EkNk4VqA0b9/5fR+2clyR1Ri9JCbCUOdPrXD819/9a0iOqldcO77O9drIFOpGBhxkTqBbBUZAFKui5Y3VM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(36756003)(86362001)(316002)(186003)(6666004)(966005)(8936002)(31686004)(54906003)(8676002)(508600001)(45080400002)(2906002)(38100700002)(7416002)(2616005)(5660300002)(66556008)(110136005)(66476007)(6486002)(66946007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk4yTkU1Rk4xZ1dZSUlxMjdkWFlJWEs2NlQrdGZ2T1BybVJ0Y1NzUy9Lckhr?=
 =?utf-8?B?SjlTeFZXai9zMDRCQTlJK0dxVXRTUFdLRkxZR09NbnMzVUJETDdTRmp0RUJD?=
 =?utf-8?B?bTByVE5zamtUT2trL2dabnZad1ltbjNDWFc3cnlTZ1pjQ0FEYjd2ZENBSjlR?=
 =?utf-8?B?QjBhdVZWanN6bTVXcjBDY3RvV0pQWGtrUDZYM2h1RzhsMG1OY0xSYTY5NmZ5?=
 =?utf-8?B?cy9hSmZ3RHcxc1RFWHFnNHZDeGozbW9qQjQ4Rlo0M3Avb255SGlpam9YWFFL?=
 =?utf-8?B?QzU2RWxDVStaeExvdys4MGp3UjFuWjF2ZjhMQUZYQVIrVXhqTldMS2JzKzUz?=
 =?utf-8?B?ZTdxM3lZM0tEbkhFSC9yZkpiVVErbGJWZTdTcDlDZGVOUWN2R2RKTFlVbFlX?=
 =?utf-8?B?VmUreXZNL0w2eEtKZjVDdGY3ODVVeWVQL2dZUUlmWEliR3huVHo3c1NKQ3N4?=
 =?utf-8?B?TUFUbXI2WkhMU2RZQWNYcGtER2lvSHg3aHFPYkZ5bWJzR2JRT3dmblovOEZx?=
 =?utf-8?B?SzM3ZnNZbUlUeldDUVpNSXlQUkltc1FrU2cybFhDUVI4QmZzUXJna2ovSHhq?=
 =?utf-8?B?SGlJcVZDVkQ2akFxSjlCOXNrNTcybXc5SGFaalhUdG51ak9RQkoxN0JQcm1s?=
 =?utf-8?B?MEZheFBRazZjbFhXaWU1MEFJNFNBdHNheXZHRk9YOFN6YXppT2ZnUHlEUG5M?=
 =?utf-8?B?OE0yRUFQK0s3MUlkd0FiZlEveTFqbXY4Z1lDVTVpYTFsRTdKZzVSZ0xwTm5D?=
 =?utf-8?B?VEwwVlNHODJEMmh6SG1sc2ZFeThBMURoSXRVOU1yUk1ieXppbWlhTkw5Q1Nh?=
 =?utf-8?B?bjVWdGJ3SU1DdlJsdmxUdmF2RlVKNm1Rc1JhZHhmcjF1d01FVHgrbXV0U2Ru?=
 =?utf-8?B?dXlxUk5pVzF3eEpRM09IaHQvQVNJSTE2NkEvQmhET1l0TXJzWjVvODk3d2RQ?=
 =?utf-8?B?SmFwSGFNQVNWSUxPYTRQNnRJRGYvdDk0dHAyemdOU1VLTUxkaWM0Sm80ZlM3?=
 =?utf-8?B?c1NZQlpzM2xDUS9Mbi9rcUk3NFRNc0dXcGhRckQ0dDRVM2tRdW1Xb1lZNDcw?=
 =?utf-8?B?STVseS9sZGZaanB4SFprRTBJMVR5aERBYUlzUEs1eGJqM29TWGQvWE1Bb0k3?=
 =?utf-8?B?N2dUVHB3NUdFL1VZQ0t2eXBITjMxVkkvL0NjZGpVNHkranJmQzJRZnJGc2hQ?=
 =?utf-8?B?TUIwVU5ZSm5nTStVSzdjY1ExTnJoaXVoUjVhTllYQWRYN3REREZ1R1ozL0R6?=
 =?utf-8?B?ZjJucnlNZC9tK2JsVW9Xb2M3RzlGZThqeHU1enp5OFQzeXYwajRkK25oRGY0?=
 =?utf-8?B?M0VZR0RHT3AvUVFoZ1lsM3crakFKYnF1MFU1dHlFakxYQVBINjJXRHRBQ2dQ?=
 =?utf-8?B?WkFEaFBCckdSRTZ4NmZISXNuV0pNRTZjSnBUdVdVYVB4VW5wKzIzR0lZRklO?=
 =?utf-8?B?SWJlQVEyc01iNTk5RXdnd1N0T2V6VDB1OTRqam1BbGZQeFkzRkhreldldmdS?=
 =?utf-8?B?TVI0WEpQN3F3UlF1a0c2ZTB6MjhmSlFiejhmQkVqZlR0b1RYUmZia2NwdElh?=
 =?utf-8?B?TE9Tc1hOalZPWHl1ZHB0NmN0ZFpYWjJCYWNEVXFEaE1ISzFrRldDVDgxejNJ?=
 =?utf-8?B?b0k2a1l0R2hIVDBPRUVENzl1Qk51TUNtUEsrcittNEtpMHdOVjQ0cGMzVVVz?=
 =?utf-8?B?QmllSGJwb0phMlUwTDR0QTJFSkdndDQ4bUh3RkNYOUNkWW1ZWTJKTTdSU05y?=
 =?utf-8?B?a1BGcEQwdW5INE1vcVZtZXk2eUlpalUwM1ZIa2lCZ1F1eDlJZXFRNjhlaEJm?=
 =?utf-8?B?ZFU0RVhSMDhiNDQwQWhxaENrdVVqbFZSYUd4dDJRWE9XR3dWR0pVU2orSFht?=
 =?utf-8?Q?8rQ7NVvWAUaO1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb1e388-ac09-42d2-9341-08d96def952b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:56:42.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nyrWczuuFzzmeuAOdk7zm0KY2sG/2iLNzdl8ELaoe7awi3EA3x7C6MTZCtPM6u1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3184
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

Am 02.09.21 um 09:43 schrieb Johannes Berg:
> On Thu, 2021-09-02 at 07:19 +0100, Anton Ivanov wrote:
>>>> I have a question though - why all of DRM is not !UML in config. Not
>>>> like we can use them.
>>> I have no idea about that.
>>> Hopefully one of the (other) UML maintainers can answer you.
>> Touche.
>>
>> We will discuss that and possibly push a patch to !UML that part of the
>> tree. IMHO it is not applicable.
> As I just said on the other patch, all of this is fallout from my commit
> 68f5d3f3b654 ("um: add PCI over virtio emulation driver") which is the
> first time that you could have PCI on UML.
>
> Without having checked, in this particular case it's probably something
> like
>
> 	depends on PCI && X86_64
>
> as we've seen in other drivers (idxd, ioat).
>
> The biggest problem is probably that UML internally uses X86_64
> (arch/x86/um/Kconfig), which is ... unexpected ... since CONFIG_X86_64
> is typically considered the ARCH, and now the ARCH is actually um.

Yeah, as TTM maintainer I was about to NAK that approach here.

Basically you are claiming to be X86_64, but then you don't use the 
X86_64 architecture and are surprised that it things break somewhere else.

This is not something you can blame on subsystems or even drivers, but 
rather just a broken architectural design and so needs to be fixed there.

Regards,
Christian.

>
> I think we can just fix that and get rid of this entire class of
> problems? Something like
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fp.sipsolutions.net%2Ffbac19d86637e286.txt&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd773b1e8b66643874d1308d96de56a86%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661654674393046%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=xBT%2Fj%2FbEgltQfvE%2B7%2FGRV7IctGn3sDvy8ycmBvTTSXU%3D&amp;reserved=0
>
> johannes
>
>

