Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAF6970CF2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 07:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1D10E2B0;
	Mon,  9 Sep 2024 05:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOtrdidn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6B410E2B1;
 Mon,  9 Sep 2024 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725859583; x=1757395583;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WxGObcck5cRbMv2TVtEllV2DHAnwQMr2H5e1KbMC1lE=;
 b=mOtrdidnLOwPzKQbRlTRGDqi3eXea+ogzA6tMEHWDrQnaMBynLCz4jXB
 YUspDkv3CnIsXX+H0Fymj7dCtSsL6E18FVlx76TgZRs2migNdhdD5uWzJ
 Xz6w4fgG4HDBMoE8dY8uN/6omUmLuESqtZoVusELNHlav8C4ZEzuLebS4
 48jM4ZY1MtDXFFHhLZNvVA20OGruzzWRcDGJWQ/li5oBxHVSy1GsOl3J3
 XmvYf+5aUy+wqPuCORScJR1vMvPOFfpF+CrIoSZdGZnvvpaIK9rG+959Y
 sn+nMiMlsnVbpODEMeb3wP1Sm53MenrJa+iY2kOXzFzaWe4Jiaw0DVcfX g==;
X-CSE-ConnectionGUID: Y+yksS+OSVihgQ79VEq+Lg==
X-CSE-MsgGUID: W3jHo5iAQ+CIUcCxhbZEKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28414503"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="28414503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 22:26:23 -0700
X-CSE-ConnectionGUID: 2vuqwHPtSUCChAfhAb4F3Q==
X-CSE-MsgGUID: vrQnLU72Tya6XSktPNI49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66864387"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2024 22:26:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 22:26:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 22:26:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 22:26:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Sep 2024 22:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADGWxGc6p6oouv7Qs+jaiKbutHYku48wm2uIT9X0mjXrXxt9qp9UUy+ZL+AQpe6fW1qK0HVVYjziEjp+QobXYmhUomlAmfaHMhLwtcDHR1XR6xdxnbgHlo+1Z53nx5WKGlL3LQRDgL45eSxRnRkJKwWAcDmtDhGHSVq1VP9v76D6y4Gib3ctoxOXr1WMfi8nvX6OnkNT+FhRdXGG3ZqbnDVu11Y5TXQvONIoDNQPqfaXCWgrapcloEMWvlK9gM45Sg0w7DuaQH5nzNbzlSbIpiSJF/ZJwLGPmTzODVleULSHGKpEKWAb7f2XAFR66HWDcP3zWlqUjkXJpbvEpVRBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpveSbF5nTLCuDLaviA/kyGWApImHxZhYZwZQKqE7xs=;
 b=mraKGRWHTXfVN/cioLkrje4BhfPgAH4FIaJdlKEkOKN2X6qXRFrKsRmda4NH78Fvv42H0/5kqZ2LBVbU+L+gw1bWUJw+RIkWZ3mWH4x2jUWZCnxpYz8pH7zySfMaa2TSF3ZwbADiYYMPb9Z6Oz1MBp6mjOs+A7k0rk8TSSpQIn8yJ/qnwawOJyUmFgs2O2A//l5AOLLiCNF6pFhuYVXHhctr2bYFgiN/VsAiL2B5RWYUg+QtogoICk3W6O+Q8pqpQFQ3jtDn/6t91VdgVgKwRpt3Bfm6uu9p/X4VXcTp4xBX4y78zzNSeQ4YGthrkKPfj1LdL1lu+gsVpdcsltylgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 05:26:19 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 05:26:19 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Topic: [v4 2/5] drm/i915/display: Compute the scaler filter coefficients
Thread-Index: AQHa0Q5LOSL7+lRfxUyqPrqDG+4tLbI+QroAgBEFGnA=
Date: Mon, 9 Sep 2024 05:26:19 +0000
Message-ID: <IA1PR11MB64670907D474606D4E04B970E3992@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-3-nemesa.garg@intel.com>
 <IA0PR11MB7307353A666BE6179B28A2CFBA962@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307353A666BE6179B28A2CFBA962@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DM4PR11MB6310:EE_
x-ms-office365-filtering-correlation-id: 44f7fcca-52f8-436d-20ce-08dcd08fef37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?AVCXZjJ9ibSMUQKIQqmF2R64I5EH/q071DtBnGn3xc8YUqGI98ToLd4I+1?=
 =?iso-8859-1?Q?yEx82duXe/twv5Z1wV1Tlz3hrSULNGP8kh3qjhh8EJ0fgviNG/vVjqlWWO?=
 =?iso-8859-1?Q?pJ+GGr/VqzgHwGqJwWuk6YvOFRUF8aQGCRWj8mEezcA8zbHQvB+wGjaxLo?=
 =?iso-8859-1?Q?BWQTAgVC/WfTnW8ci6PRyeByc+aUxFnihygxGq7fer5J8yy/JMtkVk3s5X?=
 =?iso-8859-1?Q?h1E+1jYK5D2x855uA3TGWyZ2G9wPCDF/d1CKYDI2c26Qryj2EqF9ywJnkG?=
 =?iso-8859-1?Q?u5xlAdBiomGsS8WevMiJpDjFOMCoFFUF9UbXEXr9Pcj+3vb9ZmRHpZrZzk?=
 =?iso-8859-1?Q?pb24CN1cWmV3y9Ve8LOv0N1cg/4ULzZ7+qx6muzTWmxGhKqDt6yri5OmUs?=
 =?iso-8859-1?Q?zCd14OLedkOzThCS/6M4hjIXYM20ZhYwMdhzd+gy6ZO1+KNEgirqBRflrv?=
 =?iso-8859-1?Q?jKiJWant4Ei1cUyrgGx7nhLwWUDfmUStKkjiKt9lwPNHR3wMt7MhXQMxlf?=
 =?iso-8859-1?Q?DFp2xYitjglQT4Hju+WOT4FjWaxP+b4bKBZpkX0Ile4tnw5m3SdRJHMSv5?=
 =?iso-8859-1?Q?TWjivrMgFcSP7qswxt1Df2TeWDq+Q/KQDtv3ofmI9LVzDcAO/TLmJLQ4tQ?=
 =?iso-8859-1?Q?FbqPLdjWILYOtReUhSX1IueY5jfywqa+53jKynIdfFeI4p6VoG/fNwDOrJ?=
 =?iso-8859-1?Q?YAxrcjB5WBn5OvJLjebyXSz+bSd7lWQzH/6VjF9we47viaYSg88h8apcsf?=
 =?iso-8859-1?Q?Kq57f3g9tGqtdB1+OUx8+wqNdpDPG3IrPoiu3GDrpMIcEVziZclIc9i1c0?=
 =?iso-8859-1?Q?WvAKoDWynM9mAFwFkTBxNDSo7FRb3PLzKGRgMYa+XHF5E+4qFP/jQrltUO?=
 =?iso-8859-1?Q?ufzW0wh/p5gKAzTkSwU1TVtS5qZSVe3PGuy4HvvRB+IELdsFmf+LkbBJQw?=
 =?iso-8859-1?Q?pnKGWrgfteG6gIfdc2gXPyqTo0WWnEjB+Bkulveh0bqaK2MHdFyarywWW3?=
 =?iso-8859-1?Q?+iBOuvuaC6u5xL2+pS3Zc58g7uDbywj+mBEeCydsD/dRQmhpdSuKDp/MRb?=
 =?iso-8859-1?Q?gkJc2aR6uILI6XFIliDETFj0L0iY/m5tICIWMaYUdAICM3OttxdW0mILOS?=
 =?iso-8859-1?Q?6PFASwj4WYnT9tuqssVg8MFOhmQhJSMIbqiEM1QIVbTn/bAu4BKF33Uvc2?=
 =?iso-8859-1?Q?nJd+8Apf4tXeWp7CRZqLkUE6zFSaIX3N0lFp7x9UiD9bHsARql1c9Zy9Em?=
 =?iso-8859-1?Q?5eOyANhti8PN0Rek+Oxpdw48McmfR3S3sNM2Mmor3hV38fVTjqwvC0jn+c?=
 =?iso-8859-1?Q?1GgeCv1FcTyrDG31iHTB9D1xTruLAk86U2jsY1uuIiHRfA84RRM6k9vVEf?=
 =?iso-8859-1?Q?xpxgNdxOcWbMkGRQjGB/kIVPHAA2gvB9XL4PANcXLHW+JEuPA+8qDCjdLI?=
 =?iso-8859-1?Q?/7KjXyzE1XcudlbDXkU9ryW6UdWekQwfeH/TrA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xf9BgLg3T2r047yNR8p15XcQ9ZkxJwvvu61JW+S7xOOQgxNkzLxC4nRAVn?=
 =?iso-8859-1?Q?RoYCipXxQvCwjta3rrdrzpLmVU8EhR9TTrjRaZVGvmS72KJV7W1OPppgDN?=
 =?iso-8859-1?Q?6RRc5t7RI2aO0IB890PwI7WRegECq4ownmuN0GO+ypKAlurZs+1GmHMkJs?=
 =?iso-8859-1?Q?O6xdtzqNt7iu8O2Is/F6tTFJdxIExQZWFCodK/ys6xS6fGQ1PBx1cXbUQ9?=
 =?iso-8859-1?Q?ReipVGNHsimkPNsgA+kkiT0+ndwvS4spy0vrHGUFUdv0Nn8cc9CJWSlBn8?=
 =?iso-8859-1?Q?AsCksqlkFKdxrs8NeA7bPycWNRrMXdGxZxBkoi9QYFMuPb4texY3sB1xhS?=
 =?iso-8859-1?Q?Q3JX44TTIy5tKCtePwZGevGaV+nlF7kR9GC9d5YK37Hp1rEI92UslU3IlE?=
 =?iso-8859-1?Q?g82e2ZA0QIxpAxYFqVMSOT93UrB2LL3qNfsFyBZN1RKIwGYb82gIhRBeGL?=
 =?iso-8859-1?Q?Dma5Ko/vV4fWb5ktkWK+mqkReHgmy5adh0T6Os113Cg80TWZHi6Po/CbhS?=
 =?iso-8859-1?Q?sEoH9SjEXT3kXX47aAYlNHx5Tt6wNY0GF4Lk6TLVFPzhNKEyI5QXpGeSar?=
 =?iso-8859-1?Q?VQAkgJN74tsPMh2NRdfAPsq4tjsnKRoSDD1clw5/jSm/UhHm+el6hV+KA2?=
 =?iso-8859-1?Q?79DKcbot7NsI/664eV8GNQWlzpsAA3Pe7LyCOscZuiLcQfO1vtSDAPMrgi?=
 =?iso-8859-1?Q?9O10TWek1wQpnRrW1i7VUtGTUDQLuPXCuThoxl4AzbKpdhj4v/Qqy8wIjX?=
 =?iso-8859-1?Q?ERN6cPguVzGOvgRYlonrVeeAIdCw2FJtJ5iaA8RavWn5jJVGhwYaufmETA?=
 =?iso-8859-1?Q?o4TIXlBC11UPKRC+ywO86zWjQ7z1+cBI2gia8brVDMohKEneqveReYgbZO?=
 =?iso-8859-1?Q?Yz8jD1HLwYS0wTKwj14mFNqJy0clnQOneta4347UhHDOQbN7G9sMFKedcg?=
 =?iso-8859-1?Q?OCWmrhtHxRqFiy3bSZtZPFO0SOIZwMvvFUMQt/9WWUweaxoIC1PkwIDi01?=
 =?iso-8859-1?Q?lw/8LFJxIo/sSAJZ3jvFMQQ0oZLDTthFvEK0dxY2xckFPo03Th+nWHXFyV?=
 =?iso-8859-1?Q?gxq/V2qYhCGS5MbKHmAQyCULilAKL06jra09yNXPi1sRqxiFoxOoz1Tiq4?=
 =?iso-8859-1?Q?ggRN23/ZVsoiRNNesN8/ohQ3k4Zp0si9lDyj1t0NL9YZeOd5yLevSmEupU?=
 =?iso-8859-1?Q?6gbBXPhQqo9X1WJ9dGufm+H3YglFeSfzvV9sfMRSBDIeei+EC74KsdFOlx?=
 =?iso-8859-1?Q?9MHmveuFR8zRUpcBRcfyStYlrIjhXOwej3m0R+TFeI710YrpKGsZlcox6/?=
 =?iso-8859-1?Q?JvQWkuLP8nIvOZQdJfvLKkXHs2h0covkksNbXr5vo/JYltdMaUsZsvdiUu?=
 =?iso-8859-1?Q?ixUgJ9FCfo3KJ2yUcKs+1jPdoJJ7Ybxv47PmMKkYMz3xwNsET/XD7RATrK?=
 =?iso-8859-1?Q?D3zMBQ4FN88uIxv6ljeWZMjZqTj15ONaWep/2PUqLcAGyZ8MEfV/kwT5Ql?=
 =?iso-8859-1?Q?HUN1usrI8UgrI56fXVuhDHYtxaFHyvHZPRB2oErsMFKlfu+1Oijpsk/RHT?=
 =?iso-8859-1?Q?35gU56oV1udklo4zFbClTmpqOwUGWoY0NT59DfWulm3Wen46Cp7/HMljsv?=
 =?iso-8859-1?Q?Pi73TzYQm1CuSVc+kXqPNV1d5IsBDZkrJa?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f7fcca-52f8-436d-20ce-08dcd08fef37
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 05:26:19.1766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +N7IUY5POV82Iih2W3HBMzn/R58ID1nd19IFXl5Pd4kQxawbxVo7nv1d9YOCxhxEBqxiETRdnKjEXzLYSezzMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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



> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Thursday, August 29, 2024 2:34 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: RE: [v4 2/5] drm/i915/display: Compute the scaler filter coeffic=
ients
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Nemesa Garg
> > Sent: Monday, July 8, 2024 1:39 PM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Garg, Nemesa <nemesa.garg@intel.com>
> > Subject: [v4 2/5] drm/i915/display: Compute the scaler filter
> > coefficients
> >
> > The sharpness property requires the use of one of the scaler so need
> > to set the sharpness scaler coefficient values.
> > These values are based on experiments and vary for different tap
> > value/win size. These values are normalized by taking the sum of all
> > values and then dividing each value with a sum.
> >
> > --v4: fix ifndef header naming issue reported by kernel test robot
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/Makefile                 |   1 +
> >  drivers/gpu/drm/i915/display/intel_display.c  |   2 +
> >  .../drm/i915/display/intel_display_types.h    |   9 ++
> >  .../drm/i915/display/intel_sharpen_filter.c   | 121 ++++++++++++++++++
> >  .../drm/i915/display/intel_sharpen_filter.h   |  27 ++++
> >  drivers/gpu/drm/i915/i915_reg.h               |   2 +
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  7 files changed, 163 insertions(+)
> >  create mode 100644
> > drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> >  create mode 100644
> > drivers/gpu/drm/i915/display/intel_sharpen_filter.h
>=20
> Can a unified name be used across the patches. -> intel_sharpness_filter.=
c
>=20
> >
> > diff --git a/drivers/gpu/drm/i915/Makefile
> > b/drivers/gpu/drm/i915/Makefile index c63fa2133ccb..0021f0a372ab
> > 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -280,6 +280,7 @@ i915-y +=3D \
> >  	display/intel_pmdemand.o \
> >  	display/intel_psr.o \
> >  	display/intel_quirks.o \
> > +	display/intel_sharpen_filter.o \
> >  	display/intel_sprite.o \
> >  	display/intel_sprite_uapi.o \
> >  	display/intel_tc.o \
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index c2c388212e2e..a62560a0c1a9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -5906,6 +5906,8 @@ static int intel_atomic_check_planes(struct
> > intel_atomic_state *state)
> >  		if (ret)
> >  			return ret;
> >
> > +		intel_sharpness_scaler_compute_config(new_crtc_state);
> > +
> >  		/*
> >  		 * On some platforms the number of active planes affects
> >  		 * the planes' minimum cdclk calculation. Add such planes diff -
> > -git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 8713835e2307..1c3e031ab369 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -55,6 +55,7 @@
> >  #include "intel_display_limits.h"
> >  #include "intel_display_power.h"
> >  #include "intel_dpll_mgr.h"
> > +#include "intel_sharpen_filter.h"
> >  #include "intel_wm_types.h"
> >
> >  struct drm_printer;
> > @@ -828,6 +829,13 @@ struct intel_scaler {
> >  	u32 mode;
> >  };
> >
> > +struct intel_sharpness_filter {
> > +	struct scaler_filter_coeff coeff[7];
> > +	u32 scaler_coefficient[119];
> What is this magic number 119 and 7?
> For each win size there are 7 coefficients, so coeff[7] is used to store =
these values which are further used in calculating scaler coefficients.
As we need to compute scaler coefficients for 17 phases of 7 taps I have us=
ed scaler_coefficient[119] .
> > +	bool strength_changed;
> > +	u8 win_size;
> > +};
> Better to have this struct in intel_sharpness_filter.c as this is not use=
d elsewhere.
>=20
> > +
> >  struct intel_crtc_scaler_state {
> >  #define SKL_NUM_SCALERS 2
> >  	struct intel_scaler scalers[SKL_NUM_SCALERS]; @@ -1072,6 +1080,7
> @@
> > struct intel_crtc_state {
> >  		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
> >  		struct drm_display_mode mode, pipe_mode, adjusted_mode;
> >  		enum drm_scaling_filter scaling_filter;
> > +		struct intel_sharpness_filter casf_params;
> >  	} hw;
> >
> >  	/* actual state of LUTs */
> > diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > new file mode 100644
> > index 000000000000..b3ebd72b4116
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + *
> > + */
> > +
> > +#include "i915_reg.h"
> > +#include "intel_de.h"
> > +#include "intel_display_types.h"
> > +#include "skl_scaler.h"
> > +
> > +#define MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER 7 #define
> > +SCALER_FILTER_NUM_TAPS 7 #define SCALER_FILTER_NUM_PHASES 17
> > #define
> > +FILTER_COEFF_0_125 125 #define FILTER_COEFF_0_25 250 #define
> > +FILTER_COEFF_0_5 500 #define FILTER_COEFF_1_0 1000 #define
> > +FILTER_COEFF_0_0 0
> > +
> > +void intel_sharpness_filter_enable(struct intel_crtc_state
> > +*crtc_state) {
> > +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> Can i915 be used instead of dev_priv?
> Will use struct intel_display *display =3D to_intel_display(crtc);

> > +	int id =3D crtc_state->scaler_state.scaler_id;
> > +
> > +	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> > 0),
> > +			  PS_COEF_INDEX_AUTO_INC);
> > +
> > +	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> > 1),
> > +			  PS_COEF_INDEX_AUTO_INC);
> > +
> > +	for (int index =3D 0; index < 60; index++) {
> > +		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> > >pipe, id, 0),
> > +				  crtc_state-
> > >hw.casf_params.scaler_coefficient[index]);
> > +		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> > >pipe, id, 1),
> > +				  crtc_state->hw.casf_params.
> > scaler_coefficient[index]);
> This is an array of 119 elements any reason of using only 60 over here.
>  There are two sets of programmed coefficients are available for each sca=
ler and these 119 coefficients need to be filled in form of 60
     Dwords per set.=20
> > +	}
> > +}
> > +
> > +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *=
coeff,
> > +					  u16 coefficient)
> > +{
> > +	if (coefficient < 25) {
> > +		coeff->mantissa =3D (coefficient * 2048) / 100;
> > +		coeff->exp =3D 3;
> > +	}
>=20
> If () {
> } else {
> } if () {
> }
> Thanks for pointing out.
> > +
> > +	else if (coefficient < 50) {
> > +		coeff->mantissa =3D (coefficient * 1024) / 100;
> > +		coeff->exp =3D 2;
> > +	}
> > +
> > +	else if (coefficient < 100) {
> > +		coeff->mantissa =3D (coefficient * 512) / 100;
> > +		coeff->exp =3D 1;
> > +	} else {
> > +		coeff->mantissa =3D (coefficient * 256) / 100;
> > +		coeff->exp =3D 0;
> > +	}
> > +}
> > +
> > +static void intel_sharpness_filter_coeff(struct intel_crtc_state
> > +*crtc_state) {
> > +	u16 filtercoeff[MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER];
> > +	u16 sumcoeff =3D 0;
> > +	u8 i;
> > +
> > +	if (crtc_state->hw.casf_params.win_size =3D=3D 0) {
> > +		filtercoeff[0] =3D FILTER_COEFF_0_0;
> > +		filtercoeff[1] =3D FILTER_COEFF_0_0;
> > +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> > +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[5] =3D FILTER_COEFF_0_0;
> > +		filtercoeff[6] =3D FILTER_COEFF_0_0;
> > +	}
> > +
> > +	else if (crtc_state->hw.casf_params.win_size =3D=3D 1) {
> > +		filtercoeff[0] =3D FILTER_COEFF_0_0;
> > +		filtercoeff[1] =3D FILTER_COEFF_0_25;
> > +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> > +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[5] =3D FILTER_COEFF_0_25;
> > +		filtercoeff[6] =3D FILTER_COEFF_0_0;
> > +	} else {
> > +		filtercoeff[0] =3D FILTER_COEFF_0_125;
> > +		filtercoeff[1] =3D FILTER_COEFF_0_25;
> > +		filtercoeff[2] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[3] =3D FILTER_COEFF_1_0;
> > +		filtercoeff[4] =3D FILTER_COEFF_0_5;
> > +		filtercoeff[5] =3D FILTER_COEFF_0_25;
> > +		filtercoeff[6] =3D FILTER_COEFF_0_125;
> > +	}
> If this is always a constant, then can this be in a lookup table?
Sure.

Thanks and Regards,
Nemesa
> > +
> > +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
> > +		sumcoeff +=3D filtercoeff[i];
> > +
> > +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
> > {
> > +		filtercoeff[i] =3D (filtercoeff[i] * 100 / sumcoeff);
> > +		convert_sharpness_coef_binary(&crtc_state-
> > >hw.casf_params.coeff[i],
> > +					      filtercoeff[i]);
> > +	}
> > +}
> > +
> > +void intel_sharpness_scaler_compute_config(struct intel_crtc_state
> > +*crtc_state) {
> > +	u16 phase, tapindex, phaseoffset;
> > +	u16 *coeff =3D (u16 *)crtc_state->hw.casf_params.scaler_coefficient;
> > +
> > +	intel_sharpness_filter_coeff(crtc_state);
> > +
> > +	for (phase =3D 0; phase < SCALER_FILTER_NUM_PHASES; phase++) {
> > +		phaseoffset =3D SCALER_FILTER_NUM_TAPS * phase;
> > +		for (tapindex =3D 0; tapindex < SCALER_FILTER_NUM_TAPS;
> > tapindex++) {
> > +			coeff[phaseoffset + tapindex] =3D
> > +				SHARP_COEFF_TO_REG_FORMAT(crtc_state-
> > >hw.casf_params.coeff[tapindex]);
> > +		}
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > new file mode 100644
> > index 000000000000..6ab70a635e2f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation  */
> > +
> > +#ifndef __INTEL_SHARPEN_FILTER_H__
> > +#define __INTEL_SHARPEN_FILTER_H__
> > +
> > +#include <linux/types.h>
> > +
> > +#define SHARP_COEFF_TO_REG_FORMAT(coefficient)
> > +((u16)(coefficient.sign <<
> > 15 | \
> > +			coefficient.exp << 12 | coefficient.mantissa << 3))
> > +
> > +struct intel_crtc;
> > +struct intel_crtc_state;
> > +struct intel_atomic_state;
> > +
> > +struct scaler_filter_coeff {
> > +	u16 sign;
> > +	u16 exp;
> > +	u16 mantissa;
> > +};
> > +
> > +void intel_sharpness_filter_enable(struct intel_crtc_state
> > +*crtc_state); void intel_sharpness_scaler_compute_config(struct
> > +intel_crtc_state *crtc_state);
> > +
> > +#endif /* __INTEL_SHARPEN_FILTER_H__ */
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h index 0e3d79227e3c..9492fda15627
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -2257,6 +2257,8 @@
> >  #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
> >  #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
> >  #define   PS_PWRUP_PROGRESS			REG_BIT(17)
> > +#define   PS_BYPASS_ARMING			REG_BIT(10)
> > +#define   PS_DB_STALL				REG_BIT(9)
> >  #define   PS_V_FILTER_BYPASS			REG_BIT(8)
> >  #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt
> > */
> >  #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5)
> > /* skl/bxt */
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index
> > 0eb0acc4f198..8681ca89af27 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -278,6 +278,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
> >  	i915-display/intel_psr.o \
> >  	i915-display/intel_qp_tables.o \
> >  	i915-display/intel_quirks.o \
> > +	i915-display/intel_sharpen_filter.o \
> >  	i915-display/intel_snps_phy.o \
> >  	i915-display/intel_tc.o \
> >  	i915-display/intel_vblank.o \
> > --
> > 2.25.1
> Thanks and Regards,
> Arun R Murthy
> --------------------

