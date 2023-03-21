Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A606C3261
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31F10E77B;
	Tue, 21 Mar 2023 13:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4457710E77B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:13:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A063CB8169C;
 Tue, 21 Mar 2023 13:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D874C433EF;
 Tue, 21 Mar 2023 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679404392;
 bh=Ie0I6DspmqUGmFzLY8M9p06FQQUjb9WBd6Z2Y5RxFMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCELKUAO4DmRhWUevMaHTsfdWUOjmOwX6QDGRTGx8cr2tDflzYANu1EphfFEiuacN
 73IJBFv8dFoFgJspV1c2kimtV/h9RslHEeXTHNU71iV2EBgXhherzoHszVgFNDN0Y+
 SQEdUjvv4ttww2/mSl2jf4bmNKcGUD/3FSuCmYCoXHhZK3ojjR3yc8cHxkZ2MdqGDw
 6zp/6BorvlCFtxWIlglrzjZLZjn8khx+muMaJjNKTzhW6I/CZ5/1CJX4uQLO80aQO2
 T6Wec1E+zo0rJmtBFFf3unDCUrY/YYGRwClwRdqzpnsbNM7/shgpSK1BcTieLe2ZLh
 4e8zFbiwUOlmw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pebox-000683-A5; Tue, 21 Mar 2023 14:14:36 +0100
Date: Tue, 21 Mar 2023 14:14:35 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix missing component unbind on bind errors
Message-ID: <ZBmtu4klxYwQyN7R@hovoldconsulting.com>
References: <20230306103533.4915-1-johan+linaro@kernel.org>
 <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCBsC+P=zvh6RF3UKiPnferUYU0QZvZfnn1oS5xWX-65Jw@mail.gmail.com>
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 10:41:18PM +0100, Martin Blumenstingl wrote:

> On Mon, Mar 6, 2023 at 11:35 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> [...]
> > @@ -325,23 +325,23 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
> >
> >         ret = meson_encoder_hdmi_init(priv);

> I'm wondering if component_bind_all() can be moved further down.
> Right now it's between meson_encoder_cvbs_init() and
> meson_encoder_hdmi_init(). So it seems that encoders don't rely on
> component registration.

Perhaps it can, but that would be a separate change (unless there is
something inherently wrong with the current initialisation order).
 
> Unfortunately I am also not familiar with this and I'm hoping that
> Neil can comment on this.

Any comments on this one, Neil?

Johan
