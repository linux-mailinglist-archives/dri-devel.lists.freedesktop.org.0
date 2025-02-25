Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A990BA441BE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5E810E6AD;
	Tue, 25 Feb 2025 14:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vAR6wyMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5FC10E6AD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:05:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z2KBd5wcTz9t2V;
 Tue, 25 Feb 2025 15:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1740492345; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLSpEGcC77wIQmZJksee9yhIIq3PSjdTX1aHfxbQZVY=;
 b=vAR6wyMvZfVbcbaiRKOMNdm12/hhF2EyyB3sqhwVOTPT1Yxhgu6eIK8wssbIej3sA5akqG
 TTt7XmiEBrU07kSQwLFS4egYesTPGsuE+WXKLyanVqrWa1bxIH0Jv+hybXoL2lCfQxTVbF
 /xE7bLNLIUXx7nNAjoXMfIzTxT2HUvo9H+hj3+SIpckMCDlKfqD1unlnk6AFGSH6QgCLVW
 I2PdQsezRx6eWyHBxORPmJg78tToQylsRsTPWE2DLGfAE7BHkHOCMgnqn3N8XBS58Bx/w/
 cHKwfUjKC2QXWSI8uCr3jVUS5baSA/rNaxyWfNsVwQrVYlLxA6p7irF1vzodiA==
Message-ID: <811ba40a31484ca5db4b0c380b9e67bec6517e4b.camel@mailbox.org>
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
From: Philipp Stanner <phasta@mailbox.org>
To: Markus Elfring <Markus.Elfring@web.de>, Qianyi Liu
 <liuqianyi125@gmail.com>,  dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Danilo
 Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maxime Ripard <mripard@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 25 Feb 2025 15:05:41 +0100
In-Reply-To: <bc3ae5a6-9b04-4f1b-9045-2182138f748e@web.de>
References: <20250221062702.1293754-1-liuqianyi125@gmail.com>
 <bc3ae5a6-9b04-4f1b-9045-2182138f748e@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MBO-RS-META: dd6a6nf7oo9ofk4m88751433po3qicsf
X-MBO-RS-ID: 63c041e860d98793a80
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTAyLTI1IGF0IDE1OjAwICswMTAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
PiA+IFByb2JsZW06IElmIHByZXYobGFzdF9zY2hlZHVsZWQpIHdhcyBhbHJlYWR5IHNpZ25hbGVk
IEkgZW5jb3VudHJlZAo+ID4gYQo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNpZ25hbGxlZD8KPiBlbmNvdW50ZXJlZD8KPiAKPiAKPiA+IG1lbW9yeSBsZWFrIGluIGRy
bV9zY2hlZF9lbnRpdHlfZmluaS4gVGhpcyBpcyBiZWNhdXNlIHRoZQo+ID4gcHJldihsYXN0X3Nj
aGVkdWxlZCkgZmVuY2UgaXMgbm90IGZyZWUgcHJvcGVybHkuCj4gCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBm
cmVlZD8KPiAKPiAKPiA+IEZpeDogQmFsYW5jZSB0aGUgcHJldihsYXN0X3NjaGVkdWxlZCkgZmVu
Y2UgcmVmY250IHdoZW4KPiDigKYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVmZXJlbmNlIGNvdW50Pwo+IAo+IAo+IFdvdWxkIGEgc3VtbWFyeSBwaHJhc2UgbGlrZSDigJxG
aXggbWVtb3J5IGxlYWsgd2hlbiBsYXN0X3NjaGVkdWxlZAo+IHNpZ25hbGxlZOKAnQo+IGJlIG1v
cmUgYXBwcm9wcmlhdGU/Cj4gCj4gCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0byBhZGQgYW55
IHRhZ3MgKGxpa2Ug4oCcRml4ZXPigJ0gYW5kIOKAnENj4oCdKQo+IGFjY29yZGluZ2x5Pwo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xp
bnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0
P2g9djYuMTQtcmM0I24xNDUKPiAKCkhlIGhhcyBhbHJlYWR5IGFkZHJlc3NlZCB0aGF0IGluIHYy
LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI1MDk0MTI1LjIyNDU4MC0xLWxp
dXFpYW55aTEyNUBnbWFpbC5jb20vCgoKQmVzaWRlcywgTWF0dGhldyBhbmQgSSBtYWRlIHRob3Nl
IHJlbWFya3MgYWxyZWFkeSBoZXJlIGluIHYxLgoKClAuCgo+IFJlZ2FyZHMsCj4gTWFya3VzCgo=

