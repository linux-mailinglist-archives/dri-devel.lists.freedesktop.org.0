Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DC3A7827
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 09:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6BF6E20B;
	Tue, 15 Jun 2021 07:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498576E20A;
 Tue, 15 Jun 2021 07:40:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 564E3610CD;
 Tue, 15 Jun 2021 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623742859;
 bh=VwEjZA+HLYCz2yRgKmTJNqgBt/h66NCTj9MfoC5gaww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kYMdoWDLs7rJmcw26Crm656vvOkuphOrxxa5mnTunPuTHKsG8IbcQFOp6D454pdo1
 W5vWO4J1i3yTSSzNBVrZLld7ptk8LW31Bk/OE34hHcej7SXGTvrmkL21SggR+/ryV6
 9ypiyBuaas3MxZTluSc3fWmwJy9Obf3iYfXAe/dY=
Date: Tue, 15 Jun 2021 09:40:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v4)
Message-ID: <YMhZiAFshz1xklUK@kroah.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604194840.14655-1-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 09:48:32PM +0200, Hans de Goede wrote:
> Here is v3 of my patchset making DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> Changes in v4:
> - Rebase on top of latest drm-tip
> - Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
>   (fixes warning reported by kernel test robot <lkp@intel.com>)
> - Add Heikki's Reviewed-by to patch 7 & 8
> - Add Heikki's Tested-by to the series
> 
> Changes in v3:
> - Base on top of latest drm-tip, which should fix the CI being unable to
>   apply (and thus to test) the patches
> - Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
>   it stores in connector->fwnode and have drm_connector_cleanup() put
>   this reference
> - Drop data argument from drm_connector_oob_hotplug_event()
> - Make the Type-C DP altmode code only call drm_connector_oob_hotplug_event()
>   when the HPD bit in the status vdo changes
> - Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
>   reference patch, this will be merged independently through the pdx86 tree
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.

No objection from me, I've replied with reviewed-by for those USB
patches now.

thanks,
greg k-h
