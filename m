Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0381987BC7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 01:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B370410EBE9;
	Thu, 26 Sep 2024 23:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SGEPnkPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1420210EBE9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 23:26:06 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-536a2759f0eso2475608e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727393164; x=1727997964; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t5pseCPO6jN8nR6Udzs4lC47qwj/lhZ7DuKsdijaTSc=;
 b=SGEPnkPhG5aqDqk2nhlIDSFrGPqwa9QF1n/3Iw35tV1Y1TA2OfbVT4QX7BcEjgROIj
 R8X+UFKdsDoXfj3nDzLb3v6doeBsrt7HwPjpYOGlr9auk3U1gSJRSVv+H+8qpsysB+2f
 3OTFCLjYjrjh3i52WeTwu2Ld5JVLMUla/8/jokLrSFTSxDH/TI7Ms6hATtrclBImUl9u
 IWmGYVOtEqwWy5AMuHKG06QX/4/w+A5GzM2+vEAqMaj3UdFxUj54Fio2TstgC5+Y9NnW
 2yY4ozTDEXdHiXM072CpiCmmgS02vjRouIPH5KUUaSGXLedNjRdd8yLGyXmt+HKDHHXd
 RNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727393164; x=1727997964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5pseCPO6jN8nR6Udzs4lC47qwj/lhZ7DuKsdijaTSc=;
 b=JTH5Roqz+Q1/k0pFKqCfLyIXod/MoRAhgXoeScljslCC8omRiV7eifvbFXYIR0enRM
 gCXIc+2vH88iJWciavG/P8aXbzjakBAyLTSQ/RzS6kPguRz38xRE/Xlly8Uvhc0PsFzP
 cBqO1T8n1T+xOjj6r7JSegQbpTzr5NL3thZ7ElDLeNU3nLaWTf8aAj+fgrE/PVCXdNyG
 NltrzstEv/sO5mYkisgnefnSjORIJ5Roc37XPsUOEmBjjAcmG6eFUuf7r3Ot28QSgTH0
 Opgcdp1DZmvUnMt4+ij08bk63Q9O7zyLQMwz1vfBbTE+ofeoBBmUxyW4HIAPlIWqYRoU
 +TuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXucDqscMotF92Es+ZUxcNIn5vxkA/ONB8drOrwq3OPsPtkAZxsp8mc8wSGp1bnEtKtuVoKwZ9L2Mo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTjK8bDA9vmZh2JctpbVRzDmeHBktOuFx8BRdNXzgQS//jtwPa
 UX3S9H8/R4SF/dFluWDsFw6ZMWLrOxdugqRw0+m8Gi07+aSsZLu/ZERFfv5LDxA=
X-Google-Smtp-Source: AGHT+IFAmKWsef3dkLsjCXYV9pQHrb5CqKf+GuRXpmYITGvw+mF5uEPHe1Fq1aNMJshg42Udh6y/6A==
X-Received: by 2002:a05:6512:3b9b:b0:530:aea3:4659 with SMTP id
 2adb3069b0e04-5389fc330ecmr749547e87.9.1727393164048; 
 Thu, 26 Sep 2024 16:26:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a04399f4sm101721e87.190.2024.09.26.16.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 16:26:03 -0700 (PDT)
Date: Fri, 27 Sep 2024 02:26:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>
Subject: Re: fw_devlinks preventing a panel driver from probing
Message-ID: <il3s26owmtyf3knniv7klkmw3uuz4dffrump7jo47dk6hxdsya@v5plmtjcbukf>
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <34mewzvfyjsvyud3lzy6swxs7sr64xkgrbkxtvyw3czvoerct7@7guo32ehwa52>
 <5a540bdb-e3ca-494a-b68d-8f81f4d1cc1a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a540bdb-e3ca-494a-b68d-8f81f4d1cc1a@ideasonboard.com>
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

On Thu, Sep 26, 2024 at 02:52:35PM GMT, Tomi Valkeinen wrote:
> Hi,
> 
> On 21/09/2024 23:15, Dmitry Baryshkov wrote:
> > On Mon, Sep 16, 2024 at 02:51:57PM GMT, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > We have an issue where two devices have dependencies to each other,
> > > according to drivers/base/core.c's fw_devlinks, and this prevents them from
> > > probing. I've been adding debugging to the core.c, but so far I don't quite
> > > grasp the issue, so I thought to ask. Maybe someone can instantly say that
> > > this just won't work...
> > 
> > Well, just 2c from my side. I consider that fw_devlink adds devlinks for
> > of-graph nodes to be a bug. It doesn't know about the actual direction
> > of dependencies between corresponding devices or about the actual
> > relationship between drivers. It results in a loop which is then broken
> > in some way. Sometimes this works. Sometimes it doesn't. Sometimes this
> > hides actual dependencies between devices. I tried reverting offending
> > parts of devlink, but this attempt failed.
> 
> I was also wondering about this. The of-graphs are always two-way links, so
> the system must always mark them as a cycle. But perhaps there are other
> benefits in the devlinks than dependency handling?
> 
> > > If I understand the fw_devlink code correctly, in a normal case the links
> > > formed with media graphs are marked as a cycle (FWLINK_FLAG_CYCLE), and then
> > > ignored as far as probing goes.
> > > 
> > > What we see here is that when using a single-link OLDI panel, the panel
> > > driver's probe never gets called, as it depends on the OLDI, and the link
> > > between the panel and the OLDI is not a cycle.
> > 
> > I think in your case you should be able to fix the issue by using the
> > FWNODE_FLAG_NOT_DEVICE, which is intented to be used in such cases. You
> 
> How would I go using FWNODE_FLAG_NOT_DEVICE? Won't this only make a
> difference if the flag is there at early stage when the linux devices are
> being created? I think it's too late if I set the flag when the dss driver
> is being probed.

I think you have the NOT_DEVICE case as the DSS device corresponds to
the parent of your OLDI nodes. There is no device which corresponds to
the oldi@0 / oldi@1 device nodes (which contain corresponding port
nodes).

> 
> > have a dependency on DT node which doesn't have backing device.
> 
> Well, there is a backing device, the DSS. But if you mean that the system at
> the moment cannot figure out that there is a backing device, then true.

-- 
With best wishes
Dmitry
