Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAC2DEC9A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 02:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D19C89F71;
	Sat, 19 Dec 2020 01:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9B289F75
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 01:17:11 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m25so10064224lfc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 17:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kqfzYZjd8v2qCtr+CwGBLV3Vs/0PzggZH8o2lrmVRy4=;
 b=ls5MoaMqVOyX5M6LeJ7eYoWXDLcSL2zNpvZdCh8SldBLA67re9nR3vHyOr9Kk845sS
 EL3Ta6jkQM+r9MiA76QGqXSQN9M8bA1OAzpN4vxrPndmuVcBUIDqzCLU7Ehrxhy/qkJ8
 lSr9P+WugopXsX7cQ6F0rx08k2CPzs0XNLdixfRVDsPviFrVwtFzuKu+r8QAMqrSxkGl
 yaZZDujJhyMeX5FDAax0n1odd8tQAmYwOy9ca8sfIeuoQdSrqYzTHZEik8Lcu8D3+SHT
 QB8WMkr44X6wnzsjCZgUeNp17FOX/Ftfku/Ea+p9go1GbGHfSlfrj7dub0jmJpY2g/1A
 5hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kqfzYZjd8v2qCtr+CwGBLV3Vs/0PzggZH8o2lrmVRy4=;
 b=jTJmuoo1ed9/1hCICMtEEIRmUKcF7zXYdI+3g+7bb/lTpX7crkEM5nbf817i6ARUxh
 ek4qhOoi4xHhIW3krm3fCihJpnErVKq8OWqqGjq0tK5zdxCLdiP0iS2PhqCZPdmPVsMH
 /rOALFQAfXdhG0I+0fZedGBGB0Mf1CBHeu+LzuHaiGnKn4mSWQMN7FNTvhRzjI/wYIIU
 r7AduLPN4Nkei1db8ryOqBeoFauwlUQLiwSC3lBEd9HmP3jzo34vnWcFd9Oq0+9vD/j/
 NK5aKGUUnefnNeLTMRUeDetyX5o/mp4UV6h2zgwXrum4sWQo0Sc4GKko0XL5BPUqj8Co
 y2Rg==
X-Gm-Message-State: AOAM5300U80MeH8PwWQ3yxORVQI1vDFM30DnSVFMkj/DKhGKsM7DtYEd
 a5J5oNAh9u+IJlUpEidK1HzwdOyCydsqQy4rgsM9Jw==
X-Google-Smtp-Source: ABdhPJz8IyC9TNugB6b1jNzXWdqS4aLXJgFDsDKLMZm3d17IGbYv/wBtt5j26wi/EUUufPG4L1ZhUKiFX7ma0puzRyg=
X-Received: by 2002:a05:6512:6c3:: with SMTP id
 u3mr2309354lff.204.1608340629119; 
 Fri, 18 Dec 2020 17:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
 <X9y+YZujWBTHMuH3@phenom.ffwll.local>
In-Reply-To: <X9y+YZujWBTHMuH3@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 18 Dec 2020 17:16:56 -0800
Message-ID: <CALAqxLVtYVGSSYtFmMK6oM9JSEmY4RAXra89sECL2Z4YGPic0Q@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, 
 Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, 
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Daniel Mentz <danielmentz@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 6:36 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> > Reuse/abuse the pagepool code from the network code to speed
> > up allocation performance.
> >
> > This is similar to the ION pagepool usage, but tries to
> > utilize generic code instead of a custom implementation.
>
> We also have one of these in ttm. I think we should have at most one of
> these for the gpu ecosystem overall, maybe as a helper that can be plugged
> into all the places.
>
> Or I'm kinda missing something, which could be since I only glanced at
> yours for a bit. But it's also called page pool for buffer allocations,
> and I don't think there's that many ways to implement that really :-)

Yea, when I was looking around the ttm one didn't seem quite as
generic as the networking one, which more easily fit in here.

The main benefit for the system heap is not so much the pool itself
(the normal page allocator is pretty good), as it being able to defer
the free and zero the pages in a background thread, so the pool is
effectively filled with pre-zeroed pages.

But I'll take another look at the ttm implementation and see if it can
be re-used or the shared code refactored and pulled out somehow.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
