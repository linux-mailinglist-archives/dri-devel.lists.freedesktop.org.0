Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4D02E9456
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 12:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D1289E1B;
	Mon,  4 Jan 2021 11:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FCA89E1B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 11:52:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id dk8so27094873edb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DfLO+6tfprck9fHLo23dyUoOOWOsjqNfG6uNyohQRMk=;
 b=HAbFoPe7kJgftSTM6Cp0zywsuxO1wwZDza5qZ8wGoKJdGT4X8Z6fpRxRKeezb1NO49
 /m7GQQc3e2ytK/oPtW+ntn8UC1CDwaKqEgAVMnYE5P51Hjz3QGPJuxqj9C46bHrj8HBF
 pDbz3MQJEsRX4j+uuTZrN/q7Gv54PjdVfMjlUAWE/1zeoEoLtCZbzsQqx41Nut0kqGUH
 UxlozevuP3aumaz+7h+blD1f+O4UBk84RXuaah+DMy7lNNDF2oQ+79CYBBhKPLiNAI/b
 A2MI9riV7Qq24/uELst4Z9Hp+ZIJ7FWQXm1ySYDgyjS4IgZAyi7D2P/CLwozaN3oAV/g
 d3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=DfLO+6tfprck9fHLo23dyUoOOWOsjqNfG6uNyohQRMk=;
 b=uPXGWwxNpArWCj35r0ZNrYsPTSCKwBZo2fIMLGoYwbk4SgiV+RbEWeHVlerV4M71fb
 XvrAsovnULBzSniZ3R5OimQx8zU/xDKGSnxB/rXX0o7mLFbnuRJvTeJz4QiY8U5NZp/q
 QTG0LfFS+pMOgH9x6Mfx/ty1gRU8tLZBVWnjgT347NJu8Upfhgm2SHln72/Yc8OEqTvC
 qbhJEeUHc2lBPznuwzkY0nMvYcIkI4s8eODoTffArW36D+zuK2PcvIi8FfvoFDWkPTQL
 ZQbSQ/Y8fMpeuouu9m4XB7TlKpYiGRcaLLJ0W7yZIhCcNa/YlEUaPUFomgSBqDmeTjvL
 HAjQ==
X-Gm-Message-State: AOAM532vOaE7l1WxapeRyZ0Hf+jbZQLf+LxNIyXL/s/9O7cGbKTtcF3J
 gpgkCRmq0MCpGqhHoQK9Xz4=
X-Google-Smtp-Source: ABdhPJyCRra5INYJCm1uVFgnKV1GOhoChn4TLjK7zpSbjFHjFmpX5DhL8lNI7qBck/pTS8zBsZWutQ==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr70719840eds.207.1609761166651; 
 Mon, 04 Jan 2021 03:52:46 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c25sm23342778ejx.39.2021.01.04.03.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 03:52:45 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH] dmabuf: fix use-after-free of dmabuf's
 file->f_inode
To: Charan Teja Reddy <charante@codeaurora.org>, sumit.semwal@linaro.org,
 christian.koenig@amd.com, arnd@arndb.de, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1609760177-6083-1-git-send-email-charante@codeaurora.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0dcbf9c5-3c28-0f57-0069-3fe5dc3aa7f6@gmail.com>
Date: Mon, 4 Jan 2021 12:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609760177-6083-1-git-send-email-charante@codeaurora.org>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDEuMjEgdW0gMTI6MzYgc2NocmllYiBDaGFyYW4gVGVqYSBSZWRkeToKPiBJdCBpcyBv
YnNlcnZlZCAndXNlLWFmdGVyLWZyZWUnIG9uIHRoZSBkbWFidWYncyBmaWxlLT5mX2lub2RlIHdp
dGggdGhlCj4gcmFjZSBiZXR3ZWVuIGNsb3NpbmcgdGhlIGRtYWJ1ZiBmaWxlIGFuZCByZWFkaW5n
IHRoZSBkbWFidWYncyBkZWJ1Zwo+IGluZm8uCj4KPiBDb25zaWRlciB0aGUgYmVsb3cgc2NlbmFy
aW8gd2hlcmUgUDEgaXMgY2xvc2luZyB0aGUgZG1hX2J1ZiBmaWxlCj4gYW5kIFAyIGlzIHJlYWRp
bmcgdGhlIGRtYV9idWYncyBkZWJ1ZyBpbmZvIGluIHRoZSBzeXN0ZW06Cj4KPiBQMQkJCQkJCVAy
Cj4gCQkJCQlkbWFfYnVmX2RlYnVnX3Nob3coKQo+IGRtYV9idWZfcHV0KCkKPiAgICBfX2ZwdXQo
KQo+ICAgICAgZmlsZS0+Zl9vcC0+cmVsZWFzZSgpCj4gICAgICBkcHV0KCkKPiAgICAgIC4uLi4K
PiAgICAgICAgZGVudHJ5X3VubGlua19pbm9kZSgpCj4gICAgICAgICAgaXB1dChkZW50cnktPmRf
aW5vZGUpCj4gICAgICAgICAgKHdoZXJlIHRoZSBpbm9kZSBpcyBmcmVlZCkKPiAJCQkJCW11dGV4
X2xvY2soJmRiX2xpc3QubG9jaykKPiAJCQkJCXJlYWQgJ2RtYV9idWYtPmZpbGUtPmZfaW5vZGUn
Cj4gCQkJCQkodGhlIHNhbWUgaW5vZGUgaXMgZnJlZWQgYnkgUDEpCj4gCQkJCQltdXRleF91bmxv
Y2soJmRiX2xpc3QubG9jaykKPiAgICAgICAgZGVudHJ5LT5kX29wLT5kX3JlbGVhc2UoKS0tPgo+
ICAgICAgICAgIGRtYV9idWZfcmVsZWFzZSgpCj4gICAgICAgICAgICAuLi4uLgo+ICAgICAgICAg
ICAgbXV0ZXhfbG9jaygmZGJfbGlzdC5sb2NrKQo+ICAgICAgICAgICAgcmVtb3ZlcyB0aGUgZG1h
YnVmIGZyb20gdGhlIGxpc3QKPiAgICAgICAgICAgIG11dGV4X3VubG9jaygmZGJfbGlzdC5sb2Nr
KQo+Cj4gSW4gdGhlIGFib3ZlIHNjZW5hcmlvLCB3aGVuIGRtYV9idWZfcHV0KCkgaXMgY2FsbGVk
IG9uIGEgZG1hX2J1ZiwgaXQKPiBmaXJzdCBmcmVlcyB0aGUgZG1hX2J1ZidzIGZpbGUtPmZfaW5v
ZGUoPWRlbnRyeS0+ZF9pbm9kZSkgYW5kIHRoZW4KPiByZW1vdmVzIHRoaXMgZG1hX2J1ZiBmcm9t
IHRoZSBzeXN0ZW0gZGJfbGlzdC4gSW4gYmV0d2VlbiBQMiB0cmF2ZXJzaW5nCj4gdGhlIGRiX2xp
c3QgdHJpZXMgdG8gYWNjZXNzIHRoaXMgZG1hX2J1ZidzIGZpbGUtPmZfaW5vZGUgdGhhdCB3YXMg
ZnJlZWQKPiBieSBQMSB3aGljaCBpcyBhIHVzZS1hZnRlci1mcmVlIGNhc2UuCj4KPiBTaW5jZSwg
X19mcHV0KCkgY2FsbHMgZl9vcC0+cmVsZWFzZSBmaXJzdCBhbmQgdGhlbiBsYXRlciBjYWxscyB0
aGUKPiBkX29wLT5kX3JlbGVhc2UsIG1vdmUgdGhlIGRtYV9idWYncyBkYl9saXN0IHJlbW92YWwg
ZnJvbSBkX3JlbGVhc2UoKSB0bwo+IGZfb3AtPnJlbGVhc2UoKS4gVGhpcyBlbnN1cmVzIHRoYXQg
ZG1hX2J1ZidzIGZpbGUtPmZfaW5vZGUgaXMgbm90Cj4gYWNjZXNzZWQgYWZ0ZXIgaXQgaXMgcmVs
ZWFzZWQuCj4KPiBGaXhlczogNGFiNTljM2M2MzhjICgiZG1hLWJ1ZjogTW92ZSBkbWFfYnVmX3Jl
bGVhc2UoKSBmcm9tIGZvcHMgdG8gZGVudHJ5X29wcyIpCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmFu
IFRlamEgUmVkZHkgPGNoYXJhbnRlQGNvZGVhdXJvcmEub3JnPgoKTm90IGFuIGV4cGVydCBvbiB0
aGUgZGVidWdmcyBzdHVmZiBpbiBETUEtYnVmLCBidXQgdGhlIGV4cGxhbmF0aW9uIApzb3VuZHMg
cGVyZmVjdGx5IGNvcnJlY3QgdG8gbWUuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMgfCAyMSArKysrKysrKysrKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gaW5kZXggMGViODBjMS4u
YTE0ZGNiYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IEBAIC03NiwxMCArNzYsNiBAQCBzdGF0aWMgdm9p
ZCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0IGRlbnRyeSAqZGVudHJ5KQo+ICAgCj4gICAJZG1hYnVm
LT5vcHMtPnJlbGVhc2UoZG1hYnVmKTsKPiAgIAo+IC0JbXV0ZXhfbG9jaygmZGJfbGlzdC5sb2Nr
KTsKPiAtCWxpc3RfZGVsKCZkbWFidWYtPmxpc3Rfbm9kZSk7Cj4gLQltdXRleF91bmxvY2soJmRi
X2xpc3QubG9jayk7Cj4gLQo+ICAgCWlmIChkbWFidWYtPnJlc3YgPT0gKHN0cnVjdCBkbWFfcmVz
diAqKSZkbWFidWZbMV0pCj4gICAJCWRtYV9yZXN2X2ZpbmkoZG1hYnVmLT5yZXN2KTsKPiAgIAo+
IEBAIC04OCw2ICs4NCwyMiBAQCBzdGF0aWMgdm9pZCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0IGRl
bnRyeSAqZGVudHJ5KQo+ICAgCWtmcmVlKGRtYWJ1Zik7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlu
dCBkbWFfYnVmX2ZpbGVfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAq
ZmlsZSkKPiArewo+ICsJc3RydWN0IGRtYV9idWYgKmRtYWJ1ZjsKPiArCj4gKwlpZiAoIWlzX2Rt
YV9idWZfZmlsZShmaWxlKSkKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwlkbWFidWYgPSBm
aWxlLT5wcml2YXRlX2RhdGE7Cj4gKwo+ICsJbXV0ZXhfbG9jaygmZGJfbGlzdC5sb2NrKTsKPiAr
CWxpc3RfZGVsKCZkbWFidWYtPmxpc3Rfbm9kZSk7Cj4gKwltdXRleF91bmxvY2soJmRiX2xpc3Qu
bG9jayk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRlbnRyeV9vcGVyYXRpb25zIGRtYV9idWZfZGVudHJ5X29wcyA9IHsKPiAgIAkuZF9kbmFtZSA9
IGRtYWJ1ZmZzX2RuYW1lLAo+ICAgCS5kX3JlbGVhc2UgPSBkbWFfYnVmX3JlbGVhc2UsCj4gQEAg
LTQxMyw2ICs0MjUsNyBAQCBzdGF0aWMgdm9pZCBkbWFfYnVmX3Nob3dfZmRpbmZvKHN0cnVjdCBz
ZXFfZmlsZSAqbSwgc3RydWN0IGZpbGUgKmZpbGUpCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZfZm9wcyA9IHsKPiArCS5yZWxlYXNlCT0g
ZG1hX2J1Zl9maWxlX3JlbGVhc2UsCj4gICAJLm1tYXAJCT0gZG1hX2J1Zl9tbWFwX2ludGVybmFs
LAo+ICAgCS5sbHNlZWsJCT0gZG1hX2J1Zl9sbHNlZWssCj4gICAJLnBvbGwJCT0gZG1hX2J1Zl9w
b2xsLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
