Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0185A6AD28
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7510E00A;
	Thu, 20 Mar 2025 18:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IFkeOyZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEA310E00A;
 Thu, 20 Mar 2025 18:34:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15D2661141;
 Thu, 20 Mar 2025 18:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0F5C4CEDD;
 Thu, 20 Mar 2025 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742495653;
 bh=258SN3tnG0aO7oEktnduarjF2vuuyuDcUBkU6K9aY4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IFkeOyZRMrjmWGJt31X53gVDLJnLp9tD3tgwBLpgjxlsZ0aWCjGRfb2bBHtfTMrbg
 x4NKlg078GfI/W4x48m8uo6DVhZbfn3PNhjC100AsTcNA1OCvBtZgjcYWKr5qR3S2H
 KdfT47Qn8KwqGhZDoOi7+VsDnzVZgVfLH5HfesIVBqNrEnAbmDZcCe48qFBO5iTMg8
 +QrjXfRWNBTO0sL7VPfjh2UxUuzmF4pd/Wzr3pevY49MXt++W+oCLcx++Ubx/tpwGs
 yhi40pAP5GnLtkl5UKNzCmlxo8464rWCe/2XCbyUupkjEMtFHnwLOooIXg+fdW+WvB
 93wipIia4TVTA==
Date: Thu, 20 Mar 2025 19:34:09 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Mel Henning <mhenning@darkrefraction.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
Message-ID: <Z9xfoS89yimS1Sb3@pollux>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312213746.228042-3-mhenning@darkrefraction.com>
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

On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h

Same here, please split the uAPI change in a separate commit.

> index 33361784eb4e..e9638f4dd7e6 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
>  	__u32 ctxsw_align;
>  };
>  
> +struct drm_nouveau_set_zcull_ctxsw_buffer {
> +	/**
> +	 * @ptr: The virtual address for the buffer, or null to bind nothing
> +	 */
> +	__u64 addr;

What is this buffer? Is this a GEM object backed buffer? How is it mapped?

> +
> +	/**
> +	 * @channel: the channel to set the buffer on
> +	 */
> +	__u32 channel;
> +
> +	__u32 pad;
> +};
> +
>  #define DRM_NOUVEAU_GETPARAM           0x00
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> @@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
>  #define DRM_NOUVEAU_VM_BIND            0x11
>  #define DRM_NOUVEAU_EXEC               0x12
>  #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> +#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
>  #define DRM_NOUVEAU_GEM_NEW            0x40
>  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> @@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
>  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>  
>  #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> +#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcull_ctxsw_buffer)
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.48.1
> 
