Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BF41AD4F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1D989B97;
	Tue, 28 Sep 2021 10:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E489B84;
 Tue, 28 Sep 2021 10:52:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="222778606"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="222778606"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="553942040"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:51:44 -0700
Date: Tue, 28 Sep 2021 13:45:01 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 jani.nikula@intel.com, Imre Deak <imre.deak@intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] component: do not leave master devres group open
 after bind
In-Reply-To: <s5hh7e5ngnq.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2109281335522.3554566@eliteleevi.tm.intel.com>
References: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
 <s5hh7e5ngnq.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="-318106570-1915050432-1632825702=:3554566"
Content-ID: <alpine.DEB.2.22.394.2109281342020.3554566@eliteleevi.tm.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---318106570-1915050432-1632825702=:3554566
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2109281342021.3554566@eliteleevi.tm.intel.com>

Hey,

On Tue, 28 Sep 2021, Takashi Iwai wrote:

> On Wed, 22 Sep 2021 10:54:32 +0200, Kai Vehmanen wrote:
> > --- a/drivers/base/component.c
> > +++ b/drivers/base/component.c
> > @@ -246,7 +246,7 @@ static int try_to_bring_up_master(struct master *master,
> >  		return 0;
> >  	}
> >  
> > -	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
> > +	if (!devres_open_group(master->parent, master, GFP_KERNEL))
> >  		return -ENOMEM;
> >  
> >  	/* Found all components */
> > @@ -258,6 +258,7 @@ static int try_to_bring_up_master(struct master *master,
> >  		return ret;
> >  	}
> >  
> > +	devres_close_group(master->parent, NULL);
> 
> Just wondering whether we should pass master here instead of NULL,
> too?

I wondered about this as well. Functionally it should be equivalent as 
passing NULL will apply the operation to the latest added group. I noted 
the practise of passing NULL has been followed in the existing code when 
referring to groups created within the same function. E.g.

»       if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
[...]
»       ret = component->ops->bind(component->dev, master->parent, data);
»       if (!ret) {
»       »       component->bound = true;

»       »       /*                                                                                                                                                          
»       »        * Close the component device's group so that resources                                                                                                     
»       »        * allocated in the binding are encapsulated for removal                                                                                                    
»       »        * at unbind.  Remove the group on the DRM device as we                                                                                                     
»       »        * can clean those resources up independently.                                                                                                              
»       »        */
»       »       devres_close_group(component->dev, NULL);

... so I followed this existing practise. I can change and send a V3 if 
the explicit parameter is preferred.

Br, Kai
---318106570-1915050432-1632825702=:3554566--
