Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC160EF55
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 07:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59810E3FD;
	Thu, 27 Oct 2022 05:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0D10E2CC;
 Thu, 27 Oct 2022 05:12:44 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id g16so414496qtu.2;
 Wed, 26 Oct 2022 22:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmDiMYe/I0ri6Zj03hdpur3rJrgB7k+DhMOzSt5LxUI=;
 b=hM2tehQXR8rhpVF9g+WAkkYLHO2gza5eLp8A5C/rbyeAH+vIL+0k9xuLSF+aoysY0p
 IV1nDGd1W14gsvEe5BwPL4dUnIhQCffmmyoeMjIojAuiHXiHb+Ie5vwStIIBxDhNXewv
 /dltDWdPmrIJFQIVGWMHCocFEs0VnC/F9cURrfBBLE0LJlpgsCtACKSzUMBUYEZAI1sC
 6gwir6oqL+FXUXdWdrErNn2TE/QivqIgFJNw3nTSb/oyj/nkLCBNgtRKdyOawG3jRc7P
 3mpr8LC0Om5GHXwU7pticVUP/D2vnWd5uetBTwlf0SG8WY88g06v2iVV2BcZMezV/Ss5
 34mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmDiMYe/I0ri6Zj03hdpur3rJrgB7k+DhMOzSt5LxUI=;
 b=ygyob/Ww78DYLBJeQ+/2NxlcJqvaGOyViIve3tz/NgngFyFeXcjU6/yhkh010zc2IM
 jEmuh6MBU/haMWRmTF1HiaSVLRxueNQo1BQ+x8Oka7drJC7SWbAnaHjayFy0zW6vyMuY
 AOIDZn65ZzwDHnhgwlJBsfSz13q2av7XzhNmcW5bZbyAULTdS/UjMgyvIY3h1rm7TFed
 yJAh4Fy4EWhyXc6oIvb2m7nmZTS+t16dl2MmBSyv4V7Qv1NlbyOUcLZBKCFCEW1X6Dtd
 MRDQHoLQK/MiIfOy+PkiPtasDn8jnV6zFQa9JALzzrXN6RD9FlWybBcvugNR6u9sp3q7
 PwqQ==
X-Gm-Message-State: ACrzQf3YPnqKSVt1Me7dPOn28U/yNaojjHj95halgLeCb80qct6BwsAs
 rDq8k2n5M8lRKZaL8KdRpoxxzbc1WgcPN+wbw94=
X-Google-Smtp-Source: AMsMyM6aQPkWUzrcH5QcYJv7YBwmqFe1zX9SZ+R2FvqFrLBshlWiO4t1EvfUkMpXDGj/dS+trwAoMo7XaSKAjTAviUE=
X-Received: by 2002:a05:622a:164f:b0:3a4:f141:92fa with SMTP id
 y15-20020a05622a164f00b003a4f14192famr4761116qtj.447.1666847563200; Wed, 26
 Oct 2022 22:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
 <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
In-Reply-To: <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Oct 2022 15:12:31 +1000
Message-ID: <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Zheng Hacker <hackerzheng666@gmail.com>
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Oct 2022 at 13:26, Zheng Hacker <hackerzheng666@gmail.com> wrote=
:
>
> Dave Airlie <airlied@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=9B=9B 08:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, 7 Oct 2022 at 11:38, Zheng Wang <zyytlz.wz@163.com> wrote:
> > >
> > > If intel_gvt_dma_map_guest_page failed, it will call
> > > ppgtt_invalidate_spt, which will finally free the spt.
> > > But the caller does not notice that, it will free spt again in error =
path.
> > >
> > > Fix this by spliting invalidate and free in ppgtt_invalidate_spt.
> > > Only free spt when in good case.
> > >
> > > Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> > > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> >
> > Has this landed in a tree yet, since it's a possible CVE, might be
> > good to merge it somewhere.
> >
> > Dave.
> >
>
> Hi Dave,
>
> This patched hasn't been merged yet. Could you please help with this?

I'll add some more people who can probably look at it.

Dave.
