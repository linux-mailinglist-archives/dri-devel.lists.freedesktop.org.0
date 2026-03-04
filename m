Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM6BLpGKp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC61F93EB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691DC10E90C;
	Wed,  4 Mar 2026 01:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RYiZja5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9520110E90A;
 Wed,  4 Mar 2026 01:27:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUEpwqnDbdPpBFRDxd8rnb3Vao87jMfH2abY4/OrjXVEGZc9rOA6dtPM9sl0ZHHPA9cyyL9xKk+KkW6bElnzgtt7PyI0PIAMRPES0cn+yAhCTMfwzBcSny6Euwrtq+UPFDyqSwRIVSG6k25wfijiYiPook3rNZUzm9xetExw5YmCEqtBM7OrbEbgfJR4EIhJFIrwz/AAu1BQVWGB7hqTcyTpKh+WTt57sGy3WKJ7U1Ey5p6wgNaXjUCNtW6lzw0/Qz9FaSuAXp2xcPovmgXNqCLz7PuFh4e6JGP1W3Fkb8z2oN4gBfSsTTRz5WV6bIYoqRY5ZquiPxS9HArdSmZ+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=;
 b=t8wacObLG0AtvAojklDfDBN7M+nNgorS+XHCHCBT03FGhzaMrqG50IqW2452P/566lxsMgoPpiDWDPgXMOs01T0zT7NDFr3BSLHBVg+Du0aL/ipH/l1/4W/c48GAQTo9ROV2c+oGqaag7pXbY0UfUC5xNfP5zRMltohel28YdwkYgcWgzCO+ombJ5LLIkSAi2Fsd2Baj1PfCwg4bMSsn5I6LY9u4KOm+jtTqLOQF1Eyuj/NXVkRi3fDvO/fF7TVZ+Qs2XYTnEbe/JiTVpU4uPVYTb9Vc8j4lPZbAKFWmGxolWzl5s2veg6jErv6F36Rp8zqlULNZ9C8FV1uyao3u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=;
 b=RYiZja5NTXFxA/THkqh9oYYNQ7N6NlCbbe3SeoUPo09/eEzXD8gihvHKCM/RaD/iQcIZOzmWSNLPept1DFHUHNQYv+eRG/AwmkhkGbqo+N4t46p4d1SqRPPeOAHgMPXhKsr7gSP5XXLqaJCBWvlmWWRlXS3Oyt5zAq41WlGGh2z9J2p82btAv1AyjLheMFf7r+vwpsqib0xz8iA3NIHCqeVxQow0L7Dh8pWi0CUIIRWKa4XosCAmH874K9vZiU2lZ1UP8ZlzpwNGmmLSHkRvKHigv8hSdDpJfjwlHg0wldEAvm7E9IDjlMFLfL5op9vdKkyZKrbO1dOE3GE0cuq1oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:31 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:31 +0000
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
Subject: [PATCH 5/8] spi: use rest_of_page() macro where appropriate
Date: Tue,  3 Mar 2026 20:27:13 -0500
Message-ID: <20260304012717.201797-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0595.namprd03.prod.outlook.com
 (2603:10b6:408:10d::30) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff22217-fd5c-4cb4-bb7f-08de798d3498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: kNpItpHekTNXaKTKIoYtGV8Ypn7ulc25MzyvMa2NB7zhSgWxNFJ6YoesWE480hRO3kIFHehi1NL1IAFEF3KjqvV3lkLvFxRPalMczBWKU48rBG9YCt/iyiFTx3U3QRa135ph3fAxkK4pqm076Ap1smGC2bfo3pj50DEcTd5iOnMmN7Wzrb5T1Vzw1dv9rGBbyzetDoXhygbazWgvTZgeLoFfmierJeksW6ztYBDE1EQNDjJp+ne6ODaVuPIZyNSEOaPTTU84902A2oVkMAAzvzl0JCsPTk/9B2psN3OXDCiYeFIgo8YkT5bANW3qxmdf7SocpEpL+rj/lG6YqYFZTD8fNIRQanarlNMaXlFFp9mG3IrYPXwsB+5a41IiNL6ofEnTLmcEZyjRh6blNWr+cuC76R5uk1CdlgoGHJZV3JBXbW9odm2bBKGtsXSlfJzbr1Ax1uYmZSbPwgjMmpiXY8Q28Sh9pG7Qpu59S9loQjFoeuLaMT7qNhUIrcE/5e88qU0LQE500uvcPyVbKp2r0hWH80EkosvIZRxvUr5ZjaPUEw+DR/lRC7gOgrUkBG0gMyDH4YX5pb4MiWsQr7n0zOIf4SiGwz3zxdK8g8byYcGd2Nfv/tVVm0W9hzCm6M1CphhkW5juUUIdwXoMptDar5P8tqSLeP8d3lfndR1eaZlC4cANgDccvwLq++HeWiWBuGbBVDH6Z1RNrscJyfyHhd5ItUAhGylKpHVpT6m+ExIka1qj7HSsQeVUyvcIlRMnx+Q4QWBZB5Yy9LBrHs/c3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QovhxB1t0D05zU82J7ljlNOcfFani18E55Vci/LJ5lFSVxGGxTLMHD8dNWwM?=
 =?us-ascii?Q?Da+r91pDr/AjeXlSvVnuXr9KvAOYU+u9spNyh8YrRm7aV1z70UuBwFET4gDJ?=
 =?us-ascii?Q?fxDxS+Jbfg6JiKlOhMh30S4Ea2PaeyFaUA0U+2ORN/ql1E1kJetHVNyPu5vM?=
 =?us-ascii?Q?mVd6wmVWNygYY7pvVJiG/nJlAK79Jex4vNlZqZvyi12S3fcy9Sfmh07SsP1X?=
 =?us-ascii?Q?4oVT4s84uL9spRPxpKENVyrNNik7bEEQRCQQ3pP2tL7CFwO5rTx4qf+0YZ9j?=
 =?us-ascii?Q?y/QD2q2v0nqFgbER3FB1YJGEIN6cJsh9gtOvAV2CarMqdUIZxC5A/tHIw5LQ?=
 =?us-ascii?Q?Wv+9QpJ0GLCvHBPB4BfVs75pK6ARqPVvY1JF4XW8WA1ksRT73nDAPDsVn9w6?=
 =?us-ascii?Q?nMPo81N0pUsLNa25STin4h/fSUQf1Y6JNqLDQeCSKD8vaJhgyibg8eqigNzX?=
 =?us-ascii?Q?Nor1uobYjGsFDTklxq501v2u9N6zh8giRPC8nVXJzzgKSG+IUGa5mOkx9vhy?=
 =?us-ascii?Q?Xy1to0vOqEmXnsvqaFPmXO85LqjtLGGJEDuGFgP/2yH3VyDSWwlwuGUiA0Xq?=
 =?us-ascii?Q?hU7HBKgtNhmFqC/sHOw6QUreYRUr11Qn5k3+U9is1qHpR+oVS2oLfwoy8i0a?=
 =?us-ascii?Q?J+rET2Ft1bKpUTiuvdPn/lAYlcQQ1YBtBNJpxj+UceOZRowiiY/rvt2sSU/k?=
 =?us-ascii?Q?Dipd2WP/7VGEg6rLW8z+55Qq4D9jtkRxw6sQUdpI1PCz32BNzRBDHgUBH4n8?=
 =?us-ascii?Q?QMYroBQZqPM3jTHwwAuJr7qV9mxn7Q6mStMIdpr+7CJ9fcSC/f1GIw5RgdlX?=
 =?us-ascii?Q?5fabSXQnw4w+KKincKOThnWPArA2EzJklK4vBKYJalDmyoEw3/orxtxqRbsB?=
 =?us-ascii?Q?Zj4J6lAtU3semknfNPdiR+hqd4IrUmKHet3qpxdLA1Tqw4wysCvLftZ2F+wa?=
 =?us-ascii?Q?MV+xK8Btl9ooNwm+B2wI32UM+MNDgdhqRIrC3546u/HjopTuUShPV+WtWK1S?=
 =?us-ascii?Q?NUxkCYO+FX0XWapL4yKZWzevaiGmjxiwb7QQ9u5ohFZyZe+K5v4kwHZS+GVt?=
 =?us-ascii?Q?hrzF9jaQMJ4DHVQQun2V071lsUnC69dnpQLZqfkcnlfPwcw/bsqomaBU6y/9?=
 =?us-ascii?Q?6XTB8Kme3WvCQOEBib89w2prRquH4XaQ8LX7NxIxPNE21YQR7dzvLP9YziHs?=
 =?us-ascii?Q?vV92Rq4bD0WbB+uLxt7Ruooxim7k+wIo32Hqo8P1m+qsRoUczWkzBqPVl4Yh?=
 =?us-ascii?Q?saZyekj16IO3xKfAEfXTLtYRZV/Db3gzzHKdHVwlfqyJFrhOtK+0uDSNwLTX?=
 =?us-ascii?Q?ZA/kaws0Dl+TASCHgepQsYBXjYscXVVEOM4gQh7h+QcxefwGxlo9Rv7ndTgr?=
 =?us-ascii?Q?KDqoB9mPwFzUcjfkqYD1+K16nmcuYEBjp3tDKMrhACtpIgijR4FiPPIgdC9E?=
 =?us-ascii?Q?+8p9BmBvItS45Mu3X096L8WIuhsXghje+0DHjSEGVtU2LIAyVJA3Syuw6Oea?=
 =?us-ascii?Q?oYYTr2IPKXvYwyxT6aW7ANzcG6NGdL2Lr2uRLz6Nrps7qglwqFkf7nMqfuBQ?=
 =?us-ascii?Q?A6+Hid9KKbK1sQULk8y6jYJFHzRm5pVWv0BqbrVoPaxe0rCnO6wsFhEOO0Q+?=
 =?us-ascii?Q?eCkGhPEhFG3bVg9HsHOb2ZPu6Szp0HSLTotSdfbdes6hDAI7tfo7l/2655/S?=
 =?us-ascii?Q?u5ycHPNHo3Ou/aNHd2VwYkwQXzeCux1TJpz7vAew8R1OGQoXQTP9J+FhEJUo?=
 =?us-ascii?Q?5SWPhbsow7CzkcunqJfeuNfBugEHsQtZb556aLKW6pCL+NaI4T8L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff22217-fd5c-4cb4-bb7f-08de798d3498
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:31.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJG2wZNcH0YZXZvPE/LWYWJh2EsHiMu0N3jfwzgwN7cnGTkwvvZpsqSRJA5D3KC4+XlZiwL38K7Vlhu5R4KnrQ==
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
X-Rspamd-Queue-Id: 49FC61F93EB
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

Switch SPI code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/spi/spi-pl022.c | 3 +--
 drivers/spi/spi.c       | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index c82cc522776d..78fce33ff422 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -761,8 +761,7 @@ static void setup_dma_scatter(struct pl022 *pl022,
 			 * we just feed in this, else we stuff in as much
 			 * as we can.
 			 */
-			mapbytes = min_t(int, bytesleft,
-					 PAGE_SIZE - offset_in_page(bufp));
+			mapbytes = min_t(int, bytesleft, rest_of_page(bufp));
 
 			sg_set_page(sg, virt_to_page(bufp),
 				    mapbytes, offset_in_page(bufp));
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 61f7bde8c7fb..cd4a18f3afaf 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1162,9 +1162,7 @@ static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
 			 * the desc_len and the remaining buffer length that
 			 * fits in a page.
 			 */
-			min = min_t(size_t, desc_len,
-				    min_t(size_t, len,
-					  PAGE_SIZE - offset_in_page(buf)));
+			min = min_t(size_t, desc_len, min_t(size_t, len, rest_of_page(buf)));
 			if (vmalloced_buf)
 				vm_page = vmalloc_to_page(buf);
 			else
-- 
2.43.0

