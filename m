Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC6A8B2AF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85310E877;
	Wed, 16 Apr 2025 07:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pyV9XH/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872E10E877;
 Wed, 16 Apr 2025 07:52:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 967EBA4A28F;
 Wed, 16 Apr 2025 07:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E2C4CEE2;
 Wed, 16 Apr 2025 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744789920;
 bh=uCBqYnlccBn6kD323ztcCaCIgVoqGL0ZzE2xDvyMfVY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pyV9XH/929pKCUtu/jzo5+kbsxbegrQPoHoJP9O88jdotRKNaWxzO7m2X2oWUUnl5
 YjXPNJsV1ZINr+le6HrIAFssc3MvMMmR6HUbk/dxFIZ34iS9fg7GE5N4XwHrBxypZy
 OJ8KmruYUYNwuMAndxSlUIpk8zaahjjfcNQL/oTwW6VkvutoPHLLbaN6fKg4tOB+TH
 zLVEySWQ+erOoB+bzKjf53wuI5BV0FCBpgft6oQ2LxV3BguSSPv7TTaQIi3mGCJf+V
 R2l18Py0xg/PTe7jly2q2Z6dpfNpBgb+HjUxzxVTLQDLciecbf0QIoQZqpUaT1ZC2n
 Jh6BPglevroqQ==
Date: Wed, 16 Apr 2025 15:51:41 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, David Airlie <airlied@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416155141.7aa05bb8@sal.lan>
In-Reply-To: <Z_9asBKQ_9DGOH2g@smile.fi.intel.com>
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
 <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
 <Z_9asBKQ_9DGOH2g@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

Em Wed, 16 Apr 2025 10:22:24 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> escreveu:

> On Wed, Apr 16, 2025 at 02:57:38PM +0800, Mauro Carvalho Chehab wrote:
> > As reported by Andy, kernel-doc.py is creating a __pycache__
> > directory at build time.
> > 
> > Disable creation of __pycache__ for the libraries used by
> > kernel-doc.py, when excecuted via the build system or via
> > scripts/find-unused-docs.sh.  
> 
> Nope, still have it.
> 
> I used today's Linux Next with some local code patches (unrelated
> to any scripts or kernel doc or python).
> 
> To confirm, I even done again a clean build.
> 

There were one missing place.

Sent a v3. Please test.

Regards,
Mauro
