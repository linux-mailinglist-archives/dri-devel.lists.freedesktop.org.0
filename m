Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F986ED5C3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 22:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B1310E5DD;
	Mon, 24 Apr 2023 20:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB4210E5DD;
 Mon, 24 Apr 2023 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682366419; x=1713902419;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=+TbFrM6eq4Hos/iHRxkTwpOWwNOssXY0698PPyrAaRc=;
 b=TR9AehM7MuIUxyp9faerSLZsxuvZiKhdYfvOxcYNUbJzfACnlPLibnX4
 3FjQRjgLDHoVjZo+ynVmlXpFBxtikgJjaDmEBZz3JSeXWxMjz/ZPBE9K+
 2z/KtpNnV84ksvUY9Bw9qqyyfHyVO/XoO9ftfNy4VMEZ8+QQP2/06JMhQ
 Fik1Y47Ga7+QfQfiTdgfoYTH5bLKFL/w7BNO0j5IiDytEcAWUmKy9lNQg
 h8bH1HU8DDsqbeWiWEJo8bVkENg+i7hyuVwe+Hw/uDpXzGdANcCo4SIS8
 g9dORkBihf0JvmSQINDCuvCsfb8EpPCEaS8Mmtdhezf1I4WWNrzXFhA5V A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326157513"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="326157513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="670622362"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="670622362"
Received: from rmanna-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.73.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 13:00:18 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SN6PR11MB257475B612B2D78EC9801D189A9C9@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <22235ebd-434f-ec17-43ca-41a29589b202@ubuntu.com>
 <SN6PR11MB257475B612B2D78EC9801D189A9C9@SN6PR11MB2574.namprd11.prod.outlook.com>
Subject: RE: [Intel-gfx] [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>, Timo Aaltonen <tjaalton@ubuntu.com>,
 intel-gfx@lists.freedesktop.org
Date: Mon, 24 Apr 2023 13:00:17 -0700
Message-ID: <168236641763.392286.5740817225685975052@jljusten-skl>
User-Agent: alot/0.10
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-16 23:43:20, Yang, Fei wrote:
> > fei.yang@intel.com kirjoitti 17.4.2023 klo 9.24:
> >> From: Fei Yang <fei.yang@intel.com>
> >>=20
> >> The series includes patches needed to enable MTL.
> >> Also add new extension for GEM_CREATE uAPI to let user space set cache=
=20
> >> policy for buffer objects.
> >
> > if I'm counting right, this would be version 5 of the series, yet
> > that is not shown anywhere nor the changes between series..
>=20
> Yes, mostly addressing minor issues, just want to keep the commit
> message clean as it's the enablement patch set for new platform.

One thing that could help is to use the --subject-prefix parameter to
git format-patch so "PATCH v5" would be in the subject of the emails.

Additionally, it's helpful to include full a version history in the
cover-letter (0/8) patch so it's clear what has changed in each
version of the patches sent out.

-Jordan
