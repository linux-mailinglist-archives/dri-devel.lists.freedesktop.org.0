Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A860B4FD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 20:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8413010E704;
	Mon, 24 Oct 2022 18:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6450810E6D3;
 Mon, 24 Oct 2022 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666635083; x=1698171083;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5z5J6hyo+xzhPJHRSqQ2l3yOfGRRo8+TjXETgVVrD8A=;
 b=FVYR0n9zOXJnS/P/R0ocvn+vdcyRzuQ2zPhFwbEQiqnOADKe1u5j2JbB
 oYmfXOZ1pMdthwNAj3hU+lzEku1wJtl0Vfz8936vdqyuH4fvxI5HuJ1oa
 cHmCVRNESbMijTnbstkiNfISqdPzFZgN9zqiNCGAhRpksTBg4siH5Qvw2
 voD/JM+ySWa1Q8IzwkfAqdR783neBSLpljQ0xaGKCwm/u8LQXtS5fPMjU
 aR3MkmKisShWTpNJRPZraZpMgmD+B3iqrpLWBYUzdt3upeMoaG9WeRmBK
 JCS7sJdNoMUuCYKKDIZun829SJNkb0Fe7LyCCNYJF6LzV/JldhpQei70b Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="371707016"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="371707016"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 11:11:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609286400"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609286400"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 11:11:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 00/22] Fallback to native backlight
In-Reply-To: <78ad5d7b-4078-0b8e-f4aa-6c8113631359@daynix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
 <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
 <60672af8-05d2-113c-12b9-d635608be0dd@redhat.com>
 <ea69242c-0bc8-c7bb-9602-c7489bb69684@daynix.com>
 <7373e258-f7cc-4416-9b1c-c8c9dab59ada@daynix.com>
 <ae3497ed-b68d-c36a-6b6f-f7b9771d9238@redhat.com>
 <78ad5d7b-4078-0b8e-f4aa-6c8113631359@daynix.com>
Date: Mon, 24 Oct 2022 21:11:08 +0300
Message-ID: <87o7u1drcz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, platform-driver-x86@vger.kernel.org,
 devel@acpica.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Oct 2022, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> That aside, the first patch in this series can be applied without the 
> later patches so you may have a look at it. It's fine if you don't merge 
> it though since it does not fix really a pragmatic bug as its message says.

I think it's problematic because it needlessly ties i915 backlight
operation to existence of backlight devices that may not be related to
Intel GPU at all. The direction should be multiple supported backlight
devices, across GPUs and connectors, but only one per display.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
