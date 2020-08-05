Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F423D32E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE5A6E839;
	Wed,  5 Aug 2020 20:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816AA6E838;
 Wed,  5 Aug 2020 20:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfnN2HmuR+pUTNdR6xbf9IJeFD1QbMZDP9oN99U3RHJfNcyrCEO3CnVRUMB0Fh1uFvHygNkxpeC4hl8kdAUpRehhaCEVU56RaFi+vnV2GI7h/a8taTWvux8EX+udXcc1k2krTOMv6TXN6gIBkwIwEycnD1E17Nje6ZVHkkanAHQNXf5IyFDtV9r5Nx328IOTfE9WAqyS3iTkYP3m3UcPWsijbPipaOQA7wwIFsXQ1ao1B7Mw79hIN3+8u0CKfm7yLxETSY9Lfb76IzfrP6UauD7kNZHtnY7FemIGn+otlTi/VnzCCMNna19ukNTXBAureGJqLOfe14mmDHub9WUKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7mV76r+qwwIxcd2dz1PaPZbu/IyOpbKprXojF8xD0Q=;
 b=UD8jB0tEY3wGt+4s0w0NruIlKq8kJNXul0MJRNd1jj9U+P0QkNyk5hzQW2F2vRvnUPKEug2yftxWxwiPnP2griQrhA5W4TAPH/jxRbS8ZXlZt26EseeRnps7lBMa/OTVWGCbKsG+WbqDqkGWPXkExLpog1zi8s/AK0tLZ43lLfldWp3o+E4N1GXRW/ZAWylnlQhrrlNdAuhrwIp+I/eUiR8Jis1uo0C1GvMqLn+/2Ga+Tsg4SpdNP7sH4fMmlFvDUBZZR3l3vWviO+cTqDPgv9ggLjKRLF+bbSBidcOsjsO76GBGaCYGyTgTj5qOFo6fz6mI+hFZm6M28z1rPD4+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7mV76r+qwwIxcd2dz1PaPZbu/IyOpbKprXojF8xD0Q=;
 b=ePvgBzxydzTPucYi/ccW+9wRiUO1++nQU/HIPAaR0DOsi4jAnSlspae2bEYZWxgw1VvCdEA0Q6U2+3joKW80mk/TZKAHkDdt4nevc7fMgNzLHHrDkLyH4tJn6S7VOlu9vEiiucjzDTti6LrF4qvm4DuhUtiqSKolY70yeIGN2SE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM5PR12MB1706.namprd12.prod.outlook.com (2603:10b6:3:10f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Wed, 5 Aug
 2020 20:37:36 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 20:37:36 +0000
Date: Wed, 5 Aug 2020 16:37:33 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 7/7] drm/amd/display: Replace DRM private objects with
 subclassed DRM atomic state
Message-ID: <20200805203733.xaeoi64556duleza@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 5 Aug 2020 20:37:35 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9e1b1cd-0a52-48e7-7bdd-08d8397f6327
X-MS-TrafficTypeDiagnostic: DM5PR12MB1706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1706789855BC4FB3B0F54AC3984B0@DM5PR12MB1706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1CarSqK2Pd9AuUi0VQ7gVa41hB6w/eGRl32/eGZp0yAI/RqL5nWoZgXxs1oh+b+xUXYcCJpkP6tecjrpb1Ljpt2rBkyU0ZcEMfTMfoz+Rp6EtnF7z1d0BMq5xTmgdjaYDSt+Cc+QhYaSGngMJcxtp06gz8ilIdMxS5b12sSpYNXD0YKRuPF5lN8NsDDXBgDQ5v8iVv3WENj8Y7iO4vTCFJZoJh7neL1nwVQ4aOma/C4HuMbmAuaoR4abT7gqUof5Z+0MrlTQgGuX6XGzGvTGtl0NIWdGaQzXAMNmxpQriwhZ3HH7Wvh+cUqqBqchPggPQhBKbLq2igVsAI4j5ajkEXMo8noY+JDe+if33ONxX/ttAvRmE+VD2tdPuLSR1hFpobgwBX+TydMPL5qfrW/sd4IWYivDVS0tdTz9BDoN5SE0S5rmCZq9p9pVD1tpUzY246qeaxCHm11fdeBG1Jxjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(186003)(16526019)(8936002)(44144004)(316002)(6636002)(7696005)(54906003)(6506007)(5660300002)(86362001)(30864003)(2906002)(8676002)(1076003)(52116002)(21480400003)(66556008)(55016002)(66946007)(45080400002)(66476007)(83380400001)(478600001)(966005)(6862004)(9686003)(450100002)(4326008)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pxuXPeTQvxwJ5yHtmwtB3MAuOxYL5g4rUVyOj46cZIbuUEXuj4/qcK6M9oUXsW8pAIAjuQNw687HlByOkfYzWtINvCnmjkU1yPJR/ZTE2nyf3d1WVeeZZTF2v9cbAAj18wNT+LmCKAv9M5wmTngADOEc3khrBTZCLPE16DXu6DRaCsW/5U/DWUah6IOtSEvHV9RJP4J5QAPNamfp1zlZMzmJ0b3Oi6Na/aJceGIjwOLL1dUJZelu2ng4QdsDEMLOhqG6edMreALtYDrtHUdz35v8R7eNfDWOTbBfuALOoa9l8E/WxSBHVwimAkCUNhS+0Yag6vaM/zVPbhiq6AcJWsha6lWqM3hCZCH5g4/oMOivsWok9oBxL8Obg+21snzgx9W0WVJErAfKI13u3PGTkb57tr/v5mTbjWmYtY3yf87ORJ3RfbSZAIkgfTkKm5c/uqbOpj931s8PPDMBKVr24PIHbuShIvODDN1vr+hucgsDEvBU9xrhUrrn1UpvaqHPVx8X9m39Ru9TQlwRu2yThuj37TiAsceLDfL/qRjRFO5brNR4BytJHvNSkZSYUK1GSOeWwsdvNtil38BCyTzfvnsQ58qyjFS7DkHgANoAnSrLHRrTJsQ5veVj+soJthF9IP8m5PerqvgKH02WgtdMs5cAMmhvBxprIzy0gTGtWx/w8TAKAvJBcFfUhyDkN54F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e1b1cd-0a52-48e7-7bdd-08d8397f6327
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 20:37:36.2476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mf2tkjDELvKVupw/Cy8D+RMcF7SIObcvhb24xpsqyGqXj0OmtWyWyELua0rVu6bK2Pm4fK5b5I0+YoH15FC38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1706
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0352185679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0352185679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cm2e4xfqabo52fkp"
Content-Disposition: inline

--cm2e4xfqabo52fkp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I have some minor inline comments, but everything looks fine when I
tested it on Raven; feel free to add=20

Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

in the whole series.

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> DM atomic check was structured in a way that we required old DC state
> in order to dynamically add and remove planes and streams from the
> context to build the DC state context for validation.
>=20
> DRM private objects were used to carry over the last DC state and
> were added to the context on nearly every commit - regardless of fast
> or full so we could check whether or not the new state could affect
> bandwidth.
>=20
> The problem with this model is that DRM private objects do not
> implicitly stall out other commits.
>=20
> So if you have two commits touching separate DRM objects they could
> run concurrently and potentially execute out of order - leading to a
> use-after-free.
>=20
> If we want this to be safe we have two options:
> 1. Stall out concurrent commits since they touch the same private object
> 2. Refactor DM to not require old DC state and drop private object usage
>=20
> [How]
> This implements approach #2 since it still allows for judder free
> updates in multi-display scenarios.
>=20
> I'll list the big changes in order at a high level:
>=20
> 1. Subclass DRM atomic state instead of using DRM private objects.
>=20
> DC relied on the old state to determine which changes cause bandwidth
> updates but now we have DM perform similar checks based on DRM state
> instead - dropping the requirement for old state to exist at all.
>=20
> This means that we can now build a new DC context from scratch whenever
> we have something that DM thinks could affect bandwidth.
>=20
> Whenever we need to rebuild bandwidth we now add all CRTCs and planes
> to the DRM state in order to get the absolute set of DC streams and
> DC planes.
>=20
> This introduces a stall on other commits, but this stall already
> exists because of the lock_and_validation logic and it's necessary
> since updates may move around pipes and require full reprogramming.
>=20
> 2. Drop workarounds to add planes to maintain z-order early in atomic
> check. This is no longer needed because of the changes for (1).
>=20
> This also involves fixing up should_plane_reset checks since we can just
> avoid resetting streams and planes when they haven't actually changed.
>=20
> 3. Rework dm_update_crtc_state and dm_update_plane_state to be single
> pass instead of two pass.
>=20
> This is necessary since we no longer have the dc_state to add and
> remove planes to the context in and we want to defer creation to the
> end of commit_check.
>=20
> It also makes the logic a lot simpler to follow since as an added bonus.
>=20
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 720 +++++++-----------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  11 +-
>  2 files changed, 280 insertions(+), 451 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 59829ec81694..97a7dfc620e8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1839,7 +1839,6 @@ static int dm_resume(void *handle)
>  	struct drm_plane *plane;
>  	struct drm_plane_state *new_plane_state;
>  	struct dm_plane_state *dm_new_plane_state;
> -	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(dm->atomic_obj.=
state);
>  	enum dc_connection_type new_connection_type =3D dc_connection_none;
>  	struct dc_state *dc_state;
>  	int i, r, j;
> @@ -1879,11 +1878,6 @@ static int dm_resume(void *handle)
> =20
>  		return 0;
>  	}
> -	/* Recreate dc_state - DC invalidates it when setting power state to S3=
=2E */
> -	dc_release_state(dm_state->context);
> -	dm_state->context =3D dc_create_state(dm->dc);
> -	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
> -	dc_resource_state_construct(dm->dc, dm_state->context);
> =20
>  	/* Before powering on DC we need to re-initialize DMUB. */
>  	r =3D dm_dmub_hw_init(adev);
> @@ -2019,11 +2013,51 @@ const struct amdgpu_ip_block_version dm_ip_block =
=3D
>   * *WIP*
>   */
> =20
> +struct drm_atomic_state *dm_atomic_state_alloc(struct drm_device *dev)
> +{
> +	struct dm_atomic_state *dm_state;
> +
> +	dm_state =3D kzalloc(sizeof(*dm_state), GFP_KERNEL);

How about use GFP_ATOMIC here?

> +
> +	if (!dm_state)
> +		return NULL;
> +
> +	if (drm_atomic_state_init(dev, &dm_state->base) < 0) {
> +		kfree(dm_state);
> +		return NULL;
> +	}
> +
> +	return &dm_state->base;
> +}
> +
> +void dm_atomic_state_free(struct drm_atomic_state *state)
> +{
> +	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
> +
> +	if (dm_state->context) {
> +		dc_release_state(dm_state->context);
> +		dm_state->context =3D NULL;
> +	}
> +
> +	drm_atomic_state_default_release(state);
> +	kfree(state);
> +}
> +
> +void dm_atomic_state_clear(struct drm_atomic_state *state)
> +{
> +	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
> +
> +	drm_atomic_state_default_clear(&dm_state->base);
> +}
> +
>  static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs =3D {
>  	.fb_create =3D amdgpu_display_user_framebuffer_create,
>  	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
>  	.atomic_check =3D amdgpu_dm_atomic_check,
>  	.atomic_commit =3D amdgpu_dm_atomic_commit,
> +	.atomic_state_alloc =3D dm_atomic_state_alloc,

Nit: the above hooks use the prefix amdgpu_dm, maybe it is a good idea
to keep this pattern for the new functions.

> +	.atomic_state_free =3D dm_atomic_state_free,
> +	.atomic_state_clear =3D dm_atomic_state_clear,

Looks like that the above function scope is restricted to this file and
you only use it in the above data struct. How about making all of the
new functions static?

>  };
> =20
>  static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperf=
uncs =3D {
> @@ -2782,108 +2816,6 @@ static int dcn10_register_irq_handlers(struct amd=
gpu_device *adev)
>  }
>  #endif
> =20
> -/*
> - * Acquires the lock for the atomic state object and returns
> - * the new atomic state.
> - *
> - * This should only be called during atomic check.
> - */
> -static int dm_atomic_get_state(struct drm_atomic_state *state,
> -			       struct dm_atomic_state **dm_state)
> -{
> -	struct drm_device *dev =3D state->dev;
> -	struct amdgpu_device *adev =3D dev->dev_private;
> -	struct amdgpu_display_manager *dm =3D &adev->dm;
> -	struct drm_private_state *priv_state;
> -
> -	if (*dm_state)
> -		return 0;
> -
> -	priv_state =3D drm_atomic_get_private_obj_state(state, &dm->atomic_obj);
> -	if (IS_ERR(priv_state))
> -		return PTR_ERR(priv_state);
> -
> -	*dm_state =3D to_dm_atomic_state(priv_state);
> -
> -	return 0;
> -}
> -
> -static struct dm_atomic_state *
> -dm_atomic_get_new_state(struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev =3D state->dev;
> -	struct amdgpu_device *adev =3D dev->dev_private;
> -	struct amdgpu_display_manager *dm =3D &adev->dm;
> -	struct drm_private_obj *obj;
> -	struct drm_private_state *new_obj_state;
> -	int i;
> -
> -	for_each_new_private_obj_in_state(state, obj, new_obj_state, i) {
> -		if (obj->funcs =3D=3D dm->atomic_obj.funcs)
> -			return to_dm_atomic_state(new_obj_state);
> -	}
> -
> -	return NULL;
> -}
> -
> -static struct dm_atomic_state *
> -dm_atomic_get_old_state(struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev =3D state->dev;
> -	struct amdgpu_device *adev =3D dev->dev_private;
> -	struct amdgpu_display_manager *dm =3D &adev->dm;
> -	struct drm_private_obj *obj;
> -	struct drm_private_state *old_obj_state;
> -	int i;
> -
> -	for_each_old_private_obj_in_state(state, obj, old_obj_state, i) {
> -		if (obj->funcs =3D=3D dm->atomic_obj.funcs)
> -			return to_dm_atomic_state(old_obj_state);
> -	}
> -
> -	return NULL;
> -}
> -
> -static struct drm_private_state *
> -dm_atomic_duplicate_state(struct drm_private_obj *obj)
> -{
> -	struct dm_atomic_state *old_state, *new_state;
> -
> -	new_state =3D kzalloc(sizeof(*new_state), GFP_KERNEL);
> -	if (!new_state)
> -		return NULL;
> -
> -	__drm_atomic_helper_private_obj_duplicate_state(obj, &new_state->base);
> -
> -	old_state =3D to_dm_atomic_state(obj->state);
> -
> -	if (old_state && old_state->context)
> -		new_state->context =3D dc_copy_state(old_state->context);
> -
> -	if (!new_state->context) {
> -		kfree(new_state);
> -		return NULL;
> -	}
> -
> -	return &new_state->base;
> -}
> -
> -static void dm_atomic_destroy_state(struct drm_private_obj *obj,
> -				    struct drm_private_state *state)
> -{
> -	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
> -
> -	if (dm_state && dm_state->context)
> -		dc_release_state(dm_state->context);
> -
> -	kfree(dm_state);
> -}
> -
> -static struct drm_private_state_funcs dm_atomic_state_funcs =3D {
> -	.atomic_duplicate_state =3D dm_atomic_duplicate_state,
> -	.atomic_destroy_state =3D dm_atomic_destroy_state,
> -};
> -
>  static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>  {
>  	struct dm_atomic_state *state;
> @@ -2916,11 +2848,6 @@ static int amdgpu_dm_mode_config_init(struct amdgp=
u_device *adev)
> =20
>  	dc_resource_state_copy_construct_current(adev->dm.dc, state->context);
> =20
> -	drm_atomic_private_obj_init(adev->ddev,
> -				    &adev->dm.atomic_obj,
> -				    &state->base,
> -				    &dm_atomic_state_funcs);
> -
>  	r =3D amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> @@ -3360,7 +3287,6 @@ static int amdgpu_dm_initialize_drm_device(struct a=
mdgpu_device *adev)
>  static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *=
dm)
>  {
>  	drm_mode_config_cleanup(dm->ddev);
> -	drm_atomic_private_obj_fini(&dm->atomic_obj);
>  	return;
>  }
> =20
> @@ -7533,7 +7459,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm=
_atomic_state *state)
>  	struct drm_device *dev =3D state->dev;
>  	struct amdgpu_device *adev =3D dev->dev_private;
>  	struct amdgpu_display_manager *dm =3D &adev->dm;
> -	struct dm_atomic_state *dm_state;
> +	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
>  	struct dc_state *dc_state =3D NULL, *dc_state_temp =3D NULL;
>  	uint32_t i, j;
>  	struct drm_crtc *crtc;
> @@ -7547,8 +7473,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm=
_atomic_state *state)
> =20
>  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> =20
> -	dm_state =3D dm_atomic_get_new_state(state);
> -	if (dm_state && dm_state->context) {
> +	if (dm_state->context) {
>  		dc_state =3D dm_state->context;
>  	} else {
>  		/* No state changes, retain current state. */
> @@ -8052,10 +7977,8 @@ static int dm_update_crtc_state(struct amdgpu_disp=
lay_manager *dm,
>  				struct drm_crtc *crtc,
>  				struct drm_crtc_state *old_crtc_state,
>  				struct drm_crtc_state *new_crtc_state,
> -				bool enable,
>  				bool *lock_and_validation_needed)
>  {
> -	struct dm_atomic_state *dm_state =3D NULL;
>  	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>  	struct dc_stream_state *new_stream;
>  	int ret =3D 0;
> @@ -8077,7 +8000,7 @@ static int dm_update_crtc_state(struct amdgpu_displ=
ay_manager *dm,
>  	aconnector =3D amdgpu_dm_find_first_crtc_matching_connector(state, crtc=
);
> =20
>  	/* TODO This hack should go away */
> -	if (aconnector && enable) {
> +	if (aconnector) {
>  		/* Make sure fake sink is created in plug-in scenario */
>  		drm_new_conn_state =3D drm_atomic_get_new_connector_state(state,
>  							    &aconnector->base);
> @@ -8155,36 +8078,20 @@ static int dm_update_crtc_state(struct amdgpu_dis=
play_manager *dm,
>  		new_crtc_state->active_changed,
>  		new_crtc_state->connectors_changed);
> =20
> -	/* Remove stream for any changed/disabled CRTC */
> -	if (!enable) {
> -
> -		if (!dm_old_crtc_state->stream)
> -			goto skip_modeset;
> -
> -		ret =3D dm_atomic_get_state(state, &dm_state);
> -		if (ret)
> -			goto fail;
> -
> -		DRM_DEBUG_DRIVER("Disabling DRM crtc: %d\n",
> -				crtc->base.id);
> +	/* Remove stream for changed CRTC - can't reuse it for validation. */
> +	if (dm_new_crtc_state->stream) {
> +		DRM_DEBUG_DRIVER("Disabling DRM crtc: %d\n", crtc->base.id);
> =20
> -		/* i.e. reset mode */
> -		if (dc_remove_stream_from_ctx(
> -				dm->dc,
> -				dm_state->context,
> -				dm_old_crtc_state->stream) !=3D DC_OK) {
> -			ret =3D -EINVAL;
> -			goto fail;
> -		}
> -
> -		dc_stream_release(dm_old_crtc_state->stream);
> +		dc_stream_release(dm_new_crtc_state->stream);
>  		dm_new_crtc_state->stream =3D NULL;
> =20
>  		reset_freesync_config_for_crtc(dm_new_crtc_state);
> =20
>  		*lock_and_validation_needed =3D true;
> +	}
> =20
> -	} else {/* Add stream for any updated/enabled CRTC */
> +	/* Add stream for any updated/enabled CRTC - active implies enabled. */
> +	if (new_crtc_state->active) {
>  		/*
>  		 * Quick fix to prevent NULL pointer on new_stream when
>  		 * added MST connectors not found in existing crtc_state in the chaine=
d mode
> @@ -8193,35 +8100,13 @@ static int dm_update_crtc_state(struct amdgpu_dis=
play_manager *dm,
>  		if (!aconnector || (!aconnector->dc_sink && aconnector->mst_port))
>  			goto skip_modeset;
> =20
> -		if (modereset_required(new_crtc_state))
> -			goto skip_modeset;
> -
> -		if (modeset_required(new_crtc_state, new_stream,
> -				     dm_old_crtc_state->stream)) {
> -
> -			WARN_ON(dm_new_crtc_state->stream);
> -
> -			ret =3D dm_atomic_get_state(state, &dm_state);
> -			if (ret)
> -				goto fail;
> -
> -			dm_new_crtc_state->stream =3D new_stream;
> +		WARN_ON(dm_new_crtc_state->stream);
> +		dm_new_crtc_state->stream =3D new_stream;
> +		dc_stream_retain(new_stream);
> =20
> -			dc_stream_retain(new_stream);
> +		DRM_DEBUG_DRIVER("Enabling DRM crtc: %d\n", crtc->base.id);
> =20
> -			DRM_DEBUG_DRIVER("Enabling DRM crtc: %d\n",
> -						crtc->base.id);
> -
> -			if (dc_add_stream_to_ctx(
> -					dm->dc,
> -					dm_state->context,
> -					dm_new_crtc_state->stream) !=3D DC_OK) {
> -				ret =3D -EINVAL;
> -				goto fail;
> -			}
> -
> -			*lock_and_validation_needed =3D true;
> -		}
> +		*lock_and_validation_needed =3D true;
>  	}
> =20
>  skip_modeset:
> @@ -8233,7 +8118,7 @@ static int dm_update_crtc_state(struct amdgpu_displ=
ay_manager *dm,
>  	 * We want to do dc stream updates that do not require a
>  	 * full modeset below.
>  	 */
> -	if (!(enable && aconnector && new_crtc_state->active))
> +	if (!(aconnector && new_crtc_state->enable && new_crtc_state->active))
>  		return 0;
>  	/*
>  	 * Given above conditions, the dc state cannot be NULL because:
> @@ -8281,10 +8166,12 @@ static bool should_reset_plane(struct drm_atomic_=
state *state,
>  			       struct drm_plane_state *old_plane_state,
>  			       struct drm_plane_state *new_plane_state)
>  {
> -	struct drm_plane *other;
> -	struct drm_plane_state *old_other_state, *new_other_state;
>  	struct drm_crtc_state *new_crtc_state;
> -	int i;
> +	struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
> +
> +	/* Cursor planes don't affect bandwidth. */
> +	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +		return false;
> =20
>  	/*
>  	 * TODO: Remove this hack once the checks below are sufficient
> @@ -8312,71 +8199,50 @@ static bool should_reset_plane(struct drm_atomic_=
state *state,
>  	if (new_crtc_state->color_mgmt_changed)
>  		return true;
> =20
> +	/* Plane scaling can change with a modeset, so reset. */
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
>  		return true;
> =20
> -	/*
> -	 * If there are any new primary or overlay planes being added or
> -	 * removed then the z-order can potentially change. To ensure
> -	 * correct z-order and pipe acquisition the current DC architecture
> -	 * requires us to remove and recreate all existing planes.
> -	 *
> -	 * TODO: Come up with a more elegant solution for this.
> -	 */
> -	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other=
_state, i) {
> -		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
> -
> -		if (other->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -			continue;
> -
> -		if (old_other_state->crtc !=3D new_plane_state->crtc &&
> -		    new_other_state->crtc !=3D new_plane_state->crtc)
> -			continue;
> -
> -		if (old_other_state->crtc !=3D new_other_state->crtc)
> -			return true;
> -
> -		/* Src/dst size and scaling updates. */
> -		if (old_other_state->src_w !=3D new_other_state->src_w ||
> -		    old_other_state->src_h !=3D new_other_state->src_h ||
> -		    old_other_state->crtc_w !=3D new_other_state->crtc_w ||
> -		    old_other_state->crtc_h !=3D new_other_state->crtc_h)
> -			return true;
> +	/* Src/dst size and scaling updates. */
> +	if (old_plane_state->src_w !=3D new_plane_state->src_w ||
> +	    old_plane_state->src_h !=3D new_plane_state->src_h ||
> +	    old_plane_state->crtc_w !=3D new_plane_state->crtc_w ||
> +	    old_plane_state->crtc_h !=3D new_plane_state->crtc_h)
> +		return true;
> =20
> -		/* Rotation / mirroring updates. */
> -		if (old_other_state->rotation !=3D new_other_state->rotation)
> -			return true;
> +	/* Rotation / mirroring updates. */
> +	if (old_plane_state->rotation !=3D new_plane_state->rotation)
> +		return true;
> =20
> -		/* Blending updates. */
> -		if (old_other_state->pixel_blend_mode !=3D
> -		    new_other_state->pixel_blend_mode)
> -			return true;
> +	/* Blending updates. */
> +	if (old_plane_state->pixel_blend_mode !=3D
> +	    new_plane_state->pixel_blend_mode)
> +		return true;
> =20
> -		/* Alpha updates. */
> -		if (old_other_state->alpha !=3D new_other_state->alpha)
> -			return true;
> +	/* Alpha updates. */
> +	if (old_plane_state->alpha !=3D new_plane_state->alpha)
> +		return true;
> =20
> -		/* Colorspace changes. */
> -		if (old_other_state->color_range !=3D new_other_state->color_range ||
> -		    old_other_state->color_encoding !=3D new_other_state->color_encodi=
ng)
> -			return true;
> +	/* Colorspace changes. */
> +	if (old_plane_state->color_range !=3D new_plane_state->color_range ||
> +	    old_plane_state->color_encoding !=3D new_plane_state->color_encodin=
g)
> +		return true;
> =20
> -		/* Framebuffer checks fall at the end. */
> -		if (!old_other_state->fb || !new_other_state->fb)
> -			continue;
> +	/* Framebuffer checks fall at the end. */
> +	if (!old_plane_state->fb || !new_plane_state->fb)
> +		return false;
> =20
> -		/* Pixel format changes can require bandwidth updates. */
> -		if (old_other_state->fb->format !=3D new_other_state->fb->format)
> -			return true;
> +	/* Pixel format changes can require bandwidth updates. */
> +	if (old_plane_state->fb->format !=3D new_plane_state->fb->format)
> +		return true;
> =20
> -		old_dm_plane_state =3D to_dm_plane_state(old_other_state);
> -		new_dm_plane_state =3D to_dm_plane_state(new_other_state);
> +	old_dm_plane_state =3D to_dm_plane_state(old_plane_state);
> +	new_dm_plane_state =3D to_dm_plane_state(new_plane_state);
> =20
> -		/* Tiling and DCC changes also require bandwidth updates. */
> -		if (old_dm_plane_state->tiling_flags !=3D
> -		    new_dm_plane_state->tiling_flags)
> -			return true;
> -	}
> +	/* Tiling and DCC changes also require bandwidth updates. */
> +	if (old_dm_plane_state->tiling_flags !=3D
> +	    new_dm_plane_state->tiling_flags)
> +		return true;
> =20
>  	return false;
>  }
> @@ -8386,15 +8252,12 @@ static int dm_update_plane_state(struct dc *dc,
>  				 struct drm_plane *plane,
>  				 struct drm_plane_state *old_plane_state,
>  				 struct drm_plane_state *new_plane_state,
> -				 bool enable,
>  				 bool *lock_and_validation_needed)
>  {
> -
> -	struct dm_atomic_state *dm_state =3D NULL;
>  	struct drm_crtc *new_plane_crtc, *old_plane_crtc;
> -	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> -	struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
> -	struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct dm_crtc_state *dm_new_crtc_state;
> +	struct dm_plane_state *dm_new_plane_state;
>  	struct amdgpu_crtc *new_acrtc;
>  	bool needs_reset;
>  	int ret =3D 0;
> @@ -8403,12 +8266,12 @@ static int dm_update_plane_state(struct dc *dc,
>  	new_plane_crtc =3D new_plane_state->crtc;
>  	old_plane_crtc =3D old_plane_state->crtc;
>  	dm_new_plane_state =3D to_dm_plane_state(new_plane_state);
> -	dm_old_plane_state =3D to_dm_plane_state(old_plane_state);
> =20
>  	/*TODO Implement better atomic check for cursor plane */
>  	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> -		if (!enable || !new_plane_crtc ||
> -			drm_atomic_plane_disabling(plane->state, new_plane_state))
> +		/* Cursor disabled is always OK. */
> +		if (!new_plane_crtc ||
> +		    drm_atomic_plane_disabling(plane->state, new_plane_state))
>  			return 0;
> =20
>  		new_acrtc =3D to_amdgpu_crtc(new_plane_crtc);
> @@ -8423,123 +8286,72 @@ static int dm_update_plane_state(struct dc *dc,
>  		return 0;
>  	}
> =20
> +	/* Check if the plane requires a reset for bandwidth validation. */
>  	needs_reset =3D should_reset_plane(state, plane, old_plane_state,
>  					 new_plane_state);
> =20
> -	/* Remove any changed/removed planes */
> -	if (!enable) {
> -		if (!needs_reset)
> -			return 0;
> -
> -		if (!old_plane_crtc)
> -			return 0;
> -
> -		old_crtc_state =3D drm_atomic_get_old_crtc_state(
> -				state, old_plane_crtc);
> -		dm_old_crtc_state =3D to_dm_crtc_state(old_crtc_state);
> -
> -		if (!dm_old_crtc_state->stream)
> -			return 0;
> +	/* Exit early if the plane hasn't been trivially modified. */
> +	if (!needs_reset)
> +		return 0;
> =20
> +	/**
> +	 * Remove exisiting plane, if any - we can't reuse it for validation

Nit: exisiting -> existing

> +	 * because we'd be modifying the current state applied to HW.
> +	 */
> +	if (dm_new_plane_state->dc_state) {
>  		DRM_DEBUG_ATOMIC("Disabling DRM plane: %d on DRM crtc %d\n",
> -				plane->base.id, old_plane_crtc->base.id);
> -
> -		ret =3D dm_atomic_get_state(state, &dm_state);
> -		if (ret)
> -			return ret;
> +				 plane->base.id, old_plane_crtc->base.id);
> =20
> -		if (!dc_remove_plane_from_context(
> -				dc,
> -				dm_old_crtc_state->stream,
> -				dm_old_plane_state->dc_state,
> -				dm_state->context)) {
> -
> -			ret =3D EINVAL;
> -			return ret;
> -		}
> -
> -
> -		dc_plane_state_release(dm_old_plane_state->dc_state);
> +		dc_plane_state_release(dm_new_plane_state->dc_state);
>  		dm_new_plane_state->dc_state =3D NULL;
> =20
>  		*lock_and_validation_needed =3D true;
> +	}
> =20
> -	} else { /* Add new planes */
> -		struct dc_plane_state *dc_new_plane_state;
> -
> -		if (drm_atomic_plane_disabling(plane->state, new_plane_state))
> -			return 0;
> -
> -		if (!new_plane_crtc)
> -			return 0;
> -
> -		new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_plane_crtc=
);
> -		dm_new_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> -
> -		if (!dm_new_crtc_state->stream)
> -			return 0;
> -
> -		if (!needs_reset)
> -			return 0;
> -
> -		ret =3D dm_plane_helper_check_state(new_plane_state, new_crtc_state);
> -		if (ret)
> -			return ret;
> -
> -		WARN_ON(dm_new_plane_state->dc_state);
> -
> -		dc_new_plane_state =3D dc_create_plane_state(dc);
> -		if (!dc_new_plane_state)
> -			return -ENOMEM;
> -
> -		DRM_DEBUG_DRIVER("Enabling DRM plane: %d on DRM crtc %d\n",
> -				plane->base.id, new_plane_crtc->base.id);
> +	/**
> +	 * If the plane is disabling exit early. Also serves as a guarantee
> +	 * that we have a framebuffer below if we do have a CRTC.
> +	 */
> +	if (drm_atomic_plane_disabling(plane->state, new_plane_state))
> +		return 0;
> =20
> -		ret =3D fill_dc_plane_attributes(
> -			new_plane_crtc->dev->dev_private,
> -			dc_new_plane_state,
> -			new_plane_state,
> -			new_crtc_state);
> -		if (ret) {
> -			dc_plane_state_release(dc_new_plane_state);
> -			return ret;
> -		}
> +	/* If we don't have a CRTC then the plane is disabled. */
> +	if (!new_plane_crtc)
> +		return 0;
> =20
> -		ret =3D dm_atomic_get_state(state, &dm_state);
> -		if (ret) {
> -			dc_plane_state_release(dc_new_plane_state);
> -			return ret;
> -		}
> +	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_plane_crtc);
> +	dm_new_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> =20
> -		/*
> -		 * Any atomic check errors that occur after this will
> -		 * not need a release. The plane state will be attached
> -		 * to the stream, and therefore part of the atomic
> -		 * state. It'll be released when the atomic state is
> -		 * cleaned.
> -		 */
> -		if (!dc_add_plane_to_context(
> -				dc,
> -				dm_new_crtc_state->stream,
> -				dc_new_plane_state,
> -				dm_state->context)) {
> +	/* Don't enable the plane if there's no stream for output. */
> +	if (!dm_new_crtc_state->stream)
> +		return 0;
> =20
> -			dc_plane_state_release(dc_new_plane_state);
> -			return -EINVAL;
> -		}
> +	/**
> +	 * Freeing the plane will take care of freeing the dc_state
> +	 * on failure, so we don't need to explicitly release below.
> +	 */
> +	dm_new_plane_state->dc_state =3D dc_create_plane_state(dc);
> +	if (!dm_new_plane_state->dc_state)
> +		return -ENOMEM;
> =20
> -		dm_new_plane_state->dc_state =3D dc_new_plane_state;
> +	DRM_DEBUG_DRIVER("Enabling DRM plane: %d on DRM crtc %d\n",
> +			 plane->base.id, new_plane_crtc->base.id);
> =20
> -		/* Tell DC to do a full surface update every time there
> -		 * is a plane change. Inefficient, but works for now.
> -		 */
> -		dm_new_plane_state->dc_state->update_flags.bits.full_update =3D 1;
> +	ret =3D fill_dc_plane_attributes(new_plane_crtc->dev->dev_private,
> +				       dm_new_plane_state->dc_state,
> +				       new_plane_state, new_crtc_state);
> +	if (ret)
> +		return ret;
> =20
> -		*lock_and_validation_needed =3D true;
> -	}
> +	/**
> +	 * Tell DC to do a full surface update every time there
> +	 * is a plane change. Inefficient, but works for now.
> +	 */
> +	dm_new_plane_state->dc_state->update_flags.bits.full_update =3D 1;
> =20
> +	*lock_and_validation_needed =3D true;
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> @@ -8567,6 +8379,113 @@ static int add_affected_mst_dsc_crtcs(struct drm_=
atomic_state *state, struct drm
>  }
>  #endif
> =20
> +static int dm_atomic_state_init_context(struct drm_device *dev,
> +					struct drm_atomic_state *state)
> +{
> +	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
> +	struct amdgpu_device *adev =3D dev->dev_private;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +	struct dm_crtc_state *new_dm_crtc_state;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *new_plane_state, *old_plane_state;
> +	struct dm_plane_state *new_dm_plane_state;
> +	int ret, i;
> +
> +	dm_state->context =3D dc_create_state(adev->dm.dc);
> +	if (!dm_state->context)
> +		return -ENOMEM;
> +
> +	/**
> +	 * DC validation requires an absolute set of streams and planes to work
> +	 * with so add all planes and CRTCs to the state to make this work.
> +	 * Pipe allocation can change so there's no easy way to work around
> +	 * this constraint.
> +	 *
> +	 * Unfortunately this also means that whenever userspace requests a
> +	 * change that only needs to modify one CRTC's planes we still have to
> +	 * stall out fast updates affecting other CRTCs - introducing judder
> +	 * in multi-monitor scenarios.
> +	 *
> +	 * Userspace should avoid frequent updates to properties that can
> +	 * require bandwidth changes.
> +	 */
> +	drm_for_each_crtc(crtc, dev) {
> +		new_crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> +		if (IS_ERR(new_crtc_state))
> +			return PTR_ERR(new_crtc_state);
> +
> +		/**
> +		 * Cursor planes may not strictly be necessary here
> +		 * but it's probably safer to add them.
> +		 */
> +		ret =3D drm_atomic_add_affected_planes(state, crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		new_dm_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> +
> +		if (!new_dm_crtc_state->stream)
> +			continue;
> +
> +		if (dc_add_stream_to_ctx(adev->dm.dc, dm_state->context,
> +					 new_dm_crtc_state->stream) !=3D DC_OK)
> +			return -EINVAL;
> +	}
> +
> +	/**
> +	 * Planes are added in reverse order to ensure correct blending order
> +	 * in DC - planes with higher priority go first, and the cursor and
> +	 * MPO planes are at the very end of the list.
> +	 */
> +	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, n=
ew_plane_state, i) {
> +		/* Cursors aren't real hardware planes. */
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +			continue;
> +
> +		if (!new_plane_state->crtc)
> +			continue;
> +
> +		new_crtc_state =3D drm_atomic_get_new_crtc_state(
> +			state, new_plane_state->crtc);
> +
> +		if (!new_crtc_state) {
> +			DRM_WARN("No CRTC state found: plane=3D%d crtc=3D%d\n",
> +				 plane->base.id,
> +				 new_plane_state->crtc->base.id);
> +			return -EINVAL;
> +		}
> +
> +		new_dm_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> +
> +		/* Skip planes for disabled streams. */
> +		if (!new_dm_crtc_state->stream)
> +			continue;
> +
> +		new_dm_plane_state =3D to_dm_plane_state(new_plane_state);
> +
> +		if (!new_dm_plane_state->dc_state) {
> +			DRM_WARN("No DC state found: plane=3D%d crtc=3D%d\n",
> +				 plane->base.id,
> +				 new_plane_state->crtc->base.id);
> +			return -EINVAL;
> +		}
> +
> +		if (!dc_add_plane_to_context(
> +			    adev->dm.dc, new_dm_crtc_state->stream,
> +			    new_dm_plane_state->dc_state, dm_state->context)) {
> +			DRM_DEBUG_KMS(
> +				"Couldn't add plane to context: plane=3D%d\n",
> +				plane->base.id);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
>   * @dev: The DRM device
> @@ -8595,7 +8514,7 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,
>  				  struct drm_atomic_state *state)
>  {
>  	struct amdgpu_device *adev =3D dev->dev_private;
> -	struct dm_atomic_state *dm_state =3D NULL;
> +	struct dm_atomic_state *dm_state =3D to_dm_atomic_state(state);
>  	struct dc *dc =3D adev->dm.dc;
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_con_state, *new_con_state;
> @@ -8607,6 +8526,11 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  	int ret, i;
>  	bool lock_and_validation_needed =3D false;
> =20
> +	/**
> +	 * Check for modesets on CRTCs in the new state. DRM internally checks
> +	 * that the mode has actually changed for us as well in here, so we can
> +	 * avoid modesets.
> +	 */
>  	ret =3D drm_atomic_helper_check_modeset(dev, state);
>  	if (ret)
>  		goto fail;
> @@ -8634,6 +8558,18 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  			new_crtc_state->connectors_changed =3D true;
>  	}
> =20
> +	/**
> +	 * Add all required objects for performing the commit and stalling out
> +	 * other commits that may be touching the same resources.
> +	 */
> +

Nit: Join the above and below comment in a single one, and also use '/*'
instead of '/**'.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Best Regards

> +	/**
> +	 * Pass one: Add all affected CRTCs on a MST DSC topology that has a
> +	 * CRTC undergoing a modeset and mark mode_changed =3D true for each on=
e.
> +	 *
> +	 * Optimization: DSC can only be supported on DCN2 onwards, so we can
> +	 * skip on earlier ASIC.
> +	 */
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  	if (adev->asic_type >=3D CHIP_NAVI10) {
>  		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_st=
ate, i) {
> @@ -8645,6 +8581,8 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,
>  		}
>  	}
>  #endif
> +
> +	/* Pass two: Add connectors and planes for CRTCs as needed.  */
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_sta=
te, i) {
>  		if (!drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>  		    !new_crtc_state->color_mgmt_changed &&
> @@ -8663,42 +8601,6 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  			goto fail;
>  	}
> =20
> -	/*
> -	 * Add all primary and overlay planes on the CRTC to the state
> -	 * whenever a plane is enabled to maintain correct z-ordering
> -	 * and to enable fast surface updates.
> -	 */
> -	drm_for_each_crtc(crtc, dev) {
> -		bool modified =3D false;
> -
> -		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plan=
e_state, i) {
> -			if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -				continue;
> -
> -			if (new_plane_state->crtc =3D=3D crtc ||
> -			    old_plane_state->crtc =3D=3D crtc) {
> -				modified =3D true;
> -				break;
> -			}
> -		}
> -
> -		if (!modified)
> -			continue;
> -
> -		drm_for_each_plane_mask(plane, state->dev, crtc->state->plane_mask) {
> -			if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -				continue;
> -
> -			new_plane_state =3D
> -				drm_atomic_get_plane_state(state, plane);
> -
> -			if (IS_ERR(new_plane_state)) {
> -				ret =3D PTR_ERR(new_plane_state);
> -				goto fail;
> -			}
> -		}
> -	}
> -
>  	/* Prepass for updating tiling flags on new planes. */
>  	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
>  		struct dm_plane_state *new_dm_plane_state =3D to_dm_plane_state(new_pl=
ane_state);
> @@ -8710,45 +8612,21 @@ static int amdgpu_dm_atomic_check(struct drm_devi=
ce *dev,
>  			goto fail;
>  	}
> =20
> -	/* Remove exiting planes if they are modified */
> -	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, n=
ew_plane_state, i) {
> -		ret =3D dm_update_plane_state(dc, state, plane,
> -					    old_plane_state,
> -					    new_plane_state,
> -					    false,
> -					    &lock_and_validation_needed);
> -		if (ret)
> -			goto fail;
> -	}
> -
> -	/* Disable all crtcs which require disable */
> +	/* Update modified CRTCs. */
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_sta=
te, i) {
>  		ret =3D dm_update_crtc_state(&adev->dm, state, crtc,
>  					   old_crtc_state,
>  					   new_crtc_state,
> -					   false,
>  					   &lock_and_validation_needed);
>  		if (ret)
>  			goto fail;
>  	}
> =20
> -	/* Enable all crtcs which require enable */
> -	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_sta=
te, i) {
> -		ret =3D dm_update_crtc_state(&adev->dm, state, crtc,
> -					   old_crtc_state,
> -					   new_crtc_state,
> -					   true,
> -					   &lock_and_validation_needed);
> -		if (ret)
> -			goto fail;
> -	}
> -
> -	/* Add new/modified planes */
> +	/* Update modified planes. */
>  	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, n=
ew_plane_state, i) {
>  		ret =3D dm_update_plane_state(dc, state, plane,
>  					    old_plane_state,
>  					    new_plane_state,
> -					    true,
>  					    &lock_and_validation_needed);
>  		if (ret)
>  			goto fail;
> @@ -8812,10 +8690,11 @@ static int amdgpu_dm_atomic_check(struct drm_devi=
ce *dev,
>  	 * DRM state directly - we can end up disabling interrupts too early
>  	 * if we don't.
>  	 *
> -	 * TODO: Remove this stall and drop DM state private objects.
> +	 * TODO: Remove this stall.
>  	 */
>  	if (lock_and_validation_needed) {
> -		ret =3D dm_atomic_get_state(state, &dm_state);
> +		/* Create a new DC context to validate. */
> +		ret =3D dm_atomic_state_init_context(dev, state);
>  		if (ret)
>  			goto fail;
> =20
> @@ -8848,47 +8727,6 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  			ret =3D -EINVAL;
>  			goto fail;
>  		}
> -	} else {
> -		/*
> -		 * The commit is a fast update. Fast updates shouldn't change
> -		 * the DC context, affect global validation, and can have their
> -		 * commit work done in parallel with other commits not touching
> -		 * the same resource. If we have a new DC context as part of
> -		 * the DM atomic state from validation we need to free it and
> -		 * retain the existing one instead.
> -		 *
> -		 * Furthermore, since the DM atomic state only contains the DC
> -		 * context and can safely be annulled, we can free the state
> -		 * and clear the associated private object now to free
> -		 * some memory and avoid a possible use-after-free later.
> -		 */
> -
> -		for (i =3D 0; i < state->num_private_objs; i++) {
> -			struct drm_private_obj *obj =3D state->private_objs[i].ptr;
> -
> -			if (obj->funcs =3D=3D adev->dm.atomic_obj.funcs) {
> -				int j =3D state->num_private_objs-1;
> -
> -				dm_atomic_destroy_state(obj,
> -						state->private_objs[i].state);
> -
> -				/* If i is not at the end of the array then the
> -				 * last element needs to be moved to where i was
> -				 * before the array can safely be truncated.
> -				 */
> -				if (i !=3D j)
> -					state->private_objs[i] =3D
> -						state->private_objs[j];
> -
> -				state->private_objs[j].ptr =3D NULL;
> -				state->private_objs[j].state =3D NULL;
> -				state->private_objs[j].old_state =3D NULL;
> -				state->private_objs[j].new_state =3D NULL;
> -
> -				state->num_private_objs =3D j;
> -				break;
> -			}
> -		}
>  	}
> =20
>  	/* Store the overall update type for use later in atomic check. */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index ad025f5cfd3e..1c3aa7cb83b9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -217,15 +217,6 @@ struct amdgpu_display_manager {
>  	struct drm_device *ddev;
>  	u16 display_indexes_num;
> =20
> -	/**
> -	 * @atomic_obj:
> -	 *
> -	 * In combination with &dm_atomic_state it helps manage
> -	 * global atomic state that doesn't map cleanly into existing
> -	 * drm resources, like &dc_context.
> -	 */
> -	struct drm_private_obj atomic_obj;
> -
>  	/**
>  	 * @dc_lock:
>  	 *
> @@ -440,7 +431,7 @@ struct dm_crtc_state {
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> =20
>  struct dm_atomic_state {
> -	struct drm_private_state base;
> +	struct drm_atomic_state base;
> =20
>  	struct dc_state *context;
>  };
> --=20
> 2.25.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7CRo=
drigo.Siqueira%40amd.com%7C738ef3fdc0dc4ca497ba08d834c86d68%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637317382719539545&amp;sdata=3DG4xAcnpJm0BewD=
WqHMsRXZIv7XhnCCWu3qjF5dQLXFg%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--cm2e4xfqabo52fkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rGIgACgkQWJzP/com
vP/qqw//SItSqsPpEVB7ICXM6Gv4bmbXpwuzEVCJAqTVThED1YOZoyReEbKVdrbK
m/BQPFN5zFU3MnHqPH7EtB1jA+FiA65FC5CjrdumTmpwcOB3UvceIViGOLoFUNwG
uvoojMbiIwxRiscmzN9v6APAE6/6zJqX05Kaep7YpHEBu7WOO1+HPFHVVotyK7gc
4WwMr45MPXhUWS5XbkdDUc33dka6Qo1dgItQaPXg4uE6MKsAcDXQne0579+U/29b
v+EC0vpjY2kfp+TsikC+O9yW90cK4G6EMYcDV/IPT1/iIk5jt3yd8RwnnRv6tlRY
3L7MtgNflhmWj9ijZQS6i/RWyFBdCFAK9YX5M6ho8uGZ6zxyrS/zGTIoiPvRXsso
n9BoZvEKN23LQ7BD15+8g0cL9iK+JJFJDCzaf9oddT70vFKZ0RbbRs5gGTwBr0Gb
tMA3hMz+iQirCCCs2oQ6072XUzVtz+Gx2bgecIziV2+iceQ9D7jA1tBHCSWQDzMD
bcSeTglWe/XOB7vDOVfLaZlaQOEXoUvZMqD+zMfyrifjVUASUdybX/bK2iyqZ046
7Z+rYfzEwaqTnSEVuUr6eZK48J7yZz/p21lHjRcVYHbybs+PIYhGuBQ36qJMAJPA
m1SAvz8bhF9Py7q7Orh9a8mHasArZFIh7jV6U1eRXVWdU7Swx6Q=
=26V0
-----END PGP SIGNATURE-----

--cm2e4xfqabo52fkp--

--===============0352185679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0352185679==--
