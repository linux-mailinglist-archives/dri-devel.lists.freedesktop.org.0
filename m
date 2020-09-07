Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9A25FBC0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA56C88DF5;
	Mon,  7 Sep 2020 14:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883706E3F7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 14:02:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200907140219euoutp0107ff78a6dd1fbc18056792b7f8adaff2~yhULD2n2z1857918579euoutp01m
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 14:02:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200907140219euoutp0107ff78a6dd1fbc18056792b7f8adaff2~yhULD2n2z1857918579euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599487339;
 bh=hsmUocPlAFArU+eTpjUpCiULtUWbkkdS2K7yLOcO4o0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=kp44SE3LnGdiuaT9ibwXGKS/VDECGuewSeUmULEl4Usdnobv9NpsJxzrkJuMYzJOS
 RWwstWKNaC9N7sRoOz7v75/gBoAdi8+AtRd4mAM00nOi8QkFQED7QZL+qhVf9o1+O0
 hqxH1SXqcGGMDuTKSz3euMXFGNE3i9NgNnBsQzZI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200907140219eucas1p1e91dc0788991caa2678cc257343a2625~yhUKo6gle1403314033eucas1p1r;
 Mon,  7 Sep 2020 14:02:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E9.5F.06456.A6D365F5; Mon,  7
 Sep 2020 15:02:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200907140218eucas1p12759ab0e566e0438b407a2756a73e765~yhUKPoiKM1384513845eucas1p1b;
 Mon,  7 Sep 2020 14:02:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200907140218eusmtrp271ddc7a498a04eb8e6e153b87726cd69~yhUKO2Tgs1436614366eusmtrp2k;
 Mon,  7 Sep 2020 14:02:18 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-b4-5f563d6a40c5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 95.3C.06314.A6D365F5; Mon,  7
 Sep 2020 15:02:18 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200907140217eusmtip190e5c30f661ff214b4fb72711fb07e16~yhUJVvwIJ1099210992eusmtip1F;
 Mon,  7 Sep 2020 14:02:17 +0000 (GMT)
Subject: Re: [PATCH v10 30/30] videobuf2: use sgtable-based scatterlist
 wrappers
To: Tomasz Figa <tfiga@chromium.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <bdd3503f-d4f1-a1af-d10d-d75a1037ac5a@samsung.com>
Date: Mon, 7 Sep 2020 16:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AZDzG6i00gcAZKM9ZV1tATWufL=+xXUAmgrbTPt8W6Gw@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGvbMxEEuGoukJGjGN0WgUBFwmAUWJy+iDokYfNFirjCyy2QEV
 eLAuoBTUilGwECSKIosCZVEQFyBQKaFRIApq3KgRjQRiKQFtqLQjytt3zvn/e/6TXBqXWkkv
 OioukVfFKWPklBtR1zZuWha9Zo9iuf55EHvB1I6xVbkVJGuvu4yzPdYhii0pa8XYwqeBbEZe
 pQs70vMJY/X9r0i2uyGfYrMqa0n2jt6GsU3DZpK1pE1Q69w5c1MBxpUXlCMuT/2S4B6PFhKc
 vjSD4h6MfiS5D5kGjKsuOsm9nejHuSu9xYh71KemuIs1pYiz6OeFSva6BYXzMVHHeJXv2gNu
 kelffqGEhkUnitKKMDV6NleDXGlgVkDVqXpKg9xoKXMXgba24m8xgsCmHcPEwoLgmrWMmrJk
 tZwjxEExgt5zH0jHQMoMIagZ3+RgT2YnvB4qdhpmMQvgd3uu81mcaSPB+LHPaaAYP9AMapwi
 CbMWjPffEw4mJg1jY/24g2cz+6HN+JkQNR7Qft3sZFdmB+gsRszBOOMNDwbzcZFl8MZ8wxkb
 mKs0FKXVkmLsDVBeUoaL7AnfDTUuIs8Fe/2U4QyCT6Z7LmKRhaD7dC4SVYHwzvRrMio9uWIx
 VDT4iu310GnsQY42MO7QO+ghhnCH7LocXGxL4Hy6VFQvBJ3h/r+1TS+6cC2S66adppt2jm7a
 Obr/ewsRUYpkfJIQG8ELfnH8cR9BGSskxUX4HIqP1aPJz9gxYfj5EFm7DjYjhkbymZIB2W6F
 lFQeE5JjmxHQuHyWJKSzY79UEq5MTuFV8QpVUgwvNKM5NCGXSQJufguTMhHKRP4Izyfwqqkp
 Rrt6qZE22oCC99be6V4pUzU84c42lnMtKcTGWxGDjcGl4buGbSXafT+2y1Zva2xWZG9ITm3K
 9s681KcSFluidKE3O3mNzWPIHrB0/pWtRv/uVpPZVllvO1rfSN4OM467jKszwVW+ShHon28P
 GdhsC/+6JT6VmJFtDTh9uDrHnrq1OFROCJFKvyW4SlD+AbP5khyIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42I5/e/4Xd0s27B4gz0T5C16z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tOmdvYLf4cuUhk8Wmx9dYLS7vmsNm0bNhK6vFsk1/mCwO
 fnjCavG59R+bA5/Hk4PzmDzWzFvD6DG74SKLx95vC1g8Nq3qZPPY/u0Bq8f97uNMHpuX1Hvc
 /veY2WPyjeWMHrtvNrB59G1ZxejxeZNcAG+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWe
 obF5rJWRqZK+nU1Kak5mWWqRvl2CXkbb01+MBbvUK5a0LmFqYDwg08XIySEhYCLRc7idpYuR
 i0NIYCmjxMmJV5ggEjISJ6c1sELYwhJ/rnWxQRS9ZZR4dLIbrEhYIEji+vvlbCC2iICKxO+T
 M8BsZoFTrBITfztCNPQySfSdvQM2iU3AUKLrbRdYEa+AncSpdfdYQGwWoOYfPx4zg9iiAnES
 Z3peQNUISpyc+QSshlMgUGLW51NMEAvMJOZtfsgMYctLbH87B8oWl7j1ZD7TBEahWUjaZyFp
 mYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECE8G2Yz8372C8tDH4EKMAB6MS
 D+8L8dB4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBJ
 5ZXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYOR98ancUa3b2nL6
 pZrYzd8LNA2D/CobZaZWb+1e0jF7z6S7Un13n9oU/nmyf226kpqIo/DfeGeXHM2PjH2rsle4
 Jx60mRJfxxqzStup6UHPnYPTjcq/i9QefrfnlkGVq/JLpk1u8usyF4UmTD+RUWMiwXdzkcmp
 G6GzKuLupwQK/V+47/jThUosxRmJhlrMRcWJAEFLwmMaAwAA
X-CMS-MailID: 20200907140218eucas1p12759ab0e566e0438b407a2756a73e765
X-Msg-Generator: CA
X-RootMTR: 20200904133512eucas1p204efa4e252ceb5fb50715239705f9965
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133512eucas1p204efa4e252ceb5fb50715239705f9965
References: <CGME20200904133512eucas1p204efa4e252ceb5fb50715239705f9965@eucas1p2.samsung.com>
 <20200904131711.12950-1-m.szyprowski@samsung.com>
 <20200904131711.12950-31-m.szyprowski@samsung.com>
 <CAAFQd5AZDzG6i00gcAZKM9ZV1tATWufL=+xXUAmgrbTPt8W6Gw@mail.gmail.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomasz,

On 07.09.2020 15:07, Tomasz Figa wrote:
> On Fri, Sep 4, 2020 at 3:35 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Use recently introduced common wrappers operating directly on the struct
>> sg_table objects and scatterlist page iterators to make the code a bit
>> more compact, robust, easier to follow and copy/paste safe.
>>
>> No functional change, because the code already properly did all the
>> scatterlist related calls.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   .../common/videobuf2/videobuf2-dma-contig.c   | 34 ++++++++-----------
>>   .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++++++----------
>>   .../common/videobuf2/videobuf2-vmalloc.c      | 12 +++----
>>   3 files changed, 31 insertions(+), 47 deletions(-)
>>
> Thanks for the patch! Please see my comments inline.
>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index ec3446cc45b8..1b242d844dde 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -58,10 +58,10 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>>          unsigned int i;
>>          unsigned long size = 0;
>>
>> -       for_each_sg(sgt->sgl, s, sgt->nents, i) {
>> +       for_each_sgtable_dma_sg(sgt, s, i) {
>>                  if (sg_dma_address(s) != expected)
>>                          break;
>> -               expected = sg_dma_address(s) + sg_dma_len(s);
>> +               expected += sg_dma_len(s);
>>                  size += sg_dma_len(s);
>>          }
>>          return size;
>> @@ -103,8 +103,7 @@ static void vb2_dc_prepare(void *buf_priv)
>>          if (!sgt)
>>                  return;
>>
>> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
>> -                              buf->dma_dir);
>> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>>   }
>>
>>   static void vb2_dc_finish(void *buf_priv)
>> @@ -115,7 +114,7 @@ static void vb2_dc_finish(void *buf_priv)
>>          if (!sgt)
>>                  return;
>>
>> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
>> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>>   }
>>
>>   /*********************************************/
>> @@ -275,8 +274,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
>>                   * memory locations do not require any explicit cache
>>                   * maintenance prior or after being used by the device.
>>                   */
>> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
>> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>>          sg_free_table(sgt);
>>          kfree(attach);
>>          db_attach->priv = NULL;
>> @@ -301,8 +300,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>>
>>          /* release any previous cache */
>>          if (attach->dma_dir != DMA_NONE) {
>> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
>> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>> +                                 DMA_ATTR_SKIP_CPU_SYNC);
>>                  attach->dma_dir = DMA_NONE;
>>          }
>>
>> @@ -310,9 +309,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>>           * mapping to the client with new direction, no cache sync
>>           * required see comment in vb2_dc_dmabuf_ops_detach()
>>           */
>> -       sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
>> -                                     dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>> -       if (!sgt->nents) {
>> +       if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
>> +                           DMA_ATTR_SKIP_CPU_SYNC)) {
>>                  pr_err("failed to map scatterlist\n");
>>                  mutex_unlock(lock);
>>                  return ERR_PTR(-EIO);
> As opposed to dma_map_sg_attrs(), dma_map_sgtable() now returns an
> error code on its own. Is it expected to ignore it and return -EIO?

Those errors are more or less propagated to userspace and -EIO has been 
already widely documented in V4L2 documentation as the error code for 
the most of the V4L2 ioctls. I don't want to change it. A possible 
-EINVAL returned from dma_map_sgtable() was just one of the 'generic' 
error codes, not very descriptive in that case. Probably the main 
problem here is that dma_map_sg() and friend doesn't return any error 
codes...

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
