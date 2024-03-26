Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B988C053
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63D10E6B9;
	Tue, 26 Mar 2024 11:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e7tfz2O+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F423310E6B9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711451643;
 bh=R0b/8Uy1RArsWu4+uJVVY6vHXo5OsHylHjMLHhF0FpY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e7tfz2O+SJp2aIrDSCiAjBljcu643CBYLD/YIQXdBbENTDzynetU7iSudo1ZW3ppp
 42AYq7guZHRY8d3cg9t3p4OrxJ+mA+gStYTzjUfin1S4Fu4wqzuVu49v3+sV+IllIm
 HELpNkUKljCWOfDCYIaymlwSlCCFxostkaat4IzrJ8DionVtR3A+J42BruaRaaRHBP
 jlEEn17LCuglBmzE3nABWFphqIO19diMjKNU2zeznctr8QbfZlJ7O9LEJybWjERNuS
 H4eRJz715ImiItUy8DOGLXVWg/VioKymBSGBMbPoZoB54aUXhzv0PRqXGvt7Sv63o8
 rZelEuYY241XA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 21107378110A;
 Tue, 26 Mar 2024 11:14:03 +0000 (UTC)
Date: Tue, 26 Mar 2024 12:14:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/3] drm/panthor: Drop the dev_enter/exit() sections
 in _irq_suspend/resume()
Message-ID: <20240326121401.3748a1ea@collabora.com>
In-Reply-To: <20240326111205.510019-3-boris.brezillon@collabora.com>
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
 <20240326111205.510019-3-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue, 26 Mar 2024 12:12:05 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> There's no reason for _irq_suspend/resume() to be called after the
> device has been unplugged, and keeping this dev_enter/exit()
> section in _irq_suspend() is turns _irq_suspend() into a NOP

                            ^ s/is turns/turns/

> when called from the _unplug() functions, which we don't want.
