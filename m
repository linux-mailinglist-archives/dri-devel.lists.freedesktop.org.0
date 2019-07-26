Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F176B7E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDE6ED86;
	Fri, 26 Jul 2019 14:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CBD6ED88
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:24:01 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id i11so53462826edq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=hkUcOf0ydA+KKuluIvIb7Xy/IXTYqkk4lpoXnmpOp5Y=;
 b=ot65xm+uq2V5ABwehlm59ZZo4dSIhJ/YKirXjFsg7lEBEqcoc59zL5mL7+KTh+1LHa
 cpRJU2I/ZGyHsnpUgComPnpATT7ouBGsNzw+4COUtfkeV4E40l/BP5Jn1L1UVYyx2TTY
 LA5R1+1MaedWJncdisRaWnO1vNzuIjhcTDEtAeks1aTUAjfzP3NUF6caDEFpHgK0Lxsn
 1dRh/Ae8977Zw3Ff5RU1wuI4y29GwYyzcLgj2R+9kof36xpZeeoV6RfFWKRhgowZHUFn
 ucbuP24pic9v1VsAAiFq5wgeUc4hAxeaN+upw9TKk6w/adOSSvggE35wy484oAFyFC+Q
 NKBA==
X-Gm-Message-State: APjAAAX/7OyzpurSKWuAjgha9FhsAS8P0Hxii4/Bn3Qwy0Sfgu08zGLH
 +YfsqwJV5bpTmiig54eju7k=
X-Google-Smtp-Source: APXvYqx6A0XL0N1neMFyUVBMB5rD0gK8wO/m8LMT7Jy6fxmIUv/h+V5CAFBcqVqIRQBoBV2s03YSkw==
X-Received: by 2002:a17:906:4894:: with SMTP id
 v20mr70646164ejq.120.1564151039742; 
 Fri, 26 Jul 2019 07:23:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id w4sm10166343eja.34.2019.07.26.07.23.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 07:23:58 -0700 (PDT)
Date: Fri, 26 Jul 2019 16:23:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Skips the invalid writeback job
Message-ID: <20190726142356.GI15868@phenom.ffwll.local>
Mail-Followup-To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>,
 nd <nd@arm.com>
References: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564128758-23553-1-git-send-email-lowry.li@arm.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=hkUcOf0ydA+KKuluIvIb7Xy/IXTYqkk4lpoXnmpOp5Y=;
 b=Rx0+UFWuP+pfapsIi/dvMT7L7ha7aPBlk89E7/oppXApi7d1NI5QPDUwlRlW5s5mSy
 q1aey0LXSoAVbe5Wdl5DaP2vIvyz7K/mChUaKxLP5VxrrhGA+qmOG+cwAPbV6Yiv87/N
 E0mFseeM77jST+wqYSm2ivuIsVjwLhqfsIuk0=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDg6MTM6MDBBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBDdXJyZW50IERSTS1DT1JFIGFjY2VwdHMgdGhlIHdy
aXRlYmFja19qb2Igd2l0aCBhIGVtcHR5IGZiLCBidXQgdGhhdAo+IGlzIGFuIGludmFsaWQgam9i
IGZvciBIVywgc28gbmVlZCB0byBza2lwIGl0IHdoZW4gY29tbWl0IGl0IHRvIEhXLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFy
bS5jb20+CgpIbSwgdGhpcyBzb3VuZHMgYSBiaXQgbGlrZSBhbiBvdmVyc2lnaHQgaW4gY29yZSB3
cml0ZWJhY2sgY29kZT8gTm90IHN1cmUKaG93IHRoaXMgY2FuIGV2ZW4gaGFwcGVuLCBzZXR0aW5n
IHVwIGEgd3JpdGViYWNrIGpvYiB3aXRob3V0IGFuIGZiIHNvdW5kcwphIGJpdCBsaWtlIGEgYnVn
IHRvIG1lIGF0IGxlYXN0IC4uLgoKSWYgd2UgZG9uJ3QgaGF2ZSBhIGdvb2QgcmVhc29uIGZvciB3
aHkgb3RoZXIgaHcgbmVlZHMgdG8gYWNjZXB0IHRoaXMsIHRoZW4KaW1vIHRoaXMgbmVlZHMgdG8g
YmUgcmVqZWN0ZWQgaW4gc2hhcmVkIGNvZGUuIEZvciBjb25zaXN0ZW50IGJlaGF2aW91cgphY3Jv
c3MgYWxsIHdyaXRlYmFjayBzdXBwb3J0aW5nIGRyaXZlcnMuCi1EYW5pZWwKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgICAgICAgIHwg
MiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25u
ZWN0b3IuYyB8IDkgKysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jcnRjLmMKPiBpbmRleCAyZmVkMWY2Li4zNzJlOTlhIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBA
IC0yNjUsNyArMjY1LDcgQEAgdm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtv
bWVkYV9jcnRjICprY3J0YywKPiAgCQlrb21lZGFfcGlwZWxpbmVfdXBkYXRlKHNsYXZlLCBvbGQt
PnN0YXRlKTsKPiAgCj4gIAljb25uX3N0ID0gd2JfY29ubiA/IHdiX2Nvbm4tPmJhc2UuYmFzZS5z
dGF0ZSA6IE5VTEw7Cj4gLQlpZiAoY29ubl9zdCAmJiBjb25uX3N0LT53cml0ZWJhY2tfam9iKQo+
ICsJaWYgKGNvbm5fc3QgJiYgY29ubl9zdC0+d3JpdGViYWNrX2pvYiAmJiBjb25uX3N0LT53cml0
ZWJhY2tfam9iLT5mYikKPiAgCQlkcm1fd3JpdGViYWNrX3F1ZXVlX2pvYigmd2JfY29ubi0+YmFz
ZSwgY29ubl9zdCk7Cj4gIAo+ICAJLyogc3RlcCAyOiBub3RpZnkgdGhlIEhXIHRvIGtpY2tvZmYg
dGhlIHVwZGF0ZSAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gaW5kZXggOTc4Nzc0NS4uOGUyZWY2MyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93
Yl9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gQEAgLTUyLDkgKzUyLDE2IEBACj4gIAlzdHJ1Y3Qga29t
ZWRhX2RhdGFfZmxvd19jZmcgZGZsb3c7Cj4gIAlpbnQgZXJyOwo+ICAKPiAtCWlmICghd3JpdGVi
YWNrX2pvYiB8fCAhd3JpdGViYWNrX2pvYi0+ZmIpCj4gKwlpZiAoIXdyaXRlYmFja19qb2IpCj4g
IAkJcmV0dXJuIDA7Cj4gIAo+ICsJaWYgKCF3cml0ZWJhY2tfam9iLT5mYikgewo+ICsJCWlmICh3
cml0ZWJhY2tfam9iLT5vdXRfZmVuY2UpCj4gKwkJCURSTV9ERUJVR19BVE9NSUMoIk91dCBmZW5j
ZSByZXF1aXJlZCBvbiBhIGludmFsaWQgd3JpdGViYWNrIGpvYi5cbiIpOwo+ICsKPiArCQlyZXR1
cm4gd3JpdGViYWNrX2pvYi0+b3V0X2ZlbmNlID8gLUVJTlZBTCA6IDA7Cj4gKwl9Cj4gKwo+ICAJ
aWYgKCFjcnRjX3N0LT5hY3RpdmUpIHsKPiAgCQlEUk1fREVCVUdfQVRPTUlDKCJDYW5ub3Qgd3Jp
dGUgdGhlIGNvbXBvc2l0aW9uIHJlc3VsdCBvdXQgb24gYSBpbmFjdGl2ZSBDUlRDLlxuIik7Cj4g
IAkJcmV0dXJuIC1FSU5WQUw7Cj4gLS0gCj4gMS45LjEKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
