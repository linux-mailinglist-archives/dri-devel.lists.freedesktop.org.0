Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD37AB17D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 13:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4775D10E65B;
	Fri, 22 Sep 2023 11:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2305E10E65B;
 Fri, 22 Sep 2023 11:58:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6520B6607298;
 Fri, 22 Sep 2023 12:58:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695383924;
 bh=m/nPO3u2dtkBOwJtWh5MiRmfd1HuFw6fSZbWZsf3Wv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JiYUUHY31kwZsSWTaJSvOhWIjm7sm1VXUhtIKi9S5m+lKJPDFPoo4LhF9Lc/4BJqG
 fI8T9NF+owxbdmgbZYsUDGNY5Y5jCJHYc4LkEHok5cLTtvNw1ZGaobR8ttPdneOZcr
 LqFJnTm6DY2q+Jp82tEVIU/Ex7Tzhv3mDDWvA/8GzhtiDskyIOxQ5Z+uqnbJhb1TLe
 kM8tURuEBXloVJis/5hpZTGoF2rpKJdiXMF9LEXhnfIeEbhTFZipFG3brEk52/+01S
 1ukjKdPXTWPAUqamteWN7+ikfwVfdcQqCBWzoA/tOyzsqrUprYATWizD3gwzriQAwU
 xLvVDQEV3uPUg==
Date: Fri, 22 Sep 2023 13:58:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v4 6/8] drm/gpuvm: add drm_gpuvm_flags to
 drm_gpuvm
Message-ID: <20230922135842.242c865d@collabora.com>
In-Reply-To: <20230920144343.64830-7-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-7-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 16:42:39 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +/**
> + * enum drm_gpuvm_flags - flags for struct drm_gpuvm
> + */
> +enum drm_gpuvm_flags {
> +	/**
> +	 * @DRM_GPUVM_USERBITS: user defined bits
> +	 */
> +	DRM_GPUVM_USERBITS = (1 << 0),

Nit: I tried declaring driver-specific flags, and I find this
counter-intuitive. You basically end up with something like:

enum my_gpuvm_flags {
	MY_FLAG_X = DRM_GPUVM_USERBITS,
	MY_FLAG_Y = DRM_GPUVM_USERBITS << 1,
};

instead of the usual

enum my_gpuvm_flags {
	MY_FLAG_X = BIT(0),
	MY_FLAG_Y = BIT(1),
};

pattern.

Another issue I see coming is if we end up adding more core flags and
drivers start falling short of bits for their own flags. This makes me
wonder if we shouldn't kill this notion of USER flags and let drivers
store their flags in some dedicated field, given they're likely to
derive drm_gpuvm and drm_gpuva with their own object anyway.

> +};
> +

