Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7117578EC61
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABB510E639;
	Thu, 31 Aug 2023 11:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Thu, 31 Aug 2023 11:43:27 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682A610E639;
 Thu, 31 Aug 2023 11:43:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A4DDB82164;
 Thu, 31 Aug 2023 11:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A80EC433C8;
 Thu, 31 Aug 2023 11:38:12 +0000 (UTC)
Message-ID: <f312fc14-13b0-43ea-3502-0ca4eef7aaca@xs4all.nl>
Date: Thu, 31 Aug 2023 13:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: cec: core: add note about *_from_edid()
 function usage in drm
Content-Language: en-US, nl
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <7cebfea8f999d2d0d49533f9849d109830c5d1b6.1692884619.git.jani.nikula@intel.com>
 <20230831105144.25923-1-jani.nikula@intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230831105144.25923-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/08/2023 12:51, Jani Nikula wrote:
> In the drm subsystem, the source physical address is, in most cases,
> available without having to parse the EDID again. Add notes about
> preferring to use the pre-parsed address instead.
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> 
> ---
> 
> v2: rephrase comments, in particular indicate cec_s_phys_addr() should
> be false (Hans)
> ---
>  drivers/media/cec/core/cec-adap.c     | 5 +++++
>  drivers/media/cec/core/cec-notifier.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
> index 241b1621b197..1109af525c35 100644
> --- a/drivers/media/cec/core/cec-adap.c
> +++ b/drivers/media/cec/core/cec-adap.c
> @@ -1688,6 +1688,11 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
>  }
>  EXPORT_SYMBOL_GPL(cec_s_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling (if possible):
> + *
> + * cec_s_phys_addr(adap, connector->display_info.source_physical_address, false);
> + */
>  void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
>  			       const struct edid *edid)
>  {
> diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
> index 389dc664b211..d600be0f7b67 100644
> --- a/drivers/media/cec/core/cec-notifier.c
> +++ b/drivers/media/cec/core/cec-notifier.c
> @@ -195,6 +195,11 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
>  }
>  EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr);
>  
> +/*
> + * Note: In the drm subsystem, prefer calling (if possible):
> + *
> + * cec_notifier_set_phys_addr(n, connector->display_info.source_physical_address);
> + */
>  void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
>  					  const struct edid *edid)
>  {

