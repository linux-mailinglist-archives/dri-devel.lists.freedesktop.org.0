Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AB89294E5
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 19:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5687910E025;
	Sat,  6 Jul 2024 17:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALLbDi/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE110E025
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2024 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720287098; x=1751823098;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wCI3I954YLWr/f2XAZXtXDQlo9jZrPiR7S7OMCtGvnU=;
 b=ALLbDi/LUz5vtlBf5PKuyTyAjM6SJBz2iy89NpXwSqYj3beDu3EIcAgK
 ulPKA+h5RXMnb9l/bN5D/LGS7z/Wv2x0InflMGQYDi87a6Y3RYF6RGpw0
 EV7GoS1rzf5p4+I9SkIf5UTMXfpTeK4hD2huk9JLdSbBETjBA4fS5kjeN
 /6R+8r5EwprVd99gBDIg8Ij/S3oAyFkj2x/9Ze5DrcNYm72UvURFkWU9L
 9JJPzXUAEGIcj9oTGLiEzN61ItpuvwcGVXRgEmukMu4+NRIB6L543qOA8
 nFMqy5g71ONGQLTpaotr2R2LKFF8VP4UMuHGLImaAkuUZRmT54TcDawA9 w==;
X-CSE-ConnectionGUID: dp/NPSFQRbSIaHWnzitBfQ==
X-CSE-MsgGUID: WSgGM6b7Q9aspylCV6SLQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17256439"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="17256439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 10:31:38 -0700
X-CSE-ConnectionGUID: wn3ofGMuRTiCEVIog/AWlw==
X-CSE-MsgGUID: xpxF2mxlTYG/w8ttseoA3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="47541036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jul 2024 10:31:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 6 Jul 2024 10:31:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 6 Jul 2024 10:31:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 6 Jul 2024 10:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1pO3/HH+8uHxNXfbg22N9yOl/2vhPzdQLVJLybX23MPT5zGwIVXD/oChkyeYzqFViwPBO0w0UzRtLsskS20S9YPDJTbkBuSc2oyFFF8Z+ncXtNGKOGfEhKsOXEFXwt8LTbwZJ/y6OmxLt6C8iKNakHVo1Eck0/AugkIZO5w7Ch/CcJCrxHHqurP/S5wOkMrvYVdVA3bG1YPkUpvVStYsNsRkwdy9U8rJhH1hzCFDaET3YOoE5kP2vNOlSij1tAo9bq8ORxZqlkiQVAOcVE/kUf5fdPZnWhCN0LOnF8H674bxESwQ19ZSYyiL5UCx8fvU2iIYF27xs8UBDdJbjWIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCI3I954YLWr/f2XAZXtXDQlo9jZrPiR7S7OMCtGvnU=;
 b=VUYh4aATSH7owHhENp3FPNnGCs/PuP1KsNSjIT0VyosILJgPZ5dbHHshM44nORIO+ULuafidcVG7lf3/OGI5iK1oOB+47tjz9oMg+ClpELq6heXLbVAZH5X/YymGYt6RvJntVPMnnFMEW4Oz3PS66PmjiiP+kYzmXN83B4hfiSSx6l/aWVKUe6bKLcwCSPALB41K1lIsGw4kVtY9aq5Xko+0kZNlWo2stjmH1ehZYP+VIa0z4NqudqDb18iTLX5bIqFkjqdjWYg5apmOjtPaR9LrahPLUNt+RJZqygZPsYoMo/9XIF7qtOv3UrRDqpkMrKWmF9468YtmTWSeKsmqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB5808.namprd11.prod.outlook.com (2603:10b6:510:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Sat, 6 Jul
 2024 17:31:29 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7741.029; Sat, 6 Jul 2024
 17:31:29 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Josh Simonot <jsimonot@live.ca>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: virtio_gpu_cmd_resource_flush
Thread-Topic: virtio_gpu_cmd_resource_flush
Thread-Index: AQHazMZcnNAp4heC1U+vtLtmW636ALHlCRMtgAOwx/A=
Date: Sat, 6 Jul 2024 17:31:29 +0000
Message-ID: <IA0PR11MB71856F2BCA9AD5EB8E01A129F8D82@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <DM6PR02MB4283EC97FB486C9E9357D3F0C7DC2@DM6PR02MB4283.namprd02.prod.outlook.com>
 <DM6PR02MB4283010B4A4CE521B1050042C7DD2@DM6PR02MB4283.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB4283010B4A4CE521B1050042C7DD2@DM6PR02MB4283.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB5808:EE_
x-ms-office365-filtering-correlation-id: 5c400cba-46e2-4430-9bea-08dc9de1786f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ldo9aHwUf1FGn2jCcDq2LlcIXJr+ds9YMHjVpSZfFzM25NvcrfFnQ0j2vO?=
 =?iso-8859-1?Q?TJKlg62H1F5XqzBzrqaczeVCFXwec4Z455uC4NxQd39s4HNobZtvV4aJfr?=
 =?iso-8859-1?Q?LMgXeZH1ghBo2QLVHncn7vulZviuZqB3BIXhVuFQgL7rKos2NfpGP+UHtL?=
 =?iso-8859-1?Q?23CQbjoPCCFx9nm5JnEgaQ+aD3M047aLNRGKtndl7QnTQ1ASAVrNTjqGWq?=
 =?iso-8859-1?Q?zQ8HpEwFJyQmyBPTaheTcvXiwO9XLnOXL/3s7CfPxFhnmXlN688q3iBK6g?=
 =?iso-8859-1?Q?GtOGmPANO8Zwv8BPott0cwAXIJ7WbZzJOggOueGVnE5BuddWRtrxCWoYfc?=
 =?iso-8859-1?Q?KZCDZLob5aXPyWJm28/17yL/0p1PPRltvg1VNll6aLj/OTtZMTA3mpVEhR?=
 =?iso-8859-1?Q?F/xtpcu2eLZm9rAW6dAMXVar/3LCcy/IbcPVL2C2Vgb48bn8V4bnqCt0RG?=
 =?iso-8859-1?Q?3EVD7JMNIgZk0QSeV93cL2om6w5XXxRXC5bHuOeVGDrzVDKlsRLQ687fnv?=
 =?iso-8859-1?Q?Wq5Jd9qd4zPBUUDb0VNUN1g9VC71X4pgk0wltMRzMdVaDXDwIccg2BK2M/?=
 =?iso-8859-1?Q?WI0YStOa+N18UDOOwzrWIMHyb7Pza3ve3eU4ZQ1qsGwCEdUE5GqEsQxXBa?=
 =?iso-8859-1?Q?KWv5d4Xqb2cxmxhYTQu4DahiTEtXZdMrt9EuhtgF0MOy7hgAJsqSSXbVBx?=
 =?iso-8859-1?Q?OmhhusapmEPgkDiJj5xN2UZTsfj0wZnUM9LHw7IsMeqBTcDDKK1ptgmoxh?=
 =?iso-8859-1?Q?2wuOw0AMFrR9MvSYe5UhoS4a8Nj6oS7SxmvsFhPgVmx1Svx5rTBa/e6TG+?=
 =?iso-8859-1?Q?MG4TPUzUG1ESsnlHVrObpdxbOPHwJybGXkOzmrRe08+yJ3Ch45N9M0/Adh?=
 =?iso-8859-1?Q?8nehJcU5HbNX3ZZmLnjNRTk8qzk+dUbvN+4a6e36o/5FjnC7LzoFL9ZDyn?=
 =?iso-8859-1?Q?Er0wEEhZrz6sLcgMoHIsYvyiN1m9ZE3Muv/q3uMZG0FBOr7k1iT4sZEcqS?=
 =?iso-8859-1?Q?h6NEUVIpj/OT+U/TKFkJA2wynW6jQ8oNiZYA0myDoAvTK/pivMEhpe+cbA?=
 =?iso-8859-1?Q?2mqUR6CWUVTTa1ZN//cCSj/SwdOYveEMOfJOgOT8ZJ1pp+0lHRxkZ47vib?=
 =?iso-8859-1?Q?lLQOBpnI/SjcwRQ77PCletLJnCp/2GDVE7OYKATFAnU8TydpA6ALge/3o8?=
 =?iso-8859-1?Q?hQbdwUSpZ8Je0Ck5sWCLL1/G7jx0DapK6P6HXtnG1heVau362ciLmemSkR?=
 =?iso-8859-1?Q?W5dZLgkTxHAj9E2JZZR9CXNQ3Zi++QL+DYKCsuPskkH/UJyzvpKNkqWbyU?=
 =?iso-8859-1?Q?BR46L0XSjmG3HG1bGZQwEgzxK6sv6/QV+iUjrjUpiZL5XDdCarL14TnEMg?=
 =?iso-8859-1?Q?AknJthPlHM9P10Vh2bum4NM/juO8HaF2jBvBMyFP591le1NoAKs59ByUWw?=
 =?iso-8859-1?Q?Z1G+HydPJJy0FEyrjVHxc6TTtXck47TFwxqeJA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XtEM7wnyqbPvEPMehqT/Z7GDy4pADcWWZ3r1faEDgWa/dRSqdTGsoDOkK7?=
 =?iso-8859-1?Q?thDPQ+zSwqnPB4e2gWHTS5cyb0CIp70mYuaZDbwBpgElWAMPgwi5KM89ud?=
 =?iso-8859-1?Q?aSBnawjmb7laizq5arHd+y17Qp0tx4k1FEhzNha+P0XVEr+6A8PU0KreCu?=
 =?iso-8859-1?Q?Xu5h2zJGjZKCIvYMm0GxT3xQG2QDwcBB9i7e7iVwq2LgI1N6OiVAxadw0g?=
 =?iso-8859-1?Q?aOofJMSNF22Y/uKQ/i2ZZa329TVoWySO9xzFNj1m3xs8wAmEaXiWisXzlz?=
 =?iso-8859-1?Q?FyuHKb2M9gK06x4TIJ7GnBR5k7BDN2zydoJXIxRK/HH6rWFSVHxw3QO4O7?=
 =?iso-8859-1?Q?1Lz3QpZLunJmR+8JODQs9L56bJBhrmSS/9J2NPenzcNgLiNoJQXUSuX0I3?=
 =?iso-8859-1?Q?KamtVlzfbkHzzv8U7kWLqNWE3X2ZWbZloKcoVqEtyYyYrWCndFDEYda960?=
 =?iso-8859-1?Q?LKgY/JdOyNJINpP2KD2gAYjmVLlM0kss+MDwBq7pzf4qRngeqtEUkQ7hRZ?=
 =?iso-8859-1?Q?hb2IrvI3fqX8ZS89qxWwvwGQks9rc7m83/W71Y7WeC31D4VnyEhPaUkx7s?=
 =?iso-8859-1?Q?BAobrnOjEWPf0WJ43NXN+BXWiLPnFHOM8z/8eD1a9DaO4I3vnCf/yIdVgv?=
 =?iso-8859-1?Q?ds1qQQxDCtEhUr11jX7y8b9iBwv1NyY/dFqAkRheuLa1ndI2wRFiIrWnG5?=
 =?iso-8859-1?Q?bMlWChGrwaQ8AiSM9xOEQsbx2C/enkV0KCiQ9vafQB+FJilfwPXsZnGsYy?=
 =?iso-8859-1?Q?6fIsI4BJZ06UwKneO2Lc50nZp+M89ZmMN1IwuxuNCTnCZM3GRBKJj8Cp8V?=
 =?iso-8859-1?Q?yIg+2yjTR9XttWZ3ra+UOxZCuwHMV+Bs2FPtuF/7kI0rz1kgnmHKl5qUQv?=
 =?iso-8859-1?Q?oO0OfUqrR70c/kzFxy5sqyXuYY0Oz4kp37TvpwuozVFYu21lTSLkSNA6ps?=
 =?iso-8859-1?Q?6BUtCsoSRXlDehUFz7HnIPRc2T5vYhUy+ssxxQWgcvBa4Xxo2r/gkFAKUt?=
 =?iso-8859-1?Q?W/LJVBS+ulNEIm07wZ5nT+v3SXVvbcHiQGRULh32RydIoNKLdWlmQbAwYR?=
 =?iso-8859-1?Q?Gvc78R6OspBkJlyMpDGUNYmAI1q1o2OT1aLIn3WvA+M4OqZnNz2CJeZNS9?=
 =?iso-8859-1?Q?ZIiblhmoUZ3aAj5zmgKBv0CJUiGvfTmOQYP89pd3iDPXfKpiu3EH6AY/Dx?=
 =?iso-8859-1?Q?8bDgj6BfXTGkh6T6V5Uj/pRMZhvBfaSaQKNWk0c8qA/Nl/jGq+OUryaPed?=
 =?iso-8859-1?Q?BoaKXs0+lYwInNmeTtSz0mKvG+mfjZ+GsWBc/dSg3ceO6fcGgfZSYGjMTb?=
 =?iso-8859-1?Q?NEpMof2yux9R9IrVlMrodFGYx5pYjDe2kF8oV1OZcLnmt/tlS1ldKi2njG?=
 =?iso-8859-1?Q?LM/INqI2HK6f9zcu78zegEHI57abFUXaG8H+EiKRoM5k5Q83wQpy0lJM6y?=
 =?iso-8859-1?Q?ZnJ+1OLcH/Mspz53OcAXQLsIGSLuHRf9pgbz80wy7f67aSLZ9MR1Y1GG1r?=
 =?iso-8859-1?Q?QQ8i61+7U+wO0Rp2r9QZuVYLxuO57iMUpEhXInhdI7wSfvHk5dMsi48lf0?=
 =?iso-8859-1?Q?+4FTOGGnjj69heqzYel7JFxYN4f2fTc/o8YB5BpbjqLWnvXeKqybwTAoen?=
 =?iso-8859-1?Q?QSO9P1KV84Z8BRwNoPgPY2pDZy6BhjoyfT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c400cba-46e2-4430-9bea-08dc9de1786f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2024 17:31:29.3155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJrZyign7cG1X0Ip6ZyDpImffHsaTQ35ds9+y4w+7Hv7g+oQYNkKgIj6RtB9NokHNKXZV6Uue7jgQIx0hvdCXRVvsum07vLNC6xIF7/0+Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5808
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

Hi Josh,

> It looks like the virtio-gpu flush should be fenced, but on the host side=
 the
> received flush cmd doesn't have the fence flag set, and no fence_id.=A0 S=
o,
> I have to reply right away instead of waiting for scanout to complete.
> Is that expected?=A0 then what's the right way to vsync the guest?
You have not described how you are rendering the frame in the Guest; are yo=
u
using Virgl or software renderer (llvmpipe?) or any other mechanism?
Regardless, a fence is added to virtio-gpu resource_flush only for Guest
blobs (i.e, when blob=3Dtrue and the scanout buffer is allocated by the Gue=
st)
at the moment. And, with Qemu GTK UI, the guest updates are synchronized
with GTK's draw (Xorg based compositors) or render events (Wayland composit=
ors),
which align with Host's vsync event.

All of the above only happens when launching the VM with blob=3Dtrue (zero-=
copy)
to prevent the Host and Guest from using Guest's scanout buffer at the same=
 time.
For blob=3Dfalse, since a copy of the scanout buffer is made on the Host du=
ring
virtio_gpu_cmd_transfer_to_host_2d (into a pixman image), it did not make
sense to add a fence to synchronize access.

> At the moment, I'm queueing up the resources for scanout, but guest is
> flushing faster than host vsync.=A0 I briefly looked at qemu implementati=
on,
> but don't understand it yet.=A0 A high level breakdown of what should be
> happening would be extremely helpful!
With Qemu GTK UI, the pipeline is blocked (renderer_blocked=3Dtrue) after
resource_flush and the response to the Guest is deferred (the cmd is put
on a fenceq) until the GPU Blit (from the scanout buffer to a Host allocate=
d
EGL backbuffer) is complete. This Blit itself is tracked with a EGL Sync ob=
ject
(or a fence derived from it) and once the Blit is complete (which indicates=
 that
the Host is done and the EGL fence is signaled), the pipeline is unblocked =
and
the response to resource_flush is sent to the Guest. This response includes
the fence_id that the Guest embedded in resource_flush.

If virgl=3Dtrue (which means blob=3Dfalse at the moment), then things work =
very
differently. AFAIU, the backing for most resources including the scanout ar=
e
allocated on the Host in this case.

On a different note, please use text instead of HTML when sending emails to
mailing lists.

Thanks,
Vivek

> Thanks,
> Josh

