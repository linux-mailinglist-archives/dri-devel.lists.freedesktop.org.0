Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D96787B1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE1410E55B;
	Mon, 23 Jan 2023 20:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D1510E559
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674505556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wI+uwRrseHkDD2f7fdidODPj/+sMoA2eg3871tB7+XY=;
 b=ZAATYqUe3KEohzlh6msigthOocgaHHzRG+3JU7zXhYjV+9lVc8HtqkC93uWtHeDcz6L5Ld
 iPRvPdBh56Fo+zu9I9VfKWDfxRzEKmEAa5KcmHCAOXLHpanwEAkb47qfxmNYqZifx0BtAB
 zy+cR+lAy6RVCiqwT8uGkrTs2gA8JPw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-Q6Y6g-NMNvu2WGrMh2u8iw-1; Mon, 23 Jan 2023 15:25:55 -0500
X-MC-Unique: Q6Y6g-NMNvu2WGrMh2u8iw-1
Received: by mail-lj1-f199.google.com with SMTP id
 t18-20020a2e7812000000b00289e0c04d86so2917966ljc.17
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wI+uwRrseHkDD2f7fdidODPj/+sMoA2eg3871tB7+XY=;
 b=C7ZbsyuTQIWHxy089tJL3V7cZXS8mMa1lpx9v6qkw0i8j2gOUnI8dx+NygMwK6n6kM
 v7Jdnu+6BWCB7bKiwP2y6YqMN97AKF5qiE9tG+s9HNlRiQuxVSYVrjvtIInD96hbqZ+v
 KPYsaccl3aMJrl1iWNAyJgkdjT1VLaYoLd5jLQndQt15Wo3i1gpa0IXMFPo9NqQhecaH
 QBaOiILEjnNmA1lcJb5iOSVGD+AjkS1L3lR/523UuSMWJMLIbZRyE84HSuV6vLbZWKpN
 lVkoHe9r+1Gb9CcM12hFkQlnAuzBx6Q0hMu8Wx8sM3QfEFKVhLXTcZ3jhytwK5bm4Wbj
 8Wgg==
X-Gm-Message-State: AFqh2kqioZx4IYUgZjDiBM6KfPFZC5LGaJdTdcF8bPch5B2WV7Ec5mSp
 4+ndQ3R+SS9V7+/Gmmg+4E0mYyMBMd1BH4ocz+66SY1dGBJ7bMU0fWJXnBxgwJxR7jZixbwXFmm
 r7a939a+aEzXsoAYXhmE3NxQocKuHgnc+TmqbikDlebBP
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2145946lfu.615.1674505553899; 
 Mon, 23 Jan 2023 12:25:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0sGio3mJgM/GrhOs7qNkqL6NME3XT0conpfnpdJIhsniT/NQ5+lS64DwEnKBw4hn9ZTBwS451C36ca3tv9Jg=
X-Received: by 2002:a05:6512:3984:b0:4ca:faca:5b59 with SMTP id
 j4-20020a056512398400b004cafaca5b59mr2145938lfu.615.1674505553487; Mon, 23
 Jan 2023 12:25:53 -0800 (PST)
MIME-Version: 1.0
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
 <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
In-Reply-To: <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Mon, 23 Jan 2023 21:25:42 +0100
Message-ID: <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
Subject: Re: [ANNOUNCE] pixfmtdb
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: wayland-devel <wayland-devel@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Why is the TF defined for GL formats and both the primaries and TF for
Vulkan formats? The only exception here should be sRGB formats. Where
did you get the information from?

On Mon, Jan 23, 2023 at 4:51 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> CC'ing the linux-media mailing list.
>
> On Mon, Jan 23, 2023 at 02:10:58PM +0000, Simon Ser wrote:
> > Hi all,
> >
> > In the last few days I've been working on a small new project, pixfmtdb [1].
> > It's a Web database of pixel format guides, it can be useful to understand
> > how pixels are laid out in memory for a given format and which formats from
> > various APIs are compatible with each other.
> >
> > pixfmtdb relies on the Khronos Data Format Specification [2] to describe
> > each format. This means that each format is described with a standardized
> > data blob, which can be re-used with other tools for other purposes.
> >
> > My future plans include adding more formats and format families to pixfmtdb,
> > and make it easy to use the data for code generation, in particular for
> > automatically generating tables containing metadata about formats, as used
> > in Wayland compositors and other projects.
> >
> > I hope some of you can find this work useful,
> >
> > Simon
> >
> > [1]: https://pixfmtdb.emersion.fr
> > [2]: https://www.khronos.org/dataformat
>
> --
> Regards,
>
> Laurent Pinchart
>

