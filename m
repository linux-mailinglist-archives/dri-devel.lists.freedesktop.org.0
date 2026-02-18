Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKfQCOwDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B74152207
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C8E10E2C0;
	Wed, 18 Feb 2026 00:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qBpClB0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013035.outbound.protection.outlook.com
 [40.107.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DD910E546;
 Wed, 18 Feb 2026 00:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB72YUPFM4yjtRgRZui2uxgZkw16nlwSbLEiloCMY8KPDUlzICv13h+D2lpzflz16b5r4hIgaqN6C/8bc1raVUhBbZsZET6aJ+KjDfeRpZI8RxjBUh8FXOr/rfTaYK78LA1o11oYrRYaMbloPV5/oqXSQSJx1AUI/pIISrDEmQYi85s1LlL/LwjHIaso/l7Wd2KvXVEtJJwHdPhOQQAeW3ikpPdyTGR/N2Jg+gMfXTXbqylugdE3RWwHBmQQuXhNRCGieVa0jMejSggvGQumH+VQh69Q7OxdQ+ghTJEM8kpZKJANWBe6lWdv41BfoJlYIpcquunbeCZxXLziJCwqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJg1xGAxwOyb3Qv3YtDwkFL2CMnDQ5U7qTsyOJYkZCA=;
 b=WWywZEGou7E+MAzSN1gtCoB/erFq1O7+B4Zia7odXskyWlVyayms8AA9uq8iTwr195wDtD65TbZB907PsO6t0tjW5RKlNla9SPexYRDoqQjDkrWfMYxyz6gAN0pV8ahptQ4+e6lrSclCxEJnLmvsPkkcwCTMCSwzaZRAHQ5r66leYI/5r7pSbTHyyQ0zz//qHvNYCqvT7jTqBx9XH7eOkPzvaMTJDg/JiUpykA6Q6xgOvqIPMFixDwO2fFh42m2KQ6sVlh3iAjMeSD3Exbl3eRm4jc6j+9gfK4cJGr8mVC6WxcQ1x4kSeK0HlOedO8fwaSlPKvA57W6bt9U2MJ2lwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJg1xGAxwOyb3Qv3YtDwkFL2CMnDQ5U7qTsyOJYkZCA=;
 b=qBpClB0XkrXI1uprtdNWqaakJ4vJBp9L1L+ByrtnwoDft8BZOjVKxcwAsgwP0rJ7aAH6f2LASDaS5CHVWJwTa7MCFdAI+S5hRar2I1VRh60vm62ZVIxhdgl184gWXP/mlBKIbJQUQg8E4yVyyt0qrYVjhej7aYoHu/ovaS7KiB0mm1/Y60E6O0UEb56ctXDWd/63Up2Qo/sSn+7Hn7MLK2lhrE/LB+yckQ/7mYMQomuxdM87M735n0tcdElVaZ43VOFSJWeHkabljvviqME9ApLGiPZtuG15PySRkI7UXFlmH0gPZ4o11wNQCpwgerszLV2Mxwp0Voywegnwxyr/+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:04 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 16/26] dma-buf: Remove unused SGT stuff from the common
 structures
Date: Tue, 17 Feb 2026 20:11:47 -0400
Message-ID: <16-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:208:2be::31) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 1500f08d-3991-4522-6de2-08de6e82562c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIsVTGWlKS6RxX+tQHLaspZhbBf0ZRe6/bzjlyadcMl1ZloXSPLCPuBQ3V1v?=
 =?us-ascii?Q?B0CaRiU4rdtZgiMtFwuc78Wbg+UQ1pURLpLbVS59UEcwqVX5ctoy48YtY/kw?=
 =?us-ascii?Q?4EwCNy4j6tQWu7nDVk3joppnVse635qxS0/HP0MXlZQCG74j7QB1gY1Z+O/O?=
 =?us-ascii?Q?NqrawHMx//oR607NXEt8NF68aairKHklhLxik4bBPRYEH2/J+KqGOg8eexIR?=
 =?us-ascii?Q?Xz0o56LEO2TFNNvKvMBxoJ5pq4jFYj1UgV/6yshVvOIsC4jCDO71fmqyCq5S?=
 =?us-ascii?Q?ehhg7J/7CDTrqUAjVMas/4vOl0XzooYvSjjjk6e0lIWLsnK8F0cHBxgxQgzq?=
 =?us-ascii?Q?XCfAyYi/jRorn8YCcZefgGxXFLCU4m2jCVASLZLxGMWY2njpzsJSjVw1ihq9?=
 =?us-ascii?Q?9XBkbRdy2f6zHT4bODNv/Lwz5TcuKiQNurz3zRlcQAqnU4fSdvOi8fTo1Ut9?=
 =?us-ascii?Q?sCP67U6RLQGGImFfkkL1+FzUmt3H5FV6DzoDLQ0UkWxG+J9v+eEyqHzdFB7B?=
 =?us-ascii?Q?UeQQYiA8t7trAfoYJJ1pZ1x5x1qY02wMrAYnzNuqqSaZxESC8BtYEckHxy94?=
 =?us-ascii?Q?LeWqibHBO2zArrEQiMxaGDoUTsbiT9ul50IDfgZkBx5Ci1x9eoJh2dnCuQP6?=
 =?us-ascii?Q?wmdOZ7K4S7iOW5v9wY13wTl2enx6eOg6WmEhizFmXKyIq7K/OMX+AJn6IvPk?=
 =?us-ascii?Q?3fEwf0kRwFl3hqQZLqbJmcZQN1sTW7yfsLkrLQMsEDvgj9JGzbJypzqr7H13?=
 =?us-ascii?Q?lS5fAUaaf1nGL2+UxU2hz4398qj4LtGEFcDZJpjlEAwWa9Qh1U9143DfAf2C?=
 =?us-ascii?Q?zGx8QWroCLdSurU4UbexYt3QOWVJWKcKp0xwNVdOrUAvysVgwzFL6vAGTKF8?=
 =?us-ascii?Q?oas7cJZOHzfv5gNC3iYVvriEBPMYXw9k24gZIazyBNUnOnqbEjTXtWq+6A4f?=
 =?us-ascii?Q?INZE8gx5KpfpPtasVxsgi2btyLS4cWQtowfxrAEvRsQTS+qYLsFyVQO4YwfP?=
 =?us-ascii?Q?+8oSgvkuS1nr6IOMPXfTjlQrPgoSJjtb3tJTNJSXLqobRP/iruAs8DlXl+xU?=
 =?us-ascii?Q?61cIu/QZFHPlm3+HnAdmab+Dx1Wk2Wvj68PeuBJ/HonpjLHVCdXu3GUPYY3n?=
 =?us-ascii?Q?qv38xwi7VHbhW/Bxa0sc4555cD1Rsz8mUyO45H005H0caUH45SP74mvn+NWU?=
 =?us-ascii?Q?0nbBmazhWXCz0wMad4WtXunVI3ELdqPVazkK3jqNlWVV950QQJZUmtasWz9y?=
 =?us-ascii?Q?8dowDYk2dMhjEuKM3NqTIy2RQDzk5KDHd5fWhDWivoPIgL/1cPDUkxVqiTM6?=
 =?us-ascii?Q?f9YKK+Fjdvr5nmMnwfOgABcsKn95lvZMi90oIza0j+Tr5IOTZ1xDbVshsn1F?=
 =?us-ascii?Q?10dfx//COOos2WiDWXvMQcMmY/qmdP25IHyUdTvjexZ8+5v/cEJfmSNNLSf0?=
 =?us-ascii?Q?2ifFMpiZV0bjxeKduv9ix0BcNTFRdYoUh5IESvJn6x5ZBFigQQmpQgD4B+0M?=
 =?us-ascii?Q?jVkF8LoGlxEpvSbQrbAcgFEMHt2dMpZ6CFHSnWDgRId28bKBhUxmblo95+tv?=
 =?us-ascii?Q?ui+uIMOlsRAPnMZQPVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUkQzgHee5ppfMLInhuSiG9oslUZX2o7GhDrCkey+zXMGWrIx8vJWzjUDE5x?=
 =?us-ascii?Q?b8q4l9Ua3s5+0hZ4Rt4DI20yJZY43Zu9plsoBAne5LMgg7mT1SICNNvH92sV?=
 =?us-ascii?Q?/acPsxtBYP25qZszehruYUWMWxNQcRw3y14viMAO7hbhX5urdC+gDlOS+EmA?=
 =?us-ascii?Q?GbbA/Fc2RTXepk+VhjAE9cGwy5Ylt2tuKlnG66i0WN/h8+/++FzhNzsI25qs?=
 =?us-ascii?Q?sBxWmE1ypAbtopgwDlhvSRBIuEMtB+YzKshLTtLBaKj5y4NmH+pQyB0zOghW?=
 =?us-ascii?Q?t5+eqTHwgPASP0/CRGGSn3FCOoNeNDNVrq2WWiqO+DHFSEYlAAKhYzsbW2a0?=
 =?us-ascii?Q?MUm5uiUq6sQndUILVKPLmihAmZHHi+Lr4nDvs1hzrHk4yTRdu9Q0ZJ0dO9V5?=
 =?us-ascii?Q?RdWYkjvkRxqO9OtT0OmoN7qpCxT/tm7TBtHApX4tSy06La25daDNP5varila?=
 =?us-ascii?Q?wVALgpOjx/nqqhhxyled3eENOb7IGlIEi+4N9b6OSpB9Ivr3ntAan1bJuUMZ?=
 =?us-ascii?Q?4/YyYgia0J0sEriTYr/O+bv0a9LNW5LTtGeuz0+NK4DqQw3M8tV2G+byLixm?=
 =?us-ascii?Q?zDNfGyEzkmj0bCrGOYmb0PQFIXdqghsmlQl9S+oLZR2a9YtpAyHPFszDZBUD?=
 =?us-ascii?Q?bntQ4vd/AFm1eDyeQG2NFzOd1+n5l634jtr+u/9GlWUHmCYAKBg21fUjsmCA?=
 =?us-ascii?Q?d6S9rNFw3KZodMOzvm8c0JfNrG2q47V1wSWNGpH4jOhsyKNEfK/9qNSK3eX2?=
 =?us-ascii?Q?dZTUClQG9/kcqqgQuxb/tbsoKg9XsAkGcoDcMOwywn04Dt+KlunaMQ4eWqcl?=
 =?us-ascii?Q?keWP2rjB3BKJ9U+36x5aBGCJjl+/3utrAzlpA4zMI4vS6bae3uZw5ckiol6K?=
 =?us-ascii?Q?XzaGhviUoaUzyeQ34N0I2Q+Alvr0DBKYKffDCM3E2SA256u+EfhFex4xuV0X?=
 =?us-ascii?Q?csuUVa9jtZHObEYhddJQCvox3r55gEblp4BnqmRVx8PiELPYzfYXnmCau2hx?=
 =?us-ascii?Q?kzZDq9gwyogNqgVVJR/GW05AafjDJPJgdIXLQfk8nW8kENmMtbZ6NK6o7BQu?=
 =?us-ascii?Q?71MfXysnDqcmMguNV0HRZq1K+zZ9NlLwgkK17bVWj3CQZDdSgVKVGONAvjW3?=
 =?us-ascii?Q?UB3sfhy55u/r3/ycEQFgHK19R2qep+2b4kgLa/DC543s5wdrEQRs7dVv+nH3?=
 =?us-ascii?Q?CHxh2bS4dtY6xgL8gBkwKNgVVHw6p9n8B3LCBtYSAPGBlW/n2Jw3WK1GY96c?=
 =?us-ascii?Q?Jzsi63mA0kyNV7NmcKWN5AMYWPMQBYbBa5vHM3aXlgHfmsA79Met02tUCj6w?=
 =?us-ascii?Q?2uS8vRYPqJjfJmMv08oA7EhBD0R0ttR41Vq1RFjKfwnhw9Fms+BgRRGhnGbd?=
 =?us-ascii?Q?3iJlrTrRl+OrjWz58aHVudLhJRsAeRW8JcB4g9Y8BYbP9H8osHv+kWGDNqQU?=
 =?us-ascii?Q?MknaHXzCSxjmaHwJQFGhXipX4IJ0dj4Hm/7wgUFkdD6TXxWe3NuxkGU3lDoG?=
 =?us-ascii?Q?6YDM55ViuoiKDtdReuzAJOlM9i7EUB97Wl6mNqFMLRtosDtF7W1lE9LxxbXl?=
 =?us-ascii?Q?13j3hgKnQU5SSj8eZbxQ033r5RYa/gTNY9/Od5Ggi4momFZJQpWIrBfhWdHG?=
 =?us-ascii?Q?uDjxBr5livdZsJEiHGR1MITuj5ip/qNS2imU45L7vlsy8asNKefGQIoMepm7?=
 =?us-ascii?Q?VbC8XmFk9HrmaliBOzvV5Rg5Rew2JgaFhk1cS6GWoeUtupeL7I60hMX9SVos?=
 =?us-ascii?Q?wuB+7kdJfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1500f08d-3991-4522-6de2-08de6e82562c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.6120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knt9CJD/gBfZh0VklKsBDVQtQnikurIyWd5Q2oiA1Bg+T2xFVEkaPj3rtDX2mqKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C6B74152207
X-Rspamd-Action: no action

Now that all exporters are converted these compatibility things can be
removed:

dma_buf_ops: map_dma_buf/unmap_dma_buf
             Moved to dma_buf_mapping_sgt_exp_ops

dma_buf_attachment: dev
		    Moved to attach->map_type.importing_dma_device

dma_buf_attachment: peer2peer
		    Moved to attach->map_type.exporter_requires_p2p
                    accessed via dma_buf_sgt_p2p_allowed()

dma_buf_sgt_exp_compat_match: No compatibility exporters anymore

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 40 -----------------
 drivers/dma-buf/dma-buf.c         | 24 +++-------
 drivers/gpu/drm/drm_prime.c       |  2 -
 include/linux/dma-buf-mapping.h   | 67 +++++++++++++++++++++++++++-
 include/linux/dma-buf.h           | 73 -------------------------------
 5 files changed, 70 insertions(+), 136 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index b5f320be0f24bf..baa96b37e2c6bd 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -334,16 +334,6 @@ dma_buf_sgt_finish_match(struct dma_buf_match_args *args,
 			.exporter_requires_p2p = exp->sgt_data.exporter_requires_p2p,
 		},
 	};
-
-	/*
-	 * Setup the SGT type variables stored in attach because importers and
-	 * exporters that do not natively use mappings expect them to be there.
-	 * When converting to use mappings users should use the match versions
-	 * of these instead.
-	 */
-	attach->dev = imp->sgt_data.importing_dma_device;
-	attach->peer2peer = attach->map_type.sgt_data.importer_accepts_p2p ==
-			    DMA_SGT_IMPORTER_ACCEPTS_P2P;
 }
 
 static void dma_buf_sgt_debugfs_dump(struct seq_file *s,
@@ -359,33 +349,3 @@ struct dma_buf_mapping_type dma_buf_mapping_sgt_type = {
 	.debugfs_dump = dma_buf_sgt_debugfs_dump,
 };
 EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_sgt_type, "DMA_BUF");
-
-static struct sg_table *
-dma_buf_sgt_compat_map_dma_buf(struct dma_buf_attachment *attach,
-			       enum dma_data_direction dir)
-{
-	return attach->dmabuf->ops->map_dma_buf(attach, dir);
-}
-
-static void dma_buf_sgt_compat_unmap_dma_buf(struct dma_buf_attachment *attach,
-					     struct sg_table *sgt,
-					     enum dma_data_direction dir)
-{
-	attach->dmabuf->ops->unmap_dma_buf(attach, sgt, dir);
-}
-
-/* Route the classic map/unmap ops through the exp ops for old importers */
-static const struct dma_buf_mapping_sgt_exp_ops dma_buf_sgt_compat_exp_ops = {
-	.map_dma_buf = dma_buf_sgt_compat_map_dma_buf,
-	.unmap_dma_buf = dma_buf_sgt_compat_unmap_dma_buf,
-};
-
-/*
- * This mapping type is used for unaware exporters that do not support
- * match_mapping(). It wraps the dma_buf ops for SGT mappings into a mapping
- * type so aware importers can transparently work with unaware exporters. This
- * does not require p2p because old exporters will check it through the
- * attach->peer2peer mechanism.
- */
-const struct dma_buf_mapping_match dma_buf_sgt_exp_compat_match =
-	DMA_BUF_EMAPPING_SGT(&dma_buf_sgt_compat_exp_ops);
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ac755f358dc7b3..e773441abab65d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -693,19 +693,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
-	if (exp_info->ops->match_mapping ||
-	    exp_info->ops->single_exporter_match) {
-		if (WARN_ON(exp_info->ops->map_dma_buf ||
-			    exp_info->ops->unmap_dma_buf))
-			return ERR_PTR(-EINVAL);
-		if (WARN_ON(exp_info->ops->match_mapping &&
-			    exp_info->ops->single_exporter_match))
-			return ERR_PTR(-EINVAL);
-	} else {
-		if (WARN_ON(!exp_info->ops->map_dma_buf ||
-			    !exp_info->ops->unmap_dma_buf))
-			return ERR_PTR(-EINVAL);
-	}
+	if (WARN_ON(!exp_info->ops->match_mapping &&
+		    !exp_info->ops->single_exporter_match))
+		return ERR_PTR(-EINVAL);
 
 	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
 		return ERR_PTR(-EINVAL);
@@ -981,12 +971,8 @@ struct dma_buf_attachment *dma_buf_mapping_attach(
 		if (ret)
 			goto err_attach;
 	} else {
-		const struct dma_buf_mapping_match *exp_match =
-			dmabuf->ops->single_exporter_match;
-
-		if (!exp_match)
-			exp_match = &dma_buf_sgt_exp_compat_match;
-		ret = dma_buf_match_mapping(&match_args, exp_match, 1);
+		ret = dma_buf_match_mapping(
+			&match_args, dmabuf->ops->single_exporter_match, 1);
 		if (ret)
 			goto err_attach;
 	}
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 94ec2483e40107..0852c60a722b67 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -593,8 +593,6 @@ static bool is_gem_map_dma_buf(struct dma_buf_attachment *attach)
 	const struct dma_buf_mapping_sgt_exp_ops *sgt_exp_ops =
 		dma_buf_get_sgt_ops(attach);
 
-	if (attach->dmabuf->ops->map_dma_buf == drm_gem_map_dma_buf)
-		return true;
 	if (sgt_exp_ops && sgt_exp_ops->map_dma_buf == drm_gem_map_dma_buf)
 		return true;
 	return false;
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index c11e32ef2a684f..f81e215401b49d 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -113,8 +113,73 @@ extern struct dma_buf_mapping_type dma_buf_mapping_sgt_type;
 
 struct dma_buf_mapping_sgt_exp_ops {
 	struct dma_buf_mapping_exp_ops ops;
+
+	/**
+	 * @map_dma_buf:
+	 *
+	 * This is called by dma_buf_map_attachment() and is used to map a
+	 * shared &dma_buf into device address space, and it is mandatory. It
+	 * can only be called if @attach has been called successfully.
+	 *
+	 * This call may sleep, e.g. when the backing storage first needs to be
+	 * allocated, or moved to a location suitable for all currently attached
+	 * devices.
+	 *
+	 * Note that any specific buffer attributes required for this function
+	 * should get added to device_dma_parameters accessible via
+	 * &device.dma_params from the &dma_buf_attachment. The @attach callback
+	 * should also check these constraints.
+	 *
+	 * If this is being called for the first time, the exporter can now
+	 * choose to scan through the list of attachments for this buffer,
+	 * collate the requirements of the attached devices, and choose an
+	 * appropriate backing storage for the buffer.
+	 *
+	 * Based on enum dma_data_direction, it might be possible to have
+	 * multiple users accessing at the same time (for reading, maybe), or
+	 * any other kind of sharing that the exporter might wish to make
+	 * available to buffer-users.
+	 *
+	 * This is always called with the dmabuf->resv object locked when
+	 * the dynamic_mapping flag is true.
+	 *
+	 * Note that for non-dynamic exporters the driver must guarantee that
+	 * that the memory is available for use and cleared of any old data by
+	 * the time this function returns.  Drivers which pipeline their buffer
+	 * moves internally must wait for all moves and clears to complete.
+	 * Dynamic exporters do not need to follow this rule: For non-dynamic
+	 * importers the buffer is already pinned through @pin, which has the
+	 * same requirements. Dynamic importers otoh are required to obey the
+	 * dma_resv fences.
+	 *
+	 * Returns:
+	 *
+	 * A &sg_table scatter list of the backing storage of the DMA buffer,
+	 * already mapped into the device address space of the &device attached
+	 * with the provided &dma_buf_attachment. The addresses and lengths in
+	 * the scatter list are PAGE_SIZE aligned.
+	 *
+	 * On failure, returns a negative error value wrapped into a pointer.
+	 * May also return -EINTR when a signal was received while being
+	 * blocked.
+	 *
+	 * Note that exporters should not try to cache the scatter list, or
+	 * return the same one for multiple calls. Caching is done either by the
+	 * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
+	 * of the scatter list is transferred to the caller, and returned by
+	 * @unmap_dma_buf.
+	 */
 	struct sg_table *(*map_dma_buf)(struct dma_buf_attachment *attach,
 					enum dma_data_direction dir);
+
+	/**
+	 * @unmap_dma_buf:
+	 *
+	 * This is called by dma_buf_unmap_attachment() and should unmap and
+	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
+	 * For static dma_buf handling this might also unpin the backing
+	 * storage if this is the last mapping of the DMA buffer.
+	 */
 	void (*unmap_dma_buf)(struct dma_buf_attachment *attach,
 			      struct sg_table *sgt,
 			      enum dma_data_direction dir);
@@ -189,8 +254,6 @@ DMA_BUF_EMAPPING_SGT_P2P(const struct dma_buf_mapping_sgt_exp_ops *exp_ops,
 	return match;
 }
 
-extern const struct dma_buf_mapping_match dma_buf_sgt_exp_compat_match;
-
 /*
  * dma_buf_ops initializer helper for simple drivers that use a single
  * SGT map/unmap operation without P2P.
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a8cfbbafbe31fe..5feab8b8b5d517 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -145,75 +145,6 @@ struct dma_buf_ops {
 	 */
 	void (*unpin)(struct dma_buf_attachment *attach);
 
-	/**
-	 * @map_dma_buf:
-	 *
-	 * This is called by dma_buf_map_attachment() and is used to map a
-	 * shared &dma_buf into device address space, and it is mandatory. It
-	 * can only be called if @attach has been called successfully.
-	 *
-	 * This call may sleep, e.g. when the backing storage first needs to be
-	 * allocated, or moved to a location suitable for all currently attached
-	 * devices.
-	 *
-	 * Note that any specific buffer attributes required for this function
-	 * should get added to device_dma_parameters accessible via
-	 * &device.dma_params from the &dma_buf_attachment. The @attach callback
-	 * should also check these constraints.
-	 *
-	 * If this is being called for the first time, the exporter can now
-	 * choose to scan through the list of attachments for this buffer,
-	 * collate the requirements of the attached devices, and choose an
-	 * appropriate backing storage for the buffer.
-	 *
-	 * Based on enum dma_data_direction, it might be possible to have
-	 * multiple users accessing at the same time (for reading, maybe), or
-	 * any other kind of sharing that the exporter might wish to make
-	 * available to buffer-users.
-	 *
-	 * This is always called with the dmabuf->resv object locked when
-	 * the dynamic_mapping flag is true.
-	 *
-	 * Note that for non-dynamic exporters the driver must guarantee that
-	 * that the memory is available for use and cleared of any old data by
-	 * the time this function returns.  Drivers which pipeline their buffer
-	 * moves internally must wait for all moves and clears to complete.
-	 * Dynamic exporters do not need to follow this rule: For non-dynamic
-	 * importers the buffer is already pinned through @pin, which has the
-	 * same requirements. Dynamic importers otoh are required to obey the
-	 * dma_resv fences.
-	 *
-	 * Returns:
-	 *
-	 * A &sg_table scatter list of the backing storage of the DMA buffer,
-	 * already mapped into the device address space of the &device attached
-	 * with the provided &dma_buf_attachment. The addresses and lengths in
-	 * the scatter list are PAGE_SIZE aligned.
-	 *
-	 * On failure, returns a negative error value wrapped into a pointer.
-	 * May also return -EINTR when a signal was received while being
-	 * blocked.
-	 *
-	 * Note that exporters should not try to cache the scatter list, or
-	 * return the same one for multiple calls. Caching is done either by the
-	 * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
-	 * of the scatter list is transferred to the caller, and returned by
-	 * @unmap_dma_buf.
-	 */
-	struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
-					 enum dma_data_direction);
-	/**
-	 * @unmap_dma_buf:
-	 *
-	 * This is called by dma_buf_unmap_attachment() and should unmap and
-	 * release the &sg_table allocated in @map_dma_buf, and it is mandatory.
-	 * For static dma_buf handling this might also unpin the backing
-	 * storage if this is the last mapping of the DMA buffer.
-	 */
-	void (*unmap_dma_buf)(struct dma_buf_attachment *,
-			      struct sg_table *,
-			      enum dma_data_direction);
-
 	/* TODO: Add try_map_dma_buf version, to return immed with -EBUSY
 	 * if the call would block.
 	 */
@@ -530,9 +461,7 @@ struct dma_buf_attach_ops {
 /**
  * struct dma_buf_attachment - holds device-buffer attachment data
  * @dmabuf: buffer for this attachment.
- * @dev: device attached to the buffer.
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
- * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
@@ -551,9 +480,7 @@ struct dma_buf_attach_ops {
  */
 struct dma_buf_attachment {
 	struct dma_buf *dmabuf;
-	struct device *dev;
 	struct list_head node;
-	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
-- 
2.43.0

