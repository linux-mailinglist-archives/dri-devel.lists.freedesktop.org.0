Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542427A7E2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 08:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8886E0FE;
	Mon, 28 Sep 2020 06:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEB689F99;
 Mon, 28 Sep 2020 06:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7bGtQE0xggG4ZIgApP3dyrBzhhxnFcCie64/3YEQa8zpa/HfdH73fWmtR/nHqKBiCllf/NxFjkkpB2M7bO7pDTXRY8FTrpH9JcjesDDC3cf2Dvrvqg8BIICITlPM7rBSP5GLg/O0jLI9pO40AVQfvNncgPhkrYFjGwufzuaj0MZadgMAkJs+J4FSFfHO9BF2bBEDlWqadzxooCTNU4VQKkLGI59fcmzklROomXtDshZqi7PrHbcKSWcTBk4KHiU6AHbMIrPwEwwB23Y0rSi90B+9fYPmvL/+DO4711DeqYBJpn/merH4Cpinf+O6lpRFV60/r0EW7KttG7xG3rUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftfPyK2QiwP8U4uWpbXw7JZVcVkZ4Ljqk4X0LAeVhGo=;
 b=OfBZ7L4a8z0pQNq6o655uf4rpWuVfFLfIsLjz/7L3+P7RhCbtASa92Ws5IBXA4lV2L7dJBYdN23kYUeLvCf6+gRM59jjjwZp+3uoQu/2uj51wcpAgto61M5WtQ1/Z5wsschWyEn57iCYJhxRauLgquYlpvkFiVoXN5d1cMCN2ruyhiboSlZC/vVxGcnpJW83hpT0XkJ3Z9ZTyAnxDSxkbVd3otw+FiCcpXXI97Fdv58nxovDXt2PMd1j9vJ63270cVJ+oTSYGU/DW5Z2/CM+fuMwCnPq1/5g1YS1YJR77tG2wcDgpSmbP8RpkNcgNAGBF2zbFJ7HrRKqMfOnHIcMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftfPyK2QiwP8U4uWpbXw7JZVcVkZ4Ljqk4X0LAeVhGo=;
 b=ikKREIXvqqSX3oKki54axktxBO7Le+SQW45Js0+JPkvJXoe+W7vq533nyKU+UhA+KmRPBbtGZZfkmnLO/L+f9UAHFl5T246siAigWSWV7EhWvQy4bvQCFPCPKdWoRigmt0SzFoZr+m2czMlS5ln2KKmzRrJqOx4uASZayf6dWg8=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 06:50:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 06:50:39 +0000
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
Date: Mon, 28 Sep 2020 08:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200927191605.GA237178@ravnborg.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0092.eurprd05.prod.outlook.com
 (2603:10a6:207:1::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0092.eurprd05.prod.outlook.com (2603:10a6:207:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Mon, 28 Sep 2020 06:50:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90e8fe3c-2fb9-4d9f-d4c7-08d8637acf4c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3901950ECAD626023E8C289383350@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrC3AG0vjlaa7toKvgRe22NR3IxPxIDIX6Myv8OPC8YkVjH28mB4zlzVG90g1gcA8GchPvFDKFTcXVyrVd1y7ygiNKeqbBoDX+42uAyXis1O0RdSdQBmwERqoOfyEcI4XCJCdbcSRyVsTGZGNBSg18cZFmnj/xe24mTFi9nqsZ1jzcNvJ/ZLfLrmmPdBeSpv+cGow4rhzR1l0mqSnPe+Z/ZVmDBFQed/a/A8zzI522JNY5/T1EN+b/8iBtnkhGu2Wo02A8y4+qgkarnCXzv0N4Z++WuBMZCQqseYhnPxWo1P/5Z+sTb0hwqyd6hmYGLVC5B0f1UhYuC8RcVkqw/YfKvvaOuN2vX641Hja+OlDjr94FdT9MNmseJTJSdo+EgHKY1yozVs0/l2DOcKnqFwBPM3U2GD+RrQ9x8YMkFfrFbmd/KLpoRZj+2vbF97ca5z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(7416002)(52116002)(66946007)(83380400001)(5660300002)(31686004)(36756003)(6666004)(110136005)(4326008)(8676002)(31696002)(316002)(16526019)(186003)(6486002)(86362001)(8936002)(2616005)(478600001)(2906002)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: O+Y0FV2AonwhTb2FTg/L59LjSgF2tLHHcc/FRi4nBCkplmvOrxkjeJo6PE0Zp8m4ylS6hqa5PBYCtZRPakqbvJ4EdircPrWPSiibUcXhrt5rlGg/TBM6c66BoIoPtB8qAKwNL+/pL+HbCCDx+/oQHIsIu0J85RWwFYCeJwAGuVtPT5mTbTk3G1HQJkzcDiaQs83Ohtdp9TEh9hif9b0pJshBDDU1YM+FX6rZv4F6IMktrXhLbQqEmL9me2RZnhIhYxJT7ii4KGrwn7vBEDvDvcEte6TlD7ayznlqJNpSyhLx5bI/rD2JJpiQPq8/o4Bf+rYo/sq1eXWDlU58K0o4nvHxMPffN2JOvSIPKJPhViH8pzdS3vpw/ptCF8b0HewAq+7+L9g8GZFjDxMnXwIto5xLGTxNEw5sl1ViBytitBJJ6+UwktYsuLZ0CIHyF8uN4+L5oP3l4RG5O3POZeeUaIcmJUJ88k9PdVg60kRWykIYf9Sd+rkd5UhSmrtQrl/94lYWgjJUtl232jCT/gc3uP/C8Oo/lMN7cfPxS1XlhI3wH4FY+77WUzO96xrK4jJUtr0hOZMarxBWimL1OPelUPICAppDRYkyxGNjiIqLRIlh/AonVnOul32vmxca5jnbQNyZ2QEhsM7Ro+FHgp1esJqqq2Usoyub3yauxEIUu1pM8vUKaziHRzoD4ZFhtkmEHEWzr7+U4OOds5fV6gHCLQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e8fe3c-2fb9-4d9f-d4c7-08d8637acf4c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 06:50:39.1731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3qVd9zs4iWZBIJuqWgUjOy8glCnqbsoepUdvVX8yNOisW56sMX29eqC6rHlmxHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 afd@ti.com, m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
> Hi Thomas.
>
>>> struct simap {
>>>         union {
>>>                 void __iomem *vaddr_iomem;
>>>                 void *vaddr;
>>>         };
>>>         bool is_iomem;
>>> };
>>>
>>> Where simap is a shorthand for system_iomem_map
>>> And it could al be stuffed into a include/linux/simap.h file.
>>>
>>> Not totally sold on the simap name - but wanted to come up with
>>> something.
>> Yes. Others, myself included, have suggested to use a name that does not
>> imply a connection to the dma-buf framework, but no one has come up with
>>   a good name.
>>
>> I strongly dislike simap, as it's entirely non-obvious what it does.
>> dma-buf-map is not actually wrong. The structures represents the mapping
>> of a dma-able buffer in most cases.
>>
>>> With this approach users do not have to pull in dma-buf to use it and
>>> users will not confuse that this is only for dma-buf usage.
>> There's no need to enable dma-buf. It's all in the header file without
>> dependencies on dma-buf. It's really just the name.
>>
>> But there's something else to take into account. The whole issue here is
>> that the buffer is disconnected from its originating driver, so we don't
>> know which kind of memory ops we have to use. Thinking about it, I
>> realized that no one else seemed to have this problem until now.
>> Otherwise there would be a solution already. So maybe the dma-buf
>> framework *is* the native use case for this data structure.
> We have at least:
> linux/fb.h:
> 	union {
> 		char __iomem *screen_base;      /* Virtual address */
> 		char *screen_buffer;
> 	};
>
> Which solve more or less the same problem.

I also already noted that in TTM we have exactly the same problem and a 
whole bunch of helpers to allow operations on those pointers.

Christian.

>
>   
>> Anyway, if a better name than dma-buf-map comes in, I'm willing to
>> rename the thing. Otherwise I intend to merge the patchset by the end of
>> the week.
> Well, the main thing is that I think this shoud be moved away from
> dma-buf. But if indeed dma-buf is the only relevant user in drm then
> I am totally fine with the current naming.
>
> One alternative named that popped up in my head: struct sys_io_map {}
> But again, if this is kept in dma-buf then I am fine with the current
> naming.
>
> In other words, if you continue to think this is mostly a dma-buf
> thing all three patches are:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> 	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
