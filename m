Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C539A4EFD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A8010E390;
	Sat, 19 Oct 2024 15:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G1C3OkNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8C10E390
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 15:13:37 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53a007743e7so3765084e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729350816; x=1729955616; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=krDiZS5nG2/3uBKdMbeGhCgLy6IYu8PQz7aJnr+yJi8=;
 b=G1C3OkNcU/mpWB8E/AzTcNk8RLmxXC4aQqGfXQmAiGavBZ6OVYsekfhxkcuc5s3AF4
 vMsuJgp9mfPOOZjhn68dp0zi5LEUZmY5bzKGGbkUgxqiq7Zowvo4qr1Jppk9GJ8F513W
 P8aXpRSMBaRap99+A/Hx38xsB6x7WA3HfO/WwVH02VVXArNm28MQNsv3Tf4qWMIojhQO
 +yRaexYa2YLxwTJOTgRODpQJOdyPxiGqbwGjBlhKhNXHoO/2GVake+g0AV3tBPnuN/DS
 fWh13rhLaa68asSoPXMAnQiGdHN8JGKRNJZptAuPq5fNjy3XGxRATLgNoMbUZh+sqIBo
 mArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729350816; x=1729955616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krDiZS5nG2/3uBKdMbeGhCgLy6IYu8PQz7aJnr+yJi8=;
 b=VaML+BOGrG8u2BiKlgNQTUjpddWHzjvzkq285AXtWtZ9urTBuFyTrrtjOkOAowMGir
 x5jDO2/9MGBTUezbXTP8Iic3kQxKUYVx6BGn6gkzcji+MlsV9fAo3fQmItSa3/shelhm
 zbtds+Ea6H4P/fwtr+08AsiX51NbPDZvuWyZxcPqDmRrIrCkWnDCPadd8Dqlcdk0KsSh
 st+tFVqOOa7eejqvvES1WJUfsFIDj1ghjiWxX5I5ceFHtsQyAUzHG3DwINYPtoikHV+Q
 4CfXSbXeMyLX6KA3Thp3wybrExX3asLFBISmAFaWkqobQeTND86sOTnDhpNUqNAUNs+z
 tYBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/kgqHJdoFeU3Bo0oG4/2KYj6KOY3BSOiFC81KnmL8SnOgMWW2llVYjy/hNSbjiJ/Ja/NB/lAyjOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytbRR6s9rtvNACSO/VKVWlKTEv5H4DE++D+8y9C3C7IuoPRm8o
 sTGPGGd2nraP+BdoJ+qyTheXz/IV7CSe19cVy+BD747/glS3goefsqtan+n5tNQ=
X-Google-Smtp-Source: AGHT+IFKuCMcWShdcdkh/ap+77wNM798VkP7IdlHdjPLjXCmNwfRyk8EffhOcww/3NmFY/vphGzgLA==
X-Received: by 2002:a05:6512:3a93:b0:539:f36c:dbac with SMTP id
 2adb3069b0e04-53a15441a99mr3156756e87.4.1729350815916; 
 Sat, 19 Oct 2024 08:13:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b92f7sm548187e87.71.2024.10.19.08.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 08:13:35 -0700 (PDT)
Date: Sat, 19 Oct 2024 18:13:33 +0300
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
Message-ID: <wsg6abva53o3qxr2yycym7nubgr5rrvbmkq3oaf3zkqmmnaczs@a46rfhcxky6e>
References: <1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com>
 <34mewzvfyjsvyud3lzy6swxs7sr64xkgrbkxtvyw3czvoerct7@7guo32ehwa52>
 <5a540bdb-e3ca-494a-b68d-8f81f4d1cc1a@ideasonboard.com>
 <il3s26owmtyf3knniv7klkmw3uuz4dffrump7jo47dk6hxdsya@v5plmtjcbukf>
 <bed619c7-1a82-4328-825c-117c2ee3639d@ideasonboard.com>
 <CAA8EJprDdst-mcwMsWs=0AHGCNa_5Ng90tubSJ7VAHamx2T93g@mail.gmail.com>
 <babeae17-488d-4428-aa55-fdd904a5425e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <babeae17-488d-4428-aa55-fdd904a5425e@ideasonboard.com>
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

On Fri, Oct 04, 2024 at 02:52:24PM +0300, Tomi Valkeinen wrote:
> Hi Dmitry,
> 
> On 27/09/2024 11:35, Dmitry Baryshkov wrote:
> > On Fri, 27 Sept 2024 at 08:41, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > 
> > > On 27/09/2024 02:26, Dmitry Baryshkov wrote:
> > > > On Thu, Sep 26, 2024 at 02:52:35PM GMT, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > > 
> > > > > On 21/09/2024 23:15, Dmitry Baryshkov wrote:
> > > > > > On Mon, Sep 16, 2024 at 02:51:57PM GMT, Tomi Valkeinen wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > We have an issue where two devices have dependencies to each other,
> > > > > > > according to drivers/base/core.c's fw_devlinks, and this prevents them from
> > > > > > > probing. I've been adding debugging to the core.c, but so far I don't quite
> > > > > > > grasp the issue, so I thought to ask. Maybe someone can instantly say that
> > > > > > > this just won't work...
> > > > > > 
> > > > > > Well, just 2c from my side. I consider that fw_devlink adds devlinks for
> > > > > > of-graph nodes to be a bug. It doesn't know about the actual direction
> > > > > > of dependencies between corresponding devices or about the actual
> > > > > > relationship between drivers. It results in a loop which is then broken
> > > > > > in some way. Sometimes this works. Sometimes it doesn't. Sometimes this
> > > > > > hides actual dependencies between devices. I tried reverting offending
> > > > > > parts of devlink, but this attempt failed.
> > > > > 
> > > > > I was also wondering about this. The of-graphs are always two-way links, so
> > > > > the system must always mark them as a cycle. But perhaps there are other
> > > > > benefits in the devlinks than dependency handling?
> > > > > 
> > > > > > > If I understand the fw_devlink code correctly, in a normal case the links
> > > > > > > formed with media graphs are marked as a cycle (FWLINK_FLAG_CYCLE), and then
> > > > > > > ignored as far as probing goes.
> > > > > > > 
> > > > > > > What we see here is that when using a single-link OLDI panel, the panel
> > > > > > > driver's probe never gets called, as it depends on the OLDI, and the link
> > > > > > > between the panel and the OLDI is not a cycle.
> > > > > > 
> > > > > > I think in your case you should be able to fix the issue by using the
> > > > > > FWNODE_FLAG_NOT_DEVICE, which is intented to be used in such cases. You
> > > > > 
> > > > > How would I go using FWNODE_FLAG_NOT_DEVICE? Won't this only make a
> > > > > difference if the flag is there at early stage when the linux devices are
> > > > > being created? I think it's too late if I set the flag when the dss driver
> > > > > is being probed.
> > > > 
> > > > I think you have the NOT_DEVICE case as the DSS device corresponds to
> > > > the parent of your OLDI nodes. There is no device which corresponds to
> > > > the oldi@0 / oldi@1 device nodes (which contain corresponding port
> > > > nodes).
> > > 
> > > Do you mean that I should already see FWNODE_FLAG_NOT_DEVICE set in the
> > > fwnode?
> > 
> > No, I think you should set it for you DSS links. If I understand
> > correctly, this should prevent fwdevlink from waiting on the OLDI to
> > materialize as a device.
> > Note: my understanding is based on a quick roaming through the code
> > some time ago.
> 
> Ok. Well, I did experiment with that, but I didn't figure out how to use it.
> Afaics, even if I set FWNODE_FLAG_NOT_DEVICE to the oldi nodes (just as an
> experiment I also set it to all the nodes from dss to oldi) in the DSS
> driver's probe, it doesn't help: the panel driver still doesn't probe.
> 
> I also wonder whether it would work reliably even if it did work. First the
> panel driver is prevented from probing as the oldi dependency is not
> present. Then the DSS driver probes, sets the above flag, but then it fails
> to probe as the panel is missing. At this point something should trigger the
> probing of the panel driver again, and I wonder if there's anything to
> trigger it.

My thought was that the flag should be set before panel / DSS drivers
being probed.

-- 
With best wishes
Dmitry
