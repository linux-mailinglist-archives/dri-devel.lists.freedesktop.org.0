Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399EFC33006
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 22:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1383210E66F;
	Tue,  4 Nov 2025 21:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IM3C3BM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6CD10E66D;
 Tue,  4 Nov 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762290258;
 bh=jHJJEDj6BO0fP/Mwehbp6jy3ucHT04YXepZlTsL/jg4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IM3C3BM4h1RdRF2S/RA7qjXrVEluuGAPQILPtVFRaQ1c676PJ5KTbygpyt1gs8Sw1
 si9TO+Mi3QKC1xKtXN2yFT3FK20vz5OYUuqEBBWl8WUgQ7niEQaPaZi4bvRWHwJbVy
 f+RXuvvX3Ypc0V0vA0sNmxFB2Fkk5N5laKZc2DoNqPKcTvKB1QY5n8CKmm7md5I63Q
 1h5sgMui6+wu0+bo037vrISfVSZtI9f0//BjasLDEf8AI2WTMUYy4W/lL1VDl85Jv7
 TZo2z7qknf9h5j4t6nmSZG6AYrOFaqme0x3gtW3NPJEWiVIiS+gIKQUSIjWJ6DneA8
 bmf26JEWLzNQQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AF52317E129C;
 Tue,  4 Nov 2025 22:04:17 +0100 (CET)
Date: Tue, 4 Nov 2025 22:04:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/3] tests/panthor: add panthor tests
Message-ID: <20251104220412.24b4b454@fedora>
In-Reply-To: <20251104202845.2879460-4-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
 <20251104202845.2879460-4-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Tue,  4 Nov 2025 17:28:43 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> +igt_main {
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_PANTHOR);
> +	}
> +
> +	igt_describe("Create and destroy a CSF group.");
> +	igt_subtest("group_create") {
> +		struct drm_panthor_vm_create vm_create = {};
> +		struct drm_panthor_vm_destroy vm_destroy = {};
> +		uint32_t group_handle;
> +
> +		vm_create.flags = 0;
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
> +		igt_assert_neq(vm_create.id, 0);
> +
> +		group_handle = igt_panthor_group_create_simple(fd, vm_create.id, 0);
> +		igt_assert_neq(group_handle, 0);
> +
> +		igt_panthor_group_destroy(fd, group_handle, 0);
> +
> +		vm_destroy = (struct drm_panthor_vm_destroy) { .id = vm_create.id };
> +		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
> +	}
> +
> +	igt_describe("Submit a job to a group and wait for completion. "
> +				 "The job writes a known value to a buffer object that is then "
> +				 "mmaped and checked.");

nit: indentation is off ^

	igt_describe("Submit a job to a group and wait for completion. "
		     "The job writes a known value to a buffer object that is then "
		     "mmaped and checked.");
