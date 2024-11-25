Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C19D844C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 12:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70F210E608;
	Mon, 25 Nov 2024 11:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WjFGld3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DDF10E608
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732533772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+sllFXXJNcJZ+f5cFnwVtlcSwPFXESaku6gH0Ws76pc=;
 b=WjFGld3Dbpj+30K6VEqmb4H4HV+ockg/Ix0nNAn5e2WQ65iXIX/Cv0IUBpi/iz0SKVSwP9
 NegnpQsY2EaaGLA92J3JSbFN6W673K2vMK3Hq92YYuQZinpPpMCXbKBbjm02Tar/zJMfQB
 fKqPzq9XScTv8SaCOFmF2hvta8i6L5s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-O1huZqNjMeW5-jwNl8FMJw-1; Mon,
 25 Nov 2024 06:22:51 -0500
X-MC-Unique: O1huZqNjMeW5-jwNl8FMJw-1
X-Mimecast-MFC-AGG-ID: O1huZqNjMeW5-jwNl8FMJw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0E5351956088; Mon, 25 Nov 2024 11:22:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.111])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3FC1030000DF; Mon, 25 Nov 2024 11:22:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 152DA1800392; Mon, 25 Nov 2024 12:22:47 +0100 (CET)
Date: Mon, 25 Nov 2024 12:22:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/cirrus: Use virtual encoder and connector types
Message-ID: <6m4dw6orj6frsmufdoeea3cllssvmwxzf7r44fwmd5t45pc7te@4oz27uvldojr>
References: <20241029143928.208349-1-tzimmermann@suse.de>
 <20241029143928.208349-2-tzimmermann@suse.de>
 <y74662j6zqvocvpa3zbig5owhqu2o43xdrwkeswgwd5mak2cx7@esgliauvzkh5>
MIME-Version: 1.0
In-Reply-To: <y74662j6zqvocvpa3zbig5owhqu2o43xdrwkeswgwd5mak2cx7@esgliauvzkh5>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wpr6y4sE9A9eNbB3vnNSRAEfKpx6OejFuaVaPKpZit4_1732533770
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 23, 2024 at 06:28:30PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 29, 2024 at 03:34:23PM +0100, Thomas Zimmermann wrote:
> > The cirrus driver only works on emulated Cirrus hardware. Use the
> > correct types for encoder and connector.

> >  	connector = &cirrus->connector;
> >  	ret = drm_connector_init(dev, connector, &cirrus_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_VGA);
> > +				 DRM_MODE_CONNECTOR_VIRTUAL);
> 
> This will also remove the EDID property from this connector. I'm not
> sore if that is an expected behaviour or not.

Well, the qemu cirrus emulation does not actually provide an EDID,
so this is probably a good thing (even if possibly not intentional).

take care,
  Gerd

