Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BF358C481
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 09:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011219301B;
	Mon,  8 Aug 2022 07:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A7A92C04
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 07:52:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q30so9865617wra.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=IJ4kunP1J9pj2q4yZwyvQMf3KoEr+bUd77eXvDlFmvM=;
 b=7OMB237UVNyaV3vNucxwikyrOugV6/sDg/hkJIzgLZlxDKoRTrlWNsFy9ct8cj0GJ2
 wYTdnM/YrkU5DirkEzRF0fwQp3jy0S9aHtFrasiQyh+sbAriAHPHl3OdOyeN2RztfDPL
 KmAlwZUHzY7GWyWPrJK0j6KN5cXgqkGgNW5PE93mkWprStUfJoZK4bHu+m3S+n6TqW+H
 gH8Hu3AsiNveHsa/QRuEgfchKpxzHPy5gOz8FLkBdFsvy3pTjqnGl9/U75udYKZEO3eq
 sYlJB7vN6yNz61aRqoPM8AglPF3cByra40plcjRuGSPciuVtQ60Pep1bcd7jdetq4TcN
 cAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IJ4kunP1J9pj2q4yZwyvQMf3KoEr+bUd77eXvDlFmvM=;
 b=y6/Wf3tRPO1YA80yUVZG3SruTinuoDNqhw3/kTNVUhaf3wscyRkRq3AZnir9IFHfnZ
 VoCnqbn89dU18/X1e3PZ62JzBVATiNCmHcOOCcFH9qDOnav4mGy9s0eFuWChp20XUqlV
 Lc4J77giWQnQUJq3xca5FAATOWqwTAPdxo4ZPgnVYfNHEH9V7OFuFq91/1gQw+xY2Qjt
 kxUDtzDsd5jTcTSyiyfeYVloNmukI3TPirrB0iIZwctobcvUS4U6tXj/GJ5FxMm7KjY+
 KFXLjzDvqKa85EczlbZPR3as+rBntTvGJn+a2LayacuSlN5w1zxgjzi1KtGIIyJvWr08
 g7qA==
X-Gm-Message-State: ACgBeo3p9pLH0m2mernCf2x+F6le6zqKMUlCUxd/2slcFMRPNdxK2Nnr
 tBZEVy3Aa9gGv42NeUJGhpW2Kg==
X-Google-Smtp-Source: AA6agR43e+yqIlLSyJSG6dgGvsKXg5JEqdq3EVBg6TTrHBtXN12v7SlbDG3PCFvH0ktIrKBk8z9W5g==
X-Received: by 2002:a05:6000:61c:b0:220:6425:c113 with SMTP id
 bn28-20020a056000061c00b002206425c113mr11149522wrb.612.1659945133528; 
 Mon, 08 Aug 2022 00:52:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:1832:7d81:d0f6:dc4b])
 by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a342933727sm18480533wmb.3.2022.08.08.00.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 00:52:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: airlied@linux.ie, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 dri-devel@lists.freedesktop.org, Liang He <windhl@126.com>,
 daniel@ffwll.ch, khilman@baylibre.com
Subject: Re: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
Date: Mon,  8 Aug 2022 09:52:11 +0200
Message-Id: <165994512091.16922.455382541518056728.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726010722.1319416-1-windhl@126.com>
References: <20220726010722.1319416-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 26 Jul 2022 09:07:22 +0800, Liang He wrote:
> In this function, there are two refcount leak bugs:
> (1) when breaking out of for_each_endpoint_of_node(), we need call
> the of_node_put() for the 'ep';
> (2) we should call of_node_put() for the reference returned by
> of_graph_get_remote_port() when it is not used anymore.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=91b3c8dbe898df158fd2a84675f3a284ff6666f7

-- 
Neil
