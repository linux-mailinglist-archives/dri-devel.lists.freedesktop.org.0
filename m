Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F209F96B03A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 07:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A90910E1C1;
	Wed,  4 Sep 2024 05:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsiEEUwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BAC10E1C1;
 Wed,  4 Sep 2024 05:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725426106; x=1756962106;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XYCXzd298NNnhevnGsOXHmR5ThqwjZvf0UpJKdoSRCU=;
 b=SsiEEUwLkk0g0NufR7XX4UTd5mtnwnp41QBnEElxRdETxGR56sOZTltY
 DTbNdJV3GBlGFpY7J3YMF1qqUt2C3EelQlpzw+Fmy6Sc6kFlFrd0lRaVO
 HqW2+Yc+ifuGOQ03kULimLEkjf6eH2dsyl+IRgn4xYbcn9ACVDCHj3aVX
 rl2eo4DnbOYcO2xtRTjRt6oy2KCOOxkDbFf9DTLKnc/SWoAhGJUnJGXd0
 k23yHSnegXFXABPp0JkdRGF5/f2fG1NA8SMrhdqn+26m9rgyv4NJc2CZP
 JWGbaRBhZMt0X7aMvytJzLOsDht9a9dx4UzHSlI0BL84lwdAcMYxG3Zfr w==;
X-CSE-ConnectionGUID: ofDmlJ0iTuWZhoS/XmlYyA==
X-CSE-MsgGUID: g0CXx9owS0Chicngpho5pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24197723"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="24197723"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 22:01:45 -0700
X-CSE-ConnectionGUID: vazDv1J5TWGKOdC4QBQiTw==
X-CSE-MsgGUID: mlrld+Z1T82OhKNd/wtMnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69964992"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 22:01:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 22:01:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 22:01:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 22:01:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 22:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzKpdmACllB0yPo+X4ellT6ruB6wiUzNN6NLsnotpapVOMX6b5K9voJbiOiQ7A9xtq5FUVWDuIKQfS49uKbcQg/yCnLWDFXaL1BxIs16KXvthugY31QV8A30NNHo0ePgzcCXDe1eyYWUOKsD6qBeTly4QlodUrP2Glsj/4NR6bDViC8eRZnC1wnk1UxfS3ozLSfauotvw1x/80uwC03j7lR6nTMY/Z9SUKDznUkePt8Oj523ewMQjPEoNgp8xrU5PBHGJWKWrwGam5WNhE3WtDcsXN/9GpEV0VqIbiDX4t3TP4Fp+oOWbRZSTwBV8ZhYH/k8aoKNp5l3A8Aawne7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnmVtvlcsslrI8sDODTZaPrDs1UHF7YIfA75e1Yt+us=;
 b=unl7n1GyMA6KrswRXMiwJDd+PmQQk/ZH6Twq1HtGH7/zpk44a/Jqyakjaw58RjbPBBwpz8MKeJ94cMovygPuUq8W92oVmYcD8rb3C4iIPyrdi38hEWxZvfbq9PZ65M5ZSeZZRZV4Bn5zuDhApSDGr2+hN1b3s59tyRqhYsjxAs23cDVYfKDug3P1yKIAX8wUi//tpZjq4JhgzWJ9oMijLPajwari5Dbk1sSL8Od4eILDWu0AxxmOv6QP3HWBgDiJLwnrjrhrrIvSwu/YjTPdoVtjeW3mV9B7iDoll9yzwHMMwTQm3N4eevZk91Hr0QBHvCGpSlvZCC5ueG9ckmWESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by LV3PR11MB8674.namprd11.prod.outlook.com (2603:10b6:408:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 05:01:37 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 05:01:37 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 3/5] Add crtc properties for global histogram
Thread-Topic: [PATCHv2 3/5] Add crtc properties for global histogram
Thread-Index: AQHa87WaF9adTJaJbkqu5ftYXQh5QbJFm5kAgAACToCAAYj/0A==
Date: Wed, 4 Sep 2024 05:01:36 +0000
Message-ID: <IA0PR11MB7307295959A4F3B5D0BAF3F0BA9C2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240821102349.3961986-1-arun.r.murthy@intel.com>
 <20240821102349.3961986-4-arun.r.murthy@intel.com>
 <PH7PR11MB6772D84ED6F45849552F514B8D932@PH7PR11MB6772.namprd11.prod.outlook.com>
 <SJ0PR11MB678992A6D474133C0AA0180F8D932@SJ0PR11MB6789.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB678992A6D474133C0AA0180F8D932@SJ0PR11MB6789.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|LV3PR11MB8674:EE_
x-ms-office365-filtering-correlation-id: 825db885-ddf9-4136-f6b3-08dccc9ea7b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?d3+PLyTXawP9wxtVY/5Esk/WYTPIEd26AehHY1JPAcD1MbfqhI1Qbj93BkIk?=
 =?us-ascii?Q?BPlfoBayEAX+ZfmoDcJRIG2y6oqOVkejuwXrBHY+MQuQx5IcYYrc/3Jb/zed?=
 =?us-ascii?Q?gyxINiwGNQBuHtu80FY+fanPeiA+j4ElRFrfV9wvhQXfmZWsw8b6bK28Xmg/?=
 =?us-ascii?Q?Y/Qrvnr895z7rGxYye6YygDhz57A6IHUo3iEnI5uSf+xgnNXCroZb0pcqZ2o?=
 =?us-ascii?Q?ajMKOUJ20SdMLMK6mCh61AYqGcqHBnEUGwzLOVoQJ2a3wqcaCyLz/jpNQmZN?=
 =?us-ascii?Q?JDrHLiOcTFQM/nF3jo0N4pIfoJdQlVeVFOt8PHDkuPoNsFi2KlXGzSHyYlWL?=
 =?us-ascii?Q?YXD2Pvkmi+OcHkaD23VjkcMokzDVZbZe5ZY5UNQYAnq1bkmm6g/LPv3Vupmy?=
 =?us-ascii?Q?XBWhNP05oydUc2cLteqsIf+NJOu9c2qwGsfiJjWeH6S2z8/jB1zUlGxdtDPa?=
 =?us-ascii?Q?1MsAcHKTxDxJkxd48zpmRFg9LbhLrTbx1zW9vZWwXJ8FwU4bWCYUhYUBZKRu?=
 =?us-ascii?Q?xd39izmH0lFIHb0dubd+tk9kpPLv60wdte+l/82eZcrXJCQbjqFo65E7Wrfn?=
 =?us-ascii?Q?75XcctgQ7LXlRem/DAVxto9eUClRQNOljiAxhN5BnJksmy2kpywNFGrvyzEH?=
 =?us-ascii?Q?1xhfg0OmxUJKcaYOnZ9LWuVbgIvpD1hr7Q3xwwNhCZBtxdMqQ4mMdhoXVsiJ?=
 =?us-ascii?Q?xMjzCjipqF+rAQPPu0Agdf6giQmLiLCE4RWtc/mCWs8a16ThzlrKAmpJZ/rZ?=
 =?us-ascii?Q?H5qUE0VxvEz9UYmYiNmjd3Fg2og4iPd3hfMpAsU2pYPeyTCsT7R6xtrNAJbW?=
 =?us-ascii?Q?ZPVYgZcdjbbhMSZvR67jS7Ia0GVLAOKLtEmzy5+WnFyIaEiHs0zSGgGzmDdm?=
 =?us-ascii?Q?fgiEka/5Odd0G8QoANcDUQdPxkBSV8Aq2b7T3H7M+hgomsv9/ALPL1ggem2H?=
 =?us-ascii?Q?MGzRR7vUeKU+Sd6HYIaJ/k7e05gFuNJ071nxzqQ33nwOVFDWu+nldvwm0nN7?=
 =?us-ascii?Q?2nYC2KbU075RsQz+ztAvrcldgOyJMOY4I3OvYm3bemHGAQr9KkZG1mDKhV+t?=
 =?us-ascii?Q?+yqtp+CJ0f79vaVIwwTQDm1+VtCIYus4GAmCK+2wZ77BqT0thRE00ABWNYuR?=
 =?us-ascii?Q?XCI/nOWyuaA2ftAu+tP6QqFRggAvyjzqCOs45Z7YD7CEUPhKe/vk+AlzUgPW?=
 =?us-ascii?Q?SfgbTi9aTq6YmIKrlrMmYI/0fNDXesKfW9ddw/laR1qUmFzxuTaI5zuc7Stn?=
 =?us-ascii?Q?3e4/6o2jQv7eEIs+ODBHJvSMyiwGp3IZaYaHBp5LHyYgLgYCHrW4MoJbPVrq?=
 =?us-ascii?Q?140jjzpkk3aOaNaAkQvJt7c19sDa18nZdERsDUVXqk9hhUi6N7DJtTQSSgf3?=
 =?us-ascii?Q?FK4fQTtXg1UAhqJbbohXvK9mwlE0MiwhY46nVvvadDVzvLOpcQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rmA4VAUiPKaOziK847TLeWhNat2/fISrME/QD21mgcT2yWpwPjFnhRpJBoMt?=
 =?us-ascii?Q?x2/DvtAaIXqLjQHE/neeQtdpGw4053RfFcHmNWjvNcJfmoSCvGpozUOwY+j6?=
 =?us-ascii?Q?sISiajlOyI+lkMwwE/pXEOIWO1cUpjOgIOi5aiySubeWGFq5gB/KgwmeLBJH?=
 =?us-ascii?Q?QEOqaBHVoEscq+bXtLrX1OYWpzQgMrFASMlELrrHjQJBt7odlCUi9ZXB67Aa?=
 =?us-ascii?Q?DswMAmP51sBxyz2ouo61gE09m72X6abxycG8Vl7HltIxlXYVZPztPRamCTga?=
 =?us-ascii?Q?9G3qqo81i+I19l4hk2NuKRUq485/Pfeg8NGe2GzWaJyUJDlTByZnXZTW/VlU?=
 =?us-ascii?Q?I2DpQoz4xQKkzf2Dl/5xhHdicosaNu2XdIXRJBQVeCLK51qk5kc9IhWwTgqG?=
 =?us-ascii?Q?C8wm3qZAp7AWMQMETeJmAdfZUEI3OOXQdkj1CrlcN7QgkQ0MybJRnLX/DJaO?=
 =?us-ascii?Q?nNBqvmvEcM8DIlHsUePT0BIOSQ0ExyeveGXz+cyOCFuMUnaP363lRTgnsvYL?=
 =?us-ascii?Q?S+xuvhXOmfzKWSnMryxx0v7XtHduTjmXB9PokkrH9FuMrygTa0u4WbcB0WRL?=
 =?us-ascii?Q?1RQEtc2eTktLselrTNjJ+ndljfScmx7+fOhN9/XV/tKuk/FvXdRof59SFfRq?=
 =?us-ascii?Q?zbsxvQ7WY47aIXs4xd/UCPndDz1wY8jx+tbNTfdFbXv4R6hpwLPhFfTfsWqM?=
 =?us-ascii?Q?G9ObThZ20sa1mUtx+MWBmH21Zg97a8ad5E0FIdiBTdRsPGm716MLWjMALwE1?=
 =?us-ascii?Q?GzLlRiHB4gZ2heniVNxh8X4brXpnedbZZpKLdN65hdFKAfxbB+w+p2WGqK76?=
 =?us-ascii?Q?y8QdcOLIjmMy3H15K+bT9wsfOghknF4k4GtrAic8VxIP4/ykRQKJu40cfbYZ?=
 =?us-ascii?Q?v/XsSBa2XLFmqnmCluF3KzFkGhx5/dN29Wn5GQfgAXKTIXj4FGRHpQEOkI4c?=
 =?us-ascii?Q?0v7+gFywntd8u2UNW+edJdsXqxGtEEVKTaaXdgs3MhAUFcjBWOnQrcDgHw7d?=
 =?us-ascii?Q?ky9DLz9B2emtSxfwXISS6wo/TU0tApSv+nBtTPCY/McqYfy2uncLLS6Pt3WO?=
 =?us-ascii?Q?kykMvef9ukQWsxR1sEUZA+1BmJl78n6CgbWB7zid8Aw8ALmk1hFcO6IIEWD9?=
 =?us-ascii?Q?uFc9d+Vgi9eay1Zvqm5wLCrJMAQS9YA37MkM+s9+U0o8nQMmzuQONJC53CiH?=
 =?us-ascii?Q?b9XahpjOfOaxVpMJBZ3amlxca5E875zSsLkPzgoRnSMd8otQBVWG5nYvomGN?=
 =?us-ascii?Q?mvJHLyuy21HZdHZi3aa99m39wRgXDgr9olo77OG3bpZpX1oLHiSoyuUydD9k?=
 =?us-ascii?Q?u7NFWPhBocaaa/uqJrPlohaXDBRCOw/Zvg0zspSNe5zBM+J861qJfyJnJ8GS?=
 =?us-ascii?Q?eqeYWSYNkZKDbaBV90mYOOA+zALejVkCphSmBSoRu0b4s9x/yP9OTW/tp3Ac?=
 =?us-ascii?Q?YVURkkxFXrr7dRZEoVjJZSnuxaWBiXHa8mh9/7Wt35vKH+6GQNH5H5VWZ6vm?=
 =?us-ascii?Q?XGWq2M6K4p7rGKqRo6Qvhs1nDr2pPIHfX7yv+Q3y6Zr1tI9OL1y9beD/WvbK?=
 =?us-ascii?Q?LfIp35XeZG1OtuK7x7vWroX3ccmuQTxezrftYO68vTKfG4DOQhSrug8HuzSR?=
 =?us-ascii?Q?u33OVZTj5UBPdGZ9KoCu072rCERd2DMtJKamVZaJz6an?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 825db885-ddf9-4136-f6b3-08dccc9ea7b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 05:01:36.9992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txLaMnhQAL7ikigAwoW00kWo9MMJssrJtgT8UIsw8257/hsPM2pmGQIspvhuT1XUXk8qnnnKMrRt3GG6ZhSVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8674
X-OriginatorOrg: intel.com
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

> > > +static int
> > > +intel_atomic_replace_property_blob_from_id(struct drm_device *dev,
> > > +					   struct drm_property_blob **blob,
> > > +					   u64 blob_id,
> > > +					   ssize_t expected_size,
> > > +					   ssize_t expected_elem_size,
> > > +					   bool *replaced)
> > > +{
> > > +	struct drm_property_blob *new_blob =3D NULL;
> > > +
> > > +	if (blob_id !=3D 0) {
> > > +		new_blob =3D drm_property_lookup_blob(dev, blob_id);
> > > +		if (!new_blob)
> > > +			return -EINVAL;
> > > +
> > > +		if (expected_size > 0 &&
> > > +		    new_blob->length !=3D expected_size) {
> > > +			drm_property_blob_put(new_blob);
> > > +			return -EINVAL;
> > > +		}
> > > +		if (expected_elem_size > 0 &&
> > > +		    new_blob->length % expected_elem_size !=3D 0) {
> > > +			drm_property_blob_put(new_blob);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	*replaced |=3D drm_property_replace_blob(blob, new_blob);
> > > +	drm_property_blob_put(new_blob);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > Can we align this design to what we have for get property with similar
> > pattern of if else logic and return 0.
Done!

> > > +static int intel_crtc_set_property(struct drm_crtc *crtc,
> > > +				   struct drm_crtc_state *state,
> > > +				   struct drm_property *property,
> > > +				   u64 val)
> > > +{
> > > +	struct drm_i915_private *i915 =3D to_i915(crtc->dev);
> > > +	struct intel_crtc_state *intel_crtc_state =3D
> > > +		to_intel_crtc_state(state);
> > > +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
> > > +	bool replaced =3D false;
> > > +
> > > +	if (property =3D=3D intel_crtc->histogram_en_property) {
> > > +		intel_crtc_state->histogram_en =3D val;
> > > +		intel_crtc_state->histogram_en_changed =3D true;
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (property =3D=3D intel_crtc->global_iet_property) {
> > > +		intel_atomic_replace_property_blob_from_id(crtc->dev,
> > > +							   &intel_crtc_state-
> > > >global_iet,
> > > +							   val,
> > > +							   sizeof(uint32_t) *
> > > HISTOGRAM_IET_LENGTH,
> > > +							   -1, &replaced);
> > > +		if (replaced)
> > > +			intel_crtc_state->global_iet_changed =3D true;
> > > +		return 0;
> > > +	}
> > > +
> > > +	drm_dbg_atomic(&i915->drm, "Unknown property
> > > [PROP:%d:%s]\n",
> > > +		       property->base.id, property->name);
> > > +	return -EINVAL;
> > > +}
> > > +
> > >  #define INTEL_CRTC_FUNCS \
> > >  	.set_config =3D drm_atomic_helper_set_config, \
> > >  	.destroy =3D intel_crtc_destroy, \
> > > @@ -229,7 +326,9 @@ static int intel_crtc_late_register(struct
> > > drm_crtc
> > > *crtc)
> > >  	.set_crc_source =3D intel_crtc_set_crc_source, \
> > >  	.verify_crc_source =3D intel_crtc_verify_crc_source, \
> > >  	.get_crc_sources =3D intel_crtc_get_crc_sources, \
> > > -	.late_register =3D intel_crtc_late_register
> > > +	.late_register =3D intel_crtc_late_register, \
> > > +	.atomic_set_property =3D intel_crtc_set_property, \
> > > +	.atomic_get_property =3D intel_crtc_get_property
> >
> > +dri-devel
> >
> > Can this be made drm crtc property as histogram is generic?
> >
If there are other drivers using this property then this can be made a drm_=
crtc property.

Thanks and Regards,
Arun R Murthy
--------------------
