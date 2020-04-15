Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0351AABDC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330F16EA11;
	Wed, 15 Apr 2020 15:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9626EA11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:28:30 +0000 (UTC)
IronPort-SDR: T6b2I0+1uij6R0fGvc/dtc+Sg5QVwsZqox34uOK1nJMRopRUptr70tWQzVd7uS2G128KVtoZ9j
 mttujm+LLdKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:28:29 -0700
IronPort-SDR: XslvWqVCu6w9juW1Z31kpHkk+UOJCAbQSPgr9OWSXF2Vpfr9Gymw2Z+Qcl6NpYRH1w43HumraX
 6w3RRuvV0Blg==
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="427468375"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 08:28:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
In-Reply-To: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
Date: Wed, 15 Apr 2020 18:28:21 +0300
Message-ID: <87tv1k4vl6.fsf@intel.com>
MIME-Version: 1.0
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
 Nitin Joshi1 <njoshi1@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> ii. Currently the "privacy-screen" property added by Rajat's
> patch-set is an enum with 2 possible values:
> "Enabled"
> "Disabled"
>
> We could add a third value "Not Available", which would be the
> default and then for internal panels always add the property
> so that we avoid the problem that detecting if the laptop has
> an internal privacy screen needs to be done before the connector
> is registered. Then we can add some hooks which allow an
> lcdshadow-driver to register itself against a connector later
> (which is non trivial wrt probe order, but lets ignore that for now).

I regret dropping the ball on Rajat's series (sorry!).

I do think having the connector property for this is the way to go. Even
if we couldn't necessarily figure out all the details on the kernel
internal connections, can we settle on the property though, so we could
move forward with Rajat's series?

Moreover, do we actually need two properties, one which could indicate
userspace's desire for the property, and another that tells the hardware
state? I'd so very much like to have no in-kernel/in-firmware shortcuts
to enable/disable the privacy screen, and instead have any hardware
buttons just be events that the userspace could react to. However I
don't think that'll be the case unfortunately.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
