Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDDF7FADAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 23:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1219710E406;
	Mon, 27 Nov 2023 22:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id C3DC310E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 18:56:11 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1159)
 id 53F8420B74C0; Mon, 27 Nov 2023 10:56:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 53F8420B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1701111371;
 bh=/hQV5oGRHVOsT1nJ+jnSk+rrXxrko5nL2UHAuGG2QCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNOLUNPbtyk/nFCpL8Y07q99MKH2at5Tda3uA4ZrWS7mg07hZEVN+3BqcV+yhic3C
 UN7vfPSml/4gv9wbhR/HrzwoC8r41kGKxl+YvDSuHznaNE0FhVz4I8E7UFD3uIbodm
 VvkBLgif7So/e+AN9bnCJrlU3pFSjLFjfn76MCWw=
Date: Mon, 27 Nov 2023 10:56:11 -0800
From: Nischala Yelchuri <niyelchu@linux.microsoft.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH] Replace ioremap_cache() with memremap()
Message-ID: <20231127185611.GA27813@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
 <ZVFb4f8IRJeCFmYD@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVFb4f8IRJeCFmYD@liuwe-devbox-debian-v2>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 27 Nov 2023 22:46:33 +0000
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
Cc: linux-hyperv@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, hpa@zytor.com,
 kys@microsoft.com, deller@gmx.de, x86@kernel.org, decui@microsoft.com,
 mhkelley@outlook.com, drawat.floss@gmail.com, mingo@redhat.com,
 haiyangz@microsoft.com, mripard@kernel.org, singhabhinav9051571833@gmail.com,
 bp@alien8.de, tglx@linutronix.de, mhklinux@outlook.com, niyelchu@microsoft.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wei, this is one of the Hyper-V code improvement tasks that Michael Kelley identified.
Using memremap() is the right thing to do here. Abhinav Singh (cc'ed) also
tried to fix this earlier as there are sparse warnings with ioremap_cache().

On Sun, Nov 12, 2023 at 11:12:33PM +0000, Wei Liu wrote:
> On Wed, Nov 01, 2023 at 09:01:48AM -0700, Nischala Yelchuri wrote:
> > Current Hyper-V code for CoCo VMs uses ioremap_cache() to map normal memory as decrypted.
> > ioremap_cache() is ideally used to map I/O device memory when it has the characteristics
> > of normal memory. It should not be used to map normal memory as the returned pointer
> > has the __iomem attribute.
> 
> Do you find any real world issues with the current code? How do you
> discover these issues?
> 
> Thanks,
> Wei.
