Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1FC5FC011
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 07:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B610E0CA;
	Wed, 12 Oct 2022 05:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257E10E803
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 14:13:07 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MmyNn3SVFz1CF0j;
 Tue, 11 Oct 2022 22:10:33 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 22:13:04 +0800
Received: from [10.174.176.52] (10.174.176.52) by
 kwepemm600015.china.huawei.com (7.193.23.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 22:13:03 +0800
Message-ID: <363cdfe4-f54d-0ce4-2f03-bcfe998deeef@huawei.com>
Date: Tue, 11 Oct 2022 22:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
From: ChenXiaoSong <chenxiaosong2@huawei.com>
Subject: Question about patch "fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()"
To: Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.52]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 12 Oct 2022 05:12:17 +0000
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
Cc: steve.glendinning@shawell.net, linux-fbdev@vger.kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, imv4bel@gmail.com,
 "zhangxiaoxu \(A\)" <zhangxiaoxu5@huawei.com>, yangerkun@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hyunwoo:

[patch "fbdev: smscufx: Fix use-after-free in 
ufx_ops_open()"](https://lore.kernel.org/all/20220925133243.GA383897@ubuntu/T/) 
fix [CVE-2022-41849](https://nvd.nist.gov/vuln/detail/CVE-2022-41849).

If the UAF scenarios is as follows, it seems that [fix path 
v3](https://lore.kernel.org/all/20220925133243.GA383897@ubuntu/T/) will 
not avoid race contidion of krefs:

```
           cpu0                       |        cpu1
-------------------------------------|---------------------------------------------------
  1. open()                           |
     ufx_ops_open()                   |
-------------------------------------|---------------------------------------------------
                                      | 2. ufx_usb_disconnect()
                                      |    dev->virtualized = true;
                                      |    atomic_set()
                                      |    usb_set_intfdata()
                                      |
                                      | 3. if (dev->fb_count == 0)
                                      |    schedule_delayed_work()
                                      |    kref_put()   <- kref count : 1
                                      |    kref_put()   <- kref count : 0
                                      |    ufx_free()
                                      |    kfree(dev);
-------------------------------------|---------------------------------------------------
  4. if (dev->virtualized) <==== UAF  |
```

Did I misunderstand the UAF scenarios ?
