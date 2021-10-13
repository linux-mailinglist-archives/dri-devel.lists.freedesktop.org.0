Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6A42BFC8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28D6EA45;
	Wed, 13 Oct 2021 12:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529FF6EA4E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7+RRLe7jHT08K+FsVTAeQELdhwshh2uqqk1cN89tFDWMXhzUcwGMBfc4EbICEe1a+aDw1NyKf4tv2jrD0U4ewR2mUv9q0GGhNlzbS/f/kcLtufu7sxozDzeGRjY16Bv9Hns/je70DaTekTlTdxIREWpdOXILxypkiCWTZ8w7KP3GytuRHJczFUv85jo7HDFX/JP/KYcaKCCV9l7Cnm6H3ykvKslnNK4Sb0LvQRxPI9IA6/eJkp6kTEb6l57AES2IQeVVz3HmqDMMh/vX5Pbisba8xbxzIK0+XAnnkpUDn5WNeFOSYhLx+bZkUC6xr16bkCjXs3BoPVEGZq+ZnR91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpEHdPKsB947F6Wh7nc1DZSwY+uT1CzjkvVhxRBcpD4=;
 b=CewSzEt0c3gh8A89+W63ya3OBf32tpTKXcRmIoSHdH06MEEK7hBF+lFecNxw2nUdqtk/9ErzOjg+UunIoNSOxuan5zLxploKvgsk6gSF1XmURdbixnaVz8++eNF7mEdRTRA8m1iGw8v3tupnfMSeq/XG0a5ybRQK77Mdx+7AVP1xQv09a+YnfrGj85NBdsBll/uHNyKavlvmkqs5NvILtu+jcLRSqN0RgIy7QVY4AjbTO3Na2bfoLpK28tLzrrHKQMHdpTM88ATF28mtJHuxGAbxgDNiqICUXJHCK6jjnGd1hnDE6S898LNvf9qhh0wJlRBNrZUOheYzFAKiDfBRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpEHdPKsB947F6Wh7nc1DZSwY+uT1CzjkvVhxRBcpD4=;
 b=IO+M/oE5ga2wbBDZEyyuNtIwjvjuMj7SW3+HoVqdBAMlLjHwJIRCEqUHpAp+xjFPSZ3yvAi1Bag3bsM6hI0A18/RpHYOYyWgioQNHyOy8+G1NKfai19HCLD+wjMjIMEiMsLs27A9NyVZy16eAELYNRrP+I19mCpuZq/SkMAXJD0=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11) by CY4PR12MB1158.namprd12.prod.outlook.com
 (2603:10b6:903:40::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 12:21:01 +0000
Received: from CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::f109:9a58:2e94:2e84]) by CY4PR1201MB0181.namprd12.prod.outlook.com
 ([fe80::f109:9a58:2e94:2e84%11]) with mapi id 15.20.4587.025; Wed, 13 Oct
 2021 12:21:01 +0000
Subject: Re: [PATCH v2] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: Sumit Semwal <sumit.semwal@linaro.org>, guangming.cao@mediatek.com
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Randy Dunlap <rdunlap@infradead.org>, wsd_upstream@mediatek.com
References: <eba79a76-413b-570c-aec0-899a5f918d38@amd.com>
 <20211012084109.176542-1-guangming.cao@mediatek.com>
 <CAO_48GE_jCWY4waK-+FqVw5sbuoHddt4kWpnkpvyLDRC__yE+g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <236a6cf9-3eb7-9315-4dd9-c1522be56c7e@amd.com>
Date: Wed, 13 Oct 2021 14:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAO_48GE_jCWY4waK-+FqVw5sbuoHddt4kWpnkpvyLDRC__yE+g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------8DD4785A6F11F592C0441375"
Content-Language: en-US
X-ClientProxiedBy: AM6P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::15) To CY4PR1201MB0181.namprd12.prod.outlook.com
 (2603:10b6:910:1f::11)
MIME-Version: 1.0
Received: from [IPv6:2a02:8109:333f:edd8:2287:c687:8512:6662]
 (2a02:8109:333f:edd8:2287:c687:8512:6662) by
 AM6P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Wed, 13 Oct 2021 12:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca156e90-eaea-40a2-f3c0-08d98e43eb44
X-MS-TrafficTypeDiagnostic: CY4PR12MB1158:
X-Microsoft-Antispam-PRVS: <CY4PR12MB115870201BB5230FAEE1F5B683B79@CY4PR12MB1158.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3zAbTMagENlHTMRFKdWjg9KY67qEBMVnPA3dCf1LmweJBCO3MMjkaxej8P9uTWNVK4ews2G3G+gNzY8hjb6bOsTBejxWv3mWY8u3k0TOqQOPS6tq1M5xI2pg0F9F2Epe+ZYVckat/KBYZ3IgUWu8FfG4K1yKWkdGXGuRSO082amQUW897zELqGmFSZDsjeaH0YYFh332NuUQp8JmigoTC4ApVmJMakK47d6V13iD7/0kRrPC7zJGqCfEwvATDA7zq7h10gY2zKPrMZxvnWVxoZ9or7voT+T1Ik1oVnbbPvanQXjvbCAEw6mWExvkdktpGdnv/jc0jisj2R9P3ABTxo7Fb5EKNlBmCWS6E2mpze3/M4WhcoWBji3Y1g6oR1Kvo3aL+Ws276oR7GZ5etRE6z/kzW9OsPeBPArvR6n69Iyz04q0po5eUvjqqonYiRETFhcxqakAgtyzlaahGaRTgcUhEqrqZqYc+pY2CUyWatiA1jAZRkf6PipJh5ovwQOiShGRoQb8vvgYuqEYnOA90JrCPfgeDdIFgokia8nCKeBKD5ROWfpWLnK2ro0pblxEuNEjz1q0hrqZYyn6HczxakCo6S5zmexYJQQxUaAkQH1voFw22/4Ypc5ky32MXZNEIopAU8wHt83AxUdjf5VI3rkx7vdXrKaOJKZNc1Z6wdmgsXsALrhw8nPuJ1cCv+1ND90dvZjOiCrusSvE8I02ZylpsfaHOvhd6Gq562DlHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(5660300002)(966005)(508600001)(4326008)(54906003)(2906002)(8676002)(316002)(186003)(45080400002)(8936002)(38100700002)(33964004)(31686004)(83380400001)(6666004)(7416002)(66556008)(66476007)(166002)(2616005)(31696002)(66946007)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXorcnNrWGVrU1JmVy9tb2ZjK2N3bmhVc2hnVWUzM1B0b2prYWVuV1lidTJn?=
 =?utf-8?B?Tzc3eW1CVlNmMFV2ZUluY3U0d0lDdTVUd0dZYmJSZWhpcm04UUVRV2kram12?=
 =?utf-8?B?NUVCN1o5TC9DaWRsbng3S21IZ1dnL2lUOEVsb1QzbWRvMmVKc1ovK1pKdkRk?=
 =?utf-8?B?TVVqcWJMK1RTRVg0bkFZcEtiWENNM2h5MHh5Qm9seXp4eVp5WEl2OVJ1eUJv?=
 =?utf-8?B?TmVlTEtwaUl1ZTMyRjRxU0pOcHIxNTFYcFNTTDArRFZVY0tEblR2cnFicFEv?=
 =?utf-8?B?MFd2a0tpcnZBR2hROXdXcjl4ck5kNVd3bHVtU2thaExlNFhSNGVYcTkwcEov?=
 =?utf-8?B?Q1d6RkFqUDBOZnh5eEdGRWtRNGd2MitvWmVlWGN6N1ErM3l2dUIrVjA2cTFz?=
 =?utf-8?B?OWUyd05rRUFwOVo4OS8yZ1Z5UjJ4MzhkTE00ekxwNTlGU2Vya3MvWWZOYnUv?=
 =?utf-8?B?Nmh5aHprNTVQQmVoRUdHaVlWQXhzM2U0SVdna0puUTdRQ2o0aFh5M1JNWktH?=
 =?utf-8?B?Y1dCQ1ZDNUZSanFPNTVuSlJETkdnWTR4VnZtbSsvSW1uMjhGUE1scmI5dHl4?=
 =?utf-8?B?T0NyOFFIYWNsODdXa2ZLY2ZGbW4xc1ZqSTJ6VTgyU2hTeWtNbE9uNmlhb2NH?=
 =?utf-8?B?L2NLNWdvT3EwWEtrRE5sS012WFRXNlBqa3lZU1UxUlV4T0xGc01pSlpQWmRT?=
 =?utf-8?B?VE5wMGsrSi8zUU1nRjRkSytqSVREWUNOSCtKV2w4enA1SW12MVZxQzJGUTRx?=
 =?utf-8?B?OG9Mank1c2hFTFJPT0pBVkJnMWpXbG1RTnVNTzh5VUFRTnZoaUZJUmJQZXY4?=
 =?utf-8?B?Zm1MMTlGRnR6ZGlqUWN6aEpZY29kai96T1prdFRwS3BmRTJQQXNldHY5TkZZ?=
 =?utf-8?B?RHdJUEZJSmdlcVRuaURtNmc5b2pXRlh4NUxWUVg5Zy82NjZPajJXYjg3YjVp?=
 =?utf-8?B?bmhGQW1GMUdvYjVYSS9wQmhzN2cyQi9JYlJUOUc3bmZrcEZZNnpZM2YyTVFj?=
 =?utf-8?B?aDNZdFV1enMzeStkbHV4VTV5ekdiR28vVkx3VHAvYlN1ZEFpU2FZRndZY05y?=
 =?utf-8?B?TFJKRnRjZy9rTFN4cWV0SUw2ZG03T01zenVNa1pNNDl5Vm5VeXdKNzdwUmRv?=
 =?utf-8?B?a2VLRTJqRFc4dU16K2szdlplUkFIbmJtVmUranBpZkVvMTRsL1pPWjVPNjhm?=
 =?utf-8?B?Ums2UDIyOFozdmZpVWtUR056TWpnUk16eVh4Qnk3bHF1RG1FVGRPM0JCUVlh?=
 =?utf-8?B?UmFWUU9ONG5zYWFJMVVOQUwyWTE4VmVEM2RlRjZJa2tQeEFlQlB4ZzMzNFIx?=
 =?utf-8?B?TEJMUlpHSyt0eGl5S3JsMld1Z2VxWlNWd0hoSXVvZzhrUmVUOUl0VXNjMnlT?=
 =?utf-8?B?dEFldDJ1ZUgyNjdhTHhNaWZsc2ZiOUhZcVljUWh0WGxweUc3UUNnRjl6YUpI?=
 =?utf-8?B?OXRaOXFkaUhtRVhEL083Nm5ucUVUVDMvMWQ4ZDFydDROV203Y25UenhsZ2xr?=
 =?utf-8?B?V004YldTOUpuZnBoOHBYaTcrLzQ3aXE3RWdKbnVKVEFoeU94eXZNWmtFdUxw?=
 =?utf-8?B?YS84MmkwM1diSFRtekozdllzS3FrVFZVYUtrK0FkbVZzMTNBb1FPSUpVWWY2?=
 =?utf-8?B?SmhaeVhsenh5K1BoWHdnOTU3MVdaVm5tdE83SkNpcEF4VVpWb2lEY2kwK3Bq?=
 =?utf-8?B?OVhSNHFlSkRkNG9vWTMxSlE4ekF5SC91djlVRzg0ZitaMXVEMW1NZGRzM21V?=
 =?utf-8?B?WiswMlF1bXY1cnRpQkpJSStocFV2OUpDZE1CK29rSTNhM2RXMmx5dVJCcjJx?=
 =?utf-8?B?U2x6Ly9MM0FaQjR4VVgrU3hFZmZySHdwbitCRjVmZ0V6bzd4ajFjWExLVzVC?=
 =?utf-8?Q?Q6MJgYenmVZqr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca156e90-eaea-40a2-f3c0-08d98e43eb44
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:21:01.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/SN8DtVkYkFwSgj+Tq1G4UlyQyLFNd1BY4ZzBJTEjKQWyoO+Ysltl+Em+K7Y/Xn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1158
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

--------------8DD4785A6F11F592C0441375
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.10.21 um 01:56 schrieb Sumit Semwal:
> Hello Guangming, Christian,
>
>
>
> On Tue, 12 Oct 2021, 14:09 , <guangming.cao@mediatek.com 
> <mailto:guangming.cao@mediatek.com>> wrote:
>
>     From: Guangming Cao <Guangming.Cao@mediatek.com
>     <mailto:Guangming.Cao@mediatek.com>>
>
>     > Am 09.10.21 um 07:55 schrieb guangming.cao@mediatek.com
>     <mailto:guangming.cao@mediatek.com>:
>     > From: Guangming Cao <Guangming.Cao@mediatek.com
>     <mailto:Guangming.Cao@mediatek.com>>
>     > >
>     > > If dma-buf don't want userspace users to touch the dmabuf buffer,
>     > > it seems we should add this restriction into dma_buf_ops.mmap,
>     > > not in this IOCTL:DMA_BUF_SET_NAME.
>     > >
>     > > With this restriction, we can only know the kernel users of
>     the dmabuf
>     > > by attachments.
>     > > However, for many userspace users, such as userpsace users of
>     dma_heap,
>     > > they also need to mark the usage of dma-buf, and they don't
>     care about
>     > > who attached to this dmabuf, and seems it's no meaning to be
>     waiting for
>     > > IOCTL:DMA_BUF_SET_NAME rather than mmap.
>     >
>     > Sounds valid to me, but I have no idea why this restriction was
>     added in
>     > the first place.
>     >
>     > Can you double check the git history and maybe identify when
>     that was
>     > added? Mentioning this change in the commit message then might make
>     > things a bit easier to understand.
>     >
>     > Thanks,
>     > Christian.
>     It was add in this patch:
>     https://patchwork.freedesktop.org/patch/310349/
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F310349%2F&data=04%7C01%7Cchristian.koenig%40amd.com%7C4149923e2b0646de82ce08d98ddbf2c2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637696798278342557%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=N49RVF4s%2BGQ4D%2Ft1MOwRsCnslFnwobSB3G86pvP9m7A%3D&reserved=0>.
>     However, there is no illustration about it.
>     I guess it wants users to set_name when no attachments on the dmabuf,
>     for case with attachments, we can find owner by device in attachments.
>     But just I said in commit message, this is might not a good idea.
>
>     Do you have any idea?
>
>
> For the original series, the idea was that allowing name change 
> mid-use could confuse the users about the dma-buf. However, the rest 
> of the series also makes sure each dma-buf have a unique inode, and 
> any accounting should probably use that, without relying on the name 
> as much.
> So I don't have an objection to this change.

I suggest to add that explanation and the original commit id into the 
commit message.

With that changed the patch has my rb as well.

Regards,
Christian.

>
> Best,
> Sumit.
>
>     >
>     > >
>     > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com
>     <mailto:Guangming.Cao@mediatek.com>>
>     > > ---
>     > >   drivers/dma-buf/dma-buf.c | 14 ++------------
>     > >   1 file changed, 2 insertions(+), 12 deletions(-)
>     > >
>     > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>     > > index 511fe0d217a0..db2f4efdec32 100644
>     > > --- a/drivers/dma-buf/dma-buf.c
>     > > +++ b/drivers/dma-buf/dma-buf.c
>     > > @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file
>     *file, poll_table *poll)
>     > >
>     > >   /**
>     > >    * dma_buf_set_name - Set a name to a specific dma_buf to
>     track the usage.
>     > > - * The name of the dma-buf buffer can only be set when the
>     dma-buf is not
>     > > - * attached to any devices. It could theoritically support
>     changing the
>     > > - * name of the dma-buf if the same piece of memory is used
>     for multiple
>     > > - * purpose between different devices.
>     > > + * It could theoretically support changing the name of the
>     dma-buf if the same
>     > > + * piece of memory is used for multiple purpose between
>     different devices.
>     > >    *
>     > >    * @dmabuf: [in]     dmabuf buffer that will be renamed.
>     > >    * @buf:    [in]     A piece of userspace memory that
>     contains the name of
>     > > @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct
>     dma_buf *dmabuf, const char __user *buf)
>     > >     if (IS_ERR(name))
>     > >             return PTR_ERR(name);
>     > >
>     > > -   dma_resv_lock(dmabuf->resv, NULL);
>     > > -   if (!list_empty(&dmabuf->attachments)) {
>     > > -           ret = -EBUSY;
>     > > -           kfree(name);
>     > > -           goto out_unlock;
>     > > -   }
>     > >     spin_lock(&dmabuf->name_lock);
>     > >     kfree(dmabuf->name);
>     > >     dmabuf->name = name;
>     > >     spin_unlock(&dmabuf->name_lock);
>     > >
>     > > -out_unlock:
>     > > -   dma_resv_unlock(dmabuf->resv);
>     > >     return ret;
>     > >   }
>     > >
>


--------------8DD4785A6F11F592C0441375
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 13.10.21 um 01:56 schrieb Sumit Semwal:<br>
    <blockquote type="cite" cite="mid:CAO_48GE_jCWY4waK-+FqVw5sbuoHddt4kWpnkpvyLDRC__yE+g@mail.gmail.com">
      
      <div dir="auto">
        <div>Hello Guangming, Christian,
          <div dir="auto"><br>
          </div>
          <br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Tue, 12 Oct 2021, 14:09
              , &lt;<a href="mailto:guangming.cao@mediatek.com" rel="noreferrer noreferrer noreferrer" target="_blank" moz-do-not-send="true">guangming.cao@mediatek.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Guangming Cao &lt;<a href="mailto:Guangming.Cao@mediatek.com" rel="noreferrer
                noreferrer noreferrer noreferrer" target="_blank" moz-do-not-send="true">Guangming.Cao@mediatek.com</a>&gt;<br>
              <br>
              &gt; Am 09.10.21 um 07:55 schrieb <a href="mailto:guangming.cao@mediatek.com" rel="noreferrer
                noreferrer noreferrer noreferrer" target="_blank" moz-do-not-send="true">guangming.cao@mediatek.com</a>:<br>
              &gt; From: Guangming Cao &lt;<a href="mailto:Guangming.Cao@mediatek.com" rel="noreferrer
                noreferrer noreferrer noreferrer" target="_blank" moz-do-not-send="true">Guangming.Cao@mediatek.com</a>&gt;<br>
              &gt; &gt;<br>
              &gt; &gt; If dma-buf don't want userspace users to touch
              the dmabuf buffer,<br>
              &gt; &gt; it seems we should add this restriction into
              dma_buf_ops.mmap,<br>
              &gt; &gt; not in this IOCTL:DMA_BUF_SET_NAME.<br>
              &gt; &gt;<br>
              &gt; &gt; With this restriction, we can only know the
              kernel users of the dmabuf<br>
              &gt; &gt; by attachments.<br>
              &gt; &gt; However, for many userspace users, such as
              userpsace users of dma_heap,<br>
              &gt; &gt; they also need to mark the usage of dma-buf, and
              they don't care about<br>
              &gt; &gt; who attached to this dmabuf, and seems it's no
              meaning to be waiting for<br>
              &gt; &gt; IOCTL:DMA_BUF_SET_NAME rather than mmap.<br>
              &gt; <br>
              &gt; Sounds valid to me, but I have no idea why this
              restriction was added in <br>
              &gt; the first place.<br>
              &gt; <br>
              &gt; Can you double check the git history and maybe
              identify when that was <br>
              &gt; added? Mentioning this change in the commit message
              then might make <br>
              &gt; things a bit easier to understand.<br>
              &gt; <br>
              &gt; Thanks,<br>
              &gt; Christian.<br>
              It was add in this patch: <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F310349%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4149923e2b0646de82ce08d98ddbf2c2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637696798278342557%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=N49RVF4s%2BGQ4D%2Ft1MOwRsCnslFnwobSB3G86pvP9m7A%3D&amp;reserved=0" originalsrc="https://patchwork.freedesktop.org/patch/310349/" shash="rrFLG2SGWwCOnevYntPkTBSLrAKC6N1Tqo0D7JcYApk3UgzLEy90FuuUiWQy2kK2oLh/dD822UVt+oxD14gkAVIoBSSXLllKMcWgzyFWLFnQz/hYTHy36ByjwT0X8rljdha1Zk9DL+tA28zkfSnmyWzn6ZU0mcMBBfX5Ak2SJ/A=" rel="noreferrer noreferrer noreferrer noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">https://patchwork.freedesktop.org/patch/310349/</a>.<br>
              However, there is no illustration about it.<br>
              I guess it wants users to set_name when no attachments on
              the dmabuf,<br>
              for case with attachments, we can find owner by device in
              attachments.<br>
              But just I said in commit message, this is might not a
              good idea.<br>
              <br>
              Do you have any idea?<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">For the original series, the idea was that
          allowing name change mid-use could confuse the users about the
          dma-buf. However, the rest of the series also makes sure each
          dma-buf have a unique inode, and any accounting should
          probably use that, without relying on the name as much.</div>
        <div dir="auto">So I don't have an objection to this change.</div>
      </div>
    </blockquote>
    <br>
    I suggest to add that explanation and the original commit id into
    the commit message.<br>
    <br>
    With that changed the patch has my rb as well.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAO_48GE_jCWY4waK-+FqVw5sbuoHddt4kWpnkpvyLDRC__yE+g@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Best,</div>
        <div dir="auto">Sumit.</div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              &gt; <br>
              &gt; &gt;<br>
              &gt; &gt; Signed-off-by: Guangming Cao &lt;<a href="mailto:Guangming.Cao@mediatek.com" rel="noreferrer
                noreferrer noreferrer noreferrer" target="_blank" moz-do-not-send="true">Guangming.Cao@mediatek.com</a>&gt;<br>
              &gt; &gt; ---<br>
              &gt; &gt;&nbsp; &nbsp;drivers/dma-buf/dma-buf.c | 14 ++------------<br>
              &gt; &gt;&nbsp; &nbsp;1 file changed, 2 insertions(+), 12
              deletions(-)<br>
              &gt; &gt;<br>
              &gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c
              b/drivers/dma-buf/dma-buf.c<br>
              &gt; &gt; index 511fe0d217a0..db2f4efdec32 100644<br>
              &gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
              &gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
              &gt; &gt; @@ -325,10 +325,8 @@ static __poll_t
              dma_buf_poll(struct file *file, poll_table *poll)<br>
              &gt; &gt;&nbsp; &nbsp;<br>
              &gt; &gt;&nbsp; &nbsp;/**<br>
              &gt; &gt;&nbsp; &nbsp; * dma_buf_set_name - Set a name to a specific
              dma_buf to track the usage.<br>
              &gt; &gt; - * The name of the dma-buf buffer can only be
              set when the dma-buf is not<br>
              &gt; &gt; - * attached to any devices. It could
              theoritically support changing the<br>
              &gt; &gt; - * name of the dma-buf if the same piece of
              memory is used for multiple<br>
              &gt; &gt; - * purpose between different devices.<br>
              &gt; &gt; + * It could theoretically support changing the
              name of the dma-buf if the same<br>
              &gt; &gt; + * piece of memory is used for multiple purpose
              between different devices.<br>
              &gt; &gt;&nbsp; &nbsp; *<br>
              &gt; &gt;&nbsp; &nbsp; * @dmabuf: [in]&nbsp; &nbsp; &nbsp;dmabuf buffer that will
              be renamed.<br>
              &gt; &gt;&nbsp; &nbsp; * @buf:&nbsp; &nbsp; [in]&nbsp; &nbsp; &nbsp;A piece of userspace
              memory that contains the name of<br>
              &gt; &gt; @@ -346,19 +344,11 @@ static long
              dma_buf_set_name(struct dma_buf *dmabuf, const char __user
              *buf)<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;if (IS_ERR(name))<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return PTR_ERR(name);<br>
              &gt; &gt;&nbsp; &nbsp;<br>
              &gt; &gt; -&nbsp; &nbsp;dma_resv_lock(dmabuf-&gt;resv, NULL);<br>
              &gt; &gt; -&nbsp; &nbsp;if
              (!list_empty(&amp;dmabuf-&gt;attachments)) {<br>
              &gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret = -EBUSY;<br>
              &gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(name);<br>
              &gt; &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_unlock;<br>
              &gt; &gt; -&nbsp; &nbsp;}<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;spin_lock(&amp;dmabuf-&gt;name_lock);<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;kfree(dmabuf-&gt;name);<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;dmabuf-&gt;name = name;<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;spin_unlock(&amp;dmabuf-&gt;name_lock);<br>
              &gt; &gt;&nbsp; &nbsp;<br>
              &gt; &gt; -out_unlock:<br>
              &gt; &gt; -&nbsp; &nbsp;dma_resv_unlock(dmabuf-&gt;resv);<br>
              &gt; &gt;&nbsp; &nbsp; &nbsp;return ret;<br>
              &gt; &gt;&nbsp; &nbsp;}<br>
              &gt; &gt;&nbsp; &nbsp;<br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------8DD4785A6F11F592C0441375--
