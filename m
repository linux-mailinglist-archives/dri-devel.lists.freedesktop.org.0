Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJqZFT/Nd2mxlQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF78D049
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 21:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559BC10E4AB;
	Mon, 26 Jan 2026 20:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UdtSN6Nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5702410E48C;
 Mon, 26 Jan 2026 20:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsKCO8O0t3JimkFgdPHroD08fgqbhLSRU2t1ozb5ADXAO4V7cKd7ceNOvcsPJBiAlV0tnXveBamIh/Ph7Z4awcadmLn13NR/9x/RiR/SGverRElP5mfmlbNKdWyPjjyaOw2N6x11QMHdQ589CVU8rd49dceaCGmEbwjTQlNwyS3+Ly+jVSJLwIcueU1phYNNVJGOAJChgzOEuiu9ByQXVRCcg7EPfw4kRtx+uMc2EKBOawfGEZwdX/SseVHsE64iHO+VSjlDKtiPkvPVuuZwjypIiEDGg6QKZnFuk7kv0YpH/fXN298xWoCpO7VmBsrsJbZO8Sjt82iVRYMK6h+yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR7y9ABhJFTdgTrB9RQbGWyU6hRgNWjPb0U4Cu/4C2o=;
 b=XohtVjcp3Q0mdRSx9n6Cv+jCWc7rpvKe9fzlo9F86DmOOURD2v92q+TUWRSd0qtbIaxIpi/mlH0aiqkO6yq9JIrtQeTtIobEXg+az1agfITRUtbLAe55x4kgIGSyk6z20Y1a6DH+pvOWPO4zVN0zyk5/s6lq8+l/PlFfCmAN4VJIjQHQ4PgKmZpRUOWR29nbM2wjakixvEecoMrRVF8cbFEQIdXPDfO61/D0w45nHdHqxbr3qA2SRvsH3sV8/4MrkS9Z5IAxfjaaojooxKLmMbZFG7R7doOc97vVmzGyGspbSuvxUw7yY9QsnrNMZk7CtitBI6ihFZ8OH6diUtjDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR7y9ABhJFTdgTrB9RQbGWyU6hRgNWjPb0U4Cu/4C2o=;
 b=UdtSN6NldMsGkR+AIz3uJSHAdLj0e81uzU0S/v9uBKkIZYKcOZkwd4g99+C2wphZQw+UJMmXZ1cXeG8GWPJU1FTtUZZNR6lZ0MaPVFJvMCZE21h3tiKovcbuORtkbB1PMgjrO0Hp2SCF60cY8ne+SiPcpQSFCKenPuJOI+OyAEZQplMi6V0qfL3W4kLURnhfztdhIAgbBdnGNVv7lo7uaSUzQY40a+DjuZQ5AA6zJbknYcjqeSyiDTf0TrTPQrbzOuzjOC3ismJfs+5UrveoRFFsR/+yHJMmv4xSGR1GjEPJHLqv1Cw14TTD62x2q2Cx9pzR4C97ngwj3+LDUn3pcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 20:23:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:23:15 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 3/5] gpu: nova-core: use checked arithmetic in frombytes_at
 helper
Date: Mon, 26 Jan 2026 15:23:03 -0500
Message-Id: <20260126202305.2526618-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126202305.2526618-1-joelagnelf@nvidia.com>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:52c::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: d3834c66-24d5-4f77-f707-08de5d18bc26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKb20ZCVL5NnXUckC09AxyJMJFkjvljMDNyvqErgTnBTnCCIBoDxtO7lppay?=
 =?us-ascii?Q?CxNp/aotVd6cqw1EjgTA2Z9Y8fxZF+UR319fq0TPlZ2y0nME9prq9YR1V6Pc?=
 =?us-ascii?Q?2ppanXb0PIoyoYWsfQMI3GZJi4tAlIReT+kUFhRGSw3CyswJv5gZjM/MAnZc?=
 =?us-ascii?Q?+1ASWdLQx0P/EKfwTWlMXlJPeCuB3WL/4IX3t2DQs21dBzfFyfRM1aG8EiBR?=
 =?us-ascii?Q?q1wP/shri7Zh1x+I8PWm3d2IfSrJIlxwS4ENLwPKlp1lKfWkLWj1crhBkm/u?=
 =?us-ascii?Q?g9MTGcO6CkFQVK3UwafXXyrEq88lnfGFRIQYS6jn9gVxyB15gROxCbYaMaDS?=
 =?us-ascii?Q?5Yx3pGsT5UHg8t3L8gnlIj0FjzDD8DUomLa5xZFGY4Gt0C8O9mi/7TRJm+vt?=
 =?us-ascii?Q?zWK/rjDGrQPScerpvO2p3cwU+DHVZhXK3ZvLZ7ksaCWwHZexpql4jqsZ7sS6?=
 =?us-ascii?Q?g3HXpD29QlQZ8xHfDSPhU1kqFCsNcXaoUKW/1v+Jo8q975Fo+aQBmPaf6YAF?=
 =?us-ascii?Q?T7HC17aKeKyscMTQawHiY5iA6lojid3C8Z6KpDK2IewCxR4sn1nPZYhwYjOc?=
 =?us-ascii?Q?WpmweIR7lM8anktnEFik3qANlJeLawe2D3mapKRUcyxOLuHWEnlat9pLVbeQ?=
 =?us-ascii?Q?YAY1hKbz7tz95bX1bOvkzCIlyq+xv4munT9Av1vPpKFZFY6Joe9hGzby2Kk4?=
 =?us-ascii?Q?gapsTy1ppC4RdcFYRAjieejvApEaEr49v1hEvEuw5c15d+tA0hBlSwyfWGLK?=
 =?us-ascii?Q?mJ5X7DYkKVv+1EdvARoCUl1SKKXUl5YiZOeRyypQgD/Y1VJh+HVSaPDk3o86?=
 =?us-ascii?Q?Me0azf/IPTcCj/t84memmBeIDUHR3a21xxvdHOazT8ruBCPRJ4gMZ1ksivpc?=
 =?us-ascii?Q?3Kg/kBC/vpdtDntylACPp22/Pf4UK7dnD1yM0MOB3M6jakj5qsK47DiUnhiU?=
 =?us-ascii?Q?piNg0p/8xbRH3CiSywM2W0oIGq5bdtf3kEq/+A3zhBhhoYV2eDV4aRXFz/oB?=
 =?us-ascii?Q?Jv+7VSwRN+4aX6SGNeb+ZD9NwfNm5PVaBKPaOe896Skpwcta4LugO1vNUMOs?=
 =?us-ascii?Q?x0qo1fO7z+J7bxVdhVFhIkde9dN/Y5UpggZU4cj5LoepW8/aezqdZM2o7dmv?=
 =?us-ascii?Q?oz28SUzogpdj1uC1rtuNjsZdrNaI4Ts5Z8Cul2q1cCs3ih/JStT/IgY7bC9n?=
 =?us-ascii?Q?EY6JkUe9hsffxAP8CvfPKySK9O33KiLP+nsPQlXb41HxWZE3amJs8FEQT8Sh?=
 =?us-ascii?Q?5i1mlUZzKTcuLh/qUturgF9ty8G2Nk+JHd390oIEUmezfDDpMroVwyVnAkej?=
 =?us-ascii?Q?tAtJFS60enGpwp2rvjz1+1ji5j0Ejo6+eN0DKgHpkYLOQOgnwiiH+7iCal/2?=
 =?us-ascii?Q?wWKo/3cpwDFID6zGk7HKax7FO3lGWsEKYPch6fujY1nfgQGdFK9SG0OLU4kS?=
 =?us-ascii?Q?Sp43BOS/i78bnd6GSpcVl8lN6EoSwJaf5q2z9VNLiPfhx0Wc5os0ZjR/l9Uk?=
 =?us-ascii?Q?FZrjNxxGZqo/+F9legWrzfkYO5wwmb+LYQx079U6KDnjJ9TEOLxepgJui77u?=
 =?us-ascii?Q?u7VM68ndko4duXw9a9Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtN6kkrNdsN2zJ0einIQp3NfA87+8Frv6l6pKEw0/Y1rJCRHERDr2oJaX2EY?=
 =?us-ascii?Q?NcoMi0FScFEO9KFmLUo+kuWGWf0gTLM0WcLLTefipwc2/nE8x//FS8OSIHeB?=
 =?us-ascii?Q?masjdNWtTdwqJnxGK0vOPS7Cjkw4ex2o/8+c07H9487YvNAkBkuMWvlfnmkk?=
 =?us-ascii?Q?h8aY/fefCQz1Qcb5dIZq7CMU8EW+slbciBHNNQvdRGglNl/VoHp6L8j0mQwV?=
 =?us-ascii?Q?Yj7+cHjGcmsE8pJYmO2SfA2/V/aHE83XdCJRB0hVohTR07VOySGvWE4B2305?=
 =?us-ascii?Q?G6Xe+c2Ns4p0HT+KcnhRjXYWzgauJQzb9b0QBf4mePMzSVoZ4ffoXhTSAI1I?=
 =?us-ascii?Q?YBzV9PviakXDHiQP5wEtiPvqidlZ7AJDeE7nQQPCZAGj/8FaNQ+362QtqMns?=
 =?us-ascii?Q?l8jQ2aKjLVTXfadMJy8RIAtIuJDBe47t0ATSL+0lY9FNOB5pm81+uEoKBhPN?=
 =?us-ascii?Q?KRY3CFayFLGB+VBpUOFIIHnfz1Gu+9mXXN+BrJiymC+PARNotpIXOV7/stbH?=
 =?us-ascii?Q?DVKThx9pRn0G/jB44zTLW5AICq+7j+5J+gtkCohKpVcJUXHVNw4Jl/sJ5q6J?=
 =?us-ascii?Q?0tzoB46/2dJdZjs+e/iFjH7cLxXD7tdlOy9Wd+mw8G1PA0K/T/b2rlka1EOZ?=
 =?us-ascii?Q?uGt8FcESiRLR3HJuMUplUFVVLOxY+gejFILdoJQ07FJT8jgMbH+9X/MSDZHN?=
 =?us-ascii?Q?n8Kj8XVohjFRdsCWOce0tkksnNCOQmGB50dmvPuosan91VIZw1bIQftWFKqL?=
 =?us-ascii?Q?Q1Q7HIF+UH5Mw67coVpu5s28hwlSYKjcPsdByRHNpn32yB8i+iU3bnUnlfiM?=
 =?us-ascii?Q?wH72Xd+byrYChPtXbNXLPIMuE+glqUmXRzOmYLs+o+YKOdU7joy5c78Znq6U?=
 =?us-ascii?Q?WGQ8wYojFuIJ21uFoIRV7TvyL+LCjhZ+3mdIxFSxxg2cWdp+W1lLpptRwL4u?=
 =?us-ascii?Q?ANn/k4FHBTdthdYo6DmGob0USX6PJPgBMZ6JKC3DouZT6wGy9IXM6xju5dtu?=
 =?us-ascii?Q?Rw+vxuUA9hu8uvT/OmlChLmWPg/wi/0oIoN5Pj1fRlm9JCvXnTeWnIiJc3gW?=
 =?us-ascii?Q?D/ykeJX7ct6xOBljMy1Pa+atSQY8ao8EQPwES8ThnAFx1NriB7cCP7T8AxOZ?=
 =?us-ascii?Q?NW+px3nqunvuGhkN/LdmT9NDJ+NGHxp/GETmf/uNxzPc3bj2j98PbZL5/8Vq?=
 =?us-ascii?Q?dSo116HwAdUMkoC4yybKvsqGb2S2J2e2KgNmKnlkRN34IKebMeuvMmKwuStK?=
 =?us-ascii?Q?Y4/V9jO8dij/gPZuOku54f6pTmbvD1oXojavaRx8siOOvM0dTn6V0OIMuqo3?=
 =?us-ascii?Q?1YemjVtPdd4dxd8unRrv/SX9CdZ7s4IEmweEudUdJyx3wZWrawUuBkmW1WzP?=
 =?us-ascii?Q?jKdvxSI69NkK+Mzfm04euXLbRhru0vPZYbMWj/uJ8wo9MXreqvQARxOHm4Ar?=
 =?us-ascii?Q?HgQa1qqB6oU6CjhtXiVT+n1c5Hx7UahACs9MbOsk6hJ5brVu5TdpmBmaohcR?=
 =?us-ascii?Q?aIUWu3307dw+K7JEy4jDPo/5ed4EV5e06IzLnHSz/sBVGqcNmcLwhqKdoPxE?=
 =?us-ascii?Q?KMiGwRSF1x45K/wVHW6cfxg/wMz+gYv7Ha6aww6Px+Dzay1neVGUnbSU+gjA?=
 =?us-ascii?Q?gaeGDAQ/j/qdAB9j4ri/dDK3Kl3FgC7CNs7i9McXlnQkJh9EtxR+QZiIVu/T?=
 =?us-ascii?Q?or3yvF5smqQ7ydW+Q/H4JknQRO0gdh16MrK0IzafWyMVBc88rndtbKcUDVUs?=
 =?us-ascii?Q?kmgGDoh8Bg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3834c66-24d5-4f77-f707-08de5d18bc26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:23:15.3748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xG3YJMVaFlBWxx7FQ9573IQfB5YaOrOnNqpn/2IvNMo9sX92Ij52Xze3lW7NjxNDpW5YK72VDqBdUy1k6aCGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827
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
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D6CF78D049
X-Rspamd-Action: no action

Use checked_add() when computing the end offset in the frombytes_at()
helper function. This function is called with firmware-provided offsets.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 40ac7e66d228..bae24c756853 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -43,8 +43,9 @@
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
 fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
     slice
-        .get(offset..offset + size_of::<S>())
+        .get(offset..end)
         .and_then(S::from_bytes_copy)
         .ok_or(EINVAL)
 }
-- 
2.34.1

