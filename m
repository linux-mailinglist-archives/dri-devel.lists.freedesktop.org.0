Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8C1CEDBE
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556746E860;
	Tue, 12 May 2020 07:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6382B6E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 05:13:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589260425; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vnJZoIczJd+Nx4ZHUh2bb/pAfZ5qGHf3HGR3EAiVMWY=;
 b=S+by9CzYDTXaBkKT2flO6t+mWvjmP2/JI2fvPMkLC3stF9M7xXcVLNfROr6i2hJrL3fqdBsK
 5PaLIxcgWN6PO3Yyy4r3+oTRMtjyJ1qLFhOqLkjMrIgjy6vlt8C5BpvF/va8fQdTSmV/eIos
 H7qaosjdIlZWgXzcr/jEeFWs4Y0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba307f.7fa7c032ef48-smtp-out-n03;
 Tue, 12 May 2020 05:13:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 13A02C433F2; Tue, 12 May 2020 05:13:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.83.139.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: charante)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D635C433CB;
 Tue, 12 May 2020 05:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D635C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=charante@codeaurora.org
Subject: Re: [PATCH] dma-buf: fix use-after-free in dmabuffs_dname
To: Greg KH <gregkh@linuxfoundation.org>
References: <1588060442-28638-1-git-send-email-charante@codeaurora.org>
 <20200505100806.GA4177627@kroah.com>
 <8424b2ac-3ea6-6e5b-b99c-951a569f493d@codeaurora.org>
 <20200506090002.GA2619587@kroah.com>
From: Charan Teja Kalla <charante@codeaurora.org>
Message-ID: <3bc8dd81-f298-aea0-f218-2e2ef12ca603@codeaurora.org>
Date: Tue, 12 May 2020 10:43:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506090002.GA2619587@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: fengc@google.com, linux-kernel@vger.kernel.org, ghackmann@google.com,
 linaro-mm-sig@lists.linaro.org, vinmenon@codeaurora.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClRoYW5rIHlvdSBHcmVnIGZvciB0aGUgY29tbWVudHMuCgpPbiA1LzYvMjAyMCAyOjMwIFBNLCBH
cmVnIEtIIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDA2LCAyMDIwIGF0IDAyOjAwOjEwUE0gKzA1MzAs
IENoYXJhbiBUZWphIEthbGxhIHdyb3RlOgo+PiBUaGFuayB5b3UgR3JlZyBmb3IgdGhlIHJlcGx5
Lgo+Pgo+PiBPbiA1LzUvMjAyMCAzOjM4IFBNLCBHcmVnIEtIIHdyb3RlOgo+Pj4gT24gVHVlLCBB
cHIgMjgsIDIwMjAgYXQgMDE6MjQ6MDJQTSArMDUzMCwgQ2hhcmFuIFRlamEgUmVkZHkgd3JvdGU6
Cj4+Pj4gVGhlIGZvbGxvd2luZyByYWNlIG9jY3VycyB3aGlsZSBhY2Nlc3NpbmcgdGhlIGRtYWJ1
ZiBvYmplY3QgZXhwb3J0ZWQgYXMKPj4+PiBmaWxlOgo+Pj4+IFAxCQkJCVAyCj4+Pj4gZG1hX2J1
Zl9yZWxlYXNlKCkgICAgICAgICAgZG1hYnVmZnNfZG5hbWUoKQo+Pj4+IAkJCSAgIFtzYXkgbHNv
ZiByZWFkaW5nIC9wcm9jLzxQMSBwaWQ+L2ZkLzxudW0+XQo+Pj4+Cj4+Pj4gCQkJICAgcmVhZCBk
bWFidWYgc3RvcmVkIGluIGRlbnRyeS0+ZnNkYXRhCj4+Pj4gRnJlZSB0aGUgZG1hYnVmIG9iamVj
dAo+Pj4+IAkJCSAgIFN0YXJ0IGFjY2Vzc2luZyB0aGUgZG1hYnVmIHN0cnVjdHVyZQo+Pj4+Cj4+
Pj4gSW4gdGhlIGFib3ZlIGRlc2NyaXB0aW9uLCB0aGUgZG1hYnVmIG9iamVjdCBmcmVlZCBpbiBQ
MSBpcyBiZWluZwo+Pj4+IGFjY2Vzc2VkIGZyb20gUDIgd2hpY2ggaXMgcmVzdWx0aW5nIGludG8g
dGhlIHVzZS1hZnRlci1mcmVlLiBCZWxvdyBpcwo+Pj4+IHRoZSBkdW1wIHN0YWNrIHJlcG9ydGVk
Lgo+Pj4+Cj4+Pj4gQ2FsbCBUcmFjZToKPj4+PiAgICBrYXNhbl9yZXBvcnQrMHgxMi8weDIwCj4+
Pj4gICAgX19hc2FuX3JlcG9ydF9sb2FkOF9ub2Fib3J0KzB4MTQvMHgyMAo+Pj4+ICAgIGRtYWJ1
ZmZzX2RuYW1lKzB4NGY0LzB4NTYwCj4+Pj4gICAgdG9tb3lvX3JlYWxwYXRoX2Zyb21fcGF0aCsw
eDE2NS8weDY2MAo+Pj4+ICAgIHRvbW95b19nZXRfcmVhbHBhdGgKPj4+PiAgICB0b21veW9fY2hl
Y2tfb3Blbl9wZXJtaXNzaW9uKzB4MmEzLzB4M2UwCj4+Pj4gICAgdG9tb3lvX2ZpbGVfb3Blbgo+
Pj4+ICAgIHRvbW95b19maWxlX29wZW4rMHhhOS8weGQwCj4+Pj4gICAgc2VjdXJpdHlfZmlsZV9v
cGVuKzB4NzEvMHgzMDAKPj4+PiAgICBkb19kZW50cnlfb3BlbisweDM3YS8weDEzODAKPj4+PiAg
ICB2ZnNfb3BlbisweGEwLzB4ZDAKPj4+PiAgICBwYXRoX29wZW5hdCsweDEyZWUvMHgzNDkwCj4+
Pj4gICAgZG9fZmlscF9vcGVuKzB4MTkyLzB4MjYwCj4+Pj4gICAgZG9fc3lzX29wZW5hdDIrMHg1
ZWIvMHg3ZTAKPj4+PiAgICBkb19zeXNfb3BlbisweGYyLzB4MTgwCj4+Pj4KPj4+PiBGaXhlczog
YmIyYmI5MCAoImRtYS1idWY6IGFkZCBETUFfQlVGX1NFVF9OQU1FIGlvY3RscyIpCj4+PiBOaXQs
IHBsZWFzZSByZWFkIHRoZSBkb2N1bWVudGF0aW9uIGZvciBob3cgdG8gZG8gYSBGaXhlczogbGlu
ZSBwcm9wZXJseSwKPj4+IHlvdSBuZWVkIG1vcmUgZGlnaXRzOgo+Pj4gCUZpeGVzOiBiYjJiYjkw
MzA0MjUgKCJkbWEtYnVmOiBhZGQgRE1BX0JVRl9TRVRfTkFNRSBpb2N0bHMiKQo+Pgo+PiBXaWxs
IHVwZGF0ZSB0aGUgcGF0Y2gKPj4KPj4KPj4+PiBSZXBvcnRlZC1ieTpzeXpib3QrMzY0M2ExODgz
NmJjZTU1NWJmZjZAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoYXJhbiBUZWphIFJlZGR5PGNoYXJhbnRlQGNvZGVhdXJvcmEub3JnPgo+Pj4gQWxzbywgYW55
IHJlYXNvbiB5b3UgZGlkbid0IGluY2x1ZGUgdGhlIG90aGVyIG1haWxpbmcgbGlzdHMgdGhhdAo+
Pj4gZ2V0X21haW50YWluZXIucGwgc2FpZCB0bz8KPj4KPj4gUmVhbGx5IHNvcnJ5IGZvciBub3Qg
c2VuZGluZyB0byBjb21wbGV0ZSBsaXN0LiBBZGRlZCBub3cuCj4+Cj4+Cj4+PiBBbmQgZmluYWxs
eSwgbm8gY2M6IHN0YWJsZSBpbiB0aGUgcy1vLWIgYXJlYSBmb3IgYW4gaXNzdWUgdGhhdCBuZWVk
cyB0bwo+Pj4gYmUgYmFja3BvcnRlZCB0byBvbGRlciBrZXJuZWxzPwo+Pgo+PiBXaWxsIHVwZGF0
ZSB0aGUgcGF0Y2guCj4+Cj4+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9kbWEtYnVmL2RtYS1i
dWYuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrLS0KPj4+PiAgICBpbmNsdWRlL2xpbnV4
L2RtYS1idWYuaCAgIHwgIDEgKwo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+Pj4+IGluZGV4IDU3MGM5
MjMuLjA2OWQ4Zjc4IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMK
Pj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4+Pj4gQEAgLTI1LDYgKzI1LDcg
QEAKPj4+PiAgICAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4+PiAgICAjaW5jbHVkZSA8bGludXgv
bW91bnQuaD4KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvcHNldWRvX2ZzLmg+Cj4+Pj4gKyNpbmNs
dWRlIDxsaW51eC9kY2FjaGUuaD4KPj4+PiAgICAjaW5jbHVkZSA8dWFwaS9saW51eC9kbWEtYnVm
Lmg+Cj4+Pj4gICAgI2luY2x1ZGUgPHVhcGkvbGludXgvbWFnaWMuaD4KPj4+PiBAQCAtMzgsMTgg
KzM5LDM0IEBAIHN0cnVjdCBkbWFfYnVmX2xpc3Qgewo+Pj4+ICAgIHN0YXRpYyBzdHJ1Y3QgZG1h
X2J1Zl9saXN0IGRiX2xpc3Q7Cj4+Pj4gK3N0YXRpYyB2b2lkIGRtYWJ1Zl9kZW50X3B1dChzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmKQo+Pj4+ICt7Cj4+Pj4gKwlpZiAoYXRvbWljX2RlY19hbmRfdGVz
dCgmZG1hYnVmLT5kZW50X2NvdW50KSkgewo+Pj4+ICsJCWtmcmVlKGRtYWJ1Zi0+bmFtZSk7Cj4+
Pj4gKwkJa2ZyZWUoZG1hYnVmKTsKPj4+PiArCX0KPj4+IFdoeSBub3QganVzdCB1c2UgYSBrcmVm
IGluc3RlYWQgb2YgYW4gb3Blbi1jb2RlZCBhdG9taWMgdmFsdWU/Cj4+Cj4+IEtyZWYgYXBwcm9h
Y2ggbG9va3MgY2xlYW5lci4gd2lsbCB1cGRhdGUgdGhlIHBhdGNoIGFjY29yZGluZ2x5Lgo+Pgo+
Pgo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICAgIHN0YXRpYyBjaGFyICpkbWFidWZmc19kbmFtZShzdHJ1
Y3QgZGVudHJ5ICpkZW50cnksIGNoYXIgKmJ1ZmZlciwgaW50IGJ1ZmxlbikKPj4+PiAgICB7Cj4+
Pj4gICAgCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7Cj4+Pj4gICAgCWNoYXIgbmFtZVtETUFfQlVG
X05BTUVfTEVOXTsKPj4+PiAgICAJc2l6ZV90IHJldCA9IDA7Cj4+Pj4gKwlzcGluX2xvY2soJmRl
bnRyeS0+ZF9sb2NrKTsKPj4+PiAgICAJZG1hYnVmID0gZGVudHJ5LT5kX2ZzZGF0YTsKPj4+PiAr
CWlmICghZG1hYnVmIHx8ICFhdG9taWNfYWRkX3VubGVzcygmZG1hYnVmLT5kZW50X2NvdW50LCAx
LCAwKSkgewo+Pj4+ICsJCXNwaW5fdW5sb2NrKCZkZW50cnktPmRfbG9jayk7Cj4+Pj4gKwkJZ290
byBvdXQ7Cj4+PiBIb3cgY2FuIGRtYWJ1ZiBub3QgYmUgdmFsaWQgaGVyZT8KPj4+Cj4+PiBBbmQg
aXNuJ3QgdGhlcmUgYWxyZWFkeSBhIHVzZWNvdW50IGZvciB0aGUgYnVmZmVyPwo+Pgo+PiBkbWFi
dWYgZXhwb3J0ZWQgYXMgZmlsZSBzaW1wbHkgcmVsaWVzIG9uIHRoYXQgZmlsZSdzIHJlZmNvdW50
LCB0aHVzIGZwdXQoKQo+PiByZWxlYXNlcyB0aGUgZG1hYnVmLgo+Pgo+PiBXZSBhcmUgc3Rvcmlu
ZyB0aGUgZG1hYnVmIGluIHRoZSBkZW50cnktPmRfZnNkYXRhIGJ1dCB0aGVyZSBpcyBubyBiaW5k
aW5nCj4+IGJldHdlZW4gdGhlIGRlbnRyeSBhbmQgdGhlIGRtYWJ1Zi4gU28sIGZsb3cgd2lsbCBi
ZSBsaWtlCj4+Cj4+IDEpIFAxIGNhbGxzIGZwdXQoZG1hYnVmX2ZkKQo+Pgo+PiAyKSBQMiB0cnlp
bmcgdG8gYWNjZXNzIHRoZSBmaWxlIGluZm9ybWF0aW9uIG9mIFAxLgo+PiAgwqDCoMKgIEVnOiBs
c29mIGNvbW1hbmQgdHJ5aW5nIHRvIGxpc3Qgb3V0IHRoZSBkbWFidWZfZmQgaW5mb3JtYXRpb24g
dXNpbmcKPj4gL3Byb2MvPFAxIHBpZD4vZmQvZG1hYnVmX2ZkCj4+Cj4+IDMpIFAxIGNhbGxzIHRo
ZSBmaWxlLT5mX29wLT5yZWxlYXNlKGRtYWJ1Zl9mZF9maWxlKShlbmRzIHVwIGluIGNhbGxpbmcK
Pj4gZG1hX2J1Zl9yZWxlYXNlKCkpLMKgwqAgdGh1cyBmcmVlcyB1cCB0aGUgZG1hYnVmIGJ1ZmZl
ci4KPj4KPj4gNCkgUDIgYWNjZXNzIHRoZSBkbWFidWYgc3RvcmVkIGluIHRoZSBkZW50cnktPmRf
ZnNkYXRhIHdoaWNoIHdhcyBmcmVlZCBpbgo+PiBzdGVwIDMuCj4+Cj4+IFNvIHdlIG5lZWQgdG8g
aGF2ZSBzb21lIHJlZmNvdW50IG1lY2hhbmlzbSB0byBhdm9pZCB0aGUgdXNlLWFmdGVyLWZyZWUg
aW4KPj4gc3RlcCA0Lgo+IE9rLCBidXQgd2F0Y2ggb3V0LCBub3cgeW91IGhhdmUgMiBkaWZmZXJl
bnQgcmVmZXJlbmNlIGNvdW50cyBmb3IgdGhlCj4gc2FtZSBzdHJ1Y3R1cmUuICBLZWVwaW5nIHRo
ZW0gY29vcmRpbmF0ZWQgaXMgYWxtb3N0IGFsd2F5cyBhbiBpbXBvc3NpYmxlCj4gdGFzayBzbyB5
b3UgbmVlZCB0byBvbmx5IHJlbHkgb24gb25lLiAgSWYgeW91IGNhbid0IHVzZSB0aGUgZmlsZSBh
cGksCj4ganVzdCBkcm9wIGFsbCBvZiB0aGUgcmVmZXJlbmNlIGNvdW50aW5nIGxvZ2ljIGluIHRo
ZXJlIGFuZCBvbmx5IHVzZSB0aGUKPiBrcmVmIG9uZS4KCkkgZmVlbCB0aGF0IGNoYW5naW5nIHRo
ZSByZWZjb3VudCBsb2dpYyBub3cgdG8gZG1hLWJ1ZiBvYmplY3RzIGludm9sdmUgCmNoYW5nZXMg
aW4KCnRoZSBjb3JlIGRtYS1idWYgZnJhbWV3b3JrLiBOTz8gSW5zdGVhZCwgaG93IGFib3V0IHBh
c3NpbmcgdGhlIHVzZXIgCnBhc3NlZCBuYW1lIGRpcmVjdGx5CgppbiB0aGUgLT5kX2ZzZGF0YSBp
bnBsYWNlIG9mIGRtYWJ1ZiBvYmplY3Q/IEJlY2F1c2Ugd2UganVzdCBuZWVkIHVzZXIgCnBhc3Nl
ZCBuYW1lIGluIHRoZQoKZG1hYnVmZnNfZG5hbWUoKS4gV2l0aCB0aGlzIHdlIGNhbiBhdm9pZCB0
aGUgbmVlZCBmb3IgZXh0cmEgcmVmY291bnQgb24gCmRtYWJ1Zi4KClBvc3RlZCBwYXRjaC1WMjog
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNS84LzE1OAoKCj4KPiBnb29kIGx1Y2shCj4KPiBn
cmVnIGstaAoKLS0gClRoZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1l
bWJlciBvZiB0aGUgQ29kZSBBdXJvcmEgRm9ydW0sIGEgTGludXggRm91bmRhdGlvbiBDb2xsYWJv
cmF0aXZlIFByb2plY3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
