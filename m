Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80B61710D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 23:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89710E4AA;
	Wed,  2 Nov 2022 22:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09E510E4AA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=dxk7K79E1a8j7qASi8UQ2LttUIuZKzMJZffkVtXcjv8=; b=iWBbbhrEXXa6MQNABq2X7pMhEs
 inJT+scZCXfLnDU7VWcfXsxYgqGktw8wWcIxHvwAJb+JpXzA1z5KOgv62IBCqoVvt6knYk6QIgZtV
 0kq+sCGrFenv7jgBUkHfptnS9NjeIQbaNxLBe6qPukDj9fAnHLGTZrJo65sGYORxLFPqxmtC2nFOL
 j4UODS7DwOVJa3BM8exn1O5tJGX8kXfibP7pJ4xiqsECVEtF1rprd8b77mUyCUrCAmRKfTOI3znQT
 BOVq009EEtWksI3G95Dbcf9iYjnp8sYZXSumod9w+gA+QJRi7Nla/ze0WnfU9ysXljPJ8jJ0uepat
 TNn2gSOA==;
Received: from [2601:1c2:d80:3110:e65e:37ff:febd:ee53]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oqMga-00EpZH-1q; Wed, 02 Nov 2022 22:58:16 +0000
Message-ID: <e526752f-94e4-335b-6164-ed7597b75a53@infradead.org>
Date: Wed, 2 Nov 2022 15:58:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20221102203405.1797491-2-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jiho Chu <jiho.chu@samsung.com>,
 Christoph Hellwig <hch@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/2/22 13:34, Oded Gabbay wrote:
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> new file mode 100644
> index 000000000000..282ea24f90c5
> --- /dev/null
> +++ b/drivers/accel/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Compute Acceleration device configuration
> +#
> +# This framework provides support for compute acceleration devices, such
> +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> +# devices
> +#
> +menuconfig ACCEL
> +	tristate "Compute Acceleration Framework"
> +	depends on DRM
> +	help
> +	  Framework for device drivers of compute acceleration devices, such
> +	  as, but not limited to, Machine-Learning and Deep-Learning
> +	  acceleration devices.
> +	  If you say Y here, you need to select the module that's right for
> +	  your acceleration device from the list below.
> +	  This framework is integrated with the DRM subsystem as compute
> +	  accelerators and GPUs share a lot in common and can use almost the
> +	  same infrastructure code.
> +	  Having said that, acceleration devices will have a different
> +	  major number than GPUs, and will be exposed to user-space using
> +	  different device files, called accel/accel* (in /dev, sysfs
> +	  and debugfs)

Please add a period at the end of the help text.

+	  and debugfs).

-- 
~Randy
