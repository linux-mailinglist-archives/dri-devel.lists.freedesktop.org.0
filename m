Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844B1C24B8
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 13:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED9E6E0F0;
	Sat,  2 May 2020 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCFE6E0F0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 11:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHW+NmYmTimKwcc/gkBwMQH6PxzUwkuNqK9x3UAf71gLs5RuRMxmjndr3YbP5JGKqFpn60BDbH7MWX/y61aaXdb1xzqOHKnP0fkvD/DoDpdLiVoF1oe6v2aUtO4Guk5cqL2/64ia6+70qPnKGFkhSrYiydDoVKTL6Fh7oXFlBInTx8KzUfJvuz7d7yaEW2XYnX7VQnttnAsUe9/fFx+xXrCnyYuVxX0uISR7XpVFqUuOBOui2GnzaLTH6ntS040475xD+/+6fDM0Yxp36wB8NzMQO5levwS4Zzv6Sds4sdAJJro80Hk/NGuOyhomx3Zo754ZXJf+fYF6IcQPTjnflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtbEmfJJNErJ5KrNQabCScWMP8iCzNuz36nOzK5F860=;
 b=ko4bZp2Umm39A5YrlT+w4FiqB+2kVWdM0/vaHMs17cxeCLbZ2gaPEzLpQx7rqtfi6zkEOHT6IrU3hfghpCtaEIXZXLhn6QcvbgaYl/O+FIaxy3B4XqOnNZFBW6ceUebe1ubwmAmjN+h+hsXSeKLfk9wssDuHk3ipyuZCYPhxXALD3aJYk3bIDOHkwoJOF4/gPnWr+Ir5ytLMo1ga/4E4JjSh3acqjd29BgwmmYuf61O+WRk0KK74TppteAdX9W/eZg7olnk+pMyO9OdgBWOkhXseFqudaHoADTwqjVlZUHjMweQRNZ1cSkED0SpfAraq3Hi3lHRh3Qb5Uwoq9sgyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtbEmfJJNErJ5KrNQabCScWMP8iCzNuz36nOzK5F860=;
 b=d4qE2XJLoNwI5yAAEIlJVbJ4/dcT7c8mQdrS4RMIMAVJzP2AtM8+pcGdglXsbOxxDAIryaqtkA4BkHK4CfRMacI3xN0lcUbU3T13fpUQHUgCYVPkiBw16ZCJtUk4XA+uu+B5gVCG8X2ZWNLBBzduakO1qq+ybdfsK+DzMLcnEWU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3440.namprd12.prod.outlook.com (2603:10b6:208:d0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Sat, 2 May
 2020 11:25:53 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c%7]) with mapi id 15.20.2958.020; Sat, 2 May 2020
 11:25:53 +0000
Subject: Re: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200430095839.6474-1-nirmoy.das@amd.com>
 <158824170487.7361.8387026848955948115@build.alporthouse.com>
 <d5789d27-bf14-c1e7-d9c0-71fce6e16f24@amd.com>
 <158841000025.27785.3023804138122028190@build.alporthouse.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <d13fa199-feac-6719-26c6-11a85dfdb381@amd.com>
Date: Sat, 2 May 2020 12:25:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <158841000025.27785.3023804138122028190@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0098.eurprd05.prod.outlook.com
 (2603:10a6:207:1::24) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f20:1000:a50d:6fb2:9b1e:2904]
 (2003:c5:8f20:1000:a50d:6fb2:9b1e:2904) by
 AM3PR05CA0098.eurprd05.prod.outlook.com (2603:10a6:207:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.27 via Frontend Transport; Sat, 2 May 2020 11:25:52 +0000
X-Originating-IP: [2003:c5:8f20:1000:a50d:6fb2:9b1e:2904]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44e24096-e64f-4dd4-7b95-08d7ee8b9340
X-MS-TrafficTypeDiagnostic: MN2PR12MB3440:|MN2PR12MB3440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB34409B2F74B79AC4D5EB2D6B8BA80@MN2PR12MB3440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 039178EF4A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(110136005)(2616005)(52116002)(2906002)(16526019)(186003)(8676002)(53546011)(8936002)(5660300002)(316002)(31696002)(86362001)(36756003)(966005)(66476007)(66946007)(45080400002)(478600001)(6666004)(66556008)(6486002)(31686004)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/58eSVv2KjMxvs8ulmEKGWOnyTc5+eGDR4rAsc473embVvpRCuy7lUQ4AAuazSayamzce2L5CKC20p93YqppXi0MTqetsc/FnWtYPXXOC2C3+1l6Lxqrz4DuZHLU2LQu7HalczaZcjCwwUvOkkMGJgcLbnOA3O8ci3/06UA+dLPttIbOhM09b1tGuDRzYICff48/hsEPSpgb9d9ORjU7SkMfGsXI0M9fZ7hYLawPBAyVGeO45stKsvi/R+UtpTjiukFolyg6S0jqY6g0mybs9kfrKyN7oKljeIzqtBR/YlN+UDglNi8OAyuvPQZeXKY3Bn1AjdrW0LKIFOr9x0EGxZcx8b++DZ52YtZf2wykSHIXRnXelUatgcOhMRmAooZS1kTzNOCsNz0nNvO+KkUVVbHSVX2q/zsQH9SEreVMBGwtZ9dyk4oXkOk/d9DRhQxmXTkvt6tBTT/5cu4JnFVjCF8mSt5jSf7SHu7QZ2lXPs=
X-MS-Exchange-AntiSpam-MessageData: 1P1hIzGHUGWyx8q3HzGUFuuNFrbNbZY/W6uQjhXA2k1sZI66J6Dn+TzQGfKBoNI5a2ueGyFEUnSaZKCCO4C5ys8hPrmx3yOaCEszyif0hfb3gL92fkV6b5N82kn09AvkTdeS+UmbxOM6geuWDNFFFCx6pQdoJv00vMeiejYv7C3eLeugwnqa2EqUNgzAiOq2BQupOrVOc3lpabqIafyRkWRwKgJOY1gwLeYsdUd0JTonkeFrpVrbKzmHHc7lS8YD/+5Ko8kNlC5ta8GU9U7GdYRrNBS6N20JDbhUHu38bLvhDO7nqrQYf8Ov9yfwztAg7SjYpODEiHgTQJnPQHAdeXmUP9rzXmoj7CpZkXNAB9i8faTbltc0JZ2LGTmpZ0WisVC+ZEnhyLRrh6LzR5h4wCVHB+uWTI1O71Jh3rtNz+y+hjgZiyY0vg8RPdZkbrAh2CfHFWTkjlLVR1tJh8dGYJOVH2BhZFP9x8Ehn9iD7pxcmfdlU7FpCyAUfRyvK26XswC1EaQSHiVBwv0CnDh99v+/2/tBZ/IZgGMEM/LsHWiYATTBS3/7xXwyPDDz8uFmIYZ/tUUzcp4V3KuOl8y/S2zqS5/LHzafRMBqJUn2MvR2p8tr63DKC4p9JgvR1Dod1s1OBmM++eBSP0NR8SGZZs8qP5vyq8TDofIEPea75CEdisHQ5dLFhF5CphsNaumsvCbaIr00sn7LEqG3ijdnT7XvMdOftdnYN/X7C54+vSFeJCkzjbPQiu91KV1C/PtdqB2lnqS0Usu2yHg1D5CKHfbvxzJX7XO6WWvJ63tD/WCz1Lg34Qh9MN838VwpurwVId12uhDxa1bj8Fqo6iD0OlYV7vABGRVFeP4lzL66ht8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e24096-e64f-4dd4-7b95-08d7ee8b9340
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 11:25:53.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KXR1RS4qzkntO1S3BDVKLxDFhg82l16HWsV37Mx1CtPshn6ZjQDRhUwFCBDU+NHjeijFMYrNvS/y+airVsvAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
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
Cc: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/2/2020 10:00 AM, Chris Wilson wrote:
> Quoting Nirmoy (2020-04-30 11:30:43)
>> On 4/30/20 12:15 PM, Chris Wilson wrote:
>>> Quoting Nirmoy Das (2020-04-30 10:58:39)
>>>> +void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
>>> ^ static
>>
>> Ah I forgot!
>>
>>> (sparse [make C=1] or make W=1 will spot this)
>>
>> Thanks for the tip :)
>>
>> Nirmoy
>>
>>> Looks good, I'll check more carefully later.
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> If you do find some time to add some more tests, that would be great!
>
> Even converting your example into a test-drm_mm benchmark [spending a
> few seconds runtime max!] will be very useful.


Thanks Chris for reviewing this. I already started looking into adding 
some fragmentation tests :)


Regards,

Nirmoy


> -Chris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cnirmoy.das%40amd.com%7Ce73eb7b87f8a4c4c180108d7ee77389c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637240068162932922&amp;sdata=%2FthV3slEerwVUYVwGzfiOb%2BtpboXQwYca%2BlAJ3L4Ad0%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
