Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHGBIMW6oGnClwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:27:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43901AFC7B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 22:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8E410E9B7;
	Thu, 26 Feb 2026 21:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QjqFaphG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB36510E9B6;
 Thu, 26 Feb 2026 21:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtRehIRVNQMmo2VSTtMSECH03NUtSZF1QMksdKqsSyhrCf9JWkxuRUZT8PxWHES54V4CywafjCthi95dkmvloflvwhQZZ3CtTPeBMqNAXwYvFFWa1/BbITaFAlOZHv856rzb8i3dllN2SEE7eAJS+oRiadpB00S5YAymB8CKGQIqtTV7t+tOJH1Pt4KRf+1b/iZNA3Saa4JJtUgDVKF21DgV5RW2zC4Iai0X9vvtitkl76d8gnS0PuSydVL3F78qRUNU4ILfsN/faiJxUuWnAtBkf7yRggAaErvusAK8oJ0piGXAiSZ6cWD/f/uUYroGGOB234HmoJDmNdpWWfSBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=;
 b=e6WsXbsE1cPj8OtiHkxnXaSYMvBLuWysori40IQ8hQGKogRFwggPq90up/lTYpakKJvmpnBldXhZ1f1wkU+TFQPAklCJrC5JX7hbXmQOeeg3cHrUBNXhCkNuyKUNSkKARXiNqM34mKo7A2EtMtn9Rx8Kl1dw2Mfcfy8EortJXtE8YGDto2o52ZK7w1vJbLU2NEx7qORwAhhhHQY2yPAlXWTiwwgP/6Q/NT26xmP3iQ9tRzI5o8614FIoFaSKQh7MIGGrt1tZMco0zrplEg7XfJd+urN7tlDbF7SGLf3TFWbLzNlvvz0T4B9XN3pClfySrGLO68DJ3p1wSbk0wbogBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uKjc43mI572fFeDKQ8+KrzP3Jqy/FD/YnbIzRJv0Cg=;
 b=QjqFaphGLeaNX6Rq1NgArjRrYX76xO4iUF5+mumlvaSc9kuLw8JUYs4rtuc5WFNSQiHqqMCBa8jzqOEK7POzoTuQ51QfoEek5eHW/EYPa8kG5DIzobJduzI+DoLfpBmMPq1i5SC408MoRNUGJVlxCwtdILZ5yY3CsMtuKLvl8yaOaJYgtIav1HCph54SNK+TurvxvPpWSnp7HoW79cUJwa2JddNsuN/ZUuviOFKHXt0RppJ2ImKNxTb7S1Hwgqlc2cvZ1kOES9sd1Rvc4RR3WxsbYq2X9AWzQGOF4qlA1N1bdugQL30mwx/BGEv1bU3QeZAI4ej2AE1DM63ED9riKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 21:27:21 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:27:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Paulo Alcantara <pc@manguebit.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>,
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Brendan Jackman <jackmanb@google.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-ext4@vger.kernel.org, netfs@lists.linux.dev, linux-nfs@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, linux-xfs@vger.kernel.org,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v2 4/4] folio_batch: Rename PAGEVEC_SIZE to
 FOLIO_BATCH_SIZE
Date: Thu, 26 Feb 2026 16:27:08 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <A890368F-2759-4D02-841F-CC758950B0D5@nvidia.com>
In-Reply-To: <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-4-716868cc2d11@columbia.edu>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 95873c9e-8b3d-4029-5345-08de757dd352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: 3yjkJPTWlW+QmhMYV6Z2bbt8fbXjxoudaa3396emOIRmvTiF+Wm+yDFKpkYh/4ibzBJOSjTRsd0m7oLmlpjdvWr5j7UfMrUCGz/Ct+v1eC8Dmg7NYYAr+4joZOuwyDbdDljEd4CMaa6Ocn4VKcptWM7Ub7ImmQDEhMguWevlJ2yffun+KRczqARPx51VIFQynFBLMFJ6KB3mt9qOzdYsMURxvedeia1HwZLrJEf87j+dUyivIF8DuNCSCq0etOtr4RpbQO4qeo/Qi/o4NPbYPGtbdYAAp1HioibYgZm/pX2y7+0qUYOGMMhre64tBHFEOSrexBscR3x2C4SDrtcPZhqDd+24fbIJIiDG+jucNGE1IUDjneoOXH0jZIKKekm2TccCk1OUj7OCLK102LlWQPBln/4BJjtDYwu9UTSKGp7MuCOGzyRxH8/iGDbSkoHFw4On+iV/qCp5hIkoXXIhE25cWT2l65pUYMV6q/g0AuXgHhO/53Fc0rcSUhLvOCeS1qjVuQ+kbQ+Cc+TejahNKq22e1koVJiu0LvwYBJp5f5dKgZoRp72Ohi346Pai/CIYGq05EC8PQukMj1f1AvqkgkOphAHEAYtXZgpLmjAvTtOhKOYUgHjbTElwL4qDlayfZlbVzcII5T5CPZ5hUUkmzMKc/ddzDZVZMFMEUps69iND5dNeK/UehwJdVB0xbc475LOxNsS9BeO2gQvo6X0iKSTUluYLj8PZsb6EgEHkoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?48Y5TV7dc2GZx0b1wplzMo/LoWtmFaZENzl6jygOekoEUi5IMuDeahxLNZ03?=
 =?us-ascii?Q?RjLr4IXFL+Tss7DnNSb+Pz9ZXZpQjyg9lhzdTrx8rF7Xe13rzgNzZlCT5RXo?=
 =?us-ascii?Q?+uaNYvq28NPZvSZLqyLyy74kNvq0KgvOWFuSyjICwgjaWHA4Mv+ruSTpXG+2?=
 =?us-ascii?Q?PbVzdq9ntdeMB2C+A3MLKZdjxxvjhyINzj5H3l7V4UYPWi1rlTTnFspIlwRt?=
 =?us-ascii?Q?Zv/8P6a+SrnC4DzFC7Q3NkA3BuzA1bTYLA3WiJtQ2/Pnp3vqCqSugOavNKf6?=
 =?us-ascii?Q?8ZtUfdUgVB22+0wIk2twF+Uc+YWQKtQw27lNCP//D+aBJKCKgSsvp8QG2RSr?=
 =?us-ascii?Q?hZQVrXUFWzrM7Ovz61U1YqZbj7JMrE/6zecKlbNiePiFV5qzsQqN1jLKhOlg?=
 =?us-ascii?Q?Giq/UHUEk61UWtpPouz54VmOgc+omOGcO0BB5TWcEcUODz8m9wKJ23S01efq?=
 =?us-ascii?Q?VTOjkRqjtqQ+gp5YQaEnSmtdPN0hkP/B6fvp+by69m/WeeLplFAc2SJRjau/?=
 =?us-ascii?Q?Qod7NLRQ5xV7bRWMyVNsIwul35nopG+3O/JlZXmTx11+P0wdQavzsHcOqOdk?=
 =?us-ascii?Q?zJP3RuwsTwYFHWS7+H0WX4UaLahRdOdr334vQL4GRCdUWlFDs9yiLeDHis/c?=
 =?us-ascii?Q?67ZGjcZ1yQpEdY5VTCk2s2VnMGktiDm+XqWNaOUvamWw+EiPDCkpzzwIC2QZ?=
 =?us-ascii?Q?w0jx91vAjVOM+oeE1fAT0CLSxAOWXQTabDPSWsKNDxO9gZJXS1RQ3ecMLzEA?=
 =?us-ascii?Q?zvO69fXifJCc1AKHeplb8WhO1Rrg25jyWgjC24Kga/xr5rIoBej2EWbdSSR+?=
 =?us-ascii?Q?Z97YPen68zbvXfn925nGnT9kJpwyOPoNEYfoXKi9Dkn3Zb3Y8NzsN7cTdIWC?=
 =?us-ascii?Q?qNwwUF1Fa/nrmwz/eV6JSyD3b0t5FLwRE3SxAp2z4wzRB6ZZxTXt264oiIY7?=
 =?us-ascii?Q?IIZbF21RF0mpqqFFSwEEIMSNsNCylBi5gkxgrmBSNG/PyZWvOZMv/xs1xT9S?=
 =?us-ascii?Q?lVp3ICxmDJZSvSnICuTnS5tBKGxp1sYv1kpYfbRkO76AVOlo22ea+4JxHOR7?=
 =?us-ascii?Q?JFqlzHs0s63F/UaI6xpaC5xDYEtkeQ4uT2ELE8fRKYzWkfkBC+U1oNSQVbW1?=
 =?us-ascii?Q?jznuTzCOWVUhYa92WWP13oMCrkfGwQ0ppo8HyKzni4Y7WRXORvkzQRNLlNMK?=
 =?us-ascii?Q?FyPouts0Y17ZuTuefOqYAJs9BSpZVkdVDlqzCl3+NqpO8ybYIze3T4fGgEjc?=
 =?us-ascii?Q?HoY8Morbxi2B6GhD9qhKQwkFBqXhE8yg8BjXGia32C7jG6XJWE3WiJg6Xv9e?=
 =?us-ascii?Q?mhLpSj6M+7nErYKdNp+WD//ixLhQrrdbbgtA/f3smsWszOHvIGSXKT3EZu9I?=
 =?us-ascii?Q?FyofC6cvQjxgMXQxWwt5P34Fn4mDIybbnRYdvMQBKRAU0ZI1nC1bVNIlOPjx?=
 =?us-ascii?Q?/npGHwZIS/YDEkLt+yv0fbkovhbSpuIj7tSSo7pEMhtdGMDN+9KAQRHlnTSw?=
 =?us-ascii?Q?d/ow0Le5B9zPI/OpCuLWtJYqH1ot36vQCvxImiDef6SP6yItRNTePLl0BZw+?=
 =?us-ascii?Q?oFOCmmJFiyFh9QWRa0nLigvThlIJoPJ+8CvTd2FmK7WE6OWvFIoksdYvNW9J?=
 =?us-ascii?Q?pDzEU9Llih8BBuRTADViD1znDJ2zK2VBakwjbkJd0OcUR6ZNtnQxfMSyNoU5?=
 =?us-ascii?Q?8Z6wYe36F80pY83pbqipF9Av97VmhU5qhhlGUA0QZClanPbi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95873c9e-8b3d-4029-5345-08de757dd352
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:27:21.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aduMoDd5lxnqMcBQuDO+PXo6/4koqjDzn/hs/w3f5Ey21lau5RgRDWDzNO4s2GJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,auristor.com,kernel.org,linux-foundation.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu,dilger.ca,manguebit.org,fasheh.com,evilplan.org,linux.alibaba.com,samba.org,microsoft.com,talpey.com,linux.intel.com,suse.de,ffwll.ch,ursulin.net,fb.com,dubeyko.com,linux.dev,brown.name,ziepe.ca,nvidia.com,cmpxchg.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.sourceforge.net,kvack.org,lists.linux.dev,lists.samba.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,columbia.edu:email,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: D43901AFC7B
X-Rspamd-Action: no action

On 25 Feb 2026, at 18:44, Tal Zussman wrote:

> struct pagevec no longer exists. Rename the macro appropriately.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/btrfs/extent_io.c        | 4 ++--
>  include/linux/folio_batch.h | 6 +++---
>  include/linux/folio_queue.h | 6 +++---
>  mm/shmem.c                  | 4 ++--
>  mm/swap.c                   | 2 +-
>  mm/swap_state.c             | 2 +-
>  mm/truncate.c               | 6 +++---
>  7 files changed, 15 insertions(+), 15 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
