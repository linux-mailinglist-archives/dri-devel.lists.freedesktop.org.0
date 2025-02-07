Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156BA2BC29
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 08:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E1910E261;
	Fri,  7 Feb 2025 07:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="hvUd7utI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Fri, 07 Feb 2025 07:23:58 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407B10EA33
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738913036; x=1739517836; i=deller@gmx.de;
 bh=kAKZCo3esVGnp3evNk4iZUTTO8n3Hjp4Ic3UjHG0NBY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hvUd7utIQ7Gj+77+L5vNLDEhCwmKarSkaBUT9xd3I0RwySt0g/vx2LXNCES9fRUs
 U2IexaXDIYsXM19riG9je8IKldWw3yecvH6sbdn89Sz2IRdegshcOsDAsc/97MJRv
 3QEnOIDxhXmWZXdEq07SwMnS7WQm+NerItUuZYj8lfi9ktyVr1s4KSC2g0FfD3E4a
 7731/C0mENV8zRVeAEkC+MvdjJqYyLUE6rbdZa19feojSBRWIWnb64GeOTo5Eit+0
 EtCv85vGPG530rJ5GKu9H+YrNrUzM9AticRmTM5DlzME1sjKPe38EanghFmN8li5c
 NPC0L91bEO7bCTe7TQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZkpR-1tsgxf39l9-00U6ee; Fri, 07
 Feb 2025 08:18:36 +0100
Message-ID: <9c5c609e-04f5-4fe0-86ad-107559f14140@gmx.de>
Date: Fri, 7 Feb 2025 08:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
To: Zsolt Kajtar <soci@c64.rulez.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250207041818.4031-1-soci@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250207041818.4031-1-soci@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K9ek2KXy2tESx8+HLfP1xN97i42Tu+rQIYGrapn9rJZtOBsY9FS
 vY41UZOKtTzE9fiqeHCRvBpZuoX8sHLMOXhA6DADbQ/RSz/5kj0XfxaXn4Fd9In0cWZShFd
 nbDP65w0R9o17lbrDIeByvYgf5R4pdMgl6Lqy4OxCBPSzqegQgLs8OPsdaW0LNwCuNRE0RD
 vla3bp+KpCCKcwErBMRBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Or8KUmjAF4U=;Wh4ZG5MWsX8UPExGuYXGwtqS2Y+
 1dD8mSxvJt6DaI1J5a353Y/5Wt/eP1Hoy4m03SuwK2mterLeJ+2WyYwliKJS9/OUYlULd+Zo1
 Q8jomjfP/XC9INWDDuEB0F1p/3Edxss7Yq8/IzAffQe16dEQKkmGwISqqh2FYAaoIpONAwD+0
 URnboweo/RiqgIUwpEjus2KSelpxxocH2/WXBN+2dGxK2dmQbpPdyXu981zrdmkonAQbSATyI
 Qn1pFsGb21dUQsst6kR+g6QEytq/sKip+9mbfbK/bY/i7cPFuwfs+Ctv8I460/ytNK9GDu/0X
 vB4Z/ikLta9mYGJujw7XGxWKWHab5LUgqzJKty7BhztulxRJy7dipCoMaMMMZH3wmgX4RvF0S
 0fourh0KvkRqpTZNwaOqZ5DdQBRJu2hibTm33uGK/uh+ul5mlawulKRjhSfE94WDe/Togo+SH
 Z8Ov0XhzU7vdAH8qHW028VrgO68guZLk4ETI4gYdJXgKuhuAiX14AhhCJwler2UZu3NmVd1LM
 Ohr9PSjeYB6gQteSRx/TLR1ochuKgmEJhDeqTqFhvFIZmrwr+dFVRZ7Q2QL/kOzjbyXPZ8YKE
 Mo85rtxUeFvyLGkF+Nn0YxH9yWHKsLs7pnCT/PhaLrUqA1qYKK1jKmrb8LwIK/CkljgfH/A8E
 leuXmxgbWpOkfJATMI40kspTAThaObi6S/dQMFdmn7spZMhVLbD6f3wi1zW8wS6+p9mpU7qb+
 lUQZ4ayr0YWJnbuNCcWwijMzJF0M2+12WLUALAGS8b6/rLIRDSeoU2QjhHko5PWr/AYvePiWG
 alMdYbWisdcJCq4/kq0Q9fes8typamgOBvxXYw61cBHuMmoAv79RgtGYkzzfUQ7ptHm9WlNJ6
 nS6Ym1ixO0Av3aUcg8pG7wFVWwBajj7IWSqLW6FexaGxV+UJ94dyS9hvXQ2x8iIdr3BsSnYcg
 JN+SiJfpjn6FLbIVSbFQxpBKcozeAXjSWrQKzalNcEys0fAzJNRkBZWm3qUgU4XxydD3YCddL
 da3C5TgULFoB4tE2GfIOEx2ioQLMYzUu42vfrba8kJI+az0xBXDfEWYDjRp4q6/CMSPxq/D9p
 pbfW2ayf0BofaW/HvbqgJWjggTOrNu/CWEXc8FiFLOdUildtwmimHMLA/s4g70HIHxz5Ll4jR
 i60bbTP/VJ1S1MfW9T0mvzBDwJlNhnfv3bRH5U5SGnNMjByUUGR0Hl93wCQ3TcricNYh0cpC3
 CXZ5QSf35qGwhBiFgO91ZiW2uXjZ6n39So0NzODcPci16O+uXgiKXWf/jSabNoduP5IT6dto2
 fgWkypD9uUp4Wn3wa4fCL+kROS3zmQlfElL7yVV6AjSmpO2kpRmU0bEuPwOVr3a13bFnC366L
 D6kZRMUEW89bCjBW89iZVeI2mi4OLbKKsrxO4jgzAzZp+CO2iw/dBAjeq9
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

On 2/7/25 05:18, Zsolt Kajtar wrote:
> In 68648ed1f58d98b8e8d994022e5e25331fbfe42a the drawing routines were
> duplicated to have separate I/O and system memory versions.
>
> Later the pixel reversing in 779121e9f17525769c04a00475fd85600c8c04eb
> was only added to the I/O version and not to system.
>
> That's unfortunate as reversing is not something only applicable for
> I/O memory and I happen to need both I/O and system version now.
>
> One option is to bring the system version up to date, but from the
> maintenance perspective it's better to not have two versions in the
> first place.
>
> The drawing routines (based on the cfb version) were moved to header
> files. These are now included in both cfb and sys modules. The memory
> access and other minor differences were handled with a few macros.
>
> The last patch adds a separate config option for the system version.
>
> Zsolt Kajtar (13):
>    fbdev: core: Copy cfbcopyarea to fb_copyarea
>    fbdev: core: Make fb_copyarea generic
>    fbdev: core: Use generic copyarea for as cfb_copyarea
>    fbdev: core: Use generic copyarea for as sys_copyarea
>    fbdev: core: Copy cfbfillrect to fb_fillrect
>    fbdev: core: Make fb_fillrect generic
>    fbdev: core: Use generic fillrect for as cfb_fillrect
>    fbdev: core: Use generic fillrect for as sys_fillrect
>    fbdev: core: Copy cfbimgblt to fb_imageblit
>    fbdev: core: Make fb_imageblit generic
>    fbdev: core: Use generic imageblit for as cfb_imageblit
>    fbdev: core: Use generic imageblit for as sys_imageblit
>    fbdev: core: Split CFB and SYS pixel reversing configuration
>
>   drivers/video/fbdev/core/Kconfig        |  10 +-
>   drivers/video/fbdev/core/cfbcopyarea.c  | 427 +-----------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 363 +-------------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 358 +-------------------
>   drivers/video/fbdev/core/fb_copyarea.h  | 421 +++++++++++++++++++++++
>   drivers/video/fbdev/core/fb_draw.h      |   6 +-
>   drivers/video/fbdev/core/fb_fillrect.h  | 359 ++++++++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 356 ++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 358 +-------------------
>   drivers/video/fbdev/core/sysfillrect.c  | 315 +----------------
>   drivers/video/fbdev/core/sysimgblt.c    | 326 +-----------------
>   11 files changed, 1208 insertions(+), 2091 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h

It's a bigger change.
I've applied the series to the fbdev for-next git tree to give
it some compile- and runtime testing.

Helge
