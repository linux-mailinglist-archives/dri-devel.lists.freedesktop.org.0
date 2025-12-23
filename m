Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BBCDA113
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 18:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B1610E283;
	Tue, 23 Dec 2025 17:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrHi6D1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484A10E263;
 Tue, 23 Dec 2025 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766510053; x=1798046053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VlBe5rXo0BI9ZDmJ7e4Zj2xRLrq1xOHD6Gv2R93wslI=;
 b=VrHi6D1H79ZphVlyieMufQRvDCiaQIMER+0tRvIHU0ZA6RXXvx9SuMRR
 T/Yay+66GfW339PDRrO+kfkJoQ15igTH3TloS6TTOUUahxMwuKa6ppL/e
 bc4e0xOVL3A0vt2I4DkgRqFbqqqzfcrW0U/56L8VrXX963hdMnVZuS2xm
 Z80rl2Hjo4Ngx9FbNszZVA/LJImHmSrE5fIO4Pk+1HvY/4RPHJCl/kk+3
 wmqwDsqKQnTn9C0GApQ9sumcoy+O6sUl3RP2ma7ERJ707A1ayxXxNE7wF
 +EDu9AEDuQA5/sw6QEvgSlA4jNxh+1Lo1q61vBcs468IgUWKonrhdCVK9 A==;
X-CSE-ConnectionGUID: eeXg7pImRY2S+FK+yD9Zmg==
X-CSE-MsgGUID: neYC5B9UQ5C9Q+/NQjyu0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79476373"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="79476373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 09:14:12 -0800
X-CSE-ConnectionGUID: HG0ClaUIRHiDssQeoN5eUw==
X-CSE-MsgGUID: EqrYVhdpR0aY+li3Lf2zbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199485671"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 09:14:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 09:14:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 09:14:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 09:14:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyluYCzZRGOXkU0wUfekFCKteTE1NkJ40Kfp1MZBpTI/TDYHtpyw717RtyJmv+IZN7gM3JZKckxWCuB8iRZAgGwyThcD/DvvFkiA6xFNPTIUwuepHrV79KMhdiJPk7S4wnrYN22bg/dhY2xt5Z5USo0ee7d8/ifPknvoA26QRbZ7wuNLJeeIabXe/g8CkBaMxZcH/Qi1EdM585qM/tBncJB/IzCTEYUjY5NcX3ngWn5/+OBsMprXUEz2oRpFMJjuPNotX/8A/6KW2Wy5o9uEuEn1TyElc6neYIqS/I6+wkZPnMiDAaD7Nl72bMroXWF1Em5SmAf4HpKPl/fg7qQy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/fpF3AQ5Mz7cMITl8ZgFx/md9FN2ifpFHNamdcUfGE=;
 b=NE6Lmt5z0p/JgWCrJhNjFmK41Qbw15lgGapeHyIwnofH77wFvYche+YzaYeUF1bt7AQiS7Z4DXnnA7XBz1zsYJX4mH7RI3+3m57rnoz7OKxP23beXrO3fyqqHyQeDMkIbILebUcER3KScWdrTXOEDN+jbXyLZXsDT21BXxZhGZs0kc2iwMPpdN0D6xIxabt4UM+Q5O9gaXC77c2k0PiV+k4ajLJ+atVT2Fx1udRkuRpPbMNL8KpMxmmWrwKKzsqwXgeaYHyojT0QCHSbMMbYnyas2V1fFqwVwU0iZv5A0b6Jx9u4XbVnMUw1oSLmf/PHkDlmCw0kacFfGoZSgoqb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 17:14:07 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 17:14:07 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
Thread-Topic: [RESEND 1/1] drm/buddy: release free_trees array on buddy mm
 teardown
Thread-Index: AQHccR5Seq9sFNfVX0KHf/eqmloKobUpa9/QgAVvVgCAAJ+uUA==
Date: Tue, 23 Dec 2025 17:14:07 +0000
Message-ID: <DM4PR11MB54566AB6CC2BAF55B1CBB8D5EAB5A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251219193237.1454565-1-michal.grzelak@intel.com>
 <DM4PR11MB54560DF369537BCE07175297EAA9A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <771e8879-4122-8bea-826f-97f9f75932d8@intel.com>
In-Reply-To: <771e8879-4122-8bea-826f-97f9f75932d8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB8270:EE_
x-ms-office365-filtering-correlation-id: b628f29e-3999-41b8-b2d4-08de4246ae67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?ZIjO7kH49w0/ZKs5Vy0lQhTEurJb4Ir1weGmGKxSELI3SIR7a2Fh/ucwCn?=
 =?iso-8859-2?Q?I7B42hDPWryupi4jnRpjGrIKQUmSbDoSPC+YZo95gJBGaZcMnUYjE/bft7?=
 =?iso-8859-2?Q?y1/cpdhwV3KT7EWcd88PaVDu4KI5myyv9d0twSrSikFQt9Llp88OOx2wgt?=
 =?iso-8859-2?Q?fltyCSJz/8ywzAWI2nCr7uRn/IzDCh8iqr9+qFF1FbcdIs8ObW0xSJIcn3?=
 =?iso-8859-2?Q?d8VLKcN38qxGCulL5chIGnxqPC6bI7JLU/9z+8tStlDLTK6BL8+66ViDKD?=
 =?iso-8859-2?Q?cNrG6+cgjCR58cGm1L09aUjIQqM/Soz+x260+OSuTGgPYG+3csayrUQvI9?=
 =?iso-8859-2?Q?e7xyklsCUSic5VgPgS6q/Nn2P0YFgsciSeeyHhaOTjw3UXnnbO21HQdGZ/?=
 =?iso-8859-2?Q?jdxnlYIIJQc8wn2g4x6Kp2GOcDyuiR33Xcy9rIbe5dueho0Gvzq8yQV1QG?=
 =?iso-8859-2?Q?KfyT9Q5oZcCkEODs/1w7MpxLu9vmTv/bQwKujpFmvKxZyAg/GtjnOh/Yu9?=
 =?iso-8859-2?Q?lDhZ/LJ2+8rMZJY/fd27f3idAPR0W3FIzXK+6WZ2Nr9Jr3vdylCVPDeYvt?=
 =?iso-8859-2?Q?+ENiryHsKDTO3MyposBEhO/mwpQPR7Q932ciyIhCbr5A9lCYJIunKZtq7j?=
 =?iso-8859-2?Q?7mFct7RIPxac8zwHdezywDeIkq5ZzzzSi7quKD4K6nNi8+Rh7CNhh4eo8C?=
 =?iso-8859-2?Q?JqHKEdK1Yzg9xNmo7611S/Cm+GRLolJE4X3M7a0ab0lJCWb8XA2vp232rl?=
 =?iso-8859-2?Q?7vq6W6qeEi0zRAm4Ns1xyasz9IrRqFq6VSFTAbw+94YD9eSHKGSsx5uj/A?=
 =?iso-8859-2?Q?VZBYocRt3TnoNvirWgVYA1FwXa2Ze0xnfmhFmd6yuCZOP7J0WTFVD3jGwG?=
 =?iso-8859-2?Q?dWsAUT5TXslVW2m/P3aEr8iR3VofrXOqBQOgyXfrmt0lM6XEHDs6pvZzmp?=
 =?iso-8859-2?Q?QJbc5w4pzJP89XrnM/pcPiO7LvwZ8HbOT0M4a4mKkX8VHDIFi1EZuvVIn3?=
 =?iso-8859-2?Q?qR42WKdsp99ig5o0e6VEUvuRo9JXQOPkx+K56wWAi6gOu8iNk+bFc4t2Dn?=
 =?iso-8859-2?Q?lJOCBufAtFLkEMg+tc1LAaMKiSm8g7ezXazl8O05a5BzDBKw94PiHPOgi/?=
 =?iso-8859-2?Q?yGf4Sin0PqjE8BvUEV6poILcm+MkVE4UX/0Q9qWxP/ATgCDV1liqqOa6Kh?=
 =?iso-8859-2?Q?kH693WZmWvS8UltQ1UZJ9cZZUgCIoVmEK9ETyx4cqM7AokAHa2DX/8Qo3c?=
 =?iso-8859-2?Q?tIXiFz119uQgn5l97wKITQ9vkaV3673pS3cukSTz3KH4Lh/o6N+h4Dp24Y?=
 =?iso-8859-2?Q?g73vQdnwxrixeAzoDkIr0ojMfN2O1LkCWUbFoer6FsGZ42M+f6vJbbCTg0?=
 =?iso-8859-2?Q?Byk/LzCd3dJpPGgltwYF2bjLDwQtaFIXg3qhC0dAL3rjOUfq18EadPXAzu?=
 =?iso-8859-2?Q?o+n+CvuhUzBt+zz/Bz5yl1txQuGWDXjRUSICW0U3uBe+bOvx27TegB/lV2?=
 =?iso-8859-2?Q?3PJ13RKSutm718Zj/kqt7YPUCOVr56KhzsD1vMBIAoc4EtQeY6S67R/mbu?=
 =?iso-8859-2?Q?sA+J/Uc9MgjZWAW2PLKKjNzm5OG1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?X245SYKvcHyDZhFT8Fw3R2MGnn1SN5oGZKyt2D2gU8Dl3AFzHE5xDPfLom?=
 =?iso-8859-2?Q?IOTE+t92YhUTCNckVjThwfBPHfzaLzC7124t03ivZoj2GriG48RgV+VuAJ?=
 =?iso-8859-2?Q?wIjAV/OPaB/1sZUr0qnRXzad/RZCjvjHx0xZ5RI2PlR/W91glTQO8UuJPY?=
 =?iso-8859-2?Q?oHKPsvseEFdd3A1q4OE0kNHtwloz3a5PZthPiLgxIhWDSXnoHUMVzCPoXZ?=
 =?iso-8859-2?Q?a+syeFuucJ/3nTwUUndqju76pYU/54Q8glbnTX8fagiMaekwxsErX9yg7l?=
 =?iso-8859-2?Q?mB1xE514Mr+Nta2m5QQiJ1OHei1wxL0qFKelLlaVmshVAaBzBkOApDVT2F?=
 =?iso-8859-2?Q?SEdKfEs/K64U3zp/gP8GRD1sEixu1yTPpYnT6KIMmKtpcJkl/UfjPEbN7y?=
 =?iso-8859-2?Q?MJN7SpJeYwCrfP8DfELeBW+IC6GWZ8WV/Jw4pVmQGcjz2cISXDdDlVDqGA?=
 =?iso-8859-2?Q?VXTjirKwrXUtRqJMq/Y+ggQQS1N6sefBHc2t350qgj6AOnUcAp/W+SUcbP?=
 =?iso-8859-2?Q?MYRS+OP+W6ej0wtmGwQacOfCoPlgKS+pOTUO2AHq0JCW2mBi0NH4IunF+s?=
 =?iso-8859-2?Q?a5rVemc97q8h+WvssyzlNjylYik8iwQLDp/HFKrW7Ly3UDFEYuuY6m2C8Q?=
 =?iso-8859-2?Q?27Hon9+YQxbzU/Z03IJ5E0j3BO0Zp5Q2kJlEbv8ikEIhanRxHNm5lFLKuD?=
 =?iso-8859-2?Q?h7RnKMKvXlusGDr+SKYVFWXjC3mGJM58ly/+PuLSkC0ap1R5TPpi/HYjob?=
 =?iso-8859-2?Q?VSzAaZL3lLBlLcUJzc1Knni0suS1aVf1o8Iyd4yiOEMCKRW/lF93eZz9KR?=
 =?iso-8859-2?Q?adwJ3XsLLBa8VULRTIRASkFRDLRxrCMH0qtgSMYU5XaFFLZFXy4nTIUQzy?=
 =?iso-8859-2?Q?axP16Rq4p1Zfx6r/G/ChegKgPj451niSLIPBQFry+oMlHWT04dyuyb0Icv?=
 =?iso-8859-2?Q?vX+39qjzDvnO3l0AAnHoywsVRHrL7puNald8DdLcwnvn5/VIQM8x0v2gYI?=
 =?iso-8859-2?Q?lKX+iz988EMNyeLxN8IwWgmiepWsKeecQMlUTJZXc2FgNgpzQYqdyUTN+G?=
 =?iso-8859-2?Q?7hb99rASDmBtleclfUyvoqeT8evpNPJvws5jEnbVLEK/92fEjpMs2xKLb1?=
 =?iso-8859-2?Q?G4ziAIie9HLW0hrUEALDoorbn6o4l4MMZp02NH4im/Pxw1L+0woB1Nw31e?=
 =?iso-8859-2?Q?2L4827ewbabhMTee6APE6C7lqE8m1O5+hfuyyb+97KtGAFWMi0fQqlseTp?=
 =?iso-8859-2?Q?SdzB8tZNrW6PszuY482p+8di4yWYcvlmpPMBHqZhmiIRej9EBZL7NLPX4J?=
 =?iso-8859-2?Q?3XN3xt9k/9//p7BMXHIxhU8NZ/DOb4Rq+wKmB7wLrZiomds1pfQOoTX/9p?=
 =?iso-8859-2?Q?Jqvq8jVea+/CTPArf6rvvh/UVjK4YbD0sD8HqzVIcnI+xvvvZO2tuHRZ96?=
 =?iso-8859-2?Q?fQIN6wXd3ceKG2BRLBQjiQOfRmtuO3WVXHmaAc8Tcjn0GNEx6zfR8leWi6?=
 =?iso-8859-2?Q?99nFiDXK3bZxAQwPUweOa67SCqHy+b754AN6MwZCngt0gxLe1CHtfLQeUG?=
 =?iso-8859-2?Q?5RbNaARWVMVDunsSp0CyKPaGtcgO/VSvvz94JIsB+LNmHaqFaqhVlF+3qS?=
 =?iso-8859-2?Q?gl94eXr6/cicDGUWo8BWT1uapwKfOVx0QUgo5i1tt1RjzKeAatnjTJyDUt?=
 =?iso-8859-2?Q?wXNCuk+7W+rfkfXs4XWohdN1eXZg9m+HfzRVvFIndfCAovCaIOBHnC54fH?=
 =?iso-8859-2?Q?5oJKR4sVHP0usCN1D5Uv7qyrkv9L1TVzRiQ3wxugz/uzvwkSbk3zNe0zMW?=
 =?iso-8859-2?Q?JHLL4AwUOg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b628f29e-3999-41b8-b2d4-08de4246ae67
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 17:14:07.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7Sk6FJUjDC5jWwICQ4lYJ8vsCaeRRzLXuTPCzkIXDy/Gx4APybdNf2xcUcnTCmxQOD8/aN8q5VrsC71ACRECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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

Hi all,
This is a patch that should be merged to drm-misc.
Could you please help review and merge it?
Thanks in advance for the support.

Best Regards
Shuicheng

On Mon, Dec 22, 2025 11:36 PM Michal Grzelak wrote:
> On Fri, 19 Dec 2025, Lin, Shuicheng wrote:
> > On Fri, Dec 19, 2025 11:33 AM Micha=B3 Grzelak wrote:
> >> During initialization of DRM buddy memory manager at drm_buddy_init,
> >> mm->free_trees array is allocated for both clear and dirty RB trees.
> >> During cleanup happening at drm_buddy_fini it is never freed, leading
> >> to following memory leaks observed on xe module load & unload cycles:
> >>
> >>     kmemleak_alloc+0x4a/0x90
> >>     __kmalloc_cache_noprof+0x488/0x800
> >>     drm_buddy_init+0xc2/0x330 [drm_buddy]
> >>     __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
> >>     xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
> >>     xe_device_probe+0x326/0x9e0 [xe]
> >>     xe_pci_probe+0x39a/0x610 [xe]
> >>     local_pci_probe+0x47/0xb0
> >>     pci_device_probe+0xf3/0x260
> >>     really_probe+0xf1/0x3c0
> >>     __driver_probe_device+0x8c/0x180
> >>     driver_probe_device+0x24/0xd0
> >>     __driver_attach+0x10f/0x220
> >>     bus_for_each_dev+0x7f/0xe0
> >>     driver_attach+0x1e/0x30
> >>     bus_add_driver+0x151/0x290
> >>
> >> Deallocate array for free trees when cleaning up buddy memory manager
> >> in the same way as if going through out_free_tree label.
> >>
> >> Fixes: d4cd665c98c1 ("drm/buddy: Separate clear and dirty free block
> >> trees")
> >> Signed-off-by: Micha=B3 Grzelak <michal.grzelak@intel.com>
> >> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> > I also meet this issue. And the fix LGTM. It has the same logic as the =
failure
> path of drm_buddy_init().
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>=20
> Thank you Shuicheng for the review and confirmation. Will update the comm=
it
> message along your R-B in next round of resend.

Maintainer will pick the R-B when do merge, so no need to resend patch that=
 just to add the R-B.

>=20
> BTW, do you have any recommendation regarding the tree via which this
> change should be merged? Asking since I don't have the commit bit to any =
of
> drm-* trees.

I think it should be merged to drm-misc.

Shuicheng

>=20
> BR,
> Micha=B3
