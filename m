Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ACE1A0822
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691158991E;
	Tue,  7 Apr 2020 07:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5538991E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586244101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lBiAryAlgHmB0rHts2SVHmMFbOXfuV+1sKGRp25Unc=;
 b=hUVV9OuwWCh6lBe+DNXhSq1RL/qPGvOTxO3UPkuRe57iVezSHt5rq6rlxVe1l6FQ/k1RTG
 QvqEZBeC40p9u/HYtjKM7enhl7axC9X7WHXjE2+xufMJVrEFNNFHIcPMAloFVQd7h6FS7d
 cvNykz8HEDXlSuZ8HhSVVip8UEuJtzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-y-hb54wSOT-bTnwAX2kIAA-1; Tue, 07 Apr 2020 03:21:37 -0400
X-MC-Unique: y-hb54wSOT-bTnwAX2kIAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F7B3107ACC4;
 Tue,  7 Apr 2020 07:21:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 671D9B19DF;
 Tue,  7 Apr 2020 07:21:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 74E7E16E2C; Tue,  7 Apr 2020 09:21:31 +0200 (CEST)
Date: Tue, 7 Apr 2020 09:21:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
Message-ID: <20200407072131.uofh6lygnab7u4ba@sirius.home.kraxel.org>
References: <20200406134405.6232-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200406134405.6232-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 sam@ravnborg.org, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 03:43:55PM +0200, Thomas Zimmermann wrote:
> Generic fbdev emulation is a DRM client. If possible, it should behave
> like userspace clients. Therefore it should not run before the driver
> registered the new DRM device. If the setup function fails, the driver
> should not report an error.

This always has been my expectation, as you might have concluded from
the absence of any qemu guest driver patches in this series ;)

The patches look sane too, so for the series:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
