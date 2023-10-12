Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3FF7C70F9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 17:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1F710E4F5;
	Thu, 12 Oct 2023 15:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BC110E4F5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697123291; x=1728659291;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/1CsdNQjxQo9/5qh0TNOdpn1mckdm/TJkKZvUEyDvlE=;
 b=LNRovgrIEMHQw4Haix1K5Yd01CMB4GTVPXx25plK4KySO8Wh0iB+Gans
 jEXx113U5YPUMPfTIu5u5bKsfHIglmUTFTaaeYKNNsv+Ag//sH1LtV6IA
 5Yyj0e728yYW9A8Zk6dyyjGpzNItB9hPl12srAAyHZIvjF4/lsI7QE82Q
 5OUR4bVqDTKsmLv6ZjHNhoiVGel0Il31Lutjl5Nv11kzeHjMMI6ysJrlD
 th2AjtvEvoseoEmawwQqvHwoRNsmrxbyTR2GJUHwQvwYFX9KN/plbJ1bM
 G3FXB8Tw1KvCnsvDIMPmiNlwItGxMmSfcpa9QpNsIKtmjKO/PsEK/aORh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="415993231"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="415993231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 08:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085696842"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1085696842"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 08:08:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jean Delvare <jdelvare@suse.com>, "lakshmiy@us.ibm.com"
 <lakshmiy@us.ibm.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
 "joel@jms.id.au" <joel@jms.id.au>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "ninad@linux.ibm.com"
 <ninad@linux.ibm.com>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 1/2] i2c: smbus: Allow throttling of transfers to
 client devices
In-Reply-To: <bf0d71383958e7cc88bc84c7e2378f10d3a486f3.camel@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <20231009211420.3454026-2-lakshmiy@us.ibm.com>
 <bf0d71383958e7cc88bc84c7e2378f10d3a486f3.camel@suse.com>
Date: Thu, 12 Oct 2023 18:08:03 +0300
Message-ID: <87y1g7zxnw.fsf@intel.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Oct 2023, Jean Delvare <jdelvare@suse.com> wrote:
> On Mon, 2023-10-09 at 16:14 -0500, Lakshmi Yadlapati wrote:
>> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
>> ---
>> =C2=A0drivers/i2c/i2c-core-base.c=C2=A0 |=C2=A0=C2=A0 8 +-
>> =C2=A0drivers/i2c/i2c-core-smbus.c | 143 ++++++++++++++++++++++++++++---=
----
>> =C2=A0drivers/i2c/i2c-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++++++
>> =C2=A0include/linux/i2c.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
>> =C2=A04 files changed, 145 insertions(+), 31 deletions(-)
>> (...)
>
> Non-trivial patch with no description -> not even looking, sorry. You
> can't possibly propose a change to the core of a subsystem and not
> bother explaining why this change is needed or what purpose it serves.

We've even managed to write extensive documentation on this!

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

>
> (And yes I know there's some information in patch 0/2, but that's not
> going to make it into git, so it will be lost. Commits should be self-
> sufficient, not only the implementation, but also the description.)
>
> I would also suggest trimming the To and Cc lists. I can't really see
> how linux-media and dri-devel are relevant here for example.

--=20
Jani Nikula, Intel
