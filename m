Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD5AE35BE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2449F10E187;
	Mon, 23 Jun 2025 06:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PBv92Wd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8AF10E187
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750660366;
 bh=dC4Y1JROZqC0jmEFRK9e9nDI3k8YVRO7dtqsZIcg6S0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBv92Wd9cN1QMJ+XIZgBBMGZFgHQKBfICm4uVlD18MqeZAQusqe/tZIQOSk2o4Z2H
 qD+aIjK+h9wC9Y641ZUri+CR9FaMaOE/X4zupzQ7OKH2dB3JBT863wJqPrkipbYMkC
 gpDtjoHE0y3Bha3lkg3zyIlmmkj1lQ1voXbx0X1E2/59fr3njdBYGN9n5J5DAORikO
 o5HH9G5PvwtPbqep0uYYpZSUNvMvqAegEQxWFy8Z67oVjKOFeu3jGLlO2kxaOA9Y6l
 5UuPFNjQGuAMQdyMyxH2oohG9EX1lf8ikDJ3OBi+RyIapMjHHTzYVTzbZ/7e9nrcXV
 s6QrpnG20xOHg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C6FFA17E0CF9;
 Mon, 23 Jun 2025 08:32:45 +0200 (CEST)
Date: Mon, 23 Jun 2025 08:32:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: always set fence errors on CS_FAULT
Message-ID: <20250623083241.02127feb@fedora>
In-Reply-To: <20250618145550.1901618-1-olvaffe@gmail.com>
References: <20250618145550.1901618-1-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Wed, 18 Jun 2025 07:55:49 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> It is unclear why fence errors were set only for CS_INHERIT_FAULT.
> Downstream driver also does not treat CS_INHERIT_FAULT specially.
> Remove the check.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a2248f692a030..1a3b1c49f7d7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1399,7 +1399,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  	fault = cs_iface->output->fault;
>  	info = cs_iface->output->fault_info;
>  
> -	if (queue && CS_EXCEPTION_TYPE(fault) == DRM_PANTHOR_EXCEPTION_CS_INHERIT_FAULT) {
> +	if (queue) {
>  		u64 cs_extract = queue->iface.output->extract;
>  		struct panthor_job *job;
>  

Now that I look at the code, I think we should record the error when
the ERROR_BARRIER is executed instead of flagging all in-flight jobs as
faulty. One option would be to re-use the profiling buffer by adding an
error field to panthor_job_profiling_data, but we're going to lose 4
bytes per slot because of the 64-bit alignment we want for timestamps,
so maybe just create a separate buffers with N entries of:

struct panthor_job_status {
   u32 error;
};
