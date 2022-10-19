Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85140604616
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934610E998;
	Wed, 19 Oct 2022 12:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9E10E998;
 Wed, 19 Oct 2022 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666184274; x=1697720274;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TxD76gxWxWY7Vah+aZmHr2ByAHaRPt2R0yoC+T8dfug=;
 b=IwHxjHXOFQsAbgRi76gRP8UTiV0wW7Un9TH8+C56NMd3Z1Cdr2ldHZzV
 WMi7WC7FzYIZOdDWnUeaFhIKf08ueifQn8ihkQiBGPg195FhcLB5lR9ak
 jUFsxwdW7+aSR2VvmaS8cax7QQi5BTDbrhtNvL+qMPKJpb66bwRpcvx2+
 qwX6kmG+tJpBPOVaM+BuN8ALBftb6N2ygyTAws8dr+w5lHSm+7pXj9XSj
 Qq2aWhZbVakJDtm8P1JYGQotoxI4B1+OJAw5xFDmGeBqO8ZXOVHZLF1Z6
 PTfXxv4XNk9RMt/UTiIOJ19/Y4EwGbVi04zmXZPLn7sWdCtz5D43+dLVM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="293796069"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="293796069"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:57:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="698059872"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698059872"
Received: from mosermix-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.50.2])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:57:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] ACPI: PCI: Fix device reference counting in
 acpi_get_pci_dev()
In-Reply-To: <Y0/sGveKPjuUWOhO@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <12097002.O9o76ZdvQC@kreacher> <Y0+7Ug9Yh6J6uHVr@intel.com>
 <CAJZ5v0gKW9S29xS2+qkcopzYtZKTcM=ZT-Jjc4fnEJfu=oYKaw@mail.gmail.com>
 <Y0/sGveKPjuUWOhO@intel.com>
Date: Wed, 19 Oct 2022 15:57:48 +0300
Message-ID: <87zgdsgecz.fsf@intel.com>
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
Cc: Linux PCI <linux-pci@vger.kernel.org>, intel-gfx@lists.freedesktop.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Linux ACPI <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Oct 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Oct 19, 2022 at 01:35:26PM +0200, Rafael J. Wysocki wrote:
>> If catching things like this early is better, what about pulling my
>> bleeding-edge branch, where all of my changes are staged before going
>> into linux-next, into the CI?
>
> Pretty sure we don't have the resources to become the CI for
> everyone. So testing random trees is not really possible. And=20
> the alternative of pulling random trees into drm-tip is probably
> a not a popular idea either. We used to pull in the sound tree
> since it's pretty closely tied to graphics, but I think we
> stopped even that because it eneded up pulling the whole of
> -rc1 in at random points in time when we were't expecting it.

Basically, we only pull branches to drm-tip that are managed using our
tools and our development model and under our control. It was too much
trouble dealing with conflicts, Linus' master being pulled in at random
points (like in the middle of the merge window), and stuff like that,
with the external trees.

> Ideally each subsystem would have its own CI, or there should
> be some kernel wide thing. But I suppose the progress towards
> something like that is glacial.
>
> That said, we do test linux-next to some degree. And looks like
> at least one of these could have been caught a bit earlier through
> that. Unfortunately no one is really keeping an eye on that so
> things tend to slip through. Probably need to figure out something
> to make better use of that.

Yeah, we need to pay more attention to linux-next test results, as well
as Linus' master during the merge window. It's not necessarily easy with
the volatility of linux-next, you could easily have very broken runs
followed by good ones, but the low hanging fruit is raising more flags
and being louder about it earlier when everything's busted for several
days in linux-next or Linus' master.


BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
