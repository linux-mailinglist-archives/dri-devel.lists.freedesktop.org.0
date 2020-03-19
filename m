Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6F18B18F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F76E9FA;
	Thu, 19 Mar 2020 10:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8A6E9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:34:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f3so2145566wrw.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+HsihkrBV/Vt2ATCPXC+nbaVsuM4g0AQNEdfwqBce2w=;
 b=i7ytroA6IFoY56neWMQRdmqsJF+XwgwP0QuMdAXb+b8Q67dIexlUI2biFAF1sa/cmN
 mtAdTS8M7LC92pRr4HjTcfkPryjW+itGJiwyqYg/+YXjRWjOdB6hL2YEEiBPiWu+ao17
 Z9mjkmydrTqqMr2ZiD3kd+3XxNA5AuDs+uPPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+HsihkrBV/Vt2ATCPXC+nbaVsuM4g0AQNEdfwqBce2w=;
 b=M1frhDgubj2dm1NfeJR1BIcW1/cqp3ippKEKmRckq3oeEuMwraTetIVDcUdrMtO4ML
 vnRjlqDGQ653v4J4uncpmbsoQj1x5heDtWu2VhPwOt6xvbhA/yhF7T6VjZN+yOeTjcS+
 b43BdkkKMTRVJuLEJYV8yhu9XnG3j+5joSyv7a5d3JpGVYzjGpMSCsa+MPPmrxqZONCk
 8g+WEIdcXI2+BltYlNrfAo+PhMe8r9+loM3cwKYov+syO+/MnmzkkgxXpYnHhMhoXCln
 McBNR7snOV6sVuEGC1LoDQWMqhTHjcyVlG1nBJZhyfM01mL5ebEXA5jK9U24VJg058uu
 kQcw==
X-Gm-Message-State: ANhLgQ0RZ+41Q+/dAxCHmvkPc6oAFzZ85zI+h7dPBGMMsAdzFJltpHBw
 VL/5B7ghFlSIK6FjZfQAjW5EzoTOcViF1wLn
X-Google-Smtp-Source: ADFU+vsMVI1BEcGQKKKo+aVa8NuKFNjePiIKK/z1ToX/o3DCKebfP+Mg2xY266tS9kf2MfW9je6Bjw==
X-Received: by 2002:adf:e891:: with SMTP id d17mr3387478wrm.348.1584614082081; 
 Thu, 19 Mar 2020 03:34:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h12sm1550335wml.12.2020.03.19.03.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 03:34:41 -0700 (PDT)
Date: Thu, 19 Mar 2020 11:34:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
Message-ID: <20200319103439.GC2363188@phenom.ffwll.local>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe94vX5CMyjs8jehXj3f7t9yu__=-N+etNz5eY7sqwqb-jA@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Jacob Lifshay <programmerjake@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 12:18:47PM -0500, Jason Ekstrand wrote:
> On Tue, Mar 17, 2020 at 12:13 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
> >
> > One related issue with explicit sync using sync_file is that combined
> > CPUs/GPUs (the CPU cores *are* the GPU cores) that do all the
> > rendering in userspace (like llvmpipe but for Vulkan and with extra
> > instructions for GPU tasks) but need to synchronize with other
> > drivers/processes is that there should be some way to create an
> > explicit fence/semaphore from userspace and later signal it. This
> > seems to conflict with the requirement for a sync_file to complete in
> > finite time, since the user process could be stopped or killed.
> 
> Yeah... That's going to be a problem.  The only way I could see that
> working is if you created a sync_file that had a timeout associated
> with it.  However, then you run into the issue where you may have
> corruption if stuff doesn't complete on time.  Then again, you're not
> really dealing with an external unit and so the latency cost of going
> across the window system protocol probably isn't massively different
> from the latency cost of triggering the sync_file.  Maybe the answer
> there is to just do everything in-order and not worry about
> synchronization?

vgem does that already (fences with timeout). The corruption issue is also
not new, if your shaders take forever real gpus will nick your rendering
with a quick reset. Iirc someone (from cros google team maybe) was even
looking into making llvmpipe run on top of vgem as a real dri/drm mesa
driver.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
