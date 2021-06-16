Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9E3A8F5A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 05:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432C76E453;
	Wed, 16 Jun 2021 03:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1736E453
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:24:13 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d1so1075290ils.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 20:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YA26c0WgklFmOg82MgKTjTjO0sY3gVklMj2bO9rVAu0=;
 b=iGdaSoSqd739RMNj/eJqEo/MweI9jtwL6wVaavwiCjDiNWAdx6gqWhcuxzbDtaLJNJ
 EODVwiegDPjxOdWfWXkQ8nABhkep8R+VX4VHU+ckRvVM5HknT8eflIu0vrSWXJZamVby
 gx+GUsS4hC1JWCO73V41VG1id7HqYCZRRuZZdqGB6hRg056SgCRALq3/ikTGlnF/t7H4
 ke6d3ueyWiavRXzq1q/ycl8/8dxtpoYbOS0Oakvz7zWQDCcYPId00cSBUQVjWAzJlGNy
 HsH62v9Rz9EpQtEoiD5rdgPRF95CZz3408ViZ1wpvdSd6shNBLBe1JOUb6w5aHXxqC3l
 zFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YA26c0WgklFmOg82MgKTjTjO0sY3gVklMj2bO9rVAu0=;
 b=q6x2zTq6ArOQUfivxowiPeLYzb9+3kNEIUBTAnRsl7Lce2yQf1GBxS1NWlfg9RhIqA
 0+VUpvlCnZ2GSzVZtWF6pAmZdaYv8lNzcsM/PzHNDrAuhW42CkaWyJTXrEMRNb60QR/g
 SILxPyGTPlmYhkzIZONk0v5/6oawq5FtJ/0bRpxdhK5S/29+dZ90hJjY1idN8kV5aMJK
 R/VyXmNsZKCoqMePMPP3WM/WVIMTLek2nvBHZ1XNHTS8Lo+roUkbmEm1UsgHHZoq2aDU
 mA/nvFzE+k+3Ur0t+NdUlj0JlDhBAAUfkLqE3KHDvZkyAK39v1SxzT7nulBUuHx6FstR
 eByg==
X-Gm-Message-State: AOAM531dJtAF0gX7GXUhvNXsMXAgynyF9FWYaURrMjQu4lWjmYboT2r5
 F0Wqnkfk8pAVe9qNwpiQeSoB1tu4hU17USApqCtUxw==
X-Google-Smtp-Source: ABdhPJyyxyeuaYtFnpr6WfgOhJUwLEYE24GDaFa2bQr+xy41jlzLnrwK5ivjrzCB63+CCfmwtVA9FwnJJW2H1wIa12I=
X-Received: by 2002:a05:6e02:5a3:: with SMTP id
 k3mr2039637ils.302.1623813852429; 
 Tue, 15 Jun 2021 20:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210615032937.2328468-1-pihsun@chromium.org>
In-Reply-To: <20210615032937.2328468-1-pihsun@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 16 Jun 2021 11:24:01 +0800
Message-ID: <CA+Px+wXsb69fyQ41aX9T0jXzKFoF+6Y0zO+QJcLkxfTJJNa1hQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Make hpd workqueue freezable
To: Pi-Hsun Shih <pihsun@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 11:29 AM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
