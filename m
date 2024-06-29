Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F091CF17
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 22:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE4B10E00E;
	Sat, 29 Jun 2024 20:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jhBBe2H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228E10E00E
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 20:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719694411; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IekYf+xBSXCyY19UiRBa2+jOugJpn19Iekffndl3qydN3oELTGOF1zO5wrK8f3AC7g9v+58wQYEK2y+DQD5fYMF/Nl534NHapsdD7y2+sX1LltgqTixkeIbnGyGV5FQpRoAfjpngDK6R0nSxEhKQ7oUTES5qz8M9GdilyhvCDdo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719694411;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mYIf2hD3tC8XwdxYRIYlcO/GDmxwIxeJGBYulQyfnRY=; 
 b=n28xoXz4kFTvaLsgxPcfbvYTQG6w5CXM0dMLz1UwRmZdjYPGPnPBDHpba0luPZtWAsXlu3RuBseznQ4jP7E5a23TOHD9SIuQp/Zxtr0y3cmHwzM+JeRs4fVqIEoy/4I+lQPRDXym5PgOB2ySDWqyDuApeBzAPHFGkclDejuwqEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719694411; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=mYIf2hD3tC8XwdxYRIYlcO/GDmxwIxeJGBYulQyfnRY=;
 b=jhBBe2H+sMnV1Rg0eHCeyykK4wq4MyTlX0QptJGziT5qk1xCGZm/a9JzT37p5IJK
 wSR0YaGE/d3F/GJxb7v9BGAfHXzVwfo3PkWnFSpmzI6ITkLJyqnRMOPwtsZ7+nujwbC
 A8kZFAwz5mXurnoGyP1nThABzO7vsSTQ+wmblinBczKlacDfv6Vr9RZJmu+EXNzcfkv
 ktGoYDQCl3we2tvapXf7xa/40KN4+8gt3npOgdIr9RItM3/x1Tttz+mNsch+y1hvmwi
 /N06YJNoVsiBZAS0J7/yIvAJ9qd1IA8eErqZCA8Ra91U+gSJbBKMWIiGUBr0wdX1WjR
 Gc4nWe3hhw==
Received: by mx.zohomail.com with SMTPS id 1719694409695962.8558976921961;
 Sat, 29 Jun 2024 13:53:29 -0700 (PDT)
Date: Sun, 30 Jun 2024 04:51:31 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_2/2=5D_drm/ttm=3A_downgrade_cached?=
 =?US-ASCII?Q?_to_write=5Fcombined_when_snooping_not_available?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
Message-ID: <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
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



=E4=BA=8E 2024=E5=B9=B46=E6=9C=8830=E6=97=A5 GMT+08:00 03:57:47=EF=BC=8CJi=
axun Yang <jiaxun=2Eyang@flygoat=2Ecom> =E5=86=99=E9=81=93=EF=BC=9A
>
>
>=E5=9C=A82024=E5=B9=B46=E6=9C=8829=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=886:22=EF=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
>[=2E=2E=2E]
>> @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo,=
=20
>> struct ttm_resource *res,
>>  		caching =3D res->bus=2Ecaching;
>>  	}
>>=20
>> +	/* Downgrade cached mapping for non-snooping devices */
>> +	if (!bo->bdev->dma_coherent && caching =3D=3D ttm_cached)
>> +		caching =3D ttm_write_combined;
>Hi Icenowy,
>
>Thanks for your patch! You saved many non-coh PCIe host implementations a=
 day!=2E
>
>Unfortunately I don't think we can safely ttm_cached to ttm_write_comnine=
d, we've
>had enough drama with write combine behaviour on all different platforms=
=2E
>
>See drm_arch_can_wc_memory in drm_cache=2Eh=2E
>

Yes this really sounds like an issue=2E

Maybe the behavior of ttm_write_combined should furtherly be decided
by drm_arch_can_wc_memory() in case of quirks?

>Thanks=20
>
>> +
>>  	return ttm_prot_from_caching(caching, tmp);
>>  }
>>  EXPORT_SYMBOL(ttm_io_prot);
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt=2Ec b/drivers/gpu/drm/ttm/ttm_t=
t=2Ec
>> index 7b00ddf0ce49f=2E=2E3335df45fba5e 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt=2Ec
>> +++ b/drivers/gpu/drm/ttm/ttm_tt=2Ec
>> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>  			       enum ttm_caching caching,
>>  			       unsigned long extra_pages)
>>  {
>> +	/* Downgrade cached mapping for non-snooping devices */
>> +	if (!bo->bdev->dma_coherent && caching =3D=3D ttm_cached)
>> +		caching =3D ttm_write_combined;
>> +
>>  	ttm->num_pages =3D (PAGE_ALIGN(bo->base=2Esize) >> PAGE_SHIFT) + extr=
a_pages;
>>  	ttm->page_flags =3D page_flags;
>>  	ttm->dma_address =3D NULL;
>> diff --git a/include/drm/ttm/ttm_caching=2Eh b/include/drm/ttm/ttm_cach=
ing=2Eh
>> index a18f43e93abab=2E=2Ef92d7911f50e4 100644
>> --- a/include/drm/ttm/ttm_caching=2Eh
>> +++ b/include/drm/ttm/ttm_caching=2Eh
>> @@ -47,7 +47,8 @@ enum ttm_caching {
>>=20
>>  	/**
>>  	 * @ttm_cached: Fully cached like normal system memory, requires that
>> -	 * devices snoop the CPU cache on accesses=2E
>> +	 * devices snoop the CPU cache on accesses=2E Downgraded to
>> +	 * ttm_write_combined when the snooping capaiblity is missing=2E
>>  	 */
>>  	ttm_cached
>>  };
>> --=20
>> 2=2E45=2E2
>
