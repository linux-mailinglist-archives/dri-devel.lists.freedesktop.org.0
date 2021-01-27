Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B0307113
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C5C6E926;
	Thu, 28 Jan 2021 08:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904BA89CCB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:53:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u4so2390811ljh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I2V5qL7ef4qnigee9vLt+3og4OBtjgl/PNhaajxHfkY=;
 b=fp1l0zczuSsluJ5rNV82ImxxiKA1iV7UFIkHHxxlokIwffYPKVYGqGBFu1FBEi8XDA
 dUPXjRdAbfZvt5tMQTSl1zFktsLeu+gJuwmeq241CLUSi6iAvNpFunl8YNzIG5UyS7RI
 Fara4J5IgUT27agOZzW8MN0puhQYLOL8X/TISxefKHmLoSgtFw9gQJZRaiPGRyRpYhL3
 XvOPfKGOGWNx7gPuGHDGiE6jpRZYul9IoMUnFWq0zd9J/c5SDA9mO5AW3crm0AMmqzvI
 WO1coAScJMIPUAUWKpdEVUex+CzOb1XL8h5e3E9OFlFHjluKyJR4PUmjQUCjhQBti3MB
 AV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I2V5qL7ef4qnigee9vLt+3og4OBtjgl/PNhaajxHfkY=;
 b=oZ/9bgz4FReWPKyHDD4NgB9Ph19TQK1Yt2mMsIOMJWfY9xROmZBC/s0I4em/BpbPf/
 axA/CGuBsMh3uk45UFi9xdVpB9XDn1bsZl36miMASKL9ucZXgzx/KwoeAwmqywxtmG0D
 bHkOY1/CGKMHIw2+d0jz7Yo4D5ONvsl95J5v2/9IfQCcUdPk8UqARYGTcnoWTUH1pyA1
 xMZRzzSgYodBVbo7MC1dXtp1yquvLW8xrtUDAt8o0CYqcFFuVS08Gs7ug0uRfTzJr/xb
 BugQW+wAvGVEcs3JQ64G03b9lp4izvOVs2qCA8ma+RpfcRz3c9AdKcEhphLh79J41xTn
 XElQ==
X-Gm-Message-State: AOAM532SZjL960Im7nG4tR2FgyQyVdaEtbs9xtgrvkWtWwQXmjV5Y30V
 mT3XtiCWZdbwVHR8AGjgyck=
X-Google-Smtp-Source: ABdhPJykpTqIXPlX22xvTJ7uWlP/yBGwsd3B47unBuHTo1XyPLU+9TV1fmfI8EPxij8D0d2qtyX+kA==
X-Received: by 2002:a2e:b743:: with SMTP id k3mr6465157ljo.337.1611784379887; 
 Wed, 27 Jan 2021 13:52:59 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6?
 ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
 by smtp.googlemail.com with ESMTPSA id g21sm839837lfr.212.2021.01.27.13.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:52:59 -0800 (PST)
Subject: Re: [PATCH v5 00/21] support option where all commands are collected
 into a single,dedicated cmdstream
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0d4c6ed-c942-97cb-379b-09482aa73020@gmail.com>
Date: Thu, 28 Jan 2021 00:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDEuMjAyMSAwNTo0NSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IDYuIFdlIHdp
bGwgbmVlZCB0byBhbGxvY2F0ZSBhIGhvc3QxeCBCTyBmb3IgYSBqb2IncyBjbWRzdHJlYW0gYW5k
IGFkZCBhCj4+IHJlc3RhcnQgY29tbWFuZCB0byB0aGUgZW5kIG9mIHRoZSBqb2IncyBzdHJlYW0u
wqAgQ0RNQSB3aWxsIGp1bXAgaW50byB0aGUKPj4gam9iJ3Mgc3RyZWFtIGZyb20gcHVzaCBidWZm
ZXIuCj4+Cj4+IFdlIGNvdWxkIGFkZCBhIGZsYWcgZm9yIHRoYXQgdG8gZHJtX3RlZ3JhX3N1Ym1p
dF9jbWRfZ2F0aGVyLCBzYXlpbmcgdGhhdAo+PiBnYXRoZXIgc2hvdWxkIGJlIGlubGluZWQgaW50
byBqb2IncyBtYWluIGNtZHN0cmVhbS4KPj4KPj4gVGhpcyB3aWxsIHJlbW92ZSBhIG5lZWQgdG8g
aGF2ZSBhIGxhcmdlIHB1c2ggYnVmZmVyIHRoYXQgd2lsbCBlYXNpbHkKPj4gb3ZlcmZsb3csIGl0
J3MgYSByZWFsIHByb2JsZW0gYW5kIHVwc3RyZWFtIGRyaXZlciBldmVuIGhhcyBhIGJ1ZyB3aGVy
ZQo+PiBpdCBsb2NrcyB1cCBvbiBvdmVyZmxvdy4KPj4KPj4gSG93IGl0IHdpbGwgbG9vayBmcm9t
IENETUEgcGVyc3BlY3RpdmU6Cj4+Cj4+IFBVU0hCVUYgfAo+PiAtLS0tLS0tLS0KPj4gLi4uwqDC
oMKgwqAgfMKgwqDCoMKgwqAgfCBKT0LCoMKgIHwKPj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKg
wqDCoCAtLS0tLS0tLS3CoMKgwqDCoMKgwqAgfCBKT0IgR0FUSEVSIHwKPj4gUkVTVEFSVMKgwqDC
oCAtLS0tLS0+IENNRMKgwqDCoCB8wqDCoMKgwqDCoMKgIC0tLS0tLS0tLS0tLS0tCj4+IMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqDCoMKgwqAgfEdBVEhFUiAtLS0tLS0tPiBEQVRBwqDCoMKgwqDCoMKg
wqAgfAo+PiAuLi4gPC0tLS0tLS0tLS0gUkVTVEFSVHzCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfAo+PiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqAgfAo+Pgo+IAo+IExldCBtZSBjaGVjayBpZiBJIHVuZGVyc3Rvb2QgeW91IGNvcnJlY3RseToK
PiAtIFlvdSB3b3VsZCBsaWtlIHRvIGhhdmUgdGhlIGpvYidzIGNtZGJ1ZiBoYXZlIGZ1cnRoZXIg
R0FUSEVSIG9wY29kZXMKPiB0aGF0IGp1bXAgaW50byBzbWFsbGVyIGdhdGhlcnM/CgpJIHdhbnQg
am9icyB0byBiZSBhIHNlbGYtY29udGFpbmVkLiBJbnN0ZWFkIG9mIHB1c2hpbmcgY29tbWFuZHMg
dG8gdGhlClBCIG9mIGEga2VybmVsIGRyaXZlciwgd2UnbGwgcHVzaCB0aGVtIHRvIGpvYidzIGNt
ZHN0cmVhbS4gVGhpcyBtZWFucwp0aGF0IGZvciBlYWNoIG5ldyBqb2Igd2UnbGwgbmVlZCB0byBh
bGxvY2F0ZSBhIGhvc3QxeCBidWZmZXIuCgo+IEkgYXNzdW1lIHRoaXMgaXMgbmVlZGVkIGJlY2F1
c2UgY3VycmVudGx5IFdBSVRzIGFyZSBwbGFjZWQgaW50byB0aGUKPiBwdXNoYnVmZmVyLCBzbyB0
aGUgam9iIHdpbGwgdGFrZSBhIGxvdCBvZiBzcGFjZSBpbiB0aGUgcHVzaGJ1ZmZlciBpZgo+IHRo
ZXJlIGFyZSBhIGxvdCBvZiB3YWl0cyAoYW5kIEdBVEhFUnMgaW4gYmV0d2VlbiB0aGVzZSB3YWl0
cyk/CgpZZXMsIGFuZCB3aXRoIGRybS1zY2hlZCB3ZSB3aWxsIGp1c3QgbmVlZCB0byBsaW1pdCB0
aGUgbWF4IG51bWJlciBvZgpqb2JzIGluIHRoZSBoL3cgcXVldWUgKGkuZS4gcHVzaCBidWZmZXIp
IGFuZCB0aGVuIHB1c2ggYnVmZmVyIHdvbid0IGV2ZXIKb3ZlcmZsb3cuIFByb2JsZW0gc29sdmVk
LgoKPiBJZiBzbywgcGVyaGFwcyBhcyBhIHNpbXBsZXIgYWx0ZXJuYXRpdmUgd2UgY291bGQgY2hh
bmdlIHRoZSBmaXJld2FsbCB0bwo+IGFsbG93IFNFVENMQVNTIGludG8gSE9TVDFYIGZvciB3YWl0
aW5nIHNwZWNpZmljYWxseSwgdGhlbiB1c2Vyc3BhY2UKPiBjb3VsZCBqdXN0IHN1Ym1pdCBvbmUg
YmlnIGNtZGJ1ZiB0YWtpbmcgb25seSBsaXR0bGUgc3BhY2UgaW4gdGhlCj4gcHVzaGJ1ZmZlcj8g
QWx0aG91Z2ggdGhhdCB3b3VsZCBvbmx5IGFsbG93IGRpcmVjdCBJRC90aHJlc2hvbGQgd2FpdHMu
CgpNeSBzb2x1dGlvbiBkb2Vzbid0IHJlcXVpcmUgY2hhbmdlcyB0byBmaXJld2FsbCwgbm90IHN1
cmUgd2hldGhlciBpdCdzCmVhc2llci4KCj4gSW4gYW55IGNhc2UsIGl0IHNlZW1zIHRoYXQgdGhp
cyBjYW4gYmUgYWRkZWQgaW4gYSBsYXRlciBwYXRjaCwgc28gd2UKPiBzaG91bGQgb21pdCBpdCBm
cm9tIHRoaXMgc2VyaWVzIGZvciBzaW1wbGljaXR5LiBJZiBpdCBpcyBpbXBvc3NpYmxlIGZvcgo+
IHRoZSB1c2Vyc3BhY2UgdG8gZGVhbCB3aXRoIGl0LCB3ZSBjb3VsZCBkaXNhYmxlIHRoZSBmaXJl
d2FsbAo+IHRlbXBvcmFyaWx5LCBvciBpbXBsZW1lbnQgdGhlIGFib3ZlIGNoYW5nZSBpbiB0aGUg
ZmlyZXdhbGwuCgpJIHdvbid0IGJlIGFibGUgdG8gdGVzdCBVQVBJIGZ1bGx5IHVudGlsIGFsbCBm
ZWF0dXJlcyBhcmUgYXQgbGVhc3Qgb24KcGFyIHdpdGggdGhlIGV4cGVyaW1lbnRhbCBkcml2ZXIg
b2YgZ3JhdGUga2VybmVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
