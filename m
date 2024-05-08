Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55028BFD88
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F3C10FBF2;
	Wed,  8 May 2024 12:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CrEgQhCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53D10FBB3;
 Wed,  8 May 2024 12:35:12 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f57713684so5390942e87.1; 
 Wed, 08 May 2024 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715171710; x=1715776510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGqJENKGu2VDw1JweApXY7Cnx0SgkltEUbGukf+76pw=;
 b=CrEgQhCjVyalzCexoPt/Jcuv5eB27Zfo/VutveXXZFpXREfXwoWS47ljWYhYWf+ETZ
 4wvBUpxOywHZtg7/Hy+ErX06EPfiOllMzcgT251RbwWIIIk8Yb7Hxl3OvA93V64xl3em
 JtrwzlxTiD9DhQCU4Zq5AH2SDxaPms2EuImfqwNFxbxYwAdjd7Mv2/IJQc1qPtwYHh5v
 85o8G59+tx1bUu90EgqTmDEuKZWfwR3OtxLZ6os2EGPasueGbhMNWvNANJL6VHF0tGF1
 haRPd+lvNdRzk3JO6pZw3aqIzDWpOxjulSe6zeFSy95Lx7OLmnFNcaW741FldgeUXmgX
 vuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715171710; x=1715776510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGqJENKGu2VDw1JweApXY7Cnx0SgkltEUbGukf+76pw=;
 b=GZrvVwDHJUOODtNstwzjqysuERiB2ydZrosHe7CH+VD3zfc6oZvley6jw+i2SIZM4Q
 kiT3wNZtVHDGKt3OdXeO3Tx7/zt7TxeJcJLCJ/xwrnUKTxxsvjTACQBPd9ZZfuMV63WR
 g5z40nfJnHaq/IXf+5bFTec0o/tS4BBjJTV3xe8A6TTRza14FEX06gwcpNiNSBdXi+tc
 5gqvimGv7SqH9Wj3SZTc6/mYttJxjzm8WQUgplVeQuD80yrIzY2c32uAjPRxmuJ7qstX
 i1dQHRGZI8c5Ag1PB/Yb5OP/vusbX25Az7YbuDQQGHYb39q4s3wRILFImjzVdeW4cATT
 xNJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCBlOLmDtNGuInEQ6Re5dDbNnaqPgWb1HPbDiGqb/3ormbp09s/LsaPFyecCuKDlLtrz7YskaPx5IPat5+3Rk+ahQkZsR/yKXipIwxfJLxGH33AC1LbMBKeifQl3AJUNbd8+t8jiRyGXoRHDjAT2hdAU4=
X-Gm-Message-State: AOJu0YzWdZ8fGDdWvVtLlR0IMv1Vbjp3oIa+ZsPAqhFqTPb1IWf/EPsY
 C16bP5raf+XaAhei/n0LVfMiKHLyIyecP8JhsZnh5VCvHBLT8IAX
X-Google-Smtp-Source: AGHT+IGEhgoz0oL9QWFm1uMJ3wjDKHCYFTJDY7pYc8SqD9sY6qgDMaPrAs6eZsiz9jKDcFCAfaIogw==
X-Received: by 2002:ac2:4c2b:0:b0:51e:11d5:bcaa with SMTP id
 2adb3069b0e04-5217c56e432mr1461968e87.39.1715171709955; 
 Wed, 08 May 2024 05:35:09 -0700 (PDT)
Received: from [130.235.83.196] (nieman.control.lth.se. [130.235.83.196])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b0051f0225e0a4sm2492021lfe.227.2024.05.08.05.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 05:35:09 -0700 (PDT)
Message-ID: <b57f8ede-5de6-4d3d-96a0-d2fdc6c31174@gmail.com>
Date: Wed, 8 May 2024 14:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 David Wang <00107082@163.com>
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 spice-devel@lists.freedesktop.org, tzimmermann@suse.de,
 virtualization@lists.linux.dev, stable@vger.kernel.org
References: <20240430061337.764633-1-00107082@163.com>
 <20240506143003.4855-1-00107082@163.com>
 <ac41c761-27c9-48c3-bd80-d94d4db291e8@leemhuis.info>
Content-Language: en-US
From: Anders Blomdell <anders.blomdell@gmail.com>
In-Reply-To: <ac41c761-27c9-48c3-bd80-d94d4db291e8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 08 May 2024 12:45:38 +0000
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



On 2024-05-07 07:04, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> 
> On 06.05.24 16:30, David Wang wrote:
>>> On 30.04.24 08:13, David Wang wrote:
> 
>>> And confirmed that the warning is caused by
>>> 07ed11afb68d94eadd4ffc082b97c2331307c5ea and reverting it can fix.
>>
>> The kernel warning still shows up in 6.9.0-rc7.
>> (I think 4 high load processes on a 2-Core VM could easily trigger the kernel warning.)
> 
> Thx for the report. Linus just reverted the commit 07ed11afb68 you
> mentioned in your initial mail (I put that quote in again, see above):
> 
> 3628e0383dd349 ("Reapply "drm/qxl: simplify qxl_fence_wait"")
> https://git.kernel.org/torvalds/c/3628e0383dd349f02f882e612ab6184e4bb3dc10
> 
> So this hopefully should be history now.
> 
> Ciao, Thorsten
> 
Since this affects the 6.8 series (6.8.7 and onwards), I made a CC to stable@vger.kernel.org

/Anders
