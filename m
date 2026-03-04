Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG4XJ7+QqGnZvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:06:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7B20767C
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE7710E1A1;
	Wed,  4 Mar 2026 20:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQzhZjqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2410E1A0;
 Wed,  4 Mar 2026 20:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772654779; x=1804190779;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4KxLfGctrAEHXjh2FvLAri3biqswiDqe3Gwy5I7uXEw=;
 b=DQzhZjqy7oh8qXekC3QLz/PGTSBmrQvE/vMzUVj5Up+b/m5uY4FsuQdM
 gxWa3V5uG9ZgB6Wh1dmroJjFfe/8lEiu/Snk4tCT36U/HH0sKEofZRm3T
 5k+KqcBbbeaUhnNoU4it+uEXV7hwAmgHlhqP8FGaZicuTOWNwX0Xu3SF2
 N2yfxn7vHVrWd9e2e4oE7djDGkkvH5cOXAerOa/R+7kxPmiclQiYg/mYG
 m+85pxgje0dfmoyR7ECK5jH4DH+BW+n/233Qfu7QR+pdgLM1xcfXgA6Cx
 KQ8QM97P6dG0yb+KKrQU2gSnhEcQru8bchNQ+mCm06kyAd14YgEUnA2jm w==;
X-CSE-ConnectionGUID: NglomG/9Qxupm71xYgjjlQ==
X-CSE-MsgGUID: ziJ3sTW9QHKp4Hg/ZxdUmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73599636"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73599636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:06:19 -0800
X-CSE-ConnectionGUID: sm/PKdfcRKKS22W9NXQwUQ==
X-CSE-MsgGUID: CQv8kG4kT2m0btz92SD2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="223410880"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:06:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:06:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 12:06:17 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 12:06:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqAD0vkpCDKtP3qNsxD/RlIt8GJg4sd4KovoTsAbj/pIElImuMksMZJmZ5xuNPVpvbrNzmPcT4CqRIA7LOuHZoLf5p/n10G5F0PWKm+qgtbOCle/L8k+ZNJPdLU7WVqZr8nrYsZhS/nHi71KM+cqOvM71wYO7pPj6CiwnLYjRB44+zJqOeR0a0Rl1ayNsOh66t34BDr5PEYOvh3EqzJi1tH5f6iYrzwFW4Et7GirK0AD343BF7f+4jmauFQ2ztRlYHr0S6OCnn5+ItGUES/gh2Ybfjnt5Ai/fQ4UYIfriejAUTfWzO5Cynp6hG8ayOvUhQxqYSxyABnL3R3u5S9Dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Grw/2wDPeKGLmm594YyNlFFAyxKWNNVxSqNx/jazBQ=;
 b=WrNFJIYzCUBtuRFs8XrDsaNtBIaht9eaQQCrNKt4rUr7xkG9DOe6B7SxibnO/6Dyh8zDvgyV4Ca78R0N/wsXxpyy0T4VVm/SB0cICgxW1T9OOubIgqZnU2R1cTPKtLE/P1XFD39rik2RuXa3dXAutEP//E/otT/lwMeBIXHblgRx/apZPrVhnq/LYtw8JHNfU0L0PUCBeXwn+jB8reL4N3zs0Mz+1SWKYkidMVB/lIppfI9AievjxelhAvq5zbLUjCTB50b1WqwqwHbhCVRQzK9rO7oE2xQ9bjcAiA1QCGeLpPRItVQYVzKy6jk5LaAC87+7RZKRvixlAQURLrC8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA3PR11MB9181.namprd11.prod.outlook.com (2603:10b6:208:571::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Wed, 4 Mar
 2026 20:06:15 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 20:06:15 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "irenic.rajneesh@gmail.com"
 <irenic.rajneesh@gmail.com>, "ilpo.jarvinen@linux.intel.com"
 <ilpo.jarvinen@linux.intel.com>, "srinivas.pandruvada@linux.intel.com"
 <srinivas.pandruvada@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xi.pardee@linux.intel.com"
 <xi.pardee@linux.intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v7 1/6] platform/x86/intel/vsec: Refactor base_addr
 handling
Thread-Topic: [PATCH v7 1/6] platform/x86/intel/vsec: Refactor base_addr
 handling
Thread-Index: AQHcqs128EhPbvtpmkuCthBpeNHD8rWezgCw
Date: Wed, 4 Mar 2026 20:06:14 +0000
Message-ID: <IA1PR11MB6418EA8E91B1B09C87A123A2C17CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
 <20260303051953.1453372-2-david.e.box@linux.intel.com>
In-Reply-To: <20260303051953.1453372-2-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA3PR11MB9181:EE_
x-ms-office365-filtering-correlation-id: 93916992-ba8b-4ac0-ffc0-08de7a297d73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020|38070700021; 
x-microsoft-antispam-message-info: WXaaTUmLjQpkX9jfs01kirW9csTXkh+ZfZ30uIx6ZDm0le5Ch125kzKLox7S9Gjhs2yHX1A9vpc6x4PA1SXFJpBaMWPQMT6x0CpQ0r4TYr+4DEbeith1/WZfR+TxYjebBiQ8Gm1Vb2xLbGeqIeSHPR5Z2VPGYspDq/vgq7tVwJE0XA8pRPXxUvXz6ZlcjOT30ET0arLwXbvQPF0xIl76k3IJpyGmjw28E0zUZwNhl/u7D17HBBVI/0ZnUMWbGEb8tWq3TxMFmut63uGSUaCfY0oNFJGkof/YYfTV1U4SYShhfA2xDmxjSbicm5f075HkSH8JMmswCynbFL+8/nRG9W/X9frGE62nhrXcFZbCTGzDMNvvEoNiMi6KBMHQl1H/z3JTID7ccqF8pO8yc1LPJ/6sbxrfb4gHlS6ZWA1v2NXqjxp5L/AU2+n0gEsE9CII1MBjdtzdgFh4aXdCDGpTYdetR4kMA7pzs1KJJRYkbsOZUEOdkxHoDDvIs3bwu5dzP+IUgLuITq0AD8NnD1htXoKYfFzxmXStcN/XFTyyYhKqMOD5cWOy5/WraptZY8b9cDvjBLKHa8vYRGD3QmPeFiKoOsLAccs0tcYn8xjzS7JehBLqUpr6Qhq1pzgQeMrl3/fkPtLZ4ZbP3a46esfadZXj1jjbcvFSSJxwEw+Rru5ZXc/zJP+pS52BwU0rhCL/FzFA/h9DHB9T/6TUQoBULH6juO7RuLAW1Raf0zO25NHywJJDwTLiAjqEaLdQ5J/6hW0RcGBUsUHmqD8spzXvI36vCWx4Fc5d5/OPmJ+ghVfG+m8qdWATZwgOkhf7Y443
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y+PNAdwDL0JPICd03qwy1MPr05O+BRlvA9KcTZmeysl0LJfyeHTu7XB0PPXW?=
 =?us-ascii?Q?b5LwsAmackv3s9aHqRbCKzo+uDFd20Zw1otYsoya5x3if4sFTzLPawPaGigP?=
 =?us-ascii?Q?DMj63Hap6f1LS25oWhn3L0s8t/mz2pIMPsTCMbWNL+XegCyQFMqvgEGTAc2J?=
 =?us-ascii?Q?c8lBZCDEu/IE0bhAIrsUqWu9afuSr7UU/czckIvDNQU+y0tRM5HM66XZQjJI?=
 =?us-ascii?Q?3f335wGZ8XsFNG2kaVKN0UbEgVPTaI7iXrDjEx9T0yE6CgKBbnkSL0FcYkzd?=
 =?us-ascii?Q?HpSG5dTYda1qrZvWddU9r8kx4n7czeUAVmKXwzR2+tIp6GwCnQ0nuI5GRONa?=
 =?us-ascii?Q?TieKKPYKxvlgM5bXo8cFQBPymtrUdIJ8VaYIGSjSERbZpXMYGDZ215q6fIsf?=
 =?us-ascii?Q?IkoE4NEj/AyTISxq/smoeHO1PWLY90ryymvULjjW70tUchw/PCeZsxQId4ki?=
 =?us-ascii?Q?7t4GA44zrFHgRp4jIQY12zHN0ywOAwed0HIwcvF6PMUC7lkpTYvBSx8dj1On?=
 =?us-ascii?Q?PtUR17HrwVV3bZ+0QhSfMiSALnqsFZBlfKK1KYKK7qdRbHFdJD0FM7qhRYST?=
 =?us-ascii?Q?rzOPd/2ZmH9xfgdkf38KsHBaA2wtol6xRCulrunj+COyL5tOwkOm/ffBUCWV?=
 =?us-ascii?Q?9WI4PI8zgbDwV2N6oSLIrlIRH4hsPyt5kmKNeEueTA03R70+Z0D+WMa1eenN?=
 =?us-ascii?Q?TvkMc+yc75QvddWeDu8QvJnWH4RDAAxT6BUGdsrjv7DhXdUoP16hM1INDQan?=
 =?us-ascii?Q?9unOkNepK/xoONlKT8VNAVguKRIMENwYCVCF9m0QS7XQEkiKlK8lLdgJjr2z?=
 =?us-ascii?Q?ugWjEpbg5GO3C6CL6c9oCUoZmsybXrQ9sIxNt+L1cAdesE9s63MhcXk1UeUx?=
 =?us-ascii?Q?qt4evxWcJyRmwcHeh6GRh0R93CMX7M5p0CLJgI7Suc/oOFBA0isqUn/R7ipR?=
 =?us-ascii?Q?xXAhCS/H7t1LOHyPKGKpTPLx4q4VlqK3d+GTRMskdiXZ5JCpQjGm1DaBA+B2?=
 =?us-ascii?Q?AVSzKRudKzQLahG8HFR2Svxb+fYuGFJusNLWVklI8IPeXbGe50ey7/c8toXF?=
 =?us-ascii?Q?iw9CqU8VKIQvoodGrL2pJ5t5fZkCxkm0/cJ62i91k6qavA9l+kAAWdaywfgj?=
 =?us-ascii?Q?vt2Ta64//JO2gdAeZok5IAU6D0cvAS0GxvtuQ03tfTLRlg3IB8haa/f05dkt?=
 =?us-ascii?Q?slAeSS2MF1lvWXXRMVdwJwDaXu9Ea4PSC0X6/LfJYzGR49uGsOzW0rP7YZAj?=
 =?us-ascii?Q?YQp9uJI4W/RR3e9+hr9jszG1RV3zKP8d89lh8zhSHW79XFGFMGvFMwUA/0Gi?=
 =?us-ascii?Q?hKudJGpaAiqoLR4Y3+AtLwbsnBMhvayjAwN2JIUmcmSxkbYB/Eq/KmqRt9Og?=
 =?us-ascii?Q?f17mjkW2MOvC6gXX9MIhjg9Ntv7g3XkAe7SKxghSl/Os1JJfVbimUNplJX6m?=
 =?us-ascii?Q?y9IllKDCqhikaiF22lUqRwq5JRn0Yk8ilnKPDuesJhga02xqPF70gwc9hATd?=
 =?us-ascii?Q?2aa2d8DVh1Y7pu00SKG1DPjtuSUoSbt3jwrii5vtt10iebpT/LiuBIlhQZO8?=
 =?us-ascii?Q?CdW6+uuQ6IxE/SYtGqN3vD14+Stu6MhSi/VSdfZ4PNKYkEJLI/ltlTG1dRMY?=
 =?us-ascii?Q?dCOmvZMxQou9RLmciFWlTbAhV7STYJFy+b+rZVxVXkmVLBWzJo2tZgNjMDby?=
 =?us-ascii?Q?TlfdfVSAeJ5jE2SdSuYbaomzlELrE4II4rFMKLbWfspaFBkTYHbh18kQbqj3?=
 =?us-ascii?Q?a9iU4MPp/Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hXpgta6DllJDK8gVUTBPOeBaorV2RtNfUxzoTvY3Kn9FM7bmTgihqTDkE3UFid19CkVq7l1CS3TRuq5hbj4sGqXKFnQA8qWtLyS7Nzy/trWQhPOPzGqWC24ZsRfMWRpu7MUUJVE0lOC6L76elHSkqAsA8vV7Okhkt/fobSqtj4SFu1NF4YFFlnlRpuQdyBsIm+DbfWAZiuyc4C/O/VyO9mtqEWvE+rxDwlkPv2v39esXcf7oScEp4nEevITfTs1hIdpjtLBSMRRTDJ/+90x3CPeA29eKcfiteYDoEnwpSPbnriyudAI9jWPSK5uZxvVuwn1bdwph2Uo6Y3Csd1lAIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93916992-ba8b-4ac0-ffc0-08de7a297d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 20:06:14.9884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKSoj/dA3dEIqTCI9KwS/FiMmHxeA0zA9P3XPoD8yRIbWpNwTlqtfLwisedcEJW0Ux1VkRSnl48o9uoNLhrURnwiY5LMO1Vv/McY9L++V6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9181
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
X-Rspamd-Queue-Id: 05D7B20767C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,IA1PR11MB6418.namprd11.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.j.ruhl@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action



>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of David=
 E.
>Box
>Sent: Tuesday, March 3, 2026 12:20 AM
>To: thomas.hellstrom@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>;
>irenic.rajneesh@gmail.com; ilpo.jarvinen@linux.intel.com;
>srinivas.pandruvada@linux.intel.com; intel-xe@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; xi.pardee@linux.intel.com
>Cc: david.e.box@linux.intel.com; hansg@kernel.org; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>Subject: [PATCH v7 1/6] platform/x86/intel/vsec: Refactor base_addr handli=
ng
>
>The base_addr field in intel_vsec_platform_info was originally added to
>support devices that emulate PCI VSEC capabilities in MMIO. Previously,
>the code would check at registration time whether base_addr was set,
>falling back to the PCI BAR if not.

It looks like this value could be set in the various static info struct (tg=
l_info, etc).

Would this be a reasonably thing to set/do?

Should the documentation be updated to specify specific use cases?

>Refactor this by making base_addr an explicit function parameter. This
>clarifies ownership of the value and removes conditional logic from
>intel_vsec_add_dev(). It also enables making intel_vsec_platform_info
>const in a later patch, since the function no longer needs to write to
>info->base_addr.

This makes the base_addr usage a lot more clear.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>No functional change intended.
>
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>---
>Changes in v7:
>  - No change
>
>Changes in v6:
>  - No change
>
>Changes in v5:
>  - No change
>
>Changes in v4:
>  - No change
>
>Changes in v3:
>  - No change
>
>Changes in v2:
>  - Use pci_resource_start() macro instead of direct pdev->resource array
>    access (suggested by Ilpo)
>
> drivers/platform/x86/intel/vsec.c | 23 ++++++++++-------------
> 1 file changed, 10 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/platform/x86/intel/vsec.c
>b/drivers/platform/x86/intel/vsec.c
>index 5059d320edf8..46966edca03b 100644
>--- a/drivers/platform/x86/intel/vsec.c
>+++ b/drivers/platform/x86/intel/vsec.c
>@@ -271,14 +271,13 @@ EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux,
>"INTEL_VSEC");
>
> static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_hea=
der
>*header,
> 			      struct intel_vsec_platform_info *info,
>-			      unsigned long cap_id)
>+			      unsigned long cap_id, u64 base_addr)
> {
> 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
> 	struct resource __free(kfree) *res =3D NULL;
> 	struct resource *tmp;
> 	struct device *parent;
> 	unsigned long quirks =3D info->quirks;
>-	u64 base_addr;
> 	int i;
>
> 	if (info->parent)
>@@ -310,11 +309,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev,
>struct intel_vsec_header *he
> 	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
> 		header->offset >>=3D TABLE_OFFSET_SHIFT;
>
>-	if (info->base_addr)
>-		base_addr =3D info->base_addr;
>-	else
>-		base_addr =3D pdev->resource[header->tbir].start;
>-
> 	/*
> 	 * The DVSEC/VSEC contains the starting offset and count for a block of
> 	 * discovery tables. Create a resource array of these tables to the
>@@ -412,7 +406,8 @@ static int get_cap_id(u32 header_id, unsigned long
>*cap_id)
>
> static int intel_vsec_register_device(struct pci_dev *pdev,
> 				      struct intel_vsec_header *header,
>-				      struct intel_vsec_platform_info *info)
>+				      struct intel_vsec_platform_info *info,
>+				      u64 base_addr)
> {
> 	const struct vsec_feature_dependency *consumer_deps;
> 	struct vsec_priv *priv;
>@@ -428,7 +423,7 @@ static int intel_vsec_register_device(struct pci_dev
>*pdev,
> 	 * For others using the exported APIs, add the device directly.
> 	 */
> 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
>-		return intel_vsec_add_dev(pdev, header, info, cap_id);
>+		return intel_vsec_add_dev(pdev, header, info, cap_id,
>base_addr);
>
> 	priv =3D pci_get_drvdata(pdev);
> 	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
>@@ -444,7 +439,7 @@ static int intel_vsec_register_device(struct pci_dev
>*pdev,
>
> 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
> 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
>-		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
>+		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id,
>base_addr);
> 		if (ret)
> 			priv->state[cap_id] =3D STATE_SKIP;
> 		else
>@@ -464,7 +459,7 @@ static bool intel_vsec_walk_header(struct pci_dev
>*pdev,
> 	int ret;
>
> 	for ( ; *header; header++) {
>-		ret =3D intel_vsec_register_device(pdev, *header, info);
>+		ret =3D intel_vsec_register_device(pdev, *header, info, info-
>>base_addr);
> 		if (!ret)
> 			have_devices =3D true;
> 	}
>@@ -512,7 +507,8 @@ static bool intel_vsec_walk_dvsec(struct pci_dev
>*pdev,
> 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2,
>&hdr);
> 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
>
>-		ret =3D intel_vsec_register_device(pdev, &header, info);
>+		ret =3D intel_vsec_register_device(pdev, &header, info,
>+						 pci_resource_start(pdev,
>header.tbir));
> 		if (ret)
> 			continue;
>
>@@ -557,7 +553,8 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
> 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
> 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
>
>-		ret =3D intel_vsec_register_device(pdev, &header, info);
>+		ret =3D intel_vsec_register_device(pdev, &header, info,
>+						 pci_resource_start(pdev,
>header.tbir));
> 		if (ret)
> 			continue;
>
>--
>2.43.0

