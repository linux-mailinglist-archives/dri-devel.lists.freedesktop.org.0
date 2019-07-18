Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDC6D15B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6CB6E417;
	Thu, 18 Jul 2019 15:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570146E415;
 Thu, 18 Jul 2019 15:49:24 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0F61E616D3; Thu, 18 Jul 2019 15:49:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B35A61195;
 Thu, 18 Jul 2019 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B35A61195
Date: Thu, 18 Jul 2019 09:49:19 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Message-ID: <20190718154918.GA25162@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 freedreno@lists.freedesktop.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
References: <20190630124735.27786-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1563464964;
 bh=v5hhjA/iytoDxv8ni3GeH5pwLTR7rQrwabw5e/yLgzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W44UTwtvRjwynILo9LYMGbSzofJqMKPKPmsR6yxk9HksSCWlHPSPDb+Vw0zqdd39Q
 VW+JLcJYhc1ebrMCXO/nDQ0onkI2IVKB1SOydiUwkW5CF4CjmIa21DaYa8k+cRX+kR
 faYf6rXT8WMpoowIETMS+svwBj7Hdu2doi4SVN08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1563464962;
 bh=v5hhjA/iytoDxv8ni3GeH5pwLTR7rQrwabw5e/yLgzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tqm5NqXz54lQg0ShP9wjPWjNx5HLOVrE6qKdPt6u8BoVv1LVnSyp2l3pz0idbXzq7
 bibMQuSOdOml73rnmAHbUrVPZLVxTTdqhGXimmfP/LPLvVzZdddTDA//6PRohgWAre
 K/HPtYPE7SaNryJjHR09gdGo9yhYUDjb9+oNYKCI=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDU6NDc6MjJBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBSZWNlbnRs
eSBzcGxhdHMgbGlrZSB0aGlzIHN0YXJ0ZWQgc2hvd2luZyB1cDoKPiAKPiAgICBXQVJOSU5HOiBD
UFU6IDQgUElEOiAyNTEgYXQgZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYzo0NTEgX19pb21tdV9k
bWFfdW5tYXArMHhiOC8weGMwCj4gICAgTW9kdWxlcyBsaW5rZWQgaW46IGF0aDEwa19zbm9jIGF0
aDEwa19jb3JlIGZ1c2UgbXNtIGF0aCBtYWM4MDIxMSB1dmN2aWRlbyBjZmc4MDIxMSB2aWRlb2J1
ZjJfdm1hbGxvYyB2aWRlb2J1ZjJfbWVtb3BzIHZpZGUKPiAgICBDUFU6IDQgUElEOiAyNTEgQ29t
bToga3dvcmtlci91MTY6NCBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgNS4yLjAtcmM1LW5l
eHQtMjAxOTA2MTkrICMyMzE3Cj4gICAgSGFyZHdhcmUgbmFtZTogTEVOT1ZPIDgxSkwvTE5WTkIx
NjEyMTYsIEJJT1MgOVVDTjIzV1coVjEuMDYpIDEwLzI1LzIwMTgKPiAgICBXb3JrcXVldWU6IG1z
bSBtc21fZ2VtX2ZyZWVfd29yayBbbXNtXQo+ICAgIHBzdGF0ZTogODBjMDAwMDUgKE56Y3YgZGFp
ZiArUEFOICtVQU8pCj4gICAgcGMgOiBfX2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAKPiAgICBs
ciA6IF9faW9tbXVfZG1hX3VubWFwKzB4NTQvMHhjMAo+ICAgIHNwIDogZmZmZjAwMDAxMTlhYmNl
MAo+ICAgIHgyOTogZmZmZjAwMDAxMTlhYmNlMCB4Mjg6IDAwMDAwMDAwMDAwMDAwMDAKPiAgICB4
Mjc6IGZmZmY4MDAxZjk5NDY2NDggeDI2OiBmZmZmODAwMWVjMjcxMDY4Cj4gICAgeDI1OiAwMDAw
MDAwMDAwMDAwMDAwIHgyNDogZmZmZjgwMDFlYTM1ODBhOAo+ICAgIHgyMzogZmZmZjgwMDFmOTVi
YTAxMCB4MjI6IGZmZmY4MDAxOGU4M2JhODgKPiAgICB4MjE6IGZmZmY4MDAxZTU0OGYwMDAgeDIw
OiBmZmZmZmZmZmZmZmZmMDAwCj4gICAgeDE5OiAwMDAwMDAwMDAwMDAxMDAwIHgxODogMDAwMDAw
MDBjMDAwMDFmZQo+ICAgIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAw
MDAKPiAgICB4MTU6IGZmZmYwMDAwMTViNzAwNjggeDE0OiAwMDAwMDAwMDAwMDAwMDA1Cj4gICAg
eDEzOiAwMDAzMTQyY2MxYmUxNzY4IHgxMjogMDAwMDAwMDAwMDAwMDAwMQo+ICAgIHgxMTogZmZm
ZjgwMDFmNmRlOTEwMCB4MTA6IDAwMDAwMDAwMDAwMDAwMDkKPiAgICB4OSA6IGZmZmYwMDAwMTVi
NzgwMDAgeDggOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgeDcgOiAwMDAwMDAwMDAwMDAwMDAxIHg2
IDogZmZmZmZmZmZmZmZmZjAwMAo+ICAgIHg1IDogMDAwMDAwMDAwMDAwMGZmZiB4NCA6IGZmZmYw
MDAwMTA2NWRiYzgKPiAgICB4MyA6IDAwMDAwMDAwMDAwMDAwMGQgeDIgOiAwMDAwMDAwMDAwMDAx
MDAwCj4gICAgeDEgOiBmZmZmZmZmZmZmZmZmMDAwIHgwIDogMDAwMDAwMDAwMDAwMDAwMAo+ICAg
IENhbGwgdHJhY2U6Cj4gICAgIF9faW9tbXVfZG1hX3VubWFwKzB4YjgvMHhjMAo+ICAgICBpb21t
dV9kbWFfdW5tYXBfc2crMHg5OC8weGI4Cj4gICAgIHB1dF9wYWdlcysweDVjLzB4ZjAgW21zbV0K
PiAgICAgbXNtX2dlbV9mcmVlX3dvcmsrMHgxMGMvMHgxNTAgW21zbV0KPiAgICAgcHJvY2Vzc19v
bmVfd29yaysweDFlMC8weDMzMAo+ICAgICB3b3JrZXJfdGhyZWFkKzB4NDAvMHg0MzgKPiAgICAg
a3RocmVhZCsweDEyYy8weDEzMAo+ICAgICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOAo+ICAgIC0t
LVsgZW5kIHRyYWNlIGFmYzBkYzVhYjgxYTA2YmYgXS0tLQo+IAo+IE5vdCBxdWl0ZSBzdXJlIHdo
YXQgdHJpZ2dlcmVkIHRoYXQsIGJ1dCB3ZSByZWFsbHkgc2hvdWxkbid0IGJlIGFidXNpbmcKPiBk
bWFfe21hcCx1bm1hcH1fc2coKSBmb3IgY2FjaGUgbWFpbnQuCgpJJ20gc3VyZSB3ZSdsbCBzZWUg
dGhpcyByZWFyIGl0cyBoZWFkIGFnYWluIHNvbWVkYXkuIE15IGtpbmdkb20gZm9yIGxlYWYgZHJp
dmVyCmNhY2hlIGNvbnRyb2wgdGhhdCBtYWtlcyBzZW5zZS4KClJldmlld2VkLWJ5OiBKb3JkYW4g
Q3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xh
cmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2Vy
bmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9nZW0uYwo+IGluZGV4IGQzMWQ5ZjkyNzg4Ny4uM2I4NGNiZGNhZmEzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZ2VtLmMKPiBAQCAtMTA4LDcgKzEwOCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGFnZSAqKmdldF9wYWdlcyhzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgCQkgKiBiZWNh
dXNlIGRpc3BsYXkgY29udHJvbGxlciwgR1BVLCBldGMuIGFyZSBub3QgY29oZXJlbnQ6Cj4gIAkJ
ICovCj4gIAkJaWYgKG1zbV9vYmotPmZsYWdzICYgKE1TTV9CT19XQ3xNU01fQk9fVU5DQUNIRUQp
KQo+IC0JCQlkbWFfbWFwX3NnKGRldi0+ZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKPiArCQkJZG1h
X3N5bmNfc2dfZm9yX2RldmljZShkZXYtPmRldiwgbXNtX29iai0+c2d0LT5zZ2wsCj4gIAkJCQkJ
bXNtX29iai0+c2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwpOwo+ICAJfQo+ICAKPiBAQCAt
MTM4LDcgKzEzOCw3IEBAIHN0YXRpYyB2b2lkIHB1dF9wYWdlcyhzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaikKPiAgCQkJICogR1BVLCBldGMuIGFyZSBub3QgY29oZXJlbnQ6Cj4gIAkJCSAqLwo+
ICAJCQlpZiAobXNtX29iai0+ZmxhZ3MgJiAoTVNNX0JPX1dDfE1TTV9CT19VTkNBQ0hFRCkpCj4g
LQkJCQlkbWFfdW5tYXBfc2cob2JqLT5kZXYtPmRldiwgbXNtX29iai0+c2d0LT5zZ2wsCj4gKwkJ
CQlkbWFfc3luY19zZ19mb3JfY3B1KG9iai0+ZGV2LT5kZXYsIG1zbV9vYmotPnNndC0+c2dsLAo+
ICAJCQkJCSAgICAgbXNtX29iai0+c2d0LT5uZW50cywKPiAgCQkJCQkgICAgIERNQV9CSURJUkVD
VElPTkFMKTsKPiAgCj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBGcmVlZHJlbm8gbWFpbGluZyBsaXN0Cj4gRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24g
Q2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZv
dW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
