Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA0BC2853
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 21:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78510E2E9;
	Tue,  7 Oct 2025 19:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Yb0ixHZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6105B10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 19:37:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B1A204E40F65;
 Tue,  7 Oct 2025 19:37:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64481606C8;
 Tue,  7 Oct 2025 19:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D315102F2176; 
 Tue,  7 Oct 2025 21:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759865875; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4GcWK5Hme5WCrSE/n/v4fGwUF3MXcCwR4mya1TPBBHw=;
 b=Yb0ixHZ9OCx4HZ8HP9niaBIyueqHaMT7Ipq0pdbnE0i4WY2Ng5Mg+xgzwQs68bH/pNFSnk
 K3AKjz+LtGvdzXCI1pVRMaVajrNkDgV6T5la1kzbEkvO28RA5r/VjCtVzJZfaDnJ1ny4Wl
 6KEJdUNvPwq6X/+cD1wiTbpZWX/ZgZMZelEhB5JIPCUEMSjMEv/EUiNDyS9WxcTRj1jGH9
 Pmf9mTOaneqZOH7bbSjI/4lSZy3ddI5yqsTN+B2cw4t3rFZIQwvjQl/WkCajGxbS2rmo7e
 uNZfenJmiQWnR1Dy0NIEQfAkP63mKj4DkpwzjClaKNW0XzyyD36AcUVIXw4vIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 21:37:39 +0200
Message-Id: <DDCCDQMTQG55.1K25Y3U0JE15Q@bootlin.com>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Prashant Gaikwad" <pgaikwad@nvidia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Jonas_Schw=C3=B6bel?=
 <jonasschwoebel@yahoo.de>, "Dmitry Osipenko" <digetx@gmail.com>, "Charan
 Pedumuru" <charan.pedumuru@gmail.com>, "Diogo Ivo"
 <diogo.ivo@tecnico.ulisboa.pt>, "Aaron Kling" <webgeek1234@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250925151648.79510-1-clamor95@gmail.com>
 <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
 <3862885.G96rZvMJ2N@senjougahara>
 <CAPVz0n2shn41h4z4PoMdtCXzj+96ak69TCqt7Ag5qpqdWi6UWA@mail.gmail.com>
 <DDBGU9ELXIAW.1RLHSNOPVR9B3@bootlin.com>
 <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
In-Reply-To: <CAPVz0n3EB-tw0af+O4acmbvXNHkH62t5v3r3O0nedLs_XJ39PA@mail.gmail.com>
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

On Tue Oct 7, 2025 at 6:02 PM CEST, Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 21:=
55 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>>
>> Hello Svyatoslav,
>>
>> On Thu Oct 2, 2025 at 8:20 AM CEST, Svyatoslav Ryhel wrote:
>> >> > > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 f=
or U
>> >> > > > plane and 2 for V plane, total is 12. "but explainable with a c=
omment
>> >> > > > and improve-able later" why then we cannot use 12 with a commen=
t? this
>> >> > > > is all arbitrary. Downstream is not wrong from this perspective=
, you
>> >> > > > don't take into account that YUV420 is planar and it uses 3 pla=
nes a
>> >> > > > whole Y plane and 1/4 of U and V which in total results in wigt=
h + 2 *
>> >> > > > 1/4 width which is width * 3/2
>> >> > >
>> >> > > Yes -- but AIUI, the only thing the bpp value is used for the byt=
esperline calculation. When we add the special case for planar formats, whi=
ch doesn't use the bpp value, then the value 12 is never used anywhere. We =
should at least have a comment saying it is unused. (At that point, we coul=
d just hardcode the bpp values in the fmt_align function -- but I don't min=
d either way.)
>> >> > >
>> >> > https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html
>> >>
>> >> I understand very well that for YUV420, each pixel has 12 bits of col=
or information. But how many bits of color information each pixel has is no=
t useful in the context of this driver. The number of bytes per line is not=
 related to how many bits of color information each pixel has for planar fo=
rmats.
>> >
>> > No, it has direct impact. This is how buffer size / image size is
>> > calculated since we place each plane consecutive. And bytes per line
>> > is used specifically in image size calculation. This is common part
>> > with non-planar formats. Then since Tegra provides a dedicated
>> > channels/buffers for each plane, configuration of planar format
>> > includes an additional step with calculation for each plane.
>>
>> Sorry, I haven't followed the discussion in detail, but I tested you ser=
ies
>> on Tegra20 VIP and capture does not work, with a SIGSEGV in
>> gstreamer. Bisecting pointed to this as the first commit where the issue
>> happens.
>>
>> I compared the input and output values of tegra20_fmt_align() at this
>> commit and at the previous one, and this is the result:
>>
>>                        before this patch     with this patch
>>   At function entry:
>>   bpp                        1                     12
>>   pix->width                 640                   640
>>   pix->height                480                   480
>>
>>   On return:
>>   pix->bytesperline          640                   960
>>   pix->sizeimage             460800                460800
>>
>> I hope these info will help.
>
> Which command did you use? I have tested with ffmpeg and
> yuv422/yuv420p and it worked perfectly fine.

I have a simple testing script that runs these commands, with
VNODE=3D"/dev/video0":

v4l2-ctl -d ${VNODE} --set-ctrl horizontal_flip=3D1 --set-ctrl vertical_fli=
p=3D1

gst-launch-1.0 -ve v4l2src device=3D${VNODE} num-buffers=3D500 \
  ! video/x-raw,width=3D640,height=3D480,framerate=3D50/1,format=3DI420 \
  ! videorate drop-only=3Dtrue skip-to-first=3Dtrue \
  ! video/x-raw,framerate=3D50/4 \
  ! queue \
  ! avenc_mpeg4 \
  ! mp4mux \
  ! filesink location=3D/tmp/grab.mp4

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
