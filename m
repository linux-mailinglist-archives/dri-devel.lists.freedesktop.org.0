Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BA44AFDB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 20:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902B10E520;
	Wed,  9 Feb 2022 19:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E2810E1FF;
 Wed,  9 Feb 2022 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644436212; x=1675972212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XUe/KhgNBG+6zHIA4g4RxyYWPCfv1CYnjeiJbMGnrPU=;
 b=UJSprThjEPPSFcJ/8dIBolbygTcLtKpTQIVNr+Fx73rIon5EYwOs9aVi
 k/Hjc977pAPrG1s7GNwnlLVw1nccFmOXdXH/iyiBczXCZPa1rZL8qDv8V
 oXkwsfLN00x/1Qra9FMMCfLizCrRnYeabOcXyN2EPndXeVu1Ntrxkj802
 Kk4mBlrJUzz7WDWOjMMJ/rOXysr5oiGYPhu8xyO2jw0COS5YMlTjzq/c8
 NEZqUt02895z76v5vkVd9+4+5QT3KMnuSM2gmB/+RWFFDPyfv+dYGcBCR
 vv+MUfTVZbZbPsqE/mu1yKkbOEbi2AkD8fiPy9iOrXwe1DvMfJD9euCwT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="335729270"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="335729270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 11:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="629404556"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2022 11:50:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 11:50:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 11:50:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 11:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTKgBGpLrNfnOObXjc5a/VzegjRzhMOyHFA7qMWUQoxa4Nqh9KcfG31YyrqW6I4wv/Y5Z5OUkQMEJ3ViTVQsg8AqdcHB55LrJouAKfTALo1pVEne+wzLMuIH+4R4wa4HoJJ5ve1ZElD6Rh8OlqyYBGtbKmlfOJxg4oRrT01NDQ8/E+Jf5zlzN8FcqLzVkuKgP60wkTSXAJXUFq5IkYhVY29xdK1y2KjfIXq09VxGfQyqXc4wiVprkqw3/CcMdorfUta+MmwsjpFWhvH11i9chUap9H8cr05rvcQ1lgWemPjSpwvEHAWugcBWPSpW7954+OpM27mOy4xD3RB/dXy6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/0z/Qzyz8arfHdIxJChuIFseD08S3+mml1KlYjDJpQ=;
 b=HdqzokNobxDffDl75cpD/DKsDg0RFedp3rTPLmNuJRxNNU5ZKZgQd7oC8YOVGar6n+ywZ2sKvAcp626eeO5MAiGajqt37xS55PaZVBdCVOy/KbG/A/zjCsloLEYsjSdP6L0pmB7LJaSkmz/J3YTUwGaMkhvHQpuuMrqWsvO+UGoewypf0RqizsvVUbD8xDhqiAvQslm6HghKLrwGp5gBMHKhcQEho1f+PvdUO0e4B80Co+ccD086wtQoSewfRIyKI2p3Lw7Qs24kccd1rNzkD4hNtR0Mc7VKYxhzTvugvsFT4uoH9F4t97GtV3ufGqhuZ7hYlQg2Xy5T+CMfYtcdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Wed, 9 Feb 2022 19:50:09 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::897e:762a:f772:1c34%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 19:50:09 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v6 2/3] i915/gvt: Save the initial HW state snapshot in
 i915
Thread-Topic: [PATCH v6 2/3] i915/gvt: Save the initial HW state snapshot in
 i915
Thread-Index: AQHYHNy6NmrKnennPUe03qa1ybalWKyK1IeAgADOO4A=
Date: Wed, 9 Feb 2022 19:50:09 +0000
Message-ID: <8b430166-7603-fb72-f9b0-257008750538@intel.com>
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
 <20220208111151.13115-2-zhi.a.wang@intel.com> <20220209073201.GB9050@lst.de>
In-Reply-To: <20220209073201.GB9050@lst.de>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb9870d4-049a-424e-2a8c-08d9ec056105
x-ms-traffictypediagnostic: SA2PR11MB4812:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SA2PR11MB481233B8CCE111469E2360E0CA2E9@SA2PR11MB4812.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GU2hYRxLzk5NFKVHbGEzLtWNQ8X0v0JoYoPlOToxVotbxXAFQoQOYqKLEvWuNvSdXGUVh+mzhG28188p4eqaVcoNwwMcIskXPpWsWlJ59EV8zzmnOnC+rYYlO/NO+6SAKxOnGG2aV3I7UX90KmUTf5pJELVtuFGR/YF0kORFVum/vlhit7z7V2APrgMVDC71PgxeBBPjuP0mxNELchqQX6xUKKGUj+FsPsbYMJB76GzQsJ4Esx283O4ovO/VkcUumMp03j3U14eJJ1RCq3gsw/IUper5QzDe74Wzo6K4QV6rrlNRDCeI5OdUBHYIh34Cs82vO/6yD1uo/HVBts2GvtTs/sHx2RsHpBsoJi3Kxf17N4931ytghM81O88SJnBydoqGK5fK3vtFrAtgXoDHJrLrUtIpORsFpa6xR/QOwL1lpvK6QFQmiiAGpvwQBe1N1lufRh+As1EO28DQyjJXDGnn85YkJXtH/BkS2iWmRpBRRTua5rgMXKMLSRx9RIM+pkfNwJKhIFzhIOEXLWmSsoPF4+3X9AU15d3psfd1G/HYfADixcYfHlIgAo4FSkQHI78O5+CRs2SvurknlmIpwEWR8KQboiJuYYXQHIsdnCsTvEfHJ4pmLIvTWV0VYJPuKlcxS+qX09F4FzvbmmE2jb6gfKla7OIQ3/UsyA1F8U+E9puWpKhtAGT6KnTnknwpSYC/Wnit1lKFv/89CgwaJFpAMrjr6+uT1go0wasBtA4H+GLGodNNlqBHlrmXbl9DHHnQ7mt1Bbdb5imNnf/RMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(2616005)(36756003)(66946007)(76116006)(66556008)(66476007)(66446008)(91956017)(8936002)(4326008)(31696002)(110136005)(54906003)(86362001)(64756008)(26005)(186003)(7416002)(8676002)(122000001)(83380400001)(71200400001)(38070700005)(31686004)(38100700002)(5660300002)(6506007)(6512007)(2906002)(82960400001)(508600001)(6486002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?9TQbi60h/1Gr5Oinosv/ne1PaIM1QvIY6kvDKw/yKA3vJhg0J6dqwyda?=
 =?Windows-1252?Q?nHTO6zI3udBNgdXERgmh788gmumLwqHFozCUFizPaEe3yc3nai95Izmu?=
 =?Windows-1252?Q?MU/lehItNx0kLvETWyFND73KPiKeQ89aBr2hPKXSCqMFMPR9kDAmVzzW?=
 =?Windows-1252?Q?jGz9Sq7BEIcFqltqjp0C5WG8L4GIhraIxImwnHHTlAJDujDf/Pd8v7Ro?=
 =?Windows-1252?Q?pFuBHM0uLvSmitY/2RbrQoAnAeDwQxPGeivXw++sX3cMvjqyhct369ZX?=
 =?Windows-1252?Q?YcuL5z6ewVGnGRnorUeVQydH8/DtZbMyZjpM9aRkG5jhTqvCh7ek9Sr3?=
 =?Windows-1252?Q?X4TVw3jRiX+mpWalkd6E7cvkmYAWRtrPbhnmVY8wvqbxBY+O4UqXu3Mk?=
 =?Windows-1252?Q?vyPfpW2GR4FCI4OaIEafLPDMr3ZpDmhcxyNhUdZk29CrT6G5KY5n5iyI?=
 =?Windows-1252?Q?WLZP6j2IXe4XWog0wsjoJWc8PkUhVQ8u1ISxDSQbXMCn0jSPpvEWWyKm?=
 =?Windows-1252?Q?DIuIw/nPs6NWmCBADIFwpI48TbAFQ+4rRDh0EoofLFwaVehWXz+2YvaQ?=
 =?Windows-1252?Q?vKuV1kvDLzR9tJOrHOTKw1RxS4jt/LkdgVToUu+rRMNSrvWlTD+kBmXj?=
 =?Windows-1252?Q?qPwlFjwkzdeFl0cWbQCBZcyXXYeVqIQsAs46h2gsl7WCDndyr6n0n5TI?=
 =?Windows-1252?Q?btNpTbqvDzgXPg9a+WHQlRB9RnTOhl1wq6bR1xLBtzgrYFHxAL2PYi7h?=
 =?Windows-1252?Q?2SUCvlPl6tXD5RuSYt5p+bEOKQHKsLN7L7Zq5vxp5OX5UkG/PgbEeFDk?=
 =?Windows-1252?Q?T8dOhLzif6ArkS7Vp78mWMXEQYbiniWjLZLVllCyqL/1VyYCN59yuf2c?=
 =?Windows-1252?Q?oG2T6sxKaFu35bu9A7ZS4OezCorE37FDUVL6IwcMuNADKUjC3DcZ770i?=
 =?Windows-1252?Q?3wSBUvLjGXMcgZs7D9hPt/a0iGQkdw7TtDUkihCh8eBjb6PQgpS6jmyE?=
 =?Windows-1252?Q?zIky1aGzThggl/2ztoBuXgUsEkdk+A/o3t94IiBQCJuVQe1EaPt94rn5?=
 =?Windows-1252?Q?4RTU34pQ6wDRgAcu4/WBm27h6JYwMkGEdKqQecP/4NVfuZ48zZ1+8udC?=
 =?Windows-1252?Q?2yA+XGnN9eHRV9D1QLrk6u53N/rU52hIGkFDAZut96uSZWakH9e/tgWC?=
 =?Windows-1252?Q?rIqhUg/kp6Uity8/8M8vVX+bGrBCKNlIrJ+35pE36gd5Jo7ub1/D7L8q?=
 =?Windows-1252?Q?I/94UM31mrhwNDLj3bIKP+Ch7IJ2q9wvi3rHm0UUVag5e1cFcKZx7IPa?=
 =?Windows-1252?Q?tqf25t4ueCCbWc4gixo3YjAIcsYYesduZMCkyWk3vm5fZnsxmz5Vdx4U?=
 =?Windows-1252?Q?WxwO+dAlJAD5TACKvsBRIyaM+UXloODG2JG5pk6XHva2o+TyfH1DzghX?=
 =?Windows-1252?Q?hU2Umpr8rJ4qZXgw0bmTflaCyRwBeyUpyyFwyWIbAHE7LoHIVSfRS6Sa?=
 =?Windows-1252?Q?82rfK2Bt/JUoHOuu0mBzukeyfXOxl5sdPV2RR4N5115vH5SICfNn4dVh?=
 =?Windows-1252?Q?Vz+bPQTR8zzxQKsrHiFo0Ff88t46Dq07WGbM6MD9z2Y9CcQyb4xn5x8T?=
 =?Windows-1252?Q?PKcLRgUKrQQ2CIjasgzgQM67Bq5xnOf3y7S7p7NsF0HdI2qWqNMeqxM2?=
 =?Windows-1252?Q?eFAsPYPOirFQd+mH6XLEOqpuhN4tA4CAWvH5Sadiy4zOHfZssTp1kQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <185100D7601EF74D876647A194A5E4E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9870d4-049a-424e-2a8c-08d9ec056105
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 19:50:09.5574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuM3HccZiETXvfkmMBbBRugBL1KkoekFqgLI38q/IjL3waAWsMfjhrTFqOROr5xjUsA4FyP/pw97rKy631F+UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/22 7:32 AM, Christoph Hellwig wrote:
> On Tue, Feb 08, 2022 at 06:11:50AM -0500, Zhi Wang wrote:
>> +	struct drm_i915_private *dev_priv =3D iter->i915;
>> +	u32 *mmio, i;
>> +
>> +	for (i =3D offset; i < offset + size; i +=3D 4) {
>> +		mmio =3D iter->data + i;
>> +		*mmio =3D intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
>> +						  _MMIO(i));
>=20
> This reads much stranger than:
>=20
> 	u32 *mmio =3D iter->data;
>=20
> 	for (i =3D offset; i < offset + size; i +=3D 4) {
> 		mmio[i] =3D intel_uncore_read_notrace(to_gt(dev_priv)->uncore,
> 						    _MMIO(i));
> 	}
>=20
I am not sure the suggestion is correct. That's the reason why I didn't tak=
e the comments in the previous review.

if mmio is u32 *, the step of mmio[0] -> mmio[1] will be 4, and i will be i=
ncreased by 4 in each loop.
I guess the correct one would be mmio[i/4] =3D xxxxx; would that looks bett=
er? if yes, I will do that in the next version.

>> +static int handle_mmio(struct intel_gvt_mmio_table_iter *iter,
>> +		       u32 offset, u32 device, u32 size)
>> +{
>> +	if (WARN_ON(!IS_ALIGNED(offset, 4)))
>> +		return -EINVAL;
>=20
> Shouldn't this be in the caller of the method?
>=20
>> +	save_mmio(iter, offset, size);
>> +	return 0;
>=20
Yes. You are right. It's because I get rid of the mmio_block in intel_gvt.c

> Now that the block callback is gone save_mmio and handle_mmio
> can be merged.
>=20
>> +	mem =3D vzalloc(2 * SZ_1M);
>=20
> Don't we want a driver-wide constant for this instead of a magic number?
>=20

We actually have one in i915, but it's not exported. Should we export that =
one?

Thanks,
Zhi.
