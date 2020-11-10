Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669692AEA7D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DA889EFF;
	Wed, 11 Nov 2020 07:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66A89801
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:50:37 +0000 (UTC)
Date: Tue, 10 Nov 2020 08:50:22 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: ipu: Search for scaling coefs up to 102%
 =?UTF-8?Q?of=0D=0A?= the screen
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <YJOKJQ.8KD9M5MU0NTP2@crapouillou.net>
In-Reply-To: <20201107193311.GB1039949@ravnborg.org>
References: <20201105083905.8780-1-paul@crapouillou.net>
 <20201107193311.GB1039949@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam. 7 nov. 2020 =E0 20:33, Sam Ravnborg <sam@ravnborg.org> a =E9crit :
> Hi Paul.
> =

> On Thu, Nov 05, 2020 at 08:39:05AM +0000, Paul Cercueil wrote:
>>  Increase the scaled image's theorical width/height until we find a
>>  configuration that has valid scaling coefficients, up to 102% of the
>>  screen's resolution. This makes sure that we can scale from almost
>>  every resolution possible at the cost of a very small distorsion.
>>  The CRTC_W / CRTC_H are not modified.
>> =

>>  This algorithm was already in place but would not try to go above =

>> the
>>  screen's resolution, and as a result would only work if the CRTC_W /
>>  CRTC_H were smaller than the screen resolution. It will now try =

>> until it
>>  reaches 102% of the screen's resolution.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> Looks like the patch does what the descriptions says.
> So in other words - look OK to me. I am not confident enogh for a r-b
> but my code reading is enough to warrant an a-b:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Note that this algorithm exists mostly as a band-aid for a missing =

functionality: it is not possible for userspace to request the closest =

mode that would encapsulate the provided one, because the GEM buffer is =

created beforehand. If there was a way to let the kernel tweak the =

mode, I could write a better algorithm that would result in a better =

looking picture.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
