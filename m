Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145B14399A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1E6EC19;
	Tue, 21 Jan 2020 09:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E958D6EC19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579599371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3ejH+F1snfAozezFNc5c7vdqT48VnQHGH9Shn1K2Eg=;
 b=LVWnG/SpCiRtSc9475W4iPe8VRyjNlklkbH4qnJOMQ/vMeWLpm7OkeqXxQYfo+djAN1E+2
 hyfbQTgYIPYrxYkS4dk63V9DM9tMrwpkkDjixelgKryKi2PhOOqIUD31xvA+KAfY4jaSWI
 X/FP7QHWomyJLB8tNHx4LGgtxtGvEMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-WGhMKxUGM8qMmG1iPee1dQ-1; Tue, 21 Jan 2020 04:36:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98598108442D;
 Tue, 21 Jan 2020 09:36:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68F515C545;
 Tue, 21 Jan 2020 09:36:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E5D416E36; Tue, 21 Jan 2020 10:36:04 +0100 (CET)
Date: Tue, 21 Jan 2020 10:36:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
Message-ID: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: WGhMKxUGM8qMmG1iPee1dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com, xen-devel@lists.xenproject.org,
 sean@poorly.run, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 20, 2020 at 01:20:47PM +0100, Thomas Zimmermann wrote:
> Instead of faking VBLANK events by themselves, drivers without VBLANK
> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
> The patchset makes this official and converts over drivers.
> 
> The current implementation looks at the number of initialized CRTCs
> wrt vblanking. If vblanking has been initialized for a CRTC, the driver
> is responsible for sending out VBLANK events. Otherwise, DRM will send
> out the event. The behaviour selected by initializing no_vblank as part
> of drm_atomic_helper_check_modeset().
> 
> I went through all drivers, looking for those that call send out VBLANK
> events but do not call drm_vblank_init(). These are converted to the new
> semantics. This affects tiny drivers; drivers for virtual hardware; and
> a few others, which do not support interrupts. Xen comes with its
> own VBLANK logic and disables no_vblank explictly.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
