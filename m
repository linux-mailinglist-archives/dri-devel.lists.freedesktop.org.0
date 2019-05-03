Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72412823
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24D789617;
	Fri,  3 May 2019 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C011891BB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 03:15:17 +0000 (UTC)
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134]
 helo=[172.20.29.49])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hMOef-0006md-Tg; Thu, 02 May 2019 21:14:35 -0600
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org, shuah@kernel.org
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-9-brendanhiggins@google.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
Date: Thu, 2 May 2019 21:14:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-9-brendanhiggins@google.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 173.228.226.134
X-SA-Exim-Rcpt-To: wfg@linux.intel.com, rostedt@goodmis.org,
 rientjes@google.com, richard@nod.at, pmladek@suse.com, mpe@ellerman.id.au,
 knut.omang@oracle.com, khilman@baylibre.com, julia.lawall@lip6.fr,
 joel@jms.id.au, jdike@addtoit.com, daniel@ffwll.ch, dan.j.williams@intel.com,
 dan.carpenter@oracle.com, amir73il@gmail.com, Tim.Bird@sony.com,
 Alexander.Levin@microsoft.com, linux-um@lists.infradead.org,
 linux-nvdimm@lists.01.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, shuah@kernel.org, sboyd@kernel.org,
 robh@kernel.org, mcgrof@kernel.org, kieran.bingham@ideasonboard.com,
 keescook@google.com, gregkh@linuxfoundation.org, frowand.list@gmail.com,
 brendanhiggins@google.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 08/17] kunit: test: add support for test abort
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 khilman@baylibre.com, knut.omang@oracle.com, wfg@linux.intel.com,
 joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA1LTAxIDU6MDEgcC5tLiwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ICsvKgo+
ICsgKiBzdHJ1Y3Qga3VuaXRfdHJ5X2NhdGNoIC0gcHJvdmlkZXMgYSBnZW5lcmljIHdheSB0byBy
dW4gY29kZSB3aGljaCBtaWdodCBmYWlsLgo+ICsgKiBAY29udGV4dDogdXNlZCB0byBwYXNzIHVz
ZXIgZGF0YSB0byB0aGUgdHJ5IGFuZCBjYXRjaCBmdW5jdGlvbnMuCj4gKyAqCj4gKyAqIGt1bml0
X3RyeV9jYXRjaCBwcm92aWRlcyBhIGdlbmVyaWMsIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudCB3
YXkgdG8gZXhlY3V0ZQo+ICsgKiBhbiBhcmJpdHJhcnkgZnVuY3Rpb24gb2YgdHlwZSBrdW5pdF90
cnlfY2F0Y2hfZnVuY190IHdoaWNoIG1heSBiYWlsIG91dCBieQo+ICsgKiBjYWxsaW5nIGt1bml0
X3RyeV9jYXRjaF90aHJvdygpLiBJZiBrdW5pdF90cnlfY2F0Y2hfdGhyb3coKSBpcyBjYWxsZWQs
IEB0cnkKPiArICogaXMgc3RvcHBlZCBhdCB0aGUgc2l0ZSBvZiBpbnZvY2F0aW9uIGFuZCBAY2F0
Y2ggaXMgY2F0Y2ggaXMgY2FsbGVkLgoKSSBmb3VuZCBzb21lIG9mIHRoZSBDKysgY29tcGFyaXNv
bnMgaW4gdGhpcyBzZXJpZXMgYSBiaXQgZGlzdGFzdGVmdWwgYnV0Cndhc24ndCBnb2luZyB0byBz
YXkgYW55dGhpbmcgdW50aWwgSSBzYXcgdGhlIHRyeSBjYXRjaC4uLi4gQnV0IGxvb2tpbmcKaW50
byB0aGUgaW1wbGVtZW50YXRpb24gaXQncyBqdXN0IGEgdGhyZWFkIHRoYXQgY2FuIGV4aXQgZWFy
bHkgd2hpY2gKc2VlbXMgZmluZSB0byBtZS4gSnVzdCBhIHBvb3IgY2hvaWNlIG9mIG5hbWUgSSBn
dWVzcy4uLgoKW3NuaXBdCgo+ICtzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGt1bml0X2Fib3J0KHN0
cnVjdCBrdW5pdCAqdGVzdCkKPiArewo+ICsJa3VuaXRfc2V0X2RlYXRoX3Rlc3QodGVzdCwgdHJ1
ZSk7Cj4gKwo+ICsJa3VuaXRfdHJ5X2NhdGNoX3Rocm93KCZ0ZXN0LT50cnlfY2F0Y2gpOwo+ICsK
PiArCS8qCj4gKwkgKiBUaHJvdyBjb3VsZCBub3QgYWJvcnQgZnJvbSB0ZXN0Lgo+ICsJICoKPiAr
CSAqIFhYWDogd2Ugc2hvdWxkIG5ldmVyIHJlYWNoIHRoaXMgbGluZSEgQXMga3VuaXRfdHJ5X2Nh
dGNoX3Rocm93IGlzCj4gKwkgKiBtYXJrZWQgX19ub3JldHVybi4KPiArCSAqLwo+ICsJV0FSTl9P
TkNFKHRydWUsICJUaHJvdyBjb3VsZCBub3QgYWJvcnQgZnJvbSB0ZXN0IVxuIik7Cj4gK30KPiAr
Cj4gIGludCBrdW5pdF9pbml0X3Rlc3Qoc3RydWN0IGt1bml0ICp0ZXN0LCBjb25zdCBjaGFyICpu
YW1lKQo+ICB7Cj4gIAlzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9jayk7Cj4gQEAgLTc3LDYgKzEw
Myw3IEBAIGludCBrdW5pdF9pbml0X3Rlc3Qoc3RydWN0IGt1bml0ICp0ZXN0LCBjb25zdCBjaGFy
ICpuYW1lKQo+ICAJdGVzdC0+bmFtZSA9IG5hbWU7Cj4gIAl0ZXN0LT52cHJpbnRrID0ga3VuaXRf
dnByaW50azsKPiAgCXRlc3QtPmZhaWwgPSBrdW5pdF9mYWlsOwo+ICsJdGVzdC0+YWJvcnQgPSBr
dW5pdF9hYm9ydDsKClRoZXJlIGFyZSBhIG51bWJlciBvZiB0aGVzZSBmdW5jdGlvbiBwb2ludGVy
cyB3aGljaCBzZWVtIHRvIGJlIHBvaW50bGVzcwp0byBtZSBhcyB5b3Ugb25seSBldmVyIHNldCB0
aGVtIHRvIG9uZSBmdW5jdGlvbi4gSnVzdCBjYWxsIHRoZSBmdW5jdGlvbgpkaXJlY3RseS4gQXMg
aXQgaXMsIGl0IGlzIGFuIHVubmVjZXNzYXJ5IGluZGlyZWN0aW9uIGZvciBzb21lb25lIHJlYWRp
bmcKdGhlIGNvZGUuIElmIGFuZCB3aGVuIHlvdSBoYXZlIG11bHRpcGxlIGltcGxlbWVudGF0aW9u
cyBvZiB0aGUgZnVuY3Rpb24KdGhlbiBhZGQgdGhlIHBvaW50ZXIuIERvbid0IGFzc3VtZSB5b3Un
cmUgZ29pbmcgdG8gbmVlZCBpdCBsYXRlciBvbiBhbmQKYWRkIGFsbCB0aGlzIG1haW50ZW5hbmNl
IGJ1cmRlbiBpZiB5b3UgbmV2ZXIgdXNlIGl0Li4KCltzbmlwXQoKPiArdm9pZCBrdW5pdF9nZW5l
cmljX3RyeV9jYXRjaF9pbml0KHN0cnVjdCBrdW5pdF90cnlfY2F0Y2ggKnRyeV9jYXRjaCkKPiAr
ewo+ICsJdHJ5X2NhdGNoLT5ydW4gPSBrdW5pdF9nZW5lcmljX3J1bl90cnlfY2F0Y2g7Cj4gKwl0
cnlfY2F0Y2gtPnRocm93ID0ga3VuaXRfZ2VuZXJpY190aHJvdzsKPiArfQoKU2FtZSBoZXJlLiBU
aGVyZSdzIG9ubHkgb25lIGltcGxlbWVudGF0aW9uIG9mIHRyeV9jYXRjaCBhbmQgSSBjYW4ndApy
ZWFsbHkgc2VlIGFueSBzZW5zaWJsZSBqdXN0aWZpY2F0aW9uIGZvciBhbm90aGVyIGltcGxlbWVu
dGF0aW9uLiBFdmVuCmlmIHRoZXJlIGlzLCBhZGQgdGhlIGluZGlyZWN0aW9uIHdoZW4gdGhlIHNl
Y29uZCBpbXBsZW1lbnRhdGlvbiBpcwphZGRlZC4gVGhpcyBpc24ndCBDKysgYW5kIHdlIGRvbid0
IG5lZWQgdG8gbWFrZSBldmVyeXRoaW5nIGEgIm1ldGhvZCIuCgpUaGFua3MsCgpMb2dhbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
