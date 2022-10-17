Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1936013F6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 18:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC8710EDA9;
	Mon, 17 Oct 2022 16:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460A10EDA9;
 Mon, 17 Oct 2022 16:52:22 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n83so12749920oif.11;
 Mon, 17 Oct 2022 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1LwX5bRFQXNkq6PB+GJkYIHW1maFFhRT+npXlh3EBU=;
 b=Wli2+vCUPK20VH6qBK0/9u0+D86Cprn715QA3rGfohk6lLxfaKQ/gr2fBPGeUKivfV
 9scv3keMMR40vWDmdGPV9mBFqcrR3IHAjiKgk9g2HFz+2GzmZeYm2V80n+MJ78WVfpcT
 yeYzVTE/N/xMeay1FUkdDXp4VjEEugswL6+/mgtjc3koOgAHsXFOFPuqyxYHHSkwavDv
 C+M6uSoIBnLjtzFoB6Ioq0cJQ0heFLwsSXacVrlHTrT1UMeP6VkCilRtw5NikcgJK2rM
 52sgzEMrbJk98DoOJk/9P8dvOgrS6rFCixGcl08kKYuIS08WWQTsUWkkSY90XgZi+dpx
 Y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1LwX5bRFQXNkq6PB+GJkYIHW1maFFhRT+npXlh3EBU=;
 b=vTs6l7TAYqD4huCdTKKUkXMCRrR2/PE6mTNRwKsFRXPJJ54noOuYh193QrvCTw3Il4
 ibZtmt0d8sD6JyJwuO9+EpSB1al30e57NSGwIjJuz8mC1/OVQwp8ozMCiPY91LH17Y5F
 gTew6qvLVKY+TdF/QuZNkh009jiiDUYPxmUcq/H/g5v+Ri7R/FG3eUs4tBefU6cJ5p6p
 vcXR4tZgFm6ydrsr7F9Wf1EzNczt57mahKiP/VgGTT+BfwSOLQiwknaVxXwLY2R/md+x
 I0/cUPxkOhiTQdInvVsgg5lJdqYHWpLAMHF8Pvzp7IYdLKA8fp2GoZsKCH40zQNlfrIh
 sodw==
X-Gm-Message-State: ACrzQf2fga02YK3VNEpjOAziE/q730jbEeQMaYmXHNsBWSuQ3QoMLcaH
 bIaRKufUhjpqj2o0XBVGVPjOfMNgumYNenxtFpg=
X-Google-Smtp-Source: AMsMyM7pkfs8YvaEJ3rXNBXJfzbthWWMDK+JMBHXzoIgFykCTCTTewwkS0A48fh2TzykUTENTQtzoKPd6PQhlDPFwow=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr5577155oiw.96.1666025541711; Mon, 17
 Oct 2022 09:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221013210714.16320-1-fmdefrancesco@gmail.com>
 <fb0b7389-7121-04f8-176d-1ababe0ad8f2@amd.com>
In-Reply-To: <fb0b7389-7121-04f8-176d-1ababe0ad8f2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Oct 2022 12:52:10 -0400
Message-ID: <CADnq5_PP3VCXQ5rbC0-8Qsi5W7Ew87U_bRknz4=qxbrPxVQ+qA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Replace kmap() with kmap_local_page()
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
Cc: linux-hwmon@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Kees Cook <keescook@chromium.org>,
 Ira Weiny <ira.weiny@intel.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, "Venkataramanan,
 Anirudh" <anirudh.venkataramanan@intel.com>, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bpf@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Oct 14, 2022 at 3:03 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 13.10.22 um 23:07 schrieb Fabio M. De Francesco:
> > The use of kmap() is being deprecated in favor of kmap_local_page().
> >
> > There are two main problems with kmap(): (1) It comes with an overhead =
as
> > the mapping space is restricted and protected by a global lock for
> > synchronization and (2) it also requires global TLB invalidation when t=
he
> > kmap=E2=80=99s pool wraps and it might block when the mapping space is =
fully
> > utilized until a slot becomes available.
> >
> > With kmap_local_page() the mappings are per thread, CPU local, can take
> > page faults, and can be called from any context (including interrupts).
> > It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
> > the tasks can be preempted and, when they are scheduled to run again, t=
he
> > kernel virtual addresses are restored and still valid.
> >
> > Therefore, replace kmap() with kmap_local_page() in radeon_ttm_gtt_read=
().
> >
> > Cc: "Venkataramanan, Anirudh" <anirudh.venkataramanan@intel.com>
> > Suggested-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index d33fec488713..bdb4c0e0736b 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -869,11 +869,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f=
, char __user *buf,
> >
> >               page =3D rdev->gart.pages[p];
> >               if (page) {
> > -                     ptr =3D kmap(page);
> > +                     ptr =3D kmap_local_page(page);
> >                       ptr +=3D off;
> >
> >                       r =3D copy_to_user(buf, ptr, cur_size);
> > -                     kunmap(rdev->gart.pages[p]);
> > +                     kunmap_local(ptr);
> >               } else
> >                       r =3D clear_user(buf, cur_size);
> >
>
