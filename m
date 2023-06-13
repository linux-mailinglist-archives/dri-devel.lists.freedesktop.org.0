Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21972DEB2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2023010E061;
	Tue, 13 Jun 2023 10:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09E10E061
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:05:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFC306606EFD;
 Tue, 13 Jun 2023 11:05:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686650747;
 bh=TaU7m7TQ6d0Y5qzbseRw1HGl8ia4x9LqEjWeGQ5uTk8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NI8rJrlwnk2+d7aE0Kb1VRa+ZvsVM+/LnriO5az3+PXIypuWYMtKoynmcEeM/PBnW
 M/RoK49D7g5fPQRjkAMhMO6rb/Rb1omk6SJN9L5jYdqr6AQ1jseobowVFb0urv25p0
 plhA/OIpFQx0/wN8Q/CDHkA5ODbwnTdq8Bj88eJanfydm2VuGGWThYZCy/DhD0dOMT
 cRqbsdsErmODr6KWPBZaqnphtTcxUxMl2mW6cWl26eZ3mshp7iRmTXedE9aJwHuck2
 7EHWuWr/N2niQ8wktdoQSqWBrfZaT87sFIk1mn4wSI1gjgI9go55R7uYPOTl4dr7tm
 52Vqb3GAUz7mA==
Date: Tue, 13 Jun 2023 12:05:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Message-ID: <20230613120543.089473d3@collabora.com>
In-Reply-To: <20230613092845.2166940-1-boris.brezillon@collabora.com>
References: <20230613092845.2166940-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 11:28:45 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> We also make sure we wait on drm_sched_fence::finished if we were asked
> to wait on drm_sched_fence::scheduled, but the intent was probably to
> delegate the wait to the GPU, but we want resources to be completely
> idle when killing jobs.

Uh, I need to rephrase that part:

"
We also make sure we wait on drm_sched_fence::finished if we were
originally asked to wait on drm_sched_fence::scheduled. In that case,
we assume the intent was to delegate the wait to the firmware/GPU or
rely on the pipelining done at the entity/scheduler level, but when
killing jobs, we really want to wait for completion not just scheduling.
"
