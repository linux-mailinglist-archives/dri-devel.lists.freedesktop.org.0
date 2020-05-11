Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740D1CE570
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED676E575;
	Mon, 11 May 2020 20:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AD26E575
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:28:00 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A1CC20736
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589228880;
 bh=Nz6bTgIxUAn7rUabLhD1q1zn78Zqka5bB1ueKi/F2BQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BHozvJi5BG8Yx/0T1MOrqp/qMMQOQIlc2yfH0wPjmH/W9fNac63HYVSf2O8XDHI56
 3nbcJXGDJMUfQtOuLBmNgCjEWHwTdwnZL8xE0ahfvEX2w7PaV36yNitkgO9OuD0ZZe
 GyJmzLOxCr5+zPeCvxtUMeNbWYv6ICCl1TxnndHs=
Received: by mail-oo1-f52.google.com with SMTP id p123so1075008oop.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:28:00 -0700 (PDT)
X-Gm-Message-State: AGi0PuaOcLRsW+PJ6NXdMHQBwuYYZwMzarE9t9Fh16dwQuoPoY3QvHP9
 dzZ7aH7kMmeiJXzcal9eGZi3En8qL94ZO0c6sg==
X-Google-Smtp-Source: APiQypLSBJzRE+cCsGihwUlGGjWJH9/vO5uxkoJWXIl2XNbr12Oy6bpN1iK3mElpqX8cGoxAID5e8vKZk15IV0bTy4E=
X-Received: by 2002:a4a:9285:: with SMTP id i5mr14814535ooh.50.1589228879703; 
 Mon, 11 May 2020 13:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-2-digetx@gmail.com>
 <20200506163237.GA19296@ravnborg.org>
In-Reply-To: <20200506163237.GA19296@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 May 2020 15:27:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+xU4p+CQ=xzvgcktCo9i=SfHajMgbZ1DKOVzo+hCYdCw@mail.gmail.com>
Message-ID: <CAL_Jsq+xU4p+CQ=xzvgcktCo9i=SfHajMgbZ1DKOVzo+hCYdCw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 6, 2020 at 11:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry
>
> On Sat, Apr 18, 2020 at 08:06:58PM +0300, Dmitry Osipenko wrote:
> > In some case, like a DRM display code for example, it's useful to silently
> > check whether port node exists at all in a device-tree before proceeding
> > with parsing the graph.
> >
> > This patch adds of_graph_get_local_port() which returns pointer to a local
> > port node, or NULL if graph isn't specified in a device-tree for a given
> > device node.
> >
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Nice little helper function.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> Rob - OK to commit to drm-misc-next?

Yes, that's why I gave my R-by.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
