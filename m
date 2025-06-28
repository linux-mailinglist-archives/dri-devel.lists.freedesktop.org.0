Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CEBAEC779
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 15:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59D610E0B0;
	Sat, 28 Jun 2025 13:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PWKu+c64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0710E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 13:49:44 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso701908a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751118584; x=1751723384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Cd+ciLByq3LRGO8G0Mo9rb0LZaomCwo/towAFMRozlU=;
 b=PWKu+c64l1MLvJYI4rbvEabxSELyGQQL0kRWBDsIVT7WKOk9wLLQ8WpYEhii8dHoNa
 xbD3imMerKf8oxd8H5dvc1bY6Q0mXsGcwj+JwJqZFeJyrb2LybWwisFPsdx82PymgBte
 oOlcp5wKkE1EJEcQoymBfZLouMv1ILi6x9YNQdY2e4RYd/vJX1EibxbwYb/Q418c5Aa3
 BmKACh9dPwSfnrMSDuJ+5QF3OaWXOojzjsIm7lNHEHcIi2S3uHNU1ZecjkFt3KDzvaua
 a0KpdeF2EycTZyOziikj4XIs9W/T/RlXnwco2uh01NnWgfORiiEwxJLB8jt8AIbLwdYd
 CTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751118584; x=1751723384;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cd+ciLByq3LRGO8G0Mo9rb0LZaomCwo/towAFMRozlU=;
 b=CPbxRAiYeERAOgd72JTF4CWLdiMDuP7YhJ58L8hiWjRootcCiIZIABbbKDT+zc1pM6
 y2Pxwkl055a5Xwv0j0ESc71Sh6QrIebC98gVoK6Xh1vmSL+uNxaCWYh5kW9A6czYBF89
 GS8GwP2jjXF2W0R18e2SvPNlVPEDHSkdTSo8Nmc/1pzXNmeJGmtiBAZUiiXrbjbv8jBH
 drvMDfshCXilgLY0u0WlQV3CgmKfcPMDekW18QMCL79spRgDpi4NH1D9vANem9L2U9KH
 FKHczwIiECn2FftfMh+Gke7+AuYbW4KKkknMNexZs0rsSgnSQICwlMBO0PDpGAt0hkvb
 Vujg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLfMkwwLVYEaHYnrPveVYSfsKRzJZ550PHeuzKFFrWxRgKjrTBPGvZDG8D0JMBRDaZS/WjiRp7qvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8VXphWw/BO5g83tJiFrxo6DTZlzCCD3YNwalFEBboVpWOvdZS
 kchHJJGuKhtXOBlTrBip9p9s6V2MIhyNlfdzkR+WjqJCshvd4hLJhO5Q
X-Gm-Gg: ASbGncv1qLQG2ZwwA9lnrv/xjdlx+jq3KAmXoPgRCtLHZB1zz1Q3cicoHcoPaU11AQl
 XW8lyjfYpjgYb/Uf+8Ai4E0/A/OxWEWFotsuHY34DOoWcx5zzWGnHQPiWEFx57XBnegaST4/g7p
 +8dqCn+oAM3tWNiev3PJH9Ctvn2ZOveRB3AQsOuOu6rWNcR0iIdQ6O+L8DYbde7/UmUAaYkx/Ra
 SgeBwiU9qGEHRu8ic/JKrFvxQqLndPLuVVjJM7xlRh7kJP6xPpXAGuLPVL/Y5yl+LAxMykqRHz7
 cVuaYWHhPRiUVeyp0bkECgPyVVsYYKC9yFSnrHUmZJjobJilkUiQ5QeeYQIzQMuq72GR5U6m5u2
 ZzjRlRsNSN5XItUzFhDBBXB1TUnjrh5D1dW0o+DJMS6bNpm56+6o=
X-Google-Smtp-Source: AGHT+IHNKm5dkn6mnQptZdFdnu/mQN3UbWeEKv4Iseoi1OWcufhFeymz4Tk1ScLSjs3IkBpvLgJw7w==
X-Received: by 2002:a17:90b:5347:b0:313:2e69:8002 with SMTP id
 98e67ed59e1d1-318c92c8f19mr9661447a91.20.1751118584206; 
 Sat, 28 Jun 2025 06:49:44 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp.
 [180.34.120.7]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f539ed37sm8833234a91.18.2025.06.28.06.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 06:49:43 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:49:28 +0900 (JST)
Message-Id: <20250628.224928.690831629261546521.fujita.tomonori@gmail.com>
To: daniel.almeida@collabora.com, boqun.feng@gmail.com, a.hindborg@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniels@collabora.com, robh@kernel.org, alice.ryhl@google.com,
 beata.michalska@arm.com, carsten.haitzler@foss.arm.com,
 boris.brezillon@collabora.com, ashley.smith@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <CANiq72nJcEM09HbQB3_NpKGxr9x8Ah0VE+=XS=xvA26P2qg=_g@mail.gmail.com>
 <48605183-78B6-461E-9476-C96C8E55A55D@collabora.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCk9uIFNhdCwgMjggSnVuIDIwMjUgMTA6MDU6MTEgLTAzMDANCkRhbmllbCBBbG1laWRh
IDxkYW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToNCg0KPiBBbnl3YXksIEkgdGhv
dWdodCB0aGF0IGhhdmluZyBhIGJyYW5jaCB3b3VsZCBiZSBtb3JlIHRpZHkgdGhhbiBsaXN0aW5n
IHRoZW0sIGFzDQo+IHRoZSBicmFuY2ggc2hvd3MgaW4gd2hhdCBvcmRlciB0aGV5J3JlIGFwcGxp
ZWQgYW5kIGV0Yy4gRm9yIGV4YW1wbGUsIHRoZSBwYXRjaA0KPiBmb3IgcmVhZF9wb2xsX3RpbWVv
dXQgd2FzIGNoZXJyeS1waWNrZWQgZnJvbSBGdWppdGEncyB2MTIgc2VyaWVzLCBhbmQgdGhhdCB3
YXMNCj4gc3Vic2VxdWVudGx5IGRyb3BwZWQgaW4gdjEzIHVudGlsIHRoZSByZXN0IG9mIHRoZSBz
ZXJpZXMgd2FzIG1lcmdlZCBvbiB2MTUuIEkNCj4gdGhvdWdodCB0aGF0IHJlZmVycmluZyB0byB2
MTIgb2YgdGhhdCBzZXJpZXMgd291bGQgYmUgc2xpZ2h0bHkgY29uZnVzaW5nLg0KPiANCj4gSU9X
OiB0aGlzIHNob3VsZCBiZSBhcHBsaWFibGUgYXMgc29vbiBhcyB0aGUgZGVwZW5kZW5jaWVzIHRo
ZW1zZWx2ZXMgYXJlDQo+IG1lcmdlZC4gSSBhbSBob3BpbmcgdGhhdCB0aGlzIGNhbiBoYXBwZW4g
b24gdGhlIDYuMTcgbWVyZ2Ugd2luZG93IGFzIHRoZQ0KPiBjb21tZW50cyBvbiBtb3N0IG9mIHRo
ZW0gYXBwZWFyIHRvIGJlIGR5aW5nIGRvd24gc28gbWF5YmUgdGhlIHItYidzIHdpbGwgc3RhcnQN
Cj4gY29taW5nIHNvb24uIEl0IGFsc28gZ2l2ZXMgYSB1c2VyIHRvIHJlYWRfcG9sbF90aW1lb3V0
KCksIHdoaWNoIG1heSBwcm9tcHQgRnVqaXRhDQo+IHRvIGtlZXAgd29ya2luZyBvbiBpdC4NCg0K
SSBleHBlY3QgcmVhZF9wb2xsX3RpbWVvdXQoKSB0byBiZSBtZXJnZWQgZHVyaW5nIHRoZSA2LjE4
IHdpbmRvdy4NCg0KVG8gZXhwbGFpbiB0aGUgc2l0dWF0aW9uLCByZWFkX3BvbGxfdGltZW91dCgp
IGRlcGVuZHMgb24gZnNsZWVwKCkgYW5kDQptaWdodF9zbGVlcCgpIGFic3RyYWN0aW9ucy4NCg0K
SSBleHBlY3QgdGhlIGZvcm1lciB0byBiZSBwYXJ0IG9mIHdoYXQgQW5kcmVhcyBpcyBwcmVwYXJp
bmcgdG8gbWVyZ2UNCmZvciB0aGUgNi4xNyB3aW5kb3csIGFsb25nIHdpdGggdGhlIHBhdGNoc2V0
IGNvbnZlcnRpbmcgaHJ0aW1lciB0byB1c2UNCkluc3RhbnQgYW5kIERlbHRhLg0KDQpCb3F1biBo
YXMgc3VibWl0dGVkIHRoZSBsYXR0ZXIgYXMgYSBwdWxsIHJlcXVlc3QgdG8gdGhlIHRpcCB0cmVl
IGZvcg0KaW5jbHVzaW9uIGluIHRoZSA2LjE3IHdpbmRvdy4NCg0KU2luY2UgdGhlIHR3byBmZWF0
dXJlcyBhcmUgYmVpbmcgbWVyZ2VkIHRocm91Z2ggZGlmZmVyZW50IHRyZWVzIGFuZCBJDQpkb26i
dCB3YW50IHRvIGNvbXBsaWNhdGUgdGhlIHByb2Nlc3MsIEmibSBwbGFubmluZyB0byB0YXJnZXQN
CnJlYWRfcG9sbF90aW1lb3V0KCkgZm9yIHRoZSA2LjE4IG1lcmdlIHdpbmRvdy4NCg0KSWYgeW91
J3JlIHRhcmdldGluZyB0aGlzIGRyaXZlciBmb3IgNi4xNywgaXQgbWlnaHQgYmUgc2FmZXIgdG8N
CmltcGxlbWVudCBhIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBsaWtlIHRoZSBub3ZhIGRyaXZlciBk
aWQgYW5kIHJlcGxhY2UNCml0IGxhdGVyLg0KDQoNClRoYW5rcywNCg==
