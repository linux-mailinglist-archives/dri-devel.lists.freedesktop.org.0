Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC73261ADC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 20:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211D6E8A9;
	Tue,  8 Sep 2020 18:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B316E8A9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599590507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpjlD6Mndqdn+nz+CJTU5sL9T+UVkaZ8HXjd0BtRM3s=;
 b=S9bU/wnXmyTCNZG9PLNzEraoJqGl4uzIgFdA1SbtZWgw1z5lRzpfBXo6EM7pAn+gQleZ6t
 mOPZ/jDD4V47xUXbaqInXHFodA9ycMOf/UJd1GG059zsbXA5AzRzfWnfazpsPTyRsHvEl3
 SI3W3TPhOGgOavWsRCqrk9E9vGwsYMQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XxkmtBd5OqCpLfGEJdK0UQ-1; Tue, 08 Sep 2020 14:41:44 -0400
X-MC-Unique: XxkmtBd5OqCpLfGEJdK0UQ-1
Received: by mail-qt1-f200.google.com with SMTP id a26so126856qtb.16
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 11:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=IpjlD6Mndqdn+nz+CJTU5sL9T+UVkaZ8HXjd0BtRM3s=;
 b=fbw/9J91AOWyPEIJnZ/tuemlTgJaMm9y9Nln7MEf/remBi4Pulj32T03ZKoDKit7xs
 TczPXEuwFc6VXcIiBa5fCJB5TYmQW4ph+QZGxDP1+xFisuBkC+GPxe3U/8FqgWrcKKUy
 hrezoNFuF5+9Imk9qsviqyndmzTTtSPLBhI5hZn7kgbyjJDk/Kma+mkw8XFq1sXsumdk
 MVKfWmJimCCDdodhlRnLOjoYlyzXI9dLnwrkQDwo/WV+xStA1R5zuW2mFzRPyH4DwOs/
 e1xTww8Vas4kNvLhNxvLLSLasfgoNE5RhWYtFRXn36fYfs3dUQv1Uo+JIIbE+iWFT2eY
 Skzg==
X-Gm-Message-State: AOAM531PFDh4jSAkZM/C/z2F7+ZUuEsLviP3y3RxtfSfnsjOZt0xnWS6
 O9UoMLczQuZuFGg8pNixgI8ThZ+UCIU3lI+YrjsZOu54NnE+xFrkFRjfERRBmej/0SV8lMRzaWA
 AYpWK2zWv5SodNTdfBCLS2tOnENvU
X-Received: by 2002:ac8:2942:: with SMTP id z2mr1504572qtz.376.1599590503836; 
 Tue, 08 Sep 2020 11:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV5R7T9pGSZb0id3QT5Zh36EqJ9LGz3wCDMkMIc5C16Jl7FkxMtmGYs2WIHLxR8SosqFb+MQ==
X-Received: by 2002:ac8:2942:: with SMTP id z2mr1504558qtz.376.1599590503622; 
 Tue, 08 Sep 2020 11:41:43 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 29sm51810qkr.114.2020.09.08.11.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 11:41:43 -0700 (PDT)
Message-ID: <5b63113be2e02d15268470d54b0cffeae06c5292.camel@redhat.com>
Subject: Re: [PATCH] drm: assure aux_dev is nonzero before using it
From: Lyude Paul <lyude@redhat.com>
To: Zwane Mwaikambo <zwanem@gmail.com>
Date: Tue, 08 Sep 2020 14:41:42 -0400
In-Reply-To: <alpine.DEB.2.21.2008181057090.8571@montezuma.home>
References: <alpine.DEB.2.21.2008101004110.27032@montezuma.home>
 <20200811085830.GZ2352366@phenom.ffwll.local>
 <alpine.DEB.2.21.2008111514210.35094@montezuma.home>
 <CAKMK7uHxikojLQNbsnnfDfGZ3tFP9CRUTzvr+DsZghzQupaBGg@mail.gmail.com>
 <a1141faf8c6a0a924d87132fb4a297cd6d47e09d.camel@redhat.com>
 <alpine.DEB.2.21.2008181057090.8571@montezuma.home>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, dkwon@redhat.com,
 Linux Kernel <linux-kernel@vger.kernel.org>, tcamuso@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-08-18 at 10:58 -0700, Zwane Mwaikambo wrote:
> On Wed, 12 Aug 2020, Lyude Paul wrote:
> 
> > On Wed, 2020-08-12 at 16:10 +0200, Daniel Vetter wrote:
> > > On Wed, Aug 12, 2020 at 12:16 AM Zwane Mwaikambo <zwanem@gmail.com>
> > > wrote:
> > > > On Tue, 11 Aug 2020, Daniel Vetter wrote:
> > > > 
> > > > > On Mon, Aug 10, 2020 at 10:11:50AM -0700, Zwane Mwaikambo wrote:
> > > > > > Hi Folks,
> > > > > >     I know this thread eventually dropped off due to not
> > > > > > identifying
> > > > > > the underlying issue. It's still occuring on 5.8 and in my case it
> > > > > > happened because the udev device nodes for the DP aux devices were
> > > > > > not
> > > > > > cleaned up whereas the kernel had no association with them. I can
> > > > > > reproduce the bug just by creating a device node for a non-
> > > > > > existent
> > > > > > minor
> > > > > > device and calling open().
> > > > > 
> > > > > Hm I don't have that thread anymore, but generally these bugs are
> > > > > solved
> > > > > by not registering the device before it's ready for use. We do have
> > > > > drm_connector->late_register for that stuff. Just a guess since I'm
> > > > > not
> > > > > seeing full details here.
> > > > 
> > > > In this particular case, the physical device disappeared before the
> > > > nodes
> > > > were cleaned up. It involves putting a computer to sleep with a
> > > > monitor
> > > > plugged in and then waking it up with the monitor unplugged.
> > > 
> > > We also have early_unregister for the reverse, but yes this sounds
> > > more tricky ... Adding Lyude who's been working on way too much
> > > lifetime fun around dp recently.
> > > -Daniel
> > > 
> > Hi-I think just checking whether the auxdev is NULL or not is a reasonable
> > fix, although I am curious as to how exactly the aux dev's parent is
> > getting
> > destroyed before it's child, which I would have thought would be the only
> > way
> > you could hit this?
> 
> Hi, If this is acceptable, would you consider an updated patch against 
> 5.8?

Sure-although the process to getting this into stable is to get the patch into
drm-next first, then it can get cherry-picked into the stable kernel branches.
See https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

> 
> Thanks,
> 	Zwane
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
