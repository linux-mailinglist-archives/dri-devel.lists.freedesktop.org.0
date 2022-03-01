Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D494C8C18
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 13:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48FC10EA96;
	Tue,  1 Mar 2022 12:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72A10EA96
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 12:59:20 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g1so14148574pfv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=nuu3cVVJjajd7dp7VsroPAi7NZsR7bwDCDyyjbpRDDujUD45s9McptaCOOXoXmneOy
 zxJuahcoTO4drggn9XJcwzdzajMa+fdXw350MDNp6zxREw2Gep9TLUbSXsJ6IS7b6fsf
 FI0lXYNxy7SJzzoSf6jwmyNImco8IC5pHtjEiVlWfWeKVYAIPinUe6GksyW6ulKx4XIn
 AqMY6RblJl0ewm+R2OORH+kelTRfIMXF5lQglQZftDw403f17lw3aCqf2olgaSvzUmE7
 BpdYq4uNmdY7eHl5CQbdtm85vIXoRo7SrgJVAa4EkC4hV2DziPAAuDy16fEDb8RZsJ2R
 75DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bBkJiLuPHjOc9NWEYiRCYWyb3Lk5w/JeF/xlR5gs4hs=;
 b=BueygiqsrPICGrDwUWoFv/tKBSpprJkbcUghK1PTqkVJHSKh3Jb6ueFEMdIKVyYr1y
 QU3thdUP1OV9JAKn0HFeeJjyyXMlL38maTEjqI1xT0AhQb5Hwe2Kakoz21nZp8jhMpvq
 X/NQoi90rdLm2hSvUJkG5zsSx8i/bndUMy2U/AIWmHkx4zxvROiJ2UEsxWK6xvTaFovE
 iLpHDAjyY+Q4r7Zzvkhf4jBTMfgk7uBQZhaZ2GcMK1WJ29ibJj5dBKc5ar6DM55GjuId
 RSu/7wLFg52nMqLpQ8/NPw3oEkD39NsmhmJS7yDtDSlSQzIvicLYjcIw9p/FjHYqtHnx
 8L5Q==
X-Gm-Message-State: AOAM531vx9g5ASqZG3ruL8EgUMDTc2k7Sj3r1sMV3HYI2QDQzR3hu7fa
 R7aAs6LW12cbG1f77z6lzcoY2t0/N/DaFXK9Br9ZEg==
X-Google-Smtp-Source: ABdhPJz5o1X8z2TsaSIkdJIabo/YlIe+WW8U2EEB3DJBD30mngq8YsXa53vGa9HF0FikZSi9S5b2T/g00LPwwDKYwhE=
X-Received: by 2002:a05:6a00:889:b0:4e0:dcc3:5e06 with SMTP id
 q9-20020a056a00088900b004e0dcc35e06mr27183989pfj.29.1646139559900; Tue, 01
 Mar 2022 04:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20220228081421.1504213-1-hsinyi@chromium.org>
 <CAG3jFysyV8QHO4zEdUYLxt9eBnGsHWrXdWbicmufUPnTB-oRLA@mail.gmail.com>
In-Reply-To: <CAG3jFysyV8QHO4zEdUYLxt9eBnGsHWrXdWbicmufUPnTB-oRLA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 1 Mar 2022 13:59:08 +0100
Message-ID: <CAG3jFytamPBHyBBFz7Z6Utfhe4tPh-jfH4hOVLK6GuJxacMmug@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Fix the read buffer array bound
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
