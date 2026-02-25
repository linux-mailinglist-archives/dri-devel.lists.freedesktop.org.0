Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILvdKNrMnmm0XQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:20:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1382C195A9D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 11:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA90010E738;
	Wed, 25 Feb 2026 10:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="Zf0LfoYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E310E737
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772014780; x=1772619580; i=natalie.vock@gmx.de;
 bh=Fq57glOxDG+tgCTkdE0QWk6h9eYjnLLQVHP0MDo5KhI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Zf0LfoYrXk78Qtuc4shYU4kD4NfGWVJUAV07lVKryGKRkHg8+zkWoXoeCTDnoV+/
 g8I/ZXNQ94wB4n8AqKKzQboB8kGiCElCHasTUt20HqHkaNplWUd0EkyHlQMH0Bu+j
 u5lb3qBr2P2e0iD+h1kX0+ixJ6PVHgUbqR2OwHdndHh8+MhxPItKjdKecH8EujVB2
 ByFl9B1JRIDqdIPL5zDlDev02+xm3/1pYb24eV36rfeQ3H63GgeMQwC07P2fuDCtM
 zuikqTM10JqJ1PAXThwDlNwB008CY9VQK/VQ/+UneCRO/NXAsHw4TB4C1G8MdqEI+
 pbujedPIebTVip+bqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1vLaKF12tn-00oU9r; Wed, 25
 Feb 2026 11:19:40 +0100
Message-ID: <cd9a2b39-3e68-42be-a538-9653227fbf4e@gmx.de>
Date: Wed, 25 Feb 2026 11:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/ttm: Be more aggressive when allocating below
 protection limit
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251110-dmemcg-aggressive-protect-v3-0-219ffcfc54e9@gmx.de>
 <20251110-dmemcg-aggressive-protect-v3-4-219ffcfc54e9@gmx.de>
 <4d9e2fb9-1cea-476e-b7f8-d2caaef4a579@ursulin.net>
 <fdf710df-8991-4ee1-9eca-78b21ecdc828@gmx.de>
 <e097bf9b-0078-4de4-929c-0b9e0b26af8e@ursulin.net>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <e097bf9b-0078-4de4-929c-0b9e0b26af8e@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t+ENGGqnkRdSq25YPDQzQBBWcF+22NJFU4XiBL66GgPIhf8peXH
 9TOf2yWgmzSkU0PWsMFZutABE8CZwSm61zgcrfSUUONvAYLVFvZHlh8MUS6Q5ow6eBHx4sX
 d9fMNtD6uF3YTXv2UXB6bmQdqj+ug70yhWLfSU7/7li3LfgpGiYI8bjyGiSiqKvJc2mj1BF
 GEclIjOib+ScMFCaJllIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kth/4wBRov4=;dcIXMEqWj6mF4tcoeLCdRLN0p94
 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
 ncbJpq+o7SbI3P59wfpk
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ursulin.net,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[natalie.vock@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gmx.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1382C195A9D
X-Rspamd-Action: no action

On 2/25/26 11:12, Tvrtko Ursulin wrote:
>=20
> On 25/02/2026 09:49, Natalie Vock wrote:
>> On 2/24/26 17:40, Tvrtko Ursulin wrote:
>>>
>>> On 10/11/2025 12:37, Natalie Vock wrote:
>>>> When the cgroup's memory usage is below the low/min limit and=20
>>>> allocation
>>>> fails, try evicting some unprotected buffers to make space. Otherwise=
,
>>>> application buffers may be forced to go into GTT even though usage is
>>>> below the corresponding low/min limit, if other applications filled=
=20
>>>> VRAM
>>>> with their allocations first.
>>>>
>>>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 75 ++++++++++++++++++++++++++=20
>>>> + + ++++++----
>>>> =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++-----=
=2D-
>>>> =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ++-
>>>> =C2=A0 3 files changed, 108 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/=20
>>>> ttm_bo.c
>>>> index 829d994798835..bd467c965e1bc 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -490,8 +490,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev,=
=20
>>>> struct ttm_resource_manager *man
>>>> =C2=A0 }
>>>> =C2=A0 struct ttm_bo_alloc_state {
>>>> +=C2=A0=C2=A0=C2=A0 /** @charge_pool: The memory pool the resource is=
 charged to */
>>>> +=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state *charge_pool;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @limit_pool: Which pool limit we s=
hould test against */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state *limit_p=
ool;
>>>> +=C2=A0=C2=A0=C2=A0 /** @only_evict_unprotected: If eviction should b=
e restricted=20
>>>> to unprotected BOs */
>>>> +=C2=A0=C2=A0=C2=A0 bool only_evict_unprotected;
>>>> =C2=A0 };
>>>> =C2=A0 /**
>>>> @@ -546,7 +550,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk=20
>>>> *walk, struct ttm_buffer_object *
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evict_walk->evicted++;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (evict_walk->res)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lret =3D ttm_r=
esource_alloc(evict_walk->evictor, evict_walk-=20
>>>> >place,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evict_walk->r=
es, NULL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evict_walk->r=
es, evict_walk->alloc_state-=20
>>>> >charge_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lret =3D=3D 0)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>>>> =C2=A0 out:
>>>> @@ -589,7 +593,7 @@ static int ttm_bo_evict_alloc(struct ttm_device=
=20
>>>> *bdev,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lret =3D ttm_lru_walk_for_evict(&evict=
_walk.walk, bdev, man, 1);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* One more attempt if we hit low limi=
t? */
>>>> -=C2=A0=C2=A0=C2=A0 if (!lret && evict_walk.hit_low) {
>>>> +=C2=A0=C2=A0=C2=A0 if (!lret && evict_walk.hit_low && !state-=20
>>>> >only_evict_unprotected) {
>>>
>>> What is unprotected synonymous with? No low watermark set? Should=20
>>> dmem_cgroup_state_evict_valuable() even set *hit_low =3D true for if=
=20
>>> low is not set to begin with?
>>
>> In terms of cgroup usage, a cgroup (and by extension, its BOs) is=20
>> protected as long as its usage stays under the low watermark (if not=20
>> set, that watermark is zero and any BO is trivially unprotected). If=20
>> the usage exceeds the low watermark, the cgroup/its BOs become=20
>> unprotected and can be evicted (more easily), until the usage goes=20
>> below the watermark again.
>=20
> Got it thanks, so either no low set, or usage above low. Makes sense.
>=20
>> With only_evict_unprotected, what we're trying to do is evict buffers=
=20
>> from any cgroup that currently exceeds its low (or min) watermark, but=
=20
>> leave alone cgroups that are within their limits. I've elaborated on=20
>> the rationale more in the cover letter, but essentially, this is=20
>> supposed to make TTM honor the low/min protection better for cgroups=20
>> that are allocating and currently within their low/min watermark, by=20
>> allowing them to push out BOs from cgroups that exceed their=20
>> respective watermarks.
>=20
> Yep, I got that part. Just that I will need a second pass to fully grasp=
=20
> the extended logic. Problem being more booleans and passes make things=
=20
> more complex. That is why I made this side question on whether it even=
=20
> makes sense for dmem_cgroup_state_evict_valuable() to set hit_low if the=
=20
> low is not even set. Assuming I got it right it can happen:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0if (!ignore_low) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 low =3D READ_ONCE(ctest->elo=
w);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (used > low)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn true;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ret_hit_low =3D true;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>  =C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> So I was wondering what would be the effect of making that like this:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0if (!ignore_low) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 low =3D READ_ONCE(ctest->elo=
w);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (used > low)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn true;
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (low)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ret=
_hit_low =3D true;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>  =C2=A0=C2=A0=C2=A0=C2=A0}
>=20
>=20
> Could that somehow simplify the logic, maybe allow for not having to add=
=20
> the additional condition above. Possibly not, it seems more complex than=
=20
> that. But I am just thinking out loud at this point. Again, I need to=20
> make a second reading pass.

FWIW, hit_low can never become true if low is not set. If we even call=20
dmem_cgroup_eviction_valuable in the first place, that means there has=20
to be a buffer object associated with the cgroup. Unless something went=20
super duper wrong, that also means the memory usage of that buffer is=20
charged to that cgroup, and therefore usage has to be > 0.

If low is unset, i.e. 0, we therefore always exit out of the
"if (used > low)" statement, and never set *ret_hit_low to true.

*ret_hit_low can only be set to true if there is a buffer that has a=20
(set) low limit associated with its cgroup, and that cgroup's usage does=
=20
not exceed the low limit.

Thanks,
Natalie

>=20
>> I'll add some comments to the only_evict_unprotected docs to explain=20
>> what "unprotected" means here.
>>
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evict_walk.try=
_low =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lret =3D ttm_l=
ru_walk_for_evict(&evict_walk.walk, bdev, man,=20
>>>> 1);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> @@ -610,7 +614,8 @@ static int ttm_bo_evict_alloc(struct ttm_device=
=20
>>>> *bdev,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (!lret && evict_walk.evicted);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We hit the low limit? Try once more=
 */
>>>> -=C2=A0=C2=A0=C2=A0 if (!lret && evict_walk.hit_low && !evict_walk.tr=
y_low) {
>>>> +=C2=A0=C2=A0=C2=A0 if (!lret && evict_walk.hit_low && !evict_walk.tr=
y_low &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !=
state->only_evict_unprotected) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evict_walk.try=
_low =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> @@ -719,20 +724,72 @@ static int ttm_bo_alloc_at_place(struct=20
>>>> ttm_buffer_object *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **res,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_bo_alloc_state *alloc_s=
tate)
>>>> =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 bool may_evict;
>>>> +=C2=A0=C2=A0=C2=A0 bool may_evict, below_low =3D false;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 may_evict =3D (force_space && place->m=
em_type !=3D TTM_PL_SYSTEM);
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_resource_try_charge(bo, place, &alloc=
_state-=20
>>>> >charge_pool,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 force_space ?=
 &alloc_state->limit_pool : NULL);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * -EAGAIN means the=
 charge failed, which we treat like an
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * allocation failur=
e. Therefore, return an error code=20
>>>> indicating
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the allocation fa=
iled - either -EBUSY if the allocation=20
>>>> should
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * be retried with e=
viction, or -ENOSPC if there should be=20
>>>> no second
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * attempt.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D -EAGAIN)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D may_evict ? -EBUSY : -ENOSPC;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> -=C2=A0=C2=A0=C2=A0 ret =3D ttm_resource_alloc(bo, place, res,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 force_space ? &alloc_state->limit_pool : NU=
LL);
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * cgroup protection plays a special role in=
 eviction.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Conceptually, protection of memory via th=
e dmem cgroup=20
>>>> controller
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * entitles the protected cgroup to use a ce=
rtain amount of=20
>>>> memory.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * There are two types of protection - the '=
low' limit is a
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * "best-effort" protection, whereas the 'mi=
n' limit provides a=20
>>>> hard
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * guarantee that memory within the cgroup's=
 allowance will not be
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * evicted under any circumstance.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * To faithfully model this concept in TTM, =
we also need to=20
>>>> take cgroup
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * protection into account when allocating. =
When allocation in one
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * place fails, TTM will default to trying o=
ther places first=20
>>>> before
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * evicting.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the allocation is covered by dmem cgro=
up protection,=20
>>>> however,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * this prevents the allocation from using t=
he memory it is=20
>>>> "entitled"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * to. To make sure unprotected allocations =
cannot push new=20
>>>> protected
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * allocations out of places they are "entit=
led" to use, we should
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * evict buffers not covered by any cgroup p=
rotection, if this
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * allocation is covered by cgroup protectio=
n.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Buffers covered by 'min' protection are a=
 special case - the=20
>>>> 'min'
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * limit is a stronger guarantee than 'low',=
 and thus buffers=20
>>>> protected
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * by 'low' but not 'min' should also be con=
sidered for eviction.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Buffers protected by 'min' will never be =
considered for=20
>>>> eviction
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * anyway, so the regular eviction path shou=
ld be triggered here.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Buffers protected by 'low' but not 'min' =
will take a special
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * eviction path that only evicts buffers co=
vered by neither=20
>>>> 'low' or
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * 'min' protections.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 may_evict |=3D dmem_cgroup_below_min(NULL, alloc_=
state-=20
>>>> >charge_pool);
>>>> +=C2=A0=C2=A0=C2=A0 below_low =3D dmem_cgroup_below_low(NULL, alloc_s=
tate->charge_pool);
>>>> +=C2=A0=C2=A0=C2=A0 alloc_state->only_evict_unprotected =3D !may_evic=
t && below_low;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D ttm_resource_alloc(bo, place, res, alloc_=
state-=20
>>>> >charge_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((ret =3D=3D -ENOSPC |=
| ret =3D=3D -EAGAIN) && may_evict)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((ret =3D=3D -ENOSPC |=
| ret =3D=3D -EAGAIN) &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (may_evict || below_low))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ret =3D -EBUSY;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Ownership of charge_pool has been transfe=
rred to the TTM=20
>>>> resource,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * don't make the caller think we still hold=
 a reference to it.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 alloc_state->charge_pool =3D NULL;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0 }
>>>> @@ -787,6 +844,7 @@ static int ttm_bo_alloc_resource(struct=20
>>>> ttm_buffer_object *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res, &alloc_state);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D=
 -ENOSPC) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
mem_cgroup_pool_state_put(alloc_state.charge_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 continue;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (ret=
 =3D=3D -EBUSY) {
>>>> @@ -796,11 +854,14 @@ static int ttm_bo_alloc_resource(struct=20
>>>> ttm_buffer_object *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (ret) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dmem_cgroup_pool_state_put(
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
lloc_state.charge_pool);
>>>
>>> Funky line break.
>>
>> Will fix.
>>
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D -ENOSPC && ret !=3D -EBUSY)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (ret=
) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
mem_cgroup_pool_state_put(alloc_state.charge_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/=20
>>>> ttm/ ttm_resource.c
>>>> index e2c82ad07eb44..fcfa8b51b0337 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -372,30 +372,52 @@ void ttm_resource_fini(struct=20
>>>> ttm_resource_manager *man,
>>>> =C2=A0 }
>>>> =C2=A0 EXPORT_SYMBOL(ttm_resource_fini);
>>>> +/**
>>>> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
>>>> + * @bo: buffer for which an allocation should be charged
>>>> + * @place: where the allocation is attempted to be placed
>>>> + * @ret_pool: on charge success, the pool that was charged
>>>> + * @ret_limit_pool: on charge failure, the pool responsible for the=
=20
>>>> failure
>>>> + *
>>>> + * Should be used to charge cgroups before attempting resource=20
>>>> allocation.
>>>> + * When charging succeeds, the value of ret_pool should be passed to
>>>> + * ttm_resource_alloc.
>>>> + *
>>>> + * Returns: 0 on charge success, negative errno on failure.
>>>> + */
>>>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_pool,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_limit_pool)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man =3D
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_manager_type(bo->bdev=
, place->mem_type);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!man->cg) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ret_pool =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret_limit_pool)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
ret_limit_pool =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return dmem_cgroup_try_charge(man->cg, bo->base.s=
ize, ret_pool,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret_limit_poo=
l);
>>>> +}
>>>> +
>>>> =C2=A0 int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **res_ptr,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_limit_pool)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state *charge_pool)
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man =3D
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_manager_ty=
pe(bo->bdev, place->mem_type);
>>>> -=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state *pool =3D NULL;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>> -=C2=A0=C2=A0=C2=A0 if (man->cg) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D dmem_cgroup_try_c=
harge(man->cg, bo->base.size, &pool,=20
>>>> ret_limit_pool);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>> -
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D man->func->alloc(man, bo, plac=
e, res_ptr);
>>>> -=C2=A0=C2=A0=C2=A0 if (ret) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pool)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
mem_cgroup_uncharge(pool, bo->base.size);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>> -=C2=A0=C2=A0=C2=A0 }
>>>> -=C2=A0=C2=A0=C2=A0 (*res_ptr)->css =3D pool;
>>>> +=C2=A0=C2=A0=C2=A0 (*res_ptr)->css =3D charge_pool;
>>>
>>> Is it possible to somehow split this patch into two? I mean first a=20
>>> patch which changes the prototype of ttm_resource_alloc(), adjusting=
=20
>>> the callers, set out new rules for owning the charge pool, etc, then=
=20
>>> the patch which only adds the cgroup smarts to=20
>>> ttm_bo_alloc_at_place(). If that could be made without creating any=20
>>> functional difference to the eviction alone I think it could make it=
=20
>>> easier to review.
>>
>> Will try.
>=20
> Only if it sounds plausible that it can be sensibly done. Otherwise=20
> don't spend too much time if you think it makes no sense. I'll wait for=
=20
> the verdict, or for v4 to appear and then have another go of making=20
> sense of the existing vs new eviction logic.
>=20
> Regards,
>=20
> Tvrtko
>=20
>=20
>> Thanks,
>> Natalie
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&bo->bdev->lru_lock);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_resource_add_bulk_move(*res_ptr, b=
o);
>>>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/=20
>>>> ttm_resource.h
>>>> index e52bba15012f7..3aef7efdd7cfb 100644
>>>> --- a/include/drm/ttm/ttm_resource.h
>>>> +++ b/include/drm/ttm/ttm_resource.h
>>>> @@ -442,10 +442,14 @@ void ttm_resource_init(struct=20
>>>> ttm_buffer_object *bo,
>>>> =C2=A0 void ttm_resource_fini(struct ttm_resource_manager *man,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *res);
>>>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_pool,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_limit_pool);
>>>> =C2=A0 int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **res,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state **ret_limit_pool);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct dmem_cgroup_pool_state *charge_pool);
>>>> =C2=A0 void ttm_resource_free(struct ttm_buffer_object *bo, struct=20
>>>> ttm_resource **res);
>>>> =C2=A0 bool ttm_resource_intersects(struct ttm_device *bdev,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *res,
>>>>
>>>
>>
>=20

