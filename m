Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49455677B0F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7510E483;
	Mon, 23 Jan 2023 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649B410E1C5;
 Mon, 23 Jan 2023 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674477303; x=1706013303;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mN91x3pb8sEfhgujAsSRVyswe7OAgUjOjPXk1HE5koQ=;
 b=hl8uSdXFMPOf6+04yPeVqYK0DJcNtLnuqBZI7CGx6H9oeQXyCe+OBC9h
 KqMuS93ZA6cmFvZJoVjH4dVtrkjXEp/bwxevMpkssLimocyevBiLbwB7Q
 OPXc11+8BLNFp4oDv6RqTP82eQE/DOS7xocpGibs5aNFALHhdU0ey5hip
 6vc9opNrXWiJsUve9Mssv2N0BSXMwE4lsrxL4m5ZtmV7bADdybTa/IKHL
 UEDX8iU6yQTlINnUKYdZ/GK1rp+DIB5MMW8uvn/pS7PUT7meZQ2ZZ2vxe
 fD0v8UwK/yPY5EIhLRC71kDTG1jUFVnFRR7v7KgzWStKYmU0s7EYQUaMg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="328116107"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="328116107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 04:35:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="906972424"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="906972424"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 04:34:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC 1/2] drm/connector: add connector list iteration with
 filtering
In-Reply-To: <Y5r9FjVJldoGwiCm@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1664966047.git.jani.nikula@intel.com>
 <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
 <Y5r9FjVJldoGwiCm@phenom.ffwll.local>
Date: Mon, 23 Jan 2023 14:34:57 +0200
Message-ID: <877cxd8m4u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Oct 05, 2022 at 01:51:43PM +0300, Jani Nikula wrote:
>> Add new function drm_connector_list_iter_filter_begin() to initialize
>> connector list iterator with a filter function. Subsequent iteration on
>> the list will only return connectors on which the filter function
>> returns true.
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c | 57 ++++++++++++++++++++++++++-------
>>  include/drm/drm_connector.h     |  9 ++++++
>>  2 files changed, 54 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conne=
ctor.c
>> index e3142c8142b3..d54b4b54cecb 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -762,6 +762,29 @@ static struct lockdep_map connector_list_iter_dep_m=
ap =3D {
>>  };
>>  #endif
>>=20=20
>> +/**
>> + * drm_connector_list_iter_filter_begin - initialize a connector_list i=
terator with filter
>> + * @dev: DRM device
>> + * @iter: connector_list iterator
>> + * @filter: connector filter function
>> + * @filter_context: context to be passed to the filter function
>> + *
>> + * Same as drm_connector_list_iter_begin(), but sets up the iterator to=
 only
>> + * return connectors where filter(connector) returns true.
>> + */
>> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
>> +					  struct drm_connector_list_iter *iter,
>> +					  drm_connector_list_iter_filter_fn filter,
>> +					  void *filter_context)
>> +{
>> +	iter->dev =3D dev;
>> +	iter->conn =3D NULL;
>> +	iter->filter =3D filter;
>> +	iter->filter_context =3D filter_context;
>> +	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL=
, _RET_IP_);
>> +}
>> +EXPORT_SYMBOL(drm_connector_list_iter_filter_begin);
>
> So maybe I'm missing the obvious, but can't we just put a for_each_fi
> right after the for_each_connector_iter?
>
> And then maybe provide a default filter to kick out connectors and maybe a
> macro that does the filtered iteration? The iter_begin/next/end is already
> fairly tricky pattern compared to plain for_each macro, I think we should
> try hard to not complicate it further with lots of variants if that's not
> absolutely necessary.

Sorry, dropped the ball here, and lost sight of it.

You mean not have any of this in drm core, and just add the
for_each_if() in local wrappers everywhere?

BR,
Jani.


> -Daniel
>
>
>> +
>>  /**
>>   * drm_connector_list_iter_begin - initialize a connector_list iterator
>>   * @dev: DRM device
>> @@ -775,9 +798,7 @@ static struct lockdep_map connector_list_iter_dep_ma=
p =3D {
>>  void drm_connector_list_iter_begin(struct drm_device *dev,
>>  				   struct drm_connector_list_iter *iter)
>>  {
>> -	iter->dev =3D dev;
>> -	iter->conn =3D NULL;
>> -	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL=
, _RET_IP_);
>> +	drm_connector_list_iter_filter_begin(dev, iter, NULL, NULL);
>>  }
>>  EXPORT_SYMBOL(drm_connector_list_iter_begin);
>>=20=20
>> @@ -800,15 +821,8 @@ __drm_connector_put_safe(struct drm_connector *conn)
>>  	schedule_work(&config->connector_free_work);
>>  }
>>=20=20
>> -/**
>> - * drm_connector_list_iter_next - return next connector
>> - * @iter: connector_list iterator
>> - *
>> - * Returns: the next connector for @iter, or NULL when the list walk has
>> - * completed.
>> - */
>> -struct drm_connector *
>> -drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>> +static struct drm_connector *
>> +__drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>>  {
>>  	struct drm_connector *old_conn =3D iter->conn;
>>  	struct drm_mode_config *config =3D &iter->dev->mode_config;
>> @@ -836,6 +850,25 @@ drm_connector_list_iter_next(struct drm_connector_l=
ist_iter *iter)
>>=20=20
>>  	return iter->conn;
>>  }
>> +
>> +/**
>> + * drm_connector_list_iter_next - return next connector
>> + * @iter: connector_list iterator
>> + *
>> + * Returns: the next connector for @iter, or NULL when the list walk has
>> + * completed.
>> + */
>> +struct drm_connector *
>> +drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
>> +{
>> +	struct drm_connector *connector;
>> +
>> +	while ((connector =3D __drm_connector_list_iter_next(iter)) &&
>> +	       iter->filter && !iter->filter(connector, iter->filter_context))
>> +		;
>> +
>> +	return connector;
>> +}
>>  EXPORT_SYMBOL(drm_connector_list_iter_next);
>>=20=20
>>  /**
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 56aee949c6fa..497b98197d3a 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1868,6 +1868,9 @@ struct drm_tile_group *drm_mode_get_tile_group(str=
uct drm_device *dev,
>>  void drm_mode_put_tile_group(struct drm_device *dev,
>>  			     struct drm_tile_group *tg);
>>=20=20
>> +typedef bool (*drm_connector_list_iter_filter_fn)(const struct drm_conn=
ector *connector,
>> +						  void *filter_context);
>> +
>>  /**
>>   * struct drm_connector_list_iter - connector_list iterator
>>   *
>> @@ -1886,10 +1889,16 @@ struct drm_connector_list_iter {
>>  /* private: */
>>  	struct drm_device *dev;
>>  	struct drm_connector *conn;
>> +	drm_connector_list_iter_filter_fn filter;
>> +	void *filter_context;
>>  };
>>=20=20
>>  void drm_connector_list_iter_begin(struct drm_device *dev,
>>  				   struct drm_connector_list_iter *iter);
>> +void drm_connector_list_iter_filter_begin(struct drm_device *dev,
>> +					  struct drm_connector_list_iter *iter,
>> +					  drm_connector_list_iter_filter_fn filter,
>> +					  void *filter_context);
>>  struct drm_connector *
>>  drm_connector_list_iter_next(struct drm_connector_list_iter *iter);
>>  void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
>> --=20
>> 2.34.1
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
