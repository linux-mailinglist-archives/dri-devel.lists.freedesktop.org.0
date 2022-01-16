Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8F48FD2D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 14:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690810E8FE;
	Sun, 16 Jan 2022 13:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24F510E8FE
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 13:27:31 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z22so53894598edd.12
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 05:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=camAAx/Y0xssCeGO9qauKy3ccFa+XJqa9zv1vk+d2dQ=;
 b=Dk0zyw6CK3D4mHMK4jfY0ZM+/PNXEgsL+x9iLcZ4dVdEcRjRk0pteX+17JEumuYp2v
 O6eBHhYkfaNtPMJVcHBoSNw8Ow1WMyBf788v+WKgrE1N2KDtx+9sSw43UqoWVDk+1mql
 XBYFF9MWxCH37/uNzgHkaOH2RJ1e37XiGK/Lokryu4neKDwnV4VDvqNFHYh0ITJL9pyw
 quxR/HfxcqkCq2TRT/UJrvDf8on1AhqL/EqUTFwmbwDzbV7JMMrJBl+QpvzopAptxskA
 1TsvBhe9rcmcsMPyq2ByhZGpYNtsD4UkKvegFdwgGNrCzjkThrIezwf7ljRkJmPs3HoJ
 YOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=camAAx/Y0xssCeGO9qauKy3ccFa+XJqa9zv1vk+d2dQ=;
 b=E+ce9Eg+eUk+SAZlUUOEDEWJicLVFY1ZPiYyxWlyEc/MTMQN62NEhiyadJqZ720dqj
 N6YACrCxR4kSqp/COyEKFyYSs1KNbyBPgw/ztZqPygcWXIW3XYZBbPQhivBehnn19rBG
 4PoToaVC/pecYCxROK6tdIQ6Jk9OqgllUgpy2BwIsdDwS+403HcS2AHGd235GS8pgNLv
 jhBgsdKJ8i12hLf7IqBDyjdmwISDdR7dCXHB6LmoE4Cdt1Le+iCC9z0ZRLagyGJPLAc1
 IiysVJrNyFcL101LmVaPaRpozhoncx8l84rXpOQkAJMaEAKi9nF75tGksDlLVJ0KefUC
 eQ+g==
X-Gm-Message-State: AOAM531Pryl4XjOVIi1j7hrEX/74qW90wIx66ZTKCyveIodT7bzH5iTh
 1rWUEsFSl88dZRMhzMJuYN1i7qDqhIbpq72u2S47C2oeFwo=
X-Google-Smtp-Source: ABdhPJwU90fPz6hfqvAqqZM+yrXX06HDvYjHpaYzvQkGV3r+uebCeWV018bMWu6tLDd2wZG1nh70v+1m+CFy/QTy6PA=
X-Received: by 2002:a17:907:160c:: with SMTP id
 hb12mr3054081ejc.652.1642339650482; 
 Sun, 16 Jan 2022 05:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20211231013930.139754-1-festevam@gmail.com>
 <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
 <CAOMZO5DVzvPXs2-0Vzsunh=OZ0qhyMhSKyPTKQ+mGXfF8G8Rtw@mail.gmail.com>
 <20220108191658.GC2633@tom-desktop>
 <CAOMZO5Db9WuFTckQ=ngT32Q5EgOFf9_T+duuT1nzemWRTSwoQA@mail.gmail.com>
 <20220111202151.GB4503@tom-desktop> <20220115232306.GA30488@tom-desktop>
In-Reply-To: <20220115232306.GA30488@tom-desktop>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 16 Jan 2022 10:27:19 -0300
Message-ID: <CAOMZO5AKLQuvh5_ZL9vYCp_1MijGmGdj+vxfofRsCN=d2v+rKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
To: Tommaso Merciai <tomm.merciai@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tommaso,

On Sat, Jan 15, 2022 at 8:23 PM Tommaso Merciai <tomm.merciai@gmail.com> wrote:

> Hi Fabio,
> I'm working on bring up urt,umsh-8596md-20t lvds kit panel, but after enable
> following node I get the following error:

I assume you are trying to connect an external panel via connector CN3.

This connector is for LVDS panel, not parallel.

The eLCDIF parallel interface is connected to the TDA19988.

Anyway, this is a different topic. My goal here is to fix the kernel
warning when using the TDA19988 HDMI output.

Thanks
