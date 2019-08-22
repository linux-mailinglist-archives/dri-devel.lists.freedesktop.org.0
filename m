Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8089A119
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4E96EAD7;
	Thu, 22 Aug 2019 20:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74876EAD1;
 Thu, 22 Aug 2019 20:32:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F10BA30BDE39;
 Thu, 22 Aug 2019 20:32:11 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22E8C2B1CC;
 Thu, 22 Aug 2019 20:31:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915: Call dma_set_max_seg_size() in
 i915_ggtt_probe_hw()
Date: Thu, 22 Aug 2019 16:31:26 -0400
Message-Id: <20190822203127.24648-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 22 Aug 2019 20:32:14 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5LCB3ZSBkb24ndCBjYWxsIGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgZm9yIGk5MTUg
YmVjYXVzZSB3ZQppbnRlbnRpb25hbGx5IGRvIG5vdCBsaW1pdCB0aGUgc2VnbWVudCBsZW5ndGgg
dGhhdCB0aGUgZGV2aWNlIHN1cHBvcnRzLgpIb3dldmVyLCB0aGlzIHJlc3VsdHMgaW4gYSB3YXJu
aW5nIGJlaW5nIGVtaXR0ZWQgaWYgd2UgdHJ5IHRvIG1hcAphbnl0aGluZyBsYXJnZXIgdGhhbiBT
Wl82NEsgb24gYSBrZXJuZWwgd2l0aCBDT05GSUdfRE1BX0FQSV9ERUJVR19TRwplbmFibGVkOgoK
WyAgICA3Ljc1MTkyNl0gRE1BLUFQSTogaTkxNSAwMDAwOjAwOjAyLjA6IG1hcHBpbmcgc2cgc2Vn
bWVudCBsb25nZXIKdGhhbiBkZXZpY2UgY2xhaW1zIHRvIHN1cHBvcnQgW2xlbj05ODMwNF0gW21h
eD02NTUzNl0KWyAgICA3Ljc1MTkzNF0gV0FSTklORzogQ1BVOiA1IFBJRDogNDc0IGF0IGtlcm5l
bC9kbWEvZGVidWcuYzoxMjIwCmRlYnVnX2RtYV9tYXBfc2crMHgyMGYvMHgzNDAKClRoaXMgd2Fz
IG9yaWdpbmFsbHkgYnJvdWdodCB1cCBvbgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDg1MTcgLCBhbmQgdGhlIGNvbnNlbnN1cwp0aGVyZSB3YXMgaXQgd2Fz
bid0IHJlYWxseSB1c2VmdWwgdG8gc2V0IGEgbGltaXQgKGFuZCB0aGF0IGRtYS1kZWJ1Zwppc24n
dCByZWFsbHkgYWxsIHRoYXQgdXNlZnVsIGZvciBpOTE1IGluIHRoZSBmaXJzdCBwbGFjZSkuIFVu
Zm9ydHVuYXRlbHkKdGhvdWdoLCBDT05GSUdfRE1BX0FQSV9ERUJVR19TRyBpcyBlbmFibGVkIGlu
IHRoZSBkZWJ1ZyBjb25maWdzIGZvcgp2YXJpb3VzIGRpc3RybyBrZXJuZWxzLiBTaW5jZSBhIFdB
Uk5fT04oKSB3aWxsIGRpc2FibGUgYXV0b21hdGljIHByb2JsZW0KcmVwb3J0aW5nIChhbmQgY2F1
c2UgYW55IENJIHdpdGggc2FpZCBvcHRpb24gZW5hYmxlZCB0byBzdGFydApjb21wbGFpbmluZyks
IHdlIHJlYWxseSBzaG91bGQganVzdCBmaXggdGhlIHByb2JsZW0uCgpOb3RlIHRoYXQgYXMgbWUg
YW5kIENocmlzIFdpbHNvbiBkaXNjdXNzZWQsIHRoZSBvdGhlciBzb2x1dGlvbiBmb3IgdGhpcwp3
b3VsZCBiZSB0byBtYWtlIERNQS1BUEkgbm90IG1ha2Ugc3VjaCBhc3N1bXB0aW9ucyB3aGVuIGEg
ZHJpdmVyIGhhc24ndApleHBsaWNpdGx5IHNldCBhIG1heGltdW0gc2VnbWVudCBzaXplLiBCdXQs
IHRha2luZyBhIGxvb2sgYXQgdGhlIGNvbW1pdAp3aGljaCBvcmlnaW5hbGx5IGludHJvZHVjZWQg
dGhpcyBiZWhhdmlvciwgY29tbWl0IDc4YzQ3ODMwYTVjYgooImRtYS1kZWJ1ZzogY2hlY2sgc2Nh
dHRlcmxpc3Qgc2VnbWVudHMiKSwgdGhlcmUgaXMgYW4gZXhwbGljaXQgbWVudGlvbgpvZiB0aGlz
IGFzc3VtcHRpb24gYW5kIGhvdyBpdCBhcHBsaWVzIHRvIGRldmljZXMgd2l0aCBubyBzZWdtZW50
IHNpemU6CgoJQ29udmVyc2VseSwgZGV2aWNlcyB3aGljaCBhcmUgbGVzcyBsaW1pdGVkIHRoYW4g
dGhlIHJhdGhlcgoJY29uc2VydmF0aXZlIGRlZmF1bHRzLCBvciBpbmRlZWQgaGF2ZSBubyBsaW1p
dGF0aW9ucyBhdCBhbGwKCShlLmcuIEdQVXMgd2l0aCB0aGVpciBvd24gaW50ZXJuYWwgTU1VKSwg
c2hvdWxkIGJlIGVuY291cmFnZWQgdG8KCXNldCBhcHByb3ByaWF0ZSBkbWFfcGFybXMsIGFzIHRo
ZXkgbWF5IGdldCBtb3JlIGVmZmljaWVudCBETUEKCW1hcHBpbmcgcGVyZm9ybWFuY2Ugb3V0IG9m
IGl0LgoKU28gdW5sZXNzIHRoZXJlJ3MgYW55IGNvbmNlcm5zIChJJ20gb3BlbiB0byBkaXNjdXNz
aW9uISksIGxldCdzIGp1c3QKZm9sbG93IHN1aXRlIGFuZCBjYWxsIGRtYV9zZXRfbWF4X3NlZ19z
aXplKCkgd2l0aCBVSU5UX01BWCBhcyBvdXIgbGltaXQKdG8gc2lsZW5jZSBhbnkgd2FybmluZ3Mu
CgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVs
Lm9yZz4gIyB2NC4xOCsKLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYyB8
IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZ2VtX2d0dC5jCmluZGV4IDBiODFlMGI2NDM5My4uYTE0NzUwMzlkMTgyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYwpAQCAtMzE1Miw2ICszMTUyLDExIEBAIHN0YXRpYyBp
bnQgZ2d0dF9wcm9iZV9odyhzdHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0LCBzdHJ1Y3QgaW50ZWxfZ3Qg
Kmd0KQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwkvKiBXZSBkb24ndCBoYXZlIGEgbWF4
IHNlZ21lbnQgc2l6ZSwgc28gc2V0IGl0IHRvIHRoZSBtYXggc28gc2cncworCSAqIGRlYnVnZ2lu
ZyBsYXllciBkb2Vzbid0IGNvbXBsYWluCisJICovCisJZG1hX3NldF9tYXhfc2VnX3NpemUoZ2d0
dC0+dm0uZG1hLCBVSU5UX01BWCk7CisKIAlpZiAoKGdndHQtPnZtLnRvdGFsIC0gMSkgPj4gMzIp
IHsKIAkJRFJNX0VSUk9SKCJXZSBuZXZlciBleHBlY3RlZCBhIEdsb2JhbCBHVFQgd2l0aCBtb3Jl
IHRoYW4gMzJiaXRzIgogCQkJICAiIG9mIGFkZHJlc3Mgc3BhY2UhIEZvdW5kICVsbGRNIVxuIiwK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
