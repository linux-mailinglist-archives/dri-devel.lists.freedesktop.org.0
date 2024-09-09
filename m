Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A8971D07
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248E510E4C8;
	Mon,  9 Sep 2024 14:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dUHfu+lC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184B10E4C8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725893259;
 bh=86YmI8eS7ZXhoFCGeoVbcW6twOctOHwcrCr+fmazIj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dUHfu+lCIOeME3q2xHDiWiRDXYzIkTbUKnBcDRTYLZ0gaccR7NAA2lbC230voAcpg
 Y/olV1MY2HNPRnhWZ1mvCiyhAPy05VRA/wy673rVly+ku9VV2k9RjrAwVC16IWlaX/
 SHJmhuWbIXNjlB8qXLBp6AiVpl/n/KO+jruHsqtEnw0r+xegce3lCukJBqWw5Mvc4j
 3zeJKbf2pWToyfyjYuLI9DeuILX2KdKqnNBQlK9BNUAqY+ngZRqj8lA1h0N1/BlKZk
 cWvoN+e6JYsrP/0RinmLVuXRezKrL5X+0BpLBTEH/fMHUL0kxYw9/QNpPBt7A8E54s
 avW5k8C2r6tiw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DD6DA17E14E5;
 Mon,  9 Sep 2024 16:47:38 +0200 (CEST)
Date: Mon, 9 Sep 2024 16:47:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>
Subject: Re: [PATCH v2] drm/panthor: Display FW version information
Message-ID: <20240909164734.2a1fce4d@collabora.com>
In-Reply-To: <3b5f4413-fe7d-413d-8c24-870f0456b2d6@suse.de>
References: <20240906094025.638173-1-steven.price@arm.com>
 <3b5f4413-fe7d-413d-8c24-870f0456b2d6@suse.de>
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

Hi Thomas,

On Mon, 9 Sep 2024 16:14:32 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 06.09.24 um 11:40 schrieb Steven Price:
> > The version number output when loading the firmware is actually the
> > interface version not the version of the firmware itself. Update the
> > message to make this clearer.
> >
> > However, the firmware binary has a git SHA embedded into it which can be
> > used to identify which firmware binary is being loaded. So output this
> > as a drm_info() so that it's obvious from a dmesg log which firmware
> > binary is being used.
> >
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> > v2:
> >   * Fix indentation
> >   * Also update the FW interface message to include "using interface" to
> >     make it clear it's not the FW version
> >   * Add Reviewed-bys
> >
> >   drivers/gpu/drm/panthor/panthor_fw.c | 57 +++++++++++++++++++++++++++-
> >   1 file changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 857f3f11258a..aea5dd9a4969 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
> >   
> >   	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
> >   	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
> > +
> > +	/**
> > +	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
> > +	 * the FW binary was built.
> > +	 */
> > +	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
> >   };
> >   
> >   #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
> > @@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
> >   	} data;
> >   };
> >   
> > +struct panthor_fw_build_info_hdr {
> > +	/** @meta_start: Offset of the build info data in the FW binary */
> > +	u32 meta_start;
> > +	/** @meta_size: Size of the build info data in the FW binary */
> > +	u32 meta_size;
> > +};
> > +
> >   /**
> >    * struct panthor_fw_binary_iter - Firmware binary iterator
> >    *
> > @@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >   	return 0;
> >   }
> >   
> > +static int panthor_fw_read_build_info(struct panthor_device *ptdev,
> > +				      const struct firmware *fw,
> > +				      struct panthor_fw_binary_iter *iter,
> > +				      u32 ehdr)
> > +{
> > +	struct panthor_fw_build_info_hdr hdr;
> > +	char header[9];
> > +	const char git_sha_header[sizeof(header)] = "git_sha: ";
> > +	int ret;
> > +
> > +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hdr.meta_start > fw->size ||
> > +	    hdr.meta_start + hdr.meta_size > fw->size) {
> > +		drm_err(&ptdev->base, "Firmware build info corrupt\n");
> > +		/* We don't need the build info, so continue */
> > +		return 0;
> > +	}
> > +
> > +	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
> > +		   sizeof(git_sha_header))) {
> > +		/* Not the expected header, this isn't metadata we understand */
> > +		return 0;
> > +	}
> > +
> > +	/* Check that the git SHA is NULL terminated as expected */
> > +	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
> > +		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
> > +		/* Don't treat as fatal */
> > +		return 0;
> > +	}
> > +
> > +	drm_info(&ptdev->base, "Firmware git sha: %s\n",
> > +		 fw->data + hdr.meta_start + sizeof(git_sha_header));  
> 
> Please consider making this debugging-only information. Printing takes 
> time and the information is not essential unless for debugging.

Sounds like someone working on boot time optimization :-). More
seriously, I don't mind downgrading those to debug messages, as long as
we have the same information exposed through sysfs or DEV_QUERY, but
I'd prefer doing that in a follow-up patch that takes care of all
drm_info()s we have in panthor rather than addressing the two messages
we're modifying in this patch.

Regards,

Boris
