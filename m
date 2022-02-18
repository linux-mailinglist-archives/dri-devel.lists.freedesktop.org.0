Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE34BB919
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 13:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E13910ED41;
	Fri, 18 Feb 2022 12:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683B410ED77
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=MVaFoxpSrw0lXOFRf60il59+xXDuimORkK161w41iNc=; 
 t=1645187213; x=1646396813; b=rJLn5zZSzE9XXsE+hkXZgYxeVOTSNBzpsVSFulU6yxOBNPT
 gnVpKc5tv5E0atCNcu15VVxF4if+FFxO+EoFzKQPgDu8Qq4I0LWFkM++WRDF8lDHzvALhuMT2ZzIU
 TPijGUWgFTkOvpWQpj34em94KjY1yb+yybrwL0zMhJLfOopU9W0NZnbmTs/w2pDYmWL6qhxwLuXEq
 rIGJ9Rk3ZmIrcjFG0EHA+CHAxtCTvkgcb6jLxcz/c76vt0svv5bk0vdkRMrVieQ2bhxFkt2F675BT
 4CCnPON995YREVFX+tRkHC+sRIPeK1tk77mGH02KKMPPo31BR1xGmevzuUawzBdw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nL2LH-002du1-NQ; Fri, 18 Feb 2022 13:26:31 +0100
Message-ID: <ac4c5f8c890e5bdd7ad7ecc04a51e72fa3ac1703.camel@sipsolutions.net>
Subject: Re: [PATCH 4/4] kunit: tool: Disable broken options for --alltests
From: Johannes Berg <johannes@sipsolutions.net>
To: David Gow <davidgow@google.com>, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>,  Randy Dunlap
 <rdunlap@infradead.org>
Date: Fri, 18 Feb 2022 13:26:30 +0100
In-Reply-To: <20220218075727.2737623-5-davidgow@google.com>
References: <20220218075727.2737623-1-davidgow@google.com>
 <20220218075727.2737623-5-davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
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
Cc: linux-rdma@vger.kernel.org, felix.kuehling@amd.com, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-02-18 at 15:57 +0800, David Gow wrote:
> 
> Note that, while this does build again, it still segfaults on startup,
> so more work remains to be done.

That's probably just a lot more stuff getting included somehow?

> They are:
> - CONFIG_VFIO_PCI: Needs ioport_map/ioport_unmap.
> - CONFIG_INFINIBAND_RDMAVT: Needs cpuinfo_x86 and __copy_user_nocache
> - CONFIG_BNXT: Failing under UML with -Werror
> ERROR:root:../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c: In function ‘bnxt_ptp_enable’:
> ../drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:400:43: error: array subscript 255 is above array bounds of ‘struct pps_pin[4]’ [-Werror=array-bounds]
>   400 |                         ptp->pps_info.pins[pin_id].event = BNXT_PPS_EVENT_EXTERNAL;
>       |                         ~~~~~~~~~~~~~~~~~~^~~~~~~~
> - CONFIG_PATA_CS5535: Needs MSR access (__tracepoint_{read,write}_msr)
> - CONFIG_VDPA: Enables CONFIG_DMA_OPS, which is unimplemented. ('dma_ops' is not defined)
> 
> These are all issues which should be investigated properly and the
> corresponding options either fixed or disabled under UML. Having this
> list of broken options should act as a good to-do list here, and will
> allow these issues to be worked on independently, and other tests to
> work in the meantime.
> 

I'm not really sure it makes sense to even do anything other than
disabling these.

It looks like all of them are just exposed by now being able to build
PCI drivers on UML. Surely the people writing the driver didn't expect
their drivers to run over simulated PCI (which is what the UML PCI
support is all about).

Now from a PCI driver point of view you can't really tell the difference
(and anyway the driver won't be probed), but the issues (at least the
build time ones) come from having

    UML && PCI && X86_64

or

    UML && PCI && X86_32

because drivers typically depend on X86_64 or X86_32, rather than on
"X86 && X86_64" or "X86 && X86_32". In a sense thus, the issue is those
drivers don't know that "!X86 && (X86_32 || X86_64)" can happen (with
UML).


Now you could say that's the driver bug, or you could say that they
should just add "depends on !UML" (though that's basically equivalent to
adding "depends on X86" and the latter may be preferable in some cases).

Or actually in the three patches you have (1-3) it's in the code, but
same thing, you can either add && !UML (like you did) or add && X86.


Arguably, however, building PCI drivers by default is somewhat
questionable in the first place?

So maybe you should just add

    # CONFIG_UML_PCI_OVER_VIRTIO is not set

to the broken_on_uml.config since it exposes all these issues, and
really is not very useful since you're not going to actually run with
any simulated PCI devices anyway, so drivers will not be probed.

johannes
