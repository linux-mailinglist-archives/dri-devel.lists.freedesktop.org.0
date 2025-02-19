Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCEA3B2A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 08:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADAA10E25A;
	Wed, 19 Feb 2025 07:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="UCOvT3/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 237E210E25A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
 Content-Type; bh=7MpbM+6fg3KAR60DstuyWUUcvrlrvQHDRX+TIlD+t/0=;
 b=UCOvT3/YJxIJ/U0B3iewDL6gKAru25jZTp4Du1ehaY8k1imzPXDTh3ByTiAM6v
 cWL5LLLxpXBiL57bw8cS84lqZ5XtNgadDlEcBw7qnDcez9CQaw6Nu8fuzoLm/ULH
 egALyum2WypNKmIa/bRuTm+/3pypLFd2LoujAS0cmQNa4=
Received: from [10.42.20.80] (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgBXM9XoirVnAf0OAQ--.45861S2;
 Wed, 19 Feb 2025 15:40:25 +0800 (CST)
Message-ID: <437a0a0e-f61d-45bf-b859-d527381a9763@163.com>
Date: Wed, 19 Feb 2025 15:40:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] fbdev: lcdcfb: add missing device_remove_file()
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@baylibre.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 oushixiong <oushixiong@kylinos.cn>
References: <20250208092918.251733-1-oushixiong1025@163.com>
 <4f2ae439-1bdc-4593-9151-e15981509344@app.fastmail.com>
Content-Language: en-US
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <4f2ae439-1bdc-4593-9151-e15981509344@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBXM9XoirVnAf0OAQ--.45861S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAr1UAFWktrWDZF1UJr4xWFg_yoWxXFg_ua
 10vF93uw1UXr1kXa47GFsrtFyDKw1qv398JF4rJF1rXas7tasFvrW29rZFvr1UKF4kCr1a
 qrWYqrW2kr1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_Ksj7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQz4D2e1iPoyfgAAsK
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


在 2025/2/19 14:47, Arnd Bergmann 写道:
> On Sat, Feb 8, 2025, at 10:29, oushixiong1025@163.com wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> 1. The device_remove_file() need to be called when driver is removing.
>> 2. The device_remove_file() need to be called if the call to
>>     device_create_file() fails.
> This should probably use device_add_group() instead of
> individual files to simplify both creation and removal.
> It would also avoid the bug you introduced that gcc warns
> about.
>
>        Arnd

Thank you for your suggestion. I will incorporate your advice and resend a patch.

Thanks and Regards,
Shixiong Ou.

