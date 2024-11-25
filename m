Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A819D82D9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EF210E1BD;
	Mon, 25 Nov 2024 09:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TO9X7ZIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1809F10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:50:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A83481C000C;
 Mon, 25 Nov 2024 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732528208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqZBXXpYqlZ47ruOLuRIl9U+AjdNaJHZhWEuBmxnpx4=;
 b=TO9X7ZIjxELNyehRFohEvZu5Ytg4Orkmwagi8FV3r9FnxdqYF495c70sCD3W3/8+OeG/pI
 Kzc2tCscyRjUfmXzzL+Nnna+IOP7AAwHDMCyJFNnRgqJeosB3788l5ESCunMLd1tnNsQ/v
 M4RrHbGEVD10+8A4pW01fCq8ESW1VMz7uiyHmZktOTo6o7gjZaZaJwgsvjmy7cJ+2QW0/H
 7oAzP7NKHf6dtg1LDs+xLJuj5x3lKbU9UNw3Jp+Vgsohc2HjgCkyEwgmFOAEQWxwQS2NJG
 VTHMFK2d6fjFoE70ad2L7fMeVzsDh/oAjMjZhXTCpVmjm9D0YBP02DXICYBUgg==
Date: Mon, 25 Nov 2024 09:50:01 +0000
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 =?ISO-8859-1?Q?Ma=EDra_Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
CC: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
 nicolejadeyee@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 10/18] drm/vkms: Introduce config for encoder name
In-Reply-To: <87ttbvy84z.fsf@intel.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
 <20241122-google-remove-crtc-index-from-parameter-v2-10-81540742535a@bootlin.com>
 <87ttbvy84z.fsf@intel.com>
Message-ID: <65C56D17-EDFE-42E6-A8E0-57DEFF577886@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 25 novembre 2024 09:28:44 UTC, Jani Nikula <jani=2Enikula@linux=2Eintel=
=2Ecom> a =C3=A9crit=C2=A0:
>On Fri, 22 Nov 2024, Louis Chauvet <louis=2Echauvet@bootlin=2Ecom> wrote:
>> As an encoder will be a directory in ConfigFS, add the configuration fo=
r
>> encoder name so we will be able to reflect the configfs directory name =
in
>> the drm name=2E
>>
>> Signed-off-by: Louis Chauvet <louis=2Echauvet@bootlin=2Ecom>
>> ---
>>  drivers/gpu/drm/vkms/vkms_config=2Ec | 6 ++++++
>>  drivers/gpu/drm/vkms/vkms_config=2Eh | 2 ++
>>  drivers/gpu/drm/vkms/vkms_output=2Ec | 2 +-
>>  3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_config=2Ec b/drivers/gpu/drm/vkm=
s/vkms_config=2Ec
>> index e44ed904cefb97b8b6ab8fc27623e315397e0106=2E=2Ea2539fb56b602569b75=
748fdf9c4784f104b0bff 100644
>> --- a/drivers/gpu/drm/vkms/vkms_config=2Ec
>> +++ b/drivers/gpu/drm/vkms/vkms_config=2Ec
>> @@ -41,6 +41,10 @@ struct vkms_config *vkms_config_alloc_default(bool e=
nable_writeback, bool enable
>>  	encoder =3D vkms_config_create_encoder(vkms_config);
>>  	if (!encoder)
>>  		goto err_alloc;
>> +	encoder->name =3D kzalloc(sizeof("Main Encoder"), GFP_KERNEL);
>> +	if (!encoder->name)
>> +		goto err_alloc;
>> +	sprintf(encoder->name, "Main Encoder");
>
>Drive-by comment, maybe kstrdup()?

Nice catch, thank you!
I will update for next version=2E

Thanks,
Louis Chauvet

>> =20
>>  	if (vkms_config_encoder_attach_crtc(encoder, crtc))
>>  		goto err_alloc;
>> @@ -238,6 +242,7 @@ void vkms_config_delete_encoder(struct vkms_config_=
encoder *vkms_config_encoder,
>>  		}
>>  	}
>> =20
>> +	kfree(vkms_config_encoder->name);
>>  	kfree(vkms_config_encoder);
>>  }
>> =20
>> @@ -403,6 +408,7 @@ static int vkms_config_show(struct seq_file *m, voi=
d *data)
>> =20
>>  	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link)=
 {
>>  		seq_puts(m, "encoder:\n");
>> +		seq_printf(m, "\tname: %s\n", config_encoder->name);
>>  	}
>> =20
>>  	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
>> diff --git a/drivers/gpu/drm/vkms/vkms_config=2Eh b/drivers/gpu/drm/vkm=
s/vkms_config=2Eh
>> index 8f247fc09373fb2c8145e83be05c6afec1ffac1c=2E=2E4223edd94ec270915dd=
658c0b5efd489554d33a5 100644
>> --- a/drivers/gpu/drm/vkms/vkms_config=2Eh
>> +++ b/drivers/gpu/drm/vkms/vkms_config=2Eh
>> @@ -50,6 +50,7 @@ struct vkms_config_crtc {
>>   * struct vkms_config_encoder
>>   *
>>   * @link: Link to the others encoders
>> + * @name: Name of the encoder
>>   * @possible_crtcs: List of CRTC that can be used with this encoder
>>   * @encoder: Internal usage=2E This pointer should never be considered=
 as valid=2E It can be used to
>>   *         store a temporary reference to a vkms encoder during device=
 creation=2E This pointer is
>> @@ -58,6 +59,7 @@ struct vkms_config_crtc {
>>  struct vkms_config_encoder {
>>  	struct list_head link;
>> =20
>> +	char *name;
>>  	struct xarray possible_crtcs;
>> =20
>>  	/* Internal usage */
>> diff --git a/drivers/gpu/drm/vkms/vkms_output=2Ec b/drivers/gpu/drm/vkm=
s/vkms_output=2Ec
>> index 03498a20d78dd8a66f9fc66b360c5ea57fc48d88=2E=2E6277ad72fdd476d1eff=
52ad037389bdb1a254f5e 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output=2Ec
>> +++ b/drivers/gpu/drm/vkms/vkms_output=2Ec
>> @@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>>  		if (!config_encoder->encoder)
>>  			return -ENOMEM;
>>  		ret =3D drmm_encoder_init(dev, config_encoder->encoder, NULL,
>> -					DRM_MODE_ENCODER_VIRTUAL, NULL);
>> +					DRM_MODE_ENCODER_VIRTUAL, config_encoder->name);
>>  		if (ret) {
>>  			DRM_ERROR("Failed to init encoder\n");
>>  			return ret;
>
