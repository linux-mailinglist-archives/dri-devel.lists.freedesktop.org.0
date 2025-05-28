Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD2AC65FA
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504A710E5D7;
	Wed, 28 May 2025 09:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="lhzajvsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8E510E5D6;
 Wed, 28 May 2025 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748424548; x=1749029348; i=natalie.vock@gmx.de;
 bh=wJj6cCWN4z+xlGO0PzShWjcwP9PbCdV1eX0zeAaaS4k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lhzajvsV/2bjM0tBLsKMSdK2FvSs8OxPah3gZeOiQe0KQOyxC9aqZ1K9bwO+zZIw
 4K8NDGUJCuBpAgNA7p/N02+5QGUxX1UOKn5yPZExFQrGnpCKBixu08gl9GgufpZNp
 SzQkzbeKtl/pnjrsL2bvFdYkISPuOFqhXyqQpQKambNRHCe6/DIRR11hhp5NkcAIE
 1j7rvXkxqf+UoYeGd8R9ko6bWto5OoXrU5qB2Y6DrbduX5afmr9nKz62wmhxfc930
 dEggb23ea3VU4da+rjbdXFlZ5gkgGRG062EcyXs+aTcTKqWgdrn1q6675TN1bj4LU
 gruG7mfIW+da7v+nSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1uUuBE43Ux-00SyIf; Wed, 28
 May 2025 11:29:08 +0200
Message-ID: <dbbdcada-32ae-4457-af87-1f98362461f1@gmx.de>
Date: Wed, 28 May 2025 11:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
 <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2axK+lnGA1Fc2hNrp9g4dehd+SiCYBgai4Yw/yjkZ2uUpsKq5zb
 Cpw3Zxx6FVLeRDMZWmf3ZKx31ePnxVYzCm+7VTgxmmSu+lIfz2YpjbcRdtZmBcvy+4vouyl
 uhc/R3Brm10J6Sk618GICLheuLid8drjXMfgo98QRhN1H3MOvt90C+kADYs5t9MoiyDc2K7
 N9lFBO30+zRmmnNASJPYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zugt5dwSbBI=;zTbmlpoMe2/WOz0ZouyeNwzChxg
 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
 +C+0trX7n9Mka8HOmVwkpfQnYP7PNHCD3SnWXQ==
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

Hi,

On 5/28/25 09:07, Christian K=C3=B6nig wrote:
> On 5/27/25 21:43, Natalie Vock wrote:
>> If we hand out cleared blocks to users, they are expected to write
>> at least some non-zero values somewhere. If we keep the CLEAR bit set o=
n
>> the block, amdgpu_fill_buffer will assume there is nothing to do and
>> incorrectly skip clearing the block. Ultimately, the (still dirty) bloc=
k
>> will be reused as if it were cleared, without any wiping of the memory
>> contents.
>>
>> Most severely, this means that any buffer allocated with
>> AMDGPU_GEM_CREATE_VRAM_CLEARED | AMDGPU_GEM_CREATE_WIPE_ON_RELEASE
>> (which is the case for **all userspace buffers**) are neither
>> guaranteed to contain cleared VRAM, nor are they being wiped on
>> release, potentially leaking application memory to arbitrary other
>> applications.
>>
>> Fixes: a68c7eaa7a8ff ("drm/amdgpu: Enable clear page functionality")
>> Cc: stable@vger.kernel.org
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 2d7f82e98df9..cecc67d0f0b8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -591,6 +591,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource=
_manager *man,
>>   	list_for_each_entry(block, &vres->blocks, link) {
>>   		unsigned long start;
>>  =20
>> +		/*
>> +		 * Allocated blocks may be dirtied as soon as we return.
>> +		 * Mark all blocks as dirty here, otherwise we might
>> +		 * incorrectly assume the memory is still zeroed.
>> +		 */
>> +		drm_buddy_block_set_dirty(block);
>=20
> Exactly that makes no sense.
>=20
> We need the information if it's dirty or not later while clearing the bl=
ocks. Otherwise we will clear all blocks and completely loose the advantag=
e of the clear tracking.

Right, I missed that separate clear on allocation. I was put a bit=20
off-track by assuming DRM_BUDDY_ALLOCATE_CLEARED would guarantee cleared=
=20
pages, when in reality it's more like a preference.

>=20
> So we should set them dirty as soon as we are done with the clearing.
>=20
> But the problem rather seems to be that we sometimes don't clear the buf=
fers on release for some reason, but still set it as cleared.

Yes precisely - "some reason" being the aforementioned clear flags. We=20
do always call amdgpu_clear_buffer on release, but that function will=20
perform the same checks as the clear on allocation does - that means, if=
=20
a block is marked clear then it will skip emitting any actual clears.

If we don't mark the blocks as dirty after allocating, then the=20
amdgpu_clear_buffer call on release will skip actually performing the=20
clear like it did during allocation - this is obviously really broken.

After calling amdgpu_clear_buffer, we call amdgpu_vram_mgr_set_cleared=20
which causes the drm_buddy blocks to be marked as "cleared" when freed.=20
This part is correct in itself, but obviously breaks if=20
amdgpu_clear_buffer didn't actually clear the buffer. That's how the=20
dirty blocks end up in the buddy allocator as cleared ones.

I'm testing a v2 that sets the dirty flags after the initial clear, I'll=
=20
send it once I confirmed it works.

Thanks,
Natalie

>=20
> Regards,
> Christian.
>=20
>=20
>> +
>>   		start =3D amdgpu_vram_mgr_block_start(block) +
>>   			amdgpu_vram_mgr_block_size(block);
>>   		start >>=3D PAGE_SHIFT;
>=20

