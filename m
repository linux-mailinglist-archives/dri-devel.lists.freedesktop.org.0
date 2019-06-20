Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB34E11F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CB96E828;
	Fri, 21 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 473 seconds by postgrey-1.36 at gabe;
 Thu, 20 Jun 2019 10:28:40 UTC
Received: from mail.us.es (mail.us.es [193.147.175.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20BD6E382
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 10:28:40 +0000 (UTC)
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
 by mail.us.es (Postfix) with ESMTP id 2D9B1EA482
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 12:20:44 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 1F44ADA716
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 12:20:44 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
 id 16594DA79A; Thu, 20 Jun 2019 12:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
 SMTPAUTH_US2,USER_IN_WHITELIST autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id BDA58DA705;
 Thu, 20 Jun 2019 12:20:41 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Thu, 20 Jun 2019 12:20:41 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (sys.soleta.eu [212.170.55.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: 1984lsi)
 by entrada.int (Postfix) with ESMTPSA id 4A7A64265A2F;
 Thu, 20 Jun 2019 12:20:41 +0200 (CEST)
Date: Thu, 20 Jun 2019 12:20:40 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH net-next] br_netfilter: prevent UAF in brnf_exit_net()
Message-ID: <20190620102040.g5yqqp3lnka7rn3q@salvia>
References: <20190619170547.6290-1-christian@brauner.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619170547.6290-1-christian@brauner.io>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org, sfr@canb.auug.org.au,
 nikolay@cumulusnetworks.com, bridge@lists.linux-foundation.org,
 kadlec@netfilter.org, maxime.ripard@bootlin.com, coreteam@netfilter.org,
 airlied@redhat.com, roopa@cumulusnetworks.com, jonas@kwiboo.se,
 marc.zyngier@arm.com, syzkaller-bugs@googlegroups.com,
 intel-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 rodrigo.vivi@intel.com, jerry.zhang@amd.com, sean@poorly.run,
 netdev@vger.kernel.org, fw@strlen.de, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com,
 syzbot+43a3fa52c0d9c5c94f41@syzkaller.appspotmail.com,
 netfilter-devel@vger.kernel.org, enric.balletbo@collabora.com,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDc6MDU6NDdQTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gUHJldmVudCBhIFVBRiBpbiBicm5mX2V4aXRfbmV0KCkuCgpBcHBsaWVkLCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
