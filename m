Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1C17B97D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 10:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935C06ECB1;
	Fri,  6 Mar 2020 09:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413856ECAA;
 Fri,  6 Mar 2020 09:42:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 01:42:12 -0800
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; d="scan'208";a="234747642"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 01:42:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v6 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
In-Reply-To: <CACK8Z6HRB9q1KeborGr7V-0Qp0AApHV6gBTkc6xD5NokH8gr0w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200305012338.219746-1-rajatja@google.com>
 <20200305012338.219746-3-rajatja@google.com> <87o8tbnnqa.fsf@intel.com>
 <CACK8Z6HRB9q1KeborGr7V-0Qp0AApHV6gBTkc6xD5NokH8gr0w@mail.gmail.com>
Date: Fri, 06 Mar 2020 11:42:00 +0200
Message-ID: <87tv31om53.fsf@intel.com>
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Mark Pearson <mpearson@lenovo.com>, Tomoki Maruichi <maruichit@lenovo.com>,
 Jesse Barnes <jsbarnes@google.com>, Rajat Jain <rajatxjain@gmail.com>,
 intel-gfx@lists.freedesktop.org, Mat King <mathewk@google.com>,
 =?utf-8?Q?Jo?= =?utf-8?Q?s=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@denx.de>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
> On Thu, Mar 5, 2020 at 1:41 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Wed, 04 Mar 2020, Rajat Jain <rajatja@google.com> wrote:
>> 1) See if we can postpone creating and attaching properties to connector
>> ->late_register hook. (I didn't have the time to look into it yet, at
>> all.)
>
> Apparently not. The drm core doesn't like to add properties in
> late_register() callback. I just tried it and get this warning:

I kind of had a feeling this would be the case, thanks for checking.

>> 2) Provide a way to populate connector->acpi_device_id and
>> connector->acpi_handle on a per-connector basis. At least the device id
>> remains constant for the lifetime of the drm_device
>
> Are you confirming that the connector->acpi_device_id remains constant
> for the lifetime of the drm_device, as calculated in
> intel_acpi_device_id_update()?  Even in the face of external displays
> (monitors) being connected and disconnected during the lifetime of the
> system? If so, then I think we can have a solution.

First I thought so. Alas it does not hold for DP MST, where you can have
connectors added and removed dynamically. I think we could ensure they
stay the same for all other connectors though. I'm pretty sure this is
already the case; they get added/removed after all others.

Another thought, from the ACPI perspective, I'm not sure the dynamically
added/removed DP MST connectors should even have acpi handles. But
again, tying all this together with ACPI stuff is not something I am an
expert on.

>> (why do we keep
>> updating it at every resume?!) but can we be sure ->acpi_handle does
>> too? (I don't really know my way around ACPI.)
>
> I don't understand why this was being updated on every resume in that
> case (this existed even before my patchset). I believe we do not need
> it. Yes, the ->acpi_handle will not change if the ->acpi_device_id
> does not change. I believe the way forward should then be to populate
> connector->acpi_device_id and connector->acpi_handle ONE TIME at the
> time of connector init (and not update it on every resume). Does this
> sound ok?

If a DP MST connector gets removed, should the other ACPI display
indexes after that shift, or remain the same? I really don't know.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
