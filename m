Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC631D71F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 10:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CC89C59;
	Wed, 17 Feb 2021 09:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634AE89C59
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613555609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iB97vKTinG2XemEE+QQxJDkql5TJRjSkHW9M/3kwXvw=;
 b=b691yZA30cnqvvG9Sd/+ZqNSuLIdqFPzk/jCLoxQvLiBJVU+Z2ycqV74kOzLnpECNKAvdK
 PKWpgTeurFWdexDULA3iiKmur4KdBxP9jaxx1lTEBwcqD/chwmqYs2SfQU2dCUnDhh68Yb
 eQCyGZpr+IPRWv1tlt4P5EK/i5FsmgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-97bKOS8nOxmRp7tCuLFI7Q-1; Wed, 17 Feb 2021 04:53:24 -0500
X-MC-Unique: 97bKOS8nOxmRp7tCuLFI7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EAED189DF4E;
 Wed, 17 Feb 2021 09:53:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26AAB722CB;
 Wed, 17 Feb 2021 09:53:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7187018000A2; Wed, 17 Feb 2021 10:53:21 +0100 (CET)
Date: Wed, 17 Feb 2021 10:53:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/10] drm/ast: Clean-up cursor-plane updates
Message-ID: <20210217095321.35vwqimwj5yggwyt@sirius.home.kraxel.org>
References: <20210209134632.12157-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210209134632.12157-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 02:46:22PM +0100, Thomas Zimmermann wrote:
> (was: drm/ast: Move cursor vmap calls out of commit tail)
> 
> Ast has vmap calls in its cursor's atomic_update function. This is not
> supported as vmap might aquire the dma reservation lock. While at it,
> cleanup the whole cursor code: the patchset removes all possible runtime
> errors from the atomic_update function and reduces the overhead from
> vmap calls on the HW cursor BOs to a minimum.
> 
> Patches 1 to 3 update the cursor code and prepare before the refactoring.
> 
> Patch 4 and 5 inline the cursor update logic into the rsp cursor-plane
> functions. This is mostly about moving code around.
> 
> Patches 6 to 9 add a dedicated cursor plane that maintains the two BOs
> for HW cursors. The HW cursor BOs are permanently pinned and vmapped
> while the cursor plane is initialized. Thus removing the related vmap
> operations from atomic_update.
> 
> Finally patch 10 converts ast cursors to struct drm_shadow_plane_state.
> BOs with cursor image data from userspace are vmapped in prepare_fb and
> vunampped in cleanup_fb. The actual update of the cursor image is being
> moved from prepare_fb to atomic_update.
> 
> With the patchset applied, all cursor preparation is performed before
> the commit-tail functions; while the actual update is performed within.
> 
> Tested by running X11 and Weston on ast hardware.
> 
> v2:
> 	* convert to drm_shadow_plane_state helpers

Looks all sane to me.
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
