Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5C52489
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3606E02C;
	Tue, 25 Jun 2019 07:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6504B89C68;
 Tue, 25 Jun 2019 05:44:46 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F07D160867; Tue, 25 Jun 2019 05:44:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 52BAF601E7;
 Tue, 25 Jun 2019 05:44:45 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 Jun 2019 11:14:45 +0530
From: dhar@codeaurora.org
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
In-Reply-To: <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
 <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
Message-ID: <d61d7805b4ac0ec45309bf5b65841262@codeaurora.org>
X-Sender: dhar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561441486;
 bh=VoP64LnBzSeu4YlaPxe3/Iim6Cic7+1v38v1apbRuak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MCb1Z2D3EruYT8t2nRPe3btLfwqWxn+9pHYZ81bQ8T1Bz1HpQQl76TdVE+yZM1SY/
 evJ8li6Bc+C4+FgFC5FWIo75ysmuo3puw8fljJKa6uYn0zFhujbq64EvPtPRG4dv0R
 DoUwyg7DtSN5c4hF8ICg6wxq9dbxHUlnJxVp9JAs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1561441485;
 bh=VoP64LnBzSeu4YlaPxe3/Iim6Cic7+1v38v1apbRuak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e+h2bnNqJO4uHAEkcwB1UFdosHbAILF0sslm8yXSoJdwAxpG0yu4ZXtumIN4VwMTt
 QbxTp+wvqlBrQQhzR4n/CQ6iAqTUO+6PU1BE6OqWORC/CdVbTYJ8rCDZuIgoh3Sqt1
 wJmGLediQfgaML9iTnIv2fwJt4ZHHQPEobkS++NA=
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

T24gMjAxOS0wNi0yNSAwMzo1NiwgSmV5a3VtYXIgU2Fua2FyYW4gd3JvdGU6Cj4gT24gMjAxOS0w
Ni0yMyAyMzoyNywgU2h1Ymhhc2hyZWUgRGhhciB3cm90ZToKPj4gZHB1IGVuY29kZXIgc3Bpbmxv
Y2sgc2hvdWxkIGJlIGluaXRpYWxpemVkIGR1cmluZyBkcHUgZW5jb2Rlcgo+PiBpbml0IGluc3Rl
YWQgb2YgZHB1IGVuY29kZXIgc2V0dXAgd2hpY2ggaXMgcGFydCBvZiBjb21taXQuCj4+IFRoZXJl
IGFyZSBjaGFuY2VzIHRoYXQgdmJsYW5rIGNvbnRyb2wgdXNlcyB0aGUgdW5pbml0aWFsaXplZAo+
PiBzcGlubG9jayBpZiBub3QgaW5pdGlhbGl6ZWQgZHVyaW5nIGVuY29kZXIgaW5pdC4KPiBOb3Qg
bXVjaCBjYW4gYmUgZG9uZSBpZiBzb21lb25lIGlzIHBlcmZvcm1pbmcgYSB2Ymxhbmsgb3BlcmF0
aW9uCj4gYmVmb3JlIGVuY29kZXJfc2V0dXAgaXMgZG9uZS4KPiBDYW4geW91IHBvaW50IHRvIHRo
ZSBwYXRoIHdoZXJlIHRoaXMgbG9jayBpcyBhY3F1aXJlZCBiZWZvcmUKPiB0aGUgZW5jb2Rlcl9z
ZXR1cD8KPiAKPiBUaGFua3MKPiBKZXlrdW1hciBTLgo+PiAKCldoZW4gcnVubmluZyBzb21lIGRw
IHVzZWNhc2UsIHdlIGFyZSBoaXR0aW5nIHRoaXMgY2FsbHN0YWNrLgoKUHJvY2VzcyBrd29ya2Vy
L3UxNjo4IChwaWQ6IDIxNSwgc3RhY2sgbGltaXQgPSAweDAwMDAwMDAwZGY5ZGQ5MzApCkNhbGwg
dHJhY2U6CiAgc3Bpbl9kdW1wKzB4ODQvMHg4YwogIHNwaW5fZHVtcCsweDAvMHg4YwogIGRvX3Jh
d19zcGluX2xvY2srMHg4MC8weGIwCiAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSsweDM0LzB4NDQK
ICBkcHVfZW5jb2Rlcl90b2dnbGVfdmJsYW5rX2Zvcl9jcnRjKzB4OGMvMHhlOAogIGRwdV9jcnRj
X3ZibGFuaysweDE2OC8weDFhMAogIGRwdV9rbXNfZW5hYmxlX3ZibGFuayswWyAgIDExLjY0ODk5
OF0gIHZibGFua19jdHJsX3dvcmtlcisweDNjLzB4NjAKICBwcm9jZXNzX29uZV93b3JrKzB4MTZj
LzB4MmQ4CiAgd29ya2VyX3RocmVhZCsweDFkOC8weDJiMAogIGt0aHJlYWQrMHgxMjQvMHgxMzQK
Ckxvb2tzIGxpa2UgdmJsYW5rIGlzIGdldHRpbmcgZW5hYmxlZCBlYXJsaWVyIGNhdXNpbmcgdGhp
cyBpc3N1ZSBhbmQgd2UgCmFyZSB1c2luZyB0aGUgc3BpbmxvY2sgd2l0aG91dCBpbml0aWFsaXpp
bmcgaXQuCgpUaGFua3MsClNodWJoYXNocmVlCgo+PiBDaGFuZ2UtSWQ6IEk1YTE4Yjk1ZmE0NzM5
N2M4MzRhMjY2YjIyYWJmMzNhNTE3YjAzYTRlCj4+IFNpZ25lZC1vZmYtYnk6IFNodWJoYXNocmVl
IERoYXIgPGRoYXJAY29kZWF1cm9yYS5vcmc+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYyB8IDMgKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPj4gaW5kZXggNWYwODViNS4uMjI5MzhjNyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCj4+IEBA
IC0yMTk1LDggKzIxOTUsNiBAQCBpbnQgZHB1X2VuY29kZXJfc2V0dXAoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgCj4+IHN0cnVjdAo+PiBkcm1fZW5jb2RlciAqZW5jLAo+PiAgCWlmIChyZXQpCj4+
ICAJCWdvdG8gZmFpbDsKPj4gCj4+IC0Jc3Bpbl9sb2NrX2luaXQoJmRwdV9lbmMtPmVuY19zcGlu
bG9jayk7Cj4+IC0KPj4gIAlhdG9taWNfc2V0KCZkcHVfZW5jLT5mcmFtZV9kb25lX3RpbWVvdXQs
IDApOwo+PiAgCXRpbWVyX3NldHVwKCZkcHVfZW5jLT5mcmFtZV9kb25lX3RpbWVyLAo+PiAgCQkJ
ZHB1X2VuY29kZXJfZnJhbWVfZG9uZV90aW1lb3V0LCAwKTsKPj4gQEAgLTIyNTAsNiArMjI0OCw3
IEBAIHN0cnVjdCBkcm1fZW5jb2RlciAqZHB1X2VuY29kZXJfaW5pdChzdHJ1Y3QKPj4gZHJtX2Rl
dmljZSAqZGV2LAo+PiAKPj4gIAlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZkcHVfZW5jLT5iYXNl
LCAmZHB1X2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKPj4gCj4+ICsJc3Bpbl9sb2NrX2luaXQoJmRw
dV9lbmMtPmVuY19zcGlubG9jayk7Cj4+ICAJZHB1X2VuYy0+ZW5hYmxlZCA9IGZhbHNlOwo+PiAK
Pj4gIAlyZXR1cm4gJmRwdV9lbmMtPmJhc2U7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
