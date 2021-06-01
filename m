Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA642396F46
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 10:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC9F6E8C0;
	Tue,  1 Jun 2021 08:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2616E8C0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 08:45:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60BC061370;
 Tue,  1 Jun 2021 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622537158;
 bh=iRLwwh/jf6neXOQQgfnhI6BrCzqxxsNJFTOUKbWjbxU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sIrl/fVjSuZJc/8yYTG/dJgXF2S6Ulce6iDkG+5AKFvWM2npcdzHGjvr/bhghCsZF
 gpJE2khsRcmBOfZpvtpHnKPnhJQHPS2ueehX2SI7BCGwJn5gNg09TOyvmk6VwPasQl
 hGz0UQs7t1mG2u7JfCBEfI4j+86J1KWkdEbM9wydpaBKZ1jeprBZzT+74L3/Y/jb2O
 jQalFjmxg6vOnopGnjuRLf6MOjheSfjBdCke3btHg+vBqi+MHF4SVyhI5S8Ijoj8kx
 EcGYGkt1N+lSF8t2cp9YYGCDZOIMGva80GMffTImgfkezk7SLoDtdDjkDKonezD74D
 d9pZAvCCOVmCg==
Message-ID: <4552aaf531b0619a2d7a7cc4bcf2d049c44b4b74.camel@kernel.org>
Subject: Re: [PATCH v2 06/12] drm/vc4: hdmi: Set HD_CTL_WHOLSMP and
 HD_CTL_CHALIGN_SET
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>,  David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
 <tiwai@suse.com>
Date: Tue, 01 Jun 2021 10:45:49 +0200
In-Reply-To: <20210525132354.297468-7-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-7-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 15:23 +0200, Maxime Ripard wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> Symptom is random switching of speakers when using multichannel.
> 
> Repeatedly running speakertest -c8 occasionally starts with
> channels jumbled. This is fixed with HD_CTL_WHOLSMP.
> 
> The other bit looks beneficial and apears harmless in testing so
> I'd suggest adding it too.
> 
> Documentation says: HD_CTL_WHILSMP_SET
> Wait for whole sample. When this bit is set MAI transmit will start
> only when there is at least one whole sample available in the fifo.
> 
> Documentation says: HD_CTL_CHALIGN_SET
> Channel Align When Overflow. This bit is used to realign the audio
> channels in case of an overflow.
> If this bit is set, after the detection of an overflow, equal
> amount of dummy words to the missing words will be written to fifo,
> filling up the broken sample and maintaining alignment.
> 
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

