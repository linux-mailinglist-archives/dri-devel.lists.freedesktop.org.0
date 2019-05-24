Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39DD298A4
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 15:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07516E0BF;
	Fri, 24 May 2019 13:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF2E6E0BD;
 Fri, 24 May 2019 13:14:06 +0000 (UTC)
Received: from 177.97.63.247.dynamic.adsl.gvt.net.br ([177.97.63.247]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUA1G-0007UW-C4; Fri, 24 May 2019 13:13:58 +0000
Date: Fri, 24 May 2019 10:13:45 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 14/17] media/v4l2-core, arm64: untag user pointers
 in videobuf_dma_contig_user_get
Message-ID: <20190524101345.67c425fa@coco.lan>
In-Reply-To: <b7999d13af54eb3ed8d7b0192397c7cde3df0b28.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <b7999d13af54eb3ed8d7b0192397c7cde3df0b28.1557160186.git.andreyknvl@google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/n51XGtaWTFL2kzn79WHLkkiSbCnRxm63xReP9D+Qhg=; b=bUkJxWW27UUn0amoOcX30OMJrj
 ZKVRSd1fLa7wKAL02nzw4IuOiQA4rzgr054ftsu9MviuEbu9mlGcvkuzEzVnirDZFWPfHjMMLLRk3
 ZsW9iClnPD6BeArzI/irNnfgAKRVNaTgvodZ4TtoBZwoHm+HpL855LvNq4JvaGdw7aEGxArIj4/ar
 bjQ2iBjNGlyPTpQSCWDE80zIQI9EXYMUp8RizSkmI+AmxIKaaD96lVlDCETopHnXFcxZVFNsAuFYn
 eLi0l7CIdF+p1i1kh/+U5yW0qGVeRM/1NgoUENimwmZJ/qxCwebQt5wRW4slq4faCCWf2/ok2eNHJ
 OcM7Zp+w==;
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gTW9uLCAgNiBNYXkgMjAxOSAxODozMTowMCArMDIwMApBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+IGVzY3JldmV1OgoKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBh
IHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3Mg
dGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcg
ZWxzZSBvdGhlcgo+IHRoYW4gMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gdmlkZW9i
dWZfZG1hX2NvbnRpZ191c2VyX2dldCgpIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Ig
dm1hCj4gbG9va3Vwcywgd2hpY2ggY2FuIG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgo+IAo+IFVudGFnIHRoZSBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KCkFja2Vk
LWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgoK
PiAtLS0KPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jIHwg
OSArKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYt
ZG1hLWNvbnRpZy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRp
Zy5jCj4gaW5kZXggZTFiZjUwZGY0YzcwLi44YTFkZGQxNDZiMTcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gKysrIGIvZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLWNvbnRpZy5jCj4gQEAgLTE2MCw2ICsxNjAs
NyBAQCBzdGF0aWMgdm9pZCB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfcHV0KHN0cnVjdCB2aWRl
b2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtKQo+ICBzdGF0aWMgaW50IHZpZGVvYnVmX2RtYV9j
b250aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdfbWVtb3J5ICptZW0sCj4g
IAkJCQkJc3RydWN0IHZpZGVvYnVmX2J1ZmZlciAqdmIpCj4gIHsKPiArCXVuc2lnbmVkIGxvbmcg
dW50YWdnZWRfYmFkZHIgPSB1bnRhZ2dlZF9hZGRyKHZiLT5iYWRkcik7Cj4gIAlzdHJ1Y3QgbW1f
c3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7
Cj4gIAl1bnNpZ25lZCBsb25nIHByZXZfcGZuLCB0aGlzX3BmbjsKPiBAQCAtMTY3LDIyICsxNjgs
MjIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfY29udGlnX3VzZXJfZ2V0KHN0cnVjdCB2aWRl
b2J1Zl9kbWFfY29udGlnX21lbW9yeSAqbWVtLAo+ICAJdW5zaWduZWQgaW50IG9mZnNldDsKPiAg
CWludCByZXQ7Cj4gIAo+IC0Jb2Zmc2V0ID0gdmItPmJhZGRyICYgflBBR0VfTUFTSzsKPiArCW9m
ZnNldCA9IHVudGFnZ2VkX2JhZGRyICYgflBBR0VfTUFTSzsKPiAgCW1lbS0+c2l6ZSA9IFBBR0Vf
QUxJR04odmItPnNpemUgKyBvZmZzZXQpOwo+ICAJcmV0ID0gLUVJTlZBTDsKPiAgCj4gIAlkb3du
X3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gIAo+IC0Jdm1hID0gZmluZF92bWEobW0sIHZiLT5iYWRk
cik7Cj4gKwl2bWEgPSBmaW5kX3ZtYShtbSwgdW50YWdnZWRfYmFkZHIpOwo+ICAJaWYgKCF2bWEp
Cj4gIAkJZ290byBvdXRfdXA7Cj4gIAo+IC0JaWYgKCh2Yi0+YmFkZHIgKyBtZW0tPnNpemUpID4g
dm1hLT52bV9lbmQpCj4gKwlpZiAoKHVudGFnZ2VkX2JhZGRyICsgbWVtLT5zaXplKSA+IHZtYS0+
dm1fZW5kKQo+ICAJCWdvdG8gb3V0X3VwOwo+ICAKPiAgCXBhZ2VzX2RvbmUgPSAwOwo+ICAJcHJl
dl9wZm4gPSAwOyAvKiBraWxsIHdhcm5pbmcgKi8KPiAtCXVzZXJfYWRkcmVzcyA9IHZiLT5iYWRk
cjsKPiArCXVzZXJfYWRkcmVzcyA9IHVudGFnZ2VkX2JhZGRyOwo+ICAKPiAgCXdoaWxlIChwYWdl
c19kb25lIDwgKG1lbS0+c2l6ZSA+PiBQQUdFX1NISUZUKSkgewo+ICAJCXJldCA9IGZvbGxvd19w
Zm4odm1hLCB1c2VyX2FkZHJlc3MsICZ0aGlzX3Bmbik7CgoKClRoYW5rcywKTWF1cm8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
