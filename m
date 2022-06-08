Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80A543EA7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4501137A1;
	Wed,  8 Jun 2022 21:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6B113713;
 Wed,  8 Jun 2022 21:32:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D2CB60EF0;
 Wed,  8 Jun 2022 21:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C33CC34116;
 Wed,  8 Jun 2022 21:32:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VrxLCr00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654723919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=G0Z6Psd+6fTaIXqofnHAoa2VZtuYSgq5i+2RnQStj/c=;
 b=VrxLCr00fJKmi5F0ZvJMl5YAbkap/0etsUequRT8ACvqr96xs87h76yt8vn0IewIP5idHv
 1TfXswHbHbXc79S50GdQyoMdkLkM18cH+RuWmFGLhYf+V1NSivJcgIOZ6PmkUC+taCGfp0
 N4obIow3UXtQEwhhG4No063KMsOcRxY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7458cda7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 8 Jun 2022 21:31:58 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2ef5380669cso222739517b3.9; 
 Wed, 08 Jun 2022 14:31:58 -0700 (PDT)
X-Gm-Message-State: AOAM533rMMpi03/qVhtUC6c3KMpClnCwvloLbZ9tfptO7pqtBmlxhnoS
 peESRgeKiQY9ObWiplmyhuESi9My+TeKfrtsmyU=
X-Google-Smtp-Source: ABdhPJyes3/Zv39TJZ4hMZhXqyeShfvjIUgeZI0+wVypo/Hp+UJMx9+IdmTZkrhKvQxl0PesfIfgQ21oa0yWFjZbm5k=
X-Received: by 2002:a81:5305:0:b0:304:a8cb:9589 with SMTP id
 h5-20020a815305000000b00304a8cb9589mr37954399ywb.2.1654723918181; Wed, 08 Jun
 2022 14:31:58 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Jun 2022 23:31:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
Message-ID: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
Subject: i915 w/5.19: wild flickering glitching technicolor pyrotechnics on
 resumption from suspend
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org
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

Hi,

Using the i7-11850H's iGPU, when I wake my Thinkpad X1 Extreme Gen 4
from suspend on 5.19-rc1, the display shows wild flickering with
strobing colors and more artifacts than real pixels in an utter
disaster explosion of pantone, as though bombs were dropped on the
leprechauns at the base of the rainbow. That sounds ridiculous, but
the strobing pattern really is a sight to be seen.

I can only stop it by rebooting.

I took a video, but I worry about having private info in my video
buffer, so if you'd like to see it, email me privately.

The system is otherwise operational and fine. Nothing in dmesg, even
with i915 debugging enabled, and if it weren't for the display
artifacts, I believe the actual rendering in video memory would be
fine. So this sort of looks like a display driver or some sort of psr
problem.

Let me know if there's anything else I can do to provide more debug
info. It's pretty trivial to reproduce: I just put my laptop to sleep
and wake it back up.

Jason
