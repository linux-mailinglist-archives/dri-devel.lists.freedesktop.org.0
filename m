Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B8455ED
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08C38973E;
	Fri, 14 Jun 2019 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87CE989146;
 Thu, 13 Jun 2019 15:46:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35647367;
 Thu, 13 Jun 2019 08:46:01 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA3A53F246;
 Thu, 13 Jun 2019 08:45:55 -0700 (PDT)
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Catalin Marinas <catalin.marinas@arm.com>,
 Dave Martin <Dave.Martin@arm.com>
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
 <20190613111659.GX28398@e103592.cambridge.arm.com>
 <20190613153505.GU28951@C02TF0J2HF1T.local>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <99cc257d-5e99-922a-fbe7-3bbaf3621e38@arm.com>
Date: Thu, 13 Jun 2019 16:45:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613153505.GU28951@C02TF0J2HF1T.local>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, Kostya Serebryany <kcc@google.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Lee Smith <Lee.Smith@arm.com>,
 linux-kselftest@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Dmitry Vyukov <dvyukov@google.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxMy8wNi8yMDE5IDE2OjM1LCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gT24gVGh1LCBK
dW4gMTMsIDIwMTkgYXQgMTI6MTY6NTlQTSArMDEwMCwgRGF2ZSBQIE1hcnRpbiB3cm90ZToKPj4g
T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6NDM6MjBQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPj4+IEZyb206IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5j
b20+Cj4+Pgo+Pj4gSXQgaXMgbm90IGRlc2lyYWJsZSB0byByZWxheCB0aGUgQUJJIHRvIGFsbG93
IHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvCj4+PiB0aGUga2VybmVsIGluZGlzY3JpbWluYXRl
bHkuIFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHByY3RsKCkgaW50ZXJmYWNlCj4+PiBmb3IgZW5h
Ymxpbmcgb3IgZGlzYWJsaW5nIHRoZSB0YWdnZWQgQUJJIHdpdGggYSBnbG9iYWwgc3lzY3RsIGNv
bnRyb2wKPj4+IGZvciBwcmV2ZW50aW5nIGFwcGxpY2F0aW9ucyBmcm9tIGVuYWJsaW5nIHRoZSBy
ZWxheGVkIEFCSSAobWVhbnQgZm9yCj4+PiB0ZXN0aW5nIHVzZXItc3BhY2UgcHJjdGwoKSByZXR1
cm4gZXJyb3IgY2hlY2tpbmcgd2l0aG91dCByZWNvbmZpZ3VyaW5nCj4+PiB0aGUga2VybmVsKS4g
VGhlIEFCSSBwcm9wZXJ0aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0aGUgc2FtZQo+
Pj4gYXBwbGljYXRpb24gYW5kIGZvcmsoKSdlZCBjaGlsZHJlbiBidXQgY2xlYXJlZCBvbiBleGVj
dmUoKS4KPj4+Cj4+PiBUaGUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwgd2lsbCBiZSBleHBhbmRl
ZCBpbiB0aGUgZnV0dXJlIHRvIGhhbmRsZQo+Pj4gTVRFLXNwZWNpZmljIHNldHRpbmdzIGxpa2Ug
aW1wcmVjaXNlIHZzIHByZWNpc2UgZXhjZXB0aW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBD
YXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+Pj4gLS0tCj4+PiAgYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgIHwgIDYgKysrCj4+PiAgYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgIDEgKwo+Pj4gIGFyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oICAgICB8ICAzICstCj4+PiAgYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vz
cy5jICAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gIGluY2x1
ZGUvdWFwaS9saW51eC9wcmN0bC5oICAgICAgICAgICB8ICA1ICsrKwo+Pj4gIGtlcm5lbC9zeXMu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysKPj4+ICA2IGZpbGVzIGNoYW5n
ZWQsIDk3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmgKPj4+IGluZGV4IGZjZDBlNjkxYjFlYS4uZmVlNDU3NDU2YWE4IDEwMDY0
NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+Pj4gKysrIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+Pj4gQEAgLTMwNyw2ICszMDcsMTIg
QEAgZXh0ZXJuIHZvaWQgX19pbml0IG1pbnNpZ3N0a3N6X3NldHVwKHZvaWQpOwo+Pj4gIC8qIFBS
X1BBQ19SRVNFVF9LRVlTIHByY3RsICovCj4+PiAgI2RlZmluZSBQQUNfUkVTRVRfS0VZUyh0c2ss
IGFyZykJcHRyYXV0aF9wcmN0bF9yZXNldF9rZXlzKHRzaywgYXJnKQo+Pj4gIAo+Pj4gKy8qIFBS
X1RBR0dFRF9BRERSIHByY3RsICovCj4+Cj4+IChBIGNvdXBsZSBvZiBjb21tZW50cyBJIG1pc3Nl
ZCBpbiBteSBsYXN0IHJlcGx5OikKPj4KPj4gTmFtZSBtaXNtYXRjaD8KPiAKPiBZZWFoLCBpdCB3
ZW50IHRocm91Z2ggc2V2ZXJhbCBuYW1lcyBidXQgaXQgc2VlbXMgdGhhdCBJIGRpZG4ndCB1cGRh
dGUKPiBhbGwgcGxhY2VzLgo+IAo+Pj4gK2xvbmcgc2V0X3RhZ2dlZF9hZGRyX2N0cmwodW5zaWdu
ZWQgbG9uZyBhcmcpOwo+Pj4gK2xvbmcgZ2V0X3RhZ2dlZF9hZGRyX2N0cmwodm9pZCk7Cj4+PiAr
I2RlZmluZSBTRVRfVEFHR0VEX0FERFJfQ1RSTChhcmcpCXNldF90YWdnZWRfYWRkcl9jdHJsKGFy
ZykKPj4+ICsjZGVmaW5lIEdFVF9UQUdHRURfQUREUl9DVFJMKCkJCWdldF90YWdnZWRfYWRkcl9j
dHJsKCkKPj4+ICsKPj4KPj4gWy4uLl0KPj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tl
cm5lbC9wcm9jZXNzLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPj4+IGluZGV4IDM3
NjdmYjIxYTViOC4uNjlkMGJlMWZjNzA4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9rZXJu
ZWwvcHJvY2Vzcy5jCj4+PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPj4+IEBA
IC0zMCw2ICszMCw3IEBACj4+PiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4gICNpbmNs
dWRlIDxsaW51eC9tbS5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9zdGRkZWYuaD4KPj4+ICsjaW5j
bHVkZSA8bGludXgvc3lzY3RsLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgo+Pj4g
ICNpbmNsdWRlIDxsaW51eC91c2VyLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4+
PiBAQCAtMzIzLDYgKzMyNCw3IEBAIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCj4+PiAgCWZwc2lt
ZF9mbHVzaF90aHJlYWQoKTsKPj4+ICAJdGxzX3RocmVhZF9mbHVzaCgpOwo+Pj4gIAlmbHVzaF9w
dHJhY2VfaHdfYnJlYWtwb2ludChjdXJyZW50KTsKPj4+ICsJY2xlYXJfdGhyZWFkX2ZsYWcoVElG
X1RBR0dFRF9BRERSKTsKPj4+ICB9Cj4+PiAgCj4+PiAgdm9pZCByZWxlYXNlX3RocmVhZChzdHJ1
Y3QgdGFza19zdHJ1Y3QgKmRlYWRfdGFzaykKPj4+IEBAIC01NTIsMyArNTU0LDY4IEBAIHZvaWQg
YXJjaF9zZXR1cF9uZXdfZXhlYyh2b2lkKQo+Pj4gIAo+Pj4gIAlwdHJhdXRoX3RocmVhZF9pbml0
X3VzZXIoY3VycmVudCk7Cj4+PiAgfQo+Pj4gKwo+Pj4gKy8qCj4+PiArICogQ29udHJvbCB0aGUg
cmVsYXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIGludG8gdGhlIGtlcm5l
bC4KPj4+ICsgKi8KPj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IHRhZ2dlZF9hZGRyX3ByY3RsX2Fs
bG93ZWQgPSAxOwo+Pj4gKwo+Pj4gK2xvbmcgc2V0X3RhZ2dlZF9hZGRyX2N0cmwodW5zaWduZWQg
bG9uZyBhcmcpCj4+PiArewo+Pj4gKwlpZiAoIXRhZ2dlZF9hZGRyX3ByY3RsX2FsbG93ZWQpCj4+
PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4KPj4gU28sIHRhZ2dpbmcgY2FuIGFjdHVhbGx5IGJlIGxv
Y2tlZCBvbiBieSBoYXZpbmcgYSBwcm9jZXNzIGVuYWJsZSBpdCBhbmQKPj4gdGhlbiBzb21lIHBv
c3NpYmx5IHVucmVsYXRlZCBwcm9jZXNzIGNsZWFyaW5nIHRhZ2dlZF9hZGRyX3ByY3RsX2FsbG93
ZWQuCj4+IFRoYXQgZmVlbHMgYSBiaXQgd2VpcmQuCj4gCj4gVGhlIHByb2JsZW0gaXMgdGhhdCBp
ZiB5b3UgZGlzYWJsZSB0aGUgQUJJIGdsb2JhbGx5LCBsb3RzIG9mCj4gYXBwbGljYXRpb25zIHdv
dWxkIGNyYXNoLiBUaGlzIHN5c2N0bCBpcyBtZWFudCBhcyBhIHdheSB0byBkaXNhYmxlIHRoZQo+
IG9wdC1pbiB0byB0aGUgVEJJIEFCSS4gQW5vdGhlciBvcHRpb24gd291bGQgYmUgYSBrZXJuZWwg
Y29tbWFuZCBsaW5lCj4gb3B0aW9uIChJJ20gbm90IGtlZW4gb24gYSBLY29uZmlnIG9wdGlvbiku
Cj4KCldoeSB5b3UgYXJlIG5vdCBrZWVuIG9uIGEgS2NvbmZpZyBvcHRpb24/Cgo+PiBEbyB3ZSB3
YW50IHRvIGFsbG93IGEgcHJvY2VzcyB0aGF0IGhhcyB0YWdnaW5nIG9uIHRvIGJlIGFibGUgdG8g
dHVybgo+PiBpdCBvZmYgYXQgYWxsPyAgUG9zc2libHkgdGhpbmdzIGxpa2UgQ1JJVSBtaWdodCB3
YW50IHRvIGRvIHRoYXQuCj4gCj4gSSBsZWZ0IGl0IGluIGZvciBzeW1tZXRyeSBidXQgSSBkb24n
dCBleHBlY3QgaXQgdG8gYmUgdXNlZC4gQSBwb3RlbnRpYWwKPiB1c2UtY2FzZSBpcyBkb2luZyBp
dCBwZXIgc3Vic2VxdWVudCB0aHJlYWRzIGluIGFuIGFwcGxpY2F0aW9uLgo+IAo+Pj4gKwlpZiAo
aXNfY29tcGF0X3Rhc2soKSkKPj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwlpZiAoYXJnICYg
flBSX1RBR0dFRF9BRERSX0VOQUJMRSkKPj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pgo+PiBIb3cg
ZG8gd2UgZXhwZWN0IHRoaXMgYXJndW1lbnQgdG8gYmUgZXh0ZW5kZWQgaW4gdGhlIGZ1dHVyZT8K
PiAKPiBZZXMsIGZvciBNVEUuIFRoYXQncyB3aHkgSSB3b3VsZG4ndCBhbGxvdyByYW5kb20gYml0
cyBoZXJlLgo+IAo+PiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgdGhpcyBpcyByZWFsbHkgYSBiaXRt
YXNrIG9yIGFuIGVudW0sIG9yIGEgbWl4dHVyZQo+PiBvZiB0aGUgdHdvLiAgTWF5YmUgaXQgZG9l
c24ndCBtYXR0ZXIuCj4gCj4gVXNlciBtYXkgd2FudCB0byBzZXQgUFJfVEFHR0VEX0FERFJfRU5B
QkxFIHwgUFJfTVRFX1BSRUNJU0UgaW4gYSBzaW5nbGUKPiBjYWxsLgo+IAo+Pj4gKwlpZiAoYXJn
ICYgUFJfVEFHR0VEX0FERFJfRU5BQkxFKQo+Pj4gKwkJc2V0X3RocmVhZF9mbGFnKFRJRl9UQUdH
RURfQUREUik7Cj4+PiArCWVsc2UKPj4+ICsJCWNsZWFyX3RocmVhZF9mbGFnKFRJRl9UQUdHRURf
QUREUik7Cj4+Cj4+IEkgdGhpbmsgdXBkYXRlX3RocmVhZF9mbGFnKCkgY291bGQgYmUgdXNlZCBo
ZXJlLgo+IAo+IFllcy4gSSBmb3Jnb3QgeW91IGFkZGVkIHRoaXMuCj4gCgotLSAKUmVnYXJkcywK
VmluY2Vuem8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
