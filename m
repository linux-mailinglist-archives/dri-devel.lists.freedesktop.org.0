Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA4836ADA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC610F60B;
	Mon, 22 Jan 2024 16:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355CB10F60B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705941261;
 bh=c4V5txd2EHb86kHaXl8cOH0USsUytAZM+rzDV9D9Sxg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nXcs53tkeD29nOKy+CDdKf0+KXXDERMg+b2h7aQkH2GFJHqpaH09lz3Pw81PVGVcE
 VF+dT10sTeinBt5EBm+n1WDfkiDkaSEWyBwW/2MLif/QlH75X/ZPnUscbaYrIZ7F39
 9XZCMETuAdDhCZNZSYiiyYf5bEWpryLJdHv0zvsl1tA/E+RpQpLMQYmW1tTn+9OnLV
 TnuD/3wIKq6Hu1ZLGxtfAoKKSeP9ROqd9714Vkc8MosxXV+JDocdBLejwKxhFPINtZ
 rVkz2a1qqYLe8T9zRlrWJh5pXtnCMAFRyqcc7R4FR4knpwoVkxr90grlxur/Ll1KPh
 W5xDkHM0cHotA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29FDC37813B5;
 Mon, 22 Jan 2024 16:34:21 +0000 (UTC)
Date: Mon, 22 Jan 2024 17:34:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chris Diamand <chris.diamand@foss.arm.com>
Subject: Re: [PATCH v3 08/14] drm/panthor: Add the FW logical block
Message-ID: <20240122173419.79abd4e3@collabora.com>
In-Reply-To: <62049a0e-1441-47a5-8369-8f05028d76ec@foss.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-9-boris.brezillon@collabora.com>
 <62049a0e-1441-47a5-8369-8f05028d76ec@foss.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 21:25:16 +0000
Chris Diamand <chris.diamand@foss.arm.com> wrote:

> > +void panthor_fw_unplug(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_section *section;
> > +
> > +	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
> > +
> > +	/* Make sure the IRQ handler can be called after that
> > point. */
> > +	if (ptdev->fw->irq.irq)
> > +		panthor_job_irq_suspend(&ptdev->fw->irq);
> > +
> > +	panthor_fw_stop(ptdev);
> > +
> > +	if (ptdev->fw->vm)
> > +		panthor_vm_idle(ptdev->fw->vm);
> > +
> > +	list_for_each_entry(section, &ptdev->fw->sections, node)
> > +		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev),
> > section->mem);  
> 
> Here's where we destroy the potentially invalid section->mem.
> 
> Note that the issues are twofold:
> Firstly, section->mem could be an error pointer as mentioned earlier.
> Secondly, panthor_kernel_bo_destroy() doesn't actually check for
> error values or even NULL.
> 
> It would probably be worth adding NULL checks to
> panthor_kernel_bo_destroy() and panthor_kernel_bo_vunmap() to protect
> against this. 

I ended up implementing your suggestion, because it simplifies all
call-sites in panthor_sched.c too. The new version defer the
IS_ERR_OR_NULL() check to panthor_kernel_bo_destroy().
