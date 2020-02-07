Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A31557C9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 13:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354F96FC78;
	Fri,  7 Feb 2020 12:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504716FC6E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581078711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCzR2J7hcjbrjaj4pXeOOcloP2sWKrLXwqs8XnX4kFU=;
 b=WhM2RnqHkx+iD1fE6l/G0X5GvILl971jEMIcF2YUB4Po/fdwp+TxJdlB/nwRH4gFsXt1WA
 CBMTiqqXNcIs1Ty32vdMt0kAULqMun9p6aKqsO21nBt6g0wdKHX6FRUPrarGRVJrFdHoJT
 cwwu9k/fW+6HgEOrEAmSJu7jaZ36MYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-My83CBNIOP2eZaExU9r_Tg-1; Fri, 07 Feb 2020 07:31:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D439184AEBE;
 Fri,  7 Feb 2020 12:31:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DED7FB60;
 Fri,  7 Feb 2020 12:31:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FA08A1E0; Fri,  7 Feb 2020 13:31:43 +0100 (CET)
Date: Fri, 7 Feb 2020 13:31:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207123143.y3m3moillue6udo6@sirius.home.kraxel.org>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
 <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
MIME-Version: 1.0
In-Reply-To: <cd78b79f-ff4e-9c8e-4d87-ce717a717559@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: My83CBNIOP2eZaExU9r_Tg-1
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
Cc: airlied@linux.ie, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > How about using
> > 
> > #define drm_simple_encoder_init(dev, type, name, ...) \
> >         drm_encoder_init(dev, drm_simple_encoder_funcs_cleanup, type, name, __VA_ARGS__)
> > 
> > instead ?

> I guess you want to save a few lines in the implementation of
> drm_simple_encoder_init() (?) If so, I'd rather try to share more
> internal code among the various init and create functions.

Yes.  You have the namestr stuff duplicated in all functions, and with
a #define that goes away.

But maybe that can be simply be dropped?  The drivers with a simple
encoder seem to not care much about the name and just pass NULL ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
