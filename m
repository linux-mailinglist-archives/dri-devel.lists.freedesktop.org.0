Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B596F1F62
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 22:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2319610EDF1;
	Fri, 28 Apr 2023 20:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D8910EDEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 20:31:22 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-528c2c89493so136251a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682713882; x=1685305882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXLt9wAJDw5YIyP39CbEzK00xStIP8ydgtlC5ZAJKyQ=;
 b=MnkIoreJEUloIXZzUBXgNzmPaj8SiO0fvhpbdWNeLksM5OxjkW9KMggEtpobPJuoVl
 lA6WEfTWfrjHpi54gX8P6to5K0XiCzaVbaev/Cc5NYOQTszbKNsoaqjI88qdHCkRL24O
 CRtg93BSrJ1monq03RALntx+qcE6wII69WOiXrHZFOTz1ZaMw4a53hCV1ayscU4caPoy
 UTEE4oW58qQ7iN8KnVGATpWbsn+t0Sxj2xD7sVqlAnXW5rcgKXtbwnA7Qi0Rz8v0YhVJ
 FjJDUUjRjqkfUbwA6LExbqwlLDYSpgn/C1tnwfAPdgTJ6PESZUl2iPjyETLYNBkVLwTM
 4l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682713882; x=1685305882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXLt9wAJDw5YIyP39CbEzK00xStIP8ydgtlC5ZAJKyQ=;
 b=flqoGdZ85xHOCO1O0IdeBhw4f3IyJNC40rlh3tPIGp5jp/FK66ccsLUC1W5TdDhLLj
 NYOiqFzyhSb1kM5y3WRyF5jZ5kzLyKOu/fiGxAFuDpDsc4Z8rXYFBt/LkmknVYj6X5HJ
 nqkMxCiD6w0rXbSM47rG6t810OWsJ7LDKzsgpc1iM5RpIMFzHjDgZiCwkapHJrn5g33a
 S8FLbsjHF4VERat6LICgj1wZm0YP/MHO8m0xg1/ZbIoa2Sa0shJglVODw7yQgqIzWZ62
 GokUdS0a+K8MHfUd6vru0yIdhfQtJEFT/hNF2+UboFTomxiGbxE94N/LEE3+V8lLfXzQ
 XYEQ==
X-Gm-Message-State: AC+VfDwN5xMGMedH3FrRYdsqUY5Bef3icXv3ZAh07ca59cB6P2S6g1Wv
 wvomovmKqtJoOQrIGZR6QuoENzVKX+s6iz9cVzfayQ==
X-Google-Smtp-Source: ACHHUZ4Pov48bf0gISCx/rGTtlp+yX9CjKCf4ZJnCB5oghVCg/WhWHjD2AYTgk1SerazyOIYZnJjAs9h3wANb0OQLZM=
X-Received: by 2002:a17:90a:eb06:b0:246:9a43:39e5 with SMTP id
 j6-20020a17090aeb0600b002469a4339e5mr6341864pjz.23.1682713882061; Fri, 28 Apr
 2023 13:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230329014455.1990104-1-wonchung@google.com>
 <CAMNLLoRpWBONxqVG=5ksddZeD-O3LcuTtwDj6CpcvpWsCMcs8w@mail.gmail.com>
In-Reply-To: <CAMNLLoRpWBONxqVG=5ksddZeD-O3LcuTtwDj6CpcvpWsCMcs8w@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Fri, 28 Apr 2023 13:31:11 -0700
Message-ID: <CAMNLLoT=D5C8o0tQ_Jo4SAPow5n_B8ThzLt45ByJpRTZiNOHJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sysfs: Expose DRM connector id in each connector sysfs
To: Won Chung <wonchung@google.com>
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
Cc: dri-devel@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 gildekel@chromium.org, linux-kernel@vger.kernel.org, pmalani@chromium.org,
 tzimmermann@suse.de, seanpaul@chromium.org, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Won,

Thanks for the patch, I have now merged to drm-misc-next

Regards
Manasi

On Mon, Apr 17, 2023 at 3:52=E2=80=AFPM Manasi Navare <navaremanasi@google.=
com> wrote:
>
> On Tue, Mar 28, 2023 at 6:45=E2=80=AFPM Won Chung <wonchung@google.com> w=
rote:
> >
> > Expose DRM connector id in device sysfs so that we can map the connecto=
r
> > id to the connector syspath. Currently, even if we can derive the
> > connector id from modeset, we do not have a way to find the
> > corresponding connector's syspath.
> >
> > This is helpful when determining the root connector of MST tree. When a
> > tree of multiple MST hub is connected to the system, modeset describes
> > the tree in the PATH blob. For example, consider the following scenario=
.
> >
> > +-------------+
> > | Source      |    +-------------+
> > | (Device)    |    | BranchX     |
> > |             |    | (MST)       |
> > |       [conn6]--->|       [port1]--->DisplayA
> > +-------------+    |             |
> >                    |             |    +-------------+
> >                    |             |    | BranchY     |
> >                    |             |    | (MST)       |
> >                    |       [port2]--->|       [port1]----->DisplayB
> >                    +-------------+    |             |
> >                                       |       [port2]----->DisplayC
> >                                       +-------------+
> >
> > DPMST connector of DisplayA would have "mst:6-1" PATH.
> > DPMST connector of DisplayB would have "mst:6-2-1" PATH.
> > DPMST connector of DisplayC would have "mst:6-2-2" PATH.
> >
> > Given that connector id of 6 is the root of the MST connector tree, we
> > can utilize this patch to parse through DRM connectors sysfs and find
> > which connector syspath corresponds to the root connector (id =3D=3D 6)=
.
> >
> > ChromeOS intend to use this information for metrics collection. For
> > example, we want to tell which port is deriving which displays even wit=
h
> > a MST hub. Chromium patch for parsing DRM connector id from the kernel
> > is at http://crrev.com/c/4317207.
> >
> > Signed-off-by: Won Chung <wonchung@google.com>
>
> Exposing connector id in device sysfs looks good to me.
>
> Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
>
> Manasi
>
> > ---
> >  drivers/gpu/drm/drm_sysfs.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index 183130355997..11f98c5d6103 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -282,16 +282,27 @@ static ssize_t modes_show(struct device *device,
> >         return written;
> >  }
> >
> > +static ssize_t connector_id_show(struct device *device,
> > +                                struct device_attribute *attr,
> > +                                char *buf)
> > +{
> > +       struct drm_connector *connector =3D to_drm_connector(device);
> > +
> > +       return sysfs_emit(buf, "%d\n", connector->base.id);
> > +}
> > +
> >  static DEVICE_ATTR_RW(status);
> >  static DEVICE_ATTR_RO(enabled);
> >  static DEVICE_ATTR_RO(dpms);
> >  static DEVICE_ATTR_RO(modes);
> > +static DEVICE_ATTR_RO(connector_id);
> >
> >  static struct attribute *connector_dev_attrs[] =3D {
> >         &dev_attr_status.attr,
> >         &dev_attr_enabled.attr,
> >         &dev_attr_dpms.attr,
> >         &dev_attr_modes.attr,
> > +       &dev_attr_connector_id.attr,
> >         NULL
> >  };
> >
> > --
> > 2.40.0.348.gf938b09366-goog
> >
