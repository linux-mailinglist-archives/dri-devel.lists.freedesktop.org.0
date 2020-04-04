Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01F19E506
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5605D6E212;
	Sat,  4 Apr 2020 12:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389C76ECD9;
 Sat,  4 Apr 2020 02:42:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id v23so3549138ply.10;
 Fri, 03 Apr 2020 19:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jpCey6nXR24VHkMuvgvYPJ86L/KDUB6wcFgnfdZsomA=;
 b=BWMvkRH+pOW8OPP2yQVDcV+Hpe/qCg9Lyk06ZLfwCMbfbNI15KDCOQ8q62bAfii5uh
 9ChqSNKsdrA9S/fnb0Wn7QmJ9S1T1Lnr6RV7VE66689jxbHEM7F7ieSYhb+sCHDq86J3
 6BNRE7mBsoFBNa9MhQBk4hEm2KfB4/JkEDRYMdkg4uffC1IfTLBQe/55oMQ6GCL1ZS9t
 f2o56Uc3n/9RTqwF4uu3AhOTh3umGWfxy/Q4TAW0lsP0dK2WTZl3IMBnT3RwiYFOZKaw
 CvpG2lGC+KpSypCAZv1W3OY9dtJF8rEjfqrvV44N/Gh2OFJ4ChEE68rFVQ+o+FuDRgTC
 ztRQ==
X-Gm-Message-State: AGi0PuZPBdCFHRr5b9ols29xhsSozEnFmk7ew0BPHng3vseC0SPipUh6
 8dN59UjDKlp0TMUHBwcgjKE=
X-Google-Smtp-Source: APiQypLsKMCV76FWg8xK/CcpK6SZP3U8Fx2DGLw069VafyMfbQeFHdk++S3zg9eV0uup+7O5Q41n3Q==
X-Received: by 2002:a17:90a:23ed:: with SMTP id
 g100mr12860973pje.93.1585968120823; 
 Fri, 03 Apr 2020 19:42:00 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id iq14sm6716639pjb.43.2020.04.03.19.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 19:41:59 -0700 (PDT)
Date: Fri, 3 Apr 2020 19:41:56 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: stable@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/i915: Synchronize active and retire callbacks
Message-ID: <20200404024156.GA10382@sultan-box.localdomain>
References: <20200403042948.2533-1-sultan@kerneltoast.com>
 <20200403223528.2570-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403223528.2570-1-sultan@kerneltoast.com>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:35:15PM -0700, Sultan Alsawaf wrote:
> +			ref->retire(ref);
> +			mutex_unlock(&ref->callback_lock);

Ugh, this patch is still wrong because the mutex unlock after ref->retire() is a
use-after-free. Fun times...

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
