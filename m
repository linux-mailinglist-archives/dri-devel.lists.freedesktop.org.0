Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41EA21879
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 09:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064AA10E754;
	Wed, 29 Jan 2025 08:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hG2p+bjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2C10E751;
 Wed, 29 Jan 2025 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738137820; x=1769673820;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=WsOJu6fThkqi8Gfb6QqoEcA0IXQiWyooWShrmktFC60=;
 b=hG2p+bjx6DkpbAmLwreMVUANWJOcegTZ0/SZs/oBXmGE1B4SkREG2Jlo
 rMkz96we8n3n3E0J3ZFxsAUIhrQfdX5fgovzOtR22N46nX2COy1fdQ6Hm
 Y07PboLuwhW6jXNeW92V1eWtoTG4EIUu0tSXuqCQ79OLYPSpJ04oFqHF0
 /XOfEXdI3Mw9OQeefNE2gT+pU5wLhMasq/Q6nBa+KljY5bhfvDJ8oFQGh
 NEBCxTan9HVUSvJZ5eEfVmyxA9v7G7fhG/acai4lMSsKxK6yYhWK1Zyua
 zJJZZdZESPV/gALW2NocUP5rYA/Hwkrir31Ubh8oqMAd7Uq3HDkJr4xMI A==;
X-CSE-ConnectionGUID: UQOg838hThSJU7h3KlP7zA==
X-CSE-MsgGUID: ycQIdzRZSEaZyDdTV02u+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56176880"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="56176880"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:03:40 -0800
X-CSE-ConnectionGUID: NomVA7iDQ+KHW/Od3GPMww==
X-CSE-MsgGUID: xkprIJJvQieEI3qdlCRtow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132238541"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 00:03:38 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
 <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Simona Vetter <simona@ffwll.ch>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 10:03:34 +0200
Message-ID: <173813781464.9444.9979122540723604978@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Christian K=C3=B6nig (2024-12-20 14:56:14)
> Am 20.12.24 um 12:31 schrieb Mika Kuoppala:
> > Implement debugger vm access for userptrs.
> >
> > When bind is done, take ref to current task so that
> > we know from which vm the address was bound. Then during
> > debugger pread/pwrite we use this target task as
> > parameter to access the debuggee vm with access_process_vm().
> >
> > This is based on suggestions from Thomas, Joonas and Simona.
>=20
> Yeah that looks much saner to me. I still have a couple of comments on=20
> the general approach, but I'm going to write that up after my vacation.

I see you've had some issues with mail servers, so just pinging here to
see if any replies have got lost.

Would be great to reach a consensus on the high level details before
spinning off further series addressing the smaller items.

Regards, Joonas

>=20
> Regards,
> Christian.
