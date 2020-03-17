Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1711893B5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703BD88E9D;
	Wed, 18 Mar 2020 01:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5288918E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 22:33:45 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id o127so10416105iof.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvAdYw4fS600A+JVAE7LKPXcNd9T31jIcg4Py5krm8Y=;
 b=TPRW99hAnWE2ZGh2vmb9HTczhiq9tUQTqVf+sC5gMSeQsLZMFwNEJ0pR4+3TgaO3v7
 XdD4oH3K4ujfB8WRxvraLywLrKvh135aAWiJJW6TASkZY4zn+EheNAnWb1nb47pynNRn
 yOC7v/wQXx+TBPbhPEMmBdMyWCmVqOJf+JmfBVIcmIYPJEZyav+ED/xQlUsOTCLA/OYp
 YzJNymWevujGb/qDCCvrrn0b/WWjVaX7G4ZEyZEO/oPXngBPSGyNybe+1kt6cTg4TwGD
 bd9I4S2beWK0J5/5KoS7Cou36/XlHtlmRmrNryTGqPW5PxNMS0mc0+w0BrmvRo0dwnM7
 KvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvAdYw4fS600A+JVAE7LKPXcNd9T31jIcg4Py5krm8Y=;
 b=fJi8kiMVhMJ1hlNFFsjpxFxvoPjnM6UhvnMNtCt/2oHcucO6itoAdjNhdaP7jz64sQ
 hqPpPIXf45/NnsG0uHqt7ts0xB6c8kN7CBOL/rVbUSikegQlh8nGBev+lnSmQrVM0MAo
 9GJhDaDo30W+oqpKE+gLOFzIxeRxYwmGvOkF4++7+pdCGcmC54yzjYrIFpH1jZqZ/Gkd
 fkRFQaElbG2Mbr4t4KuK+H8nJwg0PEzgnxAWd04v5dm3q/vqlj30W/OqNJ45xGESCUAW
 PepTTXYPfLJ0T0DLoVYVNEiB9Tk3CDfGuS4NvdIsVyx4zXP/eTsEps1FkCSdT7t1mBO6
 ncRA==
X-Gm-Message-State: ANhLgQ1PTdVS5CdavxX6SA4WAI0F+seEi2VQ9Z/i0sJwbAR8+a5dTJ1+
 3nfNnRhyR142ZCd0Eh0i3QuM0c111jEL5RGXINw=
X-Google-Smtp-Source: ADFU+vvlF5toJI/zhtnaIq6lXpuTA5F/A4opcD1BwMtyA0nytsNRJyZcOxOMGLkC0gc1fnlWiibOQo0iltl5EAmBbEU=
X-Received: by 2002:a5e:990f:: with SMTP id t15mr985272ioj.153.1584484425016; 
 Tue, 17 Mar 2020 15:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
 <20200317170243.GR2363188@phenom.ffwll.local>
In-Reply-To: <20200317170243.GR2363188@phenom.ffwll.local>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Wed, 18 Mar 2020 06:33:34 +0800
Message-ID: <CAJRQjofSWYR--4V_4zmp6K9WVtqShdzpGuH1VFBPvHpViGYH5g@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
To: Qiujun Huang <hqjagain@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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

On Wed, Mar 18, 2020 at 1:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Mar 16, 2020 at 03:18:23PM +0800, Qiujun Huang wrote:
> > We should hold idr_mutex for idr_alloc.
> >
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
>
> I've not seen the first version of this anywhere in my inbox, not sure
> where that got lost.
>
> Anyway, this seems like a false positive - I'm assuming this was caught
> with KCSAN. The commit message really should mention that.
>
> fill_object_idr creates the idr, which yes is only access later on under
> the idr_mutex. But here it's not yet visible to any other thread, and
> hence lockless access is safe and correct.

Agree that.
Thanks.

>
> No idea what the KCSAN complains about safe access like this best practice
> is.
> -Daniel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
