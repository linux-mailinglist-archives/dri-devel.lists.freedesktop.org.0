Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CABA17F13A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 08:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97226E06E;
	Tue, 10 Mar 2020 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E856E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583826186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+nP3UQKsL7INc3GF9IeS1a4rT+Gt51iSc6vJVd+78zU=;
 b=IEGAEDqIn3vNmgGzNDSpNEUc2KfL7pf6sxL8A/QUC3haES8D0tNZWeQI93GEpfoSpmCHgL
 JBtk+gA3nNcMKHgWQCqlO5B9pwe/b+9bM8V1QsN3SklZG3TlITytfc6kisp4DpU3zlmWEo
 7+GTLMMzv77IA8FhHvx450ckj8Y/qLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-_-QArxHUP9uUxaarMwtY7Q-1; Tue, 10 Mar 2020 03:43:04 -0400
X-MC-Unique: _-QArxHUP9uUxaarMwtY7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F931107ACC4;
 Tue, 10 Mar 2020 07:43:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0783691D75;
 Tue, 10 Mar 2020 07:43:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 253C69DB6; Tue, 10 Mar 2020 08:43:02 +0100 (CET)
Date: Tue, 10 Mar 2020 08:43:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200310010818.569-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: chadversary@chromium.org, dri-devel@lists.freedesktop.org,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 06:08:10PM -0700, Gurchetan Singh wrote:
> We don't want fences from different 3D contexts/processes (GL, VK) to
> be on the same timeline. Sending this out as a RFC to solicit feedback
> on the general approach.

NACK.

virtio fences are global, period.  You can't simply change fence
semantics like this.  At least not without a virtio protocol update
because guest and host need to be on the same page here.  Just look at
virgl_renderer_callbacks->write_fences() and how it doesn't consider
contexts at all.

So one way out would be to add a virtio feature flag for this, so guest
& host can negotiate whenever fences are global or per-context.

Another approach would be to go multiqueue, with each virtqueue being
roughly the same as a rendering pipeline on physical hardware, then have
per-virtqueue fences.

When going multiqueue we might also rethink the cursor queue approach.
I think it makes sense to simply allow sending cursor commands to any
queue then.  A separate cursor queue continues to be an option for the
guest then, but I'm not sure how useful that actually is in practice
given that cursor image updates are regular resource updates and have to
go through the control queue, so virtio_gpu_cursor_plane_update() has to
wait for the resource update finish before it can queue the cursor
command.  I suspect the idea to fast-track cursor updates with a
separate queue doesn't work that well in practice because of that.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
