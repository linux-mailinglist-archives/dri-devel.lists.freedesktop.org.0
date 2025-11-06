Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBBC39648
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 08:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3578910E2FB;
	Thu,  6 Nov 2025 07:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="YYtAtcrR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a20eB2rW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Thu, 06 Nov 2025 07:25:07 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7862D10E2FB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 07:25:07 +0000 (UTC)
Date: Thu, 6 Nov 2025 08:16:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1762413376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=79qqpFdoph7V4G7CFQzW8+xT0niEy4TMYytCNaNsGsM=;
 b=YYtAtcrRbpgVNIyRfx0wH+ZfYtP/1Eg5PlZJiCUXmlsZPm3P6+W5i0Jg0LfntMgFJFyVFL
 fpSa3HVwf8PYsv4tvxbWyGAK80t35PcMct9Tj8mFvZuGFSWcR6HAXDy3ZDsf6hdi/fjmpL
 O4MPuo4/kCl8W278RCrtVB+ebqca1AyOtyOavkKv1xKe5V2uYMPe23rZGa6hAJm8swqlx7
 oS+jDWS25nm5Rt1WgpUqhX3hLRT9oTVZFPkIzrJCFhZRdiuYoqaOe5M4Xsa6h6R7Nmy/JV
 AgFWV9zWmLHPuf0fc5EASjfZpBBy0NiE8O6uNZcw5opFYejs/R/Mw89Kme0KdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1762413376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=79qqpFdoph7V4G7CFQzW8+xT0niEy4TMYytCNaNsGsM=;
 b=a20eB2rWBroHtc34xLKgCn9pZW7B9MmUoNBiQzbWqhdhHTUlVK0yT+Q6AozJQ4zJLISNhR
 +Ww8NKnm0RSwSfAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 clrkwllms@kernel.org, rostedt@goodmis.org,
 daniele.ceraolospurio@intel.com, alexander.usyskin@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 baoli.zhang@intel.com
Subject: Re: [PATCH] drm/me/gsc: mei interrupt top half should be in irq
 disabled context
Message-ID: <20251106071613.xi1ETeFG@linutronix.de>
References: <20251107033152.834960-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107033152.834960-1-junxiao.chang@intel.com>
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

On 2025-11-07 11:31:52 [+0800], Junxiao Chang wrote:
> MEI GSC interrupt comes from i915 or xe driver. It has top half and
> bottom half. Top half is called from i915/xe interrupt handler. It
> should be in irq disabled context.
> 
> With RT kernel(PREEMPT_RT enabled), by default IRQ handler is in
> threaded IRQ. MEI GSC top half might be in threaded IRQ context.
> generic_handle_irq_safe API could be called from either IRQ or
> process context, it disables local IRQ then calls MEI GSC interrupt
> top half.
> 
> This change fixes B580 GPU boot issue with RT enabled.
> 
> Fixes: e02cea83d32d ("drm/xe/gsc: add Battlemage support")
> Tested-by: Baoli Zhang <baoli.zhang@intel.com>
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>

Sounds reasonable.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

What about intel_lpe_audio_irq_handler() ?

Sebastian
