Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571C36FBAD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 15:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2986E0AC;
	Fri, 30 Apr 2021 13:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5406A6F49B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
 b=FgiaOWUFkQjCcc1gdjlv8LcnaxW564qOWMoFGs0DHAZbKwyITnkE70iBWeFzA3ncpkbWgx
 GwL6gplhNxepPPJX8cxyRTo2JGCG9Y7U+LMXHWRxu1Hj39txx67gGZq1nxygAWovIVgUqV
 ZN8ZaV70xi88h9GX0KL9CxHxzcU60YY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-4AUFu3YpMBqgGwGXmc6ZZg-1; Fri, 30 Apr 2021 09:45:36 -0400
X-MC-Unique: 4AUFu3YpMBqgGwGXmc6ZZg-1
Received: by mail-ed1-f72.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so1613949edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
 b=KZRIjmeJBu1sU1o135j8YCvptjIVuYJL2cxvVPxFUb3ooXu9CgQGZhWvQikGn49tWn
 7dZSfzEH5ZfMC3TMtbZJ9bkODoNnkBgz/Qs1Oyd8GlD8y7bdK+MgxtKD8dxuLMwbxbg+
 0pZ+G8kw85IfjWFsBPrKLaZa4kaY2vLI2SMaeyATqAPf8SLqA4NN7TYkDEhNbAenqHAu
 Y24cl+DtTFgNNd0+96vikeBXAxVw6ju+P3lPvqrlGt1iWg6/nRltc58rOWxabyD8v7aU
 Hy4KxusHkWicrmOPNO+jPyjO28h2DhxGLxWL5dfqVKkhGmNNnYWq6u4LxiPfztDbyrDx
 kMfw==
X-Gm-Message-State: AOAM530dhpq0Emt6DiZ6mQkvGwWjRm54ciXSC+AmXdi+TXVBHO+Wb/ug
 ey199kUe32QcnmeRlhmFzG78qZY2mIqxQOj2svUolQPwCFlK5eO0mfqApWnzqbkYFvM5F+n95m3
 geqx93TKXM3NOOlo4eh28kZIlycu8
X-Received: by 2002:a05:6402:40d6:: with SMTP id
 z22mr6005346edb.275.1619790335077; 
 Fri, 30 Apr 2021 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVgln2PsbGBWtD0Y9vGbxqHA4KEKia8ZfjelCngqnsAV0j0ddhk9OZLNm9FE8nL8viwO/OZw==
X-Received: by 2002:a05:6402:40d6:: with SMTP id
 z22mr6005318edb.275.1619790334881; 
 Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n10sm1933338ejg.124.2021.04.30.06.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
 <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
 <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c6d5361-c435-521e-d7d7-f8976927f9de@redhat.com>
Date: Fri, 30 Apr 2021 15:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

p.s.

On 4/30/21 1:38 PM, Daniel Vetter wrote:

Offtopic:

> I'm also not sure why we have to use the kdev stuff here. For other
> random objects we need to look up we're building that functionality on
> that object. It means you need to keep another list_head around for
> that lookup, but that's really not a big cost. E.g. drm_bridge/panel
> work like that.

So I took a peek at the bridge/panel code and that actually seems to
have an issue with removal vs lookup. It is not even just a race,
it seems a lookup does not take a reference and there is nothing
stopping a user from doing an unbind or rmmod causing the panel
to be removed while other code which got a pointer to the panel
through of_drm_find_panel() will not be prepared to deal with
that pointer all of a sudden no longer being valid.

Now this would be a case of the user shooting his-self in the
foot (where as connectors can actually dynamically disappear
under normal circumstances), but ideally we really should do
better here.

Is there a TODO list somewhere for issues like this ?  Or shall
I submit a patch adding a FIXME comment, or is this considered
not worth the trouble of fixing it?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
