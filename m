Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D93DF0B2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 16:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849476E87C;
	Tue,  3 Aug 2021 14:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4AE6E203;
 Tue,  3 Aug 2021 14:49:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so20907428ott.9; 
 Tue, 03 Aug 2021 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZH2nIiiSnakY3FpS+wMVMs/uCUmksAAV/3YZm7bqsOY=;
 b=rZ4Q93WKcb8SdHFSMM/rNBR0ZsBlSoZE4udCGLC6cH7H8DBdCCAw/EJBUSXS58Dv7D
 k2tal+SHQdxQndFpVNoZkND/WGGp3xIbhQU+Ba5sZMtoXJcJ8w+G3RMWLFLPI4RRiY+t
 loWNOOElrWBd13mQHhk4Q0NjJTFzxtoITIZ7GW/EjdFs6J9xEiNuK32EkCZvpvtwbokt
 kVFReNqCSwTnUJwUJrMcik5OxG00bvzGMcJOSfOBcRz8Rznii6oMTCfg+Q6ZTfIDsjr1
 UpCXCc593V5KBu/sg7ekFg0zp+4osuW1p63D14vcWIm0T13uVCo72qU0eW5Wk0Tas6qg
 txSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZH2nIiiSnakY3FpS+wMVMs/uCUmksAAV/3YZm7bqsOY=;
 b=Nm5T66QOQSU6pLbjhYfHqVBCnRHaxqrbJlUUrj79uu4XsbuNMlsCOS21Q+e+0TkSRx
 TsHZ5SaOSTQ5S3jNF/vTqgZzew3S446qoVMj0IIvDcvMSxRwHGYsiuzGMxvfizT0BvnV
 d98001Fx7apZrVynxDKoQfHOmgOjJa0Wpn2TIPc90G/52wStrqDlXYw/TMZPc74bXTCC
 FGG+mAtutQla9SY5hB3RerMActfJ3pPHvP+p8MDeKkVQn541NjImoQbFrJRgI56Nm5dV
 vKxcLXBaNxMBAjk1zV3GTZiLwztubyPWiovoZWrgHeQ2fjX/rerxd1J1QpazEtJgq5k4
 vzUw==
X-Gm-Message-State: AOAM531u8yWsKEqRpxSgf5cOptfMrhJTdWKcOufPR2qRlbp4ZDLt1zyh
 RvbgC9TKMlmfLRHnOrk9QgpbSatzlcCQbGNl6RM=
X-Google-Smtp-Source: ABdhPJwn0Rpz9mVkqCTZg2eV64Hl7ywnveTNQNlZAFzS8iSiYVDBfBemH1xzSX8yv8Q//ZvG3gOoeEUUWn3a+khsHK0=
X-Received: by 2002:a9d:2072:: with SMTP id
 n105mr16305204ota.132.1628002190755; 
 Tue, 03 Aug 2021 07:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802074310.1526526-1-lizhenneng@kylinos.cn>
 <e6e77cfb-4e6b-c30e-ae7c-ac84b82c9a75@amd.com>
 <YQetXMaASz/F2EyS@phenom.ffwll.local>
 <CADnq5_PDtEn1y5HJBRHXw8o11LVwSRDKNtQgZtN5u0CW5ZspnQ@mail.gmail.com>
 <6a34fcc3-0aa3-85ff-21c4-86b9b5a48fd5@daenzer.net>
In-Reply-To: <6a34fcc3-0aa3-85ff-21c4-86b9b5a48fd5@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Aug 2021 10:49:39 -0400
Message-ID: <CADnq5_MJ=m2_VvzCQ7wJaFx2=OfFfLpoJtc_Ofb+a-v3eujtXg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Update pitch for page flip
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Zhenneng Li <lizhenneng@kylinos.cn>, Alex Deucher <alexander.deucher@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 3, 2021 at 4:34 AM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:
>
> On 2021-08-02 4:51 p.m., Alex Deucher wrote:
> > On Mon, Aug 2, 2021 at 4:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>
> >> On Mon, Aug 02, 2021 at 10:12:47AM +0200, Christian K=C3=B6nig wrote:
> >>> Am 02.08.21 um 09:43 schrieb Zhenneng Li:
> >>>> When primary bo is updated, crtc's pitch may
> >>>> have not been updated, this will lead to show
> >>>> disorder content when user changes display mode,
> >>>> we update crtc's pitch in page flip to avoid
> >>>> this bug.
> >>>> This refers to amdgpu's pageflip.
> >>>
> >>> Alex is the expert to ask about that code, but I'm not sure if that i=
s
> >>> really correct for the old hardware.
> >>>
> >>> As far as I know the crtc's pitch should not change during a page fli=
p, but
> >>> only during a full mode set.
> >>>
> >>> So could you elaborate a bit more how you trigger this?
> >>
> >> legacy page_flip ioctl only verifies that the fb->format stays the sam=
e.
> >> It doesn't check anything else (afair never has), this is all up to
> >> drivers to verify.
> >>
> >> Personally I'd say add a check to reject this, since testing this and
> >> making sure it really works everywhere is probably a bit much on this =
old
> >> hw.
> >
> > If just the pitch changed, that probably wouldn't be much of a
> > problem, but if the pitch is changing, that probably implies other
> > stuff has changed as well and we'll just be chasing changes.  I agree
> > it would be best to just reject anything other than updating the
> > scanout address.
>
> FWIW, that means page flipping cannot be used in some cases which work fi=
ne by changing the pitch, which can result in tearing: https://gitlab.freed=
esktop.org/xorg/xserver/-/issues/839 (which says the i915 driver handles th=
is as well).
>

Ok.  In that case, @Zhenneng can you update all of the pitch in all of
the page_flip functions in radeon rather than just the evergreen one?

Thanks,

Alex


>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
