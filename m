Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFEF23000B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 05:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1B789BA3;
	Tue, 28 Jul 2020 03:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5E489BA3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:23:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qc22so4365904ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 20:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Sd54gG54Ze5yTPEdGHIeadb/Kn7Njk5nmifinz29gjc=;
 b=tsa6Ya8FZeWtX1olD3E3CK0Mkma86fPXKlwCBqas0I097Km2OB4saLhWPz9MdKxOqo
 jVsRI5m0dB937zjUPHEiudQ3zFjuL1ecZjBvvtrgNmU6p36k4psTBoX0be9Cu0hhKnXI
 LDl8Esfb/Ed1NJfsIlgyzPDXXpti6oazRBNIWBUCDl+IBj1F8YA7iPTAiE74/ZaSKulf
 ybStqWGASCMi3pvwnruxS0RNKKpviDFTPne74SMh+Rm9rv1dnc1YcEFQUK/h8qzZKLYg
 ZQgrpMIsaSjKrLY8XbzcdNzu7AgsYDAhHTk+4DuT4ThCAM6m/GBMMBRXpdwcZxx2AgAu
 cMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Sd54gG54Ze5yTPEdGHIeadb/Kn7Njk5nmifinz29gjc=;
 b=pb0cu4lZsinWB9K1z6/nOy+dRFxqRh1zrBlAudwNfhNJffwqpHY1SPfhQeWoqyPLmZ
 3Krjhe0I70lZRdWZ4yPrPT+vOTaOkKK6fMMDdQsJz7EfQzSAYkK0l8jNSp19HQ8eP5eq
 Zl3lSpKejMqGo0U8klYblRqhAidIB3DA3WTgMfwIm606yj2D93JLzvnSJIBiPLamKPUg
 65t+HY460Pe0of0aT3t939cFtSoT7ZOaVuq+A7+aFBvvQnxk3lFrURNt0acNmWW/4DJ8
 3Dai9b06zlSoB/V6BImjdL31VYy7r+wawSC2BkQNlgOy8A7g34Magq+PYroefdPWy6Fu
 dCGQ==
X-Gm-Message-State: AOAM532A2haLM48vyvE4BlXPBix0OofcT9iMkPGN0wHP1mgaC36nzRQs
 5DOncRiV2VEYXvWIhtSLDDXT1xdxi9Hq14kiVNQ=
X-Google-Smtp-Source: ABdhPJyiksBasnumtBvaHvURoWmG2msFPfs+vOdpAdypVeWfyqr5KZ8duEJ6stu42+q+6qsxkIk7YH1vraOIBvieVIg=
X-Received: by 2002:a17:906:1104:: with SMTP id
 h4mr14573799eja.456.1595906617452; 
 Mon, 27 Jul 2020 20:23:37 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 28 Jul 2020 13:23:26 +1000
Message-ID: <CAPM=9tx8V2TWSTwKCik1iUvnQExZoBtGYdQZ_4MdKjdHmQJE5A@mail.gmail.com>
Subject: ttm_tt_set_placement_caching on vram->ram transfers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian + Ben,

Just been reviewing around driver TTM code, and found an inconsistency,

amdgpu + radeon both call the above before binding the ttm and going
gpu vram->ram copies, but I don't see nouveau doing it Not sure if it
could cause any issues, but it does look inconsistent.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
