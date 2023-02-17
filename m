Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BE69AC64
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CDE10EFCB;
	Fri, 17 Feb 2023 13:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627D410EFCB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:28:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 203F41FF8E;
 Fri, 17 Feb 2023 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676640487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cskh/Slz/wxQqVy5FD0eso0SkxrjfDEIQyjsOKRe/Jg=;
 b=XCjVoH8DsWkXgVUUPpRoCmoiP+s5ywcMYdoezfsIHfIEb91v0+2wwFrvIH/LBPrUHynVN2
 YaN5Uwf/GPN6b1kDv1O7vCS6HdSV2ZrX3p8UBe7UVJ/cWUMahGHYu9rgdYsqLpW6QZHpoX
 p+Im2pl/zDNBHdkJDgIstjnKILZPUUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676640487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cskh/Slz/wxQqVy5FD0eso0SkxrjfDEIQyjsOKRe/Jg=;
 b=Cwt7fkQR6QGYsjLFg+X4ZhYEBEvBvHRr5QWIXssHWHxsQ3RMgQaJ4lDVMf+AVlqP6Yr0Hi
 Lq5I+gwOXl+876Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B7F7138E3;
 Fri, 17 Feb 2023 13:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dq3sJOaA72M4AwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 13:28:06 +0000
Message-ID: <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
Date: Fri, 17 Feb 2023 14:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jSEuHH3d6qvm0lU4VVh3Hu5e"
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jSEuHH3d6qvm0lU4VVh3Hu5e
Content-Type: multipart/mixed; boundary="------------oHIQ2yuJl4S50mFJAPZRR6on";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Message-ID: <ab018466-1659-d54d-4144-5e0879815de6@suse.de>
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>

--------------oHIQ2yuJl4S50mFJAPZRR6on
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgbG9va2VkIHRocm91Z2ggdGhlIHNlcmllcy4gTW9zdCBvZiB0aGUgcGF0Y2hl
cyBzaG91bGQgaGF2ZSBhbiByLWIgb3IgDQphLWIgYXQgdGhpcyBwb2ludC4gSSBjYW4ndCBz
YXkgbXVjaCBhYm91dCBwYXRjaCAyIGFuZCBoYWQgcXVlc3Rpb25zIA0KYWJvdXQgb3RoZXJz
Lg0KDQpNYXliZSB5b3UgY2FuIGFscmVhZHkgbGFuZCBwYXRjaGVzIDIsIGFuZCA0IHRvIDY/
IFRoZXkgbG9vayBpbmRlcGVuZGVudCANCmZyb20gdGhlIHNocmlua2VyIGNoYW5nZXMuIFlv
dSBjb3VsZCBhbHNvIGF0dGVtcHQgdG8gbGFuZCB0aGUgbG9ja2luZyANCmNoYW5nZXMgaW4g
cGF0Y2ggNy4gVGhleSBuZWVkIHRvIGdldCB0ZXN0aW5nLiBJJ2xsIHNlbmQgeW91IGFuIGEt
YiBmb3IgDQp0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFtIDA4LjAx
LjIzIHVtIDIyOjA0IHNjaHJpZWIgRG1pdHJ5IE9zaXBlbmtvOg0KPiBUaGlzIHNlcmllczoN
Cj4gDQo+ICAgIDEuIE1ha2VzIG1pbm9yIGZpeGVzIGZvciBkcm1fZ2VtX2xydSBhbmQgUGFu
ZnJvc3QNCj4gICAgMi4gQnJpbmdzIHJlZmFjdG9yaW5nIGZvciBvbGRlciBjb2RlDQo+ICAg
IDMuIEFkZHMgY29tbW9uIGRybS1zaG1lbSBtZW1vcnkgc2hyaW5rZXINCj4gICAgNC4gRW5h
YmxlcyBzaHJpbmtlciBmb3IgVmlydElPLUdQVSBkcml2ZXINCj4gICAgNS4gU3dpdGNoZXMg
UGFuZnJvc3QgZHJpdmVyIHRvIHRoZSBjb21tb24gc2hyaW5rZXINCj4gDQo+IENoYW5nZWxv
ZzoNCj4gDQo+IHYxMDotIFJlYmFzZWQgb24gYSByZWNlbnQgbGludXgtbmV4dC4NCj4gDQo+
ICAgICAgLSBBZGRlZCBSb2IncyBhY2sgdG8gTVNNICJQcmV2ZW50IGJsb2NraW5nIHdpdGhp
biBzaHJpbmtlciBsb29wIiBwYXRjaC4NCj4gDQo+ICAgICAgLSBBZGRlZCBTdGV2ZW4ncyBh
Y2svci1iL3QtYiBmb3IgdGhlIFBhbmZyb3N0IHBhdGNoZXMuDQo+IA0KPiAgICAgIC0gRml4
ZWQgbWlzc2luZyBleHBvcnQgb2YgdGhlIG5ldyBkcm1fZ2VtX29iamVjdF9ldmljdCgpIGZ1
bmN0aW9uLg0KPiANCj4gICAgICAtIEFkZGVkIGZpeGVzIHRhZ3MgdG8gdGhlIGZpcnN0IHR3
byBwYXRjaGVzIHRoYXQgYXJlIG1ha2luZyBtaW5vciBmaXhlcywNCj4gICAgICAgIGZvciBj
b25zaXN0ZW5jeS4NCj4gDQo+IHY5OiAtIFJlcGxhY2VkIHN0cnVjdCBkcm1fZ2VtX3NobWVt
X3Nocmlua2VyIHdpdGggZHJtX2dlbV9zaG1lbSBhbmQNCj4gICAgICAgIG1vdmVkIGl0IHRv
IGRybV9kZXZpY2UsIGxpa2Ugd2FzIHN1Z2dlc3RlZCBieSBUaG9tYXMgWmltbWVybWFubi4N
Cj4gDQo+ICAgICAgLSBSZXBsYWNlZCBkcm1fZ2VtX3NobWVtX3Nocmlua2VyX3JlZ2lzdGVy
KCkgd2l0aCBkcm1tX2dlbV9zaG1lbV9pbml0KCksDQo+ICAgICAgICBsaWtlIHdhcyBzdWdn
ZXN0ZWQgYnkgVGhvbWFzIFppbW1lcm1hbm4uDQo+IA0KPiAgICAgIC0gTW92ZWQgZXZpY3Qo
KSBjYWxsYmFjayB0byBkcm1fZ2VtX29iamVjdF9mdW5jcyBhbmQgYWRkZWQgY29tbW9uDQo+
ICAgICAgICBkcm1fZ2VtX29iamVjdF9ldmljdCgpIGhlbHBlciwgbGlrZSB3YXMgc3VnZ2Vz
dGVkIGJ5IFRob21hcyBaaW1tZXJtYW5uLg0KPiANCj4gICAgICAtIFRoZSBzaG1lbSBvYmpl
Y3Qgbm93IGlzIGV2aWN0YWJsZSBieSBkZWZhdWx0LCBsaWtlIHdhcyBzdWdnZXN0ZWQgYnkN
Cj4gICAgICAgIFRob21hcyBaaW1tZXJtYW5uLiBEcm9wcGVkIHRoZSBzZXRfZXZpY3RhYmxl
L3B1cmdlYmxlKCkgZnVuY3Rpb25zDQo+ICAgICAgICBhcyB3ZWxsLCBkcml2ZXJzIHdpbGwg
ZGVjaWRlIHdoZXRoZXIgQk8gaXMgZXZpY3RhYmxlIHdpdGhpbiB0aGVpcnMNCj4gICAgICAg
IG1hZHZpc2UgSU9DVEwuDQo+IA0KPiAgICAgIC0gQWRkZWQgcGF0Y2hlcyB0aGF0IGNvbnZl
cnQgZHJtLXNobWVtIGNvZGUgdG8gdXNlIGRybV9XQVJOX09OKCkgYW5kDQo+ICAgICAgICBk
cm1fZGJnX2ttcygpLCBsaWtlIHdhcyByZXF1ZXN0ZWQgYnkgVGhvbWFzIFppbW1lcm1hbm4u
DQo+IA0KPiAgICAgIC0gVHVybmVkIGRybV9nZW1fc2htZW1fb2JqZWN0IGJvb2xlYW5zIGlu
dG8gMS1iaXQgYml0IGZpZWxkcywgbGlrZSB3YXMNCj4gICAgICAgIHN1Z2dlc3RlZCBieSBU
aG9tYXMgWmltbWVybWFubi4NCj4gDQo+ICAgICAgLSBTd2l0Y2hlZCB0byB1c2UgZHJtX2Rl
di0+dW5pcXVlIGZvciB0aGUgc2htZW0gc2hyaW5rZXIgbmFtZS4gRHJpdmVycw0KPiAgICAg
ICAgZG9uJ3QgbmVlZCB0byBzcGVjaWZ5IHRoZSBuYW1lIGV4cGxpY2l0bHkgYW55bW9yZS4N
Cj4gDQo+ICAgICAgLSBSZS1hZGRlZCBkbWFfcmVzdl90ZXN0X3NpZ25hbGVkKCkgdGhhdCB3
YXMgbWlzc2luZyBpbiB2OCBhbmQgYWxzbw0KPiAgICAgICAgZml4ZWQgaXRzIGFyZ3VtZW50
IHRvIERNQV9SRVNWX1VTQUdFX1JFQUQuIFNlZSBjb21tZW50IHRvDQo+ICAgICAgICBkbWFf
cmVzdl91c2FnZV9ydygpLg0KPiANCj4gICAgICAtIEFkZGVkIG5ldyBmaXggZm9yIFBhbmZy
b3N0IGRyaXZlciB0aGF0IHNpbGVuY2VzIGxvY2tkZXAgd2FybmluZw0KPiAgICAgICAgY2F1
c2VkIGJ5IHNocmlua2VyLiBCb3RoIFBhbmZyb3N0IG9sZCBhbmQgbmV3IHNobWVtIHNocmlu
a2VycyBhcmUNCj4gICAgICAgIGFmZmVjdGVkLg0KPiANCj4gdjg6IC0gUmViYXNlZCBvbiB0
b3Agb2YgcmVjZW50IGxpbnV4LW5leHQgdGhhdCBub3cgaGFzIGRtYS1idWYgbG9ja2luZw0K
PiAgICAgICAgY29udmVudGlvbiBwYXRjaGVzIG1lcmdlZCwgd2hpY2ggd2FzIGJsb2NraW5n
IHNobWVtIHNocmlua2VyIGJlZm9yZS4NCj4gDQo+ICAgICAgLSBTaG1lbSBzaHJpbmtlciBu
b3cgdXNlcyBuZXcgZHJtX2dlbV9scnUgaGVscGVyLg0KPiANCj4gICAgICAtIERyb3BwZWQg
U3RldmVuIFByaWNlIHQtYiBmcm9tIHRoZSBQYW5mcm9zdCBwYXRjaCBiZWNhdXNlIGNvZGUN
Cj4gICAgICAgIGNoYW5nZWQgc2lnbmlmaWNhbnRseSBzaW5jZSB2NiBhbmQgc2hvdWxkIGJl
IHJlLXRlc3RlZC4NCj4gDQo+IHY3OiAtIGRtYS1idWYgbG9ja2luZyBjb252ZW50aW9uDQo+
IA0KPiB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjIwNTI2MjM1
MDQwLjY3ODk4NC0xLWRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tLw0KPiANCj4gUmVs
YXRlZCBwYXRjaGVzOg0KPiANCj4gTWVzYTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RpZ2V0eC9tZXNhLy0vY29tbWl0cy92aXJnbC1tYWR2aXNlDQo+IGlndDogIGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kaWdldHgvaWd0LWdwdS10b29scy8tL2NvbW1p
dHMvdmlydGlvLW1hZHZpc2UNCj4gICAgICAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kaWdldHgvaWd0LWdwdS10b29scy8tL2NvbW1pdHMvcGFuZnJvc3QtbWFkdmlzZQ0K
PiANCj4gVGhlIE1lc2EgYW5kIElHVCBwYXRjaGVzIHdpbGwgYmUgc2VudCBvdXQgb25jZSB0
aGUga2VybmVsIHBhcnQgd2lsbCBsYW5kLg0KPiANCj4gRG1pdHJ5IE9zaXBlbmtvICgxMSk6
DQo+ICAgIGRybS9tc20vZ2VtOiBQcmV2ZW50IGJsb2NraW5nIHdpdGhpbiBzaHJpbmtlciBs
b29wDQo+ICAgIGRybS9wYW5mcm9zdDogRG9uJ3Qgc3luYyBycG0gc3VzcGVuc2lvbiBhZnRl
ciBtbXUgZmx1c2hpbmcNCj4gICAgZHJtL2dlbTogQWRkIGV2aWN0KCkgY2FsbGJhY2sgdG8g
ZHJtX2dlbV9vYmplY3RfZnVuY3MNCj4gICAgZHJtL3NobWVtOiBQdXQgYm9vbGVhbnMgaW4g
dGhlIGVuZCBvZiBzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QNCj4gICAgZHJtL3NobWVt
OiBTd2l0Y2ggdG8gdXNlIGRybV8qIGRlYnVnIGhlbHBlcnMNCj4gICAgZHJtL3NobWVtLWhl
bHBlcjogRG9uJ3QgdXNlIHZtYXBfdXNlX2NvdW50IGZvciBkbWEtYnVmcw0KPiAgICBkcm0v
c2htZW0taGVscGVyOiBTd2l0Y2ggdG8gcmVzZXJ2YXRpb24gbG9jaw0KPiAgICBkcm0vc2ht
ZW0taGVscGVyOiBBZGQgbWVtb3J5IHNocmlua2VyDQo+ICAgIGRybS9nZW06IEFkZCBkcm1f
Z2VtX3Bpbl91bmxvY2tlZCgpDQo+ICAgIGRybS92aXJ0aW86IFN1cHBvcnQgbWVtb3J5IHNo
cmlua2luZw0KPiAgICBkcm0vcGFuZnJvc3Q6IFN3aXRjaCB0byBnZW5lcmljIG1lbW9yeSBz
aHJpbmtlcg0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAg
ICAgICAgICAgfCAgNTQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9o
ZWxwZXIuYyAgICAgICAgfCA2NDYgKysrKysrKysrKysrKy0tLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2xpbWEvbGltYV9nZW0uYyAgICAgICAgICAgICAgIHwgICA4ICstDQo+ICAgZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3Nocmlua2VyLmMgICAgICAgIHwgICA4ICstDQo+
ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L01ha2VmaWxlICAgICAgICAgICAgIHwgICAx
IC0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggICAg
fCAgIDQgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAg
ICAgICB8ICAzNCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9n
ZW0uYyAgICAgICB8ICAzMCArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9nZW0uaCAgICAgICB8ICAgOSAtDQo+ICAgLi4uL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZ2VtX3Nocmlua2VyLmMgIHwgMTIyIC0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgICAgICAgfCAgMTggKy0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgICAgICAgfCAgMjEgKy0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgICAgICAgfCAgMTggKy0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMgICAgICAgICAgfCAgNTIg
KysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyAgICAgICAg
fCAgMzcgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICAg
ICAgICB8ICAgOCArDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVj
dC5jICAgICAgIHwgMTMyICsrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfcGxhbmUuYyAgICAgICAgfCAgMjIgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfdnEuYyAgICAgICAgICAgfCAgNDAgKysNCj4gICBpbmNsdWRlL2RybS9kcm1f
ZGV2aWNlLmggICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKy0NCj4gICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTkgKy0NCj4gICBpbmNs
dWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oICAgICAgICAgICAgfCAxMTIgKy0tDQo+
ICAgaW5jbHVkZS91YXBpL2RybS92aXJ0Z3B1X2RybS5oICAgICAgICAgICAgICAgIHwgIDE0
ICsNCj4gICAyMyBmaWxlcyBjaGFuZ2VkLCAxMDEwIGluc2VydGlvbnMoKyksIDQwOSBkZWxl
dGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------oHIQ2yuJl4S50mFJAPZRR6on--

--------------jSEuHH3d6qvm0lU4VVh3Hu5e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvgOYFAwAAAAAACgkQlh/E3EQov+Dx
wg/+KuNmmhVhCinABHzlAZ3n2ZKjIznQQVgCl3DDOAo1rJ1L5mVJpg3bPqBVnt9iHexJpqaz8gKV
fbMOw54hxXFsmCsx/ZF4rO7zSeNNBwxl4djbaV/QNaqJ2lzoPM86ZaV6/+KVBgeA43xyBwepalrR
TJtF1qvnMejXU2JvIk7mqX5/tsM9ozujwA0QroQTwwPbZWq3tmng2Sn1kmIIJs4aOHeF1uZEGNfW
YarBi16gAIjbLjcXq6MrFWcsNzcshOffUX/18/a+f/2/tD3NALePjfgO+evBIkRBzeKxN8s5MMgC
3yDhrw2gMsZejkdCNnIPI3VqoyRUb1guluNrIRPRaeVIZMrYMqkrJBTH06CVlO5L5BKlvXxjQLfj
g2oi0C734Yf7RLReR1Wg3105Kki+i59qTVXlQmQdlP2Y2O4by2TXGr2N8nJgMmBPtq450EnayzkZ
THOTZsoCN1uO2J5D83YAYdt6awjf9cnJ/2huehNVVE/rNkVu9pQN1k3VzvDLvHKZ97ps1wYfOFr3
Ci1uCTsWeHT+rtS3A4B0zXZ8LMYJXDOKUi6jynSMgnmABhfPZHbn4f30JLNsNgL9k2vZSm+LiWTJ
2aZvmvRf6CdX+prNZV/ikRf4czH8b+vRBoEcTbItV2tYpaAjeBl6kI8kH2jkdOwxtOHvaIz1+NKM
Qxc=
=ft3I
-----END PGP SIGNATURE-----

--------------jSEuHH3d6qvm0lU4VVh3Hu5e--
