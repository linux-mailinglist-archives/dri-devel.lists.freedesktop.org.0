Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827D5AEB61
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA3410E699;
	Tue,  6 Sep 2022 14:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D2810E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=dRpxQ4jjwN1yFtBGpEPXLSbtDHI+DAP32QAWwCSE7yM=; b=v4K4BuErh9R48s3gAbIlnJ7jJk
 m89LeHbJ/8pbR5E5DOEhBRre082ax9NRRGdB2lGdDto9SYoPe3Lg24Rwc+HmeinJWH0tIasU+kbAD
 VpCVj5tY464MtLwHGgTeMwmbTEf/teh+lr6JEnrXtcNyinIvwU9ovMTKne80oziMvNPyXUCXy0Yx+
 zKPXune2C8F8IlitS5VzG6kwpxcQRkUTgJzy0cCFpDcuKLM/Y51l7uuhoNU1TU6EZ/QExYAxohBxA
 7m2qb0LewkLsS1QwYfg7JeraCp+XL/s2l1LcaSJCM7nWYANeOfMeQcoZBp3Z5o1fWNAr3dQ7sFjSa
 Gg0rQppw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oVZS9-00AUXk-PE; Tue, 06 Sep 2022 14:21:25 +0000
Date: Tue, 6 Sep 2022 15:21:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v3 0/4] drm: Use full allocated minor range for DRM
Message-ID: <YxdXZbFBHIevYwRz@casper.infradead.org>
References: <20220906140117.409852-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906140117.409852-1-michal.winiarski@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 04:01:13PM +0200, Michał Winiarski wrote:
> 64 DRM device nodes is not enough for everyone.
> Upgrade it to ~512K (which definitely is more than enough).
> 
> To allow testing userspace support for >64 devices, add additional DRM
> modparam (skip_legacy_minors) which causes DRM to skip allocating minors
> in 0-192 range.
> Additionally - one minor tweak around minor DRM IDR locking and IDR lockdep
> annotations.

The IDR is deprecated; rather than making all these changes around
the IDR, could you convert it to use the XArray instead?  I did it
once before, but those patches bounced off the submissions process.

