Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C98CF3D9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD666E69C;
	Tue,  8 Oct 2019 07:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229456E187
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 21:21:34 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHaRg-0007ca-D6; Mon, 07 Oct 2019 21:21:32 +0000
Subject: Re: [PATCH v10 1/5] dma-buf: Add dma-buf heaps framework
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20191007211830.42838-1-john.stultz@linaro.org>
 <20191007211830.42838-2-john.stultz@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ad064efe-4d86-3b81-ace2-152e90c72e94@infradead.org>
Date: Mon, 7 Oct 2019 14:21:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007211830.42838-2-john.stultz@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N5EcAmKjzPUXozCqPG1kX/cDR4yO/jPB64zcL2DCNeY=; b=ANrNw1ikjbWO3futfL+1WVHL8
 QSJs5oZujkWlghJJ0qq4RQ00Kcw0cYIf0SqEoB5kiNDn6Bf6Nwy/l0I/+ur7XrHSxwxf8veOgmrgR
 8FwsrZuHma7vRG2EVwkJOB5f7mGzFbxCs/5EbtGw4SEzrQ9tq1Q3caFBgvSCxF4kvn1Pkv2KHKocU
 Dgolk7MNOh+vVKSSsjYVUg+5FA9ms9FpQKk9a9jIz7QP/C2AQuMcTcXnuc5sIW0hqdkJQMaGe5Ei+
 viHJi22wWdlZvi8SRLmQ6CYZgmM0RrCt78sUJiontCuaTXRzjpfMLufs6Fb+e/XuWQGdalJ2tK3j9
 P5xK5v2Rg==;
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8xOSAyOjE4IFBNLCBKb2huIFN0dWx0eiB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9kbWEtYnVmL0tjb25maWcgYi9kcml2ZXJzL2RtYS1idWYvS2NvbmZpZwo+IGluZGV4IGEy
M2I2NzUyZDExYS4uNmU5YzdjNGQ3NDQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL0tjb25maWcKPiBAQCAtNDQsNCArNDQsMTMg
QEAgY29uZmlnIERNQUJVRl9TRUxGVEVTVFMKPiAgCWRlZmF1bHQgbgo+ICAJZGVwZW5kcyBvbiBE
TUFfU0hBUkVEX0JVRkZFUgo+ICAKPiArbWVudWNvbmZpZyBETUFCVUZfSEVBUFMKPiArCWJvb2wg
IkRNQS1CVUYgVXNlcmxhbmQgTWVtb3J5IEhlYXBzIgo+ICsJc2VsZWN0IERNQV9TSEFSRURfQlVG
RkVSCj4gKwloZWxwCj4gKwkgIENob29zZSB0aGlzIG9wdGlvbiB0byBlbmFibGUgdGhlIERNQS1C
VUYgdXNlcmxhbmQgbWVtb3J5IGhlYXBzLAoKCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGVhcHMuCgo+ICsJICB0aGlzIG9wdGlvbnMg
Y3JlYXRlcyBwZXIgaGVhcCBjaGFyZGV2cyBpbiAvZGV2L2RtYV9oZWFwLyB3aGljaAoKCSAgVGhp
cwoKPiArCSAgYWxsb3dzIHVzZXJzcGFjZSB0byB1c2UgdG8gYWxsb2NhdGUgZG1hLWJ1ZnMgdGhh
dCBjYW4gYmUgc2hhcmVkCgo/PwkgICAgICAgICAgICAgICAgICAgdG8gYWxsb2NhdGUgJiB1c2UK
Cj4gKwkgIGJldHdlZW4gZHJpdmVycy4KPiArCj4gIGVuZG1lbnUKCgotLSAKflJhbmR5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
