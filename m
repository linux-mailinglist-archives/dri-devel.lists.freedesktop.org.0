Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA379C9BE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B7C10E3B7;
	Tue, 12 Sep 2023 08:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951810E3B7;
 Tue, 12 Sep 2023 08:23:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4BB01660731E;
 Tue, 12 Sep 2023 09:23:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694506985;
 bh=hJlu8cCbMv/O6fttocRRz+Xv4UbHuUoBwwA7Be/4ExE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T7FVxw/YvKZ2FpGK9n9jh0CkWDsgBjSdHbnftuubDwU0jRfBuAHdg461mANHamQnp
 uYjriIfO9m+WHbV+LEWSL47Kes7TWvRB7Yq27B3YWwTonZ9PiKE+XJMSvwuz+k8rqJ
 prZP8veeJAJKXwmIOhvAwXPVpzoSHeEPdZFm+wCJb9COLJjNz+/fvKiF83N73nVC1+
 2tN26PzaZtXLZvuSxhrDdr0tp8uBaQlnNgpe4GwqWHC2wVZ82/Qm5ED+TwC2NLiI57
 zLzCmsPwI//GptFarIpodY3y2CYn/ep5aLLj2U+uNVI0q/WJlkp1tMgYTaWZrItlmo
 RT566juI5I0yg==
Date: Tue, 12 Sep 2023 10:23:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 06/13] drm/sched: Add generic scheduler message
 interface
Message-ID: <20230912102302.71d798a8@collabora.com>
In-Reply-To: <20230912021615.2086698-7-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-7-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023 19:16:08 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Add generic schedule message interface which sends messages to backend
> from the drm_gpu_scheduler main submission thread. The idea is some of
> these messages modify some state in drm_sched_entity which is also
> modified during submission. By scheduling these messages and submission
> in the same thread their is not race changing states in
> drm_sched_entity.
> 
> This interface will be used in Xe, new Intel GPU driver, to cleanup,
> suspend, resume, and change scheduling properties of a drm_sched_entity.
> 
> The interface is designed to be generic and extendable with only the
> backend understanding the messages.

I didn't follow the previous discussions closely enough, but it seemed
to me that the whole point of this 'ordered-wq for scheduler' approach
was so you could interleave your driver-specific work items in the
processing without changing the core. This messaging system looks like
something that could/should be entirely driver-specific to me, and I'm
not convinced this thin 'work -> generic_message_callback' layer is
worth it. You can simply have your own xe_msg_process work, and a
xe_msg_send helper that schedules this work. Assuming other drivers
need this messaging API, they'll probably have their own message ids
and payloads, and the automation done here is simple enough that it can
be duplicated. That's just my personal opinion, of course, and if
others see this message interface as valuable, I fine with it.
