Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77788203721
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 14:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818B289D58;
	Mon, 22 Jun 2020 12:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B921889D58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592829990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfQ3nWz/xqjgvRnBCqy7RWTrgF/ItVtDDVcem17ILNs=;
 b=C1XS67jiOhM2Mbiem0lo8mcsTpUaBq92wP6HrMcFWPoHJ+W4zodlhEPtZCqXITU03joF4m
 8Zeo0vC8vU97hcvrit3DTWA1fbbuLzc9Gyks8xuDkl+zgMOhqkflHy9hI+btWeMpaZ66UN
 oAKsk5T02kM5wwDxO9ehEXNpbtSiD/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-fIyfJ-nRO3iTbfEDncWmBg-1; Mon, 22 Jun 2020 08:46:25 -0400
X-MC-Unique: fIyfJ-nRO3iTbfEDncWmBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C14318585A5;
 Mon, 22 Jun 2020 12:46:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0A087C1E3;
 Mon, 22 Jun 2020 12:46:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBCB417477; Mon, 22 Jun 2020 14:46:22 +0200 (CEST)
Date: Mon, 22 Jun 2020 14:46:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Deepak Rawat <drawat.floss@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
Message-ID: <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622110623.113546-2-drawat.floss@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +/* Should be done only once during init and resume */
> +static int synthvid_update_vram_location(struct hv_device *hdev,
> +					  phys_addr_t vram_pp)
> +{
> +	struct hyperv_device *hv = hv_get_drvdata(hdev);
> +	struct synthvid_msg *msg = (struct synthvid_msg *)hv->init_buf;
> +	unsigned long t;
> +	int ret = 0;
> +
> +	memset(msg, 0, sizeof(struct synthvid_msg));
> +	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
> +	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +		sizeof(struct synthvid_vram_location);
> +	msg->vram.user_ctx = msg->vram.vram_gpa = vram_pp;
> +	msg->vram.is_vram_gpa_specified = 1;
> +	synthvid_send(hdev, msg);

That suggests it is possible to define multiple framebuffers in vram,
then pageflip by setting vram.vram_gpa.  If that is the case I'm
wondering whenever vram helpers are a better fit maybe?  You don't have
to blit each and every display update then.

FYI: cirrus goes the blit route because (a) the amount of vram is very
small so trying to store multiple framebuffers there is out of question,
and (b) cirrus converts formats on the fly to hide some hardware
oddities.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
