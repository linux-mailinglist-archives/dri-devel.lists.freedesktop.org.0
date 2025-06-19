Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA00ADFCF7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD3810E997;
	Thu, 19 Jun 2025 05:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b95uRwxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5DC10E997
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750311291; x=1781847291;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s9MLdWn4zNg2GyzW9XCIYLNcs2TzvzBxCgNvn0a12so=;
 b=b95uRwxpZqxHZn4v21Ea3eVioRoNZqYMpG/tXfahgNXJENZJr+fUXUXs
 nLYUAkm57Wgqofk+ijO8BI3+XBXprGY2SZirYdnE58t1VjuQRJ5lQw5+z
 QdI5T/sqTuYkxTYW2uv3IMfNF52LkkQ5e4UrK/90U22QCNLF/9DvkqTrA
 Oe07jA2UU9DRwJtn7SsSm68rLzT78eLRs3xLjZthEXcv+/eLQJGJve2sp
 13W6Re5l9HFrB9djsqEaO6oaqmmCoKZAcgerdX2adjTmVa0MmSERl6jb9
 ZuEq85NOJohskZZPLZCOvgavUs5ez7kqHf6dftUAKlh1S/Lp0em2EQ1t8 A==;
X-CSE-ConnectionGUID: ZiFVUcuDTW2Fg/OOjQtSPw==
X-CSE-MsgGUID: pM4GXZOVSE+C2fegOJHjlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51786264"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="51786264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:34:46 -0700
X-CSE-ConnectionGUID: EszgmaB6S7u2yWLYYiQ1sA==
X-CSE-MsgGUID: UYwK/H1UTq+wivqyqs9PTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="151116392"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 22:34:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:34:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 22:34:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 22:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0bVgZAT1G6aBr5jCci38Z65uhT00KRFlgBQr8HhCM1puSXdADYYGgW9Nic9spaO+o8e3U5mSK6QJ4v2ZUrOLF55WK/oNYErC5u/amEqoBoHLG0ct96NZhwCfU/U2Pmu1ha8HcFDToHpNf0jSShlojpkelOnlZrRUVKXdMrfc5wSlC8eo5ZvZ6tZ9SlwwHhHDm7qpX2XQSg6nTR1GxJdEIbFBrqhc0dw+oN379wJJWKHD7YLLs/nXUat7OtFOyJLHb+TfAVaToZRZaRwRv05rEPGcOiMrqgk02pZmjZsoG6WnOrHTQbTzZUVckYy0mgoAifFgFInc72VFD5z8xT+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMIJtOQLQ8q4wGetjmTWhCk8NirR7Lh2RkyUzZgnuNw=;
 b=Rbipns9jqlppGfJtIi6F4BNvbjA1qsZ2kzfIbaMpky0pFtDHFzBCXGcxtyvDNcPmeQ3Lj5G6ndTTGcz2o3HQ4c5QUqdR4F0LpIV1n1JBBQqJZp+RR5Q6YLNw+jNOZP9tfnz7KOc93euSRASigs0Wq4TtfJXlOXazVXlHW45ZSNaDdmvIyDcerbKvcvpaDiAwbm63gaksUtBvizklA/TR0alsGAqPbJmLBgOmRi064LTLuC58eWKSYQDzgg+tmOD1McW1/o1dnb/8PQgKP+OGS54wnVpqPloJ46G/JhPpvExU0nVClW9zliJNquwep1hIce+0ASt1jG9+lvOUYggrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 19 Jun
 2025 05:34:24 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 05:34:23 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Oscar Salvador <osalvador@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: RE: [PATCH v4 2/3] mm/memfd: Reserve hugetlb folios before allocation
Thread-Topic: [PATCH v4 2/3] mm/memfd: Reserve hugetlb folios before allocation
Thread-Index: AQHb4BL6pY3gQ0JXi0KeW+QFNzyjlLQIigMAgAFeS9A=
Date: Thu, 19 Jun 2025 05:34:23 +0000
Message-ID: <IA0PR11MB7185700685CEE03EB5A920E8F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
 <20250618053415.1036185-3-vivek.kasireddy@intel.com>
 <aFJuzKPG-7t_oflN@localhost.localdomain>
In-Reply-To: <aFJuzKPG-7t_oflN@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB7430:EE_
x-ms-office365-filtering-correlation-id: e15c9655-76f2-4247-93fd-08ddaef2f30c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?i5qOIFGbXX01GzAIaDu2bEHVtzzcMLBB6ZLaJszFiyMnvflQ3Dbdgab1Vl+V?=
 =?us-ascii?Q?1IwIlu2uVFux89zh3Ts+nhJXD0XTznVdwli2/3Xvydebne9wszPKjMWJgIFi?=
 =?us-ascii?Q?fPf2NH8PcYGqE/Ljj6HY6O0lGiDbSUf+2PayL00/VPABoe9EyDfzYvylZRzD?=
 =?us-ascii?Q?z/KsZmpG5kpxU6wdLjXPXGs8r9xumXPrxYu6Y+M8OgojGV6SJEvsFdfggqct?=
 =?us-ascii?Q?qa+7KM+DbPvBqeTAcTa3p9D8ELJIiCbVu/C+SYWi5hfLgSGr4TAf7301SMUK?=
 =?us-ascii?Q?DKV9YrxRBG2xMf2kFGSd/UvOtpF7WcJB5xyQsh2OG8JtIR7Um8An5s9M3vHC?=
 =?us-ascii?Q?JyYCN0SG4JDWZRfGNIyyp1T1WCT6nc7ssDXJrvGOWmauLKKBQPHT2vI6z6cS?=
 =?us-ascii?Q?8hXFKwHlZGN8OxFmuzm6d/82FI3wJRuLT1Z5JQQwm0gKH4MBf6Pt/MDXyW7m?=
 =?us-ascii?Q?XkL3sYDtcyQf/sYDimPzUIiqvytZu/aEnDa1PHAbUrUxWi2ZT35U5Qag3VuB?=
 =?us-ascii?Q?fWQhJJhMRhezM3gC5ASeAsHgnTwdSHdVSQhD/QckSmto8646/dC8V1ou0PCv?=
 =?us-ascii?Q?jvS5iz9RdRyHKQQuBdL4cnRojj4+o+lbudaGRwjaSFMeN/sJ7lY4HMuYkzxl?=
 =?us-ascii?Q?tbaEVMXjWn9b2Jck40eDRtdwTI1yMNc4hb4YxsC7m7sPHV5XFeSbZtbDMIDQ?=
 =?us-ascii?Q?tJXDjtlF9ZI9KkCEA3FKBAlsJXivC3aL4+YGT4DZVpY82oDc+zlv+4Cn5Tqx?=
 =?us-ascii?Q?4AV+urt4jH81lwtw5fshcu0XV9AENXyC+fb/8DnFllcjD2xmekxmuNdEFu9K?=
 =?us-ascii?Q?N+tARHKm4lCGvsTmSvwXjj12AMrOYny+0fBuLMvXtslA7lDzsI66WJN6Yc7n?=
 =?us-ascii?Q?+ci7pQmuApsWdxzvPPwZw+uA9AIB9SvH33CvouNaNp/Oqspq0rVvUc2zPioR?=
 =?us-ascii?Q?2eYEVvTyKQs59hJpUEEVfFig6bY9RZW98zcITlio4NjTiGtOfsF8uUwVzuaa?=
 =?us-ascii?Q?fLMytOGA97ksm+BrYPX4DIzWiow6sSsswQytE7T4gZPupbKOd84rTfCv+Xmf?=
 =?us-ascii?Q?JZQb5Ow/+ca09MIFpvmG+bPAAAjLXvWcy9rxzFlAww0SCJtUMmvxNWPIrWPX?=
 =?us-ascii?Q?dfICUOyCOyMvK/R7NiKSloQqK9rGZFpBgMhKLxtYQ49VhugJPXdE59YjECro?=
 =?us-ascii?Q?TBEQZateHkcKMJIqDMt0FKxgMODhFdnsZS4qXgQEZ3cjV5UmidSA6GiwPvya?=
 =?us-ascii?Q?IFz2BnZdiiPRaWnLkTHmH5aHLkYfnA6B4QTZ1Mh+qI1vromP55Uos1j0t6R6?=
 =?us-ascii?Q?GmnkIJb1EeNqcM43PJOrRq3wEdHeEJY2iQiI5IZYJuCqrG2Cf7PPHbvMTVMp?=
 =?us-ascii?Q?04w/mUKFNdXsW3+qh1/nySw22GelVUrcaQ1Uc2eHFXCHio5JQgJJLNiKb8gL?=
 =?us-ascii?Q?k9U3Oncm2rRoDph/IkM0BEh2v5qq9fNHZQzXOva9M0/4WpbKW9SDMfDuZ9br?=
 =?us-ascii?Q?ACo2NTT3g4tjPlQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hvYVVI6gV8PVaxeCgo4HIrRdHv0qsCiH7q5SquIA+nrdiVVVOaMme4vkNKcv?=
 =?us-ascii?Q?WmzM/tLl7PmgkPxCIqQKWoW3lyEqN+Zm5qZzlaSHbkRkD//+fH7NG/IM4HKv?=
 =?us-ascii?Q?s8qTwV4TS09+oFde47P7FnZp9jEFWOYE9Ws8FSmyTuH/bKGHzObJOaZxuW46?=
 =?us-ascii?Q?zkEpLJK3va7p1NmeVLv5Blm19Uzy3hSzH/YJnS8WDKy20gKVhCdkuZ7SL9aO?=
 =?us-ascii?Q?1VBTQyaK8zOI+dQtOhxKXTArcIjk6trAzHPgul8NX9L2t7O8E7zJxIppsJy+?=
 =?us-ascii?Q?wwsu44D9aJPAJn/RKBkua5Tn71ib0/xP5nHOtmpWWoR/8ETn9s/NM9HVXNDv?=
 =?us-ascii?Q?kIbghBVDBPzPRIRVzeRla0guFb+rGwFMqyCAW7TAr3BHAHQES1sJCgveSsl7?=
 =?us-ascii?Q?AG6rcWs6rF4fsd7nlWybNKUfdJPVHMvEqmZ3rgf/RVNoFbhV/nGeGgWV7fpA?=
 =?us-ascii?Q?gGPxd7MFR867ZU/CJqRkX6HbA+6yR5U3IZEqXFpTqgJbJTKUpgWiUO/RlYBo?=
 =?us-ascii?Q?gbyBXxEo5+AdvoorHYQK2YfCazYlNJTvVhldf17pNgiwtHhPm3T2ElSU7BKp?=
 =?us-ascii?Q?Pv7w/0H3v0Q5A/Ru+o2bJMHbWCzk7i1Ve4DPebAJXo1yABqnWbQup1rJiccr?=
 =?us-ascii?Q?OYx2Cj5w1P3XP0swMwzD1OJ0F9LHh6SuAnCjtH+a+hgac5Pp52/t7Wnaiyjg?=
 =?us-ascii?Q?a0FeA7KaVqqFYj1bunR1csr8o0WLImvpbxCDY3WeTcETe1djgglkUTNprprH?=
 =?us-ascii?Q?mYXNl5fvINRL4vVOSS/rOlPBpfXWtqohZ/hyq83YDOlJ19Ghl/7ZGRr7SMwl?=
 =?us-ascii?Q?dF+rWqxCkOM5lNtMDFLcn3UhNu6KL7sp928HvvvFOsaCoQgdX0zsPjL8yDLN?=
 =?us-ascii?Q?F22JqzPqvPsWx/19jxhfig+6kKJSlvb3r2g/rJdnkjNyAO9FK28wunYVfeiZ?=
 =?us-ascii?Q?gs0TudXM8wVcoa0b/xHdV0IaCJAm4RN28nowPiCBLuTokO3ZNg6HMm2ds8NJ?=
 =?us-ascii?Q?twHFRMraz0yryQkyyjVQo0jh4ok+qJUJZOKM+fyi1/YXwESUFkmtPY8EKSxa?=
 =?us-ascii?Q?yyL5aA/tJimnuIWg+7dAfmcrnp5I2h4KjHrusdoGPi+rrwj8thQ1dt+VYX54?=
 =?us-ascii?Q?cP0XB/VWy0dxaOX4+Us4IHOXDMFdskNsCwgfEJqDHEsKWtKyknVnGAVSLqGS?=
 =?us-ascii?Q?eKheFOOPxlvIpFQI4vYQtd4tTROpFJa+6yY0hCJO+dlVOmnXlQ4DEb7rWj+Q?=
 =?us-ascii?Q?HdCFfZVutXrFKzV8gPrWfVLh+7bJSRzoAC5a2n+59nBfdaomGDn8xibjMAXk?=
 =?us-ascii?Q?LCjm7NSVYVW1qPmbeTf4UMC/dgKluOupNwspy7wUZTprUU2MojdFJ+DZxfWo?=
 =?us-ascii?Q?uNB4YUlsV4iHfqmsC7/ElDmMOFN4/Y2P9Y4yaryyrIPlB68yTOg7JDlOWhW9?=
 =?us-ascii?Q?TxWPF3WBxa+g6zfLl8qlAjfNd0nNONvHcZiUD9h+LhhOZL7jdexmuN5EvR6X?=
 =?us-ascii?Q?rTC2LEmgnWz0SQBPHgHUu4VSFQiB7RYnZw4cP6diMDvvp/1NNm+KoYqHmWPS?=
 =?us-ascii?Q?hWWbYrC44xzs89G4ZA50svvmwYyEdmkY/P5e/x3m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15c9655-76f2-4247-93fd-08ddaef2f30c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 05:34:23.9234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWbyufyfcfBM6kNN1nLgFhlT+KB8rCtV3dIGBc70r7SftQZlUoou73HF7LZVPwUwHCnziu36uSJGAqONMu+AH2OoAkmnonRpxeipHy2GCO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

Hi Oscar,

> Subject: Re: [PATCH v4 2/3] mm/memfd: Reserve hugetlb folios before
> allocation
>=20
> On Tue, Jun 17, 2025 at 10:30:54PM -0700, Vivek Kasireddy wrote:
> > When we try to allocate a folio via alloc_hugetlb_folio_reserve(),
> > we need to ensure that there is an active reservation associated
> > with the allocation. Otherwise, our allocation request would fail
> > if there are no active reservations made at that moment against any
> > other allocations. This is because alloc_hugetlb_folio_reserve()
> > checks h->resv_huge_pages before proceeding with the allocation.
> >
> > Therefore, to address this issue, we just need to make a reservation
> > (by calling hugetlb_reserve_pages()) before we try to allocate the
> > folio. This will also ensure that proper region/subpool accounting is
> > done associated with our allocation.
>=20
> I'm not really familiar with memfd code, but can't you make such
> reservation when you create the file in alloc_file?
> I see that you explicitly pass VM_NORESERVE. What's the reason for
> that?
AFAICT, there are at-least two reasons:
- The initial size of memfd is 0 when it gets created. So, there is nothing
  to reserve when hugetlb_file_setup() gets called from memfd_create().

- And, I think reservations are typically associated with allocations. In
  other words, they are made on-demand, when a user is about to write
  to a file (after calling mmap()).

Thanks,
Vivek

>=20
>=20
> --
> Oscar Salvador
> SUSE Labs
