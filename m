Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A20C97F62
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E0F89FD4;
	Mon,  1 Dec 2025 15:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="wIoSGk7I";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wIoSGk7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582C910E119
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 09:25:25 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=70DyG3siVbXyJAmKkksFDasRdSXuYweryE3rvQYDiDw=;
 b=wIoSGk7I6j1eQMnEVlC2nFVDyEs/XaVDcO8SjWPUSfDJiNHZehJVGeVVMQ7rHtIxKrFZhGlas
 mPE1l2qF2FgE6iKIP6thTmWVksBXy71NvI3vCQLx+vR7XnOWDpA8AtOlWes0IGMoDdylv/y1gqr
 N9jc8tJ4qaFdlFoNedRhHmQ=
Received: from canpmsgout08.his.huawei.com (unknown [172.19.92.156])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dKdlG6mbrz1BT2h
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 17:24:26 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=70DyG3siVbXyJAmKkksFDasRdSXuYweryE3rvQYDiDw=;
 b=wIoSGk7I6j1eQMnEVlC2nFVDyEs/XaVDcO8SjWPUSfDJiNHZehJVGeVVMQ7rHtIxKrFZhGlas
 mPE1l2qF2FgE6iKIP6thTmWVksBXy71NvI3vCQLx+vR7XnOWDpA8AtOlWes0IGMoDdylv/y1gqr
 N9jc8tJ4qaFdlFoNedRhHmQ=
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dKdk74bpNzmV73;
 Mon,  1 Dec 2025 17:23:27 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
 by mail.maildlp.com (Postfix) with ESMTPS id B8BC51800CE;
 Mon,  1 Dec 2025 17:25:18 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 17:25:18 +0800
Message-ID: <224e4e5b-14ae-411c-ad6c-f73c3b946ff8@huawei.com>
Date: Mon, 1 Dec 2025 17:25:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable] fbdev: Fix out-of-bounds issue in sys_fillrect()
To: Helge Deller <deller@gmx.de>
CC: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Lu
 Jialin <lujialin4@huawei.com>
References: <20251112073207.1731125-1-gubowen5@huawei.com>
 <148a116a-b893-4e91-8573-1eebc2bb5c0e@gmx.de>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <148a116a-b893-4e91-8573-1eebc2bb5c0e@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-Mailman-Approved-At: Mon, 01 Dec 2025 15:07:33 +0000
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

Hi,

On 11/15/2025 3:21 AM, Helge Deller wrote:
> 
> That patch does not apply to git head.
> Can you try to reproduce with git head?
> 

fbdev has already been refactored by commit eabb03293087 ("fbdev: 
Refactoring the fbcon packed pixel drawing routines") on v6.15-rc1, so 
this issue no longer exists in the mainline version. Similar question 
has occurred in the past:

https://syzkaller.appspot.com/bug?extid=66bde8e1e4161d4b2cca

After the refactoring patch was merged, this issue did not reappear, but 
it still exists in the stable version.

BR,
Guber
