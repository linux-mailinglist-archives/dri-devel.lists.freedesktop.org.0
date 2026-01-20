Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E364CD3C15F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E4310E571;
	Tue, 20 Jan 2026 08:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="f7ueIpoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40DB10E571
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:06:26 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-64c62f69defso5192440a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768896385; x=1769501185;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZyVSgGKZ7rE7RwBbuAawYyoDPy1ltMaT3wd65JIxCU=;
 b=f7ueIpoK3Ti7x81AL4KtBduZE12VZ0HITxf95KsKeE8shQs4CI8FwyQQ+mGy6eKrnf
 eBMcqsxD/MUwFiNm50O9lho6n+XWc6Jd/scr+5tXxP0OdPTNRxwpNfBUWp21u9oVijDe
 Imj1eMIfz4V5cyLVXR1bDZ4EtWjcTgUl2nfyW2IgQWbwJvcBLj9DTshBuBUza48XAfo+
 lOsq4QlqXtisdoR2jBOzHCKZz+5BLQwUSPP1zoSBdhW/b7V2dfoc+OuCZZUwinzZm+Hj
 Gti6FJ4e1hsBoWokLmNoyQe5b9WNsYgFhuEaRSiSvwDxNJ2aVAXUQGFEPid/4+BS65mv
 aQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768896385; x=1769501185;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZyVSgGKZ7rE7RwBbuAawYyoDPy1ltMaT3wd65JIxCU=;
 b=EdDs/4m17kpd73X0vfGoqph/TkievCtaj7dUGGvJ5aMVQEZ/X1xYe5835FUyosGOFf
 MpIVJdMBoZukHm3iXWuGXYchaRlMowOGFR+i4R77OkSG00dS3vhqrmr7+p829naX1jEP
 rubW7H8fbL4lRxbK6WRUccM+fbsXy9PcOvFXr768VUeviHqTS1o91zDzukTJ2Aat2mms
 r5CPZkojcdzfH7C/zY3mYuqZx9MVLbGuqYi5VZRmglhJ2bgpriGTdWtPZ2gpoPAes0G6
 iU3RCrcGOn4r5RO9nlOVfyS1MZRN89c5ollst62eCZjMz5pAajtmRjB1lO8Yk+4KjS1h
 6avQ==
X-Gm-Message-State: AOJu0Yy0awbwE8DZeJQEUcuVTbbaW6Imf8wCjWBPu9TvPHN3Rtl7mDsh
 99Xtch4cWhfoCIkMqRjMZ524iGTZCWYnbkrNAERthmLMIpO7EZx0mOeSdF7Lx5hOmrNZ7L87sfw
 50HwzpfFTLZedITaPmA==
X-Received: from edy14-n1.prod.google.com
 ([2002:a05:6402:534e:10b0:658:775:9fc4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13d4:b0:640:ebe3:dd55 with SMTP id
 4fb4d7f45d1cf-657ff298c99mr895307a12.6.1768896385388; 
 Tue, 20 Jan 2026 00:06:25 -0800 (PST)
Date: Tue, 20 Jan 2026 08:06:24 +0000
In-Reply-To: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Mime-Version: 1.0
References: <20260119202645.362457-1-deborah.brouwer@collabora.com>
Message-ID: <aW83gHux1JSYWPdz@google.com>
Subject: Re: [PATCH v2] drm/tyr: use read_poll_timeout
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, boris.brezillon@collabora.com, gary@garyguo.net
Content-Type: text/plain; charset="utf-8"
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

On Mon, Jan 19, 2026 at 12:26:45PM -0800, Deborah Brouwer wrote:
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were not
> available in Rust at the time.
> 
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
> 
> This avoids unnecessary delays on start-up.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Overall looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

