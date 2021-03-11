Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16B338BDB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CED6F5D1;
	Fri, 12 Mar 2021 11:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12E46F5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:51:59 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:33:31 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
To: Christoph Hellwig <hch@infradead.org>
Message-Id: <VJ1TPQ.L5I3WNCQNB982@crapouillou.net>
In-Reply-To: <20210311122846.GC1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-5-paul@crapouillou.net>
 <20210311122846.GC1739082@infradead.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le jeu. 11 mars 2021 =E0 12:28, Christoph Hellwig <hch@infradead.org> a =

=E9crit :
> On Sun, Mar 07, 2021 at 08:28:34PM +0000, Paul Cercueil wrote:
>>  +	drm_atomic_for_each_plane_damage(&iter, &clip) {
>>  +		for (i =3D 0; i < finfo->num_planes; i++) {
>>  +			daddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
>>  +
>>  +			/* Ignore x1/x2 values, invalidate complete lines */
>>  +			offset =3D clip.y1 * state->fb->pitches[i];
>>  +
>>  +			dma_sync_single_for_device(dev, daddr + offset,
>>  +				       (clip.y2 - clip.y1) * state->fb->pitches[i],
>>  +				       DMA_TO_DEVICE);
> =

> Are these helpers only ever used to transfer data to the device and
> never from it?  If so please clearly document that.

Yes. In the DRM world, are there cases where we transfer data from the =

device? I assume these cases are handled by v4l2 instead.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
