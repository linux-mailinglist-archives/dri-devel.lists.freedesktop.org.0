Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991BACB5195
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 09:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E596E10E779;
	Thu, 11 Dec 2025 08:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nkKh22R7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F9710E770
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 08:28:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 299B8C19347;
 Thu, 11 Dec 2025 08:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16FC26068C;
 Thu, 11 Dec 2025 08:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E6ACF103C8C1E; Thu, 11 Dec 2025 09:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765441716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0SrfXUdcUykyhFz/Z2PprfF3ar6YbChnSr+9vH8ynbE=;
 b=nkKh22R7g0PLjyBcO7yn2yXRd61A0yeRhie7iL8AkagNhIYKDDPex+SbNyXNEKlhHFadEX
 o49mTdgbZNoOH9/+Ynuh8dxNkX4OsiIGa3Nsm3mN2LGrY2E53EKTGyCSKd8NeV/2SK7Pc7
 8s2+/C0R85xxoGQjWWvzVF1QYlM/TZAS5dlBEujUnlHAl4EkfBvFeg50GDgEcfE2AsEjMC
 dAt8d3iBcLg64TqoLzd0eiQ5HLbJg7DuZT46lYpKC3Dz7jA2yfcYWWCP9ph8AhAwZx0j5m
 NxvETRYA1fNTDLY1tmtyqggyYSR2w4AzxCTY+YiT69m3sj3NSuDqAYPaI77UBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 09:28:29 +0100
Message-Id: <DEV8UT3JZ42I.3UQX5KEVZEXO1@bootlin.com>
Subject: Re: [PATCH v3 0/2] drm/bridge: handle gracefully atomic updates
 during bridge removal
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Emanuele Ghidoli"
 <ghidoliemanuele@gmail.com>, =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251112-drm-bridge-atomic-vs-remove-v3-0-85db717ce094@bootlin.com>
 <546bc098a35360c659b6dfb88d5cb451@kernel.org>
 <DEK6B0KMDCCN.3U4FLO44L04FC@bootlin.com>
 <20251128-cheerful-muscular-chameleon-1ec2f5@houat>
In-Reply-To: <20251128-cheerful-muscular-chameleon-1ec2f5@houat>
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

Hello,

On Fri Nov 28, 2025 at 11:07 AM CET, Maxime Ripard wrote:
> On Fri, Nov 28, 2025 at 09:09:17AM +0100, Luca Ceresoli wrote:
>> Hi Maxime,
>>
>> +Cc Emanuele, Francesco, Jo=C3=A3o
>>
>> On Thu Nov 27, 2025 at 7:35 PM CET, Maxime Ripard wrote:
>> > On Wed, 12 Nov 2025 17:34:33 +0100, Luca Ceresoli wrote:
>> >> This is a first attempt at gracefully handling the case of atomic upd=
ates
>> >> happening concurrently to physical removal of DRM bridges.
>> >>
>> >> This is part of the work to support hotplug of DRM bridges. The grand=
 plan
>> >> was discussed in [1].
>> >>
>> >> [ ... ]
>> >
>> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>
>> Thanks for reviewing!
>>
>> Two alternative patches [0][1] have been sent to address the issue with
>> PLL_UNLOCK, and both would conflict with patch 2 of this series. So I'd
>> keep this series on hold for a while, waiting for a decision to be taken
>> about how the PLL_UNLOCK issue will be handled. I'll then rebase this
>> series as needed.
>
> Yep, agreed.

Turns out the patch that got applied does not conflict with this series,
out of luck with the code layout.

So I'm applying this one today.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
