Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1B401611
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 07:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAEB89498;
	Mon,  6 Sep 2021 05:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B835A89498;
 Mon,  6 Sep 2021 05:55:13 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ia27so11128589ejc.10;
 Sun, 05 Sep 2021 22:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=P27TiIB1AvSu+TvDvxk3MMIZIx2zJjjWJI/QWtvnLTo=;
 b=fUakdIuMVxlQmKRHOV6pNC+ctvABtgT0G3t2loFUoCQmXbYE2621E0wIWq3kQFxUE4
 8reTehXzbeA95132p59odAq756lulzOw1MFoVU8waVkGWm2mgFJnf0X2pyqth8OGpBSX
 a4fqDpICPtb9FzRcHFD7IbOZ19F4o7KRkFRX7kGCGB3LyG7zcByYTrxKbqoE4HzW5N+k
 VsI7kPS3V6SSxNENh4xkockacW+U+wWTGYEOzOjdpuj1d8ZbdXTU/my0h1uis/EVXxJ2
 1JJfT8pb9YDf6zcGS0MulcRe5RX5AtvRNuwVgzRV+wH700VAUUuQR8C+skwCl3KFZgpS
 Un6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=P27TiIB1AvSu+TvDvxk3MMIZIx2zJjjWJI/QWtvnLTo=;
 b=ChjUS+IuSXAdF0RhMecSQ83DIOHR7pJvk8UZ/Q3CKUSXsF4ci96Uww0RtqrHJUU0BM
 U7t566b9++QWcADfQRgb8xiXYe9FLB920TDHPjCXV06hFg1gAKD129gnaSBq3IoXfIUm
 Rx42E8vUkZkIA3r3Zs4iDQUvGQE8guDAyUoe6mAAB3RdcWVaEEHz/WAgsr12HPaOnMM8
 PZT6W9NzS+wTEmQje5QM6+CTtnXFHOJC1kFtarjPPwRtPxzXmFc5AZo166NA3S2Dz2Sn
 zlBqjYCOWNXU70UyhUobl8eueBqgLIII9pAkXxa7WM7JcxYefo1+X2XPMvm+xrR0fQaU
 O6wA==
X-Gm-Message-State: AOAM532DU1vXMiyuSOfPjjga91CgCMI/wEjbvXpMNcbIK1CPBvVydfMh
 +0z1LQm1vX24TNbtkzULVQQbE5othdd1ZLKQswHUKPf5kQE=
X-Google-Smtp-Source: ABdhPJwJP11zsmWkInN/05LTa7dbAeWDYb7sWh3EmIo3ANGZ2zn59lXwQr2/kCJaKDx4TKSgQ+oMjcFmhwCXdbKKNwg=
X-Received: by 2002:a17:906:169a:: with SMTP id
 s26mr11667041ejd.190.1630907712185; 
 Sun, 05 Sep 2021 22:55:12 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 6 Sep 2021 15:55:01 +1000
Message-ID: <CAPM=9tzoNWJtL4QU6A0zf36Bdw=gfOQ6fnhqg=7QbktvZ5Hv+A@mail.gmail.com>
Subject: intel display struct refactor
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I posted an intro set of patches to intel-gfx earlier, but I got a bit
OCD and kept going here.

https://cgit.freedesktop.org/~airlied/linux/log/?h=i915-display-struct-refactor

Mainly looking to see if this is interesting enough refactor to get it
landed, I realise it would be quite disruptive. I'd also like to see
if I missed anything really obvious, I wasn't sure whether
vbt/opregion were suitable and I may have left some stuff behind.

Dave.
