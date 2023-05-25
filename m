Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62F711AD4
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 01:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B563610E78C;
	Thu, 25 May 2023 23:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5D10E789
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 23:46:52 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-76c64ddee11so6923939f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685058409; x=1687650409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Htw4nkYum/XmDD/N1bSJsosNibiwjxmXXyPI7uL2NA4=;
 b=VfCE4ZJJlB4D/+QFAw5iozjNPO9JR2GcIrd206cWRbvW+s3GFIul5pXQAmTjFJFM5W
 O9k0hBQ6vbl+qwL7HsNTOgiFeZGGAQ7hInMk0Anc5tefx4elOo95i6MH0VK7iRwJYLua
 LD0FbSusoGJpw8Gs5gciDCjNvvtdDKzdDPADg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685058409; x=1687650409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Htw4nkYum/XmDD/N1bSJsosNibiwjxmXXyPI7uL2NA4=;
 b=DZqHrUD0rQMkq5raIFJvruGISuKTziu7FQ+f4E9m0pf8gY7/hgSaSnyJ7+sZYBysv5
 uyOc+R0742Fnh+nsAaTrDlcR2TLvdf9tpyxLGyWXsUm8TMrtIOWpTv2EsZ+mmC3f8rhy
 npuaVPht47jvQ//hSpEx8kHA4JTm6MEEfwwpe/81utLK4tAT80bDqyQVTGFItvcgkVvp
 uATiM57HE+LywVy8YZHstE6PRGFtPcM2zhdjVp+Dd8NYoaHKz4sRJF/T+kFGRlcddcLi
 IrB+7DMu4mFmxlKXr52aI66CA1k97wvyAkigb3y18Az/JxjDmcLkhB/EdlVdGutCHXsY
 Ggrw==
X-Gm-Message-State: AC+VfDwJasz0h3kK6iiOfXk/7VzkInTBpP0LejL7wop3/2/gB88/ZwlQ
 Fv+jwNg9AUSfI6EingjzmH3+QCcjCRbjcdBSwFE=
X-Google-Smtp-Source: ACHHUZ73dgOEmOeVfbWfPrRi7nxL+aJR5h0Hpxbjx7vvqEFy4v3C4S1D9xa40aPz1DuDs5LC1hF+8Q==
X-Received: by 2002:a92:d4d1:0:b0:330:c21e:5a3e with SMTP id
 o17-20020a92d4d1000000b00330c21e5a3emr65473ilm.12.1685058409655; 
 Thu, 25 May 2023 16:46:49 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056638113000b0041abd81975bsm720329jar.153.2023.05.25.16.46.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 16:46:48 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-33a8f766b64so32055ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 16:46:47 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a05:b0:33a:e716:a76f with SMTP id
 s5-20020a056e021a0500b0033ae716a76fmr1067ild.29.1685058407162; Thu, 25 May
 2023 16:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230419154321.1993419-1-markyacoub@google.com>
 <0c702f15-c842-8eab-cc95-83378236773c@linaro.org>
 <ZGfnNBRUN72IXRjy@rdvivi-mobl4>
 <27b4bce7-2f63-9199-71e6-4ed52a96d0c1@linaro.org>
 <ZGtnH5YJ8u6bMo4j@rdvivi-mobl4>
In-Reply-To: <ZGtnH5YJ8u6bMo4j@rdvivi-mobl4>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 May 2023 16:46:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XGNEkPiqvu0qwXkFk-0umz2gZ1GGdQN0DfbWFZh8td8A@mail.gmail.com>
Message-ID: <CAD=FV=XGNEkPiqvu0qwXkFk-0umz2gZ1GGdQN0DfbWFZh8td8A@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into
 helpers
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Mark Yacoub <markyacoub@google.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, suraj.kandpal@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark,

On Mon, May 22, 2023 at 5:59=E2=80=AFAM Rodrigo Vivi <rodrigo.vivi@kernel.o=
rg> wrote:
>
> On Sat, May 20, 2023 at 02:07:51AM +0300, Dmitry Baryshkov wrote:
> > On 20/05/2023 00:16, Rodrigo Vivi wrote:
> > > On Fri, May 19, 2023 at 07:55:47PM +0300, Dmitry Baryshkov wrote:
> > > > On 19/04/2023 18:43, Mark Yacoub wrote:
> > > > > Hi all,
> > > > > This is v10 of the HDCP patches. The patches are authored by Sean=
 Paul.
> > > > > I rebased and addressed the review comments in v6-v10.
> > > > >
> > > > > Main change in v10 is handling the kernel test bot warnings.
> > > > >
> > > > > Patches 1-4 focus on moving the common HDCP helpers to common DRM=
.
> > > > > This introduces a slight change in the original intel flow
> > > > > as it splits the unique driver protocol from the generic implemen=
tation.
> > > > >
> > > > > Patches 5-7 split the HDCP flow on the i915 driver to make use of=
 the common DRM helpers.
> > > > >
> > > > > Patches 8-10 implement HDCP on MSM driver.
> > > > >
> > > > > Thanks,
> > > > > -Mark Yacoub
> > > > >
> > > > > Sean Paul (10):
> > > > >     drm/hdcp: Add drm_hdcp_atomic_check()
> > > > >     drm/hdcp: Avoid changing crtc state in hdcp atomic check
> > > > >     drm/hdcp: Update property value on content type and user chan=
ges
> > > > >     drm/hdcp: Expand HDCP helper library for enable/disable/check
> > > > >     drm/i915/hdcp: Consolidate HDCP setup/state cache
> > > > >     drm/i915/hdcp: Retain hdcp_capable return codes
> > > > >     drm/i915/hdcp: Use HDCP helpers for i915
> > > > >     dt-bindings: msm/dp: Add bindings for HDCP registers
> > > > >     arm64: dts: qcom: sc7180: Add support for HDCP in dp-controll=
er
> > > >
> > > > Dear i915 maintainers,
> > > >
> > > > I wanted to ping you regarding this patch series. If there are no c=
omments
> > > > for the series from you side, would it be possible to land Intel-sp=
ecific
> > > > and generic patches into drm-intel tree? We will continue working o=
n the msm
> > > > specific parts and merge them through the msm tree.
> > >
> > > pushed to drm-intel-next.
> > >
> > > should be propagated in a few weeks to drm-next on our next pull requ=
est.
> >
> > Probably there is some kind of confusion here. You've pushed the DSC
> > patches, while the response was sent to the HDCP series.
>
> I'm sorry, my confusion for replying to the wrong thread.
>
> So, on this one here I believe it would be helpful if there's a split
> in the series with the already reviewed ones related to i915 are resent
> separated from the rest, send with --subject-prefix=3D"CI" so when that
> pass CI we just merge it through drm-intel-next

It sounds like this is waiting on you to post just the first 7 patches
with the proper subject prefix so they can land through the Intel
tree.

-Doug
