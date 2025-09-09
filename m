Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E431B5021D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F910E72B;
	Tue,  9 Sep 2025 16:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="U01HngvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C07810E72B;
 Tue,  9 Sep 2025 16:06:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cLpbt6d3pz9t4g;
 Tue,  9 Sep 2025 18:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757434010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZDb6aw1gvb0GoZXsKebnBnFU/Vl/fUY+1raYD/dUMU=;
 b=U01HngvYmx3U+Lwl/Ij1oB7SCM8ENac4kksA7PX158lwrvqw21vwGid7VZ1ZpLKSDSqXbJ
 +xD2fKA4uOhc/1/xBPOS1FjjTSTJ8iY1Ua5Mv4iHsPLqDviCU6+1zgJI3wf9TyqtcXiOOQ
 I2iSvAVr8PYVE+xtDqi3+7eCdc+4Jv2uFR7qEG63JHLk+ibAQOqcHR26N7vv2GLBSaxM+q
 mZAVMRpNRyiKPN0dHaWT1nYRDB3n6VwUSHLSBAi2Gc6iXfd0zblECSrpcXPLicJRHGTaDu
 jPrLcWQZgpNt3Q2wTxLkJGHZeOtI8i1Ue58XzMAKCwJNwj4ya+cBUJRvfURZQw==
Message-ID: <34f2f0d9-dd77-41f4-b0bc-83b591238708@mailbox.org>
Date: Tue, 9 Sep 2025 18:06:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/radeon: use dev_warn_once() in CS parsers
To: Alex Deucher <alexander.deucher@amd.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250902165332.2388864-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250902165332.2388864-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 75b019fc1885aeb03bc
X-MBO-RS-META: 5pp95nrefqpa7mimgbn79cq49wha1qqh
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

On 02.09.25 18:53, Alex Deucher wrote:
> Older GPUs did not support memory protection, so the kernel
> driver would validate the command submissions (CS) from userspace
> to avoid the GPU accessing any memory it shouldn't.
> 
> Change any error messages in that validatio to dev_warn_once() to
> avoid spamming the kernel log in the event of a bad CS.  If users
> see any of these messages they should report them to the user space
> component, which in most cases is mesa
> (https://gitlab.freedesktop.org/mesa/mesa/-/issues).

As discussed in the "evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource seems too big for the bo" thread, based on similar rationale, these should arguably rather use some (preferably non-once) dbg variant.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
