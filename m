Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1013CB555
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487F46EADF;
	Fri,  4 Oct 2019 07:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4666E110
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 20:41:13 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iG7uO-0001rj-Lm; Thu, 03 Oct 2019 20:41:08 +0000
Date: Thu, 3 Oct 2019 13:41:08 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 08/11] mm: convert vma_interval_tree to half closed
 intervals
Message-ID: <20191003204108.GF32665@bombadil.infradead.org>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-9-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003201858.11666-9-dave@stgolabs.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IF1FolxTqmDTd/x1Q52V8Xh4wjuT53fQ+vxzesNKzJ0=; b=HPp/6lAlpE0Jvcw0rdXMwN6UV
 Qej28WAocyfIo02LqH1bwMfgUDN7ybvuwl0+oGgQuBeWy0LITlxanB/pj45j45ZRBLdIhq5Pg3136
 Dgcb3313rfrD27i14BwWBF7m0E2O5Iz56LPUEKGa7IS5Ao3+SY6iYysrPd1aML6yWGke+g7yVFR7W
 8lldEDb8wqcvmJstIdsdQIExY2L07IfV2Vkub3RjT+ig/PJeXyMklxJ26Oz80qEbvlXL/yv4eWlx7
 i3zflHLA2zpZsBxy0V6NmrvFwk/5ymQToL5kmZ3jaq66pyYFINebi9urL29q1pHAjUhHvunoGCHbf
 tD2/xhL+w==;
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, walken@google.com,
 linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDE6MTg6NTVQTSAtMDcwMCwgRGF2aWRsb2hyIEJ1ZXNv
IHdyb3RlOgo+ICsrKyBiL21tL25vbW11LmMKPiBAQCAtMTc5Myw3ICsxNzkzLDcgQEAgaW50IG5v
bW11X3Nocmlua19pbm9kZV9tYXBwaW5ncyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzaXplX3Qgc2l6
ZSwKPiAgCXNpemVfdCByX3NpemUsIHJfdG9wOwo+ICAKPiAgCWxvdyA9IG5ld3NpemUgPj4gUEFH
RV9TSElGVDsKPiAtCWhpZ2ggPSAoc2l6ZSArIFBBR0VfU0laRSAtIDEpID4+IFBBR0VfU0hJRlQ7
Cj4gKwloaWdoID0gKHNpemUgKyBQQUdFX1NJWkUpID4+IFBBR0VfU0hJRlQ7CgpVaGggLi4uIGFy
ZSB5b3Ugc3VyZSBhYm91dCB0aGlzPyAgc2l6ZSBpcyBpbiBieXRlcyBoZXJlLCBhbmQgd2UncmUg
cm91bmRpbmcKdXAgdG8gdGhlIG5leHQgcGFnZSBzaXplLiAgU28gaWYgc2l6ZSBpcyBbMS00MDk2
XSwgdGhlbiB3ZSBhZGQgb24gNDA5NSBhbmQgZ2V0CnRoZSBhbnN3ZXIgMS4gIFdpdGggeW91ciBw
YXRjaCwgaWYgc2l6ZSBpcyBbMC00MDk1XSwgd2UgZ2V0IHRoZSBhbnN3ZXIgMS4KSSB0aGluayB5
b3UgbWVhbnQ6CgoJaGlnaCA9ICgoc2l6ZSArIFBBR0VfU0laRSAtIDEpID4+IFBBR0VfU0hJRlQp
ICsgMTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
