Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E179A80E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522AB10E2DD;
	Mon, 11 Sep 2023 12:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03D10E2DD;
 Mon, 11 Sep 2023 12:54:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A53F66072FF;
 Mon, 11 Sep 2023 13:54:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694436893;
 bh=QWkSHpR8K721vmmxMD9TK8wJGU+63NpvmGFeXTTOPwE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mv5OMi5bt25CT2ddPuDj0Qjzqz28kZwewSvh+7nGmlt12nSCSC7M+0IwbVIo7O/ko
 pUeBYcT2DPya/yx8Wkd2vJ7nRrNU/0DViz192vl5WaMTRa7VQZQ/x5juR+MnBQTGCR
 AkEFjvIE1eVjPaYYfZh2363kX8LaHYV72vZffDFXomG0poH4dw8n5TxevwH3TMPQ48
 7nOrULO3EBtXg0dCjYHpolp7bPZze8/oc2D5wKwYI9kazQXVMyCUXyTkQR6Fj5Ka5c
 uRTZAD6y4Vs8M1SQmEheoaflwHgJ9UHBpfK29UMsHmwm1PdFljpkLtDWt2WXqp6xhy
 TRs9t0c3GYk9w==
Date: Mon, 11 Sep 2023 14:54:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230911145450.54ad833c@collabora.com>
In-Reply-To: <20230909153125.30032-7-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
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

On Sat,  9 Sep 2023 17:31:13 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +/**
> + * get_next_vm_bo_from_list() - get the next vm_bo element
> + * @__gpuvm: The GPU VM
> + * @__list_name: The name of the list we're iterating on
> + * @__local_list: A pointer to the local list used to store already iterated items
> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
> + *
> + * This helper is here to provide lockless list iteration. Lockless as in, the
> + * iterator releases the lock immediately after picking the first element from
> + * the list, so list insertion deletion can happen concurrently.
> + *
> + * Elements popped from the original list are kept in a local list, so removal
> + * and is_empty checks can still happen while we're iterating the list.
> + */
> +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
> +	({										\
> +		struct drm_gpuvm_bo *__vm_bo;						\

Missing NULL assignment here.

> +											\
> +		drm_gpuvm_bo_put(__prev_vm_bo);						\
> +											\
> +		spin_lock(&(__gpuvm)->__list_name.lock);				\
> +		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
> +			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
> +						   struct drm_gpuvm_bo,			\
> +						   list.entry.__list_name);		\
> +			if (drm_gpuvm_bo_get_unless_zero(__vm_bo)) {			\
> +				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
> +					       __local_list);				\
> +				break;							\
> +			} else {							\
> +				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> +				__vm_bo = NULL;						\
> +			}								\
> +		}									\
> +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> +											\
> +		__vm_bo;								\
> +	})
> +
> +/**
> + * for_each_vm_bo_in_list() - internal vm_bo list iterator
> + *
> + * This helper is here to provide lockless list iteration. Lockless as in, the
> + * iterator releases the lock immediately after picking the first element from the
> + * list, so list insertion and deletion can happen concurrently.
> + *
> + * Typical use:
> + *
> + *	struct drm_gpuvm_bo *vm_bo;
> + *	LIST_HEAD(my_local_list);
> + *
> + *	ret = 0;
> + *	drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>, &my_local_list, vm_bo) {
> + *		ret = do_something_with_vm_bo(..., vm_bo);
> + *		if (ret)
> + *			break;
> + *	}
> + *	drm_gpuvm_bo_put(vm_bo);
> + *	drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);

Might be worth mentioning that the vm_bo pointer shouldn't be
re-assigned from inside for loop, otherwise
the next get_next_vm_bo_from_list() will be passed a wrong prev_vm_bo.

> + *
> + *
> + * Only used for internal list iterations, not meant to be exposed to the outside
> + * world.
> + */
> +#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
> +	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> +						__local_list, NULL);		\
> +	     __vm_bo;								\
> +	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> +						__local_list, __vm_bo))		\
