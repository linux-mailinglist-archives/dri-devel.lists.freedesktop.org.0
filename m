Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5516FE8C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 13:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD896E8D4;
	Wed, 26 Feb 2020 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1B66E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:01:28 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D58524684
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582718488;
 bh=FpyVEARCSs9sAMP2l7EIGOuJhsv40fMzjCPFhYKyj4o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vu3VN9CwGtzFeQfoR9eLsEHD0DUPSiM/G3OakGBG86OEiacAutqDdeRic1S2jPSsF
 plGlXHzNdkrF9CKAGCCAZxCQt7E8VEnx4Q/cRjm0C0k2+8O4BCcbpculQEJEMAZnJj
 aRyJ3s5TGt/6rut0GVdIXSsnEI3p8YaUxbJLHy1Y=
Received: by mail-lj1-f181.google.com with SMTP id q8so2753415ljj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 04:01:28 -0800 (PST)
X-Gm-Message-State: ANhLgQ23hkIECmkHC7jlxQrKQgQwNWCNEohKIwiUJc5Ih8/QEKVSy/ny
 iz9hYaOertp23/mHfsAm6cCErRTF9DZ/48AfsUI=
X-Google-Smtp-Source: APXvYqy+ftYsndx8N+Hf9GSnSNYeI1qhCIZuvQ7Kh3v5UoS+yEzqmBHVTFmu9cW1XjynUq/5ObSBqifL/1L6V9TuexA=
X-Received: by 2002:a2e:9705:: with SMTP id r5mr2873915lji.114.1582718486296; 
 Wed, 26 Feb 2020 04:01:26 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
 <20200226101307.16708-1-m.szyprowski@samsung.com>
In-Reply-To: <20200226101307.16708-1-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 26 Feb 2020 13:01:14 +0100
X-Gmail-Original-Message-ID: <CAJKOXPd8Ed9gHSmOf9psxhwDM9BW2C8if-UuoDZtz2cX4Yx4Ow@mail.gmail.com>
Message-ID: <CAJKOXPd8Ed9gHSmOf9psxhwDM9BW2C8if-UuoDZtz2cX4Yx4Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Feb 2020 at 11:13, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
