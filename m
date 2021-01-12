Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F42F2D49
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 11:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD66E1BC;
	Tue, 12 Jan 2021 10:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6966E1BB;
 Tue, 12 Jan 2021 10:58:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h16so1792662edt.7;
 Tue, 12 Jan 2021 02:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/ZB0N9vFqdWQk9aTiwyMQta6u5tE3PztKaAxQ3G3b7s=;
 b=Migt3eVdKoQRMPNcP/HVGQscVh1Of3rgq6FI2xoTY8xVimL2tg/COK23Uc5gVcotsc
 plWkeXRcWL+4jEbpcvBqA27ji7zxMA51p7sqyvURfnh7MVgosE4gPX3UGSft7HfN8bvQ
 RyX1UQ2Fy/gsrzU9PkTD7An6cS7bRRcgPsk5RIKH3bub1Emv6fp+cyi4766J9IlvDqev
 XIcpyRPUARS+G3vdr2AEoaER1KPFb4tNPGPQiy4Fvh49HZ8MBdLAK2rH95Ior7k7Ra4i
 fs82z3FGW5LHMVg6LMYd3l6Cb9e8Li77uyp0M26eZdgNdEbeIi2if21+2Qzk4h7MNBjX
 NeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/ZB0N9vFqdWQk9aTiwyMQta6u5tE3PztKaAxQ3G3b7s=;
 b=W9IydW0QXpFJ79nwiCsjARGBFoHrI5/BMWlS9NqRVufwp15mCJaDfvOTNXUBMTZ54q
 7BORHUnFcwzxh8kBCIWskaT+B6I+Of8RzFr7f6m2CPH9oOHyTEhjzvvNm8uT1UowPogk
 KfFcU4zOPpPuTuY5KUEkzaeYLC2vKbJ5mbCl35FaVmoFBoRS1lY+peO5LlzwuOjn+//N
 SENG/9WiE54BGKoGNPso9X1RpHACvDneZqdVcwF2lFvIaH+Rea0CcF6Yp8Mpk0dcDBUR
 SQLBdY974U2SHYdXaRyAlvIo5Vk0bXpvgZx2+Tu8LaTiIFxD5mvDqvyhw1UMpgbkGyUp
 uE3g==
X-Gm-Message-State: AOAM531IEop8ZJc4eTW/QgcM5l6KLnpsvEihLXFVpGIbClpzLZDOMoLM
 0k/JcJTJvprEVyeSukC7nOk=
X-Google-Smtp-Source: ABdhPJxPFNY4h1wbZrWA9dit0lXCRTetVi1fePu5eJBo/v9B0oVZh49ovIz7q+QeQubyuxfaZAFT7Q==
X-Received: by 2002:aa7:cb12:: with SMTP id s18mr2911166edt.125.1610449137170; 
 Tue, 12 Jan 2021 02:58:57 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d22sm1041266eja.72.2021.01.12.02.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 02:58:56 -0800 (PST)
Subject: Re: [PATCH] amdgpu: Avoid sleeping during FPU critical sections
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jeremy Cline <jcline@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20210108215838.470637-1-jcline@redhat.com>
 <3c94f9d6-501d-271c-ca83-1cf4229cb3ab@amd.com>
 <X/x9ojzg8XcCG+ZT@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <410b2ed4-2760-f851-55ff-7065217b633b@gmail.com>
Date: Tue, 12 Jan 2021 11:58:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/x9ojzg8XcCG+ZT@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDEuMjEgdW0gMTc6MzIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSmFu
IDExLCAyMDIxIGF0IDA5OjUzOjU2QU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA4LjAxLjIxIHVtIDIyOjU4IHNjaHJpZWIgSmVyZW15IENsaW5lOgo+Pj4gZGNuMjBfcmVz
b3VyY2VfY29uc3RydWN0KCkgaW5jbHVkZXMgYSBudW1iZXIgb2Yga3phbGxvYyhHRlBfS0VSTkVM
KQo+Pj4gY2FsbHMgd2hpY2ggY2FuIHNsZWVwLCBidXQga2VybmVsX2ZwdV9iZWdpbigpIGRpc2Fi
bGVzIHByZWVtcHRpb24gYW5kCj4+PiBzbGVlcGluZyBpbiB0aGlzIGNvbnRleHQgaXMgaW52YWxp
ZC4KPj4+Cj4+PiBUaGUgb25seSBwbGFjZXMgdGhlIEZQVSBhcHBlYXJzIHRvIGJlIHJlcXVpcmVk
IGlzIGluIHRoZQo+Pj4gaW5pdF9zb2NfYm91bmRpbmdfYm94KCkgZnVuY3Rpb24gYW5kIHdoZW4g
Y2FsY3VsYXRpbmcgdGhlCj4+PiB7bWluLG1heH1fZmlsbF9jbGtfbWh6LiBOYXJyb3cgdGhlIHNj
b3BlIHRvIGp1c3QgdGhlc2UgdHdvIHBhcnRzIHRvCj4+PiBhdm9pZCBzbGVlcGluZyB3aGlsZSB1
c2luZyB0aGUgRlBVLgo+Pj4KPj4+IEZpeGVzOiA3YThhMzQzMGJlMTUgKCJhbWRncHU6IFdyYXAg
RlBVIGRlcGVuZGVudCBmdW5jdGlvbnMgaW4gZGMyMCIpCj4+PiBDYzogVGltb3RoeSBQZWFyc29u
IDx0cGVhcnNvbkByYXB0b3JlbmdpbmVlcmluZy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKZXJl
bXkgQ2xpbmUgPGpjbGluZUByZWRoYXQuY29tPgo+PiBHb29kIGNhdGNoLCBidXQgSSB3b3VsZCBy
YXRoZXIgcmVwbGFjZSB0aGUga3phbGxvYyhHRlBfS0VSTkVMKSB3aXRoIGEKPj4ga3phbGxvYyhH
RlBfQVRPTUlDKSBmb3Igbm93Lgo+Pgo+PiBXZSBoYXZlIHRvbnMgb2YgcHJvYmxlbXMgd2l0aCB0
aGlzIERDX0ZQX1NUQVJUKCkvRENfRlBfRU5EKCkgYW5ub3RhdGlvbnMgYW5kCj4+IGFyZSBldmVu
IGluIHRoZSBwcm9jZXNzIG9mIG1vdmluZyB0aGVtIG91dCBvZiB0aGUgZmlsZSBiZWNhdXNlIHRo
ZSBjb21waWxlcwo+PiB0ZW5kIHRvIGNsdXR0ZXIgRlAgcmVnaXN0ZXJzIGV2ZW4gb3V0c2lkZSBv
ZiB0aGUgYW5ub3RhdGVkIHJhbmdlcyBvbiBzb21lCj4+IGFyY2hpdGVjdHVyZXMuCj4gT3V0IG9m
IGN1cmlvc2l0eSwgd2hhdCdzIHRoZSBwbGFuPyBTb2Z0LWZwIGltcGxlbWVudGF0aW9uIGZvciBE
QyBzbyB5b3UKPiBjYW4ga2VlcCB0aGUgYWxnb3JpdGhtcyBhbGwgdW5jaGFuZ2VkLCBvciByZWRv
aW5nIHRoZW0gYXMgc29tZSBmaXhlZCBwb2ludAo+IHdpdGggY2FyZWZ1bCByZXZpZXcgYW5kIHJl
dGVzdGluZyBldmVyeXRoaW5nPyBTb21ldGhpbmcgZWxzZT8KCk15IGxhc3Qgc3RhdHVzIGlzIHRo
YXQgd2Ugd2FudCB0byBtb3ZlIGFsbCBGUCByZWxhdGVkIGZ1bmN0aW9ucyBpbnRvIGEgCnNlcGFy
YXRlIEMgZmlsZS4KClRoZW4gY29tcGlsZSBvbmx5IHRoYXQgZmlsZSB3aXRoIEZQIGVuYWJsZWQg
YW5kIGFsbCBjYWxsZXJzIG9mIHRob3NlIApmdW5jdGlvbnMgbXVzdCBwcm90ZWN0ZWQgdGhlIGZ1
bmN0aW9uIGNhbGxzIHdpdGggRlAgZW5hYmxlL2Rpc2FibGUuCgpUaGF0J3MgdGhlIG9ubHkgd2F5
IHdlIGNhbiBndWFyYW50ZWUgdGhhdCBubyBGUCBzdGF0ZSBpcyBjb3JydXB0ZWQuCgpSZWdhcmRz
LApDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+
PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jIHwgOCArKysrLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwo+Pj4gaW5kZXggZTA0ZWNmMGZj
MGRiLi5hNGZhNWJmMDE2YzEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPj4+IEBAIC0zNjIyLDYgKzM2
MjIsNyBAQCBzdGF0aWMgYm9vbCBpbml0X3NvY19ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywK
Pj4+ICAgIAlpZiAoYmIgJiYgQVNJQ1JFVl9JU19OQVZJMTJfUChkYy0+Y3R4LT5hc2ljX2lkLmh3
X2ludGVybmFsX3JldikpIHsKPj4+ICAgIAkJaW50IGk7Cj4+PiArCQlEQ19GUF9TVEFSVCgpOwo+
Pj4gICAgCQlkY24yXzBfbnYxMl9zb2Muc3JfZXhpdF90aW1lX3VzID0KPj4+ICAgIAkJCQlmaXhl
ZDE2X3RvX2RvdWJsZV90b19jcHUoYmItPnNyX2V4aXRfdGltZV91cyk7Cj4+PiAgICAJCWRjbjJf
MF9udjEyX3NvYy5zcl9lbnRlcl9wbHVzX2V4aXRfdGltZV91cyA9Cj4+PiBAQCAtMzcyMSw2ICsz
NzIyLDcgQEAgc3RhdGljIGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMs
Cj4+PiAgICAJCQlkY24yXzBfbnYxMl9zb2MuY2xvY2tfbGltaXRzW2ldLmRyYW1fc3BlZWRfbXRz
ID0KPj4+ICAgIAkJCQkJZml4ZWQxNl90b19kb3VibGVfdG9fY3B1KGJiLT5jbG9ja19saW1pdHNb
aV0uZHJhbV9zcGVlZF9tdHMpOwo+Pj4gICAgCQl9Cj4+PiArCQlEQ19GUF9FTkQoKTsKPj4+ICAg
IAl9Cj4+PiAgICAJaWYgKHBvb2wtPmJhc2UucHBfc211KSB7Cj4+PiBAQCAtMzc3Nyw4ICszNzc5
LDYgQEAgc3RhdGljIGJvb2wgZGNuMjBfcmVzb3VyY2VfY29uc3RydWN0KAo+Pj4gICAgCWVudW0g
ZG1sX3Byb2plY3QgZG1sX3Byb2plY3RfdmVyc2lvbiA9Cj4+PiAgICAJCQlnZXRfZG1sX3Byb2pl
Y3RfdmVyc2lvbihjdHgtPmFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KTsKPj4+IC0JRENfRlBfU1RB
UlQoKTsKPj4+IC0KPj4+ICAgIAljdHgtPmRjX2Jpb3MtPnJlZ3MgPSAmYmlvc19yZWdzOwo+Pj4g
ICAgCXBvb2wtPmJhc2UuZnVuY3MgPSAmZGNuMjBfcmVzX3Bvb2xfZnVuY3M7Cj4+PiBAQCAtMzk1
OSw4ICszOTU5LDEwIEBAIHN0YXRpYyBib29sIGRjbjIwX3Jlc291cmNlX2NvbnN0cnVjdCgKPj4+
ICAgIAkJCQlyYW5nZXMucmVhZGVyX3dtX3NldHNbaV0ud21faW5zdCA9IGk7Cj4+PiAgICAJCQkJ
cmFuZ2VzLnJlYWRlcl93bV9zZXRzW2ldLm1pbl9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NF
VF9SQU5HRV9DTEtfVU5DT05TVFJBSU5FRF9NSU47Cj4+PiAgICAJCQkJcmFuZ2VzLnJlYWRlcl93
bV9zZXRzW2ldLm1heF9kcmFpbl9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5D
T05TVFJBSU5FRF9NQVg7Cj4+PiArCQkJCURDX0ZQX1NUQVJUKCk7Cj4+PiAgICAJCQkJcmFuZ2Vz
LnJlYWRlcl93bV9zZXRzW2ldLm1pbl9maWxsX2Nsa19taHogPSAoaSA+IDApID8gKGxvYWRlZF9i
Yi0+Y2xvY2tfbGltaXRzW2kgLSAxXS5kcmFtX3NwZWVkX210cyAvIDE2KSArIDEgOiAwOwo+Pj4g
ICAgCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tpXS5tYXhfZmlsbF9jbGtfbWh6ID0gbG9hZGVk
X2JiLT5jbG9ja19saW1pdHNbaV0uZHJhbV9zcGVlZF9tdHMgLyAxNjsKPj4+ICsJCQkJRENfRlBf
RU5EKCk7Cj4+PiAgICAJCQkJcmFuZ2VzLm51bV9yZWFkZXJfd21fc2V0cyA9IGkgKyAxOwo+Pj4g
ICAgCQkJfQo+Pj4gQEAgLTQxMjUsMTIgKzQxMjcsMTAgQEAgc3RhdGljIGJvb2wgZGNuMjBfcmVz
b3VyY2VfY29uc3RydWN0KAo+Pj4gICAgCQlwb29sLT5iYXNlLm9lbV9kZXZpY2UgPSBOVUxMOwo+
Pj4gICAgCX0KPj4+IC0JRENfRlBfRU5EKCk7Cj4+PiAgICAJcmV0dXJuIHRydWU7Cj4+PiAgICBj
cmVhdGVfZmFpbDoKPj4+IC0JRENfRlBfRU5EKCk7Cj4+PiAgICAJZGNuMjBfcmVzb3VyY2VfZGVz
dHJ1Y3QocG9vbCk7Cj4+PiAgICAJcmV0dXJuIGZhbHNlOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
