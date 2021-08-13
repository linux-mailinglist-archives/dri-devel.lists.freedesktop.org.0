Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932BC3EBB44
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 19:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805B16E8B2;
	Fri, 13 Aug 2021 17:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D86E8B2;
 Fri, 13 Aug 2021 17:19:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10075"; a="215325875"
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="215325875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 10:19:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,319,1620716400"; d="scan'208";a="639860653"
Received: from amadatha-mobl.amr.corp.intel.com (HELO
 skuppusw-mobl5.amr.corp.intel.com) ([10.212.72.8])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 10:19:51 -0700
Subject: Re: [PATCH v2 02/12] mm: Introduce a function to check for
 virtualization protection features
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Andi Kleen <ak@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Joerg Roedel <jroedel@suse.de>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <482fe51f1671c1cd081039801b03db7ec0036332.1628873970.git.thomas.lendacky@amd.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <d8448241-86f3-c582-87fd-5a0cab95a32f@linux.intel.com>
Date: Fri, 13 Aug 2021 10:19:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <482fe51f1671c1cd081039801b03db7ec0036332.1628873970.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 8/13/21 9:59 AM, Tom Lendacky wrote:
> In prep for other protected virtualization technologies, introduce a
> generic helper function, prot_guest_has(), that can be used to check
> for specific protection attributes, like memory encryption. This is
> intended to eliminate having to add multiple technology-specific checks
> to the code (e.g. if (sev_active() || tdx_active())).
> 
> Reviewed-by: Joerg Roedel<jroedel@suse.de>
> Co-developed-by: Andi Kleen<ak@linux.intel.com>
> Signed-off-by: Andi Kleen<ak@linux.intel.com>
> Co-developed-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Tom Lendacky<thomas.lendacky@amd.com>
> ---
>   arch/Kconfig                    |  3 +++
>   include/linux/protected_guest.h | 35 +++++++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100644 include/linux/protected_guest.h

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
