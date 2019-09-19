Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E33B8822
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 01:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332E6FC05;
	Thu, 19 Sep 2019 23:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1230B6FC05
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 23:38:53 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338--W2uSWmkNUGYAE3Mgxx79w-1; Thu, 19 Sep 2019 19:38:47 -0400
Received: by mail-qt1-f198.google.com with SMTP id f15so5955372qth.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 16:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=tmX89ISr8dqcZtSm3QXAI2oOhfLSEChXMWsybUj2gs4=;
 b=XugxDvbSbwcxwjtGVLCwIERlAAL+kqIf2QMNkTA3HF4vu1xLbsEu5TZB3CrWzCP52j
 zfK+5+vWlWEib7xPdAyF2YBeLzVoO3MejXC5bIvBElOtlocuf7GQ1aPXQ7aXj7+kWs5N
 bkKjPdoug0ZGiPHgQnuEewDx/5Jfk4Qm+c3CulpiAwvYSAzcI82jEJUcVATCr0njVvwB
 IKyOCA6R4EGMDuD34sx5U2rc7+U2rBTJKqT/xjlTAEx2yUJ3Ud0YjGsR556h2tEcm5Fw
 0E3p3xlltO40Pf4TbS8gCER6HWCCuLV6lCSqM4NMtjJP1wuRier+ZfqVcWuPUIwcemlf
 B+iA==
X-Gm-Message-State: APjAAAU4kcOwkNXB/jV0ummMDIJ9QGkReZ5oGzdEYZgM/ZhCC8cYK8aJ
 OLIjIDMt8qnqEXsUlgi8G6MvmoiAXnl/4LEnIJ2Sjei35ToBefSQLs+j9KU4jO3OTX8PnDg9Wfs
 fQyHLqgdTJFHmn/WmAHMGPotWP+mO
X-Received: by 2002:a37:aa96:: with SMTP id t144mr418705qke.275.1568936326721; 
 Thu, 19 Sep 2019 16:38:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe/jtIvNbrRzR0ca6RzG8AJ/47PStEQCzjsZ1CkUkjohQLVeCYBPTYicX+mBV4Fjf7eeYLMw==
X-Received: by 2002:a37:aa96:: with SMTP id t144mr418695qke.275.1568936326542; 
 Thu, 19 Sep 2019 16:38:46 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id b50sm78664qte.48.2019.09.19.16.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:38:46 -0700 (PDT)
Message-ID: <a8ee87dcf19cac762a491abad234c67bf4df2732.camel@redhat.com>
Subject: Re: [PATCH 02/15] drm/amdgpu: Add connector atomic check
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Thu, 19 Sep 2019 19:38:45 -0400
In-Reply-To: <c33861b3983fe3bb3dbd9c7026cec960f4ce1a6e.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <c33861b3983fe3bb3dbd9c7026cec960f4ce1a6e.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: -W2uSWmkNUGYAE3Mgxx79w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568936332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpSPTTj9EYu4N3ifk5zLejVW+ZbSlm4PQ7s3BusJVbs=;
 b=JPLYdagGR+OzCi/B259F84zm2prSL1SUI0E93xdwY2GaTzSMiB99NYjcKJgLy1dQxIwFJw
 JPFPfEhKvYGYdBCSBU7VwPrDsTvXe9O+wormcauiXkxlptlR7CJLAohe+dbaBiunuQxKxq
 YA/j/ckQDd5l02xkCd3tjw5qwhU9258=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA5LTE4IGF0IDE2OjI2IC0wNDAwLCBtaWtpdGEubGlwc2tpQGFtZC5jb20g
d3JvdGU6Cj4gRnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgo+IAo+
IFt3aHldCj4gQ29tcGx5aW5nIHdpdGggbmV3IE1TVCBhdG9taWMgY2hlY2sgcmVxdWlyZW1lbnRz
Lgo+IFRoZSBkcml2ZXIgbmVlZHMgdG8gY2FsbCB0aGlzIGZ1bmN0aW9uIG9uIGV2ZXJ5Cj4gYXRv
bWljIGNoZWNrIHRvIHJlc2V0IHRoZSBWQ1BJIHNsb3RzIGlmIG5ldyBzdGF0ZQo+IGRpc2FibGVz
Cj4gW2hvd10KPiAtIFZlcmlmeSB0aGF0IGl0IGlzIGEgTVNUIGNvbm5lY3Rpb24KPiAtIFZlcmlm
eSB0aGF0IG9sZCBjcnRjIHN0YXRlIGV4aXN0cwo+IC0gVmVyaWZ5IHRoZSBuZXcgY3J0YyBzdGF0
ZSBkaXNhYmxlcyBzaW5rCj4gLSBSZWxlYXNlIFZDUEkgc2xvdHMgb24gdGhlIHBvcnQKPiAKPiBD
YzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtpdGEg
TGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jCj4gaW5kZXggMTYyMThhMjAyYjU5Li40ZTFiYmY1YmJlNzcgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYwo+IEBAIC0yNTIsMTAgKzI1Miw0NCBAQCBzdGF0aWMgc3RydWN0IGRybV9lbmNv
ZGVyICpkbV9tc3RfYmVzdF9lbmNvZGVyKHN0cnVjdAo+IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKPiAgCXJldHVybiAmYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+bXN0X2VuY29kZXItPmJhc2U7Cj4g
IH0KPiAgCj4gK3N0YXRpYyBpbnQgZG1fZHBfbXN0X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLAo+ICsJCQkJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm5l
d19jb25uX3N0YXRlKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSBu
ZXdfY29ubl9zdGF0ZS0+c3RhdGU7Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqb2xk
X2Nvbm5fc3RhdGUgPQo+ICsJCQlkcm1fYXRvbWljX2dldF9vbGRfY29ubmVjdG9yX3N0YXRlKHN0
YXRlLCBjb25uZWN0b3IpOwo+ICsJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IgPQo+IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKPiArCXN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7Cj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1zdF9tZ3I7Cj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICptc3RfcG9ydDsKPiAr
Cj4gKwlpZiAoIWFjb25uZWN0b3IgfHwgIWFjb25uZWN0b3ItPnBvcnQpCj4gKwkJcmV0dXJuIDA7
ClNhbWUgYXMgdGhlIGxhc3QgcGF0Y2gsIEkgZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBuZWVkIGVp
dGhlciBvZiB0aGVzZSBjaGVja3MuCgpPdGhlcndpc2UsIGFzc3VtaW5nIHRoaXMgZ2V0cyBzcXVh
c2hlZCBpbnRvIHRoZSBwcmV2aW91cyBwYXRjaCB0aGlzIGxvb2tzIGZpbmUKdG8gbWUKCj4gKwo+
ICsJbXN0X3BvcnQgPSBhY29ubmVjdG9yLT5wb3J0Owo+ICsJbXN0X21nciA9ICZhY29ubmVjdG9y
LT5tc3RfcG9ydC0+bXN0X21ncjsKPiArCj4gKwlpZiAoIW9sZF9jb25uX3N0YXRlLT5jcnRjKQo+
ICsJCXJldHVybiAwOwo+ICsKPiArCWlmIChuZXdfY29ubl9zdGF0ZS0+Y3J0Yykgewo+ICsJCW5l
d19jcnRjX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsCj4gbmV3
X2Nvbm5fc3RhdGUtPmNydGMpOwo+ICsJCWlmICghbmV3X2NydGNfc3RhdGUgfHwKPiArCQkgICAg
IWRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKSB8fAo+ICsJCSAg
ICBuZXdfY3J0Y19zdGF0ZS0+ZW5hYmxlKQo+ICsJCQlyZXR1cm4gMDsKPiArCQl9Cj4gKwo+ICsJ
cmV0dXJuIGRybV9kcF9hdG9taWNfcmVsZWFzZV92Y3BpX3Nsb3RzKHN0YXRlLAo+ICsJCQkJCQlt
c3RfbWdyLAo+ICsJCQkJCQltc3RfcG9ydCk7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MKPiBkbV9kcF9tc3RfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyA9IHsKPiAgCS5nZXRfbW9kZXMgPSBkbV9kcF9tc3RfZ2V0X21vZGVzLAo+ICAJLm1v
ZGVfdmFsaWQgPSBhbWRncHVfZG1fY29ubmVjdG9yX21vZGVfdmFsaWQsCj4gIAkuYmVzdF9lbmNv
ZGVyID0gZG1fbXN0X2Jlc3RfZW5jb2RlciwKPiArCS5hdG9taWNfY2hlY2sgPSBkbV9kcF9tc3Rf
YXRvbWljX2NoZWNrLAo+ICB9Owo+ICAKPiAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2VuY29kZXJf
ZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCi0tIApDaGVlcnMsCglMeXVkZSBQ
YXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
