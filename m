Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B027EC817
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0B610E0AC;
	Wed, 15 Nov 2023 16:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E210E0F0;
 Wed, 15 Nov 2023 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700064280; x=1731600280;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O/fZFbklNsKeN7n0YTs1ErGCdGrUFkA8QD9UV8Sn92M=;
 b=Oxy1r0mQdGHqr69zJQrth4RfIyAgFUf9aQxaU9BdO52TrABp6OP9t3Xa
 j6UyQUm08TuxiNw1V6yp6v4JIP+Y4Otf0VQV6OSM5uvhtFtQuQWEKa4zu
 FtialsFMTisCcCjptBihHegKbcVO1yKXEulr6ELmlgzQotRD7uwZfDZVg
 Ntee3ONQflE1kAZLub5QmPDUxXbnEyt35oaN+tl3uAZWWjGFadcLzUS57
 FF9kjxBhqSIsx8P0VNXAjfU4B2ywhOUAvTXqzSRhseL1uNagvXS4ffB2D
 J8cN59nOAD9wz4292U1rONYx0MGZI0dQ7ul4dgTtIWnkB252bmzUcdpx6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389752766"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="389752766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6209924"
Received: from krchrist-mobl2.ger.corp.intel.com (HELO [10.249.254.114])
 ([10.249.254.114])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:04:36 -0800
Message-ID: <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Date: Wed, 15 Nov 2023 17:04:33 +0100
In-Reply-To: <ZVTfmbDz1HGqt4Ef@pollux>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVTfmbDz1HGqt4Ef@pollux>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Danilo,

On Wed, 2023-11-15 at 16:11 +0100, Danilo Krummrich wrote:
> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Add the first version of the VM_BIND locking document which is
> > intended to be part of the xe driver upstreaming agreement.
> >=20
> > The document describes and discuss the locking used during exec-
> > functions, evicton and for userptr gpu-vmas. Intention is to be
> > using the
> > same nomenclature as the drm-vm-bind-async.rst.
> >=20

Thanks for reviewing. I'll update the document accordingly except for
the s/an rwsem/a rwsem/g, I think it's "an rwsem" similarly to "an r".

/Thomas

