Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A8629205
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 07:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A05710E0FD;
	Tue, 15 Nov 2022 06:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367AB10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 06:52:58 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBGxH2fnGzqSPG;
 Tue, 15 Nov 2022 14:49:07 +0800 (CST)
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 14:52:53 +0800
Message-ID: <1e9e04d2-29b4-6e37-fa5f-f0f4b767171b@huawei.com>
Date: Tue, 15 Nov 2022 14:52:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH -next] fbdev: via: Fix section mismatch warning in
 via_core_init()
To: Helge Deller <deller@gmx.de>, <FlorianSchandinat@gmx.de>,
 <corbet@lwn.net>, <sfr@canb.auug.org.au>, <linux-fbdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20221115025306.2602-1-shangxiaojing@huawei.com>
 <156a9800-b40a-8e83-86d2-27f9e2e67523@gmx.de>
From: shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <156a9800-b40a-8e83-86d2-27f9e2e67523@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
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



On 2022/11/15 13:14, Helge Deller wrote:
> On 11/15/22 03:53, Shang XiaoJing wrote:
>> Due to viafb_exit() with "__exit" tag, it should not be called by the
>> __init function via_core_init().
> 
> I wonder if you can't instead of this and your previous patch 
> (ab885d8c7e15)
> turn the i2c and gpio drivers to proper platform drivers, e.g.
> adding to bottom of via/via_i2c.c:
> module_platform_driver(&via_i2c_driver)
> instead of viafb_i2c_init() and viafb_i2c_exit().
> 
> Shouldn't they then automatically be loaded/unloaded?
> 

I'm sorry that I have no idea how to change an i2c driver to a platform 
driver.

As for module_platform_driver(), I have checked and it looks like just a 
helper macro to definite XXX_init() and XXX_exit() instead of 
automatically load/unload the driver.

Besides, the XXX_init() and XXX_exit() definited by the 
module_platform_driver() can only call 
platform_driver_register()/platform_driver_unregister(), perhaps not 
suitable for via_driver? (or just need to call 
platform_driver_register() after change to platform driver)

Thanks,
-- 
Shang XiaoJing
