Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEGpNoeKp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855A1F9396
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B954C10E901;
	Wed,  4 Mar 2026 01:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T1x3dr5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A010E09A;
 Wed,  4 Mar 2026 01:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm/VnHnpDPQIQYcS+jZghbeqSPlJONh/rihh8kOsTQWeaBwcMzwMS6LqH824SpR6XQmLXCKB6IJ5fAW5CucBjmY1Q/T6mPOLIuSIlhiUtCYHdnmdu8ZsCncnXuqkuiCzACJRfGGIHrU/z2tUx1TQ3gA+6GzB007lzRcNyeKrhy7gjSxHdET7tQM0oitkY9X0irmdTAuUbWgTBql53P92zRBFsRJwOcf792R7lKiN2z2YWOgT9+GuSZnKxVW5ionNW28amrx2Jie6dIhY+V8CcfrgUXM2hBlJi2JbLedarCNbHobtoWNQLmFSiaWNlZtItvHDf4fXu9uWU2ijzhsMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRSvKdolX3cJvMiUv+2Pa5U4bClslgETVtpoYDq3wrk=;
 b=rA9wVEHd1De4y7fGlzc10SS9PTIqUmoAQ0UqdOKk02GVwAgy5I7aeA9crrkpiozGuAPreaeqdfUKvWc71Lm4z1eRYIFbFeaaK7S8nAvMJyRpvFDGWA+k+LsfJJJ54GMTrtfSfD5vb1QkFKktBJuyYrSnvpQIQ2lMNsEZ5tilKkZhRSedVcz2+pvLuxCbccj89m16Ki+XF8GAU9BgxegM2ciy8a5VuNUeVGaaBk7jEko+EOUZZhN8uQfqi8feTxs6o+0yO68KNlVQFFU52xX8WbfATPMSWMUOQ98oTxY5o5P3vOQu4ll98eFErPd2onGevRjA7C4PUh5x7OnPw2BK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRSvKdolX3cJvMiUv+2Pa5U4bClslgETVtpoYDq3wrk=;
 b=T1x3dr5bl7RHDFLPNxCv5Er6PT7PKmd1nW7DArldd5hr+qqrMi9gybc9TRxgccBUO0PKGieAeUnN6vVeFYc+s0iFUqYO94F68sabpuZfom4W+MZFjvbhRnFojnOPBA3jQOmQ0l2OKh/QRWrRdC2UB+Xw/56QDaC4E3opyqU2BuAX7wxs186698bPb3d4IUveRSNLjajFHV0EO+aScaF3sJw+JMsNfYPEIcwmJwRMuirU+cjCuycd6YZFRFHCpi4xReJFBz7yWpPQTZ7OIbPyTuGnkt72/u/tCv9uc2qGttEDMBEsblz7KWSKPSr3E8k5PY/yRF/r2sDuGv37uZpuNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:21 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:20 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Chao Yu <chao@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>,
 Eric Dumazet <edumazet@google.com>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Jens Axboe <axboe@kernel.dk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Christopherson <seanjc@google.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Zheng Gu <cengku@gmail.com>
Cc: Yury Norov <ynorov@nvidia.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-block@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, dm-devel@lists.linux.dev,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-mm@kvack.org, linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
Subject: [PATCH 0/8] mm: globalize rest_of_page() macro
Date: Tue,  3 Mar 2026 20:27:08 -0500
Message-ID: <20260304012717.201797-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:408:e9::19) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6ed4ea-07d7-47d3-22ea-08de798d2de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: EJSb5AO6p5oAuFPpEYmGGSPtTg65RgEQhbQzAgFRFsoY+L4pkN3PI53L9q4qk/lDqSuTSprt8Q6a2rBdmBzd3xiGIhBYQWn72TwJi1O5TC2/gxxzhYqzMxi5OpoZSrm8e4Tr8Us456TttKhQZ2v4cJb2flYpxK/JBKqkpdmukliE3Ov4LQyCwLes2VNF6PNcdpd/ZSE+jZPDw+P1qb/9/+QGZ2khiFPO8jxf9iNDqi3uNMVGfddvQWLPZJd5lFbXzEjdPh43dOX3W2ysr7Gb7PNw066wkrMa8MX/U7jusY7A1Y0N78iZBNQhAX15Iesk7y59SQ8PlindxQ/rLCko8GysTd3NE8I3R62ddu9e/LlitOWkNjPp5XUis7sCrDZ4CcPLP9rU3siYy8C3yqhOXEo+bCwq8h7suPVbgRQVtF3cCUIJkvjPTZr5FM9H7Vh31W5hjBGpjxjMZeINBzZ/iv8TjcDfIEfGesCyzZYawS7hV4bAL0PzvuuaZ7C1172bv1ezc7a9MMHq/+096Aqy7tKFGq4JdM2q/MraGfS2j7ZHFdezZWJJqpp+tkH4sZ3sTyLC7R24A7Kip0PGh47V9Ti+TGExBXVeIFDFmAm9ScPjIc5pF4Q7XZTyT9v0sTbtFK1Fl6Oo1OANjeMWfNJvN7ZsYdSRGgaDohrru36CxclHRkbsPDlQHetn1NHziKEtO5tJzEz+KtkF7AM3t8OIi8SnqQ4i9OiH744/4H3BVm8gQsvaXGbqiz/kSl7NRsvFJWk/xm8sNYKaJKMiKKBY6lIi8rWMq4uLJufj3E0A98g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5S/xGfJhxq7PH6zLNWYwhusHSMrvUYH0Un9YPofehcsuyq37tlRoAbcoKgE7?=
 =?us-ascii?Q?B3FhdSpJu0cWLnk51jwgWmrAmlTj0cTI5MFhy8NwE4yTHRMtNPYIzm8lSJJL?=
 =?us-ascii?Q?PEBdmpf9rEczOCoN30GBnabffRCF/cUrmwNJRkMpps7xBOVMVIHxLtJ6CpW5?=
 =?us-ascii?Q?Uj9SaoeprEjwZEcEh0FI+MngV8ki2BD57VWzzMZ+9uiYhLDjQguHH/Bv6FbR?=
 =?us-ascii?Q?cyE14m8n0pbMGsPUmYIx1bWfUVJoXj5qWr4Zs2IUXQiWYFdHJGfohr8Y/E7J?=
 =?us-ascii?Q?AVfuDfjp3OfMDcg/cYNHS8OelMiIlaOpT7Lnc9br07JRkZ3eNuxftu0oOzYh?=
 =?us-ascii?Q?emdBx82p+SBinByHoPw0aPrCNGNHOHwMXerHd2CtGcetK2pS52xKukAx3Kpr?=
 =?us-ascii?Q?4Uzh5OG42/7t5HMbpxQVnbPUPOPDCt2BbfvYZk9J+ZCxN3pIK68sUdbrHMt1?=
 =?us-ascii?Q?wcO373zT5EBT4+EyJbZ9s6o28DNWwL0Q1aOFsYrqdJ0o8Tq6dVxP5XIvEHMC?=
 =?us-ascii?Q?+An9Wuz6fiaFTLL1IMm3PGoRAndk+z/xnK7AjkJA7dlSZzi2On0ltyL6LM7Q?=
 =?us-ascii?Q?eAKZDuxwbS5W1OamhrKEZ8agZCYB0NcazrVK+Xm3NJIv2qRAm86mjz+BXZNQ?=
 =?us-ascii?Q?vt5tUuKc71XXuXlJnb7hCso6myekDc19VP5UWKSpzWX52FVDiwrOUAhNW1JH?=
 =?us-ascii?Q?/N+KSGG1fa8We+fQleRZaA/mc1zx7PZq0L7wkk2Z0NWbI9AkGtFMhBYE492S?=
 =?us-ascii?Q?j6qeC0H1TsTVV3/6CHeY4psAL39btt6IshskvcJjGUWK3wZAlck8lVNyzrHa?=
 =?us-ascii?Q?djTtvnCsVCvXS/oXrznc3xQhMBisJsfct9fgBcG9z7cxo/B2pLrgr9OH3wD4?=
 =?us-ascii?Q?kZDfdx8XFrRDNwbsFeIj2m6mleQowKWLzsfP0h6zyY/5JfNcwdpz8i6vx8bl?=
 =?us-ascii?Q?ccnno5iLoF5u1gF0+Vxmr9wvOhIkBvMFPOQwtuab7iL5AO6is8ZkKs3PHmf6?=
 =?us-ascii?Q?0lRc0StRnN4/60EJf0H2xSZADkbRvqIlDX7Ia1WlPG5oCQyTOs+wIdQANf2/?=
 =?us-ascii?Q?vxSmcYVNYb9goJhgIwQ55CJxrdFQzD2NPO3uSlramK4zfulzHkPoq0f+uNBf?=
 =?us-ascii?Q?dYMAgeKeoRauP5i2ZDaAB4m4y39PJ4NQesQIwA6LtlURhumee4zQH198wLVD?=
 =?us-ascii?Q?qO2YsxM9F++y7+EVywl26hq+LgFz2VsjIQvEeB0K7GoJU20nwwua8V4DL0nb?=
 =?us-ascii?Q?/qQ+FM3hs7iaGcrUYE1u/epwv6ZgzzbyVP+bisUxXNKF1QXfHwziARbPl98r?=
 =?us-ascii?Q?HjBcy0kSELG2X9GdAsG6yg0fHm1xX/4eWrTBC4pl6YTbU95z0+QnEV1oUNa9?=
 =?us-ascii?Q?US8FEu5GnOV5tO5kX/t7QgbYRsEWGRz7eUUaVj6GtY2KZV1+mM23T0RYz/4x?=
 =?us-ascii?Q?GBJV5W6KTd2I6QMtaG3jGsJvDwN/vLDYUDsFzjstqbQ0r6WSS1fNiVRJoa+S?=
 =?us-ascii?Q?P0lRAxTRScIbX28G1wPUyhHi34Kk0Xhb+9FUX7pssSt54Z8Vccc02HAw5dJb?=
 =?us-ascii?Q?Llgn7iVV5Wco/3up56kFUcmvXHf6lSPsGrdBlIE/Ylf5kCFX52O7ZQhqG/Hv?=
 =?us-ascii?Q?4kKCXEF9I2/ufZ5K5Ww9jBvduETWekINb6+A1YbtW5cuzzqiu9ddeTB4APz/?=
 =?us-ascii?Q?6maz++AVh+e84Yxx4MeGqvZ5f73onH73V1vl1cpjDChSSB+ujkmJHEGIvyew?=
 =?us-ascii?Q?vHi1dyWLH/GNctIyBHTNffTLNGdaMs/dZGi+dRrjaBdlkgv7JeSB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6ed4ea-07d7-47d3-22ea-08de798d2de2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:20.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Lmm+XVjZYyMMKaXXXS817iT5VoaRx4GbjtH3sXBl09zO/C4kzjI8NuzoQ2rOW9d6TUbJNSeZvIbtW2k70y9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
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
X-Rspamd-Queue-Id: 5855A1F9396
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,davemloft.net,redhat.com,mit.edu,eecs.berkeley.edu,fb.com,linux.ibm.com,zeniv.linux.org.uk,dilger.ca,lunn.ch,kernel.org,opensynergy.com,alien8.de,arm.com,linux.intel.com,gmail.com,codewreck.org,linux.dev,google.com,gondor.apana.org.au,perex.cz,kernel.dk,ionkov.net,ellerman.id.au,szeredi.hu,dabbelt.com,infradead.org,intel.com,ffwll.ch,suse.com,ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[86];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The net/9p networking driver has a handy macro to calculate the
amount of bytes from a given pointer to the end of page. Move it
to core/mm, and apply tree-wide. No functional changes intended.

This series was originally introduced as a single patch #07/12 in:

https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/

Split it for better granularity and submit separately.

Yury Norov (8):
  mm: add rest_of_page() macro
  fs: use rest_of_page() macro where appropriate
  net: use rest_of_page() macro where appropriate
  core: use rest_of_page() macro where appropriate
  spi: use rest_of_page() macro where appropriate
  KVM: use rest_of_page() macro where appropriate
  drivers: ALSA: use rest_of_page() macro where appropriate
  arch: use rest_of_page() macro where appropriate

 arch/arm64/kernel/patching.c                |  4 +---
 arch/powerpc/lib/code-patching.c            |  6 +++---
 arch/riscv/kernel/sbi.c                     |  4 ++--
 arch/s390/kvm/gaccess.c                     |  6 +++---
 arch/x86/kvm/emulate.c                      |  4 ++--
 drivers/block/null_blk/main.c               |  6 ++----
 drivers/gpu/drm/i915/gt/shmem_utils.c       |  5 ++---
 drivers/md/dm-pcache/backing_dev.h          |  2 +-
 drivers/net/ethernet/meta/fbnic/fbnic_tlv.c |  6 +++---
 drivers/s390/net/qeth_core_main.c           |  6 ++----
 drivers/spi/spi-pl022.c                     |  3 +--
 drivers/spi/spi.c                           |  4 +---
 fs/ext4/verity.c                            |  3 +--
 fs/f2fs/verity.c                            |  6 ++----
 fs/fuse/dev.c                               |  4 ++--
 fs/iomap/buffered-io.c                      |  2 +-
 fs/nfs/pagelist.c                           |  2 +-
 fs/remap_range.c                            |  3 +--
 fs/xfs/scrub/xfile.c                        |  3 +--
 include/crypto/scatterwalk.h                |  2 +-
 include/linux/highmem.h                     | 24 +++++++++------------
 include/linux/iomap.h                       |  2 +-
 include/linux/iov_iter.h                    |  3 +--
 include/linux/mm.h                          |  2 ++
 kernel/events/ring_buffer.c                 |  2 +-
 lib/bitmap-str.c                            |  2 +-
 lib/iov_iter.c                              |  5 ++---
 net/9p/trans_virtio.c                       |  6 ------
 sound/virtio/virtio_pcm_msg.c               |  4 ++--
 29 files changed, 53 insertions(+), 78 deletions(-)

-- 
2.43.0

