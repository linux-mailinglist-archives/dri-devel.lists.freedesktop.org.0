Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C9BCDBBB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 17:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A384910EC45;
	Fri, 10 Oct 2025 15:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WArYYeRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578110EC45
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHCdZi6C7ELhvkHmBE99ONw5f0wTBtemnyHf1SDAuNY=;
 b=WArYYeRpONYKxlsi3oc/h0RB9tdATlCzaD5Vm9iXtdo7ZM42xWGVZD+g22XEbIk+4yn9xm
 KqEBO34sNcGFYzohIbjTa/TQyvAC3cqIfd6SXf+mxPG9/q4qWxtaZEAj71pT8nCnZwryWR
 cnEi1+M2ZH+2MQAdAuHooB9zNrDMXnU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-5gxgZ7HqORGcbXAp1Yrqxg-1; Fri,
 10 Oct 2025 11:12:07 -0400
X-MC-Unique: 5gxgZ7HqORGcbXAp1Yrqxg-1
X-Mimecast-MFC-AGG-ID: 5gxgZ7HqORGcbXAp1Yrqxg_1760109125
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B964918005BF; Fri, 10 Oct 2025 15:12:03 +0000 (UTC)
Received: from [10.45.224.32] (unknown [10.45.224.32])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E0D821955F42; Fri, 10 Oct 2025 15:11:56 +0000 (UTC)
Date: Fri, 10 Oct 2025 17:11:49 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: Helge Deller <deller@gmx.de>, sukrut heroorkar <hsukrut3@gmail.com>, 
 David Hunter <david.hunter.linux@gmail.com>, 
 kernel test robot <lkp@intel.com>, Bernie Thompson <bernie@plugable.com>, 
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Zsolt Kajtar <soci@c64.rulez.org>, 
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
In-Reply-To: <6b1f8366-7ec8-4c1f-9563-29e06a8060e2@suse.de>
Message-ID: <b8472f68-982b-c00b-55cc-547c72bef34c@redhat.com>
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
 <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de>
 <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
 <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
 <c1d86274-44e2-4ceb-b887-5c4af45d8b37@gmx.de>
 <6b1f8366-7ec8-4c1f-9563-29e06a8060e2@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="-1463811712-636264779-1760108298=:3315052"
Content-ID: <b28657e4-9db0-51fc-5872-290b4927a66a@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811712-636264779-1760108298=:3315052
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <77da2ba4-763b-3169-d87c-f655b00b6162@redhat.com>



On Tue, 7 Oct 2025, Thomas Zimmermann wrote:

> Hi
> 
> Am 03.10.25 um 21:50 schrieb Helge Deller:
> > On 10/3/25 20:43, sukrut heroorkar wrote:
> > > On Thu, Oct 2, 2025 at 8:52 AM Thomas Zimmermann <tzimmermann@suse.de>
> > > wrote:
> > > > Am 02.10.25 um 08:41 schrieb Helge Deller:
> > > > > > > > kernel test robot noticed the following build errors:
> > > > > > > 
> > > > > > > Did you compile and test this code before submitting this patch?
> > > > > > 
> > > > > > Yes, I had compiled & loaded the udlfb module with no errors. Please
> > > > > > let me know how to proceed in this case.
> > > > > 
> > > > > Look at the reported build error, which seems to happen in dev_dbg().
> > > > > So, maybe in your testing you did not have debugging enabled?
> > > > > The report contains the .config file with which you can test.
> > > > 
> > > > Can we rather make an effort to remove the udlfb driver entirely? A few
> > > > years back, there was one user who was still using it because of some
> > > > problems with the DRM udl driver. But I think we've addressed them. The
> > > > discussion is at [1].

It was me - and I am still using it on an ARM64 MacchiatoBIN board because 
the board doesn't have graphics output.

The problems with the UDL DRM driver were:

* crashes with full-screen framebuffer applications, such as "links2 -g", 
"fbi" or "fbgs". On UDLFB, there are no crashes.

* worse performance - the UDL DRM driver updates everything in a given 
rectangle, while the UDLFB driver keeps back-buffer and front-buffer and 
updates only differences between them.

* crash when you unplug the card while Xorg was running (already fixed)

Mikulas
---1463811712-636264779-1760108298=:3315052--

