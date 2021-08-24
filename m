Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C763F66DF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719216E08E;
	Tue, 24 Aug 2021 17:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519C6E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeulxjUFDDPRebaBoouBDnV03m5tDsOQSi8hK8pUQ1FfnnLXMiltsmi34Qax5h26u1RCAY9u0aFgh8w6eCNC1rgWqDvUsWO9a4RH0b/o+PsWk/stejY5NdPtFFsgwm/1VE7wMm1CN8qzWj9rSH9igbgN+iz1VD3fK7p0J2JUiSDH0uLkdu53FynUpWlP/lxIb5ndBzGkQyW5MXzfoUOdx7Uo8+FL8wak0RwvsuOA28sYQsgTBi/tbJp5xJmSs4fI5867zfd4DU3GXjf4V3Sa/GGTt+uYP49a783Xg5zE03Q4SJeI7cZoEsZKeNLI/STCtfRT06lEbw6z1Yv7GeVprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMg+xlDRRaGUzbtMimSJUGsRul99+AZJxhTxEAorL5w=;
 b=NItPCw72wiGZH8rfIKTigv1XmIe8im+3eGC3OZs2LBG4ZHVUQ/rtZqU2NuiQf5ReCu7ITvWViMmKKV7nx1lRGbXRjw9AegIPkR2ode/ogr5rStdR26F/ZAd8ISsAftXBRp0MnVvJLch8uM1Q0jd4TL/x61EX6Cj1KSEaBov44K8yotMSjEYSLmBU7VsSrDlkW1dCWT/vsZkKPSylM9VqERSckom1NuJg5IQGVqW1JvU+YQhNH+nNUIEQyr2dEqKsZciUsahbBkeIfDSm+uNnqux88iOI8aczYwZIRp8oxIURRxbalu1QekcRmiYUKIcylr0ZfU9f+HM0kCesl0OP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMg+xlDRRaGUzbtMimSJUGsRul99+AZJxhTxEAorL5w=;
 b=gt/e9CUFOxYCIXNJcHXPLCDZD+5IogsmxILiwzKlAil7fZjrV/+nP0dSeOHXIVKF3VfD4JienuHTcZAAD72XLuPvMwqIW/8VCe+d1DmI3N3+Se8/pGXrp6hYAnJFU2qUAwK4CUff1HYlO14GwpnzNrhY2tlzpcLBz+ilSA1iWTxiCDz3Pu17Jz3yz6XCOAxEGyxmv8FEdoZrJelrj3s7k7KXV9nmSd0wIUIpVme+PEg/BVsgg/XeE8fmL4UnK6oFbw0wNC2UCqBV/EJUnRKHbPt9qToke+3cPoIvJ2MpfAWVmPFp3b++24fptSNyxTL8NN983x8gsWIJX5074NGJ6w==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by BY5PR12MB4129.namprd12.prod.outlook.com (2603:10b6:a03:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Tue, 24 Aug
 2021 17:27:25 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::c557:5e37:2390:beb8%7]) with mapi id 15.20.4436.019; Tue, 24 Aug 2021
 17:27:25 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
 <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
Date: Tue, 24 Aug 2021 10:27:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.54.195] (216.228.112.22) by
 SJ0PR13CA0132.namprd13.prod.outlook.com (2603:10b6:a03:2c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.8 via Frontend
 Transport; Tue, 24 Aug 2021 17:27:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeab5e7b-7ae2-403c-ede0-08d967247086
X-MS-TrafficTypeDiagnostic: BY5PR12MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4129B6C3D1F03CB7CFB3B168A8C59@BY5PR12MB4129.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjVTIuNRBqAEZptFCqfkZYtefeGDL5iEJNC/FMxYet+0soi9ncwiu8B5lWP0LTI3ZCWqXuss+r3tFrsfliKQ6WVZ1BiCNzBzjMrYZ6gZ1FFg/oCRHMgIuS8eAkCP0TSgNXgA+3MogDHRftoBQ6B3tvI0NFF3/JFSei9r+j/qExJ7uLwb1ETzqaqHbh8dcUdT+6Ri8RYhFF9owd8u4b8JAau5pWvwW05UWLzMbBj7Clm8EZ/IpgVgMpSRoOUnWMzvCbm/iw9EzKIyZFd4d9pbkmAH+Vb9B8GYudScWTcqaTq4sx3uhTStFZxd/0fnyeJRE0q7Z3HFtEFeg8d3ZuiDVwGFBfxr5M50djuQu9D3S8+JtLpflVjp51EiPdM3wU/PftgZu1DOknj7aUgnqOyJZfE9iHnShb4ETs5sIK3ZtnAA1fOC4Tf2QKzPR2QYOmg7ekzfCOaFw/kZdXZUORO9kTQS+B5f/KHjV1+HHojGDLv3nKNftTAERvFScO0XGER7SHBHng6pZt2fkePk7GkZU3Oqpbe9gpeZat8ZijuGQgOu3Qw7VguWStx/U55MKeMZFHsVLCneOZRfzQ+7OwhUR2RSrWhRx+PVloiLeScAfYT8X1+EbZYzFdunSKDkfXjT9LjfD8XiRflC82aPBIWhs6rZ0Jnzdy0h+a/EM6oLoM7z3hkghky0aH1uSqbflcCcQO2PTd8An0a+RCM8nwzlQaoywZIaqrNpSihbjwtBilA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(110136005)(2906002)(66476007)(956004)(7416002)(8936002)(316002)(2616005)(4326008)(83380400001)(8676002)(26005)(5660300002)(6486002)(66556008)(66946007)(478600001)(31696002)(36756003)(31686004)(86362001)(38100700002)(53546011)(16576012)(186003)(66574015)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hJMVZsbGtnZGhmM2xUMkRYTjd1OVd3NW9xZXFwTFJtSjJXR3NaSUY0K0JX?=
 =?utf-8?B?cm5pM2VjblBVVzdUajk0Z2JqbXh6TWNLVlZpQXUvSWFHN3NNZHh5ZkdPMWJQ?=
 =?utf-8?B?SU53TUVEQkhEcytyYzJQQ2JheEc5M0NINjVJaDg4cHgxL3pyc2RkbjQyYXBh?=
 =?utf-8?B?a3d4MkNlaDZWSDdMWWVPT3h4ZUI4MDkrcUthRHB1aFAzU2JCVVVxUHZpY0NV?=
 =?utf-8?B?VzFEN2hnaks2TngzOU53ZnFOejJMTHdCdWFKclR6TkFVZ0lpL2E2dnI2Mm9S?=
 =?utf-8?B?TTZLbzF3SzBuenBRWSs5ODR0c2o4dlNNN3JRMTFuMDRvZ3RERjd5NEVMR0pR?=
 =?utf-8?B?UjcwNzZsMmhpeE95ZkxVRXhUNWRvWkpwTjFkeWwwUkVEbzBOb1VmSkVlTmVy?=
 =?utf-8?B?L0N2Ri8xenZHS0xZS2cyQlBiZU5pQlA5b2FVZzZTQTZEM0pGbDhOSisrS1dJ?=
 =?utf-8?B?ZnozbXRnNkUvajZ1RlZ1MWhjMmY0N3h1eVB3SWNNTjQzRjNpK0xYTytGMEFa?=
 =?utf-8?B?d2tsZmcwazYxdm9kSGlTUEFlQkRrb3h6U3hHbVVEUEZpcHpsMHhZZnVuMW5n?=
 =?utf-8?B?dXdGWnFXWXRQbEx2aUo2bmp1THF2SGZVeHRTSEErVnhaV0VvTitRL3N0cFkx?=
 =?utf-8?B?Tmw5WEpVRUxqZFZFbUFtRExyRFhNWEUwTitvMEV2TXNoV29oSlBMU2JScmFS?=
 =?utf-8?B?TXNaYnY2NHdUc1MxNjBzVjl5Q3dUUHdqYTVJYXpHdmlEOGdwOUl3dUJKWXJw?=
 =?utf-8?B?bERFdHp1SmcvbVVtMWo2WU1zckZnK0g1UVRQQm9kVjVOTEEzWHd1NWFtZDQ1?=
 =?utf-8?B?V2U0Z0tFRlBkRE5PYkJveGlTSmRWV3p1OS9BR2NxeHdkcXNmbzNwWHI0MmFC?=
 =?utf-8?B?ZFUvZldmdGU4VVJHSllVM1NmbDRGQkwzM3ZESEk5VDRYU0RMUXozQ010Q0pp?=
 =?utf-8?B?aHlUV1BIUzRUTDdIYy85Vjg1QjJocnVFaVNZYnJRUFQ4RXJHVzhzWUl6MUFO?=
 =?utf-8?B?ZWpWQ1doOC82RVpuVktXM0ZGaEJZZTBFcDFDT2YwUEFSYXNkb1Y0RU5NM3k2?=
 =?utf-8?B?ZHR4Z3ZLTnZYL0owNjh3OUpvVE5kcm1wbGdLT1BuSlVaMjlHMnhLa1BLZ3du?=
 =?utf-8?B?NzdqRnFmUGxVWVhSbW1oditTQm9TdE1ONFNDQjZvTXIrZ2g4YXBIREVvT1Zh?=
 =?utf-8?B?dnBxR0lvTlFGQXBrbHJjdzhFUE5OT0NNVXlUZXdpWjdmYnUyUytUOStUc0E4?=
 =?utf-8?B?WFZQak5CUi9jc0RqUmtHUmlSa3NqdVd2RWRwbmhScy85d3lMRzR5K29pdEdD?=
 =?utf-8?B?MEJWYVljQ3JjT2IrbnhVengxRlVxRm9aUnBGMDNSaDdVbHZqWGo3VExEUGFS?=
 =?utf-8?B?emMxMGtZbUNtTUw2NFBkWWVMUmJCK2RLRjFNYTNRSjZoRTlJNlNNd204Z1Fr?=
 =?utf-8?B?UWs2Q1Y0RG9LQ280elVtdC9WT1MwbUZyMVQ4QmhFcXBuZGlSbTdZOU1wWHlp?=
 =?utf-8?B?STNxaE5idlkyVTBublROeDQrbXZ5N2xGb2R1NGJxaUFmNnRodlM0ZWxLVWRz?=
 =?utf-8?B?UmJ4WU5zQkc3RTNLYjZLblJWWVdaQVBnbGJVTDFabkJjSHhJYkcyZWNlbmFQ?=
 =?utf-8?B?MHZHaGI1U2FUcHkyVU1kbzdvNmUzZUw5UGdvd2Q0cXowQVc1cWt5a3JlWGxK?=
 =?utf-8?B?cnhEYnovaFhGK1NkSjhBUk05eFpyY3ZpenBNd2RyNndCRUNGcjBUblI5Zy9J?=
 =?utf-8?Q?8bJe0aYPYlYLQbveB5IJMelTClCgmZPHAkSlUAd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeab5e7b-7ae2-403c-ede0-08d967247086
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 17:27:25.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Dj3t169YjzkoKXM3LHwwoLn1hZJJD9BWFrRpWMXob/44MGgEA3MCXVUhTHBqqbQcbmmeHaMAvvBHjQpuD1Qgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4129
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

On 8/24/21 2:32 AM, Christian König wrote:
> Am 24.08.21 um 11:06 schrieb Gal Pressman:
>> On 23/08/2021 13:43, Christian König wrote:
>>> Am 21.08.21 um 11:16 schrieb Gal Pressman:
>>>> On 20/08/2021 17:32, Jason Gunthorpe wrote:
>>>>> On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
...
>>>> IIUC, we're talking about three different exporter "types":
>>>> - Dynamic with move_notify (requires ODP)
>>>> - Dynamic with revoke_notify
>>>> - Static
>>>>
>>>> Which changes do we need to make the third one work?
>>> Basically none at all in the framework.
>>>
>>> You just need to properly use the dma_buf_pin() function when you start using a
>>> buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
>>> after you are done with the DMA-buf.
>> I replied to your previous mail, but I'll ask again.
>> Doesn't the pin operation migrate the memory to host memory?
> 
> Sorry missed your previous reply.
> 
> And yes at least for the amdgpu driver we migrate the memory to host memory as soon as it is pinned 
> and I would expect that other GPU drivers do something similar.

Well...for many topologies, migrating to host memory will result in a
dramatically slower p2p setup. For that reason, some GPU drivers may
want to allow pinning of video memory in some situations.

Ideally, you've got modern ODP devices and you don't even need to pin.
But if not, and you still hope to do high performance p2p between a GPU
and a non-ODP Infiniband device, then you would need to leave the pinned
memory in vidmem.

So I think we don't want to rule out that behavior, right? Or is the
thinking more like, "you're lucky that this old non-ODP setup works at
all, and we'll make it work by routing through host/cpu memory, but it
will be slow"?


thanks,
-- 
John Hubbard
NVIDIA

> 
> This is intentional since we don't want any P2P to video memory with pinned objects and want to 
> avoid to run into a situation where one device is doing P2P to video memory while another device 
> needs the DMA-buf in host memory.
> 
> You can still do P2P with pinned object, it's just up to the exporting driver if it is allowed or not.
> 
> The other option is what Daniel suggested that we have some kind of revoke. This is essentially what 
> our KFD is doing as well when doing interop with 3D GFX, but from Jasons responses I have a bit of 
> doubt that this will actually work on the hardware level for RDMA.
> 
> Regards,
> Christian.

