Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6ECF7F7F
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1CB10E4E3;
	Tue,  6 Jan 2026 11:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGC1hdbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADDA10E2E2;
 Tue,  6 Jan 2026 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697667; x=1799233667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BqDhFFO9aW4CVEkPZ3bX0FeY6wAed90vda6oxwnFQoE=;
 b=SGC1hdbm//nWGfFPfwF02eJE9rea7XdP5Ihyl6LijG2PhEuf/8q3yD+b
 a4A3YnNPchJsTHCpmYNyZoYmLYHvwQeAexs1f34JJj/xjkpaQ1OZTJldY
 boFrSN8SwgJ1vtfLCN/ASGUZaNVUDhLVDnKyE+DE0q2xvIcytv2aDdQ3n
 JmMf4VlaDFjt9Lm6hoJSXM6jT1jhSN8VvmmEdvUnK1VHOmy79dEQh4Jgf
 uoHseq1lG7zjOtOEXSdWDEvRSI/3BwQs57xSbxRlXHtrMOssZ73Pd0EQP
 On9cpFzseFg9HNt0y0NDGSfQ2xI8TFrFOKCwNeHyH+qTMWHeDaP2I6Kuj g==;
X-CSE-ConnectionGUID: O8LN/RDfQoymBGLtE6CHCQ==
X-CSE-MsgGUID: 7P+RDHBcT4OxjdJs22/rkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69104220"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69104220"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:07:46 -0800
X-CSE-ConnectionGUID: BBFNulvrQCudCE5YnQwJ9w==
X-CSE-MsgGUID: LdYZ4wCuRZ2rNrCuJU2oww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207671946"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:07:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:07:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:07:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:07:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNAd1ZLCX43ZaV3smUsR5Q+uQlXbAKhSU5664lbmHcetRlSs7L6K/RuJIs/lcVamfratinOZKOJFJF/GGMQQPNRNNW8a2556oHRwP8F5RsrHDl9REkPcfZix/h73F+ZsMvYxRXzY92SpjsqQahp/WUY34kMs17ptC7qs5aRPCNRSxHZJtIX9v/5w92IuKGi0lI37JaepBvfpQULCXOhKqfMlO0Em4z6Ll4KaiL3htr8w38WhxKvCPdlSPZFCjxAOAFoNYgJqUMgB/DuSEnpi2dhBGOa5iB0vCpXDYhO2ezFjwSbvn695TUHVNPRPoxkvTPZjmb2vOzQ8Hmzw6VkBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6e941jM87511eU+MaQ5TffNAzowGas6/EYjgsjk39s=;
 b=IjM22zV2OQxeTPF3w/PRvgEDwjhgdp8zdV2y1NtUUpuAeobUQR/eNkb9FNcEcLtKGQHY4kKNDRbFqaUTX8xabxDIw1zHPXNug72ocSUOoQ5CE+mkucxFgB71EA7QX7lzyCxw8ulLUeaNtrBho55356t+0BIiGT3D5YsH4JwmsvLPRbISOQ8rNYcBY/SRiH/mxXfn4T+8sZqkeYO0VLECHO1WOTaf8KbyYqiIXmWsHpY4h+utDrwgQ4GSnbGLQlhR688C89aiN4svyQCmLtnLBEXiaCLyvykPcu9fj0qJxW9k/kXY7SG44niR6FtuJtPgwPc8T/rigFJBP032crF1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 11:07:42 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 11:07:42 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
Thread-Topic: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
Thread-Index: AQHccLb+A8JLhbRUfE6HCX8eyePgn7VFF9RA
Date: Tue, 6 Jan 2026 11:07:42 +0000
Message-ID: <DM4PR11MB63603C816ABA511839393C8EF487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 1d09ecf5-be5b-43e0-8c02-08de4d13d01d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KKst/2oyuTGfFrmZ7BY66J3FQXdKnSOqwbuGPp6xutbMbwUIt+vwJ94ZCK7O?=
 =?us-ascii?Q?2AZ8eaXRlfBrSPsbJw2RMww+0kKq8uPx8E6SSemu2n5OkpXkjF+xj40Uba5I?=
 =?us-ascii?Q?6f7JdcEA2FaUeJseGg+OeNgf/Wz8LLMCuEmuJkS15v/JiALm8UtgMd4fiPrm?=
 =?us-ascii?Q?QP3uoAPNuqqVhSLh4SPZ1WOZBHmNhe1bElqChcTeZHFK6Gn7RJ0xarqqSDXj?=
 =?us-ascii?Q?SMEKYs7iNU1FNz4YNF7WEZgZRrhcU2cSkDCpUHaB5kjM29nqAuhmBtOwPNf8?=
 =?us-ascii?Q?WEe6cX8crEYM1/kXqQpAJfS0PvnNFpFuM0lcUbbTb7F5nXhJunpu21buDaIE?=
 =?us-ascii?Q?bEY/90ARB8eooBJBSJB0tG9zWkXevu2dE+osxCS4QBi54rWloPkT+b6thS3Q?=
 =?us-ascii?Q?DQvkj8PH1aidJkBNWuujgG2GnTVxaVTCGv1V1HMkCKC2IyCAJfrHM3bAbdzL?=
 =?us-ascii?Q?OCSgYdR828TYNrBaQngTxB8u4aS/9cKjjJoibL6DUQQ7g+3JmItF7yTpP3SE?=
 =?us-ascii?Q?vD4xJlHSThWeubZhK1LJW9FNCDTuKnhPCwPKfW9Npjim5HZrrF8b2YlbL/un?=
 =?us-ascii?Q?LieNZHGOiianK8nlgJB26ryatOrPznmAy7kTH5BRhvOr/BEZfD2hC78mDWfu?=
 =?us-ascii?Q?/r7wWlaebW/AMmZmsd++WEMrAVO5+MgSN6k5OlsKatom9u58lNTl1Vef5b8P?=
 =?us-ascii?Q?hAcVYWGS5jJI/LtqGFtfy8hNCSjGq9h16HSWw9KFm+hJsxgKlKqWrrNqBTNf?=
 =?us-ascii?Q?kFTaTz02JC70yldQAQzzkbbAXt91x6MULKRdon8CVEKVZa0MIlNaAbCUN4LO?=
 =?us-ascii?Q?4oAq/e9UYdCRTFb2xPHuLP7O0N3CP4WX/zjQiqTIJrq7sKKuxQtMAXYybiTu?=
 =?us-ascii?Q?MHm0MuwuSw6CeYxx00pY5hIp20cF7tDuBQCjXcJHFxdGkICazBIcIHXdV5lX?=
 =?us-ascii?Q?NX1jZXyqxUew4TCDwGhbrRqdHfdrG1MyUjcBgZlkeYssBAI8fyONW/AMVrIk?=
 =?us-ascii?Q?Ys6sLBfaN2oa1K6lOdfGRSKGi9kZ9U1BESLo75QqipejBxF2u5kBw/K5QceE?=
 =?us-ascii?Q?wOSZVbWUmaUHj7x44uLOzLhrhB7aQJO+FoBNFFD7ZTLEIvEe0ZBtFqZGAynO?=
 =?us-ascii?Q?ON390mf+VG8hnJEuswZE5EZ1moVJ+whhktsGKETmcyHNWokoov9EkzF2H0FY?=
 =?us-ascii?Q?yjK70QQemmcT7crozlz39LAwD+f3LFVc6HFQdYkAtk8tJ+fM2N9xMP5+u5sN?=
 =?us-ascii?Q?OF0arHGWTUHk2RUohuNDrhVxkLueaB/0crtry5OuOvaJeo5KonZLfQ/l5nrX?=
 =?us-ascii?Q?fw/gOCPlMwAOCMAnVvjPVhlt8XawAzGIC8c/LKzsbSxiHy9BicbljWlkqjKF?=
 =?us-ascii?Q?zcmBKvA0GcNB0/ndcfP7eVqPKVOJLm+bIDAKQZFm+cgu+eb2kAel52X5x/+a?=
 =?us-ascii?Q?5Kb/V+MCPMrWL0rht11s9Wk04R1BqwN+WzIdHgU3CPRy4/kPjShfAppxlEFd?=
 =?us-ascii?Q?XJZoqqggmRpqjddYTDjEOXa4E+3fbMaXQMdJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vDFGUvKSJuBs09eSsom3s6wqGr0DP4d4ljtQHL2FvTIiKv9YOj/ea+a8chLZ?=
 =?us-ascii?Q?eQCWqgfHdb6dCmGDMb/xfifZWlxR9xoTJ8bljTg0I++EY19c0X4+1kbaykfP?=
 =?us-ascii?Q?16/DKt8qogDVQMN/WG23L8oMG65i/DhjPcWOBCSr4Vi9yBfwRONubxZsn/H4?=
 =?us-ascii?Q?/722BXRySAFZqGX29f+H25v4weKGF/r6PIrbYT46e2J0WuoDM8i3DY/Iso+1?=
 =?us-ascii?Q?tJQyaa+9HNsUmpsbtuOn21iYx+m/O8HHLkwlzFVfxI5CWrsOe3uorGH0Ggtg?=
 =?us-ascii?Q?1Z9DIYiElpWKQjx1ZN0yZa/l5sbaxbc8dN/WLBynmb4AmPINlN1WC3Di1Tn2?=
 =?us-ascii?Q?M+nwzSn5zVS9zK8Jr2Ct0nO/P7jEELOewqXwo9vKUY72s8ImPQqcukyLOrxu?=
 =?us-ascii?Q?ikj4x5Pb76/JrvZu5xCvi/O15tFj4CE48KvXqlQfy4zLAMV3gt65blf5I3Lf?=
 =?us-ascii?Q?5N1OHMOcFHl35UZp2w71fGflkEV5qxMLNA1DLkN6qJvd8ncq6juwmL84s5Oi?=
 =?us-ascii?Q?kFMwqvUJnbSXCeoMBTR8HX0LqZ99T3Xgcislv1DjfJ+KIE+THTzBYugIlpmV?=
 =?us-ascii?Q?DxNLPMeIyq1T/h7Xc5cSdLKUn/+ejnkndKs9O7qyQV2oEXy0ln6F11tN+feK?=
 =?us-ascii?Q?q1xr8gdmYB+Pt1ZaaVAWbP030ZzV6KlUklE6ccks78pvtsiB0Pwi9asYMaFQ?=
 =?us-ascii?Q?68fY1XTJ8dDvXJOi3wOHq095aFmBN4e9zPGtJLWmWX1mXyoOY59tSuQd1IzB?=
 =?us-ascii?Q?GooPe2JAxuP+5Nb98KtiLuY4JBuW4FPJ+miJKiw4dXbOK5NrXLvkPQUK8XkH?=
 =?us-ascii?Q?VtcEW8coEp1DMpVkU+gjH0xn1IAIrdFYUVO5+inwdWekGWBZErwYCLur0YKc?=
 =?us-ascii?Q?IaGAg5DAw2nPdDrp0ckF3drrQoWSSJOO/iuCbafu06T+igArOwFWsglW0sYx?=
 =?us-ascii?Q?wG1C8XqzArQJtafbjhs6ZRKCMOH/H2ujke2Rur4kLyowSSii6TLpmNnZYy6o?=
 =?us-ascii?Q?4eVoGDJrEahPfPgAxyB4HsIhH6vjOMPA3DsP5jo7DC3TtGwtGpdm7UpQOii6?=
 =?us-ascii?Q?6h1NcQx79SeMZh4vrMWVIKuWebX/+Z9JG8DNA9B9maE01jyomcNTCXqRDWtu?=
 =?us-ascii?Q?rdrNvqwVHvbMZxJrAXSME30XQzFP4Ka2zSI0+3o8397dn3FIsrh29VJazO5/?=
 =?us-ascii?Q?XiEfGvyJ66Uu1DZjzUzS2t7/8ompSAIw8EMhOvJfApbaUJcDsU+vnI4rOIL2?=
 =?us-ascii?Q?UlaBKL6VCtRsWyfFbKaOXzdHukDPdK6SQ5DQ+AE0n8+ljUDL4rZvTuy/Ow3K?=
 =?us-ascii?Q?id2vKyXUikFlS0a6sTMq3QS5uOC4m4PG0jmRJV4JvteZwVIYMiEPei/gUOTW?=
 =?us-ascii?Q?3x4egtQy0b6FpXQzOe2ujitDEyKAkxL+C/UxRT3QpzQ5c+8jFSfogX42+inr?=
 =?us-ascii?Q?C0SxWYx1zNv9ezk+6OhLKo6p9owiIVORvQuBbSR0rUay2AkHuslNum2OYdXV?=
 =?us-ascii?Q?v7MGJVGhx/NAcjWUb22Q2NXMsz/qHsIY6M7LURzFGPOHY27aSy4UMAQ0eAMZ?=
 =?us-ascii?Q?N0D7kgUDK6dvfj2IbupDGruDW9g+eOfbxEtTfwIgi5obIzCrJqPGzmN0R09R?=
 =?us-ascii?Q?4WnbM6kDGMxzzicT/kD6HrxcB5GO4bdUbUXxKUzMSSsYsrPu+5gfZ2LIQNQX?=
 =?us-ascii?Q?lm6F50+Dj/93isuFCAs7JGnS6jp/SqviOwQdju89LF7pKb5QbjGzGM7HsA6Y?=
 =?us-ascii?Q?0DacuUzGSw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d09ecf5-be5b-43e0-8c02-08de4d13d01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 11:07:42.4108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: de86qShka46EXaTwomuDuB+UiIlKEq8b3rgeohsuI8017wmAxNtQdXlyPnVMmXulLPP7VwRXabnPefFgvp36yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 06/13] drm/colorop: Add destroy helper for colorop object=
s
>=20
> Add a helper that performs common cleanup and frees the associated object=
. This
> can be used by drivers if they do not require any driver-specific teardow=
n.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
>  include/drm/drm_colorop.h     | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c index
> efe61bdd9b24..4b27804bb0bd 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -180,6 +180,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop=
)
> }  EXPORT_SYMBOL(drm_colorop_cleanup);
>=20
> +/**
> + * drm_colorop_destroy() - Helper for colorop destruction
> + *
> + * @colorop: colorop to destroy
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop) {
> +	drm_colorop_cleanup(colorop);
> +	kfree(colorop);
> +}
> +EXPORT_SYMBOL(drm_colorop_destroy);
> +
>  /**
>   * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> 45d1b1d3faf9..ee6454b08b2d 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -440,6 +440,16 @@ void drm_colorop_atomic_destroy_state(struct
> drm_colorop *colorop,
>   */
>  void drm_colorop_reset(struct drm_colorop *colorop);
>=20
> +/**
> + * drm_colorop_destroy - destroy colorop
> + * @colorop: drm colorop
> + *
> + * Destroys @colorop by performing common DRM cleanup and freeing the
> + * colorop object. This can be used by drivers if they do not
> + * require any driver-specific teardown.
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop);
> +
>  /**
>   * drm_colorop_index - find the index of a registered colorop
>   * @colorop: colorop to find index for
> --
> 2.25.1

