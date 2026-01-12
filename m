Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1703D10ECB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D8210E2F3;
	Mon, 12 Jan 2026 07:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r5AoHb1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB0E10E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JWG4KbWaM8zUh+cdESmzz2790ZlOd8CTkyMfUL9BkBo=; b=r5AoHb1MLKK92gok56ugC/mO7W
 hJJFpGTI9fkoy1QvHuJ+fLv5NkbLY6YfWxowApSyHVHzvgqwQFKzmjJKRAcaqyRShs70CfOtQG6GV
 CV++u8jwyyXCpZaRqGz2h9INefK4/JNMd1+AGm+Z7/lrRSgYr8IqO/QjiUDBj28BJsOErpR5SlDts
 t/meH/7F6/ounGoAh75JocUYEKS6CWVYweBaz8UnjETcFGzXwNu+lhlrz/26USpwx8VF2rWqEcKR/
 ani3kbtM9or0NRqsylnefVtefdGAFC4yHckS8vsmwBwt6rSReLKJVTIxLS0ltQ+rSQNzMY04KmIKS
 8dXQCf7w==;
Received: from 84.124.69.144.static.user.ono.com ([84.124.69.144]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfCVx-004Hxy-JU; Mon, 12 Jan 2026 08:39:01 +0100
Message-ID: <7e0d79d43d00cea963cf1b2c1953305ccbcdaeaa.camel@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: Consolidate CPU job validation in a function
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 12 Jan 2026 08:38:50 +0100
In-Reply-To: <20260109-v3d-drm-debug-v1-1-02041c873e4d@igalia.com>
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
 <20260109-v3d-drm-debug-v1-1-02041c873e4d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
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

El vie, 09-01-2026 a las 15:35 -0300, Ma=C3=ADra Canal escribi=C3=B3:
(...)=C2=A0
> -/* Get data for the indirect CSD job submission. */
> -static int
> -v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
> -				struct drm_v3d_extension __user
> *ext,
> -				struct v3d_cpu_job *job)
> +/* Returns false if the CPU job has an invalid configuration. */
> +static bool
> +v3d_validate_cpu_job(struct v3d_dev *v3d, struct v3d_cpu_job *job)
> =C2=A0{
> -	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> -	struct v3d_dev *v3d =3D v3d_priv->v3d;
> -	struct drm_v3d_indirect_csd indirect_csd;
> -	struct v3d_indirect_csd_info *info =3D &job->indirect_csd;
> -
> =C2=A0	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> -		return -EINVAL;
> +		drm_dbg(&v3d->drm, "CPU job extension was attached
> to a GPU job.\n");
> +		return false;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> +		drm_dbg(&v3d->drm, "Two CPU job extensions were
> added to the same CPU job.\n");
> +		return false;
> =C2=A0	}
> =C2=A0
> +	return true;
> +}
> +
> +/* Get data for the indirect CSD job submission. */
> +static int
> +v3d_get_cpu_indirect_csd_params(struct v3d_dev *v3d,
> +				struct drm_file *file_priv,
> +				struct drm_v3d_extension __user
> *ext,
> +				struct v3d_cpu_job *job)
> +{
> +	struct drm_v3d_indirect_csd indirect_csd;
> +	struct v3d_indirect_csd_info *info =3D &job->indirect_csd;
> +
> +	if (!v3d_validate_cpu_job(v3d, job))
> +		return -EINVAL;
> +
> =C2=A0	if (copy_from_user(&indirect_csd, ext,
> sizeof(indirect_csd)))
> =C2=A0		return -EFAULT;
> =C2=A0
> @@ -448,7 +457,8 @@ v3d_get_cpu_indirect_csd_params(struct drm_file
> *file_priv,
> =C2=A0
> =C2=A0/* Get data for the query timestamp job submission. */
> =C2=A0static int
> -v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
> +v3d_get_cpu_timestamp_query_params(struct v3d_dev *v3d,
> +				=C2=A0=C2=A0 struct drm_file *file_priv,
> =C2=A0				=C2=A0=C2=A0 struct drm_v3d_extension __user
> *ext,
> =C2=A0				=C2=A0=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> @@ -458,15 +468,8 @@ v3d_get_cpu_timestamp_query_params(struct
> drm_file *file_priv,
> =C2=A0	unsigned int i;
> =C2=A0	int err;
> =C2=A0
> -	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> +	if (!v3d_validate_cpu_job(v3d, job))
> =C2=A0		return -EINVAL;
> -	}
> -
> -	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	if (copy_from_user(&timestamp, ext, sizeof(timestamp)))
> =C2=A0		return -EFAULT;
> @@ -517,7 +520,8 @@ v3d_get_cpu_timestamp_query_params(struct
> drm_file *file_priv,
> =C2=A0}
> =C2=A0
> =C2=A0static int
> -v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
> +v3d_get_cpu_reset_timestamp_params(struct v3d_dev *v3d,
> +				=C2=A0=C2=A0 struct drm_file *file_priv,
> =C2=A0				=C2=A0=C2=A0 struct drm_v3d_extension __user
> *ext,
> =C2=A0				=C2=A0=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> @@ -527,15 +531,8 @@ v3d_get_cpu_reset_timestamp_params(struct
> drm_file *file_priv,
> =C2=A0	unsigned int i;
> =C2=A0	int err;
> =C2=A0
> -	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> +	if (!v3d_validate_cpu_job(v3d, job))
> =C2=A0		return -EINVAL;
> -	}
> -
> -	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	if (copy_from_user(&reset, ext, sizeof(reset)))
> =C2=A0		return -EFAULT;
> @@ -578,7 +575,8 @@ v3d_get_cpu_reset_timestamp_params(struct
> drm_file *file_priv,
> =C2=A0
> =C2=A0/* Get data for the copy timestamp query results job submission. */
> =C2=A0static int
> -v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
> +v3d_get_cpu_copy_query_results_params(struct v3d_dev *v3d,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_v3d_extension
> __user *ext,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> @@ -588,15 +586,8 @@ v3d_get_cpu_copy_query_results_params(struct
> drm_file *file_priv,
> =C2=A0	unsigned int i;
> =C2=A0	int err;
> =C2=A0
> -	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> +	if (!v3d_validate_cpu_job(v3d, job))
> =C2=A0		return -EINVAL;
> -	}
> -
> -	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	if (copy_from_user(&copy, ext, sizeof(copy)))
> =C2=A0		return -EFAULT;
> @@ -716,7 +707,8 @@ v3d_copy_query_info(struct
> v3d_performance_query_info *query_info,
> =C2=A0}
> =C2=A0
> =C2=A0static int
> -v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
> +v3d_get_cpu_reset_performance_params(struct v3d_dev *v3d,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_v3d_extension __user
> *ext,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> @@ -724,15 +716,8 @@ v3d_get_cpu_reset_performance_params(struct
> drm_file *file_priv,
> =C2=A0	struct drm_v3d_reset_performance_query reset;
> =C2=A0	int err;
> =C2=A0
> -	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> +	if (!v3d_validate_cpu_job(v3d, job))
> =C2=A0		return -EINVAL;
> -	}
> -
> -	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	if (copy_from_user(&reset, ext, sizeof(reset)))
> =C2=A0		return -EFAULT;
> @@ -762,7 +747,8 @@ v3d_get_cpu_reset_performance_params(struct
> drm_file *file_priv,
> =C2=A0}
> =C2=A0
> =C2=A0static int
> -v3d_get_cpu_copy_performance_query_params(struct drm_file
> *file_priv,
> +v3d_get_cpu_copy_performance_query_params(struct v3d_dev *v3d,
> +					=C2=A0 struct drm_file
> *file_priv,
> =C2=A0					=C2=A0 struct drm_v3d_extension
> __user *ext,
> =C2=A0					=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> @@ -770,15 +756,8 @@ v3d_get_cpu_copy_performance_query_params(struct
> drm_file *file_priv,
> =C2=A0	struct drm_v3d_copy_performance_query copy;
> =C2=A0	int err;
> =C2=A0
> -	if (!job) {
> -		DRM_DEBUG("CPU job extension was attached to a GPU
> job.\n");
> +	if (!v3d_validate_cpu_job(v3d, job))
> =C2=A0		return -EINVAL;
> -	}
> -
> -	if (job->job_type) {
> -		DRM_DEBUG("Two CPU job extensions were added to the
> same CPU job.\n");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	if (copy_from_user(&copy, ext, sizeof(copy)))
> =C2=A0		return -EFAULT;
> @@ -826,6 +805,8 @@ v3d_get_extensions(struct drm_file *file_priv,
> =C2=A0		=C2=A0=C2=A0 struct v3d_submit_ext *se,
> =C2=A0		=C2=A0=C2=A0 struct v3d_cpu_job *job)
> =C2=A0{
> +	struct v3d_file_priv *v3d_priv =3D file_priv->driver_priv;
> +	struct v3d_dev *v3d =3D v3d_priv->v3d;

Since we can get the v3d_dev from the file_priv and we are already
passing file_priv around, does it really give us anything to also pass
the v3d_dev around if we only need it in that function? Not that I am
necessarily against it, just making sure that was a conscious decision.

Iago

> =C2=A0	struct drm_v3d_extension __user *user_ext;
> =C2=A0	int ret;
> =C2=A0
> @@ -843,22 +824,22 @@ v3d_get_extensions(struct drm_file *file_priv,
> =C2=A0			ret =3D
> v3d_get_multisync_submit_deps(file_priv, user_ext, se);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
> -			ret =3D
> v3d_get_cpu_indirect_csd_params(file_priv, user_ext, job);
> +			ret =3D v3d_get_cpu_indirect_csd_params(v3d,
> file_priv, user_ext, job);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
> -			ret =3D
> v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
> +			ret =3D
> v3d_get_cpu_timestamp_query_params(v3d, file_priv, user_ext, job);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY:
> -			ret =3D
> v3d_get_cpu_reset_timestamp_params(file_priv, user_ext, job);
> +			ret =3D
> v3d_get_cpu_reset_timestamp_params(v3d, file_priv, user_ext, job);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
> -			ret =3D
> v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
> +			ret =3D
> v3d_get_cpu_copy_query_results_params(v3d, file_priv, user_ext, job);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
> -			ret =3D
> v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
> +			ret =3D
> v3d_get_cpu_reset_performance_params(v3d, file_priv, user_ext, job);
> =C2=A0			break;
> =C2=A0		case DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY:
> -			ret =3D
> v3d_get_cpu_copy_performance_query_params(file_priv, user_ext, job);
> +			ret =3D
> v3d_get_cpu_copy_performance_query_params(v3d, file_priv, user_ext,
> job);
> =C2=A0			break;
> =C2=A0		default:
> =C2=A0			DRM_DEBUG_DRIVER("Unknown extension id:
> %d\n", ext.id);
>=20

