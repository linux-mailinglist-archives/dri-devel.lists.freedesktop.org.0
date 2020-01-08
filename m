Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF913473A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 17:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C136E8A9;
	Wed,  8 Jan 2020 16:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799586E150;
 Wed,  8 Jan 2020 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMgpRwMfBTA/wg1V1yYv/ptKkHdbwk4G6gGbVx8IaEQ=; b=lgY7QYcicyoKwvccg83IZQro0
 0cResX5TJ+zvSIpLlLQDFaZF2/s8crlziDLa9UCb79Wo0iA+5QxfM4z5XRTmg3g4n5H+lVAFrSgZj
 hULgkB/qa5xtNPoCCeiIC8EWWw2G0H2wVMXZCb3Igvu20TWgiaC0FsbfKTrtGpWj+EWHOG+oFr3rK
 EbVEVokH/sT2XBGNxUG26c8bpcGw89Ema7TtlHzGoG6sZK9KhEogvk412Iwu8lDMVygkugjpMd5va
 atSePYPRa/H/tDRUmpPyfO7p8MhV7yjSL5w4rmoO10ezG/P0N8AjxUM57OseHrcutrOQBZmnUYKSL
 /dNK9O48A==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipDsk-00028w-O8; Wed, 08 Jan 2020 17:08:30 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipDsk-0002Bk-C4; Wed, 08 Jan 2020 17:08:30 +0100
Message-ID: <5e98e9666bfeb275ec168df24bb8e9a33781229e.camel@cyberus-technology.de>
Subject: Re: [PATCH 2/3] drm/i915/gvt: make gvt oblivious of kvmgt data
 structures
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 intel-gvt-dev@lists.freedesktop.org
Date: Wed, 08 Jan 2020 18:08:28 +0200
In-Reply-To: <87tv56qm9m.fsf@intel.com>
References: <20200106140622.14393-1-julian.stecklina@cyberus-technology.de>
 <20200106140622.14393-2-julian.stecklina@cyberus-technology.de>
 <87tv56qm9m.fsf@intel.com>
Organization: Cyberus Technology GmbH
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25688/Wed Jan  8 10:56:24 2020)
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
Cc: zhiyuan.lv@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hang.yuan@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-01-08 at 12:24 +0200, Jani Nikula wrote:
> On Mon, 06 Jan 2020, Julian Stecklina <julian.stecklina@cyberus-technology.de>
> wrote:
[...]
> > +	/* Hypervisor-specific device state. */
> > +	void *vdev;
> 
> I have no clue about the relative merits of the patch, but you can use
> the actual type for the pointer with a forward declaration. You don't
> need the definition for that.
> 
> i.e.
> 
> struct kvmgt_vdev;
> ...
> 	struct kvmgt_vdev *vdev;

The goal here is to make the GVT code independent of the hypervisor backend.
Different hypervisor backends need to keep different per-device state, so using
the KVM type here defeats the purpose.

I assume this is not only useful for us, but also for other hypervisor backends,
such as Xen or 3rd-party hypervisors.

Julian


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
