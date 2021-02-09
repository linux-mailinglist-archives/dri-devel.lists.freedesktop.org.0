Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5587315465
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF106E082;
	Tue,  9 Feb 2021 16:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035B46E082;
 Tue,  9 Feb 2021 16:53:15 +0000 (UTC)
Date: Tue, 9 Feb 2021 17:53:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612889594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLhz1mOsEx0W6YGz0MQO18zVKKP5dP/ZMkeQk0P5Pc0=;
 b=VssEa+oStlp146jqyc3ZrvBXNI7g3TJUDh/VJDsRLj+Gs1WOjbooyaID/DuIdnShJa4nMx
 20Pz+7QeK8ymrTuRIYB53RtqJNzcg6eWB19U5mQL2SYojF6wyIFESpDkeZDtpFmA2Ugb8/
 IU0n+g9NfkjB2WvIY4ELR0kentxL/WsKrsftqon75PlKTjGlSgty/wKY329j2KyKqHVf2f
 9MZkzwzwr5zotT5qmmwLOQz6XtA1+VkDpGzNw6gAlzRP9FpzN5gATGa/XpZOM4roHbgKB1
 1JIY9QRWzg89MsYSteDzrV++anRrzgnK+8421auxSBdosTZ9eMQCs/DoFmg98g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612889594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLhz1mOsEx0W6YGz0MQO18zVKKP5dP/ZMkeQk0P5Pc0=;
 b=zhSMo+t85v3qW2upAa6ffMtMdEgZ0ZQVFJfYU/Hi3m+W/S4q1CS9IMHzRqx7T/WGTRWrEU
 MUUoy7LxaJHz7cBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
Message-ID: <20210209165312.bq2yn73fqidt7hgl@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
 <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wMi0wOSAxMzo1MDozMSBbKzAxMDBdLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
IGZvciB0aGUgc2VyaWVzLgoKVGhhbmsgeW91LgpBbnkgY2hhbmNlIHlvdSBjb3VsZCBnaXZlIG1l
IGEgaGFuZCB3aXRoIHRoZSByZW1haW5pbmcgdGhyZWUgdXNlcnMKd2l0aGluIHRoZSBhbWRncHUg
ZHJpdmVyPyBJIGRvbid0IGtub3cgaWYgdGhlIGluX2ludGVycnVwdCgpIGNoZWNrIGNhbgpiZSBs
aW1pdGVkIHRvIGNlcnRhaW4gY2FsbGVycy4KV2hhdCBJIG5vdGljZWQgd2hpbGUgdHJhY2luZyB2
NS4xMCBpcyB0aGlzOgoKfCAgICAgICAgICAgICBYb3JnLTIyNTcgICAgWzAwN10gZC4uLiA1NzI2
MS42MjAwNDM6IGFtZGdwdV9kZXZpY2Vfd3JlZzogMHg2OTlmLCAweDAwMDAxYmNmLCAweDAwMDAw
MTAwCnwgID0+IHRyYWNlX2V2ZW50X3Jhd19ldmVudF9hbWRncHVfZGV2aWNlX3dyZWcKfCAgPT4g
YW1kZ3B1X2RldmljZV93cmVnLnBhcnQuMAp8ICA9PiBkY2UxMTBfYXJtX3ZlcnRfaW50cgp8ICA9
PiBkY2UxMTBfdmJsYW5rX3NldAp8ICA9PiBkbV9lbmFibGVfdmJsYW5rCnwgID0+IGRybV92Ymxh
bmtfZW5hYmxlCnwgID0+IGRybV92YmxhbmtfZ2V0CnwgID0+IGRybV93YWl0X3ZibGFua19pb2N0
bAp8ICA9PiBkcm1faW9jdGxfa2VybmVsCnwgID0+IGRybV9pb2N0bAp8ICA9PiBhbWRncHVfZHJt
X2lvY3RsCnwgID0+IF9feDY0X3N5c19pb2N0bAp8ICA9PiBkb19zeXNjYWxsXzY0CnwgID0+IGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZQoKSSB0aGluayB0aGF0IGFtZGdwdV9kZXZpY2Vf
d3JlZygpIC0+IGFtZGdwdV9raXFfd3JlZygpIGNvdWxkIGJlIGludm9rZWQuCkl0IGRvZXNuJ3Qg
aGVyZSBiZWNhdXNlIGFtZGdwdV9zcmlvdl9ydW50aW1lKCkgaXMgZmFsc2UuClRoZSB0cmFjZSBz
YXlzIGBkJyB3aGljaCBtZWFucyBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZCBidXQKaW5faW50ZXJy
dXB0KCkgd2lsbCByZXR1cm4gZmFsc2UgaW4gdGhpcyBjYXNlIChubyBJUlEvc29mdGlycSkuCgpT
ZWJhc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
