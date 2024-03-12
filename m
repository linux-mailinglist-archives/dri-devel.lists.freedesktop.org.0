Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F15878FBA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966A810FE6B;
	Tue, 12 Mar 2024 08:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNMC0qao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490B10F1AB;
 Tue, 12 Mar 2024 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710232239; x=1741768239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7HDnOqySBXvVMvATF96xPbrjPfU0KFmugtZ5YTLG4T0=;
 b=KNMC0qao+D8uX2XlR+f8R7seUYInKp6mw4NtUJ229aGOXpu6SW2pjJAZ
 ztKwFVcJ1NbcHOZeXP4HA7JzhloF3vxKbGjl3Q7g/PG3v7d2P89K0K+OB
 qcWRK9szZDmcOWIboFPoB/Z7sQ7f2XqbDKahiDJnQIK/PwFpVDbfeYdL4
 MYFLpBzIwzZnVEopjcthUWoU+EP8VvbJAyMo4dAJkKKeh8lkobv21Tf+8
 BsVEd1LiLyIN6y1eADEl6wdJ8MyoH8nT9GmlFZNVOrah9U5hgfU/bbFCG
 gbdasoOuqk+HZGjoLtoSzgAFPrnBezniE3YdBFo8EH6Mmw/vsIBb8riMs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15656069"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="15656069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 01:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11914738"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 01:30:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 01:30:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 01:30:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 01:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyOm9E6XSPwu+tN3tn4h5dUrrPaPJ0q+oeVc37FhuSuKZgcbcGCZK6nISWyoXqbS2ernOwHGHVziMo/fl07WTCfoGtNCdSkgZbDQzpnJNqejSqzyd67JW9/4AI4V4iEU1s77Mcp96fo8Xmy4KOsRBxm6BLIfm5Kshf2Li877kKwMTQ/OtttP9DnosRJ/dHcgFwLSFtOwzHF79st0N4ees1420mh+ULBui8Uudbz/b0T34RCC8H7/R5kTDvc7l6vmJ5yn0sUz7xqoRR8uzF+Oh40N2pUkH3gB8NI1iClnOvGqyGSaxHDlFf7vrNOXzszW8C0tufJ92STN2IdLalZO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HDnOqySBXvVMvATF96xPbrjPfU0KFmugtZ5YTLG4T0=;
 b=ZNfSbCcp7szdlH0P3mqZi/RTT2AfT/U2OwpQEpRk48/INJ5thz8fTKRJmv4llvlJQKhpAAWq1kslvwFSx2D7n7j10niRhEyF0byv1mPT/2+2dfq9zDdXjc/iulRbuXBKbygPboB1qdvbJJ5y53c8ycmw+zI9HB7sc/WGmjnCXAyLi3XtFZTI2l5TmrMbDz8A+IJn47U4eenCON6Nqtou+kp45r4WZd6p6/E2fP6Gpr8TnqPntPi+I8iie3UZhl3ngknjnbkg0sxyBjwptDi2OdrUBzwRDB7egBzE4b7hZSQYZkjlQ49PsiKLG+Yvnxx3sZMtkFJGbnirtsSDBCDDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CH3PR11MB8749.namprd11.prod.outlook.com (2603:10b6:610:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 08:30:35 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::f2d1:b0e6:5f04:5733]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::f2d1:b0e6:5f04:5733%5]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 08:30:35 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Simon Ser <contact@emersion.fr>
CC: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "G M,
 Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Thread-Topic: [RFC 0/5]  Introduce drm sharpening property
Thread-Index: AQHaXzje+hY9B6aMtUSnlRX/VsGgnrELFMOAgAFLpoCAAEeTAIAbEMyAgAAFrYCADDAggA==
Date: Tue, 12 Mar 2024 08:30:34 +0000
Message-ID: <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
In-Reply-To: <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CH3PR11MB8749:EE_
x-ms-office365-filtering-correlation-id: a63d7263-4930-45d0-5661-08dc426eb033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZrDlCO6o4cVYXxlCu2zNUz3rxQIsT7VVHms2giG67M9AX9zNdpfmM6vwT0F76xyFRhkQsUWtqhLUtzx0vfrvVVOETJgDsoYLPqxEpRQDxax+vGBAUu+o1CiiPzDbhmaIfyM+Gtuuq/2wACV+65aEHPDmIAISeb0ArCYtz//aWgtTFSe21lN6UOjk8y7eZQqRZLXbVcNk7RlZc0SFk7LdVlh8oRsoINdcDolbdg7/r1Ild11UrIJ/GKMuWDhB3c8Ba5JHyEy7/RpptyNAH4CD7kVJm1cZ+ONfg8eAXTM8vuYvDY2ySdQVQRe5VNJ3X8Vg8XmeacrdsKGQJo2AZRBaQC7MrEU/nk8VVHshhAL3v6S2UbGI8zHoHpwJe/ShKZ4Nn3OMZM9QcC3oppYDHkIZVtBvBbgAka2qnV+5MN/wSy/XxhtPM2eLeOT6lipvkFGvZq9iU+zg8gMP6X3eT/8tRcQRX2vR1+t5BfqNAmmTQnj0tLUU+bBPXAcYfC2pbWbOXng4KRX4v+4wZ4fQiInG1lzlfLgjuUKyVGLHxAgvmnWAtuNqc3J0W94la3PZIsZWRCDB2kpFJiST4saz4CsNKK2F8NUD6cPVCu4uukPJMw06byiFuEm1BuTVvVt+d0qRxijWdyHFKfTWQa75w8S6uOHqTp2Ty8T8DmyEJXLQUpS+joV21T6i8ijUTp97d51uxJT0upfIcPg5vJbYuew1sHP47kL3KGSPvZHAPcOKhd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDh4cUlTQ3BmYW8ra1hOWXVWOGdtaGdIUlhwUmVKd1VxNElHYU9iL1hKRTUv?=
 =?utf-8?B?UzZYNVEzR3JmVWpKVW5HUEx2RlM5YWtUbTQvOE81TW9ZZW9vTDluV2NqQTlK?=
 =?utf-8?B?RDlJeHJSN0w3T0dudDRaUThra3IzMHZ4MVFRbTNVOTVla3FqQkd6MnpwRjJR?=
 =?utf-8?B?WmNlS0NSNUptV1hrRmNEa3NnMUZQL0FNWnRCblIxcStrNlVWWkVFZ2todXRa?=
 =?utf-8?B?c1Q1OEZDMUVSWG5CbmNlbW96dnZVYXdKWFZRZnFETmFIQ2MxTEN1alFhMWdu?=
 =?utf-8?B?aVR5d1hDdXE3ZGpMWnJjS0lwM0h3NmdRckZTQ05rU2xsd1QzSFZFZnZlRHRJ?=
 =?utf-8?B?bWFsMVluamk0ZVdTNVNFMUQxNHBTejhkQ1IvRElEQnVDSDliM1c4MGlBaHBD?=
 =?utf-8?B?cnZuZmtqZGNsam5FeGxmM082SERMQ0ZqeGpIdFIweGtoODRtaFpoM1RSdHU1?=
 =?utf-8?B?N1ZHTk1MWExuNW1ZM1VxTVM2M0lKRnlIQ3NMcDZVWW9Ka0VHdkNmdktVS3lr?=
 =?utf-8?B?WXRoZmtNajVyRXQ0WnlEREV3bFQ2YlFqUUZXa2M0SHFwT1pGVXlGdDdUSzU5?=
 =?utf-8?B?MythTlpuRmpWSGRpN1RLRmVkdGxxVDNHR29MM2cvUGlOaGtZVTB6UzFkekRR?=
 =?utf-8?B?bEpYUlI5OHZMS0N3OEZndkhhUXdDS1NmNUI2bW1yOHZqQ3BQSlBqazlYLzg0?=
 =?utf-8?B?TlptSFdNbTZYeUlIN3dRN000Z0VZVWIxUWdXV1ViaEExRTdTWmZJU0psOExv?=
 =?utf-8?B?Y1I1K205VDRZZmJYUXRYait6czhGN1VYTFpYRkphUHJ3NUFDK25pTVZtMTVU?=
 =?utf-8?B?eUxXUmNTQWdQSDM4NFZuSmoweHVaNmZETXlkYmZEbUx0NXVnMWJjMVRwN2pC?=
 =?utf-8?B?MkZqWko2VkYzYVBwekNKZXg3SUtPL3FRQ2gyTGp3SnRncWRBOGZWT2E2dzhJ?=
 =?utf-8?B?bTFHOFhsTENKbmo3Und2cWxoeFFrK1doeXljR29uS0ZQVHZNYXlxRk9HMzJx?=
 =?utf-8?B?UkZoRzIvdnE5dmZPOFpiUisxWlFzanpUNDVBb1cranZBMEw3aFR1NmM3dUt5?=
 =?utf-8?B?ZkZ5SU4reWFxRWNiOGhtcnBGQTRMNHdLaTR1MWxQei9WZFJZblBzMkpCN3dn?=
 =?utf-8?B?dzZqK1Y2dm40c2h1VVlTZ05SM1RXbnpQU3NrcUluWjh6eGp5MDI2NGt5MDJz?=
 =?utf-8?B?MzV2UjZra2hhd0E1TjFIR0VvRUhHbytKN2dmcXVVUXh2RnZrYVcyNnZ6ajU1?=
 =?utf-8?B?K1R2WUxadWJGUzA4Ny93czlRSVMxUXVURmR1Q1pVeEV5aElTMU1KQ254Zy9u?=
 =?utf-8?B?cEY4MTg0Nm82VUp5TDdpdHdXRnFRZFBuZGdCU0JIc0NPZ2pGL3VJVXdQazFG?=
 =?utf-8?B?Znp4UkJFditlL3hGaWVCcDdTUVN2TFBNVlcrY1I2VVNYUGsyWkJjb0JpdzBX?=
 =?utf-8?B?c2J3bVFuSXJFbHJGa0gxTGhNc0YyZG1wWEpSZlJ1R1FIQVdmamxVTUtNRDFV?=
 =?utf-8?B?b1hvdkMyNFNjaVA1WjIvTTF4T2ZicFY3dXh5bEZhVUxCUngrcm9oSzJrd0lO?=
 =?utf-8?B?bXlkejFIVG83YnJobWYvaWNRbVlJODAzc0pBcnI3UEZiSTVvZ3JLQnhreVli?=
 =?utf-8?B?b2p5ZzhFYXpKd3NoNnNaUjIrdXluMHIzL21sNTlWU1BpU0pDdmhSTFpQMlV0?=
 =?utf-8?B?SXdvZUVWVGwrS0xUMjhHc0VoRzI4Y2YxdHd2SHRFY2hCajY2cFNDRVM4NFZP?=
 =?utf-8?B?bnphMVEySzAwamFId3F2V0NjVWEzem5lTjRYWjVlQkNvUC9sWWtSQytsUGlj?=
 =?utf-8?B?V1U0dEdPSTlhUnh5VkdvZ2VLZUR2blZRdWdyTnM5aEh1c1crL1NncENmMk9F?=
 =?utf-8?B?QmptRjhFZ0NvUHFNRW5iVDhHYSszK1dVOHh4bk5HVnRYclZ3ZytsY0RjUS9F?=
 =?utf-8?B?V3FNUVhxNGgzVjZSNzZ3Y3RqMFM2aDh5TTJuZlM3ay9kby9YSEhwZDd3aHZK?=
 =?utf-8?B?UVMvZ0lBdEpWc3FmdkxzVU10cWlMNVFWNXlNNndLZURVY1dacVRqdy9Ga00z?=
 =?utf-8?B?UlBBbXk3b1orcWZjamduNkl4LytmVFllVUpQUlJVMFdNc255SGw2RFhQSG9k?=
 =?utf-8?Q?E7Ej1ic9YoJoHtnDyX+BJR7Ys?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63d7263-4930-45d0-5661-08dc426eb033
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 08:30:34.9125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWSRp58qnfuuVCWVSxYxZHIEvPlCWTMy8JOASqeN5Tc0UEVQcR6wz8aeEAnu+bWqpmNFF2Kf2VYOH60uSl4jEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8749
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

VGhpcyAgS01TIHByb3BlcnR5IGlzIG5vdCBpbXBsZW1lbnRpbmcgYW55IGZvcm11bGEgYW5kIHRo
ZSB2YWx1ZXMgdGhhdCBhcmUgYmVpbmcgdXNlZCBhcmUgYmFzZWQgb24gZW1waXJpY2FsIGFuYWx5
c2lzIGFuZCBjZXJ0YWluIGV4cGVyaW1lbnRzIGRvbmUgb24gdGhlIGhhcmR3YXJlLiBUaGVzZSB2
YWx1ZXMgYXJlIGZpeGVkIGFuZCBpcyBub3QgZXhwZWN0ZWQgdG8gY2hhbmdlIGFuZCB0aGlzIGNh
biBjaGFuZ2UgZnJvbSB2ZW5kb3IgdG8gdmVuZG9yLiANClRoZSBjbGllbnQgY2FuIGNob29zZSBh
bnkgc2hhcnBuZXNzIHZhbHVlIG9uIHRoZSBzY2FsZSBhbmQgb24gdGhlIGJhc2lzIG9mIGl0IHRo
ZSBzaGFycG5lc3Mgd2lsbCBiZSBzZXQuIFRoZSBzaGFycG5lc3MgZWZmZWN0IGNhbiBiZSBjaGFu
Z2VkIGZyb20gY29udGVudCB0byBjb250ZW50IGFuZCBmcm9tIGRpc3BsYXkgdG8gZGlzcGxheSBz
byB1c2VyIG5lZWRzIHRvIGFkanVzdCB0aGUgb3B0aW11bSBpbnRlbnNpdHkgdmFsdWUgc28gYXMg
dG8gZ2V0IGdvb2QgZXhwZXJpZW5jZSBvbiB0aGUgc2NyZWVuLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU2ltb24NCj4gU2VyDQo+IFNlbnQ6IE1vbmRh
eSwgTWFyY2ggNCwgMjAyNCA3OjQ2IFBNDQo+IFRvOiBHYXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJn
QGludGVsLmNvbT4NCj4gQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBoYWxvbmlp
dHR5LmZpPjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IEcgTSwgQWRhcnNoDQo+IDxhZGFyc2guZy5tQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUkU6IFtSRkMgMC81XSBJbnRyb2R1Y2UgZHJtIHNoYXJwZW5pbmcgcHJv
cGVydHkNCj4gDQo+IE9uIE1vbmRheSwgTWFyY2ggNHRoLCAyMDI0IGF0IDE1OjA0LCBHYXJnLCBO
ZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFRoaXMgaXMg
Z2VuZXJpYyBhcyBzaGFycG5lc3MgZWZmZWN0IGlzIGFwcGxpZWQgcG9zdCBibGVuZGluZy4NCj4g
PiBEZXBlbmRpbmcgb24gdGhlIGNvbG9yIGdhbXV0LCBwaXhlbCBmb3JtYXQgYW5kIG90aGVyIGlu
cHV0cyB0aGUgaW1hZ2UNCj4gPiBnZXRzIGJsZW5kZWQgYW5kIG9uY2Ugd2UgZ2V0IGJsZW5kZWQg
b3V0cHV0IGl0IGNhbiBiZSBzaGFycGVuZWQgYmFzZWQNCj4gPiBvbiBzdHJlbmd0aCB2YWx1ZSBw
cm92aWRlZCBieSB0aGUgdXNlci4NCj4gDQo+IEl0IHdvdWxkIHJlYWxseSBoZWxwIGlmIHlvdSBj
b3VsZCBwcm92aWRlIHRoZSBleGFjdCBtYXRoZW1hdGljYWwgZm9ybXVsYSBhcHBsaWVkDQo+IGJ5
IHRoaXMgS01TIHByb3BlcnR5Lg0K
