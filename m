Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371BC15042D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 11:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E56EBA5;
	Mon,  3 Feb 2020 10:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F6C6EBA5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580725558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmu81z7i0ck9aWS8FRjA2IkrmsTeR424/j28FC2Ykzc=;
 b=bmwSevVWEmtfAa7uEX6ogk1SnlhgcE99lq3lxoLJX3Spzgwtu5Mk7gRIqxn9IoAOwycCbQ
 wmnLltgi0jogzzPX7JcG1fq4D6si6QWAxqODXjzHs3RZPjfa4kuB0eEcmyVDBAtFEBvQU/
 s7bdTRBHRgqc5Dnz7UqbKCrs+Mv4wtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-k9nfvOfgNyyNl16LXR1OQQ-1; Mon, 03 Feb 2020 05:25:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB71800D48;
 Mon,  3 Feb 2020 10:25:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C6A60BE2;
 Mon,  3 Feb 2020 10:25:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9EE569D7F; Mon,  3 Feb 2020 11:25:52 +0100 (CET)
Date: Mon, 3 Feb 2020 11:25:52 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
Message-ID: <20200203102552.aayohmognfy7hchm@sirius.home.kraxel.org>
References: <20200201122744.27165-1-tzimmermann@suse.de>
 <20200201122744.27165-3-tzimmermann@suse.de>
 <20200203064757.2v4hqad2trw7jcwk@sirius.home.kraxel.org>
 <86d3f7c6-0fda-9f2a-017f-5ea5623fac4f@suse.de>
MIME-Version: 1.0
In-Reply-To: <86d3f7c6-0fda-9f2a-017f-5ea5623fac4f@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: k9nfvOfgNyyNl16LXR1OQQ-1
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 09:35:54AM +0100, Thomas Zimmermann wrote:
> Hi Gerd
> 
> Am 03.02.20 um 07:47 schrieb Gerd Hoffmann:
> > On Sat, Feb 01, 2020 at 01:27:42PM +0100, Thomas Zimmermann wrote:
> >> The implementation of struct drm_mode_config_funcs.mode_valid verifies
> >> that enough video memory is available for a given display mode.
> > 
> > There is bochs_connector_mode_valid() doing the same check,
> > you can drop it when hooking up drm_vram_helper_mode_valid.
> 
> Oh, didn't see it. That's more duplicated code to remove. :)
> 
> There's a helpful comment in bochs_connector_mode_valid(). Where shall I
> move it?

I'd say it can be dropped.  linux kernel source code isn't exactly the
place where you expect documentation about configuring qemu ;)

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
