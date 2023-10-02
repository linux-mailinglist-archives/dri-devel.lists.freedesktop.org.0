Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A27B54CE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 16:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFA510E0E5;
	Mon,  2 Oct 2023 14:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C4E10E0E5;
 Mon,  2 Oct 2023 14:17:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EF62EB81094;
 Mon,  2 Oct 2023 14:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53217C433C8;
 Mon,  2 Oct 2023 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696256258;
 bh=vkYSu3CMdUku1DYMLSbi1CqSIx/Y+w371ZyBOHbOWQU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=exLEpilJBAgz5ZnsirATe9JxW+UqjlphdsbHWsfr4jfuvvcdvfFqCOOPADpHoegLG
 QT1ZRviNOCQSFKPR+2ncqqKUmVN5OgF6Y3H/MOzAcM/iVe2Rhws0drvVplI+2eIc8B
 vEtl9FK4HkZ3OOjR4RCkE9u+Gvi4K1kPyS1jOYkSvxJSQs2ZBIu74ouWye+qLIE93j
 akqIqYVLy6LU2/F78IRxLEwEfXTSJG6/bFwFcDmsl1IBSzB7eh4B9D9E143cSdty4X
 r2p6zx5xCX9grOdpP+GalyJ8YI4rJQvVL0i4iN5OQXuy6/X9d744gUtflnDsfOCo5Y
 8pia5lOvzI0rg==
Message-ID: <e493d101-348a-949d-5160-3d633817adf2@kernel.org>
Date: Mon, 2 Oct 2023 08:17:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 10/15] vrf: Remove the now superfluous sentinel element
 from ctl_table array
Content-Language: en-US
To: j.granados@samsung.com, Luis Chamberlain <mcgrof@kernel.org>,
 willy@infradead.org, josh@joshtriplett.org, Kees Cook
 <keescook@chromium.org>, Phillip Potter <phil@philpotter.co.uk>,
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jiri Slaby <jirislaby@kernel.org>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Doug Gilbert <dgilbert@interlog.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>,
 Russ Weight <russell.h.weight@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
 <651a84ff.050a0220.51ca9.2e91SMTPIN_ADDED_BROKEN@mx.google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <651a84ff.050a0220.51ca9.2e91SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-raid@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/2/23 2:55 AM, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from vrf_table
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/net/vrf.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>


