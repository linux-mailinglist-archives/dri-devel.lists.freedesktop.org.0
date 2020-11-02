Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A02A3E6F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C22B6EBA7;
	Tue,  3 Nov 2020 08:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD936E0F5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UmWNoo+0jio1rsbpATbpnTKOP6YpDT2+8aHnhsn1BNQ=; b=cf1MSWB7BC+d/XGfBcQ2kzWTKP
 Peh8sMqwcaL1avawa0skij5vzCJuMhLjyf5+3duC9LV64xK5h7mYlExaCNl16g5xIgy0XYatg9Kkf
 8MzQdAQ7nqnViyK6PC8RcELKGC+j9GZJ7ckJm169iVg6QlV5ggKqdv+lcQqqbrPMl+FlSrL0fJtVH
 h3aIS4VO2YSOq9iZcZt7+s5WtKwHYRjz80MESyljeOHnTABAzm0KwnO67EhkQGqAYQ3ow0H2PyBl3
 OZ6Wcz1eC4cFYhDOYdlGwsV1WdJGKy68/ZW9RvzSJwxRicr1Ax69ZJI0224mH0dP7B11Lada3H09n
 ylAgZRSA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kZbx7-0002Pe-5d; Mon, 02 Nov 2020 15:41:01 +0000
Date: Mon, 2 Nov 2020 15:41:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/8] mm: slab: provide krealloc_array()
Message-ID: <20201102154101.GO27442@casper.infradead.org>
References: <20201102152037.963-1-brgl@bgdev.pl>
 <20201102152037.963-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102152037.963-2-brgl@bgdev.pl>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-mm@kvack.org,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 James Morse <james.morse@arm.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 04:20:30PM +0100, Bartosz Golaszewski wrote:
> +Chunks allocated with `kmalloc` can be resized with `krealloc`. Similarly
> +to `kmalloc_array`: a helper for resising arrays is provided in the form of
> +`krealloc_array`.

Is there any reason you chose to `do_this` instead of do_this()?  The
automarkup script turns do_this() into a nice link to the documentation
which you're adding below.

Typo 'resising' resizing.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
