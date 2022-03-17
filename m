Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245F4DCB16
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6310E578;
	Thu, 17 Mar 2022 16:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841210E1C3;
 Thu, 17 Mar 2022 16:18:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so3447190wmq.2; 
 Thu, 17 Mar 2022 09:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L5IHFn00HIQl3H2oahnFXJb93x4vuq9jd0lMrLSC+gw=;
 b=Ls/9ZPI3hpUO7732o3igrqs51Xpv4GvP68O58CQ8GjmXfEnJ6GMa/Am8TYQ+Zs5kwM
 vGf3/hQStd46VBRsJjmJCWYSOyWJP0QKqV0j/g9Wwze5zApNFAERL3JA38SgMTaGSgfE
 go3hPmGYcIXYAQvHvLdZyAE5fryTPujQVMYDgfsec9zM4Nw7MBGddwvIY+2UivYJPs4H
 yYZkYeTFLbTshQgbaT9lbHx/4Q3PWIvlyvEbvnCfVGdIIVBvPar+SnbrOl93gWMUHp5A
 4yj9H+TSRBLSCYjYh2QvZlhglK0EOit+cVrlEG76p5Nxzv53ZuiNdm8w+uzUUE0Y3tRR
 eyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L5IHFn00HIQl3H2oahnFXJb93x4vuq9jd0lMrLSC+gw=;
 b=TbuOZ8oXyI7d9xKAFyrGNR+FlW5ulM0cj2OsF9CCjBgvLh8aKq9vEiXu+idcQ6p2Wd
 gihhy3mXzdaldT7einlBMzwbxvWlkCgaFwvmZB4lZeDjCsBBwDlQ3YPNTrkyq9g9AkoS
 C0JsVWTzsXLJJE9L7Rx6GYlO5It9A7O9sJDP/SuVrRJTRiUtUQxlg8uPK3L/9pItQhFI
 /EdWQH8cOGTbk1ZUCZrGpkG+EeObg3L/nr0OmCRBu9YUYgBc1M3JxTQA6a5ZjsZAM99g
 Zb5kiFoREwrVlRHMnmCCsFokvfNYxJ/4njL0VLSHbWdoz0YyI5LnCPe6RMbfEvMrZm3g
 Pp/w==
X-Gm-Message-State: AOAM531TxVAXpOKZesXqeNtStDsyvJ+JhJQqRfb5mllFL+5DusCLMui0
 XaRjLqHzoEKjKPDeMFPWFaDFmhMEpUXAGLw8Xwc=
X-Google-Smtp-Source: ABdhPJwkGq/5CPvt3nTPvujPGooqwvT4J7CIV95MTshngIddMgKWff9gdH47/BrlbvIZZ8VL73qS8xk2nbR/EyABuvQ=
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr12554136wmc.148.1647533882531; Thu, 17
 Mar 2022 09:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
In-Reply-To: <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 09:18:44 -0700
Message-ID: <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 9:04 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.03.22 um 16:10 schrieb Rob Clark:
> > [SNIP]
> > userspace frozen !=3D kthread frozen .. that is what this patch is
> > trying to address, so we aren't racing between shutting down the hw
> > and the scheduler shoveling more jobs at us.
>
> Well exactly that's the problem. The scheduler is supposed to shoveling
> more jobs at us until it is empty.
>
> Thinking more about it we will then keep some dma_fence instance
> unsignaled and that is and extremely bad idea since it can lead to
> deadlocks during suspend.

Hmm, perhaps that is true if you need to migrate things out of vram?
It is at least not a problem when vram is not involved.

> So this patch here is an absolute clear NAK from my side. If amdgpu is
> doing something similar that is a severe bug and needs to be addressed
> somehow.

I think amdgpu's use of kthread_park is not related to suspend, but
didn't look too closely.

And perhaps the solution for this problem is more complex in the case
of amdgpu, I'm not super familiar with the constraints there.  But I
think it is a fine solution for integrated GPUs.

BR,
-R

> Regards,
> Christian.
>
> >
> > BR,
> > -R
> >
>
