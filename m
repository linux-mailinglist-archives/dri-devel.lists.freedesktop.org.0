Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1802216AE2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 12:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A989B66;
	Tue,  7 Jul 2020 10:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6F589CA4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 10:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ30GywtI4Ubufg06/+qmW0+r4ax0hPhlMBbLQlibTXxS5j3I70u8BicNDdxzE7Cg+rAFaENsu9ID5NpI6WoPxLX9UGHrOvxhmkcquZv8KiJ8ayOUunhU3rzsjGyByUU6q8K/557oQqvPHpPZAZFItUI53gh7apLxpLl+bSWjCQyIqi5lzfzRAFdIt30HBH2kPTEiGBjNwDv0uODAWYdPNt4b/zfwju2wnzdKxIioSNABfPqp/GhsTZDYyIdm3g1MXpu2unjLAk+2gbApLcGUCjW+v2dLUxRCYWKKzssbs2N3OFp5WqxyWfBCvQ1vuy09ikyzkoL0buX1MCWK5HY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qN8lAwsEWKvN1dOyZ4XpdyXemCWYCZ0plwaijlAAKY=;
 b=gakljn3FiDGx6ldkVgrMXjSsmx0RrtEiDl4oKmD1wFcK/dhg82/Otz10Bpt1ZrlyFVMhBTuZLTCri9VqkYVzHCFy40/zOwRGYXrns5VG858iE6wCu5wXuLkFrtWquMSaOC+2i1SE2iGaeRDmfZijT3xj1I2fV1kvQfuhcU7cinbajVFNizTyT4jG80ACGGvPNhEnwjcSl2yQpr10/DK6Sv2b+8MOspyle8dYg8roECtHsNAZ0GLjYbhHIAoCWG57teXVa2i99dLKUV1raI1lSy5voswhVTLd3+hGoQu9b0QkZ28k1Lpi6QNYctC7vPRnHILCyL1/fmhmpfJ0tVPX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qN8lAwsEWKvN1dOyZ4XpdyXemCWYCZ0plwaijlAAKY=;
 b=nHlIhe3ollg0WMc56b6NpcyR/M0jeFsZ2uHFDb6rRgVeeQOvM8JeihrVYNuCG+i/8JA6uKjCbG9AsJug5/ctiO/OrXq8SXDN4LqCAHz0MiRCmj3SKVRxqjhiU5teA//FrVM8dtjYc6R6IImFcea7qODHkStVmnhGkGxiFxRZpw8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 7 Jul
 2020 10:58:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.020; Tue, 7 Jul 2020
 10:58:31 +0000
Subject: Re: [RFC] drm/vgem: Don't use get_page in fault handler.
To: Daniel Vetter <daniel@ffwll.ch>, Lepton Wu <ytht.net@gmail.com>
References: <20200707042100.2550260-1-ytht.net@gmail.com>
 <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2d933121-4067-e4ce-42d7-ad8a7a0ea274@amd.com>
Date: Tue, 7 Jul 2020 12:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uHCPZwzh7_3KTm=JhjtYsUd3o7gKALTfSkBLiVt8Y=5bw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:200:42::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0008.eurprd07.prod.outlook.com (2603:10a6:200:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend
 Transport; Tue, 7 Jul 2020 10:58:30 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6da0bdf1-e92d-4131-5802-08d82264afcb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4405A7FAA50736781FF43EA583660@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: meemaSSGRf+fuvebljYnuSZ0C3fB6t0bx2MLczQfiNMTVJRRf3n0oiSyasobBAHkeWkUV8jxv+hms2BMZ2KNZmhxWEL/ZvPhXtvBYSc/JhbidxBBTGgyHWbMRqhehntrqWfMuq/Sv5s4BBNammz/Km+PBlhKHHQS4JZr4lBWCQluFZgWzsHny1YlbpebNYmb8vXiierKpJcrI5NntywdZ3ybLpKX0VLu6HdXQTRXXtWyDhOSj0nMHkflcrH5WHL7NVIvVXfS6uvSelBtAVCbY1I6LxiVTur5LKSnH0+4M8RQw92AFlKx1RrX8uAm8mo6eQi/N23J5YTVFIio8vnXTbW+JQaTAP+S0DXOS7dm6qNINUtvFz5cknvCFag3VT/dJGSdBbocgXUTvSSK+yDMwcXFkk27qiz61J0d2e8Fxo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(316002)(83380400001)(4326008)(8936002)(110136005)(31686004)(16526019)(966005)(2906002)(53546011)(186003)(6486002)(5660300002)(8676002)(6666004)(45080400002)(86362001)(2616005)(52116002)(66556008)(66476007)(66946007)(478600001)(31696002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: r8YxiXzsxPC2QqnrrLp1nLh02mgtic/WBlMwD9Z79TUvnZ6Ksv6pdGxd2zXMYbkFHY+oCMIKyXE+sb8Nnha4RnKBIzbiWeQinyRnR1wwxaoFdr5aXjbHezH8Kz9bQ4a1rexxZN2Ni04GY6SHLbNknEp8Gsgvyi2bc5/TzogsI0c58Wj0Te1pP1fFv6DiKNwCCB89hAFI/69qDifgfr3Smi6sxQpsglCuJbuHYppCkt/z7p46XJvuFE6dx0fY9wgYitOhAYLmez64Se5PWAMYrQMhNYvppK02LYJadnbx19M52Avqkl0JkX/2eM2WfuuHB1/zsa7Z8wgnyKNUunbljUsvkB5NH8vJPkDiNlLAatgjUa7NLBndhGtK0mGY9er/StlyHdh92PNS0+o8zDhLre2yRi5ygbFea1EW7Clyv2cUbnH55e4UY/WUN7IUqAgavRkrEsX++NDTy1eF7LTrqDz5nNjJllwTU1OJPxzV2/egIRGTKZmR2HcBW+HsQ3SYGa2GZrOt11XYW8fXhAwOj83KhGObJwhjolqwogOAkDpeTGmlI6ZEZUBWEBtARp/i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0bdf1-e92d-4131-5802-08d82264afcb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 10:58:31.7676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PV/kit/tBLQcJzUfjD8y2naKXoV6Xl1y0HmpCW6iu3L5c1WynHlgTQpddsyG+J6K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.20 um 10:59 schrieb Daniel Vetter:
> On Tue, Jul 7, 2020 at 9:27 AM Lepton Wu <ytht.net@gmail.com> wrote:
>> For pages which are allocated in ttm with transparent huge pages,
>> tail pages have zero as reference count. The current vgem code use
>> get_page on them and it will trigger BUG when release_pages get called
>> on those pages later.
>>
>> Here I attach the minimal code to trigger this bug on a qemu VM which
>> enables virtio gpu (card1) and vgem (card0). BTW, since the upstream
>> virtio gpu has changed to use drm gem and moved away from ttm. So we
>> have to use an old kernel like 5.4 to reproduce it. But I guess
>> same thing could happen for a real GPU if the real GPU use similar code
>> path to allocate pages from ttm. I am not sure about two things: first, do we
>> need to fix this? will a real GPU hit this code path? Second, suppose this
>> need to be fixed, should this be fixed in ttm side or vgem side?  If we remove
>> "huge_flags &= ~__GFP_COMP" from ttm_get_pages, then get_page in vgem works
>> fine. But it's there for fix another bug:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugs.freedesktop.org%2Fshow_bug.cgi%3Fid%3D103138&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Cfc0831be8fd848abfd8908d82254266d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637297092113216357&amp;sdata=S%2BtLJyB8mqyyE%2BSIjbfHM6FGFuFjrfI50tahpaoJ3wU%3D&amp;reserved=0
>> It could also be "fixed" with this patch. But I am really not sure if this is
>> the way to go.
> For imported dma-buf objects, vgem should not handle this itself, but
> forward to the exporter through the dma_buf_mmap stuff. We have
> helpers for this all now, probably just not wired up correctly. Trying
> to ensure that all combinations of mmap code across all drivers work
> the same doesn't work.

Yes, Daniel is right what vgem does here is fundamentally broken in many 
ways.

First of all nobody should ever call get_page() on the pages TTM has 
allocated. Those pages come out of a block box and should not be touched 
by anybody.

Second the DMA-buf doesn't even need to have pages backing them in the 
case of P2P.

And third you mess up the coherency with this massively. E.g. no correct 
cache flushes any more.

Regards,
Christian.

> Caveat: I might not be understanding exactly what's going on here :-)
> -Daniel
>
>> Here is the code to reproduce this bug:
>>
>> unsigned int WIDTH = 1024;
>> unsigned int HEIGHT = 513;
>> unsigned int size = WIDTH * HEIGHT * 4;
>>
>> int work(int vfd, int dfd, int handle) {
>>          int ret;
>>          struct drm_prime_handle hf = {.handle =  handle };
>>          ret = ioctl(dfd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &hf);
>>          fprintf(stderr, "fd is %d\n", hf.fd);
>>          hf.flags = DRM_CLOEXEC | DRM_RDWR;
>>          ret = ioctl(vfd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &hf);
>>          fprintf(stderr, "new handle is %d\n", hf.handle);
>>          struct drm_mode_map_dumb map = {.handle = hf.handle };
>>          ret = ioctl(vfd, DRM_IOCTL_MODE_MAP_DUMB, &map);
>>          fprintf(stderr, "need map at offset %lld\n", map.offset);
>>          unsigned char * ptr = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, vfd,
>>                            map.offset);
>>          memset(ptr, 2, size);
>>          munmap(ptr, size);
>> }
>>
>> int main()
>> {
>>          int vfd = open("/dev/dri/card0", O_RDWR); // vgem
>>          int dfd = open("/dev/dri/card1", O_RDWR); // virtio gpu
>>
>>          int ret;
>>          struct drm_mode_create_dumb ct = {};
>>
>>          ct.height = HEIGHT;
>>          ct.width = WIDTH;
>>          ct.bpp = 32;
>>          ret = ioctl(dfd, DRM_IOCTL_MODE_CREATE_DUMB, &ct);
>>          work(vfd, dfd, ct.handle);
>>          fprintf(stderr, "done\n");
>> }
>>
>> Signed-off-by: Lepton Wu <ytht.net@gmail.com>
>> ---
>>   drivers/gpu/drm/vgem/vgem_drv.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
>> index ec1a8ebb6f1b..be3d97e29804 100644
>> --- a/drivers/gpu/drm/vgem/vgem_drv.c
>> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
>> @@ -87,9 +87,8 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
>>
>>          mutex_lock(&obj->pages_lock);
>>          if (obj->pages) {
>> -               get_page(obj->pages[page_offset]);
>> -               vmf->page = obj->pages[page_offset];
>> -               ret = 0;
>> +               ret = vmf_insert_pfn(vmf->vma, vmf->address,
>> +                                    page_to_pfn(obj->pages[page_offset]));
>>          }
>>          mutex_unlock(&obj->pages_lock);
>>          if (ret) {
>> @@ -263,7 +262,6 @@ static struct drm_ioctl_desc vgem_ioctls[] = {
>>
>>   static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
>>   {
>> -       unsigned long flags = vma->vm_flags;
>>          int ret;
>>
>>          ret = drm_gem_mmap(filp, vma);
>> @@ -273,7 +271,6 @@ static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
>>          /* Keep the WC mmaping set by drm_gem_mmap() but our pages
>>           * are ordinary and not special.
>>           */
>> -       vma->vm_flags = flags | VM_DONTEXPAND | VM_DONTDUMP;
>>          return 0;
>>   }
>>
>> --
>> 2.27.0.212.ge8ba1cc988-goog
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Cfc0831be8fd848abfd8908d82254266d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637297092113216357&amp;sdata=C1sO1pUj0wnga%2BodcDRl9gA%2FNpIGO368KeQUAFyWK2g%3D&amp;reserved=0
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
