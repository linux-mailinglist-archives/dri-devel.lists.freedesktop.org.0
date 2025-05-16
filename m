Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E4AB97C6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 10:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F145210E9EB;
	Fri, 16 May 2025 08:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIrGWhlY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CA10E13A;
 Fri, 16 May 2025 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747384448; x=1778920448;
 h=message-id:subject:from:to:cc:date:
 content-transfer-encoding:mime-version;
 bh=ohXKdaEEEnFeXRwVN3z5Vo0k2EW73WN+C+6TLPl/UPE=;
 b=MIrGWhlYJPGl44OI/eWdXZMt8f3YrH+PMxZ2dVe1kPLKEz4hy7RJVaUV
 /Sf74Sm6YCGNiDsMK1aAfByCXqGbnFmK7N2qVhj6aO6zVcB3/40DSuiDY
 j0bhyNiZvfb6GNyuXzg0/8Jy2YASz4CP/vbHVM1OCuzoFa+mq+r1qFkmG
 GMz7eFomg9dWxy6H3wAR7D9fDcEGSCdlO7aHgv2oh42yvLQN+IO2Zj0Wz
 Imp61ywFxXSsD+c5U6hEsOxsI0aaDR6Bf9b6q+TQZ1XovdwkgPnehZuRk
 SfZuEa/tiO+Yrele9hmVHxU7mHAKyIo4YnLQh4UhH9wXwAg1vpxx/d1+L Q==;
X-CSE-ConnectionGUID: T0yrEJuYT464Mtk2Rk8LrQ==
X-CSE-MsgGUID: i9Wb/uHjTJSK1/cMEazszQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49457305"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49457305"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:34:07 -0700
X-CSE-ConnectionGUID: PxTHOtOATpKCzjhNd7y5Pw==
X-CSE-MsgGUID: 8MbyUVixT4qjr2OlXdjfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138540501"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.131])
 ([10.245.245.131])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:34:05 -0700
Message-ID: <703610a4db0324db05ece8e83fff864717c2e6c2.camel@linux.intel.com>
Subject: Sharing dma-bufs using a driver-private interconnect
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, DMA
 BUFFER SHARING FRAMEWORK <linaro-mm-sig@lists.linaro.org>
Date: Fri, 16 May 2025 10:33:49 +0200
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

I previously discussed this with Simona on IRC but would like to get
some feedback also from a wider audience:

We're planning to share dma-bufs using a fast interconnect in a way
similar to pcie-p2p:

The rough plan is to identify dma-bufs capable of sharing this way by
looking at the address of either the dma-buf ops and / or the
importer_ops to conclude it's a device using the same driver (or
possibly child driver) and then take special action when the dma-
addresses are obtained. Nothing visible outside of the xe driver or its
child driver.

Are there any absolute "DON'T"s or recommendations to keep in mind WRT
to this approach?

Thanks,
Thomas

