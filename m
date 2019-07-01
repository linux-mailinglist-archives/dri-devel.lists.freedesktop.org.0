Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E310E5C4A5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388C89B99;
	Mon,  1 Jul 2019 20:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48938991D;
 Mon,  1 Jul 2019 10:29:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F12CD6021C; Mon,  1 Jul 2019 10:29:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 3C7896021C;
 Mon,  1 Jul 2019 10:29:14 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 01 Jul 2019 15:59:13 +0530
From: dhar@codeaurora.org
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
In-Reply-To: <627144af54459a203f1583d2ad9b390c@codeaurora.org>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
 <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
 <d61d7805b4ac0ec45309bf5b65841262@codeaurora.org>
 <627144af54459a203f1583d2ad9b390c@codeaurora.org>
Message-ID: <ea91c2c49d73af79bd6eea93a6d00a5a@codeaurora.org>
X-Sender: dhar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561976958;
 bh=cWSqOAbfEz0WFf4XUVNLEBEC9uRW9zO4ucQFc7vzM00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BpmGLi0qB2qa72xnMOimQyD+goNRVzKGe0NA439gg7axGrT59j5GytxIO5mgqhaXW
 DgeV5m9pSieZKd3B1CTfWXXbU+eNuTUJcdAqtQFN/BcvH6AMhEvkFsVR7z9a93FMfT
 QVGXiW2Cvdt2p0gpoRTPp6KXO+Hc4yqFbQN88ptk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561976955;
 bh=cWSqOAbfEz0WFf4XUVNLEBEC9uRW9zO4ucQFc7vzM00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SSn//CNdAEi+Df+wdQhcfXAiJXSvCVN2iSNFav/O7aqFuchgwHQfZH/pkp7ttFN8x
 ZO+0JX0GlQpFX9cK/UfhTEZxMQxEOCahs6VXyZO0s5TT6NBtwRKY+7PND4UxFFIAOD
 bar+dR4pacKtEnIOcJFVaZz2L37gQcyRsD/bVMAk=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jshekhar@codeaurora.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org,
 chandanu@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0yNiAwMzoxMCwgSmV5a3VtYXIgU2Fua2FyYW4gd3JvdGU6Cj4gT24gMjAxOS0w
Ni0yNCAyMjo0NCwgZGhhckBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAxOS0wNi0yNSAw
Mzo1NiwgSmV5a3VtYXIgU2Fua2FyYW4gd3JvdGU6Cj4+PiBPbiAyMDE5LTA2LTIzIDIzOjI3LCBT
aHViaGFzaHJlZSBEaGFyIHdyb3RlOgo+Pj4+IGRwdSBlbmNvZGVyIHNwaW5sb2NrIHNob3VsZCBi
ZSBpbml0aWFsaXplZCBkdXJpbmcgZHB1IGVuY29kZXIKPj4+PiBpbml0IGluc3RlYWQgb2YgZHB1
IGVuY29kZXIgc2V0dXAgd2hpY2ggaXMgcGFydCBvZiBjb21taXQuCj4+Pj4gVGhlcmUgYXJlIGNo
YW5jZXMgdGhhdCB2YmxhbmsgY29udHJvbCB1c2VzIHRoZSB1bmluaXRpYWxpemVkCj4+Pj4gc3Bp
bmxvY2sgaWYgbm90IGluaXRpYWxpemVkIGR1cmluZyBlbmNvZGVyIGluaXQuCj4+PiBOb3QgbXVj
aCBjYW4gYmUgZG9uZSBpZiBzb21lb25lIGlzIHBlcmZvcm1pbmcgYSB2Ymxhbmsgb3BlcmF0aW9u
Cj4+PiBiZWZvcmUgZW5jb2Rlcl9zZXR1cCBpcyBkb25lLgo+Pj4gQ2FuIHlvdSBwb2ludCB0byB0
aGUgcGF0aCB3aGVyZSB0aGlzIGxvY2sgaXMgYWNxdWlyZWQgYmVmb3JlCj4+PiB0aGUgZW5jb2Rl
cl9zZXR1cD8KPj4+IAo+Pj4gVGhhbmtzCj4+PiBKZXlrdW1hciBTLgo+Pj4+IAo+PiAKPj4gV2hl
biBydW5uaW5nIHNvbWUgZHAgdXNlY2FzZSwgd2UgYXJlIGhpdHRpbmcgdGhpcyBjYWxsc3RhY2su
Cj4+IAo+PiBQcm9jZXNzIGt3b3JrZXIvdTE2OjggKHBpZDogMjE1LCBzdGFjayBsaW1pdCA9IDB4
MDAwMDAwMDBkZjlkZDkzMCkKPj4gQ2FsbCB0cmFjZToKPj4gIHNwaW5fZHVtcCsweDg0LzB4OGMK
Pj4gIHNwaW5fZHVtcCsweDAvMHg4Ywo+PiAgZG9fcmF3X3NwaW5fbG9jaysweDgwLzB4YjAKPj4g
IF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHgzNC8weDQ0Cj4+ICBkcHVfZW5jb2Rlcl90b2dnbGVf
dmJsYW5rX2Zvcl9jcnRjKzB4OGMvMHhlOAo+PiAgZHB1X2NydGNfdmJsYW5rKzB4MTY4LzB4MWEw
Cj4+ICBkcHVfa21zX2VuYWJsZV92YmxhbmsrMFsgICAxMS42NDg5OThdICB2YmxhbmtfY3RybF93
b3JrZXIrMHgzYy8weDYwCj4+ICBwcm9jZXNzX29uZV93b3JrKzB4MTZjLzB4MmQ4Cj4+ICB3b3Jr
ZXJfdGhyZWFkKzB4MWQ4LzB4MmIwCj4+ICBrdGhyZWFkKzB4MTI0LzB4MTM0Cj4+IAo+PiBMb29r
cyBsaWtlIHZibGFuayBpcyBnZXR0aW5nIGVuYWJsZWQgZWFybGllciBjYXVzaW5nIHRoaXMgaXNz
dWUgYW5kIHdlCj4+IGFyZSB1c2luZyB0aGUgc3BpbmxvY2sgd2l0aG91dCBpbml0aWFsaXppbmcg
aXQuCj4+IAo+PiBUaGFua3MsCj4+IFNodWJoYXNocmVlCj4+IAo+IERQIGNhbGxzIGludG8gc2V0
X2VuY29kZXJfbW9kZSBkdXJpbmcgaG90cGx1ZyBiZWZvcmUgZXZlbiBub3RpZnlpbmcgdGhlCj4g
dS9zLiBDYW4geW91IHRyYWNlIG91dCB0aGUgb3JpZ2luYWwgY2FsbGVyIG9mIHRoaXMgc3RhY2s/
Cj4gCj4gRXZlbiB0aG91Z2ggdGhlIHBhdGNoIGlzIGhhcm1sZXNzLCBJIGFtIG5vdCBlbnRpcmVs
eSBjb252aW5jZWQgdG8gbW92ZSAKPiB0aGlzCj4gaW5pdGlhbGl6YXRpb24uIEFueSBjYWxsIHdo
aWNoIGFjcXVpcmVzIHRoZSBsb2NrIGJlZm9yZSBlbmNvZGVyX3NldHVwCj4gd2lsbCBiZSBhIG5v
LW9wIHNpbmNlIHRoZXJlIHdpbGwgbm90IGJlIGFueSBwaHlzaWNhbCBlbmNvZGVyIHRvIHdvcmsg
Cj4gd2l0aC4KPiAKPiBUaGFua3MgYW5kIFJlZ2FyZHMsCj4gSmV5a3VtYXIgUy4KPiAKPj4+PiBD
aGFuZ2UtSWQ6IEk1YTE4Yjk1ZmE0NzM5N2M4MzRhMjY2YjIyYWJmMzNhNTE3YjAzYTRlCj4+Pj4g
U2lnbmVkLW9mZi1ieTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9yZz4KPj4+
PiAtLS0KPj4+PiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8
IDMgKy0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXIuYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXIuYwo+Pj4+IGluZGV4IDVmMDg1YjUuLjIyOTM4YzcgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+Pj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPj4+PiBAQCAtMjE5NSw4ICsy
MTk1LDYgQEAgaW50IGRwdV9lbmNvZGVyX3NldHVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIAo+
Pj4+IHN0cnVjdAo+Pj4+IGRybV9lbmNvZGVyICplbmMsCj4+Pj4gIAlpZiAocmV0KQo+Pj4+ICAJ
CWdvdG8gZmFpbDsKPj4+PiAKPj4+PiAtCXNwaW5fbG9ja19pbml0KCZkcHVfZW5jLT5lbmNfc3Bp
bmxvY2spOwo+Pj4+IC0KPj4+PiAgCWF0b21pY19zZXQoJmRwdV9lbmMtPmZyYW1lX2RvbmVfdGlt
ZW91dCwgMCk7Cj4+Pj4gIAl0aW1lcl9zZXR1cCgmZHB1X2VuYy0+ZnJhbWVfZG9uZV90aW1lciwK
Pj4+PiAgCQkJZHB1X2VuY29kZXJfZnJhbWVfZG9uZV90aW1lb3V0LCAwKTsKPj4+PiBAQCAtMjI1
MCw2ICsyMjQ4LDcgQEAgc3RydWN0IGRybV9lbmNvZGVyICpkcHVfZW5jb2Rlcl9pbml0KHN0cnVj
dAo+Pj4+IGRybV9kZXZpY2UgKmRldiwKPj4+PiAKPj4+PiAgCWRybV9lbmNvZGVyX2hlbHBlcl9h
ZGQoJmRwdV9lbmMtPmJhc2UsICZkcHVfZW5jb2Rlcl9oZWxwZXJfZnVuY3MpOwo+Pj4+IAo+Pj4+
ICsJc3Bpbl9sb2NrX2luaXQoJmRwdV9lbmMtPmVuY19zcGlubG9jayk7Cj4+Pj4gIAlkcHVfZW5j
LT5lbmFibGVkID0gZmFsc2U7Cj4+Pj4gCj4+Pj4gIAlyZXR1cm4gJmRwdV9lbmMtPmJhc2U7CgpJ
biBkcHVfY3J0Y192YmxhbmsoKSwgd2UgYXJlIGxvb3BpbmcgdGhyb3VnaCBhbGwgdGhlIGVuY29k
ZXJzIGluIHRoZSAKcHJlc2VudCBtb2RlX2NvbmZpZzogCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2
YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
Y3J0Yy5jI0wxMDgyCmFuZCBoZW5jZSBjYWxsaW5nIGRwdV9lbmNvZGVyX3RvZ2dsZV92Ymxhbmtf
Zm9yX2NydGMoKSBmb3IgYWxsIHRoZSAKZW5jb2RlcnMuIEJ1dCBpbiBkcHVfZW5jb2Rlcl90b2dn
bGVfdmJsYW5rX2Zvcl9jcnRjKCksIGFmdGVyIGFjcXVpcmluZyAKdGhlIHNwaW5sb2NrLCB3ZSB3
aWxsIGRvIGEgZWFybHkgcmV0dXJuIGZvcgp0aGUgZW5jb2RlcnMgd2hpY2ggYXJlIG5vdCBjdXJy
ZW50bHkgYXNzaWduZWQgdG8gb3VyIGNydGM6IApodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXIuYyNMMTMxOC4KU2luY2UgdGhlIGVuY29kZXJfc2V0dXAgZm9yIHRoZSBzZWNvbmRhcnkgZW5j
b2RlcihkcCBlbmNvZGVyIGluIHRoaXMgCmNhc2UpIGlzIG5vdCBjYWxsZWQgdW50aWwgZHAgaG90
cGx1Zywgd2UgYXJlIGhpdHRpbmcga2VybmVsIHBhbmljIHdoaWxlIAphY3F1aXJpbmcgdGhlIGxv
Y2suCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
