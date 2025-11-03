Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029EC2D797
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E6210E479;
	Mon,  3 Nov 2025 17:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qbC7Vn2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6827410E479
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:32:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6AC7600B0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C08C113D0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762191127;
 bh=3fRrsqvpg1Q6JCWfd2TcBUF0ojUJZfugzjbRvfHErgU=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=qbC7Vn2l1XVkEmbWdOLCxZ9QlnsD6iVlXEOqjhnQoDuyIdu57Q0yPEvT9k1fGGDE0
 fFUX6As5NT5W5+Lphtv9vA45c9gmC4XtCj7ScBUv1pv+i2QTbwzhBPFTWOxjAKXnxe
 WC4AaeZ4k7y9bAQKVbeHpIH8ucC+a2jEqfw8VKCdyuN3OnaHRIVNE9VSltHs5PV4pS
 3EZytlnUZUtG7TiSjVZFq7mLIIXCMV81cV7I5TpwQKw02FFIePxgBVjUJv+HOVKcTs
 uWdXdeCrFhB1Shov85+kAht0uo8lz8xBuGwCxDUrOaz2weuHm+BQjYj+58FjKV9tP9
 UkMgZUrN4acug==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378e8d10494so49209871fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:32:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUJ/+9YchdpszwzjmTuf9TR5ZNIE4OzoZ2PNw+bjWK//2MBKmc6/cjFm56JE4JBTCwLp5d4S653NE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOYxC3nQiKmcGjUtE3PeYm8cWlkRsZXJGV3P5HgaJRMQT5qXra
 kzTLAk1ch5fCybc+/WQ1hXBVkHq2HLebpHVRyy0xeCvYTyCrRTpSe6zcarqqewN8lE+eXaSz7zG
 fE1B27yciAjqZYJVd3rhHAMQAQ4wW6Ks=
X-Google-Smtp-Source: AGHT+IFTQffhb5i+F71J3LOhF5jx6hQRYOqxomHkplL/413quHMbU44WrYZZRRChAb5ZISTcoMgWobqdOxBAKEL0T+s=
X-Received: by 2002:a05:651c:1c8:b0:37a:415a:1fb4 with SMTP id
 38308e7fff4ca-37a415a2387mr3245231fa.0.1762191125657; Mon, 03 Nov 2025
 09:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-29-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-29-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:31:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65btpVvsJV0wJ1zNgyej7LEkd85v7ivpPp8ppzuDxUkow@mail.gmail.com>
X-Gm-Features: AWmQ_bkXFHKrewU0eoPao6ZZMOh9kve-I6lS6VpRvTzlPCKA65lorBRFqLDielk
Message-ID: <CAGb2v65btpVvsJV0wJ1zNgyej7LEkd85v7ivpPp8ppzuDxUkow@mail.gmail.com>
Subject: Re: [PATCH 28/30] drm/sun4i: layer: replace mixer with layer struct
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This allows to almost completely decouple layer code from mixer. This is
> important for DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
