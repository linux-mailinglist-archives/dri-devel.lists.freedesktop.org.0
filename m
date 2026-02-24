Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBCxJf4rnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A018DBA5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B6710E656;
	Tue, 24 Feb 2026 22:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RHY2S/wV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011067.outbound.protection.outlook.com
 [40.93.194.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739B210E63B;
 Tue, 24 Feb 2026 22:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATiTd+hxWw+9EnaZUm2w3v2JN8/qlMD7nRAKxnGRpEJaCHdPPRjCh8OBoetJ2dwQ1uygePMJmPJ9WTHG5axVveuyXWo1Y+Qp/UaR1eFLsJS300IgVIuuzaonr1OL4WtzTRJmAorhsx7zwe811t4Kw/w+0sqiN4dPRPB6iKC/HsyIKrEiIJje5lefdD+9jbW3eIFbLV4qU+3E1oATZEmDApbbqLQbq0MQBYW6ErslAZfYwpSl+9YCGlgeZD0Cu3lOtiQfVk1aD4Cf3YFmI0Z5McDRS2/apeJm1So7UZzcLRirm2yMorvQYySOnZ20AjQBzMDdIwqne9nETe4KIJh3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxuC+zfhLe5Q7zewzUbI0fSaDTYjR+lExDd5j90/3Gw=;
 b=rBhIwYWD0YI7+OBMFc+3R15LNlOhdbFAgCODZI7Ht9YtQZKRJZslsWHDpXf8t9yZRb0xRYFebb8wRk6svSbljK6y+0MyiSksPGniiDHpXoMMLumjZ2MfcglC1+S+A+ZtDKa5Fg8Rnj1ftIMyD0QZ3kwTKXk3CRFfQAJ4sVo5bmJ2JEw/OJcvUnEBU0ug3/kfiCtv8kZJUJTibreICPdnslXhN/CONi1Ot2TIT8iy8u+8mo8CI4D/rR/VqmwxGowj93enWSlmPPV6VTHerEE3jKwS9J2yTyTjEJicQofi546fHA9OCjZJXzg4MVdE1b4QPNw5iJ9hoRvTp3p7chNbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxuC+zfhLe5Q7zewzUbI0fSaDTYjR+lExDd5j90/3Gw=;
 b=RHY2S/wVCAgA+yEDjJBpqXkTveI9VM3zUd4nYBZH7luGW0Qp6NWSQrFeWe/B8Del4iIKVYLeEX0Dqh6eyzERsP9XYFwIrkjktzG3v/fNf5Go42F5F+gxyqykiBJNLCN+ecTR/+QP4mzUJ5pAB0QJg74dv/sEmUDgCVLq2aKXCJehB91asyqWS7Tpsfyc9qgQ0F/+OrrYv/XV0Fq5MwLA06ZB5P2sErS/Ys6OwZPmHv1WpoJkc7pJ4VuPghRKB6OITFCNw3ddSMz2vfuFPZnhogw1gPt5Kz0AG7lCKRZyUt4/FutF3x8DhCO5un4YhMlC1bsmYF5NFCe0Prbu2vt1Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:37 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:37 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 02/25] gpu: nova-core: Kconfig: Sort select statements
 alphabetically
Date: Tue, 24 Feb 2026 17:53:00 -0500
Message-Id: <20260224225323.3312204-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c20dd8f-48c8-4589-718f-08de73f78ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lxCU1UPSJYMLdxmc7L5VZmtq871ZZayAbawmwAmKyvpu02hIlVBvy1Xi/ZwG?=
 =?us-ascii?Q?8zXbAlgR2LxxfkMpxyTlTPFdhSHsHO9TG+ji4SqfuwJh3UUE8LDfdCkLtv50?=
 =?us-ascii?Q?l3Jusa0kz6TiFI72c0XSKtvgJr0N3RWViCSom0n2rtivK5jL1gajNeji3JY1?=
 =?us-ascii?Q?6vjHlF4rofM0HTXH11hyij6hNEUzdjTWjSZ5FyNboaRXf4L5DMPP2VTLS2+m?=
 =?us-ascii?Q?RNmuJrAhNm09RyTfm6h0OVDkm+OrpNneXr/77s2trhK1aYSCZUvtgijEgSex?=
 =?us-ascii?Q?p50d4tWEM+72HR6DzKvtbv3MnxGizZ0BN3CG4SvID8OiuygR/zCekXqwdRg7?=
 =?us-ascii?Q?FDuHrwqN7o1jNwD0k+JHzgngU4Eu2xIf7LFm26FWrhvwW6/euo8mfj5Pf3Gd?=
 =?us-ascii?Q?0FuE9aL5I3zh19luismS2Uf1I6406gNmkCV6fBTIV96DKOJ8w0ctWKPBNwF3?=
 =?us-ascii?Q?aw7zJExG6uigZ6YGVcH2mIZnHCqUsYgKXbObZGbw0PO2Mg/q1wDfplporb9u?=
 =?us-ascii?Q?ZJUT6KWL/evmAmyjMQTAijC4XoUe9g32FRelTxGFCbePkNx64XSzXxhfW69c?=
 =?us-ascii?Q?uxk7lqFY0pD8wdVZlbuQWf2WzulW6Sy0Wv7bCsPcgx3gGmCsuvtlCEKHIYvn?=
 =?us-ascii?Q?pHQ+V1LV0o6m522QmsslJSspsn01TfnHZxPKVjkoNg6la245J9Pr/IdPOJHW?=
 =?us-ascii?Q?fqCiPA73RAn/LpLP7mOdQCkSQeNG2vZ/toc87Aejvv/eQJXNc2vLmtFWVspN?=
 =?us-ascii?Q?F/Z/8cFPGAt71ndCw2/tnRe31+Kp35/WpZY2FQxIuSwK+FYvSbRAnAGqc3O6?=
 =?us-ascii?Q?t12yKKT1yrPZBgPhE0Sgmf903jokP9cAFpHUaIdhDKYtzFjleH0znBxKl55S?=
 =?us-ascii?Q?wTjwUqSu0L7d+pCh6A7gfzDfT6GlxvkWXUlo9pQi7HkcJtblB/FTHuMLNIw1?=
 =?us-ascii?Q?KghYpjVXucirr1xYhgeA7g2cJApO2RWdfBv4JtkK4xzb7dLWztE4unOduUdM?=
 =?us-ascii?Q?78Lc4Jz27y1k+QCMsMP25daFWtYFP2lV4rFKA8oiyxRxESAQaBdmKaXdX2xD?=
 =?us-ascii?Q?bH3SaR7A1eQsN16T/Kp5xie+Bjuk5OFHy/8lwtd306Iq18635s2xDis4Bu3z?=
 =?us-ascii?Q?sjjsopNetwtwiQYUxUjpxP9Ggdtz4nTY04SH3t6aG2MkHDcH7eaxoKivSZIr?=
 =?us-ascii?Q?i5CaKY8UwUEmek51SvAiWvmd57UxL+/Ve8FINhIGhUUrvfBs8+11l+JAfC0x?=
 =?us-ascii?Q?RO8l7QTtjZC6gjhSvXhOk0rxzScHjRkrtSKf80W9ry2bKHfjA84DemxnEjzL?=
 =?us-ascii?Q?C+OmMN+IDlQR4VcZXn4anRmzsxkoPUzwHPZV/lTawYoolmBekkfLedfcLaFK?=
 =?us-ascii?Q?6CE0gwZIQj/dhZu6HYlVQZ3b6iEVKHHk8goM7nP/Wd88jwf4tq3ly4euYNwa?=
 =?us-ascii?Q?u7NeXI5WJIyFOAFxUluwa7nnmcOogzHERK/i4nrYfqiRvrgt3S9Mv7hIjCRM?=
 =?us-ascii?Q?8o+G7ifACyFbV/t7INu+qjti2k7zExewiSJXaeLWcYmMAOpmJ1MGZ4PFhczf?=
 =?us-ascii?Q?wTTmFo6UQFBs7yJvHCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93tqVbYiYkR4YFou8a5g+/xD0hTS+ywuVqyyAqWfKPRt9K22tC9AoyNF2bnT?=
 =?us-ascii?Q?Dd89em3zrEBw36XjeU8M/qX6alw/6Wi7oZvyEDME5row8D1g65lBxg0FffSz?=
 =?us-ascii?Q?EbiEwjiUmHA9S4diEvvJOt21cqsGF4HeBQwgeLz2u6RUJRa3LbMlQKjcWSHr?=
 =?us-ascii?Q?LM9vWLrzTjvDLSl4tzZbu7E2oKV9cY7MUbTqQrCPuQvsior5OA8qSthmOMlX?=
 =?us-ascii?Q?do9thw5mc7LaWuxJdCAG+0+Q6Rth1M9d5J//YqI3ygKx5Ypi+lI0ACogrr+0?=
 =?us-ascii?Q?lIiKYJ8TS+73D5RDzG/6ikSlzNk63mNJHUV8nmoHTbCCTfNVYFvrJlX/xFrl?=
 =?us-ascii?Q?DmoU0NLIt16ABPZ9I2zqGFPtEt+nFKQkKVmZcB1kcyC+hfkDZqlwEQudRPGe?=
 =?us-ascii?Q?t7CHmvTwJx2CIzR+lQUhrb16WEM1bzR8RQieeOceavXDSbC9BdqTw82Uu44/?=
 =?us-ascii?Q?zXr2i24v5K45SpHtAvNeXopcDqTqpZaLZpKfaedFzd/Xs62Le53DA74mE2fy?=
 =?us-ascii?Q?R5LcU4sn43uLPQv8P2LZWnfM3HyWzKXDPnEKQ98dhXk0AIZzHc2VL7bD3J/n?=
 =?us-ascii?Q?iBwWvpfzmtHoqZ+PG11Zrqp2cxkt8Ok0hQafrbrpSBq6C9TqUHl8OEZi5K4W?=
 =?us-ascii?Q?7t+hTw8VwFu0RAN7BcnWQ9n3W9hpSv0WNAS9+8dbUuIoF7scimPRSa/VQ5kg?=
 =?us-ascii?Q?QtPC7oJnqYLyesd3kXdpL1k+1xV3K5gx9FLKtTUPr+8yBQAejZdiv4g26BeE?=
 =?us-ascii?Q?1UXJHGJ3eNbenWWGpGXFyqzftq/5zLOIsiS9k2cd4qbP9uTG3K8iuFzcQ3Hu?=
 =?us-ascii?Q?N8/ibfFshnBx2mWEnWdxQNyIHGL3/8XxCEa2nPyyr1+9y7MufCk18SkN1NVC?=
 =?us-ascii?Q?uzVSlMJxcby9yQvLKR/3MlVtR476BL4s1BGIfs/gTU/Dqg9rwTwB2zAIQ5qJ?=
 =?us-ascii?Q?H6q5EwAoiuBycssWC/dJfn9yy3Jh8n0X9SX3GAVChjYXxk2MjXWqRTWu8h0/?=
 =?us-ascii?Q?sfN2yP3QoxzfSsKey6jK7dJl5yaewVhFLQ30fqnBOZEb4wh6vblZH5h0qAfh?=
 =?us-ascii?Q?rrxZXl9X4/4IiD+nB4trOXJo9BoLU7grDkNvpYFDe4G1VYvxlDhT0J7vnpIK?=
 =?us-ascii?Q?WmuBx1r60SfC77ZnnIrWrIYQltwNXB5jgB5S1GVzqNBtKvXjP/f2iwhBmkcO?=
 =?us-ascii?Q?INmBJivSgVXCo9gPVhVk4v0IxXFqBQodREYKvqhJjMkH6GMKnUUtwSEMwYvc?=
 =?us-ascii?Q?UhDJRqsweFeUzeXIOslLo+fbnk3GS7Jcf6z6nN9vtpFcD/0HIwwNjti/cU/6?=
 =?us-ascii?Q?oFhpL26eqIyL5nxIuomkoLaoThZA1mRMQMgg4YM9S8dyFeiNkQiJAmsOP67H?=
 =?us-ascii?Q?vCfZswRKjIeOKDtIYsQz2Ux+6lbDQFgBqw4VYF9eEpuY3oOxFk7zjgZWC/ND?=
 =?us-ascii?Q?2wIvK4rqDe8s9OoLq5ksmEwFgHjUrgfsrhSYlFBVGrGT7tuol9GiWrgQilwx?=
 =?us-ascii?Q?WdbWAU+IcKabW+OS4GbrnH8zRjQTSNt+N5PEPmPiq18WvKLAcn7AVjYkv31k?=
 =?us-ascii?Q?SB2yCHSrqID78vNwppbTu3woxcHS4yMSR0WoRHBuzDEqn2Pr/u6nyWdZ9w7p?=
 =?us-ascii?Q?HHldh8ZMbA5w2RFgbQRjDVsAsST0zAzsiUTF510o1cHCye0Me7OVVKCGbJWE?=
 =?us-ascii?Q?Bs/9ZKXf5tINl05bKp1YAaLWatzNw+qbyeWdru58us+t13F2jX7Of8z1dCCJ?=
 =?us-ascii?Q?rgGT3l/rnQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c20dd8f-48c8-4589-718f-08de73f78ba3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:37.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKpVX76hb102/6czrf/QzwZFi+/+MC8DuZWzcJ1vuUtluN+qdK7knn5RmezDM8JJjoOntKTEJeP8TS7yv0PEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.968];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 488A018DBA5
X-Rspamd-Action: no action

Reorder the select statements in NOVA_CORE Kconfig to be in
alphabetical order.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 809485167aff..6513007bf66f 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,9 +3,9 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
-	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
 	select GPU_BUDDY
+	select RUST_FW_LOADER_ABSTRACTIONS
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

