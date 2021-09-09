Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5C405AE9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EBE6E8B8;
	Thu,  9 Sep 2021 16:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD5B6E8B8;
 Thu,  9 Sep 2021 16:31:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x6so3385705wrv.13;
 Thu, 09 Sep 2021 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+0jFX+c9As4mGNIOMW4VKBlVBkjOIBw3KEyFedYOaI=;
 b=bbFcCygdOWBh3I3p1p2h3+WeDK8qco4C6NmJcfldjivlawaHz7aMOiMt8tR6Ty5xYr
 vFIMdU+u7QOzp2X6Z7EGAQ/SFyr7BKtd5WYfUkWSQ2Ava5SM/tHdgE5fRjgJJxib5ke4
 9QTWO2YtVY+iq1ykq9E9y12HG20+qdvptEv8mRNmSerDF70CMHafid7rHTLd9JDZOZXB
 6poQ3PgFmrZnaIbAes1l1NiiSYSNzbSLSNRwGPZXLcF4SeIH/Gfp1VUnBYI1HTlW9398
 R1Bc3c3BGH3fmESVlZvXOO+9UdyQJ6Kh+pj1aettYb/7OahVLOuhR2ooRP2zky/oQLsZ
 TotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+0jFX+c9As4mGNIOMW4VKBlVBkjOIBw3KEyFedYOaI=;
 b=1/tp4e5jbUvIgOO1WnkPacFf3SmtPOggAWv3+rGTShv6HmLwAETNj7XeWmddaf5sdP
 LhOwT3rIzdFesiClOeqHjgBJA8FJCg8Fm+qqvtDEPK8uy7LuWvEA0R6iLyR0QUTnOChH
 Ox/ptaktSY6kbAKP86fe7Ktfs2URgsRFo4ag6BxG9eDcs2Zyc4sZiawTJp47KEmTKjxz
 yLzVDh/VDBvsp0p009Sq+YPXI7xKWCODlpDjXy3cOr6r9GcowdwqKei6mJ2+5RR3ccgF
 q3d07tffnb+NCuV4oQnBNWHB5vIUDv9qScbw+1DDROz3soDkgeb0StXytJZgV+/AT0LZ
 XKvw==
X-Gm-Message-State: AOAM533oUbJFlSNQqF0x4YcOqkT2don0EVb0CYIsnnUX+LAGuSeGnivC
 qnUZVoUuvF9Q3n54z3IibswMf7EDKIaIMFbMO7Y=
X-Google-Smtp-Source: ABdhPJziNKyewTTtSu5pziJeaODH5nE8F9cT5n7HbZ3pWAcwqx9wKwmPdZrhzS9wqwHAw5W+ht5QMcC2TK8ie1veLgk=
X-Received: by 2002:a5d:4488:: with SMTP id j8mr4732581wrq.260.1631205063988; 
 Thu, 09 Sep 2021 09:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
In-Reply-To: <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Sep 2021 09:35:31 -0700
Message-ID: <CAF6AEGuD2bnFpmSWtGxU5+AFj1HVKtnOZmLKRr-pDVbLn0nPVw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] dma-fence: Deadline awareness
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>, 
 Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Sep 9, 2021 at 9:16 AM Simon Ser <contact@emersion.fr> wrote:
>
> Out of curiosity, would it be reasonable to allow user-space (more
> precisely, the compositor) to set the deadline via an IOCTL without
> actually performing an atomic commit with the FB?
>
> Some compositors might want to wait themselves for FB fence completions
> to ensure a client doesn't block the whole desktop (by submitting a
> very costly rendering job). In this case it would make sense for the
> compositor to indicate that it intends to display the buffer on next
> vblank if it's ready by that point, without queueing a page-flip yet.

Yes, I think it would.. and "dma-buf/sync_file: Add SET_DEADLINE
ioctl" adds such an ioctl.. just for the benefit of igt tests at this
point, but the thought was it would be also used by compositors that
are doing such frame scheduling.  Ofc danvet is a bit grumpy that
there isn't a more real (than igt) userspace for the ioctl yet ;-)

BR,
-R
