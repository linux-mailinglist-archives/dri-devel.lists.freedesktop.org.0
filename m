Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E3693ECD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 08:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BC610E041;
	Mon, 13 Feb 2023 07:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCF10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676272365; x=1707808365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oDApUliXcaJviTBYjIi5M5cuBczUHP+iwTF6Q32uhFk=;
 b=hHeHsC+nhrraboR161YvhnRvXXPl4oCpWWe4Ws9ZCRRFTyazc3bJr6kN
 WVF3L6WrM4b2SkFEEHXRkS0p4Jy3K2z6vgtvN4lgIteekADGu9hu3XMtO
 jFXi8fX8AquXHDAyo+5gf7Rg7HbcIVY9ygvVv5blGcpX+5ebrgz5XNoPe
 bckwZ8mVX1CFTSFtbJ8UyVsgyJDFV5KhVECxRW3Ft2/cWcF1WN0v5b4gu
 0S6t5mBMOATvxQHJTK1mByz86+49Rkfv1k9cDN7PewJQAdlcgE2YPh1km
 MDDOJfzj45Ksnk+sYQN5T45LTi+MG7hBwX10SowrT59PIlbQFb5IxYqV4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332134586"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="332134586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2023 23:12:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="997597947"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="997597947"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2023 23:12:43 -0800
Date: Mon, 13 Feb 2023 08:12:41 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] habanalabs: change unused extern decl of hdev to forward
 decl of hl_device
Message-ID: <20230213071241.GA2799422@linux.intel.com>
References: <20230208155450.1941608-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208155450.1941608-1-trix@redhat.com>
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
Cc: ndesaulniers@google.com, ogabbay@kernel.org, llvm@lists.linux.dev,
 kelbaz@habana.ai, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 08, 2023 at 07:54:50AM -0800, Tom Rix wrote:
> Building with clang W=2 has several similar warnings
> drivers/accel/habanalabs/common/decoder.c:46:51: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
> static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_id)
>                                                   ^
> drivers/accel/habanalabs/common/security.h:13:26: note: previous declaration is here
> extern struct hl_device *hdev;
>                          ^
> 
> There is no global definition of hdev, so the extern is not needed.
> Searched with
> grep -r '^struct' . | grep hl_dev
> 
> Change to an forward decl to resolve these issues
> drivers/accel/habanalabs/common/mmu/../security.h:133:40: error: ‘struct hl_device’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   133 |         bool (*skip_block_hook)(struct hl_device *hdev,
>       |                                        ^~~~~~~~~
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/accel/habanalabs/common/security.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/habanalabs/common/security.h b/drivers/accel/habanalabs/common/security.h
> index 234b4a6ed8bc..d7a3b3e82ea4 100644
> --- a/drivers/accel/habanalabs/common/security.h
> +++ b/drivers/accel/habanalabs/common/security.h
> @@ -10,7 +10,7 @@
>  
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  
> -extern struct hl_device *hdev;
> +struct hl_device;
>  
>  /* special blocks */
>  #define HL_MAX_NUM_OF_GLBL_ERR_CAUSE		10
> -- 
> 2.26.3
> 
