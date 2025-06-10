Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337AAD323C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40410E4CF;
	Tue, 10 Jun 2025 09:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWh1rrpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA410E4CE;
 Tue, 10 Jun 2025 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749548218; x=1781084218;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oZXkphLZ9yWr/KWNvTNEp1ekZRbzF9leJ/Vfkw0ZQc4=;
 b=JWh1rrpMqJvKcH18D7sm76nUGlK6KdI4uDgfoGvvVKswYE49ldwyWJsd
 XLICuzoLcSFZ7XJZwWF+ofI18FA4+iUFULPV7C7LFrFFz5OezsWXJFwtc
 jaAhXZeoZB+Yaq/cRM9a+xpj5m7MJTbVWfYI8wt5k5vM/m8xiyGOQrXJH
 YY9UgI/0BXK6G4h6UL7OsqdnRxeX98xdyUd8pDlOVM3zCWq8A1DdqAjpY
 Oe9v96QhnS8zRE5KuW4fpvUhg0QvqkeQx8C4fMFht0MyOYh/WzBV9Yhgt
 hyFd5dOWvQEgXLFYw1RFqWom8Y6YRProBO6kKBgDgsQbGDotdkJKQGxxy A==;
X-CSE-ConnectionGUID: Dj7hA6h3QraroOMEIly16Q==
X-CSE-MsgGUID: VwxadnZuT8+h9so+F6sHmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51740761"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51740761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:36:57 -0700
X-CSE-ConnectionGUID: a+Jn+SvqQG6ApJfP4hLvOw==
X-CSE-MsgGUID: lYx8FYEvSp63p40ppFwfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="177701392"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:36:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Wysocki Rafael J
 <rafael.j.wysocki@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 simon1.yang@intel.com, Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
In-Reply-To: <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1749199013.git.jani.nikula@intel.com>
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
 <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
Date: Tue, 10 Jun 2025 12:36:32 +0300
Message-ID: <b31df3472d3a6db28c8b23fbfa96a5de8ca865c9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 09 Jun 2025, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Fri, Jun 6, 2025 at 2:06=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>>
>> Use firmware node based lookups for panel followers, to make the code
>> independent of OF and device tree, and make it work also for ACPI with
>> an appropriate _DSD.
>>
>> ASL example:
>>
>>         Package (0x02)
>>         {
>>                 "panel", \_SB.PCI0.GFX0.LCD0
>>         }
>>
>> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
>>  1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> index fee65dc65979..3eb0a615f7a9 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
>>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>>  #endif
>>
>> -static struct drm_panel *of_find_panel(struct device *follower_dev)
>> +/* Find panel by fwnode */
>> +static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handl=
e *fwnode)
>
> nit: It might be worth adding a comment that says it should be
> identical to of_drm_find_panel() since that has a much richer
> kerneldoc that talks about the corner cases.

Agreed.

I'm actually wondering if it would be possible to implement
of_drm_find_panel() like this (as a follow-up change):

struct drm_panel *of_drm_find_panel(const struct device_node *np)
{
	const struct fwnode_handle *fwnode =3D of_fwnode_handle(np);

	return find_panel_by_fwnode(fwnode);
}

But I'd rather leave that out for now.

>
>>  {
>> -       struct device_node *panel_np;
>>         struct drm_panel *panel;
>>
>> -       panel_np =3D of_parse_phandle(follower_dev->of_node, "panel", 0);
>> -       if (!panel_np)
>> +       if (!fwnode_device_is_available(fwnode))
>>                 return ERR_PTR(-ENODEV);
>>
>> -       panel =3D of_drm_find_panel(panel_np);
>> -       of_node_put(panel_np);
>> +       mutex_lock(&panel_lock);
>> +
>> +       list_for_each_entry(panel, &panel_list, list) {
>> +               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
>> +                       mutex_unlock(&panel_lock);
>> +                       return panel;
>> +               }
>> +       }
>> +
>> +       mutex_unlock(&panel_lock);
>> +
>> +       return ERR_PTR(-EPROBE_DEFER);
>> +}
>> +
>> +/* Find panel by follower device */
>> +static struct drm_panel *find_panel_by_dev(struct device *follower_dev)
>> +{
>> +       struct fwnode_handle *fwnode;
>> +       struct drm_panel *panel;
>> +
>> +       fwnode =3D fwnode_find_reference(dev_fwnode(follower_dev), "pane=
l", 0);
>> +       if (IS_ERR_OR_NULL(fwnode))
>
> nit: why IS_ERR_OR_NULL() instead of IS_ERR()? The kerneldoc for
> fwnode_find_reference() doesn't mention anything about it returning a
> NULL value in any cases...

Will fix.

> Other than the nits, this looks reasonable to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I no longer have any easy access to hardware where panel-follower is
> truly necessary, but I can at least see the panel-follower calls
> getting made on sc7180-trogdor-lazor, so the of->fwnode conversion
> stuff must be working.
>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Thanks for the review and testing, much appreciated!

BR,
Jani.


--=20
Jani Nikula, Intel
