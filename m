Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8D6FE21F
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 18:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0010E4D2;
	Wed, 10 May 2023 16:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1275210E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Zuc/PKv7BsyYTw5vXjXZ1fRjIXUbnX/cr7+0epdXRww=;
 b=Saz8RKF1M1YXdMlmGVIqkuk1FPuXvxO3dfsdyGN1k2laX6p636AyrfhO/uoGCbFoVUvgtP9b59+kv
 1BadUgz7jkBD1jEF8W6kgH4te9AJLnbWSkEG74Zdsxg4+nPi2bpMe3nUeEFuA/FGEi/xov/kXEPm0m
 H0akPuwlf8WA0NTWfhNFzEFNUicuV5yYsLzoQ2ZTw0Iy3WQSu4jOx39oyrVt4kws6UYWXvQlL6wdAO
 HPc687KY08FaOM74C2BxR+DkXcKU16kD9FH4hIb6o9fRshpkrS+t1O530Yq7b0ad0lgde2bu+HdTy3
 kgMVtxDZEoWu9w4PL2FyDrg8TQw0HSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Zuc/PKv7BsyYTw5vXjXZ1fRjIXUbnX/cr7+0epdXRww=;
 b=vYlFgBJmm67njDAbPDTcXVM7/cVVkBM1o7gKoLKUEN4DM2jZTNDzyMceQlsMPiQw8LGx1sMWLr3GL
 hKg9eY7DQ==
X-HalOne-ID: 3a3e330c-ef4c-11ed-9c7e-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 3a3e330c-ef4c-11ed-9c7e-13111ccb208d;
 Wed, 10 May 2023 16:03:41 +0000 (UTC)
Date: Wed, 10 May 2023 18:03:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maximilian Weigand <mweigand2017@gmail.com>
Subject: Re: [PATCH v2] backlight: lm3630a: turn off both led strings when
 display is blank
Message-ID: <20230510160340.GA1180686@ravnborg.org>
References: <20230510085239.1253896-1-mweigand2017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510085239.1253896-1-mweigand2017@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maximilian Weigand <mweigand@mweigand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 10:52:39AM +0200, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
> 
> Use backlight_is_blank() to determine if the led strings should be turned
> off in the update_status() functions of both strings.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>

Looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
