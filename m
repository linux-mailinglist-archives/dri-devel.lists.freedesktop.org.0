Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D13358FDDE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 15:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC997BAB;
	Thu, 11 Aug 2022 13:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442FE11A513
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 13:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR4ngo2T0R6xS6zMhvFwdn/tamMIQh3q12zwkDc7czPjgbnq+iIhRSzT8tqvv1f0U/t4JpfGIF2wZDrjJefG6zsy9o8aNV3ETSbfqBxS9Ds8sRmo7m8WoXLFLk08HmvrXZS0a94vTo4e+C7LKWHZ7Yw8sRE/zA4lEaPuu8fbYkBYhEliIEO1EN42jowY9yYHTDbTIPfADzzM8/2C/PBlbfHajMbIHC3D76rwOLXzVZDEMsDRP1k8JQC+sHkQ+gf676MNx+a5P+P3m0uI7q96nDvj+y7jByVRH/5wGRCtJHO02VQzRCeJ+G09GTuRGkWiKTxDxMrKCZWMpM7y2ffdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro55ahqmD/bQ6Gk6CfObsUKoUEfzjd1fB64rl3XAr80=;
 b=ARyTx+eN8DgiowQAEWed0DlbMKRZFAoyQb+zWU1jKCtbLCZ8QtqIawTVd1fOUZtHM1csVcWi3VhL6K9bfLLVWj0iL3O8RjLv57X+aznnph7bV/+JGFaCXcab6hgUKwYS19quz+QXfsjAbQdv1wg5lLpP4xNupYOjt1aIXF1mVm9nO7rjJrZHoT8mw+d+tRDGcrdGAz20HFMeY9DBMWMAszohtchfgVYA0RabdDpiQJzhB4ZTOOxzibmPj6p+Og3vgzADaCERbT97Ljasq1/p0DwRbDjH/orear+hFlM+2tBzZEwKryn0TZl2nlxSnVynWYEKWkQqnbKIPbCy3yWDkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro55ahqmD/bQ6Gk6CfObsUKoUEfzjd1fB64rl3XAr80=;
 b=ef+942J4pA32yPJuHoBnXOkLPR4/smPUOCQt6KWjEzD6LSxZaOTPi3Zx9AwyBXT3maWTs2mOr03K1wdcSxKEuOGkbs2g8kEBUgssnj0U1rvwIekTf+GHahZNO3WBSC2F42Wy3EjCfJ9UMjPFRrK1SEOgDUjcKqH1IkG8X6qvK7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by HE1PR0402MB3436.eurprd04.prod.outlook.com (2603:10a6:7:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Thu, 11 Aug
 2022 13:56:43 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::c27:3940:d92e:acd6%4]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 13:56:43 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: jens.wiklander@linaro.org, sumit.garg@linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, op-tee@lists.trustedfirmware.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] tee: Add tee_shm_register_fd 
Date: Thu, 11 Aug 2022 15:56:36 +0200
Message-Id: <20220811135637.6332-1-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c1188d-f8a0-4c9c-f487-08da7ba1522a
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3436:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Wk8KZqOZG0VsnhvO0f8eJzoPNm9PH+WiigNJLb2y3q25ZuNqDmElv+PyNosgAs2NfIV6XSh4U99KXSIcq21j99Hg1aoU5MAeveZXzZK1XjEFWCEoqSdbpO2w165eMAQo6AtEo4sncjqsmub0Bgsn4Ly0w+bSVCwKs+wArBOZEz1OyYVZaEHXqs9VC0doUi6MBka1BTbUA8PyE/k9p6reTi9Tm3dBP69AQ95Cmpi9/fg2ZHTfFX6U7di4m3nLWTu3m3It6mbLOZxHDN7pnKMk2HegwMaX5G8LEQNspDbeudfZrSSmde1FHmUAH31+QUxmMUMOCtdmBKMBazMcv+HHRIDPsLjFTGney5V/BBsZPV6rTnL0D1RBq56kv63+Ay6x/AdHciZZ2jOL32pBNrK3MlH3f+P+d0D9WECJEzkqEcy2A4GlKZZ9MCqvgj3OKOdkJGyTba9XB5TsD/Kkd7VsDODogCkzHpZids/fpyiPYixUmxasHY8QRXHsAeBF2uXjJ+uadrc8/Krokohg2a1XIWloFV19erBWAZeEIdBdRU8QVCewtLuTkSnakbQXydlf0Syu+u74Xn10KdWOOc6oVfUTwOBnD92QbIRvaF8VYUO+3WaBwgycG+9YzZcjGQckM103tCGGzjpUlOoqzhLOVMyTbYTQbpf30JCYAPvAKLmO1NyQ/ZucTqiYjnztyFcRJxAenLmWuh9SPQ8/FDUw/9OaD8kcu7GBVg6qKddmK6ewjH+k7YohlN3O0GVQcSGzz2WFHWp6VPtpADP8KhCYjpc0krBGRbgdP0x4wr3xzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(26005)(2906002)(316002)(4743002)(52116002)(6506007)(41300700001)(1076003)(83380400001)(36756003)(86362001)(2616005)(6666004)(186003)(6486002)(6512007)(66946007)(44832011)(66476007)(8936002)(4744005)(66556008)(5660300002)(478600001)(8676002)(4326008)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCfRDgaq+BtZ1FndfjvLZf3vYjsn1EoZFWRKfSTsmVgll9VYaCfEzwL0ggoO?=
 =?us-ascii?Q?kTdPoVXriBpoTle7tkQNMEhr/23zR0xHu0hErYKmBtUrRmDE2zIP54s3/W2M?=
 =?us-ascii?Q?jeDRBrBrV/iM8h45Q8L1wW5JdxrvQZ5uVxOwRKtMaH0cpqXUyLurbVZwiIBY?=
 =?us-ascii?Q?Ep11TkSDkqTsiEmBYI5n7Sno8RBl36Z78lx2mRnqNkf2p6sRHlqZJAQSYPI7?=
 =?us-ascii?Q?oskFYVKSSLi057GKIJiSZyoINtExddplDZpfpIEcBwc+ABRERtiHl4pu/U3a?=
 =?us-ascii?Q?Upk47L3RamPj1rwsjuVOyXSrO91frSYVbIJ2uPNukrKwx6TPVHyzgp9UUyT1?=
 =?us-ascii?Q?VpO1Y3BIr+Z2J2DyqpbI1XNXDBc4waE69rBnFMnyUrVYVMphwuax0e8oe1iA?=
 =?us-ascii?Q?xaka93v8P3p1vM1euTNbZ2fN+S/FqNZ52V7JzK+B59LV6MbRKL5oux2cuwlS?=
 =?us-ascii?Q?Rdq8/1ov2ZMyINW9070rMBqkYKOAm7MYvo+EtL2wv5enwZrJsErfhsILkRwL?=
 =?us-ascii?Q?Mpl7axtw5N2IcJk2she2Z8692IRF3q64MPMJGbqIuUgwrIxu+hSZUdZgm7K6?=
 =?us-ascii?Q?JnpjV1/1vXw6OL0zskpUA0psvl6MytoSmmTiIXqfHWTaaK++SCpY9aGN2vy7?=
 =?us-ascii?Q?d91XULU600Dv15/AleqhuaFt01c2UGHY8pV+xXYxdcoBpJ3AegFONjIm7o2k?=
 =?us-ascii?Q?GuCA3tucKc7ki4LeUPomcCFp6vPm31VwEAKksbRAoGEJMWXlIBjHtrGqkkjU?=
 =?us-ascii?Q?WNFM+qyA5nq7ArSufPeF7uziPO+higFppVrFH6x+YNuIDuAUYHXR+ulZZuYP?=
 =?us-ascii?Q?iXxvWoxPigy07jScPLsnaEaM59Ka1s8D/XnSkmqXfqRx3HgGKs3lperAlkgP?=
 =?us-ascii?Q?WDt4eyJGfYB+Y/Oq9PHaYQW5jsg3JMUXUITOaA+C3N0Sx+13FcZ2OChPtAtS?=
 =?us-ascii?Q?6EHSF6J81XvHrkqBBaEIYsWboqz+vNqsB3dbtYQaBd5SzXV4QWKCQ5jP+CJI?=
 =?us-ascii?Q?QQGkO0DVKPc3HYABWkT8kgWSp9VFxPDLkVeEkXJgQi6jOCdJ6p61LSa1TLj0?=
 =?us-ascii?Q?qVKbIJBYLllRAZt69lnj70I/LfzIVDJ2ay7vk0tDoH//nbkwfDHhkFaif/w8?=
 =?us-ascii?Q?fCaW42Kr663LVI2iOKqg/a4eOlwOE2VBN3lGPHGltHlAdk7D2NuYk1eB+dFJ?=
 =?us-ascii?Q?gGxKinQ2d3yO/PHqdcbvoLUnqEcTM8jfV3U4IEt4argeu/YBL1ESWRqM3VD0?=
 =?us-ascii?Q?j9mqDbIDx8CPtep+pLwO1PYVPEUCtl7hI5S8gZ+zcSDnSx2clLlV2TDrwCgo?=
 =?us-ascii?Q?7PzuAepswkicVydnpw5SpVSxUlNc4G0wxtFhDTTWa4mn1HMP06mzYixsSHOa?=
 =?us-ascii?Q?p3wYdTbxpWTodSoM9dSGHxJeqfZhXnOD2A1Vg5WO4lg+LoTtw8TdFqqj5NGl?=
 =?us-ascii?Q?ZAZav9u7r05mEaWMYQBE7BQT6ZByqmuYe3JBnUmVnd30+1HSOtLNxBx0TvK/?=
 =?us-ascii?Q?k+iMSGDD9zKB5tWtmd4Y/BdghsIoU4g0r9r3+aPgWS2fAai5CxKIAhcx42Xy?=
 =?us-ascii?Q?yX8yp86dcqeOGlU6NW9Tj+BJ1kp5Xk2IN5jXIHeJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c1188d-f8a0-4c9c-f487-08da7ba1522a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 13:56:43.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrzmVqXqHKTwIuW6ek/QUHPPEnLM+TKxW+spTxE3aZpARhrJUbKlMChRyodds9WKiR7SACu+Y2vXrDyeGwlzfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3436
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
shared memory from a dmabuf file descriptor.

Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

 drivers/tee/tee_core.c   | 38 +++++++++++++++
 drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_drv.h  | 11 +++++
 include/uapi/linux/tee.h | 29 ++++++++++++
 4 files changed, 175 insertions(+), 2 deletions(-)

-- 
2.25.0

