Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC445530C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 04:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A44A6E15D;
	Thu, 18 Nov 2021 03:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1186E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 03:03:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso6423904wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 19:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1Qz+V3K3Jksfqej8nEpPEPFrzfzFj9JiT2S5nQ8uNbc=;
 b=UZOWTMfuyZhOBCehUvrAeCiyBw2Azdvn8DQZqXnC4HLO0IYN8ugoU+HiDV2VV/7kaM
 8U3YFHVvIYFEehBnBww+q31XlwnE5XDL0u6M8Fk8UOPOJeueFp0sstpRyE0LmQ750mYr
 RK9S3AWVPUqjRLxvOEV2IDyomjasQgp2OaxsgGq4pul1G/xKJH1l8LYKLEdinv+t1HVp
 6X0g4zp+du0aLo8//OlvCLSMYAL+yFxNYTXs/m/bQMZ3Q2rMLIdUqK6UMEsp8yni+tZ7
 5HJXzEaYCYUOzGD5nfoRRH8wfSFvnTgt5G0MNWZF5TykY0zIxFH/77IxqIWNxthmTWPl
 ZjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1Qz+V3K3Jksfqej8nEpPEPFrzfzFj9JiT2S5nQ8uNbc=;
 b=lZIasnEDAApEBC0IWG9WTEFb9I2AlkVSGlBJbmtaGcFs1EAnTOEduEmTMGSoDrmTNr
 DuxsyBXB3g8fcQ8cYL/MbjoCAOIPptUHN8xdK4BkoFpg+DBpOEDk61Fz6/oMHb55sUsz
 3yW6XdfxuytlxBeEEtTkHCSRrzEQaRwWCg0COosJJlqDugb8FbUsCr8UsPgielfSNiLb
 LhkB4t8mJx66ViabEjIUZXSktoQF9pD2Vb+m1IqAa3bYwB4K1wa+Sm0B7NUsHh3hBZmh
 taoMcLYEwYrzgx45P7JaXQgxxAjilhAIKvMC32fyqBkaHyMWlVMSlxBDWEVmKEncPCk8
 KAjA==
X-Gm-Message-State: AOAM532pgBRbdyHqBxP7nEjkJQwiGwSsaQgsMYsACLAH9kOXYxpqS7cg
 scYxI3z8dBkKLbWeVMLMBxqCFeakemVpw+wy1dw=
X-Google-Smtp-Source: ABdhPJx8Xlp6S7AiTuL2eIdl+8AZ99KWbfNyE3RkFuMg/d8USbutdueU46HvWo0rcK6JNYZnSs79Onz15otq7Iumzac=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr5960771wme.101.1637204636805; 
 Wed, 17 Nov 2021 19:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20211116155545.473311-1-robdclark@gmail.com>
 <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
 <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
 <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
In-Reply-To: <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Nov 2021 19:09:00 -0800
Message-ID: <CAF6AEGs1hmS7hNC+OOvy=eHjvYhk=GLFX5T9iHWO=PUvGxNyDg@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
 harder
To: Steev Klimaszewski <steev@kali.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 5:23 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 11/17/21 1:27 AM, Christian K=C3=B6nig wrote:
> > Am 16.11.21 um 19:30 schrieb Amit Pundir:
> >> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> drm_sched_job_add_dependency() could drop the last ref, so we need
> >>> to do
> >>> the dma_fence_get() first.
> >>>
> >> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
> >>
> >> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> >
> > I've added my rb, pushed this with the original fix to drm-misc-fixes
> > and cleaned up the obvious fallout between drm-misc-fixes and
> > drm-misc-next in drm-tip.
> >
> > Thanks for the help and sorry for the noise,
> > Christian.
> >
> I've run into this splat on the Lenovo Yoga C630 on 5.16-rc1 - are these
> 2 patches (which fix it) going to be heading to 5.16 or were they
> targeted at 5.17?

these should be for v5.16

BR,
-R
