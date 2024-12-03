Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A571E9E1EE2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBFB10E468;
	Tue,  3 Dec 2024 14:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dOVmcCGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB2810E468;
 Tue,  3 Dec 2024 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1yX7kW1yFh1JJNHN6LooG+HaqWJKHFfFgo2ul1SKQpo=; b=dOVmcCGP2YffqRVBCmQHXYu6G+
 bqjHJmfMQE9cVhcyCRtXgL8kLxIRy2tqM0qN5+e7HOPz71dp2BPX+vqekhcl4gCQNXZ/53GbkocNq
 0rj57NC4X9JA8lAkUOFCOoKuV9Ho3B0H9IUhVAnJ9C8FUyynntaivfu8k99KVCScQiUq6jQlgdOmJ
 SPjwdqm6hFMMFt4ZScgHX4h9+TNFMVxTtzaRPwMb3zUr/K9B/tuiP0j6q6ampXtj6clNmRyCkGsjn
 bpyoTHEl61hluYt7760NcXAhij6UbAirEugAJs93r+kfDyCQIdbZIMzbmKWt7cm1xjH19lvKnZsVn
 cWT0gY+Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tITkN-00FpNA-FB; Tue, 03 Dec 2024 15:19:27 +0100
Message-ID: <304be585-2a2b-40b9-ab05-b1a46eec0111@igalia.com>
Date: Tue, 3 Dec 2024 14:19:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] Documentation/gpu: Clarify drm memory stats
 definition
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20241128185404.2672-1-Yunxiang.Li@amd.com>
 <20241128185404.2672-4-Yunxiang.Li@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241128185404.2672-4-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 28/11/2024 18:54, Yunxiang Li wrote:
> Define how to handle buffers with multiple possible placement so we
> don't get incompatible implementations. Callout the resident requirement
> for drm-purgeable- explicitly. Remove the confusing requirement for
> there to be only drm-memory- or only drm-resident-, and clarify that
> drm-memory- is legacy, amdgpu only behavior. Re-order the paragraphs to
> flow better as well.
> 
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> CC: dri-devel@lists.freedesktop.org
> ---
>   Documentation/gpu/drm-usage-stats.rst | 54 +++++++++++++--------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index ff964c707754a..19a5323d0e682 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -140,57 +140,57 @@ both.
>   Memory
>   ^^^^^^
>   
> -- drm-memory-<region>: <uint> [KiB|MiB]
> -
> -Each possible memory type which can be used to store buffer objects by the
> -GPU in question shall be given a stable and unique name to be returned as the
> -string here.
> +Each possible memory type which can be used to store buffer objects by the GPU
> +in question shall be given a stable and unique name to be used as the "<region>"
> +string.
>   
>   The region name "memory" is reserved to refer to normal system memory.
>   
> -Value shall reflect the amount of storage currently consumed by the buffer
> +The value shall reflect the amount of storage currently consumed by the buffer
>   objects belong to this client, in the respective memory region.
>   
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> -This key is deprecated and is an alias for drm-resident-<region>. Only one of
> -the two should be present in the output.
> -
> -- drm-shared-<region>: <uint> [KiB|MiB]
> +- drm-total-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are shared with another file (e.g., have more
> -than a single handle).
> +The total size of all requested buffers, including both shared and private
> +memory. The backing store for the buffers does not need to be currently
> +instantiated to count under this category. To avoid double-counting, if a buffer
> +has multiple regions where it can be allocated to, the implementation should
> +consistently select a single region for accounting purposes.
>   
> -- drm-total-<region>: <uint> [KiB|MiB]
> +- drm-shared-<region>: <uint> [KiB|MiB]
>   
> -The total size of all created buffers including shared and private memory. The
> -backing store for the buffers does not have to be currently instantiated to be
> -counted under this category.
> +The total size of buffers that are shared with another file (i.e., have more
> +than one handle). The same requirement to avoid double-counting that applies to
> +drm-total-<region> also applies here.
>   
>   - drm-resident-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are resident (have their backing store present or
> -instantiated) in the specified region.
> +The total size of buffers that are resident (i.e., have their backing store
> +present or instantiated) in the specified region.
> +
> +- drm-memory-<region>: <uint> [KiB|MiB]
>   
> -This is an alias for drm-memory-<region> and only one of the two should be
> -present in the output.
> +This key is deprecated and is only printed by amdgpu; it is an alias for
> +drm-resident-<region>.
>   
>   - drm-purgeable-<region>: <uint> [KiB|MiB]
>   
> -The total size of buffers that are purgeable.
> +The total size of buffers that are resident and purgeable.
>   
> -For example drivers which implement a form of 'madvise' like functionality can
> -here count buffers which have instantiated backing store, but have been marked
> -with an equivalent of MADV_DONTNEED.
> +For example, drivers that implement functionality similar to 'madvise' can count
> +buffers that have instantiated backing stores but have been marked with an
> +equivalent of MADV_DONTNEED.
>   
>   - drm-active-<region>: <uint> [KiB|MiB]
>   
>   The total size of buffers that are active on one or more engines.
>   
> -One practical example of this can be presence of unsignaled fences in an GEM
> -buffer reservation object. Therefore the active category is a subset of
> -resident.
> +One practical example of this could be the presence of unsignaled fences in a
> +GEM buffer reservation object. Therefore, the active category is a subset of the
> +resident category.
>   
>   Implementation Details
>   ======================

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

