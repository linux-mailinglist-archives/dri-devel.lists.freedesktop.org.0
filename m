Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5022432BA19
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 20:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103336E17A;
	Wed,  3 Mar 2021 19:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181206E17A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 19:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id DE02B3F4D9;
 Wed,  3 Mar 2021 20:07:56 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=K3jxx52L; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.449
X-Spam-Level: 
X-Spam-Status: No, score=-2.449 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWAsjB0nZGID; Wed,  3 Mar 2021 20:07:55 +0100 (CET)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8A7E93F2DC;
 Wed,  3 Mar 2021 20:07:53 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id ED2D1360057;
 Wed,  3 Mar 2021 20:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614798473; bh=nKupVD6Xba+2uKQHTUnVnHc3sylFOHvp30xUyrZ7/AU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K3jxx52L2803o5MEVtLNblLXmNDqm9f9fB2aegV1Y5Y3ayfcYcOPumRfxAqWSqA4T
 HLnvLLZzf3rQq74nnomUpdnh2f0sTSKk6VYVaOF5T+Zb26ZifxmuVF/6EOOJrKLj62
 dbS6RKPwjMoGEgPlfRiLXT6LrtC/dIbqiBLzZ2Mk=
Subject: Re: [Linaro-mm-sig] [PATCH] dma-fence: Document recoverable page
 fault implications
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <d285bb0a-a226-21d6-ab0f-922b566c7532@shipmail.org>
Date: Wed, 3 Mar 2021 20:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, linaro-mm-sig@lists.linaro.org,
 Jerome Glisse <jglisse@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMy8yMSA0OjI5IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFJlY2VudGx5IHRoZXJl
IHdhcyBhIGZhaXJseSBsb25nIHRocmVhZCBhYm91dCByZWNvcmVhYmxlIGhhcmR3YXJlIHBhZ2UK
PiBmYXVsdHMsIGhvdyB0aGV5IGNhbiBkZWFkbG9jaywgYW5kIHdoYXQgdG8gZG8gYWJvdXQgdGhh
dC4KPgo+IFdoaWxlIHRoZSBkaXNjdXNzaW9uIGlzIHN0aWxsIGZyZXNoIEkgZmlndXJlZCBnb29k
IHRpbWUgdG8gdHJ5IGFuZAo+IGRvY3VtZW50IHRoZSBjb25jbHVzaW9ucyBhIGJpdC4gVGhpcyBk
b2N1bWVudGF0aW9uIHNlY3Rpb24gZXhwbGFpbnMKPiB3aGF0J3MgdGhlIHBvdGVudGlhbCBwcm9i
bGVtLCBhbmQgdGhlIHJlbWVkaWVzIHdlJ3ZlIGRpc2N1c3NlZCwKPiByb3VnaGx5IG9yZGVyZWQg
ZnJvbSBiZXN0IHRvIHdvcnN0Lgo+Cj4gdjI6IExpbnVzIC0+IExpbnV4IHR5cG9lIChEYXZlKQo+
Cj4gdjM6Cj4gLSBNYWtlIGl0IGNsZWFyIGRyaXZlcnMgb25seSBuZWVkIHRvIGltcGxlbWVudCBv
bmUgb3B0aW9uIChDaHJpc3RpYW4pCj4gLSBNYWtlIGl0IGNsZWFyZXIgdGhhdCBpbXBsaWNpdCBz
eW5jIGlzIG91dCB0aGUgd2luZG93IHdpdGggZXhjbHVzaXZlCj4gICAgZmVuY2VzIChDaHJpc3Rp
YW4pCj4gLSBBZGQgdGhlIGZhaXJseSB0aGVvcmV0aWNhbCBvcHRpb24gb2Ygc2VnZW1lbnRpbmcg
dGhlIG1lbW9yeSAoZWl0aGVyCj4gICAgc3RhdGljYWxseSBvciB0aHJvdWdoIGR5bmFtaWMgY2hl
Y2tzIGF0IHJ1bnRpbWUgZm9yIHdoaWNoIHBpZWNlIG9mCj4gICAgbWVtb3J5IGlzIG1hbmFnZWQg
aG93KSBhbmQgZXhwbGFpbiB3aHkgaXQncyBub3QgYSBncmVhdCBpZGVhIChGZWxpeCkKPgo+IFJl
ZmVyZW5jZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIxMDEwNzAzMDEy
Ny4yMDM5My0xLUZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20vCj4gQ2M6IERhdmUgQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ry
b21AaW50ZWwuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBDYzogSmVyb21lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBG
ZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IC0tLQo+ICAgRG9jdW1l
bnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0IHwgNzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKPgpBY2tlZC1ieTog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
