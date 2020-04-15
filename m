Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F91A9927
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720606E29A;
	Wed, 15 Apr 2020 09:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68C6E29A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586943754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RPBIw495cEkYeEAix2qc9qiPbe7zXBysXrNJAwnlsDQ=;
 b=iXMwHdbwhRENe/9G3esvnFAW+XTyC81Y4P5Bub8q+fVvpwuJ/nvhmYgT12WZKjExywaVa8
 N8ABu0+WzhaBqz+bcxAxmyL1ADHzq2X8JxAAnQOHaJvRzZoXG9lEsdhxH7LHMI9UvUOHZI
 wM5zt6UW7W5jaY/sdwfMSP7es2xnExY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-skMuPz9LN8aG-SI_R046uQ-1; Wed, 15 Apr 2020 05:42:26 -0400
X-MC-Unique: skMuPz9LN8aG-SI_R046uQ-1
Received: by mail-wr1-f70.google.com with SMTP id h95so10255711wrh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 02:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:cc:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=RPBIw495cEkYeEAix2qc9qiPbe7zXBysXrNJAwnlsDQ=;
 b=PfZhgmu5ERgv3syc/LZez4/14zwa6vYz2wn6L0OIUG3pTxfChsLYbVp3yswqxmMPj8
 E2ZsSnmFYLukD/rzbDgsKE4VTG1CPMV4j3cFNBk66N5SHbHnNKh3HW/xGLv6REoltCzI
 UcPsvtzVX7lkTUfPKKePtZ+HiE0u8Vn5a1e4A5jfhtkgGmNawjAg6EVg6KZrQA12z+Gg
 Fl0O0FaJye04Z1BO0X06Kc1QXWG/g2P+Av4kd32bvl8raKK7AkMYi/nw4fTigWgIvqDF
 UGExYIr6d+IYl3hjhH4QFSZusrxauBdLno6HK89O7ax1Ahq8AqB0S7AeYtpF+vQm3Uth
 7gEw==
X-Gm-Message-State: AGi0PubBdeXojwd0DfsIHnLbMWQcTwBmHVihv11WxKx/HPMGZ8hQUNkC
 2H4+J/+mTQf1UKl0Ga+hBc5rpn2HE9UsOH/m6r81FgwRA03ZJNMvTgr2SqbWe5iigssS8d5QHst
 27OIywXZugJg7fZl2TyuiQd461B3y
X-Received: by 2002:a1c:e903:: with SMTP id q3mr4203200wmc.76.1586943745486;
 Wed, 15 Apr 2020 02:42:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypKxj6Xkmm14vtylJ9me1TEDVSehpTidn8T3zvzj7VqBuxg8GL1jVvqDd1o2dsO3lG8vTvR6QQ==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr4203159wmc.76.1586943745113;
 Wed, 15 Apr 2020 02:42:25 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id r5sm22190860wmr.15.2020.04.15.02.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 02:42:24 -0700 (PDT)
From: Hans de Goede <hdegoede@redhat.com>
Subject: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
Date: Wed, 15 Apr 2020 11:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
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
Cc: Benjamin Berg <bberg@redhat.com>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mark Pearson <mpearson@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Somewhat long mail, so I've divided it into "chapters", sorry.

1. Back ground info
-------------------

First some quick background, some recent Lenovo models have
a builtin privacy screen which can be turned on/off in software
and the kernel recently has gotten support for this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=110ea1d833ad291272d52e0a40a06157a3d9ba17

We have been looking into adding support for this to GNOME,
but the userspace API added by the above commit is very
Thinkpad specific, and we would rather not rely on an
userspace API which is specific to 1 series of laptops.

When we started discussing this I had already seen some versions
of Rajat's "drm/i915 Support for integrated privacy screen" series:

https://patchwork.freedesktop.org/series/74650/

Which adds support for integrated privacy screens
as a drm-connector property. Anyone who has been involved
in the backlight brightness control saga we have with
the sysfs backlight class instantly knows/feels that
this is the right way to handle this.

So now we want to export the Thinkpad lcdshadow
attribute as a drm-connector property.


2. Problem + Possible solutions
-------------------------------

The problem is that the code to get/set the lcdshadow
setting and also the code to listen for firmware (hardcoded
hotkeys) triggered state changes all lives inside the thinkpad_acpi
driver; and to export the lcdshadow setting as a drm property
we need to access that code (and it is too big to just copy
over).

One thing which makes this trickier is that all properties must
be attached to the connector before it is registered, we cannot
add it at a later time.

I see 3 possible solutions here:

i. Export some symbols from thinkpad_acpi and directly call these
from drm_connector_create_standard_properties and other
drm_connector functions if the thinkpad_acpi module is enabled.
Note this should be done in the core drm_connector functions since
the GPU might be one of i915 / amdgpu / nouveau. I believe that
it is clear that this solution is not very elegant.

A variant of this would be to have a separate helper module
(probaly a few static inlines in a .h) which exports some hooks for
i915 / amdgpu / nouveau to call this way we at least keep the
ugliness out of the core and keep the module-dep on thinkpad_acpi
limited to the i915 / amdgpu / nouveau modules. This might
actually not be too bad, except that currently the thinkpad_acpi
module refuses to load on non thinkpads...


ii. Currently the "privacy-screen" property added by Rajat's
patch-set is an enum with 2 possible values:
"Enabled"
"Disabled"

We could add a third value "Not Available", which would be the
default and then for internal panels always add the property
so that we avoid the problem that detecting if the laptop has
an internal privacy screen needs to be done before the connector
is registered. Then we can add some hooks which allow an
lcdshadow-driver to register itself against a connector later
(which is non trivial wrt probe order, but lets ignore that for now).


iii. We can add a generic framework to allow drivers outside
of the drm-subsys to register something drm_property(ish) specifying
a dev_name() and connector-name to which to attach the property
when that connector gets created on that device.

This requires the driver registering this property to be fully
loaded before the connector gets registered.


3. Picking a solution
---------------------

i. is just ugly, full stop, but also very KISS which still makes
it somewhat appealing. Also i. does not scale if we get other
vendor specific interfaces for interacting with these
privacy screens.


ii. is ugly from an userspace API pov, if there is no
"privacy-screen" then we really should not have the property at
all rather then setting it to "Not Available". Still it might be
an acceptable compromise I guess


iii. is/was the one I liked, until I started looking at the
drm_connector code and saw that all properties must be attached
before registering the connector, bummer. Then this morning I
remembered that the i915 driver has a similar issue with the
gvt stuff / the kvmgt module. The kvmgt module must be loaded
and fully initialized before the i915 driver loads. This has
been solved with module softdeps.

I think that we can do the same here having either the
i915+nouveau+amdgpu drivers; or the drm-core have a softdep on
thinkpad_acpi so that it can register the lcdshadow property
with the to-be-written framework for externally managed props
before the internal panels drm-connector gets created.

This also allows the thinkpad_acpi module_init function to
return -ENODEV on non Thinkpad devices, so that it will
not take up memory, where as with i. we would always need to
have it in memory.

I'm currently leaning towards iii. combined with using
MODULE_SOFTDEP("pre: thinkpad_acpi") to make sure the thinkpad_acpi
driver can do its thing before the internal display connector gets
created.

Daniel (and others) does this (iii. + softdeps) sound like
something which might be acceptable (I know it will also
depend on the resulting code implementing this idea) ?

Any other ideas / suggestions are appreciated here.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
