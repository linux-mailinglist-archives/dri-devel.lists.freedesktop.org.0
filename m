Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCE23466E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8181B6EA8E;
	Fri, 31 Jul 2020 13:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0026EA8E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRm0TbdG65zRFgPvYqu2xU5/nhtfPjUHl8Cfwl5baj+cGjDcaINVIN2JDaEvEtLqqNiAtHds3bxpN7GKPR8DxhuCVv5oaKdYN5p20RhjnSt71eBV2c4Mxbr9jpiud81SQZB72dVX3loEWa8H87/BzK6oERmYIH0mOM+rd+QIwG+4Iq98yQUwQzRHy/QirepAYxze0g7l5hwy3zLWHsj5ZgPAlDIFCDCs+EZNYZ9q+lVbf4kk7Wde25WLGLuYBBNjUr4n8kFs1367tgliQQC/93ePvIOUq8bUz3U5UnFEIvZx5T1vaqyGnMKLhFesJalIoMnGiw9zUhikBEHwRzm2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAZOOGIMh2lq/TtWv3jgP7wAAqXvHSQuptmEibTdJdY=;
 b=nkSB2aiqd62f3tMqPjysofAt+2CXmv6i57EEeaMyZCgn7pOGSabSPyxrEdHT3cBfrgIbjDhCpydQPDTqpAI6F7lASCB+oUKzENPMg+Wtp3kV3hyTHWl+V+9Q5obPmneR1xcd62WN9NY7ZiJRQDUY6J6vgx0ZQPHsnMMGC8ixrBPbOEGZntjDR4Zg2YvjDr6EgaHQ6B9EV0NK7FRJePBG3V47LLP++xoCsYJu2oVD0Tn4B8q5Sy1Ir4ekyPGTTym2nq89tnTL+Lx7Lpyhb2oS+nT7A4V+v2ysQ8gI4cbiCQuJU4gRPQxWAJDrBgSUiorqNkuGfSncRKTzDViPSVqVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAZOOGIMh2lq/TtWv3jgP7wAAqXvHSQuptmEibTdJdY=;
 b=lZeaQDTETUvnOSnBmsb2Tmu4VfbCN0Gj4FEOUVi9MzCcHpLQoY8VaTvO6xJXM+JD7T6J/epYD9itLE3ycGqhxrHRwHYcM8Wx0gvKm5r5QA4OxepSu2lInzHl5idIbgrTRIWR9aBjE7acp41Lu0zVetRX3niwSFxckIKeWFI+DTM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Fri, 31 Jul
 2020 13:03:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:03:26 +0000
Subject: Re: [PATCH 34/49] drm/ttm: make manager debug function optional
To: daniel@ffwll.ch
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-35-airlied@gmail.com>
 <20200731094614.GA6419@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3a811a53-3452-f866-b88e-d99dd2ce3efc@amd.com>
Date: Fri, 31 Jul 2020 15:03:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731094614.GA6419@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 13:03:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3db9c389-fbfd-4582-cbf8-08d835521cd9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4109AA9D1C0695BF41F44255834E0@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tjsdQj2VGgNGz2wCz5PM3SLZJ8L8YEkiXPGKmeElSK1PTEzIU4VynQ53gwO3IR4Dqp8Hw4pxLncV6zDU8YFOecUsA/pV3az0nHBc9pUbvoVLklmyQ8RteU/VSIv8RgKPuPzAJ6Krg3Ok7IneDAFVKCKh/YJi4hPRXa4LSsEU246+8iySg1ScJeBP7zS30o8zr92b+Ga9cYmaRYob3REm7V+xOsULo1q+TGfDFciRq7W2wm0DF5A46F58UMhLyywxPGqtVfwAmTnRPvUyyDiObRv+trjNDtznHYtS79y9Mxo96UO32R4rHTLMggY74jSIQuM+O06a41/yZ8mNjp5HYy9yRdp/ZXuBdAfaOAGAjz3pgjuZzzwCJBWhnr8Z+VhhHcrec8iT2knPkNJzc6Cn1PijlBzJ+3sTIht5t+kxdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(36756003)(31696002)(52116002)(186003)(8936002)(16526019)(31686004)(6916009)(966005)(2616005)(478600001)(8676002)(86362001)(6486002)(4326008)(5660300002)(2906002)(83380400001)(66476007)(66946007)(45080400002)(6666004)(66556008)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eIrdkZh8SmxSTgAaxUj+sWS2UFEy9Dk9NtmxJOPMRJVWn4uJLnGbu2lfCdMar7nJmfOcllmlJnw1VGPtiO2cENwIx59/dKizgXcgE+EqvYO8pvX926Nh16CDiA3htvsdR4rZtFmOeMRvSHEBSnZTLRU9wjwcrHF1/6wrLnyzQ8k47eq6+SNtGGr0FNrKvqHOQnlVkRem067yHUVlUuc0wAZ0/moJWS4d3twz424Rsy4PbLHJ1D8oVrp71+cBjsxanJtqykMJv3seFRiwSLqmuPCmuoy1UlTnopxxIGJQDPugmtgE1In9CT/xQhRK/UMN11iMyUFtH7qe75f9BGKfUhM9d72lZUeEg7tybbdSzEXugrCgPvJ4qBDvgdAC0jqpcJ7PNFWKQMXJ0ejtMKxS5pv/Fk6BdgVh7AQOTFctL1EO3J+a7yUqyn3DIkY3WU4qu0Fa3BjuNtwWfZBawTTVtoWI0BA567jUa0gIh7nAeREEoAy/LC3afdKObUUdd4kg1rKxOMkKeCwuu9ACa05TdRhC3qq6h5wvmefyRNT2QCfEhf010gdWaiu4TuTneVcT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db9c389-fbfd-4582-cbf8-08d835521cd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:03:26.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZ3V6nIl2kijcOJNGy0LXso2iOJ9azmDm/6EtbmEXf6XvR1KBWSpPV3pKh6h/h26
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: sroland@vmware.com, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 11:46 schrieb daniel@ffwll.ch:
> On Fri, Jul 31, 2020 at 02:05:05PM +1000, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 92de8a6d7647..1e8fda1c9b3a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -88,7 +88,7 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
>>   	drm_printf(p, "    size: %llu\n", man->size);
>>   	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
>>   	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
>> -	if (mem_type != TTM_PL_SYSTEM)
>> +	if (mem_type != TTM_PL_SYSTEM && man->func->debug)
>>   		(*man->func->debug)(man, p);
>>   }
> Bit a bikeshed, but what about exporting this function (maybe with the man
> as argument, not the bdev, mem_type pair) and using it in the first 2
> patches? Avoids surprises with optional func->debug.

+1 for that. That's no bikeshed at all but just clean design.

And we should rename all those backend related functions and move them 
into a separate [ch] file.

E.g. let's just have a backend resource object TTM works with.

Christian.

> -Daniel
>
>>   
>> -- 
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C8540e6d1e99547722b2c08d83536929d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637317855794189396&amp;sdata=GpkfEetygk53dJ1qWiF%2FucNVRc9%2FxWLzKc2BGuG9bLg%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
