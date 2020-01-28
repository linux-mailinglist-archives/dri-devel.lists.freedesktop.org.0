Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DB14BB41
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 15:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085BB6E85E;
	Tue, 28 Jan 2020 14:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE716E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 14:44:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so16275763wrl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9lIGO9oYKE8GChoDkL54V4yje71IS6ZdWhqN7ISd45o=;
 b=eMYuUql/FnPYaJ+EEN56YoZTUOWcP20+UQNDlNe4pSFAQGtuZtp/2G3aQmNvyypUPa
 mXF+9CS70Q2Lm/4prUfWm3AY1yJ9un5TpuOJbaPjrN9hJlMdjJKohNhz5tvRz7sCtNxs
 IVllARx39ZX3Ep86gi+JbPdcuUZjdoz81H9Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9lIGO9oYKE8GChoDkL54V4yje71IS6ZdWhqN7ISd45o=;
 b=Rjmj9USuqBF0zdJxMbjT2HVnysKwqtXkiEUkus7R+gFqkAUOIzYuJ6br098FMO/xvv
 JQ34WGgLM5Zgwg5N6RdnlkZQgf9qyd+CxLtJQRmM2GGbtaTBMsp6i8FLMi3CF09lpxZ/
 6MQ5ON4eZ2EaJdUdD9Sh75zPXjfapfN0vHeIP3x8OZx6iEp94DThQB83Z3FmGijn9GEV
 h4rkemg4erhnfgfneP72qI3SVQsMZY5billS9PeSTYxg2R6dPGIxWngKM/7ybi07E/Y8
 cO0rKeml5fUorPn6rtzcmUXLxWvzkouXfjI7ho18Kbm3QGbrtakHSYqCPynkbHxLrLMo
 HWvw==
X-Gm-Message-State: APjAAAV9f15YE4QcPF+DAf4aJE7VCsZmS2kdm7jqzso3PdZVyROsv2Im
 2zRVdGkAV8UWCqIYLeR3+UPQcw==
X-Google-Smtp-Source: APXvYqw7eO11K3WIv7JughSyA68/clD2AyaUv1hHov10zFh0gHcrtvdjNHATexfiGjHilyw+GslxVQ==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr29849445wrn.280.1580222692349; 
 Tue, 28 Jan 2020 06:44:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d10sm26313774wrw.64.2020.01.28.06.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 06:44:50 -0800 (PST)
Date: Tue, 28 Jan 2020 15:44:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 03/10] drm/atmel: plane_state->fb iff plane_state->crtc
Message-ID: <20200128144448.GC43062@phenom.ffwll.local>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-3-daniel.vetter@ffwll.ch>
 <20191213195330.GA28111@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213195330.GA28111@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 08:53:30PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Fri, Dec 13, 2019 at 06:26:05PM +0100, Daniel Vetter wrote:
> > Checking both is one too much, so wrap a WARN_ON around it to stope
> > the copypasta.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> 
> Applied to drm-misc-next.
> Looked through the whole series:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Ok, pulled in the remaining patches, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
