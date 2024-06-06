Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC18FDCBD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C017E10E838;
	Thu,  6 Jun 2024 02:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pv6dw9TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD5410E835;
 Thu,  6 Jun 2024 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717640957; x=1749176957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/ToONKJkLgqGq9WM76vgR1TVho0q35Tz3g1qjeIjvTo=;
 b=Pv6dw9THi7yM00umpRoGjbdZx+QJC/QlCFpROeCz8KbKYbhVCfKbcRFB
 erSs1rPmanJmOTE5ymDLdJssLjyzAxSq+0dMJivO63QIVyB9PVjCetqLn
 qp9Kpm3Rx/+bEuEoFgmi51GJWtqGu7LEtYaAyvvlZ4ioQXOlqPDyAxQif
 HM9xgg2VpqFBX1IQIRLOVzGhoPPbK3Ja3ajBTSkOdykesDWOI4ABzRLO3
 mmGiFD4gOtrMJg9N9cEgkGhxDTKVorqsULWFxqrni7KH1DWh9KPNwU9Ap
 6+GRMLcwJiIuPDz08B72W9mD6wzm1h7dTJwjh6P061D/jenklD+3K3hqR A==;
X-CSE-ConnectionGUID: 3TjUQPeKQ32c4iXXi2ZiOA==
X-CSE-MsgGUID: ET8iJaeEShu7MLxS6ncpUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14420522"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14420522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:29:17 -0700
X-CSE-ConnectionGUID: +9FLlhHeReCPLIfoea7QXA==
X-CSE-MsgGUID: ZVG0TJ5gRhqUfU6GRV24sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37714230"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.242])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:29:15 -0700
Date: Thu, 6 Jun 2024 04:29:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nirmoy.das@intel.com, janusz.krzysztofik@intel.com,
 chris.p.wilson@intel.com
Subject: Re: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
Message-ID: <ZmEe98jYMYRXT2mo@ashyti-mobl2.lan>
References: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
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

Hi Krzysztof,

On Mon, Jun 03, 2024 at 06:20:22PM +0200, Niemiec, Krzysztof wrote:
> The test is trying to push the heartbeat frequency to the limit, which
> might sometimes fail. Such a failure does not provide valuable
> information, because it does not indicate that there is something
> necessarily wrong with either the driver or the hardware.
> 
> Remove the test to prevent random, unnecessary failures from appearing
> in CI.
> 
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>

merged in drm-intel-gt-next.

Thank you,
Andi
