Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17E1952A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 09:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417FA6E055;
	Fri, 27 Mar 2020 08:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCAA6E055
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 08:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCReXxGq340eJFsmkDNj8iGSbPd+zeXM3pUQfJv+8zvdSvumeq4uyPb8piAyJSBnFgYpSBDDAtubu4j7QZzAdZE+tgOEt3a36qk4FBLeIHVyvtTTsR4KBjYl80rrEDvEa1Yje+mMWuGEgoT9nnTDba5D2/uO007Azo1ix8a98gYQxsjVUl6pyjShVPxkD5+J1ntEzevMRr0nbezVr01QudPzjaudrnVi/yveF5ECrPCjBFqgwrDOkBFA+DnU7AnH1NPgYpRk9dpyLf6J9yi+s+fZXSuhvU6GGmc3Sx9/6aX98XpqOmqv3nt5o+DfA1pfrskSXyz8HduoeDzEsdrz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/NJLPNih5qF607SUebxyV+1/Eyiq4tvyAl737UOGCg=;
 b=YiZEc2AIZDISCcAL4Vo+c8ibrQnlaxvNBc9ztv1O2mjmlvKFLJ4BXYRv0Z1BvwmP/5/oMHSdU5BzOpcmBN0c4Er9tArNNUDRUY5eUuYmJyOVRenlOLCSD/8DsSeAt3ZkbXDdS838VVAAATz4SHRn6zOS2gozn0eBOOhNTOZ0jt6Oxq3qrHbWgiW6QAyD1cgeSw3z1HkNpxzKXNWarkW0/0fBE+6Pkf1gHFvrgP0fym2x7Uh/5aYrqXSjtnGg2qgXy+Y3BjwHtWzluSEUNE4s0zElLa9fgTBA/+1SURtm7u0Y5z/Xmyly8/LxI97eSE2BznAz3uxz7epdUwsYv2ZMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/NJLPNih5qF607SUebxyV+1/Eyiq4tvyAl737UOGCg=;
 b=FIkCTT7EJ6Yzxt7er2G6X4utYqji0faCswRh5AqqXZM5qMwvTa6/SXAQFZ2s9CQQvxE8kAC9VIKTts9HpXmP9LtQPty3Sd2Zf2rbYb5XKev+muLCLuLCKjiLsTS9YfuPQ8IPRAhqZ0eLIN5dZq//gK6+5+nWqC3BnoSqpg/CZZk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3434.namprd12.prod.outlook.com (2603:10b6:5:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 08:11:58 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 08:11:58 +0000
Subject: Re: [v4,1/3] drm/prime: use dma length macro when mapping sg
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Shane Francis <bigbeeshane@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200325090741.21957-2-bigbeeshane@gmail.com>
 <CGME20200327075458eucas1p2f1011560c5d2d2a754d2394f56367ebb@eucas1p2.samsung.com>
 <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <82df6735-1cf0-e31f-29cc-f7d07bdaf346@amd.com>
Date: Fri, 27 Mar 2020 09:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <4aef60ff-d9e4-d3d0-1a28-8c2dc3b94271@samsung.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18 via Frontend Transport; Fri, 27 Mar 2020 08:11:56 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccbc7e0a-7416-4c8d-8202-08d7d22684ba
X-MS-TrafficTypeDiagnostic: DM6PR12MB3434:|DM6PR12MB3434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB34348A70078B9AF6F2ABA81583CC0@DM6PR12MB3434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(186003)(2906002)(53546011)(66556008)(2616005)(66476007)(16526019)(66946007)(81156014)(8676002)(8936002)(36756003)(110136005)(6486002)(52116002)(31686004)(6666004)(81166006)(5660300002)(4326008)(478600001)(316002)(86362001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3434;
 H:DM6PR12MB4401.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQxyOtsHmE42GbsrP8f0XBhN5qbfFGqa0o0neMdiWxJSDVWNylh5U46O4PJn6ASTDEgjL/FWQgXCkXvrnuNYHyHpyqgcJ8/2Kla3K6+jQYUgdw0F8qGbH/Oj9Fuf9NYkCGSqifJBpMyRX7AsaP7v/xYh8bEoCHo15dVEAb4vT6esMifDllpdF8WsUcT1kF1Cn1zLjP7jtdfpepB9DqaBw4UIE0OtCnCEl2kMAx9DAj3oqz62HYo8NcESILCib6zzlG3SuN4Br4ls1SQPrCbe8GcivvWcGP0S9Dy/fP1/UIoctzDjdzSRbqZTa+qT/0YMUSpkRS3TnVM7ykKs4hFH4f+QUQZ11eXT/yJHOQ7W4c3csuoZgznx+kpAOBIqQmoLqdSx3Op38Bo4wJCCrk/hv8ejoQm5HJ20V2XENAkCgYSsbmf/KYsKy4oEG/6l9EtM
X-MS-Exchange-AntiSpam-MessageData: NKCC1pf/s/sLh4ovCZV53iiA9CWgmofkGup1YvdRqZ9ZPkRIRmIGYr6GQwv0bl39pmNGfYPZaP6mUWHFis4oFMJP092VpoGZ52nqt0SRPP7mbEOfHN8+drchC6m7BCwi7tbm2jf5sBqcmP30cBMXz3VRm7jookRrPSgjWiPZ/jh7FbaFNUlbcDlrQ3wpO2/gzbJ2uVb/ovjC5s0mrNj5mg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbc7e0a-7416-4c8d-8202-08d7d22684ba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 08:11:57.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgNWpSTxxCawu9vyzrlFlGMyzkXyL/NpbcywY+hPtkLvgve87GDJzPoL7JVcLZLi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3434
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
Cc: airlied@linux.ie, alexander.deucher@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx-request@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.03.20 um 08:54 schrieb Marek Szyprowski:
> Hi All,
>
> On 2020-03-25 10:07, Shane Francis wrote:
>> As dma_map_sg can reorganize scatter-gather lists in a
>> way that can cause some later segments to be empty we should
>> always use the sg_dma_len macro to fetch the actual length.
>>
>> This could now be 0 and not need to be mapped to a page or
>> address array
>>
>> Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> This patch landed in linux-next 20200326 and it causes a kernel panic on
> various Exynos SoC based boards.
>> ---
>>    drivers/gpu/drm/drm_prime.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 86d9b0e45c8c..1de2cde2277c 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -967,7 +967,7 @@ int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page **pages,
>>    
>>    	index = 0;
>>    	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
>> -		len = sg->length;
>> +		len = sg_dma_len(sg);
>>    		page = sg_page(sg);
>>    		addr = sg_dma_address(sg);
>>    
> Sorry, but this code is wrong :(

Well it is at least better than before because it makes most drivers 
work correctly again.

See we only fill the pages array because some drivers (like Exynos) are 
still buggy and require this.

Accessing the pages of an DMA-buf imported sg_table is illegal and 
should be fixed in the drivers.

> [SNIP]
>
> I will send a patch in a few minutes with the above fixed code.

That is certainly a good idea for now, but could we also put on 
somebodies todo list an item to fix Exynos?

Thanks in advance,
Christian.

>
> Best regards

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
