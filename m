Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6D3F327E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 19:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4AA6EADB;
	Fri, 20 Aug 2021 17:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4492B6EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629481820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cyc2idEvb/XAUIUvdNpiITPnSoCTix0slyXVBx8VagQ=;
 b=e276rUjARbhvx/m6cVYUSWyqPbdzczBW2V4ah9yqVdxbEf+1qfXwMomfykYbKDWrZiO9Ii
 SNqMYI1lkp7EI1pOYXe0YfoyJ4qkwqaYcONyCNu/4Z35ITtChxuV0R3wShwsjH0pF+CHgH
 Y+d/XpKaDeNlLzstUbOKnojocqhKLM8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-U1buJJP_PkKZXyDhcZaxkQ-1; Fri, 20 Aug 2021 13:50:17 -0400
X-MC-Unique: U1buJJP_PkKZXyDhcZaxkQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso4014697ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 10:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=cyc2idEvb/XAUIUvdNpiITPnSoCTix0slyXVBx8VagQ=;
 b=PU7f87TeMDM1pMo552zKL6GufXGp2OjvlbPGp4FcEltUchu9RtD6O6zteHxeGFEfEt
 gDLdOL7mH7Ux9HH/VF6NVgQ0dJFGLg8EGKfQvUdZtUKjcuDKT+GaK5qvVKNlYe2z7lci
 obCPeN/AUA42vmFembVR9UHRaTXFbWXSFIV06iFbSqrbkDdiF75xnHHvuiIAk+LcQu15
 4nSbBXqWY5yf5qhIaDLh09yhISAlYPzn120ci7uQn9rlmpkGkxnRtaLVBeDZRK8rHsfe
 eEo/0E6ZNdIoi1q0/yzgLi5KxTHPQeCOb5/Qp1rj3JSYCVs3wmAlwM86ZR/YerRgwR+j
 UteA==
X-Gm-Message-State: AOAM53293QcEiKlI3T8VtV66B8w/wT0nXOwKL5lZbgtwOEYRp+nm05PE
 s93EkDPYc/MwGSIr4+lWbd9O1OuMRXturXMUyrbEmdlBij/jVq6P/XYrnn4W+UJZBiYrSonRiFi
 cMbGjS7K8Obbhncx6CpfFePIFHaN7
X-Received: by 2002:a17:907:105d:: with SMTP id
 oy29mr22843059ejb.531.1629481816273; 
 Fri, 20 Aug 2021 10:50:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWep/FkThx/FrYKQ/H6dH/XK1FG40BeBmmdgFYuWhLmx8DMyFErQEfmUvhO5DlLOFg2CucdA==
X-Received: by 2002:a17:907:105d:: with SMTP id
 oy29mr22843030ejb.531.1629481816051; 
 Fri, 20 Aug 2021 10:50:16 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id i6sm4012505edt.28.2021.08.20.10.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 10:50:15 -0700 (PDT)
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] drm-misc + drm-intel: Add support for out-of-band hotplug
 notification
Message-ID: <34f13e21-9b1a-5f54-7e03-9705a6b51428@redhat.com>
Date: Fri, 20 Aug 2021 19:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello drm-misc and drm-intel maintainers,

My "Add support for out-of-band hotplug notification" patchset:
https://patchwork.freedesktop.org/series/93763/

Is ready for merging now, as discussed on IRC I based this series
on top drm-tip and when trying to apply the i915 parts on top
of drm-misc this fails due to conflict.

So as Jani suggested here is a pull-req for a topic-branch with the
entire set, minus the troublesome i915 bits. Once this has been merged
into both drm-misc-next and drm-intel-next I can push the 2 i915
patch do drm-intel-next on top of the merge.

Note there are also 2 drivers/usb/typec patches in here these
have Greg KH's Reviewed-by for merging through the drm tree,
Since this USB code does not change all that much. I also checked
and the drm-misc-next-2021-08-12 base of this tree contains the
same last commit to the modified file as usb-next.

Daniel Vetter mentioned on IRC that it might be better for you to simply
pick-up the series directly from patchwork, that is fine too in that
case don't forget to add:

Reviewed-by: Lyude Paul <lyude@redhat.com>

To the entire series (given in a reply to the cover-letter)

And:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

To the usb/typec patches (patch 7/8), this was given in reply
to a previous posting of the series and I forgot to add this
in the resend.

Regards,

Hans


The following changes since commit c7782443a88926a4f938f0193041616328cf2db2:

  drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors (2021-08-12 09:56:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git drm-misc-intel-oob-hotplug-v1

for you to fetch changes up to 7f811394878535ed9a6849717de8c2959ae38899:

  usb: typec: altmodes/displayport: Notify drm subsys of hotplug events (2021-08-20 12:35:59 +0200)

----------------------------------------------------------------
Topic branch for drm-misc / drm-intel for OOB hotplug support for Type-C connectors

----------------------------------------------------------------
Hans de Goede (6):
      drm/connector: Give connector sysfs devices there own device_type
      drm/connector: Add a fwnode pointer to drm_connector and register with ACPI (v2)
      drm/connector: Add drm_connector_find_by_fwnode() function (v3)
      drm/connector: Add support for out-of-band hotplug notification (v3)
      usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic
      usb: typec: altmodes/displayport: Notify drm subsys of hotplug events

 drivers/gpu/drm/drm_connector.c          | 79 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h      |  2 +
 drivers/gpu/drm/drm_sysfs.c              | 87 +++++++++++++++++++++++++++-----
 drivers/usb/typec/altmodes/Kconfig       |  1 +
 drivers/usb/typec/altmodes/displayport.c | 58 +++++++++++++--------
 include/drm/drm_connector.h              | 25 +++++++++
 6 files changed, 217 insertions(+), 35 deletions(-)

