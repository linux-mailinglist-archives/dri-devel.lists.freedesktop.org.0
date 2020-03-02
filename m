Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D017712C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2E66EA09;
	Tue,  3 Mar 2020 08:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA51B6E843
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:49:16 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id m2so574404qvu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 12:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JtUoYN/PII2E07ofa4f00O2/RHzRw4b39z+EaScBDCQ=;
 b=kiq81L8j7237CEsRcot7Au1SqVrv9OUR8vIsoHPm98P+mxuKQHIokPL2/Sb/pO50XX
 1AbtnAUj43hOCG/MfTMflb+m3pmA9+rR899BA9neo8x2KguQE/RpvUzxvpIv+s0660ED
 XOgs+DrMhfT71U4amVO9t/CpoJqTIRsTd+W+HQ4a4DaKdzQHNNXrgilntLfIpEMmB0r6
 SJlEdcC7onJXsOCPm0i02C++sCAMplSdrWlFpLA65A3aOMtNLe1S4PzPTLfEv0q7ii6n
 wA1MNIm468bi8fLi/ox9/g/g5D/ajH06MqIwfHO29oow25Ke+ODp7GBcqP9BAkFOl/9P
 dOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JtUoYN/PII2E07ofa4f00O2/RHzRw4b39z+EaScBDCQ=;
 b=U0SJFu5AO3PDTM0ze9p7IzKKjaivmqMmDktdhw4rMgfeweCx7zX+o3ujZ2ZyjTM8l9
 s6eXKMBJQtfH8CfGYx9AZwKXeZZWNRs6pXrVa6sqRMqoG+YFafg6In7F9THM6avGqn5h
 7EIOqK2Wm3J8y6rLYsGpbP21vf14gRcXDFb6cvFPxeO76r52GegqGb5u91vfUTfndFx/
 9CNOU0IVPcYzkYFQZzsq3TAv03FDKe6pvgOSQYgiCKK8EjfmMqqTgPX9/Oc0VU3cmgy+
 WFm1/Dfl6HqqnEHl33zH1a98g9aCSJT463RcwZN6Su6ZwvD8DVe/DS0tAfloDvueDrc4
 LGQg==
X-Gm-Message-State: ANhLgQ1wNqgb5ZuGYUygflfqxbIjmBOhq6TfGVlf/xk3gBXcWOFwViTv
 tB2sgYqjuwC8q1vGlqjMGFceiw==
X-Google-Smtp-Source: ADFU+vviTRCdmgfCT1G7aHiQMxYpPCKgokrk2seQ0tBvxGHxZzPVkykgdr4KVDwSWNzhNmMy4WsvbQ==
X-Received: by 2002:a05:6214:1907:: with SMTP id
 er7mr1154696qvb.199.1583182155940; 
 Mon, 02 Mar 2020 12:49:15 -0800 (PST)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y3sm3033817qki.7.2020.03.02.12.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 12:49:15 -0800 (PST)
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
Date: Mon, 2 Mar 2020 15:48:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200302203452.17977-34-ville.syrjala@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Brian Masney <masneyb@onstation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpUaGlzIGlzIGEgY29tbWFuZCBtb2RlIHBhbmVsIGFuZCB0aGUgdGhlIG1zbS9tZHA1IGRy
aXZlciB1c2VzIHRoZSAKdnJlZnJlc2ggZmllbGQgZm9yIHRoZSBhY3R1YWwgcmVmcmVzaCByYXRl
LCB3aGlsZSB0aGUgZG90Y2xvY2sgZmllbGQgaXMgCnVzZWQgZm9yIHRoZSBEU0kgY2xvY2tzLiBU
aGUgZG90Y2xvY2sgbmVlZGVkIHRvIGJlIGEgYml0IGhpZ2hlciB0aGFuIApuZWNlc3Nhcnkgb3Ro
ZXJ3aXNlIHRoZSBwYW5lbCB3b3VsZCBub3Qgd29yay4KCklmIHlvdSB3YW50IHRvIGdldCByaWQg
b2YgdGhlIHNlcGFyYXRlIGNsb2NrL3ZyZWZyZXNoIGZpZWxkcyB0aGVyZSB3b3VsZCAKbmVlZCB0
byBiZSBzb21lIGNoYW5nZXMgdG8gbXNtIGRyaXZlci4KCihub3RlIEkgaGFkbid0IG1hZGUgdGhl
IHBhdGNoIHdpdGggdXBzdHJlYW1pbmcgaW4gbWluZCwgdGhlIDE1MDAwMCB2YWx1ZSAKaXMgbGlr
ZWx5IG5vdCBvcHRpbWFsLCBqdXN0IHNvbWV0aGluZyB0aGF0IHdvcmtlZCwgdGhpcyBpcyBzb21l
dGhpbmcgCnRoYXQgc2hvdWxkIGhhdmUgYmVlbiBjaGVja2VkIHdpdGggdGhlIGRvd25zdHJlYW0g
ZHJpdmVyKQoKLUpvbmF0aGFuCgpPbiAzLzIvMjAgMzozNCBQTSwgVmlsbGUgU3lyamFsYSB3cm90
ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+IAo+IFRoZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBj
dXJyZW50bHkKPiBsaXN0ZWQgdnJlZnJlc2ggcmF0ZS4gQ2hhbmdlIHRoZSBkb3RjbG9jayB0byBt
YXRjaCB0aGUgdnJlZnJlc2guCj4gCj4gU29tZW9uZSB0ZWxsIG1lIHdoaWNoIChpZiBlaXRoZXIp
IG9mIHRoZSBkb3RjbG9jayBvciB2cmVyZXNoIGlzCj4gY29ycmVjdD8KPiAKPiBDYzogSm9uYXRo
YW4gTWFyZWsgPGpvbmF0aGFuQG1hcmVrLmNhPgo+IENjOiBCcmlhbiBNYXNuZXkgPG1hc25leWJA
b25zdGF0aW9uLm9yZz4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gaW5kZXggYjI0ZmRmMjM5
NDQwLi5mOTU4ZDhkZmQ3NjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5j
Cj4gQEAgLTM5OTYsNyArMzk5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzY19k
c2kgcGFuYXNvbmljX3Z2eDEwZjAwNGIwMCA9IHsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsZ19hY3g0Njdha21fN19tb2RlID0gewo+IC0JLmNs
b2NrID0gMTUwMDAwLAo+ICsJLmNsb2NrID0gMTI1NDk4LAo+ICAgCS5oZGlzcGxheSA9IDEwODAs
Cj4gICAJLmhzeW5jX3N0YXJ0ID0gMTA4MCArIDIsCj4gICAJLmhzeW5jX2VuZCA9IDEwODAgKyAy
ICsgMiwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
