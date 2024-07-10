Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09592D7AD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1110E85F;
	Wed, 10 Jul 2024 17:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="P5PJ0HkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9016010E85F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zz1GmL7lWSfErO2ecKWurMRd3HTRHASj/oDmdcqBf48=; b=P5PJ0HkAJ5stzygH//1mOPytcD
 cjT2EyrpBCILdvhpzH5xGsKgcEEjDhc3t6pr6J2LymosXtK0+pusDHkogd2cexPlmnsFaYKQqtB72
 rUI2NxxUeLvxRS9X4sc4184kGfp0QKmDK2cnDjcXeFRApNpvxATMveXqfycD28AvJcU3xptTNhP4s
 0Oo2ABb2VXafJba2fhPgxLnvpudy+IgirM5BVy340pMWdj6UStohD62m03DX3T9sjoSUxzEPbPNjV
 u6STMpE0zulvZFG90zFSj8LBdJzg5O17IR2t/EQiulmrLPjK/itqc0YaTKQawqWy0q18yowEa2Y56
 lGmYcL0Q==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRbMS-00DLy3-KZ; Wed, 10 Jul 2024 19:44:12 +0200
Message-ID: <d14ad61d-f2af-4b04-bef7-b9f867259064@igalia.com>
Date: Wed, 10 Jul 2024 14:44:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/v3d: Prefer get_user for scalar types
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-13-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240710134130.17292-13-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/10/24 10:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> It makes it just a tiny bit more obvious what is going on.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index b0c2a8e9cb06..9273b0aadb79 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -486,14 +486,14 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   	for (i = 0; i < timestamp.count; i++) {
>   		u32 offset, sync;
>   
> -		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
> +		if (get_user(offset, offsets++)) {
>   			err = -EFAULT;
>   			goto error;
>   		}
>   
>   		qinfo->queries[i].offset = offset;
>   
> -		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> +		if (get_user(sync, syncs++)) {
>   			err = -EFAULT;
>   			goto error;
>   		}
> @@ -552,7 +552,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   
>   		qinfo->queries[i].offset = reset.offset + 8 * i;
>   
> -		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> +		if (get_user(sync, syncs++)) {
>   			err = -EFAULT;
>   			goto error;
>   		}
> @@ -614,14 +614,14 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   	for (i = 0; i < copy.count; i++) {
>   		u32 offset, sync;
>   
> -		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
> +		if (get_user(offset, offsets++)) {
>   			err = -EFAULT;
>   			goto error;
>   		}
>   
>   		qinfo->queries[i].offset = offset;
>   
> -		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> +		if (get_user(sync, syncs++)) {
>   			err = -EFAULT;
>   			goto error;
>   		}
