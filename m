Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E136385AA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2C389CD7;
	Fri,  7 Jun 2019 07:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Fri, 07 Jun 2019 07:47:32 UTC
Received: from mx01-fr.bfs.de (mx01-fr.bfs.de [193.174.231.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A6189CC9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:47:32 +0000 (UTC)
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 15F8720366;
 Fri,  7 Jun 2019 09:39:59 +0200 (CEST)
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id 8F0AFBEEBD;
 Fri,  7 Jun 2019 09:39:57 +0200 (CEST)
Message-ID: <5CFA14CD.5010502@bfs.de>
Date: Fri, 07 Jun 2019 09:39:57 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent
 out of bounds read
References: <20190607072704.GA25229@mwanda>
In-Reply-To: <20190607072704.GA25229@mwanda>
X-Spam-Status: No, score=-3.00
X-Spamd-Result: default: False [-3.00 / 7.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; BAYES_HAM(-2.90)[99.56%];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; NEURAL_HAM(-0.00)[-0.999,0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bfs.de; s=dkim201901; 
 t=1559893199; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReZ0V4gRyn84xeXuviMTr2p2aMWQv3RUucZaYJp3CBQ=;
 b=WxFpNEbOz8cyeEpzZ2OLeY9ZTjSBaPDNJ2IAuVOeDCdVHlLLBahRnj+OAOVy2CsyHXypHz
 si/+fcgJaBRo4xtN30B70VP0y2BAib5Npqj+ttf7vnR0TelGBoVIALXW/gryKY687WzBvj
 lP03NEB3yVF5dgxF0/JpI4A9WwiPOCaZRSeyXrXiB7KjvR59hI/+Jkvw/h7Cx/K+NMuDvB
 OsnVdmOe7VjSr4m7fhbv2vUMkeKdmLLyVxPnlFmfbBn7eJyPCFn8fHr9aTfaiY85f09MPf
 guJRl2KkzhK/kwm9Ih+KpaS+XkTMaf+CXNtNCUpnwzisteLes0GrBDlJkBo9vA==
X-Mailman-Original-Authentication-Results: mx01-fr.bfs.de
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
Reply-To: wharms@bfs.de
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNy4wNi4yMDE5IDA5OjI3LCBzY2hyaWViIERhbiBDYXJwZW50ZXI6Cj4gVGhpcyBzaG91
bGQgY2hlY2sgdGhhdCAiaSIgaXMgd2l0aGluIGJvdW5kcyBiZWZvcmUgY2hlY2tpbmcgcmVhZGlu
ZyBmcm9tCj4gdGhlIGFycmF5Lgo+IAo+IEZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdl
OiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERNSSBhdWRpbyBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMKPiBpbmRleCBkNmY5OGQzODhhYzIuLjZiMDM2MTZkNmJjMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jCj4gQEAgLTU4OSw4ICs1ODksOCBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVk
aW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgCWlmIChyZXQp
Cj4gIAkJZ290byBvdXQ7Cj4gIAo+IC0JZm9yIChpID0gMDsgc2lpOTAyeC0+YXVkaW8uaTJzX2Zp
Zm9fc2VxdWVuY2VbaV0gJiYKPiAtCQkgICAgIGkgPCBBUlJBWV9TSVpFKHNpaTkwMngtPmF1ZGlv
Lmkyc19maWZvX3NlcXVlbmNlKTsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
c2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2UpICYmCj4gKwkJICAgIHNpaTkwMngtPmF1
ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldOyBpKyspCj4gIAkJcmVnbWFwX3dyaXRlKHNpaTkwMngt
PnJlZ21hcCwKPiAgCQkJICAgICBTSUk5MDJYX1RQSV9JMlNfRU5BQkxFX01BUFBJTkdfUkVHLAo+
ICAJCQkgICAgIHNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldKTsKCgptbW1oLCBp
IGFtIGEgYmlnIGZhbiBvZiBLSVNTIGFuZCBpbiB0aGlzIGNhc2UgaSB3b3VsZCBjaGVjayBzaWk5
MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXQpvdXRzaWRlIGZvcigpLiBsaWtlOgoKCSBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5j
ZSk7IGkrKykgewoJICAgICAgICBpZiAoIXNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNl
W2ldKQogICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CgogICAgICAgICAgICAgICAgIHJl
Z21hcF93cml0ZShzaWk5MDJ4LT5yZWdtYXAsCiAgCQkJICAgICBTSUk5MDJYX1RQSV9JMlNfRU5B
QkxFX01BUFBJTkdfUkVHLAogIAkJCSAgICAgc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVu
Y2VbaV0pOwoJfQoKanVzdCBteSAyIGNlbnRzLAoKcmUsCiB3aApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
