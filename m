Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018E2FB30E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 08:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF3189123;
	Tue, 19 Jan 2021 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338989FCE;
 Tue, 19 Jan 2021 07:34:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56BDE2072D;
 Tue, 19 Jan 2021 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611041692;
 bh=IHictolKla5yDu5FZfUO1rh8bRpb2Cxn0PR9IXxBXwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pJKRUktF0pMQuMXzTCJGj7MDGmt/AtfrCiFcDtu5XCvqdrT91p/6j4CVfFcreyO9H
 7mFm5luE+1mPdszP4lE09aW/dhF6tvRNrp8g2mrMvhdHgbTCuYvUyIlILY+lfoi4jK
 wV47cLYq5Tw4FYaWLBZMtvLaxw7n7ImDGvXZh9tA=
Date: Tue, 19 Jan 2021 08:34:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v4 10/14] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
Message-ID: <YAaLmBMlDRr56erH@kroah.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 04:01:19PM -0500, Andrey Grodzovsky wrote:
>  static struct pci_driver amdgpu_kms_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1595,6 +1607,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>  	.shutdown = amdgpu_pci_shutdown,
>  	.driver.pm = &amdgpu_pm_ops,
>  	.err_handler = &amdgpu_pci_err_handler,
> +	.driver.dev_groups = amdgpu_sysfs_groups,

Shouldn't this just be:
	groups - amdgpu_sysfs_groups,

Why go to the "driver root" here?

Other than that tiny thing, looks good to me, nice cleanup!

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
