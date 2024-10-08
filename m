Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE626995954
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 23:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2410E5E3;
	Tue,  8 Oct 2024 21:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsNXHRaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862B10E5D3;
 Tue,  8 Oct 2024 21:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728423431; x=1759959431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bx8ewsuSXFWrNcQCP7jo5jYAxe2+5/8ku6Gkhsk6DUM=;
 b=dsNXHRaVUPjSMPbhSH4ofks5RGMwNFew/vW6TRUsqKzJUwWfi/e6J8Nw
 7Yxb+AkaYBSULO7FhyVvUvMN9IgCrOp0mAl9P8OgdRVLbfK/9vJbLFKqK
 Jv805R79BjQitSsrhBlVv5nAb0qnJ/2FkhRqwHSV0WpKs9TQaSHJNZOFY
 4O9fg7Uv8EP4KqfKLmX8x4OOaF8fFtAaJB28h5Ai7wcLk5kbL4XrdOGP1
 lE3DxQjPSxQb77z3xquNMX3oyA2KRu09ezeTUoXj5hG2GbC4fjbwVsdmv
 LiN3jiTQR5R7P2oMS//dUvxam+eg3Mx/nKWz6ePXjpc1k/pfVvIJ442Eg A==;
X-CSE-ConnectionGUID: GmZVruV2RKqBOgxFyuQTtQ==
X-CSE-MsgGUID: KlVeuM5yR+6KVY3K5r8rag==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39028711"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="39028711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:37:10 -0700
X-CSE-ConnectionGUID: yqMTzU6pTkG2dqcCL/sjuw==
X-CSE-MsgGUID: SL1NSZV7QN+vKKFgkLOtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75582915"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 14:37:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 14:37:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 14:37:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 14:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItAM+WJ32eXTRkSRn4RIc8Qcar+0L6OBgQ57AJdHpmOJFwPDEJp4WPVD6LbYGQkJuIfkJip9C7DcUrc3G1sW29rS7esqIuOmy+fz+H9+jkazpDOZnE/CdH8GOI1ISgdKCBML+j9ILOGvtvZb4+mU9w8b3ck2avkidXzKj4vp5j/IcD2jraVgqI59xj64VFhnklDjn65hIdpILKSf7W/wdDjo9zaMSgvYgqD9FbWbHddPpUwcN7GluzTynshrMtqj6KSyN9rPtnHi1/0wcPLK3wfgGkpkZkBa/X2H7jL51FCFBqqbnzQ7ayKMJUjkbE3ztUA0lcNjtl0L584qO4R4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBaBV9v8sySsWKjr6SnQHqYSRi9JM/eRh4xnO9hxv8I=;
 b=oL9bKNqvh4xuWLBcDucAhtQox93ZHSa0KrqmsSz8kFiZSiT0t5GKk9JpjvjIxQyCH0AqiQuoDqQnyipFRzXqRxGMI2XMPc3OEywRgEsJ94BbYzg3R1D1rSZ/WBc576/b30fWRIUIBSRfsFNCHdJNT0hwpYVrXJSo27wLHG7No+F2IqzC1hdb50Bvo3RPWVo0lhiw7tBmgLL4mF+xpeMif5uTqTdrX6zH9BVHL25vR/UZv9m8dV1aNfTMavO+xvpI68EOLKfioMmUXyP7OdQvSIThJLbuFo+UBGaQPYL6TvNKwgxoeahbSSxAY1q9igfwoRzkF+CgJVZ+ldRHeSDSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB8108.namprd11.prod.outlook.com (2603:10b6:510:257::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 21:37:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 21:37:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 08/12] drm/amdgpu: Suspend and resume internal clients
 with client helpers
Thread-Topic: [PATCH v3 08/12] drm/amdgpu: Suspend and resume internal clients
 with client helpers
Thread-Index: AQHbGXqnNdE1SPoewk2qWnH62yMfErJ9U7/g
Date: Tue, 8 Oct 2024 21:37:04 +0000
Message-ID: <CH0PR11MB5444BD286EB68CA16F40E039E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-9-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-9-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB8108:EE_
x-ms-office365-filtering-correlation-id: 618815ed-2ac5-4f3a-2c97-08dce7e159ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?GtmthEveIvrsc9SIJZhX5iqQxyLzoHQoDrmBrwjAn9ZXaZ3lhSPKfw2pwW?=
 =?iso-8859-1?Q?JwjFJlMwEvooHg+6rTzmkm1+3/MPq5nGI6e5wGZEFACl5r2d+7Adj+a9qU?=
 =?iso-8859-1?Q?D67RsE5uwd8zV6Dufjh73bA6Bs/IQCTVqfTMpW83dnUdofDXwwPK+ZUoG8?=
 =?iso-8859-1?Q?8CynYEetOQW7w6Dh7vRxL2KLfNzgiSjGJqjUmL4qp5CYP3kA6JFmzlIO2L?=
 =?iso-8859-1?Q?yYRaBKI4N7DfLTe8xUV/ru1nhU43YVTdQkKz0ggESKYx+Ds0uuMrDqtSPZ?=
 =?iso-8859-1?Q?qzFDDslGoph6baODPYUHU1VaiZ+Uu++DAtf1qfPQNwRBBTJHYDQMSpSOSy?=
 =?iso-8859-1?Q?ml8gGhxg/yssN+SBt6R/Ub9qNP5j3fHYLy40r8r+BazgPJHDo67rP7MGmg?=
 =?iso-8859-1?Q?xU7EXQNrS3Foxi2Tq6RnvRzUMy2ZamvH4NhDdKxeVBgCvKlvgnd/qer1nn?=
 =?iso-8859-1?Q?uwyBYw96JmF1sZsWk/mGgnK/wuU97PZHmraWk5K51jAcpyWl3fB1bWcAGV?=
 =?iso-8859-1?Q?JiSLACxIO4N/bLtOA79lpyoS20MF24ibt+Lniw0PUuwCdJCv7kmDUjRu05?=
 =?iso-8859-1?Q?ywI+cDflSKkg4+xsdWGlFz5fKrZ2QnhgFD0/VIAy7Q6wjM+ZHixg+DYCZy?=
 =?iso-8859-1?Q?uG04Fvioa3/MCTWiwlK2t4c/1zn7rserebCfYnpSk2QnhvXu1M5AkoxyHf?=
 =?iso-8859-1?Q?SoU91tJhoFtpGQwtImU/YkbhAsgKBpw7BYOyRh+qyc28TMN3jgIftufScA?=
 =?iso-8859-1?Q?PUqvbfHiP4MdJ/UiD1XV0GurQNf9CiA8vgvU9iJMywR0joDPPlXMstcNAU?=
 =?iso-8859-1?Q?lt4ZJkHYmHoocKDlNZxF1V9Z8/3tSIHWHgi4HUGqKosnEqV8Wr/MVB9w8C?=
 =?iso-8859-1?Q?VGLZpGoN1qk8CTkCTfmGUojQLLT5wTPC43XHnk+M5hkBqb8BCaPdZtcmTs?=
 =?iso-8859-1?Q?qFQ341wRQCmXO1YcwNWixqfQu/g9MvAPubXk+2/M96c/M7plKVHOU5hve1?=
 =?iso-8859-1?Q?fL1a6w59DMsWERCBimxfEPC0/ZX/c9z3IIs9bvaB8Sh2Vd6k9RvvSWQVGj?=
 =?iso-8859-1?Q?rID4IbPxoj8Br/7XA2KtD2AmeHwsM1VZkWyut6dy9SEaPT4PyzEbhD5agk?=
 =?iso-8859-1?Q?dZoPgxHCrGVsI6idjkikVfJNgpPVNIttfj24v8orUqhEwnabFe/gxSFERf?=
 =?iso-8859-1?Q?0WBNSv1gtCU3gS4yILeBqX67zUluUVvpKMsBv6qHI5s7VdtL/42K4Dwdkj?=
 =?iso-8859-1?Q?Dyeb2Uiy13qGH6HG6rh5xqWAPJyxspY4tvQpHP1/LN1+DD3p2vSWX9Gld0?=
 =?iso-8859-1?Q?4CzsENSjB5YT5rejK1JqQEPoJUdcrBWjromEdw3ABFgpcRvnr9dIjxuibT?=
 =?iso-8859-1?Q?hJpoeP+7Si7Ajsh6hZBBqXRgqWzfaa4Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Yok3jVISFBknGPZZiI14iKVUk0igAuZOu25TBIuUU0Kf26eyNiw5cZ6/O4?=
 =?iso-8859-1?Q?j0kkO5NTMd//hUPG+bhHbfkQbJbd+krO/3jQrIBjRE6voH/zpQFgN4tf/b?=
 =?iso-8859-1?Q?G8SoHqP39E/mElQYrYlEYxgR2V9LgOd96HKajXL4MItHvyZ91zI7WEw0V+?=
 =?iso-8859-1?Q?brPbuDqhUvYSbp5nBjcI/0SwwIA3mI++EUOJtW9uScOy/s4m4+KwhbOnMQ?=
 =?iso-8859-1?Q?u3LApZCw+zsnL27wv6mCCKT8xuLimaBPgl9aGa/6ASLwq/PH1vNf2sd7QR?=
 =?iso-8859-1?Q?YN03j0BgPY/PKuxvyameR2iJP9DDnFCjTbojp3ax8sZj7sAaaZDI9DORnB?=
 =?iso-8859-1?Q?W4bTtvUuSNG46Hi+yy8ytu+Cez+5qH5rI+fisBMtmPaG3GrnPpkzaGYDaK?=
 =?iso-8859-1?Q?Rqml5weHvmt97GT2g24OZJ9HttyucbH/WVJswpnA8gNVt9rFdPVAoAvxwZ?=
 =?iso-8859-1?Q?ry1kj/uwBT3eOFbiJ5sLT1Cd/lDGqyDnheoF9PGzSDYkIoq3bo0D3Qa95F?=
 =?iso-8859-1?Q?OjuoP8YzCSKY1XkZPjLeqhnD0UjFzehCaWQfQiO6fuFNA3ZDippgeAelR8?=
 =?iso-8859-1?Q?SZOWazmZtt6GQXlEHlkEDqDZMzJGao5TLPjJRnVA/gBD5y7z8BRJMGtkWo?=
 =?iso-8859-1?Q?raakeqyEcXpYWdw5d9VwBSGOKdAKh2MY2ns4OB48F7vcc/JUeruA3drzaB?=
 =?iso-8859-1?Q?sxHZoz/2wye0nyZxFyf37kzCIFOTBJv6Sm71V4P5bE6IdPMPgX+kzBulhm?=
 =?iso-8859-1?Q?FegHSV0M/It8nVHikM88l69kpafNNpNaR7kbkHZTBV4oTtXFN7LjHBr5OI?=
 =?iso-8859-1?Q?9j95pOCYio5NbGHGJtehlCQJBUEBOjzMsg+iwF00K0/e3QixoaDqMHkOwc?=
 =?iso-8859-1?Q?RD61Job44y5S/x1PK0sA+XCcBsTO4G+HStkUdZl3N3BAuMd9UJPFlbsy/M?=
 =?iso-8859-1?Q?MDxc9e04IUZBc6S1RWNlL+e9yzM61iIPMM960/ODrDq3NSNOroZG5Wv888?=
 =?iso-8859-1?Q?Oz2E2TqP4FxKvHU7FF4Im15lLLS9l+OanShZDOJiMjb3xJuwEALEs2Fol4?=
 =?iso-8859-1?Q?sDvdHvsOFO/rK2SL4Zm9moXl4x/EBagsqZI7W74ou14mhWg+bcOSPWuTDQ?=
 =?iso-8859-1?Q?6XMsaYFypglmRne7RTTr0B0vsR/K7CR6IO2DtACMrcGXHqO6dC22rLGnJs?=
 =?iso-8859-1?Q?uqV25NnLO7ual7+zvM7jKWWGkSgeyLGnjKIZm/Mo1i4RhTlKaClexJ1zzC?=
 =?iso-8859-1?Q?PQSyaYM+h+VlynzNA0QusDsczHkFsHn7mTqGmjdb3hrjD2W8vQpPlEsVIQ?=
 =?iso-8859-1?Q?DvOJuEQWHkp0wOIdk32+5AKLd4douzkRkGISCe//fX8dkB+1iJx+OZpgLJ?=
 =?iso-8859-1?Q?e/akG+gNFllAaUxUf25Q4ziviBtzKCiuulLQoVZGsmbs3vx+hyxbRXUNwW?=
 =?iso-8859-1?Q?TozoXtvD1buc+5pbgjty5Ggg27B4Jm2wO0Esu6rJUMKg1gLMfVdKbFWmTo?=
 =?iso-8859-1?Q?O84jz/3VTkWUb3Lo+fE/3p4gP0idgSD57Y0hOnaFOgTMHE65SWQgjKH42C?=
 =?iso-8859-1?Q?X9V1eePDTBhGZfWvwk44Aqmc0LADVfVuWAY4Du5KWrzg9zot84HcG0uSGn?=
 =?iso-8859-1?Q?Ix4+tf+e5ksSAmIkNhzh8gyG1T/WUpVw2o9kEUhMRckoPDF9NQ2ZVnsg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618815ed-2ac5-4f3a-2c97-08dce7e159ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 21:37:04.1698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNAUN93JFAUZ5MnEFdixIbTBU6lNElYU++eFk8FnTtPRHjHRSyJgZjDmrwsi6iGti+BEyzHMGTJD/6OTG9OVrIFmwLxX62yvbZhdg/TEyIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8108
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; Alex Deucher <alexander.deucher@amd.com>; Christian=
 K=F6nig <christian.koenig@amd.com>; Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH v3 08/12] drm/amdgpu: Suspend and resume internal clients w=
ith client helpers
>=20
> Replace calls to drm_fb_helper_set_suspend_unlocked() with calls
> to the client functions drm_client_dev_suspend() and
> drm_client_dev_resume(). Any registered in-kernel client will now
> receive suspend and resume events.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

LGTM, though perhaps it's not my place to say this is okay.

I'd wait for an expert on the amdgpu to respond first before
jumping to push.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index fd853dc843e9..9c40d620a658 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -37,8 +37,8 @@
> =20
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <linux/device.h>
> @@ -4711,13 +4711,13 @@ int amdgpu_device_prepare(struct drm_device *dev)
>   * amdgpu_device_suspend - initiate device suspend
>   *
>   * @dev: drm dev pointer
> - * @fbcon : notify the fbdev of suspend
> + * @notify_clients: notify in-kernel DRM clients
>   *
>   * Puts the hw in the suspend state (all asics).
>   * Returns 0 for success or an error on failure.
>   * Called at driver suspend.
>   */
> -int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
> +int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  {
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	int r =3D 0;
> @@ -4737,8 +4737,8 @@ int amdgpu_device_suspend(struct drm_device *dev, b=
ool fbcon)
>  	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
>  		DRM_WARN("smart shift update failed\n");
> =20
> -	if (fbcon)
> -		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true)=
;
> +	if (notify_clients)
> +		drm_client_dev_suspend(adev_to_drm(adev), false);
> =20
>  	cancel_delayed_work_sync(&adev->delayed_init_work);
> =20
> @@ -4773,13 +4773,13 @@ int amdgpu_device_suspend(struct drm_device *dev,=
 bool fbcon)
>   * amdgpu_device_resume - initiate device resume
>   *
>   * @dev: drm dev pointer
> - * @fbcon : notify the fbdev of resume
> + * @notify_clients: notify in-kernel DRM clients
>   *
>   * Bring the hw back to operating state (all asics).
>   * Returns 0 for success or an error on failure.
>   * Called at driver resume.
>   */
> -int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
> +int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  {
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	int r =3D 0;
> @@ -4835,8 +4835,8 @@ int amdgpu_device_resume(struct drm_device *dev, bo=
ol fbcon)
>  	/* Make sure IB tests flushed */
>  	flush_delayed_work(&adev->delayed_init_work);
> =20
> -	if (fbcon)
> -		drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false=
);
> +	if (notify_clients)
> +		drm_client_dev_resume(adev_to_drm(adev), false);
> =20
>  	amdgpu_ras_resume(adev);
> =20
> @@ -5448,7 +5448,7 @@ int amdgpu_do_asic_reset(struct list_head *device_l=
ist_handle,
>  				if (r)
>  					goto out;
> =20
> -				drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper,=
 false);
> +				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
> =20
>  				/*
>  				 * The GPU enters bad state once faulty pages
> @@ -5734,7 +5734,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>  		 */
>  		amdgpu_unregister_gpu_instance(tmp_adev);
> =20
> -		drm_fb_helper_set_suspend_unlocked(adev_to_drm(tmp_adev)->fb_helper, t=
rue);
> +		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
> =20
>  		/* disable ras on ALL IPs */
>  		if (!need_emergency_restart &&
> --=20
> 2.46.0
>=20
>=20
