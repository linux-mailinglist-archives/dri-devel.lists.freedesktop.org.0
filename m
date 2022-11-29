Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4063CB0C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D438825E;
	Tue, 29 Nov 2022 22:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F410D10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:28:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id vv4so37249935ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cv5P4YKVke8Uiqx6Xk3+EHcpUQ/fZJSaam81ASeevJA=;
 b=JtnZr6UpSwQNFk6kIu4r9vijUTEsHUkw/JsvAF1ZXWJOpbtaJ0XJwfED9HLlRrtcTK
 qOV7Phcu9KCrk8HFsBJtK4bGa6axQ6qUZIL8lgQCewFA4X/UvjYX6kr4HAAdEWROPkCv
 URe7yoen5FEW9c4UDnFv5upSl5zNAZXMbKYsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cv5P4YKVke8Uiqx6Xk3+EHcpUQ/fZJSaam81ASeevJA=;
 b=1FDYNfd2JFz8L8NLmtit/y/v60HTwiNrXPxs/HdJoyqFdd9tdve+lEtJFJtzS2lnP3
 /FDGEzcvRoQqAKvUocTp/aCcIDJWI6jrNU4LCSQulUwDhgVT1/iQD5aHL2/y+y9QrQ+7
 DbPLJNvUk8WO2P3tpvgglh687pFtJ9E230JrSN4u92XmTpLpDfsloKqhp7BVzOKDuy6O
 BVzjxBHwAsooXw7M1YeKSIflnSR9fvSs3W2VB1tpgnEC84JGMESY4IGIp01h96XVOBMI
 yljkGq36lVIjuh7Lrpcbx1QXBWrqmJYkTK9qkKI2df+g/mO3orkLz8V523sjuDNFT8O9
 b3Wg==
X-Gm-Message-State: ANoB5pnLaDlnE30GnxcDDsQyqQ7kNqnF8CdeBbAoa2CG2AC3yYmsj1fI
 r/2LKSS3lxqk6B/mvKU0YmYOUJikM8/1AaAG
X-Google-Smtp-Source: AA0mqf7SQN/2kRmQkfutNNYDyOg+IukSHRDGzXbygQqDZpWX1pwtx0yxQsrImwwqvAp8N1DjE2b6yQ==
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id
 h23-20020a17090619d700b007b2b782e1dfmr45137494ejd.308.1669760926166; 
 Tue, 29 Nov 2022 14:28:46 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 la26-20020a170907781a00b007bed316a6d9sm3847075ejc.18.2022.11.29.14.28.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:28:45 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 83-20020a1c0256000000b003d0683389e1so72657wmc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:28:45 -0800 (PST)
X-Received: by 2002:a7b:c4d8:0:b0:3cf:b0ed:de9d with SMTP id
 g24-20020a7bc4d8000000b003cfb0edde9dmr29570493wmk.188.1669760924865; Tue, 29
 Nov 2022 14:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <CAD=FV=XFsSoUqkk8zhta1V-oT2AGGvUz=0qFWAcXiJ7m+nnATA@mail.gmail.com>
In-Reply-To: <CAD=FV=XFsSoUqkk8zhta1V-oT2AGGvUz=0qFWAcXiJ7m+nnATA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 14:28:32 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WfFNssxLRHKv3OUgAZsfme=k27TaFN1M8hFw2xug+eLQ@mail.gmail.com>
Message-ID: <CAD=FV=WfFNssxLRHKv3OUgAZsfme=k27TaFN1M8hFw2xug+eLQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/panel-edp: Use ktime_get_boottime for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 1:14 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > ktime_get is based on CLOCK_MONOTONIC which stops on suspend. On
> > suspend, the time that the panel was powerd off is recorded with
> > ktime_get, and on resume this time is compared to the current ktime_get
> > time to determine if the driver should wait for the panel to power down
> > completely before re-enabling it.
> >
> > Because we're using ktime_get, this delay doesn't account for the time
> > that the device is suspended, during which the power down delay may have
> > already elapsed.
> >
> > Change to use ktime_get_boottime throughout, which uses CLOCK_BOOTTIME
> > which does not stop when suspended. This ensures that the resume path
> > will not be delayed if the power off delay has already been met while
> > the device is suspended.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> >
> > ---
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

fa8e91b12697 drm/panel-edp: Use ktime_get_boottime for delays
