Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E25ABEF70
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 11:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3810E6D3;
	Wed, 21 May 2025 09:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5I5CkV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005CC10E6D1;
 Wed, 21 May 2025 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747819192; x=1779355192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fM5kWlQ0eo3blkPIm20nBwyWOuX+EOANdNJaHhEDfEk=;
 b=m5I5CkV4adMmwWP40ZMOTpToLunXOed7yZyiUf+Zpr/a8snEKd8uNhiU
 N//j36CYg0okCGpOTJbTN3sFyJRoTBi1ut6KznywLgxWSYhh8gmFjZtq6
 7cCF8aIUoiWS6eb451f50Ij1o8SatWURPjIyxx4nuqAfQG8NFeB9k535/
 9B09Nj9NZ2m8o8BYeKN18FKdBSUZXt+TYMYd3HRyn7YrEEVR4Q5OwA8hE
 mZC/NVdPjNAdUK7yy96KLSiZ/QjDBbvK0QoIwYCSMgkhxiY6g8AuWpBig
 Aeg65pZoMoVwHOH2ZspUNzPXNiWF9eSO3WDpvis/9Atdd8i7P20cBZDjS g==;
X-CSE-ConnectionGUID: DM2scB8BQoW7WHws0120VA==
X-CSE-MsgGUID: c2p5piu2QhqKkNkqseaA9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60446341"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60446341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:19:41 -0700
X-CSE-ConnectionGUID: 65eJMYn2QIKfivvDDqiLIA==
X-CSE-MsgGUID: OXvDr6ZqQ/G3jUBqmbZ5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170984299"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:19:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 02:19:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 02:19:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 02:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWGmQICVDUVZsul1NxrHv0n1ZVilFK1oG+OnbNr6kMP7hn5ALVgyVwifuz1pXhDFcS8fcOi5besyBCkkKBwfRTt8oiioDwbqjCmU2qy44BhjbN9SvonzcesFRkZXRjHMFXeLwGeQVE+DSm74AW3WAiiolP2c4kqPI/4hjU5gIjz/sLqBFwZ9E2pAXVavEq6X/VGnz7UvS6kiM7mnVFg2wMnLatBoQe/2rxASIhhz2Uxr+Htcwt88+DuMOBABwx49hAsK4Tj4WpScu4U49qG5jTVMf44LotiDpyozdXjPvjhZnYQre90aPgVDokT/ZSAOQuZNGdZMCQjw/3hYqOEpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM5kWlQ0eo3blkPIm20nBwyWOuX+EOANdNJaHhEDfEk=;
 b=mVXdaPujT6mnkR2gc9onN+/PH/aNaXvPlEbqrsmQAHdsiyfRvFBIFOuErLMZ8ykqJDJa+Bcwybu5yC54LJ4d0duuTfMrON+107dt8gSFcoaphLUMmRX9AhUqsFOK6JXeYHWur8CQ4z6C62wmMdV5D/2+xCgH4O+zQymG39w0oLet0Wcv0dSTwvNymUA1MF9wwJpDSJ4QldHQoJYbsRkxvGNcQZkrcgg+3rKxZFU/fltffAHSBwfSlAZRrFnyXqpMy2xgnoqYj0cGvl5KWYGCX0DjW/3vF72LJ0kGIOGP+ORAZlLJGblqpwzOBjgmz90aymCSkLNmoUjODaCJps2Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:19:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 09:19:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Topic: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Index: AQHbxaAAGk0T3Gb77EOFbnNMirDIEbPbzroAgAEIt0A=
Date: Wed, 21 May 2025 09:19:36 +0000
Message-ID: <CY5PR11MB63663A454365B4F8F6292BDCED9EA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
 <aCy8ZJq4eDMDQukx@black.fi.intel.com>
In-Reply-To: <aCy8ZJq4eDMDQukx@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS7PR11MB7737:EE_
x-ms-office365-filtering-correlation-id: b857982a-9507-4948-45db-08dd98489b14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cTFCWW1mdnFMUEJVa0VreXYxQ2IvaU9BVHQxWTU4d0ZXZFl0OFk3NjVUMmZ2?=
 =?utf-8?B?WElOdEZRWE05eVZ4d3NpQjdVQTd3RDk1OVFOYnFvTkd2WUUzbkwzMWVlQldI?=
 =?utf-8?B?YXJOUDlJRkt5Y1h0VlBQcW53YjZUZlpTcjA4c2JtUVAwVUxPejNJTjY2Z1dp?=
 =?utf-8?B?c254RDh0VkhDdlJ0bUEwaFllQjU4OHF2NWloeWNTSTMzdG93ZW1GNWhrbEx1?=
 =?utf-8?B?WEJEclpRREJiTXAvT3ppd1BiVklmSEFTUGZCNHJmV3A5QjE5MEdXRnVkTHlB?=
 =?utf-8?B?T3Q3MDRkK0U1b3U4bk9mUkFRZ3Y4dW1XTHJzU2hhMFFxd2VtR3RTZUl2T0F1?=
 =?utf-8?B?ZFN3VU1CSVcrNzI2NzAxZThURWl4M1FsZy9NVnB0L3RaRStpMEdtQnNMNXEv?=
 =?utf-8?B?T3k0UnVnaGhRL3I5SytxVXN3VTV2SjlSTEZBd0QrTnlRL1FmWGMxbHljYlN1?=
 =?utf-8?B?YldrNzVCcVhPVTVmcGVaSCs0TTduVjU0TTA2bjZuR3FVbXkwNkJRd1g2OERz?=
 =?utf-8?B?NnB1TC9nVVFaRzZwTG5iSHVXd01jc0tPV24raEtuUy9VdUpSRlkzT3d1TEs2?=
 =?utf-8?B?TkJzbm5KdTJPeVhmcDhLTzcvdmV0UGE3WU95NXNtTy9OcVUya3BaKzRBblEz?=
 =?utf-8?B?L20vUGZBcFVVdFlCcWhNVDJsYTl5Q012MkdYVU1VZndiYVE2MW9FclJrMVBv?=
 =?utf-8?B?NWVrSEs0YiswdFQ2Tmw3WU16YWU5UmtPTXFEUnRGN0FRblZteDNXbmJFNWNI?=
 =?utf-8?B?M1luNWpHMTIxRy9RL1lRSnZpTjRsVVY4cWJmSTZTOFVVYTFrVFA4c3pPVkFJ?=
 =?utf-8?B?WXlpUW91dysrUVJISWhsek5qc28zYXgrVUl5eVlwQVIwbnZjdGVieHR2RFIy?=
 =?utf-8?B?Y0pDaUVxYnlVVGVRdjJQRHNmakUxNmpPbWZ2VzNsOU9Fc2o4SW9wY1hsczB5?=
 =?utf-8?B?YzlDdkxUWGJuUWEyV0NOdjBwdHZYMmhYL01KOUpWT05hZGVZOUMyNEJ0MS9v?=
 =?utf-8?B?NFpFRjFhWUFvTW1QTHpRTmVhRlpQTDN4WVpkT2dQbzhLQUtSV0FxUVBDbk45?=
 =?utf-8?B?RVBmR2NqYnEvbXlQTWYvTDNnY3o4RnFRUERNYU9RRjkxYWdsQnVqUEJCNkhE?=
 =?utf-8?B?dEVqS3pCMkpHQlNtZER5M2U3Tml5VkM4OFhoaklxNE5pdGxGcTJkYk00ejhP?=
 =?utf-8?B?c0FUWWFSb0l5M1JrVlhBQVZuR1ZHZm5ScXRJWmdFSlZHbkczOFZqQVFkbENI?=
 =?utf-8?B?UWJlN3N3c2tUSkZKRFFEa3NDaDlYbmx6bVNKeWh1NTQzaGVLcXJrZlMvb0lM?=
 =?utf-8?B?WlV6RllmdCtWWFFja3RBazgvL2Yxby9Lb3QxTGozWVcvaTY4OXVNakVYYWNR?=
 =?utf-8?B?SEE4TllTQVNmWVIxRGVFaWU4ZVg5NXUxNDBqamZXckhiOGVJdnVYSktZaXRP?=
 =?utf-8?B?NHpHcmVqMTlEUEtlTkNpV2NUS1hDZmZFVVpoQmNXQ2NkbzVGN2hEUmdlRDhm?=
 =?utf-8?B?WTg3M3RlNko5OXl1bnNadE1YcEtFcmMrY29hVU4zZXd4cm5lKzlhKzhvempW?=
 =?utf-8?B?ekJNaXZYMnI5ZDZGbk84N2pvbFlkWVNhaG05TWdtL0cvRS8zd1hVcnZRUW1p?=
 =?utf-8?B?b2hKeU0yV1ZBUVViSFBRclhkdlNrTkpvWGJtYjBqZkNsYzdabTdBbE43T0Ri?=
 =?utf-8?B?SjNqVTIzd1JFL1piTWZmTXhybVJLcWJsdEROQ3ZvM1RlSkpFVDV1Q091Zk9E?=
 =?utf-8?B?SDVuYVlGbVJPSGtNcnJSN3dPQ042ZkFKcUpIeGwyT1pDNFQ5Wm1kb1Q5VlBO?=
 =?utf-8?B?RUtvajIwUk9kbTUzVjRtbDZrK2ZvM1NUdVR4eXNaM0Y4WWZnMVAvVFAyVml5?=
 =?utf-8?B?RjZ3ZTdNNEFSZ1dJekdLd1IzS3NzUW13bmp0Qm51QlZJM0tiNUpTWW1iRVN4?=
 =?utf-8?B?YWVLTzh2eFh6TjJUdjRRMlMyVlFqNXplcTMwNUgvRDJqTEJCeUJTQnVrOUcw?=
 =?utf-8?B?RkVHczZqdjd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTc3S2hmdjFJR0NOSFhaSG9ibGR0eUN6SjZwWCtVK3B3YUlKbnhSMjNYK3hp?=
 =?utf-8?B?dHdtNXplT3N1bm5QelBxcitKMlFPQ0FYK1diMDF4d1BrdHpQbTNCdCtmOEJR?=
 =?utf-8?B?NUFTYmdWbWdSVTREWlRHMGMxc2FEenNPcnJTWFFGQ2ZBRFQ1V1hTK3VYYkkw?=
 =?utf-8?B?N25xT0FIc1B1YUdWcHVHck9qSzFoQ2NtQjRWaWdMMWNwWWcyYncyVGFMdU5v?=
 =?utf-8?B?eVVuOXRzdjhuTWxubTJrQ1dVVnJFcktHNUgweGRsTTV6bW4rS3RsZE1lZTVP?=
 =?utf-8?B?QkFOSUIyOS9PZWozUW9sLzdGN2Z0a0dmQ016MEhxZzdMaVhmY3FhK3FLVDB3?=
 =?utf-8?B?RU1Ua1M1TnllYm5ET1l0dWtmcXJJamxlbkpueEpwRkFKdVQ5VGtOdFh6d1FY?=
 =?utf-8?B?Q2VwSzBwbXp3dTZmQmZlWk9rSnpIUHI0bGkxT3BIUTcvRVdkZkNuSmdaVGIv?=
 =?utf-8?B?K0hIZ01GcjdyM3V6alo2UHl1d1gzQk9wMXc0VFBWcEhKRHpNQWsrR1dkajBj?=
 =?utf-8?B?MWhvLzF4azdzVmRzNXFxemVqdFI5N0poczdiSDJMSGk0dFlpTWZuc0ZWeXFX?=
 =?utf-8?B?MUI5UW5LRnZqUmpudlNTMW9wME0vcW1YeE9iaGVaL2VKOWYrZXQ3Ync3endD?=
 =?utf-8?B?NmdhaXBGdzZIVXoxV1lKVmU0eGhKdEZzY2ZQWHJUanVUc0tUU04wQ3V4SW1N?=
 =?utf-8?B?ZGZNMGc0Z25NNDQ2bWRlVGZhb2xUYWV4U2tNUThUTkd4MDZ2ZmwvL3BCUnM4?=
 =?utf-8?B?NlZ3ZUFkWjAyN2NGYmpuWlk3T1AzTy96akQrdUh1TDVyR3N1eTZ6Q2k3RExo?=
 =?utf-8?B?a05neWllc1FOckNFeEl6RHQrMG04cWFDTUNyM2FmNnhzZ2xsTnkxRUZPUFFH?=
 =?utf-8?B?bTBoRXhrdUY0TjZqNDRnbVYxOVliMEZmTHRXUW5rKzBsOXRXSGxCUjhFTmJi?=
 =?utf-8?B?VE1IOWFiOTJuUjJLMzhETkE5bFFtREtKdGNla2xmcDJhY2M1YWphRG9ta1JW?=
 =?utf-8?B?cWc3ZDdpb0c4ZFN6Zk9Rek14UTE3UkdBY3EyWmlVSTUreGJzWEVwOXFWTFlJ?=
 =?utf-8?B?NTV4dkNFUXozRTBZT0RMT29YVjB3OW9SUGRZeTIyRFBBV1RjdktCVXFaL2NY?=
 =?utf-8?B?ZHBMYzRyeXdWYmdpd2ZDTWJPTzBrK1k4bEdrNFE2Sko2QjNRdzZXd1AyQVJ4?=
 =?utf-8?B?UmFCUWdZMTd2NnRyZk5jQ2l1Z1o5VDIreGxvSU16VUxYK1A1Tld3c1Z4T2s4?=
 =?utf-8?B?QXN6QXl5bnN3QWxIbUNmb2RsQzZ4K08xNTZzaWpkOGU0dC9sNDZ5Q3UvdFR3?=
 =?utf-8?B?Q3RFTFBqR0RXbGNXL0dqZmU2L25wQzRjWTJObFQ3WVhVazNNbHpsaHdSWHRn?=
 =?utf-8?B?L1Q1SGJ3VzQwOUNZZEM4M1ZjQ1lGRVpub0NIbkQ2UXNTZFpaaHlVQWtIOEhq?=
 =?utf-8?B?OVpXK3pNcE1XQUxZa3N1WmgvM3ovaXFRNWhYYkNBMk84VWF1d0FxU0YxZGdD?=
 =?utf-8?B?REJoVm9ibG1vbEVnQ29GbmdCSUU1QTc5bkdGWmJGMVRaSDlEd3pxQStWTWFY?=
 =?utf-8?B?QXRNTU9IRWQ1MjV2d2VpZ1g0U1ZWSVVtMUVLR0g2aXhFZjE1Y2VyZFM2c0pa?=
 =?utf-8?B?UDJWVjlmalFMOUZOQkFFR0xqQll3TEhTUEw4U2RrT2R3c0g0clZtQkFDa3l2?=
 =?utf-8?B?aStWa3FhL3AxZG1jVWN4WDJnYmdqaGsyMVRaR1Yzb3FnSFFxSDcyb2laZXlG?=
 =?utf-8?B?TFB6UlV4cXJwWEFIK214UW8wTzB5MjZoS05rWjkvM01mbE1vd25remVXY09p?=
 =?utf-8?B?NUdaTW9TRnJORkFpZzVsdG80enZ0SmRlS3Q0R0E5R0xNK3RmN09qNGN2cms4?=
 =?utf-8?B?cmJEU2pHMTV0L2czem1Dc2dqanM4Rk4wWWgwR0hTVW1LWDJjZ1NCR1JCNEVx?=
 =?utf-8?B?TUQySmpaZGRXUGRlMlJkSW8weUxmK3kxdUoxQ1RKMllrRHdqNVViMUNCYmVi?=
 =?utf-8?B?LzIvMFZ3eGowVlhNMko2dDBvdFg5ODBGRmFpUW4xUUlYMDFuRHM2a1Fhc3lC?=
 =?utf-8?B?Wk9xZ0hIbmpNWDR5UUJNK1FCWFd6SmRWRUZGYlpHSUlPN1U1VDdIdnhwTjZE?=
 =?utf-8?Q?+NE3jZ5uVw5Z7TVysFdYdznPR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b857982a-9507-4948-45db-08dd98489b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 09:19:36.3280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mf69SNEIb4/TVeHFzlOr+cTYiGQxf+3wPclgTo5c+Plovd8MO29u+Lq2ezyGG7/ncM985Vo2PgwTF+TA1A45eQWGNdUY/TBRpC0IWeFDFqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwMy8xMF0gbXRkOiBpbnRlbC1kZzogaW1wbGVtZW50
IGFjY2VzcyBmdW5jdGlvbnMNCj4gDQo+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDA0OjMzOjM4
UE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IEltcGxlbWVudCByZWFkKCks
IGVyYXNlKCkgYW5kIHdyaXRlKCkgZnVuY3Rpb25zLg0KPiANCj4gLi4uDQo+IA0KPiA+ICtfX21h
eWJlX3VudXNlZA0KPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IGlkZ19udm1fZ2V0X3JlZ2lvbihj
b25zdCBzdHJ1Y3QgaW50ZWxfZGdfbnZtICpudm0sDQo+IGxvZmZfdCBmcm9tKQ0KPiA+ICt7DQo+
ID4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbnZtLT5u
cmVnaW9uczsgaSsrKSB7DQo+ID4gKwkJaWYgKChudm0tPnJlZ2lvbnNbaV0ub2Zmc2V0ICsgbnZt
LT5yZWdpb25zW2ldLnNpemUgLSAxKSA+IGZyb20NCj4gJiYNCj4gDQo+IFNpbmNlIGl0J3MgYWxy
ZWFkeSBvZmYgYnkgb25lLCBJJ20gd29uZGVyaW5nIGlmIHRoaXMgc2hvdWxkIGJlID49ID8NCj4g
DQpZZXAsIHdpbGwgZml4DQoNCg0KPiA+ICsJCSAgICBudm0tPnJlZ2lvbnNbaV0ub2Zmc2V0IDw9
IGZyb20gJiYNCj4gPiArCQkgICAgbnZtLT5yZWdpb25zW2ldLnNpemUgIT0gMCkNCj4gPiArCQkJ
YnJlYWs7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGk7DQo+ID4gK30NCj4gDQo+IC4u
Lg0KPiANCj4gPiArX19tYXliZV91bnVzZWQNCj4gPiArc3RhdGljIHNzaXplX3QNCj4gPiAraWRn
X2VyYXNlKHN0cnVjdCBpbnRlbF9kZ19udm0gKm52bSwgdTggcmVnaW9uLCBsb2ZmX3QgZnJvbSwg
dTY0IGxlbiwgdTY0DQo+ICpmYWlsX2FkZHIpDQo+ID4gK3sNCj4gPiArCXU2NCBpOw0KPiA+ICsJ
Y29uc3QgdTMyIGJsb2NrID0gMHgxMDsNCj4gPiArCXZvaWQgX19pb21lbSAqYmFzZSA9IG52bS0+
YmFzZTsNCj4gDQo+IFJldmVyc2UgeG1hcyBvcmRlciAoYWxvbmcgd2l0aCBhbGwgb3RoZXIgcGxh
Y2VzKS4NCldpbGwgZG8NCj4gDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpICs9IFNaXzRL
KSB7DQo+ID4gKwkJaW93cml0ZTMyKGZyb20gKyBpLCBiYXNlICsgTlZNX0FERFJFU1NfUkVHKTsN
Cj4gPiArCQlpb3dyaXRlMzIocmVnaW9uIDw8IDI0IHwgYmxvY2ssIGJhc2UgKyBOVk1fRVJBU0Vf
UkVHKTsNCj4gPiArCQkvKiBTaW5jZSB0aGUgd3JpdGVzIGFyZSB2aWEgc2d1aW50DQo+IA0KPiBz
Z3VpbnQ/DQoNClNndW5pdCwgSSBzdXBwb3NlIC0gd2lsbCBmaXgNCg0KPiANCj4gPiArCQkgKiB3
ZSBjYW5ub3QgZG8gYmFjayB0byBiYWNrIGVyYXNlcy4NCj4gPiArCQkgKi8NCj4gPiArCQltc2xl
ZXAoNTApOw0KPiA+ICsJfQ0KPiA+ICsJcmV0dXJuIGxlbjsNCj4gPiArfQ0KPiANCj4gUmFhZw0K
