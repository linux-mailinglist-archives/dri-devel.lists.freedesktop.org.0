Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C19FF4E2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2025 21:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4244A10E1F8;
	Wed,  1 Jan 2025 20:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOyKJjXb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7454D10E1F8;
 Wed,  1 Jan 2025 20:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735764941; x=1767300941;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wJxE0VhI4245QsBRaUlZMHe9srJx5wH1Gs8qUjCkXj8=;
 b=WOyKJjXb8ur6bH01UWPuLZ+Lb9IkaEs5EYrtyVewzjX0M495Pww3QEad
 b2/o92yNf214FZftE97klBLl+IJUrHX0SuAja26T4UOhW7aox1D2N72Dc
 TK4vbMfqWnLKHmqGUob5V4y9s7UlWC1+TIc8sz28wT2MqJAhERGpxOc8/
 SVnhHwMDYC1ACR0ytkjE1uWQZQqgHN3Q583Q1lcr/k9dCj1f27l7TdEOE
 22/KsN4eEmX+R2qYRigwmV7zXnUSoketamgCipWO8rgdg4+ActhUvBBKu
 OQeM9asZGGhh1DvY0geDZnB7VaF91cX6ZTuX2CQUG3A+OrgFBOeb4FGps A==;
X-CSE-ConnectionGUID: sswnBB8DR2aQYbKtXtGJ4A==
X-CSE-MsgGUID: MzJ41oZTRBqroXOMlWnvzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53405766"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; d="scan'208";a="53405766"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 12:55:41 -0800
X-CSE-ConnectionGUID: 3qFIqEp2QQ6I44z0qmp8mw==
X-CSE-MsgGUID: Zjq9/VaAT+y6TKOAdzZ7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106377707"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.202])
 ([10.245.246.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 12:55:39 -0800
Message-ID: <5ca1c5b64c313108ea2aa005ae273f1ba8051e7f.camel@linux.intel.com>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Genes Lists <lists@sapience.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 stable@vger.kernel.org, 	regressions@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>
Date: Wed, 01 Jan 2025 21:55:26 +0100
In-Reply-To: <0ef755e06b8f0bf1ee4dfd7e743d6222fd795b70.camel@sapience.com>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <20241230141329.5f698715@batman.local.home>
 <20241230145002.3cc11717@gandalf.local.home>
 <5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
 <20241230160311.4eec04da@gandalf.local.home>
 <0ef755e06b8f0bf1ee4dfd7e743d6222fd795b70.camel@sapience.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Mon, 2024-12-30 at 16:07 -0500, Genes Lists wrote:
> On Mon, 2024-12-30 at 16:03 -0500, Steven Rostedt wrote:
> > >=20
> >=20
> > I'll start making it into an official patch. Can I add your
> > "Tested-
> > by" to it?
> >=20
> > -- Steve
> Terrific thank you and sure:
> =C2=A0Tested-by: Gene C <arch@sapience.com>
>=20
>=20

FWIW, we actually worked around this during the holiday in the drm-xe-
next branch in the xe driver since it was breaking our CI. Was planning
to include it for drm-xe-fixes for tomorrow. Since xe appeared to be
the only driver hitting this, our assumption was that it'd be better
fixed in the driver.

Thanks,
Thomas

