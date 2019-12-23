Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E912960D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 13:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC8289D57;
	Mon, 23 Dec 2019 12:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAC789D57
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 12:35:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E17EC8052E;
 Mon, 23 Dec 2019 13:35:01 +0100 (CET)
Date: Mon, 23 Dec 2019 13:35:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
Message-ID: <20191223123500.GC10745@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
 <20191221095553.13332-7-sam@ravnborg.org>
 <87r20vuvow.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r20vuvow.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=NPMzOm6L5BiS18xKdMoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Joe Perches <joe@perches.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

On Mon, Dec 23, 2019 at 01:29:19PM +0200, Jani Nikula wrote:
> On Sat, 21 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> > There are a lot of cases where we have a device * but no drm_device *.
> > Add drm_dev_* variants of the logging functions to cover these cases.
> 
> So I know there are some valid cases where we only have struct device *,
> and instead of passing struct drm_device * will need the distinction
> between multiple struct device *.
> 
> Not all current uses of DRM_DEV_* meet that criteria, however. I think
> I'd like to have those converted over to the drm_device based logging
> first, and then see what's left. Because I fear adding these will just
> lead to mass conversion from DRM_DEV_* to drm_dev_*, and the ball gets
> dropped there.

Hmm...
$ git grep -E '(DRM_DEV_ERROR|DRM_DEV_INFO|DRM_DEV_WARN|DRM_DEV_DEBUG)'
953
There are 4 hits in drm/* - the rest is in drivers (no suprise).


$ git grep -E '(DRM_ERROR|DRM_INFO|DRM_WARN|DRM_DEBUG)' | wc -l
8380
There are 626 hits in drm/* - the rest in drivers.


So moving over all DRM_DEV looks doable with a lot of effort. It touches
all drivers.
But the non-DEV variants - thats just too much.
This is a lot of effort required before we can offer new drivers
a simple a logical logging solution.

On top of this - there is today no gain using drm_device * versus device *.
The output is exactly the same.

We should discuss what is required before we can offer the full solution
for new drivers. And how much the existing usage should hold this back.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
