Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E288BF7A9
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 09:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3E5113468;
	Wed,  8 May 2024 07:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KvvUOWbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F131E113468
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 07:51:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VZ6lv0ll0z9spf;
 Wed,  8 May 2024 09:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1715154683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seqGXW7fWjnxdTfmzUCRIjDohlKE9YFEMwzBlrsD9vw=;
 b=KvvUOWboNt1gLqyxi7HHWFVIEJEoREy4Lyw3eNMtTycPAtUOHCKfylR/+SGakz9tQsRsWj
 P5tdtWoHN3mZ4L/NQTCVQa3mG5vjEz4jbPWHB/sqrRy8ELoCb1EAgTWP7hmfdHWAL9EK4V
 dWkU3/NeXvdZO0C0UsKdYxJp7/KLHWuVnUPXWUr6nJzRlTsxW6wxGitGktjUkB7GGf1KSM
 WX9tC592UcG5FQ9+Uj+dVzh9Z5Vb+UVwMNji89xLZm2LbzW+SxD9jYstAM50q722ksvZLv
 r7Kd89iS+1Zta7mZzfExJBUH7c4xj99CxFMonw/Rclw83vRIBF+eYqtbkSrKcA==
Message-ID: <36169520-56e4-4a01-a467-051a94c7f810@mailbox.org>
Date: Wed, 8 May 2024 09:51:19 +0200
MIME-Version: 1.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 keescook@chromium.org, axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <d68417df-1493-421a-8558-879abe36d6fa@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <d68417df-1493-421a-8558-879abe36d6fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9swp1jw5c6zi83pbktm1xw4d3s3f1o5r
X-MBO-RS-ID: b22b617ddbdc3eec153
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

On 2024-05-07 19:45, Christian König wrote:
> Am 07.05.24 um 18:46 schrieb Linus Torvalds:
>>
>> Just what are the requirements for the GPU stack? Is one of the file
>> descriptors "trusted", IOW, you know what kind it is?
>>
>> Because dammit, it's *so* easy to do. You could just add a core DRM
>> ioctl for it. Literally just
>>
>>          struct fd f1 = fdget(fd1);
>>          struct fd f2 = fdget(fd2);
>>          int same;
>>
>>          same = f1.file && f1.file == f2.file;
>>          fdput(fd1);
>>          fdput(fd2);
>>          return same;
>>
>> where the only question is if you also woudl want to deal with O_PATH
>> fd's, in which case the "fdget()" would be "fdget_raw()".
>>
>> Honestly, adding some DRM ioctl for this sounds hacky, but it sounds
>> less hacky than relying on EPOLL or KCMP.
>>
>> I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
>> too, if this is possibly a more common thing. and not just DRM wants
>> it.
>>
>> Would something like that work for you?
> 
> Well the generic approach yes, the DRM specific one maybe. IIRC we need to be able to compare both DRM as well as DMA-buf file descriptors.
> 
> The basic problem userspace tries to solve is that drivers might get the same fd through two different code paths.
> 
> For example application using OpenGL/Vulkan for rendering and VA-API for video decoding/encoding at the same time.
> 
> Both APIs get a fd which identifies the device to use. It can be the same, but it doesn't have to.
> 
> If it's the same device driver connection (or in kernel speak underlying struct file) then you can optimize away importing and exporting of buffers for example.

It's not just about optimization. Mesa needs to know this for correct tracking of GEM handles. If it guesses incorrectly, there can be misbehaviour.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

