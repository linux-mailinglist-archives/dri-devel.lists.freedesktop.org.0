Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8E808964
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D300A10E03D;
	Thu,  7 Dec 2023 13:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C29110E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:43:28 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-58de9deec94so90017eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 05:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701956607; x=1702561407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xBbMTwzLUI6AsxwJYWge2IOpLOj/2VRysEwnm2zI+0=;
 b=WRGDjkmOMbjjImKw6OnFetTCNtumsUIKGH94hNJ+5RMZs7H0vZSBrKzl03CnS7c7I1
 0h3xT6hOiQHlOFXk1EFia4SaNKzM/JoNkod63z9ioBlq2CO880PNfGljh5BxrrG6LUdj
 pROCh1fjNbmgSN+tYoqtt6uTHg4Tp1CDAvd3t8K4Drg704CZ2fvI25AJfDoyPuFYlQ+m
 ZXTo3gNqqb9jQAOm9zhQcarwRD/5Lcr+wNudnVcE5ci86HUPm0E6mt/89vgL2jg4EW+g
 AVfypnaPrDtjAllQc5eaE/BK8mA2G5ALFLfFCKuBM+yHfZ8ZejwXBpwlZt4m5ePUx8Hv
 mxCA==
X-Gm-Message-State: AOJu0YxbJ/fP6L5Tn0P5pugRmfMlYX1Mu/4B2uqz57fUITKXitU08vJv
 PngO86o2EtTQPTtV7RbdVZMblm4/ps8KFUuCOYI=
X-Google-Smtp-Source: AGHT+IFLlR6hMHLWIx2Jrs3iiksojdy7JR/cUlNFq05JtjD7qas5Z8mZrYBZhzW/AnrWBG2O+Fy/7BsfIzIDt5C9D6I=
X-Received: by 2002:a05:6820:a08:b0:58e:1eaf:7dbd with SMTP id
 ch8-20020a0568200a0800b0058e1eaf7dbdmr5777449oob.0.1701956607359; Thu, 07 Dec
 2023 05:43:27 -0800 (PST)
MIME-Version: 1.0
References: <CAJNi4rMuBWw=gvKPJN9WF7oc_zdXP6-dFZm8xgJz8DD_4SK1eQ@mail.gmail.com>
In-Reply-To: <CAJNi4rMuBWw=gvKPJN9WF7oc_zdXP6-dFZm8xgJz8DD_4SK1eQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 7 Dec 2023 14:43:14 +0100
Message-ID: <CAJZ5v0gJuASx-a=d0QxKowQRL5x=vS00FOTFA+BAasF=oahtmQ@mail.gmail.com>
Subject: Re: Question about device links between supplier and consumer
To: richard clark <richard.xnu.clark@gmail.com>,
 Saravana Kannan <saravanak@google.com>
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
Cc: majordomo@vger.kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, rafael@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Saravana

On Thu, Dec 7, 2023 at 10:51=E2=80=AFAM richard clark
<richard.xnu.clark@gmail.com> wrote:
>
> Hi,
>
> I have to comment out below code to make the mmc driver be probed
> before the kernel try to run the init mounting the rootfs in the dev
> node generate by the driver:
>
> really_probe(...)
> {
>    ...
> #if 0
>     link_ret =3D device_links_check_suppliers(dev);
>     if (link_ret =3D=3D -EPROBE_DEFER)
>         return link_ret;
>     ...
>     if (!list_empty(&dev->devres_head)) {
>         dev_crit(dev, "Resources present before probing\n");
>         ret =3D -EBUSY;
>         goto done;
>     }
> #endif
>     ...
> }
>
> Otherwise, the mmc driver will be defer probed after the init
> executed, as you can imagine, the init will complain it can not find
> the dev node specified by the 'root=3D/dev/xxx' in the kernel. command
> line.
>
> This is really bad! I don't know how to check the device dependency or
> what I should do in my driver to make it follow the device dependent
> link rule? or sth i am missing...
>
> Thanks!
