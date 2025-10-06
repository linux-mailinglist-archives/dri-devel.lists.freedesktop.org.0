Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F2BBF072
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 20:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CB310E449;
	Mon,  6 Oct 2025 18:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SLuhxf/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4691310E449
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 18:55:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 931261A10CF;
 Mon,  6 Oct 2025 18:54:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60899606B7;
 Mon,  6 Oct 2025 18:54:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C559102F2116; 
 Mon,  6 Oct 2025 20:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759776897; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KEzW3jit24CmXPxdwBbp7La6xIwBqgbqQZqEtvxRu/Q=;
 b=SLuhxf/3XYFe9lSvtSeMg9+E9K5RRLzpeO6V1c2rDu+XPhBiz9+8CC4HkyDTDVE/k20H6P
 mUw0uLt/vC1lUh/ptOhnnN8s02feywmxLly41Gn7Beb+CryrbBeU3h6VkynVX2v4t9fRTi
 3e48jHMLpg2HeiMGvVWTkIi2YToLzMywVXpG6Nf0uFRKXHRhrrdGVLCUdyhBhRH9oBlmX/
 HUg29WHlMfpvRBX/GpCd0eFB4Avn/1q/OnnDDz2h46/KHmYKXa2ljekJVxfmHKCqTPGgsj
 sU9xl8XMOy8Q5/T9K6xwDjAlgwkSW3O8LqIiudrODya8XLUfODnncHp1fGWUZw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 20:54:38 +0200
Message-Id: <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Prashant Gaikwad"
 <pgaikwad@nvidia.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, "Dmitry
 Osipenko" <digetx@gmail.com>, "Charan Pedumuru"
 <charan.pedumuru@gmail.com>, "Diogo Ivo" <diogo.ivo@tecnico.ulisboa.pt>,
 "Aaron Kling" <webgeek1234@gmail.com>, "Arnd Bergmann" <arnd@arndb.de>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Mikko Perttunen"
 <mperttunen@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250925151648.79510-1-clamor95@gmail.com>
 <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara>
 <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
In-Reply-To: <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Svyatoslav,

On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
>> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 for =
U
>> > > > plane and 2 for V plane, total is 12. "but explainable with a comm=
ent
>> > > > and improve-able later" why then we cannot use 12 with a comment? =
this
>> > > > is all arbitrary. Downstream is not wrong from this perspective, y=
ou
>> > > > don't take into account that YUV420 is planar and it uses 3 planes=
 a
>> > > > whole Y plane and 1/4 of U and V which in total results in wigth +=
 2 *
>> > > > 1/4 width which is width * 3/2
>> > >
>> > > Yes -- but AIUI, the only thing the bpp value is used for the bytesp=
erline calculation. When we add the special case for planar formats, which =
doesn't use the bpp value, then the value 12 is never used anywhere. We sho=
uld at least have a comment saying it is unused. (At that point, we could j=
ust hardcode the bpp values in the fmt_align function -- but I don't mind e=
ither way.)
>> > >
>> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
>>
>> I understand very well that for YUV420, each pixel has 12 bits of color =
information. But how many bits of color information each pixel has is not u=
seful in the context of this driver. The number of bytes per line is not re=
lated to how many bits of color information each pixel has for planar forma=
ts.
>
> No, it has direct impact. This is how buffer size / image size is
> calculated since we place each plane consecutive. And bytes per line
> is used specifically in image size calculation. This is common part
> with non-planar formats. Then since Tegra provides a dedicated
> channels/buffers for each plane, configuration of planar format
> includes an additional step with calculation for each plane.

Sorry, I haven't followed the discussion in detail, but I tested you series
on Tegra20 VIP and capture does not work, with a SIGSEGV in
gstreamer. Bisecting pointed to this as the first commit where the issue
happens.

I compared the input and output values of tegra20_fmt_align() at this
commit and at the previous one, and this is the result:

                       before this patch     with this patch
  At function entry:
  bpp                        1                     12
  pix->width                 640                   640
  pix->height                480                   480
  		          =20
  On return:       =20
  pix->bytesperline          640                   960
  pix->sizeimage             460800                460800

I hope these info will help.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
