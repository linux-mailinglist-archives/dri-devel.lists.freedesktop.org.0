Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42F96E01F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 18:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ABB10E90B;
	Thu,  5 Sep 2024 16:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kbLqCWMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673410E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725554732;
 bh=QY3wFgrV/kGugxE9YefKYfgrpK+DXPu00p3NCqHiFD0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kbLqCWMCBXmjir9fSZ+HiCLE7Nu6iPyKOQH9YIt1y4PKFaRrSkV7rAMhdNy/Owjt8
 5ZaHoq3rlC2X+y+v2n1YoNdSwe5EtBpfiw0ZBWf/bopRU3LpfEbwc0n3U9HI/Xmlf4
 Rloqr09eAqEqDXBa/xYvRBoKBgUqO05DdGHIw7htJgYYrPhs+bqDX2AtxxitQ1eYyC
 2QfE9wP3eQVbcqKNWT++rUpOmE1w9o8eNe8G67BcwFEyGdDtLqkvlBLIclLu/HQRiQ
 YyoG+Y3xy3NryCGfYQEnCtBaPDWfiiKgkiRMMBW3f9K8qWQNGZfkKGNy7RT84bNUve
 0KaJYxteT89Vw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE17417E1582;
 Thu,  5 Sep 2024 18:45:32 +0200 (CEST)
Date: Thu, 5 Sep 2024 18:45:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>
Subject: Re: [PATCH] drm/panthor: Display FW version information
Message-ID: <20240905184528.2e9219ce@collabora.com>
In-Reply-To: <20240905155144.75416-1-steven.price@arm.com>
References: <20240905155144.75416-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu,  5 Sep 2024 16:51:44 +0100
Steven Price <steven.price@arm.com> wrote:

> The firmware binary has a git SHA embedded into it which can be used to
> identify which firmware binary is being loaded. Output this as a
> drm_info() so that it's obvious from a dmesg log which firmware binary
> is being used.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Just one formatting issue mentioned below, looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 55 ++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 857f3f11258a..ef007287575c 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
>  
>  	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
>  	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
> +
> +	/**
> +	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
> +	 * the FW binary was built.
> +	 */
> +	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
>  };
>  
>  #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
> @@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
>  	} data;
>  };
>  
> +struct panthor_fw_build_info_hdr {
> +	/** @meta_start: Offset of the build info data in the FW binary */
> +	u32 meta_start;
> +	/** @meta_size: Size of the build info data in the FW binary */
> +	u32 meta_size;
> +};
> +
>  /**
>   * struct panthor_fw_binary_iter - Firmware binary iterator
>   *
> @@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  	return 0;
>  }
>  
> +static int panthor_fw_read_build_info(struct panthor_device *ptdev,
> +				      const struct firmware *fw,
> +				      struct panthor_fw_binary_iter *iter,
> +				      u32 ehdr)
> +{
> +	struct panthor_fw_build_info_hdr hdr;
> +	char header[9];
> +	const char git_sha_header[sizeof(header)] = "git_sha: ";
> +	int ret;
> +
> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> +	if (ret)
> +		return ret;
> +
> +	if (hdr.meta_start > fw->size ||
> +	    hdr.meta_start + hdr.meta_size > fw->size) {
> +		drm_err(&ptdev->base, "Firmware build info corrupt\n");
> +		/* We don't need the build info, so continue */
> +		return 0;
> +	}
> +
> +	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
> +	    sizeof(git_sha_header))) {

Indentation seems broken here:

	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
		   sizeof(git_sha_header))) {

> +		/* Not the expected header, this isn't metadata we understand */
> +		return 0;
> +	}
> +
> +	/* Check that the git SHA is NULL terminated as expected */
> +	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
> +		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
> +		/* Don't treat as fatal */
> +		return 0;
> +	}
> +
> +	drm_info(&ptdev->base, "Firmware git sha: %s\n",
> +		 fw->data + hdr.meta_start + sizeof(git_sha_header));

Maybe we should also change the "FW vX.Y.Z" message into "FW interface
vX.Y.Z" to clarify things.

> +
> +	return 0;
> +}
> +
>  static void
>  panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>  {
> @@ -672,6 +725,8 @@ static int panthor_fw_load_entry(struct panthor_device *ptdev,
>  	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
>  	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
>  		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
> +	case CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA:
> +		return panthor_fw_read_build_info(ptdev, fw, &eiter, ehdr);
>  
>  	/* FIXME: handle those entry types? */
>  	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:

