Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C1387436
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1C16EAD4;
	Tue, 18 May 2021 08:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621516EAC2;
 Tue, 18 May 2021 08:41:49 +0000 (UTC)
IronPort-SDR: a6LigDQcntkbhFynoIzCenVW5T/MW9vK29sAt1kTX6bLcIQTzGWOrgS5/4Jq63XKyahCA8D3fU
 MQFzApq3wZaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="187786280"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="187786280"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:41:48 -0700
IronPort-SDR: 5WxAx+goKbshjG779q/WsomqGUkJGOI0Qv20rYeXYw5OSnnAYtUNKcwHQysx+uV1RnJtD4SFBS
 wAiL2Q0H7a1A==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="466311548"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:41:47 -0700
Subject: Re: [Intel-gfx] [PATCH v2 12/15] drm/i915: Disable mmap ioctl for
 gen12+
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-13-thomas.hellstrom@linux.intel.com>
Message-ID: <73279712-3997-9d2d-b5d4-d5371b58ab94@linux.intel.com>
Date: Tue, 18 May 2021 10:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518082701.997251-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/18/21 10:26 AM, Thomas Hellström wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> The paltform should exclusively use mmap_offset, one less path to worry
> about for discrete.
s/paltform/platform/
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Otherwise,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 8598a1c78a4c..65db290efd16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -56,10 +56,17 @@ int
>   i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
>   		    struct drm_file *file)
>   {
> +	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_mmap *args = data;
>   	struct drm_i915_gem_object *obj;
>   	unsigned long addr;
>   
> +	/* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
> +	 * covers all platforms with local memory.
> +	 */
> +	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
> +		return -EOPNOTSUPP;
> +
>   	if (args->flags & ~(I915_MMAP_WC))
>   		return -EINVAL;
>   
