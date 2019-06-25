Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39755A19
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBBD6E194;
	Tue, 25 Jun 2019 21:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762E6E194;
 Tue, 25 Jun 2019 21:40:13 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 66AFE609CD; Tue, 25 Jun 2019 21:40:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id C40BD6025A;
 Tue, 25 Jun 2019 21:40:12 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 Jun 2019 14:40:12 -0700
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: dhar@codeaurora.org
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
In-Reply-To: <d61d7805b4ac0ec45309bf5b65841262@codeaurora.org>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
 <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
 <d61d7805b4ac0ec45309bf5b65841262@codeaurora.org>
Message-ID: <627144af54459a203f1583d2ad9b390c@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561498813;
 bh=bLNbB/wHffe8tnD85S1I4XRP7Q8LNOpQNbcN6gnQHik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KNV+IWEtx26RrBF2mjrL8FZ5sEEC0fUDdkQg+qcuU7zB5TUU5fD/DIjDROLdf2+Ul
 8W+5VAYv+3N0wmwIpQnjlYziBuGG/2ORJMYQAZbosQNu7i3FLl8fj+HX/VhldQ+stV
 AoQCOWtZtmLMZsouABavCFmztfLHd5fKUoac18Jg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561498812;
 bh=bLNbB/wHffe8tnD85S1I4XRP7Q8LNOpQNbcN6gnQHik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HVzO5XMGrkRQ9N+4jkM5KWi2oBHxPEqbkeGaXyjuaK+P06Fj5uZcSTpB91Jo8liS2
 yyLiarSH2HrghFlaAgAigZVBtxpNOLvVao936C4NfPatY69IIKunaeCDRrbia1wyk0
 tjO1H84806DCkaMVBdSRrMFLRpoIgO5RoI5jORKE=
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

T24gMjAxOS0wNi0yNCAyMjo0NCwgZGhhckBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPiBPbiAyMDE5
LTA2LTI1IDAzOjU2LCBKZXlrdW1hciBTYW5rYXJhbiB3cm90ZToKPj4gT24gMjAxOS0wNi0yMyAy
MzoyNywgU2h1Ymhhc2hyZWUgRGhhciB3cm90ZToKPj4+IGRwdSBlbmNvZGVyIHNwaW5sb2NrIHNo
b3VsZCBiZSBpbml0aWFsaXplZCBkdXJpbmcgZHB1IGVuY29kZXIKPj4+IGluaXQgaW5zdGVhZCBv
ZiBkcHUgZW5jb2RlciBzZXR1cCB3aGljaCBpcyBwYXJ0IG9mIGNvbW1pdC4KPj4+IFRoZXJlIGFy
ZSBjaGFuY2VzIHRoYXQgdmJsYW5rIGNvbnRyb2wgdXNlcyB0aGUgdW5pbml0aWFsaXplZAo+Pj4g
c3BpbmxvY2sgaWYgbm90IGluaXRpYWxpemVkIGR1cmluZyBlbmNvZGVyIGluaXQuCj4+IE5vdCBt
dWNoIGNhbiBiZSBkb25lIGlmIHNvbWVvbmUgaXMgcGVyZm9ybWluZyBhIHZibGFuayBvcGVyYXRp
b24KPj4gYmVmb3JlIGVuY29kZXJfc2V0dXAgaXMgZG9uZS4KPj4gQ2FuIHlvdSBwb2ludCB0byB0
aGUgcGF0aCB3aGVyZSB0aGlzIGxvY2sgaXMgYWNxdWlyZWQgYmVmb3JlCj4+IHRoZSBlbmNvZGVy
X3NldHVwPwo+PiAKPj4gVGhhbmtzCj4+IEpleWt1bWFyIFMuCj4+PiAKPiAKPiBXaGVuIHJ1bm5p
bmcgc29tZSBkcCB1c2VjYXNlLCB3ZSBhcmUgaGl0dGluZyB0aGlzIGNhbGxzdGFjay4KPiAKPiBQ
cm9jZXNzIGt3b3JrZXIvdTE2OjggKHBpZDogMjE1LCBzdGFjayBsaW1pdCA9IDB4MDAwMDAwMDBk
ZjlkZDkzMCkKPiBDYWxsIHRyYWNlOgo+ICBzcGluX2R1bXArMHg4NC8weDhjCj4gIHNwaW5fZHVt
cCsweDAvMHg4Ywo+ICBkb19yYXdfc3Bpbl9sb2NrKzB4ODAvMHhiMAo+ICBfcmF3X3NwaW5fbG9j
a19pcnFzYXZlKzB4MzQvMHg0NAo+ICBkcHVfZW5jb2Rlcl90b2dnbGVfdmJsYW5rX2Zvcl9jcnRj
KzB4OGMvMHhlOAo+ICBkcHVfY3J0Y192YmxhbmsrMHgxNjgvMHgxYTAKPiAgZHB1X2ttc19lbmFi
bGVfdmJsYW5rKzBbICAgMTEuNjQ4OTk4XSAgdmJsYW5rX2N0cmxfd29ya2VyKzB4M2MvMHg2MAo+
ICBwcm9jZXNzX29uZV93b3JrKzB4MTZjLzB4MmQ4Cj4gIHdvcmtlcl90aHJlYWQrMHgxZDgvMHgy
YjAKPiAga3RocmVhZCsweDEyNC8weDEzNAo+IAo+IExvb2tzIGxpa2UgdmJsYW5rIGlzIGdldHRp
bmcgZW5hYmxlZCBlYXJsaWVyIGNhdXNpbmcgdGhpcyBpc3N1ZSBhbmQgd2UKPiBhcmUgdXNpbmcg
dGhlIHNwaW5sb2NrIHdpdGhvdXQgaW5pdGlhbGl6aW5nIGl0Lgo+IAo+IFRoYW5rcywKPiBTaHVi
aGFzaHJlZQo+IApEUCBjYWxscyBpbnRvIHNldF9lbmNvZGVyX21vZGUgZHVyaW5nIGhvdHBsdWcg
YmVmb3JlIGV2ZW4gbm90aWZ5aW5nIHRoZQp1L3MuIENhbiB5b3UgdHJhY2Ugb3V0IHRoZSBvcmln
aW5hbCBjYWxsZXIgb2YgdGhpcyBzdGFjaz8KCkV2ZW4gdGhvdWdoIHRoZSBwYXRjaCBpcyBoYXJt
bGVzcywgSSBhbSBub3QgZW50aXJlbHkgY29udmluY2VkIHRvIG1vdmUgCnRoaXMKaW5pdGlhbGl6
YXRpb24uIEFueSBjYWxsIHdoaWNoIGFjcXVpcmVzIHRoZSBsb2NrIGJlZm9yZSBlbmNvZGVyX3Nl
dHVwCndpbGwgYmUgYSBuby1vcCBzaW5jZSB0aGVyZSB3aWxsIG5vdCBiZSBhbnkgcGh5c2ljYWwg
ZW5jb2RlciB0byB3b3JrIAp3aXRoLgoKVGhhbmtzIGFuZCBSZWdhcmRzLApKZXlrdW1hciBTLgoK
Pj4+IENoYW5nZS1JZDogSTVhMThiOTVmYTQ3Mzk3YzgzNGEyNjZiMjJhYmYzM2E1MTdiMDNhNGUK
Pj4+IFNpZ25lZC1vZmYtYnk6IFNodWJoYXNocmVlIERoYXIgPGRoYXJAY29kZWF1cm9yYS5vcmc+
Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5j
IHwgMyArLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZW5jb2Rlci5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyLmMKPj4+IGluZGV4IDVmMDg1YjUuLjIyOTM4YzcgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4+PiBAQCAtMjE5NSw4ICsyMTk1LDYg
QEAgaW50IGRwdV9lbmNvZGVyX3NldHVwKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIAo+Pj4gc3Ry
dWN0Cj4+PiBkcm1fZW5jb2RlciAqZW5jLAo+Pj4gIAlpZiAocmV0KQo+Pj4gIAkJZ290byBmYWls
Owo+Pj4gCj4+PiAtCXNwaW5fbG9ja19pbml0KCZkcHVfZW5jLT5lbmNfc3BpbmxvY2spOwo+Pj4g
LQo+Pj4gIAlhdG9taWNfc2V0KCZkcHVfZW5jLT5mcmFtZV9kb25lX3RpbWVvdXQsIDApOwo+Pj4g
IAl0aW1lcl9zZXR1cCgmZHB1X2VuYy0+ZnJhbWVfZG9uZV90aW1lciwKPj4+ICAJCQlkcHVfZW5j
b2Rlcl9mcmFtZV9kb25lX3RpbWVvdXQsIDApOwo+Pj4gQEAgLTIyNTAsNiArMjI0OCw3IEBAIHN0
cnVjdCBkcm1fZW5jb2RlciAqZHB1X2VuY29kZXJfaW5pdChzdHJ1Y3QKPj4+IGRybV9kZXZpY2Ug
KmRldiwKPj4+IAo+Pj4gIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZkcHVfZW5jLT5iYXNlLCAm
ZHB1X2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPj4+IAo+Pj4gKwlzcGluX2xvY2tfaW5pdCgmZHB1
X2VuYy0+ZW5jX3NwaW5sb2NrKTsKPj4+ICAJZHB1X2VuYy0+ZW5hYmxlZCA9IGZhbHNlOwo+Pj4g
Cj4+PiAgCXJldHVybiAmZHB1X2VuYy0+YmFzZTsKCi0tIApKZXlrdW1hciBTCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
