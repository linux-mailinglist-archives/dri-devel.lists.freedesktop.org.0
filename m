Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB9C58C2C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90010E8D1;
	Thu, 13 Nov 2025 16:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EllSJxDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130E10E8D1;
 Thu, 13 Nov 2025 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051735; x=1794587735;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=7sbPr+OYyRHBar1nKJfkvEGRrRcDwW4T5/fLzZ8KSEo=;
 b=EllSJxDc1De/hqVhnw/Z8XITHBdhpRfNAh5cUOiA7GsRL9EQ1vjSHvG7
 O1rUo0HXPlX7Vg0rHw9sosBjVAhYRhaquyV1pLPjgb4zLcyFgPLwjsfND
 Obub0PNA6mbh//YsaJzvXCHnxJHqXxWAaevrmeWTBLuJ0llA7RsVYwn/K
 JPhcyZBfyn7BPwsBzB2gJ5fbF0UT2kBY9QiRHdPj7XqadS/e9NmQuys4r
 DCDz/IQCN3u+SvwH8zMufWzNQCROQi8Fcpw3wZrho2hcSlovj6XmiW7M/
 1FvRsyT9C30nuQxwpMq5CQn9pwGrTZX+CebAN9X3seHbMpCQJbM551E1U w==;
X-CSE-ConnectionGUID: W3065zSAQsurTBcIBCeVGQ==
X-CSE-MsgGUID: Ogfj1/Z7TUab/fmOFVy14A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65045002"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65045002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:35:34 -0800
X-CSE-ConnectionGUID: 8fmo2khdT9W4Y07G+JXKdA==
X-CSE-MsgGUID: UwGyd1zXQbq2VfYt/HLLxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="220357168"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:35:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Nov 2025 18:35:26 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] PCI/IOV: Adjust ->barsz[] when changing BAR size
In-Reply-To: <20251113162932.GA2285446@bhelgaas>
Message-ID: <fe9bd3af-51f6-c1af-9cdc-c78aee7aaef9@linux.intel.com>
References: <20251113162932.GA2285446@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1084105416-1763051726=:1464"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1084105416-1763051726=:1464
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Nov 2025, Bjorn Helgaas wrote:

> On Tue, Oct 28, 2025 at 07:35:44PM +0200, Ilpo J=C3=A4rvinen wrote:
> > pci_rebar_set_size() adjusts BAR size for both normal and IOV BARs. The
> > struct pci_srvio keeps a cached copy of BAR size in unit of
> > resource_size_t in ->barsz[] ...
>=20
> Nit: s/pci_srvio/pci/sriov/  (fixed locally, FYI in case you post a v2)

I just posted v2 without seeing this first. :-(

I seem to never learn to type those letters in the correct order, I don't=
=20
know why I always keep typing them wrong.

> I'm not sure what "unit of resource_size_t" adds here, maybe could be
> removed to just say this?
>=20
>   struct pci_srvio keeps a cached copy of BAR size in ->barsz[] ...

Seems okay with me. I just had it there to differentiate from "BAR size"=20
which happens to often be the format directly compatible with field in the=
=20
capability.

--=20
 i.

--8323328-1084105416-1763051726=:1464--
