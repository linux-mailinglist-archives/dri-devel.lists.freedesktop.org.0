Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978E1D2888
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC926EABB;
	Thu, 14 May 2020 07:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8566EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 07:08:36 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 19so23717770oiy.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biA9r0T5Sv8YCx33FWjEpY/1dzcGIkDdNQS4u+MoouI=;
 b=RagWkUEEVxT3M0/6JygfpeHFqxjNSK9bLGwanXl+yLlMcDld9yavXpnYjhC9HsYTyt
 IpbbT6bHMaMd2f9vY6YNn+nUwDS2OMydKVzTrB2VzDs5z9m/uiV2W+qu69XkVhRE9U/D
 JCKPy6/hBAHyVbbUSJo1VFF3mcNxHW3TBhsy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biA9r0T5Sv8YCx33FWjEpY/1dzcGIkDdNQS4u+MoouI=;
 b=WOdOhoPTn/vNO0W27ajohzs7AARkjIdzTMbqs+eH1nW+NU6D//MisFYGjEcDoOb/d8
 k8FtPvd/l74LHTHfOi4IYEL1csg9Yl4DsJoFlSSZWw3kqhJvGeRpseflFroupM3x+9Ze
 7tDTNHMt10E9FUWJOM2yDUPjdKWOYda0+OLjgPoc1Ps+CalF/VeCc5BzoXEsj+pvOx/V
 c8rGifarTeTyzqc/eKVMlPfJe8W/8apelfkjhy3X2ZZ9EcoQBhwJUJu5DUYKx8vNX2U3
 P/S6yOCGI/iMnTPUxwO7AOngYnVzBT/SQA8XM4kOfOG1hn4TE584P+GGfTg+UvPfM6NN
 A1/g==
X-Gm-Message-State: AGi0PuZykm8wnWQNGniAVBQ4Sns1QRMcUHj23+A9jqyOKv6uyd5YyGuK
 slN/eiiFj9fjUZy/i4lamRWXp1jW4vyUNacWjTI6tw==
X-Google-Smtp-Source: APiQypKJ6btuyR96uWgPEvWVBRFi5eTdiYG7q16E+P138IuV2y8xg7pd1Cxf/tBRYAklxwLz52LrYL47V81D1ObHYgU=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr11137374oia.101.1589440116176; 
 Thu, 14 May 2020 00:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
 <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
In-Reply-To: <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 14 May 2020 09:08:24 +0200
Message-ID: <CAKMK7uFU7ST9LWmpfhTuk1-_ES6VU-cUogMnPjA15BWFsEVacw@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 8:42 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Wed, 8 Apr 2020 at 17:24, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > Resending because last attempt failed CI and meanwhile the results are
> > lost :-/
>
> Did anything happen with this?

Nope. There's an igt now that fails with this, and I'm not sure
whether changing the igt is the right idea or not.

I'm kinda now thinking about changing this to instead document under
which exact situations you can get a spurious EBUSY, and enforcing
that in the code with some checks. Essentially only possible if you do
a ALLOW_MODESET | NONBLOCKING on the other crtc. And then tell
userspace you get to eat that. We've been shipping with this for so
long by now that's defacto the uapi anyway :-/

Thoughts? Too horrible?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
