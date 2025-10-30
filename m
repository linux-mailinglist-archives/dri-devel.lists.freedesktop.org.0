Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102AC21BBC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC5310E899;
	Thu, 30 Oct 2025 18:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="BDLL53vX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C010E899
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761848441; x=1762453241; i=deller@gmx.de;
 bh=/odCBWR+Pq3HacmzaIFFuJm1sPW7ZuokWjACy9t2cdg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BDLL53vXJ1TvPqHhxw21bGvG5QM/s5JwcPHJ+NsaJv+PeoR3F8jRxnb7x/6VWpPD
 BPZnpZP2GrHc2NdFYTFV/xQvLSwXa6GNpbpyvneT5xzRXetSIiJV8BbTy7zWm1MZ7
 1oZ/rZ+e1oc8dPjMaSpbpfnc6vPXURdZD1IrB4YSivElyHRmk8brmODLOQ7dWXoJy
 dHfWG+6BBchb/48nzgOTpHA+/b+0YA2aRCqV1/wjMi1mDC5HGeR2Ew8tRx7c+TdXi
 ZNzR41H2/5zUtVwj84Beyay1twk/KZgyODhXHS5hTds42F0boDGSCzBHKHSTedPYC
 1NVv9JP20b3EIWhD2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.209]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1wFwht1g5J-00sk3p; Thu, 30
 Oct 2025 19:20:40 +0100
Message-ID: <26fda686-8888-4080-ac79-3367c0b5365d@gmx.de>
Date: Thu, 30 Oct 2025 19:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: vga16fb: replace printk() with dev_*() in probe
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20251016105446.3646544-1-vivek.balachandhar@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251016105446.3646544-1-vivek.balachandhar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9qKFtxAyq4VXX5eiVuDHiOd/mDt5Ujt9oClUg1itYl/R+LxjPTo
 YxTc73ynhUZCZZzkuXhJb6ub+u+r9MU3EjXc4YGrCHZXneQjPBdH/hjC8MNTDFijHvoDqyJ
 qhh8IGhUMOXHto+xPK0E/Eop3y3GXL7OSZq+4laHGbOWKVe+56HOm6Yn78pT3z39RyUiB7D
 fgNCg0twQyKH/tfc9YtRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+yZYqESOO18=;OPCLdiWPX0bP+UJLXbICsvcweSO
 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
 t5rNb+797/VbCwpdIFZnXWART8=
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

On 10/16/25 12:54, Vivek BalachandharTN wrote:
> Use dev_*() with &dev->dev and drop the hard-coded prefix. Keep
> original severities. No functional change.
>=20
> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
> ---
>   drivers/video/fbdev/vga16fb.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

applied.

Thanks!
Helge
