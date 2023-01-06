Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A565FE78
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9310E84D;
	Fri,  6 Jan 2023 10:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 746 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 10:00:24 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6710E84D;
 Fri,  6 Jan 2023 10:00:24 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3069NBnY018760; Fri, 6 Jan 2023 09:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=StBAQ2csT3huPdM09ImnjC5PkfbWObJ/g+5XLfSz2M0=;
 b=RMQ69IcTdS1JqB3yD3dVBjvW18DSk8mjjGHxfV99zfueE/0/3T2WLu4AGFkjZvkPYde0
 K4MTgQuDx7vJeBupgWwzjCUigEKqXGHkU/Cyqs3cTFD2qsoAePqo6e0n2UMf0CtbO/80
 sDBM5xS7fGQixuDTtEFx8s2Rvc95L6z5PD/4nzkD1Bk+A0l+CPti8ryphaGDQMydfRZj
 BRWF9TeIFqQzdvjDpIuY09+yg/JL/4FHV3MfH9h0NekyN83NfojPobamhmZ/5wC1Merg
 oVapB16LXgHy3M46y6j4F4Wh5MLJhUckbAm4IvNaDrSFOhr5QSsalOua7+fNk2b6cd1u ng== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxa050746-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 09:47:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHsMYdHSOF2V68cw2HjDwvGKSQdCYXbtaIvi974LmHzKbN3NOTld4IE4kE8NMDFJgpk50NhiFrLlJnSKAAR7ogBRTZffCjKGe9oCTgfxyLUhR44yNf4EzWPWyYPJC4RDgfPmP5kl5smZrFM3/w68rpZ/2Ut9TTOLG7Vc7rSGMrJ855u1Uht77Tp0b1fVWCkuDKXBmC0pXjI7v5Q/DXhyoA2HpQgpenV6QKNNwWZk7Oa78H6AswDBjW1HRA6SD5L2d/iPehu4zw/ecMi5Xp5pMlsfBr9t+E9CGRBs4lIpLgQV9dZnr7jfFVLFgqwxguU2kTcdbzBrx8FGt2uM4EyJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StBAQ2csT3huPdM09ImnjC5PkfbWObJ/g+5XLfSz2M0=;
 b=J7gA1cGQKZGFTGGibm5X7PVwqdkUGGcx7Sd+UMr/IZRwVzGxm5R08bU2wPIr1EKqQY30yQUAANtc2FeQ+6nVOUgtXpnOhKrpX85Ggzokm01yy/yzkCS0fLwg/NTlPuFu1vPuLEdgakpiAJZjcCNzZcD4+C849BW25X/7w76CJiMOtIO3RmK3f5IKn4kTto94JUqu1gllh7QH9d3syAZ43Gkka8rRDfWcTiOmmXU3hdVft4r2QWcxS2wE2Psr2YK8emYprARWTUj47Ny4CAQeF4LwdnNYs2GIFKcZ5fhSbw2IoGxjHLkvc5x7BW4eQw5zv2YZ5XzCPkNUW89IiiJuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 09:47:50 +0000
Received: from CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::6d23:75af:8df4:216f]) by CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::6d23:75af:8df4:216f%5]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:47:50 +0000
From: Liwei Song <liwei.song@windriver.com>
To: AlexDeucher <alexander.deucher@amd.com>,
 =?UTF-8?q?ChristianK=C3=B6nig?= <christian.koenig@amd.com>,
 PanXinhui <Xinhui.Pan@amd.com>, DavidAirlie <airlied@gmail.com>,
 DanielVetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/radeon: free iio for atombios when driver shutdown
Date: Fri,  6 Jan 2023 17:47:29 +0800
Message-Id: <20230106094729.38598-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::19)
 To CH0PR11MB5348.namprd11.prod.outlook.com
 (2603:10b6:610:bb::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5348:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e47c395-c5e3-4944-b6dc-08daefcb1319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1O7Zo4ZCnerBhjbtGjlkpL+g6StOlWmv+adEF/qR0mGyFA1Uw/C/FwcXwF/EJVmOQjCu3G3BnWx2Jp5YuUykkp7f2g+RHasIE5q+JzwnRwdQLIyefRHg9eieNakIIW9gRiqJ9wwY9JjU2dRFbKK8qiSSMSFcCNY8/dUx5qFXrFx0fLbYjcB5fUXzL1hLJGOLFW8vONxNqX+TPRlPDBI7mJdPiERGwMBzEtmkRfTcqb1GmXmj0jqLMhV9AptK8ZZKM8QUYcN5OaroX1ZZqfRs4ZqBteCPLoUm8/O1yuI4eaBGmGXXayrGb4QILiYyjGTO1iUB+tO9hSpNrgzX1/P/55pt4uZO265nSwuj+klvDnWk7JNjbCl6QWeX2U07wIA2QkWnqHM+2NARZsOuDf8XqqzFIGgVHBThItbbUHV0AJMfXLXrPurRC70w2cefxVefcboL717BJ3iecDcODXmlojBOwWiiYe598Ehs0dS9Rfdwubhzxgqvu+Vt4jjMGLXRDc+H9blJwYwuuHDYWqslRPBn0GEsxhoPyzx/2jte05dIzRcVR7F5L24miNBquXGZeRmY037AKvI2N4n4QTLy0vt8kfkjI0y7s9eHU54zqK1K28lh1H0//e1KwGN/BeKMZf2dVMS5EuqNUcpXAK54laB/dUW8SsMhfn5UGYUsEmKGWC91gwMBa3W0SmGH3I+KsOsrN0FEUDbeJV78ROJpMcyw+X8oWg6rej1Et2R14Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(396003)(366004)(346002)(136003)(451199015)(2906002)(86362001)(5660300002)(38100700002)(8936002)(38350700002)(44832011)(41300700001)(6666004)(66476007)(2616005)(6512007)(41320700001)(26005)(478600001)(186003)(4326008)(1076003)(8676002)(316002)(107886003)(6486002)(52116002)(66946007)(110136005)(6506007)(66556008)(36756003)(505234007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFPh19migVdJRW6yzpCR8FqWtgn5qwDNuZeisyYkjplB2DF089WczIYbCuPZ?=
 =?us-ascii?Q?EQFfqn0QXtCLNQCapP2MVcfmWPnk+PhHQMkLN4mD4+ZvRnFn0H81vEQGhex0?=
 =?us-ascii?Q?ddPUx2x8lbP/ZHXq2DiPIFOXkXNSpGl4tZFQ6bDu5bCm0MxNcZQ5hrZht2o/?=
 =?us-ascii?Q?0PvDbsomskZoY+3prFLq9eR8cfl6rtq5nJe/+8WKrnGeiptdVahsDL078cuW?=
 =?us-ascii?Q?EWR3darWsLAjmpFdCn5Zp+B+zXkP2c7XoOjD6AF1UGSdrZiR1CUx3C5ENJ1i?=
 =?us-ascii?Q?j1AaCRatEEtOQAjF2itbz92DTVTUkWf1IYySQm7dmTottUIsIu9bZrqMx3TC?=
 =?us-ascii?Q?Iq2KnHU1aqEVb67ykL864gEI2GmLnRzcPeBA5gEQT3+BfCI6Boe+oNEfQcGL?=
 =?us-ascii?Q?O9QpDNYbUhQOxYH4DuZ9tEE2GI+c/t5kMFUVRbRwKLDTrDdlbkxaJzmlZkdm?=
 =?us-ascii?Q?TK4pQDceItfJbZ8h4f9TZREAT+DBZh9gWTh17KPU+zK8W9VHHIST5gwJLGnH?=
 =?us-ascii?Q?10Q/Sg1IEB/9HNtRWzNnSJNOaWHIjMdOtvwOcxs8iojE0vNeuYPc3cARGh/o?=
 =?us-ascii?Q?aWswD6Nuy0/IOpalq5ODUrRCS1qaX8+a8p8DmOUXNesy7oOdaPZYVfoqYX06?=
 =?us-ascii?Q?LWY7937oolDS44jeDoJCJdr/eZXRom9X+LSDfCiQAPfH0IqX3MgHw9POl1As?=
 =?us-ascii?Q?iixQe6/OHVkmXh+lXKAqfUGHFQBy+dMUl58h6L1eHlxSqOXsy3hmkAqJv8w3?=
 =?us-ascii?Q?v9yNQINpsNbG04IKfC1cmusvwZlnd2Z5g60+4uzN0xa/k0OZaHHmsDFi4ssu?=
 =?us-ascii?Q?b9+WZZXwrvgH3tbTWkCH7x3AYOOnDyiR9vz9pBYRr74dwYH1i8CGkvgcZlxG?=
 =?us-ascii?Q?5F9qEx6D1iDkluBaUGv4Nuv0Y+DBxCCezD1rGl0tNGrRe0jp5FmZCj5jPw1U?=
 =?us-ascii?Q?ULqbdbz62cqs8yfEE1GgAYctaoLZSymvGF+Vu7isEE1n+Qz0hC6lUl5LidBy?=
 =?us-ascii?Q?n+bqKHqGyVeWdC+wIXQBi8zgwc9Y3Zn8UmSkiLjhf6JeH9GHeCxdUCesd8VS?=
 =?us-ascii?Q?hTsRd0H0bLft5m6tj8nIiBTwHxHOhmg5DrmjHUmHw1B3wB3zK90AMYz7frux?=
 =?us-ascii?Q?lk/GnwPg5o3r1Q6A9pC1jTgN7argz00Kf1GLYeVGXHahI+3ysoxXRfaQ6U1t?=
 =?us-ascii?Q?ZJliJ2pTAoheZvJJXpwhAHk6o7aApHMEpq6Rc8mjOH0ca0VSeTc9D1T97Un8?=
 =?us-ascii?Q?hU/8uMGbd9P4orj1prgWg4jrhPomIgNbyQ1SvJ29iNgzcav7W92ai7AfnWsw?=
 =?us-ascii?Q?sCKvk1Kx+fsBTlmbtcFEWwiely4FLtHkPH8KjrYaUAXs/IjmnAS2r7P5luTo?=
 =?us-ascii?Q?8nDjT9XjZTUWoNYYRTciSE3Q/hzG1tkr1alUTWVKiL7w18myGYoDbSfNGccC?=
 =?us-ascii?Q?RikOMiH18u59WNFGiPutvgonK/l1e2qXTTYE4yzIdoaRgHYSdUkztzu4qOGc?=
 =?us-ascii?Q?lrDJ8FEqF21e9ca/Dhd8Wf5BT917C+GCQaISpdbaLKzaQXds5eEyXw1LMElO?=
 =?us-ascii?Q?XlOULsdvUk884BX1BTwb5W2p2hFPJ03Hhr0QH4sSUMhvygLXNHnz1wyjKoD8?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e47c395-c5e3-4944-b6dc-08daefcb1319
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:47:50.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq2TNa5ib0FLW64gB8ZDbVAW5Eio9ar46KCPc0/W4c1HjAdk7xf94rHePjasEFocLJw/26sjw9Yk+hizfsxqkIDluXZZX9XB/S5RTfj1cLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
X-Proofpoint-ORIG-GUID: u5Ss8DMAsqRCEZXdzHssshWPOZr7o9Y3
X-Proofpoint-GUID: u5Ss8DMAsqRCEZXdzHssshWPOZr7o9Y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1011 spamscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060077
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
Cc: liwei.song@windriver.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below kmemleak when unload radeon driver:

unreferenced object 0xffff9f8608ede200 (size 512):
  comm "systemd-udevd", pid 326, jiffies 4294682822 (age 716.338s)
  hex dump (first 32 bytes):
    00 00 00 00 c4 aa ec aa 14 ab 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000062fadebe>] kmem_cache_alloc_trace+0x2f1/0x500
    [<00000000b6883cea>] atom_parse+0x117/0x230 [radeon]
    [<00000000158c23fd>] radeon_atombios_init+0xab/0x170 [radeon]
    [<00000000683f672e>] si_init+0x57/0x750 [radeon]
    [<00000000566cc31f>] radeon_device_init+0x559/0x9c0 [radeon]
    [<0000000046efabb3>] radeon_driver_load_kms+0xc1/0x1a0 [radeon]
    [<00000000b5155064>] drm_dev_register+0xdd/0x1d0
    [<0000000045fec835>] radeon_pci_probe+0xbd/0x100 [radeon]
    [<00000000e69ecca3>] pci_device_probe+0xe1/0x160
    [<0000000019484b76>] really_probe.part.0+0xc1/0x2c0
    [<000000003f2649da>] __driver_probe_device+0x96/0x130
    [<00000000231c5bb1>] driver_probe_device+0x24/0xf0
    [<0000000000a42377>] __driver_attach+0x77/0x190
    [<00000000d7574da6>] bus_for_each_dev+0x7f/0xd0
    [<00000000633166d2>] driver_attach+0x1e/0x30
    [<00000000313b05b8>] bus_add_driver+0x12c/0x1e0

iio was allocated in atom_index_iio() called by atom_parse(),
but it doesn't got released when the dirver is shutdown.
Fix this kmemleak by free it in radeon_atombios_fini().

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 92905ebb7b45..1c005e0ddd38 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1022,6 +1022,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
 {
 	if (rdev->mode_info.atom_context) {
 		kfree(rdev->mode_info.atom_context->scratch);
+		kfree(rdev->mode_info.atom_context->iio);
 	}
 	kfree(rdev->mode_info.atom_context);
 	rdev->mode_info.atom_context = NULL;
-- 
2.33.1

