Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA53F750C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 14:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E7E6E1F3;
	Wed, 25 Aug 2021 12:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25146E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsNxQvs4vWVViyRXuBtD56MZ2842yMG6CamYtqxFjOUeOQ8NQ2Iw9JfXe3SPzdqPE4WKB+SwUzwy4QHZ0PXpmlxhm7YHrCTtHrNGaU8mXFoFbVf34zcU332xOrDsWnnljEf0FGexE6V/cLZe2jUO6RBp/fnNs6VPkEoHuYmWZKsCAaW4/IF3jBJIqCzw1/IYkHfA0CApuJgLuCPi3JmorKWFKovp1fyCbYaiHh/WUTwQx2eAaC2FOcGupUjLb9x2feX28i126uIXTu0sc5krWMFkwIdYQ1VWNp/LerXyyE4LJF8JMfl6OAzyd1XCgzzDMD6cXQesmdfiaaxF3TiTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgRO9i/ALC2C2j/Qj8/vul0OSrlTrEz5AmOpqQNR+oQ=;
 b=XqRdfwwX/MbEhaTUYXRU0AaPFbfBkVT7oDry9gPs2u62joYW0ThJgWPxJHjpVjw6qQujS9Yxi9Ll3JzuOx1YBtGuS9XvkXwTIegt39AkprZ+j9gzYIh+TwG0211S0NQKfJRk8UXVCVGOn4zPSZ8IuqipYGqJliM7NWLWlHExO4j3UTCtyJSrtlhO87W8J4oBAIB33nF/wVtouOwEaq04/dU5OfjXcpkPLDK7K3S4VZPJxu2m+Zldrte+zbVWSX2/AmVPbDfIzi7Uggg5FKDhhMnyGGibHWe16RwHRGS4JKmh7RBrxtGaBEVs0oVMq/38z/GINW7i2JnRYcJCxWEVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgRO9i/ALC2C2j/Qj8/vul0OSrlTrEz5AmOpqQNR+oQ=;
 b=PbKuEwZk1FDh7c1Y/AvDDUBLVrvjjYJY1OcyLSroc80TDZf4raY43AY2wih60YonIcT0UWE6ZAd/hMLiSPehKwTusiCzDg+1lzXKfO9kMIwXmWDztO/FHui627j5eSEdL0XLpYyTEYR7LRF1NmFrcocV7uvhNKO7OXEGGvIKbUo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4816.namprd12.prod.outlook.com (2603:10b6:208:1b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 12:27:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 12:27:17 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
Date: Wed, 25 Aug 2021 14:27:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825121832.GA1162709@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 PR3P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 12:27:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb788e1-305d-44f1-e6d1-08d967c3ad0c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4816:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4816582AA059E214BB73C5C583C69@MN2PR12MB4816.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WsVArLsZv8cBNzPxXo4Bq6tUJ+6SB+YHR6AkI2Jt4G0yHZM6YiHvAo1kswSgAVEjt0PrUHPwXDzRiuwDSfIMpBuDuLWMc+C2YKwFU6EnndCzN2OAvAxy6zR867TEmdaVBO3Xvx+Wzt/rDrhC8j3ETb5ATjDXy/Ks0U8W+pv41V4K6Pe+rX2Anlps1tnxGTDpu1ajHcriKobyTAyp/XncYIqaJ5MKzz7Lp4+shP5R/Ne9GgWsKvTLLyMXB7OTdufGO8Zf5M4rVtjWyRwO2JMl2VMzLcBmpbhAKQ6RFCR5PQgpAEmNKwxoIC3thjK9ElEUa5l34WAx6UkEg36lyKIXBTT/UMYCfeQrrrUMc6QFGJjaIiGV/fxQ294IsVSlLELNgZ+cTyOHUXN2gHHsfe5AQl8vSCBPGziD6iFXDTXb4hPFXnzApmHapHyo8rTfAVhKJY6JHLtJIdGlr1mycpRouWo1DkXXQpdKOC6Q9iv72UTqWDmH6t0FgW5VEDXaEQy4qM2MIWzJN9cbsi/ODn3u7aQs8kZucQkluWERpCUqHzq2FAKZDORChRbFHeEzC0W40yfE3alH35TCjtWPi7IhSYzDSZGP3ufYBnUcdEUnZuqwHSFN9gxE2As6fNgdytu6snWTDzEn47PSUobBW87HgNgiuSADe0bPrVgk+kQuiRPpz42ZVDsi28bguYx50YywNnf3pjb/KZsFHjYZzUizgUis6JfXC2Prw+1Me4HVSho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(186003)(86362001)(478600001)(8936002)(36756003)(6916009)(4326008)(6666004)(26005)(6486002)(38100700002)(54906003)(31696002)(66556008)(5660300002)(2906002)(66476007)(316002)(2616005)(956004)(8676002)(16576012)(7416002)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVQY3VSRFIySytvazl5ZUJ6ek15NE5qRmFKZi9TaGNrSHgwWnQ3ZnlldUNx?=
 =?utf-8?B?TCtOSks3eCtlVEoydXNOOVp5TmdJeVdhcVJocWEzOFNQdkhmUDc3R2d0cFox?=
 =?utf-8?B?Z1psTElRZmRNYklwZG0va0hRYXdLUmVERlU2SmwyU2dZVjJsNCtMVU5kQ3Mz?=
 =?utf-8?B?RW9PTld2K0VPblVkMjJMNnh5ZEhyRWJxYVNTY0pYUXRyelVNQUsyVzNiV0Jj?=
 =?utf-8?B?a2VYT2JOK21kaVNZTXBjUlR4SUJuTm9TWTdrMWRTUnVBMGh0K2VFWit0U0lm?=
 =?utf-8?B?NWlRc3ZRbXErNlEzRWRtRGp2bEYxUStuN1BFaGFSQ0xTVDlOZ2htSytpWU13?=
 =?utf-8?B?NzM5SXBZNE00YnVqRjlKQkFtVVg4RGh6NEY5VkRUM0lRZWRnYnpDYVdIellV?=
 =?utf-8?B?K1lKT0lYand1cHZnNE45YkRhZmc3c0RYK0xYaWMwWi9mVXFKeU9HTHFTRmQ0?=
 =?utf-8?B?TlByaXArWEtITExrNkYyeVkvemhSWnFBMEJPbXlWTHlaendNQVluNkpqM1ZH?=
 =?utf-8?B?YUk2bzRyZmZnaG5nN28xcTJQS2E3NXU4THN4bjJnV1NRU3lsZGR0SFRydHlj?=
 =?utf-8?B?akMzSXpIVk91N0pydkw1V1Rka3BwSjdDT2JaSXNaaVBQK3RkVWFxUFZHdU4y?=
 =?utf-8?B?WVBUMWZ4NlZmVWk5Z1d1QktoT01HQkRCQlg4Ty9VMHV0bjVORGZTalVrZVVM?=
 =?utf-8?B?M0xibkFCNllxbUU1d1BsNG1YSm9zbUxLUFBBL2dVSzRDZDJ0K0xoQUgzT3Qz?=
 =?utf-8?B?Y2hlWEpEK2hveEgzcWhjeFpqWTl6dkNJRUR5TW9iQVJhWWc1djVOOTdkaVQr?=
 =?utf-8?B?Q3pVQURaeFBCQzM1bnRLOXdyK09Id29KOXJHaDFWRjF6OWlqNkViTytpNHJa?=
 =?utf-8?B?MzdyQ2oybjlsMzBWbGVWRHdiQVhzZjZGNUhpVUpqTmxkTDlHUGkvUTlRUEd6?=
 =?utf-8?B?elFRNmNKNHhzREVRQVJ2UmVoU240ZDE0QkhlbWtHV1BmekNlNnVURE1LS1Vn?=
 =?utf-8?B?bElvNG41b1JlZ2lZdzVJNHBZdFpObGE3d0NJU2FwT2ptZWpyZzJtY0Y2dXZD?=
 =?utf-8?B?ai8rUFQ3c0RpYTRBYW5CY29GbXZZVmh2R0djWG85NjEzRnBsRWVVM2NKVENB?=
 =?utf-8?B?ejl6dXhGUlR2eHdXK095MmNCdzJtTUFNRTNWZTI2MFVuNnkvYmdSQ0YzaldB?=
 =?utf-8?B?Z2tqdTBBQ25TK1puS3VJYUV3Qk9JVkh1NEVZZGt2NmZUSnZ6UEJESnZwcEVn?=
 =?utf-8?B?U3NObmpsd0ZqaXprc0hQT2NERG40T1F1ODFsUVc3SG5IVHhwblRpN2FWczZq?=
 =?utf-8?B?TXZGZXJMK0t3NG1ralZ2WFhwalJ1VnUvdEdMYXVCK2RJUm5xd3FSL2d3U091?=
 =?utf-8?B?UDNQamFRN2UrQVVtZ2VsTmdqbzY4RGFQdndTTFE1Z1czbDBGcVcvdzZ5S0Vk?=
 =?utf-8?B?dTF2VlFXbzNGbU5jQVpBTytFT2d3bEU2MXJBWVRMaGZEUnhoU2VYTnVraThJ?=
 =?utf-8?B?RDlQWFpLMTlFT1ZNaGMvQ05EK0F2ZEcxTktxbjVrY2VDY1hRdzhxUFR2ajNu?=
 =?utf-8?B?YzRPREp2eHUxbkxKNnVGbVhpVkZtVnR3VXlFdUNoam9CU3dLTW5lTk04SGtW?=
 =?utf-8?B?OG5hdXVaOUVaQ3diQzZ4YzRmbllNKzRveVk0WC93Q3VxYmpZeGIrUzRCWUhw?=
 =?utf-8?B?NElsdmxzclZOOGpDUmM4UEtXc3VvL3VpSlJ4L1FNRG16UHIrL2hUOGFaQTdK?=
 =?utf-8?Q?r79+y5cfog4atjoG2m7e5M5c/o6dH13ZLqCz1Kn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb788e1-305d-44f1-e6d1-08d967c3ad0c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:27:17.1272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4fPGBElh8QcG/B/5uWmnlBE3vb7E9e5+SUoYof2QynmEptJbt8/IcZFL3YJUQK8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4816
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

Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
> On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:
>
>> The only real option where you could do P2P with buffer pinning are those
>> compute boards where we know that everything is always accessible to
>> everybody and we will never need to migrate anything. But even then you want
>> some mechanism like cgroups to take care of limiting this. Otherwise any
>> runaway process can bring down your whole system.
>   
> Why? It is not the pin that is the problem, it was allocating GPU
> dedicated memory in the first place. pinning it just changes the
> sequence to free it. No different than CPU memory.

Pinning makes the memory un-evictable.

In other words as long as we don't pin anything we can support as many 
processes as we want until we run out of swap space. Swapping sucks 
badly because your applications become pretty much unuseable, but you 
can easily recover from it by killing some process.

With pinning on the other hand somebody sooner or later receives an 
-ENOMEM or -ENOSPC and there is no guarantee that this goes to the right 
process.

>> Key question at least for me as GPU maintainer is if we are going to see
>> modern compute boards together with old non-ODP setups.
> You should stop thinking about it as 'old non-ODP setups'.  ODP is
> very much a special case that allows a narrow set of functionality to
> work in a narrow situation. It has a high performance penalty and
> narrow HW support.
>
> So yes, compute boards are routinely used in scenarios where ODP is
> not available, today and for the foreseeable future.

Yeah, that's the stuff I'm not sure about.

Christian.

>
> Jason

