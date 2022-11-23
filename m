Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4555635463
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBA310E520;
	Wed, 23 Nov 2022 09:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060BC10E520;
 Wed, 23 Nov 2022 09:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9Pqia4gohCWY42uH//2a1zz8NLY42BjDx2/HCdQXm5GNHJ9CCz4barXULK+yBbbm68XP5WPBoOOWj0uEoCoF+fxwmTlz4j1sGUtcaxq0qKomRnt+m61qRlazGer4i5D+1O7+AsVT+c6qIAhbHp5mpojzt5jTSdGkgy5kyLCC0rqko+mBVEh++TRugV4BkDoX9hTHOV5C1gD2IIgy9i6mk67VUtKjSxWq89ixYVUxiibSKkI4WQ8ldzZ3sD9qfiFjUb/fCZNPIoWeuD6itwEgljySsbXL5IzfxmOrTb37IKuVto1PluSATWs4quqLdoecbDyVkv+D7tpgnH14rnl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiIpqkoBIHW9U0YkLhhuENsDbAsUd4QW4welcq2ADWc=;
 b=bdE8libEJ0KAVVHb3UzDYEkEQWQrdnhQ7Emx0WlV7cmNzeXq2Nr7cjA43QnRJh7HX7tygcFN5o7+nK/e6taALVe6+C528TZFpj1yDjnWqUj33cuC6Kpj4jaPECPj6v8grLraALxhZQGxyn5eVD1Nv3rawO1wIX5htSFB+OzSxflfhwI3zvteN8ftu0WxzUkOS75JUrJ7TgVsGF55n1w6DgcuuYr5pUU6LRC3h/U2u3kxV0KCQf7q8iEGFTOWdiYIkip0Qkj8APpidXduT7BSrsZCMvZKPsK+feN5++7fNGpmGsdhwA3Sqia0naSS4Q0hvxpNQOohAp37Nch+qP/FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiIpqkoBIHW9U0YkLhhuENsDbAsUd4QW4welcq2ADWc=;
 b=0UCsCT8hoIo7KQz/ZtZHnHC4JmeFabHfpnuLCt44DVfo+3aJ5Oa1qkmt3rZ9NNABTOZwP8Zx8aLHcfufEYmPhOGjV/BTPcdKK3AOhVverMLa9ChVYWagvkFk0cux1xV0s2Oes1nkv7iOKd6HdYqN1oXi0DnLNqoa6TVOvk+dMUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 09:06:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:06:06 +0000
Message-ID: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
Date: Wed, 23 Nov 2022 10:06:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e586f35-34cc-4ae0-e1bb-08dacd31f46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sFe2JIgTa3ajRVCNX+L6tykFaKgpJLsmZGNc4FVn0n+2eMxz35FjoXzFxq1HpN2hRd5pjCkYQP1uTNKh+IRnHzGTirQTBL+lPdwT5PuA6dV1ICY/NfsSQsuiBDA5usv/2jaqixYTfxBdy14re1pPV/3LqiBFFAbVXO0FtT+noKnYMrQ7MT78c2XxWfosKoDputZqGnCrOVMMxZvVQqMYDX4boM8GQGmsVoIOWKtz4/iipUYJmfvn1DWOHixbFXT1EzBjA4k7FXbUBnIoai8H2xMcLA1bgahWqjkmggakiQtKJH/dpBSZPaLY451SmArgKJEi4Y500ZhYjVCq3QwgxDOEDQ2xdorJcmR0hcBI2I+fg+fHaAo015CZHcDPR96tGenqvtRwanTVxdM5yTLf/O5d3iy65Pc1Lv0WVqpBDmDiNoqfTq67HilysYNn0aBZerH5RAdEhk8KqyP1nMJfdXeA7XepwhOWDNkR1O75YS0qPnoWrd89uGLQ0FLFqjDoMQqI4c8kpshwRRFv43y+Pu37t6W02FIoqPtvcyE+yl/jWBwDK+CwO5nNd7bcDlxNCC2NW7jJWrCLCtBJV2xtvpqyaK882LUNkIjkcJ0/8Mlx9SPCzmWjZ8q5h8W5swG4B7AvcCWTbu820uNgdzt3x5NE7ua8FT35Jz1YWz2XRpv1BHFwIe1xkPoXgnd2NC5ajIlhjp7tgx9BOKQ60qC1qxVVQrrarJAJSDBkKHKis4/+3muPSzfhCssQSqG8iHgZPaikrHW38iiaqIcrGREM3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(31696002)(7416002)(5660300002)(6666004)(8936002)(83380400001)(6512007)(6506007)(966005)(478600001)(6486002)(4326008)(54906003)(36756003)(66946007)(66556008)(8676002)(110136005)(2616005)(66476007)(186003)(38100700002)(86362001)(316002)(41300700001)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWo4SURDTzJSSXNPaThUZ3RzenF5aUFwNDNjL0tmV1RibWVtSm5UWUVTallG?=
 =?utf-8?B?TlJFT2FlaTBSUFRNQmx3aHM2bk9ETjZOTUpvRUgwTHVZcEtoY1o1ZGZjZ1Bj?=
 =?utf-8?B?OTdWZUR0OHo1aTJEY3FadjN3TVUvblVUNFNKL1lkSmVlWWFRVjg1RlJnOFBn?=
 =?utf-8?B?Ukd1TXNBNHBVOGJvMDFIL3VYSkExUDBqZ3IwalJ6bFFwMW95S3o4dTZVVGVS?=
 =?utf-8?B?bXZzN2Nod3A0a1QyaWp2eUNua1RTWmhHbDVoZkNnL2R5RXFCTU1uMVFOWitM?=
 =?utf-8?B?VzBubVptTGNyZ2dHRDRlZHp6czJseXQ0VUdxUWZBc0luZGo0dGx3V2lNNklI?=
 =?utf-8?B?QTR3YVpzc2tHR2xsYStPUWVXL3J0Q0F5YTFRU1NEMmFiTFdoOG1WNjhNaVdp?=
 =?utf-8?B?MUg1cXJ6WWpUdkVBSjQyOVhDNm9SYWVFb0FhMjBaMmxlQjY0ZHBRSndCK2E4?=
 =?utf-8?B?Ui9sdGFsWTZSRUdwdXBGdE9icUdrTjltQUxjais0MFpqb0ZsRDVlaDFSeFZK?=
 =?utf-8?B?aFBXQ2JEaERoVHlWTnZUYzEvbXY5ajduRGVRbUhGcGZTRXJiSlkzZXg1NDB0?=
 =?utf-8?B?YjlGZFVyNncramk3eEhmRGVGNWh0anowWWZKcmg4SXVCeWNxQ2RFb21qeitP?=
 =?utf-8?B?QVRTSjRsanhISWd6ZTN4ZDRGdnphTU9ySDZUVlA2b1dKWExZSnd1dW5iK0pw?=
 =?utf-8?B?Nk5IRStWL29SNUxUS3FTQUVzZGtJV21BQ05WazlrYlRPYno3c3IrNWg5dGl6?=
 =?utf-8?B?a2NPSURWUXpUMU5vWGhSbU9ybUxKRVFvYWpJZHJSUnFjNXE1alAzZVE0NlFm?=
 =?utf-8?B?Rm9RRzdiMERtQXlHOHpFelpCN3MxajkvdWZvOEtJdEwxY2gzQ3A3WnpBbzJS?=
 =?utf-8?B?bmtoMU5nQnpVSko0SlJSREhLa3daMStNNFJvYWkraGNMT1RDTTRERW9xbjNs?=
 =?utf-8?B?RmxMNHE2akNaMkJmK0FxdkR3S1ExZTNFUDB4TEVKM1FJOFhFZVBqNUp6a1Zk?=
 =?utf-8?B?bzhuWTc5TGxHUDRqVVY4WURkcDY3ckp3eDI2OVpRNlhiVGwzanFlTWk4d0ta?=
 =?utf-8?B?MHA3V3c5UkpiTEtRVXN1bFhFanVEVWtEZytpeWpEdk9DRHBRdlpDaFZoSVM5?=
 =?utf-8?B?SDgxTXZPNDlXUGxlNUhkSmhSM29SbFB3QVNKemNzTk1keXBxdENXV05aNkJN?=
 =?utf-8?B?aHBrbFMySW9yNE0zUVovVitIK0tmK0pXS210SlJxemxLalc3ZmhKME1QNmd0?=
 =?utf-8?B?WFloQTRGdTgvSXJrSlIyc1pURWFWUml5b05hZzZkNklqNXZjclF0ZlNpMmkw?=
 =?utf-8?B?NHBJR0lwNXBoQnB4QkhETUdTbWNBTjB2WTBHOXNPV081YXU2TE92QUJrYTNz?=
 =?utf-8?B?N01DQXRtaDFHd1pSb3JvTlJQWXNJR2ZXbWNhOGkybjJqaFgxQ201MXF1SkFi?=
 =?utf-8?B?N1Q5Y3JBazIzRlBNUUlGcWUzbURDWG9BbTFUdUFQcHBjS2dYRlJJU1BNcW1N?=
 =?utf-8?B?YXFVTVhsRS94UjU0R1kwaGRZdXZCakJ6ZzNPOEVrV2ZXTHRXVjNGYXlDVVdn?=
 =?utf-8?B?bnJ4S0RDb3NrMmljQ0xIcFI4ejRVM0wrNVBiZzZzS1A3bHVhdTM3bnJmbXJD?=
 =?utf-8?B?dExrb0hvdlBQamg1T1FkNzNtZDdrem5OSGpZNWZENytDdUtjS0FIRm5kV0or?=
 =?utf-8?B?eXMySGw3WHgxYVpvV210cmZaOVNCNXNvd3ZKdGJGWWUxNHZtcUp5aFJRQSti?=
 =?utf-8?B?OXpLcmRibDR1RCtHMG90OXlSZEtUZktWOUxUOVJrNmNWTit5dGVrcU5OamJk?=
 =?utf-8?B?RHM2eEU0RTNnWnVwTmV6eHN4MGo0WmJvQzBUUzNjelI3RjRWUmFHV1FTTXp6?=
 =?utf-8?B?R2V6a2pHcEtpTnZqTDEyTjdhdHA2czRWZW9qa29oNDhVVEs1Z2w5L2Z6L0JX?=
 =?utf-8?B?bng2VnY1MDdQWEhrUUdRNTdMbURTZXNkYjU4N2twSEEydlc4aDRLVU0vQ1E1?=
 =?utf-8?B?RWhrQk9PZVp1L0JtMHVFMk9KWnQvWWRHYkZmTGE0WTNVODFJcVcxOEZsS3NS?=
 =?utf-8?B?UVNKbnBYcHI5VEp5UWhnWUdrdTFuVVFTNEtpYmlBTGNHc1V5NHMzanNhNGpQ?=
 =?utf-8?B?MjNOL0JLY21ySWd1MnJTUnI3VVIxSlBDeGxwVHprWUVpZzNDQkNRUDlyNnJG?=
 =?utf-8?Q?plcoQ7f1+izleEHWG4AVFbXBg2CQ3U/4rZMBTHQuYJzl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e586f35-34cc-4ae0-e1bb-08dacd31f46a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:06:06.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdj/gSweRQ1u7YOt2+ArEn0Y6CKcsr5MuqoghqhztFDrT1ZPAWsekucwt3+sID4C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.11.22 um 20:50 schrieb Daniel Vetter:
> On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
>>> You nuke all the ptes. Drivers that move have slightly more than a
>>> bare struct file, they also have a struct address_space so that
>>> invalidate_mapping_range() works.
>> Okay, this is one of the ways that this can be made to work correctly,
>> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
>> was the DAX mistake)
> Hence this patch, to enforce that no dma-buf exporter gets this wrong.
> Which some did, and then blamed bug reporters for the resulting splats
> :-) One of the things we've reverted was the ttm huge pte support,
> since that doesn't have the pmd_special flag (yet) and so would let
> gup_fast through.

The problem is not only gup, a lot of people seem to assume that when 
you are able to grab a reference to a page that the ptes pointing to 
that page can't change any more. And that's obviously incorrect.

I witnessed tons of discussions about that already. Some customers even 
modified our code assuming that and then wondered why the heck they ran 
into data corruption.

It's gotten so bad that I've even proposed intentionally mangling the 
page reference count on TTM allocated pages: 
https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.135689-1-christian.koenig@amd.com/

I think it would be better that instead of having special flags in the 
ptes and vmas that you can't follow them to a page structure we would 
add something to the page indicating that you can't grab a reference to 
it. But this might break some use cases as well.

Regards,
Christian.

> -Daniel

