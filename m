Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B83245D4C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EC56E4D7;
	Mon, 17 Aug 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5E6E179
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597305267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rGN7NkgwAEJ2ZoHEFH2PZFIIR5lqiIJQgzR9gZfV/kA=;
 b=b4lrKXGZjzApp+IYCcVaspaS0N8nfiYHA1uDkR9PBRxMhUoxstYewltn
 k3GdkIamjaQT3ek2w8KpYXLaiNMGPgpNH/nwJnGM6L/9QqNVU7qDxI7J2
 Ko0tNzWpQyuCuK+M0yolR+q//pJMc+oBMO9FZxhYgopb/d3NLfDEG5liS c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CGSiRuy2FL5NWfWVjPwjPdUkwaXeWvnbYbwr1LMb9ijYk9TC1E3fzgAdL3b7/HEUVoIhaFwOcY
 LldZ9H5V7RCULb3EzXbTcKv+9jW4Izfb8ohyOjU/Rzbis8IYyY2I6ssIynObdLwWN6SbOfCx+a
 J+d51tvpvZ93irUqTW2TmiQpr7YQ2OBIlh5tPB2LlNGJTF6MFbUVL4bf+wZdsLjH9FqpEy0zIH
 yEZJki2K7FUIF5I5QW6R0issxNrrro1Hc/n+2ZZLNoFohSszUpeW7S+QZzXY/xuUSGLmrLuv63
 nSQ=
X-SBRS: 2.7
X-MesageID: 25349268
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="25349268"
Date: Thu, 13 Aug 2020 09:54:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200813075420.GC975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813073337.GA16160@infradead.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > functionality untangles Xen balloon and RAM hotplug from the usage of
> > unpopulated physical memory ranges to map foreign pages, which is the
> > correct thing to do in order to avoid mappings of foreign pages depend
> > on memory hotplug.
> 
> So please just select ZONE_DEVICE if this is so much better rather
> than maintaining two variants.

We still need to other variant for Arm at least, so both need to be
maintained anyway, even if we force ZONE_DEVICE on x86.

Thanks, Roger.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
