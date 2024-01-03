Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A939822CFA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 13:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F0310E10A;
	Wed,  3 Jan 2024 12:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B498D10E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704284749; x=1735820749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7NZPFuLqIaZYxF8kzjwORU+cPOyFb8rBNMttLqHxoyI=;
 b=UDMfLmqrSvJ7f4Xfhg+a6pdId2N+iIJ76n+VkfdQVd2LdvWHWTNLpXu1
 Z+T08AoSiE7mwNTeznB4hWiJpfBCFn4aHGbPV0iWLX1iWwg2aF6vbegFu
 VG2GP2BQRYCkc7IMp2N+7V9NO9bGAllSK7tRDxn5McW1wdcewW7N/pW+/
 WIEZvyxkwTGvDuVuetvklHiAkBUx7dNLwehTFs18429srWHdL+XWLQeul
 joSWkPZwcUxeowXu9jpLdziPJLeOwv3YNVlvUsrNMTOdMX5Z42jXR7t1K
 HEj55mVknwVEg9em94cqojKy7POQrnPqakvSdKe3xpdsp8VUlSPxpceCR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4085313"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4085313"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 04:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783498077"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="783498077"
Received: from sharadav-mobl.amr.corp.intel.com (HELO box.shutemov.name)
 ([10.249.36.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 04:25:42 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id C10E610A567; Wed,  3 Jan 2024 15:25:39 +0300 (+03)
Date: Wed, 3 Jan 2024 15:25:39 +0300
From: kirill.shutemov@linux.intel.com
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v4 6/6] x86/vmware: Add TDX hypercall support
Message-ID: <20240103122539.agoq7647bzwcgjep@box.shutemov.name>
References: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
 <20231228192421.29894-7-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228192421.29894-7-alexey.makhalov@broadcom.com>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 28, 2023 at 11:24:21AM -0800, Alexey Makhalov wrote:
> From: Alexey Makhalov <amakhalov@vmware.com>
> 
> VMware hypercalls use I/O port, VMCALL or VMMCALL instructions.
> Add __tdx_hypercall path to support TDX guests.
> 
> No change in high bandwidth hypercalls, as only low bandwidth
> ones are supported for TDX guests.
> 
> Co-developed-by: Tim Merrifield <timothym@vmware.com>
> Signed-off-by: Tim Merrifield <timothym@vmware.com>
> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
> Reviewed-by: Nadav Amit <namit@vmware.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
