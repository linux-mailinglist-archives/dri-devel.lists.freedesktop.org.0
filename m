Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40D33B1ED
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 13:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD4889C9C;
	Mon, 15 Mar 2021 12:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0D889C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:00:07 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:59:50 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <QNE0QQ.C6TR84CKS0AX1@crapouillou.net>
In-Reply-To: <9c3c8e15-9e8c-4413-e75b-de989a750954@suse.de>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-5-paul@crapouillou.net>
 <20210311122846.GC1739082@infradead.org>
 <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
 <9c3c8e15-9e8c-4413-e75b-de989a750954@suse.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le lun. 15 mars 2021 =E0 8:43, Thomas Zimmermann <tzimmermann@suse.de> a =

=E9crit :
> Hi
> =

> Am 11.03.21 um 13:33 schrieb Paul Cercueil:
>> =

>> =

>> Le jeu. 11 mars 2021 =E0 12:28, Christoph Hellwig <hch@infradead.org> =

>> a =7F=E9crit :
>>> On Sun, Mar 07, 2021 at 08:28:34PM +0000, Paul Cercueil wrote:
>>>>  +    drm_atomic_for_each_plane_damage(&iter, &clip) {
>>>>  +        for (i =3D 0; i < finfo->num_planes; i++) {
>>>>  +            daddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
>>>>  +
>>>>  +            /* Ignore x1/x2 values, invalidate complete lines */
>>>>  +            offset =3D clip.y1 * state->fb->pitches[i];
>>>>  +
>>>>  +            dma_sync_single_for_device(dev, daddr + offset,
>>>>  +                       (clip.y2 - clip.y1) * =

>>>> state->fb->pitches[i],
>>>>  +                       DMA_TO_DEVICE);
>>> =

>>> Are these helpers only ever used to transfer data to the device and
>>> never from it?  If so please clearly document that.
>> =

>> Yes. In the DRM world, are there cases where we transfer data from =

>> the =7Fdevice? I assume these cases are handled by v4l2 instead.
> =

> Software rendering (i.e., anything wrt dumb buffers) likely reads =

> back framebuffer content during blit operations. For devices where =

> this is a slow operation (e.g., PCI read) we set struct =

> drm_mode_config.prefer_shadow to hint renderers to use shadow =

> buffering.

This has been brought up a few times already. I answered that in the =

cover letter. In my case, *writes* (e.g. dumb memcpy) are also slower =

with a write-combine buffer than with a non-coherent buffer + cache =

sync. So a shadow buffer does nothing for me.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
